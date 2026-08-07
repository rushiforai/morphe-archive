.class Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid$1;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;
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
    iput-object p1, p0, Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid$1;->this$0:Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const-string v0, "device"

    .line 6
    .line 7
    invoke-virtual {p2, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    check-cast p2, Landroid/hardware/usb/UsbDevice;

    .line 12
    .line 13
    const-string v0, "android.hardware.usb.action.USB_DEVICE_ATTACHED"

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid$1;->this$0:Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;

    .line 22
    .line 23
    invoke-static {p0, p2}, Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;->access$000(Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;Landroid/hardware/usb/UsbDevice;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    const-string v0, "android.hardware.usb.action.USB_DEVICE_DETACHED"

    .line 28
    .line 29
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_1

    .line 34
    .line 35
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid$1;->this$0:Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;

    .line 36
    .line 37
    invoke-static {p0, p2}, Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;->access$100(Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;Landroid/hardware/usb/UsbDevice;)V

    .line 38
    .line 39
    .line 40
    :cond_1
    return-void
.end method
