.class public Lcom/ss/bytertc/engine/NativeVideoDeviceManagerFunctions;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static native nativeEnumerateVideoCaptureDevices(J)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Ljava/util/List<",
            "Lcom/ss/bytertc/engine/video/VideoDeviceInfo;",
            ">;"
        }
    .end annotation
.end method

.method public static native nativeSetVideoCaptureDevice(JLjava/lang/String;)I
.end method
