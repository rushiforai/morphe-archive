.class public Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;
.super Ljava/lang/Object;

# interfaces
.implements Lio/agora/rtc2/internal/AudioRoutingController$AudioDeviceInventory;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM$BTHeadsetBroadcastReceiver;,
        Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM$HeadsetBroadcastReceiver;
    }
.end annotation


# static fields
.field private static final ANDROID_SNOW_CONE:I = 0x1f

.field private static final PERMISSION_BLUETOOTH_CONNECT:Ljava/lang/String; = "android.permission.BLUETOOTH_CONNECT"

.field private static final TAG:Ljava/lang/String; = "AudioRoute"

.field private static mockedBroadcaster:Lio/agora/rtc2/internal/AudioRoutingController$MockedBroadcaseter;


# instance fields
.field private final HEADSET_EXTRA_STATE:Ljava/lang/String;

.field private final STATE_CONNECT:I

.field private final STATE_DISCONNECT:I

.field private mAudioDeviceChangedCb:Lio/agora/rtc2/internal/AudioRoutingController$AudioDeviceChangedCallback;

.field private mBTAdapter:Landroid/bluetooth/BluetoothAdapter;

.field private mBTHeadset:Landroid/bluetooth/BluetoothHeadset;

.field private mBTHeadsetListener:Landroid/bluetooth/BluetoothProfile$ServiceListener;

.field private mBTHeadsetReceiver:Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM$BTHeadsetBroadcastReceiver;

.field private final mContext:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field private mHeadsetReceiver:Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM$HeadsetBroadcastReceiver;

.field private mHeadsetType:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->STATE_DISCONNECT:I

    const/4 v1, 0x1

    iput v1, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->STATE_CONNECT:I

    const-string v1, "state"

    iput-object v1, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->HEADSET_EXTRA_STATE:Ljava/lang/String;

    const/4 v1, 0x0

    iput-object v1, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->mHeadsetReceiver:Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM$HeadsetBroadcastReceiver;

    iput-object v1, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->mBTHeadsetReceiver:Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM$BTHeadsetBroadcastReceiver;

    iput v0, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->mHeadsetType:I

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->mContext:Ljava/lang/ref/WeakReference;

    const-string p0, "AudioRoute"

    const-string p1, "AudioDeviceInventoryLowerThanM ctor!"

    invoke-static {p0, p1}, Lio/agora/utils2/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic access$202(Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;Landroid/bluetooth/BluetoothHeadset;)Landroid/bluetooth/BluetoothHeadset;
    .locals 0

    iput-object p1, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->mBTHeadset:Landroid/bluetooth/BluetoothHeadset;

    return-object p1
.end method

.method public static synthetic access$300(Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;I)V
    .locals 0

    invoke-direct {p0, p1}, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->onAudioDeviceEvent(I)V

    return-void
.end method

.method public static synthetic access$400(Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;Landroid/content/Intent;)Z
    .locals 0

    invoke-direct {p0, p1}, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->processHeadsetIntent(Landroid/content/Intent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic access$500(Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;)I
    .locals 0

    iget p0, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->mHeadsetType:I

    return p0
.end method

.method public static synthetic access$600(Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;IZ)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->onAudioDeviceChanged(IZ)V

    return-void
.end method

.method public static synthetic access$700(Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;Landroid/content/Intent;)V
    .locals 0

    invoke-direct {p0, p1}, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->processBluetoothIntent(Landroid/content/Intent;)V

    return-void
.end method

.method private clearBTResource()V
    .locals 4

    iget-object v0, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->mBTAdapter:Landroid/bluetooth/BluetoothAdapter;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const/4 v2, 0x1

    iget-object v3, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->mBTHeadset:Landroid/bluetooth/BluetoothHeadset;

    invoke-virtual {v0, v2, v3}, Landroid/bluetooth/BluetoothAdapter;->closeProfileProxy(ILandroid/bluetooth/BluetoothProfile;)V

    iput-object v1, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->mBTAdapter:Landroid/bluetooth/BluetoothAdapter;

    :cond_0
    iget-object v0, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->mBTHeadsetListener:Landroid/bluetooth/BluetoothProfile$ServiceListener;

    if-eqz v0, :cond_1

    iput-object v1, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->mBTHeadsetListener:Landroid/bluetooth/BluetoothProfile$ServiceListener;

    :cond_1
    return-void
.end method

.method private getBtConnectedDevicesSize()I
    .locals 6

    iget-object p0, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->mBTHeadset:Landroid/bluetooth/BluetoothHeadset;

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

    :cond_0
    :try_start_0
    invoke-virtual {p0}, Landroid/bluetooth/BluetoothHeadset;->getConnectedDevices()Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/bluetooth/BluetoothDevice;

    const-string v3, "AudioRoute"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "connected device name: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Lio/agora/utils2/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :catch_0
    move-exception p0

    goto :goto_1

    :cond_1
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :goto_1
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    return v0
.end method

.method private initBluetoothProfileListener()V
    .locals 2

    :try_start_0
    new-instance v0, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM$1;

    invoke-direct {v0, p0}, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM$1;-><init>(Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;)V

    iput-object v0, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->mBTHeadsetListener:Landroid/bluetooth/BluetoothProfile$ServiceListener;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "initialize failed: unable to create BluetoothProfile.ServiceListener, err="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "AudioRoute"

    invoke-static {v0, p0}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private initBtBroadcastReceiver(Landroid/content/Context;)V
    .locals 4

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const-string v1, "AudioRoute"

    const/16 v2, 0x1f

    if-lt v0, v2, :cond_0

    const-string v3, "android.permission.BLUETOOTH_CONNECT"

    invoke-virtual {p0, p1, v3}, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->hasPermission(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    :cond_0
    if-ge v0, v2, :cond_2

    const-string v0, "android.permission.BLUETOOTH"

    invoke-virtual {p0, p1, v0}, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->hasPermission(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    :cond_1
    const-string p0, "do not support BT monitoring on this device"

    invoke-static {v1, p0}, Lio/agora/utils2/internal/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_2
    invoke-direct {p0}, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->initBluetoothProfileListener()V

    :try_start_0
    iget-object v0, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->mBTHeadsetReceiver:Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM$BTHeadsetBroadcastReceiver;

    if-nez v0, :cond_3

    new-instance v0, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM$BTHeadsetBroadcastReceiver;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v2}, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM$BTHeadsetBroadcastReceiver;-><init>(Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM$1;)V

    iput-object v0, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->mBTHeadsetReceiver:Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM$BTHeadsetBroadcastReceiver;

    goto :goto_0

    :catch_0
    move-exception p0

    goto :goto_1

    :cond_3
    :goto_0
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    iput-object v0, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->mBTAdapter:Landroid/bluetooth/BluetoothAdapter;

    if-eqz v0, :cond_6

    iget-object v2, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->mBTHeadsetListener:Landroid/bluetooth/BluetoothProfile$ServiceListener;

    const/4 v3, 0x1

    invoke-virtual {v0, p1, v2, v3}, Landroid/bluetooth/BluetoothAdapter;->getProfileProxy(Landroid/content/Context;Landroid/bluetooth/BluetoothProfile$ServiceListener;I)Z

    new-instance v0, Landroid/content/IntentFilter;

    const-string v2, "android.bluetooth.headset.profile.action.CONNECTION_STATE_CHANGED"

    invoke-direct {v0, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const-string v2, "android.bluetooth.adapter.action.STATE_CHANGED"

    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v2, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->mBTHeadsetReceiver:Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM$BTHeadsetBroadcastReceiver;

    invoke-virtual {v2}, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM$BTHeadsetBroadcastReceiver;->getRegistered()Z

    move-result v2

    if-nez v2, :cond_5

    iget-object v2, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->mBTHeadsetReceiver:Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM$BTHeadsetBroadcastReceiver;

    invoke-static {p1, v2, v0}, Ll/jj5;->l(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    sget-object p1, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->mockedBroadcaster:Lio/agora/rtc2/internal/AudioRoutingController$MockedBroadcaseter;

    if-eqz p1, :cond_4

    iget-object v2, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->mBTHeadsetReceiver:Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM$BTHeadsetBroadcastReceiver;

    invoke-interface {p1, v2, v0}, Lio/agora/rtc2/internal/AudioRoutingController$MockedBroadcaseter;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    :cond_4
    iget-object p0, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->mBTHeadsetReceiver:Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM$BTHeadsetBroadcastReceiver;

    invoke-virtual {p0, v3}, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM$BTHeadsetBroadcastReceiver;->setRegistered(Z)V

    :cond_5
    return-void

    :cond_6
    const-string p0, "initialize: failed to get bluetooth adapter!!"

    invoke-static {v1, p0}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :goto_1
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "unable to create BluetoothHeadsetBroadcastReceiver, err:"

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private initHeadsetBroadcastReceiver(Landroid/content/Context;)V
    .locals 3

    iget-object v0, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->mHeadsetReceiver:Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM$HeadsetBroadcastReceiver;

    if-nez v0, :cond_0

    new-instance v0, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM$HeadsetBroadcastReceiver;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM$HeadsetBroadcastReceiver;-><init>(Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM$1;)V

    iput-object v0, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->mHeadsetReceiver:Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM$HeadsetBroadcastReceiver;

    :cond_0
    iget-object v0, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->mHeadsetReceiver:Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM$HeadsetBroadcastReceiver;

    invoke-virtual {v0}, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM$HeadsetBroadcastReceiver;->getRegistered()Z

    move-result v0

    if-nez v0, :cond_3

    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.HEADSET_PLUG"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->mHeadsetReceiver:Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM$HeadsetBroadcastReceiver;

    invoke-static {p1, v2, v0}, Ll/jj5;->l(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    move-result-object p1

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-direct {p0, p1}, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->processHeadsetIntent(Landroid/content/Intent;)Z

    :cond_1
    sget-object p1, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->mockedBroadcaster:Lio/agora/rtc2/internal/AudioRoutingController$MockedBroadcaseter;

    if-eqz p1, :cond_2

    iget-object v1, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->mHeadsetReceiver:Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM$HeadsetBroadcastReceiver;

    invoke-interface {p1, v1, v0}, Lio/agora/rtc2/internal/AudioRoutingController$MockedBroadcaseter;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    :cond_2
    iget-object p0, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->mHeadsetReceiver:Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM$HeadsetBroadcastReceiver;

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM$HeadsetBroadcastReceiver;->setRegistered(Z)V

    :cond_3
    return-void
.end method

.method private onAudioDeviceChanged(IZ)V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "onAudioDeviceChanged route :"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " status: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p2, :cond_0

    const-string v1, "connect"

    goto :goto_0

    :cond_0
    const-string v1, "disconnect"

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "AudioRoute"

    invoke-static {v1, v0}, Lio/agora/utils2/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->mAudioDeviceChangedCb:Lio/agora/rtc2/internal/AudioRoutingController$AudioDeviceChangedCallback;

    if-eqz p0, :cond_1

    invoke-interface {p0, p2, p1}, Lio/agora/rtc2/internal/AudioRoutingController$AudioDeviceChangedCallback;->onAudioDeviceChanged(ZI)V

    :cond_1
    return-void
.end method

.method private onAudioDeviceEvent(I)V
    .locals 0

    iget-object p0, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->mAudioDeviceChangedCb:Lio/agora/rtc2/internal/AudioRoutingController$AudioDeviceChangedCallback;

    if-eqz p0, :cond_0

    invoke-interface {p0, p1}, Lio/agora/rtc2/internal/AudioRoutingController$AudioDeviceChangedCallback;->onAudioDeviceEvent(I)V

    :cond_0
    return-void
.end method

.method private processBluetoothIntent(Landroid/content/Intent;)V
    .locals 9

    const-string v0, "AudioRoute"

    const-string v1, "BluetoothAdapter.ACTION_STATE_CHANGED prev "

    const-string v2, "BT "

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    :try_start_0
    const-string v4, "android.bluetooth.headset.profile.action.CONNECTION_STATE_CHANGED"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v5, 0x0

    const-string v6, ", "

    const/4 v7, 0x5

    const/16 v8, -0x63

    if-eqz v4, :cond_5

    :try_start_1
    const-string v1, "android.bluetooth.profile.extra.STATE"

    invoke-virtual {p1, v1, v8}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    const-string v3, "android.bluetooth.profile.extra.PREVIOUS_STATE"

    invoke-virtual {p1, v3, v8}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    const-string v4, "android.bluetooth.device.extra.DEVICE"

    invoke-virtual {p1, v4}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/bluetooth/BluetoothDevice;

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v4

    goto :goto_0

    :catch_0
    move-exception p0

    goto/16 :goto_1

    :cond_0
    const-string v4, "null name"

    :goto_0
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " hfp connect state : "

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lio/agora/utils2/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    const/4 v2, 0x1

    const-string v3, "Bluetooth device "

    if-eqz v1, :cond_2

    const/4 v4, 0x2

    if-eq v1, v4, :cond_1

    :try_start_2
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, " unknown event, state="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lio/agora/utils2/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, " connected"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lio/agora/utils2/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0, v7, v2}, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->onAudioDeviceChanged(IZ)V

    return-void

    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, " disconnected"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lio/agora/utils2/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->getBtConnectedDevicesSize()I

    move-result p1

    if-nez p1, :cond_4

    :cond_3
    invoke-direct {p0, v7, v5}, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->onAudioDeviceChanged(IZ)V

    return-void

    :cond_4
    invoke-direct {p0, v2}, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->onAudioDeviceEvent(I)V

    return-void

    :cond_5
    const-string v2, "android.bluetooth.adapter.action.STATE_CHANGED"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    const-string v2, "android.bluetooth.adapter.extra.STATE"

    invoke-virtual {p1, v2, v8}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    const-string v3, "android.bluetooth.adapter.extra.PREVIOUS_STATE"

    invoke-virtual {p1, v3, v8}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lio/agora/utils2/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    const/16 p1, 0xa

    if-eq v2, p1, :cond_3

    :cond_6
    return-void

    :goto_1
    const-string p1, "BT broadcast receiver onReceive fail "

    invoke-static {v0, p1, p0}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method private processHeadsetIntent(Landroid/content/Intent;)Z
    .locals 3

    const-string v0, "state"

    const/4 v1, -0x1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    const-string v2, "microphone"

    invoke-virtual {p1, v2, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_1

    if-ne p1, v2, :cond_0

    move p1, v1

    goto :goto_0

    :cond_0
    const/4 p1, 0x2

    :goto_0
    iput p1, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->mHeadsetType:I

    :cond_1
    if-ne v0, v2, :cond_2

    return v2

    :cond_2
    return v1
.end method

.method public static setMockedBroadcaster(Lio/agora/rtc2/internal/AudioRoutingController$MockedBroadcaseter;)V
    .locals 0
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    sput-object p0, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->mockedBroadcaster:Lio/agora/rtc2/internal/AudioRoutingController$MockedBroadcaseter;

    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 4

    :try_start_0
    invoke-direct {p0}, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->clearBTResource()V

    iget-object v0, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->mContext:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    if-eqz v0, :cond_3

    iget-object v1, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->mHeadsetReceiver:Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM$HeadsetBroadcastReceiver;

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM$HeadsetBroadcastReceiver;->getRegistered()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->mHeadsetReceiver:Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM$HeadsetBroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    sget-object v1, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->mockedBroadcaster:Lio/agora/rtc2/internal/AudioRoutingController$MockedBroadcaseter;

    if-eqz v1, :cond_0

    iget-object v3, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->mHeadsetReceiver:Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM$HeadsetBroadcastReceiver;

    invoke-interface {v1, v3}, Lio/agora/rtc2/internal/AudioRoutingController$MockedBroadcaseter;->unRegisterReceiver(Landroid/content/BroadcastReceiver;)V

    :cond_0
    iget-object v1, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->mHeadsetReceiver:Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM$HeadsetBroadcastReceiver;

    invoke-virtual {v1, v2}, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM$HeadsetBroadcastReceiver;->setRegistered(Z)V

    :cond_1
    iget-object v1, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->mBTHeadsetReceiver:Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM$BTHeadsetBroadcastReceiver;

    if-eqz v1, :cond_3

    invoke-virtual {v1}, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM$BTHeadsetBroadcastReceiver;->getRegistered()Z

    move-result v1

    if-eqz v1, :cond_3

    iget-object v1, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->mBTHeadsetReceiver:Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM$BTHeadsetBroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    sget-object v0, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->mockedBroadcaster:Lio/agora/rtc2/internal/AudioRoutingController$MockedBroadcaseter;

    if-eqz v0, :cond_2

    iget-object v1, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->mBTHeadsetReceiver:Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM$BTHeadsetBroadcastReceiver;

    invoke-interface {v0, v1}, Lio/agora/rtc2/internal/AudioRoutingController$MockedBroadcaseter;->unRegisterReceiver(Landroid/content/BroadcastReceiver;)V

    :cond_2
    iget-object v0, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->mBTHeadsetReceiver:Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM$BTHeadsetBroadcastReceiver;

    invoke-virtual {v0, v2}, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM$BTHeadsetBroadcastReceiver;->setRegistered(Z)V

    :cond_3
    const/4 v0, 0x0

    iput-object v0, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->mHeadsetReceiver:Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM$HeadsetBroadcastReceiver;

    iput-object v0, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->mBTHeadsetReceiver:Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM$BTHeadsetBroadcastReceiver;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    const-string v0, "AudioRoute"

    const-string v1, "AudioDeviceInventoryLowerThanM dispose fail: "

    invoke-static {v0, v1, p0}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public hasPermission(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 1

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result p0

    invoke-static {}, Landroid/os/Process;->myUid()I

    move-result v0

    invoke-virtual {p1, p2, p0, v0}, Landroid/content/Context;->checkPermission(Ljava/lang/String;II)I

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public initialize()V
    .locals 3

    iget-object v0, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->mContext:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    const-string v1, "AudioRoute"

    const-string v2, "AudioDeviceInventoryLowerThanM initialize +"

    invoke-static {v1, v2}, Lio/agora/utils2/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->initHeadsetBroadcastReceiver(Landroid/content/Context;)V

    invoke-direct {p0, v0}, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->initBtBroadcastReceiver(Landroid/content/Context;)V

    return-void
.end method

.method public isDeviceAvaliable(I)Z
    .locals 4

    const/4 v0, 0x5

    const/4 v1, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ne p1, v0, :cond_0

    iget-object p0, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->mBTAdapter:Landroid/bluetooth/BluetoothAdapter;

    if-eqz p0, :cond_1

    invoke-static {p0, v2}, Ll/jj5;->d(Landroid/bluetooth/BluetoothAdapter;I)I

    move-result p0

    if-ne v1, p0, :cond_1

    return v2

    :cond_0
    if-eqz p1, :cond_2

    if-ne p1, v1, :cond_1

    goto :goto_0

    :cond_1
    return v3

    :cond_2
    :goto_0
    iget p0, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->mHeadsetType:I

    if-ne p0, p1, :cond_3

    return v2

    :cond_3
    return v3
.end method

.method public setAudioDeviceChangeCallback(Lio/agora/rtc2/internal/AudioRoutingController$AudioDeviceChangedCallback;)V
    .locals 0

    iput-object p1, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryLowerThanM;->mAudioDeviceChangedCb:Lio/agora/rtc2/internal/AudioRoutingController$AudioDeviceChangedCallback;

    return-void
.end method
