.class public Lio/agora/rtc2/IRtcEngineEventHandler$LocalAudioStats;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/IRtcEngineEventHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "LocalAudioStats"
.end annotation


# instance fields
.field public aecEstimatedDelay:I

.field public audioDeviceDelay:I

.field public audioPlayoutDelay:I

.field public earMonitorDelay:I

.field public internalCodec:I

.field public numChannels:I

.field public sentBitrate:I

.field public sentSampleRate:I

.field public txPacketLossRate:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
