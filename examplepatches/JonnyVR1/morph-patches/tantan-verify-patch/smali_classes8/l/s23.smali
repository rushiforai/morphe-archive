.class public Ll/s23;
.super Ll/wej;
.source "SourceFile"

# interfaces
.implements Ll/dfj;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/s23$a;
    }
.end annotation


# instance fields
.field protected a:[I

.field protected b:[I

.field protected c:[I

.field private d:Ll/s23$a;


# direct methods
.method public constructor <init>()V
    .locals 7

    .line 1
    invoke-direct {p0}, Ll/wej;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x4

    .line 5
    new-array v0, v0, [Ljava/nio/FloatBuffer;

    .line 6
    .line 7
    iput-object v0, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 8
    .line 9
    const/16 v1, 0x8

    .line 10
    .line 11
    new-array v2, v1, [F

    .line 12
    .line 13
    fill-array-data v2, :array_0

    .line 14
    .line 15
    .line 16
    const/16 v3, 0x20

    .line 17
    .line 18
    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 19
    .line 20
    .line 21
    move-result-object v4

    .line 22
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 23
    .line 24
    .line 25
    move-result-object v5

    .line 26
    invoke-virtual {v4, v5}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 27
    .line 28
    .line 29
    move-result-object v4

    .line 30
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 31
    .line 32
    .line 33
    move-result-object v4

    .line 34
    const/4 v5, 0x0

    .line 35
    aput-object v4, v0, v5

    .line 36
    .line 37
    iget-object v0, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 38
    .line 39
    aget-object v0, v0, v5

    .line 40
    .line 41
    invoke-virtual {v0, v2}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0, v5}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 46
    .line 47
    .line 48
    new-array v0, v1, [F

    .line 49
    .line 50
    fill-array-data v0, :array_1

    .line 51
    .line 52
    .line 53
    iget-object v2, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 54
    .line 55
    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 56
    .line 57
    .line 58
    move-result-object v4

    .line 59
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 60
    .line 61
    .line 62
    move-result-object v6

    .line 63
    invoke-virtual {v4, v6}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 68
    .line 69
    .line 70
    move-result-object v4

    .line 71
    const/4 v6, 0x1

    .line 72
    aput-object v4, v2, v6

    .line 73
    .line 74
    iget-object v2, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 75
    .line 76
    aget-object v2, v2, v6

    .line 77
    .line 78
    invoke-virtual {v2, v0}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {v0, v5}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 83
    .line 84
    .line 85
    new-array v0, v1, [F

    .line 86
    .line 87
    fill-array-data v0, :array_2

    .line 88
    .line 89
    .line 90
    iget-object v2, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 91
    .line 92
    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 93
    .line 94
    .line 95
    move-result-object v4

    .line 96
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 97
    .line 98
    .line 99
    move-result-object v6

    .line 100
    invoke-virtual {v4, v6}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 101
    .line 102
    .line 103
    move-result-object v4

    .line 104
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 105
    .line 106
    .line 107
    move-result-object v4

    .line 108
    const/4 v6, 0x2

    .line 109
    aput-object v4, v2, v6

    .line 110
    .line 111
    iget-object v2, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 112
    .line 113
    aget-object v2, v2, v6

    .line 114
    .line 115
    invoke-virtual {v2, v0}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-virtual {v0, v5}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 120
    .line 121
    .line 122
    new-array v0, v1, [F

    .line 123
    .line 124
    fill-array-data v0, :array_3

    .line 125
    .line 126
    .line 127
    iget-object v1, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 128
    .line 129
    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 134
    .line 135
    .line 136
    move-result-object v3

    .line 137
    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 138
    .line 139
    .line 140
    move-result-object v2

    .line 141
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 142
    .line 143
    .line 144
    move-result-object v2

    .line 145
    const/4 v3, 0x3

    .line 146
    aput-object v2, v1, v3

    .line 147
    .line 148
    iget-object p0, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 149
    .line 150
    aget-object p0, p0, v3

    .line 151
    .line 152
    invoke-virtual {p0, v0}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    invoke-virtual {p0, v5}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 157
    .line 158
    .line 159
    return-void

    .line 160
    nop

    .line 161
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 162
    .line 163
    .line 164
    .line 165
    .line 166
    .line 167
    .line 168
    .line 169
    .line 170
    .line 171
    .line 172
    .line 173
    .line 174
    .line 175
    .line 176
    .line 177
    .line 178
    .line 179
    .line 180
    .line 181
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
    .end array-data

    .line 182
    .line 183
    .line 184
    .line 185
    .line 186
    .line 187
    .line 188
    .line 189
    .line 190
    .line 191
    .line 192
    .line 193
    .line 194
    .line 195
    .line 196
    .line 197
    .line 198
    .line 199
    .line 200
    .line 201
    :array_2
    .array-data 4
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 202
    .line 203
    .line 204
    .line 205
    .line 206
    .line 207
    .line 208
    .line 209
    .line 210
    .line 211
    .line 212
    .line 213
    .line 214
    .line 215
    .line 216
    .line 217
    .line 218
    .line 219
    .line 220
    .line 221
    :array_3
    .array-data 4
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private initFBO()V
    .locals 13

    .line 1
    iget-object v0, p0, Ll/s23;->a:[I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    const/4 v3, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-static {v2, v0, v3}, Landroid/opengl/GLES20;->glDeleteFramebuffers(I[II)V

    .line 9
    .line 10
    .line 11
    iput-object v1, p0, Ll/s23;->a:[I

    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Ll/s23;->b:[I

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-static {v2, v0, v3}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 18
    .line 19
    .line 20
    iput-object v1, p0, Ll/s23;->b:[I

    .line 21
    .line 22
    :cond_1
    iget-object v0, p0, Ll/s23;->c:[I

    .line 23
    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    invoke-static {v2, v0, v3}, Landroid/opengl/GLES20;->glDeleteRenderbuffers(I[II)V

    .line 27
    .line 28
    .line 29
    iput-object v1, p0, Ll/s23;->c:[I

    .line 30
    .line 31
    :cond_2
    new-array v0, v2, [I

    .line 32
    .line 33
    iput-object v0, p0, Ll/s23;->a:[I

    .line 34
    .line 35
    new-array v1, v2, [I

    .line 36
    .line 37
    iput-object v1, p0, Ll/s23;->b:[I

    .line 38
    .line 39
    new-array v1, v2, [I

    .line 40
    .line 41
    iput-object v1, p0, Ll/s23;->c:[I

    .line 42
    .line 43
    invoke-static {v2, v0, v3}, Landroid/opengl/GLES20;->glGenFramebuffers(I[II)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/s23;->c:[I

    .line 47
    .line 48
    invoke-static {v2, v0, v3}, Landroid/opengl/GLES20;->glGenRenderbuffers(I[II)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Ll/s23;->b:[I

    .line 52
    .line 53
    invoke-static {v2, v0, v3}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Ll/s23;->a:[I

    .line 57
    .line 58
    aget v0, v0, v3

    .line 59
    .line 60
    const v1, 0x8d40

    .line 61
    .line 62
    .line 63
    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 64
    .line 65
    .line 66
    const v0, 0x84c0

    .line 67
    .line 68
    .line 69
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Ll/s23;->b:[I

    .line 73
    .line 74
    aget v0, v0, v3

    .line 75
    .line 76
    const/16 v2, 0xde1

    .line 77
    .line 78
    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 82
    .line 83
    .line 84
    move-result v7

    .line 85
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 86
    .line 87
    .line 88
    move-result v8

    .line 89
    const/16 v11, 0x1401

    .line 90
    .line 91
    const/4 v12, 0x0

    .line 92
    const/16 v4, 0xde1

    .line 93
    .line 94
    const/4 v5, 0x0

    .line 95
    const/16 v6, 0x1908

    .line 96
    .line 97
    const/4 v9, 0x0

    .line 98
    const/16 v10, 0x1908

    .line 99
    .line 100
    invoke-static/range {v4 .. v12}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 101
    .line 102
    .line 103
    const/16 v0, 0x2802

    .line 104
    .line 105
    const v4, 0x812f

    .line 106
    .line 107
    .line 108
    invoke-static {v2, v0, v4}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 109
    .line 110
    .line 111
    const/16 v0, 0x2803

    .line 112
    .line 113
    invoke-static {v2, v0, v4}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 114
    .line 115
    .line 116
    const/16 v0, 0x2800

    .line 117
    .line 118
    const/16 v4, 0x2601

    .line 119
    .line 120
    invoke-static {v2, v0, v4}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 121
    .line 122
    .line 123
    const/16 v0, 0x2801

    .line 124
    .line 125
    invoke-static {v2, v0, v4}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 126
    .line 127
    .line 128
    iget-object v0, p0, Ll/s23;->b:[I

    .line 129
    .line 130
    aget v0, v0, v3

    .line 131
    .line 132
    const v4, 0x8ce0

    .line 133
    .line 134
    .line 135
    invoke-static {v1, v4, v2, v0, v3}, Landroid/opengl/GLES20;->glFramebufferTexture2D(IIIII)V

    .line 136
    .line 137
    .line 138
    iget-object v0, p0, Ll/s23;->c:[I

    .line 139
    .line 140
    aget v0, v0, v3

    .line 141
    .line 142
    const v2, 0x8d41

    .line 143
    .line 144
    .line 145
    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glBindRenderbuffer(II)V

    .line 146
    .line 147
    .line 148
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 149
    .line 150
    .line 151
    move-result v0

    .line 152
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 153
    .line 154
    .line 155
    move-result v4

    .line 156
    const v5, 0x81a5

    .line 157
    .line 158
    .line 159
    invoke-static {v2, v5, v0, v4}, Landroid/opengl/GLES20;->glRenderbufferStorage(IIII)V

    .line 160
    .line 161
    .line 162
    iget-object v0, p0, Ll/s23;->c:[I

    .line 163
    .line 164
    aget v0, v0, v3

    .line 165
    .line 166
    const v3, 0x8d00

    .line 167
    .line 168
    .line 169
    invoke-static {v1, v3, v2, v0}, Landroid/opengl/GLES20;->glFramebufferRenderbuffer(IIII)V

    .line 170
    .line 171
    .line 172
    invoke-static {v1}, Landroid/opengl/GLES20;->glCheckFramebufferStatus(I)I

    .line 173
    .line 174
    .line 175
    move-result v0

    .line 176
    const v1, 0x8cd5

    .line 177
    .line 178
    .line 179
    if-ne v0, v1, :cond_3

    .line 180
    .line 181
    return-void

    .line 182
    :cond_3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 183
    .line 184
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 185
    .line 186
    .line 187
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 188
    .line 189
    .line 190
    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    .line 191
    .line 192
    .line 193
    move-result p0

    .line 194
    invoke-static {v1, v0, p0}, Ll/muf;->a(Ljava/lang/StringBuilder;II)V

    .line 195
    .line 196
    .line 197
    return-void
.end method


# virtual methods
.method public Q1(Ll/s23$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/s23;->d:Ll/s23$a;

    .line 2
    .line 3
    return-void
.end method

.method public destroy()V
    .locals 4

    .line 1
    invoke-super {p0}, Ll/wej;->destroy()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/s23;->a:[I

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    const/4 v2, 0x0

    .line 8
    const/4 v3, 0x1

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {v3, v0, v2}, Landroid/opengl/GLES20;->glDeleteFramebuffers(I[II)V

    .line 12
    .line 13
    .line 14
    iput-object v1, p0, Ll/s23;->a:[I

    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Ll/s23;->b:[I

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-static {v3, v0, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 21
    .line 22
    .line 23
    iput-object v1, p0, Ll/s23;->b:[I

    .line 24
    .line 25
    :cond_1
    iget-object v0, p0, Ll/s23;->c:[I

    .line 26
    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    invoke-static {v3, v0, v2}, Landroid/opengl/GLES20;->glDeleteRenderbuffers(I[II)V

    .line 30
    .line 31
    .line 32
    iput-object v1, p0, Ll/s23;->c:[I

    .line 33
    .line 34
    :cond_2
    return-void
.end method

.method public drawFrame()V
    .locals 11

    .line 1
    iget-object v0, p0, Ll/s23;->a:[I

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-direct {p0}, Ll/s23;->initFBO()V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    return-void

    .line 22
    :cond_1
    :goto_0
    iget-object v0, p0, Ll/s23;->a:[I

    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    aget v0, v0, v1

    .line 26
    .line 27
    const v2, 0x8d40

    .line 28
    .line 29
    .line 30
    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 31
    .line 32
    .line 33
    invoke-super {p0}, Ll/wej;->drawFrame()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    mul-int/2addr v0, v3

    .line 45
    new-array v3, v0, [I

    .line 46
    .line 47
    invoke-static {v3}, Ljava/nio/IntBuffer;->wrap([I)Ljava/nio/IntBuffer;

    .line 48
    .line 49
    .line 50
    move-result-object v10

    .line 51
    invoke-virtual {v10, v1}, Ljava/nio/IntBuffer;->position(I)Ljava/nio/Buffer;

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 55
    .line 56
    .line 57
    move-result v6

    .line 58
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 59
    .line 60
    .line 61
    move-result v7

    .line 62
    const/16 v8, 0x1908

    .line 63
    .line 64
    const/16 v9, 0x1401

    .line 65
    .line 66
    const/4 v4, 0x0

    .line 67
    const/4 v5, 0x0

    .line 68
    invoke-static/range {v4 .. v10}, Landroid/opengl/GLES20;->glReadPixels(IIIIIILjava/nio/Buffer;)V

    .line 69
    .line 70
    .line 71
    invoke-static {v2, v1}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 72
    .line 73
    .line 74
    :goto_1
    if-ge v1, v0, :cond_2

    .line 75
    .line 76
    aget v2, v3, v1

    .line 77
    .line 78
    const v4, -0xff0100

    .line 79
    .line 80
    .line 81
    and-int/2addr v4, v2

    .line 82
    shr-int/lit8 v5, v2, 0x10

    .line 83
    .line 84
    and-int/lit16 v5, v5, 0xff

    .line 85
    .line 86
    or-int/2addr v4, v5

    .line 87
    shl-int/lit8 v2, v2, 0x10

    .line 88
    .line 89
    const/high16 v5, 0xff0000

    .line 90
    .line 91
    and-int/2addr v2, v5

    .line 92
    or-int/2addr v2, v4

    .line 93
    aput v2, v3, v1

    .line 94
    .line 95
    add-int/lit8 v1, v1, 0x1

    .line 96
    .line 97
    goto :goto_1

    .line 98
    :cond_2
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 107
    .line 108
    invoke-static {v3, v0, v1, v2}, Landroid/graphics/Bitmap;->createBitmap([IIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    iget-object p0, p0, Ll/s23;->d:Ll/s23$a;

    .line 113
    .line 114
    invoke-interface {p0, v0}, Ll/s23$a;->a(Landroid/graphics/Bitmap;)V

    .line 115
    .line 116
    .line 117
    return-void
.end method

.method public handleSizeChange()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/s23;->initFBO()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public newTextureReady(ILl/gfj;Z)V
    .locals 0

    .line 1
    iput p1, p0, Ll/wej;->texture_in:I

    .line 2
    .line 3
    invoke-virtual {p2}, Ll/wej;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-virtual {p0, p1}, Ll/wej;->setWidth(I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p2}, Ll/wej;->getHeight()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    invoke-virtual {p0, p1}, Ll/wej;->setHeight(I)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ll/wej;->onDrawFrame()V

    .line 18
    .line 19
    .line 20
    return-void
.end method
