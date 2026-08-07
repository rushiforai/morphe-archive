.class public Lcom/immomo/moment/mediautils/g$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/moment/mediautils/g;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation


# instance fields
.field final synthetic a:Lcom/immomo/moment/mediautils/g;


# direct methods
.method public constructor <init>(Lcom/immomo/moment/mediautils/g;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/g$c;->a:Lcom/immomo/moment/mediautils/g;

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
    iget-object v0, p0, Lcom/immomo/moment/mediautils/g$c;->a:Lcom/immomo/moment/mediautils/g;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/immomo/moment/mediautils/m;->y:Lcom/immomo/moment/mediautils/m$e;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    iget-object v0, v0, Lcom/immomo/moment/mediautils/m;->B:Landroid/media/MediaFormat;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-interface {v1, v0}, Lcom/immomo/moment/mediautils/m$e;->d(Landroid/media/MediaFormat;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    const/4 v0, 0x0

    .line 15
    :goto_0
    move v1, v0

    .line 16
    :cond_1
    :goto_1
    iget-object v2, p0, Lcom/immomo/moment/mediautils/g$c;->a:Lcom/immomo/moment/mediautils/g;

    .line 17
    .line 18
    invoke-static {v2}, Lcom/immomo/moment/mediautils/g;->D(Lcom/immomo/moment/mediautils/g;)Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-nez v2, :cond_8

    .line 23
    .line 24
    iget-object v2, p0, Lcom/immomo/moment/mediautils/g$c;->a:Lcom/immomo/moment/mediautils/g;

    .line 25
    .line 26
    iget-object v3, v2, Lcom/immomo/moment/mediautils/m;->y:Lcom/immomo/moment/mediautils/m$e;

    .line 27
    .line 28
    const/4 v4, 0x0

    .line 29
    const/4 v5, 0x1

    .line 30
    if-eqz v3, :cond_4

    .line 31
    .line 32
    invoke-static {v2}, Lcom/immomo/moment/mediautils/g;->E(Lcom/immomo/moment/mediautils/g;)Z

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-nez v2, :cond_4

    .line 37
    .line 38
    iget-object v2, p0, Lcom/immomo/moment/mediautils/g$c;->a:Lcom/immomo/moment/mediautils/g;

    .line 39
    .line 40
    invoke-static {v2}, Lcom/immomo/moment/mediautils/g;->U(Lcom/immomo/moment/mediautils/g;)Ljava/util/LinkedList;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {v2}, Ljava/util/LinkedList;->size()I

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    const/4 v3, 0x3

    .line 49
    if-ge v2, v3, :cond_4

    .line 50
    .line 51
    iget-object v2, p0, Lcom/immomo/moment/mediautils/g$c;->a:Lcom/immomo/moment/mediautils/g;

    .line 52
    .line 53
    invoke-static {v2}, Lcom/immomo/moment/mediautils/g;->V(Lcom/immomo/moment/mediautils/g;)Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    invoke-virtual {v2}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->getVideoFrameCnt()I

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    if-lez v2, :cond_4

    .line 62
    .line 63
    iget-object v2, p0, Lcom/immomo/moment/mediautils/g$c;->a:Lcom/immomo/moment/mediautils/g;

    .line 64
    .line 65
    invoke-static {v2}, Lcom/immomo/moment/mediautils/g;->V(Lcom/immomo/moment/mediautils/g;)Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-virtual {v2}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->getVideoFrame()Ll/ad60;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    if-nez v2, :cond_2

    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_2
    invoke-virtual {v2}, Ll/ad60;->b()Landroid/media/MediaCodec$BufferInfo;

    .line 77
    .line 78
    .line 79
    move-result-object v3

    .line 80
    iget-object v6, p0, Lcom/immomo/moment/mediautils/g$c;->a:Lcom/immomo/moment/mediautils/g;

    .line 81
    .line 82
    invoke-static {v6}, Lcom/immomo/moment/mediautils/g;->W(Lcom/immomo/moment/mediautils/g;)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v6

    .line 86
    monitor-enter v6

    .line 87
    :try_start_0
    iget-object v7, p0, Lcom/immomo/moment/mediautils/g$c;->a:Lcom/immomo/moment/mediautils/g;

    .line 88
    .line 89
    invoke-static {v7}, Lcom/immomo/moment/mediautils/g;->U(Lcom/immomo/moment/mediautils/g;)Ljava/util/LinkedList;

    .line 90
    .line 91
    .line 92
    move-result-object v7

    .line 93
    invoke-virtual {v2}, Ll/ad60;->a()Ljava/nio/ByteBuffer;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    invoke-virtual {v7, v2}, Ljava/util/LinkedList;->offer(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 101
    iget-object v2, p0, Lcom/immomo/moment/mediautils/g$c;->a:Lcom/immomo/moment/mediautils/g;

    .line 102
    .line 103
    iget-wide v6, v3, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 104
    .line 105
    invoke-static {v2, v6, v7}, Lcom/immomo/moment/mediautils/g;->Q(Lcom/immomo/moment/mediautils/g;J)J

    .line 106
    .line 107
    .line 108
    iget-object v2, p0, Lcom/immomo/moment/mediautils/g$c;->a:Lcom/immomo/moment/mediautils/g;

    .line 109
    .line 110
    iget-wide v6, v3, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 111
    .line 112
    invoke-static {v2, v6, v7}, Lcom/immomo/moment/mediautils/g;->X(Lcom/immomo/moment/mediautils/g;J)Z

    .line 113
    .line 114
    .line 115
    move-result v2

    .line 116
    if-nez v2, :cond_3

    .line 117
    .line 118
    iget-wide v2, v3, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 119
    .line 120
    iget-object v6, p0, Lcom/immomo/moment/mediautils/g$c;->a:Lcom/immomo/moment/mediautils/g;

    .line 121
    .line 122
    iget-wide v7, v6, Lcom/immomo/moment/mediautils/m;->q:J

    .line 123
    .line 124
    cmp-long v2, v2, v7

    .line 125
    .line 126
    if-lez v2, :cond_1

    .line 127
    .line 128
    iget-object v2, v6, Lcom/immomo/moment/mediautils/m;->y:Lcom/immomo/moment/mediautils/m$e;

    .line 129
    .line 130
    if-eqz v2, :cond_1

    .line 131
    .line 132
    invoke-static {v6}, Lcom/immomo/moment/mediautils/g;->F(Lcom/immomo/moment/mediautils/g;)Z

    .line 133
    .line 134
    .line 135
    move-result v2

    .line 136
    if-nez v2, :cond_1

    .line 137
    .line 138
    iget-object v2, p0, Lcom/immomo/moment/mediautils/g$c;->a:Lcom/immomo/moment/mediautils/g;

    .line 139
    .line 140
    invoke-static {v2}, Lcom/immomo/moment/mediautils/g;->H(Lcom/immomo/moment/mediautils/g;)I

    .line 141
    .line 142
    .line 143
    move-result v2

    .line 144
    and-int/lit8 v2, v2, 0x10

    .line 145
    .line 146
    if-eqz v2, :cond_1

    .line 147
    .line 148
    const-string v2, "FFDecoderWrapper"

    .line 149
    .line 150
    const-string v3, "Video decoder finished!"

    .line 151
    .line 152
    invoke-static {v2, v3}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    iget-object v2, p0, Lcom/immomo/moment/mediautils/g$c;->a:Lcom/immomo/moment/mediautils/g;

    .line 156
    .line 157
    iget-object v2, v2, Lcom/immomo/moment/mediautils/m;->y:Lcom/immomo/moment/mediautils/m$e;

    .line 158
    .line 159
    invoke-interface {v2}, Lcom/immomo/moment/mediautils/m$e;->c()V

    .line 160
    .line 161
    .line 162
    iget-object v2, p0, Lcom/immomo/moment/mediautils/g$c;->a:Lcom/immomo/moment/mediautils/g;

    .line 163
    .line 164
    iget-object v2, v2, Lcom/immomo/moment/mediautils/m;->y:Lcom/immomo/moment/mediautils/m$e;

    .line 165
    .line 166
    invoke-interface {v2}, Lcom/immomo/moment/mediautils/m$e;->a()V

    .line 167
    .line 168
    .line 169
    iget-object v2, p0, Lcom/immomo/moment/mediautils/g$c;->a:Lcom/immomo/moment/mediautils/g;

    .line 170
    .line 171
    invoke-static {v2, v5}, Lcom/immomo/moment/mediautils/g;->G(Lcom/immomo/moment/mediautils/g;Z)Z

    .line 172
    .line 173
    .line 174
    iget-object v2, p0, Lcom/immomo/moment/mediautils/g$c;->a:Lcom/immomo/moment/mediautils/g;

    .line 175
    .line 176
    iget-object v2, v2, Lcom/immomo/moment/mediautils/m;->y:Lcom/immomo/moment/mediautils/m$e;

    .line 177
    .line 178
    if-eqz v2, :cond_1

    .line 179
    .line 180
    invoke-interface {v2, v4}, Lcom/immomo/moment/mediautils/m$e;->e(Landroid/media/MediaCodec$BufferInfo;)V

    .line 181
    .line 182
    .line 183
    goto/16 :goto_1

    .line 184
    .line 185
    :cond_3
    iget-object v2, p0, Lcom/immomo/moment/mediautils/g$c;->a:Lcom/immomo/moment/mediautils/g;

    .line 186
    .line 187
    iget-object v2, v2, Lcom/immomo/moment/mediautils/m;->y:Lcom/immomo/moment/mediautils/m$e;

    .line 188
    .line 189
    invoke-interface {v2, v3}, Lcom/immomo/moment/mediautils/m$e;->e(Landroid/media/MediaCodec$BufferInfo;)V

    .line 190
    .line 191
    .line 192
    goto :goto_2

    .line 193
    :catchall_0
    move-exception p0

    .line 194
    :try_start_1
    monitor-exit v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 195
    throw p0

    .line 196
    :cond_4
    move v1, v5

    .line 197
    :goto_2
    iget-object v2, p0, Lcom/immomo/moment/mediautils/g$c;->a:Lcom/immomo/moment/mediautils/g;

    .line 198
    .line 199
    invoke-static {v2}, Lcom/immomo/moment/mediautils/g;->E(Lcom/immomo/moment/mediautils/g;)Z

    .line 200
    .line 201
    .line 202
    move-result v2

    .line 203
    if-eqz v2, :cond_5

    .line 204
    .line 205
    iget-object v2, p0, Lcom/immomo/moment/mediautils/g$c;->a:Lcom/immomo/moment/mediautils/g;

    .line 206
    .line 207
    invoke-static {v2}, Lcom/immomo/moment/mediautils/g;->I(Lcom/immomo/moment/mediautils/g;)Ljava/lang/Object;

    .line 208
    .line 209
    .line 210
    move-result-object v2

    .line 211
    monitor-enter v2

    .line 212
    :try_start_2
    iget-object v3, p0, Lcom/immomo/moment/mediautils/g$c;->a:Lcom/immomo/moment/mediautils/g;

    .line 213
    .line 214
    invoke-static {v3, v5}, Lcom/immomo/moment/mediautils/g;->J(Lcom/immomo/moment/mediautils/g;Z)Z

    .line 215
    .line 216
    .line 217
    iget-object v3, p0, Lcom/immomo/moment/mediautils/g$c;->a:Lcom/immomo/moment/mediautils/g;

    .line 218
    .line 219
    invoke-static {v3}, Lcom/immomo/moment/mediautils/g;->I(Lcom/immomo/moment/mediautils/g;)Ljava/lang/Object;

    .line 220
    .line 221
    .line 222
    move-result-object v3

    .line 223
    invoke-virtual {v3}, Ljava/lang/Object;->notifyAll()V

    .line 224
    .line 225
    .line 226
    monitor-exit v2

    .line 227
    goto :goto_3

    .line 228
    :catchall_1
    move-exception p0

    .line 229
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 230
    throw p0

    .line 231
    :cond_5
    :goto_3
    iget-object v2, p0, Lcom/immomo/moment/mediautils/g$c;->a:Lcom/immomo/moment/mediautils/g;

    .line 232
    .line 233
    invoke-static {v2}, Lcom/immomo/moment/mediautils/g;->F(Lcom/immomo/moment/mediautils/g;)Z

    .line 234
    .line 235
    .line 236
    move-result v2

    .line 237
    if-nez v2, :cond_7

    .line 238
    .line 239
    iget-object v2, p0, Lcom/immomo/moment/mediautils/g$c;->a:Lcom/immomo/moment/mediautils/g;

    .line 240
    .line 241
    invoke-static {v2}, Lcom/immomo/moment/mediautils/g;->V(Lcom/immomo/moment/mediautils/g;)Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 242
    .line 243
    .line 244
    move-result-object v2

    .line 245
    invoke-virtual {v2}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->getStatus()I

    .line 246
    .line 247
    .line 248
    move-result v2

    .line 249
    if-eqz v2, :cond_7

    .line 250
    .line 251
    iget-object v2, p0, Lcom/immomo/moment/mediautils/g$c;->a:Lcom/immomo/moment/mediautils/g;

    .line 252
    .line 253
    iget-object v3, v2, Lcom/immomo/moment/mediautils/m;->y:Lcom/immomo/moment/mediautils/m$e;

    .line 254
    .line 255
    if-eqz v3, :cond_6

    .line 256
    .line 257
    invoke-static {v2}, Lcom/immomo/moment/mediautils/g;->F(Lcom/immomo/moment/mediautils/g;)Z

    .line 258
    .line 259
    .line 260
    move-result v2

    .line 261
    if-nez v2, :cond_6

    .line 262
    .line 263
    iget-object v2, p0, Lcom/immomo/moment/mediautils/g$c;->a:Lcom/immomo/moment/mediautils/g;

    .line 264
    .line 265
    invoke-static {v2}, Lcom/immomo/moment/mediautils/g;->H(Lcom/immomo/moment/mediautils/g;)I

    .line 266
    .line 267
    .line 268
    move-result v2

    .line 269
    and-int/lit8 v2, v2, 0x10

    .line 270
    .line 271
    if-eqz v2, :cond_6

    .line 272
    .line 273
    const-string v2, "FFDecoderWrapper"

    .line 274
    .line 275
    const-string v3, "Video decoder finished!"

    .line 276
    .line 277
    invoke-static {v2, v3}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 278
    .line 279
    .line 280
    iget-object v2, p0, Lcom/immomo/moment/mediautils/g$c;->a:Lcom/immomo/moment/mediautils/g;

    .line 281
    .line 282
    iget-object v2, v2, Lcom/immomo/moment/mediautils/m;->y:Lcom/immomo/moment/mediautils/m$e;

    .line 283
    .line 284
    invoke-interface {v2}, Lcom/immomo/moment/mediautils/m$e;->c()V

    .line 285
    .line 286
    .line 287
    iget-object v2, p0, Lcom/immomo/moment/mediautils/g$c;->a:Lcom/immomo/moment/mediautils/g;

    .line 288
    .line 289
    iget-object v2, v2, Lcom/immomo/moment/mediautils/m;->y:Lcom/immomo/moment/mediautils/m$e;

    .line 290
    .line 291
    invoke-interface {v2}, Lcom/immomo/moment/mediautils/m$e;->a()V

    .line 292
    .line 293
    .line 294
    iget-object v2, p0, Lcom/immomo/moment/mediautils/g$c;->a:Lcom/immomo/moment/mediautils/g;

    .line 295
    .line 296
    invoke-static {v2, v5}, Lcom/immomo/moment/mediautils/g;->G(Lcom/immomo/moment/mediautils/g;Z)Z

    .line 297
    .line 298
    .line 299
    iget-object v2, p0, Lcom/immomo/moment/mediautils/g$c;->a:Lcom/immomo/moment/mediautils/g;

    .line 300
    .line 301
    iget-object v2, v2, Lcom/immomo/moment/mediautils/m;->y:Lcom/immomo/moment/mediautils/m$e;

    .line 302
    .line 303
    if-eqz v2, :cond_6

    .line 304
    .line 305
    invoke-interface {v2, v4}, Lcom/immomo/moment/mediautils/m$e;->e(Landroid/media/MediaCodec$BufferInfo;)V

    .line 306
    .line 307
    .line 308
    :cond_6
    iget-object v2, p0, Lcom/immomo/moment/mediautils/g$c;->a:Lcom/immomo/moment/mediautils/g;

    .line 309
    .line 310
    iget-boolean v2, v2, Lcom/immomo/moment/mediautils/m;->s:Z

    .line 311
    .line 312
    if-eqz v2, :cond_7

    .line 313
    .line 314
    goto :goto_4

    .line 315
    :cond_7
    if-eqz v1, :cond_1

    .line 316
    .line 317
    const-wide/16 v1, 0xa

    .line 318
    .line 319
    :try_start_3
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_0

    .line 320
    .line 321
    .line 322
    goto/16 :goto_0

    .line 323
    .line 324
    :catch_0
    move-exception v1

    .line 325
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 326
    .line 327
    .line 328
    goto/16 :goto_0

    .line 329
    .line 330
    :cond_8
    :goto_4
    const-string p0, "FFDecoderWrapper"

    .line 331
    .line 332
    const-string v0, "Fetch Video Thread exit!"

    .line 333
    .line 334
    invoke-static {p0, v0}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 335
    .line 336
    .line 337
    return-void
.end method
