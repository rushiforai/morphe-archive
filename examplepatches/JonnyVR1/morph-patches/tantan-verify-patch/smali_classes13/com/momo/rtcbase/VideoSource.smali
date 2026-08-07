.class public Lcom/momo/rtcbase/VideoSource;
.super Lcom/momo/rtcbase/MediaSource;
.source "SourceFile"


# instance fields
.field private final capturerObserver:Lcom/momo/rtcbase/NativeCapturerObserver;


# direct methods
.method public constructor <init>(J)V
    .locals 1

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/momo/rtcbase/MediaSource;-><init>(J)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/momo/rtcbase/NativeCapturerObserver;

    .line 5
    .line 6
    invoke-static {p1, p2}, Lcom/momo/rtcbase/VideoSource;->nativeGetInternalSource(J)J

    .line 7
    .line 8
    .line 9
    move-result-wide p1

    .line 10
    invoke-direct {v0, p1, p2}, Lcom/momo/rtcbase/NativeCapturerObserver;-><init>(J)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/momo/rtcbase/VideoSource;->capturerObserver:Lcom/momo/rtcbase/NativeCapturerObserver;

    .line 14
    .line 15
    return-void
.end method

.method private static native nativeAdaptOutputFormat(JIIIII)V
.end method

.method private static native nativeGetInternalSource(J)J
.end method


# virtual methods
.method public adaptOutputFormat(III)V
    .locals 6

    .line 1
    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    .line 2
    .line 3
    .line 4
    move-result v1

    .line 5
    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    move v3, v2

    .line 10
    move v4, v1

    .line 11
    move-object v0, p0

    .line 12
    move v5, p3

    .line 13
    invoke-virtual/range {v0 .. v5}, Lcom/momo/rtcbase/VideoSource;->adaptOutputFormat(IIIII)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public adaptOutputFormat(IIIII)V
    .locals 7

    .line 17
    invoke-virtual {p0}, Lcom/momo/rtcbase/VideoSource;->getNativeVideoTrackSource()J

    move-result-wide v0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    invoke-static/range {v0 .. v6}, Lcom/momo/rtcbase/VideoSource;->nativeAdaptOutputFormat(JIIIII)V

    return-void
.end method

.method public getCapturerObserver()Lcom/momo/rtcbase/CapturerObserver;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/VideoSource;->capturerObserver:Lcom/momo/rtcbase/NativeCapturerObserver;

    .line 2
    .line 3
    return-object p0
.end method

.method public getNativeVideoTrackSource()J
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
