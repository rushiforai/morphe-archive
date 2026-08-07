.class public Lcom/tencent/liteav/beauty/b/e;
.super Lcom/tencent/liteav/beauty/b/t;
.source "SourceFile"


# instance fields
.field private A:I

.field private B:[F

.field private x:I

.field private y:I

.field private z:I


# virtual methods
.method public b([F)V
    .locals 11

    .line 1
    const/4 v0, 0x3

    .line 2
    new-array v0, v0, [F

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    aget v2, p1, v1

    .line 6
    .line 7
    float-to-double v2, v2

    .line 8
    const-wide v4, 0x3fd3212d77318fc5L    # 0.2989

    .line 9
    .line 10
    .line 11
    .line 12
    .line 13
    mul-double/2addr v2, v4

    .line 14
    const/4 v4, 0x1

    .line 15
    aget v5, p1, v4

    .line 16
    .line 17
    float-to-double v5, v5

    .line 18
    const-wide v7, 0x3fe2c56d5cfaacdaL    # 0.5866

    .line 19
    .line 20
    .line 21
    .line 22
    .line 23
    mul-double/2addr v5, v7

    .line 24
    add-double/2addr v2, v5

    .line 25
    const/4 v5, 0x2

    .line 26
    aget v6, p1, v5

    .line 27
    .line 28
    float-to-double v7, v6

    .line 29
    const-wide v9, 0x3fbd4fdf3b645a1dL    # 0.1145

    .line 30
    .line 31
    .line 32
    .line 33
    .line 34
    mul-double/2addr v7, v9

    .line 35
    add-double/2addr v2, v7

    .line 36
    double-to-float v2, v2

    .line 37
    aput v2, v0, v1

    .line 38
    .line 39
    aget p1, p1, v1

    .line 40
    .line 41
    sub-float/2addr p1, v2

    .line 42
    float-to-double v7, p1

    .line 43
    const-wide v9, 0x3fe6d288ce703afbL    # 0.7132

    .line 44
    .line 45
    .line 46
    .line 47
    .line 48
    mul-double/2addr v7, v9

    .line 49
    double-to-float p1, v7

    .line 50
    aput p1, v0, v4

    .line 51
    .line 52
    sub-float/2addr v6, v2

    .line 53
    float-to-double v1, v6

    .line 54
    const-wide v3, 0x3fe21205bc01a36eL    # 0.5647

    .line 55
    .line 56
    .line 57
    .line 58
    .line 59
    mul-double/2addr v1, v3

    .line 60
    double-to-float p1, v1

    .line 61
    aput p1, v0, v5

    .line 62
    .line 63
    iget p1, p0, Lcom/tencent/liteav/beauty/b/e;->y:I

    .line 64
    .line 65
    invoke-virtual {p0, p1, v0}, Lcom/tencent/liteav/basic/c/h;->b(I[F)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public c()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/tencent/liteav/basic/c/h;->c()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->p()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const-string v1, "screenMode"

    .line 9
    .line 10
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iput v0, p0, Lcom/tencent/liteav/beauty/b/e;->x:I

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->p()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    const-string v1, "screenReplaceColor"

    .line 21
    .line 22
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    iput v0, p0, Lcom/tencent/liteav/beauty/b/e;->y:I

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->p()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    const-string v1, "screenMirrorX"

    .line 33
    .line 34
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    iput v0, p0, Lcom/tencent/liteav/beauty/b/e;->z:I

    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->p()I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    const-string v1, "screenMirrorY"

    .line 45
    .line 46
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    iput v0, p0, Lcom/tencent/liteav/beauty/b/e;->A:I

    .line 51
    .line 52
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/e;->B:[F

    .line 53
    .line 54
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/beauty/b/e;->b([F)V

    .line 55
    .line 56
    .line 57
    return-void
.end method
