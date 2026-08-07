.class public Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/IRtcEngineEventHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RemoteVideoStats"
.end annotation


# instance fields
.field public avSyncTimeMs:I

.field public decoderOutputFrameRate:I

.field public delay:I

.field public e2eDelay:I

.field public frameLossRate:I

.field public frozenRate:I

.field public height:I

.field public mosValue:I

.field public packetLossRate:I

.field public publishDuration:J

.field public receivedBitrate:I

.field public rendererOutputFrameRate:I

.field public rxStreamType:I

.field public rxVideoBytes:I

.field public totalActiveTime:J

.field public totalFrozenTime:I

.field public uid:I

.field public width:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
