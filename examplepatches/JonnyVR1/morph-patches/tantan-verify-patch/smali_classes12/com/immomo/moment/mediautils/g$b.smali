.class public Lcom/immomo/moment/mediautils/g$b;
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
    name = "b"
.end annotation


# instance fields
.field final synthetic a:Lcom/immomo/moment/mediautils/g;


# direct methods
.method public constructor <init>(Lcom/immomo/moment/mediautils/g;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/g$b;->a:Lcom/immomo/moment/mediautils/g;

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
    iget-object v0, p0, Lcom/immomo/moment/mediautils/g$b;->a:Lcom/immomo/moment/mediautils/g;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/immomo/moment/mediautils/m;->x:Lcom/immomo/moment/mediautils/m$c;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    iget-object v0, v0, Lcom/immomo/moment/mediautils/m;->A:Landroid/media/MediaFormat;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-interface {v1, v0}, Lcom/immomo/moment/mediautils/m$c;->d(Landroid/media/MediaFormat;)V

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
    iget-object v2, p0, Lcom/immomo/moment/mediautils/g$b;->a:Lcom/immomo/moment/mediautils/g;

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
    iget-object v2, p0, Lcom/immomo/moment/mediautils/g$b;->a:Lcom/immomo/moment/mediautils/g;

    .line 25
    .line 26
    invoke-static {v2}, Lcom/immomo/moment/mediautils/g;->E(Lcom/immomo/moment/mediautils/g;)Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    const/4 v3, 0x1

    .line 31
    if-nez v2, :cond_4

    .line 32
    .line 33
    iget-object v2, p0, Lcom/immomo/moment/mediautils/g$b;->a:Lcom/immomo/moment/mediautils/g;

    .line 34
    .line 35
    iget-object v4, v2, Lcom/immomo/moment/mediautils/m;->x:Lcom/immomo/moment/mediautils/m$c;

    .line 36
    .line 37
    if-eqz v4, :cond_4

    .line 38
    .line 39
    invoke-static {v2}, Lcom/immomo/moment/mediautils/g;->V(Lcom/immomo/moment/mediautils/g;)Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-virtual {v2}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->getAudioFrameCnt()I

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    if-lez v2, :cond_4

    .line 48
    .line 49
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 50
    .line 51
    .line 52
    iget-object v2, p0, Lcom/immomo/moment/mediautils/g$b;->a:Lcom/immomo/moment/mediautils/g;

    .line 53
    .line 54
    invoke-static {v2}, Lcom/immomo/moment/mediautils/g;->V(Lcom/immomo/moment/mediautils/g;)Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-virtual {v2}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->getAudioFrame()Ll/ad60;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    if-nez v2, :cond_2

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_2
    invoke-virtual {v2}, Ll/ad60;->b()Landroid/media/MediaCodec$BufferInfo;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    iget-object v5, p0, Lcom/immomo/moment/mediautils/g$b;->a:Lcom/immomo/moment/mediautils/g;

    .line 70
    .line 71
    iget-wide v6, v4, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 72
    .line 73
    invoke-static {v5, v6, v7}, Lcom/immomo/moment/mediautils/g;->K(Lcom/immomo/moment/mediautils/g;J)Z

    .line 74
    .line 75
    .line 76
    move-result v5

    .line 77
    if-nez v5, :cond_3

    .line 78
    .line 79
    iget-wide v4, v4, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 80
    .line 81
    iget-object v2, p0, Lcom/immomo/moment/mediautils/g$b;->a:Lcom/immomo/moment/mediautils/g;

    .line 82
    .line 83
    iget-wide v6, v2, Lcom/immomo/moment/mediautils/m;->q:J

    .line 84
    .line 85
    cmp-long v4, v4, v6

    .line 86
    .line 87
    if-lez v4, :cond_1

    .line 88
    .line 89
    iget-object v4, v2, Lcom/immomo/moment/mediautils/m;->x:Lcom/immomo/moment/mediautils/m$c;

    .line 90
    .line 91
    if-eqz v4, :cond_1

    .line 92
    .line 93
    invoke-static {v2}, Lcom/immomo/moment/mediautils/g;->R(Lcom/immomo/moment/mediautils/g;)Z

    .line 94
    .line 95
    .line 96
    move-result v2

    .line 97
    if-nez v2, :cond_1

    .line 98
    .line 99
    iget-object v2, p0, Lcom/immomo/moment/mediautils/g$b;->a:Lcom/immomo/moment/mediautils/g;

    .line 100
    .line 101
    invoke-static {v2}, Lcom/immomo/moment/mediautils/g;->H(Lcom/immomo/moment/mediautils/g;)I

    .line 102
    .line 103
    .line 104
    move-result v2

    .line 105
    and-int/2addr v2, v3

    .line 106
    if-eqz v2, :cond_1

    .line 107
    .line 108
    const-string v2, "FFDecoderWrapper"

    .line 109
    .line 110
    const-string v4, "Audio Decoder finished!"

    .line 111
    .line 112
    invoke-static {v2, v4}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    iget-object v2, p0, Lcom/immomo/moment/mediautils/g$b;->a:Lcom/immomo/moment/mediautils/g;

    .line 116
    .line 117
    iget-object v2, v2, Lcom/immomo/moment/mediautils/m;->x:Lcom/immomo/moment/mediautils/m$c;

    .line 118
    .line 119
    invoke-interface {v2}, Lcom/immomo/moment/mediautils/m$c;->c()V

    .line 120
    .line 121
    .line 122
    iget-object v2, p0, Lcom/immomo/moment/mediautils/g$b;->a:Lcom/immomo/moment/mediautils/g;

    .line 123
    .line 124
    iget-object v2, v2, Lcom/immomo/moment/mediautils/m;->x:Lcom/immomo/moment/mediautils/m$c;

    .line 125
    .line 126
    invoke-interface {v2}, Lcom/immomo/moment/mediautils/m$c;->a()V

    .line 127
    .line 128
    .line 129
    iget-object v2, p0, Lcom/immomo/moment/mediautils/g$b;->a:Lcom/immomo/moment/mediautils/g;

    .line 130
    .line 131
    invoke-static {v2, v3}, Lcom/immomo/moment/mediautils/g;->S(Lcom/immomo/moment/mediautils/g;Z)Z

    .line 132
    .line 133
    .line 134
    goto :goto_1

    .line 135
    :cond_3
    iget-object v5, p0, Lcom/immomo/moment/mediautils/g$b;->a:Lcom/immomo/moment/mediautils/g;

    .line 136
    .line 137
    iget-object v5, v5, Lcom/immomo/moment/mediautils/m;->x:Lcom/immomo/moment/mediautils/m$c;

    .line 138
    .line 139
    invoke-virtual {v2}, Ll/ad60;->a()Ljava/nio/ByteBuffer;

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    iget v6, v4, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 144
    .line 145
    iget-wide v7, v4, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 146
    .line 147
    invoke-interface {v5, v2, v6, v7, v8}, Lcom/immomo/moment/mediautils/m$c;->e(Ljava/nio/ByteBuffer;IJ)V

    .line 148
    .line 149
    .line 150
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 151
    .line 152
    .line 153
    goto :goto_2

    .line 154
    :cond_4
    move v1, v3

    .line 155
    :goto_2
    iget-object v2, p0, Lcom/immomo/moment/mediautils/g$b;->a:Lcom/immomo/moment/mediautils/g;

    .line 156
    .line 157
    invoke-static {v2}, Lcom/immomo/moment/mediautils/g;->E(Lcom/immomo/moment/mediautils/g;)Z

    .line 158
    .line 159
    .line 160
    move-result v2

    .line 161
    if-eqz v2, :cond_5

    .line 162
    .line 163
    iget-object v2, p0, Lcom/immomo/moment/mediautils/g$b;->a:Lcom/immomo/moment/mediautils/g;

    .line 164
    .line 165
    invoke-static {v2}, Lcom/immomo/moment/mediautils/g;->L(Lcom/immomo/moment/mediautils/g;)Ljava/lang/Object;

    .line 166
    .line 167
    .line 168
    move-result-object v2

    .line 169
    monitor-enter v2

    .line 170
    :try_start_0
    iget-object v4, p0, Lcom/immomo/moment/mediautils/g$b;->a:Lcom/immomo/moment/mediautils/g;

    .line 171
    .line 172
    invoke-static {v4, v3}, Lcom/immomo/moment/mediautils/g;->M(Lcom/immomo/moment/mediautils/g;Z)Z

    .line 173
    .line 174
    .line 175
    iget-object v4, p0, Lcom/immomo/moment/mediautils/g$b;->a:Lcom/immomo/moment/mediautils/g;

    .line 176
    .line 177
    invoke-static {v4}, Lcom/immomo/moment/mediautils/g;->L(Lcom/immomo/moment/mediautils/g;)Ljava/lang/Object;

    .line 178
    .line 179
    .line 180
    move-result-object v4

    .line 181
    invoke-virtual {v4}, Ljava/lang/Object;->notifyAll()V

    .line 182
    .line 183
    .line 184
    monitor-exit v2

    .line 185
    goto :goto_3

    .line 186
    :catchall_0
    move-exception p0

    .line 187
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 188
    throw p0

    .line 189
    :cond_5
    :goto_3
    iget-object v2, p0, Lcom/immomo/moment/mediautils/g$b;->a:Lcom/immomo/moment/mediautils/g;

    .line 190
    .line 191
    invoke-static {v2}, Lcom/immomo/moment/mediautils/g;->R(Lcom/immomo/moment/mediautils/g;)Z

    .line 192
    .line 193
    .line 194
    move-result v2

    .line 195
    if-nez v2, :cond_7

    .line 196
    .line 197
    iget-object v2, p0, Lcom/immomo/moment/mediautils/g$b;->a:Lcom/immomo/moment/mediautils/g;

    .line 198
    .line 199
    invoke-static {v2}, Lcom/immomo/moment/mediautils/g;->V(Lcom/immomo/moment/mediautils/g;)Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 200
    .line 201
    .line 202
    move-result-object v2

    .line 203
    invoke-virtual {v2}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->getStatus()I

    .line 204
    .line 205
    .line 206
    move-result v2

    .line 207
    if-eqz v2, :cond_7

    .line 208
    .line 209
    iget-object v2, p0, Lcom/immomo/moment/mediautils/g$b;->a:Lcom/immomo/moment/mediautils/g;

    .line 210
    .line 211
    iget-object v4, v2, Lcom/immomo/moment/mediautils/m;->x:Lcom/immomo/moment/mediautils/m$c;

    .line 212
    .line 213
    if-eqz v4, :cond_6

    .line 214
    .line 215
    invoke-static {v2}, Lcom/immomo/moment/mediautils/g;->R(Lcom/immomo/moment/mediautils/g;)Z

    .line 216
    .line 217
    .line 218
    move-result v2

    .line 219
    if-nez v2, :cond_6

    .line 220
    .line 221
    iget-object v2, p0, Lcom/immomo/moment/mediautils/g$b;->a:Lcom/immomo/moment/mediautils/g;

    .line 222
    .line 223
    invoke-static {v2}, Lcom/immomo/moment/mediautils/g;->H(Lcom/immomo/moment/mediautils/g;)I

    .line 224
    .line 225
    .line 226
    move-result v2

    .line 227
    and-int/2addr v2, v3

    .line 228
    if-eqz v2, :cond_6

    .line 229
    .line 230
    const-string v2, "FFDecoderWrapper"

    .line 231
    .line 232
    const-string v4, "Audio Decoder finished!"

    .line 233
    .line 234
    invoke-static {v2, v4}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 235
    .line 236
    .line 237
    iget-object v2, p0, Lcom/immomo/moment/mediautils/g$b;->a:Lcom/immomo/moment/mediautils/g;

    .line 238
    .line 239
    iget-object v2, v2, Lcom/immomo/moment/mediautils/m;->x:Lcom/immomo/moment/mediautils/m$c;

    .line 240
    .line 241
    invoke-interface {v2}, Lcom/immomo/moment/mediautils/m$c;->c()V

    .line 242
    .line 243
    .line 244
    iget-object v2, p0, Lcom/immomo/moment/mediautils/g$b;->a:Lcom/immomo/moment/mediautils/g;

    .line 245
    .line 246
    iget-object v2, v2, Lcom/immomo/moment/mediautils/m;->x:Lcom/immomo/moment/mediautils/m$c;

    .line 247
    .line 248
    invoke-interface {v2}, Lcom/immomo/moment/mediautils/m$c;->a()V

    .line 249
    .line 250
    .line 251
    iget-object v2, p0, Lcom/immomo/moment/mediautils/g$b;->a:Lcom/immomo/moment/mediautils/g;

    .line 252
    .line 253
    invoke-static {v2, v3}, Lcom/immomo/moment/mediautils/g;->S(Lcom/immomo/moment/mediautils/g;Z)Z

    .line 254
    .line 255
    .line 256
    iget-object v2, p0, Lcom/immomo/moment/mediautils/g$b;->a:Lcom/immomo/moment/mediautils/g;

    .line 257
    .line 258
    iget-object v2, v2, Lcom/immomo/moment/mediautils/m;->y:Lcom/immomo/moment/mediautils/m$e;

    .line 259
    .line 260
    if-eqz v2, :cond_6

    .line 261
    .line 262
    const/4 v3, 0x0

    .line 263
    invoke-interface {v2, v3}, Lcom/immomo/moment/mediautils/m$e;->e(Landroid/media/MediaCodec$BufferInfo;)V

    .line 264
    .line 265
    .line 266
    :cond_6
    iget-object v2, p0, Lcom/immomo/moment/mediautils/g$b;->a:Lcom/immomo/moment/mediautils/g;

    .line 267
    .line 268
    iget-boolean v2, v2, Lcom/immomo/moment/mediautils/m;->s:Z

    .line 269
    .line 270
    if-eqz v2, :cond_7

    .line 271
    .line 272
    goto :goto_4

    .line 273
    :cond_7
    if-eqz v1, :cond_1

    .line 274
    .line 275
    const-wide/16 v1, 0xa

    .line 276
    .line 277
    :try_start_1
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    .line 278
    .line 279
    .line 280
    goto/16 :goto_0

    .line 281
    .line 282
    :catch_0
    move-exception v1

    .line 283
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 284
    .line 285
    .line 286
    goto/16 :goto_0

    .line 287
    .line 288
    :cond_8
    :goto_4
    const-string p0, "FFDecoderWrapper"

    .line 289
    .line 290
    const-string v0, "Fetch Audio Thread exit!"

    .line 291
    .line 292
    invoke-static {p0, v0}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 293
    .line 294
    .line 295
    return-void
.end method
