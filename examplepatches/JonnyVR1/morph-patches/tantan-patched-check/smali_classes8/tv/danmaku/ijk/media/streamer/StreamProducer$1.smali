.class Ltv/danmaku/ijk/media/streamer/StreamProducer$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/immomo/mediacore/sink/SinkBase$ExtPcmDateCallback;


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
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$1;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onPcmDateCallback([BIJ)V
    .locals 9

    .line 1
    const-string p2, "streamerCameraProducer"

    .line 2
    .line 3
    array-length p3, p1

    .line 4
    iget-object p4, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$1;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    invoke-static {p4, v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->g(Ltv/danmaku/ijk/media/streamer/StreamProducer;Z)Z

    .line 8
    .line 9
    .line 10
    const/4 p4, 0x0

    .line 11
    :try_start_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$1;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 12
    .line 13
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->h(Ltv/danmaku/ijk/media/streamer/StreamProducer;)V

    .line 14
    .line 15
    .line 16
    move v0, p4

    .line 17
    :goto_0
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$1;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 18
    .line 19
    invoke-static {v1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->t(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    add-int/2addr v1, p3

    .line 24
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$1;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 25
    .line 26
    invoke-static {v2}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->E(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 27
    .line 28
    .line 29
    move-result v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 30
    const-string v3, ";lens:"

    .line 31
    .line 32
    if-lt v1, v2, :cond_5

    .line 33
    .line 34
    :try_start_1
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$1;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 35
    .line 36
    invoke-static {v1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->t(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 37
    .line 38
    .line 39
    move-result v1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 40
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$1;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 41
    .line 42
    const-wide/16 v4, 0x3e8

    .line 43
    .line 44
    const/4 v6, 0x2

    .line 45
    if-lez v1, :cond_2

    .line 46
    .line 47
    :try_start_2
    invoke-static {v2}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->E(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    new-array v1, v1, [B

    .line 52
    .line 53
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$1;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 54
    .line 55
    invoke-static {v2}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->S(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Ljava/nio/ByteBuffer;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 60
    .line 61
    .line 62
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$1;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 63
    .line 64
    invoke-static {v2}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->S(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Ljava/nio/ByteBuffer;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    iget-object v7, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$1;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 69
    .line 70
    invoke-static {v7}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->t(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 71
    .line 72
    .line 73
    move-result v7

    .line 74
    invoke-virtual {v2, v1, p4, v7}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 75
    .line 76
    .line 77
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$1;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 78
    .line 79
    invoke-static {v2}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->S(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Ljava/nio/ByteBuffer;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 84
    .line 85
    .line 86
    new-instance v2, Ljava/lang/StringBuilder;

    .line 87
    .line 88
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 89
    .line 90
    .line 91
    const-string v7, "mExtRemainAudioIndex > 0 arraycopy :"

    .line 92
    .line 93
    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    const-string v7, ";mExtRemainAudioIndex:"

    .line 100
    .line 101
    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    iget-object v7, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$1;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 105
    .line 106
    invoke-static {v7}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->t(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 107
    .line 108
    .line 109
    move-result v7

    .line 110
    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v2

    .line 117
    invoke-static {p2, v2}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 118
    .line 119
    .line 120
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$1;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 121
    .line 122
    invoke-static {v2}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->t(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 123
    .line 124
    .line 125
    move-result v2

    .line 126
    iget-object v7, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$1;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 127
    .line 128
    invoke-static {v7}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->E(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 129
    .line 130
    .line 131
    move-result v7

    .line 132
    iget-object v8, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$1;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 133
    .line 134
    invoke-static {v8}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->t(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 135
    .line 136
    .line 137
    move-result v8

    .line 138
    sub-int/2addr v7, v8

    .line 139
    invoke-static {p1, v0, v1, v2, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 140
    .line 141
    .line 142
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$1;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 143
    .line 144
    invoke-static {v2}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->E(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 145
    .line 146
    .line 147
    move-result v2

    .line 148
    iget-object v7, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$1;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 149
    .line 150
    invoke-static {v7}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->t(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 151
    .line 152
    .line 153
    move-result v7

    .line 154
    sub-int/2addr v2, v7

    .line 155
    add-int/2addr v0, v2

    .line 156
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$1;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 157
    .line 158
    invoke-static {v2}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->E(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 159
    .line 160
    .line 161
    move-result v2

    .line 162
    iget-object v7, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$1;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 163
    .line 164
    invoke-static {v7}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->t(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 165
    .line 166
    .line 167
    move-result v7

    .line 168
    sub-int/2addr v2, v7

    .line 169
    sub-int/2addr p3, v2

    .line 170
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$1;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 171
    .line 172
    invoke-static {v2}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->f0(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Lcom/immomo/mediacore/audio/AudioProcess;

    .line 173
    .line 174
    .line 175
    move-result-object v2

    .line 176
    if-eqz v2, :cond_1

    .line 177
    .line 178
    new-instance v2, Ljava/lang/StringBuilder;

    .line 179
    .line 180
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 181
    .line 182
    .line 183
    const-string v7, "mExtRemainAudioIndex > 0 putSurroundData :"

    .line 184
    .line 185
    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 189
    .line 190
    .line 191
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 192
    .line 193
    .line 194
    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 195
    .line 196
    .line 197
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object v2

    .line 201
    invoke-static {p2, v2}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 202
    .line 203
    .line 204
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$1;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 205
    .line 206
    invoke-static {v2}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->h0(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 207
    .line 208
    .line 209
    move-result v2

    .line 210
    if-ne v2, v6, :cond_0

    .line 211
    .line 212
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$1;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 213
    .line 214
    invoke-virtual {v2}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->e2()V

    .line 215
    .line 216
    .line 217
    goto :goto_1

    .line 218
    :catch_0
    move-exception p1

    .line 219
    goto/16 :goto_2

    .line 220
    .line 221
    :cond_0
    :goto_1
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$1;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 222
    .line 223
    invoke-static {v2}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->f0(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Lcom/immomo/mediacore/audio/AudioProcess;

    .line 224
    .line 225
    .line 226
    move-result-object v2

    .line 227
    new-instance v3, Ll/oxd0;

    .line 228
    .line 229
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 230
    .line 231
    .line 232
    move-result-wide v6

    .line 233
    div-long/2addr v6, v4

    .line 234
    iget-object v4, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$1;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 235
    .line 236
    iget-object v4, v4, Ltv/danmaku/ijk/media/streamer/StreamProducer;->h:Lcom/immomo/mediacore/audio/AudioQuality;

    .line 237
    .line 238
    iget v4, v4, Lcom/immomo/mediacore/audio/AudioQuality;->channelNum:I

    .line 239
    .line 240
    invoke-direct {v3, v1, v6, v7, v4}, Ll/oxd0;-><init>([BJI)V

    .line 241
    .line 242
    .line 243
    invoke-virtual {v2, v3}, Lcom/immomo/mediacore/audio/AudioProcess;->putAudioData(Ll/oxd0;)V

    .line 244
    .line 245
    .line 246
    :cond_1
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$1;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 247
    .line 248
    invoke-static {v1, p4}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->u(Ltv/danmaku/ijk/media/streamer/StreamProducer;I)I

    .line 249
    .line 250
    .line 251
    goto/16 :goto_0

    .line 252
    .line 253
    :cond_2
    invoke-static {v2}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->E(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 254
    .line 255
    .line 256
    move-result v1

    .line 257
    new-array v1, v1, [B

    .line 258
    .line 259
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$1;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 260
    .line 261
    invoke-static {v2}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->E(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 262
    .line 263
    .line 264
    move-result v2

    .line 265
    invoke-static {p1, v0, v1, p4, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 266
    .line 267
    .line 268
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$1;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 269
    .line 270
    invoke-static {v2}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->f0(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Lcom/immomo/mediacore/audio/AudioProcess;

    .line 271
    .line 272
    .line 273
    move-result-object v2

    .line 274
    if-eqz v2, :cond_4

    .line 275
    .line 276
    new-instance v2, Ljava/lang/StringBuilder;

    .line 277
    .line 278
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 279
    .line 280
    .line 281
    const-string v7, "mExtRemainAudioIndex == 0 putSurroundData pos :"

    .line 282
    .line 283
    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 284
    .line 285
    .line 286
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 287
    .line 288
    .line 289
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 290
    .line 291
    .line 292
    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 293
    .line 294
    .line 295
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 296
    .line 297
    .line 298
    move-result-object v2

    .line 299
    invoke-static {p2, v2}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 300
    .line 301
    .line 302
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$1;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 303
    .line 304
    invoke-static {v2}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->h0(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 305
    .line 306
    .line 307
    move-result v2

    .line 308
    if-ne v2, v6, :cond_3

    .line 309
    .line 310
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$1;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 311
    .line 312
    invoke-virtual {v2}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->e2()V

    .line 313
    .line 314
    .line 315
    :cond_3
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$1;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 316
    .line 317
    invoke-static {v2}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->f0(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Lcom/immomo/mediacore/audio/AudioProcess;

    .line 318
    .line 319
    .line 320
    move-result-object v2

    .line 321
    new-instance v3, Ll/oxd0;

    .line 322
    .line 323
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 324
    .line 325
    .line 326
    move-result-wide v6

    .line 327
    div-long/2addr v6, v4

    .line 328
    iget-object v4, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$1;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 329
    .line 330
    iget-object v4, v4, Ltv/danmaku/ijk/media/streamer/StreamProducer;->h:Lcom/immomo/mediacore/audio/AudioQuality;

    .line 331
    .line 332
    iget v4, v4, Lcom/immomo/mediacore/audio/AudioQuality;->channelNum:I

    .line 333
    .line 334
    invoke-direct {v3, v1, v6, v7, v4}, Ll/oxd0;-><init>([BJI)V

    .line 335
    .line 336
    .line 337
    invoke-virtual {v2, v3}, Lcom/immomo/mediacore/audio/AudioProcess;->putAudioData(Ll/oxd0;)V

    .line 338
    .line 339
    .line 340
    :cond_4
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$1;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 341
    .line 342
    invoke-static {v1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->E(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 343
    .line 344
    .line 345
    move-result v1

    .line 346
    sub-int/2addr p3, v1

    .line 347
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$1;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 348
    .line 349
    invoke-static {v1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->E(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 350
    .line 351
    .line 352
    move-result v1

    .line 353
    add-int/2addr v0, v1

    .line 354
    goto/16 :goto_0

    .line 355
    .line 356
    :cond_5
    if-lez p3, :cond_6

    .line 357
    .line 358
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$1;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 359
    .line 360
    invoke-static {v1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->S(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Ljava/nio/ByteBuffer;

    .line 361
    .line 362
    .line 363
    move-result-object v1

    .line 364
    invoke-virtual {v1, p1, v0, p3}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 365
    .line 366
    .line 367
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$1;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 368
    .line 369
    invoke-static {p1, p3}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->v(Ltv/danmaku/ijk/media/streamer/StreamProducer;I)I

    .line 370
    .line 371
    .line 372
    new-instance p1, Ljava/lang/StringBuilder;

    .line 373
    .line 374
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 375
    .line 376
    .line 377
    const-string p3, "mExtRemainAudioIndex.put:pos:"

    .line 378
    .line 379
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 380
    .line 381
    .line 382
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 383
    .line 384
    .line 385
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 386
    .line 387
    .line 388
    iget-object p3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$1;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 389
    .line 390
    invoke-static {p3}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->t(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 391
    .line 392
    .line 393
    move-result p3

    .line 394
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 395
    .line 396
    .line 397
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 398
    .line 399
    .line 400
    move-result-object p1

    .line 401
    invoke-static {p2, p1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 402
    .line 403
    .line 404
    :cond_6
    return-void

    .line 405
    :goto_2
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 406
    .line 407
    .line 408
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$1;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 409
    .line 410
    invoke-static {p1, p4}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->u(Ltv/danmaku/ijk/media/streamer/StreamProducer;I)I

    .line 411
    .line 412
    .line 413
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$1;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 414
    .line 415
    invoke-static {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->S(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Ljava/nio/ByteBuffer;

    .line 416
    .line 417
    .line 418
    move-result-object p0

    .line 419
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 420
    .line 421
    .line 422
    const-string p0, "onMediaDateCallback:exception"

    .line 423
    .line 424
    invoke-static {p2, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 425
    .line 426
    .line 427
    return-void
.end method
