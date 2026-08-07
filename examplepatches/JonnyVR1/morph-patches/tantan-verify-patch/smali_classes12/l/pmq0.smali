.class public Ll/pmq0;
.super Ll/kt2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/pmq0$a;
    }
.end annotation


# instance fields
.field public D:Ll/pmq0$a;

.field protected E:[I

.field protected F:[I

.field protected G:[I

.field H:I

.field I:I

.field J:I

.field K:I

.field L:I

.field M:I

.field N:I

.field O:I

.field private P:I

.field private Q:I

.field private R:I

.field private S:I


# direct methods
.method public constructor <init>()V
    .locals 7

    .line 1
    invoke-direct {p0}, Ll/kt2;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x4

    .line 5
    new-array v0, v0, [Ljava/nio/FloatBuffer;

    .line 6
    .line 7
    iput-object v0, p0, Ll/xej;->c:[Ljava/nio/FloatBuffer;

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
    iget-object v0, p0, Ll/xej;->c:[Ljava/nio/FloatBuffer;

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
    iget-object v2, p0, Ll/xej;->c:[Ljava/nio/FloatBuffer;

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
    iget-object v2, p0, Ll/xej;->c:[Ljava/nio/FloatBuffer;

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
    iget-object v2, p0, Ll/xej;->c:[Ljava/nio/FloatBuffer;

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
    iget-object v2, p0, Ll/xej;->c:[Ljava/nio/FloatBuffer;

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
    iget-object v1, p0, Ll/xej;->c:[Ljava/nio/FloatBuffer;

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
    iget-object p0, p0, Ll/xej;->c:[Ljava/nio/FloatBuffer;

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

.method public static final O()[F
    .locals 1

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    new-array v0, v0, [F

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    return-object v0

    .line 9
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private P()V
    .locals 13

    .line 1
    iget-object v0, p0, Ll/pmq0;->E:[I

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
    iput-object v1, p0, Ll/pmq0;->E:[I

    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Ll/pmq0;->F:[I

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-static {v2, v0, v3}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 18
    .line 19
    .line 20
    iput-object v1, p0, Ll/pmq0;->F:[I

    .line 21
    .line 22
    :cond_1
    iget-object v0, p0, Ll/pmq0;->G:[I

    .line 23
    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    invoke-static {v2, v0, v3}, Landroid/opengl/GLES20;->glDeleteRenderbuffers(I[II)V

    .line 27
    .line 28
    .line 29
    iput-object v1, p0, Ll/pmq0;->G:[I

    .line 30
    .line 31
    :cond_2
    new-array v0, v2, [I

    .line 32
    .line 33
    iput-object v0, p0, Ll/pmq0;->E:[I

    .line 34
    .line 35
    new-array v1, v2, [I

    .line 36
    .line 37
    iput-object v1, p0, Ll/pmq0;->F:[I

    .line 38
    .line 39
    new-array v1, v2, [I

    .line 40
    .line 41
    iput-object v1, p0, Ll/pmq0;->G:[I

    .line 42
    .line 43
    invoke-static {v2, v0, v3}, Landroid/opengl/GLES20;->glGenFramebuffers(I[II)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/pmq0;->G:[I

    .line 47
    .line 48
    invoke-static {v2, v0, v3}, Landroid/opengl/GLES20;->glGenRenderbuffers(I[II)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Ll/pmq0;->F:[I

    .line 52
    .line 53
    invoke-static {v2, v0, v3}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Ll/pmq0;->E:[I

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
    iget-object v0, p0, Ll/pmq0;->F:[I

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
    invoke-virtual {p0}, Ll/xej;->r()I

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    div-int/lit8 v7, v0, 0x4

    .line 86
    .line 87
    invoke-virtual {p0}, Ll/xej;->n()I

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    invoke-virtual {p0}, Ll/xej;->n()I

    .line 92
    .line 93
    .line 94
    move-result v4

    .line 95
    div-int/lit8 v4, v4, 0x2

    .line 96
    .line 97
    add-int v8, v0, v4

    .line 98
    .line 99
    const/16 v11, 0x1401

    .line 100
    .line 101
    const/4 v12, 0x0

    .line 102
    const/16 v4, 0xde1

    .line 103
    .line 104
    const/4 v5, 0x0

    .line 105
    const/16 v6, 0x1908

    .line 106
    .line 107
    const/4 v9, 0x0

    .line 108
    const/16 v10, 0x1908

    .line 109
    .line 110
    invoke-static/range {v4 .. v12}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 111
    .line 112
    .line 113
    const/16 v0, 0x2802

    .line 114
    .line 115
    const v4, 0x812f

    .line 116
    .line 117
    .line 118
    invoke-static {v2, v0, v4}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 119
    .line 120
    .line 121
    const/16 v0, 0x2803

    .line 122
    .line 123
    invoke-static {v2, v0, v4}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 124
    .line 125
    .line 126
    const/16 v0, 0x2800

    .line 127
    .line 128
    const/16 v4, 0x2601

    .line 129
    .line 130
    invoke-static {v2, v0, v4}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 131
    .line 132
    .line 133
    const/16 v0, 0x2801

    .line 134
    .line 135
    invoke-static {v2, v0, v4}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 136
    .line 137
    .line 138
    iget-object v0, p0, Ll/pmq0;->F:[I

    .line 139
    .line 140
    aget v0, v0, v3

    .line 141
    .line 142
    const v4, 0x8ce0

    .line 143
    .line 144
    .line 145
    invoke-static {v1, v4, v2, v0, v3}, Landroid/opengl/GLES20;->glFramebufferTexture2D(IIIII)V

    .line 146
    .line 147
    .line 148
    iget-object v0, p0, Ll/pmq0;->G:[I

    .line 149
    .line 150
    aget v0, v0, v3

    .line 151
    .line 152
    const v2, 0x8d41

    .line 153
    .line 154
    .line 155
    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glBindRenderbuffer(II)V

    .line 156
    .line 157
    .line 158
    invoke-virtual {p0}, Ll/xej;->r()I

    .line 159
    .line 160
    .line 161
    move-result v0

    .line 162
    div-int/lit8 v0, v0, 0x4

    .line 163
    .line 164
    invoke-virtual {p0}, Ll/xej;->n()I

    .line 165
    .line 166
    .line 167
    move-result v4

    .line 168
    invoke-virtual {p0}, Ll/xej;->n()I

    .line 169
    .line 170
    .line 171
    move-result v5

    .line 172
    div-int/lit8 v5, v5, 0x2

    .line 173
    .line 174
    add-int/2addr v4, v5

    .line 175
    const v5, 0x81a5

    .line 176
    .line 177
    .line 178
    invoke-static {v2, v5, v0, v4}, Landroid/opengl/GLES20;->glRenderbufferStorage(IIII)V

    .line 179
    .line 180
    .line 181
    iget-object v0, p0, Ll/pmq0;->G:[I

    .line 182
    .line 183
    aget v0, v0, v3

    .line 184
    .line 185
    const v3, 0x8d00

    .line 186
    .line 187
    .line 188
    invoke-static {v1, v3, v2, v0}, Landroid/opengl/GLES20;->glFramebufferRenderbuffer(IIII)V

    .line 189
    .line 190
    .line 191
    invoke-static {v1}, Landroid/opengl/GLES20;->glCheckFramebufferStatus(I)I

    .line 192
    .line 193
    .line 194
    move-result v0

    .line 195
    const v1, 0x8cd5

    .line 196
    .line 197
    .line 198
    if-ne v0, v1, :cond_3

    .line 199
    .line 200
    return-void

    .line 201
    :cond_3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 202
    .line 203
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 204
    .line 205
    .line 206
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 207
    .line 208
    .line 209
    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    .line 210
    .line 211
    .line 212
    move-result p0

    .line 213
    invoke-static {v1, v0, p0}, Ll/muf;->a(Ljava/lang/StringBuilder;II)V

    .line 214
    .line 215
    .line 216
    return-void
.end method


# virtual methods
.method public c(ILl/hfj;Z)V
    .locals 0

    .line 1
    iput p1, p0, Ll/xej;->h:I

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xej;->r()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-virtual {p0, p1}, Ll/xej;->B(I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/xej;->n()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    invoke-virtual {p0, p1}, Ll/xej;->y(I)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ll/xej;->v()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p2}, Ll/hfj;->N()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public f()V
    .locals 4

    .line 1
    invoke-super {p0}, Ll/hfj;->f()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/pmq0;->E:[I

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
    iput-object v1, p0, Ll/pmq0;->E:[I

    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Ll/pmq0;->F:[I

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-static {v3, v0, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 21
    .line 22
    .line 23
    iput-object v1, p0, Ll/pmq0;->F:[I

    .line 24
    .line 25
    :cond_1
    iget-object v0, p0, Ll/pmq0;->G:[I

    .line 26
    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    invoke-static {v3, v0, v2}, Landroid/opengl/GLES20;->glDeleteRenderbuffers(I[II)V

    .line 30
    .line 31
    .line 32
    iput-object v1, p0, Ll/pmq0;->G:[I

    .line 33
    .line 34
    :cond_2
    return-void
.end method

.method public h()V
    .locals 14

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
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 10
    .line 11
    .line 12
    move-result-wide v2

    .line 13
    iget-object v4, p0, Ll/pmq0;->E:[I

    .line 14
    .line 15
    if-nez v4, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/xej;->r()I

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    if-eqz v4, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/xej;->n()I

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    if-eqz v4, :cond_1

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/hfj;->K()V

    .line 30
    .line 31
    .line 32
    :cond_0
    iget-object v4, p0, Ll/pmq0;->E:[I

    .line 33
    .line 34
    const/4 v5, 0x0

    .line 35
    aget v4, v4, v5

    .line 36
    .line 37
    const v6, 0x8d40

    .line 38
    .line 39
    .line 40
    invoke-static {v6, v4}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 41
    .line 42
    .line 43
    iget v4, p0, Ll/xej;->d:I

    .line 44
    .line 45
    invoke-static {v4}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 46
    .line 47
    .line 48
    const/16 v4, 0x4100

    .line 49
    .line 50
    invoke-static {v4}, Landroid/opengl/GLES20;->glClear(I)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0}, Ll/xej;->l()F

    .line 54
    .line 55
    .line 56
    move-result v4

    .line 57
    invoke-virtual {p0}, Ll/xej;->k()F

    .line 58
    .line 59
    .line 60
    move-result v7

    .line 61
    invoke-virtual {p0}, Ll/xej;->j()F

    .line 62
    .line 63
    .line 64
    move-result v8

    .line 65
    invoke-virtual {p0}, Ll/xej;->i()F

    .line 66
    .line 67
    .line 68
    move-result v9

    .line 69
    invoke-static {v4, v7, v8, v9}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0}, Ll/pmq0;->w()V

    .line 73
    .line 74
    .line 75
    invoke-static {}, Ll/pmq0;->O()[F

    .line 76
    .line 77
    .line 78
    move-result-object v4

    .line 79
    invoke-static {}, Lcom/immomo/moment/media/momofilter/RendererCommon;->b()[F

    .line 80
    .line 81
    .line 82
    move-result-object v7

    .line 83
    invoke-static {v4, v7}, Lcom/immomo/moment/media/momofilter/RendererCommon;->a([F[F)[F

    .line 84
    .line 85
    .line 86
    move-result-object v4

    .line 87
    iget v7, p0, Ll/pmq0;->L:I

    .line 88
    .line 89
    invoke-static {v5, v5, v7, v1}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 90
    .line 91
    .line 92
    iget v7, p0, Ll/pmq0;->Q:I

    .line 93
    .line 94
    aget v8, v4, v5

    .line 95
    .line 96
    int-to-float v0, v0

    .line 97
    div-float/2addr v8, v0

    .line 98
    const/4 v9, 0x1

    .line 99
    aget v10, v4, v9

    .line 100
    .line 101
    div-float/2addr v10, v0

    .line 102
    invoke-static {v7, v8, v10}, Landroid/opengl/GLES20;->glUniform2f(IFF)V

    .line 103
    .line 104
    .line 105
    iget v7, p0, Ll/pmq0;->R:I

    .line 106
    .line 107
    const v8, 0x3de978d5    # 0.114f

    .line 108
    .line 109
    .line 110
    const/4 v10, 0x0

    .line 111
    const v11, 0x3e991687    # 0.299f

    .line 112
    .line 113
    .line 114
    const v12, 0x3f1645a2    # 0.587f

    .line 115
    .line 116
    .line 117
    invoke-static {v7, v11, v12, v8, v10}, Landroid/opengl/GLES20;->glUniform4f(IFFFF)V

    .line 118
    .line 119
    .line 120
    const/4 v7, 0x5

    .line 121
    const/4 v8, 0x4

    .line 122
    invoke-static {v7, v5, v8}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 123
    .line 124
    .line 125
    iget v10, p0, Ll/pmq0;->M:I

    .line 126
    .line 127
    iget v11, p0, Ll/pmq0;->N:I

    .line 128
    .line 129
    invoke-static {v5, v1, v10, v11}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 130
    .line 131
    .line 132
    iget v10, p0, Ll/pmq0;->Q:I

    .line 133
    .line 134
    aget v11, v4, v5

    .line 135
    .line 136
    const/high16 v12, 0x40000000    # 2.0f

    .line 137
    .line 138
    mul-float/2addr v11, v12

    .line 139
    div-float/2addr v11, v0

    .line 140
    aget v4, v4, v9

    .line 141
    .line 142
    mul-float/2addr v4, v12

    .line 143
    div-float/2addr v4, v0

    .line 144
    invoke-static {v10, v11, v4}, Landroid/opengl/GLES20;->glUniform2f(IFF)V

    .line 145
    .line 146
    .line 147
    iget v0, p0, Ll/pmq0;->R:I

    .line 148
    .line 149
    const v4, -0x41d2f1aa    # -0.169f

    .line 150
    .line 151
    .line 152
    const v9, -0x4156872b    # -0.331f

    .line 153
    .line 154
    .line 155
    const v10, 0x3eff7cee    # 0.499f

    .line 156
    .line 157
    .line 158
    const/high16 v11, 0x3f000000    # 0.5f

    .line 159
    .line 160
    invoke-static {v0, v4, v9, v10, v11}, Landroid/opengl/GLES20;->glUniform4f(IFFFF)V

    .line 161
    .line 162
    .line 163
    invoke-static {v7, v5, v8}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 164
    .line 165
    .line 166
    iget v0, p0, Ll/pmq0;->L:I

    .line 167
    .line 168
    div-int/lit8 v0, v0, 0x2

    .line 169
    .line 170
    iget v4, p0, Ll/pmq0;->M:I

    .line 171
    .line 172
    iget v9, p0, Ll/pmq0;->N:I

    .line 173
    .line 174
    invoke-static {v0, v1, v4, v9}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 175
    .line 176
    .line 177
    iget v0, p0, Ll/pmq0;->R:I

    .line 178
    .line 179
    const v1, -0x4129fbe7    # -0.418f

    .line 180
    .line 181
    .line 182
    const v4, -0x42597f63    # -0.0813f

    .line 183
    .line 184
    .line 185
    invoke-static {v0, v10, v1, v4, v11}, Landroid/opengl/GLES20;->glUniform4f(IFFFF)V

    .line 186
    .line 187
    .line 188
    invoke-static {v7, v5, v8}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 189
    .line 190
    .line 191
    const/16 v0, 0xde1

    .line 192
    .line 193
    invoke-static {v0, v5}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 194
    .line 195
    .line 196
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 197
    .line 198
    .line 199
    iget v0, p0, Ll/pmq0;->H:I

    .line 200
    .line 201
    iget v1, p0, Ll/pmq0;->I:I

    .line 202
    .line 203
    mul-int/2addr v0, v1

    .line 204
    mul-int/2addr v0, v8

    .line 205
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 206
    .line 207
    .line 208
    move-result-object v13

    .line 209
    iget v9, p0, Ll/pmq0;->H:I

    .line 210
    .line 211
    iget v10, p0, Ll/pmq0;->I:I

    .line 212
    .line 213
    const/16 v11, 0x1908

    .line 214
    .line 215
    const/16 v12, 0x1401

    .line 216
    .line 217
    const/4 v7, 0x0

    .line 218
    const/4 v8, 0x0

    .line 219
    invoke-static/range {v7 .. v13}, Landroid/opengl/GLES20;->glReadPixels(IIIIIILjava/nio/Buffer;)V

    .line 220
    .line 221
    .line 222
    invoke-static {v6, v5}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 223
    .line 224
    .line 225
    iget-object p0, p0, Ll/pmq0;->D:Ll/pmq0$a;

    .line 226
    .line 227
    if-eqz p0, :cond_1

    .line 228
    .line 229
    invoke-interface {p0, v13, v2, v3}, Ll/pmq0$a;->a(Ljava/nio/ByteBuffer;J)V

    .line 230
    .line 231
    .line 232
    :cond_1
    return-void
.end method

.method public m()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision highp float;\nvarying highp vec2 textureCoordinate;\nuniform sampler2D inputImageTexture;\nuniform vec2 xUnit;\nuniform vec4 coeffs;\nvec2 newCoord;\n uniform float drawType; \nvoid main() {\n  newCoord = vec2(textureCoordinate.x,textureCoordinate.y);  gl_FragColor.r = coeffs.a + dot(coeffs.rgb,\n      texture2D(inputImageTexture, newCoord - 1.5 * xUnit).rgb);\n  gl_FragColor.g = coeffs.a + dot(coeffs.rgb,\n      texture2D(inputImageTexture, newCoord - 0.5 * xUnit).rgb);\n  gl_FragColor.b = coeffs.a + dot(coeffs.rgb,\n      texture2D(inputImageTexture, newCoord + 0.5 * xUnit).rgb);\n  gl_FragColor.a = coeffs.a + dot(coeffs.rgb,\n      texture2D(inputImageTexture, newCoord + 1.5 * xUnit).rgb);\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public o()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "attribute vec4 position;\nattribute vec4 inputTextureCoordinate;\n \n varying vec2 textureCoordinate;\n \nuniform mat4 texMatrix;\n\nvoid main()\n{\n    gl_Position = position;\n  textureCoordinate = (texMatrix * inputTextureCoordinate).xy;\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public s()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xej;->r()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput v0, p0, Ll/pmq0;->J:I

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xej;->n()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iput v0, p0, Ll/pmq0;->K:I

    .line 12
    .line 13
    iget v1, p0, Ll/pmq0;->J:I

    .line 14
    .line 15
    add-int/lit8 v2, v1, 0x3

    .line 16
    .line 17
    div-int/lit8 v2, v2, 0x4

    .line 18
    .line 19
    iput v2, p0, Ll/pmq0;->L:I

    .line 20
    .line 21
    add-int/lit8 v1, v1, 0x7

    .line 22
    .line 23
    div-int/lit8 v1, v1, 0x8

    .line 24
    .line 25
    iput v1, p0, Ll/pmq0;->M:I

    .line 26
    .line 27
    add-int/lit8 v1, v0, 0x1

    .line 28
    .line 29
    div-int/lit8 v1, v1, 0x2

    .line 30
    .line 31
    iput v1, p0, Ll/pmq0;->N:I

    .line 32
    .line 33
    add-int/2addr v0, v1

    .line 34
    iput v0, p0, Ll/pmq0;->O:I

    .line 35
    .line 36
    iput v2, p0, Ll/pmq0;->H:I

    .line 37
    .line 38
    iput v0, p0, Ll/pmq0;->I:I

    .line 39
    .line 40
    invoke-direct {p0}, Ll/pmq0;->P()V

    .line 41
    .line 42
    .line 43
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
    const-string v1, "texMatrix"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Ll/pmq0;->P:I

    .line 13
    .line 14
    iget v0, p0, Ll/xej;->d:I

    .line 15
    .line 16
    const-string v1, "xUnit"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Ll/pmq0;->Q:I

    .line 23
    .line 24
    iget v0, p0, Ll/xej;->d:I

    .line 25
    .line 26
    const-string v1, "coeffs"

    .line 27
    .line 28
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iput v0, p0, Ll/pmq0;->R:I

    .line 33
    .line 34
    iget v0, p0, Ll/xej;->d:I

    .line 35
    .line 36
    const-string v1, "drawType"

    .line 37
    .line 38
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iput v0, p0, Ll/pmq0;->S:I

    .line 43
    .line 44
    return-void
.end method

.method public w()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/xej;->w()V

    .line 2
    .line 3
    .line 4
    iget p0, p0, Ll/pmq0;->P:I

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-static {}, Ll/pmq0;->O()[F

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const/4 v2, 0x1

    .line 12
    invoke-static {p0, v2, v0, v1, v0}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
