.class public Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$BluetoothConnectCallback;,
        Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;,
        Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$RoutingDeviceType;
    }
.end annotation


# static fields
.field private static final ACTION_BT_A2DP_CONNECTION_STATE_CHANGED:Ljava/lang/String; = "android.bluetooth.a2dp.profile.action.CONNECTION_STATE_CHANGED"

.field private static final ACTION_BT_HEADSET_CONNECTION_STATE_CHANGED:Ljava/lang/String; = "android.bluetooth.headset.profile.action.CONNECTION_STATE_CHANGED"

.field private static final ACTION_BT_SCO_AUDIO_STATE_UPDATED:Ljava/lang/String; = "android.media.ACTION_SCO_AUDIO_STATE_UPDATED"

.field private static final ACTION_BT_STATE_CHANGED:Ljava/lang/String; = "android.bluetooth.adapter.action.STATE_CHANGED"

.field private static final ACTION_HEADSET_PLUG:Ljava/lang/String; = "android.intent.action.HEADSET_PLUG"

.field private static final ACTION_USB_DEVICE_ATTACHED:Ljava/lang/String; = "android.hardware.usb.action.USB_DEVICE_ATTACHED"

.field private static final ACTION_USB_DEVICE_DETACHED:Ljava/lang/String; = "android.hardware.usb.action.USB_DEVICE_DETACHED"

.field private static final BLUETOOTH_SCO_CONNECT_CHECK_MAX_RETRY_TIMES:I = 0x3

.field private static final BLUETOOTH_SCO_CONNECT_CHECK_TIME_GAP:I = 0xbb8

.field private static final BLUETOOTH_SCO_DISCONNECT_CHECK_TIME_GAP:I = 0x1770

.field private static final BLUETOOTH_SCO_RESTART_MAX_TIMES:I = 0x3

.field private static final BLUETOOTH_SCO_RESTART_TIME_GAP:I = 0xbb8

.field private static final TAG:Ljava/lang/String; = "AudioRouteDeviceManager"


# instance fields
.field private final bluetoothLock:Ljava/lang/Object;

.field private currentRouting:I
    .annotation build Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$RoutingDeviceType;
    .end annotation
.end field

.field private mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

.field private mBluetoothDevice:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

.field private mBluetoothDeviceCallback:Landroid/media/AudioDeviceCallback;

.field private mBluetoothPermissionDesp:Ljava/lang/String;

.field private mBluetoothScoConnectCheckTimes:I

.field private mBluetoothScoRestartTimes:I

.field private mCallback:Lcom/ss/bytertc/audio/device/router/IAudioRouteCallback;

.field private mEnableUseAudioDeviceCallback:Z

.field private mHandler:Landroid/os/Handler;

.field private mInitDeviceState:I

.field private mIntentFilter:Landroid/content/IntentFilter;

.field private mScoHasStarted:Z

.field private mUsbHeadsetDevice:Landroid/hardware/usb/UsbDevice;

.field private mUseAudioDeviceCallback:Z

.field private mWiredHeadsetDevice:Ljava/lang/String;

.field private volatile registered:Z


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/audio/device/router/IAudioRouteCallback;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->registered:Z

    .line 6
    .line 7
    iput v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mInitDeviceState:I

    .line 8
    .line 9
    const/4 v1, -0x1

    .line 10
    iput v1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothScoConnectCheckTimes:I

    .line 11
    .line 12
    iput v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothScoRestartTimes:I

    .line 13
    .line 14
    iput-boolean v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mScoHasStarted:Z

    .line 15
    .line 16
    const-string v2, "NULL"

    .line 17
    .line 18
    iput-object v2, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothPermissionDesp:Ljava/lang/String;

    .line 19
    .line 20
    iput v1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->currentRouting:I

    .line 21
    .line 22
    iput-boolean v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mEnableUseAudioDeviceCallback:Z

    .line 23
    .line 24
    iput-boolean v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mUseAudioDeviceCallback:Z

    .line 25
    .line 26
    new-instance v0, Ljava/lang/Object;

    .line 27
    .line 28
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->bluetoothLock:Ljava/lang/Object;

    .line 32
    .line 33
    iput-object p1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mCallback:Lcom/ss/bytertc/audio/device/router/IAudioRouteCallback;

    .line 34
    .line 35
    return-void
.end method

.method public static synthetic a(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->bluetoothScoDisconnectionForNormalMode()V

    return-void
.end method

.method public static synthetic access$000(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;Landroid/content/Context;ILandroid/bluetooth/BluetoothDevice;[Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->isBtDeviceMajorValid(Landroid/content/Context;ILandroid/bluetooth/BluetoothDevice;[Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic access$200(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;)Lcom/ss/bytertc/audio/device/router/IAudioRouteCallback;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mCallback:Lcom/ss/bytertc/audio/device/router/IAudioRouteCallback;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$300(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->bluetoothLock:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$400(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;)Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothDevice:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$402(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;)Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothDevice:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$502(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothScoRestartTimes:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic b(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->restartBluetoothScoAsynTask()V

    return-void
.end method

.method private bluetoothScoConnectionCheck()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mCallback:Lcom/ss/bytertc/audio/device/router/IAudioRouteCallback;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto/16 :goto_0

    .line 6
    .line 7
    :cond_0
    invoke-static {}, Lcom/ss/bytertc/audio/device/router/AudioRouteUtil;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "AudioRouteDeviceManager"

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    const-string p0, "AudioRouteDeviceManager: bluetoothScoConnectionCheck failed. Context is null."

    .line 16
    .line 17
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_1
    const-string v2, "audio"

    .line 22
    .line 23
    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Landroid/media/AudioManager;

    .line 28
    .line 29
    if-nez v0, :cond_2

    .line 30
    .line 31
    const-string p0, "AudioRouteDeviceManager: bluetoothScoConnectionCheck failed. AudioManager is null."

    .line 32
    .line 33
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_2
    iget v2, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothScoConnectCheckTimes:I

    .line 38
    .line 39
    const/4 v3, 0x3

    .line 40
    const/4 v4, -0x1

    .line 41
    if-lt v2, v3, :cond_4

    .line 42
    .line 43
    iget-boolean v2, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mScoHasStarted:Z

    .line 44
    .line 45
    if-eqz v2, :cond_3

    .line 46
    .line 47
    invoke-direct {p0, v0}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->stopSystemBluetoothSco(Landroid/media/AudioManager;)V

    .line 48
    .line 49
    .line 50
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    const-string v2, "AudioRouteDeviceManager: bluetoothScoConnectionCheck timeout, time: "

    .line 53
    .line 54
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    iget v2, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothScoConnectCheckTimes:I

    .line 58
    .line 59
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    iput v4, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothScoConnectCheckTimes:I

    .line 70
    .line 71
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mHandler:Landroid/os/Handler;

    .line 72
    .line 73
    new-instance v1, Ll/cd1;

    .line 74
    .line 75
    invoke-direct {v1, p0}, Ll/cd1;-><init>(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 79
    .line 80
    .line 81
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mCallback:Lcom/ss/bytertc/audio/device/router/IAudioRouteCallback;

    .line 82
    .line 83
    sget v0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->EVENT_SCO_FAILED_FORCE_TO_MEDIA_MODE:I

    .line 84
    .line 85
    const-string v1, "change to normal mode due to sco started timeout"

    .line 86
    .line 87
    invoke-interface {p0, v0, v1}, Lcom/ss/bytertc/audio/device/router/IAudioRouteCallback;->onError(ILjava/lang/String;)V

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :cond_4
    invoke-virtual {v0}, Landroid/media/AudioManager;->isBluetoothScoOn()Z

    .line 92
    .line 93
    .line 94
    move-result v2

    .line 95
    if-eqz v2, :cond_5

    .line 96
    .line 97
    const-string v0, "AudioRouteDeviceManager: bluetoothScoConnectionCheck success."

    .line 98
    .line 99
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    iput v4, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothScoConnectCheckTimes:I

    .line 103
    .line 104
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mHandler:Landroid/os/Handler;

    .line 105
    .line 106
    new-instance v1, Ll/cd1;

    .line 107
    .line 108
    invoke-direct {v1, p0}, Ll/cd1;-><init>(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 112
    .line 113
    .line 114
    return-void

    .line 115
    :cond_5
    iget v2, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothScoConnectCheckTimes:I

    .line 116
    .line 117
    add-int/lit8 v2, v2, 0x1

    .line 118
    .line 119
    iput v2, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothScoConnectCheckTimes:I

    .line 120
    .line 121
    new-instance v2, Ljava/lang/StringBuilder;

    .line 122
    .line 123
    const-string v3, "AudioRouteDeviceManager: bluetoothScoConnectionCheck failed. retry again, time: "

    .line 124
    .line 125
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    iget v3, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothScoConnectCheckTimes:I

    .line 129
    .line 130
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v2

    .line 137
    invoke-static {v1, v2}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    invoke-direct {p0, v0}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->startSystemBluetoothSco(Landroid/media/AudioManager;)V

    .line 141
    .line 142
    .line 143
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mHandler:Landroid/os/Handler;

    .line 144
    .line 145
    if-eqz v0, :cond_6

    .line 146
    .line 147
    new-instance v1, Ll/cd1;

    .line 148
    .line 149
    invoke-direct {v1, p0}, Ll/cd1;-><init>(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;)V

    .line 150
    .line 151
    .line 152
    const-wide/16 v2, 0xbb8

    .line 153
    .line 154
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 155
    .line 156
    .line 157
    :cond_6
    :goto_0
    return-void
.end method

.method private bluetoothScoDisconnectionForNormalMode()V
    .locals 6

    .line 1
    invoke-static {}, Lcom/ss/bytertc/audio/device/router/AudioRouteUtil;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "AudioRouteDeviceManager"

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string p0, "AudioRouteDeviceManager: bluetoothScoDisconnectionForNormalMode failed. Context is null."

    .line 10
    .line 11
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    const-string v2, "audio"

    .line 16
    .line 17
    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Landroid/media/AudioManager;

    .line 22
    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    const-string p0, "AudioRouteDeviceManager: bluetoothScoDisconnectionForNormalMode failed. AudioManager is null."

    .line 26
    .line 27
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    invoke-virtual {v0}, Landroid/media/AudioManager;->getMode()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    invoke-virtual {v0}, Landroid/media/AudioManager;->isBluetoothScoOn()Z

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    new-instance v4, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    const-string v5, "AudioRouteDeviceManager: bluetoothScoDisconnectionForNormalMode mode("

    .line 42
    .line 43
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    const-string v5, "), bluetoothScoOn("

    .line 50
    .line 51
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    const-string v5, ")"

    .line 58
    .line 59
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v4

    .line 66
    invoke-static {v1, v4}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    if-nez v2, :cond_3

    .line 70
    .line 71
    if-nez v3, :cond_2

    .line 72
    .line 73
    iget-boolean v1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mScoHasStarted:Z

    .line 74
    .line 75
    if-eqz v1, :cond_3

    .line 76
    .line 77
    :cond_2
    invoke-direct {p0, v0}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->stopSystemBluetoothSco(Landroid/media/AudioManager;)V

    .line 78
    .line 79
    .line 80
    :cond_3
    return-void
.end method

.method private bluetoothScoIsStarting()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mHandler:Landroid/os/Handler;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    iget p0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothScoConnectCheckTimes:I

    .line 8
    .line 9
    if-ltz p0, :cond_1

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_1
    return v1
.end method

.method public static synthetic c(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->bluetoothScoConnectionCheck()V

    return-void
.end method

.method private checkPermission()Z
    .locals 10
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/ss/bytertc/audio/device/router/AudioRouteUtil;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    iget v3, v3, Landroid/content/pm/ApplicationInfo;->targetSdkVersion:I

    .line 16
    .line 17
    const/16 v4, 0x17

    .line 18
    .line 19
    const-string v5, "AudioRouteDeviceManager"

    .line 20
    .line 21
    if-lt v3, v4, :cond_1

    .line 22
    .line 23
    iget-boolean v4, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mEnableUseAudioDeviceCallback:Z

    .line 24
    .line 25
    iput-boolean v4, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mUseAudioDeviceCallback:Z

    .line 26
    .line 27
    new-instance v4, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    const-string v6, "AudioRouteDeviceManager: mUseAudioDeviceCallback: "

    .line 30
    .line 31
    invoke-direct {v4, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    iget-boolean v6, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mUseAudioDeviceCallback:Z

    .line 35
    .line 36
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    invoke-static {v5, v4}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    :cond_1
    const/4 v4, 0x1

    .line 47
    const/16 v6, 0x1f

    .line 48
    .line 49
    const-string v7, "AudioRouteDeviceManager: "

    .line 50
    .line 51
    const-string v8, " ]"

    .line 52
    .line 53
    const-string v9, ", targetVersion:"

    .line 54
    .line 55
    if-lt v2, v6, :cond_3

    .line 56
    .line 57
    if-lt v3, v6, :cond_3

    .line 58
    .line 59
    const-string v6, "android.permission.BLUETOOTH_CONNECT"

    .line 60
    .line 61
    invoke-virtual {v0, v6}, Landroid/content/Context;->checkCallingOrSelfPermission(Ljava/lang/String;)I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-eqz v0, :cond_2

    .line 66
    .line 67
    new-instance v0, Ljava/lang/StringBuilder;

    .line 68
    .line 69
    const-string v4, "[permission android.permission.BLUETOOTH_CONNECT not be granted. osVersion:"

    .line 70
    .line 71
    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothPermissionDesp:Ljava/lang/String;

    .line 91
    .line 92
    new-instance v0, Ljava/lang/StringBuilder;

    .line 93
    .line 94
    invoke-direct {v0, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothPermissionDesp:Ljava/lang/String;

    .line 98
    .line 99
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-static {v5, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    return v1

    .line 110
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 111
    .line 112
    const-string v1, "[permission android.permission.BLUETOOTH_CONNECT granted. osVersion:"

    .line 113
    .line 114
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothPermissionDesp:Ljava/lang/String;

    .line 134
    .line 135
    new-instance v0, Ljava/lang/StringBuilder;

    .line 136
    .line 137
    invoke-direct {v0, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothPermissionDesp:Ljava/lang/String;

    .line 141
    .line 142
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    invoke-static {v5, p0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 150
    .line 151
    .line 152
    return v4

    .line 153
    :cond_3
    const-string v6, "android.permission.BLUETOOTH"

    .line 154
    .line 155
    invoke-virtual {v0, v6}, Landroid/content/Context;->checkCallingOrSelfPermission(Ljava/lang/String;)I

    .line 156
    .line 157
    .line 158
    move-result v0

    .line 159
    if-eqz v0, :cond_4

    .line 160
    .line 161
    new-instance v0, Ljava/lang/StringBuilder;

    .line 162
    .line 163
    const-string v4, "[permission android.permission.BLUETOOTH not be granted. osVersion:"

    .line 164
    .line 165
    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 166
    .line 167
    .line 168
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 169
    .line 170
    .line 171
    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 172
    .line 173
    .line 174
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 175
    .line 176
    .line 177
    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothPermissionDesp:Ljava/lang/String;

    .line 185
    .line 186
    invoke-static {v5, v0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 187
    .line 188
    .line 189
    new-instance v0, Ljava/lang/StringBuilder;

    .line 190
    .line 191
    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 192
    .line 193
    .line 194
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothPermissionDesp:Ljava/lang/String;

    .line 195
    .line 196
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 197
    .line 198
    .line 199
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    move-result-object p0

    .line 203
    invoke-static {v5, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 204
    .line 205
    .line 206
    return v1

    .line 207
    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 208
    .line 209
    const-string v1, "[permission android.permission.BLUETOOTH granted. osVersion:"

    .line 210
    .line 211
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 212
    .line 213
    .line 214
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 215
    .line 216
    .line 217
    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 218
    .line 219
    .line 220
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 221
    .line 222
    .line 223
    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 224
    .line 225
    .line 226
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    move-result-object v0

    .line 230
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothPermissionDesp:Ljava/lang/String;

    .line 231
    .line 232
    new-instance v0, Ljava/lang/StringBuilder;

    .line 233
    .line 234
    invoke-direct {v0, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 235
    .line 236
    .line 237
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothPermissionDesp:Ljava/lang/String;

    .line 238
    .line 239
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 240
    .line 241
    .line 242
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 243
    .line 244
    .line 245
    move-result-object p0

    .line 246
    invoke-static {v5, p0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 247
    .line 248
    .line 249
    return v4
.end method

.method private hasAudioForUsbDevice(Landroid/hardware/usb/UsbDevice;)Z
    .locals 5

    .line 1
    const/4 p0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return p0

    .line 5
    :cond_0
    move v0, p0

    .line 6
    :goto_0
    invoke-virtual {p1}, Landroid/hardware/usb/UsbDevice;->getConfigurationCount()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-ge v0, v1, :cond_5

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Landroid/hardware/usb/UsbDevice;->getConfiguration(I)Landroid/hardware/usb/UsbConfiguration;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    if-nez v1, :cond_1

    .line 17
    .line 18
    goto :goto_3

    .line 19
    :cond_1
    move v2, p0

    .line 20
    :goto_1
    invoke-virtual {v1}, Landroid/hardware/usb/UsbConfiguration;->getInterfaceCount()I

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    if-ge v2, v3, :cond_4

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Landroid/hardware/usb/UsbConfiguration;->getInterface(I)Landroid/hardware/usb/UsbInterface;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    if-nez v3, :cond_2

    .line 31
    .line 32
    goto :goto_2

    .line 33
    :cond_2
    invoke-virtual {v3}, Landroid/hardware/usb/UsbInterface;->getInterfaceClass()I

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    const/4 v4, 0x1

    .line 38
    if-ne v3, v4, :cond_3

    .line 39
    .line 40
    return v4

    .line 41
    :cond_3
    :goto_2
    add-int/lit8 v2, v2, 0x1

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_4
    :goto_3
    add-int/lit8 v0, v0, 0x1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_5
    return p0
.end method

.method private hasValidBtDeviceMajor(I[Ljava/lang/String;)Z
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    invoke-static {}, Lcom/ss/bytertc/audio/device/router/AudioRouteUtil;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v4

    .line 11
    if-nez v4, :cond_1

    .line 12
    .line 13
    return v1

    .line 14
    :cond_1
    new-instance v7, Ljava/lang/Object;

    .line 15
    .line 16
    invoke-direct {v7}, Ljava/lang/Object;-><init>()V

    .line 17
    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    new-array v6, v0, [Z

    .line 21
    .line 22
    aput-boolean v0, v6, v1

    .line 23
    .line 24
    if-ne p1, v0, :cond_2

    .line 25
    .line 26
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    .line 27
    .line 28
    new-instance v2, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$1;

    .line 29
    .line 30
    move-object v3, p0

    .line 31
    move-object v5, p2

    .line 32
    invoke-direct/range {v2 .. v7}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$1;-><init>(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;Landroid/content/Context;[Ljava/lang/String;[ZLjava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v4, v2, p1}, Landroid/bluetooth/BluetoothAdapter;->getProfileProxy(Landroid/content/Context;Landroid/bluetooth/BluetoothProfile$ServiceListener;I)Z

    .line 36
    .line 37
    .line 38
    monitor-enter v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 39
    const-wide/16 p0, 0x12c

    .line 40
    .line 41
    :try_start_1
    invoke-virtual {v7, p0, p1}, Ljava/lang/Object;->wait(J)V

    .line 42
    .line 43
    .line 44
    monitor-exit v7

    .line 45
    goto :goto_0

    .line 46
    :catchall_0
    move-exception v0

    .line 47
    move-object p0, v0

    .line 48
    monitor-exit v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 49
    :try_start_2
    throw p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 50
    :catchall_1
    move-exception v0

    .line 51
    move-object p0, v0

    .line 52
    const-string p1, "AudioRouteDeviceManager"

    .line 53
    .line 54
    const-string p2, "AudioRouteDeviceManager: hasValidBtDeviceMajor failed."

    .line 55
    .line 56
    invoke-static {p1, p2, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 57
    .line 58
    .line 59
    :cond_2
    :goto_0
    aget-boolean p0, v6, v1

    .line 60
    .line 61
    return p0
.end method

.method private headsetPlugActionIsFromUsbHeadset(Landroid/content/Intent;)Z
    .locals 4

    .line 1
    const-string p0, "address"

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "portName"

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "state"

    .line 14
    .line 15
    const/16 v2, -0x63

    .line 16
    .line 17
    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    const-string v3, "microphone"

    .line 22
    .line 23
    invoke-virtual {p1, v3, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    new-instance v2, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    const-string v3, "ACTION_HEADSET_PLUG info, address: "

    .line 30
    .line 31
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string v3, ", portName: "

    .line 38
    .line 39
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string v3, ", connected: "

    .line 46
    .line 47
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, ", hasMic: "

    .line 54
    .line 55
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    const-string v1, "AudioRouteDeviceManager"

    .line 66
    .line 67
    invoke-static {v1, p1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    const-string p1, ""

    .line 71
    .line 72
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    if-nez p0, :cond_1

    .line 77
    .line 78
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    if-nez p0, :cond_1

    .line 83
    .line 84
    if-eqz v0, :cond_1

    .line 85
    .line 86
    const-string p0, "USB"

    .line 87
    .line 88
    invoke-virtual {v0, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 89
    .line 90
    .line 91
    move-result p0

    .line 92
    if-nez p0, :cond_0

    .line 93
    .line 94
    const-string p0, "usb"

    .line 95
    .line 96
    invoke-virtual {v0, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 97
    .line 98
    .line 99
    move-result p0

    .line 100
    if-eqz p0, :cond_1

    .line 101
    .line 102
    :cond_0
    const-string p0, "AudioRouteDeviceManager: received ACTION_HEADSET_PLUG, may be is a usb device"

    .line 103
    .line 104
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    const/4 p0, 0x1

    .line 108
    return p0

    .line 109
    :cond_1
    const/4 p0, 0x0

    .line 110
    return p0
.end method

.method private initBluetooth()V
    .locals 13

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    filled-new-array {v0}, [Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->bluetoothLock:Ljava/lang/Object;

    .line 8
    .line 9
    monitor-enter v1

    .line 10
    const/4 v2, 0x0

    .line 11
    :try_start_0
    iput-object v2, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothDevice:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 12
    .line 13
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 14
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->checkPermission()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    const/4 v2, 0x2

    .line 19
    const/4 v3, 0x1

    .line 20
    const/4 v4, 0x0

    .line 21
    if-nez v1, :cond_6

    .line 22
    .line 23
    iget-boolean v1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mUseAudioDeviceCallback:Z

    .line 24
    .line 25
    if-eqz v1, :cond_5

    .line 26
    .line 27
    invoke-static {}, Lcom/ss/bytertc/audio/device/router/AudioRouteUtil;->getContext()Landroid/content/Context;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    if-nez v1, :cond_0

    .line 32
    .line 33
    const-string p0, "AudioRouteDeviceManager"

    .line 34
    .line 35
    const-string v0, "AudioRouteDeviceManager: initBluetooth without permission failed. Context is null."

    .line 36
    .line 37
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    const-string v5, "audio"

    .line 42
    .line 43
    invoke-virtual {v1, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    check-cast v1, Landroid/media/AudioManager;

    .line 48
    .line 49
    if-nez v1, :cond_1

    .line 50
    .line 51
    const-string p0, "AudioRouteDeviceManager"

    .line 52
    .line 53
    const-string v0, "AudioRouteDeviceManager: initBluetooth without permission failed. AudioManager is null."

    .line 54
    .line 55
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_1
    invoke-virtual {v1, v2}, Landroid/media/AudioManager;->getDevices(I)[Landroid/media/AudioDeviceInfo;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    array-length v5, v1

    .line 64
    move v6, v4

    .line 65
    move v7, v6

    .line 66
    move v8, v7

    .line 67
    :goto_0
    if-ge v6, v5, :cond_b

    .line 68
    .line 69
    aget-object v9, v1, v6

    .line 70
    .line 71
    invoke-virtual {v9}, Landroid/media/AudioDeviceInfo;->isSource()Z

    .line 72
    .line 73
    .line 74
    move-result v10

    .line 75
    if-eqz v10, :cond_2

    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_2
    const/4 v10, 0x7

    .line 79
    invoke-virtual {v9}, Landroid/media/AudioDeviceInfo;->getType()I

    .line 80
    .line 81
    .line 82
    move-result v11

    .line 83
    if-ne v10, v11, :cond_3

    .line 84
    .line 85
    move v7, v3

    .line 86
    goto :goto_1

    .line 87
    :cond_3
    const/16 v10, 0x8

    .line 88
    .line 89
    invoke-virtual {v9}, Landroid/media/AudioDeviceInfo;->getType()I

    .line 90
    .line 91
    .line 92
    move-result v9

    .line 93
    if-ne v10, v9, :cond_4

    .line 94
    .line 95
    move v8, v3

    .line 96
    :cond_4
    :goto_1
    add-int/lit8 v6, v6, 0x1

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_5
    move v7, v4

    .line 100
    move v8, v7

    .line 101
    goto :goto_6

    .line 102
    :cond_6
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    iput-object v1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    .line 107
    .line 108
    if-nez v1, :cond_7

    .line 109
    .line 110
    const-string p0, "AudioRouteDeviceManager"

    .line 111
    .line 112
    const-string v0, "AudioRouteDeviceManager: initBluetooth with permission failed. GetDefaultAdapter is null"

    .line 113
    .line 114
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 115
    .line 116
    .line 117
    return-void

    .line 118
    :cond_7
    :try_start_1
    invoke-static {v1, v3}, Ll/jj5;->d(Landroid/bluetooth/BluetoothAdapter;I)I

    .line 119
    .line 120
    .line 121
    move-result v1

    .line 122
    if-ne v2, v1, :cond_8

    .line 123
    .line 124
    invoke-direct {p0, v3, v0}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->hasValidBtDeviceMajor(I[Ljava/lang/String;)Z

    .line 125
    .line 126
    .line 127
    move-result v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 128
    if-eqz v1, :cond_8

    .line 129
    .line 130
    move v1, v3

    .line 131
    goto :goto_2

    .line 132
    :catchall_0
    move-exception v1

    .line 133
    move v5, v4

    .line 134
    goto :goto_4

    .line 135
    :cond_8
    move v1, v4

    .line 136
    :goto_2
    :try_start_2
    iget-object v5, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    .line 137
    .line 138
    invoke-static {v5, v2}, Ll/jj5;->d(Landroid/bluetooth/BluetoothAdapter;I)I

    .line 139
    .line 140
    .line 141
    move-result v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 142
    if-ne v2, v5, :cond_9

    .line 143
    .line 144
    move v5, v3

    .line 145
    goto :goto_3

    .line 146
    :cond_9
    move v5, v4

    .line 147
    :goto_3
    move v7, v1

    .line 148
    move v8, v5

    .line 149
    goto :goto_5

    .line 150
    :catchall_1
    move-exception v5

    .line 151
    move-object v12, v5

    .line 152
    move v5, v1

    .line 153
    move-object v1, v12

    .line 154
    :goto_4
    const-string v6, "AudioRouteDeviceManager"

    .line 155
    .line 156
    const-string v7, "AudioRouteDeviceManager: getProfileConnectionState failed."

    .line 157
    .line 158
    invoke-static {v6, v7, v1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 159
    .line 160
    .line 161
    move v8, v4

    .line 162
    move v7, v5

    .line 163
    :goto_5
    iget-boolean v1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mUseAudioDeviceCallback:Z

    .line 164
    .line 165
    if-nez v1, :cond_a

    .line 166
    .line 167
    iget-object v1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mIntentFilter:Landroid/content/IntentFilter;

    .line 168
    .line 169
    const-string v5, "android.bluetooth.headset.profile.action.CONNECTION_STATE_CHANGED"

    .line 170
    .line 171
    invoke-virtual {v1, v5}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 172
    .line 173
    .line 174
    iget-object v1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mIntentFilter:Landroid/content/IntentFilter;

    .line 175
    .line 176
    const-string v5, "android.bluetooth.a2dp.profile.action.CONNECTION_STATE_CHANGED"

    .line 177
    .line 178
    invoke-virtual {v1, v5}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 179
    .line 180
    .line 181
    :cond_a
    iget-object v1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mIntentFilter:Landroid/content/IntentFilter;

    .line 182
    .line 183
    const-string v5, "android.media.ACTION_SCO_AUDIO_STATE_UPDATED"

    .line 184
    .line 185
    invoke-virtual {v1, v5}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 186
    .line 187
    .line 188
    :cond_b
    :goto_6
    if-nez v7, :cond_c

    .line 189
    .line 190
    if-eqz v8, :cond_d

    .line 191
    .line 192
    :cond_c
    iget-object v5, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->bluetoothLock:Ljava/lang/Object;

    .line 193
    .line 194
    monitor-enter v5

    .line 195
    :try_start_3
    new-instance v1, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 196
    .line 197
    const-string v6, "bluetooth-headset[init]"

    .line 198
    .line 199
    invoke-direct {v1, p0, v6}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;-><init>(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;Ljava/lang/String;)V

    .line 200
    .line 201
    .line 202
    iput-object v1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothDevice:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 203
    .line 204
    const-string v6, "init"

    .line 205
    .line 206
    aget-object v0, v0, v4

    .line 207
    .line 208
    invoke-virtual {v1, v6, v0}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->appendDeviceInfo(Ljava/lang/String;Ljava/lang/String;)V

    .line 209
    .line 210
    .line 211
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothDevice:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 212
    .line 213
    invoke-virtual {v0, v3, v7}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->setBluetoothConnected(IZ)V

    .line 214
    .line 215
    .line 216
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothDevice:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 217
    .line 218
    invoke-virtual {p0, v2, v8}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->setBluetoothConnected(IZ)V

    .line 219
    .line 220
    .line 221
    monitor-exit v5

    .line 222
    :cond_d
    return-void

    .line 223
    :catchall_2
    move-exception p0

    .line 224
    monitor-exit v5
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 225
    throw p0

    .line 226
    :catchall_3
    move-exception p0

    .line 227
    :try_start_4
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 228
    throw p0
.end method

.method private initHandler()V
    .locals 3

    .line 1
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "AudioRouteDeviceManager"

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const-string p0, "AudioRouteDeviceManager: initHandler failed"

    .line 17
    .line 18
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_1
    :goto_0
    new-instance v2, Landroid/os/Handler;

    .line 23
    .line 24
    invoke-direct {v2, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 25
    .line 26
    .line 27
    iput-object v2, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mHandler:Landroid/os/Handler;

    .line 28
    .line 29
    new-instance v0, Ll/cd1;

    .line 30
    .line 31
    invoke-direct {v0, p0}, Ll/cd1;-><init>(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v2, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 35
    .line 36
    .line 37
    const-string p0, "AudioRouteDeviceManager: initHandler success"

    .line 38
    .line 39
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method private initHeadset()Z
    .locals 4

    .line 1
    invoke-static {}, Lcom/ss/bytertc/audio/device/router/AudioRouteUtil;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    new-instance v2, Landroid/content/IntentFilter;

    .line 10
    .line 11
    const-string v3, "android.intent.action.HEADSET_PLUG"

    .line 12
    .line 13
    invoke-direct {v2, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v0, p0, v2}, Ll/jj5;->l(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    return v1

    .line 23
    :cond_1
    invoke-direct {p0, v0}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->headsetPlugActionIsFromUsbHeadset(Landroid/content/Intent;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-nez p0, :cond_2

    .line 28
    .line 29
    const-string p0, "state"

    .line 30
    .line 31
    const/16 v2, -0x63

    .line 32
    .line 33
    invoke-virtual {v0, p0, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    const/4 v0, 0x1

    .line 38
    if-ne v0, p0, :cond_2

    .line 39
    .line 40
    return v0

    .line 41
    :cond_2
    return v1
.end method

.method private initUsbHeadset()Z
    .locals 6

    .line 1
    const-string v0, "AudioRouteDeviceManager"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :try_start_0
    invoke-static {}, Lcom/ss/bytertc/audio/device/router/AudioRouteUtil;->getContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object v2

    .line 8
    if-nez v2, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    const-string v3, "usb"

    .line 12
    .line 13
    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Landroid/hardware/usb/UsbManager;

    .line 18
    .line 19
    if-nez v2, :cond_1

    .line 20
    .line 21
    return v1

    .line 22
    :cond_1
    invoke-virtual {v2}, Landroid/hardware/usb/UsbManager;->getDeviceList()Ljava/util/HashMap;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    :cond_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    if-eqz v4, :cond_3

    .line 39
    .line 40
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    check-cast v4, Ljava/lang/String;

    .line 45
    .line 46
    invoke-interface {v2, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v4

    .line 50
    check-cast v4, Landroid/hardware/usb/UsbDevice;

    .line 51
    .line 52
    invoke-direct {p0, v4}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->hasAudioForUsbDevice(Landroid/hardware/usb/UsbDevice;)Z

    .line 53
    .line 54
    .line 55
    move-result v5

    .line 56
    if-eqz v5, :cond_2

    .line 57
    .line 58
    iput-object v4, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mUsbHeadsetDevice:Landroid/hardware/usb/UsbDevice;

    .line 59
    .line 60
    const-string p0, "AudioRouteDeviceManager: initUsbHeadset finished."

    .line 61
    .line 62
    invoke-static {v0, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 63
    .line 64
    .line 65
    const/4 p0, 0x1

    .line 66
    return p0

    .line 67
    :catchall_0
    move-exception p0

    .line 68
    const-string v2, "AudioRouteDeviceManager: initUsbHeadset failed."

    .line 69
    .line 70
    invoke-static {v0, v2, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 71
    .line 72
    .line 73
    :cond_3
    return v1
.end method

.method private isBtDeviceMajorValid(Landroid/content/Context;ILandroid/bluetooth/BluetoothDevice;[Ljava/lang/String;)Z
    .locals 4

    .line 1
    const/4 p0, 0x0

    .line 2
    if-eqz p1, :cond_5

    .line 3
    .line 4
    if-nez p3, :cond_0

    .line 5
    .line 6
    goto :goto_1

    .line 7
    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget v1, v1, Landroid/content/pm/ApplicationInfo;->targetSdkVersion:I

    .line 14
    .line 15
    const/16 v2, 0x1f

    .line 16
    .line 17
    const/4 v3, 0x1

    .line 18
    if-lt v0, v2, :cond_1

    .line 19
    .line 20
    if-lt v1, v2, :cond_1

    .line 21
    .line 22
    const-string v0, "android.permission.BLUETOOTH_CONNECT"

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Landroid/content/Context;->checkCallingOrSelfPermission(Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-nez p1, :cond_4

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    const-string v0, "android.permission.BLUETOOTH"

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Landroid/content/Context;->checkCallingOrSelfPermission(Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-nez p1, :cond_4

    .line 38
    .line 39
    :goto_0
    :try_start_0
    invoke-virtual {p3}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p3}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    invoke-virtual {p3}, Landroid/bluetooth/BluetoothDevice;->getBluetoothClass()Landroid/bluetooth/BluetoothClass;

    .line 47
    .line 48
    .line 49
    move-result-object p3

    .line 50
    if-nez p3, :cond_2

    .line 51
    .line 52
    return p0

    .line 53
    :cond_2
    invoke-virtual {p3}, Landroid/bluetooth/BluetoothClass;->getMajorDeviceClass()I

    .line 54
    .line 55
    .line 56
    move-result p3

    .line 57
    new-instance v0, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 60
    .line 61
    .line 62
    aget-object v1, p4, p0

    .line 63
    .line 64
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    const-string v1, "[device:"

    .line 68
    .line 69
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    const-string p1, ", majorClass:"

    .line 76
    .line 77
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string p1, "] "

    .line 84
    .line 85
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    aput-object p1, p4, p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 93
    .line 94
    if-ne p2, v3, :cond_4

    .line 95
    .line 96
    const/16 p1, 0x700

    .line 97
    .line 98
    if-eq p3, p1, :cond_3

    .line 99
    .line 100
    const/16 p1, 0x1f00

    .line 101
    .line 102
    if-eq p3, p1, :cond_3

    .line 103
    .line 104
    return v3

    .line 105
    :cond_3
    return p0

    .line 106
    :catchall_0
    move-exception p0

    .line 107
    const-string p1, "AudioRouteDeviceManager"

    .line 108
    .line 109
    const-string p2, "AudioRouteDeviceManager: isBtDeviceMajorValid failed."

    .line 110
    .line 111
    invoke-static {p1, p2, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 112
    .line 113
    .line 114
    :cond_4
    return v3

    .line 115
    :cond_5
    :goto_1
    return p0
.end method

.method private registerReceiver()I
    .locals 5

    .line 1
    invoke-static {}, Lcom/ss/bytertc/audio/device/router/AudioRouteUtil;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, -0x1

    .line 8
    return p0

    .line 9
    :cond_0
    iget-boolean v1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->registered:Z

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    const-string v3, "AudioRouteDeviceManager"

    .line 13
    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    const-string p0, "registerReceiver registered"

    .line 17
    .line 18
    invoke-static {v3, p0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return v2

    .line 22
    :cond_1
    const/4 v1, 0x1

    .line 23
    iput-boolean v1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->registered:Z

    .line 24
    .line 25
    iget-object v1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mIntentFilter:Landroid/content/IntentFilter;

    .line 26
    .line 27
    invoke-static {v0, p0, v1}, Ll/jj5;->l(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 28
    .line 29
    .line 30
    iget-boolean v1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mUseAudioDeviceCallback:Z

    .line 31
    .line 32
    if-eqz v1, :cond_3

    .line 33
    .line 34
    const-string v1, "audio"

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Landroid/media/AudioManager;

    .line 41
    .line 42
    if-nez v0, :cond_2

    .line 43
    .line 44
    const/4 p0, -0x2

    .line 45
    return p0

    .line 46
    :cond_2
    new-instance v1, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$BluetoothConnectCallback;

    .line 47
    .line 48
    const/4 v4, 0x0

    .line 49
    invoke-direct {v1, p0, v4}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$BluetoothConnectCallback;-><init>(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$1;)V

    .line 50
    .line 51
    .line 52
    iput-object v1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothDeviceCallback:Landroid/media/AudioDeviceCallback;

    .line 53
    .line 54
    invoke-virtual {v0, v1, v4}, Landroid/media/AudioManager;->registerAudioDeviceCallback(Landroid/media/AudioDeviceCallback;Landroid/os/Handler;)V

    .line 55
    .line 56
    .line 57
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    const-string v1, "AudioRouteDeviceManager: registerReceiver SkipBluetooth:"

    .line 60
    .line 61
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    iget-boolean p0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mUseAudioDeviceCallback:Z

    .line 65
    .line 66
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-static {v3, p0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    return v2
.end method

.method private restartBluetoothScoAsynTask()V
    .locals 3

    .line 1
    const-string v0, "restartBluetoothScoAsynTask enter."

    .line 2
    .line 3
    const-string v1, "AudioRouteDeviceManager"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothDevice:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 9
    .line 10
    if-eqz v0, :cond_3

    .line 11
    .line 12
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->bluetoothScoIsStarting()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    const-string p0, "AudioRouteDeviceManager: restartBluetoothScoAsynTask skip. sco is starting."

    .line 19
    .line 20
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    invoke-static {}, Lcom/ss/bytertc/audio/device/router/AudioRouteUtil;->getContext()Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    if-nez v0, :cond_1

    .line 29
    .line 30
    const-string p0, "AudioRouteDeviceManager: restartBluetoothScoAsynTask failed. Context is null."

    .line 31
    .line 32
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    const-string v2, "audio"

    .line 37
    .line 38
    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Landroid/media/AudioManager;

    .line 43
    .line 44
    if-nez v0, :cond_2

    .line 45
    .line 46
    const-string p0, "AudioRouteDeviceManager: restartBluetoothScoAsynTask failed. AudioManager is null."

    .line 47
    .line 48
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_2
    invoke-direct {p0, v0}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->startSystemBluetoothSco(Landroid/media/AudioManager;)V

    .line 53
    .line 54
    .line 55
    const-string p0, "AudioRouteDeviceManager: restartBluetoothScoAsynTask has start bluetooth."

    .line 56
    .line 57
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_3
    const-string p0, "AudioRouteDeviceManager: restartBluetoothScoAsynTask skip, no bluetooth device now."

    .line 62
    .line 63
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method private routingDeviceType2Text(I)Ljava/lang/String;
    .locals 0
    .param p1    # I
        .annotation build Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$RoutingDeviceType;
        .end annotation
    .end param

    .line 1
    const/4 p0, -0x1

    .line 2
    if-eq p1, p0, :cond_7

    .line 3
    .line 4
    const/4 p0, 0x4

    .line 5
    if-eq p1, p0, :cond_6

    .line 6
    .line 7
    const/16 p0, 0x8

    .line 8
    .line 9
    if-eq p1, p0, :cond_5

    .line 10
    .line 11
    const/16 p0, 0x10

    .line 12
    .line 13
    if-eq p1, p0, :cond_4

    .line 14
    .line 15
    const/16 p0, 0x20

    .line 16
    .line 17
    if-eq p1, p0, :cond_3

    .line 18
    .line 19
    const/16 p0, 0x40

    .line 20
    .line 21
    if-eq p1, p0, :cond_2

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    if-eq p1, p0, :cond_1

    .line 25
    .line 26
    const/4 p0, 0x2

    .line 27
    if-eq p1, p0, :cond_0

    .line 28
    .line 29
    const-string p0, "device-NA"

    .line 30
    .line 31
    return-object p0

    .line 32
    :cond_0
    const-string p0, "device-speaker"

    .line 33
    .line 34
    return-object p0

    .line 35
    :cond_1
    const-string p0, "device-earpiece"

    .line 36
    .line 37
    return-object p0

    .line 38
    :cond_2
    const-string p0, "device-bt-sco"

    .line 39
    .line 40
    return-object p0

    .line 41
    :cond_3
    const-string p0, "device-usb-headset"

    .line 42
    .line 43
    return-object p0

    .line 44
    :cond_4
    const-string p0, "device-bt-a2dp"

    .line 45
    .line 46
    return-object p0

    .line 47
    :cond_5
    const-string p0, "device-bt-headset"

    .line 48
    .line 49
    return-object p0

    .line 50
    :cond_6
    const-string p0, "device-wired-headset"

    .line 51
    .line 52
    return-object p0

    .line 53
    :cond_7
    const-string p0, "device-unknown"

    .line 54
    .line 55
    return-object p0
.end method

.method private startSystemBluetoothSco(Landroid/media/AudioManager;)V
    .locals 2

    .line 1
    const-string v0, "AudioRouteDeviceManager"

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    :try_start_0
    invoke-virtual {p1}, Landroid/media/AudioManager;->startBluetoothSco()V

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    iput-boolean p1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mScoHasStarted:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    .line 11
    return-void

    .line 12
    :catch_0
    move-exception p0

    .line 13
    new-instance p1, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v1, "AudioRouteDeviceManager: startSystemBluetoothSco failed, Exception: "

    .line 16
    .line 17
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {v0, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    const-string p0, "AudioRouteDeviceManager: startSystemBluetoothSco skipped, audioManager is null"

    .line 36
    .line 37
    invoke-static {v0, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method private stopSystemBluetoothSco(Landroid/media/AudioManager;)V
    .locals 2

    .line 1
    const-string v0, "AudioRouteDeviceManager"

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    :try_start_0
    invoke-virtual {p1}, Landroid/media/AudioManager;->stopBluetoothSco()V

    .line 6
    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-virtual {p1, v1}, Landroid/media/AudioManager;->setBluetoothScoOn(Z)V

    .line 10
    .line 11
    .line 12
    iput-boolean v1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mScoHasStarted:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    .line 14
    return-void

    .line 15
    :catch_0
    move-exception p0

    .line 16
    new-instance p1, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    const-string v1, "AudioRouteDeviceManager: stopSystemBluetoothSco failed, Exception: "

    .line 19
    .line 20
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-static {v0, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    const-string p0, "AudioRouteDeviceManager: stopSystemBluetoothSco skipped, audioManager is null"

    .line 39
    .line 40
    invoke-static {v0, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method private unregisterReceiver()I
    .locals 3

    .line 1
    invoke-static {}, Lcom/ss/bytertc/audio/device/router/AudioRouteUtil;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, -0x1

    .line 8
    return p0

    .line 9
    :cond_0
    iget-boolean v1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->registered:Z

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    if-nez v1, :cond_1

    .line 13
    .line 14
    return v2

    .line 15
    :cond_1
    iput-boolean v2, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->registered:Z

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/content/BroadcastReceiver;->clearAbortBroadcast()V

    .line 21
    .line 22
    .line 23
    iget-boolean v1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mUseAudioDeviceCallback:Z

    .line 24
    .line 25
    if-eqz v1, :cond_3

    .line 26
    .line 27
    const-string v1, "audio"

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Landroid/media/AudioManager;

    .line 34
    .line 35
    if-nez v0, :cond_2

    .line 36
    .line 37
    const/4 p0, -0x2

    .line 38
    return p0

    .line 39
    :cond_2
    iget-object v1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothDeviceCallback:Landroid/media/AudioDeviceCallback;

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->unregisterAudioDeviceCallback(Landroid/media/AudioDeviceCallback;)V

    .line 42
    .line 43
    .line 44
    const/4 v0, 0x0

    .line 45
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothDeviceCallback:Landroid/media/AudioDeviceCallback;

    .line 46
    .line 47
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    const-string v1, "AudioRouteDeviceManager: unregisterReceiver SkipBluetooth:"

    .line 50
    .line 51
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    iget-boolean p0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mUseAudioDeviceCallback:Z

    .line 55
    .line 56
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    const-string v0, "AudioRouteDeviceManager"

    .line 64
    .line 65
    invoke-static {v0, p0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    return v2
.end method


# virtual methods
.method public getCaptureDeviceName()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->getRenderDeviceName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getDeviceState()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mInitDeviceState:I

    .line 2
    .line 3
    return p0
.end method

.method public getRenderDeviceName()Ljava/lang/String;
    .locals 2

    .line 1
    iget v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->currentRouting:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eq v0, v1, :cond_9

    .line 5
    .line 6
    const/4 v1, 0x2

    .line 7
    if-eq v0, v1, :cond_8

    .line 8
    .line 9
    const/4 v1, 0x4

    .line 10
    if-eq v0, v1, :cond_6

    .line 11
    .line 12
    const/16 v1, 0x8

    .line 13
    .line 14
    if-eq v0, v1, :cond_4

    .line 15
    .line 16
    const/16 v1, 0x10

    .line 17
    .line 18
    if-eq v0, v1, :cond_2

    .line 19
    .line 20
    const/16 v1, 0x20

    .line 21
    .line 22
    if-eq v0, v1, :cond_0

    .line 23
    .line 24
    const-string p0, "failed_device_name"

    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mUsbHeadsetDevice:Landroid/hardware/usb/UsbDevice;

    .line 28
    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/hardware/usb/UsbDevice;->getDeviceName()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0

    .line 36
    :cond_1
    const-string p0, "failed_usb-headset"

    .line 37
    .line 38
    return-object p0

    .line 39
    :cond_2
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothDevice:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 40
    .line 41
    if-eqz p0, :cond_3

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->getName()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0

    .line 48
    :cond_3
    const-string p0, "failed_bluetooth-a2dp"

    .line 49
    .line 50
    return-object p0

    .line 51
    :cond_4
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothDevice:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 52
    .line 53
    if-eqz p0, :cond_5

    .line 54
    .line 55
    invoke-virtual {p0}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->getName()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    return-object p0

    .line 60
    :cond_5
    const-string p0, "failed_bluetooth-headset"

    .line 61
    .line 62
    return-object p0

    .line 63
    :cond_6
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mWiredHeadsetDevice:Ljava/lang/String;

    .line 64
    .line 65
    if-eqz p0, :cond_7

    .line 66
    .line 67
    return-object p0

    .line 68
    :cond_7
    const-string p0, "failed_wired-headset"

    .line 69
    .line 70
    return-object p0

    .line 71
    :cond_8
    const-string p0, "built-in speaker"

    .line 72
    .line 73
    return-object p0

    .line 74
    :cond_9
    const-string p0, "earpiece"

    .line 75
    .line 76
    return-object p0
.end method

.method public getSessionInfo()Ljava/lang/String;
    .locals 11

    .line 1
    const-string v0, "{ Audio State: audio_mode:"

    .line 2
    .line 3
    invoke-static {}, Lcom/ss/bytertc/audio/device/router/AudioRouteUtil;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    const-string p0, "Context is null"

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const-string v2, "audio"

    .line 13
    .line 14
    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    check-cast v2, Landroid/media/AudioManager;

    .line 19
    .line 20
    if-nez v2, :cond_1

    .line 21
    .line 22
    const-string p0, "AudioManager is null"

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_1
    iget-object v3, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mCallback:Lcom/ss/bytertc/audio/device/router/IAudioRouteCallback;

    .line 26
    .line 27
    if-nez v3, :cond_2

    .line 28
    .line 29
    const-string p0, "mCallback is null"

    .line 30
    .line 31
    return-object p0

    .line 32
    :cond_2
    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    const-string v4, "android.hardware.microphone"

    .line 37
    .line 38
    invoke-virtual {v3, v4}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    const-string v4, "android.permission.RECORD_AUDIO"

    .line 43
    .line 44
    invoke-static {v1, v4}, Ll/j26;->a(Landroid/content/Context;Ljava/lang/String;)I

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    const/4 v5, 0x1

    .line 49
    const/4 v6, 0x0

    .line 50
    if-nez v4, :cond_3

    .line 51
    .line 52
    move v4, v5

    .line 53
    goto :goto_0

    .line 54
    :cond_3
    move v4, v6

    .line 55
    :goto_0
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 56
    .line 57
    .line 58
    move-result-object v7

    .line 59
    iget v7, v7, Landroid/content/pm/ApplicationInfo;->targetSdkVersion:I

    .line 60
    .line 61
    const/16 v8, 0x1e

    .line 62
    .line 63
    const-string v9, "android.permission.FOREGROUND_SERVICE"

    .line 64
    .line 65
    const/16 v10, 0x22

    .line 66
    .line 67
    if-gt v8, v7, :cond_5

    .line 68
    .line 69
    if-ge v7, v10, :cond_5

    .line 70
    .line 71
    invoke-static {v1, v9}, Ll/j26;->a(Landroid/content/Context;Ljava/lang/String;)I

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    if-nez v1, :cond_4

    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_4
    move v5, v6

    .line 79
    :goto_1
    move v6, v5

    .line 80
    goto :goto_2

    .line 81
    :cond_5
    if-gt v10, v7, :cond_6

    .line 82
    .line 83
    invoke-static {v1, v9}, Ll/j26;->a(Landroid/content/Context;Ljava/lang/String;)I

    .line 84
    .line 85
    .line 86
    move-result v7

    .line 87
    if-nez v7, :cond_4

    .line 88
    .line 89
    const-string v7, "android.permission.FOREGROUND_SERVICE_MICROPHONE"

    .line 90
    .line 91
    invoke-static {v1, v7}, Ll/j26;->a(Landroid/content/Context;Ljava/lang/String;)I

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    if-nez v1, :cond_4

    .line 96
    .line 97
    goto :goto_1

    .line 98
    :cond_6
    :goto_2
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 99
    .line 100
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v2}, Landroid/media/AudioManager;->getMode()I

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    invoke-static {v0}, Lcom/ss/bytertc/audio/device/router/AudioRouteUtil;->modeString(I)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    const-string v0, ", has_mic:"

    .line 115
    .line 116
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    const-string v0, ", mic_muted:"

    .line 123
    .line 124
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    invoke-virtual {v2}, Landroid/media/AudioManager;->isMicrophoneMute()Z

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    const-string v0, ", speakerphone:"

    .line 135
    .line 136
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    invoke-virtual {v2}, Landroid/media/AudioManager;->isSpeakerphoneOn()Z

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    const-string v0, ", headset:"

    .line 147
    .line 148
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    invoke-virtual {v2}, Landroid/media/AudioManager;->isWiredHeadsetOn()Z

    .line 152
    .line 153
    .line 154
    move-result v0

    .line 155
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    const-string v0, ", bt_sco:"

    .line 159
    .line 160
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    invoke-virtual {v2}, Landroid/media/AudioManager;->isBluetoothScoOn()Z

    .line 164
    .line 165
    .line 166
    move-result v0

    .line 167
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    const-string v0, ", permission:"

    .line 171
    .line 172
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    const-string v0, ", foregroundServiceMic:"

    .line 179
    .line 180
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 184
    .line 185
    .line 186
    const-string v0, ", bluetoothPermission:"

    .line 187
    .line 188
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 189
    .line 190
    .line 191
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothPermissionDesp:Ljava/lang/String;

    .line 192
    .line 193
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 194
    .line 195
    .line 196
    const-string p0, " }"

    .line 197
    .line 198
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 199
    .line 200
    .line 201
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 205
    return-object p0

    .line 206
    :catch_0
    move-exception p0

    .line 207
    new-instance v0, Ljava/lang/StringBuilder;

    .line 208
    .line 209
    const-string v1, "getSessionInfo failed, exception: "

    .line 210
    .line 211
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 212
    .line 213
    .line 214
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 215
    .line 216
    .line 217
    move-result-object p0

    .line 218
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 219
    .line 220
    .line 221
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object p0

    .line 225
    const-string v0, "AudioRouteDeviceManager: "

    .line 226
    .line 227
    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    const-string v1, "AudioRouteDeviceManager"

    .line 232
    .line 233
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 234
    .line 235
    .line 236
    return-object p0
.end method

.method public init()I
    .locals 2

    .line 1
    new-instance v0, Landroid/content/IntentFilter;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mIntentFilter:Landroid/content/IntentFilter;

    .line 7
    .line 8
    const-string v1, "android.bluetooth.adapter.action.STATE_CHANGED"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mIntentFilter:Landroid/content/IntentFilter;

    .line 14
    .line 15
    const-string v1, "android.hardware.usb.action.USB_DEVICE_ATTACHED"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mIntentFilter:Landroid/content/IntentFilter;

    .line 21
    .line 22
    const-string v1, "android.hardware.usb.action.USB_DEVICE_DETACHED"

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->initHandler()V

    .line 28
    .line 29
    .line 30
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->initHeadset()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    iget v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mInitDeviceState:I

    .line 37
    .line 38
    add-int/lit8 v0, v0, 0x4

    .line 39
    .line 40
    iput v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mInitDeviceState:I

    .line 41
    .line 42
    :cond_0
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->initUsbHeadset()Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_1

    .line 47
    .line 48
    iget v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mInitDeviceState:I

    .line 49
    .line 50
    add-int/lit8 v0, v0, 0x20

    .line 51
    .line 52
    iput v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mInitDeviceState:I

    .line 53
    .line 54
    :cond_1
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->initBluetooth()V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothDevice:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 58
    .line 59
    if-eqz v0, :cond_3

    .line 60
    .line 61
    const/4 v1, 0x1

    .line 62
    invoke-virtual {v0, v1}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->getBluetoothConnected(I)Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-eqz v0, :cond_2

    .line 67
    .line 68
    iget v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mInitDeviceState:I

    .line 69
    .line 70
    add-int/lit8 v0, v0, 0x8

    .line 71
    .line 72
    iput v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mInitDeviceState:I

    .line 73
    .line 74
    :cond_2
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothDevice:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 75
    .line 76
    const/4 v1, 0x2

    .line 77
    invoke-virtual {v0, v1}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->getBluetoothConnected(I)Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-eqz v0, :cond_3

    .line 82
    .line 83
    iget v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mInitDeviceState:I

    .line 84
    .line 85
    add-int/lit8 v0, v0, 0x10

    .line 86
    .line 87
    iput v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mInitDeviceState:I

    .line 88
    .line 89
    :cond_3
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->registerReceiver()I

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-eqz v0, :cond_4

    .line 94
    .line 95
    const-string v0, "AudioRouteDeviceManager"

    .line 96
    .line 97
    const-string v1, "AudioRouteDeviceManager: registerReceiver failed."

    .line 98
    .line 99
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->release()I

    .line 103
    .line 104
    .line 105
    const/4 p0, -0x2

    .line 106
    return p0

    .line 107
    :cond_4
    const/4 p0, 0x0

    .line 108
    return p0
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 13

    .line 1
    const-string v0, "AudioRouteDeviceManager: destroy mBluetoothDevice due to headset & a2dp disconncected"

    .line 2
    .line 3
    const-string v1, "AudioRouteDeviceManager: destroy mBluetoothDevice due to headset & a2dp disconncected"

    .line 4
    .line 5
    const-string v2, "AudioRouteDeviceManager: destroy mBluetoothDevice due to bluetooth adapter is closed: "

    .line 6
    .line 7
    if-nez p2, :cond_0

    .line 8
    .line 9
    goto/16 :goto_1f

    .line 10
    .line 11
    :cond_0
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    if-nez v3, :cond_1

    .line 16
    .line 17
    const-string p0, "AudioRouteDeviceManager"

    .line 18
    .line 19
    const-string p1, "AudioRouteDeviceManager: action is null"

    .line 20
    .line 21
    invoke-static {p0, p1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    const-string v4, ""

    .line 26
    .line 27
    const-string v5, "android.bluetooth.adapter.action.STATE_CHANGED"

    .line 28
    .line 29
    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v5

    .line 33
    const/16 v6, 0x10

    .line 34
    .line 35
    const/16 v7, 0x8

    .line 36
    .line 37
    const/4 v8, 0x0

    .line 38
    const/16 v9, -0x63

    .line 39
    .line 40
    const/4 v10, 0x0

    .line 41
    const/4 v11, 0x1

    .line 42
    if-eqz v5, :cond_6

    .line 43
    .line 44
    const-string p1, "android.bluetooth.adapter.extra.STATE"

    .line 45
    .line 46
    invoke-virtual {p2, p1, v9}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    const-string v0, "android.bluetooth.device.extra.DEVICE"

    .line 51
    .line 52
    invoke-virtual {p2, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    check-cast p2, Landroid/bluetooth/BluetoothDevice;

    .line 57
    .line 58
    const/16 v0, 0xa

    .line 59
    .line 60
    if-eq p1, v0, :cond_3

    .line 61
    .line 62
    const/16 v0, 0xc

    .line 63
    .line 64
    if-eq p1, v0, :cond_2

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_2
    const-string v0, "AudioRouteDeviceManager"

    .line 68
    .line 69
    new-instance v1, Ljava/lang/StringBuilder;

    .line 70
    .line 71
    const-string v2, "AudioRouteDeviceManager: ACTION_BT_STATE_CHANGED:STATE_ON:"

    .line 72
    .line 73
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p2

    .line 83
    invoke-static {v0, p2}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    :goto_0
    move v6, v7

    .line 87
    :goto_1
    move p2, v10

    .line 88
    move v0, p2

    .line 89
    goto/16 :goto_1e

    .line 90
    .line 91
    :cond_3
    const-string p1, "AudioRouteDeviceManager"

    .line 92
    .line 93
    new-instance v0, Ljava/lang/StringBuilder;

    .line 94
    .line 95
    const-string v1, "AudioRouteDeviceManager: ACTION_BT_STATE_CHANGED:STATE_OFF:"

    .line 96
    .line 97
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    iget-object v1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothDevice:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 101
    .line 102
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-static {p1, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    iget-object p1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mCallback:Lcom/ss/bytertc/audio/device/router/IAudioRouteCallback;

    .line 113
    .line 114
    if-eqz p1, :cond_4

    .line 115
    .line 116
    invoke-interface {p1, v7, v10, v4}, Lcom/ss/bytertc/audio/device/router/IAudioRouteCallback;->onDeviceEvent(IZLjava/lang/String;)V

    .line 117
    .line 118
    .line 119
    iget-object p1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mCallback:Lcom/ss/bytertc/audio/device/router/IAudioRouteCallback;

    .line 120
    .line 121
    invoke-interface {p1, v6, v10, v4}, Lcom/ss/bytertc/audio/device/router/IAudioRouteCallback;->onDeviceEvent(IZLjava/lang/String;)V

    .line 122
    .line 123
    .line 124
    :cond_4
    iget-object v5, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->bluetoothLock:Ljava/lang/Object;

    .line 125
    .line 126
    monitor-enter v5

    .line 127
    :try_start_0
    iget-object p1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothDevice:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 128
    .line 129
    if-eqz p1, :cond_5

    .line 130
    .line 131
    const-string p1, "AudioRouteDeviceManager"

    .line 132
    .line 133
    new-instance v0, Ljava/lang/StringBuilder;

    .line 134
    .line 135
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object p2

    .line 145
    invoke-static {p1, p2}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    iput-object v8, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothDevice:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 149
    .line 150
    goto :goto_2

    .line 151
    :catchall_0
    move-exception p0

    .line 152
    goto :goto_3

    .line 153
    :cond_5
    :goto_2
    monitor-exit v5

    .line 154
    return-void

    .line 155
    :goto_3
    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 156
    throw p0

    .line 157
    :cond_6
    const-string v2, "android.bluetooth.headset.profile.action.CONNECTION_STATE_CHANGED"

    .line 158
    .line 159
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 160
    .line 161
    .line 162
    move-result v2

    .line 163
    const/4 v5, 0x3

    .line 164
    const/4 v12, 0x2

    .line 165
    if-eqz v2, :cond_c

    .line 166
    .line 167
    const-string v0, "android.bluetooth.profile.extra.STATE"

    .line 168
    .line 169
    invoke-virtual {p2, v0, v9}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 170
    .line 171
    .line 172
    move-result v0

    .line 173
    const-string v2, "android.bluetooth.device.extra.DEVICE"

    .line 174
    .line 175
    invoke-virtual {p2, v2}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 176
    .line 177
    .line 178
    move-result-object p2

    .line 179
    check-cast p2, Landroid/bluetooth/BluetoothDevice;

    .line 180
    .line 181
    if-eqz v0, :cond_a

    .line 182
    .line 183
    if-eq v0, v11, :cond_9

    .line 184
    .line 185
    if-eq v0, v12, :cond_7

    .line 186
    .line 187
    if-eq v0, v5, :cond_9

    .line 188
    .line 189
    const-string p1, "AudioRouteDeviceManager"

    .line 190
    .line 191
    new-instance p2, Ljava/lang/StringBuilder;

    .line 192
    .line 193
    const-string v1, "AudioRouteDeviceManager: ACTION_BT_HEADSET_CONNECTION_STATE_CHANGED, unknown state: "

    .line 194
    .line 195
    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 196
    .line 197
    .line 198
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 199
    .line 200
    .line 201
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object p2

    .line 205
    invoke-static {p1, p2}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 206
    .line 207
    .line 208
    goto :goto_7

    .line 209
    :cond_7
    const-string v1, "AudioRouteDeviceManager"

    .line 210
    .line 211
    new-instance v2, Ljava/lang/StringBuilder;

    .line 212
    .line 213
    const-string v5, "AudioRouteDeviceManager: ACTION_BT_HEADSET_CONNECTION_STATE_CHANGED:STATE_CONNECTED:"

    .line 214
    .line 215
    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 216
    .line 217
    .line 218
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 219
    .line 220
    .line 221
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object v2

    .line 225
    invoke-static {v1, v2}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 226
    .line 227
    .line 228
    const-string v1, ""

    .line 229
    .line 230
    filled-new-array {v1}, [Ljava/lang/String;

    .line 231
    .line 232
    .line 233
    move-result-object v1

    .line 234
    if-eqz p2, :cond_9

    .line 235
    .line 236
    invoke-direct {p0, p1, v11, p2, v1}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->isBtDeviceMajorValid(Landroid/content/Context;ILandroid/bluetooth/BluetoothDevice;[Ljava/lang/String;)Z

    .line 237
    .line 238
    .line 239
    move-result p1

    .line 240
    if-eqz p1, :cond_9

    .line 241
    .line 242
    iget-object p1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->bluetoothLock:Ljava/lang/Object;

    .line 243
    .line 244
    monitor-enter p1

    .line 245
    :try_start_1
    iget-object v2, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothDevice:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 246
    .line 247
    if-nez v2, :cond_8

    .line 248
    .line 249
    new-instance v2, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 250
    .line 251
    invoke-direct {v2, p0, p2}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;-><init>(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;Landroid/bluetooth/BluetoothDevice;)V

    .line 252
    .line 253
    .line 254
    iput-object v2, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothDevice:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 255
    .line 256
    goto :goto_4

    .line 257
    :catchall_1
    move-exception p0

    .line 258
    goto :goto_6

    .line 259
    :cond_8
    :goto_4
    iget-object p2, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothDevice:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 260
    .line 261
    const-string v2, "broadcast"

    .line 262
    .line 263
    aget-object v1, v1, v10

    .line 264
    .line 265
    invoke-virtual {p2, v2, v1}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->appendDeviceInfo(Ljava/lang/String;Ljava/lang/String;)V

    .line 266
    .line 267
    .line 268
    iget-object p2, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothDevice:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 269
    .line 270
    invoke-virtual {p2, v11, v11}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->setBluetoothConnected(IZ)V

    .line 271
    .line 272
    .line 273
    iget-object p2, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothDevice:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 274
    .line 275
    invoke-virtual {p2}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->getAttrsString()Ljava/lang/String;

    .line 276
    .line 277
    .line 278
    move-result-object v4

    .line 279
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 280
    iput v10, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothScoRestartTimes:I

    .line 281
    .line 282
    move p1, v11

    .line 283
    :goto_5
    move p2, p1

    .line 284
    goto :goto_9

    .line 285
    :goto_6
    :try_start_2
    monitor-exit p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 286
    throw p0

    .line 287
    :cond_9
    :goto_7
    move p1, v10

    .line 288
    goto :goto_5

    .line 289
    :cond_a
    const-string p1, "AudioRouteDeviceManager"

    .line 290
    .line 291
    new-instance v2, Ljava/lang/StringBuilder;

    .line 292
    .line 293
    const-string v5, "AudioRouteDeviceManager: ACTION_BT_HEADSET_CONNECTION_STATE_CHANGED:STATE_DISCONNECTED:"

    .line 294
    .line 295
    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 296
    .line 297
    .line 298
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 299
    .line 300
    .line 301
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 302
    .line 303
    .line 304
    move-result-object v2

    .line 305
    invoke-static {p1, v2}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 306
    .line 307
    .line 308
    iget-object v2, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->bluetoothLock:Ljava/lang/Object;

    .line 309
    .line 310
    monitor-enter v2

    .line 311
    :try_start_3
    iget-object p1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothDevice:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 312
    .line 313
    if-eqz p1, :cond_b

    .line 314
    .line 315
    invoke-virtual {p1, v11, v10}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->setBluetoothConnected(IZ)V

    .line 316
    .line 317
    .line 318
    iget-object p1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothDevice:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 319
    .line 320
    invoke-virtual {p1}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->getAttrsString()Ljava/lang/String;

    .line 321
    .line 322
    .line 323
    move-result-object v4

    .line 324
    iget-object p1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothDevice:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 325
    .line 326
    invoke-virtual {p1, v11}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->getBluetoothConnected(I)Z

    .line 327
    .line 328
    .line 329
    move-result p1

    .line 330
    if-nez p1, :cond_b

    .line 331
    .line 332
    iget-object p1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothDevice:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 333
    .line 334
    invoke-virtual {p1, v12}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->getBluetoothConnected(I)Z

    .line 335
    .line 336
    .line 337
    move-result p1

    .line 338
    if-nez p1, :cond_b

    .line 339
    .line 340
    const-string p1, "AudioRouteDeviceManager"

    .line 341
    .line 342
    new-instance v5, Ljava/lang/StringBuilder;

    .line 343
    .line 344
    invoke-direct {v5, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 345
    .line 346
    .line 347
    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 348
    .line 349
    .line 350
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 351
    .line 352
    .line 353
    move-result-object p2

    .line 354
    invoke-static {p1, p2}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 355
    .line 356
    .line 357
    iput-object v8, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothDevice:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 358
    .line 359
    goto :goto_8

    .line 360
    :catchall_2
    move-exception p0

    .line 361
    goto :goto_a

    .line 362
    :cond_b
    :goto_8
    monitor-exit v2

    .line 363
    move p1, v10

    .line 364
    move p2, v11

    .line 365
    :goto_9
    move v6, p2

    .line 366
    move p2, p1

    .line 367
    move p1, v0

    .line 368
    move v0, v6

    .line 369
    move v6, v7

    .line 370
    goto/16 :goto_1e

    .line 371
    .line 372
    :goto_a
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 373
    throw p0

    .line 374
    :cond_c
    const-string v1, "android.bluetooth.a2dp.profile.action.CONNECTION_STATE_CHANGED"

    .line 375
    .line 376
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 377
    .line 378
    .line 379
    move-result v1

    .line 380
    if-eqz v1, :cond_13

    .line 381
    .line 382
    const-string v1, "android.bluetooth.profile.extra.STATE"

    .line 383
    .line 384
    invoke-virtual {p2, v1, v9}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 385
    .line 386
    .line 387
    move-result v1

    .line 388
    const-string v2, "android.bluetooth.device.extra.DEVICE"

    .line 389
    .line 390
    invoke-virtual {p2, v2}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 391
    .line 392
    .line 393
    move-result-object p2

    .line 394
    check-cast p2, Landroid/bluetooth/BluetoothDevice;

    .line 395
    .line 396
    if-eqz v1, :cond_11

    .line 397
    .line 398
    if-eq v1, v11, :cond_10

    .line 399
    .line 400
    if-eq v1, v12, :cond_d

    .line 401
    .line 402
    if-eq v1, v5, :cond_10

    .line 403
    .line 404
    const-string p1, "AudioRouteDeviceManager"

    .line 405
    .line 406
    new-instance p2, Ljava/lang/StringBuilder;

    .line 407
    .line 408
    const-string v0, "AudioRouteDeviceManager: ACTION_BT_A2DP_CONNECTION_STATE_CHANGED, unknown state: "

    .line 409
    .line 410
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 411
    .line 412
    .line 413
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 414
    .line 415
    .line 416
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 417
    .line 418
    .line 419
    move-result-object p2

    .line 420
    invoke-static {p1, p2}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 421
    .line 422
    .line 423
    goto :goto_f

    .line 424
    :cond_d
    const-string v0, "AudioRouteDeviceManager"

    .line 425
    .line 426
    new-instance v2, Ljava/lang/StringBuilder;

    .line 427
    .line 428
    const-string v5, "AudioRouteDeviceManager: ACTION_BT_A2DP_CONNECTION_STATE_CHANGED:STATE_CONNECTED:"

    .line 429
    .line 430
    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 431
    .line 432
    .line 433
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 434
    .line 435
    .line 436
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 437
    .line 438
    .line 439
    move-result-object v2

    .line 440
    invoke-static {v0, v2}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 441
    .line 442
    .line 443
    const-string v0, ""

    .line 444
    .line 445
    filled-new-array {v0}, [Ljava/lang/String;

    .line 446
    .line 447
    .line 448
    move-result-object v0

    .line 449
    iget-object v2, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->bluetoothLock:Ljava/lang/Object;

    .line 450
    .line 451
    monitor-enter v2

    .line 452
    if-eqz p2, :cond_f

    .line 453
    .line 454
    :try_start_4
    iget-object v4, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothDevice:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 455
    .line 456
    if-nez v4, :cond_e

    .line 457
    .line 458
    new-instance v4, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 459
    .line 460
    invoke-direct {v4, p0, p2}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;-><init>(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;Landroid/bluetooth/BluetoothDevice;)V

    .line 461
    .line 462
    .line 463
    iput-object v4, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothDevice:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 464
    .line 465
    goto :goto_b

    .line 466
    :catchall_3
    move-exception p0

    .line 467
    goto :goto_e

    .line 468
    :cond_e
    :goto_b
    invoke-direct {p0, p1, v12, p2, v0}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->isBtDeviceMajorValid(Landroid/content/Context;ILandroid/bluetooth/BluetoothDevice;[Ljava/lang/String;)Z

    .line 469
    .line 470
    .line 471
    iget-object p1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothDevice:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 472
    .line 473
    const-string p2, "broadcast"

    .line 474
    .line 475
    aget-object v0, v0, v10

    .line 476
    .line 477
    invoke-virtual {p1, p2, v0}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->appendDeviceInfo(Ljava/lang/String;Ljava/lang/String;)V

    .line 478
    .line 479
    .line 480
    iget-object p1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothDevice:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 481
    .line 482
    invoke-virtual {p1, v12, v11}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->setBluetoothConnected(IZ)V

    .line 483
    .line 484
    .line 485
    iget-object p1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothDevice:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 486
    .line 487
    invoke-virtual {p1}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->getAttrsString()Ljava/lang/String;

    .line 488
    .line 489
    .line 490
    move-result-object v4

    .line 491
    iput v10, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothScoRestartTimes:I

    .line 492
    .line 493
    move p1, v11

    .line 494
    :goto_c
    move p2, p1

    .line 495
    goto :goto_d

    .line 496
    :cond_f
    move p1, v10

    .line 497
    goto :goto_c

    .line 498
    :goto_d
    monitor-exit v2

    .line 499
    goto :goto_11

    .line 500
    :goto_e
    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 501
    throw p0

    .line 502
    :cond_10
    :goto_f
    move p1, v10

    .line 503
    move p2, p1

    .line 504
    goto :goto_11

    .line 505
    :cond_11
    const-string p1, "AudioRouteDeviceManager"

    .line 506
    .line 507
    new-instance v2, Ljava/lang/StringBuilder;

    .line 508
    .line 509
    const-string v5, "AudioRouteDeviceManager: ACTION_BT_A2DP_CONNECTION_STATE_CHANGED:STATE_DISCONNECTED:"

    .line 510
    .line 511
    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 512
    .line 513
    .line 514
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 515
    .line 516
    .line 517
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 518
    .line 519
    .line 520
    move-result-object v2

    .line 521
    invoke-static {p1, v2}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 522
    .line 523
    .line 524
    iget-object p1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->bluetoothLock:Ljava/lang/Object;

    .line 525
    .line 526
    monitor-enter p1

    .line 527
    :try_start_5
    iget-object v2, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothDevice:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 528
    .line 529
    if-eqz v2, :cond_12

    .line 530
    .line 531
    invoke-virtual {v2, v12, v10}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->setBluetoothConnected(IZ)V

    .line 532
    .line 533
    .line 534
    iget-object v2, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothDevice:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 535
    .line 536
    invoke-virtual {v2}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->getAttrsString()Ljava/lang/String;

    .line 537
    .line 538
    .line 539
    move-result-object v4

    .line 540
    iget-object v2, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothDevice:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 541
    .line 542
    invoke-virtual {v2, v11}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->getBluetoothConnected(I)Z

    .line 543
    .line 544
    .line 545
    move-result v2

    .line 546
    if-nez v2, :cond_12

    .line 547
    .line 548
    iget-object v2, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothDevice:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 549
    .line 550
    invoke-virtual {v2, v12}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->getBluetoothConnected(I)Z

    .line 551
    .line 552
    .line 553
    move-result v2

    .line 554
    if-nez v2, :cond_12

    .line 555
    .line 556
    const-string v2, "AudioRouteDeviceManager"

    .line 557
    .line 558
    new-instance v5, Ljava/lang/StringBuilder;

    .line 559
    .line 560
    invoke-direct {v5, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 561
    .line 562
    .line 563
    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 564
    .line 565
    .line 566
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 567
    .line 568
    .line 569
    move-result-object p2

    .line 570
    invoke-static {v2, p2}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 571
    .line 572
    .line 573
    iput-object v8, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothDevice:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 574
    .line 575
    goto :goto_10

    .line 576
    :catchall_4
    move-exception p0

    .line 577
    goto :goto_12

    .line 578
    :cond_12
    :goto_10
    monitor-exit p1

    .line 579
    move p1, v10

    .line 580
    move p2, v11

    .line 581
    :goto_11
    move v0, p2

    .line 582
    move p2, p1

    .line 583
    move p1, v1

    .line 584
    goto/16 :goto_1e

    .line 585
    .line 586
    :goto_12
    monitor-exit p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_4

    .line 587
    throw p0

    .line 588
    :cond_13
    const-string p1, "android.media.ACTION_SCO_AUDIO_STATE_UPDATED"

    .line 589
    .line 590
    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 591
    .line 592
    .line 593
    move-result p1

    .line 594
    if-eqz p1, :cond_18

    .line 595
    .line 596
    const-string p1, "android.media.extra.SCO_AUDIO_STATE"

    .line 597
    .line 598
    invoke-virtual {p2, p1, v9}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 599
    .line 600
    .line 601
    move-result p1

    .line 602
    if-eqz p1, :cond_16

    .line 603
    .line 604
    if-eq p1, v11, :cond_14

    .line 605
    .line 606
    move p2, v10

    .line 607
    :goto_13
    move v0, p2

    .line 608
    goto :goto_17

    .line 609
    :cond_14
    const-string p2, "AudioRouteDeviceManager"

    .line 610
    .line 611
    const-string v0, "AudioRouteDeviceManager: SCO_AUDIO_STATE_CONNECTED"

    .line 612
    .line 613
    invoke-static {p2, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 614
    .line 615
    .line 616
    iget-object p2, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->bluetoothLock:Ljava/lang/Object;

    .line 617
    .line 618
    monitor-enter p2

    .line 619
    :try_start_6
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothDevice:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 620
    .line 621
    if-eqz v0, :cond_15

    .line 622
    .line 623
    invoke-virtual {v0}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->getAttrsString()Ljava/lang/String;

    .line 624
    .line 625
    .line 626
    move-result-object v4

    .line 627
    goto :goto_14

    .line 628
    :catchall_5
    move-exception p0

    .line 629
    goto :goto_15

    .line 630
    :cond_15
    :goto_14
    monitor-exit p2

    .line 631
    move p2, v11

    .line 632
    goto :goto_13

    .line 633
    :goto_15
    monitor-exit p2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_5

    .line 634
    throw p0

    .line 635
    :cond_16
    const-string p2, "AudioRouteDeviceManager"

    .line 636
    .line 637
    const-string v0, "AudioRouteDeviceManager: SCO_AUDIO_STATE_DISCONNECTED"

    .line 638
    .line 639
    invoke-static {p2, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 640
    .line 641
    .line 642
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->bluetoothLock:Ljava/lang/Object;

    .line 643
    .line 644
    monitor-enter v0

    .line 645
    :try_start_7
    iget-object p2, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothDevice:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 646
    .line 647
    if-eqz p2, :cond_17

    .line 648
    .line 649
    invoke-virtual {p2}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;->getAttrsString()Ljava/lang/String;

    .line 650
    .line 651
    .line 652
    move-result-object v4

    .line 653
    goto :goto_16

    .line 654
    :catchall_6
    move-exception p0

    .line 655
    goto :goto_18

    .line 656
    :cond_17
    :goto_16
    monitor-exit v0

    .line 657
    move p2, v10

    .line 658
    move v0, v11

    .line 659
    :goto_17
    const/16 v6, 0x40

    .line 660
    .line 661
    goto/16 :goto_1e

    .line 662
    .line 663
    :goto_18
    monitor-exit v0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_6

    .line 664
    throw p0

    .line 665
    :cond_18
    const-string p1, "android.hardware.usb.action.USB_DEVICE_ATTACHED"

    .line 666
    .line 667
    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 668
    .line 669
    .line 670
    move-result p1

    .line 671
    const/16 v6, 0x20

    .line 672
    .line 673
    const/16 v0, -0x4d2

    .line 674
    .line 675
    if-eqz p1, :cond_1a

    .line 676
    .line 677
    const-string p1, "device"

    .line 678
    .line 679
    invoke-virtual {p2, p1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 680
    .line 681
    .line 682
    move-result-object p1

    .line 683
    check-cast p1, Landroid/hardware/usb/UsbDevice;

    .line 684
    .line 685
    const-string p2, "AudioRouteDeviceManager"

    .line 686
    .line 687
    new-instance v1, Ljava/lang/StringBuilder;

    .line 688
    .line 689
    const-string v2, "AudioRouteDeviceManager: ACTION_USB_DEVICE_ATTACHED:"

    .line 690
    .line 691
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 692
    .line 693
    .line 694
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 695
    .line 696
    .line 697
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 698
    .line 699
    .line 700
    move-result-object v1

    .line 701
    invoke-static {p2, v1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 702
    .line 703
    .line 704
    invoke-direct {p0, p1}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->hasAudioForUsbDevice(Landroid/hardware/usb/UsbDevice;)Z

    .line 705
    .line 706
    .line 707
    move-result p2

    .line 708
    if-eqz p2, :cond_19

    .line 709
    .line 710
    iput-object p1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mUsbHeadsetDevice:Landroid/hardware/usb/UsbDevice;

    .line 711
    .line 712
    move p2, v11

    .line 713
    goto :goto_19

    .line 714
    :cond_19
    move p2, v10

    .line 715
    :goto_19
    move p1, v0

    .line 716
    move v0, p2

    .line 717
    move p2, v11

    .line 718
    goto/16 :goto_1e

    .line 719
    .line 720
    :cond_1a
    const-string p1, "android.hardware.usb.action.USB_DEVICE_DETACHED"

    .line 721
    .line 722
    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 723
    .line 724
    .line 725
    move-result p1

    .line 726
    if-eqz p1, :cond_1c

    .line 727
    .line 728
    const-string p1, "device"

    .line 729
    .line 730
    invoke-virtual {p2, p1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 731
    .line 732
    .line 733
    move-result-object p1

    .line 734
    check-cast p1, Landroid/hardware/usb/UsbDevice;

    .line 735
    .line 736
    const-string p2, "AudioRouteDeviceManager"

    .line 737
    .line 738
    new-instance v1, Ljava/lang/StringBuilder;

    .line 739
    .line 740
    const-string v2, "AudioRouteDeviceManager: ACTION_USB_DEVICE_DETACHED:"

    .line 741
    .line 742
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 743
    .line 744
    .line 745
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 746
    .line 747
    .line 748
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 749
    .line 750
    .line 751
    move-result-object v1

    .line 752
    invoke-static {p2, v1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 753
    .line 754
    .line 755
    invoke-direct {p0, p1}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->hasAudioForUsbDevice(Landroid/hardware/usb/UsbDevice;)Z

    .line 756
    .line 757
    .line 758
    move-result p1

    .line 759
    if-eqz p1, :cond_1b

    .line 760
    .line 761
    iput-object v8, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mUsbHeadsetDevice:Landroid/hardware/usb/UsbDevice;

    .line 762
    .line 763
    move p2, v11

    .line 764
    goto :goto_1a

    .line 765
    :cond_1b
    move p2, v10

    .line 766
    :goto_1a
    move p1, v0

    .line 767
    move v0, p2

    .line 768
    move p2, v10

    .line 769
    goto :goto_1e

    .line 770
    :cond_1c
    const-string p1, "android.intent.action.HEADSET_PLUG"

    .line 771
    .line 772
    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 773
    .line 774
    .line 775
    move-result p1

    .line 776
    if-eqz p1, :cond_21

    .line 777
    .line 778
    invoke-direct {p0, p2}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->headsetPlugActionIsFromUsbHeadset(Landroid/content/Intent;)Z

    .line 779
    .line 780
    .line 781
    move-result p1

    .line 782
    if-eqz p1, :cond_1d

    .line 783
    .line 784
    goto/16 :goto_1f

    .line 785
    .line 786
    :cond_1d
    const-string p1, "state"

    .line 787
    .line 788
    invoke-virtual {p2, p1, v9}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 789
    .line 790
    .line 791
    move-result p1

    .line 792
    if-ne p1, v11, :cond_1e

    .line 793
    .line 794
    move p1, v11

    .line 795
    goto :goto_1b

    .line 796
    :cond_1e
    move p1, v10

    .line 797
    :goto_1b
    const-string p2, "AudioRouteDeviceManager"

    .line 798
    .line 799
    if-eqz p1, :cond_1f

    .line 800
    .line 801
    const-string v1, "connected"

    .line 802
    .line 803
    goto :goto_1c

    .line 804
    :cond_1f
    const-string v1, "disconnected"

    .line 805
    .line 806
    :goto_1c
    const-string v2, "AudioRouteDeviceManager: ACTION_HEADSET_PLUG:"

    .line 807
    .line 808
    invoke-virtual {v2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 809
    .line 810
    .line 811
    move-result-object v1

    .line 812
    invoke-static {p2, v1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 813
    .line 814
    .line 815
    if-eqz p1, :cond_20

    .line 816
    .line 817
    const-string p2, "wired-headset"

    .line 818
    .line 819
    iput-object p2, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mWiredHeadsetDevice:Ljava/lang/String;

    .line 820
    .line 821
    goto :goto_1d

    .line 822
    :cond_20
    iput-object v8, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mWiredHeadsetDevice:Ljava/lang/String;

    .line 823
    .line 824
    :goto_1d
    const/4 v6, 0x4

    .line 825
    move p2, p1

    .line 826
    move p1, v0

    .line 827
    move v0, v11

    .line 828
    goto :goto_1e

    .line 829
    :cond_21
    const/4 v6, -0x1

    .line 830
    move p1, v0

    .line 831
    goto/16 :goto_1

    .line 832
    .line 833
    :goto_1e
    const-string v1, "AudioRouteDeviceManager"

    .line 834
    .line 835
    new-instance v2, Ljava/lang/StringBuilder;

    .line 836
    .line 837
    const-string v5, "AudioRouteDeviceManager: received action:"

    .line 838
    .line 839
    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 840
    .line 841
    .line 842
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 843
    .line 844
    .line 845
    const-string v3, " state:"

    .line 846
    .line 847
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 848
    .line 849
    .line 850
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 851
    .line 852
    .line 853
    const-string p1, " needReport:"

    .line 854
    .line 855
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 856
    .line 857
    .line 858
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 859
    .line 860
    .line 861
    const-string p1, ", mCallback:"

    .line 862
    .line 863
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 864
    .line 865
    .line 866
    iget-object p1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mCallback:Lcom/ss/bytertc/audio/device/router/IAudioRouteCallback;

    .line 867
    .line 868
    if-eqz p1, :cond_22

    .line 869
    .line 870
    move v10, v11

    .line 871
    :cond_22
    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 872
    .line 873
    .line 874
    const-string p1, ", deviceType:"

    .line 875
    .line 876
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 877
    .line 878
    .line 879
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 880
    .line 881
    .line 882
    const-string p1, ", connectedStatus:"

    .line 883
    .line 884
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 885
    .line 886
    .line 887
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 888
    .line 889
    .line 890
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 891
    .line 892
    .line 893
    move-result-object p1

    .line 894
    invoke-static {v1, p1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 895
    .line 896
    .line 897
    if-eqz v0, :cond_23

    .line 898
    .line 899
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mCallback:Lcom/ss/bytertc/audio/device/router/IAudioRouteCallback;

    .line 900
    .line 901
    if-eqz p0, :cond_23

    .line 902
    .line 903
    invoke-interface {p0, v6, p2, v4}, Lcom/ss/bytertc/audio/device/router/IAudioRouteCallback;->onDeviceEvent(IZLjava/lang/String;)V

    .line 904
    .line 905
    .line 906
    :cond_23
    :goto_1f
    return-void
.end method

.method public release()I
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mCallback:Lcom/ss/bytertc/audio/device/router/IAudioRouteCallback;

    .line 3
    .line 4
    invoke-static {}, Lcom/ss/bytertc/audio/device/router/AudioRouteUtil;->getContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    if-eqz v1, :cond_1

    .line 9
    .line 10
    const-string v2, "audio"

    .line 11
    .line 12
    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Landroid/media/AudioManager;

    .line 17
    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    invoke-virtual {v1}, Landroid/media/AudioManager;->isBluetoothScoOn()Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-nez v2, :cond_0

    .line 25
    .line 26
    iget-boolean v2, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mScoHasStarted:Z

    .line 27
    .line 28
    if-eqz v2, :cond_1

    .line 29
    .line 30
    :cond_0
    invoke-direct {p0, v1}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->stopSystemBluetoothSco(Landroid/media/AudioManager;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->unregisterReceiver()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    const/4 v2, -0x1

    .line 38
    const/4 v3, 0x0

    .line 39
    if-eqz v1, :cond_2

    .line 40
    .line 41
    const-string v1, "AudioRouteDeviceManager"

    .line 42
    .line 43
    const-string v4, "AudioRouteDeviceManager: unregisterReceiver failed."

    .line 44
    .line 45
    invoke-static {v1, v4}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    move v1, v2

    .line 49
    goto :goto_0

    .line 50
    :cond_2
    move v1, v3

    .line 51
    :goto_0
    iget-object v4, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mHandler:Landroid/os/Handler;

    .line 52
    .line 53
    if-eqz v4, :cond_3

    .line 54
    .line 55
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mHandler:Landroid/os/Handler;

    .line 56
    .line 57
    :cond_3
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    .line 58
    .line 59
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mIntentFilter:Landroid/content/IntentFilter;

    .line 60
    .line 61
    iput v3, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mInitDeviceState:I

    .line 62
    .line 63
    iget-object v4, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->bluetoothLock:Ljava/lang/Object;

    .line 64
    .line 65
    monitor-enter v4

    .line 66
    :try_start_0
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothDevice:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 67
    .line 68
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 69
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mUsbHeadsetDevice:Landroid/hardware/usb/UsbDevice;

    .line 70
    .line 71
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mWiredHeadsetDevice:Ljava/lang/String;

    .line 72
    .line 73
    iput v2, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->currentRouting:I

    .line 74
    .line 75
    iput-boolean v3, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mEnableUseAudioDeviceCallback:Z

    .line 76
    .line 77
    iput-boolean v3, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mUseAudioDeviceCallback:Z

    .line 78
    .line 79
    return v1

    .line 80
    :catchall_0
    move-exception p0

    .line 81
    :try_start_1
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 82
    throw p0
.end method

.method public restartBluetoothSco()V
    .locals 5

    .line 1
    const-string v0, "restartBluetoothSco enter."

    .line 2
    .line 3
    const-string v1, "AudioRouteDeviceManager"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothDevice:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$MyBluetoothDevice;

    .line 9
    .line 10
    if-eqz v0, :cond_7

    .line 11
    .line 12
    invoke-static {}, Lcom/ss/bytertc/audio/device/router/AudioRouteUtil;->getContext()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    const-string p0, "restartBluetoothSco failed. Context is null."

    .line 19
    .line 20
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    const-string v2, "audio"

    .line 25
    .line 26
    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Landroid/media/AudioManager;

    .line 31
    .line 32
    if-nez v0, :cond_1

    .line 33
    .line 34
    const-string p0, "restartBluetoothSco failed. AudioManager is null."

    .line 35
    .line 36
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_1
    invoke-virtual {v0}, Landroid/media/AudioManager;->getMode()I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    const/4 v3, 0x3

    .line 45
    if-eq v3, v2, :cond_2

    .line 46
    .line 47
    const-string p0, "restartBluetoothSco failed. Not in communication mode."

    .line 48
    .line 49
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_2
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->bluetoothScoIsStarting()Z

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    if-eqz v2, :cond_3

    .line 58
    .line 59
    const-string p0, "restartBluetoothSco skip. sco is starting."

    .line 60
    .line 61
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_3
    iget v2, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothScoRestartTimes:I

    .line 66
    .line 67
    add-int/lit8 v2, v2, 0x1

    .line 68
    .line 69
    iput v2, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothScoRestartTimes:I

    .line 70
    .line 71
    if-gt v2, v3, :cond_4

    .line 72
    .line 73
    new-instance v2, Ljava/lang/StringBuilder;

    .line 74
    .line 75
    const-string v3, "restartBluetoothScoAsynTask, restart time: "

    .line 76
    .line 77
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    iget v3, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothScoRestartTimes:I

    .line 81
    .line 82
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    invoke-static {v1, v2}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v0}, Landroid/media/AudioManager;->isBluetoothScoOn()Z

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    if-nez v0, :cond_6

    .line 97
    .line 98
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mHandler:Landroid/os/Handler;

    .line 99
    .line 100
    if-eqz v0, :cond_6

    .line 101
    .line 102
    new-instance v2, Ll/bd1;

    .line 103
    .line 104
    invoke-direct {v2, p0}, Ll/bd1;-><init>(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;)V

    .line 105
    .line 106
    .line 107
    const-wide/16 v3, 0xbb8

    .line 108
    .line 109
    invoke-virtual {v0, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 110
    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_4
    iget-boolean v2, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mScoHasStarted:Z

    .line 114
    .line 115
    if-eqz v2, :cond_5

    .line 116
    .line 117
    invoke-direct {p0, v0}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->stopSystemBluetoothSco(Landroid/media/AudioManager;)V

    .line 118
    .line 119
    .line 120
    :cond_5
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mCallback:Lcom/ss/bytertc/audio/device/router/IAudioRouteCallback;

    .line 121
    .line 122
    if-eqz p0, :cond_6

    .line 123
    .line 124
    sget v0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->EVENT_SCO_FAILED_FORCE_TO_MEDIA_MODE:I

    .line 125
    .line 126
    const-string v2, "change to normal mode due to sco restart timeout"

    .line 127
    .line 128
    invoke-interface {p0, v0, v2}, Lcom/ss/bytertc/audio/device/router/IAudioRouteCallback;->onError(ILjava/lang/String;)V

    .line 129
    .line 130
    .line 131
    :cond_6
    :goto_0
    const-string p0, "restartBluetoothSco leave."

    .line 132
    .line 133
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    return-void

    .line 137
    :cond_7
    const-string v0, "restartBluetoothSco skip, no bluetooth device now."

    .line 138
    .line 139
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mHandler:Landroid/os/Handler;

    .line 143
    .line 144
    new-instance v1, Ll/bd1;

    .line 145
    .line 146
    invoke-direct {v1, p0}, Ll/bd1;-><init>(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 150
    .line 151
    .line 152
    return-void
.end method

.method public setAudioRoute(IZ)I
    .locals 11
    .param p1    # I
        .annotation build Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$RoutingDeviceType;
        .end annotation
    .end param

    .line 1
    invoke-static {}, Lcom/ss/bytertc/audio/device/router/AudioRouteUtil;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "AudioRouteDeviceManager"

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string p0, "AudioRouteDeviceManager: setAudioRoute failed. Context is null."

    .line 10
    .line 11
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, -0x1

    .line 15
    return p0

    .line 16
    :cond_0
    const-string v2, "audio"

    .line 17
    .line 18
    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Landroid/media/AudioManager;

    .line 23
    .line 24
    if-nez v0, :cond_1

    .line 25
    .line 26
    const-string p0, "AudioRouteDeviceManager: setAudioRoute failed. AudioManager is null."

    .line 27
    .line 28
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    const/4 p0, -0x2

    .line 32
    return p0

    .line 33
    :cond_1
    iget-object v2, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mCallback:Lcom/ss/bytertc/audio/device/router/IAudioRouteCallback;

    .line 34
    .line 35
    if-nez v2, :cond_2

    .line 36
    .line 37
    const-string p0, "AudioRouteDeviceManager: setAudioRoute failed. mCallback is null."

    .line 38
    .line 39
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    const/4 p0, -0x6

    .line 43
    return p0

    .line 44
    :cond_2
    invoke-virtual {v0}, Landroid/media/AudioManager;->getMode()I

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    const/4 v3, 0x3

    .line 49
    const/4 v4, 0x0

    .line 50
    if-eqz p2, :cond_3

    .line 51
    .line 52
    move v5, v4

    .line 53
    goto :goto_0

    .line 54
    :cond_3
    move v5, v3

    .line 55
    :goto_0
    const-string v6, ", systemMode: "

    .line 56
    .line 57
    const-string v7, ", cacheMode:"

    .line 58
    .line 59
    if-eq v5, v2, :cond_4

    .line 60
    .line 61
    new-instance v8, Ljava/lang/StringBuilder;

    .line 62
    .line 63
    const-string v9, "AudioRouteDeviceManager: isMediaMode:"

    .line 64
    .line 65
    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string p2, " not matched with system!!!"

    .line 84
    .line 85
    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p2

    .line 92
    invoke-static {v1, p2}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v0, v5}, Landroid/media/AudioManager;->setMode(I)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v0}, Landroid/media/AudioManager;->getMode()I

    .line 99
    .line 100
    .line 101
    move-result v2

    .line 102
    :cond_4
    invoke-virtual {v0}, Landroid/media/AudioManager;->isSpeakerphoneOn()Z

    .line 103
    .line 104
    .line 105
    move-result p2

    .line 106
    invoke-virtual {v0}, Landroid/media/AudioManager;->isBluetoothScoOn()Z

    .line 107
    .line 108
    .line 109
    move-result v8

    .line 110
    new-instance v9, Ljava/lang/StringBuilder;

    .line 111
    .line 112
    const-string v10, "AudioRouteDeviceManager: setAudioRoute, deviceType: "

    .line 113
    .line 114
    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    invoke-direct {p0, p1}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->routingDeviceType2Text(I)Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v10

    .line 121
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    const-string v5, ", speakerPhoneOn: "

    .line 137
    .line 138
    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    invoke-virtual {v9, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    const-string v5, ", bluetoothScoOn: "

    .line 145
    .line 146
    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v5

    .line 156
    invoke-static {v1, v5}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 157
    .line 158
    .line 159
    const/4 v5, 0x2

    .line 160
    const/4 v6, 0x1

    .line 161
    if-ne v2, v3, :cond_e

    .line 162
    .line 163
    const/16 v2, 0x8

    .line 164
    .line 165
    if-ne p1, v2, :cond_6

    .line 166
    .line 167
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->bluetoothScoIsStarting()Z

    .line 168
    .line 169
    .line 170
    move-result p2

    .line 171
    new-instance v2, Ljava/lang/StringBuilder;

    .line 172
    .line 173
    const-string v3, "AudioRouteDeviceManager: need to start bluetooth sco in communication mode, sco is starting: "

    .line 174
    .line 175
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 176
    .line 177
    .line 178
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    if-eqz p2, :cond_5

    .line 182
    .line 183
    const-string v3, ", skip start sco"

    .line 184
    .line 185
    goto :goto_1

    .line 186
    :cond_5
    const-string v3, ", continue start sco"

    .line 187
    .line 188
    :goto_1
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 189
    .line 190
    .line 191
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object v2

    .line 195
    invoke-static {v1, v2}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 196
    .line 197
    .line 198
    if-nez v8, :cond_d

    .line 199
    .line 200
    if-nez p2, :cond_d

    .line 201
    .line 202
    const-string p2, "AudioRouteDeviceManager: ready to start sco"

    .line 203
    .line 204
    invoke-static {v1, p2}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 205
    .line 206
    .line 207
    iput v4, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mBluetoothScoConnectCheckTimes:I

    .line 208
    .line 209
    invoke-direct {p0, v0}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->startSystemBluetoothSco(Landroid/media/AudioManager;)V

    .line 210
    .line 211
    .line 212
    iget-object p2, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mHandler:Landroid/os/Handler;

    .line 213
    .line 214
    if-eqz p2, :cond_d

    .line 215
    .line 216
    new-instance v0, Ll/dd1;

    .line 217
    .line 218
    invoke-direct {v0, p0}, Ll/dd1;-><init>(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;)V

    .line 219
    .line 220
    .line 221
    invoke-virtual {p2, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 222
    .line 223
    .line 224
    iget-object p2, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mHandler:Landroid/os/Handler;

    .line 225
    .line 226
    new-instance v0, Ll/cd1;

    .line 227
    .line 228
    invoke-direct {v0, p0}, Ll/cd1;-><init>(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;)V

    .line 229
    .line 230
    .line 231
    const-wide/16 v1, 0xbb8

    .line 232
    .line 233
    invoke-virtual {p2, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 234
    .line 235
    .line 236
    goto :goto_3

    .line 237
    :cond_6
    if-nez v8, :cond_7

    .line 238
    .line 239
    iget-boolean v2, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mScoHasStarted:Z

    .line 240
    .line 241
    if-eqz v2, :cond_8

    .line 242
    .line 243
    :cond_7
    invoke-direct {p0, v0}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->stopSystemBluetoothSco(Landroid/media/AudioManager;)V

    .line 244
    .line 245
    .line 246
    :cond_8
    if-ne p1, v5, :cond_9

    .line 247
    .line 248
    if-nez p2, :cond_d

    .line 249
    .line 250
    invoke-virtual {v0, v6}, Landroid/media/AudioManager;->setSpeakerphoneOn(Z)V

    .line 251
    .line 252
    .line 253
    goto :goto_3

    .line 254
    :cond_9
    if-eq p1, v6, :cond_c

    .line 255
    .line 256
    const/4 v2, 0x4

    .line 257
    if-eq p1, v2, :cond_c

    .line 258
    .line 259
    const/16 v2, 0x20

    .line 260
    .line 261
    if-ne p1, v2, :cond_a

    .line 262
    .line 263
    goto :goto_2

    .line 264
    :cond_a
    const/16 p2, 0x10

    .line 265
    .line 266
    if-ne p1, p2, :cond_b

    .line 267
    .line 268
    const-string p0, "AudioRouteDeviceManager: Error: setAudioRoute to a2dp in communication mode"

    .line 269
    .line 270
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 271
    .line 272
    .line 273
    const/4 p0, -0x7

    .line 274
    return p0

    .line 275
    :cond_b
    new-instance p2, Ljava/lang/StringBuilder;

    .line 276
    .line 277
    const-string v0, "AudioRouteDeviceManager: setAudioRoute failed. deviceType("

    .line 278
    .line 279
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 280
    .line 281
    .line 282
    invoke-direct {p0, p1}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->routingDeviceType2Text(I)Ljava/lang/String;

    .line 283
    .line 284
    .line 285
    move-result-object p0

    .line 286
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 287
    .line 288
    .line 289
    const-string p0, ") invalid."

    .line 290
    .line 291
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 292
    .line 293
    .line 294
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 295
    .line 296
    .line 297
    move-result-object p0

    .line 298
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 299
    .line 300
    .line 301
    const/4 p0, -0x3

    .line 302
    return p0

    .line 303
    :cond_c
    :goto_2
    if-eqz p2, :cond_d

    .line 304
    .line 305
    invoke-virtual {v0, v4}, Landroid/media/AudioManager;->setSpeakerphoneOn(Z)V

    .line 306
    .line 307
    .line 308
    :cond_d
    :goto_3
    iput p1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->currentRouting:I

    .line 309
    .line 310
    return v4

    .line 311
    :cond_e
    if-nez v2, :cond_14

    .line 312
    .line 313
    if-nez v8, :cond_f

    .line 314
    .line 315
    iget-boolean v2, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mScoHasStarted:Z

    .line 316
    .line 317
    if-eqz v2, :cond_10

    .line 318
    .line 319
    :cond_f
    const-string v2, "AudioRouteDeviceManager: MODE_NORMAL,but BluetoothScoOn is true, force to close sco."

    .line 320
    .line 321
    invoke-static {v1, v2}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 322
    .line 323
    .line 324
    invoke-direct {p0, v0}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->stopSystemBluetoothSco(Landroid/media/AudioManager;)V

    .line 325
    .line 326
    .line 327
    :cond_10
    iget-object v1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mHandler:Landroid/os/Handler;

    .line 328
    .line 329
    if-eqz v1, :cond_11

    .line 330
    .line 331
    new-instance v2, Ll/cd1;

    .line 332
    .line 333
    invoke-direct {v2, p0}, Ll/cd1;-><init>(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;)V

    .line 334
    .line 335
    .line 336
    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 337
    .line 338
    .line 339
    iget-object v1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mHandler:Landroid/os/Handler;

    .line 340
    .line 341
    new-instance v2, Ll/dd1;

    .line 342
    .line 343
    invoke-direct {v2, p0}, Ll/dd1;-><init>(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;)V

    .line 344
    .line 345
    .line 346
    const-wide/16 v7, 0x1770

    .line 347
    .line 348
    invoke-virtual {v1, v2, v7, v8}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 349
    .line 350
    .line 351
    :cond_11
    if-ne p1, v5, :cond_12

    .line 352
    .line 353
    if-nez p2, :cond_13

    .line 354
    .line 355
    invoke-virtual {v0, v6}, Landroid/media/AudioManager;->setSpeakerphoneOn(Z)V

    .line 356
    .line 357
    .line 358
    goto :goto_4

    .line 359
    :cond_12
    if-ne p1, v6, :cond_13

    .line 360
    .line 361
    if-eqz p2, :cond_13

    .line 362
    .line 363
    invoke-virtual {v0, v4}, Landroid/media/AudioManager;->setSpeakerphoneOn(Z)V

    .line 364
    .line 365
    .line 366
    :cond_13
    :goto_4
    return v4

    .line 367
    :cond_14
    new-instance p0, Ljava/lang/StringBuilder;

    .line 368
    .line 369
    const-string p1, "AudioRouteDeviceManager: mode("

    .line 370
    .line 371
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 372
    .line 373
    .line 374
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 375
    .line 376
    .line 377
    const-string p1, ") is not support to setAudioRoute"

    .line 378
    .line 379
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 380
    .line 381
    .line 382
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 383
    .line 384
    .line 385
    move-result-object p0

    .line 386
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 387
    .line 388
    .line 389
    const/4 p0, -0x4

    .line 390
    return p0
.end method

.method public setUseAudioDeviceCallback(ZLcom/ss/bytertc/audio/device/router/IAudioRouteCallback;)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mEnableUseAudioDeviceCallback:Z

    .line 2
    .line 3
    iput-object p2, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->mCallback:Lcom/ss/bytertc/audio/device/router/IAudioRouteCallback;

    .line 4
    .line 5
    new-instance p0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string p2, "AudioRouteDeviceManager: setUseAudioDeviceCallback:"

    .line 8
    .line 9
    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-string p1, "AudioRouteDeviceManager"

    .line 20
    .line 21
    invoke-static {p1, p0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
