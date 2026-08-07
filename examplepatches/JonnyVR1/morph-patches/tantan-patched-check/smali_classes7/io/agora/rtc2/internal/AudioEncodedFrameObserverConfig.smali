.class public Lio/agora/rtc2/internal/AudioEncodedFrameObserverConfig;
.super Ljava/lang/Object;


# instance fields
.field public encodingType:I

.field public postionType:I


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x2

    iput v0, p0, Lio/agora/rtc2/internal/AudioEncodedFrameObserverConfig;->postionType:I

    const v0, 0x20302

    iput v0, p0, Lio/agora/rtc2/internal/AudioEncodedFrameObserverConfig;->encodingType:I

    return-void
.end method
