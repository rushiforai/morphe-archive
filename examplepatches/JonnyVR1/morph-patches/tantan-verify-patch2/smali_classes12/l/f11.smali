.class public Ll/f11;
.super Ll/qjj0;
.source "SourceFile"


# instance fields
.field private Z:I

.field private a0:I

.field private b0:I

.field private c0:I

.field private d0:I

.field private e0:I

.field private f0:F

.field private g0:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/qjj0;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/f11;->f0:F

    .line 6
    .line 7
    iput v0, p0, Ll/f11;->g0:F

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public S(FF)V
    .locals 0

    .line 1
    iput p1, p0, Ll/f11;->f0:F

    .line 2
    .line 3
    iput p2, p0, Ll/f11;->g0:F

    .line 4
    .line 5
    return-void
.end method

.method public m()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision highp float;\nvarying highp vec2 textureCoordinate;\nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nuniform float maximumHorizontalDisplacement;\nuniform float maximumVerticalDisplacement;\nuniform int horizontalDisplacementComponent;\nuniform int verticalDisplacementComponent;\nuniform float textureWidth;\nuniform float textureHeight;\nvoid main() {\n    vec4 displacement = texture2D(inputImageTexture1,textureCoordinate);\n    float h = displacement.x ; \n    float v = displacement.x ;\n    float hOffset = (h - 0.5) * 2.0 * maximumHorizontalDisplacement;\n    float vOffset = (v -0.5) * 2.0 * maximumVerticalDisplacement;\n    vec2 textureSize = vec2(textureWidth, textureHeight);\n    const int count = 8;\n    vec2 subSampleOffsets[count];\n    subSampleOffsets[0] = vec2( 0.0625, -0.1875);\n    subSampleOffsets[1] = vec2(-0.0625,  0.1875);\n    subSampleOffsets[2] = vec2( 0.3125,  0.0625);\n    subSampleOffsets[3] = vec2(-0.1875, -0.3125);\n    subSampleOffsets[4] = vec2(-0.3125,  0.3125);\n    subSampleOffsets[5] = vec2(-0.4375, -0.0625);\n    subSampleOffsets[6] = vec2( 0.1875,  0.4375);\n    subSampleOffsets[7] = vec2( 0.4375, -0.4375);\n    vec2 textureCoordinates[count];\n    for (int i = 0; i < count; i += 1) {\n        textureCoordinates[i] = textureCoordinate + subSampleOffsets[i]/textureSize;\n    }\n    vec4 color = vec4(0.0, 0.0, 0.0, 0.0);\n    float count1 = float(count); vec4 origin;\n    for (int i = 0; i < count; i += 1) {\n       origin   = texture2D(inputImageTexture0, textureCoordinates[i] + vec2(hOffset, vOffset));\n       color += origin/count1;\n    }\n    gl_FragColor =  color;\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/qjj0;->t()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/xej;->d:I

    .line 5
    .line 6
    const-string v1, "maximumHorizontalDisplacement"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Ll/f11;->Z:I

    .line 13
    .line 14
    iget v0, p0, Ll/xej;->d:I

    .line 15
    .line 16
    const-string v1, "maximumVerticalDisplacement"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Ll/f11;->a0:I

    .line 23
    .line 24
    iget v0, p0, Ll/xej;->d:I

    .line 25
    .line 26
    const-string v1, "horizontalDisplacementComponent"

    .line 27
    .line 28
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iput v0, p0, Ll/f11;->b0:I

    .line 33
    .line 34
    iget v0, p0, Ll/xej;->d:I

    .line 35
    .line 36
    const-string v1, "verticalDisplacementComponent"

    .line 37
    .line 38
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iput v0, p0, Ll/f11;->c0:I

    .line 43
    .line 44
    iget v0, p0, Ll/xej;->d:I

    .line 45
    .line 46
    const-string v1, "textureWidth"

    .line 47
    .line 48
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    iput v0, p0, Ll/f11;->d0:I

    .line 53
    .line 54
    iget v0, p0, Ll/xej;->d:I

    .line 55
    .line 56
    const-string v1, "textureHeight"

    .line 57
    .line 58
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    iput v0, p0, Ll/f11;->e0:I

    .line 63
    .line 64
    return-void
.end method

.method public w()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/qjj0;->w()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/f11;->Z:I

    .line 5
    .line 6
    iget v1, p0, Ll/f11;->f0:F

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 9
    .line 10
    .line 11
    iget v0, p0, Ll/f11;->a0:I

    .line 12
    .line 13
    iget v1, p0, Ll/f11;->g0:F

    .line 14
    .line 15
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 16
    .line 17
    .line 18
    iget v0, p0, Ll/f11;->b0:I

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 22
    .line 23
    .line 24
    iget v0, p0, Ll/f11;->c0:I

    .line 25
    .line 26
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 27
    .line 28
    .line 29
    iget v0, p0, Ll/f11;->d0:I

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/xej;->r()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    int-to-float v1, v1

    .line 36
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 37
    .line 38
    .line 39
    iget v0, p0, Ll/f11;->e0:I

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/xej;->n()I

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    int-to-float p0, p0

    .line 46
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 47
    .line 48
    .line 49
    return-void
.end method
