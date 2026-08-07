.class public Lio/agora/rtc2/video/VideoSubscriptionOptions;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/agora/rtc2/video/VideoSubscriptionOptions$REMOTE_VIDEO_STREAM_TYPE;
    }
.end annotation


# instance fields
.field private encodedFrameOnly:Ljava/lang/Boolean;

.field private streamType:Lio/agora/rtc2/video/VideoSubscriptionOptions$REMOTE_VIDEO_STREAM_TYPE;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lio/agora/rtc2/video/VideoSubscriptionOptions$REMOTE_VIDEO_STREAM_TYPE;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    iput-object p2, p0, Lio/agora/rtc2/video/VideoSubscriptionOptions;->encodedFrameOnly:Ljava/lang/Boolean;

    iput-object p1, p0, Lio/agora/rtc2/video/VideoSubscriptionOptions;->streamType:Lio/agora/rtc2/video/VideoSubscriptionOptions$REMOTE_VIDEO_STREAM_TYPE;

    return-void
.end method


# virtual methods
.method public getStreamType()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/video/VideoSubscriptionOptions;->streamType:Lio/agora/rtc2/video/VideoSubscriptionOptions$REMOTE_VIDEO_STREAM_TYPE;

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    return p0
.end method

.method public isEncodedFrameOnly()Z
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/video/VideoSubscriptionOptions;->encodedFrameOnly:Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0
.end method

.method public setEncodedFrameOnly(Z)V
    .locals 0

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    iput-object p1, p0, Lio/agora/rtc2/video/VideoSubscriptionOptions;->encodedFrameOnly:Ljava/lang/Boolean;

    return-void
.end method

.method public setStreamType(Lio/agora/rtc2/video/VideoSubscriptionOptions$REMOTE_VIDEO_STREAM_TYPE;)V
    .locals 0

    iput-object p1, p0, Lio/agora/rtc2/video/VideoSubscriptionOptions;->streamType:Lio/agora/rtc2/video/VideoSubscriptionOptions$REMOTE_VIDEO_STREAM_TYPE;

    return-void
.end method
