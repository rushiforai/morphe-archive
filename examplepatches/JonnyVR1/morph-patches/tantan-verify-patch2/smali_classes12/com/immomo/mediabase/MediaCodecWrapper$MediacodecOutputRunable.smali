.class Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;
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
    name = "MediacodecOutputRunable"
.end annotation


# instance fields
.field errorOcurr:Z

.field private mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

.field needWaitFrameProcessComplete:Z

.field final synthetic this$0:Lcom/immomo/mediabase/MediaCodecWrapper;


# direct methods
.method public constructor <init>(Lcom/immomo/mediabase/MediaCodecWrapper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

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
    iput-object p1, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    iput-boolean p1, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->errorOcurr:Z

    .line 15
    .line 16
    iput-boolean p1, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->needWaitFrameProcessComplete:Z

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 1
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$1000(Lcom/immomo/mediabase/MediaCodecWrapper;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-nez v0, :cond_15

    .line 9
    .line 10
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_15

    .line 15
    .line 16
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$1100(Lcom/immomo/mediabase/MediaCodecWrapper;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    monitor-enter v0

    .line 23
    :try_start_0
    iget-object v2, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 24
    .line 25
    invoke-static {v2}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$1200(Lcom/immomo/mediabase/MediaCodecWrapper;)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    const/4 v3, 0x0

    .line 30
    if-eqz v2, :cond_1

    .line 31
    .line 32
    iget-object v2, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 33
    .line 34
    invoke-static {v2, v1}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$1302(Lcom/immomo/mediabase/MediaCodecWrapper;Z)Z

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 38
    .line 39
    invoke-static {v1}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$1100(Lcom/immomo/mediabase/MediaCodecWrapper;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 44
    .line 45
    .line 46
    iput-boolean v3, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->needWaitFrameProcessComplete:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 47
    .line 48
    const-wide/16 v1, 0x1

    .line 49
    .line 50
    :try_start_1
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 51
    .line 52
    .line 53
    goto :goto_1

    .line 54
    :catchall_0
    move-exception p0

    .line 55
    goto/16 :goto_8

    .line 56
    .line 57
    :catch_0
    move-exception v1

    .line 58
    :try_start_2
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 59
    .line 60
    .line 61
    :goto_1
    monitor-exit v0

    .line 62
    goto :goto_0

    .line 63
    :cond_1
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 64
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 65
    .line 66
    invoke-static {v0}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$1400(Lcom/immomo/mediabase/MediaCodecWrapper;)Z

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 70
    .line 71
    invoke-static {v0}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$1500(Lcom/immomo/mediabase/MediaCodecWrapper;)Lcom/immomo/mediabase/MediaCodecWrapper$OnTextureRenderStatusListener;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    if-eqz v0, :cond_3

    .line 76
    .line 77
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 78
    .line 79
    invoke-static {v0}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$900(Lcom/immomo/mediabase/MediaCodecWrapper;)I

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-ne v0, v1, :cond_3

    .line 84
    .line 85
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 86
    .line 87
    invoke-static {v0}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$1600(Lcom/immomo/mediabase/MediaCodecWrapper;)Landroid/view/Surface;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    if-eqz v0, :cond_3

    .line 92
    .line 93
    iget-boolean v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->needWaitFrameProcessComplete:Z

    .line 94
    .line 95
    if-eqz v0, :cond_3

    .line 96
    .line 97
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 98
    .line 99
    invoke-static {v0}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$1500(Lcom/immomo/mediabase/MediaCodecWrapper;)Lcom/immomo/mediabase/MediaCodecWrapper$OnTextureRenderStatusListener;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-interface {v0}, Lcom/immomo/mediabase/MediaCodecWrapper$OnTextureRenderStatusListener;->getTextureRenderStatus()I

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    if-lez v0, :cond_2

    .line 108
    .line 109
    const-wide/16 v0, 0x2

    .line 110
    .line 111
    :try_start_3
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_1

    .line 112
    .line 113
    .line 114
    goto :goto_0

    .line 115
    :catch_1
    move-exception v0

    .line 116
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 117
    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_2
    iput-boolean v3, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->needWaitFrameProcessComplete:Z

    .line 121
    .line 122
    :cond_3
    :try_start_4
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 123
    .line 124
    iput v3, v0, Landroid/media/MediaCodec$BufferInfo;->flags:I

    .line 125
    .line 126
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 127
    .line 128
    invoke-static {v0}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$200(Lcom/immomo/mediabase/MediaCodecWrapper;)Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    const-string v2, "audio"

    .line 133
    .line 134
    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 135
    .line 136
    .line 137
    move-result v0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    .line 138
    iget-object v2, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 139
    .line 140
    if-eqz v0, :cond_4

    .line 141
    .line 142
    :try_start_5
    invoke-static {v2}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$700(Lcom/immomo/mediabase/MediaCodecWrapper;)Landroid/media/MediaCodec;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    iget-object v2, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 147
    .line 148
    const-wide/16 v4, 0x3e8

    .line 149
    .line 150
    invoke-virtual {v0, v2, v4, v5}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    .line 151
    .line 152
    .line 153
    move-result v0

    .line 154
    goto :goto_2

    .line 155
    :catch_2
    move-exception v0

    .line 156
    goto/16 :goto_6

    .line 157
    .line 158
    :cond_4
    invoke-static {v2}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$700(Lcom/immomo/mediabase/MediaCodecWrapper;)Landroid/media/MediaCodec;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    iget-object v2, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 163
    .line 164
    const-wide/16 v4, 0x2710

    .line 165
    .line 166
    invoke-virtual {v0, v2, v4, v5}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    .line 167
    .line 168
    .line 169
    move-result v0
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    .line 170
    :goto_2
    const/4 v2, -0x3

    .line 171
    if-eq v0, v2, :cond_0

    .line 172
    .line 173
    const/4 v2, -0x2

    .line 174
    if-eq v0, v2, :cond_12

    .line 175
    .line 176
    iget-object v2, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 177
    .line 178
    const/4 v4, -0x1

    .line 179
    if-eq v0, v4, :cond_11

    .line 180
    .line 181
    :try_start_6
    invoke-static {v2}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$1700(Lcom/immomo/mediabase/MediaCodecWrapper;)[Ljava/nio/ByteBuffer;

    .line 182
    .line 183
    .line 184
    move-result-object v2

    .line 185
    if-nez v2, :cond_5

    .line 186
    .line 187
    iget-object v2, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 188
    .line 189
    invoke-static {v2}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$700(Lcom/immomo/mediabase/MediaCodecWrapper;)Landroid/media/MediaCodec;

    .line 190
    .line 191
    .line 192
    move-result-object v4

    .line 193
    invoke-virtual {v4}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    .line 194
    .line 195
    .line 196
    move-result-object v4

    .line 197
    invoke-static {v2, v4}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$1702(Lcom/immomo/mediabase/MediaCodecWrapper;[Ljava/nio/ByteBuffer;)[Ljava/nio/ByteBuffer;

    .line 198
    .line 199
    .line 200
    :cond_5
    iget-object v2, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 201
    .line 202
    invoke-static {v2}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$900(Lcom/immomo/mediabase/MediaCodecWrapper;)I

    .line 203
    .line 204
    .line 205
    move-result v2
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2

    .line 206
    iget-object v4, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 207
    .line 208
    if-ne v2, v1, :cond_b

    .line 209
    .line 210
    :try_start_7
    invoke-static {v4}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$1600(Lcom/immomo/mediabase/MediaCodecWrapper;)Landroid/view/Surface;

    .line 211
    .line 212
    .line 213
    move-result-object v2

    .line 214
    if-nez v2, :cond_7

    .line 215
    .line 216
    iget-object v2, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 217
    .line 218
    invoke-static {v2}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$500(Lcom/immomo/mediabase/MediaCodecWrapper;)Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecStatusListener;

    .line 219
    .line 220
    .line 221
    move-result-object v2

    .line 222
    if-eqz v2, :cond_6

    .line 223
    .line 224
    iget-object v2, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 225
    .line 226
    invoke-static {v2}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$500(Lcom/immomo/mediabase/MediaCodecWrapper;)Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecStatusListener;

    .line 227
    .line 228
    .line 229
    move-result-object v2

    .line 230
    iget-object v4, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 231
    .line 232
    invoke-static {v4}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$1700(Lcom/immomo/mediabase/MediaCodecWrapper;)[Ljava/nio/ByteBuffer;

    .line 233
    .line 234
    .line 235
    move-result-object v4

    .line 236
    aget-object v4, v4, v0

    .line 237
    .line 238
    iget-object v5, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 239
    .line 240
    invoke-interface {v2, v4, v5}, Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecStatusListener;->onDataOutput(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V

    .line 241
    .line 242
    .line 243
    :cond_6
    iget-object v2, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 244
    .line 245
    invoke-static {v2}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$700(Lcom/immomo/mediabase/MediaCodecWrapper;)Landroid/media/MediaCodec;

    .line 246
    .line 247
    .line 248
    move-result-object v2

    .line 249
    invoke-virtual {v2, v0, v3}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 250
    .line 251
    .line 252
    iget-object v2, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 253
    .line 254
    invoke-static {v2}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$200(Lcom/immomo/mediabase/MediaCodecWrapper;)Ljava/lang/String;

    .line 255
    .line 256
    .line 257
    move-result-object v2

    .line 258
    const-string v4, "audio"

    .line 259
    .line 260
    invoke-virtual {v2, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 261
    .line 262
    .line 263
    move-result v2

    .line 264
    if-eqz v2, :cond_d

    .line 265
    .line 266
    iget-object v2, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 267
    .line 268
    invoke-static {v2}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$1700(Lcom/immomo/mediabase/MediaCodecWrapper;)[Ljava/nio/ByteBuffer;

    .line 269
    .line 270
    .line 271
    move-result-object v2

    .line 272
    aget-object v0, v2, v0

    .line 273
    .line 274
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 275
    .line 276
    .line 277
    goto/16 :goto_4

    .line 278
    .line 279
    :cond_7
    iget-object v2, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 280
    .line 281
    iget v2, v2, Landroid/media/MediaCodec$BufferInfo;->size:I
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_2

    .line 282
    .line 283
    iget-object v4, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 284
    .line 285
    if-lez v2, :cond_a

    .line 286
    .line 287
    :try_start_8
    invoke-static {v4}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$1800(Lcom/immomo/mediabase/MediaCodecWrapper;)Lcom/immomo/mediabase/MediaCodecWrapper$DecodecCodecStatusListener;

    .line 288
    .line 289
    .line 290
    move-result-object v2

    .line 291
    if-eqz v2, :cond_8

    .line 292
    .line 293
    iget-object v2, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 294
    .line 295
    invoke-static {v2}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$1800(Lcom/immomo/mediabase/MediaCodecWrapper;)Lcom/immomo/mediabase/MediaCodecWrapper$DecodecCodecStatusListener;

    .line 296
    .line 297
    .line 298
    move-result-object v2

    .line 299
    iget-object v4, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 300
    .line 301
    invoke-interface {v2, v4}, Lcom/immomo/mediabase/MediaCodecWrapper$DecodecCodecStatusListener;->onStartRendingImageToTexture(Landroid/media/MediaCodec$BufferInfo;)Z

    .line 302
    .line 303
    .line 304
    move-result v2

    .line 305
    goto :goto_3

    .line 306
    :cond_8
    move v2, v1

    .line 307
    :goto_3
    iget-object v4, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 308
    .line 309
    invoke-static {v4}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$700(Lcom/immomo/mediabase/MediaCodecWrapper;)Landroid/media/MediaCodec;

    .line 310
    .line 311
    .line 312
    move-result-object v4

    .line 313
    invoke-virtual {v4, v0, v2}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 314
    .line 315
    .line 316
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 317
    .line 318
    .line 319
    iget-object v2, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 320
    .line 321
    invoke-static {v2}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$500(Lcom/immomo/mediabase/MediaCodecWrapper;)Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecStatusListener;

    .line 322
    .line 323
    .line 324
    move-result-object v2

    .line 325
    if-eqz v2, :cond_9

    .line 326
    .line 327
    iget-object v2, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 328
    .line 329
    invoke-static {v2}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$500(Lcom/immomo/mediabase/MediaCodecWrapper;)Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecStatusListener;

    .line 330
    .line 331
    .line 332
    move-result-object v2

    .line 333
    iget-object v4, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 334
    .line 335
    invoke-static {v4}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$1700(Lcom/immomo/mediabase/MediaCodecWrapper;)[Ljava/nio/ByteBuffer;

    .line 336
    .line 337
    .line 338
    move-result-object v4

    .line 339
    aget-object v0, v4, v0

    .line 340
    .line 341
    iget-object v4, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 342
    .line 343
    invoke-interface {v2, v0, v4}, Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecStatusListener;->onDataOutput(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V

    .line 344
    .line 345
    .line 346
    :cond_9
    iput-boolean v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->needWaitFrameProcessComplete:Z

    .line 347
    .line 348
    goto :goto_4

    .line 349
    :cond_a
    invoke-static {v4}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$700(Lcom/immomo/mediabase/MediaCodecWrapper;)Landroid/media/MediaCodec;

    .line 350
    .line 351
    .line 352
    move-result-object v2

    .line 353
    invoke-virtual {v2, v0, v3}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 354
    .line 355
    .line 356
    goto :goto_4

    .line 357
    :cond_b
    invoke-static {v4}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$900(Lcom/immomo/mediabase/MediaCodecWrapper;)I

    .line 358
    .line 359
    .line 360
    move-result v2

    .line 361
    if-nez v2, :cond_d

    .line 362
    .line 363
    iget-object v2, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 364
    .line 365
    iget v4, v2, Landroid/media/MediaCodec$BufferInfo;->flags:I

    .line 366
    .line 367
    const/4 v5, 0x2

    .line 368
    if-eq v4, v5, :cond_c

    .line 369
    .line 370
    iget v2, v2, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 371
    .line 372
    if-eqz v2, :cond_c

    .line 373
    .line 374
    iget-object v2, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 375
    .line 376
    invoke-static {v2}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$500(Lcom/immomo/mediabase/MediaCodecWrapper;)Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecStatusListener;

    .line 377
    .line 378
    .line 379
    move-result-object v2

    .line 380
    if-eqz v2, :cond_c

    .line 381
    .line 382
    iget-object v2, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 383
    .line 384
    invoke-static {v2}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$500(Lcom/immomo/mediabase/MediaCodecWrapper;)Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecStatusListener;

    .line 385
    .line 386
    .line 387
    move-result-object v2

    .line 388
    iget-object v4, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 389
    .line 390
    invoke-static {v4}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$1700(Lcom/immomo/mediabase/MediaCodecWrapper;)[Ljava/nio/ByteBuffer;

    .line 391
    .line 392
    .line 393
    move-result-object v4

    .line 394
    aget-object v4, v4, v0

    .line 395
    .line 396
    iget-object v5, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 397
    .line 398
    invoke-interface {v2, v4, v5}, Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecStatusListener;->onDataOutput(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V

    .line 399
    .line 400
    .line 401
    :cond_c
    iget-object v2, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 402
    .line 403
    invoke-static {v2}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$700(Lcom/immomo/mediabase/MediaCodecWrapper;)Landroid/media/MediaCodec;

    .line 404
    .line 405
    .line 406
    move-result-object v2

    .line 407
    invoke-virtual {v2, v0, v3}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 408
    .line 409
    .line 410
    :cond_d
    :goto_4
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 411
    .line 412
    iget v0, v0, Landroid/media/MediaCodec$BufferInfo;->flags:I

    .line 413
    .line 414
    and-int/lit8 v0, v0, 0x4

    .line 415
    .line 416
    if-eqz v0, :cond_0

    .line 417
    .line 418
    const-string v0, "MedaiCodecWrapper"

    .line 419
    .line 420
    new-instance v2, Ljava/lang/StringBuilder;

    .line 421
    .line 422
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 423
    .line 424
    .line 425
    const-string v4, "OutputBuffer BUFFER_FLAG_END_OF_STREAM medai type "

    .line 426
    .line 427
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 428
    .line 429
    .line 430
    iget-object v4, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 431
    .line 432
    invoke-static {v4}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$200(Lcom/immomo/mediabase/MediaCodecWrapper;)Ljava/lang/String;

    .line 433
    .line 434
    .line 435
    move-result-object v4

    .line 436
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 437
    .line 438
    .line 439
    const-string v4, " coder "

    .line 440
    .line 441
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 442
    .line 443
    .line 444
    iget-object v4, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 445
    .line 446
    invoke-static {v4}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$900(Lcom/immomo/mediabase/MediaCodecWrapper;)I

    .line 447
    .line 448
    .line 449
    move-result v4

    .line 450
    if-ne v4, v1, :cond_e

    .line 451
    .line 452
    const-string v4, " decoder "

    .line 453
    .line 454
    goto :goto_5

    .line 455
    :cond_e
    const-string v4, " encoder "

    .line 456
    .line 457
    :goto_5
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 458
    .line 459
    .line 460
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 461
    .line 462
    .line 463
    move-result-object v2

    .line 464
    invoke-static {v0, v2}, Lcom/immomo/mediabase/Log4Cam;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 465
    .line 466
    .line 467
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 468
    .line 469
    invoke-static {v0}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$1900(Lcom/immomo/mediabase/MediaCodecWrapper;)Lcom/immomo/mediabase/MediaCodecWrapper$OnMediaDataComplete;

    .line 470
    .line 471
    .line 472
    move-result-object v0

    .line 473
    if-eqz v0, :cond_f

    .line 474
    .line 475
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 476
    .line 477
    invoke-static {v0}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$1900(Lcom/immomo/mediabase/MediaCodecWrapper;)Lcom/immomo/mediabase/MediaCodecWrapper$OnMediaDataComplete;

    .line 478
    .line 479
    .line 480
    move-result-object v0

    .line 481
    invoke-interface {v0}, Lcom/immomo/mediabase/MediaCodecWrapper$OnMediaDataComplete;->onComplete()V

    .line 482
    .line 483
    .line 484
    :cond_f
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 485
    .line 486
    invoke-static {v0}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$900(Lcom/immomo/mediabase/MediaCodecWrapper;)I

    .line 487
    .line 488
    .line 489
    move-result v0

    .line 490
    if-nez v0, :cond_10

    .line 491
    .line 492
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 493
    .line 494
    invoke-static {v0}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$200(Lcom/immomo/mediabase/MediaCodecWrapper;)Ljava/lang/String;

    .line 495
    .line 496
    .line 497
    move-result-object v0

    .line 498
    const-string v2, "video"

    .line 499
    .line 500
    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 501
    .line 502
    .line 503
    move-result v0

    .line 504
    if-eqz v0, :cond_10

    .line 505
    .line 506
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 507
    .line 508
    invoke-static {v0}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$1600(Lcom/immomo/mediabase/MediaCodecWrapper;)Landroid/view/Surface;

    .line 509
    .line 510
    .line 511
    move-result-object v0

    .line 512
    if-eqz v0, :cond_10

    .line 513
    .line 514
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 515
    .line 516
    invoke-static {v0, v1}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$1002(Lcom/immomo/mediabase/MediaCodecWrapper;Z)Z

    .line 517
    .line 518
    .line 519
    goto/16 :goto_0

    .line 520
    .line 521
    :cond_10
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 522
    .line 523
    invoke-static {v0}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$800(Lcom/immomo/mediabase/MediaCodecWrapper;)Z

    .line 524
    .line 525
    .line 526
    goto/16 :goto_0

    .line 527
    .line 528
    :cond_11
    invoke-static {v2}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$500(Lcom/immomo/mediabase/MediaCodecWrapper;)Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecStatusListener;

    .line 529
    .line 530
    .line 531
    move-result-object v0

    .line 532
    if-eqz v0, :cond_0

    .line 533
    .line 534
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 535
    .line 536
    invoke-static {v0}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$500(Lcom/immomo/mediabase/MediaCodecWrapper;)Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecStatusListener;

    .line 537
    .line 538
    .line 539
    move-result-object v0

    .line 540
    invoke-interface {v0}, Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecStatusListener;->onCodecIdle()V

    .line 541
    .line 542
    .line 543
    goto/16 :goto_0

    .line 544
    .line 545
    :cond_12
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 546
    .line 547
    invoke-static {v0}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$500(Lcom/immomo/mediabase/MediaCodecWrapper;)Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecStatusListener;

    .line 548
    .line 549
    .line 550
    move-result-object v0

    .line 551
    if-eqz v0, :cond_0

    .line 552
    .line 553
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 554
    .line 555
    invoke-static {v0}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$500(Lcom/immomo/mediabase/MediaCodecWrapper;)Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecStatusListener;

    .line 556
    .line 557
    .line 558
    move-result-object v0

    .line 559
    iget-object v2, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 560
    .line 561
    invoke-static {v2}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$700(Lcom/immomo/mediabase/MediaCodecWrapper;)Landroid/media/MediaCodec;

    .line 562
    .line 563
    .line 564
    move-result-object v2

    .line 565
    invoke-virtual {v2}, Landroid/media/MediaCodec;->getOutputFormat()Landroid/media/MediaFormat;

    .line 566
    .line 567
    .line 568
    move-result-object v2

    .line 569
    invoke-interface {v0, v2}, Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecStatusListener;->onFormatChanged(Landroid/media/MediaFormat;)V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_2

    .line 570
    .line 571
    .line 572
    goto/16 :goto_0

    .line 573
    .line 574
    :goto_6
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 575
    .line 576
    .line 577
    const-string v0, "MedaiCodecWrapper"

    .line 578
    .line 579
    const-string v2, "Codec Exception !!!!!!!!!!!!!!!!!"

    .line 580
    .line 581
    invoke-static {v0, v2}, Lcom/immomo/mediabase/Log4Cam;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 582
    .line 583
    .line 584
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 585
    .line 586
    invoke-static {v0}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$500(Lcom/immomo/mediabase/MediaCodecWrapper;)Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecStatusListener;

    .line 587
    .line 588
    .line 589
    move-result-object v0

    .line 590
    if-eqz v0, :cond_14

    .line 591
    .line 592
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 593
    .line 594
    invoke-static {v0}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$900(Lcom/immomo/mediabase/MediaCodecWrapper;)I

    .line 595
    .line 596
    .line 597
    move-result v0

    .line 598
    iget-object v2, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 599
    .line 600
    const/4 v4, 0x0

    .line 601
    if-ne v0, v1, :cond_13

    .line 602
    .line 603
    invoke-static {v2}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$500(Lcom/immomo/mediabase/MediaCodecWrapper;)Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecStatusListener;

    .line 604
    .line 605
    .line 606
    move-result-object v0

    .line 607
    const/16 v2, -0x191

    .line 608
    .line 609
    invoke-interface {v0, v2, v3, v4}, Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecStatusListener;->onError(IILjava/lang/String;)V

    .line 610
    .line 611
    .line 612
    goto :goto_7

    .line 613
    :cond_13
    invoke-static {v2}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$500(Lcom/immomo/mediabase/MediaCodecWrapper;)Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecStatusListener;

    .line 614
    .line 615
    .line 616
    move-result-object v0

    .line 617
    const/16 v2, -0x192

    .line 618
    .line 619
    invoke-interface {v0, v2, v3, v4}, Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecStatusListener;->onError(IILjava/lang/String;)V

    .line 620
    .line 621
    .line 622
    :cond_14
    :goto_7
    iput-boolean v1, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->errorOcurr:Z

    .line 623
    .line 624
    goto :goto_9

    .line 625
    :goto_8
    :try_start_9
    monitor-exit v0
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 626
    throw p0

    .line 627
    :cond_15
    :goto_9
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 628
    .line 629
    invoke-static {v0, v1}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$1002(Lcom/immomo/mediabase/MediaCodecWrapper;Z)Z

    .line 630
    .line 631
    .line 632
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 633
    .line 634
    invoke-static {v0}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$500(Lcom/immomo/mediabase/MediaCodecWrapper;)Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecStatusListener;

    .line 635
    .line 636
    .line 637
    move-result-object v0

    .line 638
    if-eqz v0, :cond_16

    .line 639
    .line 640
    iget-boolean v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->errorOcurr:Z

    .line 641
    .line 642
    if-nez v0, :cond_16

    .line 643
    .line 644
    iget-object v0, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 645
    .line 646
    invoke-static {v0}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$2000(Lcom/immomo/mediabase/MediaCodecWrapper;)Z

    .line 647
    .line 648
    .line 649
    move-result v0

    .line 650
    if-nez v0, :cond_16

    .line 651
    .line 652
    iget-object p0, p0, Lcom/immomo/mediabase/MediaCodecWrapper$MediacodecOutputRunable;->this$0:Lcom/immomo/mediabase/MediaCodecWrapper;

    .line 653
    .line 654
    invoke-static {p0}, Lcom/immomo/mediabase/MediaCodecWrapper;->access$500(Lcom/immomo/mediabase/MediaCodecWrapper;)Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecStatusListener;

    .line 655
    .line 656
    .line 657
    move-result-object p0

    .line 658
    invoke-interface {p0}, Lcom/immomo/mediabase/MediaCodecWrapper$MediaCodecStatusListener;->onFinished()V

    .line 659
    .line 660
    .line 661
    :cond_16
    return-void
.end method
