.class Ll/pc1$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/pc1;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field private a:I

.field private b:[B

.field private c:I

.field final synthetic d:Ll/pc1;


# direct methods
.method public constructor <init>(Ll/pc1;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/pc1$a;->d:Ll/pc1;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput p1, p0, Ll/pc1$a;->a:I

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-object v0, p0, Ll/pc1$a;->b:[B

    .line 11
    .line 12
    iput p1, p0, Ll/pc1$a;->c:I

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public run()V
    .locals 13

    .line 1
    const/16 v0, -0x13

    .line 2
    .line 3
    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/pc1$a;->d:Ll/pc1;

    .line 7
    .line 8
    invoke-static {v0}, Ll/pc1;->a(Ll/pc1;)Landroid/media/AudioRecord;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-eqz v0, :cond_7

    .line 13
    .line 14
    :cond_0
    :goto_0
    iget-object v0, p0, Ll/pc1$a;->d:Ll/pc1;

    .line 15
    .line 16
    invoke-static {v0}, Ll/pc1;->a(Ll/pc1;)Landroid/media/AudioRecord;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Landroid/media/AudioRecord;->getState()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    const/16 v1, 0x7d4

    .line 25
    .line 26
    const/4 v2, 0x1

    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    iget v0, p0, Ll/pc1$a;->a:I

    .line 30
    .line 31
    const/4 v3, 0x5

    .line 32
    if-ge v0, v3, :cond_1

    .line 33
    .line 34
    const-wide/16 v3, 0x64

    .line 35
    .line 36
    :try_start_0
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V

    .line 37
    .line 38
    .line 39
    iget v0, p0, Ll/pc1$a;->a:I

    .line 40
    .line 41
    add-int/2addr v0, v2

    .line 42
    iput v0, p0, Ll/pc1$a;->a:I

    .line 43
    .line 44
    const-string v0, "AudioRecorderWrapper"

    .line 45
    .line 46
    new-instance v2, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 49
    .line 50
    .line 51
    const-string v3, "mAudioRecord.getState "

    .line 52
    .line 53
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    iget-object v3, p0, Ll/pc1$a;->d:Ll/pc1;

    .line 57
    .line 58
    invoke-static {v3}, Ll/pc1;->a(Ll/pc1;)Landroid/media/AudioRecord;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    invoke-virtual {v3}, Landroid/media/AudioRecord;->getState()I

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    invoke-static {v0, v2}, Ll/lyv;->c(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 74
    .line 75
    .line 76
    goto :goto_0

    .line 77
    :catch_0
    move-exception v0

    .line 78
    iget-object v2, p0, Ll/pc1$a;->d:Ll/pc1;

    .line 79
    .line 80
    invoke-static {v2}, Ll/pc1;->b(Ll/pc1;)Ll/spw;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    if-eqz v2, :cond_0

    .line 85
    .line 86
    iget-object v2, p0, Ll/pc1$a;->d:Ll/pc1;

    .line 87
    .line 88
    invoke-static {v2}, Ll/pc1;->b(Ll/pc1;)Ll/spw;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    new-instance v3, Ljava/lang/StringBuilder;

    .line 93
    .line 94
    const-string v4, "AudioRecord thread exception ! ["

    .line 95
    .line 96
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    const-string v0, "]"

    .line 107
    .line 108
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-interface {v2, v1, v0}, Ll/spw;->onFail(ILjava/lang/String;)V

    .line 116
    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_1
    const/16 v3, 0x1000

    .line 120
    .line 121
    :try_start_1
    iget-object v0, p0, Ll/pc1$a;->d:Ll/pc1;

    .line 122
    .line 123
    invoke-static {v0}, Ll/pc1;->a(Ll/pc1;)Landroid/media/AudioRecord;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    invoke-virtual {v0}, Landroid/media/AudioRecord;->startRecording()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 128
    .line 129
    .line 130
    :goto_1
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    .line 131
    .line 132
    .line 133
    move-result v0

    .line 134
    if-nez v0, :cond_5

    .line 135
    .line 136
    iget-object v0, p0, Ll/pc1$a;->d:Ll/pc1;

    .line 137
    .line 138
    invoke-static {v0}, Ll/pc1;->c(Ll/pc1;)Z

    .line 139
    .line 140
    .line 141
    move-result v0

    .line 142
    if-eqz v0, :cond_5

    .line 143
    .line 144
    iget-object v0, p0, Ll/pc1$a;->b:[B

    .line 145
    .line 146
    if-nez v0, :cond_2

    .line 147
    .line 148
    iget-object v0, p0, Ll/pc1$a;->d:Ll/pc1;

    .line 149
    .line 150
    invoke-static {v0}, Ll/pc1;->d(Ll/pc1;)I

    .line 151
    .line 152
    .line 153
    move-result v0

    .line 154
    new-array v0, v0, [B

    .line 155
    .line 156
    iput-object v0, p0, Ll/pc1$a;->b:[B

    .line 157
    .line 158
    :cond_2
    iget-object v0, p0, Ll/pc1$a;->d:Ll/pc1;

    .line 159
    .line 160
    invoke-static {v0}, Ll/pc1;->a(Ll/pc1;)Landroid/media/AudioRecord;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    iget-object v4, p0, Ll/pc1$a;->b:[B

    .line 165
    .line 166
    iget-object v5, p0, Ll/pc1$a;->d:Ll/pc1;

    .line 167
    .line 168
    invoke-static {v5}, Ll/pc1;->d(Ll/pc1;)I

    .line 169
    .line 170
    .line 171
    move-result v5

    .line 172
    const/4 v6, 0x0

    .line 173
    invoke-virtual {v0, v4, v6, v5}, Landroid/media/AudioRecord;->read([BII)I

    .line 174
    .line 175
    .line 176
    move-result v0

    .line 177
    iput v0, p0, Ll/pc1$a;->c:I

    .line 178
    .line 179
    iget-object v4, p0, Ll/pc1$a;->d:Ll/pc1;

    .line 180
    .line 181
    if-lez v0, :cond_4

    .line 182
    .line 183
    invoke-static {v4, v2}, Ll/pc1;->e(Ll/pc1;Z)Z

    .line 184
    .line 185
    .line 186
    iget-object v0, p0, Ll/pc1$a;->d:Ll/pc1;

    .line 187
    .line 188
    invoke-static {v0}, Ll/pc1;->f(Ll/pc1;)Ljava/lang/Object;

    .line 189
    .line 190
    .line 191
    move-result-object v5

    .line 192
    monitor-enter v5

    .line 193
    :try_start_2
    iget-object v0, p0, Ll/pc1$a;->d:Ll/pc1;

    .line 194
    .line 195
    invoke-static {v0}, Ll/pc1;->g(Ll/pc1;)Ll/pc1$b;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    if-eqz v0, :cond_3

    .line 200
    .line 201
    new-instance v6, Ll/ad60;

    .line 202
    .line 203
    iget-object v0, p0, Ll/pc1$a;->d:Ll/pc1;

    .line 204
    .line 205
    invoke-static {v0}, Ll/pc1;->d(Ll/pc1;)I

    .line 206
    .line 207
    .line 208
    move-result v0

    .line 209
    invoke-direct {v6, v0}, Ll/ad60;-><init>(I)V

    .line 210
    .line 211
    .line 212
    invoke-virtual {v6}, Ll/ad60;->a()Ljava/nio/ByteBuffer;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    iget-object v4, p0, Ll/pc1$a;->b:[B

    .line 217
    .line 218
    invoke-virtual {v0, v4}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 219
    .line 220
    .line 221
    invoke-virtual {v6}, Ll/ad60;->a()Ljava/nio/ByteBuffer;

    .line 222
    .line 223
    .line 224
    move-result-object v0

    .line 225
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 226
    .line 227
    .line 228
    iget-object v0, p0, Ll/pc1$a;->d:Ll/pc1;

    .line 229
    .line 230
    invoke-static {v0}, Ll/pc1;->d(Ll/pc1;)I

    .line 231
    .line 232
    .line 233
    move-result v7

    .line 234
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 235
    .line 236
    .line 237
    move-result-wide v8

    .line 238
    const-wide/16 v10, 0x3e8

    .line 239
    .line 240
    div-long v10, v8, v10

    .line 241
    .line 242
    const/4 v12, 0x0

    .line 243
    const/4 v8, 0x0

    .line 244
    const/4 v9, 0x0

    .line 245
    invoke-virtual/range {v6 .. v12}, Ll/ad60;->d(IIIJI)V

    .line 246
    .line 247
    .line 248
    iget-object v0, p0, Ll/pc1$a;->d:Ll/pc1;

    .line 249
    .line 250
    invoke-static {v0}, Ll/pc1;->g(Ll/pc1;)Ll/pc1$b;

    .line 251
    .line 252
    .line 253
    move-result-object v0

    .line 254
    invoke-interface {v0, v6}, Ll/pc1$b;->a(Ll/ad60;)V

    .line 255
    .line 256
    .line 257
    goto :goto_2

    .line 258
    :catchall_0
    move-exception v0

    .line 259
    move-object p0, v0

    .line 260
    goto :goto_3

    .line 261
    :cond_3
    :goto_2
    monitor-exit v5

    .line 262
    goto/16 :goto_1

    .line 263
    .line 264
    :goto_3
    monitor-exit v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 265
    throw p0

    .line 266
    :cond_4
    invoke-static {v4, v6}, Ll/pc1;->e(Ll/pc1;Z)Z

    .line 267
    .line 268
    .line 269
    const-string v0, "AudioRecorderWrapper"

    .line 270
    .line 271
    new-instance v2, Ljava/lang/StringBuilder;

    .line 272
    .line 273
    const-string v4, "MediaRecorder.read() return errorcode="

    .line 274
    .line 275
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 276
    .line 277
    .line 278
    iget v4, p0, Ll/pc1$a;->c:I

    .line 279
    .line 280
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 281
    .line 282
    .line 283
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 284
    .line 285
    .line 286
    move-result-object v2

    .line 287
    invoke-static {v0, v2}, Ll/lyv;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 288
    .line 289
    .line 290
    sget v0, Ll/pc1;->p:I

    .line 291
    .line 292
    invoke-static {v3, v0}, Ll/o4f;->a(II)V

    .line 293
    .line 294
    .line 295
    iget-object v0, p0, Ll/pc1$a;->d:Ll/pc1;

    .line 296
    .line 297
    invoke-static {v0}, Ll/pc1;->b(Ll/pc1;)Ll/spw;

    .line 298
    .line 299
    .line 300
    move-result-object v0

    .line 301
    if-eqz v0, :cond_5

    .line 302
    .line 303
    iget-object v0, p0, Ll/pc1$a;->d:Ll/pc1;

    .line 304
    .line 305
    invoke-static {v0}, Ll/pc1;->b(Ll/pc1;)Ll/spw;

    .line 306
    .line 307
    .line 308
    move-result-object v0

    .line 309
    new-instance v2, Ljava/lang/StringBuilder;

    .line 310
    .line 311
    const-string v3, "MediaRecorder.read() return errorcode="

    .line 312
    .line 313
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 314
    .line 315
    .line 316
    iget p0, p0, Ll/pc1$a;->c:I

    .line 317
    .line 318
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 319
    .line 320
    .line 321
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 322
    .line 323
    .line 324
    move-result-object p0

    .line 325
    invoke-interface {v0, v1, p0}, Ll/spw;->onFail(ILjava/lang/String;)V

    .line 326
    .line 327
    .line 328
    :cond_5
    const-string p0, "AudioRecorderWrapper"

    .line 329
    .line 330
    const-string v0, " mAudioRecord.stop() and release"

    .line 331
    .line 332
    invoke-static {p0, v0}, Ll/lyv;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 333
    .line 334
    .line 335
    return-void

    .line 336
    :catch_1
    move-exception v0

    .line 337
    const-string v1, "AudioRecorderWrapper"

    .line 338
    .line 339
    new-instance v2, Ljava/lang/StringBuilder;

    .line 340
    .line 341
    const-string v4, "call MediaRecord.startRecording error ! ["

    .line 342
    .line 343
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 344
    .line 345
    .line 346
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 347
    .line 348
    .line 349
    move-result-object v4

    .line 350
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 351
    .line 352
    .line 353
    const-string v4, "]"

    .line 354
    .line 355
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 356
    .line 357
    .line 358
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 359
    .line 360
    .line 361
    move-result-object v2

    .line 362
    invoke-static {v1, v2}, Ll/lyv;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 363
    .line 364
    .line 365
    iget-object v1, p0, Ll/pc1$a;->d:Ll/pc1;

    .line 366
    .line 367
    invoke-static {v1}, Ll/pc1;->b(Ll/pc1;)Ll/spw;

    .line 368
    .line 369
    .line 370
    move-result-object v1

    .line 371
    if-eqz v1, :cond_6

    .line 372
    .line 373
    iget-object p0, p0, Ll/pc1$a;->d:Ll/pc1;

    .line 374
    .line 375
    invoke-static {p0}, Ll/pc1;->b(Ll/pc1;)Ll/spw;

    .line 376
    .line 377
    .line 378
    move-result-object p0

    .line 379
    new-instance v1, Ljava/lang/StringBuilder;

    .line 380
    .line 381
    const-string v2, "call MediaRecord.startRecording error ! ["

    .line 382
    .line 383
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 384
    .line 385
    .line 386
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 387
    .line 388
    .line 389
    move-result-object v0

    .line 390
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 391
    .line 392
    .line 393
    const-string v0, "]"

    .line 394
    .line 395
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 396
    .line 397
    .line 398
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 399
    .line 400
    .line 401
    move-result-object v0

    .line 402
    const/16 v1, 0x7d2

    .line 403
    .line 404
    invoke-interface {p0, v1, v0}, Ll/spw;->onFail(ILjava/lang/String;)V

    .line 405
    .line 406
    .line 407
    :cond_6
    sget p0, Ll/pc1;->o:I

    .line 408
    .line 409
    invoke-static {v3, p0}, Ll/o4f;->a(II)V

    .line 410
    .line 411
    .line 412
    :cond_7
    return-void
.end method
