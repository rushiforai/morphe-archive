.class public Lcom/tencent/iliveroom/a/b/c;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/tencent/iliveroom/a/a;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/tencent/iliveroom/a/a;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/tencent/iliveroom/a/b/c;->a:Ljava/lang/ref/WeakReference;

    .line 10
    .line 11
    return-void
.end method

.method private a(I)I
    .locals 2

    .line 225
    const/16 p0, 0xa

    if-ge p1, p0, :cond_0

    int-to-double p0, p1

    const-wide v0, 0x3ff68f5c28f5c28fL    # 1.41

    mul-double/2addr p0, v0

    double-to-int p0, p0

    return p0

    :cond_0
    add-int/lit8 p1, p1, 0x1a

    return p1
.end method

.method private a(Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;Lcom/tencent/trtc/TRTCStatistics;)Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;
    .locals 4

    .line 226
    :try_start_0
    iget-object p1, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->userId:Ljava/lang/String;

    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 227
    iget-object p1, p2, Lcom/tencent/trtc/TRTCStatistics;->localArray:Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/tencent/trtc/TRTCStatistics$TRTCLocalStatistics;

    .line 228
    new-instance v3, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;

    invoke-direct {v3}, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;-><init>()V

    .line 229
    iput-wide v0, v3, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->userId:J

    .line 230
    iget v0, p2, Lcom/tencent/trtc/TRTCStatistics;->appCpu:I

    iput v0, v3, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->appCpu:I

    .line 231
    iget v0, p2, Lcom/tencent/trtc/TRTCStatistics;->systemCpu:I

    iput v0, v3, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->sysCpu:I

    .line 232
    iget p2, p2, Lcom/tencent/trtc/TRTCStatistics;->rtt:I

    iput p2, v3, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->rtt:I

    .line 233
    iget p2, p1, Lcom/tencent/trtc/TRTCStatistics$TRTCLocalStatistics;->frameRate:I

    iput p2, v3, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->videoFps:I

    .line 234
    iget p2, p1, Lcom/tencent/trtc/TRTCStatistics$TRTCLocalStatistics;->width:I

    iput p2, v3, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->videoWidth:I

    .line 235
    iget p2, p1, Lcom/tencent/trtc/TRTCStatistics$TRTCLocalStatistics;->height:I

    iput p2, v3, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->videoHeight:I

    const/16 p2, 0x32cb

    .line 236
    const-string v0, "18446744073709551615"

    const/4 v1, 0x2

    invoke-static {v0, p2, v1}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;II)I

    move-result p2

    div-int/lit16 p2, p2, 0x3e8

    iput p2, v3, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->videoGop:I

    const/16 p2, 0x2ee1

    .line 237
    invoke-static {v0, p2}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    move-result p2

    iput p2, v3, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->netSpeed:I

    .line 238
    iget p2, p1, Lcom/tencent/trtc/TRTCStatistics$TRTCLocalStatistics;->videoBitrate:I

    iput p2, v3, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->videoBitrate:I

    .line 239
    iget p1, p1, Lcom/tencent/trtc/TRTCStatistics$TRTCLocalStatistics;->audioBitrate:I

    invoke-direct {p0, p1}, Lcom/tencent/iliveroom/a/b/c;->a(I)I

    move-result p0

    iput p0, v3, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->audioBitrate:I

    .line 240
    iput v2, v3, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->videoUpCacheFrames:I

    .line 241
    iput v2, v3, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->audioUpCacheFrames:I

    const/16 p0, 0x2711

    .line 242
    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/module/TXCStatus;->b(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p0

    iput-object p0, v3, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->serverAddr:Ljava/lang/String;

    const/16 p0, 0x2ee6

    .line 243
    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;I)J

    move-result-wide p0

    iput-wide p0, v3, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->audioTotalBytes:J

    const/16 p0, 0x2ee7

    .line 244
    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;I)J

    move-result-wide p0

    iput-wide p0, v3, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->videoTotalBytes:J

    const/16 p0, 0x2ee3

    .line 245
    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    move-result p1

    iput p1, v3, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->audioLossRate:I

    .line 246
    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    move-result p1

    iput p1, v3, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->videoLossRate:I

    .line 247
    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    move-result p0

    iput p0, v3, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->upLossRate:I

    const/16 p0, 0x32cc

    .line 248
    invoke-static {v0, p0, v1}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;II)I

    move-result p0

    iput p0, v3, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->videoFecRatio:I

    const/16 p0, 0x36b6

    .line 249
    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    move-result p0

    iput p0, v3, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->audioFecRatio:I

    .line 250
    invoke-static {v2}, Lcom/tencent/iliveroom/a/b/b;->a(I)J

    move-result-wide p0

    iput-wide p0, v3, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->audioCaptureBytes:J

    const/4 p0, 0x1

    .line 251
    invoke-static {p0}, Lcom/tencent/iliveroom/a/b/b;->a(I)J

    move-result-wide p0

    iput-wide p0, v3, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->audioEncodeBytes:J

    .line 252
    invoke-static {v1}, Lcom/tencent/iliveroom/a/b/b;->a(I)J

    move-result-wide p0

    iput-wide p0, v3, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->videoEncodeBytes:J

    return-object v3

    :catch_0
    const/4 p0, 0x0

    return-object p0
.end method

.method private a(Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;Lcom/tencent/trtc/TRTCStatistics;Lcom/tencent/trtc/TRTCStatistics$TRTCRemoteStatistics;)Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;
    .locals 6

    .line 1
    new-instance v0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    :try_start_0
    iget-object v2, p3, Lcom/tencent/trtc/TRTCStatistics$TRTCRemoteStatistics;->userId:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 10
    .line 11
    .line 12
    move-result-wide v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    iget-object v4, p3, Lcom/tencent/trtc/TRTCStatistics$TRTCRemoteStatistics;->userId:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p1, v4}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->getUser(Ljava/lang/String;)Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    return-object v1

    .line 22
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 25
    .line 26
    .line 27
    iget-wide v4, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->tinyID:J

    .line 28
    .line 29
    invoke-virtual {v1, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string v4, ""

    .line 33
    .line 34
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    iput-wide v2, v0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->userId:J

    .line 42
    .line 43
    iget v2, p3, Lcom/tencent/trtc/TRTCStatistics$TRTCRemoteStatistics;->frameRate:I

    .line 44
    .line 45
    iput v2, v0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->videoFps:I

    .line 46
    .line 47
    iget v2, p3, Lcom/tencent/trtc/TRTCStatistics$TRTCRemoteStatistics;->videoBitrate:I

    .line 48
    .line 49
    iput v2, v0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->videoBitrate:I

    .line 50
    .line 51
    iget v2, p3, Lcom/tencent/trtc/TRTCStatistics$TRTCRemoteStatistics;->audioBitrate:I

    .line 52
    .line 53
    invoke-direct {p0, v2}, Lcom/tencent/iliveroom/a/b/c;->a(I)I

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    iput p0, v0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->audioBitrate:I

    .line 58
    .line 59
    iget p0, p3, Lcom/tencent/trtc/TRTCStatistics$TRTCRemoteStatistics;->width:I

    .line 60
    .line 61
    iput p0, v0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->videoWidth:I

    .line 62
    .line 63
    iget p0, p3, Lcom/tencent/trtc/TRTCStatistics$TRTCRemoteStatistics;->height:I

    .line 64
    .line 65
    iput p0, v0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->videoHeight:I

    .line 66
    .line 67
    const/4 p0, 0x1

    .line 68
    iput p0, v0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->videoGop:I

    .line 69
    .line 70
    const/16 p0, 0x3e86

    .line 71
    .line 72
    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    int-to-long v2, p0

    .line 77
    iput-wide v2, v0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->audioTotalBytes:J

    .line 78
    .line 79
    const/16 p0, 0x3e85

    .line 80
    .line 81
    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    int-to-long v2, p0

    .line 86
    iput-wide v2, v0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->videoTotalBytes:J

    .line 87
    .line 88
    iget p0, p2, Lcom/tencent/trtc/TRTCStatistics;->rtt:I

    .line 89
    .line 90
    iput p0, v0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->rtt:I

    .line 91
    .line 92
    const-string p0, "18446744073709551615"

    .line 93
    .line 94
    const/16 p2, 0x2711

    .line 95
    .line 96
    invoke-static {p0, p2}, Lcom/tencent/liteav/basic/module/TXCStatus;->b(Ljava/lang/String;I)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    iput-object p0, v0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->serverAddr:Ljava/lang/String;

    .line 101
    .line 102
    const/16 p0, 0x426b

    .line 103
    .line 104
    const/4 p2, 0x2

    .line 105
    invoke-static {v1, p0, p2}, Lcom/tencent/liteav/basic/module/TXCStatus;->d(Ljava/lang/String;II)D

    .line 106
    .line 107
    .line 108
    move-result-wide v2

    .line 109
    const-wide/high16 v4, 0x3fe0000000000000L    # 0.5

    .line 110
    .line 111
    add-double/2addr v2, v4

    .line 112
    double-to-int p0, v2

    .line 113
    iput p0, v0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->videoRecvFPS:I

    .line 114
    .line 115
    const/16 p0, 0x4269

    .line 116
    .line 117
    invoke-static {v1, p0, p2}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;II)I

    .line 118
    .line 119
    .line 120
    move-result p0

    .line 121
    const/16 v2, 0x4651

    .line 122
    .line 123
    invoke-static {v1, v2}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 124
    .line 125
    .line 126
    move-result v2

    .line 127
    add-int/2addr p0, v2

    .line 128
    iput p0, v0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->netSpeed:I

    .line 129
    .line 130
    const/16 p0, 0x426e

    .line 131
    .line 132
    invoke-static {v1, p0, p2}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;II)I

    .line 133
    .line 134
    .line 135
    move-result p0

    .line 136
    iput p0, v0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->videoFecRatio:I

    .line 137
    .line 138
    const/16 p0, 0x4658

    .line 139
    .line 140
    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 141
    .line 142
    .line 143
    move-result p0

    .line 144
    iput p0, v0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->audioFecRatio:I

    .line 145
    .line 146
    iget p0, p3, Lcom/tencent/trtc/TRTCStatistics$TRTCRemoteStatistics;->audioPacketLoss:I

    .line 147
    .line 148
    iput p0, v0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->audioLossRate:I

    .line 149
    .line 150
    iget p0, p3, Lcom/tencent/trtc/TRTCStatistics$TRTCRemoteStatistics;->videoPacketLoss:I

    .line 151
    .line 152
    iput p0, v0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->videoLossRate:I

    .line 153
    .line 154
    iget p0, p3, Lcom/tencent/trtc/TRTCStatistics$TRTCRemoteStatistics;->point2PointDelay:I

    .line 155
    .line 156
    iput p0, v0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->point2PointDelay:I

    .line 157
    .line 158
    iget-object p0, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$UserInfo;->mainRender:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo$RenderInfo;

    .line 159
    .line 160
    if-eqz p0, :cond_2

    .line 161
    .line 162
    const/16 p0, 0x7d7

    .line 163
    .line 164
    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 165
    .line 166
    .line 167
    move-result p0

    .line 168
    iput p0, v0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->audioCacheDuration:I

    .line 169
    .line 170
    const/16 p0, 0x177a

    .line 171
    .line 172
    invoke-static {v1, p0, p2}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;II)I

    .line 173
    .line 174
    .line 175
    move-result p0

    .line 176
    iput p0, v0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->videoCacheDuration:I

    .line 177
    .line 178
    const/16 p0, 0x177b

    .line 179
    .line 180
    invoke-static {v1, p0, p2}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;II)I

    .line 181
    .line 182
    .line 183
    move-result p0

    .line 184
    const/16 p1, 0x177c

    .line 185
    .line 186
    invoke-static {v1, p1, p2}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;II)I

    .line 187
    .line 188
    .line 189
    move-result p1

    .line 190
    if-lt p0, p1, :cond_1

    .line 191
    .line 192
    sub-int/2addr p0, p1

    .line 193
    :cond_1
    iput p0, v0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->videoJitterCacheFrames:I

    .line 194
    .line 195
    iput p1, v0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->videoDecoderCacheFrames:I

    .line 196
    .line 197
    const/16 p0, 0x4275

    .line 198
    .line 199
    invoke-static {v1, p0, p2}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;II)I

    .line 200
    .line 201
    .line 202
    move-result p0

    .line 203
    iput p0, v0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->videoFramesDrop:I

    .line 204
    .line 205
    const/16 p0, 0x466b

    .line 206
    .line 207
    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 208
    .line 209
    .line 210
    move-result p0

    .line 211
    iput p0, v0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->audioBlockCount:I

    .line 212
    .line 213
    :cond_2
    return-object v0

    .line 214
    :catch_0
    return-object v1
.end method


# virtual methods
.method public a(Lcom/tencent/trtc/TRTCStatistics;)Ljava/util/ArrayList;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tencent/trtc/TRTCStatistics;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;",
            ">;"
        }
    .end annotation

    .line 215
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 216
    iget-object v1, p0, Lcom/tencent/iliveroom/a/b/c;->a:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/tencent/iliveroom/a/a;

    if-nez v1, :cond_0

    goto :goto_1

    .line 217
    :cond_0
    invoke-virtual {v1}, Lcom/tencent/iliveroom/a/a;->a()Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    move-result-object v1

    if-nez v1, :cond_1

    goto :goto_1

    .line 218
    :cond_1
    iget-object v2, p1, Lcom/tencent/trtc/TRTCStatistics;->localArray:Ljava/util/ArrayList;

    if-eqz v2, :cond_3

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_3

    .line 219
    invoke-direct {p0, v1, p1}, Lcom/tencent/iliveroom/a/b/c;->a(Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;Lcom/tencent/trtc/TRTCStatistics;)Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;

    move-result-object v2

    if-nez v2, :cond_2

    goto :goto_1

    .line 220
    :cond_2
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 221
    :cond_3
    iget-object v2, p1, Lcom/tencent/trtc/TRTCStatistics;->remoteArray:Ljava/util/ArrayList;

    if-eqz v2, :cond_5

    .line 222
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_4
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/tencent/trtc/TRTCStatistics$TRTCRemoteStatistics;

    .line 223
    invoke-direct {p0, v1, p1, v3}, Lcom/tencent/iliveroom/a/b/c;->a(Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;Lcom/tencent/trtc/TRTCStatistics;Lcom/tencent/trtc/TRTCStatistics$TRTCRemoteStatistics;)Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;

    move-result-object v3

    if-eqz v3, :cond_4

    .line 224
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_5
    :goto_1
    return-object v0
.end method
