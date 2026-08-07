.class public interface abstract Lcom/momo/rtcbase/SdpObserver;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract onCreateFailure(Ljava/lang/String;)V
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation
.end method

.method public abstract onCreateSuccess(Lcom/momo/rtcbase/SessionDescription;)V
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation
.end method

.method public abstract onSetFailure(Ljava/lang/String;)V
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation
.end method

.method public abstract onSetSuccess()V
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation
.end method
