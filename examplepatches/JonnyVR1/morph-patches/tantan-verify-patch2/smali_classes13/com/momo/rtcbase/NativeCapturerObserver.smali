.class Lcom/momo/rtcbase/NativeCapturerObserver;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/rtcbase/CapturerObserver;


# instance fields
.field private final nativeSource:J


# direct methods
.method public constructor <init>(J)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Lcom/momo/rtcbase/NativeCapturerObserver;->nativeSource:J

    .line 5
    .line 6
    return-void
.end method

.method private static native nativeCapturerStarted(JZ)V
.end method

.method private static native nativeCapturerStopped(J)V
.end method

.method private static native nativeOnFrameCaptured(JIIIJLcom/momo/rtcbase/VideoFrame$Buffer;)V
.end method


# virtual methods
.method public onCapturerStarted(Z)V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/rtcbase/NativeCapturerObserver;->nativeSource:J

    .line 2
    .line 3
    invoke-static {v0, v1, p1}, Lcom/momo/rtcbase/NativeCapturerObserver;->nativeCapturerStarted(JZ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onCapturerStopped()V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/rtcbase/NativeCapturerObserver;->nativeSource:J

    .line 2
    .line 3
    invoke-static {v0, v1}, Lcom/momo/rtcbase/NativeCapturerObserver;->nativeCapturerStopped(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onFrameCaptured(Lcom/momo/rtcbase/VideoFrame;)V
    .locals 8

    .line 1
    iget-wide v0, p0, Lcom/momo/rtcbase/NativeCapturerObserver;->nativeSource:J

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/momo/rtcbase/VideoFrame;->getBuffer()Lcom/momo/rtcbase/VideoFrame$Buffer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Lcom/momo/rtcbase/VideoFrame$Buffer;->getWidth()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    invoke-virtual {p1}, Lcom/momo/rtcbase/VideoFrame;->getBuffer()Lcom/momo/rtcbase/VideoFrame$Buffer;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0}, Lcom/momo/rtcbase/VideoFrame$Buffer;->getHeight()I

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    invoke-virtual {p1}, Lcom/momo/rtcbase/VideoFrame;->getRotation()I

    .line 20
    .line 21
    .line 22
    move-result v4

    .line 23
    invoke-virtual {p1}, Lcom/momo/rtcbase/VideoFrame;->getTimestampNs()J

    .line 24
    .line 25
    .line 26
    move-result-wide v5

    .line 27
    invoke-virtual {p1}, Lcom/momo/rtcbase/VideoFrame;->getBuffer()Lcom/momo/rtcbase/VideoFrame$Buffer;

    .line 28
    .line 29
    .line 30
    move-result-object v7

    .line 31
    invoke-static/range {v0 .. v7}, Lcom/momo/rtcbase/NativeCapturerObserver;->nativeOnFrameCaptured(JIIIJLcom/momo/rtcbase/VideoFrame$Buffer;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method
