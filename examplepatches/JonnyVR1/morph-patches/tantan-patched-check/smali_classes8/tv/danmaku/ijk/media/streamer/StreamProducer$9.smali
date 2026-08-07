.class Ltv/danmaku/ijk/media/streamer/StreamProducer$9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ltv/danmaku/ijk/media/streamer/StreamProducer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ltv/danmaku/ijk/media/streamer/StreamProducer;


# direct methods
.method public constructor <init>(Ltv/danmaku/ijk/media/streamer/StreamProducer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$9;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onMediaDateCallback([BIILtv/danmaku/ijk/media/player/IjkMediaPlayer;)V
    .locals 8

    .line 1
    new-instance p2, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string p3, "Mediaplayer mMediaDateCallback data.len"

    .line 4
    .line 5
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    array-length p3, p1

    .line 9
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 10
    .line 11
    .line 12
    const-string p3, ";recording:"

    .line 13
    .line 14
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    iget-object p3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$9;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 18
    .line 19
    invoke-static {p3}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->m(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Z

    .line 20
    .line 21
    .line 22
    move-result p3

    .line 23
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    const-string p3, "streamerCameraProducer"

    .line 31
    .line 32
    invoke-static {p3, p2}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    array-length p2, p1

    .line 36
    iget-object p4, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$9;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 37
    .line 38
    invoke-static {p4}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->m(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Z

    .line 39
    .line 40
    .line 41
    move-result p4

    .line 42
    if-eqz p4, :cond_6

    .line 43
    .line 44
    iget-object p4, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$9;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 45
    .line 46
    invoke-static {p4}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->i(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Z

    .line 47
    .line 48
    .line 49
    move-result p4

    .line 50
    if-nez p4, :cond_0

    .line 51
    .line 52
    goto/16 :goto_3

    .line 53
    .line 54
    :cond_0
    const/4 p4, 0x0

    .line 55
    move v0, p4

    .line 56
    :goto_0
    :try_start_0
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$9;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 57
    .line 58
    invoke-static {v1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->E(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 59
    .line 60
    .line 61
    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 62
    const-string v2, ";lens:"

    .line 63
    .line 64
    if-lt p2, v1, :cond_5

    .line 65
    .line 66
    :try_start_1
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$9;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 67
    .line 68
    invoke-static {v1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->n(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 69
    .line 70
    .line 71
    move-result v1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 72
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$9;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 73
    .line 74
    const-wide/16 v4, 0x3e8

    .line 75
    .line 76
    if-lez v1, :cond_3

    .line 77
    .line 78
    :try_start_2
    invoke-static {v3}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->E(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    new-array v1, v1, [B

    .line 83
    .line 84
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$9;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 85
    .line 86
    invoke-static {v3}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->p(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Ljava/nio/ByteBuffer;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 91
    .line 92
    .line 93
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$9;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 94
    .line 95
    invoke-static {v3}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->p(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Ljava/nio/ByteBuffer;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    iget-object v6, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$9;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 100
    .line 101
    invoke-static {v6}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->n(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 102
    .line 103
    .line 104
    move-result v6

    .line 105
    invoke-virtual {v3, v1, p4, v6}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 106
    .line 107
    .line 108
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$9;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 109
    .line 110
    invoke-static {v3}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->p(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Ljava/nio/ByteBuffer;

    .line 111
    .line 112
    .line 113
    move-result-object v3

    .line 114
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 115
    .line 116
    .line 117
    new-instance v3, Ljava/lang/StringBuilder;

    .line 118
    .line 119
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 120
    .line 121
    .line 122
    const-string v6, "mRemainAudioIndex > 0 arraycopy :"

    .line 123
    .line 124
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    const-string v6, ";mRemainAudioIndex:"

    .line 131
    .line 132
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    iget-object v6, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$9;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 136
    .line 137
    invoke-static {v6}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->n(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 138
    .line 139
    .line 140
    move-result v6

    .line 141
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v3

    .line 148
    invoke-static {p3, v3}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 149
    .line 150
    .line 151
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$9;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 152
    .line 153
    invoke-static {v3}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->n(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 154
    .line 155
    .line 156
    move-result v3

    .line 157
    iget-object v6, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$9;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 158
    .line 159
    invoke-static {v6}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->E(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 160
    .line 161
    .line 162
    move-result v6

    .line 163
    iget-object v7, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$9;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 164
    .line 165
    invoke-static {v7}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->n(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 166
    .line 167
    .line 168
    move-result v7

    .line 169
    sub-int/2addr v6, v7

    .line 170
    invoke-static {p1, v0, v1, v3, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 171
    .line 172
    .line 173
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$9;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 174
    .line 175
    invoke-static {v3}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->E(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 176
    .line 177
    .line 178
    move-result v3

    .line 179
    iget-object v6, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$9;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 180
    .line 181
    invoke-static {v6}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->n(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 182
    .line 183
    .line 184
    move-result v6

    .line 185
    sub-int/2addr v3, v6

    .line 186
    add-int/2addr v0, v3

    .line 187
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$9;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 188
    .line 189
    invoke-static {v3}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->E(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 190
    .line 191
    .line 192
    move-result v3

    .line 193
    iget-object v6, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$9;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 194
    .line 195
    invoke-static {v6}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->n(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 196
    .line 197
    .line 198
    move-result v6

    .line 199
    sub-int/2addr v3, v6

    .line 200
    sub-int/2addr p2, v3

    .line 201
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$9;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 202
    .line 203
    invoke-static {v3}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->f0(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Lcom/immomo/mediacore/audio/AudioProcess;

    .line 204
    .line 205
    .line 206
    move-result-object v3

    .line 207
    if-nez v3, :cond_1

    .line 208
    .line 209
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$9;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 210
    .line 211
    new-instance v6, Lcom/immomo/mediacore/audio/AudioProcess;

    .line 212
    .line 213
    invoke-direct {v6}, Lcom/immomo/mediacore/audio/AudioProcess;-><init>()V

    .line 214
    .line 215
    .line 216
    invoke-static {v3, v6}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->g0(Ltv/danmaku/ijk/media/streamer/StreamProducer;Lcom/immomo/mediacore/audio/AudioProcess;)Lcom/immomo/mediacore/audio/AudioProcess;

    .line 217
    .line 218
    .line 219
    goto :goto_1

    .line 220
    :catch_0
    move-exception p1

    .line 221
    goto/16 :goto_2

    .line 222
    .line 223
    :cond_1
    :goto_1
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$9;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 224
    .line 225
    invoke-static {v3}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->f0(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Lcom/immomo/mediacore/audio/AudioProcess;

    .line 226
    .line 227
    .line 228
    move-result-object v3

    .line 229
    if-eqz v3, :cond_2

    .line 230
    .line 231
    new-instance v3, Ljava/lang/StringBuilder;

    .line 232
    .line 233
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 234
    .line 235
    .line 236
    const-string v6, "mRemainAudioIndex > 0 putSurroundData :"

    .line 237
    .line 238
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 239
    .line 240
    .line 241
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 242
    .line 243
    .line 244
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 245
    .line 246
    .line 247
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 248
    .line 249
    .line 250
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 251
    .line 252
    .line 253
    move-result-object v2

    .line 254
    invoke-static {p3, v2}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 255
    .line 256
    .line 257
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$9;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 258
    .line 259
    invoke-static {v2}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->f0(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Lcom/immomo/mediacore/audio/AudioProcess;

    .line 260
    .line 261
    .line 262
    move-result-object v2

    .line 263
    new-instance v3, Ll/oxd0;

    .line 264
    .line 265
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 266
    .line 267
    .line 268
    move-result-wide v6

    .line 269
    div-long/2addr v6, v4

    .line 270
    iget-object v4, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$9;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 271
    .line 272
    iget-object v4, v4, Ltv/danmaku/ijk/media/streamer/StreamProducer;->h:Lcom/immomo/mediacore/audio/AudioQuality;

    .line 273
    .line 274
    iget v4, v4, Lcom/immomo/mediacore/audio/AudioQuality;->channelNum:I

    .line 275
    .line 276
    invoke-direct {v3, v1, v6, v7, v4}, Ll/oxd0;-><init>([BJI)V

    .line 277
    .line 278
    .line 279
    invoke-virtual {v2, v3}, Lcom/immomo/mediacore/audio/AudioProcess;->putSurroundData(Ll/oxd0;)V

    .line 280
    .line 281
    .line 282
    :cond_2
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$9;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 283
    .line 284
    invoke-static {v1, p4}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->o(Ltv/danmaku/ijk/media/streamer/StreamProducer;I)I

    .line 285
    .line 286
    .line 287
    goto/16 :goto_0

    .line 288
    .line 289
    :cond_3
    invoke-static {v3}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->E(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 290
    .line 291
    .line 292
    move-result v1

    .line 293
    new-array v1, v1, [B

    .line 294
    .line 295
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$9;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 296
    .line 297
    invoke-static {v3}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->E(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 298
    .line 299
    .line 300
    move-result v3

    .line 301
    invoke-static {p1, v0, v1, p4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 302
    .line 303
    .line 304
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$9;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 305
    .line 306
    invoke-static {v3}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->f0(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Lcom/immomo/mediacore/audio/AudioProcess;

    .line 307
    .line 308
    .line 309
    move-result-object v3

    .line 310
    if-eqz v3, :cond_4

    .line 311
    .line 312
    new-instance v3, Ljava/lang/StringBuilder;

    .line 313
    .line 314
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 315
    .line 316
    .line 317
    const-string v6, "mRemainAudioIndex == 0 putSurroundData pos :"

    .line 318
    .line 319
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 320
    .line 321
    .line 322
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 323
    .line 324
    .line 325
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 326
    .line 327
    .line 328
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 329
    .line 330
    .line 331
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 332
    .line 333
    .line 334
    move-result-object v2

    .line 335
    invoke-static {p3, v2}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 336
    .line 337
    .line 338
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$9;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 339
    .line 340
    invoke-static {v2}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->f0(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Lcom/immomo/mediacore/audio/AudioProcess;

    .line 341
    .line 342
    .line 343
    move-result-object v2

    .line 344
    new-instance v3, Ll/oxd0;

    .line 345
    .line 346
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 347
    .line 348
    .line 349
    move-result-wide v6

    .line 350
    div-long/2addr v6, v4

    .line 351
    iget-object v4, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$9;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 352
    .line 353
    iget-object v4, v4, Ltv/danmaku/ijk/media/streamer/StreamProducer;->h:Lcom/immomo/mediacore/audio/AudioQuality;

    .line 354
    .line 355
    iget v4, v4, Lcom/immomo/mediacore/audio/AudioQuality;->channelNum:I

    .line 356
    .line 357
    invoke-direct {v3, v1, v6, v7, v4}, Ll/oxd0;-><init>([BJI)V

    .line 358
    .line 359
    .line 360
    invoke-virtual {v2, v3}, Lcom/immomo/mediacore/audio/AudioProcess;->putSurroundData(Ll/oxd0;)V

    .line 361
    .line 362
    .line 363
    :cond_4
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$9;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 364
    .line 365
    invoke-static {v1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->E(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 366
    .line 367
    .line 368
    move-result v1

    .line 369
    sub-int/2addr p2, v1

    .line 370
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$9;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 371
    .line 372
    invoke-static {v1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->E(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 373
    .line 374
    .line 375
    move-result v1

    .line 376
    add-int/2addr v0, v1

    .line 377
    goto/16 :goto_0

    .line 378
    .line 379
    :cond_5
    if-lez p2, :cond_6

    .line 380
    .line 381
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$9;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 382
    .line 383
    invoke-static {v1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->p(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Ljava/nio/ByteBuffer;

    .line 384
    .line 385
    .line 386
    move-result-object v1

    .line 387
    invoke-virtual {v1, p1, v0, p2}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 388
    .line 389
    .line 390
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$9;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 391
    .line 392
    invoke-static {p1, p2}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->o(Ltv/danmaku/ijk/media/streamer/StreamProducer;I)I

    .line 393
    .line 394
    .line 395
    new-instance p1, Ljava/lang/StringBuilder;

    .line 396
    .line 397
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 398
    .line 399
    .line 400
    const-string p2, "mRemainAudio.put:pos:"

    .line 401
    .line 402
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 403
    .line 404
    .line 405
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 406
    .line 407
    .line 408
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 409
    .line 410
    .line 411
    iget-object p2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$9;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 412
    .line 413
    invoke-static {p2}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->n(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 414
    .line 415
    .line 416
    move-result p2

    .line 417
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 418
    .line 419
    .line 420
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 421
    .line 422
    .line 423
    move-result-object p1

    .line 424
    invoke-static {p3, p1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 425
    .line 426
    .line 427
    goto :goto_3

    .line 428
    :goto_2
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 429
    .line 430
    .line 431
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$9;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 432
    .line 433
    invoke-static {p1, p4}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->o(Ltv/danmaku/ijk/media/streamer/StreamProducer;I)I

    .line 434
    .line 435
    .line 436
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$9;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 437
    .line 438
    invoke-static {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->p(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Ljava/nio/ByteBuffer;

    .line 439
    .line 440
    .line 441
    move-result-object p0

    .line 442
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 443
    .line 444
    .line 445
    const-string p0, "onMediaDateCallback:exception"

    .line 446
    .line 447
    invoke-static {p3, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 448
    .line 449
    .line 450
    :cond_6
    :goto_3
    return-void
.end method
