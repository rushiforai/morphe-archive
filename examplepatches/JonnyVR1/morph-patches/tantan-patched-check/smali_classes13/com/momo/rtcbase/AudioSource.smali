.class public Lcom/momo/rtcbase/AudioSource;
.super Lcom/momo/rtcbase/MediaSource;
.source "SourceFile"


# direct methods
.method public constructor <init>(J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/momo/rtcbase/MediaSource;-><init>(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getNativeAudioSource()J
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/momo/rtcbase/MediaSource;->getNativeMediaSource()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    return-wide v0
.end method
