.class public Lcom/momo/mcamera/mask/FaceWarpFilter;
.super Lcom/momo/mcamera/mask/FaceDetectFilter;
.source "SourceFile"


# instance fields
.field private mvpLists:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/omw;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/mask/FaceDetectFilter;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-static {v0}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Lcom/momo/mcamera/mask/FaceWarpFilter;->mvpLists:Ljava/util/List;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public cancelDraw()V
    .locals 0

    return-void
.end method

.method public clearPoints()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/FaceWarpFilter;->mvpLists:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public drawSub()V
    .locals 15

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/FaceWarpFilter;->mvpLists:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/16 v1, 0xde1

    .line 8
    .line 9
    const v2, 0x84c0

    .line 10
    .line 11
    .line 12
    const/16 v3, 0x4100

    .line 13
    .line 14
    const/4 v4, 0x4

    .line 15
    const/4 v5, 0x0

    .line 16
    if-lez v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Lcom/momo/mcamera/mask/FaceWarpFilter;->mvpLists:Ljava/util/List;

    .line 19
    .line 20
    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Ll/omw;

    .line 25
    .line 26
    invoke-virtual {v0}, Ll/omw;->r()[[F

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 40
    .line 41
    .line 42
    move-result v6

    .line 43
    invoke-static {v5, v5, v0, v6}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 44
    .line 45
    .line 46
    invoke-static {v3}, Landroid/opengl/GLES20;->glClear(I)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Ll/wej;->getBackgroundRed()F

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    invoke-virtual {p0}, Ll/wej;->getBackgroundGreen()F

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    invoke-virtual {p0}, Ll/wej;->getBackgroundBlue()F

    .line 58
    .line 59
    .line 60
    move-result v6

    .line 61
    invoke-virtual {p0}, Ll/wej;->getBackgroundAlpha()F

    .line 62
    .line 63
    .line 64
    move-result v7

    .line 65
    invoke-static {v0, v3, v6, v7}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 66
    .line 67
    .line 68
    invoke-static {v2}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 69
    .line 70
    .line 71
    iget v0, p0, Ll/wej;->texture_in:I

    .line 72
    .line 73
    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 74
    .line 75
    .line 76
    iget v0, p0, Ll/wej;->textureHandle:I

    .line 77
    .line 78
    invoke-static {v0, v5}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 79
    .line 80
    .line 81
    iget v0, p0, Ll/wej;->programHandle:I

    .line 82
    .line 83
    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Lcom/momo/mcamera/mask/FaceWarpFilter;->mvpLists:Ljava/util/List;

    .line 87
    .line 88
    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    check-cast v0, Ll/omw;

    .line 93
    .line 94
    invoke-virtual {v0}, Ll/omw;->r()[[F

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    aget-object v0, v0, v5

    .line 99
    .line 100
    array-length v1, v0

    .line 101
    array-length v1, v0

    .line 102
    div-int/lit8 v1, v1, 0x6

    .line 103
    .line 104
    iget-object v2, p0, Lcom/momo/mcamera/mask/FaceWarpFilter;->mvpLists:Ljava/util/List;

    .line 105
    .line 106
    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    check-cast v2, Ll/omw;

    .line 111
    .line 112
    invoke-virtual {v2}, Ll/omw;->f()[[F

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    aget-object v2, v2, v5

    .line 117
    .line 118
    array-length v3, v2

    .line 119
    mul-int/2addr v3, v4

    .line 120
    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 121
    .line 122
    .line 123
    move-result-object v3

    .line 124
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 125
    .line 126
    .line 127
    move-result-object v6

    .line 128
    invoke-virtual {v3, v6}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 129
    .line 130
    .line 131
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 132
    .line 133
    .line 134
    move-result-object v12

    .line 135
    invoke-virtual {v12, v2}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 136
    .line 137
    .line 138
    invoke-virtual {v12, v5}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 139
    .line 140
    .line 141
    iget v7, p0, Ll/wej;->positionHandle:I

    .line 142
    .line 143
    const/4 v10, 0x0

    .line 144
    const/4 v11, 0x0

    .line 145
    const/4 v8, 0x2

    .line 146
    const/16 v9, 0x1406

    .line 147
    .line 148
    invoke-static/range {v7 .. v12}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 149
    .line 150
    .line 151
    iget v2, p0, Ll/wej;->positionHandle:I

    .line 152
    .line 153
    invoke-static {v2}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 154
    .line 155
    .line 156
    array-length v2, v0

    .line 157
    mul-int/2addr v2, v4

    .line 158
    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 159
    .line 160
    .line 161
    move-result-object v2

    .line 162
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 163
    .line 164
    .line 165
    move-result-object v3

    .line 166
    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 167
    .line 168
    .line 169
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 170
    .line 171
    .line 172
    move-result-object v11

    .line 173
    invoke-virtual {v11, v0}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 174
    .line 175
    .line 176
    invoke-virtual {v11, v5}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 177
    .line 178
    .line 179
    iget v6, p0, Ll/wej;->texCoordHandle:I

    .line 180
    .line 181
    const/4 v9, 0x0

    .line 182
    const/4 v7, 0x2

    .line 183
    const/16 v8, 0x1406

    .line 184
    .line 185
    invoke-static/range {v6 .. v11}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 186
    .line 187
    .line 188
    iget v0, p0, Ll/wej;->texCoordHandle:I

    .line 189
    .line 190
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 191
    .line 192
    .line 193
    mul-int/lit8 v1, v1, 0x3

    .line 194
    .line 195
    invoke-static {v4, v5, v1}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 196
    .line 197
    .line 198
    invoke-virtual {p0}, Ll/wej;->disableDrawArray()V

    .line 199
    .line 200
    .line 201
    goto/16 :goto_0

    .line 202
    .line 203
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 204
    .line 205
    .line 206
    const/16 v0, 0x8

    .line 207
    .line 208
    new-array v6, v0, [F

    .line 209
    .line 210
    fill-array-data v6, :array_0

    .line 211
    .line 212
    .line 213
    new-array v0, v0, [F

    .line 214
    .line 215
    fill-array-data v0, :array_1

    .line 216
    .line 217
    .line 218
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 219
    .line 220
    .line 221
    move-result v7

    .line 222
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 223
    .line 224
    .line 225
    move-result v8

    .line 226
    invoke-static {v5, v5, v7, v8}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 227
    .line 228
    .line 229
    invoke-static {v3}, Landroid/opengl/GLES20;->glClear(I)V

    .line 230
    .line 231
    .line 232
    invoke-virtual {p0}, Ll/wej;->getBackgroundRed()F

    .line 233
    .line 234
    .line 235
    move-result v3

    .line 236
    invoke-virtual {p0}, Ll/wej;->getBackgroundGreen()F

    .line 237
    .line 238
    .line 239
    move-result v7

    .line 240
    invoke-virtual {p0}, Ll/wej;->getBackgroundBlue()F

    .line 241
    .line 242
    .line 243
    move-result v8

    .line 244
    invoke-virtual {p0}, Ll/wej;->getBackgroundAlpha()F

    .line 245
    .line 246
    .line 247
    move-result v9

    .line 248
    invoke-static {v3, v7, v8, v9}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 249
    .line 250
    .line 251
    iget v3, p0, Ll/wej;->programHandle:I

    .line 252
    .line 253
    invoke-static {v3}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 254
    .line 255
    .line 256
    const/16 v3, 0x20

    .line 257
    .line 258
    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 259
    .line 260
    .line 261
    move-result-object v7

    .line 262
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 263
    .line 264
    .line 265
    move-result-object v8

    .line 266
    invoke-virtual {v7, v8}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 267
    .line 268
    .line 269
    invoke-virtual {v7}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 270
    .line 271
    .line 272
    move-result-object v14

    .line 273
    invoke-virtual {v14, v6}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 274
    .line 275
    .line 276
    invoke-virtual {v14, v5}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 277
    .line 278
    .line 279
    iget v9, p0, Ll/wej;->positionHandle:I

    .line 280
    .line 281
    const/4 v12, 0x0

    .line 282
    const/4 v13, 0x0

    .line 283
    const/4 v10, 0x2

    .line 284
    const/16 v11, 0x1406

    .line 285
    .line 286
    invoke-static/range {v9 .. v14}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 287
    .line 288
    .line 289
    iget v6, p0, Ll/wej;->positionHandle:I

    .line 290
    .line 291
    invoke-static {v6}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 292
    .line 293
    .line 294
    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 295
    .line 296
    .line 297
    move-result-object v3

    .line 298
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 299
    .line 300
    .line 301
    move-result-object v6

    .line 302
    invoke-virtual {v3, v6}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 303
    .line 304
    .line 305
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 306
    .line 307
    .line 308
    move-result-object v12

    .line 309
    invoke-virtual {v12, v0}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 310
    .line 311
    .line 312
    invoke-virtual {v12, v5}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 313
    .line 314
    .line 315
    iget v7, p0, Ll/wej;->texCoordHandle:I

    .line 316
    .line 317
    const/4 v10, 0x0

    .line 318
    const/4 v11, 0x0

    .line 319
    const/4 v8, 0x2

    .line 320
    const/16 v9, 0x1406

    .line 321
    .line 322
    invoke-static/range {v7 .. v12}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 323
    .line 324
    .line 325
    iget v0, p0, Ll/wej;->texCoordHandle:I

    .line 326
    .line 327
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 328
    .line 329
    .line 330
    invoke-static {v2}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 331
    .line 332
    .line 333
    iget v0, p0, Ll/wej;->texture_in:I

    .line 334
    .line 335
    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 336
    .line 337
    .line 338
    iget v0, p0, Ll/wej;->textureHandle:I

    .line 339
    .line 340
    invoke-static {v0, v5}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 341
    .line 342
    .line 343
    const/4 v0, 0x5

    .line 344
    invoke-static {v0, v5, v4}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 345
    .line 346
    .line 347
    invoke-virtual {p0}, Ll/wej;->disableDrawArray()V

    .line 348
    .line 349
    .line 350
    :goto_0
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/FaceWarpFilter;->clearPoints()V

    .line 351
    .line 352
    .line 353
    return-void

    .line 354
    nop

    .line 355
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

    .line 356
    .line 357
    .line 358
    .line 359
    .line 360
    .line 361
    .line 362
    .line 363
    .line 364
    .line 365
    .line 366
    .line 367
    .line 368
    .line 369
    .line 370
    .line 371
    .line 372
    .line 373
    .line 374
    .line 375
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
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-super {p0}, Ll/wej;->getFragmentShader()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getVertexShader()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-super {p0}, Ll/wej;->getVertexShader()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
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

.method public passShaderValues()V
    .locals 0

    return-void
.end method

.method public resetSticker(Lcom/momo/mcamera/mask/Sticker;)V
    .locals 0

    return-void
.end method

.method public setDetectParam(Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V
    .locals 0

    return-void
.end method

.method public setMMCVInfo(Ll/omw;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/momo/mcamera/mask/FaceWarpFilter;->mvpLists:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
