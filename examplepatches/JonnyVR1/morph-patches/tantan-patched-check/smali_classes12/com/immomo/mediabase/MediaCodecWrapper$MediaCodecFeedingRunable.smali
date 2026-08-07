.class Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecFeedingRunable;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/mediabase/MediaCodecWrapper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "MediaCodecFeedingRunable"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/immomo/mediabase/MediaCodecWrapper;


# direct methods
.method public constructor <init>(Lcom/immomo/mediabase/MediaCodecWrapper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecFeedingRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private checkPauseFeeding()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecFeedingRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$000(Lcom/immomo/mediabase/MediaCodecWrapper;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    iget-object v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecFeedingRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 9
    .line 10
    invoke-static {v1}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$100(Lcom/immomo/mediabase/MediaCodecWrapper;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecFeedingRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 17
    .line 18
    invoke-static {p0}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$000(Lcom/immomo/mediabase/MediaCodecWrapper;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 23
    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    monitor-exit v0

    .line 27
    return p0

    .line 28
    :catchall_0
    move-exception p0

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const/4 p0, 0x0

    .line 31
    monitor-exit v0

    .line 32
    return p0

    .line 33
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    throw p0
.end method

.method private waitms(J)V
    .locals 0

    .line 1
    :try_start_0
    invoke-static {p1, p2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    return-void

    .line 5
    :catch_0
    move-exception p0

    .line 6
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public run()V
    .locals 15

    .line 1
    new-instance v0, Landroid/media/MediaCodec$BufferInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, -0x1

    .line 7
    iput v1, v0, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 8
    .line 9
    iget-object v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecFeedingRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 10
    .line 11
    invoke-static {v1}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$200(Lcom/immomo/mediabase/MediaCodecWrapper;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const-string v2, "video"

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    const/high16 v1, 0x100000

    .line 24
    .line 25
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const/high16 v1, 0x80000

    .line 31
    .line 32
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    :goto_0
    const/4 v2, 0x1

    .line 37
    :goto_1
    move v3, v2

    .line 38
    :cond_1
    :goto_2
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    .line 39
    .line 40
    .line 41
    move-result v4

    .line 42
    if-nez v4, :cond_a

    .line 43
    .line 44
    iget-object v4, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecFeedingRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 45
    .line 46
    invoke-static {v4}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$300(Lcom/immomo/mediabase/MediaCodecWrapper;)Z

    .line 47
    .line 48
    .line 49
    move-result v4

    .line 50
    if-nez v4, :cond_a

    .line 51
    .line 52
    invoke-direct {p0}, Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecFeedingRunable;->checkPauseFeeding()Z

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    iget-object v5, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecFeedingRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 57
    .line 58
    if-eqz v4, :cond_2

    .line 59
    .line 60
    invoke-static {v5, v2}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$402(Lcom/immomo/mediabase/MediaCodecWrapper;Z)Z

    .line 61
    .line 62
    .line 63
    const-wide/16 v4, 0x1

    .line 64
    .line 65
    invoke-direct {p0, v4, v5}, Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecFeedingRunable;->waitms(J)V

    .line 66
    .line 67
    .line 68
    goto :goto_2

    .line 69
    :cond_2
    const/4 v4, 0x0

    .line 70
    :try_start_0
    invoke-static {v5}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$500(Lcom/immomo/mediabase/MediaCodecWrapper;)Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecStatusListener;

    .line 71
    .line 72
    .line 73
    move-result-object v5

    .line 74
    const-wide/16 v6, 0x5

    .line 75
    .line 76
    if-eqz v5, :cond_8

    .line 77
    .line 78
    if-eqz v3, :cond_4

    .line 79
    .line 80
    invoke-virtual {v1, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 81
    .line 82
    .line 83
    iget-object v5, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecFeedingRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 84
    .line 85
    invoke-static {v5}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$500(Lcom/immomo/mediabase/MediaCodecWrapper;)Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecStatusListener;

    .line 86
    .line 87
    .line 88
    move-result-object v5

    .line 89
    invoke-interface {v5, v1, v0}, Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecStatusListener;->onFeedingData(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)Z

    .line 90
    .line 91
    .line 92
    move-result v5

    .line 93
    if-nez v5, :cond_3

    .line 94
    .line 95
    invoke-direct {p0, v6, v7}, Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecFeedingRunable;->waitms(J)V

    .line 96
    .line 97
    .line 98
    goto :goto_2

    .line 99
    :catch_0
    move-exception v0

    .line 100
    goto/16 :goto_3

    .line 101
    .line 102
    :cond_3
    move v3, v4

    .line 103
    :cond_4
    iget-object v5, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecFeedingRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 104
    .line 105
    invoke-static {v5}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$600(Lcom/immomo/mediabase/MediaCodecWrapper;)[Ljava/nio/ByteBuffer;

    .line 106
    .line 107
    .line 108
    move-result-object v5

    .line 109
    if-nez v5, :cond_5

    .line 110
    .line 111
    iget-object v5, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecFeedingRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 112
    .line 113
    invoke-static {v5}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$700(Lcom/immomo/mediabase/MediaCodecWrapper;)Landroid/media/MediaCodec;

    .line 114
    .line 115
    .line 116
    move-result-object v6

    .line 117
    invoke-virtual {v6}, Landroid/media/MediaCodec;->getInputBuffers()[Ljava/nio/ByteBuffer;

    .line 118
    .line 119
    .line 120
    move-result-object v6

    .line 121
    invoke-static {v5, v6}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$602(Lcom/immomo/mediabase/MediaCodecWrapper;[Ljava/nio/ByteBuffer;)[Ljava/nio/ByteBuffer;

    .line 122
    .line 123
    .line 124
    :cond_5
    iget-object v5, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecFeedingRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 125
    .line 126
    invoke-static {v5}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$700(Lcom/immomo/mediabase/MediaCodecWrapper;)Landroid/media/MediaCodec;

    .line 127
    .line 128
    .line 129
    move-result-object v5

    .line 130
    const-wide/16 v6, 0x2710

    .line 131
    .line 132
    invoke-virtual {v5, v6, v7}, Landroid/media/MediaCodec;->dequeueInputBuffer(J)I

    .line 133
    .line 134
    .line 135
    move-result v9

    .line 136
    if-ltz v9, :cond_1

    .line 137
    .line 138
    iget v3, v0, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 139
    .line 140
    if-lez v3, :cond_6

    .line 141
    .line 142
    iget-object v3, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecFeedingRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 143
    .line 144
    invoke-static {v3}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$600(Lcom/immomo/mediabase/MediaCodecWrapper;)[Ljava/nio/ByteBuffer;

    .line 145
    .line 146
    .line 147
    move-result-object v3

    .line 148
    aget-object v3, v3, v9

    .line 149
    .line 150
    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 151
    .line 152
    .line 153
    iget-object v3, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecFeedingRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 154
    .line 155
    invoke-static {v3}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$600(Lcom/immomo/mediabase/MediaCodecWrapper;)[Ljava/nio/ByteBuffer;

    .line 156
    .line 157
    .line 158
    move-result-object v3

    .line 159
    aget-object v3, v3, v9

    .line 160
    .line 161
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    .line 162
    .line 163
    .line 164
    move-result-object v5

    .line 165
    iget v6, v0, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 166
    .line 167
    invoke-virtual {v3, v5, v4, v6}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 168
    .line 169
    .line 170
    iget-object v3, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecFeedingRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 171
    .line 172
    invoke-static {v3}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$700(Lcom/immomo/mediabase/MediaCodecWrapper;)Landroid/media/MediaCodec;

    .line 173
    .line 174
    .line 175
    move-result-object v8

    .line 176
    iget v11, v0, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 177
    .line 178
    iget-wide v12, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 179
    .line 180
    const/4 v14, 0x0

    .line 181
    const/4 v10, 0x0

    .line 182
    invoke-virtual/range {v8 .. v14}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 183
    .line 184
    .line 185
    goto/16 :goto_1

    .line 186
    .line 187
    :cond_6
    iget-object v5, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecFeedingRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 188
    .line 189
    if-nez v3, :cond_7

    .line 190
    .line 191
    :try_start_1
    invoke-static {v5}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$700(Lcom/immomo/mediabase/MediaCodecWrapper;)Landroid/media/MediaCodec;

    .line 192
    .line 193
    .line 194
    move-result-object v8

    .line 195
    const-wide/16 v12, 0x0

    .line 196
    .line 197
    const/4 v14, 0x4

    .line 198
    const/4 v10, 0x0

    .line 199
    const/4 v11, 0x0

    .line 200
    invoke-virtual/range {v8 .. v14}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 201
    .line 202
    .line 203
    iget-object v3, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecFeedingRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 204
    .line 205
    invoke-static {v3, v4}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$802(Lcom/immomo/mediabase/MediaCodecWrapper;Z)Z

    .line 206
    .line 207
    .line 208
    goto/16 :goto_1

    .line 209
    .line 210
    :cond_7
    invoke-static {v5}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$700(Lcom/immomo/mediabase/MediaCodecWrapper;)Landroid/media/MediaCodec;

    .line 211
    .line 212
    .line 213
    move-result-object v8

    .line 214
    const-wide/16 v12, 0x0

    .line 215
    .line 216
    const/4 v14, 0x4

    .line 217
    const/4 v10, 0x0

    .line 218
    const/4 v11, 0x0

    .line 219
    invoke-virtual/range {v8 .. v14}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 220
    .line 221
    .line 222
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecFeedingRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 223
    .line 224
    invoke-static {v0, v2}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$802(Lcom/immomo/mediabase/MediaCodecWrapper;Z)Z

    .line 225
    .line 226
    .line 227
    goto :goto_4

    .line 228
    :cond_8
    invoke-direct {p0, v6, v7}, Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecFeedingRunable;->waitms(J)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 229
    .line 230
    .line 231
    goto/16 :goto_2

    .line 232
    .line 233
    :goto_3
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 234
    .line 235
    .line 236
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecFeedingRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 237
    .line 238
    invoke-static {v0}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$500(Lcom/immomo/mediabase/MediaCodecWrapper;)Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecStatusListener;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    if-eqz v0, :cond_a

    .line 243
    .line 244
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecFeedingRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 245
    .line 246
    invoke-static {v0}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$900(Lcom/immomo/mediabase/MediaCodecWrapper;)I

    .line 247
    .line 248
    .line 249
    move-result v0

    .line 250
    iget-object v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecFeedingRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 251
    .line 252
    const/4 v3, 0x0

    .line 253
    if-ne v0, v2, :cond_9

    .line 254
    .line 255
    invoke-static {v1}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$500(Lcom/immomo/mediabase/MediaCodecWrapper;)Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecStatusListener;

    .line 256
    .line 257
    .line 258
    move-result-object v0

    .line 259
    const/16 v1, -0x191

    .line 260
    .line 261
    invoke-interface {v0, v1, v4, v3}, Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecStatusListener;->onError(IILjava/lang/String;)V

    .line 262
    .line 263
    .line 264
    goto :goto_4

    .line 265
    :cond_9
    invoke-static {v1}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$500(Lcom/immomo/mediabase/MediaCodecWrapper;)Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecStatusListener;

    .line 266
    .line 267
    .line 268
    move-result-object v0

    .line 269
    const/16 v1, -0x192

    .line 270
    .line 271
    invoke-interface {v0, v1, v4, v3}, Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecStatusListener;->onError(IILjava/lang/String;)V

    .line 272
    .line 273
    .line 274
    :cond_a
    :goto_4
    iget-object p0, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecFeedingRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 275
    .line 276
    invoke-static {p0, v2}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$302(Lcom/immomo/mediabase/MediaCodecWrapper;Z)Z

    .line 277
    .line 278
    .line 279
    return-void
.end method
