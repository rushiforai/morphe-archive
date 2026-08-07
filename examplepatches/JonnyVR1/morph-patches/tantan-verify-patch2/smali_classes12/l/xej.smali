.class public abstract Ll/xej;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field protected a:I

.field protected b:Ljava/nio/FloatBuffer;

.field public c:[Ljava/nio/FloatBuffer;

.field protected d:I

.field protected e:I

.field protected f:I

.field protected g:I

.field protected h:I

.field protected i:Z

.field private j:I

.field private k:I

.field protected l:I

.field protected m:I

.field private n:Z

.field private o:Z

.field private p:Z

.field private q:F

.field private r:F

.field private s:F

.field private t:F

.field protected u:I

.field private v:I

.field private w:I


# direct methods
.method public constructor <init>()V
    .locals 8

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/xej;->i:Z

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    iput v1, p0, Ll/xej;->u:I

    .line 9
    .line 10
    iput v0, p0, Ll/xej;->v:I

    .line 11
    .line 12
    iput v0, p0, Ll/xej;->w:I

    .line 13
    .line 14
    iput-boolean v0, p0, Ll/xej;->o:Z

    .line 15
    .line 16
    const/16 v2, 0x8

    .line 17
    .line 18
    new-array v3, v2, [F

    .line 19
    .line 20
    fill-array-data v3, :array_0

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v3}, Ll/xej;->A([F)V

    .line 24
    .line 25
    .line 26
    const/4 v3, 0x4

    .line 27
    new-array v3, v3, [Ljava/nio/FloatBuffer;

    .line 28
    .line 29
    iput-object v3, p0, Ll/xej;->c:[Ljava/nio/FloatBuffer;

    .line 30
    .line 31
    new-array v4, v2, [F

    .line 32
    .line 33
    fill-array-data v4, :array_1

    .line 34
    .line 35
    .line 36
    const/16 v5, 0x20

    .line 37
    .line 38
    invoke-static {v5}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 39
    .line 40
    .line 41
    move-result-object v6

    .line 42
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 43
    .line 44
    .line 45
    move-result-object v7

    .line 46
    invoke-virtual {v6, v7}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 47
    .line 48
    .line 49
    move-result-object v6

    .line 50
    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 51
    .line 52
    .line 53
    move-result-object v6

    .line 54
    aput-object v6, v3, v0

    .line 55
    .line 56
    iget-object v3, p0, Ll/xej;->c:[Ljava/nio/FloatBuffer;

    .line 57
    .line 58
    aget-object v3, v3, v0

    .line 59
    .line 60
    invoke-virtual {v3, v4}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    invoke-virtual {v3, v0}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 65
    .line 66
    .line 67
    new-array v3, v2, [F

    .line 68
    .line 69
    fill-array-data v3, :array_2

    .line 70
    .line 71
    .line 72
    iget-object v4, p0, Ll/xej;->c:[Ljava/nio/FloatBuffer;

    .line 73
    .line 74
    invoke-static {v5}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 75
    .line 76
    .line 77
    move-result-object v6

    .line 78
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 79
    .line 80
    .line 81
    move-result-object v7

    .line 82
    invoke-virtual {v6, v7}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 83
    .line 84
    .line 85
    move-result-object v6

    .line 86
    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 87
    .line 88
    .line 89
    move-result-object v6

    .line 90
    aput-object v6, v4, v1

    .line 91
    .line 92
    iget-object v4, p0, Ll/xej;->c:[Ljava/nio/FloatBuffer;

    .line 93
    .line 94
    aget-object v4, v4, v1

    .line 95
    .line 96
    invoke-virtual {v4, v3}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 97
    .line 98
    .line 99
    move-result-object v3

    .line 100
    invoke-virtual {v3, v0}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 101
    .line 102
    .line 103
    new-array v3, v2, [F

    .line 104
    .line 105
    fill-array-data v3, :array_3

    .line 106
    .line 107
    .line 108
    iget-object v4, p0, Ll/xej;->c:[Ljava/nio/FloatBuffer;

    .line 109
    .line 110
    invoke-static {v5}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 111
    .line 112
    .line 113
    move-result-object v6

    .line 114
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 115
    .line 116
    .line 117
    move-result-object v7

    .line 118
    invoke-virtual {v6, v7}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 119
    .line 120
    .line 121
    move-result-object v6

    .line 122
    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 123
    .line 124
    .line 125
    move-result-object v6

    .line 126
    const/4 v7, 0x2

    .line 127
    aput-object v6, v4, v7

    .line 128
    .line 129
    iget-object v4, p0, Ll/xej;->c:[Ljava/nio/FloatBuffer;

    .line 130
    .line 131
    aget-object v4, v4, v7

    .line 132
    .line 133
    invoke-virtual {v4, v3}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 134
    .line 135
    .line 136
    move-result-object v3

    .line 137
    invoke-virtual {v3, v0}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 138
    .line 139
    .line 140
    new-array v2, v2, [F

    .line 141
    .line 142
    fill-array-data v2, :array_4

    .line 143
    .line 144
    .line 145
    iget-object v3, p0, Ll/xej;->c:[Ljava/nio/FloatBuffer;

    .line 146
    .line 147
    invoke-static {v5}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 148
    .line 149
    .line 150
    move-result-object v4

    .line 151
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 152
    .line 153
    .line 154
    move-result-object v5

    .line 155
    invoke-virtual {v4, v5}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 156
    .line 157
    .line 158
    move-result-object v4

    .line 159
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 160
    .line 161
    .line 162
    move-result-object v4

    .line 163
    const/4 v5, 0x3

    .line 164
    aput-object v4, v3, v5

    .line 165
    .line 166
    iget-object v3, p0, Ll/xej;->c:[Ljava/nio/FloatBuffer;

    .line 167
    .line 168
    aget-object v3, v3, v5

    .line 169
    .line 170
    invoke-virtual {v3, v2}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 171
    .line 172
    .line 173
    move-result-object v2

    .line 174
    invoke-virtual {v2, v0}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 175
    .line 176
    .line 177
    iput v0, p0, Ll/xej;->a:I

    .line 178
    .line 179
    iput v0, p0, Ll/xej;->h:I

    .line 180
    .line 181
    iput-boolean v0, p0, Ll/xej;->n:Z

    .line 182
    .line 183
    iput-boolean v0, p0, Ll/xej;->o:Z

    .line 184
    .line 185
    iput-boolean v0, p0, Ll/xej;->p:Z

    .line 186
    .line 187
    iput v1, p0, Ll/xej;->u:I

    .line 188
    .line 189
    return-void

    .line 190
    nop

    .line 191
    :array_0
    .array-data 4
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data

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
    :array_1
    .array-data 4
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data

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
    .line 222
    .line 223
    .line 224
    .line 225
    .line 226
    .line 227
    .line 228
    .line 229
    .line 230
    .line 231
    :array_2
    .array-data 4
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 232
    .line 233
    .line 234
    .line 235
    .line 236
    .line 237
    .line 238
    .line 239
    .line 240
    .line 241
    .line 242
    .line 243
    .line 244
    .line 245
    .line 246
    .line 247
    .line 248
    .line 249
    .line 250
    .line 251
    :array_3
    .array-data 4
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
    .end array-data

    .line 252
    .line 253
    .line 254
    .line 255
    .line 256
    .line 257
    .line 258
    .line 259
    .line 260
    .line 261
    .line 262
    .line 263
    .line 264
    .line 265
    .line 266
    .line 267
    .line 268
    .line 269
    .line 270
    .line 271
    :array_4
    .array-data 4
        0x3f800000    # 1.0f
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method


# virtual methods
.method public A([F)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    array-length v0, p1

    .line 4
    mul-int/lit8 v0, v0, 0x4

    .line 5
    .line 6
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iput-object v0, p0, Ll/xej;->b:Ljava/nio/FloatBuffer;

    .line 23
    .line 24
    invoke-virtual {v0, p1}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const/4 p1, 0x0

    .line 29
    invoke-virtual {p0, p1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public B(I)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/xej;->n:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, Ll/xej;->l:I

    .line 6
    .line 7
    if-eq v0, p1, :cond_0

    .line 8
    .line 9
    iput p1, p0, Ll/xej;->l:I

    .line 10
    .line 11
    const/4 p1, 0x1

    .line 12
    iput-boolean p1, p0, Ll/xej;->p:Z

    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public e()V
    .locals 3

    .line 1
    iget v0, p0, Ll/xej;->d:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "position"

    .line 5
    .line 6
    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glBindAttribLocation(IILjava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iget p0, p0, Ll/xej;->d:I

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    const-string v1, "inputTextureCoordinate"

    .line 13
    .line 14
    invoke-static {p0, v0, v1}, Landroid/opengl/GLES20;->glBindAttribLocation(IILjava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public f()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/xej;->o:Z

    .line 3
    .line 4
    iget v1, p0, Ll/xej;->d:I

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    invoke-static {v1}, Landroid/opengl/GLES20;->glDeleteProgram(I)V

    .line 9
    .line 10
    .line 11
    iput v0, p0, Ll/xej;->d:I

    .line 12
    .line 13
    :cond_0
    iget v1, p0, Ll/xej;->j:I

    .line 14
    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    invoke-static {v1}, Landroid/opengl/GLES20;->glDeleteShader(I)V

    .line 18
    .line 19
    .line 20
    iput v0, p0, Ll/xej;->j:I

    .line 21
    .line 22
    :cond_1
    iget v1, p0, Ll/xej;->k:I

    .line 23
    .line 24
    if-eqz v1, :cond_2

    .line 25
    .line 26
    invoke-static {v1}, Landroid/opengl/GLES20;->glDeleteShader(I)V

    .line 27
    .line 28
    .line 29
    iput v0, p0, Ll/xej;->k:I

    .line 30
    .line 31
    :cond_2
    return-void
.end method

.method public g()V
    .locals 1

    .line 1
    iget v0, p0, Ll/xej;->f:I

    .line 2
    .line 3
    invoke-static {v0}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 4
    .line 5
    .line 6
    iget p0, p0, Ll/xej;->g:I

    .line 7
    .line 8
    invoke-static {p0}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 9
    .line 10
    .line 11
    const/16 p0, 0xde1

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-static {p0, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public h()V
    .locals 10

    .line 1
    iget v0, p0, Ll/xej;->u:I

    .line 2
    .line 3
    const/16 v1, 0x4100

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    if-ne v0, v3, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/xej;->q()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-virtual {p0}, Ll/xej;->p()I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    invoke-static {v2, v2, v0, v3}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ll/xej;->l()F

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    invoke-virtual {p0}, Ll/xej;->k()F

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    invoke-virtual {p0}, Ll/xej;->j()F

    .line 29
    .line 30
    .line 31
    move-result v4

    .line 32
    invoke-virtual {p0}, Ll/xej;->i()F

    .line 33
    .line 34
    .line 35
    move-result v5

    .line 36
    invoke-static {v0, v3, v4, v5}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 37
    .line 38
    .line 39
    invoke-static {v1}, Landroid/opengl/GLES20;->glClear(I)V

    .line 40
    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_0
    iget v0, p0, Ll/xej;->m:I

    .line 44
    .line 45
    int-to-float v4, v0

    .line 46
    iget v5, p0, Ll/xej;->v:I

    .line 47
    .line 48
    int-to-float v6, v5

    .line 49
    const/high16 v7, 0x3f800000    # 1.0f

    .line 50
    .line 51
    mul-float/2addr v6, v7

    .line 52
    iget v8, p0, Ll/xej;->w:I

    .line 53
    .line 54
    int-to-float v9, v8

    .line 55
    div-float/2addr v6, v9

    .line 56
    mul-float/2addr v4, v6

    .line 57
    float-to-int v4, v4

    .line 58
    iget v6, p0, Ll/xej;->l:I

    .line 59
    .line 60
    int-to-float v9, v6

    .line 61
    int-to-float v8, v8

    .line 62
    mul-float/2addr v8, v7

    .line 63
    int-to-float v5, v5

    .line 64
    div-float/2addr v8, v5

    .line 65
    mul-float/2addr v9, v8

    .line 66
    float-to-int v5, v9

    .line 67
    if-ge v4, v6, :cond_1

    .line 68
    .line 69
    sub-int/2addr v6, v4

    .line 70
    div-int/lit8 v6, v6, 0x2

    .line 71
    .line 72
    move v5, v0

    .line 73
    move v0, v2

    .line 74
    goto :goto_0

    .line 75
    :cond_1
    if-ge v5, v0, :cond_2

    .line 76
    .line 77
    sub-int/2addr v0, v5

    .line 78
    div-int/lit8 v0, v0, 0x2

    .line 79
    .line 80
    move v4, v6

    .line 81
    move v6, v2

    .line 82
    goto :goto_0

    .line 83
    :cond_2
    move v5, v0

    .line 84
    move v0, v2

    .line 85
    move v4, v6

    .line 86
    move v6, v0

    .line 87
    :goto_0
    add-int/2addr v4, v3

    .line 88
    invoke-static {v6, v0, v4, v5}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0}, Ll/xej;->l()F

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    invoke-virtual {p0}, Ll/xej;->k()F

    .line 96
    .line 97
    .line 98
    move-result v3

    .line 99
    invoke-virtual {p0}, Ll/xej;->j()F

    .line 100
    .line 101
    .line 102
    move-result v4

    .line 103
    invoke-virtual {p0}, Ll/xej;->i()F

    .line 104
    .line 105
    .line 106
    move-result v5

    .line 107
    invoke-static {v0, v3, v4, v5}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 108
    .line 109
    .line 110
    invoke-static {v1}, Landroid/opengl/GLES20;->glClear(I)V

    .line 111
    .line 112
    .line 113
    :goto_1
    iget v0, p0, Ll/xej;->d:I

    .line 114
    .line 115
    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {p0}, Ll/xej;->w()V

    .line 119
    .line 120
    .line 121
    const/4 v0, 0x5

    .line 122
    const/4 v1, 0x4

    .line 123
    invoke-static {v0, v2, v1}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {p0}, Ll/xej;->g()V

    .line 127
    .line 128
    .line 129
    return-void
.end method

.method public i()F
    .locals 0

    .line 1
    iget p0, p0, Ll/xej;->t:F

    .line 2
    .line 3
    return p0
.end method

.method public j()F
    .locals 0

    .line 1
    iget p0, p0, Ll/xej;->s:F

    .line 2
    .line 3
    return p0
.end method

.method public k()F
    .locals 0

    .line 1
    iget p0, p0, Ll/xej;->r:F

    .line 2
    .line 3
    return p0
.end method

.method public l()F
    .locals 0

    .line 1
    iget p0, p0, Ll/xej;->q:F

    .line 2
    .line 3
    return p0
.end method

.method public m()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nvarying vec2 textureCoordinate;\nvoid main(){\n   gl_FragColor = texture2D(inputImageTexture0,textureCoordinate);\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public n()I
    .locals 0

    .line 1
    iget p0, p0, Ll/xej;->m:I

    .line 2
    .line 3
    return p0
.end method

.method public o()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "attribute vec4 position;\nattribute vec2 inputTextureCoordinate;\nvarying vec2 textureCoordinate;\nvoid main() {\n  textureCoordinate = inputTextureCoordinate;\n   gl_Position = position;\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public p()I
    .locals 0

    .line 1
    iget p0, p0, Ll/xej;->m:I

    .line 2
    .line 3
    return p0
.end method

.method public q()I
    .locals 0

    .line 1
    iget p0, p0, Ll/xej;->l:I

    .line 2
    .line 3
    return p0
.end method

.method public r()I
    .locals 0

    .line 1
    iget p0, p0, Ll/xej;->l:I

    .line 2
    .line 3
    return p0
.end method

.method public s()V
    .locals 0

    .line 1
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    iget v0, p0, Ll/xej;->d:I

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
    iput v0, p0, Ll/xej;->e:I

    .line 10
    .line 11
    iget v0, p0, Ll/xej;->d:I

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
    iput v0, p0, Ll/xej;->f:I

    .line 20
    .line 21
    iget v0, p0, Ll/xej;->d:I

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
    iput v0, p0, Ll/xej;->g:I

    .line 30
    .line 31
    return-void
.end method

.method public u()V
    .locals 6

    .line 1
    invoke-virtual {p0}, Ll/xej;->o()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/xej;->m()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const v2, 0x8b31

    .line 10
    .line 11
    .line 12
    invoke-static {v2}, Landroid/opengl/GLES20;->glCreateShader(I)I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    iput v2, p0, Ll/xej;->j:I

    .line 17
    .line 18
    const v3, 0x8b81

    .line 19
    .line 20
    .line 21
    const/4 v4, 0x1

    .line 22
    const/4 v5, 0x0

    .line 23
    if-eqz v2, :cond_0

    .line 24
    .line 25
    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glShaderSource(ILjava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget v0, p0, Ll/xej;->j:I

    .line 29
    .line 30
    invoke-static {v0}, Landroid/opengl/GLES20;->glCompileShader(I)V

    .line 31
    .line 32
    .line 33
    new-array v0, v4, [I

    .line 34
    .line 35
    iget v2, p0, Ll/xej;->j:I

    .line 36
    .line 37
    invoke-static {v2, v3, v0, v5}, Landroid/opengl/GLES20;->glGetShaderiv(II[II)V

    .line 38
    .line 39
    .line 40
    aget v0, v0, v5

    .line 41
    .line 42
    if-nez v0, :cond_0

    .line 43
    .line 44
    iget v0, p0, Ll/xej;->j:I

    .line 45
    .line 46
    invoke-static {v0}, Landroid/opengl/GLES20;->glGetShaderInfoLog(I)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iget v2, p0, Ll/xej;->j:I

    .line 51
    .line 52
    invoke-static {v2}, Landroid/opengl/GLES20;->glDeleteShader(I)V

    .line 53
    .line 54
    .line 55
    iput v5, p0, Ll/xej;->j:I

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_0
    const-string v0, "none"

    .line 59
    .line 60
    :goto_0
    iget v2, p0, Ll/xej;->j:I

    .line 61
    .line 62
    if-eqz v2, :cond_5

    .line 63
    .line 64
    const v2, 0x8b30

    .line 65
    .line 66
    .line 67
    invoke-static {v2}, Landroid/opengl/GLES20;->glCreateShader(I)I

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    iput v2, p0, Ll/xej;->k:I

    .line 72
    .line 73
    if-eqz v2, :cond_1

    .line 74
    .line 75
    invoke-static {v2, v1}, Landroid/opengl/GLES20;->glShaderSource(ILjava/lang/String;)V

    .line 76
    .line 77
    .line 78
    iget v1, p0, Ll/xej;->k:I

    .line 79
    .line 80
    invoke-static {v1}, Landroid/opengl/GLES20;->glCompileShader(I)V

    .line 81
    .line 82
    .line 83
    new-array v1, v4, [I

    .line 84
    .line 85
    iget v2, p0, Ll/xej;->k:I

    .line 86
    .line 87
    invoke-static {v2, v3, v1, v5}, Landroid/opengl/GLES20;->glGetShaderiv(II[II)V

    .line 88
    .line 89
    .line 90
    aget v1, v1, v5

    .line 91
    .line 92
    if-nez v1, :cond_1

    .line 93
    .line 94
    iget v0, p0, Ll/xej;->k:I

    .line 95
    .line 96
    invoke-static {v0}, Landroid/opengl/GLES20;->glGetShaderInfoLog(I)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    iget v1, p0, Ll/xej;->k:I

    .line 101
    .line 102
    invoke-static {v1}, Landroid/opengl/GLES20;->glDeleteShader(I)V

    .line 103
    .line 104
    .line 105
    iput v5, p0, Ll/xej;->k:I

    .line 106
    .line 107
    :cond_1
    iget v1, p0, Ll/xej;->k:I

    .line 108
    .line 109
    if-eqz v1, :cond_4

    .line 110
    .line 111
    invoke-static {}, Landroid/opengl/GLES20;->glCreateProgram()I

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    iput v0, p0, Ll/xej;->d:I

    .line 116
    .line 117
    if-eqz v0, :cond_2

    .line 118
    .line 119
    iget v1, p0, Ll/xej;->j:I

    .line 120
    .line 121
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glAttachShader(II)V

    .line 122
    .line 123
    .line 124
    iget v0, p0, Ll/xej;->d:I

    .line 125
    .line 126
    iget v1, p0, Ll/xej;->k:I

    .line 127
    .line 128
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glAttachShader(II)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {p0}, Ll/xej;->e()V

    .line 132
    .line 133
    .line 134
    iget v0, p0, Ll/xej;->d:I

    .line 135
    .line 136
    invoke-static {v0}, Landroid/opengl/GLES20;->glLinkProgram(I)V

    .line 137
    .line 138
    .line 139
    new-array v0, v4, [I

    .line 140
    .line 141
    iget v1, p0, Ll/xej;->d:I

    .line 142
    .line 143
    const v2, 0x8b82

    .line 144
    .line 145
    .line 146
    invoke-static {v1, v2, v0, v5}, Landroid/opengl/GLES20;->glGetProgramiv(II[II)V

    .line 147
    .line 148
    .line 149
    aget v0, v0, v5

    .line 150
    .line 151
    if-nez v0, :cond_2

    .line 152
    .line 153
    iget v0, p0, Ll/xej;->d:I

    .line 154
    .line 155
    invoke-static {v0}, Landroid/opengl/GLES20;->glDeleteProgram(I)V

    .line 156
    .line 157
    .line 158
    iput v5, p0, Ll/xej;->d:I

    .line 159
    .line 160
    :cond_2
    iget v0, p0, Ll/xej;->d:I

    .line 161
    .line 162
    if-eqz v0, :cond_3

    .line 163
    .line 164
    invoke-virtual {p0}, Ll/xej;->t()V

    .line 165
    .line 166
    .line 167
    return-void

    .line 168
    :cond_3
    const-string p0, "Could not create program."

    .line 169
    .line 170
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 171
    .line 172
    .line 173
    return-void

    .line 174
    :cond_4
    const-string v1, ": Could not create fragment shader. Reason: "

    .line 175
    .line 176
    invoke-static {p0, v1, v0}, Ll/tmw;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 177
    .line 178
    .line 179
    return-void

    .line 180
    :cond_5
    const-string v1, ": Could not create vertex shader. Reason: "

    .line 181
    .line 182
    invoke-static {p0, v1, v0}, Ll/tmw;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 183
    .line 184
    .line 185
    return-void
.end method

.method public v()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/xej;->o:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xej;->u()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Ll/xej;->o:Z

    .line 10
    .line 11
    :cond_0
    iget-boolean v0, p0, Ll/xej;->p:Z

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/xej;->s()V

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-boolean v0, p0, Ll/xej;->p:Z

    .line 20
    .line 21
    :cond_1
    invoke-virtual {p0}, Ll/xej;->h()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public w()V
    .locals 8

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
    iget v2, p0, Ll/xej;->f:I

    .line 8
    .line 9
    const/16 v6, 0x8

    .line 10
    .line 11
    iget-object v7, p0, Ll/xej;->b:Ljava/nio/FloatBuffer;

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
    iget v0, p0, Ll/xej;->f:I

    .line 21
    .line 22
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/xej;->c:[Ljava/nio/FloatBuffer;

    .line 26
    .line 27
    iget v2, p0, Ll/xej;->a:I

    .line 28
    .line 29
    aget-object v0, v0, v2

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 32
    .line 33
    .line 34
    iget v2, p0, Ll/xej;->g:I

    .line 35
    .line 36
    iget-object v0, p0, Ll/xej;->c:[Ljava/nio/FloatBuffer;

    .line 37
    .line 38
    iget v3, p0, Ll/xej;->a:I

    .line 39
    .line 40
    aget-object v7, v0, v3

    .line 41
    .line 42
    const/4 v3, 0x2

    .line 43
    invoke-static/range {v2 .. v7}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 44
    .line 45
    .line 46
    iget v0, p0, Ll/xej;->g:I

    .line 47
    .line 48
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 49
    .line 50
    .line 51
    const v0, 0x84c0

    .line 52
    .line 53
    .line 54
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 55
    .line 56
    .line 57
    const/16 v0, 0xde1

    .line 58
    .line 59
    iget v2, p0, Ll/xej;->h:I

    .line 60
    .line 61
    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 62
    .line 63
    .line 64
    iget p0, p0, Ll/xej;->e:I

    .line 65
    .line 66
    invoke-static {p0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public x(I)V
    .locals 1

    .line 1
    iget v0, p0, Ll/xej;->a:I

    .line 2
    .line 3
    add-int/2addr v0, p1

    .line 4
    rem-int/lit8 v0, v0, 0x4

    .line 5
    .line 6
    iput v0, p0, Ll/xej;->a:I

    .line 7
    .line 8
    rem-int/lit8 p1, p1, 0x2

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    if-ne p1, v0, :cond_0

    .line 12
    .line 13
    iget p1, p0, Ll/xej;->l:I

    .line 14
    .line 15
    iget v0, p0, Ll/xej;->m:I

    .line 16
    .line 17
    iput v0, p0, Ll/xej;->l:I

    .line 18
    .line 19
    iput p1, p0, Ll/xej;->m:I

    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public y(I)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/xej;->n:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, Ll/xej;->m:I

    .line 6
    .line 7
    if-eq v0, p1, :cond_0

    .line 8
    .line 9
    iput p1, p0, Ll/xej;->m:I

    .line 10
    .line 11
    const/4 p1, 0x1

    .line 12
    iput-boolean p1, p0, Ll/xej;->p:Z

    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public z(II)V
    .locals 3

    .line 1
    iget v0, p0, Ll/xej;->a:I

    .line 2
    .line 3
    rem-int/lit8 v0, v0, 0x2

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    move v2, p2

    .line 9
    move p2, p1

    .line 10
    move p1, v2

    .line 11
    :cond_0
    iget-boolean v0, p0, Ll/xej;->n:Z

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget v0, p0, Ll/xej;->l:I

    .line 16
    .line 17
    if-ne v0, p1, :cond_1

    .line 18
    .line 19
    iget v0, p0, Ll/xej;->m:I

    .line 20
    .line 21
    if-eq v0, p2, :cond_2

    .line 22
    .line 23
    :cond_1
    iput-boolean v1, p0, Ll/xej;->p:Z

    .line 24
    .line 25
    :cond_2
    iput p1, p0, Ll/xej;->l:I

    .line 26
    .line 27
    iput p2, p0, Ll/xej;->m:I

    .line 28
    .line 29
    iput-boolean v1, p0, Ll/xej;->n:Z

    .line 30
    .line 31
    return-void
.end method
