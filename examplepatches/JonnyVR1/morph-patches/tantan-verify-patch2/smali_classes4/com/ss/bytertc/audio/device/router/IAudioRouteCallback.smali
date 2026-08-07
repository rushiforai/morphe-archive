.class public interface abstract Lcom/ss/bytertc/audio/device/router/IAudioRouteCallback;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract onDeviceEvent(IZLjava/lang/String;)V
    .param p1    # I
        .annotation build Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$RoutingDeviceType;
        .end annotation
    .end param
.end method

.method public abstract onError(ILjava/lang/String;)V
.end method
