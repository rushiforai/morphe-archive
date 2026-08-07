.class public Lcom/tencent/liteav/beauty/b/a/d;
.super Lcom/tencent/liteav/basic/c/h;
.source "SourceFile"


# instance fields
.field private r:I

.field private s:I

.field private t:F

.field private u:Ljava/lang/String;


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
    invoke-direct {p0, v0, v1}, Lcom/tencent/liteav/basic/c/h;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, -0x1

    .line 9
    iput v0, p0, Lcom/tencent/liteav/beauty/b/a/d;->r:I

    .line 10
    .line 11
    iput v0, p0, Lcom/tencent/liteav/beauty/b/a/d;->s:I

    .line 12
    .line 13
    const/high16 v0, 0x40800000    # 4.0f

    .line 14
    .line 15
    iput v0, p0, Lcom/tencent/liteav/beauty/b/a/d;->t:F

    .line 16
    .line 17
    const-string v0, "SmoothHorizontal"

    .line 18
    .line 19
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/a/d;->u:Ljava/lang/String;

    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public a(II)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2}, Lcom/tencent/liteav/basic/c/h;->a(II)V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x40800000    # 4.0f

    .line 5
    .line 6
    const/high16 v1, 0x40000000    # 2.0f

    .line 7
    .line 8
    const/16 v2, 0x21c

    .line 9
    .line 10
    if-le p1, p2, :cond_1

    .line 11
    .line 12
    if-ge p2, v2, :cond_0

    .line 13
    .line 14
    iput v1, p0, Lcom/tencent/liteav/beauty/b/a/d;->t:F

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iput v0, p0, Lcom/tencent/liteav/beauty/b/a/d;->t:F

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    if-ge p1, v2, :cond_2

    .line 21
    .line 22
    iput v1, p0, Lcom/tencent/liteav/beauty/b/a/d;->t:F

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_2
    iput v0, p0, Lcom/tencent/liteav/beauty/b/a/d;->t:F

    .line 26
    .line 27
    :goto_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/a/d;->u:Ljava/lang/String;

    .line 28
    .line 29
    new-instance v1, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    const-string v2, "m_textureRation "

    .line 32
    .line 33
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget v2, p0, Lcom/tencent/liteav/beauty/b/a/d;->t:F

    .line 37
    .line 38
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    iget v0, p0, Lcom/tencent/liteav/beauty/b/a/d;->r:I

    .line 49
    .line 50
    iget v1, p0, Lcom/tencent/liteav/beauty/b/a/d;->t:F

    .line 51
    .line 52
    int-to-float p1, p1

    .line 53
    div-float/2addr v1, p1

    .line 54
    invoke-virtual {p0, v0, v1}, Lcom/tencent/liteav/basic/c/h;->a(IF)V

    .line 55
    .line 56
    .line 57
    iget p1, p0, Lcom/tencent/liteav/beauty/b/a/d;->s:I

    .line 58
    .line 59
    iget v0, p0, Lcom/tencent/liteav/beauty/b/a/d;->t:F

    .line 60
    .line 61
    int-to-float p2, p2

    .line 62
    div-float/2addr v0, p2

    .line 63
    invoke-virtual {p0, p1, v0}, Lcom/tencent/liteav/basic/c/h;->a(IF)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public a()Z
    .locals 1

    .line 67
    invoke-static {}, Lcom/tencent/liteav/beauty/NativeLoad;->getInstance()Lcom/tencent/liteav/beauty/NativeLoad;

    const/16 v0, 0xd

    invoke-static {v0}, Lcom/tencent/liteav/beauty/NativeLoad;->nativeLoadGLProgram(I)I

    move-result v0

    iput v0, p0, Lcom/tencent/liteav/basic/c/h;->a:I

    if-eqz v0, :cond_0

    .line 68
    invoke-virtual {p0}, Lcom/tencent/liteav/beauty/b/a/d;->b()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 69
    iput-boolean v0, p0, Lcom/tencent/liteav/basic/c/h;->g:Z

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 70
    iput-boolean v0, p0, Lcom/tencent/liteav/basic/c/h;->g:Z

    .line 71
    :goto_0
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->c()V

    .line 72
    iget-boolean p0, p0, Lcom/tencent/liteav/basic/c/h;->g:Z

    return p0
.end method

.method public b()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/tencent/liteav/basic/c/h;->b()Z

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/tencent/liteav/beauty/b/a/d;->q()V

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
    iput v0, p0, Lcom/tencent/liteav/beauty/b/a/d;->r:I

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
    iput v0, p0, Lcom/tencent/liteav/beauty/b/a/d;->s:I

    .line 24
    .line 25
    return-void
.end method
