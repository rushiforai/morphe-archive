.class public Lcom/tencent/liteav/beauty/b/m;
.super Lcom/tencent/liteav/basic/c/h;
.source "SourceFile"


# instance fields
.field private A:I

.field private B:[F

.field private C:I

.field private D:[F

.field private r:F

.field private s:Landroid/graphics/Bitmap;

.field private t:I

.field private u:I

.field private v:F

.field private w:Landroid/graphics/Bitmap;

.field private x:I

.field private y:I

.field private z:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 32
    invoke-direct {p0}, Lcom/tencent/liteav/basic/c/h;-><init>()V

    const/4 v0, -0x1

    .line 33
    iput v0, p0, Lcom/tencent/liteav/beauty/b/m;->u:I

    .line 34
    iput v0, p0, Lcom/tencent/liteav/beauty/b/m;->y:I

    return-void
.end method

.method public constructor <init>(FLandroid/graphics/Bitmap;FLandroid/graphics/Bitmap;F)V
    .locals 2

    .line 1
    const-string v0, "attribute vec4 position;\nattribute vec4 inputTextureCoordinate;\n \nvarying vec2 textureCoordinate;\n \nvoid main()\n{\n    gl_Position = position;\n    textureCoordinate = inputTextureCoordinate.xy;\n}"

    .line 2
    .line 3
    const-string v1, "varying highp vec2 textureCoordinate;\n \n uniform sampler2D inputImageTexture;\n uniform sampler2D inputImageTexture2; // lookup texture 1\n uniform sampler2D inputImageTexture3; // lookup texture 2\n \n \n uniform lowp vec3 v3_params;\n uniform lowp vec2 v2_texs;\n \n \n void main()\n {\n     lowp vec4 textureColor = texture2D(inputImageTexture, textureCoordinate);\n     \n     mediump float blueColor = textureColor.b * 63.0;\n     \n     mediump vec2 quad1;\n     quad1.y = floor(floor(blueColor) / 8.0);\n     quad1.x = floor(blueColor) - (quad1.y * 8.0);\n     \n     mediump vec2 quad2;\n     quad2.y = floor(ceil(blueColor) / 8.0);\n     quad2.x = ceil(blueColor) - (quad2.y * 8.0);\n     \n     highp vec2 texPos1;\n     texPos1.x = (quad1.x * 0.125) + 0.5/512.0 + ((0.125 - 1.0/512.0) * textureColor.r);\n     texPos1.y = (quad1.y * 0.125) + 0.5/512.0 + ((0.125 - 1.0/512.0) * textureColor.g);\n     \n     highp vec2 texPos2;\n     texPos2.x = (quad2.x * 0.125) + 0.5/512.0 + ((0.125 - 1.0/512.0) * textureColor.r);\n     texPos2.y = (quad2.y * 0.125) + 0.5/512.0 + ((0.125 - 1.0/512.0) * textureColor.g);\n     \n     lowp vec4 newColor1;\n     lowp vec4 newColor2;\n     if(textureCoordinate.x <= v3_params.x) { \n       if(v2_texs.x == 1.0) { \n         newColor1 = texture2D(inputImageTexture2, texPos1);\n         newColor2 = texture2D(inputImageTexture2, texPos2);\n         lowp vec4 newColor = mix(newColor1, newColor2, fract(blueColor));\n         gl_FragColor = mix(textureColor, vec4(newColor.rgb, textureColor.w), v3_params.y);\n       } else { \n         gl_FragColor = textureColor;\n       } \n     } else {\n       if(v2_texs.y == 1.0) { \n         newColor1 = texture2D(inputImageTexture3, texPos1);\n         newColor2 = texture2D(inputImageTexture3, texPos2);\n         lowp vec4 newColor = mix(newColor1, newColor2, fract(blueColor));\n         gl_FragColor = mix(textureColor, vec4(newColor.rgb, textureColor.w), v3_params.z);\n       } else { \n         gl_FragColor = textureColor;\n       } \n     }\n }"

    .line 4
    .line 5
    invoke-direct {p0, v0, v1}, Lcom/tencent/liteav/beauty/b/m;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x3

    .line 9
    new-array v0, v0, [F

    .line 10
    .line 11
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/m;->B:[F

    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    new-array v0, v0, [F

    .line 15
    .line 16
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/m;->D:[F

    .line 17
    .line 18
    iput p1, p0, Lcom/tencent/liteav/beauty/b/m;->r:F

    .line 19
    .line 20
    iput-object p2, p0, Lcom/tencent/liteav/beauty/b/m;->s:Landroid/graphics/Bitmap;

    .line 21
    .line 22
    iput-object p4, p0, Lcom/tencent/liteav/beauty/b/m;->w:Landroid/graphics/Bitmap;

    .line 23
    .line 24
    iput p3, p0, Lcom/tencent/liteav/beauty/b/m;->v:F

    .line 25
    .line 26
    iput p5, p0, Lcom/tencent/liteav/beauty/b/m;->z:F

    .line 27
    .line 28
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 29
    invoke-direct {p0, p1, p2}, Lcom/tencent/liteav/basic/c/h;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, -0x1

    .line 30
    iput p1, p0, Lcom/tencent/liteav/beauty/b/m;->u:I

    .line 31
    iput p1, p0, Lcom/tencent/liteav/beauty/b/m;->y:I

    return-void
.end method

.method public static synthetic a(Lcom/tencent/liteav/beauty/b/m;)I
    .locals 0

    .line 24
    iget p0, p0, Lcom/tencent/liteav/beauty/b/m;->u:I

    return p0
.end method

.method public static synthetic a(Lcom/tencent/liteav/beauty/b/m;I)I
    .locals 0

    .line 19
    iput p1, p0, Lcom/tencent/liteav/beauty/b/m;->u:I

    return p1
.end method

.method public static synthetic a(Lcom/tencent/liteav/beauty/b/m;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 0

    .line 20
    iput-object p1, p0, Lcom/tencent/liteav/beauty/b/m;->s:Landroid/graphics/Bitmap;

    return-object p1
.end method

.method public static synthetic b(Lcom/tencent/liteav/beauty/b/m;I)I
    .locals 0

    .line 56
    iput p1, p0, Lcom/tencent/liteav/beauty/b/m;->y:I

    return p1
.end method

.method public static synthetic b(Lcom/tencent/liteav/beauty/b/m;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 0

    .line 54
    iput-object p1, p0, Lcom/tencent/liteav/beauty/b/m;->w:Landroid/graphics/Bitmap;

    return-object p1
.end method

.method public static synthetic b(Lcom/tencent/liteav/beauty/b/m;)[F
    .locals 0

    .line 55
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b/m;->D:[F

    return-object p0
.end method

.method public static synthetic c(Lcom/tencent/liteav/beauty/b/m;)I
    .locals 0

    .line 19
    iget p0, p0, Lcom/tencent/liteav/beauty/b/m;->y:I

    return p0
.end method


# virtual methods
.method public a(F)V
    .locals 2

    .line 23
    iget v0, p0, Lcom/tencent/liteav/beauty/b/m;->r:F

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Lcom/tencent/liteav/beauty/b/m;->a(FFF)V

    return-void
.end method

.method public a(FFF)V
    .locals 1

    .line 1
    iput p1, p0, Lcom/tencent/liteav/beauty/b/m;->r:F

    .line 2
    .line 3
    iput p2, p0, Lcom/tencent/liteav/beauty/b/m;->v:F

    .line 4
    .line 5
    iput p3, p0, Lcom/tencent/liteav/beauty/b/m;->z:F

    .line 6
    .line 7
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b/m;->B:[F

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    aput p1, p0, v0

    .line 11
    .line 12
    const/4 p1, 0x1

    .line 13
    aput p2, p0, p1

    .line 14
    .line 15
    const/4 p1, 0x2

    .line 16
    aput p3, p0, p1

    .line 17
    .line 18
    return-void
.end method

.method public a(FLandroid/graphics/Bitmap;FLandroid/graphics/Bitmap;F)V
    .locals 0

    .line 21
    invoke-virtual {p0, p1, p3, p5}, Lcom/tencent/liteav/beauty/b/m;->a(FFF)V

    .line 22
    new-instance p1, Lcom/tencent/liteav/beauty/b/m$1;

    invoke-direct {p1, p0, p2, p4}, Lcom/tencent/liteav/beauty/b/m$1;-><init>(Lcom/tencent/liteav/beauty/b/m;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    invoke-virtual {p0, p1}, Lcom/tencent/liteav/basic/c/h;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public b()Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->p()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "inputImageTexture2"

    .line 6
    .line 7
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iput v0, p0, Lcom/tencent/liteav/beauty/b/m;->t:I

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->p()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const-string v1, "inputImageTexture3"

    .line 18
    .line 19
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iput v0, p0, Lcom/tencent/liteav/beauty/b/m;->x:I

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->p()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    const-string v1, "v3_params"

    .line 30
    .line 31
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    iput v0, p0, Lcom/tencent/liteav/beauty/b/m;->A:I

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->p()I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    const-string v1, "v2_texs"

    .line 42
    .line 43
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    iput v0, p0, Lcom/tencent/liteav/beauty/b/m;->C:I

    .line 48
    .line 49
    invoke-super {p0}, Lcom/tencent/liteav/basic/c/h;->b()Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    return p0
.end method

.method public c()V
    .locals 6

    .line 1
    invoke-super {p0}, Lcom/tencent/liteav/basic/c/h;->c()V

    .line 2
    .line 3
    .line 4
    iget v1, p0, Lcom/tencent/liteav/beauty/b/m;->r:F

    .line 5
    .line 6
    iget-object v2, p0, Lcom/tencent/liteav/beauty/b/m;->s:Landroid/graphics/Bitmap;

    .line 7
    .line 8
    iget v3, p0, Lcom/tencent/liteav/beauty/b/m;->v:F

    .line 9
    .line 10
    iget-object v4, p0, Lcom/tencent/liteav/beauty/b/m;->w:Landroid/graphics/Bitmap;

    .line 11
    .line 12
    iget v5, p0, Lcom/tencent/liteav/beauty/b/m;->z:F

    .line 13
    .line 14
    move-object v0, p0

    .line 15
    invoke-virtual/range {v0 .. v5}, Lcom/tencent/liteav/beauty/b/m;->a(FLandroid/graphics/Bitmap;FLandroid/graphics/Bitmap;F)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public e()V
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/tencent/liteav/basic/c/h;->e()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/tencent/liteav/beauty/b/m;->u:I

    .line 5
    .line 6
    iget v1, p0, Lcom/tencent/liteav/beauty/b/m;->y:I

    .line 7
    .line 8
    filled-new-array {v0, v1}, [I

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x2

    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 15
    .line 16
    .line 17
    const/4 v0, -0x1

    .line 18
    iput v0, p0, Lcom/tencent/liteav/beauty/b/m;->u:I

    .line 19
    .line 20
    iput v0, p0, Lcom/tencent/liteav/beauty/b/m;->y:I

    .line 21
    .line 22
    return-void
.end method

.method public i()V
    .locals 4

    .line 1
    iget v0, p0, Lcom/tencent/liteav/beauty/b/m;->u:I

    .line 2
    .line 3
    const/16 v1, 0xde1

    .line 4
    .line 5
    const/4 v2, -0x1

    .line 6
    if-eq v0, v2, :cond_0

    .line 7
    .line 8
    const v0, 0x84c3

    .line 9
    .line 10
    .line 11
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 12
    .line 13
    .line 14
    iget v0, p0, Lcom/tencent/liteav/beauty/b/m;->u:I

    .line 15
    .line 16
    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 17
    .line 18
    .line 19
    iget v0, p0, Lcom/tencent/liteav/beauty/b/m;->t:I

    .line 20
    .line 21
    const/4 v3, 0x3

    .line 22
    invoke-static {v0, v3}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 23
    .line 24
    .line 25
    :cond_0
    iget v0, p0, Lcom/tencent/liteav/beauty/b/m;->y:I

    .line 26
    .line 27
    if-eq v0, v2, :cond_1

    .line 28
    .line 29
    const v0, 0x84c4

    .line 30
    .line 31
    .line 32
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 33
    .line 34
    .line 35
    iget v0, p0, Lcom/tencent/liteav/beauty/b/m;->y:I

    .line 36
    .line 37
    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 38
    .line 39
    .line 40
    iget v0, p0, Lcom/tencent/liteav/beauty/b/m;->x:I

    .line 41
    .line 42
    const/4 v1, 0x4

    .line 43
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 44
    .line 45
    .line 46
    :cond_1
    iget v0, p0, Lcom/tencent/liteav/beauty/b/m;->C:I

    .line 47
    .line 48
    iget-object v1, p0, Lcom/tencent/liteav/beauty/b/m;->D:[F

    .line 49
    .line 50
    invoke-static {v1}, Ljava/nio/FloatBuffer;->wrap([F)Ljava/nio/FloatBuffer;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    const/4 v2, 0x1

    .line 55
    invoke-static {v0, v2, v1}, Landroid/opengl/GLES20;->glUniform2fv(IILjava/nio/FloatBuffer;)V

    .line 56
    .line 57
    .line 58
    iget v0, p0, Lcom/tencent/liteav/beauty/b/m;->A:I

    .line 59
    .line 60
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b/m;->B:[F

    .line 61
    .line 62
    invoke-static {p0}, Ljava/nio/FloatBuffer;->wrap([F)Ljava/nio/FloatBuffer;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-static {v0, v2, p0}, Landroid/opengl/GLES20;->glUniform3fv(IILjava/nio/FloatBuffer;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public j()V
    .locals 5

    .line 1
    iget v0, p0, Lcom/tencent/liteav/beauty/b/m;->u:I

    .line 2
    .line 3
    const v1, 0x84c0

    .line 4
    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    const/16 v3, 0xde1

    .line 8
    .line 9
    const/4 v4, -0x1

    .line 10
    if-eq v0, v4, :cond_0

    .line 11
    .line 12
    const v0, 0x84c3

    .line 13
    .line 14
    .line 15
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 16
    .line 17
    .line 18
    invoke-static {v3, v2}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 19
    .line 20
    .line 21
    invoke-static {v1}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 22
    .line 23
    .line 24
    :cond_0
    iget p0, p0, Lcom/tencent/liteav/beauty/b/m;->y:I

    .line 25
    .line 26
    if-eq p0, v4, :cond_1

    .line 27
    .line 28
    const p0, 0x84c4

    .line 29
    .line 30
    .line 31
    invoke-static {p0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 32
    .line 33
    .line 34
    invoke-static {v3, v2}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 35
    .line 36
    .line 37
    invoke-static {v1}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 38
    .line 39
    .line 40
    :cond_1
    return-void
.end method
