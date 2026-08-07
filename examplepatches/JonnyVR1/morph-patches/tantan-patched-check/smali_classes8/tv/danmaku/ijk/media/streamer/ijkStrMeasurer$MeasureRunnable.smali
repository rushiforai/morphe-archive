.class Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer$MeasureRunnable;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "MeasureRunnable"
.end annotation


# instance fields
.field private volatile a:Z

.field private b:J

.field private c:J

.field private d:J

.field final synthetic e:Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;


# virtual methods
.method public run()V
    .locals 13

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer$MeasureRunnable;->e:Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;

    .line 2
    .line 3
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->a(Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;)Lcom/immomo/mediacore/sink/SinkBase;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/immomo/mediacore/sink/SinkBase;->prepare()Z

    .line 8
    .line 9
    .line 10
    iget-wide v0, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer$MeasureRunnable;->b:J

    .line 11
    .line 12
    const-wide/16 v2, 0x0

    .line 13
    .line 14
    cmp-long v0, v0, v2

    .line 15
    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 19
    .line 20
    .line 21
    move-result-wide v0

    .line 22
    iput-wide v0, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer$MeasureRunnable;->b:J

    .line 23
    .line 24
    :cond_0
    :goto_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer$MeasureRunnable;->e:Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;

    .line 25
    .line 26
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->c(Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;)J

    .line 27
    .line 28
    .line 29
    move-result-wide v0

    .line 30
    cmp-long v0, v0, v2

    .line 31
    .line 32
    const/4 v1, 0x0

    .line 33
    const/high16 v4, 0x3f800000    # 1.0f

    .line 34
    .line 35
    const-string v5, "ijkStrMeasurer"

    .line 36
    .line 37
    if-lez v0, :cond_5

    .line 38
    .line 39
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer$MeasureRunnable;->a:Z

    .line 40
    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    new-instance v0, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    const-string v6, "MeasureRunnable:"

    .line 46
    .line 47
    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    iget-boolean v6, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer$MeasureRunnable;->a:Z

    .line 51
    .line 52
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-static {v5, v0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    .line 61
    .line 62
    goto/16 :goto_2

    .line 63
    .line 64
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 65
    .line 66
    .line 67
    move-result-wide v5

    .line 68
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer$MeasureRunnable;->e:Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;

    .line 69
    .line 70
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->a(Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;)Lcom/immomo/mediacore/sink/SinkBase;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    if-eqz v0, :cond_3

    .line 75
    .line 76
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer$MeasureRunnable;->e:Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;

    .line 77
    .line 78
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->h(Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;)Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-eqz v0, :cond_3

    .line 83
    .line 84
    iget-wide v7, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer$MeasureRunnable;->c:J

    .line 85
    .line 86
    cmp-long v0, v7, v2

    .line 87
    .line 88
    if-nez v0, :cond_2

    .line 89
    .line 90
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 91
    .line 92
    .line 93
    move-result-wide v7

    .line 94
    iput-wide v7, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer$MeasureRunnable;->c:J

    .line 95
    .line 96
    :cond_2
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer$MeasureRunnable;->e:Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;

    .line 97
    .line 98
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->a(Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;)Lcom/immomo/mediacore/sink/SinkBase;

    .line 99
    .line 100
    .line 101
    move-result-object v7

    .line 102
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 103
    .line 104
    .line 105
    move-result-wide v8

    .line 106
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer$MeasureRunnable;->e:Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;

    .line 107
    .line 108
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->i(Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;)Ljava/nio/ByteBuffer;

    .line 109
    .line 110
    .line 111
    move-result-object v10

    .line 112
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer$MeasureRunnable;->e:Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;

    .line 113
    .line 114
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->j(Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;)I

    .line 115
    .line 116
    .line 117
    move-result v11

    .line 118
    const/4 v12, 0x1

    .line 119
    invoke-virtual/range {v7 .. v12}, Lcom/immomo/mediacore/sink/SinkBase;->writeAudioPacket(JLjava/nio/ByteBuffer;II)V

    .line 120
    .line 121
    .line 122
    :cond_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 123
    .line 124
    .line 125
    move-result-wide v7

    .line 126
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer$MeasureRunnable;->e:Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;

    .line 127
    .line 128
    sub-long/2addr v7, v5

    .line 129
    invoke-static {v0, v7, v8}, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->g(Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;J)J

    .line 130
    .line 131
    .line 132
    :try_start_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer$MeasureRunnable;->e:Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;

    .line 133
    .line 134
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->k(Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;)I

    .line 135
    .line 136
    .line 137
    move-result v0

    .line 138
    int-to-long v5, v0

    .line 139
    invoke-static {v5, v6}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 140
    .line 141
    .line 142
    goto :goto_1

    .line 143
    :catch_0
    move-exception v0

    .line 144
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 145
    .line 146
    .line 147
    :goto_1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer$MeasureRunnable;->e:Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;

    .line 148
    .line 149
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->k(Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;)I

    .line 150
    .line 151
    .line 152
    move-result v5

    .line 153
    int-to-long v5, v5

    .line 154
    invoke-static {v0, v5, v6}, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->g(Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;J)J

    .line 155
    .line 156
    .line 157
    iget-wide v5, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer$MeasureRunnable;->c:J

    .line 158
    .line 159
    cmp-long v0, v5, v2

    .line 160
    .line 161
    if-eqz v0, :cond_0

    .line 162
    .line 163
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer$MeasureRunnable;->e:Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;

    .line 164
    .line 165
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->l(Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;)J

    .line 166
    .line 167
    .line 168
    move-result-wide v5

    .line 169
    cmp-long v0, v5, v2

    .line 170
    .line 171
    if-eqz v0, :cond_0

    .line 172
    .line 173
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 174
    .line 175
    .line 176
    move-result-wide v5

    .line 177
    iget-wide v7, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer$MeasureRunnable;->c:J

    .line 178
    .line 179
    sub-long/2addr v5, v7

    .line 180
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer$MeasureRunnable;->e:Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;

    .line 181
    .line 182
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->l(Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;)J

    .line 183
    .line 184
    .line 185
    move-result-wide v7

    .line 186
    cmp-long v0, v5, v7

    .line 187
    .line 188
    if-ltz v0, :cond_0

    .line 189
    .line 190
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 191
    .line 192
    .line 193
    move-result-wide v5

    .line 194
    iget-wide v7, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer$MeasureRunnable;->c:J

    .line 195
    .line 196
    sub-long/2addr v5, v7

    .line 197
    long-to-int v0, v5

    .line 198
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 199
    .line 200
    .line 201
    move-result-wide v5

    .line 202
    iput-wide v5, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer$MeasureRunnable;->c:J

    .line 203
    .line 204
    iget-object v5, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer$MeasureRunnable;->e:Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;

    .line 205
    .line 206
    invoke-static {v5}, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->a(Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;)Lcom/immomo/mediacore/sink/SinkBase;

    .line 207
    .line 208
    .line 209
    move-result-object v5

    .line 210
    invoke-virtual {v5}, Lcom/immomo/mediacore/sink/SinkBase;->getRtmpSendSize()J

    .line 211
    .line 212
    .line 213
    move-result-wide v5

    .line 214
    cmp-long v5, v5, v2

    .line 215
    .line 216
    iget-object v6, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer$MeasureRunnable;->e:Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;

    .line 217
    .line 218
    if-lez v5, :cond_4

    .line 219
    .line 220
    invoke-static {v6}, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->a(Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;)Lcom/immomo/mediacore/sink/SinkBase;

    .line 221
    .line 222
    .line 223
    move-result-object v1

    .line 224
    invoke-virtual {v1}, Lcom/immomo/mediacore/sink/SinkBase;->getRtmpSendSize()J

    .line 225
    .line 226
    .line 227
    move-result-wide v5

    .line 228
    iget-wide v7, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer$MeasureRunnable;->d:J

    .line 229
    .line 230
    sub-long/2addr v5, v7

    .line 231
    long-to-int v1, v5

    .line 232
    iget-object v5, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer$MeasureRunnable;->e:Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;

    .line 233
    .line 234
    invoke-static {v5}, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->a(Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;)Lcom/immomo/mediacore/sink/SinkBase;

    .line 235
    .line 236
    .line 237
    move-result-object v5

    .line 238
    invoke-virtual {v5}, Lcom/immomo/mediacore/sink/SinkBase;->getRtmpSendSize()J

    .line 239
    .line 240
    .line 241
    move-result-wide v5

    .line 242
    iput-wide v5, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer$MeasureRunnable;->d:J

    .line 243
    .line 244
    iget-object v5, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer$MeasureRunnable;->e:Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;

    .line 245
    .line 246
    int-to-float v1, v1

    .line 247
    int-to-float v0, v0

    .line 248
    mul-float/2addr v0, v4

    .line 249
    div-float/2addr v1, v0

    .line 250
    float-to-int v0, v1

    .line 251
    invoke-static {v5, v0}, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->m(Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;I)V

    .line 252
    .line 253
    .line 254
    goto/16 :goto_0

    .line 255
    .line 256
    :cond_4
    invoke-static {v6, v1}, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->m(Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;I)V

    .line 257
    .line 258
    .line 259
    goto/16 :goto_0

    .line 260
    .line 261
    :cond_5
    :goto_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 262
    .line 263
    const-string v6, "MeasureRunnable exit success\uff1a"

    .line 264
    .line 265
    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 266
    .line 267
    .line 268
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 269
    .line 270
    .line 271
    move-result-wide v6

    .line 272
    iget-wide v8, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer$MeasureRunnable;->b:J

    .line 273
    .line 274
    sub-long/2addr v6, v8

    .line 275
    invoke-virtual {v0, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 276
    .line 277
    .line 278
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 279
    .line 280
    .line 281
    move-result-object v0

    .line 282
    invoke-static {v5, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 283
    .line 284
    .line 285
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer$MeasureRunnable;->e:Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;

    .line 286
    .line 287
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->a(Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;)Lcom/immomo/mediacore/sink/SinkBase;

    .line 288
    .line 289
    .line 290
    move-result-object v0

    .line 291
    invoke-virtual {v0}, Lcom/immomo/mediacore/sink/SinkBase;->getRtmpSendSize()J

    .line 292
    .line 293
    .line 294
    move-result-wide v5

    .line 295
    cmp-long v0, v5, v2

    .line 296
    .line 297
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer$MeasureRunnable;->e:Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;

    .line 298
    .line 299
    if-lez v0, :cond_6

    .line 300
    .line 301
    invoke-static {v2}, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->a(Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;)Lcom/immomo/mediacore/sink/SinkBase;

    .line 302
    .line 303
    .line 304
    move-result-object v0

    .line 305
    invoke-virtual {v0}, Lcom/immomo/mediacore/sink/SinkBase;->getRtmpSendSize()J

    .line 306
    .line 307
    .line 308
    move-result-wide v0

    .line 309
    long-to-int v0, v0

    .line 310
    int-to-float v0, v0

    .line 311
    mul-float/2addr v0, v4

    .line 312
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 313
    .line 314
    .line 315
    move-result-wide v1

    .line 316
    iget-wide v3, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer$MeasureRunnable;->b:J

    .line 317
    .line 318
    sub-long/2addr v1, v3

    .line 319
    long-to-int v1, v1

    .line 320
    int-to-float v1, v1

    .line 321
    div-float/2addr v0, v1

    .line 322
    float-to-int v0, v0

    .line 323
    mul-int/lit16 v0, v0, 0x1f40

    .line 324
    .line 325
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer$MeasureRunnable;->e:Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;

    .line 326
    .line 327
    invoke-static {v1, v0}, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->n(Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;I)V

    .line 328
    .line 329
    .line 330
    goto :goto_3

    .line 331
    :cond_6
    invoke-static {v2, v1}, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->n(Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;I)V

    .line 332
    .line 333
    .line 334
    :goto_3
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer$MeasureRunnable;->e:Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;

    .line 335
    .line 336
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->a(Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;)Lcom/immomo/mediacore/sink/SinkBase;

    .line 337
    .line 338
    .line 339
    move-result-object v0

    .line 340
    if-eqz v0, :cond_7

    .line 341
    .line 342
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer$MeasureRunnable;->e:Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;

    .line 343
    .line 344
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->a(Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;)Lcom/immomo/mediacore/sink/SinkBase;

    .line 345
    .line 346
    .line 347
    move-result-object v0

    .line 348
    invoke-virtual {v0}, Lcom/immomo/mediacore/sink/SinkBase;->release()V

    .line 349
    .line 350
    .line 351
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer$MeasureRunnable;->e:Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;

    .line 352
    .line 353
    const/4 v0, 0x0

    .line 354
    invoke-static {p0, v0}, Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;->b(Ltv/danmaku/ijk/media/streamer/ijkStrMeasurer;Lcom/immomo/mediacore/sink/SinkBase;)Lcom/immomo/mediacore/sink/SinkBase;

    .line 355
    .line 356
    .line 357
    :cond_7
    return-void
.end method
