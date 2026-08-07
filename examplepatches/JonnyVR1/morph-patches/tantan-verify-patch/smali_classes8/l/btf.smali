.class public Ll/btf;
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
    const-string p0, " precision highp float;\n varying highp vec2 textureCoordinate;\n uniform sampler2D inputImageTexture0;\n uniform highp float iTime;\n uniform highp vec2 iResolution;\n void main() {\n     highp vec2 uv = textureCoordinate;\n     highp vec4 color = texture2D(inputImageTexture0,fract(uv));\n     float strength = 50.0;\n     float x = (uv.x + 4.0 ) * (uv.y + 4.0 ) * (iTime * 10.0);\n     highp vec4 grain = vec4(mod((mod(x, 13.0) + 1.0) * (mod(x, 123.0) + 1.0), 0.01)-0.005) * strength;\n     gl_FragColor = color + grain;\n }\n"

    .line 2
    .line 3
    return-object p0
.end method
