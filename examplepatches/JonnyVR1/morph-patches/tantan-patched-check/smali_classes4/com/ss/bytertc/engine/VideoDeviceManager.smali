.class public Lcom/ss/bytertc/engine/VideoDeviceManager;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/ss/bytertc/engine/video/IVideoDeviceManager;


# static fields
.field private static final TAG:Ljava/lang/String; = "VideoDeviceManager"


# instance fields
.field private mVideoDevicemanager:J


# direct methods
.method public constructor <init>(J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Lcom/ss/bytertc/engine/VideoDeviceManager;->mVideoDevicemanager:J

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public enumerateVideoCaptureDevices()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/ss/bytertc/engine/video/VideoDeviceInfo;",
            ">;"
        }
    .end annotation

    .line 1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/VideoDeviceManager;->mVideoDevicemanager:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long p0, v0, v2

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const-string p0, "VideoDeviceManager"

    .line 10
    .line 11
    const-string v0, "native VideoDeviceManager is invalid, enumerateVideoCaptureDevices failed."

    .line 12
    .line 13
    invoke-static {p0, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    return-object p0

    .line 18
    :cond_0
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/NativeVideoDeviceManagerFunctions;->nativeEnumerateVideoCaptureDevices(J)Ljava/util/List;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public setVideoCaptureDevice(Ljava/lang/String;)I
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/VideoDeviceManager;->mVideoDevicemanager:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long p0, v0, v2

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const-string p0, "VideoDeviceManager"

    .line 10
    .line 11
    const-string p1, "native VideoDeviceManager is invalid, setVideoCaptureDevice failed."

    .line 12
    .line 13
    invoke-static {p0, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const/4 p0, -0x1

    .line 17
    return p0

    .line 18
    :cond_0
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeVideoDeviceManagerFunctions;->nativeSetVideoCaptureDevice(JLjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0
.end method
