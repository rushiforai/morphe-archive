.class Lcom/immomo/moment/mediautils/h$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/moment/mediautils/h;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation


# instance fields
.field private a:Landroid/media/MediaCodec$BufferInfo;

.field b:Z

.field final synthetic c:Lcom/immomo/moment/mediautils/h;


# direct methods
.method public constructor <init>(Lcom/immomo/moment/mediautils/h;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/h$c;->c:Lcom/immomo/moment/mediautils/h;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Landroid/media/MediaCodec$BufferInfo;

    .line 7
    .line 8
    invoke-direct {p1}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/immomo/moment/mediautils/h$c;->a:Landroid/media/MediaCodec$BufferInfo;

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    iput-boolean p1, p0, Lcom/immomo/moment/mediautils/h$c;->b:Z

    .line 15
    .line 16
    return-void
.end method

.method private a(Landroid/media/MediaFormat;Landroid/media/MediaFormat;)Z
    .locals 4

    .line 1
    const-string p0, "channel-count"

    .line 2
    .line 3
    invoke-virtual {p2, p0}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p1, p0}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const/4 v2, 0x1

    .line 12
    if-ne v0, v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p1, p0}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {p2, p0}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    invoke-virtual {p1, p0}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    if-eq v0, p0, :cond_1

    .line 29
    .line 30
    :cond_0
    move p0, v2

    .line 31
    goto :goto_0

    .line 32
    :cond_1
    const/4 p0, 0x0

    .line 33
    :goto_0
    const-string v0, "sample-rate"

    .line 34
    .line 35
    invoke-virtual {p2, v0}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    invoke-virtual {p1, v0}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    if-ne v1, v3, :cond_2

    .line 44
    .line 45
    invoke-virtual {p1, v0}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-eqz v1, :cond_3

    .line 50
    .line 51
    invoke-virtual {p2, v0}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    invoke-virtual {p1, v0}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eq v1, v0, :cond_3

    .line 60
    .line 61
    :cond_2
    move p0, v2

    .line 62
    :cond_3
    const-string v0, "bit-width"

    .line 63
    .line 64
    invoke-virtual {p2, v0}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    invoke-virtual {p1, v0}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 69
    .line 70
    .line 71
    move-result v3

    .line 72
    if-ne v1, v3, :cond_5

    .line 73
    .line 74
    invoke-virtual {p1, v0}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    if-eqz v1, :cond_4

    .line 79
    .line 80
    invoke-virtual {p2, v0}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 81
    .line 82
    .line 83
    move-result p2

    .line 84
    invoke-virtual {p1, v0}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    if-eq p2, p1, :cond_4

    .line 89
    .line 90
    return v2

    .line 91
    :cond_4
    return p0

    .line 92
    :cond_5
    return v2
.end method


# virtual methods
.method public run()V
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/immomo/moment/mediautils/h$c;->c:Lcom/immomo/moment/mediautils/h;

    .line 3
    .line 4
    invoke-static {v1}, Lcom/immomo/moment/mediautils/h;->b(Lcom/immomo/moment/mediautils/h;)Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    const/4 v2, 0x1

    .line 9
    if-nez v1, :cond_16

    .line 10
    .line 11
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_16

    .line 16
    .line 17
    iget-object v1, p0, Lcom/immomo/moment/mediautils/h$c;->c:Lcom/immomo/moment/mediautils/h;

    .line 18
    .line 19
    invoke-static {v1}, Lcom/immomo/moment/mediautils/h;->d(Lcom/immomo/moment/mediautils/h;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    monitor-enter v1

    .line 24
    :try_start_0
    iget-object v3, p0, Lcom/immomo/moment/mediautils/h$c;->c:Lcom/immomo/moment/mediautils/h;

    .line 25
    .line 26
    invoke-static {v3}, Lcom/immomo/moment/mediautils/h;->e(Lcom/immomo/moment/mediautils/h;)Z

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    if-eqz v3, :cond_1

    .line 31
    .line 32
    iget-object v3, p0, Lcom/immomo/moment/mediautils/h$c;->c:Lcom/immomo/moment/mediautils/h;

    .line 33
    .line 34
    invoke-static {v3, v2}, Lcom/immomo/moment/mediautils/h;->f(Lcom/immomo/moment/mediautils/h;Z)Z

    .line 35
    .line 36
    .line 37
    iget-object v2, p0, Lcom/immomo/moment/mediautils/h$c;->c:Lcom/immomo/moment/mediautils/h;

    .line 38
    .line 39
    invoke-static {v2}, Lcom/immomo/moment/mediautils/h;->d(Lcom/immomo/moment/mediautils/h;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-virtual {v2}, Ljava/lang/Object;->notifyAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 44
    .line 45
    .line 46
    const-wide/16 v2, 0x1

    .line 47
    .line 48
    :try_start_1
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 49
    .line 50
    .line 51
    goto :goto_1

    .line 52
    :catchall_0
    move-exception p0

    .line 53
    goto/16 :goto_9

    .line 54
    .line 55
    :catch_0
    move-exception v2

    .line 56
    :try_start_2
    invoke-virtual {v2}, Ljava/lang/Throwable;->printStackTrace()V

    .line 57
    .line 58
    .line 59
    :goto_1
    monitor-exit v1

    .line 60
    goto :goto_0

    .line 61
    :cond_1
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 62
    iget-object v1, p0, Lcom/immomo/moment/mediautils/h$c;->c:Lcom/immomo/moment/mediautils/h;

    .line 63
    .line 64
    invoke-static {v1}, Lcom/immomo/moment/mediautils/h;->g(Lcom/immomo/moment/mediautils/h;)Z

    .line 65
    .line 66
    .line 67
    const/4 v1, 0x0

    .line 68
    :try_start_3
    iget-object v3, p0, Lcom/immomo/moment/mediautils/h$c;->a:Landroid/media/MediaCodec$BufferInfo;

    .line 69
    .line 70
    iput v1, v3, Landroid/media/MediaCodec$BufferInfo;->flags:I

    .line 71
    .line 72
    iget-object v3, p0, Lcom/immomo/moment/mediautils/h$c;->c:Lcom/immomo/moment/mediautils/h;

    .line 73
    .line 74
    invoke-static {v3}, Lcom/immomo/moment/mediautils/h;->m(Lcom/immomo/moment/mediautils/h;)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    const-string v4, "audio"

    .line 79
    .line 80
    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 81
    .line 82
    .line 83
    move-result v3
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 84
    iget-object v4, p0, Lcom/immomo/moment/mediautils/h$c;->c:Lcom/immomo/moment/mediautils/h;

    .line 85
    .line 86
    if-eqz v3, :cond_2

    .line 87
    .line 88
    :try_start_4
    invoke-static {v4}, Lcom/immomo/moment/mediautils/h;->r(Lcom/immomo/moment/mediautils/h;)Landroid/media/MediaCodec;

    .line 89
    .line 90
    .line 91
    move-result-object v3

    .line 92
    iget-object v4, p0, Lcom/immomo/moment/mediautils/h$c;->a:Landroid/media/MediaCodec$BufferInfo;

    .line 93
    .line 94
    const-wide/16 v5, 0xc8

    .line 95
    .line 96
    invoke-virtual {v3, v4, v5, v6}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    .line 97
    .line 98
    .line 99
    move-result v3

    .line 100
    goto :goto_2

    .line 101
    :catch_1
    move-exception v0

    .line 102
    goto/16 :goto_7

    .line 103
    .line 104
    :cond_2
    invoke-static {v4}, Lcom/immomo/moment/mediautils/h;->r(Lcom/immomo/moment/mediautils/h;)Landroid/media/MediaCodec;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    iget-object v4, p0, Lcom/immomo/moment/mediautils/h$c;->a:Landroid/media/MediaCodec$BufferInfo;

    .line 109
    .line 110
    const-wide/16 v5, 0x2710

    .line 111
    .line 112
    invoke-virtual {v3, v4, v5, v6}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    .line 113
    .line 114
    .line 115
    move-result v3
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    .line 116
    :goto_2
    const/4 v4, -0x3

    .line 117
    if-eq v3, v4, :cond_0

    .line 118
    .line 119
    const/4 v4, -0x2

    .line 120
    if-eq v3, v4, :cond_11

    .line 121
    .line 122
    iget-object v4, p0, Lcom/immomo/moment/mediautils/h$c;->c:Lcom/immomo/moment/mediautils/h;

    .line 123
    .line 124
    const/4 v5, -0x1

    .line 125
    if-eq v3, v5, :cond_10

    .line 126
    .line 127
    :try_start_5
    invoke-static {v4}, Lcom/immomo/moment/mediautils/h;->h(Lcom/immomo/moment/mediautils/h;)[Ljava/nio/ByteBuffer;

    .line 128
    .line 129
    .line 130
    move-result-object v4

    .line 131
    if-nez v4, :cond_3

    .line 132
    .line 133
    iget-object v4, p0, Lcom/immomo/moment/mediautils/h$c;->c:Lcom/immomo/moment/mediautils/h;

    .line 134
    .line 135
    invoke-static {v4}, Lcom/immomo/moment/mediautils/h;->r(Lcom/immomo/moment/mediautils/h;)Landroid/media/MediaCodec;

    .line 136
    .line 137
    .line 138
    move-result-object v5

    .line 139
    invoke-virtual {v5}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    .line 140
    .line 141
    .line 142
    move-result-object v5

    .line 143
    invoke-static {v4, v5}, Lcom/immomo/moment/mediautils/h;->i(Lcom/immomo/moment/mediautils/h;[Ljava/nio/ByteBuffer;)[Ljava/nio/ByteBuffer;

    .line 144
    .line 145
    .line 146
    :cond_3
    iget-object v4, p0, Lcom/immomo/moment/mediautils/h$c;->c:Lcom/immomo/moment/mediautils/h;

    .line 147
    .line 148
    invoke-static {v4}, Lcom/immomo/moment/mediautils/h;->a(Lcom/immomo/moment/mediautils/h;)I

    .line 149
    .line 150
    .line 151
    move-result v4
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    .line 152
    iget-object v5, p0, Lcom/immomo/moment/mediautils/h$c;->c:Lcom/immomo/moment/mediautils/h;

    .line 153
    .line 154
    if-ne v4, v2, :cond_9

    .line 155
    .line 156
    :try_start_6
    invoke-static {v5}, Lcom/immomo/moment/mediautils/h;->j(Lcom/immomo/moment/mediautils/h;)Landroid/view/Surface;

    .line 157
    .line 158
    .line 159
    move-result-object v4

    .line 160
    if-nez v4, :cond_5

    .line 161
    .line 162
    iget-object v4, p0, Lcom/immomo/moment/mediautils/h$c;->c:Lcom/immomo/moment/mediautils/h;

    .line 163
    .line 164
    invoke-static {v4}, Lcom/immomo/moment/mediautils/h;->q(Lcom/immomo/moment/mediautils/h;)Lcom/immomo/moment/mediautils/h$b;

    .line 165
    .line 166
    .line 167
    move-result-object v4

    .line 168
    if-eqz v4, :cond_4

    .line 169
    .line 170
    iget-object v4, p0, Lcom/immomo/moment/mediautils/h$c;->c:Lcom/immomo/moment/mediautils/h;

    .line 171
    .line 172
    invoke-static {v4}, Lcom/immomo/moment/mediautils/h;->q(Lcom/immomo/moment/mediautils/h;)Lcom/immomo/moment/mediautils/h$b;

    .line 173
    .line 174
    .line 175
    move-result-object v4

    .line 176
    iget-object v5, p0, Lcom/immomo/moment/mediautils/h$c;->c:Lcom/immomo/moment/mediautils/h;

    .line 177
    .line 178
    invoke-static {v5}, Lcom/immomo/moment/mediautils/h;->h(Lcom/immomo/moment/mediautils/h;)[Ljava/nio/ByteBuffer;

    .line 179
    .line 180
    .line 181
    move-result-object v5

    .line 182
    aget-object v5, v5, v3

    .line 183
    .line 184
    iget-object v6, p0, Lcom/immomo/moment/mediautils/h$c;->a:Landroid/media/MediaCodec$BufferInfo;

    .line 185
    .line 186
    invoke-interface {v4, v5, v6}, Lcom/immomo/moment/mediautils/h$b;->onDataOutput(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V

    .line 187
    .line 188
    .line 189
    :cond_4
    iget-object v4, p0, Lcom/immomo/moment/mediautils/h$c;->c:Lcom/immomo/moment/mediautils/h;

    .line 190
    .line 191
    invoke-static {v4}, Lcom/immomo/moment/mediautils/h;->r(Lcom/immomo/moment/mediautils/h;)Landroid/media/MediaCodec;

    .line 192
    .line 193
    .line 194
    move-result-object v4

    .line 195
    invoke-virtual {v4, v3, v1}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 196
    .line 197
    .line 198
    iget-object v4, p0, Lcom/immomo/moment/mediautils/h$c;->c:Lcom/immomo/moment/mediautils/h;

    .line 199
    .line 200
    invoke-static {v4}, Lcom/immomo/moment/mediautils/h;->m(Lcom/immomo/moment/mediautils/h;)Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object v4

    .line 204
    const-string v5, "audio"

    .line 205
    .line 206
    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 207
    .line 208
    .line 209
    move-result v4

    .line 210
    if-eqz v4, :cond_b

    .line 211
    .line 212
    iget-object v4, p0, Lcom/immomo/moment/mediautils/h$c;->c:Lcom/immomo/moment/mediautils/h;

    .line 213
    .line 214
    invoke-static {v4}, Lcom/immomo/moment/mediautils/h;->h(Lcom/immomo/moment/mediautils/h;)[Ljava/nio/ByteBuffer;

    .line 215
    .line 216
    .line 217
    move-result-object v4

    .line 218
    aget-object v3, v4, v3

    .line 219
    .line 220
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 221
    .line 222
    .line 223
    goto/16 :goto_4

    .line 224
    .line 225
    :cond_5
    iget-object v4, p0, Lcom/immomo/moment/mediautils/h$c;->a:Landroid/media/MediaCodec$BufferInfo;

    .line 226
    .line 227
    iget v4, v4, Landroid/media/MediaCodec$BufferInfo;->size:I
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1

    .line 228
    .line 229
    iget-object v5, p0, Lcom/immomo/moment/mediautils/h$c;->c:Lcom/immomo/moment/mediautils/h;

    .line 230
    .line 231
    if-lez v4, :cond_8

    .line 232
    .line 233
    :try_start_7
    invoke-static {v5}, Lcom/immomo/moment/mediautils/h;->k(Lcom/immomo/moment/mediautils/h;)Lcom/immomo/moment/mediautils/h$a;

    .line 234
    .line 235
    .line 236
    move-result-object v4

    .line 237
    if-eqz v4, :cond_6

    .line 238
    .line 239
    iget-object v4, p0, Lcom/immomo/moment/mediautils/h$c;->c:Lcom/immomo/moment/mediautils/h;

    .line 240
    .line 241
    invoke-static {v4}, Lcom/immomo/moment/mediautils/h;->k(Lcom/immomo/moment/mediautils/h;)Lcom/immomo/moment/mediautils/h$a;

    .line 242
    .line 243
    .line 244
    move-result-object v4

    .line 245
    iget-object v5, p0, Lcom/immomo/moment/mediautils/h$c;->a:Landroid/media/MediaCodec$BufferInfo;

    .line 246
    .line 247
    invoke-interface {v4, v5}, Lcom/immomo/moment/mediautils/h$a;->onStartRendingImageToTexture(Landroid/media/MediaCodec$BufferInfo;)Z

    .line 248
    .line 249
    .line 250
    move-result v4
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_1

    .line 251
    goto :goto_3

    .line 252
    :cond_6
    move v4, v2

    .line 253
    :goto_3
    iget-object v5, p0, Lcom/immomo/moment/mediautils/h$c;->c:Lcom/immomo/moment/mediautils/h;

    .line 254
    .line 255
    if-eqz v4, :cond_7

    .line 256
    .line 257
    :try_start_8
    invoke-static {v5}, Lcom/immomo/moment/mediautils/h;->l(Lcom/immomo/moment/mediautils/h;)Ljava/lang/Object;

    .line 258
    .line 259
    .line 260
    move-result-object v4

    .line 261
    monitor-enter v4
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_1

    .line 262
    :try_start_9
    iget-object v5, p0, Lcom/immomo/moment/mediautils/h$c;->c:Lcom/immomo/moment/mediautils/h;

    .line 263
    .line 264
    invoke-static {v5}, Lcom/immomo/moment/mediautils/h;->n(Lcom/immomo/moment/mediautils/h;)Ljava/util/LinkedList;

    .line 265
    .line 266
    .line 267
    move-result-object v5

    .line 268
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 269
    .line 270
    .line 271
    move-result-object v3

    .line 272
    invoke-virtual {v5, v3}, Ljava/util/LinkedList;->offer(Ljava/lang/Object;)Z

    .line 273
    .line 274
    .line 275
    monitor-exit v4

    .line 276
    goto :goto_4

    .line 277
    :catchall_1
    move-exception v0

    .line 278
    monitor-exit v4
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    .line 279
    :try_start_a
    throw v0

    .line 280
    :cond_7
    invoke-static {v5}, Lcom/immomo/moment/mediautils/h;->r(Lcom/immomo/moment/mediautils/h;)Landroid/media/MediaCodec;

    .line 281
    .line 282
    .line 283
    move-result-object v4

    .line 284
    invoke-virtual {v4, v3, v1}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 285
    .line 286
    .line 287
    goto :goto_4

    .line 288
    :cond_8
    invoke-static {v5}, Lcom/immomo/moment/mediautils/h;->r(Lcom/immomo/moment/mediautils/h;)Landroid/media/MediaCodec;

    .line 289
    .line 290
    .line 291
    move-result-object v4

    .line 292
    invoke-virtual {v4, v3, v1}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 293
    .line 294
    .line 295
    goto :goto_4

    .line 296
    :cond_9
    invoke-static {v5}, Lcom/immomo/moment/mediautils/h;->a(Lcom/immomo/moment/mediautils/h;)I

    .line 297
    .line 298
    .line 299
    move-result v4

    .line 300
    if-nez v4, :cond_b

    .line 301
    .line 302
    iget-object v4, p0, Lcom/immomo/moment/mediautils/h$c;->a:Landroid/media/MediaCodec$BufferInfo;

    .line 303
    .line 304
    iget v5, v4, Landroid/media/MediaCodec$BufferInfo;->flags:I

    .line 305
    .line 306
    const/4 v6, 0x2

    .line 307
    if-eq v5, v6, :cond_a

    .line 308
    .line 309
    iget v4, v4, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 310
    .line 311
    if-eqz v4, :cond_a

    .line 312
    .line 313
    iget-object v4, p0, Lcom/immomo/moment/mediautils/h$c;->c:Lcom/immomo/moment/mediautils/h;

    .line 314
    .line 315
    invoke-static {v4}, Lcom/immomo/moment/mediautils/h;->q(Lcom/immomo/moment/mediautils/h;)Lcom/immomo/moment/mediautils/h$b;

    .line 316
    .line 317
    .line 318
    move-result-object v4

    .line 319
    if-eqz v4, :cond_a

    .line 320
    .line 321
    iget-object v4, p0, Lcom/immomo/moment/mediautils/h$c;->c:Lcom/immomo/moment/mediautils/h;

    .line 322
    .line 323
    invoke-static {v4}, Lcom/immomo/moment/mediautils/h;->q(Lcom/immomo/moment/mediautils/h;)Lcom/immomo/moment/mediautils/h$b;

    .line 324
    .line 325
    .line 326
    move-result-object v4

    .line 327
    iget-object v5, p0, Lcom/immomo/moment/mediautils/h$c;->c:Lcom/immomo/moment/mediautils/h;

    .line 328
    .line 329
    invoke-static {v5}, Lcom/immomo/moment/mediautils/h;->h(Lcom/immomo/moment/mediautils/h;)[Ljava/nio/ByteBuffer;

    .line 330
    .line 331
    .line 332
    move-result-object v5

    .line 333
    aget-object v5, v5, v3

    .line 334
    .line 335
    iget-object v6, p0, Lcom/immomo/moment/mediautils/h$c;->a:Landroid/media/MediaCodec$BufferInfo;

    .line 336
    .line 337
    invoke-interface {v4, v5, v6}, Lcom/immomo/moment/mediautils/h$b;->onDataOutput(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V

    .line 338
    .line 339
    .line 340
    :cond_a
    iget-object v4, p0, Lcom/immomo/moment/mediautils/h$c;->c:Lcom/immomo/moment/mediautils/h;

    .line 341
    .line 342
    invoke-static {v4}, Lcom/immomo/moment/mediautils/h;->r(Lcom/immomo/moment/mediautils/h;)Landroid/media/MediaCodec;

    .line 343
    .line 344
    .line 345
    move-result-object v4

    .line 346
    invoke-virtual {v4, v3, v1}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 347
    .line 348
    .line 349
    :cond_b
    :goto_4
    iget-object v3, p0, Lcom/immomo/moment/mediautils/h$c;->a:Landroid/media/MediaCodec$BufferInfo;

    .line 350
    .line 351
    iget v3, v3, Landroid/media/MediaCodec$BufferInfo;->flags:I

    .line 352
    .line 353
    and-int/lit8 v3, v3, 0x4

    .line 354
    .line 355
    if-eqz v3, :cond_0

    .line 356
    .line 357
    iget-object v3, p0, Lcom/immomo/moment/mediautils/h$c;->c:Lcom/immomo/moment/mediautils/h;

    .line 358
    .line 359
    invoke-static {v3}, Lcom/immomo/moment/mediautils/h;->a(Lcom/immomo/moment/mediautils/h;)I

    .line 360
    .line 361
    .line 362
    move-result v3

    .line 363
    if-ne v3, v2, :cond_c

    .line 364
    .line 365
    const-string v3, "decoder "

    .line 366
    .line 367
    goto :goto_5

    .line 368
    :cond_c
    const-string v3, "encoder"

    .line 369
    .line 370
    :goto_5
    iget-object v4, p0, Lcom/immomo/moment/mediautils/h$c;->c:Lcom/immomo/moment/mediautils/h;

    .line 371
    .line 372
    invoke-static {v4}, Lcom/immomo/moment/mediautils/h;->m(Lcom/immomo/moment/mediautils/h;)Ljava/lang/String;

    .line 373
    .line 374
    .line 375
    move-result-object v4

    .line 376
    const-string v5, "video"

    .line 377
    .line 378
    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 379
    .line 380
    .line 381
    move-result v4

    .line 382
    if-eqz v4, :cond_d

    .line 383
    .line 384
    const-string v4, "video"

    .line 385
    .line 386
    goto :goto_6

    .line 387
    :cond_d
    const-string v4, "audio"

    .line 388
    .line 389
    :goto_6
    const-string v5, "MedaiCodecWrapper"

    .line 390
    .line 391
    new-instance v6, Ljava/lang/StringBuilder;

    .line 392
    .line 393
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 394
    .line 395
    .line 396
    const-string v7, "Codec End : "

    .line 397
    .line 398
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 399
    .line 400
    .line 401
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 402
    .line 403
    .line 404
    const-string v3, " ---- "

    .line 405
    .line 406
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 407
    .line 408
    .line 409
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 410
    .line 411
    .line 412
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 413
    .line 414
    .line 415
    move-result-object v3

    .line 416
    invoke-static {v5, v3}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 417
    .line 418
    .line 419
    iget-object v3, p0, Lcom/immomo/moment/mediautils/h$c;->c:Lcom/immomo/moment/mediautils/h;

    .line 420
    .line 421
    invoke-static {v3}, Lcom/immomo/moment/mediautils/h;->o(Lcom/immomo/moment/mediautils/h;)Lcom/immomo/moment/mediautils/h$d;

    .line 422
    .line 423
    .line 424
    move-result-object v3

    .line 425
    if-eqz v3, :cond_e

    .line 426
    .line 427
    iget-object v3, p0, Lcom/immomo/moment/mediautils/h$c;->c:Lcom/immomo/moment/mediautils/h;

    .line 428
    .line 429
    invoke-static {v3}, Lcom/immomo/moment/mediautils/h;->o(Lcom/immomo/moment/mediautils/h;)Lcom/immomo/moment/mediautils/h$d;

    .line 430
    .line 431
    .line 432
    move-result-object v3

    .line 433
    invoke-interface {v3}, Lcom/immomo/moment/mediautils/h$d;->onComplete()V

    .line 434
    .line 435
    .line 436
    :cond_e
    iget-object v3, p0, Lcom/immomo/moment/mediautils/h$c;->c:Lcom/immomo/moment/mediautils/h;

    .line 437
    .line 438
    invoke-static {v3}, Lcom/immomo/moment/mediautils/h;->a(Lcom/immomo/moment/mediautils/h;)I

    .line 439
    .line 440
    .line 441
    move-result v3

    .line 442
    if-nez v3, :cond_f

    .line 443
    .line 444
    iget-object v3, p0, Lcom/immomo/moment/mediautils/h$c;->c:Lcom/immomo/moment/mediautils/h;

    .line 445
    .line 446
    invoke-static {v3}, Lcom/immomo/moment/mediautils/h;->m(Lcom/immomo/moment/mediautils/h;)Ljava/lang/String;

    .line 447
    .line 448
    .line 449
    move-result-object v3

    .line 450
    const-string v4, "video"

    .line 451
    .line 452
    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 453
    .line 454
    .line 455
    move-result v3

    .line 456
    if-eqz v3, :cond_f

    .line 457
    .line 458
    iget-object v3, p0, Lcom/immomo/moment/mediautils/h$c;->c:Lcom/immomo/moment/mediautils/h;

    .line 459
    .line 460
    invoke-static {v3}, Lcom/immomo/moment/mediautils/h;->j(Lcom/immomo/moment/mediautils/h;)Landroid/view/Surface;

    .line 461
    .line 462
    .line 463
    move-result-object v3

    .line 464
    if-eqz v3, :cond_f

    .line 465
    .line 466
    iget-object v3, p0, Lcom/immomo/moment/mediautils/h$c;->c:Lcom/immomo/moment/mediautils/h;

    .line 467
    .line 468
    invoke-static {v3, v2}, Lcom/immomo/moment/mediautils/h;->c(Lcom/immomo/moment/mediautils/h;Z)Z

    .line 469
    .line 470
    .line 471
    goto/16 :goto_0

    .line 472
    .line 473
    :cond_f
    iget-object v3, p0, Lcom/immomo/moment/mediautils/h$c;->c:Lcom/immomo/moment/mediautils/h;

    .line 474
    .line 475
    invoke-static {v3}, Lcom/immomo/moment/mediautils/h;->s(Lcom/immomo/moment/mediautils/h;)Z

    .line 476
    .line 477
    .line 478
    goto/16 :goto_0

    .line 479
    .line 480
    :cond_10
    invoke-static {v4}, Lcom/immomo/moment/mediautils/h;->q(Lcom/immomo/moment/mediautils/h;)Lcom/immomo/moment/mediautils/h$b;

    .line 481
    .line 482
    .line 483
    move-result-object v3

    .line 484
    if-eqz v3, :cond_0

    .line 485
    .line 486
    iget-object v3, p0, Lcom/immomo/moment/mediautils/h$c;->c:Lcom/immomo/moment/mediautils/h;

    .line 487
    .line 488
    invoke-static {v3}, Lcom/immomo/moment/mediautils/h;->q(Lcom/immomo/moment/mediautils/h;)Lcom/immomo/moment/mediautils/h$b;

    .line 489
    .line 490
    .line 491
    move-result-object v3

    .line 492
    invoke-interface {v3}, Lcom/immomo/moment/mediautils/h$b;->onCodecIdle()V

    .line 493
    .line 494
    .line 495
    goto/16 :goto_0

    .line 496
    .line 497
    :cond_11
    iget-object v3, p0, Lcom/immomo/moment/mediautils/h$c;->c:Lcom/immomo/moment/mediautils/h;

    .line 498
    .line 499
    invoke-static {v3}, Lcom/immomo/moment/mediautils/h;->r(Lcom/immomo/moment/mediautils/h;)Landroid/media/MediaCodec;

    .line 500
    .line 501
    .line 502
    move-result-object v3

    .line 503
    invoke-virtual {v3}, Landroid/media/MediaCodec;->getOutputFormat()Landroid/media/MediaFormat;

    .line 504
    .line 505
    .line 506
    move-result-object v3

    .line 507
    if-eqz v0, :cond_12

    .line 508
    .line 509
    invoke-direct {p0, v0, v3}, Lcom/immomo/moment/mediautils/h$c;->a(Landroid/media/MediaFormat;Landroid/media/MediaFormat;)Z

    .line 510
    .line 511
    .line 512
    move-result v4

    .line 513
    if-eqz v4, :cond_0

    .line 514
    .line 515
    :cond_12
    iget-object v0, p0, Lcom/immomo/moment/mediautils/h$c;->c:Lcom/immomo/moment/mediautils/h;

    .line 516
    .line 517
    invoke-static {v0}, Lcom/immomo/moment/mediautils/h;->q(Lcom/immomo/moment/mediautils/h;)Lcom/immomo/moment/mediautils/h$b;

    .line 518
    .line 519
    .line 520
    move-result-object v0

    .line 521
    if-eqz v0, :cond_13

    .line 522
    .line 523
    iget-object v0, p0, Lcom/immomo/moment/mediautils/h$c;->c:Lcom/immomo/moment/mediautils/h;

    .line 524
    .line 525
    invoke-static {v0}, Lcom/immomo/moment/mediautils/h;->q(Lcom/immomo/moment/mediautils/h;)Lcom/immomo/moment/mediautils/h$b;

    .line 526
    .line 527
    .line 528
    move-result-object v0

    .line 529
    invoke-interface {v0, v3}, Lcom/immomo/moment/mediautils/h$b;->onFormatChanged(Landroid/media/MediaFormat;)V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_1

    .line 530
    .line 531
    .line 532
    :cond_13
    move-object v0, v3

    .line 533
    goto/16 :goto_0

    .line 534
    .line 535
    :goto_7
    const-string v3, "MedaiCodecWrapper"

    .line 536
    .line 537
    new-instance v4, Ljava/lang/StringBuilder;

    .line 538
    .line 539
    const-string v5, "Codec Exception !!!!!!!!!!!!!!!!! "

    .line 540
    .line 541
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 542
    .line 543
    .line 544
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 545
    .line 546
    .line 547
    move-result-object v5

    .line 548
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 549
    .line 550
    .line 551
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 552
    .line 553
    .line 554
    move-result-object v4

    .line 555
    invoke-static {v3, v4}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 556
    .line 557
    .line 558
    iget-object v3, p0, Lcom/immomo/moment/mediautils/h$c;->c:Lcom/immomo/moment/mediautils/h;

    .line 559
    .line 560
    invoke-static {v3}, Lcom/immomo/moment/mediautils/h;->q(Lcom/immomo/moment/mediautils/h;)Lcom/immomo/moment/mediautils/h$b;

    .line 561
    .line 562
    .line 563
    move-result-object v3

    .line 564
    if-eqz v3, :cond_15

    .line 565
    .line 566
    iget-object v3, p0, Lcom/immomo/moment/mediautils/h$c;->c:Lcom/immomo/moment/mediautils/h;

    .line 567
    .line 568
    invoke-static {v3}, Lcom/immomo/moment/mediautils/h;->a(Lcom/immomo/moment/mediautils/h;)I

    .line 569
    .line 570
    .line 571
    move-result v3

    .line 572
    iget-object v4, p0, Lcom/immomo/moment/mediautils/h$c;->c:Lcom/immomo/moment/mediautils/h;

    .line 573
    .line 574
    if-ne v3, v2, :cond_14

    .line 575
    .line 576
    invoke-static {v4}, Lcom/immomo/moment/mediautils/h;->q(Lcom/immomo/moment/mediautils/h;)Lcom/immomo/moment/mediautils/h$b;

    .line 577
    .line 578
    .line 579
    move-result-object v3

    .line 580
    new-instance v4, Ljava/lang/StringBuilder;

    .line 581
    .line 582
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 583
    .line 584
    .line 585
    invoke-static {v0}, Ll/g8g0;->a(Ljava/lang/Exception;)Ljava/lang/String;

    .line 586
    .line 587
    .line 588
    move-result-object v0

    .line 589
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 590
    .line 591
    .line 592
    const-string v0, " codecStatus"

    .line 593
    .line 594
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 595
    .line 596
    .line 597
    iget-object v0, p0, Lcom/immomo/moment/mediautils/h$c;->c:Lcom/immomo/moment/mediautils/h;

    .line 598
    .line 599
    invoke-static {v0}, Lcom/immomo/moment/mediautils/h;->t(Lcom/immomo/moment/mediautils/h;)I

    .line 600
    .line 601
    .line 602
    move-result v0

    .line 603
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 604
    .line 605
    .line 606
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 607
    .line 608
    .line 609
    move-result-object v0

    .line 610
    const/16 v4, -0x191

    .line 611
    .line 612
    invoke-interface {v3, v4, v1, v0}, Lcom/immomo/moment/mediautils/h$b;->onError(IILjava/lang/String;)V

    .line 613
    .line 614
    .line 615
    goto :goto_8

    .line 616
    :cond_14
    invoke-static {v4}, Lcom/immomo/moment/mediautils/h;->q(Lcom/immomo/moment/mediautils/h;)Lcom/immomo/moment/mediautils/h$b;

    .line 617
    .line 618
    .line 619
    move-result-object v3

    .line 620
    new-instance v4, Ljava/lang/StringBuilder;

    .line 621
    .line 622
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 623
    .line 624
    .line 625
    invoke-static {v0}, Ll/g8g0;->a(Ljava/lang/Exception;)Ljava/lang/String;

    .line 626
    .line 627
    .line 628
    move-result-object v0

    .line 629
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 630
    .line 631
    .line 632
    const-string v0, " codecStatus"

    .line 633
    .line 634
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 635
    .line 636
    .line 637
    iget-object v0, p0, Lcom/immomo/moment/mediautils/h$c;->c:Lcom/immomo/moment/mediautils/h;

    .line 638
    .line 639
    invoke-static {v0}, Lcom/immomo/moment/mediautils/h;->t(Lcom/immomo/moment/mediautils/h;)I

    .line 640
    .line 641
    .line 642
    move-result v0

    .line 643
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 644
    .line 645
    .line 646
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 647
    .line 648
    .line 649
    move-result-object v0

    .line 650
    const/16 v4, -0x192

    .line 651
    .line 652
    invoke-interface {v3, v4, v1, v0}, Lcom/immomo/moment/mediautils/h$b;->onError(IILjava/lang/String;)V

    .line 653
    .line 654
    .line 655
    :cond_15
    :goto_8
    iput-boolean v2, p0, Lcom/immomo/moment/mediautils/h$c;->b:Z

    .line 656
    .line 657
    goto :goto_a

    .line 658
    :goto_9
    :try_start_b
    monitor-exit v1
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    .line 659
    throw p0

    .line 660
    :cond_16
    :goto_a
    iget-object v0, p0, Lcom/immomo/moment/mediautils/h$c;->c:Lcom/immomo/moment/mediautils/h;

    .line 661
    .line 662
    invoke-static {v0, v2}, Lcom/immomo/moment/mediautils/h;->c(Lcom/immomo/moment/mediautils/h;Z)Z

    .line 663
    .line 664
    .line 665
    iget-object v0, p0, Lcom/immomo/moment/mediautils/h$c;->c:Lcom/immomo/moment/mediautils/h;

    .line 666
    .line 667
    invoke-static {v0}, Lcom/immomo/moment/mediautils/h;->q(Lcom/immomo/moment/mediautils/h;)Lcom/immomo/moment/mediautils/h$b;

    .line 668
    .line 669
    .line 670
    move-result-object v0

    .line 671
    if-eqz v0, :cond_17

    .line 672
    .line 673
    iget-boolean v0, p0, Lcom/immomo/moment/mediautils/h$c;->b:Z

    .line 674
    .line 675
    if-nez v0, :cond_17

    .line 676
    .line 677
    iget-object v0, p0, Lcom/immomo/moment/mediautils/h$c;->c:Lcom/immomo/moment/mediautils/h;

    .line 678
    .line 679
    invoke-static {v0}, Lcom/immomo/moment/mediautils/h;->p(Lcom/immomo/moment/mediautils/h;)Z

    .line 680
    .line 681
    .line 682
    move-result v0

    .line 683
    if-nez v0, :cond_17

    .line 684
    .line 685
    iget-object p0, p0, Lcom/immomo/moment/mediautils/h$c;->c:Lcom/immomo/moment/mediautils/h;

    .line 686
    .line 687
    invoke-static {p0}, Lcom/immomo/moment/mediautils/h;->q(Lcom/immomo/moment/mediautils/h;)Lcom/immomo/moment/mediautils/h$b;

    .line 688
    .line 689
    .line 690
    move-result-object p0

    .line 691
    invoke-interface {p0}, Lcom/immomo/moment/mediautils/h$b;->onFinished()V

    .line 692
    .line 693
    .line 694
    :cond_17
    return-void
.end method
