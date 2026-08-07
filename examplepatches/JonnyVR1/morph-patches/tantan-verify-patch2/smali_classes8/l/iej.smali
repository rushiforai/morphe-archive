.class public Ll/iej;
.super Ll/gfj;
.source "SourceFile"

# interfaces
.implements Ll/dfj;


# instance fields
.field private a:F

.field private b:F

.field private c:F

.field private d:I

.field private e:I

.field private f:[Ljava/nio/FloatBuffer;

.field private g:[F

.field private i:[F

.field private j:[F

.field private k:[F

.field private l:Z

.field private m:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/gfj;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/iej;->d:I

    .line 6
    .line 7
    iput v0, p0, Ll/iej;->e:I

    .line 8
    .line 9
    const v1, 0x3faaaaab

    .line 10
    .line 11
    .line 12
    iput v1, p0, Ll/iej;->a:F

    .line 13
    .line 14
    iput-boolean v0, p0, Ll/iej;->l:Z

    .line 15
    .line 16
    return-void
.end method

.method private R1(FFFF)V
    .locals 11

    .line 1
    iget-boolean v0, p0, Ll/iej;->l:Z

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    const/4 v2, 0x1

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-array v0, v1, [Ljava/nio/FloatBuffer;

    .line 8
    .line 9
    iput-object v0, p0, Ll/iej;->f:[Ljava/nio/FloatBuffer;

    .line 10
    .line 11
    const/16 v0, 0x8

    .line 12
    .line 13
    new-array v3, v0, [F

    .line 14
    .line 15
    iput-object v3, p0, Ll/iej;->g:[F

    .line 16
    .line 17
    new-array v3, v0, [F

    .line 18
    .line 19
    iput-object v3, p0, Ll/iej;->i:[F

    .line 20
    .line 21
    new-array v3, v0, [F

    .line 22
    .line 23
    iput-object v3, p0, Ll/iej;->j:[F

    .line 24
    .line 25
    new-array v0, v0, [F

    .line 26
    .line 27
    iput-object v0, p0, Ll/iej;->k:[F

    .line 28
    .line 29
    iput-boolean v2, p0, Ll/iej;->l:Z

    .line 30
    .line 31
    :cond_0
    iget-boolean v0, p0, Ll/iej;->l:Z

    .line 32
    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    iget-object v0, p0, Ll/iej;->g:[F

    .line 36
    .line 37
    const/4 v3, 0x0

    .line 38
    aput p1, v0, v3

    .line 39
    .line 40
    aput p3, v0, v2

    .line 41
    .line 42
    const/4 v4, 0x2

    .line 43
    aput p2, v0, v4

    .line 44
    .line 45
    const/4 v5, 0x3

    .line 46
    aput p3, v0, v5

    .line 47
    .line 48
    aput p1, v0, v1

    .line 49
    .line 50
    const/4 v6, 0x5

    .line 51
    aput p4, v0, v6

    .line 52
    .line 53
    const/4 v7, 0x6

    .line 54
    aput p2, v0, v7

    .line 55
    .line 56
    const/4 v8, 0x7

    .line 57
    aput p4, v0, v8

    .line 58
    .line 59
    iget-object v9, p0, Ll/iej;->f:[Ljava/nio/FloatBuffer;

    .line 60
    .line 61
    aget-object v10, v9, v3

    .line 62
    .line 63
    invoke-static {v10, v0}, Ll/ch3;->a(Ljava/nio/FloatBuffer;[F)Ljava/nio/FloatBuffer;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    aput-object v0, v9, v3

    .line 68
    .line 69
    iget-object v0, p0, Ll/iej;->i:[F

    .line 70
    .line 71
    aput p1, v0, v3

    .line 72
    .line 73
    aput p4, v0, v2

    .line 74
    .line 75
    aput p1, v0, v4

    .line 76
    .line 77
    aput p3, v0, v5

    .line 78
    .line 79
    aput p2, v0, v1

    .line 80
    .line 81
    aput p4, v0, v6

    .line 82
    .line 83
    aput p2, v0, v7

    .line 84
    .line 85
    aput p3, v0, v8

    .line 86
    .line 87
    iget-object v9, p0, Ll/iej;->f:[Ljava/nio/FloatBuffer;

    .line 88
    .line 89
    aget-object v10, v9, v2

    .line 90
    .line 91
    invoke-static {v10, v0}, Ll/ch3;->a(Ljava/nio/FloatBuffer;[F)Ljava/nio/FloatBuffer;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    aput-object v0, v9, v2

    .line 96
    .line 97
    iget-object v0, p0, Ll/iej;->j:[F

    .line 98
    .line 99
    aput p2, v0, v3

    .line 100
    .line 101
    aput p4, v0, v2

    .line 102
    .line 103
    aput p1, v0, v4

    .line 104
    .line 105
    aput p4, v0, v5

    .line 106
    .line 107
    aput p2, v0, v1

    .line 108
    .line 109
    aput p3, v0, v6

    .line 110
    .line 111
    aput p1, v0, v7

    .line 112
    .line 113
    aput p3, v0, v8

    .line 114
    .line 115
    iget-object v9, p0, Ll/iej;->f:[Ljava/nio/FloatBuffer;

    .line 116
    .line 117
    aget-object v10, v9, v4

    .line 118
    .line 119
    invoke-static {v10, v0}, Ll/ch3;->a(Ljava/nio/FloatBuffer;[F)Ljava/nio/FloatBuffer;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    aput-object v0, v9, v4

    .line 124
    .line 125
    iget-object v0, p0, Ll/iej;->k:[F

    .line 126
    .line 127
    aput p2, v0, v3

    .line 128
    .line 129
    aput p3, v0, v2

    .line 130
    .line 131
    aput p2, v0, v4

    .line 132
    .line 133
    aput p4, v0, v5

    .line 134
    .line 135
    aput p1, v0, v1

    .line 136
    .line 137
    aput p3, v0, v6

    .line 138
    .line 139
    aput p1, v0, v7

    .line 140
    .line 141
    aput p4, v0, v8

    .line 142
    .line 143
    iget-object p0, p0, Ll/iej;->f:[Ljava/nio/FloatBuffer;

    .line 144
    .line 145
    aget-object p1, p0, v5

    .line 146
    .line 147
    invoke-static {p1, v0}, Ll/ch3;->a(Ljava/nio/FloatBuffer;[F)Ljava/nio/FloatBuffer;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    aput-object p1, p0, v5

    .line 152
    .line 153
    :cond_1
    return-void
.end method

.method private drawIndeed()V
    .locals 5

    .line 1
    iget v0, p0, Ll/wej;->texture_in:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget v0, p0, Ll/iej;->d:I

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget v0, p0, Ll/iej;->e:I

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    int-to-float v0, v0

    .line 20
    const/high16 v2, 0x3f800000    # 1.0f

    .line 21
    .line 22
    mul-float/2addr v0, v2

    .line 23
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    int-to-float v2, v2

    .line 28
    div-float/2addr v0, v2

    .line 29
    iget v2, p0, Ll/iej;->a:F

    .line 30
    .line 31
    cmpl-float v0, v0, v2

    .line 32
    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 36
    .line 37
    .line 38
    iget v0, p0, Ll/iej;->c:F

    .line 39
    .line 40
    float-to-int v0, v0

    .line 41
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    sub-int/2addr v0, v2

    .line 46
    div-int/lit8 v0, v0, 0x2

    .line 47
    .line 48
    iget v2, p0, Ll/iej;->b:F

    .line 49
    .line 50
    float-to-int v2, v2

    .line 51
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    sub-int/2addr v2, v3

    .line 56
    div-int/lit8 v2, v2, 0x2

    .line 57
    .line 58
    neg-int v2, v2

    .line 59
    neg-int v0, v0

    .line 60
    iget v3, p0, Ll/iej;->b:F

    .line 61
    .line 62
    float-to-int v3, v3

    .line 63
    iget v4, p0, Ll/iej;->c:F

    .line 64
    .line 65
    float-to-int v4, v4

    .line 66
    invoke-static {v2, v0, v3, v4}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_1
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    invoke-static {v1, v1, v0, v2}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 79
    .line 80
    .line 81
    :goto_0
    iget v0, p0, Ll/wej;->programHandle:I

    .line 82
    .line 83
    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0}, Ll/wej;->getBackgroundRed()F

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    invoke-virtual {p0}, Ll/wej;->getBackgroundGreen()F

    .line 91
    .line 92
    .line 93
    move-result v2

    .line 94
    invoke-virtual {p0}, Ll/wej;->getBackgroundBlue()F

    .line 95
    .line 96
    .line 97
    move-result v3

    .line 98
    invoke-virtual {p0}, Ll/wej;->getBackgroundAlpha()F

    .line 99
    .line 100
    .line 101
    move-result v4

    .line 102
    invoke-static {v0, v2, v3, v4}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 103
    .line 104
    .line 105
    const/16 v0, 0x4100

    .line 106
    .line 107
    invoke-static {v0}, Landroid/opengl/GLES20;->glClear(I)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p0}, Ll/iej;->passShaderValues()V

    .line 111
    .line 112
    .line 113
    const/4 p0, 0x5

    .line 114
    const/4 v0, 0x4

    .line 115
    invoke-static {p0, v1, v0}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 116
    .line 117
    .line 118
    return-void
.end method


# virtual methods
.method public Q1(II)V
    .locals 0

    .line 1
    iput p1, p0, Ll/iej;->d:I

    .line 2
    .line 3
    iput p2, p0, Ll/iej;->e:I

    .line 4
    .line 5
    return-void
.end method

.method public drawFrame()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/iej;->initFBO()V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object v0, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 21
    .line 22
    if-eqz v0, :cond_2

    .line 23
    .line 24
    invoke-virtual {v0}, Ll/lej;->h()[I

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    if-nez v0, :cond_2

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    invoke-virtual {p0}, Ll/iej;->initFBO()V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    return-void

    .line 47
    :cond_2
    :goto_0
    iget-boolean v0, p0, Ll/gfj;->dirty:Z

    .line 48
    .line 49
    const/4 v1, 0x0

    .line 50
    if-eqz v0, :cond_3

    .line 51
    .line 52
    iget-object v0, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 53
    .line 54
    invoke-virtual {v0}, Ll/lej;->h()[I

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    aget v0, v0, v1

    .line 59
    .line 60
    const v2, 0x8d40

    .line 61
    .line 62
    .line 63
    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 64
    .line 65
    .line 66
    invoke-direct {p0}, Ll/iej;->drawIndeed()V

    .line 67
    .line 68
    .line 69
    invoke-static {v2, v1}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 70
    .line 71
    .line 72
    const/4 v0, 0x1

    .line 73
    goto :goto_1

    .line 74
    :cond_3
    move v0, v1

    .line 75
    :goto_1
    iget-object v2, p0, Ll/gfj;->listLock:Ljava/lang/Object;

    .line 76
    .line 77
    monitor-enter v2

    .line 78
    :try_start_0
    iget-object v3, p0, Ll/gfj;->targets:Ljava/util/List;

    .line 79
    .line 80
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 81
    .line 82
    .line 83
    move-result-object v3

    .line 84
    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 85
    .line 86
    .line 87
    move-result v4

    .line 88
    if-eqz v4, :cond_4

    .line 89
    .line 90
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v4

    .line 94
    check-cast v4, Ll/dfj;

    .line 95
    .line 96
    iget-object v5, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 97
    .line 98
    invoke-virtual {v5}, Ll/lej;->i()[I

    .line 99
    .line 100
    .line 101
    move-result-object v5

    .line 102
    aget v5, v5, v1

    .line 103
    .line 104
    invoke-interface {v4, v5, p0, v0}, Ll/dfj;->newTextureReady(ILl/gfj;Z)V

    .line 105
    .line 106
    .line 107
    goto :goto_2

    .line 108
    :catchall_0
    move-exception p0

    .line 109
    goto :goto_3

    .line 110
    :cond_4
    monitor-exit v2

    .line 111
    return-void

    .line 112
    :goto_3
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 113
    throw p0
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nvarying vec2 textureCoordinate;\nvarying float right_edge; \nvoid main(){\nif (textureCoordinate.x < right_edge) \ngl_FragColor = texture2D(inputImageTexture0,textureCoordinate);\nelse {\nvec2 xy = vec2(textureCoordinate.x-(1.0-right_edge), textureCoordinate.y); \ngl_FragColor = texture2D(inputImageTexture0,xy);\n} \n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public getVertexShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "attribute vec4 position;\nattribute vec2 inputTextureCoordinate;\nvarying vec2 textureCoordinate;\nuniform float rightEdge; \nvarying float right_edge; \nvoid main() {\nright_edge = rightEdge; \n  textureCoordinate = inputTextureCoordinate;\n   gl_Position = position;\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public initFBO()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/lej;->e()V

    .line 6
    .line 7
    .line 8
    :cond_0
    new-instance v0, Ll/lej;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    invoke-direct {v0, v1, v2}, Ll/lej;-><init>(II)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    invoke-virtual {v0, v1, v2}, Ll/lej;->b(II)V

    .line 32
    .line 33
    .line 34
    const v0, 0x8d40

    .line 35
    .line 36
    .line 37
    invoke-static {v0}, Landroid/opengl/GLES20;->glCheckFramebufferStatus(I)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    const v1, 0x8cd5

    .line 42
    .line 43
    .line 44
    if-ne v0, v1, :cond_1

    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    invoke-static {v1, v0, p0}, Ll/muf;->a(Ljava/lang/StringBuilder;II)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public initShaderHandles()V
    .locals 2

    .line 1
    iget v0, p0, Ll/wej;->programHandle:I

    .line 2
    .line 3
    const-string v1, "inputImageTexture0"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iput v0, p0, Ll/wej;->textureHandle:I

    .line 10
    .line 11
    iget v0, p0, Ll/wej;->programHandle:I

    .line 12
    .line 13
    const-string v1, "position"

    .line 14
    .line 15
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iput v0, p0, Ll/wej;->positionHandle:I

    .line 20
    .line 21
    iget v0, p0, Ll/wej;->programHandle:I

    .line 22
    .line 23
    const-string v1, "inputTextureCoordinate"

    .line 24
    .line 25
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iput v0, p0, Ll/wej;->texCoordHandle:I

    .line 30
    .line 31
    iget v0, p0, Ll/wej;->programHandle:I

    .line 32
    .line 33
    const-string v1, "rightEdge"

    .line 34
    .line 35
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    iput v0, p0, Ll/iej;->m:I

    .line 40
    .line 41
    return-void
.end method

.method public initWithGLContext()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/wej;->initWithGLContext()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public newTextureReady(ILl/gfj;Z)V
    .locals 1

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/gfj;->markAsDirty()V

    .line 4
    .line 5
    .line 6
    :cond_0
    iput p1, p0, Ll/wej;->texture_in:I

    .line 7
    .line 8
    invoke-virtual {p2}, Ll/wej;->getWidth()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    int-to-float p1, p1

    .line 13
    iput p1, p0, Ll/iej;->b:F

    .line 14
    .line 15
    invoke-virtual {p2}, Ll/wej;->getHeight()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    int-to-float p1, p1

    .line 20
    iput p1, p0, Ll/iej;->c:F

    .line 21
    .line 22
    iget p3, p0, Ll/iej;->b:F

    .line 23
    .line 24
    const/high16 v0, 0x3f800000    # 1.0f

    .line 25
    .line 26
    mul-float/2addr p3, v0

    .line 27
    div-float/2addr p1, p3

    .line 28
    iput p1, p0, Ll/iej;->a:F

    .line 29
    .line 30
    invoke-virtual {p2}, Ll/wej;->getWidth()I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    invoke-virtual {p0, p1}, Ll/wej;->setWidth(I)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p2}, Ll/wej;->getHeight()I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    invoke-virtual {p0, p1}, Ll/wej;->setHeight(I)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Ll/wej;->onDrawFrame()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p2}, Ll/gfj;->unlockRenderBuffer()V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public passShaderValues()V
    .locals 8

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
    iget v0, p0, Ll/iej;->d:I

    .line 26
    .line 27
    const/high16 v2, 0x3f800000    # 1.0f

    .line 28
    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    iget v0, p0, Ll/iej;->e:I

    .line 32
    .line 33
    if-nez v0, :cond_0

    .line 34
    .line 35
    iget v0, p0, Ll/iej;->m:I

    .line 36
    .line 37
    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 41
    .line 42
    iget v2, p0, Ll/wej;->curRotation:I

    .line 43
    .line 44
    aget-object v0, v0, v2

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 47
    .line 48
    .line 49
    iget v2, p0, Ll/wej;->texCoordHandle:I

    .line 50
    .line 51
    iget-object v0, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 52
    .line 53
    iget v3, p0, Ll/wej;->curRotation:I

    .line 54
    .line 55
    aget-object v7, v0, v3

    .line 56
    .line 57
    const/4 v3, 0x2

    .line 58
    const/16 v4, 0x1406

    .line 59
    .line 60
    const/4 v5, 0x0

    .line 61
    const/16 v6, 0x8

    .line 62
    .line 63
    invoke-static/range {v2 .. v7}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 64
    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_0
    iget v0, p0, Ll/iej;->m:I

    .line 68
    .line 69
    iget v3, p0, Ll/iej;->b:F

    .line 70
    .line 71
    div-float v3, v2, v3

    .line 72
    .line 73
    sub-float v3, v2, v3

    .line 74
    .line 75
    invoke-static {v0, v3}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 76
    .line 77
    .line 78
    iget v0, p0, Ll/iej;->d:I

    .line 79
    .line 80
    int-to-float v0, v0

    .line 81
    mul-float/2addr v0, v2

    .line 82
    iget v3, p0, Ll/iej;->c:F

    .line 83
    .line 84
    div-float/2addr v0, v3

    .line 85
    iget v4, p0, Ll/iej;->e:I

    .line 86
    .line 87
    int-to-float v4, v4

    .line 88
    mul-float/2addr v4, v2

    .line 89
    div-float/2addr v4, v3

    .line 90
    const/4 v3, 0x0

    .line 91
    invoke-direct {p0, v3, v2, v0, v4}, Ll/iej;->R1(FFFF)V

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Ll/iej;->f:[Ljava/nio/FloatBuffer;

    .line 95
    .line 96
    iget v2, p0, Ll/wej;->curRotation:I

    .line 97
    .line 98
    aget-object v0, v0, v2

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 101
    .line 102
    .line 103
    iget v2, p0, Ll/wej;->texCoordHandle:I

    .line 104
    .line 105
    iget-object v0, p0, Ll/iej;->f:[Ljava/nio/FloatBuffer;

    .line 106
    .line 107
    iget v3, p0, Ll/wej;->curRotation:I

    .line 108
    .line 109
    aget-object v7, v0, v3

    .line 110
    .line 111
    const/4 v3, 0x2

    .line 112
    const/16 v4, 0x1406

    .line 113
    .line 114
    const/4 v5, 0x0

    .line 115
    const/16 v6, 0x8

    .line 116
    .line 117
    invoke-static/range {v2 .. v7}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 118
    .line 119
    .line 120
    :goto_0
    iget v0, p0, Ll/wej;->texCoordHandle:I

    .line 121
    .line 122
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 123
    .line 124
    .line 125
    const v0, 0x84c0

    .line 126
    .line 127
    .line 128
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 129
    .line 130
    .line 131
    const/16 v0, 0xde1

    .line 132
    .line 133
    iget v2, p0, Ll/wej;->texture_in:I

    .line 134
    .line 135
    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 136
    .line 137
    .line 138
    iget p0, p0, Ll/wej;->textureHandle:I

    .line 139
    .line 140
    invoke-static {p0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 141
    .line 142
    .line 143
    return-void
.end method
