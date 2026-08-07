.class public Ll/hd2;
.super Ll/jt2;
.source "SourceFile"


# instance fields
.field private a:I

.field private b:Landroid/graphics/Bitmap;

.field private c:Landroid/graphics/Bitmap;

.field private d:Ljava/nio/FloatBuffer;

.field private e:[F

.field private f:I

.field private g:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/jt2;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/hd2;->a:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iput-object v1, p0, Ll/hd2;->b:Landroid/graphics/Bitmap;

    .line 9
    .line 10
    iput-object v1, p0, Ll/hd2;->c:Landroid/graphics/Bitmap;

    .line 11
    .line 12
    const/16 v1, 0x8

    .line 13
    .line 14
    new-array v1, v1, [F

    .line 15
    .line 16
    iput-object v1, p0, Ll/hd2;->e:[F

    .line 17
    .line 18
    iput v0, p0, Ll/hd2;->f:I

    .line 19
    .line 20
    iput v0, p0, Ll/hd2;->g:I

    .line 21
    .line 22
    return-void
.end method

.method private Q1()V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/hd2;->b:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Ll/hd2;->b:Landroid/graphics/Bitmap;

    .line 8
    .line 9
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    int-to-float v0, v0

    .line 22
    const/high16 v4, 0x3f800000    # 1.0f

    .line 23
    .line 24
    mul-float v5, v0, v4

    .line 25
    .line 26
    int-to-float v1, v1

    .line 27
    div-float v6, v5, v1

    .line 28
    .line 29
    int-to-float v2, v2

    .line 30
    mul-float v7, v2, v4

    .line 31
    .line 32
    int-to-float v3, v3

    .line 33
    div-float/2addr v7, v3

    .line 34
    cmpl-float v6, v6, v7

    .line 35
    .line 36
    const/4 v7, 0x0

    .line 37
    const/high16 v8, 0x3f000000    # 0.5f

    .line 38
    .line 39
    if-lez v6, :cond_0

    .line 40
    .line 41
    mul-float/2addr v1, v4

    .line 42
    div-float/2addr v1, v3

    .line 43
    mul-float/2addr v1, v2

    .line 44
    sub-float v1, v0, v1

    .line 45
    .line 46
    mul-float/2addr v1, v8

    .line 47
    div-float/2addr v1, v0

    .line 48
    sub-float v0, v4, v1

    .line 49
    .line 50
    move v9, v7

    .line 51
    move v7, v1

    .line 52
    move v1, v9

    .line 53
    goto :goto_0

    .line 54
    :cond_0
    div-float/2addr v5, v2

    .line 55
    mul-float/2addr v5, v3

    .line 56
    sub-float v0, v1, v5

    .line 57
    .line 58
    mul-float/2addr v0, v8

    .line 59
    div-float/2addr v0, v1

    .line 60
    sub-float v1, v4, v0

    .line 61
    .line 62
    move v9, v1

    .line 63
    move v1, v0

    .line 64
    move v0, v4

    .line 65
    move v4, v9

    .line 66
    :goto_0
    iget-object p0, p0, Ll/hd2;->e:[F

    .line 67
    .line 68
    const/4 v2, 0x0

    .line 69
    aput v7, p0, v2

    .line 70
    .line 71
    const/4 v2, 0x1

    .line 72
    aput v4, p0, v2

    .line 73
    .line 74
    const/4 v2, 0x2

    .line 75
    aput v0, p0, v2

    .line 76
    .line 77
    const/4 v2, 0x3

    .line 78
    aput v4, p0, v2

    .line 79
    .line 80
    const/4 v2, 0x4

    .line 81
    aput v7, p0, v2

    .line 82
    .line 83
    const/4 v2, 0x5

    .line 84
    aput v1, p0, v2

    .line 85
    .line 86
    const/4 v2, 0x6

    .line 87
    aput v0, p0, v2

    .line 88
    .line 89
    const/4 v0, 0x7

    .line 90
    aput v1, p0, v0

    .line 91
    .line 92
    return-void
.end method

.method private R1()V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget v1, v0, Ll/hd2;->f:I

    .line 4
    .line 5
    iget v2, v0, Ll/hd2;->g:I

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/wej;->getWidth()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    :cond_0
    if-nez v2, :cond_1

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/wej;->getHeight()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    :cond_1
    iget-object v3, v0, Ll/hd2;->c:Landroid/graphics/Bitmap;

    .line 20
    .line 21
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    if-ge v1, v3, :cond_3

    .line 26
    .line 27
    iget-object v3, v0, Ll/hd2;->c:Landroid/graphics/Bitmap;

    .line 28
    .line 29
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    if-lt v2, v3, :cond_2

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_2
    iget-object v3, v0, Ll/hd2;->c:Landroid/graphics/Bitmap;

    .line 37
    .line 38
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    iget-object v4, v0, Ll/hd2;->c:Landroid/graphics/Bitmap;

    .line 43
    .line 44
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    int-to-double v5, v3

    .line 49
    const-wide v7, 0x3fd999999999999aL    # 0.4

    .line 50
    .line 51
    .line 52
    .line 53
    .line 54
    mul-double v9, v5, v7

    .line 55
    .line 56
    int-to-float v1, v1

    .line 57
    const/high16 v3, 0x3f800000    # 1.0f

    .line 58
    .line 59
    mul-float/2addr v1, v3

    .line 60
    float-to-double v11, v1

    .line 61
    invoke-static {v9, v10, v11, v12}, Ljava/lang/Math;->max(DD)D

    .line 62
    .line 63
    .line 64
    move-result-wide v13

    .line 65
    sub-double/2addr v5, v13

    .line 66
    const-wide/high16 v13, 0x3fe0000000000000L    # 0.5

    .line 67
    .line 68
    mul-double/2addr v5, v13

    .line 69
    double-to-int v1, v5

    .line 70
    int-to-double v4, v4

    .line 71
    mul-double/2addr v7, v4

    .line 72
    int-to-float v2, v2

    .line 73
    mul-float/2addr v2, v3

    .line 74
    float-to-double v2, v2

    .line 75
    invoke-static {v7, v8, v2, v3}, Ljava/lang/Math;->max(DD)D

    .line 76
    .line 77
    .line 78
    move-result-wide v15

    .line 79
    sub-double/2addr v4, v15

    .line 80
    mul-double/2addr v4, v13

    .line 81
    double-to-int v4, v4

    .line 82
    invoke-static {v9, v10, v11, v12}, Ljava/lang/Math;->max(DD)D

    .line 83
    .line 84
    .line 85
    move-result-wide v5

    .line 86
    double-to-int v5, v5

    .line 87
    invoke-static {v7, v8, v2, v3}, Ljava/lang/Math;->max(DD)D

    .line 88
    .line 89
    .line 90
    move-result-wide v2

    .line 91
    double-to-int v2, v2

    .line 92
    iget-object v3, v0, Ll/hd2;->c:Landroid/graphics/Bitmap;

    .line 93
    .line 94
    invoke-static {v3, v1, v4, v5, v2}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    iput-object v1, v0, Ll/hd2;->b:Landroid/graphics/Bitmap;

    .line 99
    .line 100
    return-void

    .line 101
    :cond_3
    :goto_0
    iget-object v1, v0, Ll/hd2;->c:Landroid/graphics/Bitmap;

    .line 102
    .line 103
    invoke-static {v1}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    iput-object v1, v0, Ll/hd2;->b:Landroid/graphics/Bitmap;

    .line 108
    .line 109
    return-void
.end method


# virtual methods
.method public S1(II)V
    .locals 1

    .line 1
    iget v0, p0, Ll/hd2;->f:I

    .line 2
    .line 3
    if-ne v0, p1, :cond_1

    .line 4
    .line 5
    iget v0, p0, Ll/hd2;->g:I

    .line 6
    .line 7
    if-eq v0, p2, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    return-void

    .line 11
    :cond_1
    :goto_0
    iput p1, p0, Ll/hd2;->f:I

    .line 12
    .line 13
    iput p2, p0, Ll/hd2;->g:I

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/wej;->reInitialize()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public handleSizeChange()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/gfj;->handleSizeChange()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/hd2;->a:I

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/wej;->reInitialize()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public initShaderHandles()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/wej;->initShaderHandles()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/hd2;->c:Landroid/graphics/Bitmap;

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-direct {p0}, Ll/hd2;->R1()V

    .line 16
    .line 17
    .line 18
    invoke-direct {p0}, Ll/hd2;->Q1()V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/hd2;->e:[F

    .line 22
    .line 23
    array-length v0, v0

    .line 24
    mul-int/lit8 v0, v0, 0x4

    .line 25
    .line 26
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iput-object v0, p0, Ll/hd2;->d:Ljava/nio/FloatBuffer;

    .line 43
    .line 44
    const/4 v1, 0x0

    .line 45
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Ll/hd2;->d:Ljava/nio/FloatBuffer;

    .line 49
    .line 50
    iget-object v1, p0, Ll/hd2;->e:[F

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Ll/hd2;->b:Landroid/graphics/Bitmap;

    .line 56
    .line 57
    invoke-static {v0}, Lcom/core/glcore/util/TextureHelper;->bitmapToTexture(Landroid/graphics/Bitmap;)I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    iput v0, p0, Ll/hd2;->a:I

    .line 62
    .line 63
    :cond_1
    :goto_0
    return-void
.end method

.method public newTextureReady(ILl/gfj;Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/hd2;->c:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0, p1, p2, p3}, Ll/jt2;->newTextureReady(ILl/gfj;Z)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-virtual {p2}, Ll/wej;->getWidth()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-virtual {p0, v0}, Ll/wej;->setWidth(I)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p2}, Ll/wej;->getHeight()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-virtual {p0, v0}, Ll/wej;->setHeight(I)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ll/gfj;->getLockObject()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    monitor-enter v0

    .line 28
    :try_start_0
    invoke-virtual {p0}, Ll/gfj;->getRenderTargets()Ljava/util/List;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    if-eqz v2, :cond_1

    .line 41
    .line 42
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    check-cast v2, Ll/dfj;

    .line 47
    .line 48
    iget-object v3, p2, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 49
    .line 50
    iput-object v3, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 51
    .line 52
    invoke-interface {v2, p1, p0, p3}, Ll/dfj;->newTextureReady(ILl/gfj;Z)V

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :catchall_0
    move-exception p0

    .line 57
    goto :goto_1

    .line 58
    :cond_1
    monitor-exit v0

    .line 59
    return-void

    .line 60
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 61
    throw p0
.end method

.method public passShaderValues()V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/wej;->renderVertices:Ljava/nio/FloatBuffer;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 5
    .line 6
    .line 7
    iget v2, p0, Ll/wej;->positionHandle:I

    .line 8
    .line 9
    const/16 v6, 0x8

    .line 10
    .line 11
    iget-object v7, p0, Ll/wej;->renderVertices:Ljava/nio/FloatBuffer;

    .line 12
    .line 13
    const/4 v3, 0x2

    .line 14
    const/16 v4, 0x1406

    .line 15
    .line 16
    const/4 v5, 0x0

    .line 17
    invoke-static/range {v2 .. v7}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 18
    .line 19
    .line 20
    iget v0, p0, Ll/wej;->positionHandle:I

    .line 21
    .line 22
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 23
    .line 24
    .line 25
    iget v0, p0, Ll/hd2;->a:I

    .line 26
    .line 27
    const/16 v2, 0xde1

    .line 28
    .line 29
    const v3, 0x84c0

    .line 30
    .line 31
    .line 32
    if-nez v0, :cond_0

    .line 33
    .line 34
    iget-object v0, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 35
    .line 36
    iget v4, p0, Ll/wej;->curRotation:I

    .line 37
    .line 38
    aget-object v0, v0, v4

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 41
    .line 42
    .line 43
    iget v4, p0, Ll/wej;->texCoordHandle:I

    .line 44
    .line 45
    iget-object v0, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 46
    .line 47
    iget v5, p0, Ll/wej;->curRotation:I

    .line 48
    .line 49
    aget-object v9, v0, v5

    .line 50
    .line 51
    const/4 v5, 0x2

    .line 52
    const/16 v6, 0x1406

    .line 53
    .line 54
    const/4 v7, 0x0

    .line 55
    const/16 v8, 0x8

    .line 56
    .line 57
    invoke-static/range {v4 .. v9}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 58
    .line 59
    .line 60
    iget v0, p0, Ll/wej;->texCoordHandle:I

    .line 61
    .line 62
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 63
    .line 64
    .line 65
    invoke-static {v3}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 66
    .line 67
    .line 68
    iget v0, p0, Ll/wej;->texture_in:I

    .line 69
    .line 70
    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 71
    .line 72
    .line 73
    iget p0, p0, Ll/wej;->textureHandle:I

    .line 74
    .line 75
    invoke-static {p0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_0
    iget-object v0, p0, Ll/hd2;->d:Ljava/nio/FloatBuffer;

    .line 80
    .line 81
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 82
    .line 83
    .line 84
    iget v4, p0, Ll/wej;->texCoordHandle:I

    .line 85
    .line 86
    const/16 v8, 0x8

    .line 87
    .line 88
    iget-object v9, p0, Ll/hd2;->d:Ljava/nio/FloatBuffer;

    .line 89
    .line 90
    const/4 v5, 0x2

    .line 91
    const/16 v6, 0x1406

    .line 92
    .line 93
    const/4 v7, 0x0

    .line 94
    invoke-static/range {v4 .. v9}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 95
    .line 96
    .line 97
    iget v0, p0, Ll/wej;->texCoordHandle:I

    .line 98
    .line 99
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 100
    .line 101
    .line 102
    invoke-static {v3}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 103
    .line 104
    .line 105
    iget v0, p0, Ll/hd2;->a:I

    .line 106
    .line 107
    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 108
    .line 109
    .line 110
    iget p0, p0, Ll/wej;->textureHandle:I

    .line 111
    .line 112
    invoke-static {p0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 113
    .line 114
    .line 115
    return-void
.end method
