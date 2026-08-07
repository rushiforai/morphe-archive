.class public Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/IRtcEngineEventHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RtcStats"
.end annotation


# instance fields
.field public connectTimeMs:I

.field public cpuAppUsage:D

.field public cpuTotalUsage:D

.field public gatewayRtt:I

.field public lastmileDelay:I

.field public memoryAppUsageInKbytes:I

.field public memoryAppUsageRatio:D

.field public memoryTotalUsageRatio:D

.field public rxAudioBytes:I

.field public rxAudioKBitRate:I

.field public rxBytes:I

.field public rxKBitRate:I

.field public rxPacketLossRate:I

.field public rxVideoBytes:I

.field public rxVideoKBitRate:I

.field public totalDuration:I

.field public txAudioBytes:I

.field public txAudioKBitRate:I

.field public txBytes:I

.field public txKBitRate:I

.field public txPacketLossRate:I

.field public txVideoBytes:I

.field public txVideoKBitRate:I

.field public users:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
