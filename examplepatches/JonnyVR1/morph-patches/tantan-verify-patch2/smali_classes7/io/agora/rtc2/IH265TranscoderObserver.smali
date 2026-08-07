.class public interface abstract Lio/agora/rtc2/IH265TranscoderObserver;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/agora/rtc2/IH265TranscoderObserver$H265TranscodeResult;
    }
.end annotation


# virtual methods
.method public abstract onEnableTranscode(I)V
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation
.end method

.method public abstract onQueryChannel(ILjava/lang/String;Ljava/lang/String;)V
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation
.end method

.method public abstract onTriggerTranscode(I)V
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation
.end method
