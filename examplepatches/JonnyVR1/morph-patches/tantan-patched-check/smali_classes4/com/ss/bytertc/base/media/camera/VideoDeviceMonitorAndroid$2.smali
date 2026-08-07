.class Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid$2;
.super Landroid/hardware/camera2/CameraManager$AvailabilityCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;-><init>(J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid$2;->this$0:Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/hardware/camera2/CameraManager$AvailabilityCallback;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onCameraAccessPrioritiesChanged()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/hardware/camera2/CameraManager$AvailabilityCallback;->onCameraAccessPrioritiesChanged()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onCameraAvailable(Ljava/lang/String;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroid/hardware/camera2/CameraManager$AvailabilityCallback;->onCameraAvailable(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid$2;->this$0:Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;

    .line 5
    .line 6
    invoke-static {p0}, Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;->access$200(Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;)J

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    const/4 p0, 0x1

    .line 11
    invoke-static {v0, v1, p1, p0}, Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;->access$300(JLjava/lang/String;Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onCameraUnavailable(Ljava/lang/String;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroid/hardware/camera2/CameraManager$AvailabilityCallback;->onCameraUnavailable(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid$2;->this$0:Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;

    .line 5
    .line 6
    invoke-static {p0}, Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;->access$200(Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;)J

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    const/4 p0, 0x0

    .line 11
    invoke-static {v0, v1, p1, p0}, Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;->access$300(JLjava/lang/String;Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onPhysicalCameraAvailable(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2}, Landroid/hardware/camera2/CameraManager$AvailabilityCallback;->onPhysicalCameraAvailable(Ljava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onPhysicalCameraUnavailable(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2}, Landroid/hardware/camera2/CameraManager$AvailabilityCallback;->onPhysicalCameraUnavailable(Ljava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
