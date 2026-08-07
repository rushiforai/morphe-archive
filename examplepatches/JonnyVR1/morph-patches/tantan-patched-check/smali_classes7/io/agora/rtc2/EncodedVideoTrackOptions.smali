.class public Lio/agora/rtc2/EncodedVideoTrackOptions;
.super Ljava/lang/Object;


# instance fields
.field public ccMode:I

.field public codecType:I

.field public targetBitrate:I


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lio/agora/rtc2/EncodedVideoTrackOptions;->ccMode:I

    const/4 v0, 0x3

    iput v0, p0, Lio/agora/rtc2/EncodedVideoTrackOptions;->codecType:I

    const/16 v0, 0x1964

    iput v0, p0, Lio/agora/rtc2/EncodedVideoTrackOptions;->targetBitrate:I

    return-void
.end method


# virtual methods
.method public getCcMode()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget p0, p0, Lio/agora/rtc2/EncodedVideoTrackOptions;->ccMode:I

    return p0
.end method

.method public getCodecType()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget p0, p0, Lio/agora/rtc2/EncodedVideoTrackOptions;->codecType:I

    return p0
.end method

.method public getTargetBitrate()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget p0, p0, Lio/agora/rtc2/EncodedVideoTrackOptions;->targetBitrate:I

    return p0
.end method
