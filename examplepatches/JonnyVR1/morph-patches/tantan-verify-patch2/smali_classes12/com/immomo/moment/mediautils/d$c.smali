.class Lcom/immomo/moment/mediautils/d$c;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/moment/mediautils/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation


# instance fields
.field final synthetic a:Lcom/immomo/moment/mediautils/d;


# direct methods
.method public constructor <init>(Lcom/immomo/moment/mediautils/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/d$c;->a:Lcom/immomo/moment/mediautils/d;

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
    .locals 8

    .line 1
    const/4 v0, 0x1

    .line 2
    :goto_0
    move v1, v0

    .line 3
    :goto_1
    iget-object v2, p0, Lcom/immomo/moment/mediautils/d$c;->a:Lcom/immomo/moment/mediautils/d;

    .line 4
    .line 5
    invoke-static {v2}, Lcom/immomo/moment/mediautils/d;->a(Lcom/immomo/moment/mediautils/d;)Z

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-nez v2, :cond_a

    .line 10
    .line 11
    iget-object v2, p0, Lcom/immomo/moment/mediautils/d$c;->a:Lcom/immomo/moment/mediautils/d;

    .line 12
    .line 13
    invoke-static {v2}, Lcom/immomo/moment/mediautils/d;->b(Lcom/immomo/moment/mediautils/d;)Ljava/util/LinkedList;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v2}, Ljava/util/LinkedList;->size()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    iget-object v3, p0, Lcom/immomo/moment/mediautils/d$c;->a:Lcom/immomo/moment/mediautils/d;

    .line 22
    .line 23
    if-lez v2, :cond_8

    .line 24
    .line 25
    :try_start_0
    invoke-static {v3}, Lcom/immomo/moment/mediautils/d;->c(Lcom/immomo/moment/mediautils/d;)I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    invoke-static {}, Lcom/immomo/moment/mediautils/d;->d()I

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    if-ne v2, v3, :cond_6

    .line 34
    .line 35
    iget-object v2, p0, Lcom/immomo/moment/mediautils/d$c;->a:Lcom/immomo/moment/mediautils/d;

    .line 36
    .line 37
    invoke-static {v2}, Lcom/immomo/moment/mediautils/d;->e(Lcom/immomo/moment/mediautils/d;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    monitor-enter v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 42
    :try_start_1
    iget-object v3, p0, Lcom/immomo/moment/mediautils/d$c;->a:Lcom/immomo/moment/mediautils/d;

    .line 43
    .line 44
    invoke-static {v3}, Lcom/immomo/moment/mediautils/d;->b(Lcom/immomo/moment/mediautils/d;)Ljava/util/LinkedList;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    invoke-virtual {v3}, Ljava/util/LinkedList;->size()I

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    if-lez v3, :cond_5

    .line 53
    .line 54
    iget-object v3, p0, Lcom/immomo/moment/mediautils/d$c;->a:Lcom/immomo/moment/mediautils/d;

    .line 55
    .line 56
    invoke-static {v3}, Lcom/immomo/moment/mediautils/d;->b(Lcom/immomo/moment/mediautils/d;)Ljava/util/LinkedList;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    invoke-virtual {v3}, Ljava/util/LinkedList;->pollFirst()Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    check-cast v3, Ll/ad60;

    .line 65
    .line 66
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 67
    :try_start_2
    iget-object v2, p0, Lcom/immomo/moment/mediautils/d$c;->a:Lcom/immomo/moment/mediautils/d;

    .line 68
    .line 69
    iget-object v2, v2, Lcom/immomo/moment/mediautils/d;->s:Lcom/immomo/moment/mediautils/d$b;

    .line 70
    .line 71
    if-eqz v2, :cond_0

    .line 72
    .line 73
    invoke-virtual {v3}, Ll/ad60;->b()Landroid/media/MediaCodec$BufferInfo;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    if-eqz v2, :cond_0

    .line 78
    .line 79
    iget-object v2, p0, Lcom/immomo/moment/mediautils/d$c;->a:Lcom/immomo/moment/mediautils/d;

    .line 80
    .line 81
    iget-object v2, v2, Lcom/immomo/moment/mediautils/d;->s:Lcom/immomo/moment/mediautils/d$b;

    .line 82
    .line 83
    invoke-virtual {v3}, Ll/ad60;->b()Landroid/media/MediaCodec$BufferInfo;

    .line 84
    .line 85
    .line 86
    move-result-object v4

    .line 87
    iget-wide v4, v4, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 88
    .line 89
    invoke-interface {v2, v4, v5}, Lcom/immomo/moment/mediautils/d$b;->onAudioOriginPosition(J)V

    .line 90
    .line 91
    .line 92
    goto :goto_2

    .line 93
    :catch_0
    move-exception v2

    .line 94
    goto :goto_4

    .line 95
    :cond_0
    :goto_2
    iget-object v2, p0, Lcom/immomo/moment/mediautils/d$c;->a:Lcom/immomo/moment/mediautils/d;

    .line 96
    .line 97
    iget-object v4, v2, Lcom/immomo/moment/mediautils/d;->t:Lcom/immomo/moment/mediautils/d$a;

    .line 98
    .line 99
    if-eqz v4, :cond_1

    .line 100
    .line 101
    invoke-static {v2}, Lcom/immomo/moment/mediautils/d;->b(Lcom/immomo/moment/mediautils/d;)Ljava/util/LinkedList;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    invoke-virtual {v2}, Ljava/util/LinkedList;->size()I

    .line 106
    .line 107
    .line 108
    move-result v2

    .line 109
    invoke-interface {v4, v2}, Lcom/immomo/moment/mediautils/d$a;->onAudioAvailableBufferCount(I)V

    .line 110
    .line 111
    .line 112
    :cond_1
    iget-object v2, p0, Lcom/immomo/moment/mediautils/d$c;->a:Lcom/immomo/moment/mediautils/d;

    .line 113
    .line 114
    invoke-static {v2, v3}, Lcom/immomo/moment/mediautils/d;->f(Lcom/immomo/moment/mediautils/d;Ll/ad60;)Ll/ad60;

    .line 115
    .line 116
    .line 117
    move-result-object v2

    .line 118
    if-nez v2, :cond_2

    .line 119
    .line 120
    goto :goto_1

    .line 121
    :cond_2
    invoke-virtual {v2}, Ll/ad60;->b()Landroid/media/MediaCodec$BufferInfo;

    .line 122
    .line 123
    .line 124
    move-result-object v3

    .line 125
    iget-wide v3, v3, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 126
    .line 127
    iget-object v5, p0, Lcom/immomo/moment/mediautils/d$c;->a:Lcom/immomo/moment/mediautils/d;

    .line 128
    .line 129
    iget-object v5, v5, Lcom/immomo/moment/mediautils/d;->r:Lcom/immomo/moment/mediautils/d$d;

    .line 130
    .line 131
    if-eqz v5, :cond_3

    .line 132
    .line 133
    invoke-interface {v5, v3, v4}, Lcom/immomo/moment/mediautils/d$d;->onAudioPlayingPosition(J)V

    .line 134
    .line 135
    .line 136
    :cond_3
    iget-object v5, p0, Lcom/immomo/moment/mediautils/d$c;->a:Lcom/immomo/moment/mediautils/d;

    .line 137
    .line 138
    invoke-static {v5}, Lcom/immomo/moment/mediautils/d;->g(Lcom/immomo/moment/mediautils/d;)Z

    .line 139
    .line 140
    .line 141
    move-result v5

    .line 142
    if-nez v5, :cond_4

    .line 143
    .line 144
    if-eqz v1, :cond_4

    .line 145
    .line 146
    const/4 v1, 0x0

    .line 147
    iget-object v5, p0, Lcom/immomo/moment/mediautils/d$c;->a:Lcom/immomo/moment/mediautils/d;

    .line 148
    .line 149
    const-wide/16 v6, 0x3e8

    .line 150
    .line 151
    div-long/2addr v3, v6

    .line 152
    invoke-static {v5, v3, v4}, Lcom/immomo/moment/mediautils/d;->h(Lcom/immomo/moment/mediautils/d;J)V

    .line 153
    .line 154
    .line 155
    :cond_4
    iget-object v3, p0, Lcom/immomo/moment/mediautils/d$c;->a:Lcom/immomo/moment/mediautils/d;

    .line 156
    .line 157
    invoke-virtual {v2}, Ll/ad60;->a()Ljava/nio/ByteBuffer;

    .line 158
    .line 159
    .line 160
    move-result-object v4

    .line 161
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->array()[B

    .line 162
    .line 163
    .line 164
    move-result-object v4

    .line 165
    invoke-virtual {v2}, Ll/ad60;->b()Landroid/media/MediaCodec$BufferInfo;

    .line 166
    .line 167
    .line 168
    move-result-object v2

    .line 169
    iget v2, v2, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 170
    .line 171
    invoke-virtual {v3, v4, v2}, Lcom/immomo/moment/mediautils/d;->y([BI)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 172
    .line 173
    .line 174
    goto/16 :goto_1

    .line 175
    .line 176
    :catchall_0
    move-exception v3

    .line 177
    goto :goto_3

    .line 178
    :cond_5
    :try_start_3
    monitor-exit v2

    .line 179
    goto/16 :goto_1

    .line 180
    .line 181
    :goto_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 182
    :try_start_4
    throw v3
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 183
    :cond_6
    const-wide/16 v1, 0x5

    .line 184
    .line 185
    :try_start_5
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_5
    .catch Ljava/lang/InterruptedException; {:try_start_5 .. :try_end_5} :catch_2
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    .line 186
    .line 187
    .line 188
    goto/16 :goto_0

    .line 189
    .line 190
    :catch_1
    move-exception v2

    .line 191
    move v1, v0

    .line 192
    goto :goto_4

    .line 193
    :catch_2
    move-exception v1

    .line 194
    :try_start_6
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1

    .line 195
    .line 196
    .line 197
    goto/16 :goto_0

    .line 198
    .line 199
    :goto_4
    iget-object v3, p0, Lcom/immomo/moment/mediautils/d$c;->a:Lcom/immomo/moment/mediautils/d;

    .line 200
    .line 201
    invoke-static {v3}, Lcom/immomo/moment/mediautils/d;->i(Lcom/immomo/moment/mediautils/d;)Ll/spw;

    .line 202
    .line 203
    .line 204
    move-result-object v3

    .line 205
    if-eqz v3, :cond_7

    .line 206
    .line 207
    iget-object v3, p0, Lcom/immomo/moment/mediautils/d$c;->a:Lcom/immomo/moment/mediautils/d;

    .line 208
    .line 209
    invoke-static {v3}, Lcom/immomo/moment/mediautils/d;->i(Lcom/immomo/moment/mediautils/d;)Ll/spw;

    .line 210
    .line 211
    .line 212
    move-result-object v3

    .line 213
    new-instance v4, Ljava/lang/StringBuilder;

    .line 214
    .line 215
    const-string v5, "Audio Player running failed !!!"

    .line 216
    .line 217
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 218
    .line 219
    .line 220
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object v5

    .line 224
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 225
    .line 226
    .line 227
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 228
    .line 229
    .line 230
    move-result-object v4

    .line 231
    const/16 v5, 0x1774

    .line 232
    .line 233
    invoke-interface {v3, v5, v4}, Ll/spw;->onFail(ILjava/lang/String;)V

    .line 234
    .line 235
    .line 236
    :cond_7
    const-string v3, "AudioPlayer"

    .line 237
    .line 238
    new-instance v4, Ljava/lang/StringBuilder;

    .line 239
    .line 240
    const-string v5, "Audio Player running failed !!!"

    .line 241
    .line 242
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 243
    .line 244
    .line 245
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 246
    .line 247
    .line 248
    move-result-object v2

    .line 249
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 250
    .line 251
    .line 252
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 253
    .line 254
    .line 255
    move-result-object v2

    .line 256
    invoke-static {v3, v2}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 257
    .line 258
    .line 259
    goto/16 :goto_1

    .line 260
    .line 261
    :cond_8
    invoke-static {v3}, Lcom/immomo/moment/mediautils/d;->e(Lcom/immomo/moment/mediautils/d;)Ljava/lang/Object;

    .line 262
    .line 263
    .line 264
    move-result-object v1

    .line 265
    monitor-enter v1

    .line 266
    :try_start_7
    iget-object v2, p0, Lcom/immomo/moment/mediautils/d$c;->a:Lcom/immomo/moment/mediautils/d;

    .line 267
    .line 268
    invoke-static {v2}, Lcom/immomo/moment/mediautils/d;->a(Lcom/immomo/moment/mediautils/d;)Z

    .line 269
    .line 270
    .line 271
    move-result v2

    .line 272
    if-nez v2, :cond_9

    .line 273
    .line 274
    iget-object v2, p0, Lcom/immomo/moment/mediautils/d$c;->a:Lcom/immomo/moment/mediautils/d;

    .line 275
    .line 276
    invoke-static {v2}, Lcom/immomo/moment/mediautils/d;->e(Lcom/immomo/moment/mediautils/d;)Ljava/lang/Object;

    .line 277
    .line 278
    .line 279
    move-result-object v2

    .line 280
    invoke-virtual {v2}, Ljava/lang/Object;->wait()V
    :try_end_7
    .catch Ljava/lang/InterruptedException; {:try_start_7 .. :try_end_7} :catch_3
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 281
    .line 282
    .line 283
    goto :goto_5

    .line 284
    :catchall_1
    move-exception p0

    .line 285
    goto :goto_6

    .line 286
    :catch_3
    move-exception v2

    .line 287
    :try_start_8
    invoke-virtual {v2}, Ljava/lang/Throwable;->printStackTrace()V

    .line 288
    .line 289
    .line 290
    :cond_9
    :goto_5
    monitor-exit v1

    .line 291
    goto/16 :goto_0

    .line 292
    .line 293
    :goto_6
    monitor-exit v1
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 294
    throw p0

    .line 295
    :cond_a
    return-void
.end method
