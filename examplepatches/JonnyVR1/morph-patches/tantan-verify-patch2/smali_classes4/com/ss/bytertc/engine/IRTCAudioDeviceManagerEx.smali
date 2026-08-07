.class public interface abstract Lcom/ss/bytertc/engine/IRTCAudioDeviceManagerEx;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/bytertc/engine/IRTCAudioDeviceManagerEx$IRTCAudioDeviceEventHandler;
    }
.end annotation


# virtual methods
.method public abstract setEnableSpeakerphone(Z)V
.end method

.method public abstract startAudioCaptureDeviceTest(I)I
.end method

.method public abstract startAudioPlaybackDeviceTest(Ljava/lang/String;I)I
.end method

.method public abstract stopAudioCaptureDeviceTest()I
.end method

.method public abstract stopAudioPlaybackDeviceTest()I
.end method
