.class public Lcom/tencent/liteav/beauty/b/a/e;
.super Lcom/tencent/liteav/beauty/b/u;
.source "SourceFile"


# instance fields
.field private A:Ljava/lang/String;

.field private r:I

.field private s:I

.field private t:I

.field private x:I

.field private y:F

.field private z:F


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    const-string v0, "attribute vec4 position;\nattribute vec4 inputTextureCoordinate;\n \nvarying vec2 textureCoordinate;\n \nvoid main()\n{\n    gl_Position = position;\n    textureCoordinate = inputTextureCoordinate.xy;\n}"

    .line 2
    .line 3
    const-string v1, "varying lowp vec2 textureCoordinate;\n \nuniform sampler2D inputImageTexture;\n \nvoid main()\n{\n     gl_FragColor = texture2D(inputImageTexture, textureCoordinate);\n}"

    .line 4
    .line 5
    invoke-direct {p0, v0, v1}, Lcom/tencent/liteav/beauty/b/u;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, -0x1

    .line 9
    iput v0, p0, Lcom/tencent/liteav/beauty/b/a/e;->r:I

    .line 10
    .line 11
    iput v0, p0, Lcom/tencent/liteav/beauty/b/a/e;->s:I

    .line 12
    .line 13
    iput v0, p0, Lcom/tencent/liteav/beauty/b/a/e;->t:I

    .line 14
    .line 15
    iput v0, p0, Lcom/tencent/liteav/beauty/b/a/e;->x:I

    .line 16
    .line 17
    const/high16 v0, 0x40000000    # 2.0f

    .line 18
    .line 19
    iput v0, p0, Lcom/tencent/liteav/beauty/b/a/e;->y:F

    .line 20
    .line 21
    const/high16 v0, 0x3f000000    # 0.5f

    .line 22
    .line 23
    iput v0, p0, Lcom/tencent/liteav/beauty/b/a/e;->z:F

    .line 24
    .line 25
    const-string v0, "SmoothVertical"

    .line 26
    .line 27
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/a/e;->A:Ljava/lang/String;

    .line 28
    .line 29
    return-void
.end method


# virtual methods
.method public a(F)V
    .locals 3

    .line 76
    iput p1, p0, Lcom/tencent/liteav/beauty/b/a/e;->z:F

    .line 77
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/a/e;->A:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "setBeautyLevel "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    iget v0, p0, Lcom/tencent/liteav/beauty/b/a/e;->t:I

    invoke-virtual {p0, v0, p1}, Lcom/tencent/liteav/basic/c/h;->a(IF)V

    return-void
.end method

.method public a(II)V
    .locals 3

    .line 79
    invoke-super {p0, p1, p2}, Lcom/tencent/liteav/basic/c/h;->a(II)V

    const/high16 v0, 0x40800000    # 4.0f

    const/high16 v1, 0x40000000    # 2.0f

    const/16 v2, 0x21c

    if-le p1, p2, :cond_1

    if-ge p2, v2, :cond_0

    .line 80
    iput v1, p0, Lcom/tencent/liteav/beauty/b/a/e;->y:F

    goto :goto_0

    .line 81
    :cond_0
    iput v0, p0, Lcom/tencent/liteav/beauty/b/a/e;->y:F

    goto :goto_0

    :cond_1
    if-ge p1, v2, :cond_2

    .line 82
    iput v1, p0, Lcom/tencent/liteav/beauty/b/a/e;->y:F

    goto :goto_0

    .line 83
    :cond_2
    iput v0, p0, Lcom/tencent/liteav/beauty/b/a/e;->y:F

    .line 84
    :goto_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/a/e;->A:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "m_textureRation "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p0, Lcom/tencent/liteav/beauty/b/a/e;->y:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    iget v0, p0, Lcom/tencent/liteav/beauty/b/a/e;->r:I

    iget v1, p0, Lcom/tencent/liteav/beauty/b/a/e;->y:F

    int-to-float p1, p1

    div-float/2addr v1, p1

    invoke-virtual {p0, v0, v1}, Lcom/tencent/liteav/basic/c/h;->a(IF)V

    .line 86
    iget p1, p0, Lcom/tencent/liteav/beauty/b/a/e;->s:I

    iget v0, p0, Lcom/tencent/liteav/beauty/b/a/e;->y:F

    int-to-float p2, p2

    div-float/2addr v0, p2

    invoke-virtual {p0, p1, v0}, Lcom/tencent/liteav/basic/c/h;->a(IF)V

    return-void
.end method

.method public a()Z
    .locals 2

    .line 1
    sget-object v0, Landroid/os/Build;->BRAND:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "samsung"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 12
    .line 13
    const-string v1, "GT-I9500"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    sget-object v0, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    .line 22
    .line 23
    const-string v1, "4.3"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    invoke-static {}, Lcom/tencent/liteav/beauty/NativeLoad;->getInstance()Lcom/tencent/liteav/beauty/NativeLoad;

    .line 32
    .line 33
    .line 34
    const/16 v0, 0xf

    .line 35
    .line 36
    invoke-static {v0}, Lcom/tencent/liteav/beauty/NativeLoad;->nativeLoadGLProgram(I)I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    iput v0, p0, Lcom/tencent/liteav/basic/c/h;->a:I

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    invoke-static {}, Lcom/tencent/liteav/beauty/NativeLoad;->getInstance()Lcom/tencent/liteav/beauty/NativeLoad;

    .line 44
    .line 45
    .line 46
    const/4 v0, 0x5

    .line 47
    invoke-static {v0}, Lcom/tencent/liteav/beauty/NativeLoad;->nativeLoadGLProgram(I)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    iput v0, p0, Lcom/tencent/liteav/basic/c/h;->a:I

    .line 52
    .line 53
    :goto_0
    iget v0, p0, Lcom/tencent/liteav/basic/c/h;->a:I

    .line 54
    .line 55
    if-eqz v0, :cond_1

    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/tencent/liteav/beauty/b/a/e;->b()Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_1

    .line 62
    .line 63
    const/4 v0, 0x1

    .line 64
    iput-boolean v0, p0, Lcom/tencent/liteav/basic/c/h;->g:Z

    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_1
    const/4 v0, 0x0

    .line 68
    iput-boolean v0, p0, Lcom/tencent/liteav/basic/c/h;->g:Z

    .line 69
    .line 70
    :goto_1
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->c()V

    .line 71
    .line 72
    .line 73
    iget-boolean p0, p0, Lcom/tencent/liteav/basic/c/h;->g:Z

    .line 74
    .line 75
    return p0
.end method

.method public b()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/tencent/liteav/beauty/b/u;->b()Z

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/tencent/liteav/beauty/b/a/e;->q()V

    .line 5
    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0
.end method

.method public q()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->p()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "texelWidthOffset"

    .line 6
    .line 7
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iput v0, p0, Lcom/tencent/liteav/beauty/b/a/e;->r:I

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->p()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const-string v1, "texelHeightOffset"

    .line 18
    .line 19
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iput v0, p0, Lcom/tencent/liteav/beauty/b/a/e;->s:I

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->p()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    const-string v1, "smoothDegree"

    .line 30
    .line 31
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    iput v0, p0, Lcom/tencent/liteav/beauty/b/a/e;->t:I

    .line 36
    .line 37
    return-void
.end method
