.class public Lcom/ss/bytertc/base/media/camera/RXVideoCameraInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/bytertc/base/media/camera/RXVideoCameraInfo$DeviceInfo;
    }
.end annotation


# static fields
.field private static final CAMERA_BACK:I = 0x1

.field private static final CAMERA_EXTERNAL:I = 0x2

.field private static final CAMERA_FRONT:I = 0x0

.field private static final CAMERA_INVALID:I = 0x3

.field private static final TAG:Ljava/lang/String; = "RXVideoCameraInfo"


# instance fields
.field private deviceInfos:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/ss/bytertc/base/media/camera/RXVideoCameraInfo$DeviceInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 10
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "RXVideoCameraInfo Created..."

    .line 5
    .line 6
    const-string v1, "RXVideoCameraInfo"

    .line 7
    .line 8
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCameraInfo;->deviceInfos:Ljava/util/ArrayList;

    .line 17
    .line 18
    :try_start_0
    new-instance v0, Lcom/ss/bytertc/base/media/camera/Camera1Enumerator;

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    const/4 v3, 0x1

    .line 22
    invoke-direct {v0, v3, v2}, Lcom/ss/bytertc/base/media/camera/Camera1Enumerator;-><init>(ZZ)V

    .line 23
    .line 24
    .line 25
    invoke-interface {v0}, Lcom/ss/bytertc/base/media/camera/CameraEnumerator;->getDeviceNames()[Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v4

    .line 29
    array-length v5, v4

    .line 30
    move v6, v2

    .line 31
    :goto_0
    if-ge v6, v5, :cond_2

    .line 32
    .line 33
    aget-object v7, v4, v6

    .line 34
    .line 35
    new-instance v8, Lcom/ss/bytertc/base/media/camera/RXVideoCameraInfo$DeviceInfo;

    .line 36
    .line 37
    invoke-direct {v8, p0}, Lcom/ss/bytertc/base/media/camera/RXVideoCameraInfo$DeviceInfo;-><init>(Lcom/ss/bytertc/base/media/camera/RXVideoCameraInfo;)V

    .line 38
    .line 39
    .line 40
    iput-object v7, v8, Lcom/ss/bytertc/base/media/camera/RXVideoCameraInfo$DeviceInfo;->name:Ljava/lang/String;

    .line 41
    .line 42
    invoke-interface {v0, v7}, Lcom/ss/bytertc/base/media/camera/CameraEnumerator;->isFrontFacing(Ljava/lang/String;)Z

    .line 43
    .line 44
    .line 45
    move-result v9

    .line 46
    if-eqz v9, :cond_0

    .line 47
    .line 48
    iput v2, v8, Lcom/ss/bytertc/base/media/camera/RXVideoCameraInfo$DeviceInfo;->cameraId:I

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :catch_0
    move-exception p0

    .line 52
    goto :goto_2

    .line 53
    :cond_0
    invoke-interface {v0, v7}, Lcom/ss/bytertc/base/media/camera/CameraEnumerator;->isBackFacing(Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result v7

    .line 57
    if-eqz v7, :cond_1

    .line 58
    .line 59
    iput v3, v8, Lcom/ss/bytertc/base/media/camera/RXVideoCameraInfo$DeviceInfo;->cameraId:I

    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_1
    const/4 v7, 0x2

    .line 63
    iput v7, v8, Lcom/ss/bytertc/base/media/camera/RXVideoCameraInfo$DeviceInfo;->cameraId:I

    .line 64
    .line 65
    :goto_1
    iget-object v7, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCameraInfo;->deviceInfos:Ljava/util/ArrayList;

    .line 66
    .line 67
    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 68
    .line 69
    .line 70
    add-int/lit8 v6, v6, 0x1

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_2
    return-void

    .line 74
    :goto_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    const-string v2, "Create VideoCapture failed : "

    .line 77
    .line 78
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    return-void
.end method


# virtual methods
.method public getCameraId(I)I
    .locals 1
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCameraInfo;->deviceInfos:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lt p1, v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x3

    .line 10
    return p0

    .line 11
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCameraInfo;->deviceInfos:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/ss/bytertc/base/media/camera/RXVideoCameraInfo$DeviceInfo;

    .line 18
    .line 19
    iget p0, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCameraInfo$DeviceInfo;->cameraId:I

    .line 20
    .line 21
    return p0
.end method

.method public getDeviceName(I)Ljava/lang/String;
    .locals 1
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCameraInfo;->deviceInfos:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lt p1, v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCameraInfo;->deviceInfos:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/ss/bytertc/base/media/camera/RXVideoCameraInfo$DeviceInfo;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCameraInfo$DeviceInfo;->name:Ljava/lang/String;

    .line 20
    .line 21
    return-object p0
.end method

.method public getDeviceNumbers()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCameraInfo;->deviceInfos:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
