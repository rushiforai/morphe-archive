.class public Ll/qsf;
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
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/bs2;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x3f800000    # 1.0f

    .line 5
    .line 6
    iput v0, p0, Ll/qsf;->g:F

    .line 7
    .line 8
    iput v0, p0, Ll/qsf;->i:F

    .line 9
    .line 10
    iput v0, p0, Ll/qsf;->j:F

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public Q1(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/qsf;->i:F

    .line 2
    .line 3
    return-void
.end method

.method public R1(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/qsf;->j:F

    .line 2
    .line 3
    return-void
.end method

.method public S1(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/qsf;->g:F

    .line 2
    .line 3
    return-void
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision highp float;\n varying highp vec2 textureCoordinate;\n uniform sampler2D inputImageTexture0;\n uniform highp float iTime;\n uniform highp vec2 iResolution;\n uniform float thickDistort;\n uniform float fineDistort;\n uniform float rollSpeed;\n float speed = 0.116;\n highp vec3 mod289(highp vec3 x) {\n     return x - floor(x * (1.0 / 289.0)) * 289.0;\n }\n highp vec2 mod289(highp vec2 x) {\n     return x - floor(x * (1.0 / 289.0)) * 289.0;\n }\n highp vec3 permute(highp vec3 x) {\n     return mod289(((x*34.0)+1.0)*x);\n }\n float snoise(highp vec2 v) {\n     const highp vec4 C = vec4(0.211324865405187, 0.366025403784439, -0.577350269189626, 0.024390243902439);\n     highp vec2 i = floor(v + dot(v, C.yy) );\n     highp vec2 x0 = v - i + dot(i, C.xx);\n     highp vec2 i1; i1 = (x0.x > x0.y) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);\n     highp vec4 x12 = x0.xyxy + C.xxzz;\n     x12.xy -= i1;\n     i = mod289(i);\n     highp vec3 p = permute( permute( i.y + vec3(0.0, i1.y, 1.0 )) + i.x + vec3(0.0, i1.x, 1.0 ));\n     highp vec3 m = max(0.5 - vec3(dot(x0,x0), dot(x12.xy,x12.xy), dot(x12.zw,x12.zw)), 0.0);\n     m = m*m ; m = m*m ;\n     highp vec3 x = 2.0 * fract(p * C.www) - 1.0;\n     highp vec3 h = abs(x) - 0.5;\n     highp vec3 ox = floor(x + 0.5);\n     highp vec3 a0 = x - ox;\n     m *= 1.79284291400159 - 0.85373472095314 * ( a0*a0 + h*h );\n     highp vec3 g; g.x = a0.x * x0.x + h.x * x0.y;\n     g.yz = a0.yz * x12.xz + h.yz * x12.yw;\n     return 130.0 * dot(m, g);\n }\n void main() {\n     highp vec2 uv = textureCoordinate;\n     highp vec2 p = uv;\n     float time = iTime * 0.25;\n     float ty = time * speed * 17.346;\n     float yt = p.y - ty;\n     float offset = snoise(vec2(yt*3.0,0.0))*0.2;\n     offset = offset*thickDistort * offset*thickDistort * offset;\n     offset += snoise(vec2(yt*50.0,0.0))*fineDistort*0.002;\n     gl_FragColor = texture2D(inputImageTexture0,fract(vec2(fract(p.x + offset),fract(p.y - time * rollSpeed) )));\n }"

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
    const-string v1, "thickDistort"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Ll/qsf;->d:I

    .line 13
    .line 14
    iget v0, p0, Ll/wej;->programHandle:I

    .line 15
    .line 16
    const-string v1, "fineDistort"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Ll/qsf;->e:I

    .line 23
    .line 24
    iget v0, p0, Ll/wej;->programHandle:I

    .line 25
    .line 26
    const-string v1, "rollSpeed"

    .line 27
    .line 28
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iput v0, p0, Ll/qsf;->f:I

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
    iget v0, p0, Ll/qsf;->d:I

    .line 5
    .line 6
    iget v1, p0, Ll/qsf;->g:F

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 9
    .line 10
    .line 11
    iget v0, p0, Ll/qsf;->e:I

    .line 12
    .line 13
    iget v1, p0, Ll/qsf;->i:F

    .line 14
    .line 15
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 16
    .line 17
    .line 18
    iget v0, p0, Ll/qsf;->f:I

    .line 19
    .line 20
    iget p0, p0, Ll/qsf;->j:F

    .line 21
    .line 22
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 23
    .line 24
    .line 25
    return-void
.end method
