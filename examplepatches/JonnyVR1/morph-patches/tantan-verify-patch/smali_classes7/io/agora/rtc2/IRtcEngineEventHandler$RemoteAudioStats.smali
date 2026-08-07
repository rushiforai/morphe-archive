.class public Lio/agora/rtc2/IRtcEngineEventHandler$RemoteAudioStats;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/IRtcEngineEventHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RemoteAudioStats"
.end annotation


# instance fields
.field public audioLossRate:I

.field public e2eDelay:I

.field public frozenCntByCustom:I

.field public frozenRate:I

.field public frozenRateByCustomPlcCount:I

.field public frozenTimeByCustom:I

.field public jitterBufferDelay:I

.field public mosValue:I

.field public networkTransportDelay:I

.field public numChannels:I

.field public plcCount:I

.field public publishDuration:J

.field public qoeQuality:I

.field public quality:I

.field public qualityChangedReason:I

.field public receivedBitrate:I

.field public receivedSampleRate:I

.field public rxAudioBytes:I

.field public totalActiveTime:J

.field public totalFrozenTime:I

.field public uid:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
