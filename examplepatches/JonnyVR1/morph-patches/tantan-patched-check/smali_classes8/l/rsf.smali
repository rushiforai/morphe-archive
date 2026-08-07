.class public Ll/rsf;
.super Ll/bs2;
.source "SourceFile"


# instance fields
.field private d:F

.field private e:I

.field private f:I

.field private g:F


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
.method public Q1(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/rsf;->d:F

    .line 2
    .line 3
    return-void
.end method

.method public R1(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/rsf;->g:F

    .line 2
    .line 3
    return-void
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision highp float;\n varying highp vec2 textureCoordinate;\n uniform sampler2D inputImageTexture0;\n uniform highp float iTime;\n uniform highp vec2 iResolution;\n uniform float contrast;\n uniform float brightness;\n void main() {\n     highp vec2 uv = textureCoordinate;\n     highp vec4 color = texture2D(inputImageTexture0,fract(uv));\n     color.rgb += brightness;\n     color.rgb = (color.rgb - 0.5) / (1.0 - contrast) + 0.5;\n     gl_FragColor = color;\n }"

    .line 2
    .line 3
    return-object p0
.end method

.method public initShaderHandles()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/bs2;->initShaderHandles()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/wej;->programHandle:I

    .line 5
    .line 6
    const-string v1, "brightness"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Ll/rsf;->e:I

    .line 13
    .line 14
    iget v0, p0, Ll/wej;->programHandle:I

    .line 15
    .line 16
    const-string v1, "contrast"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Ll/rsf;->f:I

    .line 23
    .line 24
    return-void
.end method

.method public passShaderValues()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/bs2;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/rsf;->e:I

    .line 5
    .line 6
    iget v1, p0, Ll/rsf;->d:F

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 9
    .line 10
    .line 11
    iget v0, p0, Ll/rsf;->f:I

    .line 12
    .line 13
    iget p0, p0, Ll/rsf;->g:F

    .line 14
    .line 15
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
