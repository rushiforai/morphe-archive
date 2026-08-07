.class public Lcom/tencent/liteav/beauty/b/c$a;
.super Lcom/tencent/liteav/beauty/b/t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/liteav/beauty/b/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field private x:I

.field private y:I

.field private z:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    const-string v0, "attribute vec4 position;\nattribute vec4 inputTextureCoordinate;\nattribute vec4 inputTextureCoordinate2;\nattribute vec4 inputTextureCoordinate3;\n \nvarying vec2 textureCoordinate;\nvarying vec2 textureCoordinate2;\nvarying vec2 textureCoordinate3;\n \nvoid main()\n{\n    gl_Position = position;\n    textureCoordinate = inputTextureCoordinate.xy;\n    textureCoordinate2 = inputTextureCoordinate2.xy;\n    textureCoordinate3 = inputTextureCoordinate3.xy;\n}"

    .line 2
    .line 3
    const-string v1, "varying lowp vec2 textureCoordinate;\n \nuniform sampler2D inputImageTexture;\n \nvoid main()\n{\n     gl_FragColor = texture2D(inputImageTexture, textureCoordinate);\n}"

    .line 4
    .line 5
    invoke-direct {p0, v0, v1}, Lcom/tencent/liteav/beauty/b/t;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, -0x1

    .line 9
    iput v0, p0, Lcom/tencent/liteav/beauty/b/c$a;->x:I

    .line 10
    .line 11
    iput v0, p0, Lcom/tencent/liteav/beauty/b/c$a;->y:I

    .line 12
    .line 13
    iput v0, p0, Lcom/tencent/liteav/beauty/b/c$a;->z:I

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public a(F)V
    .locals 1

    .line 56
    iget v0, p0, Lcom/tencent/liteav/beauty/b/c$a;->x:I

    invoke-static {p1}, Lcom/tencent/liteav/beauty/b/c;->a(F)F

    move-result p1

    invoke-virtual {p0, v0, p1}, Lcom/tencent/liteav/basic/c/h;->a(IF)V

    return-void
.end method

.method public a(II)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/tencent/liteav/basic/c/h;->f:I

    .line 2
    .line 3
    if-ne v0, p2, :cond_0

    .line 4
    .line 5
    iget v0, p0, Lcom/tencent/liteav/basic/c/h;->e:I

    .line 6
    .line 7
    if-ne v0, p1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/tencent/liteav/beauty/b/t;->a(II)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->p()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    const-string p2, "smoothDegree"

    .line 18
    .line 19
    invoke-static {p1, p2}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    iput p1, p0, Lcom/tencent/liteav/beauty/b/c$a;->x:I

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->p()I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    const-string p2, "brightDegree"

    .line 30
    .line 31
    invoke-static {p1, p2}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    iput p1, p0, Lcom/tencent/liteav/beauty/b/c$a;->y:I

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->p()I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    const-string p2, "ruddyDegree"

    .line 42
    .line 43
    invoke-static {p1, p2}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    iput p1, p0, Lcom/tencent/liteav/beauty/b/c$a;->z:I

    .line 48
    .line 49
    return-void
.end method

.method public a()Z
    .locals 2

    .line 50
    invoke-static {}, Lcom/tencent/liteav/beauty/NativeLoad;->getInstance()Lcom/tencent/liteav/beauty/NativeLoad;

    const/4 v0, 0x1

    invoke-static {v0}, Lcom/tencent/liteav/beauty/NativeLoad;->nativeLoadGLProgram(I)I

    move-result v1

    iput v1, p0, Lcom/tencent/liteav/basic/c/h;->a:I

    if-eqz v1, :cond_0

    .line 51
    invoke-virtual {p0}, Lcom/tencent/liteav/beauty/b/c$a;->b()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 52
    iput-boolean v0, p0, Lcom/tencent/liteav/basic/c/h;->g:Z

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 53
    iput-boolean v0, p0, Lcom/tencent/liteav/basic/c/h;->g:Z

    .line 54
    :goto_0
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->c()V

    .line 55
    iget-boolean p0, p0, Lcom/tencent/liteav/basic/c/h;->g:Z

    return p0
.end method

.method public b(F)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/tencent/liteav/beauty/b/c$a;->y:I

    .line 2
    .line 3
    const/high16 v1, 0x40400000    # 3.0f

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
    invoke-super {p0}, Lcom/tencent/liteav/beauty/b/t;->b()Z

    move-result p0

    return p0
.end method

.method public c(F)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/tencent/liteav/beauty/b/c$a;->z:I

    .line 2
    .line 3
    const/high16 v1, 0x41200000    # 10.0f

    .line 4
    .line 5
    div-float/2addr p1, v1

    .line 6
    const/high16 v1, 0x40000000    # 2.0f

    .line 7
    .line 8
    div-float/2addr p1, v1

    .line 9
    invoke-virtual {p0, v0, p1}, Lcom/tencent/liteav/basic/c/h;->a(IF)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
