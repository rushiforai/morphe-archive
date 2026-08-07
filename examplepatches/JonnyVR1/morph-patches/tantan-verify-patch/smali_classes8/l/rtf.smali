.class public Ll/rtf;
.super Ll/bs2;
.source "SourceFile"


# instance fields
.field private d:I

.field private e:I

.field private f:I

.field private g:F

.field private i:F

.field private j:F


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
    iput p1, p0, Ll/rtf;->g:F

    .line 2
    .line 3
    return-void
.end method

.method public R1(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/rtf;->i:F

    .line 2
    .line 3
    return-void
.end method

.method public S1(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/rtf;->j:F

    .line 2
    .line 3
    return-void
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision highp float;\n varying highp vec2 textureCoordinate;\n uniform sampler2D inputImageTexture0;\n uniform highp float iTime;\n uniform highp vec2 iResolution;\n uniform float count;\n uniform float offset;\n uniform float speedV;\n float steppedVal(float v, float steps){\n     return floor(v*steps)/steps;\n }\n float random1d(float n){\n     return fract(sin(n) * 43758.5453);\n }\n float noise1d(float p){\n     float fl = floor(p);\n     float fc = fract(p);\n     return mix(random1d(fl), random1d(fl + 1.0), fc);\n }\n const float TWO_PI = 6.283185307179586;\n void main() {\n     vec2 uv = textureCoordinate;\n     float time = iTime * 0.25;\n     float n = noise1d(uv.y * count + time * speedV * 3.0);\n     float ns = steppedVal(fract(n ),count) + 2.0;\n     float nsr = random1d(ns);\n     highp vec2 uvn = uv;\n     uvn.x += nsr * sin(time * TWO_PI + nsr * 20.0) * offset;\n     gl_FragColor = texture2D(inputImageTexture0, uvn);\n }"

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
    const-string v1, "count"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Ll/rtf;->d:I

    .line 13
    .line 14
    iget v0, p0, Ll/wej;->programHandle:I

    .line 15
    .line 16
    const-string v1, "offset"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Ll/rtf;->e:I

    .line 23
    .line 24
    iget v0, p0, Ll/wej;->programHandle:I

    .line 25
    .line 26
    const-string v1, "speedV"

    .line 27
    .line 28
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iput v0, p0, Ll/rtf;->f:I

    .line 33
    .line 34
    return-void
.end method

.method public passShaderValues()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/bs2;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/rtf;->d:I

    .line 5
    .line 6
    iget v1, p0, Ll/rtf;->g:F

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 9
    .line 10
    .line 11
    iget v0, p0, Ll/rtf;->e:I

    .line 12
    .line 13
    iget v1, p0, Ll/rtf;->i:F

    .line 14
    .line 15
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 16
    .line 17
    .line 18
    iget v0, p0, Ll/rtf;->f:I

    .line 19
    .line 20
    iget p0, p0, Ll/rtf;->j:F

    .line 21
    .line 22
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 23
    .line 24
    .line 25
    return-void
.end method
