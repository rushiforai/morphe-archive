.class public Ll/okm;
.super Ll/jt2;
.source "SourceFile"


# instance fields
.field private a:Ljava/nio/FloatBuffer;

.field private b:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/jt2;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/okm;->a:Ljava/nio/FloatBuffer;

    .line 6
    .line 7
    const/high16 v0, 0x3f800000    # 1.0f

    .line 8
    .line 9
    iput v0, p0, Ll/okm;->b:F

    .line 10
    .line 11
    return-void
.end method

.method private declared-synchronized Q1()V
    .locals 12

    .line 1
    monitor-enter p0

    .line 2
    const/16 v0, 0x8

    .line 3
    .line 4
    :try_start_0
    new-array v0, v0, [F

    .line 5
    .line 6
    iget-object v1, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 7
    .line 8
    iget v2, p0, Ll/wej;->curRotation:I

    .line 9
    .line 10
    aget-object v1, v1, v2

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-virtual {v1, v2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 17
    .line 18
    iget v3, p0, Ll/wej;->curRotation:I

    .line 19
    .line 20
    aget-object v1, v1, v3

    .line 21
    .line 22
    invoke-virtual {v1, v0}, Ljava/nio/FloatBuffer;->get([F)Ljava/nio/FloatBuffer;

    .line 23
    .line 24
    .line 25
    iget v1, p0, Ll/okm;->b:F

    .line 26
    .line 27
    const/high16 v3, 0x3f800000    # 1.0f

    .line 28
    .line 29
    sub-float v4, v3, v1

    .line 30
    .line 31
    const/high16 v5, 0x40000000    # 2.0f

    .line 32
    .line 33
    div-float/2addr v4, v5

    .line 34
    sub-float/2addr v3, v1

    .line 35
    div-float/2addr v3, v5

    .line 36
    const/16 v1, 0x20

    .line 37
    .line 38
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 43
    .line 44
    .line 45
    move-result-object v5

    .line 46
    invoke-virtual {v1, v5}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    iput-object v1, p0, Ll/okm;->a:Ljava/nio/FloatBuffer;

    .line 55
    .line 56
    iget v1, p0, Ll/wej;->curRotation:I

    .line 57
    .line 58
    rem-int/lit8 v1, v1, 0x2

    .line 59
    .line 60
    const/4 v5, 0x4

    .line 61
    const-wide/high16 v6, 0x3fe0000000000000L    # 0.5

    .line 62
    .line 63
    if-eqz v1, :cond_2

    .line 64
    .line 65
    move v1, v2

    .line 66
    :goto_0
    if-ge v1, v5, :cond_5

    .line 67
    .line 68
    mul-int/lit8 v8, v1, 0x2

    .line 69
    .line 70
    aget v9, v0, v8

    .line 71
    .line 72
    float-to-double v10, v9

    .line 73
    cmpg-double v10, v10, v6

    .line 74
    .line 75
    if-gez v10, :cond_0

    .line 76
    .line 77
    add-float/2addr v9, v4

    .line 78
    goto :goto_1

    .line 79
    :cond_0
    sub-float/2addr v9, v4

    .line 80
    :goto_1
    aput v9, v0, v8

    .line 81
    .line 82
    add-int/lit8 v8, v8, 0x1

    .line 83
    .line 84
    aget v9, v0, v8

    .line 85
    .line 86
    float-to-double v10, v9

    .line 87
    cmpg-double v10, v10, v6

    .line 88
    .line 89
    if-gez v10, :cond_1

    .line 90
    .line 91
    add-float/2addr v9, v3

    .line 92
    goto :goto_2

    .line 93
    :cond_1
    sub-float/2addr v9, v3

    .line 94
    :goto_2
    aput v9, v0, v8

    .line 95
    .line 96
    add-int/lit8 v1, v1, 0x1

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :catchall_0
    move-exception v0

    .line 100
    goto :goto_6

    .line 101
    :cond_2
    move v1, v2

    .line 102
    :goto_3
    if-ge v1, v5, :cond_5

    .line 103
    .line 104
    mul-int/lit8 v8, v1, 0x2

    .line 105
    .line 106
    aget v9, v0, v8

    .line 107
    .line 108
    float-to-double v10, v9

    .line 109
    cmpg-double v10, v10, v6

    .line 110
    .line 111
    if-gez v10, :cond_3

    .line 112
    .line 113
    add-float/2addr v9, v3

    .line 114
    goto :goto_4

    .line 115
    :cond_3
    sub-float/2addr v9, v3

    .line 116
    :goto_4
    aput v9, v0, v8

    .line 117
    .line 118
    add-int/lit8 v8, v8, 0x1

    .line 119
    .line 120
    aget v9, v0, v8

    .line 121
    .line 122
    float-to-double v10, v9

    .line 123
    cmpg-double v10, v10, v6

    .line 124
    .line 125
    if-gez v10, :cond_4

    .line 126
    .line 127
    add-float/2addr v9, v4

    .line 128
    goto :goto_5

    .line 129
    :cond_4
    sub-float/2addr v9, v4

    .line 130
    :goto_5
    aput v9, v0, v8

    .line 131
    .line 132
    add-int/lit8 v1, v1, 0x1

    .line 133
    .line 134
    goto :goto_3

    .line 135
    :cond_5
    iget-object v1, p0, Ll/okm;->a:Ljava/nio/FloatBuffer;

    .line 136
    .line 137
    invoke-virtual {v1, v2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 138
    .line 139
    .line 140
    iget-object v1, p0, Ll/okm;->a:Ljava/nio/FloatBuffer;

    .line 141
    .line 142
    invoke-virtual {v1, v0}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 143
    .line 144
    .line 145
    iget-object v0, p0, Ll/okm;->a:Ljava/nio/FloatBuffer;

    .line 146
    .line 147
    invoke-virtual {v0, v2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 148
    .line 149
    .line 150
    monitor-exit p0

    .line 151
    return-void

    .line 152
    :goto_6
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 153
    throw v0
.end method


# virtual methods
.method public declared-synchronized R1(F)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iput p1, p0, Ll/okm;->b:F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return-void

    .line 6
    :catchall_0
    move-exception p1

    .line 7
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 8
    throw p1
.end method

.method public passShaderValues()V
    .locals 8

    .line 1
    invoke-direct {p0}, Ll/okm;->Q1()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/okm;->a:Ljava/nio/FloatBuffer;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Ll/wej;->renderVertices:Ljava/nio/FloatBuffer;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 12
    .line 13
    .line 14
    iget v2, p0, Ll/wej;->positionHandle:I

    .line 15
    .line 16
    const/16 v6, 0x8

    .line 17
    .line 18
    iget-object v7, p0, Ll/wej;->renderVertices:Ljava/nio/FloatBuffer;

    .line 19
    .line 20
    const/4 v3, 0x2

    .line 21
    const/16 v4, 0x1406

    .line 22
    .line 23
    const/4 v5, 0x0

    .line 24
    invoke-static/range {v2 .. v7}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 25
    .line 26
    .line 27
    iget v0, p0, Ll/wej;->positionHandle:I

    .line 28
    .line 29
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/okm;->a:Ljava/nio/FloatBuffer;

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 35
    .line 36
    .line 37
    iget v2, p0, Ll/wej;->texCoordHandle:I

    .line 38
    .line 39
    iget-object v7, p0, Ll/okm;->a:Ljava/nio/FloatBuffer;

    .line 40
    .line 41
    invoke-static/range {v2 .. v7}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 42
    .line 43
    .line 44
    iget v0, p0, Ll/wej;->texCoordHandle:I

    .line 45
    .line 46
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 47
    .line 48
    .line 49
    const v0, 0x84c0

    .line 50
    .line 51
    .line 52
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 53
    .line 54
    .line 55
    const/16 v0, 0xde1

    .line 56
    .line 57
    iget v2, p0, Ll/wej;->texture_in:I

    .line 58
    .line 59
    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 60
    .line 61
    .line 62
    iget p0, p0, Ll/wej;->textureHandle:I

    .line 63
    .line 64
    invoke-static {p0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_0
    invoke-super {p0}, Ll/wej;->passShaderValues()V

    .line 69
    .line 70
    .line 71
    return-void
.end method
