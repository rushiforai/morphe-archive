.class public Ll/vsf;
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
    const-string p0, "precision highp float;\n varying highp vec2 textureCoordinate;\n uniform sampler2D inputImageTexture0;\n uniform highp float iTime;\n float c_textureSize = 512.0;\n void main() {\n     highp vec2 uv = textureCoordinate;\n     highp vec3 tex = texture2D(inputImageTexture0,fract(uv)).xyz;\n     float bounds = .5;\n     gl_FragColor = vec4(uv.x < bounds ? clamp(dot(tex, tex), 0., 1.) : (tex.x + tex.y + tex.z) / 3.);\n }"

    .line 2
    .line 3
    return-object p0
.end method
