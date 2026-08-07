.class public Ll/b6x;
.super Ll/jt2;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/jt2;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nvarying vec2 textureCoordinate;\nvoid main() {\n   vec4 final = texture2D(inputImageTexture0,textureCoordinate);\n     float ba = 0.0;\n     lowp vec4 hardLightColor = vec4(vec3(final.b), 1.0);\n     for (int i =0; i < 3; i++)\n     {\n         if (hardLightColor.b < 0.5) {\n             ba = hardLightColor.b  * hardLightColor.b * 2.;\n         } else {\n             ba = 1. - (1. - hardLightColor.b) * (1. - hardLightColor.b) * 2.;\n         }\n         hardLightColor = vec4(vec3(ba), 1.0);\n     }\n     \n     float k = 255.0 / (164.0 - 75.0);\n     hardLightColor.r = (hardLightColor.r - 75.0 / 255.0) * k;\n     hardLightColor.g = (hardLightColor.g - 75.0 / 255.0) * k;\n     hardLightColor.b = (hardLightColor.b - 75.0 / 255.0) * k;\n     \n     gl_FragColor = hardLightColor;\n}\n"

    .line 2
    .line 3
    return-object p0
.end method
