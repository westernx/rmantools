#ifndef KS_REYES_DIFFUSE_CLASS_H
#define KS_REYES_DIFFUSE_CLASS_H
/*
<rman id="rslt">
slim 1 extensions pixar_db {
extensions pixar {} {
    
    template void KSExampleReyesRoot {

        userdata {
            rfm_nodeid 2000011
            rfm_classification \
                shader/surface:rendernode/RenderMan/shader/surface:swatch/rmanSwatch
        }

        codegenhints {
            shaderobject {
                surface {
                    surfaceColor
                }
            }
        }
    
        parameter color surfaceColor {
            label "Surface Color"
            description {The color of the surface.}
            provider parameterlist
            default {1 1 1}
        }

        RSLSource ShaderPipeline _thisfile_

    }
}}
</rman>
*/

RSLINJECT_preamble

RSLINJECT_shaderdef
{

    RSLINJECT_members

    public void surface(output color Ci; output color Oi;)
    {
        RSLINJECT_surface

        normal Nn = normalize(N);
        Ci = Cs * surfaceColor * diffuse(Nn);
        Oi = Os;
    }

}

#endif