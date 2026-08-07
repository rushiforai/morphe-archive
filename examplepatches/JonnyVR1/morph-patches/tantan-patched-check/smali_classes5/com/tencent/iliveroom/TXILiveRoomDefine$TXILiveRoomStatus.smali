.class public Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/iliveroom/TXILiveRoomDefine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TXILiveRoomStatus"
.end annotation


# instance fields
.field public appCpu:I

.field public audioBitrate:I

.field public audioBlockCount:I

.field public audioCacheDuration:I

.field public audioCaptureBytes:J

.field public audioEncodeBytes:J

.field public audioExpandBlockCnt:I

.field public audioExpandCnt:I

.field public audioFecRatio:I

.field public audioLossRate:I

.field public audioTotalBytes:J

.field public audioUpCacheFrames:I

.field public avPlayTimeInterval:I

.field public avRecvTimeInterval:I

.field public netSpeed:I

.field public point2PointDelay:I

.field public rtt:I

.field public serverAddr:Ljava/lang/String;

.field public sysCpu:I

.field public upLossRate:I

.field public userId:J

.field public videoBitrate:I

.field public videoCacheDuration:I

.field public videoDecoderCacheFrames:I

.field public videoEncodeBytes:J

.field public videoFecRatio:I

.field public videoFps:I

.field public videoFramesDrop:I

.field public videoGop:I

.field public videoHeight:I

.field public videoJitterCacheFrames:I

.field public videoLossRate:I

.field public videoRecvFPS:I

.field public videoTotalBytes:J

.field public videoUpCacheFrames:I

.field public videoWidth:I


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->userId:J

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    iput v2, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->appCpu:I

    .line 10
    .line 11
    iput v2, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->sysCpu:I

    .line 12
    .line 13
    iput v2, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->rtt:I

    .line 14
    .line 15
    iput v2, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->videoFps:I

    .line 16
    .line 17
    iput v2, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->videoWidth:I

    .line 18
    .line 19
    iput v2, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->videoHeight:I

    .line 20
    .line 21
    iput v2, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->videoGop:I

    .line 22
    .line 23
    iput v2, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->netSpeed:I

    .line 24
    .line 25
    iput v2, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->videoBitrate:I

    .line 26
    .line 27
    iput v2, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->audioBitrate:I

    .line 28
    .line 29
    iput-wide v0, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->audioTotalBytes:J

    .line 30
    .line 31
    iput-wide v0, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->videoTotalBytes:J

    .line 32
    .line 33
    iput-wide v0, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->audioCaptureBytes:J

    .line 34
    .line 35
    iput-wide v0, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->audioEncodeBytes:J

    .line 36
    .line 37
    iput-wide v0, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->videoEncodeBytes:J

    .line 38
    .line 39
    iput v2, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->videoCacheDuration:I

    .line 40
    .line 41
    iput v2, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->audioCacheDuration:I

    .line 42
    .line 43
    iput v2, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->videoJitterCacheFrames:I

    .line 44
    .line 45
    iput v2, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->videoDecoderCacheFrames:I

    .line 46
    .line 47
    iput v2, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->avRecvTimeInterval:I

    .line 48
    .line 49
    iput v2, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->avPlayTimeInterval:I

    .line 50
    .line 51
    iput v2, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->videoUpCacheFrames:I

    .line 52
    .line 53
    iput v2, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->audioUpCacheFrames:I

    .line 54
    .line 55
    iput v2, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->audioBlockCount:I

    .line 56
    .line 57
    iput v2, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->audioExpandCnt:I

    .line 58
    .line 59
    iput v2, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->audioExpandBlockCnt:I

    .line 60
    .line 61
    iput v2, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->audioLossRate:I

    .line 62
    .line 63
    iput v2, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->videoLossRate:I

    .line 64
    .line 65
    iput v2, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->upLossRate:I

    .line 66
    .line 67
    iput v2, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->audioFecRatio:I

    .line 68
    .line 69
    iput v2, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->videoFecRatio:I

    .line 70
    .line 71
    iput v2, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->videoRecvFPS:I

    .line 72
    .line 73
    iput v2, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->videoFramesDrop:I

    .line 74
    .line 75
    iput v2, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;->point2PointDelay:I

    .line 76
    .line 77
    return-void
.end method
