.class public Lcom/tencent/rtmp/sharp/jni/AudioDecoder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/rtmp/sharp/jni/AudioDecoder$OnProgressListener;,
        Lcom/tencent/rtmp/sharp/jni/AudioDecoder$OnCompleteListener;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "AudioDecoder"


# instance fields
.field IsTenFramesReady:Z

.field channels:I

.field private codeOver:Z

.field private decRingBuffer:Lcom/tencent/rtmp/sharp/jni/RingBuffer;

.field private decodeBufferInfo:Landroid/media/MediaCodec$BufferInfo;

.field private decodeInputBuffers:[Ljava/nio/ByteBuffer;

.field private decodeOutputBuffers:[Ljava/nio/ByteBuffer;

.field private fileTotalMs:J

.field m_nIndex:I

.field private mediaDecode:Landroid/media/MediaCodec;

.field private mediaExtractor:Landroid/media/MediaExtractor;

.field nFirstThreeFrameInfo:I

.field nFrameSize:I

.field private onCompleteListener:Lcom/tencent/rtmp/sharp/jni/AudioDecoder$OnCompleteListener;

.field private onProgressListener:Lcom/tencent/rtmp/sharp/jni/AudioDecoder$OnProgressListener;

.field sampleRate:I

.field private srcPath:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->mediaDecode:Landroid/media/MediaCodec;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->mediaExtractor:Landroid/media/MediaExtractor;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->decodeInputBuffers:[Ljava/nio/ByteBuffer;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->decodeOutputBuffers:[Ljava/nio/ByteBuffer;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->decodeBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 14
    .line 15
    iput-object v0, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->onCompleteListener:Lcom/tencent/rtmp/sharp/jni/AudioDecoder$OnCompleteListener;

    .line 16
    .line 17
    iput-object v0, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->onProgressListener:Lcom/tencent/rtmp/sharp/jni/AudioDecoder$OnProgressListener;

    .line 18
    .line 19
    const-wide/16 v1, 0x0

    .line 20
    .line 21
    iput-wide v1, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->fileTotalMs:J

    .line 22
    .line 23
    iput-object v0, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->decRingBuffer:Lcom/tencent/rtmp/sharp/jni/RingBuffer;

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    iput v0, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->sampleRate:I

    .line 27
    .line 28
    iput v0, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->channels:I

    .line 29
    .line 30
    const/16 v1, 0xf00

    .line 31
    .line 32
    iput v1, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->nFrameSize:I

    .line 33
    .line 34
    iput-boolean v0, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->IsTenFramesReady:Z

    .line 35
    .line 36
    const/4 v1, 0x3

    .line 37
    iput v1, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->nFirstThreeFrameInfo:I

    .line 38
    .line 39
    iput v0, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->m_nIndex:I

    .line 40
    .line 41
    const/4 v0, 0x1

    .line 42
    iput-boolean v0, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->codeOver:Z

    .line 43
    .line 44
    return-void
.end method

.method private initMediaDecode(I)I
    .locals 12

    .line 1
    const-string v0, "AudioDecoder"

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    const/4 v2, 0x1

    .line 5
    :try_start_0
    new-instance v3, Landroid/media/MediaExtractor;

    .line 6
    .line 7
    invoke-direct {v3}, Landroid/media/MediaExtractor;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v3, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->mediaExtractor:Landroid/media/MediaExtractor;

    .line 11
    .line 12
    iget-object v4, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->srcPath:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v3, v4}, Landroid/media/MediaExtractor;->setDataSource(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iget-object v3, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->mediaExtractor:Landroid/media/MediaExtractor;

    .line 18
    .line 19
    invoke-virtual {v3}, Landroid/media/MediaExtractor;->getTrackCount()I

    .line 20
    .line 21
    .line 22
    move-result v3
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 23
    const/4 v4, 0x2

    .line 24
    const-string v5, "TRAE"

    .line 25
    .line 26
    const-string v6, "m_nIndex: "

    .line 27
    .line 28
    if-le v3, v2, :cond_1

    .line 29
    .line 30
    :try_start_1
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-eqz p1, :cond_0

    .line 35
    .line 36
    new-instance p1, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    invoke-direct {p1, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    iget v3, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->m_nIndex:I

    .line 42
    .line 43
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string v3, " initMediaDecode mediaExtractor container video, getTrackCount: "

    .line 47
    .line 48
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    iget-object v3, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->mediaExtractor:Landroid/media/MediaExtractor;

    .line 52
    .line 53
    invoke-virtual {v3}, Landroid/media/MediaExtractor;->getTrackCount()I

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-static {v5, v4, p1}, Lcom/tencent/rtmp/sharp/jni/QLog;->w(Ljava/lang/String;ILjava/lang/String;)V

    .line 65
    .line 66
    .line 67
    goto :goto_0

    .line 68
    :catch_0
    move-exception p1

    .line 69
    goto/16 :goto_3

    .line 70
    .line 71
    :cond_0
    :goto_0
    iput-boolean v2, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->codeOver:Z

    .line 72
    .line 73
    const/4 p0, -0x2

    .line 74
    return p0

    .line 75
    :cond_1
    const/4 v3, 0x0

    .line 76
    move v7, v3

    .line 77
    :goto_1
    iget-object v8, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->mediaExtractor:Landroid/media/MediaExtractor;

    .line 78
    .line 79
    invoke-virtual {v8}, Landroid/media/MediaExtractor;->getTrackCount()I

    .line 80
    .line 81
    .line 82
    move-result v8

    .line 83
    if-ge v7, v8, :cond_4

    .line 84
    .line 85
    iget-object v8, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->mediaExtractor:Landroid/media/MediaExtractor;

    .line 86
    .line 87
    invoke-virtual {v8, v7}, Landroid/media/MediaExtractor;->getTrackFormat(I)Landroid/media/MediaFormat;

    .line 88
    .line 89
    .line 90
    move-result-object v8

    .line 91
    const-string v9, "mime"

    .line 92
    .line 93
    invoke-virtual {v8, v9}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v9

    .line 97
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 98
    .line 99
    .line 100
    move-result v10

    .line 101
    if-eqz v10, :cond_2

    .line 102
    .line 103
    new-instance v10, Ljava/lang/StringBuilder;

    .line 104
    .line 105
    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    iget v11, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->m_nIndex:I

    .line 112
    .line 113
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    const-string v11, " initMediaDecode mediaExtractor audio type:"

    .line 117
    .line 118
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v10

    .line 128
    invoke-static {v5, v4, v10}, Lcom/tencent/rtmp/sharp/jni/QLog;->w(Ljava/lang/String;ILjava/lang/String;)V

    .line 129
    .line 130
    .line 131
    :cond_2
    const-string v10, "audio/mpeg"

    .line 132
    .line 133
    invoke-virtual {v9, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 134
    .line 135
    .line 136
    move-result v10

    .line 137
    if-eqz v10, :cond_3

    .line 138
    .line 139
    iget-object v10, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->mediaExtractor:Landroid/media/MediaExtractor;

    .line 140
    .line 141
    invoke-virtual {v10, v7}, Landroid/media/MediaExtractor;->selectTrack(I)V

    .line 142
    .line 143
    .line 144
    invoke-static {v9}, Landroid/media/MediaCodec;->createDecoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    .line 145
    .line 146
    .line 147
    move-result-object v7

    .line 148
    iput-object v7, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->mediaDecode:Landroid/media/MediaCodec;

    .line 149
    .line 150
    const/4 v9, 0x0

    .line 151
    invoke-virtual {v7, v8, v9, v9, v3}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 152
    .line 153
    .line 154
    const-string v7, "sample-rate"

    .line 155
    .line 156
    invoke-virtual {v8, v7}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 157
    .line 158
    .line 159
    move-result v7

    .line 160
    iput v7, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->sampleRate:I

    .line 161
    .line 162
    const-string v7, "channel-count"

    .line 163
    .line 164
    invoke-virtual {v8, v7}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 165
    .line 166
    .line 167
    move-result v7

    .line 168
    iput v7, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->channels:I

    .line 169
    .line 170
    const-string v7, "durationUs"

    .line 171
    .line 172
    invoke-virtual {v8, v7}, Landroid/media/MediaFormat;->getLong(Ljava/lang/String;)J

    .line 173
    .line 174
    .line 175
    move-result-wide v7

    .line 176
    const-wide/16 v9, 0x3e8

    .line 177
    .line 178
    div-long/2addr v7, v9

    .line 179
    iput-wide v7, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->fileTotalMs:J

    .line 180
    .line 181
    iget v7, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->sampleRate:I

    .line 182
    .line 183
    iget v8, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->channels:I

    .line 184
    .line 185
    mul-int/2addr v7, v8

    .line 186
    mul-int/lit8 v7, v7, 0x28

    .line 187
    .line 188
    div-int/lit16 v7, v7, 0x3e8

    .line 189
    .line 190
    iput v7, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->nFrameSize:I

    .line 191
    .line 192
    new-instance v8, Lcom/tencent/rtmp/sharp/jni/RingBuffer;

    .line 193
    .line 194
    mul-int/2addr v7, p1

    .line 195
    invoke-direct {v8, v7}, Lcom/tencent/rtmp/sharp/jni/RingBuffer;-><init>(I)V

    .line 196
    .line 197
    .line 198
    iput-object v8, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->decRingBuffer:Lcom/tencent/rtmp/sharp/jni/RingBuffer;

    .line 199
    .line 200
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 201
    .line 202
    .line 203
    move-result v7

    .line 204
    if-eqz v7, :cond_4

    .line 205
    .line 206
    new-instance v7, Ljava/lang/StringBuilder;

    .line 207
    .line 208
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 209
    .line 210
    .line 211
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 212
    .line 213
    .line 214
    iget v8, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->m_nIndex:I

    .line 215
    .line 216
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 217
    .line 218
    .line 219
    const-string v8, " initMediaDecode open succeed, mp3 format:("

    .line 220
    .line 221
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 222
    .line 223
    .line 224
    iget v8, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->sampleRate:I

    .line 225
    .line 226
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 227
    .line 228
    .line 229
    const-string v8, ","

    .line 230
    .line 231
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 232
    .line 233
    .line 234
    iget v8, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->channels:I

    .line 235
    .line 236
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 237
    .line 238
    .line 239
    const-string v8, "), fileTotalMs:"

    .line 240
    .line 241
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 242
    .line 243
    .line 244
    iget-wide v8, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->fileTotalMs:J

    .line 245
    .line 246
    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 247
    .line 248
    .line 249
    const-string v8, "ms RingBufferFrame:"

    .line 250
    .line 251
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 252
    .line 253
    .line 254
    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 255
    .line 256
    .line 257
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 258
    .line 259
    .line 260
    move-result-object p1

    .line 261
    invoke-static {v5, v4, p1}, Lcom/tencent/rtmp/sharp/jni/QLog;->w(Ljava/lang/String;ILjava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 262
    .line 263
    .line 264
    goto :goto_2

    .line 265
    :cond_3
    add-int/lit8 v7, v7, 0x1

    .line 266
    .line 267
    goto/16 :goto_1

    .line 268
    .line 269
    :cond_4
    :goto_2
    iget-object p1, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->mediaDecode:Landroid/media/MediaCodec;

    .line 270
    .line 271
    if-nez p1, :cond_5

    .line 272
    .line 273
    new-instance p1, Ljava/lang/StringBuilder;

    .line 274
    .line 275
    invoke-direct {p1, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 276
    .line 277
    .line 278
    iget v3, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->m_nIndex:I

    .line 279
    .line 280
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 281
    .line 282
    .line 283
    const-string v3, " initMediaDecode create mediaDecode failed"

    .line 284
    .line 285
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 286
    .line 287
    .line 288
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 289
    .line 290
    .line 291
    move-result-object p1

    .line 292
    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 293
    .line 294
    .line 295
    iput-boolean v2, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->codeOver:Z

    .line 296
    .line 297
    return v1

    .line 298
    :cond_5
    iget-object v4, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->decRingBuffer:Lcom/tencent/rtmp/sharp/jni/RingBuffer;

    .line 299
    .line 300
    if-nez v4, :cond_6

    .line 301
    .line 302
    new-instance p1, Ljava/lang/StringBuilder;

    .line 303
    .line 304
    invoke-direct {p1, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 305
    .line 306
    .line 307
    iget v3, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->m_nIndex:I

    .line 308
    .line 309
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 310
    .line 311
    .line 312
    const-string v3, " initMediaDecode create decRingBuffer failed"

    .line 313
    .line 314
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 315
    .line 316
    .line 317
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 318
    .line 319
    .line 320
    move-result-object p1

    .line 321
    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 322
    .line 323
    .line 324
    iput-boolean v2, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->codeOver:Z

    .line 325
    .line 326
    return v1

    .line 327
    :cond_6
    invoke-virtual {p1}, Landroid/media/MediaCodec;->start()V

    .line 328
    .line 329
    .line 330
    iget-object p1, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->mediaDecode:Landroid/media/MediaCodec;

    .line 331
    .line 332
    invoke-virtual {p1}, Landroid/media/MediaCodec;->getInputBuffers()[Ljava/nio/ByteBuffer;

    .line 333
    .line 334
    .line 335
    move-result-object p1

    .line 336
    iput-object p1, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->decodeInputBuffers:[Ljava/nio/ByteBuffer;

    .line 337
    .line 338
    iget-object p1, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->mediaDecode:Landroid/media/MediaCodec;

    .line 339
    .line 340
    invoke-virtual {p1}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    .line 341
    .line 342
    .line 343
    move-result-object p1

    .line 344
    iput-object p1, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->decodeOutputBuffers:[Ljava/nio/ByteBuffer;

    .line 345
    .line 346
    new-instance p1, Landroid/media/MediaCodec$BufferInfo;

    .line 347
    .line 348
    invoke-direct {p1}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    .line 349
    .line 350
    .line 351
    iput-object p1, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->decodeBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 352
    .line 353
    iput-boolean v3, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->codeOver:Z

    .line 354
    .line 355
    iput-boolean v3, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->IsTenFramesReady:Z

    .line 356
    .line 357
    const/4 p1, 0x3

    .line 358
    iput p1, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->nFirstThreeFrameInfo:I

    .line 359
    .line 360
    return v3

    .line 361
    :goto_3
    const-string v3, "init media decode failed."

    .line 362
    .line 363
    invoke-static {v0, v3, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 364
    .line 365
    .line 366
    iput-boolean v2, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->codeOver:Z

    .line 367
    .line 368
    return v1
.end method

.method private showLog(Ljava/lang/String;)V
    .locals 0

    .line 1
    const-string p0, "AudioCodec"

    .line 2
    .line 3
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private srcAudioFormatToPCM()V
    .locals 14

    .line 1
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->decodeInputBuffers:[Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    array-length v0, v0

    .line 4
    const-string v1, "m_nIndex: "

    .line 5
    .line 6
    const/4 v2, 0x2

    .line 7
    const-string v3, "TRAE"

    .line 8
    .line 9
    const/4 v4, 0x1

    .line 10
    if-gt v0, v4, :cond_1

    .line 11
    .line 12
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    new-instance v0, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget v1, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->m_nIndex:I

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string v1, " srcAudioFormatToPCM decodeInputBuffers.length to small,"

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    iget-object v1, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->decodeInputBuffers:[Ljava/nio/ByteBuffer;

    .line 34
    .line 35
    array-length v1, v1

    .line 36
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-static {v3, v2, v0}, Lcom/tencent/rtmp/sharp/jni/QLog;->w(Ljava/lang/String;ILjava/lang/String;)V

    .line 44
    .line 45
    .line 46
    :cond_0
    iput-boolean v4, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->codeOver:Z

    .line 47
    .line 48
    return-void

    .line 49
    :cond_1
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->mediaDecode:Landroid/media/MediaCodec;

    .line 50
    .line 51
    const-wide/16 v5, -0x1

    .line 52
    .line 53
    invoke-virtual {v0, v5, v6}, Landroid/media/MediaCodec;->dequeueInputBuffer(J)I

    .line 54
    .line 55
    .line 56
    move-result v8

    .line 57
    if-gez v8, :cond_3

    .line 58
    .line 59
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_2

    .line 64
    .line 65
    new-instance v0, Ljava/lang/StringBuilder;

    .line 66
    .line 67
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    iget v1, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->m_nIndex:I

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    const-string v1, " srcAudioFormatToPCM decodeInputBuffers.inputIndex <0"

    .line 76
    .line 77
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-static {v3, v2, v0}, Lcom/tencent/rtmp/sharp/jni/QLog;->w(Ljava/lang/String;ILjava/lang/String;)V

    .line 85
    .line 86
    .line 87
    :cond_2
    iput-boolean v4, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->codeOver:Z

    .line 88
    .line 89
    return-void

    .line 90
    :cond_3
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->mediaDecode:Landroid/media/MediaCodec;

    .line 91
    .line 92
    invoke-virtual {v0, v8}, Landroid/media/MediaCodec;->getInputBuffer(I)Ljava/nio/ByteBuffer;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 97
    .line 98
    .line 99
    iget-object v5, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->mediaExtractor:Landroid/media/MediaExtractor;

    .line 100
    .line 101
    const/4 v6, 0x0

    .line 102
    invoke-virtual {v5, v0, v6}, Landroid/media/MediaExtractor;->readSampleData(Ljava/nio/ByteBuffer;I)I

    .line 103
    .line 104
    .line 105
    move-result v10

    .line 106
    if-gez v10, :cond_5

    .line 107
    .line 108
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    if-eqz v0, :cond_4

    .line 113
    .line 114
    new-instance v0, Ljava/lang/StringBuilder;

    .line 115
    .line 116
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    iget v5, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->m_nIndex:I

    .line 120
    .line 121
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    const-string v5, " srcAudioFormatToPCM readSampleData over,end"

    .line 125
    .line 126
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    invoke-static {v3, v2, v0}, Lcom/tencent/rtmp/sharp/jni/QLog;->w(Ljava/lang/String;ILjava/lang/String;)V

    .line 134
    .line 135
    .line 136
    :cond_4
    iput-boolean v4, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->codeOver:Z

    .line 137
    .line 138
    goto :goto_0

    .line 139
    :cond_5
    iget-object v7, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->mediaDecode:Landroid/media/MediaCodec;

    .line 140
    .line 141
    const-wide/16 v11, 0x0

    .line 142
    .line 143
    const/4 v13, 0x0

    .line 144
    const/4 v9, 0x0

    .line 145
    invoke-virtual/range {v7 .. v13}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 146
    .line 147
    .line 148
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->mediaExtractor:Landroid/media/MediaExtractor;

    .line 149
    .line 150
    invoke-virtual {v0}, Landroid/media/MediaExtractor;->advance()Z

    .line 151
    .line 152
    .line 153
    :goto_0
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->mediaDecode:Landroid/media/MediaCodec;

    .line 154
    .line 155
    iget-object v5, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->decodeBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 156
    .line 157
    const-wide/16 v7, 0x2710

    .line 158
    .line 159
    invoke-virtual {v0, v5, v7, v8}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    .line 160
    .line 161
    .line 162
    move-result v0

    .line 163
    :goto_1
    if-ltz v0, :cond_9

    .line 164
    .line 165
    iget-object v5, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->mediaDecode:Landroid/media/MediaCodec;

    .line 166
    .line 167
    invoke-virtual {v5, v0}, Landroid/media/MediaCodec;->getOutputBuffer(I)Ljava/nio/ByteBuffer;

    .line 168
    .line 169
    .line 170
    move-result-object v5

    .line 171
    iget-object v9, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->decodeBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 172
    .line 173
    iget v9, v9, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 174
    .line 175
    new-array v9, v9, [B

    .line 176
    .line 177
    :try_start_0
    invoke-virtual {v5, v9}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 178
    .line 179
    .line 180
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 181
    .line 182
    .line 183
    iget-object v5, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->decRingBuffer:Lcom/tencent/rtmp/sharp/jni/RingBuffer;

    .line 184
    .line 185
    if-eqz v5, :cond_6

    .line 186
    .line 187
    iget-object v10, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->decodeBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 188
    .line 189
    iget v10, v10, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 190
    .line 191
    if-lez v10, :cond_6

    .line 192
    .line 193
    invoke-virtual {v5, v9, v10}, Lcom/tencent/rtmp/sharp/jni/RingBuffer;->Push([BI)V

    .line 194
    .line 195
    .line 196
    iget v5, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->nFirstThreeFrameInfo:I

    .line 197
    .line 198
    add-int/lit8 v9, v5, -0x1

    .line 199
    .line 200
    iput v9, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->nFirstThreeFrameInfo:I

    .line 201
    .line 202
    if-lez v5, :cond_6

    .line 203
    .line 204
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 205
    .line 206
    .line 207
    move-result v5

    .line 208
    if-eqz v5, :cond_6

    .line 209
    .line 210
    new-instance v5, Ljava/lang/StringBuilder;

    .line 211
    .line 212
    invoke-direct {v5, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 213
    .line 214
    .line 215
    iget v9, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->m_nIndex:I

    .line 216
    .line 217
    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 218
    .line 219
    .line 220
    const-string v9, " DecodeOneFrame size: "

    .line 221
    .line 222
    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 223
    .line 224
    .line 225
    iget-object v9, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->decodeBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 226
    .line 227
    iget v9, v9, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 228
    .line 229
    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 230
    .line 231
    .line 232
    const-string v9, " Remain: "

    .line 233
    .line 234
    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 235
    .line 236
    .line 237
    iget-object v9, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->decRingBuffer:Lcom/tencent/rtmp/sharp/jni/RingBuffer;

    .line 238
    .line 239
    invoke-virtual {v9}, Lcom/tencent/rtmp/sharp/jni/RingBuffer;->RemainRead()I

    .line 240
    .line 241
    .line 242
    move-result v9

    .line 243
    iget v10, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->nFrameSize:I

    .line 244
    .line 245
    div-int/2addr v9, v10

    .line 246
    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 247
    .line 248
    .line 249
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 250
    .line 251
    .line 252
    move-result-object v5

    .line 253
    invoke-static {v3, v2, v5}, Lcom/tencent/rtmp/sharp/jni/QLog;->w(Ljava/lang/String;ILjava/lang/String;)V

    .line 254
    .line 255
    .line 256
    :cond_6
    iget-object v5, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->mediaDecode:Landroid/media/MediaCodec;

    .line 257
    .line 258
    invoke-virtual {v5, v0, v6}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 259
    .line 260
    .line 261
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->decodeBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    .line 262
    .line 263
    iget v5, v0, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 264
    .line 265
    if-lez v5, :cond_7

    .line 266
    .line 267
    goto :goto_2

    .line 268
    :cond_7
    iget-object v5, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->mediaDecode:Landroid/media/MediaCodec;

    .line 269
    .line 270
    invoke-virtual {v5, v0, v7, v8}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    .line 271
    .line 272
    .line 273
    move-result v0

    .line 274
    goto :goto_1

    .line 275
    :catch_0
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 276
    .line 277
    .line 278
    move-result v5

    .line 279
    if-eqz v5, :cond_8

    .line 280
    .line 281
    new-instance v5, Ljava/lang/StringBuilder;

    .line 282
    .line 283
    invoke-direct {v5, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 284
    .line 285
    .line 286
    iget v1, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->m_nIndex:I

    .line 287
    .line 288
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 289
    .line 290
    .line 291
    const-string v1, " srcAudioFormatToPCM wrong outputIndex: "

    .line 292
    .line 293
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 294
    .line 295
    .line 296
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 297
    .line 298
    .line 299
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 300
    .line 301
    .line 302
    move-result-object v0

    .line 303
    invoke-static {v3, v2, v0}, Lcom/tencent/rtmp/sharp/jni/QLog;->w(Ljava/lang/String;ILjava/lang/String;)V

    .line 304
    .line 305
    .line 306
    :cond_8
    iput-boolean v4, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->codeOver:Z

    .line 307
    .line 308
    :cond_9
    :goto_2
    return-void
.end method


# virtual methods
.method public ReadOneFrame([BI)I
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->IsTenFramesReady:Z

    .line 2
    .line 3
    const/16 v1, 0xa

    .line 4
    .line 5
    const/16 v2, 0x14

    .line 6
    .line 7
    if-nez v0, :cond_2

    .line 8
    .line 9
    move v0, v2

    .line 10
    :goto_0
    iget-object v3, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->decRingBuffer:Lcom/tencent/rtmp/sharp/jni/RingBuffer;

    .line 11
    .line 12
    invoke-virtual {v3}, Lcom/tencent/rtmp/sharp/jni/RingBuffer;->RemainRead()I

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    iget v4, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->nFrameSize:I

    .line 17
    .line 18
    div-int/2addr v3, v4

    .line 19
    if-ge v3, v1, :cond_0

    .line 20
    .line 21
    add-int/lit8 v3, v0, -0x1

    .line 22
    .line 23
    if-lez v0, :cond_0

    .line 24
    .line 25
    iget-boolean v0, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->codeOver:Z

    .line 26
    .line 27
    if-nez v0, :cond_0

    .line 28
    .line 29
    invoke-direct {p0}, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->srcAudioFormatToPCM()V

    .line 30
    .line 31
    .line 32
    move v0, v3

    .line 33
    goto :goto_0

    .line 34
    :cond_0
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    new-instance v0, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    const-string v3, "m_nIndex: "

    .line 43
    .line 44
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iget v3, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->m_nIndex:I

    .line 48
    .line 49
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string v3, " 10 FramesReady Remain frame: "

    .line 53
    .line 54
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    iget-object v3, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->decRingBuffer:Lcom/tencent/rtmp/sharp/jni/RingBuffer;

    .line 58
    .line 59
    invoke-virtual {v3}, Lcom/tencent/rtmp/sharp/jni/RingBuffer;->RemainRead()I

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    iget v4, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->nFrameSize:I

    .line 64
    .line 65
    div-int/2addr v3, v4

    .line 66
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    const-string v3, "TRAE"

    .line 74
    .line 75
    const/4 v4, 0x2

    .line 76
    invoke-static {v3, v4, v0}, Lcom/tencent/rtmp/sharp/jni/QLog;->w(Ljava/lang/String;ILjava/lang/String;)V

    .line 77
    .line 78
    .line 79
    :cond_1
    const/4 v0, 0x1

    .line 80
    iput-boolean v0, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->IsTenFramesReady:Z

    .line 81
    .line 82
    :cond_2
    :goto_1
    iget-boolean v0, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->codeOver:Z

    .line 83
    .line 84
    if-nez v0, :cond_3

    .line 85
    .line 86
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->decRingBuffer:Lcom/tencent/rtmp/sharp/jni/RingBuffer;

    .line 87
    .line 88
    invoke-virtual {v0}, Lcom/tencent/rtmp/sharp/jni/RingBuffer;->RemainRead()I

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    iget v3, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->nFrameSize:I

    .line 93
    .line 94
    div-int/2addr v0, v3

    .line 95
    if-ge v0, v1, :cond_3

    .line 96
    .line 97
    add-int/lit8 v0, v2, -0x1

    .line 98
    .line 99
    if-lez v2, :cond_3

    .line 100
    .line 101
    invoke-direct {p0}, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->srcAudioFormatToPCM()V

    .line 102
    .line 103
    .line 104
    move v2, v0

    .line 105
    goto :goto_1

    .line 106
    :cond_3
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->decRingBuffer:Lcom/tencent/rtmp/sharp/jni/RingBuffer;

    .line 107
    .line 108
    invoke-virtual {v0}, Lcom/tencent/rtmp/sharp/jni/RingBuffer;->RemainRead()I

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    if-lt v0, p2, :cond_4

    .line 113
    .line 114
    iget-object p0, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->decRingBuffer:Lcom/tencent/rtmp/sharp/jni/RingBuffer;

    .line 115
    .line 116
    invoke-virtual {p0, p1, p2}, Lcom/tencent/rtmp/sharp/jni/RingBuffer;->Pop([BI)Z

    .line 117
    .line 118
    .line 119
    return p2

    .line 120
    :cond_4
    const/4 p0, -0x1

    .line 121
    return p0
.end method

.method public SeekTo(I)I
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->mediaExtractor:Landroid/media/MediaExtractor;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/media/MediaExtractor;->getSampleTime()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    iget-object v2, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->decRingBuffer:Lcom/tencent/rtmp/sharp/jni/RingBuffer;

    .line 10
    .line 11
    invoke-virtual {v2}, Lcom/tencent/rtmp/sharp/jni/RingBuffer;->RemainRead()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    mul-int/lit8 v2, v2, 0x14

    .line 16
    .line 17
    iget v3, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->nFrameSize:I

    .line 18
    .line 19
    div-int/2addr v2, v3

    .line 20
    add-int/2addr p1, v2

    .line 21
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    const-string v3, "m_nIndex: "

    .line 26
    .line 27
    const-string v4, "TRAE"

    .line 28
    .line 29
    const-wide/16 v5, 0x3e8

    .line 30
    .line 31
    const/4 v7, 0x2

    .line 32
    if-eqz v2, :cond_0

    .line 33
    .line 34
    new-instance v2, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iget v8, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->m_nIndex:I

    .line 40
    .line 41
    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    const-string v8, " current PlayMs: "

    .line 45
    .line 46
    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    div-long v8, v0, v5

    .line 50
    .line 51
    invoke-virtual {v2, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string v8, " SeekTo: "

    .line 55
    .line 56
    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-static {v4, v7, v2}, Lcom/tencent/rtmp/sharp/jni/QLog;->w(Ljava/lang/String;ILjava/lang/String;)V

    .line 67
    .line 68
    .line 69
    :cond_0
    iget-object v2, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->mediaExtractor:Landroid/media/MediaExtractor;

    .line 70
    .line 71
    mul-int/lit16 p1, p1, 0x3e8

    .line 72
    .line 73
    int-to-long v8, p1

    .line 74
    invoke-virtual {v2, v8, v9, v7}, Landroid/media/MediaExtractor;->seekTo(JI)V

    .line 75
    .line 76
    .line 77
    iget-object p1, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->mediaExtractor:Landroid/media/MediaExtractor;

    .line 78
    .line 79
    invoke-virtual {p1}, Landroid/media/MediaExtractor;->getSampleTime()J

    .line 80
    .line 81
    .line 82
    move-result-wide v8

    .line 83
    sub-long v0, v8, v0

    .line 84
    .line 85
    div-long/2addr v0, v5

    .line 86
    long-to-int p1, v0

    .line 87
    invoke-static {}, Lcom/tencent/rtmp/sharp/jni/QLog;->isColorLevel()Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-eqz v0, :cond_1

    .line 92
    .line 93
    new-instance v0, Ljava/lang/StringBuilder;

    .line 94
    .line 95
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    iget p0, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->m_nIndex:I

    .line 99
    .line 100
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    const-string p0, " total SeekTo time: "

    .line 104
    .line 105
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    const-string p0, " t2:"

    .line 112
    .line 113
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    div-long/2addr v8, v5

    .line 117
    invoke-virtual {v0, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    invoke-static {v4, v7, p0}, Lcom/tencent/rtmp/sharp/jni/QLog;->w(Ljava/lang/String;ILjava/lang/String;)V

    .line 125
    .line 126
    .line 127
    :cond_1
    return p1

    .line 128
    :cond_2
    const/4 p0, 0x0

    .line 129
    return p0
.end method

.method public getChannels()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->channels:I

    .line 2
    .line 3
    return p0
.end method

.method public getFileTotalMs()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->fileTotalMs:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getFrameSize()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->nFrameSize:I

    .line 2
    .line 3
    return p0
.end method

.method public getSampleRate()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->sampleRate:I

    .line 2
    .line 3
    return p0
.end method

.method public prepare(I)I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->srcPath:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, -0x1

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-direct {p0, p1}, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->initMediaDecode(I)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public release()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->mediaDecode:Landroid/media/MediaCodec;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/media/MediaCodec;->stop()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->mediaDecode:Landroid/media/MediaCodec;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/media/MediaCodec;->release()V

    .line 12
    .line 13
    .line 14
    iput-object v1, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->mediaDecode:Landroid/media/MediaCodec;

    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->mediaExtractor:Landroid/media/MediaExtractor;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/media/MediaExtractor;->release()V

    .line 21
    .line 22
    .line 23
    iput-object v1, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->mediaExtractor:Landroid/media/MediaExtractor;

    .line 24
    .line 25
    :cond_1
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->onCompleteListener:Lcom/tencent/rtmp/sharp/jni/AudioDecoder$OnCompleteListener;

    .line 26
    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    iput-object v1, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->onCompleteListener:Lcom/tencent/rtmp/sharp/jni/AudioDecoder$OnCompleteListener;

    .line 30
    .line 31
    :cond_2
    iget-object v0, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->onProgressListener:Lcom/tencent/rtmp/sharp/jni/AudioDecoder$OnProgressListener;

    .line 32
    .line 33
    if-eqz v0, :cond_3

    .line 34
    .line 35
    iput-object v1, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->onProgressListener:Lcom/tencent/rtmp/sharp/jni/AudioDecoder$OnProgressListener;

    .line 36
    .line 37
    :cond_3
    const-string v0, "release"

    .line 38
    .line 39
    invoke-direct {p0, v0}, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->showLog(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public setIOPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->srcPath:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setIndex(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->m_nIndex:I

    .line 2
    .line 3
    return-void
.end method

.method public setOnCompleteListener(Lcom/tencent/rtmp/sharp/jni/AudioDecoder$OnCompleteListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->onCompleteListener:Lcom/tencent/rtmp/sharp/jni/AudioDecoder$OnCompleteListener;

    .line 2
    .line 3
    return-void
.end method

.method public setOnProgressListener(Lcom/tencent/rtmp/sharp/jni/AudioDecoder$OnProgressListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/rtmp/sharp/jni/AudioDecoder;->onProgressListener:Lcom/tencent/rtmp/sharp/jni/AudioDecoder$OnProgressListener;

    .line 2
    .line 3
    return-void
.end method
