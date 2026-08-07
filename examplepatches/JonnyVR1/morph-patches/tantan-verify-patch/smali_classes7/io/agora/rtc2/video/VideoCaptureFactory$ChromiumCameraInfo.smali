.class Lio/agora/rtc2/video/VideoCaptureFactory$ChromiumCameraInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/video/VideoCaptureFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ChromiumCameraInfo"
.end annotation


# static fields
.field private static enableCameraCacheNumbers:Z = true

.field private static sNumberOfSystemCameras:I = -0x1


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$100()I
    .locals 1

    .line 1
    invoke-static {}, Lio/agora/rtc2/video/VideoCaptureFactory$ChromiumCameraInfo;->getNumberOfCameras()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    return v0
.end method

.method public static synthetic access$200(Z)V
    .locals 0

    .line 1
    invoke-static {p0}, Lio/agora/rtc2/video/VideoCaptureFactory$ChromiumCameraInfo;->setCacheCameraNumbers(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static getCameraCacheNumbers()Z
    .locals 1

    .line 1
    sget-boolean v0, Lio/agora/rtc2/video/VideoCaptureFactory$ChromiumCameraInfo;->enableCameraCacheNumbers:Z

    .line 2
    .line 3
    return v0
.end method

.method private static getNumberOfCameras()I
    .locals 2

    .line 1
    sget v0, Lio/agora/rtc2/video/VideoCaptureFactory$ChromiumCameraInfo;->sNumberOfSystemCameras:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eq v0, v1, :cond_0

    .line 5
    .line 6
    sget-boolean v0, Lio/agora/rtc2/video/VideoCaptureFactory$ChromiumCameraInfo;->enableCameraCacheNumbers:Z

    .line 7
    .line 8
    if-nez v0, :cond_3

    .line 9
    .line 10
    :cond_0
    invoke-static {}, Lio/agora/base/internal/ContextUtils;->getApplicationContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    sget v0, Lio/agora/rtc2/video/VideoCaptureFactory$ChromiumCameraInfo;->sNumberOfSystemCameras:I

    .line 17
    .line 18
    return v0

    .line 19
    :cond_1
    invoke-static {}, Lio/agora/rtc2/video/VideoCaptureFactory;->access$000()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    invoke-static {}, Lio/agora/rtc2/video/VideoCaptureCamera2;->getNumberOfCameras()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    sput v0, Lio/agora/rtc2/video/VideoCaptureFactory$ChromiumCameraInfo;->sNumberOfSystemCameras:I

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_2
    invoke-static {}, Lio/agora/rtc2/video/VideoCaptureCamera1;->getNumberOfCameras()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    sput v0, Lio/agora/rtc2/video/VideoCaptureFactory$ChromiumCameraInfo;->sNumberOfSystemCameras:I

    .line 37
    .line 38
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    const-string v1, "getMaxNumberOfCameras: "

    .line 41
    .line 42
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    sget v1, Lio/agora/rtc2/video/VideoCaptureFactory$ChromiumCameraInfo;->sNumberOfSystemCameras:I

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    const-string v1, " availableOfCameras: "

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-static {}, Lio/agora/rtc2/video/VideoCaptureCamera1;->getNumberOfCameras()I

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    const-string v1, "VideoCaptureFactory"

    .line 67
    .line 68
    invoke-static {v1, v0}, Lio/agora/base/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    :cond_3
    sget v0, Lio/agora/rtc2/video/VideoCaptureFactory$ChromiumCameraInfo;->sNumberOfSystemCameras:I

    .line 72
    .line 73
    return v0
.end method

.method private static setCacheCameraNumbers(Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setCacheCameraNumbers: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "VideoCaptureFactory"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lio/agora/base/internal/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    sput-boolean p0, Lio/agora/rtc2/video/VideoCaptureFactory$ChromiumCameraInfo;->enableCameraCacheNumbers:Z

    .line 21
    .line 22
    return-void
.end method
