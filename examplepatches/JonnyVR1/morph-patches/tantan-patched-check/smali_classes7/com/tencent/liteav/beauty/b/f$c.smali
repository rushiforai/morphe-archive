.class Lcom/tencent/liteav/beauty/b/f$c;
.super Lcom/tencent/liteav/beauty/b/u;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/liteav/beauty/b/f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation


# instance fields
.field r:I

.field s:I

.field t:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0, v0}, Lcom/tencent/liteav/beauty/b/u;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 3
    .line 4
    .line 5
    const/high16 v0, 0x3fc00000    # 1.5f

    .line 6
    .line 7
    iput v0, p0, Lcom/tencent/liteav/beauty/b/f$c;->t:F

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public a(F)V
    .locals 2

    .line 32
    iput p1, p0, Lcom/tencent/liteav/beauty/b/f$c;->t:F

    .line 33
    iget v0, p0, Lcom/tencent/liteav/beauty/b/f$c;->r:I

    iget v1, p0, Lcom/tencent/liteav/basic/c/h;->e:I

    int-to-float v1, v1

    div-float/2addr p1, v1

    invoke-virtual {p0, v0, p1}, Lcom/tencent/liteav/basic/c/h;->a(IF)V

    .line 34
    iget p1, p0, Lcom/tencent/liteav/beauty/b/f$c;->s:I

    iget v0, p0, Lcom/tencent/liteav/beauty/b/f$c;->t:F

    iget v1, p0, Lcom/tencent/liteav/basic/c/h;->f:I

    int-to-float v1, v1

    div-float/2addr v0, v1

    invoke-virtual {p0, p1, v0}, Lcom/tencent/liteav/basic/c/h;->a(IF)V

    return-void
.end method

.method public a(II)V
    .locals 0

    .line 35
    invoke-super {p0, p1, p2}, Lcom/tencent/liteav/basic/c/h;->a(II)V

    .line 36
    iget p1, p0, Lcom/tencent/liteav/beauty/b/f$c;->t:F

    invoke-virtual {p0, p1}, Lcom/tencent/liteav/beauty/b/f$c;->a(F)V

    return-void
.end method

.method public a()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/tencent/liteav/beauty/NativeLoad;->getInstance()Lcom/tencent/liteav/beauty/NativeLoad;

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    invoke-static {v0}, Lcom/tencent/liteav/beauty/NativeLoad;->nativeLoadGLProgram(I)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iput v0, p0, Lcom/tencent/liteav/basic/c/h;->a:I

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/tencent/liteav/beauty/b/f$c;->b()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    iput-boolean v0, p0, Lcom/tencent/liteav/basic/c/h;->g:Z

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 v0, 0x0

    .line 24
    iput-boolean v0, p0, Lcom/tencent/liteav/basic/c/h;->g:Z

    .line 25
    .line 26
    :goto_0
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->c()V

    .line 27
    .line 28
    .line 29
    iget-boolean p0, p0, Lcom/tencent/liteav/basic/c/h;->g:Z

    .line 30
    .line 31
    return p0
.end method

.method public b()Z
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/tencent/liteav/beauty/b/u;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget v0, p0, Lcom/tencent/liteav/basic/c/h;->a:I

    .line 8
    .line 9
    const-string v1, "texelWidthOffset"

    .line 10
    .line 11
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iput v0, p0, Lcom/tencent/liteav/beauty/b/f$c;->r:I

    .line 16
    .line 17
    iget v0, p0, Lcom/tencent/liteav/basic/c/h;->a:I

    .line 18
    .line 19
    const-string v1, "texelHeightOffset"

    .line 20
    .line 21
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    iput v0, p0, Lcom/tencent/liteav/beauty/b/f$c;->s:I

    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    return p0

    .line 29
    :cond_0
    const/4 p0, 0x0

    .line 30
    return p0
.end method
