.class public Lcom/tencent/liteav/basic/c/e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/liteav/basic/c/g$a;


# instance fields
.field private volatile a:Landroid/os/HandlerThread;

.field private volatile b:Lcom/tencent/liteav/basic/c/g;

.field private c:Lcom/tencent/liteav/basic/c/h;

.field private d:I

.field private e:Z

.field private f:F

.field private g:F

.field private h:I

.field private i:I

.field private j:I

.field private k:I

.field private l:Z

.field private m:Lcom/tencent/liteav/basic/c/o;

.field private n:Z


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/tencent/liteav/basic/c/e;->a:Landroid/os/HandlerThread;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/tencent/liteav/basic/c/e;->b:Lcom/tencent/liteav/basic/c/g;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/tencent/liteav/basic/c/e;->c:Lcom/tencent/liteav/basic/c/h;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    iput v1, p0, Lcom/tencent/liteav/basic/c/e;->d:I

    .line 13
    .line 14
    iput-boolean v1, p0, Lcom/tencent/liteav/basic/c/e;->e:Z

    .line 15
    .line 16
    const/high16 v2, 0x3f800000    # 1.0f

    .line 17
    .line 18
    iput v2, p0, Lcom/tencent/liteav/basic/c/e;->f:F

    .line 19
    .line 20
    iput v2, p0, Lcom/tencent/liteav/basic/c/e;->g:F

    .line 21
    .line 22
    iput v1, p0, Lcom/tencent/liteav/basic/c/e;->h:I

    .line 23
    .line 24
    iput v1, p0, Lcom/tencent/liteav/basic/c/e;->i:I

    .line 25
    .line 26
    iput v1, p0, Lcom/tencent/liteav/basic/c/e;->j:I

    .line 27
    .line 28
    iput v1, p0, Lcom/tencent/liteav/basic/c/e;->k:I

    .line 29
    .line 30
    iput-boolean v1, p0, Lcom/tencent/liteav/basic/c/e;->l:Z

    .line 31
    .line 32
    iput-object v0, p0, Lcom/tencent/liteav/basic/c/e;->m:Lcom/tencent/liteav/basic/c/o;

    .line 33
    .line 34
    iput-boolean v1, p0, Lcom/tencent/liteav/basic/c/e;->n:Z

    .line 35
    .line 36
    return-void
.end method

.method public static synthetic a(Lcom/tencent/liteav/basic/c/e;I)I
    .locals 0

    .line 111
    iput p1, p0, Lcom/tencent/liteav/basic/c/e;->h:I

    return p1
.end method

.method private a(II)V
    .locals 12

    .line 1
    iget-boolean v0, p0, Lcom/tencent/liteav/basic/c/e;->l:Z

    .line 2
    .line 3
    if-eqz v0, :cond_5

    .line 4
    .line 5
    iget v0, p0, Lcom/tencent/liteav/basic/c/e;->j:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_4

    .line 9
    .line 10
    iget v2, p0, Lcom/tencent/liteav/basic/c/e;->k:I

    .line 11
    .line 12
    if-eqz v2, :cond_4

    .line 13
    .line 14
    if-gt v0, v2, :cond_0

    .line 15
    .line 16
    const/4 v3, 0x1

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    move v3, v1

    .line 19
    :goto_0
    if-lt v2, v0, :cond_1

    .line 20
    .line 21
    move v4, v2

    .line 22
    goto :goto_1

    .line 23
    :cond_1
    move v4, v0

    .line 24
    :goto_1
    if-lt v2, v0, :cond_2

    .line 25
    .line 26
    goto :goto_2

    .line 27
    :cond_2
    move v0, v2

    .line 28
    :goto_2
    if-eqz v3, :cond_3

    .line 29
    .line 30
    move v7, v0

    .line 31
    move v8, v4

    .line 32
    goto :goto_3

    .line 33
    :cond_3
    move v8, v0

    .line 34
    move v7, v4

    .line 35
    :goto_3
    mul-int v0, v7, v8

    .line 36
    .line 37
    mul-int/lit8 v0, v0, 0x4

    .line 38
    .line 39
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 40
    .line 41
    .line 42
    move-result-object v11

    .line 43
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 44
    .line 45
    invoke-static {v7, v8, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v11, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 50
    .line 51
    .line 52
    const/16 v9, 0x1908

    .line 53
    .line 54
    const/16 v10, 0x1401

    .line 55
    .line 56
    move v5, p1

    .line 57
    move v6, p2

    .line 58
    invoke-static/range {v5 .. v11}, Landroid/opengl/GLES20;->glReadPixels(IIIIIILjava/nio/Buffer;)V

    .line 59
    .line 60
    .line 61
    iget-object p1, p0, Lcom/tencent/liteav/basic/c/e;->m:Lcom/tencent/liteav/basic/c/o;

    .line 62
    .line 63
    if-eqz p1, :cond_4

    .line 64
    .line 65
    new-instance p2, Ljava/lang/Thread;

    .line 66
    .line 67
    new-instance v5, Lcom/tencent/liteav/basic/c/e$4;

    .line 68
    .line 69
    move-object v6, p0

    .line 70
    move v9, v7

    .line 71
    move v10, v8

    .line 72
    move-object v7, v11

    .line 73
    move-object v11, p1

    .line 74
    move-object v8, v0

    .line 75
    invoke-direct/range {v5 .. v11}, Lcom/tencent/liteav/basic/c/e$4;-><init>(Lcom/tencent/liteav/basic/c/e;Ljava/nio/ByteBuffer;Landroid/graphics/Bitmap;IILcom/tencent/liteav/basic/c/o;)V

    .line 76
    .line 77
    .line 78
    invoke-direct {p2, v5}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p2}, Ljava/lang/Thread;->start()V

    .line 82
    .line 83
    .line 84
    goto :goto_4

    .line 85
    :cond_4
    move-object v6, p0

    .line 86
    :goto_4
    const/4 p0, 0x0

    .line 87
    iput-object p0, v6, Lcom/tencent/liteav/basic/c/e;->m:Lcom/tencent/liteav/basic/c/o;

    .line 88
    .line 89
    iput-boolean v1, v6, Lcom/tencent/liteav/basic/c/e;->l:Z

    .line 90
    .line 91
    :cond_5
    return-void
.end method

.method public static synthetic a(Lcom/tencent/liteav/basic/c/e;IZIIIIIZZ)V
    .locals 0

    .line 92
    invoke-direct/range {p0 .. p9}, Lcom/tencent/liteav/basic/c/e;->b(IZIIIIIZZ)V

    return-void
.end method

.method private a(IIII)[I
    .locals 3

    int-to-float p0, p2

    int-to-float v0, p1

    div-float v1, p0, v0

    int-to-float p4, p4

    int-to-float p3, p3

    div-float/2addr p4, p3

    cmpl-float p3, v1, p4

    const/4 v1, 0x0

    if-lez p3, :cond_0

    mul-float/2addr v0, p4

    float-to-int p0, v0

    sub-int/2addr p2, p0

    .line 108
    div-int/lit8 p2, p2, 0x2

    move v2, p2

    move p2, p0

    move p0, v2

    goto :goto_0

    :cond_0
    div-float/2addr p0, p4

    float-to-int p0, p0

    sub-int/2addr p1, p0

    .line 109
    div-int/lit8 p1, p1, 0x2

    move v2, p1

    move p1, p0

    move p0, v1

    move v1, v2

    .line 110
    :goto_0
    filled-new-array {p1, p2, v1, p0}, [I

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b(Lcom/tencent/liteav/basic/c/e;I)I
    .locals 0

    .line 339
    iput p1, p0, Lcom/tencent/liteav/basic/c/e;->i:I

    return p1
.end method

.method private b(IZIIIIIZZ)V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p3

    .line 4
    .line 5
    move/from16 v2, p6

    .line 6
    .line 7
    move/from16 v3, p7

    .line 8
    .line 9
    if-eqz v2, :cond_19

    .line 10
    .line 11
    if-eqz v3, :cond_19

    .line 12
    .line 13
    iget-object v4, v0, Lcom/tencent/liteav/basic/c/e;->c:Lcom/tencent/liteav/basic/c/h;

    .line 14
    .line 15
    if-nez v4, :cond_0

    .line 16
    .line 17
    goto/16 :goto_16

    .line 18
    .line 19
    :cond_0
    iget-boolean v4, v0, Lcom/tencent/liteav/basic/c/e;->n:Z

    .line 20
    .line 21
    const/4 v9, 0x0

    .line 22
    if-eqz v4, :cond_1

    .line 23
    .line 24
    iput-boolean v9, v0, Lcom/tencent/liteav/basic/c/e;->n:Z

    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    const v10, 0x8d40

    .line 28
    .line 29
    .line 30
    const/16 v11, 0x4100

    .line 31
    .line 32
    const/high16 v12, 0x3f800000    # 1.0f

    .line 33
    .line 34
    const/4 v13, 0x0

    .line 35
    const/4 v4, 0x1

    .line 36
    if-eqz p8, :cond_3

    .line 37
    .line 38
    invoke-static {v13, v13, v13, v12}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 39
    .line 40
    .line 41
    invoke-static {v11}, Landroid/opengl/GLES20;->glClear(I)V

    .line 42
    .line 43
    .line 44
    invoke-static {v10, v9}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 45
    .line 46
    .line 47
    iget-object v5, v0, Lcom/tencent/liteav/basic/c/e;->b:Lcom/tencent/liteav/basic/c/g;

    .line 48
    .line 49
    if-eqz v5, :cond_2

    .line 50
    .line 51
    iget-object v5, v0, Lcom/tencent/liteav/basic/c/e;->b:Lcom/tencent/liteav/basic/c/g;

    .line 52
    .line 53
    invoke-virtual {v5}, Lcom/tencent/liteav/basic/c/g;->c()V

    .line 54
    .line 55
    .line 56
    :cond_2
    iput-boolean v4, v0, Lcom/tencent/liteav/basic/c/e;->n:Z

    .line 57
    .line 58
    :cond_3
    if-eqz p4, :cond_4

    .line 59
    .line 60
    move/from16 v5, p4

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_4
    move v5, v2

    .line 64
    :goto_0
    if-eqz p5, :cond_5

    .line 65
    .line 66
    move/from16 v6, p5

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_5
    move v6, v3

    .line 70
    :goto_1
    iget v7, v0, Lcom/tencent/liteav/basic/c/e;->h:I

    .line 71
    .line 72
    const/4 v8, 0x2

    .line 73
    const/16 v14, 0x10e

    .line 74
    .line 75
    const/16 v15, 0x5a

    .line 76
    .line 77
    if-nez v7, :cond_6

    .line 78
    .line 79
    move v7, v9

    .line 80
    move/from16 v16, v11

    .line 81
    .line 82
    :goto_2
    move v11, v7

    .line 83
    goto :goto_7

    .line 84
    :cond_6
    if-ne v7, v4, :cond_b

    .line 85
    .line 86
    iget v7, v0, Lcom/tencent/liteav/basic/c/e;->d:I

    .line 87
    .line 88
    rsub-int v7, v7, 0x2d0

    .line 89
    .line 90
    rem-int/lit16 v7, v7, 0x168

    .line 91
    .line 92
    if-eq v7, v15, :cond_8

    .line 93
    .line 94
    if-ne v7, v14, :cond_7

    .line 95
    .line 96
    goto :goto_3

    .line 97
    :cond_7
    move v7, v9

    .line 98
    goto :goto_4

    .line 99
    :cond_8
    :goto_3
    move v7, v4

    .line 100
    :goto_4
    move/from16 v16, v11

    .line 101
    .line 102
    if-eqz v7, :cond_9

    .line 103
    .line 104
    move v11, v3

    .line 105
    goto :goto_5

    .line 106
    :cond_9
    move v11, v2

    .line 107
    :goto_5
    if-eqz v7, :cond_a

    .line 108
    .line 109
    move v7, v2

    .line 110
    goto :goto_6

    .line 111
    :cond_a
    move v7, v3

    .line 112
    :goto_6
    invoke-direct {v0, v5, v6, v11, v7}, Lcom/tencent/liteav/basic/c/e;->a(IIII)[I

    .line 113
    .line 114
    .line 115
    move-result-object v5

    .line 116
    aget v6, v5, v9

    .line 117
    .line 118
    aget v7, v5, v4

    .line 119
    .line 120
    aget v11, v5, v8

    .line 121
    .line 122
    const/16 v17, 0x3

    .line 123
    .line 124
    aget v5, v5, v17

    .line 125
    .line 126
    move/from16 v18, v11

    .line 127
    .line 128
    move v11, v5

    .line 129
    move v5, v6

    .line 130
    move v6, v7

    .line 131
    move/from16 v7, v18

    .line 132
    .line 133
    goto :goto_7

    .line 134
    :cond_b
    move/from16 v16, v11

    .line 135
    .line 136
    move v7, v9

    .line 137
    goto :goto_2

    .line 138
    :goto_7
    iput v5, v0, Lcom/tencent/liteav/basic/c/e;->j:I

    .line 139
    .line 140
    iput v6, v0, Lcom/tencent/liteav/basic/c/e;->k:I

    .line 141
    .line 142
    invoke-static {v7, v11, v5, v6}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 143
    .line 144
    .line 145
    iget v10, v0, Lcom/tencent/liteav/basic/c/e;->i:I

    .line 146
    .line 147
    if-ne v10, v4, :cond_c

    .line 148
    .line 149
    if-nez p9, :cond_d

    .line 150
    .line 151
    :goto_8
    xor-int/lit8 v8, p2, 0x1

    .line 152
    .line 153
    goto :goto_9

    .line 154
    :cond_c
    if-ne v10, v8, :cond_d

    .line 155
    .line 156
    if-eqz p9, :cond_d

    .line 157
    .line 158
    goto :goto_8

    .line 159
    :cond_d
    move/from16 v8, p2

    .line 160
    .line 161
    :goto_9
    if-eqz v6, :cond_e

    .line 162
    .line 163
    int-to-float v10, v5

    .line 164
    int-to-float v12, v6

    .line 165
    div-float/2addr v10, v12

    .line 166
    goto :goto_a

    .line 167
    :cond_e
    const/high16 v10, 0x3f800000    # 1.0f

    .line 168
    .line 169
    :goto_a
    if-eqz v3, :cond_f

    .line 170
    .line 171
    int-to-float v12, v2

    .line 172
    int-to-float v13, v3

    .line 173
    div-float/2addr v12, v13

    .line 174
    goto :goto_b

    .line 175
    :cond_f
    const/high16 v12, 0x3f800000    # 1.0f

    .line 176
    .line 177
    :goto_b
    iget-boolean v13, v0, Lcom/tencent/liteav/basic/c/e;->e:Z

    .line 178
    .line 179
    if-ne v13, v8, :cond_11

    .line 180
    .line 181
    iget v13, v0, Lcom/tencent/liteav/basic/c/e;->d:I

    .line 182
    .line 183
    if-ne v13, v1, :cond_11

    .line 184
    .line 185
    iget v13, v0, Lcom/tencent/liteav/basic/c/e;->f:F

    .line 186
    .line 187
    cmpl-float v13, v13, v10

    .line 188
    .line 189
    if-nez v13, :cond_11

    .line 190
    .line 191
    iget v13, v0, Lcom/tencent/liteav/basic/c/e;->g:F

    .line 192
    .line 193
    cmpl-float v13, v13, v12

    .line 194
    .line 195
    if-eqz v13, :cond_10

    .line 196
    .line 197
    goto :goto_d

    .line 198
    :cond_10
    move v12, v7

    .line 199
    :goto_c
    const/high16 v1, 0x3f800000    # 1.0f

    .line 200
    .line 201
    const/4 v2, 0x0

    .line 202
    goto/16 :goto_15

    .line 203
    .line 204
    :cond_11
    :goto_d
    iput-boolean v8, v0, Lcom/tencent/liteav/basic/c/e;->e:Z

    .line 205
    .line 206
    iput v1, v0, Lcom/tencent/liteav/basic/c/e;->d:I

    .line 207
    .line 208
    iput v10, v0, Lcom/tencent/liteav/basic/c/e;->f:F

    .line 209
    .line 210
    iput v12, v0, Lcom/tencent/liteav/basic/c/e;->g:F

    .line 211
    .line 212
    rsub-int v1, v1, 0x2d0

    .line 213
    .line 214
    rem-int/lit16 v1, v1, 0x168

    .line 215
    .line 216
    if-eq v1, v15, :cond_13

    .line 217
    .line 218
    if-ne v1, v14, :cond_12

    .line 219
    .line 220
    goto :goto_e

    .line 221
    :cond_12
    move v10, v9

    .line 222
    goto :goto_f

    .line 223
    :cond_13
    :goto_e
    move v10, v4

    .line 224
    :goto_f
    if-eqz v10, :cond_14

    .line 225
    .line 226
    move v8, v6

    .line 227
    goto :goto_10

    .line 228
    :cond_14
    move v8, v5

    .line 229
    :goto_10
    if-eqz v10, :cond_15

    .line 230
    .line 231
    :goto_11
    move v6, v1

    .line 232
    goto :goto_12

    .line 233
    :cond_15
    move v5, v6

    .line 234
    goto :goto_11

    .line 235
    :goto_12
    iget-object v1, v0, Lcom/tencent/liteav/basic/c/e;->c:Lcom/tencent/liteav/basic/c/h;

    .line 236
    .line 237
    sget-object v12, Lcom/tencent/liteav/basic/c/k;->a:Lcom/tencent/liteav/basic/c/k;

    .line 238
    .line 239
    invoke-static {v12, v9, v4}, Lcom/tencent/liteav/basic/c/l;->a(Lcom/tencent/liteav/basic/c/k;ZZ)[F

    .line 240
    .line 241
    .line 242
    move-result-object v4

    .line 243
    int-to-float v8, v8

    .line 244
    int-to-float v5, v5

    .line 245
    div-float/2addr v8, v5

    .line 246
    if-eqz v10, :cond_16

    .line 247
    .line 248
    move v5, v9

    .line 249
    goto :goto_13

    .line 250
    :cond_16
    iget-boolean v5, v0, Lcom/tencent/liteav/basic/c/e;->e:Z

    .line 251
    .line 252
    :goto_13
    if-eqz v10, :cond_17

    .line 253
    .line 254
    iget-boolean v12, v0, Lcom/tencent/liteav/basic/c/e;->e:Z

    .line 255
    .line 256
    move/from16 v18, v5

    .line 257
    .line 258
    move-object v5, v4

    .line 259
    move v4, v6

    .line 260
    move v6, v8

    .line 261
    move v8, v12

    .line 262
    move v12, v7

    .line 263
    move/from16 v7, v18

    .line 264
    .line 265
    goto :goto_14

    .line 266
    :cond_17
    move v12, v7

    .line 267
    move v7, v5

    .line 268
    move-object v5, v4

    .line 269
    move v4, v6

    .line 270
    move v6, v8

    .line 271
    move v8, v9

    .line 272
    :goto_14
    invoke-virtual/range {v1 .. v8}, Lcom/tencent/liteav/basic/c/h;->a(III[FFZZ)V

    .line 273
    .line 274
    .line 275
    iget-object v1, v0, Lcom/tencent/liteav/basic/c/e;->c:Lcom/tencent/liteav/basic/c/h;

    .line 276
    .line 277
    if-eqz v10, :cond_18

    .line 278
    .line 279
    invoke-virtual {v1}, Lcom/tencent/liteav/basic/c/h;->g()V

    .line 280
    .line 281
    .line 282
    goto :goto_c

    .line 283
    :cond_18
    invoke-virtual {v1}, Lcom/tencent/liteav/basic/c/h;->h()V

    .line 284
    .line 285
    .line 286
    goto :goto_c

    .line 287
    :goto_15
    invoke-static {v2, v2, v2, v1}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 288
    .line 289
    .line 290
    invoke-static/range {v16 .. v16}, Landroid/opengl/GLES20;->glClear(I)V

    .line 291
    .line 292
    .line 293
    const v1, 0x8d40

    .line 294
    .line 295
    .line 296
    invoke-static {v1, v9}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 297
    .line 298
    .line 299
    iget-object v1, v0, Lcom/tencent/liteav/basic/c/e;->c:Lcom/tencent/liteav/basic/c/h;

    .line 300
    .line 301
    move/from16 v2, p1

    .line 302
    .line 303
    invoke-virtual {v1, v2}, Lcom/tencent/liteav/basic/c/h;->a(I)I

    .line 304
    .line 305
    .line 306
    invoke-direct {v0, v12, v11}, Lcom/tencent/liteav/basic/c/e;->a(II)V

    .line 307
    .line 308
    .line 309
    iget-object v1, v0, Lcom/tencent/liteav/basic/c/e;->b:Lcom/tencent/liteav/basic/c/g;

    .line 310
    .line 311
    if-eqz v1, :cond_19

    .line 312
    .line 313
    iget-object v0, v0, Lcom/tencent/liteav/basic/c/e;->b:Lcom/tencent/liteav/basic/c/g;

    .line 314
    .line 315
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/g;->c()V

    .line 316
    .line 317
    .line 318
    :cond_19
    :goto_16
    return-void
.end method

.method private b(Ljava/lang/Object;Landroid/view/Surface;)V
    .locals 3

    .line 323
    const-string v0, "surface-render: create gl thread "

    invoke-direct {p0}, Lcom/tencent/liteav/basic/c/e;->f()V

    .line 324
    monitor-enter p0

    .line 325
    :try_start_0
    new-instance v1, Landroid/os/HandlerThread;

    const-string v2, "TXGLSurfaceRenderThread"

    invoke-direct {v1, v2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/tencent/liteav/basic/c/e;->a:Landroid/os/HandlerThread;

    .line 326
    iget-object v1, p0, Lcom/tencent/liteav/basic/c/e;->a:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 327
    new-instance v1, Lcom/tencent/liteav/basic/c/g;

    iget-object v2, p0, Lcom/tencent/liteav/basic/c/e;->a:Landroid/os/HandlerThread;

    invoke-virtual {v2}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/tencent/liteav/basic/c/g;-><init>(Landroid/os/Looper;)V

    iput-object v1, p0, Lcom/tencent/liteav/basic/c/e;->b:Lcom/tencent/liteav/basic/c/g;

    .line 328
    iget-object v1, p0, Lcom/tencent/liteav/basic/c/e;->b:Lcom/tencent/liteav/basic/c/g;

    invoke-virtual {v1, p0}, Lcom/tencent/liteav/basic/c/g;->a(Lcom/tencent/liteav/basic/c/g$a;)V

    if-eqz p1, :cond_1

    .line 329
    instance-of v1, p1, Ljavax/microedition/khronos/egl/EGLContext;

    if-eqz v1, :cond_0

    goto :goto_0

    .line 330
    :cond_0
    iget-object v1, p0, Lcom/tencent/liteav/basic/c/e;->b:Lcom/tencent/liteav/basic/c/g;

    const/4 v2, 0x1

    iput-boolean v2, v1, Lcom/tencent/liteav/basic/c/g;->d:Z

    .line 331
    iget-object v1, p0, Lcom/tencent/liteav/basic/c/e;->b:Lcom/tencent/liteav/basic/c/g;

    check-cast p1, Landroid/opengl/EGLContext;

    iput-object p1, v1, Lcom/tencent/liteav/basic/c/g;->f:Landroid/opengl/EGLContext;

    goto :goto_1

    :catchall_0
    move-exception p1

    goto :goto_2

    .line 332
    :cond_1
    :goto_0
    iget-object v1, p0, Lcom/tencent/liteav/basic/c/e;->b:Lcom/tencent/liteav/basic/c/g;

    const/4 v2, 0x0

    iput-boolean v2, v1, Lcom/tencent/liteav/basic/c/g;->d:Z

    .line 333
    iget-object v1, p0, Lcom/tencent/liteav/basic/c/e;->b:Lcom/tencent/liteav/basic/c/g;

    check-cast p1, Ljavax/microedition/khronos/egl/EGLContext;

    iput-object p1, v1, Lcom/tencent/liteav/basic/c/g;->h:Ljavax/microedition/khronos/egl/EGLContext;

    .line 334
    :goto_1
    iget-object p1, p0, Lcom/tencent/liteav/basic/c/e;->b:Lcom/tencent/liteav/basic/c/g;

    iput-object p2, p1, Lcom/tencent/liteav/basic/c/g;->c:Landroid/view/Surface;

    .line 335
    const-string p1, "TXGLSurfaceRenderThread"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/tencent/liteav/basic/c/e;->a:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 336
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/16 p1, 0x64

    .line 337
    invoke-direct {p0, p1}, Lcom/tencent/liteav/basic/c/e;->c(I)V

    return-void

    .line 338
    :goto_2
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method private c(I)V
    .locals 1

    .line 30
    monitor-enter p0

    .line 31
    :try_start_0
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/e;->b:Lcom/tencent/liteav/basic/c/g;

    if-eqz v0, :cond_0

    .line 32
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/e;->b:Lcom/tencent/liteav/basic/c/g;

    invoke-virtual {v0, p1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    .line 33
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method private f()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/e;->b:Lcom/tencent/liteav/basic/c/g;

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/e;->b:Lcom/tencent/liteav/basic/c/g;

    .line 7
    .line 8
    iget-object v1, p0, Lcom/tencent/liteav/basic/c/e;->a:Landroid/os/HandlerThread;

    .line 9
    .line 10
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/c/g;->a(Landroid/os/Handler;Landroid/os/HandlerThread;)V

    .line 11
    .line 12
    .line 13
    const-string v0, "TXGLSurfaceRenderThread"

    .line 14
    .line 15
    const-string v1, "surface-render: destroy gl thread"

    .line 16
    .line 17
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :catchall_0
    move-exception v0

    .line 22
    goto :goto_1

    .line 23
    :cond_0
    :goto_0
    const/4 v0, 0x0

    .line 24
    iput-object v0, p0, Lcom/tencent/liteav/basic/c/e;->b:Lcom/tencent/liteav/basic/c/g;

    .line 25
    .line 26
    iput-object v0, p0, Lcom/tencent/liteav/basic/c/e;->a:Landroid/os/HandlerThread;

    .line 27
    .line 28
    monitor-exit p0

    .line 29
    return-void

    .line 30
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    throw v0
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 95
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "surface-render: surface render stop "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "TXGLSurfaceRenderThread"

    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 96
    invoke-direct {p0}, Lcom/tencent/liteav/basic/c/e;->f()V

    return-void
.end method

.method public a(I)V
    .locals 1

    .line 97
    new-instance v0, Lcom/tencent/liteav/basic/c/e$1;

    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/basic/c/e$1;-><init>(Lcom/tencent/liteav/basic/c/e;I)V

    invoke-virtual {p0, v0}, Lcom/tencent/liteav/basic/c/e;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public a(IZIIIIIZZ)V
    .locals 12

    .line 101
    invoke-static {}, Landroid/opengl/GLES20;->glFinish()V

    .line 102
    monitor-enter p0

    .line 103
    :try_start_0
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/e;->b:Lcom/tencent/liteav/basic/c/g;

    if-eqz v0, :cond_0

    .line 104
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/e;->b:Lcom/tencent/liteav/basic/c/g;

    new-instance v1, Lcom/tencent/liteav/basic/c/e$3;

    move-object v2, p0

    move v3, p1

    move v4, p2

    move v5, p3

    move/from16 v6, p4

    move/from16 v7, p5

    move/from16 v8, p6

    move/from16 v9, p7

    move/from16 v10, p8

    move/from16 v11, p9

    invoke-direct/range {v1 .. v11}, Lcom/tencent/liteav/basic/c/e$3;-><init>(Lcom/tencent/liteav/basic/c/e;IZIIIIIZZ)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    :catchall_0
    move-exception v0

    move-object p1, v0

    goto :goto_1

    .line 105
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public a(Lcom/tencent/liteav/basic/c/o;)V
    .locals 0

    .line 106
    iput-object p1, p0, Lcom/tencent/liteav/basic/c/e;->m:Lcom/tencent/liteav/basic/c/o;

    const/4 p1, 0x1

    .line 107
    iput-boolean p1, p0, Lcom/tencent/liteav/basic/c/e;->l:Z

    return-void
.end method

.method public a(Ljava/lang/Object;Landroid/view/Surface;)V
    .locals 2

    .line 93
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "surface-render: surface render start "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "TXGLSurfaceRenderThread"

    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    invoke-direct {p0, p1, p2}, Lcom/tencent/liteav/basic/c/e;->b(Ljava/lang/Object;Landroid/view/Surface;)V

    return-void
.end method

.method public a(Ljava/lang/Runnable;)V
    .locals 1

    .line 98
    monitor-enter p0

    .line 99
    :try_start_0
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/e;->b:Lcom/tencent/liteav/basic/c/g;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/tencent/liteav/basic/c/e;->b:Lcom/tencent/liteav/basic/c/g;

    invoke-virtual {v0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    .line 100
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public b()Landroid/view/Surface;
    .locals 1

    .line 319
    monitor-enter p0

    .line 320
    :try_start_0
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/e;->b:Lcom/tencent/liteav/basic/c/g;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/tencent/liteav/basic/c/e;->b:Lcom/tencent/liteav/basic/c/g;

    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/g;->b()Landroid/view/Surface;

    move-result-object v0

    goto :goto_0

    :catchall_0
    move-exception v0

    goto :goto_1

    :cond_0
    const/4 v0, 0x0

    :goto_0
    monitor-exit p0

    return-object v0

    .line 321
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public b(I)V
    .locals 1

    .line 322
    new-instance v0, Lcom/tencent/liteav/basic/c/e$2;

    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/basic/c/e$2;-><init>(Lcom/tencent/liteav/basic/c/e;I)V

    invoke-virtual {p0, v0}, Lcom/tencent/liteav/basic/c/e;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public c()V
    .locals 3

    .line 1
    new-instance v0, Lcom/tencent/liteav/basic/c/h;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tencent/liteav/basic/c/h;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/tencent/liteav/basic/c/e;->c:Lcom/tencent/liteav/basic/c/h;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->a()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object p0, p0, Lcom/tencent/liteav/basic/c/e;->c:Lcom/tencent/liteav/basic/c/h;

    .line 16
    .line 17
    sget-object v0, Lcom/tencent/liteav/basic/c/l;->e:[F

    .line 18
    .line 19
    sget-object v1, Lcom/tencent/liteav/basic/c/k;->a:Lcom/tencent/liteav/basic/c/k;

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    invoke-static {v1, v2, v2}, Lcom/tencent/liteav/basic/c/l;->a(Lcom/tencent/liteav/basic/c/k;ZZ)[F

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {p0, v0, v1}, Lcom/tencent/liteav/basic/c/h;->a([F[F)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public d()V
    .locals 0

    return-void
.end method

.method public e()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/e;->c:Lcom/tencent/liteav/basic/c/h;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/h;->d()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/tencent/liteav/basic/c/e;->c:Lcom/tencent/liteav/basic/c/h;

    .line 10
    .line 11
    :cond_0
    return-void
.end method
