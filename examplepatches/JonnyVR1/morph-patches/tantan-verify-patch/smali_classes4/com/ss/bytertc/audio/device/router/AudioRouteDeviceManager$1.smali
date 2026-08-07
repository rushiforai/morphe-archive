.class Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/bluetooth/BluetoothProfile$ServiceListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->hasValidBtDeviceMajor(I[Ljava/lang/String;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$hasValidDevice:[Z

.field final synthetic val$headset_extra_infos:[Ljava/lang/String;

.field final synthetic val$validLock:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;Landroid/content/Context;[Ljava/lang/String;[ZLjava/lang/Object;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$1;->this$0:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$1;->val$context:Landroid/content/Context;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$1;->val$headset_extra_infos:[Ljava/lang/String;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$1;->val$hasValidDevice:[Z

    .line 8
    .line 9
    iput-object p5, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$1;->val$validLock:Ljava/lang/Object;

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public onServiceConnected(ILandroid/bluetooth/BluetoothProfile;)V
    .locals 6

    .line 1
    :try_start_0
    invoke-interface {p2}, Landroid/bluetooth/BluetoothProfile;->getConnectedDevices()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p2, :cond_1

    .line 7
    .line 8
    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-nez v1, :cond_1

    .line 13
    .line 14
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    move v1, v0

    .line 19
    :cond_0
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-eqz v2, :cond_2

    .line 24
    .line 25
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Landroid/bluetooth/BluetoothDevice;

    .line 30
    .line 31
    iget-object v3, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$1;->this$0:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

    .line 32
    .line 33
    iget-object v4, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$1;->val$context:Landroid/content/Context;

    .line 34
    .line 35
    iget-object v5, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$1;->val$headset_extra_infos:[Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {v3, v4, p1, v2, v5}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->access$000(Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;Landroid/content/Context;ILandroid/bluetooth/BluetoothDevice;[Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-eqz v2, :cond_0

    .line 42
    .line 43
    const/4 v1, 0x1

    .line 44
    goto :goto_0

    .line 45
    :catchall_0
    move-exception p1

    .line 46
    goto :goto_1

    .line 47
    :cond_1
    move v1, v0

    .line 48
    :cond_2
    if-nez v1, :cond_3

    .line 49
    .line 50
    iget-object p1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$1;->val$hasValidDevice:[Z

    .line 51
    .line 52
    aput-boolean v0, p1, v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 53
    .line 54
    goto :goto_2

    .line 55
    :goto_1
    const-string p2, "AudioRouteDeviceManager"

    .line 56
    .line 57
    const-string v0, "AudioRouteDeviceManager: BluetoothProfile getConnectedDevices failed."

    .line 58
    .line 59
    invoke-static {p2, v0, p1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 60
    .line 61
    .line 62
    :cond_3
    :goto_2
    iget-object p1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$1;->val$validLock:Ljava/lang/Object;

    .line 63
    .line 64
    monitor-enter p1

    .line 65
    :try_start_1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$1;->val$validLock:Ljava/lang/Object;

    .line 66
    .line 67
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 68
    .line 69
    .line 70
    monitor-exit p1

    .line 71
    return-void

    .line 72
    :catchall_1
    move-exception p0

    .line 73
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 74
    throw p0
.end method

.method public onServiceDisconnected(I)V
    .locals 0

    return-void
.end method
