.class Ll/xmp0$j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/ss/bytertc/engine/IAudioFrameObserver;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/xmp0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/xmp0;


# direct methods
.method public constructor <init>(Ll/xmp0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xmp0$j;->a:Ll/xmp0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onCaptureMixedAudioFrame(Lcom/ss/bytertc/engine/utils/IAudioFrame;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onMixedAudioFrame(Lcom/ss/bytertc/engine/utils/IAudioFrame;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onPlaybackAudioFrame(Lcom/ss/bytertc/engine/utils/IAudioFrame;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/xmp0$j;->a:Ll/xmp0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/xmp0;->s3(Ll/xmp0;)Ll/dc1;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Ll/xmp0$j;->a:Ll/xmp0;

    .line 10
    .line 11
    invoke-static {v0}, Ll/xmp0;->p3(Ll/xmp0;)Ll/dpl$a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_2

    .line 16
    .line 17
    invoke-interface {p1}, Lcom/ss/bytertc/engine/utils/IAudioFrame;->data_size()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    new-array v1, v0, [B

    .line 22
    .line 23
    invoke-interface {p1}, Lcom/ss/bytertc/engine/utils/IAudioFrame;->getDataBuffer()Ljava/nio/ByteBuffer;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    const/4 v3, 0x0

    .line 28
    invoke-virtual {v2, v1, v3, v0}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 29
    .line 30
    .line 31
    iget-object v2, p0, Ll/xmp0$j;->a:Ll/xmp0;

    .line 32
    .line 33
    invoke-static {v2}, Ll/xmp0;->x4(Ll/xmp0;)I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    iget-object v3, p0, Ll/xmp0$j;->a:Ll/xmp0;

    .line 38
    .line 39
    const/4 v4, 0x2

    .line 40
    if-ne v2, v4, :cond_1

    .line 41
    .line 42
    invoke-static {v3}, Ll/xmp0;->K3(Ll/xmp0;)Ll/ror;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    iget v2, v2, Ll/tow;->R:I

    .line 47
    .line 48
    const/4 v3, 0x1

    .line 49
    if-eq v2, v3, :cond_0

    .line 50
    .line 51
    invoke-interface {p1}, Lcom/ss/bytertc/engine/utils/IAudioFrame;->channel()Lcom/ss/bytertc/engine/data/AudioChannel;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/AudioChannel;->value()I

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    if-ne p1, v3, :cond_0

    .line 60
    .line 61
    invoke-static {v1, v0}, Ll/jc00;->o2([BI)[B

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    :cond_0
    iget-object p0, p0, Ll/xmp0$j;->a:Ll/xmp0;

    .line 66
    .line 67
    invoke-static {p0}, Ll/xmp0;->p3(Ll/xmp0;)Ll/dpl$a;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    new-instance p1, Ll/oxd0;

    .line 72
    .line 73
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 74
    .line 75
    .line 76
    move-result-wide v2

    .line 77
    invoke-direct {p1, v1, v2, v3, v4}, Ll/oxd0;-><init>([BJI)V

    .line 78
    .line 79
    .line 80
    invoke-interface {p0, p1}, Ll/dpl$a;->C(Ll/oxd0;)Ll/oxd0;

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_1
    invoke-static {v3}, Ll/xmp0;->s3(Ll/xmp0;)Ll/dc1;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    if-eqz v0, :cond_2

    .line 89
    .line 90
    iget-object p0, p0, Ll/xmp0$j;->a:Ll/xmp0;

    .line 91
    .line 92
    invoke-static {p0}, Ll/xmp0;->s3(Ll/xmp0;)Ll/dc1;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    new-instance v0, Ll/oxd0;

    .line 97
    .line 98
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 99
    .line 100
    .line 101
    move-result-wide v2

    .line 102
    invoke-interface {p1}, Lcom/ss/bytertc/engine/utils/IAudioFrame;->channel()Lcom/ss/bytertc/engine/data/AudioChannel;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/AudioChannel;->value()I

    .line 107
    .line 108
    .line 109
    move-result p1

    .line 110
    invoke-direct {v0, v1, v2, v3, p1}, Ll/oxd0;-><init>([BJI)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p0, v0}, Ll/dc1;->i(Ll/oxd0;)V

    .line 114
    .line 115
    .line 116
    :cond_2
    return-void
.end method

.method public onRecordAudioFrame(Lcom/ss/bytertc/engine/utils/IAudioFrame;)V
    .locals 10

    .line 1
    invoke-interface {p1}, Lcom/ss/bytertc/engine/utils/IAudioFrame;->channel()Lcom/ss/bytertc/engine/data/AudioChannel;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/data/AudioChannel;->value()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object v1, p0, Ll/xmp0$j;->a:Ll/xmp0;

    .line 10
    .line 11
    invoke-static {v1}, Ll/xmp0;->f3(Ll/xmp0;)I

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Ll/xmp0$j;->a:Ll/xmp0;

    .line 15
    .line 16
    invoke-static {v1}, Ll/xmp0;->g3(Ll/xmp0;)I

    .line 17
    .line 18
    .line 19
    invoke-interface {p1}, Lcom/ss/bytertc/engine/utils/IAudioFrame;->data_size()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    new-array v5, v1, [B

    .line 24
    .line 25
    iget-object v2, p0, Ll/xmp0$j;->a:Ll/xmp0;

    .line 26
    .line 27
    invoke-static {v2}, Ll/xmp0;->h3(Ll/xmp0;)Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    const/4 v8, 0x0

    .line 32
    if-eqz v2, :cond_0

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    invoke-interface {p1}, Lcom/ss/bytertc/engine/utils/IAudioFrame;->getDataBuffer()Ljava/nio/ByteBuffer;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {v2, v5, v8, v1}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 40
    .line 41
    .line 42
    :goto_0
    iget-object v2, p0, Ll/xmp0$j;->a:Ll/xmp0;

    .line 43
    .line 44
    invoke-static {v2}, Ll/xmp0;->i3(Ll/xmp0;)Lcom/immomo/mediacore/audio/pcmDataAvailableCallback;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    const/4 v9, 0x1

    .line 49
    if-eqz v2, :cond_2

    .line 50
    .line 51
    iget-object v2, p0, Ll/xmp0$j;->a:Ll/xmp0;

    .line 52
    .line 53
    invoke-static {v2}, Ll/xmp0;->i3(Ll/xmp0;)Lcom/immomo/mediacore/audio/pcmDataAvailableCallback;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    iget-object v3, p0, Ll/xmp0$j;->a:Ll/xmp0;

    .line 58
    .line 59
    invoke-static {v3}, Ll/xmp0;->K3(Ll/xmp0;)Ll/ror;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    iget v3, v3, Ll/uow;->B0:I

    .line 64
    .line 65
    int-to-long v3, v3

    .line 66
    if-ne v0, v9, :cond_1

    .line 67
    .line 68
    move v7, v8

    .line 69
    goto :goto_1

    .line 70
    :cond_1
    move v7, v9

    .line 71
    :goto_1
    const v6, 0xac44

    .line 72
    .line 73
    .line 74
    invoke-interface/range {v2 .. v7}, Lcom/immomo/mediacore/audio/pcmDataAvailableCallback;->onPcmDateCallback(J[BIZ)V

    .line 75
    .line 76
    .line 77
    :cond_2
    iget-object v2, p0, Ll/xmp0$j;->a:Ll/xmp0;

    .line 78
    .line 79
    invoke-static {v2}, Ll/xmp0;->u3(Ll/xmp0;)Ll/l6m;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    const/4 v3, 0x0

    .line 84
    if-eqz v2, :cond_3

    .line 85
    .line 86
    iget-object v2, p0, Ll/xmp0$j;->a:Ll/xmp0;

    .line 87
    .line 88
    invoke-static {v2}, Ll/xmp0;->v3(Ll/xmp0;)Ll/l6m;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    check-cast v2, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 93
    .line 94
    iget-object v4, p0, Ll/xmp0$j;->a:Ll/xmp0;

    .line 95
    .line 96
    invoke-static {v4}, Ll/xmp0;->k3(Ll/xmp0;)F

    .line 97
    .line 98
    .line 99
    move-result v4

    .line 100
    invoke-virtual {v2, v4}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->W1(F)V

    .line 101
    .line 102
    .line 103
    iget-object v2, p0, Ll/xmp0$j;->a:Ll/xmp0;

    .line 104
    .line 105
    invoke-static {v2}, Ll/xmp0;->w3(Ll/xmp0;)Ll/l6m;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    check-cast v2, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 110
    .line 111
    iget-object v4, p0, Ll/xmp0$j;->a:Ll/xmp0;

    .line 112
    .line 113
    invoke-static {v4}, Ll/xmp0;->K3(Ll/xmp0;)Ll/ror;

    .line 114
    .line 115
    .line 116
    move-result-object v4

    .line 117
    iget v4, v4, Ll/tow;->P:I

    .line 118
    .line 119
    const-string v6, "Volc"

    .line 120
    .line 121
    const/16 v7, 0x800

    .line 122
    .line 123
    invoke-virtual {v2, v7, v4, v0, v6}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->I2(IIILjava/lang/String;)V

    .line 124
    .line 125
    .line 126
    iget-object v2, p0, Ll/xmp0$j;->a:Ll/xmp0;

    .line 127
    .line 128
    invoke-static {v2}, Ll/xmp0;->x3(Ll/xmp0;)Ll/l6m;

    .line 129
    .line 130
    .line 131
    move-result-object v2

    .line 132
    check-cast v2, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 133
    .line 134
    new-instance v4, Ll/oxd0;

    .line 135
    .line 136
    iget-object v6, p0, Ll/xmp0$j;->a:Ll/xmp0;

    .line 137
    .line 138
    iget v6, v6, Ll/xmp0;->S0:I

    .line 139
    .line 140
    int-to-long v6, v6

    .line 141
    invoke-direct {v4, v5, v6, v7, v0}, Ll/oxd0;-><init>([BJI)V

    .line 142
    .line 143
    .line 144
    invoke-virtual {v2, v4}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->C(Ll/oxd0;)Ll/oxd0;

    .line 145
    .line 146
    .line 147
    move-result-object v2

    .line 148
    if-eqz v2, :cond_4

    .line 149
    .line 150
    iget-object v4, v2, Ll/oxd0;->b:Ljava/nio/ByteBuffer;

    .line 151
    .line 152
    if-eqz v4, :cond_4

    .line 153
    .line 154
    invoke-virtual {v4, v5, v8, v1}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 155
    .line 156
    .line 157
    invoke-interface {p1}, Lcom/ss/bytertc/engine/utils/IAudioFrame;->getDataBuffer()Ljava/nio/ByteBuffer;

    .line 158
    .line 159
    .line 160
    move-result-object v4

    .line 161
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 162
    .line 163
    .line 164
    invoke-interface {p1}, Lcom/ss/bytertc/engine/utils/IAudioFrame;->getDataBuffer()Ljava/nio/ByteBuffer;

    .line 165
    .line 166
    .line 167
    move-result-object v4

    .line 168
    invoke-virtual {v4, v5}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 169
    .line 170
    .line 171
    invoke-interface {p1}, Lcom/ss/bytertc/engine/utils/IAudioFrame;->getDataBuffer()Ljava/nio/ByteBuffer;

    .line 172
    .line 173
    .line 174
    move-result-object p1

    .line 175
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 176
    .line 177
    .line 178
    goto :goto_2

    .line 179
    :cond_3
    move-object v2, v3

    .line 180
    :cond_4
    :goto_2
    iget-object p1, p0, Ll/xmp0$j;->a:Ll/xmp0;

    .line 181
    .line 182
    invoke-static {p1}, Ll/xmp0;->p3(Ll/xmp0;)Ll/dpl$a;

    .line 183
    .line 184
    .line 185
    move-result-object p1

    .line 186
    if-eqz p1, :cond_c

    .line 187
    .line 188
    iget-object p1, p0, Ll/xmp0$j;->a:Ll/xmp0;

    .line 189
    .line 190
    invoke-static {p1}, Ll/xmp0;->q3(Ll/xmp0;)Z

    .line 191
    .line 192
    .line 193
    move-result p1

    .line 194
    if-eqz p1, :cond_c

    .line 195
    .line 196
    iget-object p1, p0, Ll/xmp0$j;->a:Ll/xmp0;

    .line 197
    .line 198
    invoke-static {p1}, Ll/xmp0;->y3(Ll/xmp0;)Ll/l6m;

    .line 199
    .line 200
    .line 201
    move-result-object p1

    .line 202
    if-eqz p1, :cond_8

    .line 203
    .line 204
    iget-object p1, p0, Ll/xmp0$j;->a:Ll/xmp0;

    .line 205
    .line 206
    invoke-static {p1}, Ll/xmp0;->s3(Ll/xmp0;)Ll/dc1;

    .line 207
    .line 208
    .line 209
    move-result-object p1

    .line 210
    if-eqz p1, :cond_6

    .line 211
    .line 212
    iget-object p1, p0, Ll/xmp0$j;->a:Ll/xmp0;

    .line 213
    .line 214
    invoke-static {p1}, Ll/xmp0;->s3(Ll/xmp0;)Ll/dc1;

    .line 215
    .line 216
    .line 217
    move-result-object p1

    .line 218
    const/high16 v3, 0x3f800000    # 1.0f

    .line 219
    .line 220
    invoke-virtual {p1, v3}, Ll/dc1;->j(F)V

    .line 221
    .line 222
    .line 223
    iget-object p1, p0, Ll/xmp0$j;->a:Ll/xmp0;

    .line 224
    .line 225
    invoke-static {p1}, Ll/xmp0;->K3(Ll/xmp0;)Ll/ror;

    .line 226
    .line 227
    .line 228
    move-result-object p1

    .line 229
    iget-boolean p1, p1, Ll/uow;->X0:Z

    .line 230
    .line 231
    if-eqz p1, :cond_5

    .line 232
    .line 233
    iget-object p1, p0, Ll/xmp0$j;->a:Ll/xmp0;

    .line 234
    .line 235
    invoke-static {p1}, Ll/xmp0;->s3(Ll/xmp0;)Ll/dc1;

    .line 236
    .line 237
    .line 238
    move-result-object p1

    .line 239
    invoke-virtual {p1, v3}, Ll/dc1;->k(F)V

    .line 240
    .line 241
    .line 242
    :cond_5
    iget-object p1, p0, Ll/xmp0$j;->a:Ll/xmp0;

    .line 243
    .line 244
    invoke-static {p1}, Ll/xmp0;->s3(Ll/xmp0;)Ll/dc1;

    .line 245
    .line 246
    .line 247
    move-result-object p1

    .line 248
    invoke-virtual {p1}, Ll/dc1;->g()Ll/oxd0;

    .line 249
    .line 250
    .line 251
    move-result-object v3

    .line 252
    :cond_6
    if-eqz v3, :cond_8

    .line 253
    .line 254
    iget-object p1, p0, Ll/xmp0$j;->a:Ll/xmp0;

    .line 255
    .line 256
    if-eqz v2, :cond_7

    .line 257
    .line 258
    invoke-static {p1}, Ll/xmp0;->s3(Ll/xmp0;)Ll/dc1;

    .line 259
    .line 260
    .line 261
    move-result-object p1

    .line 262
    invoke-virtual {v2}, Ll/oxd0;->c()[B

    .line 263
    .line 264
    .line 265
    move-result-object v2

    .line 266
    invoke-virtual {v3}, Ll/oxd0;->c()[B

    .line 267
    .line 268
    .line 269
    move-result-object v4

    .line 270
    invoke-virtual {v3}, Ll/oxd0;->e()I

    .line 271
    .line 272
    .line 273
    move-result v6

    .line 274
    invoke-virtual {p1, v2, v4, v6}, Ll/dc1;->h([B[BI)Ljava/nio/ByteBuffer;

    .line 275
    .line 276
    .line 277
    move-result-object p1

    .line 278
    goto :goto_3

    .line 279
    :cond_7
    invoke-static {p1}, Ll/xmp0;->s3(Ll/xmp0;)Ll/dc1;

    .line 280
    .line 281
    .line 282
    move-result-object p1

    .line 283
    invoke-virtual {v3}, Ll/oxd0;->c()[B

    .line 284
    .line 285
    .line 286
    move-result-object v2

    .line 287
    invoke-virtual {v3}, Ll/oxd0;->e()I

    .line 288
    .line 289
    .line 290
    move-result v4

    .line 291
    invoke-virtual {p1, v5, v2, v4}, Ll/dc1;->h([B[BI)Ljava/nio/ByteBuffer;

    .line 292
    .line 293
    .line 294
    move-result-object p1

    .line 295
    :goto_3
    if-eqz p1, :cond_8

    .line 296
    .line 297
    new-instance v2, Ll/oxd0;

    .line 298
    .line 299
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    .line 300
    .line 301
    .line 302
    move-result-object p1

    .line 303
    invoke-virtual {v3}, Ll/oxd0;->d()J

    .line 304
    .line 305
    .line 306
    move-result-wide v3

    .line 307
    invoke-direct {v2, p1, v3, v4, v0}, Ll/oxd0;-><init>([BJI)V

    .line 308
    .line 309
    .line 310
    move-object v3, v2

    .line 311
    :cond_8
    const-string p1, "=====replace======:Agora send pcm to IJK "

    .line 312
    .line 313
    const-string v2, "Pipeline_Normal_pip->PIPLINE->VOLC"

    .line 314
    .line 315
    const/4 v4, 0x2

    .line 316
    if-eqz v3, :cond_a

    .line 317
    .line 318
    if-ne v0, v9, :cond_9

    .line 319
    .line 320
    invoke-virtual {v3}, Ll/oxd0;->c()[B

    .line 321
    .line 322
    .line 323
    move-result-object v0

    .line 324
    invoke-virtual {v3}, Ll/oxd0;->e()I

    .line 325
    .line 326
    .line 327
    move-result v1

    .line 328
    invoke-static {v0, v1}, Ll/jc00;->o2([BI)[B

    .line 329
    .line 330
    .line 331
    move-result-object v0

    .line 332
    goto :goto_4

    .line 333
    :cond_9
    invoke-virtual {v3}, Ll/oxd0;->c()[B

    .line 334
    .line 335
    .line 336
    move-result-object v0

    .line 337
    :goto_4
    new-instance v1, Ll/oxd0;

    .line 338
    .line 339
    iget-object v3, p0, Ll/xmp0$j;->a:Ll/xmp0;

    .line 340
    .line 341
    iget v3, v3, Ll/xmp0;->S0:I

    .line 342
    .line 343
    int-to-long v5, v3

    .line 344
    invoke-direct {v1, v0, v5, v6, v4}, Ll/oxd0;-><init>([BJI)V

    .line 345
    .line 346
    .line 347
    invoke-virtual {v1, v8}, Ll/oxd0;->g(Z)V

    .line 348
    .line 349
    .line 350
    iget-object v0, p0, Ll/xmp0$j;->a:Ll/xmp0;

    .line 351
    .line 352
    invoke-static {v0}, Ll/xmp0;->p3(Ll/xmp0;)Ll/dpl$a;

    .line 353
    .line 354
    .line 355
    move-result-object v0

    .line 356
    if-eqz v0, :cond_c

    .line 357
    .line 358
    iget-object v0, p0, Ll/xmp0$j;->a:Ll/xmp0;

    .line 359
    .line 360
    invoke-static {v0}, Ll/xmp0;->p3(Ll/xmp0;)Ll/dpl$a;

    .line 361
    .line 362
    .line 363
    move-result-object v0

    .line 364
    invoke-interface {v0, v1}, Ll/dpl$a;->C(Ll/oxd0;)Ll/oxd0;

    .line 365
    .line 366
    .line 367
    iget-object p0, p0, Ll/xmp0$j;->a:Ll/xmp0;

    .line 368
    .line 369
    invoke-static {p0}, Ll/xmp0;->t3(Ll/xmp0;)I

    .line 370
    .line 371
    .line 372
    move-result p0

    .line 373
    rem-int/lit8 p0, p0, 0x32

    .line 374
    .line 375
    if-nez p0, :cond_c

    .line 376
    .line 377
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 378
    .line 379
    .line 380
    move-result-object p0

    .line 381
    invoke-virtual {p0, v2, p1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 382
    .line 383
    .line 384
    return-void

    .line 385
    :cond_a
    iget-object v3, p0, Ll/xmp0$j;->a:Ll/xmp0;

    .line 386
    .line 387
    invoke-static {v3}, Ll/xmp0;->x4(Ll/xmp0;)I

    .line 388
    .line 389
    .line 390
    move-result v3

    .line 391
    if-eq v3, v4, :cond_c

    .line 392
    .line 393
    if-ne v0, v9, :cond_b

    .line 394
    .line 395
    invoke-static {v5, v1}, Ll/jc00;->o2([BI)[B

    .line 396
    .line 397
    .line 398
    move-result-object v5

    .line 399
    :cond_b
    new-instance v0, Ll/oxd0;

    .line 400
    .line 401
    iget-object v1, p0, Ll/xmp0$j;->a:Ll/xmp0;

    .line 402
    .line 403
    iget v1, v1, Ll/xmp0;->S0:I

    .line 404
    .line 405
    int-to-long v6, v1

    .line 406
    invoke-direct {v0, v5, v6, v7, v4}, Ll/oxd0;-><init>([BJI)V

    .line 407
    .line 408
    .line 409
    invoke-virtual {v0, v8}, Ll/oxd0;->g(Z)V

    .line 410
    .line 411
    .line 412
    iget-object v1, p0, Ll/xmp0$j;->a:Ll/xmp0;

    .line 413
    .line 414
    invoke-static {v1}, Ll/xmp0;->p3(Ll/xmp0;)Ll/dpl$a;

    .line 415
    .line 416
    .line 417
    move-result-object v1

    .line 418
    if-eqz v1, :cond_c

    .line 419
    .line 420
    iget-object v1, p0, Ll/xmp0$j;->a:Ll/xmp0;

    .line 421
    .line 422
    invoke-static {v1}, Ll/xmp0;->p3(Ll/xmp0;)Ll/dpl$a;

    .line 423
    .line 424
    .line 425
    move-result-object v1

    .line 426
    invoke-interface {v1, v0}, Ll/dpl$a;->C(Ll/oxd0;)Ll/oxd0;

    .line 427
    .line 428
    .line 429
    iget-object p0, p0, Ll/xmp0$j;->a:Ll/xmp0;

    .line 430
    .line 431
    invoke-static {p0}, Ll/xmp0;->t3(Ll/xmp0;)I

    .line 432
    .line 433
    .line 434
    move-result p0

    .line 435
    rem-int/lit8 p0, p0, 0x32

    .line 436
    .line 437
    if-nez p0, :cond_c

    .line 438
    .line 439
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 440
    .line 441
    .line 442
    move-result-object p0

    .line 443
    invoke-virtual {p0, v2, p1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 444
    .line 445
    .line 446
    :cond_c
    return-void
.end method

.method public onRemoteUserAudioFrame(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Lcom/ss/bytertc/engine/utils/IAudioFrame;)V
    .locals 0

    .line 1
    return-void
.end method
