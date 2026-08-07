.class public Ll/ssf;
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
    const-string p0, "varying highp vec2 textureCoordinate;\n uniform sampler2D inputImageTexture0;\n uniform highp float iTime;\n \n highp float rand(highp vec2 co) {\n     return fract(sin(dot(co.xy ,vec2(12.9898,78.233)*3.141)) * 43758.5453);\n }\n void main() {\n     highp vec2 uv = textureCoordinate;\n     highp float t = mod(iTime,0.7);\n     if (t < 0.2) {\n         uv.x += (0.5-uv.x)*0.1;\n         uv.y += (0.5-uv.y)*0.1;\n         highp vec2 uv_r = uv;\n         highp vec2 uv_g = uv;\n         highp vec2 uv_b = uv;\n         uv_r.x += t * 5.0 * 0.03;\n         uv_g.x -= t * 5.0 * 0.03;\n         highp vec4 colorR = texture2D(inputImageTexture0, uv_r);\n         highp vec4 colorG = texture2D(inputImageTexture0, uv_g);\n         highp vec4 colorB = texture2D(inputImageTexture0, uv_b);\n         gl_FragColor.r = colorR.r;\n         gl_FragColor.g = colorG.g;\n         gl_FragColor.b = colorB.b;\n         gl_FragColor.a = (colorR.a + colorG.a + colorB.a) / 3.0;\n     } else {\n         gl_FragColor = texture2D(inputImageTexture0,uv);\n     }\n }\n"

    .line 2
    .line 3
    return-object p0
.end method
