.class public Lcom/tencent/liteav/beauty/b/a/b;
.super Lcom/tencent/liteav/beauty/b/u;
.source "SourceFile"


# instance fields
.field private r:I

.field private s:I

.field private t:I

.field private final x:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    const-string v0, "varying lowp vec2 textureCoordinate;\n \nuniform sampler2D inputImageTexture;\n \nvoid main()\n{\n     gl_FragColor = texture2D(inputImageTexture, textureCoordinate);\n}"

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/tencent/liteav/beauty/b/u;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, -0x1

    .line 7
    iput v0, p0, Lcom/tencent/liteav/beauty/b/a/b;->r:I

    .line 8
    .line 9
    iput v0, p0, Lcom/tencent/liteav/beauty/b/a/b;->s:I

    .line 10
    .line 11
    iput v0, p0, Lcom/tencent/liteav/beauty/b/a/b;->t:I

    .line 12
    .line 13
    const-string v0, "BeautyBlend"

    .line 14
    .line 15
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/a/b;->x:Ljava/lang/String;

    .line 16
    .line 17
    return-void
.end method

.method private q()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->p()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "whiteDegree"

    .line 6
    .line 7
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iput v0, p0, Lcom/tencent/liteav/beauty/b/a/b;->s:I

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->p()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const-string v1, "contrast"

    .line 18
    .line 19
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iput v0, p0, Lcom/tencent/liteav/beauty/b/a/b;->r:I

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->p()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    const-string v1, "ruddyDegree"

    .line 30
    .line 31
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    iput v0, p0, Lcom/tencent/liteav/beauty/b/a/b;->t:I

    .line 36
    .line 37
    return-void
.end method


# virtual methods
.method public a(F)V
    .locals 2

    .line 33
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "setBrightLevel "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "BeautyBlend"

    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    iget v0, p0, Lcom/tencent/liteav/beauty/b/a/b;->s:I

    invoke-virtual {p0, v0, p1}, Lcom/tencent/liteav/basic/c/h;->a(IF)V

    return-void
.end method

.method public a()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/tencent/liteav/beauty/NativeLoad;->getInstance()Lcom/tencent/liteav/beauty/NativeLoad;

    .line 2
    .line 3
    .line 4
    const/16 v0, 0xc

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
    invoke-virtual {p0}, Lcom/tencent/liteav/beauty/b/a/b;->b()Z

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

    .line 1
    iget v0, p0, Lcom/tencent/liteav/beauty/b/a/b;->t:I

    .line 2
    .line 3
    const/high16 v1, 0x40000000    # 2.0f

    .line 4
    .line 5
    div-float/2addr p1, v1

    .line 6
    invoke-virtual {p0, v0, p1}, Lcom/tencent/liteav/basic/c/h;->a(IF)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public b()Z
    .locals 0

    .line 10
    invoke-super {p0}, Lcom/tencent/liteav/beauty/b/u;->b()Z

    .line 11
    invoke-direct {p0}, Lcom/tencent/liteav/beauty/b/a/b;->q()V

    const/4 p0, 0x1

    return p0
.end method
