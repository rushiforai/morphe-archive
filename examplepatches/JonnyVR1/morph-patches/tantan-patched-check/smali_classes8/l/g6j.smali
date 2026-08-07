.class public Ll/g6j;
.super Ll/jt2;
.source "SourceFile"


# instance fields
.field private a:F

.field private b:F

.field protected c:F

.field protected d:F

.field private e:F

.field private f:F

.field protected g:F

.field protected i:F

.field protected j:Ljava/nio/FloatBuffer;

.field protected k:Landroid/graphics/Bitmap;

.field protected l:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/jt2;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x3f800000    # 1.0f

    .line 5
    .line 6
    iput v0, p0, Ll/g6j;->a:F

    .line 7
    .line 8
    iput v0, p0, Ll/g6j;->b:F

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-object v0, p0, Ll/g6j;->j:Ljava/nio/FloatBuffer;

    .line 12
    .line 13
    iput-object v0, p0, Ll/g6j;->k:Landroid/graphics/Bitmap;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-boolean v0, p0, Ll/g6j;->l:Z

    .line 17
    .line 18
    return-void
.end method

.method private Q1()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/g6j;->k:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    int-to-float v0, v0

    .line 10
    iput v0, p0, Ll/g6j;->d:F

    .line 11
    .line 12
    iget-object v0, p0, Ll/g6j;->k:Landroid/graphics/Bitmap;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    int-to-float v0, v0

    .line 19
    iput v0, p0, Ll/g6j;->c:F

    .line 20
    .line 21
    :cond_0
    iget v0, p0, Ll/g6j;->c:F

    .line 22
    .line 23
    const/high16 v1, 0x3f800000    # 1.0f

    .line 24
    .line 25
    mul-float/2addr v0, v1

    .line 26
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    int-to-float v2, v2

    .line 31
    div-float/2addr v0, v2

    .line 32
    iget v2, p0, Ll/g6j;->d:F

    .line 33
    .line 34
    mul-float/2addr v2, v1

    .line 35
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    int-to-float v1, v1

    .line 40
    div-float/2addr v2, v1

    .line 41
    cmpl-float v1, v2, v0

    .line 42
    .line 43
    if-lez v1, :cond_1

    .line 44
    .line 45
    iget v1, p0, Ll/g6j;->d:F

    .line 46
    .line 47
    iget v3, p0, Ll/g6j;->c:F

    .line 48
    .line 49
    div-float/2addr v1, v3

    .line 50
    const v3, 0x3fe38e39

    .line 51
    .line 52
    .line 53
    cmpg-float v1, v1, v3

    .line 54
    .line 55
    if-gez v1, :cond_1

    .line 56
    .line 57
    move v0, v2

    .line 58
    :cond_1
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    int-to-float v1, v1

    .line 63
    mul-float/2addr v1, v0

    .line 64
    iput v1, p0, Ll/g6j;->e:F

    .line 65
    .line 66
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    int-to-float v1, v1

    .line 71
    mul-float/2addr v1, v0

    .line 72
    iput v1, p0, Ll/g6j;->f:F

    .line 73
    .line 74
    return-void
.end method


# virtual methods
.method public declared-synchronized R1(Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iput-object p1, p0, Ll/g6j;->k:Landroid/graphics/Bitmap;

    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Ll/g6j;->l:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 6
    .line 7
    monitor-exit p0

    .line 8
    return-void

    .line 9
    :catchall_0
    move-exception p1

    .line 10
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 11
    throw p1
.end method

.method public declared-synchronized bitmapToTexture(Landroid/graphics/Bitmap;)I
    .locals 5

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x1

    .line 3
    :try_start_0
    new-array v1, v0, [I

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 7
    .line 8
    .line 9
    aget v0, v1, v2

    .line 10
    .line 11
    const/16 v3, 0xde1

    .line 12
    .line 13
    invoke-static {v3, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 14
    .line 15
    .line 16
    const/16 v0, 0x2800

    .line 17
    .line 18
    const v4, 0x46180400    # 9729.0f

    .line 19
    .line 20
    .line 21
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 22
    .line 23
    .line 24
    const/16 v0, 0x2801

    .line 25
    .line 26
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 27
    .line 28
    .line 29
    const/16 v0, 0x2802

    .line 30
    .line 31
    const v4, 0x47012f00    # 33071.0f

    .line 32
    .line 33
    .line 34
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 35
    .line 36
    .line 37
    const/16 v0, 0x2803

    .line 38
    .line 39
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 40
    .line 41
    .line 42
    if-eqz p1, :cond_0

    .line 43
    .line 44
    invoke-static {v3, v2, p1, v2}, Landroid/opengl/GLUtils;->texImage2D(IILandroid/graphics/Bitmap;I)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :catchall_0
    move-exception p1

    .line 49
    goto :goto_1

    .line 50
    :cond_0
    :goto_0
    aget p1, v1, v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 51
    .line 52
    monitor-exit p0

    .line 53
    return p1

    .line 54
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 55
    throw p1
.end method

.method public destroy()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/gfj;->destroy()V

    .line 2
    .line 3
    .line 4
    iget p0, p0, Ll/wej;->texture_in:I

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    filled-new-array {p0}, [I

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const/4 v0, 0x1

    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-static {v0, p0, v1}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision highp float;\nuniform sampler2D inputImageTexture0;\nvarying vec2 textureCoordinate;\nvoid main(){\n    vec2 uv = textureCoordinate;\n    uv.y = 1.0 -uv.y;\n    if (uv.x > 0.0 && uv.x < 1.0        && uv.y > 0.0 && uv.y < 1.0) {    gl_FragColor = texture2D(inputImageTexture0, uv);\n    }}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public handleSizeChange()V
    .locals 9

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    new-array v0, v0, [F

    .line 4
    .line 5
    iget-object v1, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 6
    .line 7
    iget v2, p0, Ll/wej;->curRotation:I

    .line 8
    .line 9
    aget-object v1, v1, v2

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v1, v2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 13
    .line 14
    .line 15
    iget-object v1, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 16
    .line 17
    iget v3, p0, Ll/wej;->curRotation:I

    .line 18
    .line 19
    aget-object v1, v1, v3

    .line 20
    .line 21
    invoke-virtual {v1, v0}, Ljava/nio/FloatBuffer;->get([F)Ljava/nio/FloatBuffer;

    .line 22
    .line 23
    .line 24
    invoke-direct {p0}, Ll/g6j;->Q1()V

    .line 25
    .line 26
    .line 27
    iget v1, p0, Ll/g6j;->e:F

    .line 28
    .line 29
    iget v3, p0, Ll/g6j;->c:F

    .line 30
    .line 31
    div-float/2addr v1, v3

    .line 32
    iput v1, p0, Ll/g6j;->b:F

    .line 33
    .line 34
    iget v3, p0, Ll/g6j;->f:F

    .line 35
    .line 36
    iget v4, p0, Ll/g6j;->d:F

    .line 37
    .line 38
    div-float/2addr v3, v4

    .line 39
    iput v3, p0, Ll/g6j;->a:F

    .line 40
    .line 41
    const/high16 v4, 0x3f800000    # 1.0f

    .line 42
    .line 43
    sub-float v3, v4, v3

    .line 44
    .line 45
    const/high16 v5, 0x40000000    # 2.0f

    .line 46
    .line 47
    div-float/2addr v3, v5

    .line 48
    iput v3, p0, Ll/g6j;->g:F

    .line 49
    .line 50
    sub-float/2addr v4, v1

    .line 51
    div-float/2addr v4, v5

    .line 52
    iput v4, p0, Ll/g6j;->i:F

    .line 53
    .line 54
    const/16 v1, 0x20

    .line 55
    .line 56
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    invoke-virtual {v1, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    iput-object v1, p0, Ll/g6j;->j:Ljava/nio/FloatBuffer;

    .line 73
    .line 74
    move v1, v2

    .line 75
    :goto_0
    const/4 v3, 0x4

    .line 76
    if-ge v1, v3, :cond_2

    .line 77
    .line 78
    mul-int/lit8 v3, v1, 0x2

    .line 79
    .line 80
    aget v4, v0, v3

    .line 81
    .line 82
    float-to-double v5, v4

    .line 83
    const-wide/high16 v7, 0x3fe0000000000000L    # 0.5

    .line 84
    .line 85
    cmpg-double v5, v5, v7

    .line 86
    .line 87
    iget v6, p0, Ll/g6j;->i:F

    .line 88
    .line 89
    if-gtz v5, :cond_0

    .line 90
    .line 91
    add-float/2addr v4, v6

    .line 92
    goto :goto_1

    .line 93
    :cond_0
    sub-float/2addr v4, v6

    .line 94
    :goto_1
    aput v4, v0, v3

    .line 95
    .line 96
    add-int/lit8 v3, v3, 0x1

    .line 97
    .line 98
    aget v4, v0, v3

    .line 99
    .line 100
    float-to-double v5, v4

    .line 101
    cmpg-double v5, v5, v7

    .line 102
    .line 103
    iget v6, p0, Ll/g6j;->g:F

    .line 104
    .line 105
    if-gtz v5, :cond_1

    .line 106
    .line 107
    add-float/2addr v4, v6

    .line 108
    goto :goto_2

    .line 109
    :cond_1
    sub-float/2addr v4, v6

    .line 110
    :goto_2
    aput v4, v0, v3

    .line 111
    .line 112
    add-int/lit8 v1, v1, 0x1

    .line 113
    .line 114
    goto :goto_0

    .line 115
    :cond_2
    iget-object v1, p0, Ll/g6j;->j:Ljava/nio/FloatBuffer;

    .line 116
    .line 117
    invoke-virtual {v1, v2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 118
    .line 119
    .line 120
    iget-object v1, p0, Ll/g6j;->j:Ljava/nio/FloatBuffer;

    .line 121
    .line 122
    invoke-virtual {v1, v0}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 123
    .line 124
    .line 125
    iget-object v0, p0, Ll/g6j;->j:Ljava/nio/FloatBuffer;

    .line 126
    .line 127
    invoke-virtual {v0, v2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 128
    .line 129
    .line 130
    invoke-super {p0}, Ll/gfj;->handleSizeChange()V

    .line 131
    .line 132
    .line 133
    return-void
.end method

.method public newTextureReady(ILl/gfj;Z)V
    .locals 0

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/gfj;->markAsDirty()V

    .line 4
    .line 5
    .line 6
    :cond_0
    invoke-virtual {p2}, Ll/wej;->getWidth()I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    invoke-virtual {p0, p1}, Ll/wej;->setWidth(I)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p2}, Ll/wej;->getHeight()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    invoke-virtual {p0, p1}, Ll/wej;->setHeight(I)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ll/wej;->onDrawFrame()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p2}, Ll/gfj;->unlockRenderBuffer()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public passShaderValues()V
    .locals 8

    .line 1
    iget-boolean v0, p0, Ll/g6j;->l:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    iget-object v0, p0, Ll/g6j;->k:Landroid/graphics/Bitmap;

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    invoke-static {}, Landroid/opengl/GLES20;->glFinish()V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Landroid/opengl/GLES20;->glFinish()V

    .line 14
    .line 15
    .line 16
    iget v0, p0, Ll/wej;->texture_in:I

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    filled-new-array {v0}, [I

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const/4 v2, 0x1

    .line 25
    invoke-static {v2, v0, v1}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 26
    .line 27
    .line 28
    :cond_0
    iget-object v0, p0, Ll/g6j;->k:Landroid/graphics/Bitmap;

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Ll/g6j;->bitmapToTexture(Landroid/graphics/Bitmap;)I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    iput v0, p0, Ll/wej;->texture_in:I

    .line 35
    .line 36
    iput-boolean v1, p0, Ll/g6j;->l:Z

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/g6j;->handleSizeChange()V

    .line 39
    .line 40
    .line 41
    :cond_1
    iget-object v0, p0, Ll/g6j;->k:Landroid/graphics/Bitmap;

    .line 42
    .line 43
    if-nez v0, :cond_2

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/wej;->getBackgroundRed()F

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    invoke-virtual {p0}, Ll/wej;->getBackgroundGreen()F

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    invoke-virtual {p0}, Ll/wej;->getBackgroundBlue()F

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    invoke-virtual {p0}, Ll/wej;->getBackgroundAlpha()F

    .line 58
    .line 59
    .line 60
    move-result v4

    .line 61
    invoke-static {v0, v2, v3, v4}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 62
    .line 63
    .line 64
    const/16 v0, 0x4100

    .line 65
    .line 66
    invoke-static {v0}, Landroid/opengl/GLES20;->glClear(I)V

    .line 67
    .line 68
    .line 69
    :cond_2
    iget-object v0, p0, Ll/g6j;->j:Ljava/nio/FloatBuffer;

    .line 70
    .line 71
    if-eqz v0, :cond_3

    .line 72
    .line 73
    iget-object v0, p0, Ll/wej;->renderVertices:Ljava/nio/FloatBuffer;

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 76
    .line 77
    .line 78
    iget v2, p0, Ll/wej;->positionHandle:I

    .line 79
    .line 80
    const/16 v6, 0x8

    .line 81
    .line 82
    iget-object v7, p0, Ll/wej;->renderVertices:Ljava/nio/FloatBuffer;

    .line 83
    .line 84
    const/4 v3, 0x2

    .line 85
    const/16 v4, 0x1406

    .line 86
    .line 87
    const/4 v5, 0x0

    .line 88
    invoke-static/range {v2 .. v7}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 89
    .line 90
    .line 91
    iget v0, p0, Ll/wej;->positionHandle:I

    .line 92
    .line 93
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Ll/g6j;->j:Ljava/nio/FloatBuffer;

    .line 97
    .line 98
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 99
    .line 100
    .line 101
    iget v2, p0, Ll/wej;->texCoordHandle:I

    .line 102
    .line 103
    iget-object v7, p0, Ll/g6j;->j:Ljava/nio/FloatBuffer;

    .line 104
    .line 105
    invoke-static/range {v2 .. v7}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 106
    .line 107
    .line 108
    iget v0, p0, Ll/wej;->texCoordHandle:I

    .line 109
    .line 110
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 111
    .line 112
    .line 113
    const v0, 0x84c0

    .line 114
    .line 115
    .line 116
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 117
    .line 118
    .line 119
    const/16 v0, 0xde1

    .line 120
    .line 121
    iget v2, p0, Ll/wej;->texture_in:I

    .line 122
    .line 123
    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 124
    .line 125
    .line 126
    iget p0, p0, Ll/wej;->textureHandle:I

    .line 127
    .line 128
    invoke-static {p0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 129
    .line 130
    .line 131
    return-void

    .line 132
    :cond_3
    invoke-super {p0}, Ll/wej;->passShaderValues()V

    .line 133
    .line 134
    .line 135
    return-void
.end method

.method public releaseFrameBuffer()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/gfj;->releaseFrameBuffer()V

    .line 2
    .line 3
    .line 4
    iget p0, p0, Ll/wej;->texture_in:I

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    filled-new-array {p0}, [I

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const/4 v0, 0x1

    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-static {v0, p0, v1}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method
