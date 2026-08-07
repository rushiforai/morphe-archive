.class Lio/agora/base/internal/video/HardwareVideoDecoder$4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/agora/base/internal/video/HardwareVideoDecoder;->decode(Lio/agora/base/internal/video/EncodedImage;Lio/agora/base/internal/video/VideoDecoder$DecodeInfo;Lio/agora/base/internal/video/CodecSpecificInfo;Lio/agora/base/internal/video/FrameExtraInfo;)Lio/agora/base/internal/video/VideoCodecStatus;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable<",
        "Lio/agora/base/internal/video/VideoCodecStatus;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lio/agora/base/internal/video/HardwareVideoDecoder;

.field final synthetic val$codecSpecificInfo:Lio/agora/base/internal/video/CodecSpecificInfo;

.field final synthetic val$frame:Lio/agora/base/internal/video/EncodedImage;

.field final synthetic val$frameExtraInfo:Lio/agora/base/internal/video/FrameExtraInfo;

.field final synthetic val$size:I


# direct methods
.method public constructor <init>(Lio/agora/base/internal/video/HardwareVideoDecoder;ILio/agora/base/internal/video/EncodedImage;Lio/agora/base/internal/video/CodecSpecificInfo;Lio/agora/base/internal/video/FrameExtraInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lio/agora/base/internal/video/HardwareVideoDecoder$4;->this$0:Lio/agora/base/internal/video/HardwareVideoDecoder;

    .line 2
    .line 3
    iput p2, p0, Lio/agora/base/internal/video/HardwareVideoDecoder$4;->val$size:I

    .line 4
    .line 5
    iput-object p3, p0, Lio/agora/base/internal/video/HardwareVideoDecoder$4;->val$frame:Lio/agora/base/internal/video/EncodedImage;

    .line 6
    .line 7
    iput-object p4, p0, Lio/agora/base/internal/video/HardwareVideoDecoder$4;->val$codecSpecificInfo:Lio/agora/base/internal/video/CodecSpecificInfo;

    .line 8
    .line 9
    iput-object p5, p0, Lio/agora/base/internal/video/HardwareVideoDecoder$4;->val$frameExtraInfo:Lio/agora/base/internal/video/FrameExtraInfo;

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public call()Lio/agora/base/internal/video/VideoCodecStatus;
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    const-string v1, "HardwareVideoDecoder"

    .line 2
    .line 3
    const-string v0, "queue input buffer, pts_us: "

    .line 4
    .line 5
    :try_start_0
    iget-object v2, p0, Lio/agora/base/internal/video/HardwareVideoDecoder$4;->this$0:Lio/agora/base/internal/video/HardwareVideoDecoder;

    .line 6
    .line 7
    invoke-static {v2}, Lio/agora/base/internal/video/HardwareVideoDecoder;->access$000(Lio/agora/base/internal/video/HardwareVideoDecoder;)Lio/agora/base/internal/video/MediaCodecWrapper;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    const-wide/32 v3, 0x7a120

    .line 12
    .line 13
    .line 14
    invoke-interface {v2, v3, v4}, Lio/agora/base/internal/video/MediaCodecWrapper;->dequeueInputBuffer(J)I

    .line 15
    .line 16
    .line 17
    move-result v6
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_3

    .line 18
    iget-object v2, p0, Lio/agora/base/internal/video/HardwareVideoDecoder$4;->this$0:Lio/agora/base/internal/video/HardwareVideoDecoder;

    .line 19
    .line 20
    const/4 v3, -0x1

    .line 21
    if-ne v6, v3, :cond_0

    .line 22
    .line 23
    invoke-static {v2}, Lio/agora/base/internal/video/HardwareVideoDecoder;->access$708(Lio/agora/base/internal/video/HardwareVideoDecoder;)I

    .line 24
    .line 25
    .line 26
    const-string p0, "Dropped frame, no input buffers available"

    .line 27
    .line 28
    invoke-static {v1, p0}, Lio/agora/base/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    sget-object p0, Lio/agora/base/internal/video/VideoCodecStatus;->NO_OUTPUT:Lio/agora/base/internal/video/VideoCodecStatus;

    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_0
    const/4 v3, 0x0

    .line 35
    invoke-static {v2, v3}, Lio/agora/base/internal/video/HardwareVideoDecoder;->access$702(Lio/agora/base/internal/video/HardwareVideoDecoder;I)I

    .line 36
    .line 37
    .line 38
    if-gez v6, :cond_1

    .line 39
    .line 40
    const-string p0, "decode() - no HW buffers available; decoder falling behind"

    .line 41
    .line 42
    invoke-static {v1, p0}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    sget-object p0, Lio/agora/base/internal/video/VideoCodecStatus;->ERROR:Lio/agora/base/internal/video/VideoCodecStatus;

    .line 46
    .line 47
    return-object p0

    .line 48
    :cond_1
    :try_start_1
    iget-object v2, p0, Lio/agora/base/internal/video/HardwareVideoDecoder$4;->this$0:Lio/agora/base/internal/video/HardwareVideoDecoder;

    .line 49
    .line 50
    invoke-static {v2}, Lio/agora/base/internal/video/HardwareVideoDecoder;->access$000(Lio/agora/base/internal/video/HardwareVideoDecoder;)Lio/agora/base/internal/video/MediaCodecWrapper;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-interface {v2}, Lio/agora/base/internal/video/MediaCodecWrapper;->getInputBuffers()[Ljava/nio/ByteBuffer;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    aget-object v2, v2, v6
    :try_end_1
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_2

    .line 59
    .line 60
    invoke-virtual {v2}, Ljava/nio/Buffer;->capacity()I

    .line 61
    .line 62
    .line 63
    move-result v4

    .line 64
    iget v5, p0, Lio/agora/base/internal/video/HardwareVideoDecoder$4;->val$size:I

    .line 65
    .line 66
    if-ge v4, v5, :cond_2

    .line 67
    .line 68
    const-string p0, "decode() - HW buffer too small"

    .line 69
    .line 70
    invoke-static {v1, p0}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    sget-object p0, Lio/agora/base/internal/video/VideoCodecStatus;->ERROR:Lio/agora/base/internal/video/VideoCodecStatus;

    .line 74
    .line 75
    return-object p0

    .line 76
    :cond_2
    iget-object v4, p0, Lio/agora/base/internal/video/HardwareVideoDecoder$4;->val$frame:Lio/agora/base/internal/video/EncodedImage;

    .line 77
    .line 78
    iget-object v4, v4, Lio/agora/base/internal/video/EncodedImage;->buffer:Ljava/nio/ByteBuffer;

    .line 79
    .line 80
    invoke-virtual {v2, v4}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 81
    .line 82
    .line 83
    iget-object v2, p0, Lio/agora/base/internal/video/HardwareVideoDecoder$4;->val$frame:Lio/agora/base/internal/video/EncodedImage;

    .line 84
    .line 85
    iget-wide v4, v2, Lio/agora/base/internal/video/EncodedImage;->captureTimeNs:J

    .line 86
    .line 87
    const-wide/16 v7, 0x3e8

    .line 88
    .line 89
    div-long/2addr v4, v7

    .line 90
    iget-object v2, p0, Lio/agora/base/internal/video/HardwareVideoDecoder$4;->this$0:Lio/agora/base/internal/video/HardwareVideoDecoder;

    .line 91
    .line 92
    invoke-static {v2}, Lio/agora/base/internal/video/HardwareVideoDecoder;->access$800(Lio/agora/base/internal/video/HardwareVideoDecoder;)J

    .line 93
    .line 94
    .line 95
    move-result-wide v7

    .line 96
    cmp-long v2, v7, v4

    .line 97
    .line 98
    iget-object v7, p0, Lio/agora/base/internal/video/HardwareVideoDecoder$4;->this$0:Lio/agora/base/internal/video/HardwareVideoDecoder;

    .line 99
    .line 100
    if-nez v2, :cond_3

    .line 101
    .line 102
    invoke-static {v7}, Lio/agora/base/internal/video/HardwareVideoDecoder;->access$804(Lio/agora/base/internal/video/HardwareVideoDecoder;)J

    .line 103
    .line 104
    .line 105
    move-result-wide v4

    .line 106
    :goto_0
    move-wide v9, v4

    .line 107
    goto :goto_1

    .line 108
    :cond_3
    invoke-static {v7, v4, v5}, Lio/agora/base/internal/video/HardwareVideoDecoder;->access$802(Lio/agora/base/internal/video/HardwareVideoDecoder;J)J

    .line 109
    .line 110
    .line 111
    goto :goto_0

    .line 112
    :goto_1
    const/4 v2, 0x0

    .line 113
    :try_start_2
    iget-object v4, p0, Lio/agora/base/internal/video/HardwareVideoDecoder$4;->val$codecSpecificInfo:Lio/agora/base/internal/video/CodecSpecificInfo;

    .line 114
    .line 115
    if-eqz v4, :cond_4

    .line 116
    .line 117
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 118
    .line 119
    .line 120
    move-result-wide v7

    .line 121
    iput-wide v7, v4, Lio/agora/base/internal/video/CodecSpecificInfo;->elapsedRealtime:J

    .line 122
    .line 123
    iget-object v4, p0, Lio/agora/base/internal/video/HardwareVideoDecoder$4;->this$0:Lio/agora/base/internal/video/HardwareVideoDecoder;

    .line 124
    .line 125
    invoke-static {v4}, Lio/agora/base/internal/video/HardwareVideoDecoder;->access$900(Lio/agora/base/internal/video/HardwareVideoDecoder;)Ljava/util/Map;

    .line 126
    .line 127
    .line 128
    move-result-object v4

    .line 129
    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 130
    .line 131
    .line 132
    move-result-object v5

    .line 133
    iget-object v7, p0, Lio/agora/base/internal/video/HardwareVideoDecoder$4;->val$codecSpecificInfo:Lio/agora/base/internal/video/CodecSpecificInfo;

    .line 134
    .line 135
    invoke-interface {v4, v5, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    goto :goto_2

    .line 139
    :catch_0
    move-exception v0

    .line 140
    move-wide v10, v9

    .line 141
    goto :goto_3

    .line 142
    :cond_4
    iget-object v4, p0, Lio/agora/base/internal/video/HardwareVideoDecoder$4;->this$0:Lio/agora/base/internal/video/HardwareVideoDecoder;

    .line 143
    .line 144
    invoke-static {v4}, Lio/agora/base/internal/video/HardwareVideoDecoder;->access$900(Lio/agora/base/internal/video/HardwareVideoDecoder;)Ljava/util/Map;

    .line 145
    .line 146
    .line 147
    move-result-object v4

    .line 148
    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 149
    .line 150
    .line 151
    move-result-object v5

    .line 152
    new-instance v7, Lio/agora/base/internal/video/CodecSpecificInfo;

    .line 153
    .line 154
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 155
    .line 156
    .line 157
    move-result-wide v11

    .line 158
    invoke-direct {v7, v2, v11, v12}, Lio/agora/base/internal/video/CodecSpecificInfo;-><init>(Ljava/nio/ByteBuffer;J)V

    .line 159
    .line 160
    .line 161
    invoke-interface {v4, v5, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 162
    .line 163
    .line 164
    :goto_2
    new-instance v7, Lio/agora/base/internal/video/HardwareVideoDecoder$TimeStamps;
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_0

    .line 165
    .line 166
    move-wide v10, v9

    .line 167
    :try_start_3
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 168
    .line 169
    .line 170
    move-result-wide v8

    .line 171
    iget-object v4, p0, Lio/agora/base/internal/video/HardwareVideoDecoder$4;->val$frame:Lio/agora/base/internal/video/EncodedImage;

    .line 172
    .line 173
    iget v12, v4, Lio/agora/base/internal/video/EncodedImage;->rotation:I

    .line 174
    .line 175
    invoke-direct/range {v7 .. v12}, Lio/agora/base/internal/video/HardwareVideoDecoder$TimeStamps;-><init>(JJI)V

    .line 176
    .line 177
    .line 178
    move-object v2, v7

    .line 179
    iget-object v4, p0, Lio/agora/base/internal/video/HardwareVideoDecoder$4;->this$0:Lio/agora/base/internal/video/HardwareVideoDecoder;

    .line 180
    .line 181
    invoke-static {v4}, Lio/agora/base/internal/video/HardwareVideoDecoder;->access$1000(Lio/agora/base/internal/video/HardwareVideoDecoder;)Ljava/util/Queue;

    .line 182
    .line 183
    .line 184
    move-result-object v4

    .line 185
    invoke-interface {v4, v2}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 186
    .line 187
    .line 188
    iget-object v4, p0, Lio/agora/base/internal/video/HardwareVideoDecoder$4;->this$0:Lio/agora/base/internal/video/HardwareVideoDecoder;

    .line 189
    .line 190
    invoke-static {v4}, Lio/agora/base/internal/video/HardwareVideoDecoder;->access$1100(Lio/agora/base/internal/video/HardwareVideoDecoder;)Ljava/util/Map;

    .line 191
    .line 192
    .line 193
    move-result-object v4

    .line 194
    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 195
    .line 196
    .line 197
    move-result-object v5

    .line 198
    iget-object v7, p0, Lio/agora/base/internal/video/HardwareVideoDecoder$4;->val$frameExtraInfo:Lio/agora/base/internal/video/FrameExtraInfo;

    .line 199
    .line 200
    invoke-interface {v4, v5, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 201
    .line 202
    .line 203
    new-instance v4, Ljava/lang/StringBuilder;

    .line 204
    .line 205
    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 206
    .line 207
    .line 208
    invoke-virtual {v4, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 209
    .line 210
    .line 211
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 212
    .line 213
    .line 214
    move-result-object v0

    .line 215
    invoke-static {v0}, Lio/agora/base/internal/video/HardwareVideoDecoder;->access$1200(Ljava/lang/String;)V

    .line 216
    .line 217
    .line 218
    iget-object v0, p0, Lio/agora/base/internal/video/HardwareVideoDecoder$4;->this$0:Lio/agora/base/internal/video/HardwareVideoDecoder;

    .line 219
    .line 220
    invoke-static {v0}, Lio/agora/base/internal/video/HardwareVideoDecoder;->access$000(Lio/agora/base/internal/video/HardwareVideoDecoder;)Lio/agora/base/internal/video/MediaCodecWrapper;

    .line 221
    .line 222
    .line 223
    move-result-object v5

    .line 224
    iget v8, p0, Lio/agora/base/internal/video/HardwareVideoDecoder$4;->val$size:I
    :try_end_3
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_3} :catch_1

    .line 225
    .line 226
    move-wide v9, v10

    .line 227
    const/4 v11, 0x0

    .line 228
    const/4 v7, 0x0

    .line 229
    :try_start_4
    invoke-interface/range {v5 .. v11}, Lio/agora/base/internal/video/MediaCodecWrapper;->queueInputBuffer(IIIJI)V
    :try_end_4
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_4} :catch_0

    .line 230
    .line 231
    .line 232
    iget-object v0, p0, Lio/agora/base/internal/video/HardwareVideoDecoder$4;->this$0:Lio/agora/base/internal/video/HardwareVideoDecoder;

    .line 233
    .line 234
    invoke-static {v0}, Lio/agora/base/internal/video/HardwareVideoDecoder;->access$1300(Lio/agora/base/internal/video/HardwareVideoDecoder;)Z

    .line 235
    .line 236
    .line 237
    move-result v0

    .line 238
    if-eqz v0, :cond_5

    .line 239
    .line 240
    iget-object p0, p0, Lio/agora/base/internal/video/HardwareVideoDecoder$4;->this$0:Lio/agora/base/internal/video/HardwareVideoDecoder;

    .line 241
    .line 242
    invoke-static {p0, v3}, Lio/agora/base/internal/video/HardwareVideoDecoder;->access$1302(Lio/agora/base/internal/video/HardwareVideoDecoder;Z)Z

    .line 243
    .line 244
    .line 245
    :cond_5
    sget-object p0, Lio/agora/base/internal/video/VideoCodecStatus;->OK:Lio/agora/base/internal/video/VideoCodecStatus;

    .line 246
    .line 247
    return-object p0

    .line 248
    :catch_1
    move-exception v0

    .line 249
    :goto_3
    const-string v3, "queueInputBuffer failed"

    .line 250
    .line 251
    invoke-static {v1, v3, v0}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 252
    .line 253
    .line 254
    iget-object v1, p0, Lio/agora/base/internal/video/HardwareVideoDecoder$4;->this$0:Lio/agora/base/internal/video/HardwareVideoDecoder;

    .line 255
    .line 256
    invoke-static {v1}, Lio/agora/base/internal/video/HardwareVideoDecoder;->access$900(Lio/agora/base/internal/video/HardwareVideoDecoder;)Ljava/util/Map;

    .line 257
    .line 258
    .line 259
    move-result-object v1

    .line 260
    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 261
    .line 262
    .line 263
    move-result-object v3

    .line 264
    invoke-interface {v1, v3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 265
    .line 266
    .line 267
    iget-object v1, p0, Lio/agora/base/internal/video/HardwareVideoDecoder$4;->this$0:Lio/agora/base/internal/video/HardwareVideoDecoder;

    .line 268
    .line 269
    invoke-static {v1}, Lio/agora/base/internal/video/HardwareVideoDecoder;->access$1100(Lio/agora/base/internal/video/HardwareVideoDecoder;)Ljava/util/Map;

    .line 270
    .line 271
    .line 272
    move-result-object v1

    .line 273
    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 274
    .line 275
    .line 276
    move-result-object v3

    .line 277
    invoke-interface {v1, v3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 278
    .line 279
    .line 280
    iget-object v1, p0, Lio/agora/base/internal/video/HardwareVideoDecoder$4;->this$0:Lio/agora/base/internal/video/HardwareVideoDecoder;

    .line 281
    .line 282
    invoke-static {v1}, Lio/agora/base/internal/video/HardwareVideoDecoder;->access$1000(Lio/agora/base/internal/video/HardwareVideoDecoder;)Ljava/util/Queue;

    .line 283
    .line 284
    .line 285
    move-result-object v1

    .line 286
    invoke-interface {v1, v2}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    .line 287
    .line 288
    .line 289
    iget-object p0, p0, Lio/agora/base/internal/video/HardwareVideoDecoder$4;->this$0:Lio/agora/base/internal/video/HardwareVideoDecoder;

    .line 290
    .line 291
    invoke-static {p0}, Lio/agora/base/internal/video/HardwareVideoDecoder;->access$600(Lio/agora/base/internal/video/HardwareVideoDecoder;)Z

    .line 292
    .line 293
    .line 294
    move-result p0

    .line 295
    if-nez p0, :cond_6

    .line 296
    .line 297
    sget-object p0, Lio/agora/base/internal/video/VideoCodecStatus;->FALLBACK_SOFTWARE:Lio/agora/base/internal/video/VideoCodecStatus;

    .line 298
    .line 299
    return-object p0

    .line 300
    :cond_6
    invoke-static {v0}, Lio/agora/base/internal/video/MediaCodecUtils;->isMediaCodecException(Ljava/lang/RuntimeException;)Lio/agora/base/internal/video/VideoCodecStatus;

    .line 301
    .line 302
    .line 303
    move-result-object p0

    .line 304
    return-object p0

    .line 305
    :catch_2
    move-exception v0

    .line 306
    const-string v2, "getInputBuffers failed"

    .line 307
    .line 308
    invoke-static {v1, v2, v0}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 309
    .line 310
    .line 311
    iget-object p0, p0, Lio/agora/base/internal/video/HardwareVideoDecoder$4;->this$0:Lio/agora/base/internal/video/HardwareVideoDecoder;

    .line 312
    .line 313
    invoke-static {p0}, Lio/agora/base/internal/video/HardwareVideoDecoder;->access$600(Lio/agora/base/internal/video/HardwareVideoDecoder;)Z

    .line 314
    .line 315
    .line 316
    move-result p0

    .line 317
    if-nez p0, :cond_7

    .line 318
    .line 319
    sget-object p0, Lio/agora/base/internal/video/VideoCodecStatus;->FALLBACK_SOFTWARE:Lio/agora/base/internal/video/VideoCodecStatus;

    .line 320
    .line 321
    return-object p0

    .line 322
    :cond_7
    invoke-static {v0}, Lio/agora/base/internal/video/MediaCodecUtils;->isMediaCodecException(Ljava/lang/RuntimeException;)Lio/agora/base/internal/video/VideoCodecStatus;

    .line 323
    .line 324
    .line 325
    move-result-object p0

    .line 326
    return-object p0

    .line 327
    :catch_3
    move-exception v0

    .line 328
    const-string v2, "dequeueInputBuffer failed"

    .line 329
    .line 330
    invoke-static {v1, v2, v0}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 331
    .line 332
    .line 333
    iget-object p0, p0, Lio/agora/base/internal/video/HardwareVideoDecoder$4;->this$0:Lio/agora/base/internal/video/HardwareVideoDecoder;

    .line 334
    .line 335
    invoke-static {p0}, Lio/agora/base/internal/video/HardwareVideoDecoder;->access$600(Lio/agora/base/internal/video/HardwareVideoDecoder;)Z

    .line 336
    .line 337
    .line 338
    move-result p0

    .line 339
    if-nez p0, :cond_8

    .line 340
    .line 341
    sget-object p0, Lio/agora/base/internal/video/VideoCodecStatus;->FALLBACK_SOFTWARE:Lio/agora/base/internal/video/VideoCodecStatus;

    .line 342
    .line 343
    return-object p0

    .line 344
    :cond_8
    invoke-static {v0}, Lio/agora/base/internal/video/MediaCodecUtils;->isMediaCodecException(Ljava/lang/RuntimeException;)Lio/agora/base/internal/video/VideoCodecStatus;

    .line 345
    .line 346
    .line 347
    move-result-object p0

    .line 348
    return-object p0
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 349
    invoke-virtual {p0}, Lio/agora/base/internal/video/HardwareVideoDecoder$4;->call()Lio/agora/base/internal/video/VideoCodecStatus;

    move-result-object p0

    return-object p0
.end method
