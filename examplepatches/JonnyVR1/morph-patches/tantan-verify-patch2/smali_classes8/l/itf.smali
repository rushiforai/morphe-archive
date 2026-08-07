.class public Ll/itf;
.super Ll/bs2;
.source "SourceFile"


# instance fields
.field private d:I

.field private e:I

.field private f:F

.field private g:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/bs2;-><init>()V

    .line 2
    .line 3
    .line 4
    const v0, 0x3e4ccccd    # 0.2f

    .line 5
    .line 6
    .line 7
    iput v0, p0, Ll/itf;->f:F

    .line 8
    .line 9
    const v0, 0x3e19999a    # 0.15f

    .line 10
    .line 11
    .line 12
    iput v0, p0, Ll/itf;->g:F

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision highp float;\n varying highp vec2 textureCoordinate;\n uniform sampler2D inputImageTexture0;\n uniform highp float iTime;\n uniform highp vec2 iResolution;\n uniform float amount;\n uniform float speed;\n float random1d(float n){\n     return fract(sin(n) * 43758.5453);\n }\n float random2d(highp vec2 n) {\n     return fract(sin(dot(n, vec2(12.9898, 4.1414))) * 43758.5453);\n }\n float randomRange (highp vec2 seed, in float min, in float max) {\n     return min + random2d(seed) * (max - min);\n }\n float insideRange(float v, float bottom, float top) {\n     return step(bottom, v) - step(top, v);\n }\n float rand(highp vec2 co){\n     return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);\n }\n void main() {\n     highp vec2 uv = textureCoordinate;\n     float sTime = floor(iTime * 0.25 * speed * 6.0 * 24.0);\n     highp vec3 inCol = texture2D(inputImageTexture0, uv).rgb;\n     highp vec3 outCol = inCol;\n     float maxOffset = amount/2.0; highp vec2 uvOff;\n     for (float i = 0.0; i < 10.0; i += 1.0) {\n         if (i > 10.0 * amount) break;\n         float sliceY = random2d(vec2(sTime + amount, 2345.0 + float(i)));\n         float sliceH = random2d(vec2(sTime + amount, 9035.0 + float(i))) * 0.25;\n         float hOffset = randomRange(vec2(sTime + amount, 9625.0 + float(i)), -maxOffset, maxOffset);\n         uvOff = uv;\n         uvOff.x += hOffset;\n         highp vec2 uvOff = fract(uvOff);\n         if (insideRange(uv.y, sliceY, fract(sliceY+sliceH)) == 1.0 ){\n             outCol = texture2D(inputImageTexture0, uvOff).rgb;\n         }\n     }\n     float maxColOffset = amount/6.0;\n     highp vec2 colOffset = vec2(randomRange(vec2(sTime + amount, 3545.0),-maxColOffset,maxColOffset), randomRange(vec2(sTime , 7205.0),-maxColOffset,maxColOffset));\n     uvOff = fract(uv + colOffset);\n     float rnd = random2d(vec2(sTime + amount, 9545.0));\n     if (rnd < 0.33){\n         outCol.r = texture2D(inputImageTexture0, uvOff).r;\n     }else if (rnd < 0.66){\n         outCol.g = texture2D(inputImageTexture0, uvOff).g;\n     } else{\n         outCol.b = texture2D(inputImageTexture0, uvOff).b;\n     }\n     gl_FragColor = vec4(outCol,1.0);\n }"

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
    const-string v1, "amount"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Ll/itf;->d:I

    .line 13
    .line 14
    iget v0, p0, Ll/wej;->programHandle:I

    .line 15
    .line 16
    const-string v1, "speed"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Ll/itf;->e:I

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
    iget v0, p0, Ll/itf;->d:I

    .line 5
    .line 6
    iget v1, p0, Ll/itf;->f:F

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 9
    .line 10
    .line 11
    iget v0, p0, Ll/itf;->e:I

    .line 12
    .line 13
    iget p0, p0, Ll/itf;->g:F

    .line 14
    .line 15
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
