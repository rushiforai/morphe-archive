.class public Ll/lqi0;
.super Ll/kt2;
.source "SourceFile"

# interfaces
.implements Ll/gzc0;


# instance fields
.field D:Ll/uje;

.field E:Ll/uje;

.field private F:F

.field private G:F

.field private H:F

.field private I:F

.field private J:F

.field private K:F

.field private L:Z

.field private M:Ljava/nio/FloatBuffer;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/kt2;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x3f800000    # 1.0f

    .line 5
    .line 6
    iput v0, p0, Ll/lqi0;->F:F

    .line 7
    .line 8
    iput v0, p0, Ll/lqi0;->G:F

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    iput-boolean v0, p0, Ll/lqi0;->L:Z

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput-object v0, p0, Ll/lqi0;->M:Ljava/nio/FloatBuffer;

    .line 15
    .line 16
    return-void
.end method

.method private P()V
    .locals 3

    .line 1
    iget v0, p0, Ll/lqi0;->H:F

    .line 2
    .line 3
    const/high16 v1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    mul-float/2addr v0, v1

    .line 6
    invoke-virtual {p0}, Ll/xej;->r()I

    .line 7
    .line 8
    .line 9
    move-result v2

    .line 10
    int-to-float v2, v2

    .line 11
    div-float/2addr v0, v2

    .line 12
    iget v2, p0, Ll/lqi0;->I:F

    .line 13
    .line 14
    mul-float/2addr v2, v1

    .line 15
    invoke-virtual {p0}, Ll/xej;->n()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    int-to-float v1, v1

    .line 20
    div-float/2addr v2, v1

    .line 21
    cmpg-float v1, v0, v2

    .line 22
    .line 23
    if-gez v1, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    move v0, v2

    .line 27
    :goto_0
    invoke-virtual {p0}, Ll/xej;->r()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    int-to-float v1, v1

    .line 32
    mul-float/2addr v1, v0

    .line 33
    iput v1, p0, Ll/lqi0;->J:F

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/xej;->n()I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    int-to-float v1, v1

    .line 40
    mul-float/2addr v1, v0

    .line 41
    iput v1, p0, Ll/lqi0;->K:F

    .line 42
    .line 43
    return-void
.end method


# virtual methods
.method public O()V
    .locals 0

    .line 1
    return-void
.end method

.method public Q(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/lqi0;->L:Z

    .line 2
    .line 3
    return-void
.end method

.method public a(Ll/uje;Ll/uje;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Ll/lqi0;->D:Ll/uje;

    .line 4
    .line 5
    :cond_0
    if-eqz p2, :cond_1

    .line 6
    .line 7
    iput-object p2, p0, Ll/lqi0;->E:Ll/uje;

    .line 8
    .line 9
    :cond_1
    return-void
.end method

.method public c(ILl/hfj;Z)V
    .locals 3

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/hfj;->L()V

    .line 4
    .line 5
    .line 6
    :cond_0
    iput p1, p0, Ll/xej;->h:I

    .line 7
    .line 8
    invoke-virtual {p2}, Ll/xej;->r()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    invoke-virtual {p0, p1}, Ll/xej;->B(I)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p2}, Ll/xej;->n()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    invoke-virtual {p0, p1}, Ll/xej;->y(I)V

    .line 20
    .line 21
    .line 22
    iget p1, p0, Ll/xej;->a:I

    .line 23
    .line 24
    rem-int/lit8 p1, p1, 0x2

    .line 25
    .line 26
    const/4 p3, 0x1

    .line 27
    if-ne p1, p3, :cond_1

    .line 28
    .line 29
    invoke-virtual {p2}, Ll/xej;->n()I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    invoke-virtual {p2}, Ll/xej;->r()I

    .line 34
    .line 35
    .line 36
    move-result p3

    .line 37
    goto :goto_0

    .line 38
    :cond_1
    invoke-virtual {p2}, Ll/xej;->r()I

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    invoke-virtual {p2}, Ll/xej;->n()I

    .line 43
    .line 44
    .line 45
    move-result p3

    .line 46
    :goto_0
    iget v0, p0, Ll/lqi0;->H:F

    .line 47
    .line 48
    iget v1, p0, Ll/lqi0;->I:F

    .line 49
    .line 50
    int-to-float v2, p1

    .line 51
    iput v2, p0, Ll/lqi0;->H:F

    .line 52
    .line 53
    int-to-float v2, p3

    .line 54
    iput v2, p0, Ll/lqi0;->I:F

    .line 55
    .line 56
    const/4 v2, 0x0

    .line 57
    cmpl-float v2, v0, v2

    .line 58
    .line 59
    if-eqz v2, :cond_3

    .line 60
    .line 61
    float-to-int v0, v0

    .line 62
    if-ne v0, p1, :cond_2

    .line 63
    .line 64
    float-to-int p1, v1

    .line 65
    if-eq p1, p3, :cond_3

    .line 66
    .line 67
    :cond_2
    invoke-virtual {p0}, Ll/lqi0;->s()V

    .line 68
    .line 69
    .line 70
    :cond_3
    invoke-virtual {p0}, Ll/xej;->v()V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p2}, Ll/hfj;->N()V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public h()V
    .locals 5

    .line 1
    iget v0, p0, Ll/xej;->h:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-static {}, Landroid/opengl/GLES20;->glFinish()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/lqi0;->D:Ll/uje;

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/uje;->f()Z

    .line 14
    .line 15
    .line 16
    :cond_1
    const v0, 0x8d40

    .line 17
    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ll/xej;->r()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    invoke-virtual {p0}, Ll/xej;->n()I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    invoke-static {v1, v1, v0, v2}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 32
    .line 33
    .line 34
    iget v0, p0, Ll/xej;->d:I

    .line 35
    .line 36
    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Ll/xej;->l()F

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    invoke-virtual {p0}, Ll/xej;->k()F

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    invoke-virtual {p0}, Ll/xej;->j()F

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    invoke-virtual {p0}, Ll/xej;->i()F

    .line 52
    .line 53
    .line 54
    move-result v4

    .line 55
    invoke-static {v0, v2, v3, v4}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 56
    .line 57
    .line 58
    const/16 v0, 0x4100

    .line 59
    .line 60
    invoke-static {v0}, Landroid/opengl/GLES20;->glClear(I)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0}, Ll/lqi0;->w()V

    .line 64
    .line 65
    .line 66
    const/4 v0, 0x5

    .line 67
    const/4 v2, 0x4

    .line 68
    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0}, Ll/xej;->g()V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0}, Ll/lqi0;->O()V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Ll/lqi0;->D:Ll/uje;

    .line 78
    .line 79
    if-eqz v0, :cond_2

    .line 80
    .line 81
    invoke-virtual {v0}, Ll/uje;->i()V

    .line 82
    .line 83
    .line 84
    :cond_2
    iget-object p0, p0, Ll/lqi0;->E:Ll/uje;

    .line 85
    .line 86
    if-eqz p0, :cond_3

    .line 87
    .line 88
    invoke-virtual {p0}, Ll/uje;->f()Z

    .line 89
    .line 90
    .line 91
    :cond_3
    :goto_0
    return-void
.end method

.method public s()V
    .locals 12

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    new-array v0, v0, [F

    .line 4
    .line 5
    iget-object v1, p0, Ll/xej;->c:[Ljava/nio/FloatBuffer;

    .line 6
    .line 7
    iget v2, p0, Ll/xej;->a:I

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
    iget-object v1, p0, Ll/xej;->c:[Ljava/nio/FloatBuffer;

    .line 16
    .line 17
    iget v3, p0, Ll/xej;->a:I

    .line 18
    .line 19
    aget-object v1, v1, v3

    .line 20
    .line 21
    invoke-virtual {v1, v0}, Ljava/nio/FloatBuffer;->get([F)Ljava/nio/FloatBuffer;

    .line 22
    .line 23
    .line 24
    invoke-direct {p0}, Ll/lqi0;->P()V

    .line 25
    .line 26
    .line 27
    iget v1, p0, Ll/lqi0;->J:F

    .line 28
    .line 29
    iget v3, p0, Ll/lqi0;->H:F

    .line 30
    .line 31
    div-float/2addr v1, v3

    .line 32
    iput v1, p0, Ll/lqi0;->G:F

    .line 33
    .line 34
    iget v3, p0, Ll/lqi0;->K:F

    .line 35
    .line 36
    iget v4, p0, Ll/lqi0;->I:F

    .line 37
    .line 38
    div-float/2addr v3, v4

    .line 39
    iput v3, p0, Ll/lqi0;->F:F

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
    sub-float/2addr v4, v1

    .line 49
    div-float/2addr v4, v5

    .line 50
    const/16 v1, 0x20

    .line 51
    .line 52
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 57
    .line 58
    .line 59
    move-result-object v5

    .line 60
    invoke-virtual {v1, v5}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    iput-object v1, p0, Ll/lqi0;->M:Ljava/nio/FloatBuffer;

    .line 69
    .line 70
    iget-boolean v1, p0, Ll/lqi0;->L:Z

    .line 71
    .line 72
    if-eqz v1, :cond_5

    .line 73
    .line 74
    iget v1, p0, Ll/xej;->a:I

    .line 75
    .line 76
    rem-int/lit8 v1, v1, 0x2

    .line 77
    .line 78
    const/4 v5, 0x4

    .line 79
    const-wide/high16 v6, 0x3fe0000000000000L    # 0.5

    .line 80
    .line 81
    if-eqz v1, :cond_2

    .line 82
    .line 83
    move v1, v2

    .line 84
    :goto_0
    if-ge v1, v5, :cond_5

    .line 85
    .line 86
    mul-int/lit8 v8, v1, 0x2

    .line 87
    .line 88
    aget v9, v0, v8

    .line 89
    .line 90
    float-to-double v10, v9

    .line 91
    cmpg-double v10, v10, v6

    .line 92
    .line 93
    if-gez v10, :cond_0

    .line 94
    .line 95
    add-float/2addr v9, v3

    .line 96
    goto :goto_1

    .line 97
    :cond_0
    sub-float/2addr v9, v3

    .line 98
    :goto_1
    aput v9, v0, v8

    .line 99
    .line 100
    add-int/lit8 v8, v8, 0x1

    .line 101
    .line 102
    aget v9, v0, v8

    .line 103
    .line 104
    float-to-double v10, v9

    .line 105
    cmpg-double v10, v10, v6

    .line 106
    .line 107
    if-gez v10, :cond_1

    .line 108
    .line 109
    add-float/2addr v9, v4

    .line 110
    goto :goto_2

    .line 111
    :cond_1
    sub-float/2addr v9, v4

    .line 112
    :goto_2
    aput v9, v0, v8

    .line 113
    .line 114
    add-int/lit8 v1, v1, 0x1

    .line 115
    .line 116
    goto :goto_0

    .line 117
    :cond_2
    move v1, v2

    .line 118
    :goto_3
    if-ge v1, v5, :cond_5

    .line 119
    .line 120
    mul-int/lit8 v8, v1, 0x2

    .line 121
    .line 122
    aget v9, v0, v8

    .line 123
    .line 124
    float-to-double v10, v9

    .line 125
    cmpg-double v10, v10, v6

    .line 126
    .line 127
    if-gez v10, :cond_3

    .line 128
    .line 129
    add-float/2addr v9, v4

    .line 130
    goto :goto_4

    .line 131
    :cond_3
    sub-float/2addr v9, v4

    .line 132
    :goto_4
    aput v9, v0, v8

    .line 133
    .line 134
    add-int/lit8 v8, v8, 0x1

    .line 135
    .line 136
    aget v9, v0, v8

    .line 137
    .line 138
    float-to-double v10, v9

    .line 139
    cmpg-double v10, v10, v6

    .line 140
    .line 141
    if-gez v10, :cond_4

    .line 142
    .line 143
    add-float/2addr v9, v3

    .line 144
    goto :goto_5

    .line 145
    :cond_4
    sub-float/2addr v9, v3

    .line 146
    :goto_5
    aput v9, v0, v8

    .line 147
    .line 148
    add-int/lit8 v1, v1, 0x1

    .line 149
    .line 150
    goto :goto_3

    .line 151
    :cond_5
    iget-object v1, p0, Ll/lqi0;->M:Ljava/nio/FloatBuffer;

    .line 152
    .line 153
    invoke-virtual {v1, v2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 154
    .line 155
    .line 156
    iget-object v1, p0, Ll/lqi0;->M:Ljava/nio/FloatBuffer;

    .line 157
    .line 158
    invoke-virtual {v1, v0}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 159
    .line 160
    .line 161
    iget-object v0, p0, Ll/lqi0;->M:Ljava/nio/FloatBuffer;

    .line 162
    .line 163
    invoke-virtual {v0, v2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 164
    .line 165
    .line 166
    invoke-super {p0}, Ll/hfj;->s()V

    .line 167
    .line 168
    .line 169
    return-void
.end method

.method public w()V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/lqi0;->M:Ljava/nio/FloatBuffer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/xej;->b:Ljava/nio/FloatBuffer;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 9
    .line 10
    .line 11
    iget v2, p0, Ll/xej;->f:I

    .line 12
    .line 13
    const/16 v6, 0x8

    .line 14
    .line 15
    iget-object v7, p0, Ll/xej;->b:Ljava/nio/FloatBuffer;

    .line 16
    .line 17
    const/4 v3, 0x2

    .line 18
    const/16 v4, 0x1406

    .line 19
    .line 20
    const/4 v5, 0x0

    .line 21
    invoke-static/range {v2 .. v7}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 22
    .line 23
    .line 24
    iget v0, p0, Ll/xej;->f:I

    .line 25
    .line 26
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/lqi0;->M:Ljava/nio/FloatBuffer;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 32
    .line 33
    .line 34
    iget v2, p0, Ll/xej;->g:I

    .line 35
    .line 36
    iget-object v7, p0, Ll/lqi0;->M:Ljava/nio/FloatBuffer;

    .line 37
    .line 38
    invoke-static/range {v2 .. v7}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 39
    .line 40
    .line 41
    iget v0, p0, Ll/xej;->g:I

    .line 42
    .line 43
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 44
    .line 45
    .line 46
    const v0, 0x84c0

    .line 47
    .line 48
    .line 49
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 50
    .line 51
    .line 52
    const/16 v0, 0xde1

    .line 53
    .line 54
    iget v2, p0, Ll/xej;->h:I

    .line 55
    .line 56
    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 57
    .line 58
    .line 59
    iget p0, p0, Ll/xej;->e:I

    .line 60
    .line 61
    invoke-static {p0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_0
    invoke-super {p0}, Ll/xej;->w()V

    .line 66
    .line 67
    .line 68
    return-void
.end method
