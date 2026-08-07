.class Lio/agora/base/internal/video/HardwareVideoEncoder$7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/agora/base/internal/video/HardwareVideoEncoder;->encodeByteBuffer(Lio/agora/base/VideoFrame;Lio/agora/base/VideoFrame$Buffer;ILio/agora/base/internal/video/CodecSpecificInfo;)Lio/agora/base/internal/video/VideoCodecStatus;
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
.field final synthetic this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

.field final synthetic val$bufferSize:I

.field final synthetic val$codecSpecificInfo:Lio/agora/base/internal/video/CodecSpecificInfo;

.field final synthetic val$videoFrame:Lio/agora/base/VideoFrame;

.field final synthetic val$videoFrameBuffer:Lio/agora/base/VideoFrame$Buffer;


# direct methods
.method public constructor <init>(Lio/agora/base/internal/video/HardwareVideoEncoder;Lio/agora/base/VideoFrame;Lio/agora/base/VideoFrame$Buffer;Lio/agora/base/internal/video/CodecSpecificInfo;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$7;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 2
    .line 3
    iput-object p2, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$7;->val$videoFrame:Lio/agora/base/VideoFrame;

    .line 4
    .line 5
    iput-object p3, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$7;->val$videoFrameBuffer:Lio/agora/base/VideoFrame$Buffer;

    .line 6
    .line 7
    iput-object p4, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$7;->val$codecSpecificInfo:Lio/agora/base/internal/video/CodecSpecificInfo;

    .line 8
    .line 9
    iput p5, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$7;->val$bufferSize:I

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
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    const-string v1, "HardwareVideoEncoder"

    .line 2
    .line 3
    iget-object v0, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$7;->val$videoFrame:Lio/agora/base/VideoFrame;

    .line 4
    .line 5
    invoke-virtual {v0}, Lio/agora/base/VideoFrame;->getTimestampNs()J

    .line 6
    .line 7
    .line 8
    move-result-wide v2

    .line 9
    const-wide/16 v4, 0x1f4

    .line 10
    .line 11
    add-long/2addr v2, v4

    .line 12
    const-wide/16 v4, 0x3e8

    .line 13
    .line 14
    div-long/2addr v2, v4

    .line 15
    iget-object v0, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$7;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 16
    .line 17
    invoke-static {v0}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$1600(Lio/agora/base/internal/video/HardwareVideoEncoder;)J

    .line 18
    .line 19
    .line 20
    move-result-wide v4

    .line 21
    cmp-long v0, v4, v2

    .line 22
    .line 23
    iget-object v4, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$7;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 24
    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    invoke-static {v4}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$1604(Lio/agora/base/internal/video/HardwareVideoEncoder;)J

    .line 28
    .line 29
    .line 30
    move-result-wide v2

    .line 31
    :goto_0
    move-wide v8, v2

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    invoke-static {v4, v2, v3}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$1602(Lio/agora/base/internal/video/HardwareVideoEncoder;J)J

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :goto_1
    :try_start_0
    iget-object v0, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$7;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 38
    .line 39
    invoke-static {v0}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$100(Lio/agora/base/internal/video/HardwareVideoEncoder;)Lio/agora/base/internal/video/MediaCodecWrapper;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const-wide/16 v2, 0x0

    .line 44
    .line 45
    invoke-interface {v0, v2, v3}, Lio/agora/base/internal/video/MediaCodecWrapper;->dequeueInputBuffer(J)I

    .line 46
    .line 47
    .line 48
    move-result v5
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_2

    .line 49
    iget-object v0, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$7;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 50
    .line 51
    const/4 v2, -0x1

    .line 52
    if-ne v5, v2, :cond_1

    .line 53
    .line 54
    invoke-static {v0}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$1008(Lio/agora/base/internal/video/HardwareVideoEncoder;)I

    .line 55
    .line 56
    .line 57
    const-string p0, "Dropped frame, no input buffers available"

    .line 58
    .line 59
    invoke-static {v1, p0}, Lio/agora/base/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    sget-object p0, Lio/agora/base/internal/video/VideoCodecStatus;->NO_OUTPUT:Lio/agora/base/internal/video/VideoCodecStatus;

    .line 63
    .line 64
    return-object p0

    .line 65
    :cond_1
    const/4 v2, 0x0

    .line 66
    invoke-static {v0, v2}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$1002(Lio/agora/base/internal/video/HardwareVideoEncoder;I)I

    .line 67
    .line 68
    .line 69
    :try_start_1
    iget-object v0, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$7;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 70
    .line 71
    invoke-static {v0}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$100(Lio/agora/base/internal/video/HardwareVideoEncoder;)Lio/agora/base/internal/video/MediaCodecWrapper;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-interface {v0}, Lio/agora/base/internal/video/MediaCodecWrapper;->getInputBuffers()[Ljava/nio/ByteBuffer;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    aget-object v0, v0, v5
    :try_end_1
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_1

    .line 80
    .line 81
    iget-object v2, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$7;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 82
    .line 83
    iget-object v3, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$7;->val$videoFrameBuffer:Lio/agora/base/VideoFrame$Buffer;

    .line 84
    .line 85
    invoke-virtual {v2, v0, v3}, Lio/agora/base/internal/video/HardwareVideoEncoder;->fillInputBuffer(Ljava/nio/ByteBuffer;Lio/agora/base/VideoFrame$Buffer;)V

    .line 86
    .line 87
    .line 88
    new-instance v2, Lio/agora/base/internal/video/HardwareVideoEncoder$TimeStamps;

    .line 89
    .line 90
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 91
    .line 92
    .line 93
    move-result-wide v3

    .line 94
    invoke-direct {v2, v3, v4, v8, v9}, Lio/agora/base/internal/video/HardwareVideoEncoder$TimeStamps;-><init>(JJ)V

    .line 95
    .line 96
    .line 97
    :try_start_2
    iget-object v0, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$7;->val$codecSpecificInfo:Lio/agora/base/internal/video/CodecSpecificInfo;

    .line 98
    .line 99
    if-eqz v0, :cond_2

    .line 100
    .line 101
    iget-object v0, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$7;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 102
    .line 103
    invoke-static {v0}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$1500(Lio/agora/base/internal/video/HardwareVideoEncoder;)Ljava/util/Map;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 108
    .line 109
    .line 110
    move-result-object v3

    .line 111
    iget-object v4, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$7;->val$codecSpecificInfo:Lio/agora/base/internal/video/CodecSpecificInfo;

    .line 112
    .line 113
    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    goto :goto_2

    .line 117
    :catch_0
    move-exception v0

    .line 118
    goto :goto_3

    .line 119
    :cond_2
    :goto_2
    iget-object v0, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$7;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 120
    .line 121
    invoke-static {v0}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$100(Lio/agora/base/internal/video/HardwareVideoEncoder;)Lio/agora/base/internal/video/MediaCodecWrapper;

    .line 122
    .line 123
    .line 124
    move-result-object v4

    .line 125
    iget v7, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$7;->val$bufferSize:I

    .line 126
    .line 127
    const/4 v10, 0x0

    .line 128
    const/4 v6, 0x0

    .line 129
    invoke-interface/range {v4 .. v10}, Lio/agora/base/internal/video/MediaCodecWrapper;->queueInputBuffer(IIIJI)V

    .line 130
    .line 131
    .line 132
    iget-object v0, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$7;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 133
    .line 134
    invoke-static {v0}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$1400(Lio/agora/base/internal/video/HardwareVideoEncoder;)Ljava/util/Queue;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    invoke-interface {v0, v2}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_0

    .line 139
    .line 140
    .line 141
    sget-object p0, Lio/agora/base/internal/video/VideoCodecStatus;->OK:Lio/agora/base/internal/video/VideoCodecStatus;

    .line 142
    .line 143
    return-object p0

    .line 144
    :goto_3
    const-string v3, "queueInputBuffer failed"

    .line 145
    .line 146
    invoke-static {v1, v3, v0}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 147
    .line 148
    .line 149
    iget-object v1, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$7;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 150
    .line 151
    invoke-static {v1}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$1500(Lio/agora/base/internal/video/HardwareVideoEncoder;)Ljava/util/Map;

    .line 152
    .line 153
    .line 154
    move-result-object v1

    .line 155
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 156
    .line 157
    .line 158
    move-result-object v3

    .line 159
    invoke-interface {v1, v3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 160
    .line 161
    .line 162
    iget-object v1, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$7;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 163
    .line 164
    invoke-static {v1}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$1400(Lio/agora/base/internal/video/HardwareVideoEncoder;)Ljava/util/Queue;

    .line 165
    .line 166
    .line 167
    move-result-object v1

    .line 168
    invoke-interface {v1, v2}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    .line 169
    .line 170
    .line 171
    iget-object p0, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$7;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 172
    .line 173
    invoke-static {p0}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$1700(Lio/agora/base/internal/video/HardwareVideoEncoder;)Z

    .line 174
    .line 175
    .line 176
    move-result p0

    .line 177
    if-nez p0, :cond_3

    .line 178
    .line 179
    sget-object p0, Lio/agora/base/internal/video/VideoCodecStatus;->FALLBACK_SOFTWARE:Lio/agora/base/internal/video/VideoCodecStatus;

    .line 180
    .line 181
    return-object p0

    .line 182
    :cond_3
    invoke-static {v0}, Lio/agora/base/internal/video/MediaCodecUtils;->isMediaCodecException(Ljava/lang/RuntimeException;)Lio/agora/base/internal/video/VideoCodecStatus;

    .line 183
    .line 184
    .line 185
    move-result-object p0

    .line 186
    return-object p0

    .line 187
    :catch_1
    move-exception v0

    .line 188
    const-string v2, "getInputBuffers failed"

    .line 189
    .line 190
    invoke-static {v1, v2, v0}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 191
    .line 192
    .line 193
    iget-object p0, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$7;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 194
    .line 195
    invoke-static {p0}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$1700(Lio/agora/base/internal/video/HardwareVideoEncoder;)Z

    .line 196
    .line 197
    .line 198
    move-result p0

    .line 199
    if-nez p0, :cond_4

    .line 200
    .line 201
    sget-object p0, Lio/agora/base/internal/video/VideoCodecStatus;->FALLBACK_SOFTWARE:Lio/agora/base/internal/video/VideoCodecStatus;

    .line 202
    .line 203
    return-object p0

    .line 204
    :cond_4
    invoke-static {v0}, Lio/agora/base/internal/video/MediaCodecUtils;->isMediaCodecException(Ljava/lang/RuntimeException;)Lio/agora/base/internal/video/VideoCodecStatus;

    .line 205
    .line 206
    .line 207
    move-result-object p0

    .line 208
    return-object p0

    .line 209
    :catch_2
    move-exception v0

    .line 210
    const-string v2, "dequeueInputBuffer failed"

    .line 211
    .line 212
    invoke-static {v1, v2, v0}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 213
    .line 214
    .line 215
    iget-object p0, p0, Lio/agora/base/internal/video/HardwareVideoEncoder$7;->this$0:Lio/agora/base/internal/video/HardwareVideoEncoder;

    .line 216
    .line 217
    invoke-static {p0}, Lio/agora/base/internal/video/HardwareVideoEncoder;->access$1700(Lio/agora/base/internal/video/HardwareVideoEncoder;)Z

    .line 218
    .line 219
    .line 220
    move-result p0

    .line 221
    if-nez p0, :cond_5

    .line 222
    .line 223
    sget-object p0, Lio/agora/base/internal/video/VideoCodecStatus;->FALLBACK_SOFTWARE:Lio/agora/base/internal/video/VideoCodecStatus;

    .line 224
    .line 225
    return-object p0

    .line 226
    :cond_5
    invoke-static {v0}, Lio/agora/base/internal/video/MediaCodecUtils;->isMediaCodecException(Ljava/lang/RuntimeException;)Lio/agora/base/internal/video/VideoCodecStatus;

    .line 227
    .line 228
    .line 229
    move-result-object p0

    .line 230
    return-object p0
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 231
    invoke-virtual {p0}, Lio/agora/base/internal/video/HardwareVideoEncoder$7;->call()Lio/agora/base/internal/video/VideoCodecStatus;

    move-result-object p0

    return-object p0
.end method
