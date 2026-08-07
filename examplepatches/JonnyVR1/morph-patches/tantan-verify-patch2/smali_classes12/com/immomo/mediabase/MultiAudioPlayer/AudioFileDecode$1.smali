.class Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;


# direct methods
.method public constructor <init>(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

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
    .locals 24

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    iget-object v0, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 4
    .line 5
    iget-object v2, v0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mAudioFormat:Landroid/media/MediaFormat;

    .line 6
    .line 7
    if-eqz v2, :cond_14

    .line 8
    .line 9
    iget v2, v0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mAudioTrackIndex:I

    .line 10
    .line 11
    if-gez v2, :cond_0

    .line 12
    .line 13
    goto/16 :goto_9

    .line 14
    .line 15
    :cond_0
    invoke-static {v0}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->access$100(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)Lcom/immomo/mediabase/AudioParameter;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v2, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 20
    .line 21
    invoke-static {v2}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->access$200(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)Lcom/immomo/mediabase/AudioParameter;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    iget-object v4, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 26
    .line 27
    const/4 v5, 0x1

    .line 28
    const/4 v6, 0x0

    .line 29
    if-eq v0, v2, :cond_1

    .line 30
    .line 31
    new-instance v0, Lcom/immomo/mediabase/AudioResampleUtils;

    .line 32
    .line 33
    invoke-direct {v0}, Lcom/immomo/mediabase/AudioResampleUtils;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-static {v4, v0}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->access$302(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;Lcom/immomo/mediabase/AudioResampleUtils;)Lcom/immomo/mediabase/AudioResampleUtils;

    .line 37
    .line 38
    .line 39
    iget-object v0, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 40
    .line 41
    invoke-static {v0}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->access$300(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)Lcom/immomo/mediabase/AudioResampleUtils;

    .line 42
    .line 43
    .line 44
    move-result-object v7

    .line 45
    iget-object v0, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 46
    .line 47
    invoke-static {v0}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->access$100(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)Lcom/immomo/mediabase/AudioParameter;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0}, Lcom/immomo/mediabase/AudioParameter;->getSamplingRate()I

    .line 52
    .line 53
    .line 54
    move-result v8

    .line 55
    iget-object v0, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 56
    .line 57
    invoke-static {v0}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->access$100(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)Lcom/immomo/mediabase/AudioParameter;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {v0}, Lcom/immomo/mediabase/AudioParameter;->getNumChannels()I

    .line 62
    .line 63
    .line 64
    move-result v9

    .line 65
    iget-object v0, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 66
    .line 67
    invoke-static {v0}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->access$100(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)Lcom/immomo/mediabase/AudioParameter;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {v0}, Lcom/immomo/mediabase/AudioParameter;->getSampleBits()I

    .line 72
    .line 73
    .line 74
    move-result v10

    .line 75
    iget-object v0, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 76
    .line 77
    invoke-static {v0}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->access$200(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)Lcom/immomo/mediabase/AudioParameter;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-virtual {v0}, Lcom/immomo/mediabase/AudioParameter;->getSamplingRate()I

    .line 82
    .line 83
    .line 84
    move-result v11

    .line 85
    iget-object v0, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 86
    .line 87
    invoke-static {v0}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->access$200(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)Lcom/immomo/mediabase/AudioParameter;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {v0}, Lcom/immomo/mediabase/AudioParameter;->getNumChannels()I

    .line 92
    .line 93
    .line 94
    move-result v12

    .line 95
    iget-object v0, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 96
    .line 97
    invoke-static {v0}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->access$200(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)Lcom/immomo/mediabase/AudioParameter;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-virtual {v0}, Lcom/immomo/mediabase/AudioParameter;->getSampleBits()I

    .line 102
    .line 103
    .line 104
    move-result v13

    .line 105
    invoke-virtual/range {v7 .. v13}, Lcom/immomo/mediabase/AudioResampleUtils;->initResampleInfo(IIIIII)I

    .line 106
    .line 107
    .line 108
    iget-object v0, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 109
    .line 110
    invoke-static {v0, v5}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->access$402(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;Z)Z

    .line 111
    .line 112
    .line 113
    iget-object v0, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 114
    .line 115
    invoke-static {v0}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->access$000(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecodeListener;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    if-eqz v0, :cond_2

    .line 120
    .line 121
    iget-object v0, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 122
    .line 123
    invoke-static {v0}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->access$000(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecodeListener;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    iget-object v2, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 128
    .line 129
    invoke-static {v2}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->access$100(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)Lcom/immomo/mediabase/AudioParameter;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    iget-object v4, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 134
    .line 135
    invoke-static {v4}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->access$200(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)Lcom/immomo/mediabase/AudioParameter;

    .line 136
    .line 137
    .line 138
    move-result-object v4

    .line 139
    iget-object v7, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 140
    .line 141
    invoke-interface {v0, v2, v4, v7}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecodeListener;->onResampleOpen(Lcom/immomo/mediabase/AudioParameter;Lcom/immomo/mediabase/AudioParameter;Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)V

    .line 142
    .line 143
    .line 144
    goto :goto_0

    .line 145
    :cond_1
    invoke-static {v4, v6}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->access$402(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;Z)Z

    .line 146
    .line 147
    .line 148
    :cond_2
    :goto_0
    iget-object v0, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 149
    .line 150
    iget-object v2, v0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mExtractor:Landroid/media/MediaExtractor;

    .line 151
    .line 152
    iget v0, v0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mAudioTrackIndex:I

    .line 153
    .line 154
    invoke-virtual {v2, v0}, Landroid/media/MediaExtractor;->selectTrack(I)V

    .line 155
    .line 156
    .line 157
    const/4 v2, 0x0

    .line 158
    :try_start_0
    iget-object v0, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 159
    .line 160
    iget-object v0, v0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mAudioFormat:Landroid/media/MediaFormat;

    .line 161
    .line 162
    const-string v4, "mime"

    .line 163
    .line 164
    invoke-virtual {v0, v4}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    invoke-static {v0}, Landroid/media/MediaCodec;->createDecoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    .line 169
    .line 170
    .line 171
    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 172
    move-object v7, v0

    .line 173
    goto :goto_1

    .line 174
    :catch_0
    move-exception v0

    .line 175
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 176
    .line 177
    .line 178
    move-object v7, v2

    .line 179
    :goto_1
    iget-object v0, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 180
    .line 181
    iget-object v0, v0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mAudioFormat:Landroid/media/MediaFormat;

    .line 182
    .line 183
    invoke-virtual {v7, v0, v2, v2, v6}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 184
    .line 185
    .line 186
    invoke-virtual {v7}, Landroid/media/MediaCodec;->start()V

    .line 187
    .line 188
    .line 189
    invoke-virtual {v7}, Landroid/media/MediaCodec;->getInputBuffers()[Ljava/nio/ByteBuffer;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    invoke-virtual {v7}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    .line 194
    .line 195
    .line 196
    move-result-object v2

    .line 197
    new-instance v4, Landroid/media/MediaCodec$BufferInfo;

    .line 198
    .line 199
    invoke-direct {v4}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    .line 200
    .line 201
    .line 202
    iget-object v8, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 203
    .line 204
    invoke-static {v8}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->access$500(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)J

    .line 205
    .line 206
    .line 207
    move-result-wide v8

    .line 208
    const-wide/16 v14, 0x0

    .line 209
    .line 210
    cmp-long v8, v8, v14

    .line 211
    .line 212
    if-lez v8, :cond_3

    .line 213
    .line 214
    iget-object v8, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 215
    .line 216
    invoke-static {v8}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->access$500(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)J

    .line 217
    .line 218
    .line 219
    move-result-wide v8

    .line 220
    cmp-long v8, v14, v8

    .line 221
    .line 222
    if-gez v8, :cond_3

    .line 223
    .line 224
    iget-object v8, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 225
    .line 226
    invoke-static {v8}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->access$500(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)J

    .line 227
    .line 228
    .line 229
    move-result-wide v9

    .line 230
    invoke-static {v8, v9, v10}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->access$600(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;J)J

    .line 231
    .line 232
    .line 233
    move-result-wide v8

    .line 234
    goto :goto_2

    .line 235
    :cond_3
    move-wide v8, v14

    .line 236
    :goto_2
    iget-object v10, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 237
    .line 238
    invoke-static {v10}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->access$500(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)J

    .line 239
    .line 240
    .line 241
    move-result-wide v10

    .line 242
    cmp-long v10, v10, v14

    .line 243
    .line 244
    const-string v11, "AudioFileDecode"

    .line 245
    .line 246
    const/4 v12, -0x3

    .line 247
    if-lez v10, :cond_5

    .line 248
    .line 249
    iget-object v10, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 250
    .line 251
    invoke-static {v10}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->access$500(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)J

    .line 252
    .line 253
    .line 254
    move-result-wide v16

    .line 255
    cmp-long v10, v8, v16

    .line 256
    .line 257
    if-gez v10, :cond_5

    .line 258
    .line 259
    iget-object v0, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 260
    .line 261
    invoke-static {v0}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->access$000(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecodeListener;

    .line 262
    .line 263
    .line 264
    move-result-object v0

    .line 265
    if-eqz v0, :cond_4

    .line 266
    .line 267
    iget-object v0, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 268
    .line 269
    invoke-static {v0}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->access$000(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecodeListener;

    .line 270
    .line 271
    .line 272
    move-result-object v0

    .line 273
    iget-object v2, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 274
    .line 275
    invoke-interface {v0, v12, v2}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecodeListener;->onDecoderError(ILcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)V

    .line 276
    .line 277
    .line 278
    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 279
    .line 280
    const-string v2, "SEEK Error SEEK to "

    .line 281
    .line 282
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 283
    .line 284
    .line 285
    iget-object v2, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 286
    .line 287
    invoke-static {v2}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->access$500(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)J

    .line 288
    .line 289
    .line 290
    move-result-wide v2

    .line 291
    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 292
    .line 293
    .line 294
    const-string v2, " currentPos:"

    .line 295
    .line 296
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 297
    .line 298
    .line 299
    invoke-virtual {v0, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 300
    .line 301
    .line 302
    const-string v2, ", duration:"

    .line 303
    .line 304
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 305
    .line 306
    .line 307
    iget-object v1, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 308
    .line 309
    iget-wide v1, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mAudioDuration:J

    .line 310
    .line 311
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 312
    .line 313
    .line 314
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 315
    .line 316
    .line 317
    move-result-object v0

    .line 318
    invoke-static {v11, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 319
    .line 320
    .line 321
    return-void

    .line 322
    :cond_5
    iget-object v8, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 323
    .line 324
    invoke-static {v8}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->access$700(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)Ljava/util/concurrent/LinkedBlockingQueue;

    .line 325
    .line 326
    .line 327
    move-result-object v8

    .line 328
    invoke-virtual {v8}, Ljava/util/concurrent/LinkedBlockingQueue;->clear()V

    .line 329
    .line 330
    .line 331
    iget-object v8, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 332
    .line 333
    sget-object v9, Lcom/immomo/mediabase/MultiAudioPlayer/PLAYSTATUS;->PLAY:Lcom/immomo/mediabase/MultiAudioPlayer/PLAYSTATUS;

    .line 334
    .line 335
    invoke-static {v8, v9}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->access$802(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;Lcom/immomo/mediabase/MultiAudioPlayer/PLAYSTATUS;)Lcom/immomo/mediabase/MultiAudioPlayer/PLAYSTATUS;

    .line 336
    .line 337
    .line 338
    move v8, v6

    .line 339
    :goto_3
    iget-object v9, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 340
    .line 341
    invoke-static {v9}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->access$900(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)Z

    .line 342
    .line 343
    .line 344
    move-result v9

    .line 345
    if-nez v9, :cond_13

    .line 346
    .line 347
    iget-object v9, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 348
    .line 349
    invoke-static {v9}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->access$1000(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)J

    .line 350
    .line 351
    .line 352
    move-result-wide v9

    .line 353
    cmp-long v9, v9, v14

    .line 354
    .line 355
    if-lez v9, :cond_6

    .line 356
    .line 357
    iget-object v9, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 358
    .line 359
    invoke-static {v9}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->access$1000(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)J

    .line 360
    .line 361
    .line 362
    move-result-wide v16

    .line 363
    const-wide/16 v18, 0x3e8

    .line 364
    .line 365
    mul-long v12, v16, v18

    .line 366
    .line 367
    invoke-static {v9, v12, v13}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->access$600(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;J)J

    .line 368
    .line 369
    .line 370
    iget-object v9, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 371
    .line 372
    invoke-static {v9}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->access$700(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)Ljava/util/concurrent/LinkedBlockingQueue;

    .line 373
    .line 374
    .line 375
    move-result-object v9

    .line 376
    invoke-virtual {v9}, Ljava/util/concurrent/LinkedBlockingQueue;->clear()V

    .line 377
    .line 378
    .line 379
    iget-object v9, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 380
    .line 381
    invoke-static {v9, v14, v15}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->access$1002(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;J)J

    .line 382
    .line 383
    .line 384
    :cond_6
    const/16 v16, 0x4

    .line 385
    .line 386
    const-wide/16 v12, 0x1388

    .line 387
    .line 388
    move v9, v8

    .line 389
    if-nez v8, :cond_b

    .line 390
    .line 391
    invoke-virtual {v7, v12, v13}, Landroid/media/MediaCodec;->dequeueInputBuffer(J)I

    .line 392
    .line 393
    .line 394
    move-result v8

    .line 395
    if-ltz v8, :cond_b

    .line 396
    .line 397
    aget-object v10, v0, v8

    .line 398
    .line 399
    iget-object v12, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 400
    .line 401
    iget-object v12, v12, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mExtractor:Landroid/media/MediaExtractor;

    .line 402
    .line 403
    invoke-virtual {v12, v10, v6}, Landroid/media/MediaExtractor;->readSampleData(Ljava/nio/ByteBuffer;I)I

    .line 404
    .line 405
    .line 406
    move-result v10

    .line 407
    if-gez v10, :cond_7

    .line 408
    .line 409
    move/from16 v20, v5

    .line 410
    .line 411
    move v10, v6

    .line 412
    move-wide v12, v14

    .line 413
    goto :goto_4

    .line 414
    :cond_7
    iget-object v12, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 415
    .line 416
    iget-object v12, v12, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mExtractor:Landroid/media/MediaExtractor;

    .line 417
    .line 418
    invoke-virtual {v12}, Landroid/media/MediaExtractor;->getSampleTime()J

    .line 419
    .line 420
    .line 421
    move-result-wide v12

    .line 422
    move/from16 v20, v9

    .line 423
    .line 424
    :goto_4
    if-nez v20, :cond_8

    .line 425
    .line 426
    iget-object v9, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 427
    .line 428
    invoke-static {v9}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->access$500(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)J

    .line 429
    .line 430
    .line 431
    move-result-wide v21

    .line 432
    cmp-long v9, v12, v21

    .line 433
    .line 434
    if-gez v9, :cond_8

    .line 435
    .line 436
    iget-object v8, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 437
    .line 438
    iget-object v8, v8, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mExtractor:Landroid/media/MediaExtractor;

    .line 439
    .line 440
    invoke-virtual {v8}, Landroid/media/MediaExtractor;->advance()Z

    .line 441
    .line 442
    .line 443
    move/from16 v8, v20

    .line 444
    .line 445
    const/4 v12, -0x3

    .line 446
    goto :goto_3

    .line 447
    :cond_8
    move-object v9, v11

    .line 448
    move-wide v11, v12

    .line 449
    if-eqz v20, :cond_9

    .line 450
    .line 451
    move/from16 v13, v16

    .line 452
    .line 453
    goto :goto_5

    .line 454
    :cond_9
    move v13, v6

    .line 455
    :goto_5
    const/16 v21, 0x0

    .line 456
    .line 457
    move-object v3, v9

    .line 458
    move-wide/from16 v22, v14

    .line 459
    .line 460
    move/from16 v9, v21

    .line 461
    .line 462
    const-wide/16 v14, 0x1388

    .line 463
    .line 464
    invoke-virtual/range {v7 .. v13}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 465
    .line 466
    .line 467
    if-nez v20, :cond_a

    .line 468
    .line 469
    iget-object v8, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 470
    .line 471
    iget-object v8, v8, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->mExtractor:Landroid/media/MediaExtractor;

    .line 472
    .line 473
    invoke-virtual {v8}, Landroid/media/MediaExtractor;->advance()Z

    .line 474
    .line 475
    .line 476
    :cond_a
    move/from16 v8, v20

    .line 477
    .line 478
    goto :goto_6

    .line 479
    :cond_b
    move-object v3, v11

    .line 480
    move-wide/from16 v22, v14

    .line 481
    .line 482
    move-wide v14, v12

    .line 483
    move v8, v9

    .line 484
    :goto_6
    invoke-virtual {v7, v4, v14, v15}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    .line 485
    .line 486
    .line 487
    move-result v9

    .line 488
    if-ltz v9, :cond_f

    .line 489
    .line 490
    aget-object v10, v2, v9

    .line 491
    .line 492
    iget v11, v4, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 493
    .line 494
    if-lez v11, :cond_d

    .line 495
    .line 496
    invoke-static {v11}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 497
    .line 498
    .line 499
    move-result-object v11

    .line 500
    invoke-virtual {v11}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 501
    .line 502
    .line 503
    iget v12, v4, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 504
    .line 505
    invoke-virtual {v10, v12}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 506
    .line 507
    .line 508
    invoke-virtual {v11}, Ljava/nio/ByteBuffer;->array()[B

    .line 509
    .line 510
    .line 511
    move-result-object v12

    .line 512
    iget v13, v4, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 513
    .line 514
    invoke-virtual {v10, v12, v6, v13}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 515
    .line 516
    .line 517
    iget-object v10, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 518
    .line 519
    invoke-static {v10}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->access$400(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)Z

    .line 520
    .line 521
    .line 522
    move-result v10

    .line 523
    if-eqz v10, :cond_c

    .line 524
    .line 525
    iget-object v10, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 526
    .line 527
    invoke-static {v10}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->access$300(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)Lcom/immomo/mediabase/AudioResampleUtils;

    .line 528
    .line 529
    .line 530
    move-result-object v10

    .line 531
    if-eqz v10, :cond_c

    .line 532
    .line 533
    invoke-virtual {v11}, Ljava/nio/Buffer;->limit()I

    .line 534
    .line 535
    .line 536
    move-result v10

    .line 537
    mul-int/lit8 v10, v10, 0x8

    .line 538
    .line 539
    iget-object v12, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 540
    .line 541
    invoke-static {v12}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->access$100(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)Lcom/immomo/mediabase/AudioParameter;

    .line 542
    .line 543
    .line 544
    move-result-object v12

    .line 545
    invoke-virtual {v12}, Lcom/immomo/mediabase/AudioParameter;->getSampleBits()I

    .line 546
    .line 547
    .line 548
    move-result v12

    .line 549
    div-int/2addr v10, v12

    .line 550
    iget-object v12, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 551
    .line 552
    invoke-static {v12}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->access$100(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)Lcom/immomo/mediabase/AudioParameter;

    .line 553
    .line 554
    .line 555
    move-result-object v12

    .line 556
    invoke-virtual {v12}, Lcom/immomo/mediabase/AudioParameter;->getNumChannels()I

    .line 557
    .line 558
    .line 559
    move-result v12

    .line 560
    div-int/2addr v10, v12

    .line 561
    iget-object v12, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 562
    .line 563
    invoke-static {v12}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->access$300(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)Lcom/immomo/mediabase/AudioResampleUtils;

    .line 564
    .line 565
    .line 566
    move-result-object v12

    .line 567
    invoke-virtual {v11}, Ljava/nio/ByteBuffer;->array()[B

    .line 568
    .line 569
    .line 570
    move-result-object v11

    .line 571
    invoke-virtual {v12, v11, v10}, Lcom/immomo/mediabase/AudioResampleUtils;->resamplePcmData([BI)Ljava/nio/ByteBuffer;

    .line 572
    .line 573
    .line 574
    move-result-object v11

    .line 575
    :cond_c
    iget-object v10, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 576
    .line 577
    invoke-virtual {v10, v11, v4}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->putSampleData(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V

    .line 578
    .line 579
    .line 580
    iget-object v10, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 581
    .line 582
    invoke-static {v10}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->access$1100(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)J

    .line 583
    .line 584
    .line 585
    move-result-wide v10

    .line 586
    cmp-long v10, v10, v22

    .line 587
    .line 588
    if-lez v10, :cond_d

    .line 589
    .line 590
    iget-wide v10, v4, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 591
    .line 592
    iget-object v12, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 593
    .line 594
    invoke-static {v12}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->access$1100(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)J

    .line 595
    .line 596
    .line 597
    move-result-wide v12

    .line 598
    cmp-long v10, v10, v12

    .line 599
    .line 600
    if-lez v10, :cond_d

    .line 601
    .line 602
    new-instance v0, Ljava/lang/StringBuilder;

    .line 603
    .line 604
    const-string v2, "audioDecoder \u505c\u6b62\u89e3\u7801\uff1a\u622a\u6b62\u65f6\u95f4\uff1a"

    .line 605
    .line 606
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 607
    .line 608
    .line 609
    iget-object v2, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 610
    .line 611
    invoke-static {v2}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->access$1100(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)J

    .line 612
    .line 613
    .line 614
    move-result-wide v5

    .line 615
    invoke-virtual {v0, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 616
    .line 617
    .line 618
    const-string v2, "\u5f53\u524d\u89e3\u7801\u65f6\u95f4\uff1a"

    .line 619
    .line 620
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 621
    .line 622
    .line 623
    iget-wide v4, v4, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 624
    .line 625
    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 626
    .line 627
    .line 628
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 629
    .line 630
    .line 631
    move-result-object v0

    .line 632
    invoke-static {v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 633
    .line 634
    .line 635
    goto/16 :goto_8

    .line 636
    .line 637
    :cond_d
    invoke-virtual {v7, v9, v6}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 638
    .line 639
    .line 640
    iget v9, v4, Landroid/media/MediaCodec$BufferInfo;->flags:I

    .line 641
    .line 642
    and-int/lit8 v9, v9, 0x4

    .line 643
    .line 644
    if-eqz v9, :cond_e

    .line 645
    .line 646
    iget-object v0, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 647
    .line 648
    invoke-static {v0, v5}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->access$1202(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;Z)Z

    .line 649
    .line 650
    .line 651
    iget-object v0, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 652
    .line 653
    invoke-static {v0}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->access$000(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecodeListener;

    .line 654
    .line 655
    .line 656
    move-result-object v0

    .line 657
    if-eqz v0, :cond_13

    .line 658
    .line 659
    iget-object v0, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 660
    .line 661
    invoke-static {v0}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->access$000(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecodeListener;

    .line 662
    .line 663
    .line 664
    move-result-object v0

    .line 665
    iget-object v2, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 666
    .line 667
    invoke-interface {v0, v2}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecodeListener;->onDecodeFinished(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)V

    .line 668
    .line 669
    .line 670
    goto :goto_8

    .line 671
    :cond_e
    const/4 v10, -0x3

    .line 672
    goto :goto_7

    .line 673
    :cond_f
    const/4 v10, -0x3

    .line 674
    if-ne v9, v10, :cond_10

    .line 675
    .line 676
    invoke-virtual {v7}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    .line 677
    .line 678
    .line 679
    move-result-object v2

    .line 680
    goto :goto_7

    .line 681
    :cond_10
    const/4 v11, -0x2

    .line 682
    if-ne v9, v11, :cond_12

    .line 683
    .line 684
    invoke-virtual {v7}, Landroid/media/MediaCodec;->getOutputFormat()Landroid/media/MediaFormat;

    .line 685
    .line 686
    .line 687
    move-result-object v9

    .line 688
    iget-object v11, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 689
    .line 690
    invoke-static {v11}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->access$100(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)Lcom/immomo/mediabase/AudioParameter;

    .line 691
    .line 692
    .line 693
    move-result-object v11

    .line 694
    const-string v12, "channel-count"

    .line 695
    .line 696
    invoke-virtual {v9, v12}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 697
    .line 698
    .line 699
    move-result v12

    .line 700
    invoke-virtual {v11, v12}, Lcom/immomo/mediabase/AudioParameter;->setNumChannels(I)V

    .line 701
    .line 702
    .line 703
    iget-object v11, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 704
    .line 705
    invoke-static {v11}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->access$100(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)Lcom/immomo/mediabase/AudioParameter;

    .line 706
    .line 707
    .line 708
    move-result-object v11

    .line 709
    const-string v12, "sample-rate"

    .line 710
    .line 711
    invoke-virtual {v9, v12}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 712
    .line 713
    .line 714
    move-result v12

    .line 715
    invoke-virtual {v11, v12}, Lcom/immomo/mediabase/AudioParameter;->setSamplingRate(I)V

    .line 716
    .line 717
    .line 718
    iget-object v11, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 719
    .line 720
    invoke-static {v11}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->access$000(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecodeListener;

    .line 721
    .line 722
    .line 723
    move-result-object v11

    .line 724
    if-eqz v11, :cond_11

    .line 725
    .line 726
    iget-object v11, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 727
    .line 728
    invoke-static {v11}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->access$000(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecodeListener;

    .line 729
    .line 730
    .line 731
    move-result-object v11

    .line 732
    iget-object v12, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 733
    .line 734
    invoke-interface {v11, v9, v12}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecodeListener;->onForamtChange(Landroid/media/MediaFormat;Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)V

    .line 735
    .line 736
    .line 737
    :cond_11
    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 738
    .line 739
    .line 740
    :cond_12
    :goto_7
    move-object v11, v3

    .line 741
    move v12, v10

    .line 742
    move-wide/from16 v14, v22

    .line 743
    .line 744
    goto/16 :goto_3

    .line 745
    .line 746
    :cond_13
    :goto_8
    invoke-virtual {v7}, Landroid/media/MediaCodec;->flush()V

    .line 747
    .line 748
    .line 749
    invoke-virtual {v7}, Landroid/media/MediaCodec;->release()V

    .line 750
    .line 751
    .line 752
    iget-object v0, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 753
    .line 754
    sget-object v1, Lcom/immomo/mediabase/MultiAudioPlayer/PLAYSTATUS;->STOP:Lcom/immomo/mediabase/MultiAudioPlayer/PLAYSTATUS;

    .line 755
    .line 756
    invoke-static {v0, v1}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->access$802(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;Lcom/immomo/mediabase/MultiAudioPlayer/PLAYSTATUS;)Lcom/immomo/mediabase/MultiAudioPlayer/PLAYSTATUS;

    .line 757
    .line 758
    .line 759
    return-void

    .line 760
    :cond_14
    :goto_9
    invoke-static {v0}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->access$000(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecodeListener;

    .line 761
    .line 762
    .line 763
    move-result-object v0

    .line 764
    if-eqz v0, :cond_15

    .line 765
    .line 766
    iget-object v0, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 767
    .line 768
    invoke-static {v0}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->access$000(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecodeListener;

    .line 769
    .line 770
    .line 771
    move-result-object v0

    .line 772
    iget-object v1, v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode$1;->this$0:Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 773
    .line 774
    const/4 v11, -0x2

    .line 775
    invoke-interface {v0, v11, v1}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecodeListener;->onDecoderError(ILcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)V

    .line 776
    .line 777
    .line 778
    :cond_15
    return-void
.end method
