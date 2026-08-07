.class public Ll/o5g0;
.super Ll/puf;
.source "SourceFile"

# interfaces
.implements Ll/ham;


# instance fields
.field protected final D:[F

.field private final E:[S

.field protected F:Ljava/lang/Object;

.field G:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "[F>;"
        }
    .end annotation
.end field

.field protected H:Ll/w4g0;

.field private I:Ljava/nio/FloatBuffer;

.field private J:Ljava/nio/FloatBuffer;

.field private K:Ljava/nio/ShortBuffer;

.field private L:I

.field private M:I

.field protected N:I

.field private O:Z

.field private P:Z

.field private Q:Z

.field private R:Ljava/lang/String;


# virtual methods
.method public F()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/xej;->r()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Ll/xej;->n()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-static {v2, v2, v0, v1}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 11
    .line 12
    .line 13
    iget v0, p0, Ll/xej;->d:I

    .line 14
    .line 15
    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 16
    .line 17
    .line 18
    const/16 v0, 0x4100

    .line 19
    .line 20
    invoke-static {v0}, Landroid/opengl/GLES20;->glClear(I)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ll/xej;->l()F

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    invoke-virtual {p0}, Ll/xej;->k()F

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    invoke-virtual {p0}, Ll/xej;->j()F

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    invoke-virtual {p0}, Ll/xej;->i()F

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    invoke-static {v0, v1, v2, v3}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Ll/o5g0;->F:Ljava/lang/Object;

    .line 43
    .line 44
    monitor-enter v0

    .line 45
    :try_start_0
    iget-object v1, p0, Ll/o5g0;->G:Ljava/util/List;

    .line 46
    .line 47
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-eqz v2, :cond_0

    .line 56
    .line 57
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    check-cast v2, [F

    .line 62
    .line 63
    invoke-virtual {p0, v2}, Ll/o5g0;->T([F)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0}, Ll/o5g0;->R()V

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :catchall_0
    move-exception p0

    .line 71
    goto :goto_1

    .line 72
    :cond_0
    monitor-exit v0

    .line 73
    return-void

    .line 74
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 75
    throw p0
.end method

.method public O()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/hfj;->I()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    monitor-enter v0

    .line 6
    const/4 v1, 0x0

    .line 7
    :try_start_0
    iput-boolean v1, p0, Ll/o5g0;->O:Z

    .line 8
    .line 9
    iput-boolean v1, p0, Ll/o5g0;->Q:Z

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    throw p0

    .line 13
    :catchall_0
    move-exception p0

    .line 14
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    throw p0
.end method

.method public P()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/o5g0;->F:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Ll/o5g0;->G:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 7
    .line 8
    .line 9
    monitor-exit v0

    .line 10
    return-void

    .line 11
    :catchall_0
    move-exception p0

    .line 12
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    throw p0
.end method

.method public Q()V
    .locals 3

    .line 1
    iget v0, p0, Ll/xej;->h:I

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    filled-new-array {v0}, [I

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x1

    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 12
    .line 13
    .line 14
    iput v2, p0, Ll/xej;->h:I

    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public R()V
    .locals 4

    .line 1
    iget v0, p0, Ll/o5g0;->L:I

    .line 2
    .line 3
    iget-object v1, p0, Ll/o5g0;->H:Ll/w4g0;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/w4g0;->b()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    int-to-float v1, v1

    .line 10
    iget-object v2, p0, Ll/o5g0;->H:Ll/w4g0;

    .line 11
    .line 12
    invoke-virtual {v2}, Ll/w4g0;->c()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    int-to-float v2, v2

    .line 17
    div-float/2addr v1, v2

    .line 18
    const/high16 v2, 0x3f800000    # 1.0f

    .line 19
    .line 20
    invoke-static {v0, v2, v1}, Landroid/opengl/GLES20;->glUniform2f(IFF)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/o5g0;->E:[S

    .line 24
    .line 25
    array-length v0, v0

    .line 26
    const/16 v1, 0x1403

    .line 27
    .line 28
    iget-object v2, p0, Ll/o5g0;->K:Ljava/nio/ShortBuffer;

    .line 29
    .line 30
    const/4 v3, 0x4

    .line 31
    invoke-static {v3, v0, v1, v2}, Landroid/opengl/GLES20;->glDrawElements(IIILjava/nio/Buffer;)V

    .line 32
    .line 33
    .line 34
    iget p0, p0, Ll/xej;->f:I

    .line 35
    .line 36
    invoke-static {p0}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public S()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o5g0;->R:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public T([F)V
    .locals 14

    .line 1
    iget-object v0, p0, Ll/xej;->b:Ljava/nio/FloatBuffer;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 5
    .line 6
    .line 7
    array-length v0, p1

    .line 8
    mul-int/lit8 v0, v0, 0x4

    .line 9
    .line 10
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iput-object v0, p0, Ll/o5g0;->J:Ljava/nio/FloatBuffer;

    .line 26
    .line 27
    invoke-virtual {v0, p1}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Ll/o5g0;->J:Ljava/nio/FloatBuffer;

    .line 31
    .line 32
    invoke-virtual {p1, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 33
    .line 34
    .line 35
    iget v2, p0, Ll/xej;->f:I

    .line 36
    .line 37
    const/16 v6, 0x8

    .line 38
    .line 39
    iget-object v7, p0, Ll/o5g0;->J:Ljava/nio/FloatBuffer;

    .line 40
    .line 41
    const/4 v3, 0x2

    .line 42
    const/16 v4, 0x1406

    .line 43
    .line 44
    const/4 v5, 0x0

    .line 45
    invoke-static/range {v2 .. v7}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 46
    .line 47
    .line 48
    iget v8, p0, Ll/o5g0;->N:I

    .line 49
    .line 50
    const/16 v12, 0x8

    .line 51
    .line 52
    iget-object v13, p0, Ll/o5g0;->I:Ljava/nio/FloatBuffer;

    .line 53
    .line 54
    const/4 v9, 0x2

    .line 55
    const/16 v10, 0x1406

    .line 56
    .line 57
    const/4 v11, 0x0

    .line 58
    invoke-static/range {v8 .. v13}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 59
    .line 60
    .line 61
    iget p1, p0, Ll/xej;->f:I

    .line 62
    .line 63
    invoke-static {p1}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 64
    .line 65
    .line 66
    iget p1, p0, Ll/o5g0;->N:I

    .line 67
    .line 68
    invoke-static {p1}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 69
    .line 70
    .line 71
    iget-object p1, p0, Ll/xej;->c:[Ljava/nio/FloatBuffer;

    .line 72
    .line 73
    iget v0, p0, Ll/xej;->a:I

    .line 74
    .line 75
    aget-object p1, p1, v0

    .line 76
    .line 77
    invoke-virtual {p1, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 78
    .line 79
    .line 80
    iget v2, p0, Ll/xej;->g:I

    .line 81
    .line 82
    iget-object p1, p0, Ll/xej;->c:[Ljava/nio/FloatBuffer;

    .line 83
    .line 84
    iget v0, p0, Ll/xej;->a:I

    .line 85
    .line 86
    aget-object v7, p1, v0

    .line 87
    .line 88
    invoke-static/range {v2 .. v7}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 89
    .line 90
    .line 91
    iget p1, p0, Ll/xej;->g:I

    .line 92
    .line 93
    invoke-static {p1}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 94
    .line 95
    .line 96
    const p1, 0x84c0

    .line 97
    .line 98
    .line 99
    invoke-static {p1}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 100
    .line 101
    .line 102
    const/16 p1, 0xde1

    .line 103
    .line 104
    iget v0, p0, Ll/xej;->h:I

    .line 105
    .line 106
    invoke-static {p1, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 107
    .line 108
    .line 109
    iget p0, p0, Ll/xej;->e:I

    .line 110
    .line 111
    invoke-static {p0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 112
    .line 113
    .line 114
    return-void
.end method

.method public c(ILl/hfj;Z)V
    .locals 8

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/hfj;->L()V

    .line 4
    .line 5
    .line 6
    :cond_0
    iget-boolean p1, p0, Ll/o5g0;->P:Z

    .line 7
    .line 8
    const/4 p3, 0x1

    .line 9
    if-eqz p1, :cond_1

    .line 10
    .line 11
    iget p1, p0, Ll/xej;->h:I

    .line 12
    .line 13
    if-lez p1, :cond_1

    .line 14
    .line 15
    iget-object p1, p0, Ll/o5g0;->G:Ljava/util/List;

    .line 16
    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-lez p1, :cond_1

    .line 24
    .line 25
    iput-boolean p3, p0, Ll/o5g0;->O:Z

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_1
    iget-object p1, p0, Ll/o5g0;->G:Ljava/util/List;

    .line 29
    .line 30
    if-eqz p1, :cond_5

    .line 31
    .line 32
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-lez p1, :cond_5

    .line 37
    .line 38
    iget-boolean p1, p0, Ll/o5g0;->O:Z

    .line 39
    .line 40
    if-nez p1, :cond_2

    .line 41
    .line 42
    invoke-virtual {p0}, Ll/o5g0;->P()V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    iget-boolean p1, p0, Ll/o5g0;->Q:Z

    .line 47
    .line 48
    if-nez p1, :cond_4

    .line 49
    .line 50
    invoke-virtual {p0}, Ll/o5g0;->Q()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0}, Ll/o5g0;->P()V

    .line 54
    .line 55
    .line 56
    :goto_0
    iget p1, p0, Ll/xej;->h:I

    .line 57
    .line 58
    if-nez p1, :cond_3

    .line 59
    .line 60
    invoke-virtual {p0}, Ll/o5g0;->P()V

    .line 61
    .line 62
    .line 63
    :cond_3
    iput-boolean p3, p0, Ll/o5g0;->O:Z

    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_4
    const/4 p0, 0x0

    .line 67
    throw p0

    .line 68
    :cond_5
    const/4 p1, 0x0

    .line 69
    iput-boolean p1, p0, Ll/o5g0;->O:Z

    .line 70
    .line 71
    :goto_1
    invoke-virtual {p2}, Ll/xej;->r()I

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    invoke-virtual {p0, p1}, Ll/xej;->B(I)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p2}, Ll/xej;->n()I

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    invoke-virtual {p0, p1}, Ll/xej;->y(I)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0}, Ll/xej;->r()I

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    int-to-float p1, p1

    .line 90
    invoke-virtual {p0}, Ll/xej;->n()I

    .line 91
    .line 92
    .line 93
    move-result p3

    .line 94
    int-to-float p3, p3

    .line 95
    div-float/2addr p1, p3

    .line 96
    iget-object v0, p0, Ll/o5g0;->D:[F

    .line 97
    .line 98
    const/high16 p3, -0x40800000    # -1.0f

    .line 99
    .line 100
    div-float v4, p3, p1

    .line 101
    .line 102
    const/high16 p3, 0x3f800000    # 1.0f

    .line 103
    .line 104
    div-float v5, p3, p1

    .line 105
    .line 106
    const/high16 v6, 0x40400000    # 3.0f

    .line 107
    .line 108
    const/high16 v7, 0x40e00000    # 7.0f

    .line 109
    .line 110
    const/4 v1, 0x0

    .line 111
    const/high16 v2, -0x40800000    # -1.0f

    .line 112
    .line 113
    const/high16 v3, 0x3f800000    # 1.0f

    .line 114
    .line 115
    invoke-static/range {v0 .. v7}, Landroid/opengl/Matrix;->orthoM([FIFFFFFF)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {p0}, Ll/xej;->v()V

    .line 119
    .line 120
    .line 121
    invoke-virtual {p2}, Ll/hfj;->N()V

    .line 122
    .line 123
    .line 124
    return-void
.end method

.method public d(Lcom/immomo/components/interfaces/IProcessOutput;)V
    .locals 0

    .line 1
    return-void
.end method

.method public e()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/xej;->e()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/xej;->d:I

    .line 5
    .line 6
    const/4 v1, 0x2

    .line 7
    const-string v2, "uMVPMatrix"

    .line 8
    .line 9
    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glBindAttribLocation(IILjava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget p0, p0, Ll/xej;->d:I

    .line 13
    .line 14
    const/4 v0, 0x3

    .line 15
    const-string v1, "decorationSize"

    .line 16
    .line 17
    invoke-static {p0, v0, v1}, Landroid/opengl/GLES20;->glBindAttribLocation(IILjava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public f()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/hfj;->f()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/o5g0;->Q()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public m()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;uniform sampler2D inputImageTexture;varying vec2 textureCoordinate;\nvoid main() {   vec4 color1  = texture2D(inputImageTexture,textureCoordinate);\n   gl_FragColor = color1;\n}"

    .line 2
    .line 3
    return-object p0
.end method

.method public o()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "uniform mat4 uMVPMatrix;attribute vec4 position;\nattribute vec4   position2 ; attribute vec4 inputTextureCoordinate;\nvarying vec2 textureCoordinate;\nuniform vec2 decorationSize;\nvoid main() {  gl_Position = position;   vec2 coord = position2.xy;  coord = (coord) / decorationSize;\n  textureCoordinate = vec2(1.0 - (coord.x + 0.5),1.0-(coord.y + 0.5));\n}"

    .line 2
    .line 3
    return-object p0
.end method

.method public setTimeStamp(J)V
    .locals 0

    .line 1
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/xej;->t()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/xej;->d:I

    .line 5
    .line 6
    const-string v1, "position2"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Ll/o5g0;->N:I

    .line 13
    .line 14
    iget v0, p0, Ll/xej;->d:I

    .line 15
    .line 16
    const-string v1, "uMVPMatrix"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Ll/o5g0;->M:I

    .line 23
    .line 24
    iget v0, p0, Ll/xej;->d:I

    .line 25
    .line 26
    const-string v1, "decorationSize"

    .line 27
    .line 28
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iput v0, p0, Ll/o5g0;->L:I

    .line 33
    .line 34
    return-void
.end method
