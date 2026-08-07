.class public Ll/ctf;
.super Ll/bs2;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/bs2;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "varying highp vec2 textureCoordinate;\n uniform sampler2D inputImageTexture0;\n uniform highp float iTime;\n void main() {\n     highp vec2 uv = textureCoordinate;\n     highp float t = mod(iTime/0.5,1.0);\n     if (t < 0.2) {\n         t = t / 0.2;\n         uv.x += (0.5-uv.x)*(t*0.1);\n         uv.y += (0.5-uv.y)*(t*0.1);\n     } else if (t < 0.6) {\n         t = (t - 0.2) / 0.4;\n         uv.x += (0.5-uv.x)*(0.1 + t*-0.075);\n         uv.y += (0.5-uv.y)*(0.1 + t*-0.075);\n     } else {\n         t = (t - 0.6) / 0.4;\n         uv.x += (0.5-uv.x)*(0.025 + t*-0.025);\n         uv.y += (0.5-uv.y)*(0.025 + t*-0.025);\n     }\n     gl_FragColor = texture2D(inputImageTexture0,fract(uv));\n }"

    .line 2
    .line 3
    return-object p0
.end method
