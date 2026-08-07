.class public interface abstract Lcom/momo/rtcbase/PeerConnection$Observer;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/rtcbase/PeerConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Observer"
.end annotation


# virtual methods
.method public abstract onAddStream(Lcom/momo/rtcbase/MediaStream;)V
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "Observer"
    .end annotation
.end method

.method public abstract onAddTrack(Lcom/momo/rtcbase/RtpReceiver;[Lcom/momo/rtcbase/MediaStream;)V
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "Observer"
    .end annotation
.end method

.method public onConnectionChange(Lcom/momo/rtcbase/PeerConnection$PeerConnectionState;)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "Observer"
    .end annotation

    return-void
.end method

.method public abstract onDataChannel(Lcom/momo/rtcbase/DataChannel;)V
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "Observer"
    .end annotation
.end method

.method public abstract onIceCandidate(Lcom/momo/rtcbase/IceCandidate;)V
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "Observer"
    .end annotation
.end method

.method public abstract onIceCandidatesRemoved([Lcom/momo/rtcbase/IceCandidate;)V
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "Observer"
    .end annotation
.end method

.method public abstract onIceConnectionChange(Lcom/momo/rtcbase/PeerConnection$IceConnectionState;)V
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "Observer"
    .end annotation
.end method

.method public abstract onIceConnectionReceivingChange(Z)V
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "Observer"
    .end annotation
.end method

.method public abstract onIceGatheringChange(Lcom/momo/rtcbase/PeerConnection$IceGatheringState;)V
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "Observer"
    .end annotation
.end method

.method public abstract onRemoveStream(Lcom/momo/rtcbase/MediaStream;)V
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "Observer"
    .end annotation
.end method

.method public abstract onRenegotiationNeeded()V
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "Observer"
    .end annotation
.end method

.method public abstract onSignalingChange(Lcom/momo/rtcbase/PeerConnection$SignalingState;)V
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "Observer"
    .end annotation
.end method

.method public onTrack(Lcom/momo/rtcbase/RtpTransceiver;)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "Observer"
    .end annotation

    return-void
.end method
