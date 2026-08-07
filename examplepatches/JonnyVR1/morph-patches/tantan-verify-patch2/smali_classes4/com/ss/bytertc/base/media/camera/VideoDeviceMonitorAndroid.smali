.class public Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "VideoDeviceMonitorAndroid"


# instance fields
.field private mAvailabilityCallback:Landroid/hardware/camera2/CameraManager$AvailabilityCallback;

.field private mCameraAvailabilityHandler:Landroid/os/Handler;

.field private mCameraAvailabilityThread:Landroid/os/HandlerThread;

.field private final mContext:Landroid/content/Context;

.field private mNativeHandle:J

.field private final mUsbReceiver:Landroid/content/BroadcastReceiver;


# direct methods
.method public constructor <init>(J)V
    .locals 1
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;->mCameraAvailabilityThread:Landroid/os/HandlerThread;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;->mCameraAvailabilityHandler:Landroid/os/Handler;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;->mAvailabilityCallback:Landroid/hardware/camera2/CameraManager$AvailabilityCallback;

    .line 10
    .line 11
    new-instance v0, Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid$1;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid$1;-><init>(Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;->mUsbReceiver:Landroid/content/BroadcastReceiver;

    .line 17
    .line 18
    iput-wide p1, p0, Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;->mNativeHandle:J

    .line 19
    .line 20
    invoke-static {}, Lcom/bytedance/realx/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iput-object p1, p0, Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;->mContext:Landroid/content/Context;

    .line 25
    .line 26
    new-instance p1, Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid$2;

    .line 27
    .line 28
    invoke-direct {p1, p0}, Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid$2;-><init>(Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;)V

    .line 29
    .line 30
    .line 31
    iput-object p1, p0, Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;->mAvailabilityCallback:Landroid/hardware/camera2/CameraManager$AvailabilityCallback;

    .line 32
    .line 33
    return-void
.end method

.method public static synthetic access$000(Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;Landroid/hardware/usb/UsbDevice;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;->processorAttached(Landroid/hardware/usb/UsbDevice;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$100(Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;Landroid/hardware/usb/UsbDevice;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;->processorDetached(Landroid/hardware/usb/UsbDevice;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$200(Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;->mNativeHandle:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$300(JLjava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;->nativeOnCameraAvailabilityChanged(JLjava/lang/String;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private isUsbCamera(Landroid/hardware/usb/UsbDevice;)Ljava/lang/Boolean;
    .locals 4

    .line 1
    const-string p0, "isUsbCamera"

    .line 2
    .line 3
    const-string v0, "VideoDeviceMonitorAndroid"

    .line 4
    .line 5
    invoke-static {v0, p0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getDeviceClass()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    const/16 v2, 0xe

    .line 15
    .line 16
    if-ne v1, v2, :cond_0

    .line 17
    .line 18
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_0
    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getDeviceClass()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    const/16 v3, 0xef

    .line 26
    .line 27
    if-ne v1, v3, :cond_2

    .line 28
    .line 29
    const/4 v1, 0x0

    .line 30
    :goto_0
    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getInterfaceCount()I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    if-ge v1, v3, :cond_2

    .line 35
    .line 36
    invoke-virtual {p1, v1}, Landroid/hardware/usb/UsbDevice;->getInterface(I)Landroid/hardware/usb/UsbInterface;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    invoke-virtual {v3}, Landroid/hardware/usb/UsbInterface;->getInterfaceClass()I

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    if-ne v3, v2, :cond_1

    .line 45
    .line 46
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    :goto_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 53
    .line 54
    const-string v2, "DeviceClass: "

    .line 55
    .line 56
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getDeviceClass()I

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    const-string p1, " result: "

    .line 67
    .line 68
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-static {v0, p1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    return-object p0
.end method

.method private static native nativeOnCameraAvailabilityChanged(JLjava/lang/String;Z)V
.end method

.method private static native nativeOnUsbCameraChanged(JZ)V
.end method

.method private processorAttached(Landroid/hardware/usb/UsbDevice;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;->isUsbCamera(Landroid/hardware/usb/UsbDevice;)Ljava/lang/Boolean;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    const-string p0, "VideoDeviceMonitorAndroid"

    .line 12
    .line 13
    const-string p1, "processorAttached, is not Usb camera"

    .line 14
    .line 15
    invoke-static {p0, p1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-wide p0, p0, Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;->mNativeHandle:J

    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    invoke-static {p0, p1, v0}, Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;->nativeOnUsbCameraChanged(JZ)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method private processorDetached(Landroid/hardware/usb/UsbDevice;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;->isUsbCamera(Landroid/hardware/usb/UsbDevice;)Ljava/lang/Boolean;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    const-string p0, "VideoDeviceMonitorAndroid"

    .line 12
    .line 13
    const-string p1, "processorDetached, is not Usb camera"

    .line 14
    .line 15
    invoke-static {p0, p1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-wide p0, p0, Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;->mNativeHandle:J

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    invoke-static {p0, p1, v0}, Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;->nativeOnUsbCameraChanged(JZ)V

    .line 23
    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public start()V
    .locals 4
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const-string v0, "registerUsbAction"

    .line 2
    .line 3
    const-string v1, "VideoDeviceMonitorAndroid"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;->mUsbReceiver:Landroid/content/BroadcastReceiver;

    .line 9
    .line 10
    if-eqz v0, :cond_2

    .line 11
    .line 12
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;->mContext:Landroid/content/Context;

    .line 13
    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    goto :goto_1

    .line 17
    :cond_0
    new-instance v0, Landroid/content/IntentFilter;

    .line 18
    .line 19
    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 20
    .line 21
    .line 22
    const-string v2, "android.hardware.usb.action.USB_DEVICE_ATTACHED"

    .line 23
    .line 24
    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    const-string v2, "android.hardware.usb.action.USB_DEVICE_DETACHED"

    .line 28
    .line 29
    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object v2, p0, Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;->mContext:Landroid/content/Context;

    .line 33
    .line 34
    iget-object v3, p0, Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;->mUsbReceiver:Landroid/content/BroadcastReceiver;

    .line 35
    .line 36
    invoke-static {v2, v3, v0}, Ll/jj5;->l(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;->mContext:Landroid/content/Context;

    .line 40
    .line 41
    const-string v2, "camera"

    .line 42
    .line 43
    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Landroid/hardware/camera2/CameraManager;

    .line 48
    .line 49
    :try_start_0
    iget-object v2, p0, Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;->mAvailabilityCallback:Landroid/hardware/camera2/CameraManager$AvailabilityCallback;

    .line 50
    .line 51
    if-eqz v2, :cond_1

    .line 52
    .line 53
    const-string v2, "registerAvailabilityCallback"

    .line 54
    .line 55
    invoke-static {v1, v2}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    new-instance v2, Landroid/os/HandlerThread;

    .line 59
    .line 60
    const-string v3, "CameraAvailabilityThread"

    .line 61
    .line 62
    invoke-direct {v2, v3}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    iput-object v2, p0, Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;->mCameraAvailabilityThread:Landroid/os/HandlerThread;

    .line 66
    .line 67
    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 68
    .line 69
    .line 70
    new-instance v2, Landroid/os/Handler;

    .line 71
    .line 72
    iget-object v3, p0, Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;->mCameraAvailabilityThread:Landroid/os/HandlerThread;

    .line 73
    .line 74
    invoke-virtual {v3}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    invoke-direct {v2, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 79
    .line 80
    .line 81
    iput-object v2, p0, Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;->mCameraAvailabilityHandler:Landroid/os/Handler;

    .line 82
    .line 83
    iget-object p0, p0, Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;->mAvailabilityCallback:Landroid/hardware/camera2/CameraManager$AvailabilityCallback;

    .line 84
    .line 85
    invoke-virtual {v0, p0, v2}, Landroid/hardware/camera2/CameraManager;->registerAvailabilityCallback(Landroid/hardware/camera2/CameraManager$AvailabilityCallback;Landroid/os/Handler;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :catch_0
    move-exception p0

    .line 90
    goto :goto_0

    .line 91
    :cond_1
    return-void

    .line 92
    :goto_0
    const-string v0, "registerAvailabilityCallback fail"

    .line 93
    .line 94
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 98
    .line 99
    .line 100
    return-void

    .line 101
    :cond_2
    :goto_1
    const-string p0, "registerUsbAction fail"

    .line 102
    .line 103
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public stop()V
    .locals 3
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const-string v0, "unregisterUsbAction"

    .line 2
    .line 3
    const-string v1, "VideoDeviceMonitorAndroid"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;->mUsbReceiver:Landroid/content/BroadcastReceiver;

    .line 9
    .line 10
    if-eqz v0, :cond_4

    .line 11
    .line 12
    iget-object v2, p0, Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;->mContext:Landroid/content/Context;

    .line 13
    .line 14
    if-nez v2, :cond_0

    .line 15
    .line 16
    goto :goto_2

    .line 17
    :cond_0
    invoke-virtual {v2, v0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;->mContext:Landroid/content/Context;

    .line 21
    .line 22
    const-string v2, "camera"

    .line 23
    .line 24
    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Landroid/hardware/camera2/CameraManager;

    .line 29
    .line 30
    :try_start_0
    iget-object v2, p0, Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;->mAvailabilityCallback:Landroid/hardware/camera2/CameraManager$AvailabilityCallback;

    .line 31
    .line 32
    if-eqz v2, :cond_1

    .line 33
    .line 34
    const-string v2, "unregisterAvailabilityCallback"

    .line 35
    .line 36
    invoke-static {v1, v2}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iget-object v2, p0, Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;->mAvailabilityCallback:Landroid/hardware/camera2/CameraManager$AvailabilityCallback;

    .line 40
    .line 41
    invoke-virtual {v0, v2}, Landroid/hardware/camera2/CameraManager;->unregisterAvailabilityCallback(Landroid/hardware/camera2/CameraManager$AvailabilityCallback;)V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :catch_0
    move-exception p0

    .line 46
    goto :goto_1

    .line 47
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;->mCameraAvailabilityThread:Landroid/os/HandlerThread;

    .line 48
    .line 49
    const/4 v2, 0x0

    .line 50
    if-eqz v0, :cond_2

    .line 51
    .line 52
    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z

    .line 53
    .line 54
    .line 55
    iput-object v2, p0, Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;->mCameraAvailabilityThread:Landroid/os/HandlerThread;

    .line 56
    .line 57
    :cond_2
    iget-object v0, p0, Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;->mCameraAvailabilityHandler:Landroid/os/Handler;

    .line 58
    .line 59
    if-eqz v0, :cond_3

    .line 60
    .line 61
    iput-object v2, p0, Lcom/ss/bytertc/base/media/camera/VideoDeviceMonitorAndroid;->mCameraAvailabilityHandler:Landroid/os/Handler;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 62
    .line 63
    :cond_3
    return-void

    .line 64
    :goto_1
    const-string v0, "unregisterAvailabilityCallback fail"

    .line 65
    .line 66
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_4
    :goto_2
    const-string p0, "unregisterUsbAction fail"

    .line 74
    .line 75
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    return-void
.end method
