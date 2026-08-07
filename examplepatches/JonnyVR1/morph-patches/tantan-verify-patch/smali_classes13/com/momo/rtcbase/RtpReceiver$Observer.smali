.class public interface abstract Lcom/momo/rtcbase/RtpReceiver$Observer;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/rtcbase/RtpReceiver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Observer"
.end annotation


# virtual methods
.method public abstract onFirstPacketReceived(Lcom/momo/rtcbase/MediaStreamTrack$MediaType;)V
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "Observer"
    .end annotation
.end method
