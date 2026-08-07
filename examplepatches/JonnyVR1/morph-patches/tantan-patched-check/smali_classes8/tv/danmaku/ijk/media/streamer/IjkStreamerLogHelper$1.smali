.class Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;
.super Ltv/danmaku/ijk/media/streamer/LoopLogReporter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field h:J

.field i:J

.field j:J

.field k:J

.field l:J

.field m:J

.field n:J

.field o:J

.field p:J

.field q:Z

.field r:J

.field final synthetic s:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;


# direct methods
.method public constructor <init>(Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->s:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 2
    .line 3
    invoke-direct {p0}, Ltv/danmaku/ijk/media/streamer/LoopLogReporter;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->q:Z

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public c()V
    .locals 82

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object v16

    .line 8
    iget-object v2, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->s:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 9
    .line 10
    iget-object v3, v2, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 11
    .line 12
    if-nez v3, :cond_0

    .line 13
    .line 14
    goto :goto_1

    .line 15
    :cond_0
    invoke-static {v2}, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->a(Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;)Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    const/4 v3, 0x1

    .line 20
    if-eqz v2, :cond_4

    .line 21
    .line 22
    iget-wide v4, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->r:J

    .line 23
    .line 24
    iget-object v2, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->s:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 25
    .line 26
    iget-object v2, v2, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 27
    .line 28
    invoke-virtual {v2}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->getTxbytes()J

    .line 29
    .line 30
    .line 31
    move-result-wide v6

    .line 32
    cmp-long v2, v4, v6

    .line 33
    .line 34
    if-eqz v2, :cond_1

    .line 35
    .line 36
    move v2, v3

    .line 37
    goto :goto_0

    .line 38
    :cond_1
    move v2, v1

    .line 39
    :goto_0
    iget-object v4, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->s:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 40
    .line 41
    iget-object v4, v4, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 42
    .line 43
    invoke-virtual {v4}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->getTxbytes()J

    .line 44
    .line 45
    .line 46
    move-result-wide v4

    .line 47
    iput-wide v4, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->r:J

    .line 48
    .line 49
    if-nez v2, :cond_3

    .line 50
    .line 51
    iget-boolean v2, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->q:Z

    .line 52
    .line 53
    if-eqz v2, :cond_2

    .line 54
    .line 55
    iput-boolean v1, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->q:Z

    .line 56
    .line 57
    goto :goto_2

    .line 58
    :cond_2
    :goto_1
    return-void

    .line 59
    :cond_3
    iput-boolean v3, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->q:Z

    .line 60
    .line 61
    :cond_4
    :goto_2
    iget-object v2, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->s:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 62
    .line 63
    iget-object v2, v2, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 64
    .line 65
    if-eqz v2, :cond_5

    .line 66
    .line 67
    invoke-virtual {v2}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->getAudioFrameCapture()J

    .line 68
    .line 69
    .line 70
    move-result-wide v6

    .line 71
    goto :goto_3

    .line 72
    :cond_5
    const-wide/16 v6, 0x0

    .line 73
    .line 74
    :goto_3
    iget-object v2, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->s:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 75
    .line 76
    iget-object v2, v2, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 77
    .line 78
    if-eqz v2, :cond_6

    .line 79
    .line 80
    invoke-virtual {v2}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->getVideoFrameCapture()J

    .line 81
    .line 82
    .line 83
    move-result-wide v8

    .line 84
    goto :goto_4

    .line 85
    :cond_6
    const-wide/16 v8, 0x0

    .line 86
    .line 87
    :goto_4
    iget-object v2, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->s:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 88
    .line 89
    iget-object v2, v2, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 90
    .line 91
    if-eqz v2, :cond_7

    .line 92
    .line 93
    invoke-virtual {v2}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->getAudioEncoderSizes()J

    .line 94
    .line 95
    .line 96
    move-result-wide v10

    .line 97
    goto :goto_5

    .line 98
    :cond_7
    const-wide/16 v10, 0x0

    .line 99
    .line 100
    :goto_5
    iget-object v2, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->s:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 101
    .line 102
    iget-object v2, v2, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 103
    .line 104
    if-eqz v2, :cond_8

    .line 105
    .line 106
    invoke-virtual {v2}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->getVideoEncoderSize()J

    .line 107
    .line 108
    .line 109
    move-result-wide v12

    .line 110
    goto :goto_6

    .line 111
    :cond_8
    const-wide/16 v12, 0x0

    .line 112
    .line 113
    :goto_6
    iget-object v2, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->s:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 114
    .line 115
    iget-object v2, v2, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 116
    .line 117
    if-eqz v2, :cond_9

    .line 118
    .line 119
    invoke-virtual {v2}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->getVideoEncoderPackets()J

    .line 120
    .line 121
    .line 122
    move-result-wide v14

    .line 123
    goto :goto_7

    .line 124
    :cond_9
    const-wide/16 v14, 0x0

    .line 125
    .line 126
    :goto_7
    iget-object v2, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->s:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 127
    .line 128
    iget-object v2, v2, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 129
    .line 130
    if-eqz v2, :cond_a

    .line 131
    .line 132
    invoke-virtual {v2}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->getRtmpSendSize()J

    .line 133
    .line 134
    .line 135
    move-result-wide v17

    .line 136
    move-wide/from16 v1, v17

    .line 137
    .line 138
    goto :goto_8

    .line 139
    :cond_a
    const-wide/16 v1, 0x0

    .line 140
    .line 141
    :goto_8
    iget-object v3, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->s:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 142
    .line 143
    iget-object v3, v3, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 144
    .line 145
    if-eqz v3, :cond_b

    .line 146
    .line 147
    invoke-virtual {v3}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->getWriteByte()J

    .line 148
    .line 149
    .line 150
    move-result-wide v19

    .line 151
    move-wide/from16 v80, v19

    .line 152
    .line 153
    move-wide/from16 v19, v1

    .line 154
    .line 155
    move-wide/from16 v1, v80

    .line 156
    .line 157
    goto :goto_9

    .line 158
    :cond_b
    move-wide/from16 v19, v1

    .line 159
    .line 160
    const-wide/16 v1, 0x0

    .line 161
    .line 162
    :goto_9
    iget-object v3, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->s:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 163
    .line 164
    iget-object v3, v3, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 165
    .line 166
    if-eqz v3, :cond_c

    .line 167
    .line 168
    invoke-virtual {v3}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->getVideoPts()J

    .line 169
    .line 170
    .line 171
    move-result-wide v21

    .line 172
    move-wide/from16 v23, v21

    .line 173
    .line 174
    :goto_a
    move-wide/from16 v21, v1

    .line 175
    .line 176
    goto :goto_b

    .line 177
    :cond_c
    const-wide/16 v23, 0x0

    .line 178
    .line 179
    goto :goto_a

    .line 180
    :goto_b
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 181
    .line 182
    .line 183
    move-result-wide v1

    .line 184
    const-wide/16 v25, 0x0

    .line 185
    .line 186
    iget-wide v4, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->p:J

    .line 187
    .line 188
    cmp-long v3, v4, v25

    .line 189
    .line 190
    if-nez v3, :cond_d

    .line 191
    .line 192
    iput-wide v1, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->p:J

    .line 193
    .line 194
    :cond_d
    invoke-static {}, Ltv/danmaku/ijk/media/streamer/MediaReportLogManager;->b()Ltv/danmaku/ijk/media/streamer/MediaReportLogManager;

    .line 195
    .line 196
    .line 197
    move-result-object v3

    .line 198
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 199
    .line 200
    .line 201
    move-result-wide v4

    .line 202
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 203
    .line 204
    .line 205
    move-result-object v4

    .line 206
    move-wide/from16 v27, v1

    .line 207
    .line 208
    iget-wide v1, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->h:J

    .line 209
    .line 210
    sub-long v1, v6, v1

    .line 211
    .line 212
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 213
    .line 214
    .line 215
    move-result-object v1

    .line 216
    move-object v5, v1

    .line 217
    iget-wide v1, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->i:J

    .line 218
    .line 219
    sub-long v1, v8, v1

    .line 220
    .line 221
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 222
    .line 223
    .line 224
    move-result-object v1

    .line 225
    iget-object v2, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->s:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 226
    .line 227
    iget-object v2, v2, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 228
    .line 229
    if-eqz v2, :cond_e

    .line 230
    .line 231
    invoke-virtual {v2}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->getAudioFrameCache()J

    .line 232
    .line 233
    .line 234
    move-result-wide v29

    .line 235
    goto :goto_c

    .line 236
    :cond_e
    move-wide/from16 v29, v25

    .line 237
    .line 238
    :goto_c
    invoke-static/range {v29 .. v30}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 239
    .line 240
    .line 241
    move-result-object v2

    .line 242
    move-object/from16 v29, v1

    .line 243
    .line 244
    move-object/from16 v30, v2

    .line 245
    .line 246
    iget-wide v1, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->j:J

    .line 247
    .line 248
    sub-long v1, v10, v1

    .line 249
    .line 250
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 251
    .line 252
    .line 253
    move-result-object v1

    .line 254
    move-object/from16 v31, v1

    .line 255
    .line 256
    iget-wide v1, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->k:J

    .line 257
    .line 258
    sub-long v1, v12, v1

    .line 259
    .line 260
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 261
    .line 262
    .line 263
    move-result-object v1

    .line 264
    move-object/from16 v32, v1

    .line 265
    .line 266
    iget-wide v1, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->l:J

    .line 267
    .line 268
    sub-long v1, v14, v1

    .line 269
    .line 270
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 271
    .line 272
    .line 273
    move-result-object v1

    .line 274
    iget-object v2, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->s:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 275
    .line 276
    iget-object v2, v2, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 277
    .line 278
    if-eqz v2, :cond_f

    .line 279
    .line 280
    invoke-virtual {v2}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->getAudioCacheSize()J

    .line 281
    .line 282
    .line 283
    move-result-wide v33

    .line 284
    goto :goto_d

    .line 285
    :cond_f
    move-wide/from16 v33, v25

    .line 286
    .line 287
    :goto_d
    invoke-static/range {v33 .. v34}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 288
    .line 289
    .line 290
    move-result-object v2

    .line 291
    move-object/from16 v33, v1

    .line 292
    .line 293
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->s:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 294
    .line 295
    iget-object v1, v1, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 296
    .line 297
    if-eqz v1, :cond_10

    .line 298
    .line 299
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->getVideoCacheSize()J

    .line 300
    .line 301
    .line 302
    move-result-wide v34

    .line 303
    goto :goto_e

    .line 304
    :cond_10
    move-wide/from16 v34, v25

    .line 305
    .line 306
    :goto_e
    invoke-static/range {v34 .. v35}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 307
    .line 308
    .line 309
    move-result-object v1

    .line 310
    move-object/from16 v34, v1

    .line 311
    .line 312
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->s:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 313
    .line 314
    iget-object v1, v1, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 315
    .line 316
    if-eqz v1, :cond_11

    .line 317
    .line 318
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->getVideoPacketCache()J

    .line 319
    .line 320
    .line 321
    move-result-wide v35

    .line 322
    goto :goto_f

    .line 323
    :cond_11
    move-wide/from16 v35, v25

    .line 324
    .line 325
    :goto_f
    invoke-static/range {v35 .. v36}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 326
    .line 327
    .line 328
    move-result-object v1

    .line 329
    move-object/from16 v36, v1

    .line 330
    .line 331
    move-object/from16 v35, v2

    .line 332
    .line 333
    iget-wide v1, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->m:J

    .line 334
    .line 335
    sub-long v1, v19, v1

    .line 336
    .line 337
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 338
    .line 339
    .line 340
    move-result-object v1

    .line 341
    move-object/from16 v37, v1

    .line 342
    .line 343
    iget-wide v1, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->n:J

    .line 344
    .line 345
    sub-long v1, v21, v1

    .line 346
    .line 347
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 348
    .line 349
    .line 350
    move-result-object v1

    .line 351
    iget-object v2, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->s:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 352
    .line 353
    iget-object v2, v2, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 354
    .line 355
    if-eqz v2, :cond_12

    .line 356
    .line 357
    invoke-virtual {v2}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->getRenderToCodecSurfaceCost()I

    .line 358
    .line 359
    .line 360
    move-result v2

    .line 361
    goto :goto_10

    .line 362
    :cond_12
    const/4 v2, 0x0

    .line 363
    :goto_10
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 364
    .line 365
    .line 366
    move-result-object v2

    .line 367
    move-object/from16 v38, v1

    .line 368
    .line 369
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->s:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 370
    .line 371
    iget-object v1, v1, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 372
    .line 373
    if-eqz v1, :cond_13

    .line 374
    .line 375
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->getRenderToDisplayCost()I

    .line 376
    .line 377
    .line 378
    move-result v1

    .line 379
    goto :goto_11

    .line 380
    :cond_13
    const/4 v1, 0x0

    .line 381
    :goto_11
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 382
    .line 383
    .line 384
    move-result-object v1

    .line 385
    move-object/from16 v39, v1

    .line 386
    .line 387
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->s:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 388
    .line 389
    invoke-static {v1}, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->b(Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;)Ltv/danmaku/ijk/media/streamer/NetUtil;

    .line 390
    .line 391
    .line 392
    move-result-object v1

    .line 393
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/streamer/NetUtil;->a()J

    .line 394
    .line 395
    .line 396
    move-result-wide v40

    .line 397
    invoke-static/range {v40 .. v41}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 398
    .line 399
    .line 400
    move-result-object v1

    .line 401
    move-object/from16 v40, v1

    .line 402
    .line 403
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->s:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 404
    .line 405
    iget-object v1, v1, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 406
    .line 407
    if-eqz v1, :cond_14

    .line 408
    .line 409
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->getAVDiff()J

    .line 410
    .line 411
    .line 412
    move-result-wide v41

    .line 413
    goto :goto_12

    .line 414
    :cond_14
    move-wide/from16 v41, v25

    .line 415
    .line 416
    :goto_12
    invoke-static/range {v41 .. v42}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 417
    .line 418
    .line 419
    move-result-object v1

    .line 420
    move-object/from16 v42, v1

    .line 421
    .line 422
    move-object/from16 v41, v2

    .line 423
    .line 424
    iget-wide v1, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->o:J

    .line 425
    .line 426
    sub-long v1, v23, v1

    .line 427
    .line 428
    move-wide/from16 v43, v1

    .line 429
    .line 430
    iget-wide v1, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->p:J

    .line 431
    .line 432
    sub-long v1, v27, v1

    .line 433
    .line 434
    sub-long v1, v43, v1

    .line 435
    .line 436
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 437
    .line 438
    .line 439
    move-result-object v1

    .line 440
    iget-object v2, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->s:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 441
    .line 442
    iget-object v2, v2, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 443
    .line 444
    if-eqz v2, :cond_15

    .line 445
    .line 446
    invoke-virtual {v2}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->getPacketCacheDuration()J

    .line 447
    .line 448
    .line 449
    move-result-wide v43

    .line 450
    goto :goto_13

    .line 451
    :cond_15
    move-wide/from16 v43, v25

    .line 452
    .line 453
    :goto_13
    invoke-static/range {v43 .. v44}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 454
    .line 455
    .line 456
    move-result-object v2

    .line 457
    move-object/from16 v43, v1

    .line 458
    .line 459
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->s:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 460
    .line 461
    iget-object v1, v1, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 462
    .line 463
    if-eqz v1, :cond_16

    .line 464
    .line 465
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->getFaceDetectionCount()J

    .line 466
    .line 467
    .line 468
    move-result-wide v44

    .line 469
    goto :goto_14

    .line 470
    :cond_16
    move-wide/from16 v44, v25

    .line 471
    .line 472
    :goto_14
    invoke-static/range {v44 .. v45}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 473
    .line 474
    .line 475
    move-result-object v1

    .line 476
    move-object/from16 v44, v1

    .line 477
    .line 478
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->s:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 479
    .line 480
    iget-object v1, v1, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 481
    .line 482
    if-eqz v1, :cond_17

    .line 483
    .line 484
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->getFaceDetectionDuration()J

    .line 485
    .line 486
    .line 487
    move-result-wide v45

    .line 488
    goto :goto_15

    .line 489
    :cond_17
    move-wide/from16 v45, v25

    .line 490
    .line 491
    :goto_15
    invoke-static/range {v45 .. v46}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 492
    .line 493
    .line 494
    move-result-object v1

    .line 495
    move-object/from16 v45, v1

    .line 496
    .line 497
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->s:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 498
    .line 499
    iget-object v1, v1, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 500
    .line 501
    if-eqz v1, :cond_18

    .line 502
    .line 503
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->getCpuVideoProcessingCount()J

    .line 504
    .line 505
    .line 506
    move-result-wide v46

    .line 507
    goto :goto_16

    .line 508
    :cond_18
    move-wide/from16 v46, v25

    .line 509
    .line 510
    :goto_16
    invoke-static/range {v46 .. v47}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 511
    .line 512
    .line 513
    move-result-object v1

    .line 514
    move-object/from16 v46, v1

    .line 515
    .line 516
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->s:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 517
    .line 518
    iget-object v1, v1, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 519
    .line 520
    if-eqz v1, :cond_19

    .line 521
    .line 522
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->getCpuVideoProcessingDuration()J

    .line 523
    .line 524
    .line 525
    move-result-wide v47

    .line 526
    goto :goto_17

    .line 527
    :cond_19
    move-wide/from16 v47, v25

    .line 528
    .line 529
    :goto_17
    invoke-static/range {v47 .. v48}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 530
    .line 531
    .line 532
    move-result-object v1

    .line 533
    move-object/from16 v47, v1

    .line 534
    .line 535
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->s:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 536
    .line 537
    iget-object v1, v1, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 538
    .line 539
    if-eqz v1, :cond_1a

    .line 540
    .line 541
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->getGpuVideoProcessingCount()J

    .line 542
    .line 543
    .line 544
    move-result-wide v48

    .line 545
    goto :goto_18

    .line 546
    :cond_1a
    move-wide/from16 v48, v25

    .line 547
    .line 548
    :goto_18
    invoke-static/range {v48 .. v49}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 549
    .line 550
    .line 551
    move-result-object v1

    .line 552
    move-object/from16 v48, v1

    .line 553
    .line 554
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->s:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 555
    .line 556
    iget-object v1, v1, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 557
    .line 558
    if-eqz v1, :cond_1b

    .line 559
    .line 560
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->getGpuVideoProcessingDuration()J

    .line 561
    .line 562
    .line 563
    move-result-wide v49

    .line 564
    goto :goto_19

    .line 565
    :cond_1b
    move-wide/from16 v49, v25

    .line 566
    .line 567
    :goto_19
    invoke-static/range {v49 .. v50}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 568
    .line 569
    .line 570
    move-result-object v1

    .line 571
    move-object/from16 v49, v1

    .line 572
    .line 573
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->s:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 574
    .line 575
    iget-object v1, v1, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 576
    .line 577
    if-eqz v1, :cond_1c

    .line 578
    .line 579
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->getAudioBitRate()I

    .line 580
    .line 581
    .line 582
    move-result v1

    .line 583
    goto :goto_1a

    .line 584
    :cond_1c
    const/4 v1, 0x0

    .line 585
    :goto_1a
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 586
    .line 587
    .line 588
    move-result-object v1

    .line 589
    move-object/from16 v50, v1

    .line 590
    .line 591
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->s:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 592
    .line 593
    iget-object v1, v1, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 594
    .line 595
    if-eqz v1, :cond_1d

    .line 596
    .line 597
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->getVideoBitRate()I

    .line 598
    .line 599
    .line 600
    move-result v1

    .line 601
    goto :goto_1b

    .line 602
    :cond_1d
    const/4 v1, 0x0

    .line 603
    :goto_1b
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 604
    .line 605
    .line 606
    move-result-object v1

    .line 607
    move-object/from16 v51, v1

    .line 608
    .line 609
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->s:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 610
    .line 611
    iget-object v1, v1, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 612
    .line 613
    if-eqz v1, :cond_1e

    .line 614
    .line 615
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->getVideoFrameRate()I

    .line 616
    .line 617
    .line 618
    move-result v1

    .line 619
    goto :goto_1c

    .line 620
    :cond_1e
    const/4 v1, 0x0

    .line 621
    :goto_1c
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 622
    .line 623
    .line 624
    move-result-object v1

    .line 625
    move-object/from16 v52, v1

    .line 626
    .line 627
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->s:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 628
    .line 629
    iget-object v1, v1, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 630
    .line 631
    if-eqz v1, :cond_1f

    .line 632
    .line 633
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->getVideoFreezeCount()I

    .line 634
    .line 635
    .line 636
    move-result v1

    .line 637
    goto :goto_1d

    .line 638
    :cond_1f
    const/4 v1, 0x0

    .line 639
    :goto_1d
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 640
    .line 641
    .line 642
    move-result-object v1

    .line 643
    move-object/from16 v53, v1

    .line 644
    .line 645
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->s:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 646
    .line 647
    iget-object v1, v1, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 648
    .line 649
    if-eqz v1, :cond_20

    .line 650
    .line 651
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->getPublisherVideoWidth()I

    .line 652
    .line 653
    .line 654
    move-result v1

    .line 655
    goto :goto_1e

    .line 656
    :cond_20
    const/4 v1, 0x0

    .line 657
    :goto_1e
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 658
    .line 659
    .line 660
    move-result-object v1

    .line 661
    move-object/from16 v54, v1

    .line 662
    .line 663
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->s:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 664
    .line 665
    iget-object v1, v1, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 666
    .line 667
    if-eqz v1, :cond_21

    .line 668
    .line 669
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->getPublisherVideoHigh()I

    .line 670
    .line 671
    .line 672
    move-result v1

    .line 673
    goto :goto_1f

    .line 674
    :cond_21
    const/4 v1, 0x0

    .line 675
    :goto_1f
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 676
    .line 677
    .line 678
    move-result-object v1

    .line 679
    move-object/from16 v55, v1

    .line 680
    .line 681
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->s:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 682
    .line 683
    iget-object v1, v1, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 684
    .line 685
    if-eqz v1, :cond_22

    .line 686
    .line 687
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->getAvFlag()I

    .line 688
    .line 689
    .line 690
    move-result v1

    .line 691
    goto :goto_20

    .line 692
    :cond_22
    const/4 v1, 0x1

    .line 693
    :goto_20
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 694
    .line 695
    .line 696
    move-result-object v1

    .line 697
    move-object/from16 v18, v1

    .line 698
    .line 699
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->s:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 700
    .line 701
    iget-object v1, v1, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 702
    .line 703
    if-eqz v1, :cond_23

    .line 704
    .line 705
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->getRoomType()I

    .line 706
    .line 707
    .line 708
    move-result v1

    .line 709
    goto :goto_21

    .line 710
    :cond_23
    const/4 v1, 0x0

    .line 711
    :goto_21
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 712
    .line 713
    .line 714
    move-result-object v1

    .line 715
    move-object/from16 v17, v1

    .line 716
    .line 717
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->s:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 718
    .line 719
    iget-object v1, v1, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 720
    .line 721
    if-eqz v1, :cond_24

    .line 722
    .line 723
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->getRxbytes()J

    .line 724
    .line 725
    .line 726
    move-result-wide v56

    .line 727
    goto :goto_22

    .line 728
    :cond_24
    move-wide/from16 v56, v25

    .line 729
    .line 730
    :goto_22
    invoke-static/range {v56 .. v57}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 731
    .line 732
    .line 733
    move-result-object v1

    .line 734
    move-object/from16 v56, v1

    .line 735
    .line 736
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->s:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 737
    .line 738
    iget-object v1, v1, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 739
    .line 740
    if-eqz v1, :cond_25

    .line 741
    .line 742
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->getVideoRxbytes()J

    .line 743
    .line 744
    .line 745
    move-result-wide v57

    .line 746
    goto :goto_23

    .line 747
    :cond_25
    move-wide/from16 v57, v25

    .line 748
    .line 749
    :goto_23
    invoke-static/range {v57 .. v58}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 750
    .line 751
    .line 752
    move-result-object v1

    .line 753
    move-object/from16 v57, v1

    .line 754
    .line 755
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->s:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 756
    .line 757
    iget-object v1, v1, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 758
    .line 759
    if-eqz v1, :cond_26

    .line 760
    .line 761
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->getAudioRxbytes()J

    .line 762
    .line 763
    .line 764
    move-result-wide v25

    .line 765
    :cond_26
    invoke-static/range {v25 .. v26}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 766
    .line 767
    .line 768
    move-result-object v1

    .line 769
    move-object/from16 v25, v1

    .line 770
    .line 771
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->s:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 772
    .line 773
    iget-object v1, v1, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 774
    .line 775
    if-eqz v1, :cond_27

    .line 776
    .line 777
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->getAudioVideoStatics()Ljava/lang/String;

    .line 778
    .line 779
    .line 780
    move-result-object v1

    .line 781
    :goto_24
    move-object/from16 v26, v1

    .line 782
    .line 783
    goto :goto_25

    .line 784
    :cond_27
    const-string v1, "[(0)]"

    .line 785
    .line 786
    goto :goto_24

    .line 787
    :goto_25
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->s:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 788
    .line 789
    iget-object v1, v1, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 790
    .line 791
    if-eqz v1, :cond_28

    .line 792
    .line 793
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->getCPUandMemStatistics()Ljava/lang/String;

    .line 794
    .line 795
    .line 796
    move-result-object v1

    .line 797
    :goto_26
    move-wide/from16 v58, v21

    .line 798
    .line 799
    goto :goto_27

    .line 800
    :cond_28
    const-string v1, "0,0"

    .line 801
    .line 802
    goto :goto_26

    .line 803
    :goto_27
    const-string v21, "M"

    .line 804
    .line 805
    move-wide/from16 v60, v8

    .line 806
    .line 807
    move-object/from16 v9, v35

    .line 808
    .line 809
    move-object/from16 v35, v17

    .line 810
    .line 811
    move-object/from16 v17, v40

    .line 812
    .line 813
    move-object/from16 v40, v16

    .line 814
    .line 815
    move-wide/from16 v62, v6

    .line 816
    .line 817
    move-wide/from16 v66, v10

    .line 818
    .line 819
    move-wide/from16 v68, v12

    .line 820
    .line 821
    move-wide/from16 v70, v14

    .line 822
    .line 823
    move-wide/from16 v72, v19

    .line 824
    .line 825
    move-wide/from16 v76, v23

    .line 826
    .line 827
    move-wide/from16 v78, v27

    .line 828
    .line 829
    move-object/from16 v6, v31

    .line 830
    .line 831
    move-object/from16 v7, v32

    .line 832
    .line 833
    move-object/from16 v8, v33

    .line 834
    .line 835
    move-object/from16 v10, v34

    .line 836
    .line 837
    move-object/from16 v11, v36

    .line 838
    .line 839
    move-object/from16 v12, v37

    .line 840
    .line 841
    move-object/from16 v13, v38

    .line 842
    .line 843
    move-object/from16 v15, v39

    .line 844
    .line 845
    move-object/from16 v14, v41

    .line 846
    .line 847
    move-object/from16 v19, v43

    .line 848
    .line 849
    move-object/from16 v22, v44

    .line 850
    .line 851
    move-object/from16 v23, v45

    .line 852
    .line 853
    move-object/from16 v24, v46

    .line 854
    .line 855
    move-object/from16 v27, v49

    .line 856
    .line 857
    move-object/from16 v28, v50

    .line 858
    .line 859
    move-object/from16 v31, v53

    .line 860
    .line 861
    move-object/from16 v32, v54

    .line 862
    .line 863
    move-object/from16 v33, v55

    .line 864
    .line 865
    move-object/from16 v36, v56

    .line 866
    .line 867
    move-object/from16 v37, v57

    .line 868
    .line 869
    move-wide/from16 v74, v58

    .line 870
    .line 871
    move-wide/from16 v64, v60

    .line 872
    .line 873
    move-object/from16 v41, v1

    .line 874
    .line 875
    move-object/from16 v20, v2

    .line 876
    .line 877
    move-object v1, v3

    .line 878
    move-object v2, v4

    .line 879
    move-object v3, v5

    .line 880
    move-object/from16 v34, v18

    .line 881
    .line 882
    move-object/from16 v38, v25

    .line 883
    .line 884
    move-object/from16 v39, v26

    .line 885
    .line 886
    move-object/from16 v4, v29

    .line 887
    .line 888
    move-object/from16 v5, v30

    .line 889
    .line 890
    move-object/from16 v18, v42

    .line 891
    .line 892
    move-object/from16 v25, v47

    .line 893
    .line 894
    move-object/from16 v26, v48

    .line 895
    .line 896
    move-object/from16 v29, v51

    .line 897
    .line 898
    move-object/from16 v30, v52

    .line 899
    .line 900
    filled-new-array/range {v2 .. v41}, [Ljava/lang/Object;

    .line 901
    .line 902
    .line 903
    move-result-object v2

    .line 904
    invoke-virtual {v1, v2}, Ltv/danmaku/ijk/media/streamer/MediaReportLogManager;->d([Ljava/lang/Object;)Ljava/lang/String;

    .line 905
    .line 906
    .line 907
    move-result-object v1

    .line 908
    iget-object v2, v0, Ltv/danmaku/ijk/media/streamer/LoopLogReporter;->e:Ljava/util/ArrayList;

    .line 909
    .line 910
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 911
    .line 912
    .line 913
    move-wide/from16 v4, v62

    .line 914
    .line 915
    iput-wide v4, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->h:J

    .line 916
    .line 917
    move-wide/from16 v4, v64

    .line 918
    .line 919
    iput-wide v4, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->i:J

    .line 920
    .line 921
    move-wide/from16 v4, v66

    .line 922
    .line 923
    iput-wide v4, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->j:J

    .line 924
    .line 925
    move-wide/from16 v4, v68

    .line 926
    .line 927
    iput-wide v4, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->k:J

    .line 928
    .line 929
    move-wide/from16 v4, v70

    .line 930
    .line 931
    iput-wide v4, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->l:J

    .line 932
    .line 933
    move-wide/from16 v4, v72

    .line 934
    .line 935
    iput-wide v4, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->m:J

    .line 936
    .line 937
    move-wide/from16 v4, v74

    .line 938
    .line 939
    iput-wide v4, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->n:J

    .line 940
    .line 941
    move-wide/from16 v4, v76

    .line 942
    .line 943
    iput-wide v4, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->o:J

    .line 944
    .line 945
    move-wide/from16 v1, v78

    .line 946
    .line 947
    iput-wide v1, v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->p:J

    .line 948
    .line 949
    invoke-super {v0}, Ltv/danmaku/ijk/media/streamer/LoopLogReporter;->c()V

    .line 950
    .line 951
    .line 952
    return-void
.end method

.method public d()V
    .locals 9

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/LoopLogReporter;->e:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 13
    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    :goto_0
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/LoopLogReporter;->e:Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/LoopLogReporter;->e:Ljava/util/ArrayList;

    .line 23
    .line 24
    if-ge v1, v2, :cond_1

    .line 25
    .line 26
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    check-cast v2, Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    add-int/lit8 v1, v1, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    .line 39
    .line 40
    .line 41
    invoke-static {}, Ltv/danmaku/ijk/media/streamer/MediaReportLogManager;->b()Ltv/danmaku/ijk/media/streamer/MediaReportLogManager;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->s:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 46
    .line 47
    invoke-static {v1}, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->c(Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v5

    .line 51
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v6

    .line 55
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->s:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 56
    .line 57
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->d(Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;)I

    .line 58
    .line 59
    .line 60
    move-result v7

    .line 61
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->s:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;

    .line 62
    .line 63
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->e()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v8

    .line 67
    const-string v3, "v2.pushWatch"

    .line 68
    .line 69
    const-string v4, ""

    .line 70
    .line 71
    invoke-virtual/range {v2 .. v8}, Ltv/danmaku/ijk/media/streamer/MediaReportLogManager;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public i()V
    .locals 3

    .line 1
    invoke-super {p0}, Ltv/danmaku/ijk/media/streamer/LoopLogReporter;->i()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->h:J

    .line 7
    .line 8
    iput-wide v0, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->i:J

    .line 9
    .line 10
    iput-wide v0, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->j:J

    .line 11
    .line 12
    iput-wide v0, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->k:J

    .line 13
    .line 14
    iput-wide v0, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->l:J

    .line 15
    .line 16
    iput-wide v0, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->m:J

    .line 17
    .line 18
    iput-wide v0, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->n:J

    .line 19
    .line 20
    iput-wide v0, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->o:J

    .line 21
    .line 22
    iput-wide v0, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->p:J

    .line 23
    .line 24
    const/4 v2, 0x1

    .line 25
    iput-boolean v2, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->q:Z

    .line 26
    .line 27
    iput-wide v0, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;->r:J

    .line 28
    .line 29
    return-void
.end method
