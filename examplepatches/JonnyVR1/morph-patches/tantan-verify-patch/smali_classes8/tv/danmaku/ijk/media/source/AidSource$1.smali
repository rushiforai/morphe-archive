.class Ltv/danmaku/ijk/media/source/AidSource$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ltv/danmaku/ijk/media/source/AidSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ltv/danmaku/ijk/media/source/AidSource;


# direct methods
.method public constructor <init>(Ltv/danmaku/ijk/media/source/AidSource;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/source/AidSource$1;->a:Ltv/danmaku/ijk/media/source/AidSource;

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
    .locals 9

    .line 1
    array-length p2, p1

    .line 2
    iget-object p3, p0, Ltv/danmaku/ijk/media/source/AidSource$1;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 3
    .line 4
    invoke-static {p3}, Ltv/danmaku/ijk/media/source/AidSource;->S1(Ltv/danmaku/ijk/media/source/AidSource;)Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 5
    .line 6
    .line 7
    move-result-object p3

    .line 8
    if-eqz p3, :cond_6

    .line 9
    .line 10
    iget-object p3, p0, Ltv/danmaku/ijk/media/source/AidSource$1;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 11
    .line 12
    invoke-static {p3}, Ltv/danmaku/ijk/media/source/AidSource;->S1(Ltv/danmaku/ijk/media/source/AidSource;)Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 13
    .line 14
    .line 15
    move-result-object p3

    .line 16
    invoke-virtual {p3}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->L0()Z

    .line 17
    .line 18
    .line 19
    move-result p3

    .line 20
    if-nez p3, :cond_0

    .line 21
    .line 22
    goto/16 :goto_3

    .line 23
    .line 24
    :cond_0
    new-instance p3, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    const-string p4, "public help data.len"

    .line 27
    .line 28
    invoke-direct {p3, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    array-length p4, p1

    .line 32
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string p4, ";recording:"

    .line 36
    .line 37
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    iget-object p4, p0, Ltv/danmaku/ijk/media/source/AidSource$1;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 41
    .line 42
    invoke-static {p4}, Ltv/danmaku/ijk/media/source/AidSource;->S1(Ltv/danmaku/ijk/media/source/AidSource;)Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 43
    .line 44
    .line 45
    move-result-object p4

    .line 46
    invoke-virtual {p4}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->L0()Z

    .line 47
    .line 48
    .line 49
    move-result p4

    .line 50
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p3

    .line 57
    const-string p4, "aidStream"

    .line 58
    .line 59
    invoke-static {p4, p3}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    .line 61
    .line 62
    const/4 p3, 0x0

    .line 63
    move v0, p3

    .line 64
    :goto_0
    :try_start_0
    iget-object v1, p0, Ltv/danmaku/ijk/media/source/AidSource$1;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 65
    .line 66
    invoke-static {v1}, Ltv/danmaku/ijk/media/source/AidSource;->T1(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 67
    .line 68
    .line 69
    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 70
    const-string v2, ";lens:"

    .line 71
    .line 72
    if-lt p2, v1, :cond_5

    .line 73
    .line 74
    :try_start_1
    iget-object v1, p0, Ltv/danmaku/ijk/media/source/AidSource$1;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 75
    .line 76
    invoke-static {v1}, Ltv/danmaku/ijk/media/source/AidSource;->c2(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 77
    .line 78
    .line 79
    move-result v1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 80
    iget-object v3, p0, Ltv/danmaku/ijk/media/source/AidSource$1;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 81
    .line 82
    const/4 v4, 0x2

    .line 83
    const-wide/16 v5, 0x3e8

    .line 84
    .line 85
    if-lez v1, :cond_3

    .line 86
    .line 87
    :try_start_2
    invoke-static {v3}, Ltv/danmaku/ijk/media/source/AidSource;->T1(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    new-array v1, v1, [B

    .line 92
    .line 93
    iget-object v3, p0, Ltv/danmaku/ijk/media/source/AidSource$1;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 94
    .line 95
    invoke-static {v3}, Ltv/danmaku/ijk/media/source/AidSource;->e2(Ltv/danmaku/ijk/media/source/AidSource;)Ljava/nio/ByteBuffer;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 100
    .line 101
    .line 102
    iget-object v3, p0, Ltv/danmaku/ijk/media/source/AidSource$1;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 103
    .line 104
    invoke-static {v3}, Ltv/danmaku/ijk/media/source/AidSource;->e2(Ltv/danmaku/ijk/media/source/AidSource;)Ljava/nio/ByteBuffer;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    iget-object v7, p0, Ltv/danmaku/ijk/media/source/AidSource$1;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 109
    .line 110
    invoke-static {v7}, Ltv/danmaku/ijk/media/source/AidSource;->c2(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 111
    .line 112
    .line 113
    move-result v7

    .line 114
    invoke-virtual {v3, v1, p3, v7}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 115
    .line 116
    .line 117
    iget-object v3, p0, Ltv/danmaku/ijk/media/source/AidSource$1;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 118
    .line 119
    invoke-static {v3}, Ltv/danmaku/ijk/media/source/AidSource;->e2(Ltv/danmaku/ijk/media/source/AidSource;)Ljava/nio/ByteBuffer;

    .line 120
    .line 121
    .line 122
    move-result-object v3

    .line 123
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 124
    .line 125
    .line 126
    new-instance v3, Ljava/lang/StringBuilder;

    .line 127
    .line 128
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 129
    .line 130
    .line 131
    const-string v7, "mRemainAudioIndex > 0 arraycopy :"

    .line 132
    .line 133
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    const-string v7, ";mRemainAudioIndex:"

    .line 140
    .line 141
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    iget-object v7, p0, Ltv/danmaku/ijk/media/source/AidSource$1;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 145
    .line 146
    invoke-static {v7}, Ltv/danmaku/ijk/media/source/AidSource;->c2(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 147
    .line 148
    .line 149
    move-result v7

    .line 150
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v3

    .line 157
    invoke-static {p4, v3}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 158
    .line 159
    .line 160
    iget-object v3, p0, Ltv/danmaku/ijk/media/source/AidSource$1;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 161
    .line 162
    invoke-static {v3}, Ltv/danmaku/ijk/media/source/AidSource;->c2(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 163
    .line 164
    .line 165
    move-result v3

    .line 166
    iget-object v7, p0, Ltv/danmaku/ijk/media/source/AidSource$1;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 167
    .line 168
    invoke-static {v7}, Ltv/danmaku/ijk/media/source/AidSource;->T1(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 169
    .line 170
    .line 171
    move-result v7

    .line 172
    iget-object v8, p0, Ltv/danmaku/ijk/media/source/AidSource$1;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 173
    .line 174
    invoke-static {v8}, Ltv/danmaku/ijk/media/source/AidSource;->c2(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 175
    .line 176
    .line 177
    move-result v8

    .line 178
    sub-int/2addr v7, v8

    .line 179
    invoke-static {p1, v0, v1, v3, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 180
    .line 181
    .line 182
    iget-object v3, p0, Ltv/danmaku/ijk/media/source/AidSource$1;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 183
    .line 184
    invoke-static {v3}, Ltv/danmaku/ijk/media/source/AidSource;->T1(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 185
    .line 186
    .line 187
    move-result v3

    .line 188
    iget-object v7, p0, Ltv/danmaku/ijk/media/source/AidSource$1;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 189
    .line 190
    invoke-static {v7}, Ltv/danmaku/ijk/media/source/AidSource;->c2(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 191
    .line 192
    .line 193
    move-result v7

    .line 194
    sub-int/2addr v3, v7

    .line 195
    add-int/2addr v0, v3

    .line 196
    iget-object v3, p0, Ltv/danmaku/ijk/media/source/AidSource$1;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 197
    .line 198
    invoke-static {v3}, Ltv/danmaku/ijk/media/source/AidSource;->T1(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 199
    .line 200
    .line 201
    move-result v3

    .line 202
    iget-object v7, p0, Ltv/danmaku/ijk/media/source/AidSource$1;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 203
    .line 204
    invoke-static {v7}, Ltv/danmaku/ijk/media/source/AidSource;->c2(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 205
    .line 206
    .line 207
    move-result v7

    .line 208
    sub-int/2addr v3, v7

    .line 209
    sub-int/2addr p2, v3

    .line 210
    iget-object v3, p0, Ltv/danmaku/ijk/media/source/AidSource$1;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 211
    .line 212
    invoke-static {v3}, Ltv/danmaku/ijk/media/source/AidSource;->f2(Ltv/danmaku/ijk/media/source/AidSource;)Lcom/immomo/mediacore/audio/AudioProcess;

    .line 213
    .line 214
    .line 215
    move-result-object v3

    .line 216
    if-nez v3, :cond_1

    .line 217
    .line 218
    const-string v3, "publichelp: new mHelpMixAudioProcess"

    .line 219
    .line 220
    invoke-static {p4, v3}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 221
    .line 222
    .line 223
    iget-object v3, p0, Ltv/danmaku/ijk/media/source/AidSource$1;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 224
    .line 225
    new-instance v7, Lcom/immomo/mediacore/audio/AudioProcess;

    .line 226
    .line 227
    invoke-direct {v7}, Lcom/immomo/mediacore/audio/AudioProcess;-><init>()V

    .line 228
    .line 229
    .line 230
    invoke-static {v3, v7}, Ltv/danmaku/ijk/media/source/AidSource;->g2(Ltv/danmaku/ijk/media/source/AidSource;Lcom/immomo/mediacore/audio/AudioProcess;)Lcom/immomo/mediacore/audio/AudioProcess;

    .line 231
    .line 232
    .line 233
    goto :goto_1

    .line 234
    :catch_0
    move-exception p1

    .line 235
    goto/16 :goto_2

    .line 236
    .line 237
    :cond_1
    :goto_1
    iget-object v3, p0, Ltv/danmaku/ijk/media/source/AidSource$1;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 238
    .line 239
    invoke-static {v3}, Ltv/danmaku/ijk/media/source/AidSource;->h2(Ltv/danmaku/ijk/media/source/AidSource;)Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 240
    .line 241
    .line 242
    move-result-object v3

    .line 243
    if-eqz v3, :cond_2

    .line 244
    .line 245
    iget-object v3, p0, Ltv/danmaku/ijk/media/source/AidSource$1;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 246
    .line 247
    invoke-static {v3}, Ltv/danmaku/ijk/media/source/AidSource;->f2(Ltv/danmaku/ijk/media/source/AidSource;)Lcom/immomo/mediacore/audio/AudioProcess;

    .line 248
    .line 249
    .line 250
    move-result-object v3

    .line 251
    if-eqz v3, :cond_2

    .line 252
    .line 253
    new-instance v3, Ljava/lang/StringBuilder;

    .line 254
    .line 255
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 256
    .line 257
    .line 258
    const-string v7, "publichelp: mRemainAudioIndex > 0, pos="

    .line 259
    .line 260
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 261
    .line 262
    .line 263
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 264
    .line 265
    .line 266
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 267
    .line 268
    .line 269
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 270
    .line 271
    .line 272
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 273
    .line 274
    .line 275
    move-result-object v2

    .line 276
    invoke-static {p4, v2}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 277
    .line 278
    .line 279
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/AidSource$1;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 280
    .line 281
    invoke-static {v2}, Ltv/danmaku/ijk/media/source/AidSource;->f2(Ltv/danmaku/ijk/media/source/AidSource;)Lcom/immomo/mediacore/audio/AudioProcess;

    .line 282
    .line 283
    .line 284
    move-result-object v2

    .line 285
    new-instance v3, Ll/oxd0;

    .line 286
    .line 287
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 288
    .line 289
    .line 290
    move-result-wide v7

    .line 291
    div-long/2addr v7, v5

    .line 292
    invoke-direct {v3, v1, v7, v8, v4}, Ll/oxd0;-><init>([BJI)V

    .line 293
    .line 294
    .line 295
    invoke-virtual {v2, v3}, Lcom/immomo/mediacore/audio/AudioProcess;->putSurroundData(Ll/oxd0;)V

    .line 296
    .line 297
    .line 298
    :cond_2
    iget-object v1, p0, Ltv/danmaku/ijk/media/source/AidSource$1;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 299
    .line 300
    invoke-static {v1, p3}, Ltv/danmaku/ijk/media/source/AidSource;->d2(Ltv/danmaku/ijk/media/source/AidSource;I)I

    .line 301
    .line 302
    .line 303
    goto/16 :goto_0

    .line 304
    .line 305
    :cond_3
    invoke-static {v3}, Ltv/danmaku/ijk/media/source/AidSource;->T1(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 306
    .line 307
    .line 308
    move-result v1

    .line 309
    new-array v1, v1, [B

    .line 310
    .line 311
    iget-object v3, p0, Ltv/danmaku/ijk/media/source/AidSource$1;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 312
    .line 313
    invoke-static {v3}, Ltv/danmaku/ijk/media/source/AidSource;->T1(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 314
    .line 315
    .line 316
    move-result v3

    .line 317
    invoke-static {p1, v0, v1, p3, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 318
    .line 319
    .line 320
    iget-object v3, p0, Ltv/danmaku/ijk/media/source/AidSource$1;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 321
    .line 322
    invoke-static {v3}, Ltv/danmaku/ijk/media/source/AidSource;->h2(Ltv/danmaku/ijk/media/source/AidSource;)Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 323
    .line 324
    .line 325
    move-result-object v3

    .line 326
    if-eqz v3, :cond_4

    .line 327
    .line 328
    iget-object v3, p0, Ltv/danmaku/ijk/media/source/AidSource$1;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 329
    .line 330
    invoke-static {v3}, Ltv/danmaku/ijk/media/source/AidSource;->f2(Ltv/danmaku/ijk/media/source/AidSource;)Lcom/immomo/mediacore/audio/AudioProcess;

    .line 331
    .line 332
    .line 333
    move-result-object v3

    .line 334
    if-eqz v3, :cond_4

    .line 335
    .line 336
    new-instance v3, Ljava/lang/StringBuilder;

    .line 337
    .line 338
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 339
    .line 340
    .line 341
    const-string v7, "mRemainAudioIndex=0, pos="

    .line 342
    .line 343
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 344
    .line 345
    .line 346
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 347
    .line 348
    .line 349
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 350
    .line 351
    .line 352
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 353
    .line 354
    .line 355
    const-string v2, ",mAudiobufferSize="

    .line 356
    .line 357
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 358
    .line 359
    .line 360
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/AidSource$1;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 361
    .line 362
    invoke-static {v2}, Ltv/danmaku/ijk/media/source/AidSource;->T1(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 363
    .line 364
    .line 365
    move-result v2

    .line 366
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 367
    .line 368
    .line 369
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 370
    .line 371
    .line 372
    move-result-object v2

    .line 373
    invoke-static {p4, v2}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 374
    .line 375
    .line 376
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/AidSource$1;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 377
    .line 378
    invoke-static {v2}, Ltv/danmaku/ijk/media/source/AidSource;->f2(Ltv/danmaku/ijk/media/source/AidSource;)Lcom/immomo/mediacore/audio/AudioProcess;

    .line 379
    .line 380
    .line 381
    move-result-object v2

    .line 382
    new-instance v3, Ll/oxd0;

    .line 383
    .line 384
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 385
    .line 386
    .line 387
    move-result-wide v7

    .line 388
    div-long/2addr v7, v5

    .line 389
    invoke-direct {v3, v1, v7, v8, v4}, Ll/oxd0;-><init>([BJI)V

    .line 390
    .line 391
    .line 392
    invoke-virtual {v2, v3}, Lcom/immomo/mediacore/audio/AudioProcess;->putSurroundData(Ll/oxd0;)V

    .line 393
    .line 394
    .line 395
    :cond_4
    iget-object v1, p0, Ltv/danmaku/ijk/media/source/AidSource$1;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 396
    .line 397
    invoke-static {v1}, Ltv/danmaku/ijk/media/source/AidSource;->T1(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 398
    .line 399
    .line 400
    move-result v1

    .line 401
    sub-int/2addr p2, v1

    .line 402
    iget-object v1, p0, Ltv/danmaku/ijk/media/source/AidSource$1;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 403
    .line 404
    invoke-static {v1}, Ltv/danmaku/ijk/media/source/AidSource;->T1(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 405
    .line 406
    .line 407
    move-result v1

    .line 408
    add-int/2addr v0, v1

    .line 409
    goto/16 :goto_0

    .line 410
    .line 411
    :cond_5
    if-lez p2, :cond_6

    .line 412
    .line 413
    iget-object v1, p0, Ltv/danmaku/ijk/media/source/AidSource$1;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 414
    .line 415
    invoke-static {v1}, Ltv/danmaku/ijk/media/source/AidSource;->e2(Ltv/danmaku/ijk/media/source/AidSource;)Ljava/nio/ByteBuffer;

    .line 416
    .line 417
    .line 418
    move-result-object v1

    .line 419
    invoke-virtual {v1, p1, v0, p2}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 420
    .line 421
    .line 422
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/AidSource$1;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 423
    .line 424
    invoke-static {p1, p2}, Ltv/danmaku/ijk/media/source/AidSource;->d2(Ltv/danmaku/ijk/media/source/AidSource;I)I

    .line 425
    .line 426
    .line 427
    new-instance p1, Ljava/lang/StringBuilder;

    .line 428
    .line 429
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 430
    .line 431
    .line 432
    const-string p2, "mRemainAudioPublishHelp.put:pos:"

    .line 433
    .line 434
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 435
    .line 436
    .line 437
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 438
    .line 439
    .line 440
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 441
    .line 442
    .line 443
    iget-object p2, p0, Ltv/danmaku/ijk/media/source/AidSource$1;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 444
    .line 445
    invoke-static {p2}, Ltv/danmaku/ijk/media/source/AidSource;->c2(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 446
    .line 447
    .line 448
    move-result p2

    .line 449
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 450
    .line 451
    .line 452
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 453
    .line 454
    .line 455
    move-result-object p1

    .line 456
    invoke-static {p4, p1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 457
    .line 458
    .line 459
    goto :goto_3

    .line 460
    :goto_2
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 461
    .line 462
    .line 463
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/AidSource$1;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 464
    .line 465
    invoke-static {p1, p3}, Ltv/danmaku/ijk/media/source/AidSource;->d2(Ltv/danmaku/ijk/media/source/AidSource;I)I

    .line 466
    .line 467
    .line 468
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/AidSource$1;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 469
    .line 470
    invoke-static {p0}, Ltv/danmaku/ijk/media/source/AidSource;->e2(Ltv/danmaku/ijk/media/source/AidSource;)Ljava/nio/ByteBuffer;

    .line 471
    .line 472
    .line 473
    move-result-object p0

    .line 474
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 475
    .line 476
    .line 477
    const-string p0, "onMediaDateCallback:exception"

    .line 478
    .line 479
    invoke-static {p4, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 480
    .line 481
    .line 482
    :cond_6
    :goto_3
    return-void
.end method
