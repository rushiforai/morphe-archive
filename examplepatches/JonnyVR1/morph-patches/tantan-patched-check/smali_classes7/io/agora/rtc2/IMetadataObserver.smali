.class public interface abstract Lio/agora/rtc2/IMetadataObserver;
.super Ljava/lang/Object;


# static fields
.field public static final UNKNOWN_METADATA:I = -0x1

.field public static final VIDEO_METADATA:I


# virtual methods
.method public abstract getMaxMetadataSize()I
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation
.end method

.method public abstract onMetadataReceived(Lio/agora/rtc2/video/AgoraMetadata;)V
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation
.end method

.method public abstract onReadyToSendMetadata(JI)[B
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation
.end method
