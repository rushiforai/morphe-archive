.class public interface abstract Lio/agora/rtc2/internal/AudioRoutingController$AudioDeviceChangedSpecialMonitor;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/internal/AudioRoutingController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "AudioDeviceChangedSpecialMonitor"
.end annotation


# virtual methods
.method public abstract AudioDeviceChangeCallback(ZLandroid/media/AudioDeviceInfo;)V
.end method

.method public abstract GetUSBDevicePID(I)Ljava/lang/String;
.end method

.method public abstract GetUSBDeviceVID(I)Ljava/lang/String;
.end method

.method public abstract GetUSBRouteType()I
.end method
