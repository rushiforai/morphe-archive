.class public Ll/bf5;
.super Ll/jt2;
.source "SourceFile"


# instance fields
.field final a:Ljava/lang/String;

.field final b:Ljava/lang/String;

.field final c:Ljava/lang/String;

.field final d:Ljava/lang/String;

.field private e:F

.field private f:[F

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
    iput-object v0, p0, Ll/bf5;->a:Ljava/lang/String;

    .line 7
    .line 8
    const-string v0, "scale"

    .line 9
    .line 10
    iput-object v0, p0, Ll/bf5;->b:Ljava/lang/String;

    .line 11
    .line 12
    const-string v0, "angles"

    .line 13
    .line 14
    iput-object v0, p0, Ll/bf5;->c:Ljava/lang/String;

    .line 15
    .line 16
    const-string v0, "singleAngleMode"

    .line 17
    .line 18
    iput-object v0, p0, Ll/bf5;->d:Ljava/lang/String;

    .line 19
    .line 20
    const/high16 v0, 0x41a00000    # 20.0f

    .line 21
    .line 22
    iput v0, p0, Ll/bf5;->e:F

    .line 23
    .line 24
    const/4 v0, 0x4

    .line 25
    new-array v0, v0, [F

    .line 26
    .line 27
    fill-array-data v0, :array_0

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Ll/bf5;->f:[F

    .line 31
    .line 32
    return-void

    .line 33
    :array_0
    .array-data 4
        0x3f490fdb
        0x3f490fdb
        0x3f490fdb
        0x0
    .end array-data
.end method


# virtual methods
.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision highp float;\nuniform sampler2D inputImageTexture0;\nvarying vec2 textureCoordinate;\n uniform vec2 textureSize;\nuniform float scale;\nuniform vec4 angles;\nuniform int singleAngleMode;\n mat2 rotm(float r) {\n        float cr = cos(r);\n        float sr = sin(r);\n        return mat2(vec2(cr, -sr), vec2(sr, cr));\n    }\n\n    vec2 samplePosition(vec2 textureCoordinate, mat2 m, float scale){\n        vec2 rotatedTextureCoordinate = m * textureCoordinate;\n        return (rotatedTextureCoordinate - mod(textureCoordinate, vec2(scale)) + scale * 0.5) * m;\n    }\n\n    float halftoneIntensity(vec2 textureCoordinate, vec2 samplePos, float scale, vec3 grayColorTransform, vec4 color){\n        float grayscale = dot(color.rgb, grayColorTransform);\n        float d = scale * 1.414214 * (1.0 - grayscale);\n        float d1 = distance(textureCoordinate + vec2(-0.25), samplePos);\n        float d2 = distance(textureCoordinate + vec2(0.25, -0.25), samplePos);\n        float d3 = distance(textureCoordinate + vec2(-0.25, 0.25), samplePos);\n        float d4 = distance(textureCoordinate + vec2(0.25), samplePos);\n        return dot(vec4(lessThan(vec4(d1, d2, d3, d4), vec4(d/2.0))), vec4(0.25));\n    }\n\n    vec3 halftoneIntensityRGB(vec2 textureCoordinate, vec2 samplePos, vec4 color, float scale){\n        vec3 d = scale * 1.414214 * (1.0 - color.rgb);\n        float d1 = distance(textureCoordinate + vec2(-0.25), samplePos);\n        float d2 = distance(textureCoordinate + vec2(0.25, -0.25), samplePos);\n        float d3 = distance(textureCoordinate + vec2(-0.25, 0.25), samplePos);\n        float d4 = distance(textureCoordinate + vec2(0.25), samplePos);\n        vec4 dis = vec4(d1, d2, d3, d4);\n        vec4 ra = vec4(0.25);\n        return vec3(dot(vec4(lessThan(dis, vec4(d.r/2.0))), ra),\n        dot(vec4(lessThan(dis, vec4(d.g/2.0))), ra),\n        dot(vec4(lessThan(dis, vec4(d.b/2.0))), ra));\n    }\n\n    vec2 neighborSamplePosition(vec2 textureCoordinate, vec2 samplePosition, float scale, mat2 m){\n        vec2 p = (textureCoordinate - samplePosition) * m;\n        vec2 direction = (p.y > p.x) ? (-p.x > p.y ? vec2(-1, 0) :vec2(0, 1)) : (-p.y > p.x ? vec2(0, -1):vec2(1, 0));\n        return samplePosition + (m * direction) * scale;\n\n    }\n\n    void main(){\n        vec3 intensityRGB;\n        vec3 intensityNeighborRGB;\n        vec2 textureCoordinatePos = textureCoordinate * textureSize;\n        vec4 texCoordColor =texture2D(inputImageTexture0, textureCoordinate);\n        if(singleAngleMode == 1){\n            mat2 m = rotm(angles.x);\n            vec2 samplePos = samplePosition(textureCoordinatePos, m, scale);\n            vec4 color =texture2D(inputImageTexture0, samplePos/textureSize);\n            intensityRGB = halftoneIntensityRGB(textureCoordinatePos, samplePos, color, scale);\n            samplePos = neighborSamplePosition(textureCoordinatePos, samplePos, scale, m);            color = texture2D(inputImageTexture0, samplePos/textureSize);\n            intensityNeighborRGB = halftoneIntensityRGB(textureCoordinatePos, samplePos, color, scale);\n        }else{\n            mat2 mr = rotm(angles.x);\n            mat2 mg = rotm(angles.y);\n            mat2 mb = rotm(angles.z);\n            vec2 samplePositionR = samplePosition(textureCoordinatePos, mr, scale);\n            vec2 samplePositionG = samplePosition(textureCoordinatePos, mg, scale);\n            vec2 samplePositionB = samplePosition(textureCoordinatePos, mb, scale);\n\n            vec4 color1 = texture2D(inputImageTexture0, samplePositionR/textureSize);\n            vec4 color2 = texture2D(inputImageTexture0, samplePositionG/textureSize);\n            vec4 color3 = texture2D(inputImageTexture0, samplePositionB/textureSize);\n\n            intensityRGB = vec3(halftoneIntensityRGB(textureCoordinatePos, samplePositionR, color1, scale).r,\n                                halftoneIntensityRGB(textureCoordinatePos, samplePositionG, color2, scale).g,\n                                halftoneIntensityRGB(textureCoordinatePos, samplePositionB, color3, scale).b);\n\n            samplePositionR = neighborSamplePosition(textureCoordinatePos, samplePositionR, scale, mr);\n            samplePositionG = neighborSamplePosition(textureCoordinatePos, samplePositionG, scale, mg);\n            samplePositionB = neighborSamplePosition(textureCoordinatePos, samplePositionB, scale, mb);\n\n            color1 = texture2D(inputImageTexture0, samplePositionR/textureSize);\n            color2 = texture2D(inputImageTexture0, samplePositionG/textureSize);\n            color3 = texture2D(inputImageTexture0, samplePositionB/textureSize);\n\n            intensityNeighborRGB = vec3(halftoneIntensityRGB(textureCoordinatePos, samplePositionR, color1, scale).r,\n                                        halftoneIntensityRGB(textureCoordinatePos, samplePositionG, color2, scale).g,\n                                        halftoneIntensityRGB(textureCoordinatePos, samplePositionB, color3, scale).b);\n        }\n        vec3 i = (1.0 - intensityRGB) * (1.0 - intensityNeighborRGB);\n        gl_FragColor = vec4(i, texCoordColor.a);\n    }\n"

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
    iput v0, p0, Ll/bf5;->g:I

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
    iput v0, p0, Ll/bf5;->i:I

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
    iput v0, p0, Ll/bf5;->j:I

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
    iput v0, p0, Ll/bf5;->k:I

    .line 43
    .line 44
    return-void
.end method

.method public passShaderValues()V
    .locals 6

    .line 1
    invoke-super {p0}, Ll/wej;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/bf5;->g:I

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
    iget v0, p0, Ll/bf5;->i:I

    .line 20
    .line 21
    iget v1, p0, Ll/bf5;->e:F

    .line 22
    .line 23
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/bf5;->f:[F

    .line 27
    .line 28
    array-length v1, v0

    .line 29
    const/4 v2, 0x2

    .line 30
    const/4 v3, 0x1

    .line 31
    const/4 v4, 0x0

    .line 32
    if-lez v1, :cond_0

    .line 33
    .line 34
    aget v1, v0, v4

    .line 35
    .line 36
    aget v5, v0, v3

    .line 37
    .line 38
    cmpl-float v1, v1, v5

    .line 39
    .line 40
    if-nez v1, :cond_0

    .line 41
    .line 42
    aget v0, v0, v2

    .line 43
    .line 44
    cmpl-float v0, v5, v0

    .line 45
    .line 46
    if-nez v0, :cond_0

    .line 47
    .line 48
    iget v0, p0, Ll/bf5;->k:I

    .line 49
    .line 50
    invoke-static {v0, v3}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_0
    iget v0, p0, Ll/bf5;->k:I

    .line 55
    .line 56
    invoke-static {v0, v4}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 57
    .line 58
    .line 59
    :goto_0
    iget v0, p0, Ll/bf5;->j:I

    .line 60
    .line 61
    iget-object p0, p0, Ll/bf5;->f:[F

    .line 62
    .line 63
    aget v1, p0, v4

    .line 64
    .line 65
    aget v3, p0, v3

    .line 66
    .line 67
    aget v2, p0, v2

    .line 68
    .line 69
    const/4 v4, 0x3

    .line 70
    aget p0, p0, v4

    .line 71
    .line 72
    invoke-static {v0, v1, v3, v2, p0}, Landroid/opengl/GLES20;->glUniform4f(IFFFF)V

    .line 73
    .line 74
    .line 75
    return-void
.end method
