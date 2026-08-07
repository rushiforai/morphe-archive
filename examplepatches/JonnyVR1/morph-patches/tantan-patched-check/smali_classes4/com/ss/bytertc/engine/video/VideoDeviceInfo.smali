.class public Lcom/ss/bytertc/engine/video/VideoDeviceInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public deviceFacing:Lcom/ss/bytertc/engine/type/VideoDeviceFacing;

.field public deviceId:Ljava/lang/String;

.field public deviceName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/ss/bytertc/engine/video/VideoDeviceInfo;->deviceId:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/ss/bytertc/engine/video/VideoDeviceInfo;->deviceName:Ljava/lang/String;

    .line 9
    .line 10
    sget-object v0, Lcom/ss/bytertc/engine/type/VideoDeviceFacing;->UNKNOWN:Lcom/ss/bytertc/engine/type/VideoDeviceFacing;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/ss/bytertc/engine/video/VideoDeviceInfo;->deviceFacing:Lcom/ss/bytertc/engine/type/VideoDeviceFacing;

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/type/VideoDeviceFacing;)V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-object p1, p0, Lcom/ss/bytertc/engine/video/VideoDeviceInfo;->deviceId:Ljava/lang/String;

    .line 17
    iput-object p2, p0, Lcom/ss/bytertc/engine/video/VideoDeviceInfo;->deviceName:Ljava/lang/String;

    .line 18
    iput-object p3, p0, Lcom/ss/bytertc/engine/video/VideoDeviceInfo;->deviceFacing:Lcom/ss/bytertc/engine/type/VideoDeviceFacing;

    return-void
.end method

.method public static create(Ljava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/type/VideoDeviceFacing;)Lcom/ss/bytertc/engine/video/VideoDeviceInfo;
    .locals 1
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/video/VideoDeviceInfo;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/ss/bytertc/engine/video/VideoDeviceInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/type/VideoDeviceFacing;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method
