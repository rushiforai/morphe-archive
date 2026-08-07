.class public Lcom/tencent/liteav/beauty/b/b/b;
.super Lcom/tencent/liteav/basic/c/h;
.source "SourceFile"


# instance fields
.field private r:I

.field private s:I

.field private t:[F

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
    iput v0, p0, Lcom/tencent/liteav/beauty/b/b/b;->r:I

    .line 10
    .line 11
    iput v0, p0, Lcom/tencent/liteav/beauty/b/b/b;->s:I

    .line 12
    .line 13
    const/4 v0, 0x4

    .line 14
    new-array v0, v0, [F

    .line 15
    .line 16
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/b/b;->t:[F

    .line 17
    .line 18
    const-string v0, "Beauty3Filter"

    .line 19
    .line 20
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/b/b;->u:Ljava/lang/String;

    .line 21
    .line 22
    return-void
.end method

.method private b([F)V
    .locals 1

    .line 37
    iget v0, p0, Lcom/tencent/liteav/beauty/b/b/b;->s:I

    invoke-virtual {p0, v0, p1}, Lcom/tencent/liteav/basic/c/h;->c(I[F)V

    return-void
.end method


# virtual methods
.method public a(F)V
    .locals 2

    .line 35
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/b/b;->t:[F

    const/4 v1, 0x0

    aput p1, v0, v1

    .line 36
    invoke-direct {p0, v0}, Lcom/tencent/liteav/beauty/b/b/b;->b([F)V

    return-void
.end method

.method public a(II)V
    .locals 0

    .line 33
    invoke-super {p0, p1, p2}, Lcom/tencent/liteav/basic/c/h;->a(II)V

    .line 34
    invoke-virtual {p0, p1, p2}, Lcom/tencent/liteav/beauty/b/b/b;->c(II)V

    return-void
.end method

.method public a()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/tencent/liteav/beauty/NativeLoad;->getInstance()Lcom/tencent/liteav/beauty/NativeLoad;

    .line 2
    .line 3
    .line 4
    const/16 v0, 0xe

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tencent/liteav/beauty/NativeLoad;->nativeLoadGLProgram(I)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iput v0, p0, Lcom/tencent/liteav/basic/c/h;->a:I

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/tencent/liteav/beauty/b/b/b;->b()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    const/4 v0, 0x1

    .line 21
    iput-boolean v0, p0, Lcom/tencent/liteav/basic/c/h;->g:Z

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 v0, 0x0

    .line 25
    iput-boolean v0, p0, Lcom/tencent/liteav/basic/c/h;->g:Z

    .line 26
    .line 27
    :goto_0
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->c()V

    .line 28
    .line 29
    .line 30
    iget-boolean p0, p0, Lcom/tencent/liteav/basic/c/h;->g:Z

    .line 31
    .line 32
    return p0
.end method

.method public b(F)V
    .locals 2

    .line 35
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/b/b;->t:[F

    const/4 v1, 0x1

    aput p1, v0, v1

    .line 36
    invoke-direct {p0, v0}, Lcom/tencent/liteav/beauty/b/b/b;->b([F)V

    return-void
.end method

.method public b()Z
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/tencent/liteav/basic/c/h;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->p()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const-string v2, "singleStepOffset"

    .line 10
    .line 11
    invoke-static {v1, v2}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    iput v1, p0, Lcom/tencent/liteav/beauty/b/b/b;->r:I

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->p()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    const-string v2, "beautyParams"

    .line 22
    .line 23
    invoke-static {v1, v2}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    iput v1, p0, Lcom/tencent/liteav/beauty/b/b/b;->s:I

    .line 28
    .line 29
    const/high16 v1, 0x40a00000    # 5.0f

    .line 30
    .line 31
    invoke-virtual {p0, v1}, Lcom/tencent/liteav/beauty/b/b/b;->a(F)V

    .line 32
    .line 33
    .line 34
    return v0
.end method

.method public c(F)V
    .locals 2

    .line 23
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/b/b;->t:[F

    const/4 v1, 0x2

    aput p1, v0, v1

    .line 24
    invoke-direct {p0, v0}, Lcom/tencent/liteav/beauty/b/b/b;->b([F)V

    return-void
.end method

.method public c(II)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/tencent/liteav/beauty/b/b/b;->r:I

    .line 2
    .line 3
    int-to-float p1, p1

    .line 4
    const/high16 v1, 0x40000000    # 2.0f

    .line 5
    .line 6
    div-float p1, v1, p1

    .line 7
    .line 8
    int-to-float p2, p2

    .line 9
    div-float/2addr v1, p2

    .line 10
    const/4 p2, 0x2

    .line 11
    new-array p2, p2, [F

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    aput p1, p2, v2

    .line 15
    .line 16
    const/4 p1, 0x1

    .line 17
    aput v1, p2, p1

    .line 18
    .line 19
    invoke-virtual {p0, v0, p2}, Lcom/tencent/liteav/basic/c/h;->a(I[F)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
