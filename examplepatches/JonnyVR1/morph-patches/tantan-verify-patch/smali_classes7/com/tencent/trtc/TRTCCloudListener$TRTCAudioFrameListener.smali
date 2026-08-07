.class public interface abstract Lcom/tencent/trtc/TRTCCloudListener$TRTCAudioFrameListener;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/trtc/TRTCCloudListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "TRTCAudioFrameListener"
.end annotation


# virtual methods
.method public abstract onCapturedRawAudioFrame(Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioFrame;)V
.end method

.method public abstract onLocalProcessedAudioFrame(Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioFrame;)V
.end method

.method public abstract onMixedPlayAudioFrame(Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioFrame;)V
.end method

.method public abstract onRemoteUserAudioFrame(Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioFrame;Ljava/lang/String;)V
.end method
