.class public Lcom/immomo/moment/mediautils/c$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/moment/mediautils/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field final synthetic a:Lcom/immomo/moment/mediautils/c;


# direct methods
.method public constructor <init>(Lcom/immomo/moment/mediautils/c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/c$a;->a:Lcom/immomo/moment/mediautils/c;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .line 1
    const-string v0, "AudioDecoderBySoft"

    .line 2
    .line 3
    const-string v1, "start getAudioData"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    :goto_0
    move v1, v0

    .line 10
    :cond_0
    iget-object v2, p0, Lcom/immomo/moment/mediautils/c$a;->a:Lcom/immomo/moment/mediautils/c;

    .line 11
    .line 12
    invoke-static {v2}, Lcom/immomo/moment/mediautils/c;->n(Lcom/immomo/moment/mediautils/c;)Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    iget-object v3, p0, Lcom/immomo/moment/mediautils/c$a;->a:Lcom/immomo/moment/mediautils/c;

    .line 17
    .line 18
    if-nez v2, :cond_10

    .line 19
    .line 20
    iget-object v2, v3, Lcom/immomo/moment/mediautils/b;->l:Ljava/lang/Object;

    .line 21
    .line 22
    monitor-enter v2

    .line 23
    :try_start_0
    iget-object v3, p0, Lcom/immomo/moment/mediautils/c$a;->a:Lcom/immomo/moment/mediautils/c;

    .line 24
    .line 25
    invoke-static {v3}, Lcom/immomo/moment/mediautils/c;->o(Lcom/immomo/moment/mediautils/c;)Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    if-eqz v3, :cond_1

    .line 30
    .line 31
    iget-object v3, p0, Lcom/immomo/moment/mediautils/c$a;->a:Lcom/immomo/moment/mediautils/c;

    .line 32
    .line 33
    invoke-static {v3}, Lcom/immomo/moment/mediautils/c;->o(Lcom/immomo/moment/mediautils/c;)Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    invoke-virtual {v3}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->getAudioFrameCnt()I

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    goto :goto_1

    .line 42
    :catchall_0
    move-exception p0

    .line 43
    goto/16 :goto_a

    .line 44
    .line 45
    :cond_1
    move v3, v0

    .line 46
    :goto_1
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 47
    iget-object v2, p0, Lcom/immomo/moment/mediautils/c$a;->a:Lcom/immomo/moment/mediautils/c;

    .line 48
    .line 49
    invoke-static {v2}, Lcom/immomo/moment/mediautils/c;->q(Lcom/immomo/moment/mediautils/c;)Z

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    const/4 v4, 0x1

    .line 54
    if-nez v2, :cond_a

    .line 55
    .line 56
    if-lez v3, :cond_a

    .line 57
    .line 58
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 59
    .line 60
    .line 61
    iget-object v2, p0, Lcom/immomo/moment/mediautils/c$a;->a:Lcom/immomo/moment/mediautils/c;

    .line 62
    .line 63
    iget-object v2, v2, Lcom/immomo/moment/mediautils/b;->l:Ljava/lang/Object;

    .line 64
    .line 65
    monitor-enter v2

    .line 66
    :try_start_1
    iget-object v3, p0, Lcom/immomo/moment/mediautils/c$a;->a:Lcom/immomo/moment/mediautils/c;

    .line 67
    .line 68
    invoke-static {v3}, Lcom/immomo/moment/mediautils/c;->o(Lcom/immomo/moment/mediautils/c;)Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    if-eqz v3, :cond_2

    .line 73
    .line 74
    iget-object v3, p0, Lcom/immomo/moment/mediautils/c$a;->a:Lcom/immomo/moment/mediautils/c;

    .line 75
    .line 76
    invoke-static {v3}, Lcom/immomo/moment/mediautils/c;->o(Lcom/immomo/moment/mediautils/c;)Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 77
    .line 78
    .line 79
    move-result-object v3

    .line 80
    invoke-virtual {v3}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->getAudioFrame()Ll/ad60;

    .line 81
    .line 82
    .line 83
    move-result-object v3

    .line 84
    goto :goto_2

    .line 85
    :catchall_1
    move-exception p0

    .line 86
    goto/16 :goto_4

    .line 87
    .line 88
    :cond_2
    const/4 v3, 0x0

    .line 89
    :goto_2
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 90
    if-eqz v3, :cond_9

    .line 91
    .line 92
    invoke-virtual {v3}, Ll/ad60;->b()Landroid/media/MediaCodec$BufferInfo;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    invoke-virtual {v3}, Ll/ad60;->a()Ljava/nio/ByteBuffer;

    .line 97
    .line 98
    .line 99
    move-result-object v3

    .line 100
    iget v5, v2, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 101
    .line 102
    if-lez v5, :cond_8

    .line 103
    .line 104
    iget-object v6, p0, Lcom/immomo/moment/mediautils/c$a;->a:Lcom/immomo/moment/mediautils/c;

    .line 105
    .line 106
    iget-boolean v7, v6, Lcom/immomo/moment/mediautils/b;->s:Z

    .line 107
    .line 108
    if-eqz v7, :cond_3

    .line 109
    .line 110
    invoke-static {v5}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 111
    .line 112
    .line 113
    move-result-object v5

    .line 114
    invoke-virtual {v5, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 115
    .line 116
    .line 117
    invoke-virtual {v3, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 118
    .line 119
    .line 120
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->array()[B

    .line 121
    .line 122
    .line 123
    move-result-object v6

    .line 124
    iget v7, v2, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 125
    .line 126
    invoke-virtual {v5, v6, v0, v7}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 127
    .line 128
    .line 129
    invoke-virtual {v5, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 130
    .line 131
    .line 132
    iget-object v6, p0, Lcom/immomo/moment/mediautils/c$a;->a:Lcom/immomo/moment/mediautils/c;

    .line 133
    .line 134
    iget-object v6, v6, Lcom/immomo/moment/mediautils/b;->t:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 135
    .line 136
    invoke-virtual {v6, v5}, Ljava/util/concurrent/LinkedBlockingQueue;->offer(Ljava/lang/Object;)Z

    .line 137
    .line 138
    .line 139
    iget-object v5, p0, Lcom/immomo/moment/mediautils/c$a;->a:Lcom/immomo/moment/mediautils/c;

    .line 140
    .line 141
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 142
    .line 143
    .line 144
    iget-object v5, p0, Lcom/immomo/moment/mediautils/c$a;->a:Lcom/immomo/moment/mediautils/c;

    .line 145
    .line 146
    iget-object v5, v5, Lcom/immomo/moment/mediautils/b;->a:Lcom/immomo/moment/mediautils/b$b;

    .line 147
    .line 148
    if-eqz v5, :cond_6

    .line 149
    .line 150
    iget v6, v2, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 151
    .line 152
    iget-wide v7, v2, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 153
    .line 154
    invoke-interface {v5, v3, v6, v7, v8}, Lcom/immomo/moment/mediautils/b$b;->a(Ljava/nio/ByteBuffer;IJ)V

    .line 155
    .line 156
    .line 157
    goto :goto_3

    .line 158
    :cond_3
    iget-boolean v6, v6, Lcom/immomo/moment/mediautils/b;->k:Z

    .line 159
    .line 160
    if-eqz v6, :cond_4

    .line 161
    .line 162
    invoke-static {v5}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 163
    .line 164
    .line 165
    move-result-object v5

    .line 166
    invoke-virtual {v5, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 167
    .line 168
    .line 169
    invoke-virtual {v3, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 170
    .line 171
    .line 172
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->array()[B

    .line 173
    .line 174
    .line 175
    move-result-object v6

    .line 176
    iget v7, v2, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 177
    .line 178
    invoke-virtual {v5, v6, v0, v7}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 179
    .line 180
    .line 181
    invoke-virtual {v5, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 182
    .line 183
    .line 184
    iget-object v6, p0, Lcom/immomo/moment/mediautils/c$a;->a:Lcom/immomo/moment/mediautils/c;

    .line 185
    .line 186
    iget-object v6, v6, Lcom/immomo/moment/mediautils/b;->t:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 187
    .line 188
    invoke-virtual {v6, v5}, Ljava/util/concurrent/LinkedBlockingQueue;->offer(Ljava/lang/Object;)Z

    .line 189
    .line 190
    .line 191
    :cond_4
    iget-object v5, p0, Lcom/immomo/moment/mediautils/c$a;->a:Lcom/immomo/moment/mediautils/c;

    .line 192
    .line 193
    iget-object v5, v5, Lcom/immomo/moment/mediautils/b;->a:Lcom/immomo/moment/mediautils/b$b;

    .line 194
    .line 195
    if-eqz v5, :cond_5

    .line 196
    .line 197
    iget v6, v2, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 198
    .line 199
    iget-wide v7, v2, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 200
    .line 201
    invoke-interface {v5, v3, v6, v7, v8}, Lcom/immomo/moment/mediautils/b$b;->a(Ljava/nio/ByteBuffer;IJ)V

    .line 202
    .line 203
    .line 204
    :cond_5
    iget-object v3, p0, Lcom/immomo/moment/mediautils/c$a;->a:Lcom/immomo/moment/mediautils/c;

    .line 205
    .line 206
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 207
    .line 208
    .line 209
    :cond_6
    :goto_3
    iget-object v3, p0, Lcom/immomo/moment/mediautils/c$a;->a:Lcom/immomo/moment/mediautils/c;

    .line 210
    .line 211
    iget-wide v5, v3, Lcom/immomo/moment/mediautils/b;->o:J

    .line 212
    .line 213
    const-wide/16 v7, 0x0

    .line 214
    .line 215
    cmp-long v7, v5, v7

    .line 216
    .line 217
    if-eqz v7, :cond_8

    .line 218
    .line 219
    iget-wide v7, v2, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 220
    .line 221
    cmp-long v2, v7, v5

    .line 222
    .line 223
    if-ltz v2, :cond_8

    .line 224
    .line 225
    iget-boolean v2, v3, Lcom/immomo/moment/mediautils/b;->k:Z

    .line 226
    .line 227
    if-eqz v2, :cond_8

    .line 228
    .line 229
    const-string v2, "AudioDecoderBySoft"

    .line 230
    .line 231
    const-string v3, "reach range end"

    .line 232
    .line 233
    invoke-static {v2, v3}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 234
    .line 235
    .line 236
    iget-object v2, p0, Lcom/immomo/moment/mediautils/c$a;->a:Lcom/immomo/moment/mediautils/c;

    .line 237
    .line 238
    iput-boolean v4, v2, Lcom/immomo/moment/mediautils/b;->r:Z

    .line 239
    .line 240
    iget-object v2, v2, Lcom/immomo/moment/mediautils/b;->a:Lcom/immomo/moment/mediautils/b$b;

    .line 241
    .line 242
    if-eqz v2, :cond_7

    .line 243
    .line 244
    const-string v2, "AudioDecoderBySoft"

    .line 245
    .line 246
    const-string v3, "mOnDataListener.onFinished"

    .line 247
    .line 248
    invoke-static {v2, v3}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 249
    .line 250
    .line 251
    iget-object v2, p0, Lcom/immomo/moment/mediautils/c$a;->a:Lcom/immomo/moment/mediautils/c;

    .line 252
    .line 253
    iget-object v2, v2, Lcom/immomo/moment/mediautils/b;->a:Lcom/immomo/moment/mediautils/b$b;

    .line 254
    .line 255
    invoke-interface {v2}, Lcom/immomo/moment/mediautils/b$b;->onFinished()V

    .line 256
    .line 257
    .line 258
    :cond_7
    iget-object v2, p0, Lcom/immomo/moment/mediautils/c$a;->a:Lcom/immomo/moment/mediautils/c;

    .line 259
    .line 260
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 261
    .line 262
    .line 263
    iget-object v2, p0, Lcom/immomo/moment/mediautils/c$a;->a:Lcom/immomo/moment/mediautils/c;

    .line 264
    .line 265
    invoke-static {v2}, Lcom/immomo/moment/mediautils/c;->o(Lcom/immomo/moment/mediautils/c;)Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 266
    .line 267
    .line 268
    move-result-object v2

    .line 269
    if-eqz v2, :cond_8

    .line 270
    .line 271
    new-instance v2, Ljava/lang/Thread;

    .line 272
    .line 273
    new-instance v3, Lcom/immomo/moment/mediautils/c$a$a;

    .line 274
    .line 275
    invoke-direct {v3, p0}, Lcom/immomo/moment/mediautils/c$a$a;-><init>(Lcom/immomo/moment/mediautils/c$a;)V

    .line 276
    .line 277
    .line 278
    new-instance v5, Ljava/lang/StringBuilder;

    .line 279
    .line 280
    const-string v6, "AudioDecoderRelease"

    .line 281
    .line 282
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 283
    .line 284
    .line 285
    invoke-static {}, Ll/g8g0;->b()Ljava/lang/String;

    .line 286
    .line 287
    .line 288
    move-result-object v6

    .line 289
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 290
    .line 291
    .line 292
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 293
    .line 294
    .line 295
    move-result-object v5

    .line 296
    invoke-direct {v2, v3, v5}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 297
    .line 298
    .line 299
    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 300
    .line 301
    .line 302
    :cond_8
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 303
    .line 304
    .line 305
    goto :goto_6

    .line 306
    :cond_9
    const-string v1, "AudioDecoderBySoft"

    .line 307
    .line 308
    const-string v2, "packet is null and wait 10ms"

    .line 309
    .line 310
    invoke-static {v1, v2}, Lcom/cosmos/mdlog/MDLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 311
    .line 312
    .line 313
    goto :goto_5

    .line 314
    :goto_4
    :try_start_2
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 315
    throw p0

    .line 316
    :cond_a
    :goto_5
    move v1, v4

    .line 317
    :goto_6
    iget-object v2, p0, Lcom/immomo/moment/mediautils/c$a;->a:Lcom/immomo/moment/mediautils/c;

    .line 318
    .line 319
    invoke-static {v2}, Lcom/immomo/moment/mediautils/c;->q(Lcom/immomo/moment/mediautils/c;)Z

    .line 320
    .line 321
    .line 322
    move-result v2

    .line 323
    if-eqz v2, :cond_b

    .line 324
    .line 325
    iget-object v2, p0, Lcom/immomo/moment/mediautils/c$a;->a:Lcom/immomo/moment/mediautils/c;

    .line 326
    .line 327
    invoke-static {v2}, Lcom/immomo/moment/mediautils/c;->r(Lcom/immomo/moment/mediautils/c;)Ljava/lang/Object;

    .line 328
    .line 329
    .line 330
    move-result-object v2

    .line 331
    monitor-enter v2

    .line 332
    :try_start_3
    iget-object v3, p0, Lcom/immomo/moment/mediautils/c$a;->a:Lcom/immomo/moment/mediautils/c;

    .line 333
    .line 334
    invoke-static {v3, v4}, Lcom/immomo/moment/mediautils/c;->s(Lcom/immomo/moment/mediautils/c;Z)Z

    .line 335
    .line 336
    .line 337
    iget-object v3, p0, Lcom/immomo/moment/mediautils/c$a;->a:Lcom/immomo/moment/mediautils/c;

    .line 338
    .line 339
    invoke-static {v3}, Lcom/immomo/moment/mediautils/c;->r(Lcom/immomo/moment/mediautils/c;)Ljava/lang/Object;

    .line 340
    .line 341
    .line 342
    move-result-object v3

    .line 343
    invoke-virtual {v3}, Ljava/lang/Object;->notifyAll()V

    .line 344
    .line 345
    .line 346
    monitor-exit v2

    .line 347
    goto :goto_7

    .line 348
    :catchall_2
    move-exception p0

    .line 349
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 350
    throw p0

    .line 351
    :cond_b
    :goto_7
    iget-object v2, p0, Lcom/immomo/moment/mediautils/c$a;->a:Lcom/immomo/moment/mediautils/c;

    .line 352
    .line 353
    iget-object v3, v2, Lcom/immomo/moment/mediautils/b;->l:Ljava/lang/Object;

    .line 354
    .line 355
    monitor-enter v3

    .line 356
    :try_start_4
    iget-object v2, p0, Lcom/immomo/moment/mediautils/c$a;->a:Lcom/immomo/moment/mediautils/c;

    .line 357
    .line 358
    invoke-static {v2}, Lcom/immomo/moment/mediautils/c;->o(Lcom/immomo/moment/mediautils/c;)Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 359
    .line 360
    .line 361
    move-result-object v2

    .line 362
    if-eqz v2, :cond_c

    .line 363
    .line 364
    iget-object v2, p0, Lcom/immomo/moment/mediautils/c$a;->a:Lcom/immomo/moment/mediautils/c;

    .line 365
    .line 366
    invoke-static {v2}, Lcom/immomo/moment/mediautils/c;->o(Lcom/immomo/moment/mediautils/c;)Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 367
    .line 368
    .line 369
    move-result-object v2

    .line 370
    invoke-virtual {v2}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->getStatus()I

    .line 371
    .line 372
    .line 373
    move-result v2

    .line 374
    goto :goto_8

    .line 375
    :catchall_3
    move-exception p0

    .line 376
    goto :goto_9

    .line 377
    :cond_c
    const/4 v2, -0x1

    .line 378
    :goto_8
    monitor-exit v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 379
    if-eqz v2, :cond_f

    .line 380
    .line 381
    iget-object v3, p0, Lcom/immomo/moment/mediautils/c$a;->a:Lcom/immomo/moment/mediautils/c;

    .line 382
    .line 383
    iget-boolean v5, v3, Lcom/immomo/moment/mediautils/b;->r:Z

    .line 384
    .line 385
    if-nez v5, :cond_e

    .line 386
    .line 387
    iget-object v3, v3, Lcom/immomo/moment/mediautils/b;->a:Lcom/immomo/moment/mediautils/b$b;

    .line 388
    .line 389
    if-eqz v3, :cond_d

    .line 390
    .line 391
    const-string v3, "AudioDecoderBySoft"

    .line 392
    .line 393
    const-string v5, "mOnDataListener.onFinished"

    .line 394
    .line 395
    invoke-static {v3, v5}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 396
    .line 397
    .line 398
    iget-object v3, p0, Lcom/immomo/moment/mediautils/c$a;->a:Lcom/immomo/moment/mediautils/c;

    .line 399
    .line 400
    iget-object v3, v3, Lcom/immomo/moment/mediautils/b;->a:Lcom/immomo/moment/mediautils/b$b;

    .line 401
    .line 402
    invoke-interface {v3}, Lcom/immomo/moment/mediautils/b$b;->onFinished()V

    .line 403
    .line 404
    .line 405
    :cond_d
    iget-object v3, p0, Lcom/immomo/moment/mediautils/c$a;->a:Lcom/immomo/moment/mediautils/c;

    .line 406
    .line 407
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 408
    .line 409
    .line 410
    :cond_e
    iget-object v3, p0, Lcom/immomo/moment/mediautils/c$a;->a:Lcom/immomo/moment/mediautils/c;

    .line 411
    .line 412
    iput-boolean v4, v3, Lcom/immomo/moment/mediautils/b;->r:Z

    .line 413
    .line 414
    if-gez v2, :cond_f

    .line 415
    .line 416
    iget-object v2, v3, Lcom/immomo/moment/mediautils/b;->c:Ll/jpw;

    .line 417
    .line 418
    :cond_f
    if-eqz v1, :cond_0

    .line 419
    .line 420
    const-wide/16 v1, 0xa

    .line 421
    .line 422
    :try_start_5
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_5
    .catch Ljava/lang/InterruptedException; {:try_start_5 .. :try_end_5} :catch_0

    .line 423
    .line 424
    .line 425
    goto/16 :goto_0

    .line 426
    .line 427
    :catch_0
    move-exception v1

    .line 428
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 429
    .line 430
    .line 431
    goto/16 :goto_0

    .line 432
    .line 433
    :goto_9
    :try_start_6
    monitor-exit v3
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 434
    throw p0

    .line 435
    :goto_a
    :try_start_7
    monitor-exit v2
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 436
    throw p0

    .line 437
    :cond_10
    iget-boolean v0, v3, Lcom/immomo/moment/mediautils/b;->k:Z

    .line 438
    .line 439
    if-nez v0, :cond_11

    .line 440
    .line 441
    iget-object v0, v3, Lcom/immomo/moment/mediautils/b;->a:Lcom/immomo/moment/mediautils/b$b;

    .line 442
    .line 443
    if-eqz v0, :cond_11

    .line 444
    .line 445
    const-string v0, "AudioDecoderBySoft"

    .line 446
    .line 447
    const-string v1, "mOnDataListener.onFinished"

    .line 448
    .line 449
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 450
    .line 451
    .line 452
    iget-object v0, p0, Lcom/immomo/moment/mediautils/c$a;->a:Lcom/immomo/moment/mediautils/c;

    .line 453
    .line 454
    iget-object v0, v0, Lcom/immomo/moment/mediautils/b;->a:Lcom/immomo/moment/mediautils/b$b;

    .line 455
    .line 456
    invoke-interface {v0}, Lcom/immomo/moment/mediautils/b$b;->onFinished()V

    .line 457
    .line 458
    .line 459
    :cond_11
    iget-object p0, p0, Lcom/immomo/moment/mediautils/c$a;->a:Lcom/immomo/moment/mediautils/c;

    .line 460
    .line 461
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 462
    .line 463
    .line 464
    return-void
.end method
