.class public Ll/g7e;
.super Ll/jt2;
.source "SourceFile"


# instance fields
.field final a:Ljava/lang/String;

.field final b:Ljava/lang/String;

.field final c:Ljava/lang/String;

.field final d:Ljava/lang/String;

.field private e:F

.field private f:F

.field private g:I

.field private i:I

.field private j:I

.field private k:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/jt2;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "textureSize"

    .line 5
    .line 6
    iput-object v0, p0, Ll/g7e;->a:Ljava/lang/String;

    .line 7
    .line 8
    const-string v0, "scale"

    .line 9
    .line 10
    iput-object v0, p0, Ll/g7e;->b:Ljava/lang/String;

    .line 11
    .line 12
    const-string v0, "angles"

    .line 13
    .line 14
    iput-object v0, p0, Ll/g7e;->c:Ljava/lang/String;

    .line 15
    .line 16
    const-string v0, "singleAngleMode"

    .line 17
    .line 18
    iput-object v0, p0, Ll/g7e;->d:Ljava/lang/String;

    .line 19
    .line 20
    const/high16 v0, 0x41100000    # 9.0f

    .line 21
    .line 22
    iput v0, p0, Ll/g7e;->e:F

    .line 23
    .line 24
    const v0, 0x3f490fdb

    .line 25
    .line 26
    .line 27
    iput v0, p0, Ll/g7e;->f:F

    .line 28
    .line 29
    return-void
.end method


# virtual methods
.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision highp float;\nuniform sampler2D inputImageTexture0;\nvarying vec2 textureCoordinate;\nuniform vec2 textureSize;\nuniform float scale;\nuniform float angles;\n mat2 rotm(float r) {\n        float cr = cos(r);\n        float sr = sin(r);\n        return mat2(vec2(cr, -sr), vec2(sr, cr));\n    }\n\n    vec2 samplePosition(vec2 textureCoordinate, mat2 m, float scale){\n        vec2 rotatedTextureCoordinate = m * textureCoordinate;\n        return (rotatedTextureCoordinate - mod(textureCoordinate, vec2(scale)) + scale * 0.5) * m;\n    }\n\n    float halftoneIntensity(vec2 textureCoordinate, vec2 samplePos, float scale, vec3 grayColorTransform, vec4 color){\n        float grayscale = dot(color.rgb, grayColorTransform);\n        float d = scale * 1.414214 * (1.0 - grayscale);\n        float d1 = distance(textureCoordinate + vec2(-0.25), samplePos);\n        float d2 = distance(textureCoordinate + vec2(0.25, -0.25), samplePos);\n        float d3 = distance(textureCoordinate + vec2(-0.25, 0.25), samplePos);\n        float d4 = distance(textureCoordinate + vec2(0.25), samplePos);\n        return dot(vec4(lessThan(vec4(d1, d2, d3, d4), vec4(d/2.0))), vec4(0.25));\n    }\n\n    vec2 neighborSamplePosition(vec2 textureCoordinate, vec2 samplePosition, float scale, mat2 m){\n        vec2 p = (textureCoordinate - samplePosition) * m;\n        vec2 direction = (p.y > p.x) ? (-p.x > p.y ? vec2(-1, 0) :vec2(0, 1)) : (-p.y > p.x ? vec2(0, -1):vec2(1, 0));\n        return samplePosition + (m * direction) * scale;\n\n    }\n\n    void main(){\n        vec2 textureCoordinatePos = textureCoordinate * textureSize;\n        vec4 texCoordColor =texture2D(inputImageTexture0, textureCoordinate);\n        vec3 gray = vec3(0.299, 0.587, 0.114);\n        mat2 m = rotm(angles);\n        vec2 rotatedTextureCoordinate = m * textureCoordinatePos;\n        vec2 samplePos = (rotatedTextureCoordinate - mod(rotatedTextureCoordinate, vec2(scale)) + scale*0.5)*m;\n        vec4 color = texture2D(inputImageTexture0,  samplePos/textureSize);\n        float intensity = halftoneIntensity(textureCoordinatePos, samplePos, scale, gray, color);\n        vec2 samplePosNeighbor =  neighborSamplePosition(textureCoordinatePos, samplePos, scale, m);\n color = texture2D(inputImageTexture0,  samplePosNeighbor/textureSize);\n        float intensityNeighbor = halftoneIntensity(textureCoordinatePos, samplePosNeighbor, scale, gray, color);\n        float i = (1.0 - intensity) * (1.0 - intensityNeighbor);\n        gl_FragColor = vec4(vec3(i), texCoordColor.a);\n    }\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public initShaderHandles()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/wej;->initShaderHandles()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/wej;->programHandle:I

    .line 5
    .line 6
    const-string v1, "textureSize"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Ll/g7e;->g:I

    .line 13
    .line 14
    iget v0, p0, Ll/wej;->programHandle:I

    .line 15
    .line 16
    const-string v1, "scale"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Ll/g7e;->i:I

    .line 23
    .line 24
    iget v0, p0, Ll/wej;->programHandle:I

    .line 25
    .line 26
    const-string v1, "angles"

    .line 27
    .line 28
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iput v0, p0, Ll/g7e;->j:I

    .line 33
    .line 34
    iget v0, p0, Ll/wej;->programHandle:I

    .line 35
    .line 36
    const-string v1, "singleAngleMode"

    .line 37
    .line 38
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iput v0, p0, Ll/g7e;->k:I

    .line 43
    .line 44
    return-void
.end method

.method public passShaderValues()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/wej;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/g7e;->g:I

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    int-to-float v1, v1

    .line 11
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    int-to-float v2, v2

    .line 16
    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glUniform2f(IFF)V

    .line 17
    .line 18
    .line 19
    iget v0, p0, Ll/g7e;->i:I

    .line 20
    .line 21
    iget v1, p0, Ll/g7e;->e:F

    .line 22
    .line 23
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 24
    .line 25
    .line 26
    iget v0, p0, Ll/g7e;->j:I

    .line 27
    .line 28
    iget p0, p0, Ll/g7e;->f:F

    .line 29
    .line 30
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 31
    .line 32
    .line 33
    return-void
.end method
