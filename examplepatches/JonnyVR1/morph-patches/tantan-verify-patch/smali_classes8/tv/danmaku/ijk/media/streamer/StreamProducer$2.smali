.class Ltv/danmaku/ijk/media/streamer/StreamProducer$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/immomo/mediacore/sink/SinkBase$PcmDateCallback;


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
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$2;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onPcmDateCallback(J[BIZ)V
    .locals 7

    .line 1
    const-string p1, "streamerCameraProducer"

    .line 2
    .line 3
    array-length p2, p3

    .line 4
    const/4 p4, 0x0

    .line 5
    move p5, p4

    .line 6
    :goto_0
    :try_start_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$2;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 7
    .line 8
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->i0(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    add-int/2addr v0, p2

    .line 13
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$2;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 14
    .line 15
    invoke-static {v1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->E(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 16
    .line 17
    .line 18
    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    const-string v2, ";lens:"

    .line 20
    .line 21
    if-lt v0, v1, :cond_3

    .line 22
    .line 23
    :try_start_1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$2;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 24
    .line 25
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->i0(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 26
    .line 27
    .line 28
    move-result v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 29
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$2;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 30
    .line 31
    const-wide/16 v3, 0x3e8

    .line 32
    .line 33
    if-lez v0, :cond_1

    .line 34
    .line 35
    :try_start_2
    invoke-static {v1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->E(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    new-array v0, v0, [B

    .line 40
    .line 41
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$2;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 42
    .line 43
    invoke-static {v1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->l0(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Ljava/nio/ByteBuffer;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 48
    .line 49
    .line 50
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$2;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 51
    .line 52
    invoke-static {v1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->l0(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Ljava/nio/ByteBuffer;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    iget-object v5, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$2;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 57
    .line 58
    invoke-static {v5}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->i0(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 59
    .line 60
    .line 61
    move-result v5

    .line 62
    invoke-virtual {v1, v0, p4, v5}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 63
    .line 64
    .line 65
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$2;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 66
    .line 67
    invoke-static {v1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->l0(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Ljava/nio/ByteBuffer;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 72
    .line 73
    .line 74
    new-instance v1, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 77
    .line 78
    .line 79
    const-string v5, "mAttachMergeRemainAudioIndex > 0 arraycopy :"

    .line 80
    .line 81
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v1, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    const-string v5, ";mAttachMergeRemainAudioIndex:"

    .line 88
    .line 89
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    iget-object v5, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$2;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 93
    .line 94
    invoke-static {v5}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->i0(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 95
    .line 96
    .line 97
    move-result v5

    .line 98
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    invoke-static {p1, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 106
    .line 107
    .line 108
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$2;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 109
    .line 110
    invoke-static {v1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->i0(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 111
    .line 112
    .line 113
    move-result v1

    .line 114
    iget-object v5, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$2;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 115
    .line 116
    invoke-static {v5}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->E(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 117
    .line 118
    .line 119
    move-result v5

    .line 120
    iget-object v6, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$2;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 121
    .line 122
    invoke-static {v6}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->i0(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 123
    .line 124
    .line 125
    move-result v6

    .line 126
    sub-int/2addr v5, v6

    .line 127
    invoke-static {p3, p5, v0, v1, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 128
    .line 129
    .line 130
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$2;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 131
    .line 132
    invoke-static {v1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->E(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 133
    .line 134
    .line 135
    move-result v1

    .line 136
    iget-object v5, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$2;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 137
    .line 138
    invoke-static {v5}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->i0(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 139
    .line 140
    .line 141
    move-result v5

    .line 142
    sub-int/2addr v1, v5

    .line 143
    add-int/2addr p5, v1

    .line 144
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$2;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 145
    .line 146
    invoke-static {v1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->E(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 147
    .line 148
    .line 149
    move-result v1

    .line 150
    iget-object v5, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$2;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 151
    .line 152
    invoke-static {v5}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->i0(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 153
    .line 154
    .line 155
    move-result v5

    .line 156
    sub-int/2addr v1, v5

    .line 157
    sub-int/2addr p2, v1

    .line 158
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$2;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 159
    .line 160
    invoke-static {v1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->f0(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Lcom/immomo/mediacore/audio/AudioProcess;

    .line 161
    .line 162
    .line 163
    move-result-object v1

    .line 164
    if-eqz v1, :cond_0

    .line 165
    .line 166
    new-instance v1, Ljava/lang/StringBuilder;

    .line 167
    .line 168
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 169
    .line 170
    .line 171
    const-string v5, "mAttachMergeRemainAudioIndex > 0 putSurroundData :"

    .line 172
    .line 173
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    invoke-virtual {v1, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 180
    .line 181
    .line 182
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 183
    .line 184
    .line 185
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object v1

    .line 189
    invoke-static {p1, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 190
    .line 191
    .line 192
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$2;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 193
    .line 194
    invoke-static {v1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->f0(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Lcom/immomo/mediacore/audio/AudioProcess;

    .line 195
    .line 196
    .line 197
    move-result-object v1

    .line 198
    new-instance v2, Ll/oxd0;

    .line 199
    .line 200
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 201
    .line 202
    .line 203
    move-result-wide v5

    .line 204
    div-long/2addr v5, v3

    .line 205
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$2;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 206
    .line 207
    iget-object v3, v3, Ltv/danmaku/ijk/media/streamer/StreamProducer;->h:Lcom/immomo/mediacore/audio/AudioQuality;

    .line 208
    .line 209
    iget v3, v3, Lcom/immomo/mediacore/audio/AudioQuality;->channelNum:I

    .line 210
    .line 211
    invoke-direct {v2, v0, v5, v6, v3}, Ll/oxd0;-><init>([BJI)V

    .line 212
    .line 213
    .line 214
    invoke-virtual {v1, v2}, Lcom/immomo/mediacore/audio/AudioProcess;->putAudioData(Ll/oxd0;)V

    .line 215
    .line 216
    .line 217
    goto :goto_1

    .line 218
    :catch_0
    move-exception p2

    .line 219
    goto/16 :goto_2

    .line 220
    .line 221
    :cond_0
    :goto_1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$2;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 222
    .line 223
    invoke-static {v0, p4}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->j0(Ltv/danmaku/ijk/media/streamer/StreamProducer;I)I

    .line 224
    .line 225
    .line 226
    goto/16 :goto_0

    .line 227
    .line 228
    :cond_1
    invoke-static {v1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->E(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 229
    .line 230
    .line 231
    move-result v0

    .line 232
    new-array v0, v0, [B

    .line 233
    .line 234
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$2;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 235
    .line 236
    invoke-static {v1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->E(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 237
    .line 238
    .line 239
    move-result v1

    .line 240
    invoke-static {p3, p5, v0, p4, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 241
    .line 242
    .line 243
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$2;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 244
    .line 245
    invoke-static {v1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->f0(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Lcom/immomo/mediacore/audio/AudioProcess;

    .line 246
    .line 247
    .line 248
    move-result-object v1

    .line 249
    if-eqz v1, :cond_2

    .line 250
    .line 251
    new-instance v1, Ljava/lang/StringBuilder;

    .line 252
    .line 253
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 254
    .line 255
    .line 256
    const-string v5, "mAttachMergeRemainAudioIndex == 0 putSurroundData pos :"

    .line 257
    .line 258
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 259
    .line 260
    .line 261
    invoke-virtual {v1, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 262
    .line 263
    .line 264
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 265
    .line 266
    .line 267
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 268
    .line 269
    .line 270
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 271
    .line 272
    .line 273
    move-result-object v1

    .line 274
    invoke-static {p1, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 275
    .line 276
    .line 277
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$2;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 278
    .line 279
    invoke-static {v1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->f0(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Lcom/immomo/mediacore/audio/AudioProcess;

    .line 280
    .line 281
    .line 282
    move-result-object v1

    .line 283
    new-instance v2, Ll/oxd0;

    .line 284
    .line 285
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 286
    .line 287
    .line 288
    move-result-wide v5

    .line 289
    div-long/2addr v5, v3

    .line 290
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$2;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 291
    .line 292
    iget-object v3, v3, Ltv/danmaku/ijk/media/streamer/StreamProducer;->h:Lcom/immomo/mediacore/audio/AudioQuality;

    .line 293
    .line 294
    iget v3, v3, Lcom/immomo/mediacore/audio/AudioQuality;->channelNum:I

    .line 295
    .line 296
    invoke-direct {v2, v0, v5, v6, v3}, Ll/oxd0;-><init>([BJI)V

    .line 297
    .line 298
    .line 299
    invoke-virtual {v1, v2}, Lcom/immomo/mediacore/audio/AudioProcess;->putAudioData(Ll/oxd0;)V

    .line 300
    .line 301
    .line 302
    :cond_2
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$2;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 303
    .line 304
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->E(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 305
    .line 306
    .line 307
    move-result v0

    .line 308
    sub-int/2addr p2, v0

    .line 309
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$2;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 310
    .line 311
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->E(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 312
    .line 313
    .line 314
    move-result v0

    .line 315
    add-int/2addr p5, v0

    .line 316
    goto/16 :goto_0

    .line 317
    .line 318
    :cond_3
    if-lez p2, :cond_4

    .line 319
    .line 320
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$2;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 321
    .line 322
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->l0(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Ljava/nio/ByteBuffer;

    .line 323
    .line 324
    .line 325
    move-result-object v0

    .line 326
    invoke-virtual {v0, p3, p5, p2}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 327
    .line 328
    .line 329
    iget-object p3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$2;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 330
    .line 331
    invoke-static {p3, p2}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->k0(Ltv/danmaku/ijk/media/streamer/StreamProducer;I)I

    .line 332
    .line 333
    .line 334
    new-instance p2, Ljava/lang/StringBuilder;

    .line 335
    .line 336
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 337
    .line 338
    .line 339
    const-string p3, "mAttachMergeRemainAudio.put:pos:"

    .line 340
    .line 341
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 342
    .line 343
    .line 344
    invoke-virtual {p2, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 345
    .line 346
    .line 347
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 348
    .line 349
    .line 350
    iget-object p3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$2;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 351
    .line 352
    invoke-static {p3}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->i0(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I

    .line 353
    .line 354
    .line 355
    move-result p3

    .line 356
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 357
    .line 358
    .line 359
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 360
    .line 361
    .line 362
    move-result-object p2

    .line 363
    invoke-static {p1, p2}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 364
    .line 365
    .line 366
    :cond_4
    return-void

    .line 367
    :goto_2
    invoke-virtual {p2}, Ljava/lang/Throwable;->printStackTrace()V

    .line 368
    .line 369
    .line 370
    iget-object p2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$2;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 371
    .line 372
    invoke-static {p2, p4}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->j0(Ltv/danmaku/ijk/media/streamer/StreamProducer;I)I

    .line 373
    .line 374
    .line 375
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer$2;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 376
    .line 377
    invoke-static {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->l0(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Ljava/nio/ByteBuffer;

    .line 378
    .line 379
    .line 380
    move-result-object p0

    .line 381
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 382
    .line 383
    .line 384
    const-string p0, "onMediaDateCallback:exception"

    .line 385
    .line 386
    invoke-static {p1, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 387
    .line 388
    .line 389
    return-void
.end method
