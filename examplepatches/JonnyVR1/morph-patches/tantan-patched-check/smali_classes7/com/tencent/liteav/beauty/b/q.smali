.class public Lcom/tencent/liteav/beauty/b/q;
.super Lcom/tencent/liteav/basic/c/h;
.source "SourceFile"


# instance fields
.field private r:Lcom/tencent/liteav/basic/c/a;


# virtual methods
.method public b(I)I
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/q;->r:Lcom/tencent/liteav/basic/c/a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/tencent/liteav/basic/c/a;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/tencent/liteav/basic/c/a;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/q;->r:Lcom/tencent/liteav/basic/c/a;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    iput v1, v0, Lcom/tencent/liteav/basic/c/a;->a:I

    .line 14
    .line 15
    iput v1, v0, Lcom/tencent/liteav/basic/c/a;->b:I

    .line 16
    .line 17
    iget v1, p0, Lcom/tencent/liteav/basic/c/h;->e:I

    .line 18
    .line 19
    iput v1, v0, Lcom/tencent/liteav/basic/c/a;->c:I

    .line 20
    .line 21
    iget v1, p0, Lcom/tencent/liteav/basic/c/h;->f:I

    .line 22
    .line 23
    iput v1, v0, Lcom/tencent/liteav/basic/c/a;->d:I

    .line 24
    .line 25
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/q;->r:Lcom/tencent/liteav/basic/c/a;

    .line 26
    .line 27
    iget v1, v0, Lcom/tencent/liteav/basic/c/a;->a:I

    .line 28
    .line 29
    iget v2, v0, Lcom/tencent/liteav/basic/c/a;->b:I

    .line 30
    .line 31
    iget v3, v0, Lcom/tencent/liteav/basic/c/a;->c:I

    .line 32
    .line 33
    iget v0, v0, Lcom/tencent/liteav/basic/c/a;->d:I

    .line 34
    .line 35
    invoke-static {v1, v2, v3, v0}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 36
    .line 37
    .line 38
    invoke-super {p0, p1}, Lcom/tencent/liteav/basic/c/h;->b(I)I

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    return p0
.end method
