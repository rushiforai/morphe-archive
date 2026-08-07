.class public interface abstract Lcom/ss/bytertc/engine/video/IVideoDeviceManager;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract enumerateVideoCaptureDevices()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/ss/bytertc/engine/video/VideoDeviceInfo;",
            ">;"
        }
    .end annotation
.end method

.method public abstract setVideoCaptureDevice(Ljava/lang/String;)I
.end method
