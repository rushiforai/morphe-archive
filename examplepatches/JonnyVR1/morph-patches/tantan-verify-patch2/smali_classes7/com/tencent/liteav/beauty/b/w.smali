.class public Lcom/tencent/liteav/beauty/b/w;
.super Lcom/tencent/liteav/beauty/b/v;
.source "SourceFile"


# instance fields
.field protected u:F


# virtual methods
.method public a(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/tencent/liteav/beauty/b/g;->a(II)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/tencent/liteav/beauty/b/w;->s()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public b()Z
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/tencent/liteav/beauty/b/g;->b()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public q()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/beauty/b/w;->u:F

    .line 2
    .line 3
    return p0
.end method

.method public r()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/beauty/b/w;->u:F

    .line 2
    .line 3
    return p0
.end method

.method public s()V
    .locals 7

    .line 1
    invoke-virtual {p0}, Lcom/tencent/liteav/beauty/b/w;->r()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/tencent/liteav/beauty/b/g;->r:Ljava/util/List;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    check-cast v1, Lcom/tencent/liteav/basic/c/h;

    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/tencent/liteav/basic/c/h;->p()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    const-string v3, "texelWidthOffset"

    .line 19
    .line 20
    invoke-static {v2, v3}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    invoke-virtual {v1}, Lcom/tencent/liteav/basic/c/h;->p()I

    .line 25
    .line 26
    .line 27
    move-result v4

    .line 28
    const-string v5, "texelHeightOffset"

    .line 29
    .line 30
    invoke-static {v4, v5}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    iget v6, p0, Lcom/tencent/liteav/basic/c/h;->e:I

    .line 35
    .line 36
    int-to-float v6, v6

    .line 37
    div-float/2addr v0, v6

    .line 38
    invoke-virtual {v1, v2, v0}, Lcom/tencent/liteav/basic/c/h;->a(IF)V

    .line 39
    .line 40
    .line 41
    const/4 v0, 0x0

    .line 42
    invoke-virtual {v1, v4, v0}, Lcom/tencent/liteav/basic/c/h;->a(IF)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/tencent/liteav/beauty/b/w;->q()F

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    iget-object v2, p0, Lcom/tencent/liteav/beauty/b/g;->r:Ljava/util/List;

    .line 50
    .line 51
    const/4 v4, 0x1

    .line 52
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    check-cast v2, Lcom/tencent/liteav/basic/c/h;

    .line 57
    .line 58
    invoke-virtual {v2}, Lcom/tencent/liteav/basic/c/h;->p()I

    .line 59
    .line 60
    .line 61
    move-result v4

    .line 62
    invoke-static {v4, v3}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    invoke-virtual {v2}, Lcom/tencent/liteav/basic/c/h;->p()I

    .line 67
    .line 68
    .line 69
    move-result v4

    .line 70
    invoke-static {v4, v5}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 71
    .line 72
    .line 73
    move-result v4

    .line 74
    invoke-virtual {v2, v3, v0}, Lcom/tencent/liteav/basic/c/h;->a(IF)V

    .line 75
    .line 76
    .line 77
    iget p0, p0, Lcom/tencent/liteav/basic/c/h;->f:I

    .line 78
    .line 79
    int-to-float p0, p0

    .line 80
    div-float/2addr v1, p0

    .line 81
    invoke-virtual {v2, v4, v1}, Lcom/tencent/liteav/basic/c/h;->a(IF)V

    .line 82
    .line 83
    .line 84
    return-void
.end method
