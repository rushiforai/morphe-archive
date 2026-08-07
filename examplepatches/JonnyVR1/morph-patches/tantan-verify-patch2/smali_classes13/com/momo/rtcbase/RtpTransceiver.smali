.class public Lcom/momo/rtcbase/RtpTransceiver;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverInit;,
        Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;
    }
.end annotation


# instance fields
.field private cachedReceiver:Lcom/momo/rtcbase/RtpReceiver;

.field private cachedSender:Lcom/momo/rtcbase/RtpSender;

.field private nativeRtpTransceiver:J


# direct methods
.method public constructor <init>(J)V
    .locals 1
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Lcom/momo/rtcbase/RtpTransceiver;->nativeRtpTransceiver:J

    .line 5
    .line 6
    invoke-static {p1, p2}, Lcom/momo/rtcbase/RtpTransceiver;->nativeGetSender(J)Lcom/momo/rtcbase/RtpSender;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lcom/momo/rtcbase/RtpTransceiver;->cachedSender:Lcom/momo/rtcbase/RtpSender;

    .line 11
    .line 12
    invoke-static {p1, p2}, Lcom/momo/rtcbase/RtpTransceiver;->nativeGetReceiver(J)Lcom/momo/rtcbase/RtpReceiver;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iput-object p1, p0, Lcom/momo/rtcbase/RtpTransceiver;->cachedReceiver:Lcom/momo/rtcbase/RtpReceiver;

    .line 17
    .line 18
    return-void
.end method

.method private checkRtpTransceiverExists()V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/momo/rtcbase/RtpTransceiver;->nativeRtpTransceiver:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long p0, v0, v2

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    const-string p0, "RtpTransceiver has been disposed."

    .line 11
    .line 12
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private static native nativeCurrentDirection(J)Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;
.end method

.method private static native nativeDirection(J)Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;
.end method

.method private static native nativeGetMediaType(J)Lcom/momo/rtcbase/MediaStreamTrack$MediaType;
.end method

.method private static native nativeGetMid(J)Ljava/lang/String;
.end method

.method private static native nativeGetReceiver(J)Lcom/momo/rtcbase/RtpReceiver;
.end method

.method private static native nativeGetSender(J)Lcom/momo/rtcbase/RtpSender;
.end method

.method private static native nativeSetDirection(JLcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;)V
.end method

.method private static native nativeStop(J)V
.end method

.method private static native nativeStopped(J)Z
.end method


# virtual methods
.method public dispose()V
    .locals 2
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/RtpTransceiver;->checkRtpTransceiverExists()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/momo/rtcbase/RtpTransceiver;->cachedSender:Lcom/momo/rtcbase/RtpSender;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/momo/rtcbase/RtpSender;->dispose()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/momo/rtcbase/RtpTransceiver;->cachedReceiver:Lcom/momo/rtcbase/RtpReceiver;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/momo/rtcbase/RtpReceiver;->dispose()V

    .line 12
    .line 13
    .line 14
    iget-wide v0, p0, Lcom/momo/rtcbase/RtpTransceiver;->nativeRtpTransceiver:J

    .line 15
    .line 16
    invoke-static {v0, v1}, Lcom/momo/rtcbase/JniCommon;->nativeReleaseRef(J)V

    .line 17
    .line 18
    .line 19
    const-wide/16 v0, 0x0

    .line 20
    .line 21
    iput-wide v0, p0, Lcom/momo/rtcbase/RtpTransceiver;->nativeRtpTransceiver:J

    .line 22
    .line 23
    return-void
.end method

.method public getCurrentDirection()Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/RtpTransceiver;->checkRtpTransceiverExists()V

    .line 2
    .line 3
    .line 4
    iget-wide v0, p0, Lcom/momo/rtcbase/RtpTransceiver;->nativeRtpTransceiver:J

    .line 5
    .line 6
    invoke-static {v0, v1}, Lcom/momo/rtcbase/RtpTransceiver;->nativeCurrentDirection(J)Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public getDirection()Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/RtpTransceiver;->checkRtpTransceiverExists()V

    .line 2
    .line 3
    .line 4
    iget-wide v0, p0, Lcom/momo/rtcbase/RtpTransceiver;->nativeRtpTransceiver:J

    .line 5
    .line 6
    invoke-static {v0, v1}, Lcom/momo/rtcbase/RtpTransceiver;->nativeDirection(J)Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public getMediaType()Lcom/momo/rtcbase/MediaStreamTrack$MediaType;
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/RtpTransceiver;->checkRtpTransceiverExists()V

    .line 2
    .line 3
    .line 4
    iget-wide v0, p0, Lcom/momo/rtcbase/RtpTransceiver;->nativeRtpTransceiver:J

    .line 5
    .line 6
    invoke-static {v0, v1}, Lcom/momo/rtcbase/RtpTransceiver;->nativeGetMediaType(J)Lcom/momo/rtcbase/MediaStreamTrack$MediaType;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public getMid()Ljava/lang/String;
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/RtpTransceiver;->checkRtpTransceiverExists()V

    .line 2
    .line 3
    .line 4
    iget-wide v0, p0, Lcom/momo/rtcbase/RtpTransceiver;->nativeRtpTransceiver:J

    .line 5
    .line 6
    invoke-static {v0, v1}, Lcom/momo/rtcbase/RtpTransceiver;->nativeGetMid(J)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public getReceiver()Lcom/momo/rtcbase/RtpReceiver;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/RtpTransceiver;->cachedReceiver:Lcom/momo/rtcbase/RtpReceiver;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSender()Lcom/momo/rtcbase/RtpSender;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/RtpTransceiver;->cachedSender:Lcom/momo/rtcbase/RtpSender;

    .line 2
    .line 3
    return-object p0
.end method

.method public isStopped()Z
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/RtpTransceiver;->checkRtpTransceiverExists()V

    .line 2
    .line 3
    .line 4
    iget-wide v0, p0, Lcom/momo/rtcbase/RtpTransceiver;->nativeRtpTransceiver:J

    .line 5
    .line 6
    invoke-static {v0, v1}, Lcom/momo/rtcbase/RtpTransceiver;->nativeStopped(J)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public setDirection(Lcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/RtpTransceiver;->checkRtpTransceiverExists()V

    .line 2
    .line 3
    .line 4
    iget-wide v0, p0, Lcom/momo/rtcbase/RtpTransceiver;->nativeRtpTransceiver:J

    .line 5
    .line 6
    invoke-static {v0, v1, p1}, Lcom/momo/rtcbase/RtpTransceiver;->nativeSetDirection(JLcom/momo/rtcbase/RtpTransceiver$RtpTransceiverDirection;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public stop()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/RtpTransceiver;->checkRtpTransceiverExists()V

    .line 2
    .line 3
    .line 4
    iget-wide v0, p0, Lcom/momo/rtcbase/RtpTransceiver;->nativeRtpTransceiver:J

    .line 5
    .line 6
    invoke-static {v0, v1}, Lcom/momo/rtcbase/RtpTransceiver;->nativeStop(J)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
