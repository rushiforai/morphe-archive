.class public Lcom/momo/rtcbase/AudioTrack;
.super Lcom/momo/rtcbase/MediaStreamTrack;
.source "SourceFile"


# direct methods
.method public constructor <init>(J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/momo/rtcbase/MediaStreamTrack;-><init>(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static native nativeSetVolume(JD)V
.end method


# virtual methods
.method public getNativeAudioTrack()J
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/momo/rtcbase/MediaStreamTrack;->getNativeMediaStreamTrack()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    return-wide v0
.end method

.method public setVolume(D)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/momo/rtcbase/AudioTrack;->getNativeAudioTrack()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-static {v0, v1, p1, p2}, Lcom/momo/rtcbase/AudioTrack;->nativeSetVolume(JD)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
