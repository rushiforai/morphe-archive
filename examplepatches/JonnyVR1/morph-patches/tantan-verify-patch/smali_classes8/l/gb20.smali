.class public Ll/gb20;
.super Ll/gfj;
.source "SourceFile"


# instance fields
.field public a:Ljava/nio/ByteBuffer;

.field public b:Ljava/nio/ByteBuffer;

.field protected c:Ljava/lang/Object;

.field protected d:Z

.field protected e:[I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/gfj;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/gb20;->a:Ljava/nio/ByteBuffer;

    .line 6
    .line 7
    iput-object v0, p0, Ll/gb20;->b:Ljava/nio/ByteBuffer;

    .line 8
    .line 9
    new-instance v0, Ljava/lang/Object;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/gb20;->c:Ljava/lang/Object;

    .line 15
    .line 16
    const/4 v0, 0x1

    .line 17
    iput-boolean v0, p0, Ll/gb20;->d:Z

    .line 18
    .line 19
    iput-boolean v0, p0, Ll/wej;->useNewViewPort:Z

    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public Q1()I
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, Ll/wej;->curRotation:I

    .line 6
    .line 7
    rem-int/lit8 v1, v1, 0x2

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    if-ne v1, v2, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    :cond_0
    div-int/lit8 v0, v0, 0x2

    .line 17
    .line 18
    return v0
.end method

.method public R1()I
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, Ll/wej;->curRotation:I

    .line 6
    .line 7
    rem-int/lit8 v1, v1, 0x2

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    if-ne v1, v2, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    :cond_0
    div-int/lit8 v0, v0, 0x2

    .line 17
    .line 18
    return v0
.end method

.method public S1(I)[F
    .locals 6

    .line 1
    const/4 p0, 0x2

    .line 2
    const/4 v0, 0x1

    .line 3
    const/4 v1, 0x0

    .line 4
    const/high16 v2, 0x3f800000    # 1.0f

    .line 5
    .line 6
    if-eqz p1, :cond_2

    .line 7
    .line 8
    if-eq p1, v0, :cond_1

    .line 9
    .line 10
    if-eq p1, p0, :cond_0

    .line 11
    .line 12
    move p1, v1

    .line 13
    move v3, v2

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    move v3, v1

    .line 16
    move p1, v2

    .line 17
    move v2, v3

    .line 18
    move v1, p1

    .line 19
    goto :goto_0

    .line 20
    :cond_1
    move v3, v1

    .line 21
    move p1, v2

    .line 22
    goto :goto_0

    .line 23
    :cond_2
    move p1, v1

    .line 24
    move v3, v2

    .line 25
    move v2, p1

    .line 26
    move v1, v3

    .line 27
    :goto_0
    const/4 v4, 0x4

    .line 28
    new-array v4, v4, [F

    .line 29
    .line 30
    const/4 v5, 0x0

    .line 31
    aput v1, v4, v5

    .line 32
    .line 33
    aput v2, v4, v0

    .line 34
    .line 35
    aput p1, v4, p0

    .line 36
    .line 37
    const/4 p0, 0x3

    .line 38
    aput v3, v4, p0

    .line 39
    .line 40
    return-object v4
.end method

.method public T1()I
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, Ll/wej;->curRotation:I

    .line 6
    .line 7
    rem-int/lit8 v1, v1, 0x2

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    if-ne v1, v2, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0

    .line 17
    :cond_0
    return v0
.end method

.method public U1()I
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, Ll/wej;->curRotation:I

    .line 6
    .line 7
    rem-int/lit8 v1, v1, 0x2

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    if-ne v1, v2, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0

    .line 17
    :cond_0
    return v0
.end method

.method public changeCurRotation(I)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/wej;->curRotation:I

    .line 3
    .line 4
    div-int/lit8 p1, p1, 0x5a

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/wej;->rotateClockwise90Degrees(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public destroy()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/gfj;->destroy()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    const/4 v1, 0x0

    .line 6
    :try_start_0
    iget v2, p0, Ll/wej;->texture_in:I

    .line 7
    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    filled-new-array {v2}, [I

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-static {v0, v2, v1}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 15
    .line 16
    .line 17
    iput v1, p0, Ll/wej;->texture_in:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    .line 19
    :catch_0
    :cond_0
    :try_start_1
    iget-object p0, p0, Ll/gb20;->e:[I

    .line 20
    .line 21
    invoke-static {v0, p0, v1}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 22
    .line 23
    .line 24
    :catch_1
    return-void
.end method

.method public flipPosition(I)V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    const/16 v2, 0x8

    .line 5
    .line 6
    const/16 v3, 0x20

    .line 7
    .line 8
    const/4 v4, 0x2

    .line 9
    const/4 v5, 0x1

    .line 10
    const/4 v6, 0x0

    .line 11
    const/4 v7, 0x3

    .line 12
    move/from16 v8, p1

    .line 13
    .line 14
    if-ne v8, v7, :cond_0

    .line 15
    .line 16
    new-array v8, v2, [F

    .line 17
    .line 18
    fill-array-data v8, :array_0

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v8}, Ll/wej;->setRenderVertices([F)V

    .line 22
    .line 23
    .line 24
    new-array v1, v1, [Ljava/nio/FloatBuffer;

    .line 25
    .line 26
    iput-object v1, v0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 27
    .line 28
    new-array v8, v2, [F

    .line 29
    .line 30
    fill-array-data v8, :array_1

    .line 31
    .line 32
    .line 33
    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 34
    .line 35
    .line 36
    move-result-object v9

    .line 37
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 38
    .line 39
    .line 40
    move-result-object v10

    .line 41
    invoke-virtual {v9, v10}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 42
    .line 43
    .line 44
    move-result-object v9

    .line 45
    invoke-virtual {v9}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 46
    .line 47
    .line 48
    move-result-object v9

    .line 49
    aput-object v9, v1, v6

    .line 50
    .line 51
    iget-object v1, v0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 52
    .line 53
    aget-object v1, v1, v6

    .line 54
    .line 55
    invoke-virtual {v1, v8}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v1, v6}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 60
    .line 61
    .line 62
    new-array v1, v2, [F

    .line 63
    .line 64
    fill-array-data v1, :array_2

    .line 65
    .line 66
    .line 67
    iget-object v8, v0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 68
    .line 69
    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 70
    .line 71
    .line 72
    move-result-object v9

    .line 73
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 74
    .line 75
    .line 76
    move-result-object v10

    .line 77
    invoke-virtual {v9, v10}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 78
    .line 79
    .line 80
    move-result-object v9

    .line 81
    invoke-virtual {v9}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 82
    .line 83
    .line 84
    move-result-object v9

    .line 85
    aput-object v9, v8, v5

    .line 86
    .line 87
    iget-object v8, v0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 88
    .line 89
    aget-object v5, v8, v5

    .line 90
    .line 91
    invoke-virtual {v5, v1}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    invoke-virtual {v1, v6}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 96
    .line 97
    .line 98
    new-array v1, v2, [F

    .line 99
    .line 100
    fill-array-data v1, :array_3

    .line 101
    .line 102
    .line 103
    iget-object v5, v0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 104
    .line 105
    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 106
    .line 107
    .line 108
    move-result-object v8

    .line 109
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 110
    .line 111
    .line 112
    move-result-object v9

    .line 113
    invoke-virtual {v8, v9}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 114
    .line 115
    .line 116
    move-result-object v8

    .line 117
    invoke-virtual {v8}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 118
    .line 119
    .line 120
    move-result-object v8

    .line 121
    aput-object v8, v5, v4

    .line 122
    .line 123
    iget-object v5, v0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 124
    .line 125
    aget-object v4, v5, v4

    .line 126
    .line 127
    invoke-virtual {v4, v1}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    invoke-virtual {v1, v6}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 132
    .line 133
    .line 134
    new-array v1, v2, [F

    .line 135
    .line 136
    fill-array-data v1, :array_4

    .line 137
    .line 138
    .line 139
    iget-object v2, v0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 140
    .line 141
    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 142
    .line 143
    .line 144
    move-result-object v3

    .line 145
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 146
    .line 147
    .line 148
    move-result-object v4

    .line 149
    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 150
    .line 151
    .line 152
    move-result-object v3

    .line 153
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 154
    .line 155
    .line 156
    move-result-object v3

    .line 157
    aput-object v3, v2, v7

    .line 158
    .line 159
    iget-object v0, v0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 160
    .line 161
    aget-object v0, v0, v7

    .line 162
    .line 163
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    invoke-virtual {v0, v6}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 168
    .line 169
    .line 170
    return-void

    .line 171
    :cond_0
    invoke-virtual/range {p0 .. p1}, Ll/gb20;->S1(I)[F

    .line 172
    .line 173
    .line 174
    move-result-object v8

    .line 175
    aget v9, v8, v6

    .line 176
    .line 177
    aget v10, v8, v5

    .line 178
    .line 179
    aget v11, v8, v4

    .line 180
    .line 181
    aget v8, v8, v7

    .line 182
    .line 183
    new-array v12, v2, [F

    .line 184
    .line 185
    aput v9, v12, v6

    .line 186
    .line 187
    aput v11, v12, v5

    .line 188
    .line 189
    aput v10, v12, v4

    .line 190
    .line 191
    aput v11, v12, v7

    .line 192
    .line 193
    aput v9, v12, v1

    .line 194
    .line 195
    const/4 v13, 0x5

    .line 196
    aput v8, v12, v13

    .line 197
    .line 198
    const/4 v14, 0x6

    .line 199
    aput v10, v12, v14

    .line 200
    .line 201
    const/4 v15, 0x7

    .line 202
    aput v8, v12, v15

    .line 203
    .line 204
    move/from16 v16, v1

    .line 205
    .line 206
    iget-object v1, v0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 207
    .line 208
    move/from16 v17, v3

    .line 209
    .line 210
    invoke-static/range {v17 .. v17}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 211
    .line 212
    .line 213
    move-result-object v3

    .line 214
    move/from16 v18, v4

    .line 215
    .line 216
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 217
    .line 218
    .line 219
    move-result-object v4

    .line 220
    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 221
    .line 222
    .line 223
    move-result-object v3

    .line 224
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 225
    .line 226
    .line 227
    move-result-object v3

    .line 228
    aput-object v3, v1, v6

    .line 229
    .line 230
    iget-object v1, v0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 231
    .line 232
    aget-object v1, v1, v6

    .line 233
    .line 234
    invoke-virtual {v1, v12}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 235
    .line 236
    .line 237
    move-result-object v1

    .line 238
    invoke-virtual {v1, v6}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 239
    .line 240
    .line 241
    new-array v1, v2, [F

    .line 242
    .line 243
    aput v11, v1, v6

    .line 244
    .line 245
    aput v10, v1, v5

    .line 246
    .line 247
    aput v11, v1, v18

    .line 248
    .line 249
    aput v9, v1, v7

    .line 250
    .line 251
    aput v8, v1, v16

    .line 252
    .line 253
    aput v10, v1, v13

    .line 254
    .line 255
    aput v8, v1, v14

    .line 256
    .line 257
    aput v9, v1, v15

    .line 258
    .line 259
    iget-object v3, v0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 260
    .line 261
    invoke-static/range {v17 .. v17}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 262
    .line 263
    .line 264
    move-result-object v4

    .line 265
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 266
    .line 267
    .line 268
    move-result-object v12

    .line 269
    invoke-virtual {v4, v12}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 270
    .line 271
    .line 272
    move-result-object v4

    .line 273
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 274
    .line 275
    .line 276
    move-result-object v4

    .line 277
    aput-object v4, v3, v5

    .line 278
    .line 279
    iget-object v3, v0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 280
    .line 281
    aget-object v3, v3, v5

    .line 282
    .line 283
    invoke-virtual {v3, v1}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 284
    .line 285
    .line 286
    move-result-object v1

    .line 287
    invoke-virtual {v1, v6}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 288
    .line 289
    .line 290
    new-array v1, v2, [F

    .line 291
    .line 292
    aput v10, v1, v6

    .line 293
    .line 294
    aput v8, v1, v5

    .line 295
    .line 296
    aput v9, v1, v18

    .line 297
    .line 298
    aput v8, v1, v7

    .line 299
    .line 300
    aput v10, v1, v16

    .line 301
    .line 302
    aput v11, v1, v13

    .line 303
    .line 304
    aput v9, v1, v14

    .line 305
    .line 306
    aput v11, v1, v15

    .line 307
    .line 308
    iget-object v3, v0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 309
    .line 310
    invoke-static/range {v17 .. v17}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 311
    .line 312
    .line 313
    move-result-object v4

    .line 314
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 315
    .line 316
    .line 317
    move-result-object v12

    .line 318
    invoke-virtual {v4, v12}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 319
    .line 320
    .line 321
    move-result-object v4

    .line 322
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 323
    .line 324
    .line 325
    move-result-object v4

    .line 326
    aput-object v4, v3, v18

    .line 327
    .line 328
    iget-object v3, v0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 329
    .line 330
    aget-object v3, v3, v18

    .line 331
    .line 332
    invoke-virtual {v3, v1}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 333
    .line 334
    .line 335
    move-result-object v1

    .line 336
    invoke-virtual {v1, v6}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 337
    .line 338
    .line 339
    new-array v1, v2, [F

    .line 340
    .line 341
    aput v8, v1, v6

    .line 342
    .line 343
    aput v9, v1, v5

    .line 344
    .line 345
    aput v8, v1, v18

    .line 346
    .line 347
    aput v10, v1, v7

    .line 348
    .line 349
    aput v11, v1, v16

    .line 350
    .line 351
    aput v9, v1, v13

    .line 352
    .line 353
    aput v11, v1, v14

    .line 354
    .line 355
    aput v10, v1, v15

    .line 356
    .line 357
    iget-object v2, v0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 358
    .line 359
    invoke-static/range {v17 .. v17}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 360
    .line 361
    .line 362
    move-result-object v3

    .line 363
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 364
    .line 365
    .line 366
    move-result-object v4

    .line 367
    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 368
    .line 369
    .line 370
    move-result-object v3

    .line 371
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 372
    .line 373
    .line 374
    move-result-object v3

    .line 375
    aput-object v3, v2, v7

    .line 376
    .line 377
    iget-object v0, v0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 378
    .line 379
    aget-object v0, v0, v7

    .line 380
    .line 381
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 382
    .line 383
    .line 384
    move-result-object v0

    .line 385
    invoke-virtual {v0, v6}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 386
    .line 387
    .line 388
    return-void

    .line 389
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

    .line 390
    .line 391
    .line 392
    .line 393
    .line 394
    .line 395
    .line 396
    .line 397
    .line 398
    .line 399
    .line 400
    .line 401
    .line 402
    .line 403
    .line 404
    .line 405
    .line 406
    .line 407
    .line 408
    .line 409
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

    .line 410
    .line 411
    .line 412
    .line 413
    .line 414
    .line 415
    .line 416
    .line 417
    .line 418
    .line 419
    .line 420
    .line 421
    .line 422
    .line 423
    .line 424
    .line 425
    .line 426
    .line 427
    .line 428
    .line 429
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

    .line 430
    .line 431
    .line 432
    .line 433
    .line 434
    .line 435
    .line 436
    .line 437
    .line 438
    .line 439
    .line 440
    .line 441
    .line 442
    .line 443
    .line 444
    .line 445
    .line 446
    .line 447
    .line 448
    .line 449
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

    .line 450
    .line 451
    .line 452
    .line 453
    .line 454
    .line 455
    .line 456
    .line 457
    .line 458
    .line 459
    .line 460
    .line 461
    .line 462
    .line 463
    .line 464
    .line 465
    .line 466
    .line 467
    .line 468
    .line 469
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

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;uniform sampler2D SamplerY;uniform sampler2D SamplerUV;varying mediump vec2 coordinate;void main(){   float r, g, b, y, u, v;\n   y = texture2D(SamplerY, coordinate).r;\n   u = texture2D(SamplerUV, coordinate).a - 0.5;\n   v = texture2D(SamplerUV, coordinate).r - 0.5;\n   r = y + 1.13983*v;\n   g = y - 0.39465*u - 0.58060*v;\n   b = y + 2.03211*u;\n   gl_FragColor = vec4(r, g, b, 1.0);\n}"

    .line 2
    .line 3
    return-object p0
.end method

.method public getVertexShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "attribute vec4 position;attribute mediump vec4 inputTextureCoordinate;varying mediump vec2 coordinate;void main(){    gl_Position = position;    coordinate = inputTextureCoordinate.xy;}"

    .line 2
    .line 3
    return-object p0
.end method

.method public initShaderHandles()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/wej;->initShaderHandles()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public initWithGLContext()V
    .locals 6

    .line 1
    invoke-super {p0}, Ll/wej;->initWithGLContext()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    new-array v1, v0, [I

    .line 6
    .line 7
    iput-object v1, p0, Ll/gb20;->e:[I

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 11
    .line 12
    .line 13
    move v1, v2

    .line 14
    :goto_0
    const/4 v3, 0x1

    .line 15
    if-ge v1, v0, :cond_0

    .line 16
    .line 17
    iget-object v4, p0, Ll/gb20;->e:[I

    .line 18
    .line 19
    aget v4, v4, v1

    .line 20
    .line 21
    const v5, 0x84c0

    .line 22
    .line 23
    .line 24
    add-int/2addr v5, v1

    .line 25
    invoke-static {v5}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 26
    .line 27
    .line 28
    const/16 v5, 0xde1

    .line 29
    .line 30
    invoke-static {v5, v4}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 31
    .line 32
    .line 33
    const/16 v4, 0xcf5

    .line 34
    .line 35
    invoke-static {v4, v3}, Landroid/opengl/GLES20;->glPixelStorei(II)V

    .line 36
    .line 37
    .line 38
    const/16 v3, 0x2801

    .line 39
    .line 40
    const/16 v4, 0x2601

    .line 41
    .line 42
    invoke-static {v5, v3, v4}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 43
    .line 44
    .line 45
    const/16 v3, 0x2800

    .line 46
    .line 47
    invoke-static {v5, v3, v4}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 48
    .line 49
    .line 50
    const/16 v3, 0x2802

    .line 51
    .line 52
    const v4, 0x812f

    .line 53
    .line 54
    .line 55
    invoke-static {v5, v3, v4}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 56
    .line 57
    .line 58
    const/16 v3, 0x2803

    .line 59
    .line 60
    invoke-static {v5, v3, v4}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 61
    .line 62
    .line 63
    add-int/lit8 v1, v1, 0x1

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_0
    iget v0, p0, Ll/wej;->programHandle:I

    .line 67
    .line 68
    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 69
    .line 70
    .line 71
    iget v0, p0, Ll/wej;->programHandle:I

    .line 72
    .line 73
    const-string v1, "SamplerY"

    .line 74
    .line 75
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 80
    .line 81
    .line 82
    iget p0, p0, Ll/wej;->programHandle:I

    .line 83
    .line 84
    const-string v0, "SamplerUV"

    .line 85
    .line 86
    invoke-static {p0, v0}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 87
    .line 88
    .line 89
    move-result p0

    .line 90
    invoke-static {p0, v3}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public onDrawFrame()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/gfj;->markAsDirty()V

    .line 2
    .line 3
    .line 4
    invoke-super {p0}, Ll/wej;->onDrawFrame()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public passShaderValues()V
    .locals 13

    .line 1
    invoke-super {p0}, Ll/wej;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/wej;->renderVertices:Ljava/nio/FloatBuffer;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 8
    .line 9
    .line 10
    iget v0, p0, Ll/wej;->programHandle:I

    .line 11
    .line 12
    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 13
    .line 14
    .line 15
    iget v0, p0, Ll/wej;->programHandle:I

    .line 16
    .line 17
    const-string v2, "SamplerY"

    .line 18
    .line 19
    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 24
    .line 25
    .line 26
    iget v0, p0, Ll/wej;->programHandle:I

    .line 27
    .line 28
    const-string v2, "SamplerUV"

    .line 29
    .line 30
    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    const/4 v2, 0x1

    .line 35
    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 36
    .line 37
    .line 38
    iget v3, p0, Ll/wej;->positionHandle:I

    .line 39
    .line 40
    const/4 v7, 0x0

    .line 41
    iget-object v8, p0, Ll/wej;->renderVertices:Ljava/nio/FloatBuffer;

    .line 42
    .line 43
    const/4 v4, 0x2

    .line 44
    const/16 v5, 0x1406

    .line 45
    .line 46
    const/4 v6, 0x0

    .line 47
    invoke-static/range {v3 .. v8}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 48
    .line 49
    .line 50
    iget v0, p0, Ll/wej;->positionHandle:I

    .line 51
    .line 52
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 56
    .line 57
    iget v3, p0, Ll/wej;->curRotation:I

    .line 58
    .line 59
    aget-object v0, v0, v3

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 62
    .line 63
    .line 64
    iget v3, p0, Ll/wej;->texCoordHandle:I

    .line 65
    .line 66
    iget-object v0, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 67
    .line 68
    iget v4, p0, Ll/wej;->curRotation:I

    .line 69
    .line 70
    aget-object v8, v0, v4

    .line 71
    .line 72
    const/4 v4, 0x2

    .line 73
    invoke-static/range {v3 .. v8}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 74
    .line 75
    .line 76
    iget v0, p0, Ll/wej;->texCoordHandle:I

    .line 77
    .line 78
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 79
    .line 80
    .line 81
    iget-object v3, p0, Ll/gb20;->c:Ljava/lang/Object;

    .line 82
    .line 83
    monitor-enter v3

    .line 84
    :try_start_0
    iget-object v0, p0, Ll/gb20;->a:Ljava/nio/ByteBuffer;

    .line 85
    .line 86
    if-eqz v0, :cond_1

    .line 87
    .line 88
    iget-object v4, p0, Ll/gb20;->b:Ljava/nio/ByteBuffer;

    .line 89
    .line 90
    if-nez v4, :cond_0

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_0
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Ll/gb20;->b:Ljava/nio/ByteBuffer;

    .line 97
    .line 98
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 99
    .line 100
    .line 101
    const v0, 0x84c0

    .line 102
    .line 103
    .line 104
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 105
    .line 106
    .line 107
    iget-object v0, p0, Ll/gb20;->e:[I

    .line 108
    .line 109
    aget v0, v0, v1

    .line 110
    .line 111
    const/16 v1, 0xde1

    .line 112
    .line 113
    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {p0}, Ll/gb20;->U1()I

    .line 117
    .line 118
    .line 119
    move-result v7

    .line 120
    invoke-virtual {p0}, Ll/gb20;->T1()I

    .line 121
    .line 122
    .line 123
    move-result v8

    .line 124
    iget-object v12, p0, Ll/gb20;->a:Ljava/nio/ByteBuffer;

    .line 125
    .line 126
    const/16 v4, 0xde1

    .line 127
    .line 128
    const/4 v5, 0x0

    .line 129
    const/16 v6, 0x1909

    .line 130
    .line 131
    const/4 v9, 0x0

    .line 132
    const/16 v10, 0x1909

    .line 133
    .line 134
    const/16 v11, 0x1401

    .line 135
    .line 136
    invoke-static/range {v4 .. v12}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 137
    .line 138
    .line 139
    const v0, 0x84c1

    .line 140
    .line 141
    .line 142
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 143
    .line 144
    .line 145
    iget-object v0, p0, Ll/gb20;->e:[I

    .line 146
    .line 147
    aget v0, v0, v2

    .line 148
    .line 149
    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {p0}, Ll/gb20;->R1()I

    .line 153
    .line 154
    .line 155
    move-result v7

    .line 156
    invoke-virtual {p0}, Ll/gb20;->Q1()I

    .line 157
    .line 158
    .line 159
    move-result v8

    .line 160
    iget-object v12, p0, Ll/gb20;->b:Ljava/nio/ByteBuffer;

    .line 161
    .line 162
    const/16 v4, 0xde1

    .line 163
    .line 164
    const/4 v5, 0x0

    .line 165
    const/16 v6, 0x190a

    .line 166
    .line 167
    const/4 v9, 0x0

    .line 168
    const/16 v10, 0x190a

    .line 169
    .line 170
    const/16 v11, 0x1401

    .line 171
    .line 172
    invoke-static/range {v4 .. v12}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 173
    .line 174
    .line 175
    iput-boolean v2, p0, Ll/gb20;->d:Z

    .line 176
    .line 177
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 178
    const/16 p0, 0x4000

    .line 179
    .line 180
    invoke-static {p0}, Landroid/opengl/GLES20;->glClear(I)V

    .line 181
    .line 182
    .line 183
    return-void

    .line 184
    :catchall_0
    move-exception v0

    .line 185
    move-object p0, v0

    .line 186
    goto :goto_1

    .line 187
    :cond_1
    :goto_0
    :try_start_1
    iput-boolean v2, p0, Ll/gb20;->d:Z

    .line 188
    .line 189
    monitor-exit v3

    .line 190
    return-void

    .line 191
    :goto_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 192
    throw p0
.end method

.method public updateYUVBuffer(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gb20;->c:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iput-object p1, p0, Ll/gb20;->a:Ljava/nio/ByteBuffer;

    .line 5
    .line 6
    iput-object p2, p0, Ll/gb20;->b:Ljava/nio/ByteBuffer;

    .line 7
    .line 8
    monitor-exit v0

    .line 9
    return-void

    .line 10
    :catchall_0
    move-exception p0

    .line 11
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    throw p0
.end method
