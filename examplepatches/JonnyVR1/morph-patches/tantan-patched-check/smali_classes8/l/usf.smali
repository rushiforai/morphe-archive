.class public Ll/usf;
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
    const-string p0, " varying highp vec2 textureCoordinate;\n uniform sampler2D inputImageTexture0;\n uniform highp float iTime;\n void main() {\n     highp vec2 uv = textureCoordinate;\n     highp float d = (1.0 - abs(mod(iTime,2.0) - 1.0)) * 0.1;\n     highp vec4 c0 = texture2D(inputImageTexture0,uv);\n     highp vec4 c1 = texture2D(inputImageTexture0,uv + vec2(d,0.0));\n     highp vec4 c2 = texture2D(inputImageTexture0,uv - vec2(d,0.0));\n     gl_FragColor = mix(mix(c0,c1,0.5),c2,1.0/3.0);\n }"

    .line 2
    .line 3
    return-object p0
.end method
