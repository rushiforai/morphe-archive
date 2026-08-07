.class Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput$VideoThread;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "VideoThread"
.end annotation


# instance fields
.field private decoder:Landroid/media/MediaCodec;

.field private extractor:Landroid/media/MediaExtractor;

.field final synthetic this$0:Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput$VideoThread;->this$0:Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 17
    .annotation build Landroid/annotation/TargetApi;
        value = 0x12
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    iget-object v0, v1, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput$VideoThread;->this$0:Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->access$000(Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;)Lcom/momo/mcamera/videoprocess/VideoProcessListener;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, v1, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput$VideoThread;->this$0:Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->access$000(Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;)Lcom/momo/mcamera/videoprocess/VideoProcessListener;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {v0}, Lcom/momo/mcamera/videoprocess/VideoProcessListener;->onStart()V

    .line 18
    .line 19
    .line 20
    :cond_0
    new-instance v0, Landroid/media/MediaExtractor;

    .line 21
    .line 22
    invoke-direct {v0}, Landroid/media/MediaExtractor;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object v0, v1, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput$VideoThread;->extractor:Landroid/media/MediaExtractor;

    .line 26
    .line 27
    :try_start_0
    iget-object v0, v1, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput$VideoThread;->this$0:Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;

    .line 28
    .line 29
    invoke-static {v0}, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->access$100(Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {v0}, Lcom/core/glcore/util/FileUtil;->exist(Ljava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    iget-object v0, v1, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput$VideoThread;->extractor:Landroid/media/MediaExtractor;

    .line 37
    .line 38
    iget-object v2, v1, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput$VideoThread;->this$0:Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;

    .line 39
    .line 40
    invoke-static {v2}, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->access$100(Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {v0, v2}, Landroid/media/MediaExtractor;->setDataSource(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :catch_0
    move-exception v0

    .line 49
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 50
    .line 51
    .line 52
    :goto_0
    const/4 v2, 0x0

    .line 53
    move v0, v2

    .line 54
    :goto_1
    iget-object v3, v1, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput$VideoThread;->extractor:Landroid/media/MediaExtractor;

    .line 55
    .line 56
    invoke-virtual {v3}, Landroid/media/MediaExtractor;->getTrackCount()I

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    const/4 v4, 0x0

    .line 61
    if-ge v0, v3, :cond_2

    .line 62
    .line 63
    iget-object v3, v1, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput$VideoThread;->extractor:Landroid/media/MediaExtractor;

    .line 64
    .line 65
    invoke-virtual {v3, v0}, Landroid/media/MediaExtractor;->getTrackFormat(I)Landroid/media/MediaFormat;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    const-string v5, "mime"

    .line 70
    .line 71
    invoke-virtual {v3, v5}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v5

    .line 75
    const-string v6, "video/"

    .line 76
    .line 77
    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 78
    .line 79
    .line 80
    move-result v6

    .line 81
    if-eqz v6, :cond_1

    .line 82
    .line 83
    iget-object v6, v1, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput$VideoThread;->extractor:Landroid/media/MediaExtractor;

    .line 84
    .line 85
    invoke-virtual {v6, v0}, Landroid/media/MediaExtractor;->selectTrack(I)V

    .line 86
    .line 87
    .line 88
    :try_start_1
    invoke-static {v5}, Landroid/media/MediaCodec;->createDecoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    iput-object v0, v1, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput$VideoThread;->decoder:Landroid/media/MediaCodec;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 93
    .line 94
    goto :goto_2

    .line 95
    :catch_1
    move-exception v0

    .line 96
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 97
    .line 98
    .line 99
    :goto_2
    iget-object v0, v1, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput$VideoThread;->decoder:Landroid/media/MediaCodec;

    .line 100
    .line 101
    iget-object v5, v1, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput$VideoThread;->this$0:Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;

    .line 102
    .line 103
    iget-object v5, v5, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->surface:Landroid/view/Surface;

    .line 104
    .line 105
    invoke-virtual {v0, v3, v5, v4, v2}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 106
    .line 107
    .line 108
    goto :goto_3

    .line 109
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 110
    .line 111
    goto :goto_1

    .line 112
    :cond_2
    :goto_3
    iget-object v0, v1, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput$VideoThread;->decoder:Landroid/media/MediaCodec;

    .line 113
    .line 114
    if-nez v0, :cond_3

    .line 115
    .line 116
    goto/16 :goto_a

    .line 117
    .line 118
    :cond_3
    invoke-virtual {v0}, Landroid/media/MediaCodec;->start()V

    .line 119
    .line 120
    .line 121
    iget-object v0, v1, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput$VideoThread;->decoder:Landroid/media/MediaCodec;

    .line 122
    .line 123
    invoke-virtual {v0}, Landroid/media/MediaCodec;->getInputBuffers()[Ljava/nio/ByteBuffer;

    .line 124
    .line 125
    .line 126
    move-result-object v3

    .line 127
    iget-object v0, v1, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput$VideoThread;->decoder:Landroid/media/MediaCodec;

    .line 128
    .line 129
    invoke-virtual {v0}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    .line 130
    .line 131
    .line 132
    new-instance v5, Landroid/media/MediaCodec$BufferInfo;

    .line 133
    .line 134
    invoke-direct {v5}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    .line 135
    .line 136
    .line 137
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 138
    .line 139
    .line 140
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 141
    .line 142
    .line 143
    move v0, v2

    .line 144
    :goto_4
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    .line 145
    .line 146
    .line 147
    move-result v6

    .line 148
    if-nez v6, :cond_f

    .line 149
    .line 150
    const-wide/16 v6, 0x2710

    .line 151
    .line 152
    const/4 v8, 0x1

    .line 153
    if-nez v0, :cond_5

    .line 154
    .line 155
    iget-object v9, v1, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput$VideoThread;->decoder:Landroid/media/MediaCodec;

    .line 156
    .line 157
    invoke-virtual {v9, v6, v7}, Landroid/media/MediaCodec;->dequeueInputBuffer(J)I

    .line 158
    .line 159
    .line 160
    move-result v11

    .line 161
    if-ltz v11, :cond_5

    .line 162
    .line 163
    aget-object v9, v3, v11

    .line 164
    .line 165
    iget-object v10, v1, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput$VideoThread;->extractor:Landroid/media/MediaExtractor;

    .line 166
    .line 167
    invoke-virtual {v10, v9, v2}, Landroid/media/MediaExtractor;->readSampleData(Ljava/nio/ByteBuffer;I)I

    .line 168
    .line 169
    .line 170
    move-result v13

    .line 171
    iget-object v10, v1, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput$VideoThread;->decoder:Landroid/media/MediaCodec;

    .line 172
    .line 173
    if-gez v13, :cond_4

    .line 174
    .line 175
    const-wide/16 v14, 0x0

    .line 176
    .line 177
    const/16 v16, 0x4

    .line 178
    .line 179
    const/4 v12, 0x0

    .line 180
    const/4 v13, 0x0

    .line 181
    invoke-virtual/range {v10 .. v16}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 182
    .line 183
    .line 184
    move v9, v8

    .line 185
    goto :goto_5

    .line 186
    :cond_4
    iget-object v9, v1, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput$VideoThread;->extractor:Landroid/media/MediaExtractor;

    .line 187
    .line 188
    invoke-virtual {v9}, Landroid/media/MediaExtractor;->getSampleTime()J

    .line 189
    .line 190
    .line 191
    move-result-wide v14

    .line 192
    const/16 v16, 0x0

    .line 193
    .line 194
    const/4 v12, 0x0

    .line 195
    invoke-virtual/range {v10 .. v16}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 196
    .line 197
    .line 198
    iget-object v9, v1, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput$VideoThread;->extractor:Landroid/media/MediaExtractor;

    .line 199
    .line 200
    invoke-virtual {v9}, Landroid/media/MediaExtractor;->advance()Z

    .line 201
    .line 202
    .line 203
    :cond_5
    move v9, v0

    .line 204
    :goto_5
    iget-object v0, v1, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput$VideoThread;->decoder:Landroid/media/MediaCodec;

    .line 205
    .line 206
    invoke-virtual {v0, v5, v6, v7}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    .line 207
    .line 208
    .line 209
    move-result v0

    .line 210
    const/4 v6, -0x3

    .line 211
    if-eq v0, v6, :cond_c

    .line 212
    .line 213
    const/4 v6, -0x2

    .line 214
    if-eq v0, v6, :cond_d

    .line 215
    .line 216
    const/4 v6, -0x1

    .line 217
    if-eq v0, v6, :cond_d

    .line 218
    .line 219
    iget-wide v6, v5, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 220
    .line 221
    const-wide/16 v10, 0x0

    .line 222
    .line 223
    cmp-long v12, v6, v10

    .line 224
    .line 225
    if-ltz v12, :cond_b

    .line 226
    .line 227
    iget-object v6, v1, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput$VideoThread;->this$0:Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;

    .line 228
    .line 229
    invoke-static {v6, v5}, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->access$202(Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;Landroid/media/MediaCodec$BufferInfo;)Landroid/media/MediaCodec$BufferInfo;

    .line 230
    .line 231
    .line 232
    iget-wide v6, v5, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 233
    .line 234
    iget-object v12, v1, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput$VideoThread;->this$0:Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;

    .line 235
    .line 236
    invoke-static {v12}, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->access$300(Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;)J

    .line 237
    .line 238
    .line 239
    move-result-wide v12

    .line 240
    cmp-long v6, v6, v12

    .line 241
    .line 242
    iget-object v7, v1, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput$VideoThread;->this$0:Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;

    .line 243
    .line 244
    if-gtz v6, :cond_6

    .line 245
    .line 246
    invoke-static {v7, v4}, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->access$202(Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;Landroid/media/MediaCodec$BufferInfo;)Landroid/media/MediaCodec$BufferInfo;

    .line 247
    .line 248
    .line 249
    goto/16 :goto_8

    .line 250
    .line 251
    :cond_6
    iget-wide v12, v5, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 252
    .line 253
    invoke-static {v7, v12, v13}, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->access$302(Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;J)J

    .line 254
    .line 255
    .line 256
    iget-object v6, v1, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput$VideoThread;->this$0:Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;

    .line 257
    .line 258
    invoke-static {v6}, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->access$200(Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;)Landroid/media/MediaCodec$BufferInfo;

    .line 259
    .line 260
    .line 261
    move-result-object v6

    .line 262
    iget-wide v6, v6, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 263
    .line 264
    cmp-long v6, v6, v10

    .line 265
    .line 266
    if-lez v6, :cond_d

    .line 267
    .line 268
    iget-object v6, v1, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput$VideoThread;->this$0:Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;

    .line 269
    .line 270
    invoke-static {v6, v8}, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->access$402(Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;Z)Z

    .line 271
    .line 272
    .line 273
    iget-object v6, v1, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput$VideoThread;->this$0:Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;

    .line 274
    .line 275
    invoke-static {v6}, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->access$508(Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;)I

    .line 276
    .line 277
    .line 278
    iget-object v6, v1, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput$VideoThread;->this$0:Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;

    .line 279
    .line 280
    invoke-static {v6}, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->access$000(Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;)Lcom/momo/mcamera/videoprocess/VideoProcessListener;

    .line 281
    .line 282
    .line 283
    move-result-object v6

    .line 284
    if-eqz v6, :cond_7

    .line 285
    .line 286
    iget-object v6, v1, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput$VideoThread;->this$0:Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;

    .line 287
    .line 288
    invoke-static {v6}, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->access$000(Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;)Lcom/momo/mcamera/videoprocess/VideoProcessListener;

    .line 289
    .line 290
    .line 291
    move-result-object v6

    .line 292
    iget-object v7, v1, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput$VideoThread;->this$0:Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;

    .line 293
    .line 294
    invoke-static {v7}, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->access$300(Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;)J

    .line 295
    .line 296
    .line 297
    move-result-wide v12

    .line 298
    long-to-float v7, v12

    .line 299
    iget-object v12, v1, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput$VideoThread;->this$0:Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;

    .line 300
    .line 301
    invoke-static {v12}, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->access$600(Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;)Lcom/momo/mcamera/videoencoder/ProcessParam;

    .line 302
    .line 303
    .line 304
    move-result-object v12

    .line 305
    invoke-virtual {v12}, Lcom/momo/mcamera/videoencoder/ProcessParam;->getVideoDuration()J

    .line 306
    .line 307
    .line 308
    move-result-wide v12

    .line 309
    long-to-float v12, v12

    .line 310
    div-float/2addr v7, v12

    .line 311
    invoke-interface {v6, v7}, Lcom/momo/mcamera/videoprocess/VideoProcessListener;->onProcessProgress(F)V

    .line 312
    .line 313
    .line 314
    :cond_7
    iget-object v6, v1, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput$VideoThread;->this$0:Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;

    .line 315
    .line 316
    invoke-static {v6}, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->access$700(Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;)Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 317
    .line 318
    .line 319
    move-result-object v6

    .line 320
    iget-object v6, v6, Lcom/momo/mcamera/videoencoder/ProcessSurface;->isRenderDrawing:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 321
    .line 322
    invoke-virtual {v6, v8}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 323
    .line 324
    .line 325
    iget-object v6, v1, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput$VideoThread;->decoder:Landroid/media/MediaCodec;

    .line 326
    .line 327
    invoke-virtual {v6, v0, v8}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 328
    .line 329
    .line 330
    iget-object v0, v1, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput$VideoThread;->this$0:Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;

    .line 331
    .line 332
    invoke-static {v0}, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->access$800(Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;)J

    .line 333
    .line 334
    .line 335
    move-result-wide v6

    .line 336
    cmp-long v0, v6, v10

    .line 337
    .line 338
    if-nez v0, :cond_8

    .line 339
    .line 340
    iget-object v0, v1, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput$VideoThread;->this$0:Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;

    .line 341
    .line 342
    invoke-static {v0}, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->access$300(Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;)J

    .line 343
    .line 344
    .line 345
    move-result-wide v6

    .line 346
    invoke-static {v0, v6, v7}, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->access$802(Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;J)J

    .line 347
    .line 348
    .line 349
    :cond_8
    iget-object v0, v1, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput$VideoThread;->this$0:Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;

    .line 350
    .line 351
    invoke-static {v0}, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->access$900(Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;)I

    .line 352
    .line 353
    .line 354
    move-result v0

    .line 355
    iget-object v6, v1, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput$VideoThread;->this$0:Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;

    .line 356
    .line 357
    if-lez v0, :cond_a

    .line 358
    .line 359
    invoke-static {v6}, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->access$300(Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;)J

    .line 360
    .line 361
    .line 362
    move-result-wide v6

    .line 363
    iget-object v0, v1, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput$VideoThread;->this$0:Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;

    .line 364
    .line 365
    invoke-static {v0}, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->access$800(Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;)J

    .line 366
    .line 367
    .line 368
    move-result-wide v10

    .line 369
    sub-long/2addr v6, v10

    .line 370
    iget-object v0, v1, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput$VideoThread;->this$0:Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;

    .line 371
    .line 372
    invoke-static {v0}, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->access$900(Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;)I

    .line 373
    .line 374
    .line 375
    move-result v0

    .line 376
    const v10, 0xf4240

    .line 377
    .line 378
    .line 379
    div-int/2addr v10, v0

    .line 380
    int-to-long v10, v10

    .line 381
    cmp-long v0, v6, v10

    .line 382
    .line 383
    iget-object v6, v1, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput$VideoThread;->this$0:Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;

    .line 384
    .line 385
    if-gez v0, :cond_9

    .line 386
    .line 387
    invoke-static {v6}, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->access$700(Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;)Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 388
    .line 389
    .line 390
    move-result-object v0

    .line 391
    iget-object v0, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->shouldDrop:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 392
    .line 393
    invoke-virtual {v0, v8}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 394
    .line 395
    .line 396
    goto :goto_6

    .line 397
    :cond_9
    invoke-static {v6}, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->access$300(Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;)J

    .line 398
    .line 399
    .line 400
    move-result-wide v7

    .line 401
    invoke-static {v6, v7, v8}, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->access$802(Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;J)J

    .line 402
    .line 403
    .line 404
    iget-object v0, v1, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput$VideoThread;->this$0:Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;

    .line 405
    .line 406
    invoke-static {v0}, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->access$700(Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;)Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 407
    .line 408
    .line 409
    move-result-object v0

    .line 410
    iget-object v0, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->shouldDrop:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 411
    .line 412
    invoke-virtual {v0, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 413
    .line 414
    .line 415
    goto :goto_6

    .line 416
    :cond_a
    invoke-static {v6}, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->access$700(Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;)Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 417
    .line 418
    .line 419
    move-result-object v0

    .line 420
    iget-object v0, v0, Lcom/momo/mcamera/videoencoder/ProcessSurface;->shouldDrop:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 421
    .line 422
    invoke-virtual {v0, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 423
    .line 424
    .line 425
    :goto_6
    move v0, v2

    .line 426
    :goto_7
    iget-object v6, v1, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput$VideoThread;->this$0:Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;

    .line 427
    .line 428
    invoke-static {v6}, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->access$700(Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;)Lcom/momo/mcamera/videoencoder/ProcessSurface;

    .line 429
    .line 430
    .line 431
    move-result-object v6

    .line 432
    iget-object v6, v6, Lcom/momo/mcamera/videoencoder/ProcessSurface;->isRenderDrawing:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 433
    .line 434
    invoke-virtual {v6}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 435
    .line 436
    .line 437
    move-result v6

    .line 438
    if-eqz v6, :cond_d

    .line 439
    .line 440
    const/16 v6, 0x14

    .line 441
    .line 442
    if-ge v0, v6, :cond_d

    .line 443
    .line 444
    const-wide/16 v6, 0xa

    .line 445
    .line 446
    :try_start_2
    invoke-static {v6, v7}, Ljava/lang/Thread;->sleep(J)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_2

    .line 447
    .line 448
    .line 449
    add-int/lit8 v0, v0, 0x1

    .line 450
    .line 451
    goto :goto_7

    .line 452
    :catch_2
    move-exception v0

    .line 453
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 454
    .line 455
    .line 456
    goto :goto_8

    .line 457
    :cond_b
    cmp-long v0, v6, v10

    .line 458
    .line 459
    if-gez v0, :cond_d

    .line 460
    .line 461
    iget-object v0, v1, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput$VideoThread;->this$0:Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;

    .line 462
    .line 463
    invoke-static {v0, v4}, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->access$202(Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;Landroid/media/MediaCodec$BufferInfo;)Landroid/media/MediaCodec$BufferInfo;

    .line 464
    .line 465
    .line 466
    goto :goto_8

    .line 467
    :cond_c
    iget-object v0, v1, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput$VideoThread;->decoder:Landroid/media/MediaCodec;

    .line 468
    .line 469
    invoke-virtual {v0}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    .line 470
    .line 471
    .line 472
    :cond_d
    :goto_8
    iget v0, v5, Landroid/media/MediaCodec$BufferInfo;->flags:I

    .line 473
    .line 474
    and-int/lit8 v0, v0, 0x4

    .line 475
    .line 476
    if-eqz v0, :cond_e

    .line 477
    .line 478
    goto :goto_9

    .line 479
    :cond_e
    move v0, v9

    .line 480
    goto/16 :goto_4

    .line 481
    .line 482
    :cond_f
    :goto_9
    iget-object v0, v1, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput$VideoThread;->this$0:Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;

    .line 483
    .line 484
    invoke-static {v0, v2}, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->access$1002(Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;I)I

    .line 485
    .line 486
    .line 487
    iget-object v0, v1, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput$VideoThread;->decoder:Landroid/media/MediaCodec;

    .line 488
    .line 489
    invoke-virtual {v0}, Landroid/media/MediaCodec;->stop()V

    .line 490
    .line 491
    .line 492
    iget-object v0, v1, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput$VideoThread;->decoder:Landroid/media/MediaCodec;

    .line 493
    .line 494
    invoke-virtual {v0}, Landroid/media/MediaCodec;->release()V

    .line 495
    .line 496
    .line 497
    iget-object v0, v1, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput$VideoThread;->extractor:Landroid/media/MediaExtractor;

    .line 498
    .line 499
    invoke-virtual {v0}, Landroid/media/MediaExtractor;->release()V

    .line 500
    .line 501
    .line 502
    iget-object v0, v1, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput$VideoThread;->this$0:Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;

    .line 503
    .line 504
    invoke-static {v0}, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->access$000(Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;)Lcom/momo/mcamera/videoprocess/VideoProcessListener;

    .line 505
    .line 506
    .line 507
    move-result-object v0

    .line 508
    if-eqz v0, :cond_10

    .line 509
    .line 510
    iget-object v0, v1, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput$VideoThread;->this$0:Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;

    .line 511
    .line 512
    invoke-static {v0}, Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;->access$000(Lcom/momo/mcamera/videoprocess/VideoResourceProcessInput;)Lcom/momo/mcamera/videoprocess/VideoProcessListener;

    .line 513
    .line 514
    .line 515
    move-result-object v0

    .line 516
    invoke-interface {v0, v4}, Lcom/momo/mcamera/videoprocess/VideoProcessListener;->onProcessFinish(Ljava/lang/String;)V

    .line 517
    .line 518
    .line 519
    :cond_10
    :goto_a
    return-void
.end method
