.class public Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;
.super Ljava/lang/Object;

# interfaces
.implements Lio/agora/rtc2/internal/AudioRoutingController$AudioDeviceInventory;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/agora/rtc2/internal/AudioDeviceInventoryMocker$HeadsetBroadcastReceiver;,
        Lio/agora/rtc2/internal/AudioDeviceInventoryMocker$BTHeadsetBroadcastReceiver;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "AudioRoute"

.field private static mockedBroadcaster:Lio/agora/rtc2/internal/AudioRoutingController$MockedBroadcaseter;


# instance fields
.field private final HEADSET_EXTRA_STATE:Ljava/lang/String;

.field private final STATE_CONNECT:I

.field private final STATE_DISCONNECT:I

.field private mAudioDeviceChangedCb:Lio/agora/rtc2/internal/AudioRoutingController$AudioDeviceChangedCallback;

.field private mBTHeadsetReceiver:Lio/agora/rtc2/internal/AudioDeviceInventoryMocker$BTHeadsetBroadcastReceiver;

.field private mHeadsetReceiver:Lio/agora/rtc2/internal/AudioDeviceInventoryMocker$HeadsetBroadcastReceiver;

.field private mHeadsetType:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;->STATE_DISCONNECT:I

    const/4 v1, 0x1

    iput v1, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;->STATE_CONNECT:I

    const-string v1, "state"

    iput-object v1, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;->HEADSET_EXTRA_STATE:Ljava/lang/String;

    const/4 v1, 0x0

    iput-object v1, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;->mHeadsetReceiver:Lio/agora/rtc2/internal/AudioDeviceInventoryMocker$HeadsetBroadcastReceiver;

    iput-object v1, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;->mBTHeadsetReceiver:Lio/agora/rtc2/internal/AudioDeviceInventoryMocker$BTHeadsetBroadcastReceiver;

    iput v0, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;->mHeadsetType:I

    const-string p0, "AudioRoute"

    const-string v0, "AudioDeviceInventoryMocker ctor!"

    invoke-static {p0, v0}, Lio/agora/utils2/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic access$200(Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;Landroid/content/Intent;)V
    .locals 0

    invoke-direct {p0, p1}, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;->processBluetoothIntent(Landroid/content/Intent;)V

    return-void
.end method

.method public static synthetic access$300(Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;)I
    .locals 0

    iget p0, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;->mHeadsetType:I

    return p0
.end method

.method public static synthetic access$302(Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;I)I
    .locals 0

    iput p1, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;->mHeadsetType:I

    return p1
.end method

.method public static synthetic access$400(Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;IZ)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;->onAudioDeviceChanged(IZ)V

    return-void
.end method

.method private initBtBroadcastReceiver()V
    .locals 3

    iget-object v0, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;->mBTHeadsetReceiver:Lio/agora/rtc2/internal/AudioDeviceInventoryMocker$BTHeadsetBroadcastReceiver;

    if-nez v0, :cond_0

    new-instance v0, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker$BTHeadsetBroadcastReceiver;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker$BTHeadsetBroadcastReceiver;-><init>(Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;Lio/agora/rtc2/internal/AudioDeviceInventoryMocker$1;)V

    iput-object v0, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;->mBTHeadsetReceiver:Lio/agora/rtc2/internal/AudioDeviceInventoryMocker$BTHeadsetBroadcastReceiver;

    :cond_0
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.bluetooth.headset.profile.action.CONNECTION_STATE_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const-string v1, "android.bluetooth.adapter.action.STATE_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v1, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;->mBTHeadsetReceiver:Lio/agora/rtc2/internal/AudioDeviceInventoryMocker$BTHeadsetBroadcastReceiver;

    invoke-virtual {v1}, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker$BTHeadsetBroadcastReceiver;->getRegistered()Z

    move-result v1

    if-nez v1, :cond_2

    sget-object v1, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;->mockedBroadcaster:Lio/agora/rtc2/internal/AudioRoutingController$MockedBroadcaseter;

    if-eqz v1, :cond_1

    iget-object v2, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;->mBTHeadsetReceiver:Lio/agora/rtc2/internal/AudioDeviceInventoryMocker$BTHeadsetBroadcastReceiver;

    invoke-interface {v1, v2, v0}, Lio/agora/rtc2/internal/AudioRoutingController$MockedBroadcaseter;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    :cond_1
    iget-object p0, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;->mBTHeadsetReceiver:Lio/agora/rtc2/internal/AudioDeviceInventoryMocker$BTHeadsetBroadcastReceiver;

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker$BTHeadsetBroadcastReceiver;->setRegistered(Z)V

    :cond_2
    return-void
.end method

.method private initHeadsetBroadcastReceiver()V
    .locals 3

    iget-object v0, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;->mHeadsetReceiver:Lio/agora/rtc2/internal/AudioDeviceInventoryMocker$HeadsetBroadcastReceiver;

    if-nez v0, :cond_0

    new-instance v0, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker$HeadsetBroadcastReceiver;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker$HeadsetBroadcastReceiver;-><init>(Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;Lio/agora/rtc2/internal/AudioDeviceInventoryMocker$1;)V

    iput-object v0, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;->mHeadsetReceiver:Lio/agora/rtc2/internal/AudioDeviceInventoryMocker$HeadsetBroadcastReceiver;

    :cond_0
    iget-object v0, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;->mHeadsetReceiver:Lio/agora/rtc2/internal/AudioDeviceInventoryMocker$HeadsetBroadcastReceiver;

    invoke-virtual {v0}, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker$HeadsetBroadcastReceiver;->getRegistered()Z

    move-result v0

    if-nez v0, :cond_2

    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.HEADSET_PLUG"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    sget-object v1, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;->mockedBroadcaster:Lio/agora/rtc2/internal/AudioRoutingController$MockedBroadcaseter;

    if-eqz v1, :cond_1

    iget-object v2, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;->mHeadsetReceiver:Lio/agora/rtc2/internal/AudioDeviceInventoryMocker$HeadsetBroadcastReceiver;

    invoke-interface {v1, v2, v0}, Lio/agora/rtc2/internal/AudioRoutingController$MockedBroadcaseter;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    :cond_1
    iget-object p0, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;->mHeadsetReceiver:Lio/agora/rtc2/internal/AudioDeviceInventoryMocker$HeadsetBroadcastReceiver;

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker$HeadsetBroadcastReceiver;->setRegistered(Z)V

    :cond_2
    return-void
.end method

.method private onAudioDeviceChanged(IZ)V
    .locals 0

    iget-object p0, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;->mAudioDeviceChangedCb:Lio/agora/rtc2/internal/AudioRoutingController$AudioDeviceChangedCallback;

    if-eqz p0, :cond_0

    invoke-interface {p0, p2, p1}, Lio/agora/rtc2/internal/AudioRoutingController$AudioDeviceChangedCallback;->onAudioDeviceChanged(ZI)V

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

    const-string v5, ", "

    const/4 v6, 0x0

    const/4 v7, 0x5

    const/16 v8, -0x63

    if-eqz v4, :cond_3

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

    move-result-object p1

    goto :goto_0

    :catch_0
    move-exception p0

    goto :goto_5

    :cond_0
    const-string p1, "null name"

    :goto_0
    if-eqz v1, :cond_2

    const/4 v4, 0x2

    if-eq v1, v4, :cond_1

    goto :goto_1

    :cond_1
    const/4 v4, 0x1

    invoke-direct {p0, v7, v4}, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;->onAudioDeviceChanged(IZ)V

    goto :goto_1

    :cond_2
    invoke-direct {p0, v7, v6}, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;->onAudioDeviceChanged(IZ)V

    :goto_1
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " hfp connect state : "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    :goto_2
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_4

    :cond_3
    const-string v2, "android.bluetooth.adapter.action.STATE_CHANGED"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    const-string v2, "android.bluetooth.adapter.extra.STATE"

    invoke-virtual {p1, v2, v8}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    const-string v3, "android.bluetooth.adapter.extra.PREVIOUS_STATE"

    invoke-virtual {p1, v3, v8}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    const/16 v3, 0xa

    if-eq v2, v3, :cond_4

    goto :goto_3

    :cond_4
    invoke-direct {p0, v7, v6}, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;->onAudioDeviceChanged(IZ)V

    :goto_3
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    goto :goto_2

    :goto_4
    invoke-static {v0, p0}, Lio/agora/utils2/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    :cond_5
    return-void

    :goto_5
    const-string p1, "BT broadcast receiver onReceive fail "

    invoke-static {v0, p1, p0}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static setMockedBroadcaster(Lio/agora/rtc2/internal/AudioRoutingController$MockedBroadcaseter;)V
    .locals 0
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    sput-object p0, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;->mockedBroadcaster:Lio/agora/rtc2/internal/AudioRoutingController$MockedBroadcaseter;

    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 3

    iget-object v0, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;->mHeadsetReceiver:Lio/agora/rtc2/internal/AudioDeviceInventoryMocker$HeadsetBroadcastReceiver;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker$HeadsetBroadcastReceiver;->getRegistered()Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;->mockedBroadcaster:Lio/agora/rtc2/internal/AudioRoutingController$MockedBroadcaseter;

    if-eqz v0, :cond_0

    iget-object v2, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;->mHeadsetReceiver:Lio/agora/rtc2/internal/AudioDeviceInventoryMocker$HeadsetBroadcastReceiver;

    invoke-interface {v0, v2}, Lio/agora/rtc2/internal/AudioRoutingController$MockedBroadcaseter;->unRegisterReceiver(Landroid/content/BroadcastReceiver;)V

    :cond_0
    iget-object v0, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;->mHeadsetReceiver:Lio/agora/rtc2/internal/AudioDeviceInventoryMocker$HeadsetBroadcastReceiver;

    invoke-virtual {v0, v1}, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker$HeadsetBroadcastReceiver;->setRegistered(Z)V

    :cond_1
    iget-object v0, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;->mBTHeadsetReceiver:Lio/agora/rtc2/internal/AudioDeviceInventoryMocker$BTHeadsetBroadcastReceiver;

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker$BTHeadsetBroadcastReceiver;->getRegistered()Z

    move-result v0

    if-eqz v0, :cond_3

    sget-object v0, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;->mockedBroadcaster:Lio/agora/rtc2/internal/AudioRoutingController$MockedBroadcaseter;

    if-eqz v0, :cond_2

    iget-object v2, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;->mBTHeadsetReceiver:Lio/agora/rtc2/internal/AudioDeviceInventoryMocker$BTHeadsetBroadcastReceiver;

    invoke-interface {v0, v2}, Lio/agora/rtc2/internal/AudioRoutingController$MockedBroadcaseter;->unRegisterReceiver(Landroid/content/BroadcastReceiver;)V

    :cond_2
    iget-object v0, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;->mBTHeadsetReceiver:Lio/agora/rtc2/internal/AudioDeviceInventoryMocker$BTHeadsetBroadcastReceiver;

    invoke-virtual {v0, v1}, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker$BTHeadsetBroadcastReceiver;->setRegistered(Z)V

    :cond_3
    const/4 v0, 0x0

    iput-object v0, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;->mHeadsetReceiver:Lio/agora/rtc2/internal/AudioDeviceInventoryMocker$HeadsetBroadcastReceiver;

    iput-object v0, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;->mBTHeadsetReceiver:Lio/agora/rtc2/internal/AudioDeviceInventoryMocker$BTHeadsetBroadcastReceiver;

    return-void
.end method

.method public initialize()V
    .locals 2

    const-string v0, "AudioRoute"

    const-string v1, "AudioDeviceInventoryMocker initialize +"

    invoke-static {v0, v1}, Lio/agora/utils2/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;->initHeadsetBroadcastReceiver()V

    invoke-direct {p0}, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;->initBtBroadcastReceiver()V

    return-void
.end method

.method public isDeviceAvaliable(I)Z
    .locals 2

    const/4 v0, 0x5

    const/4 v1, 0x0

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    if-eqz p1, :cond_2

    const/4 v0, 0x2

    if-ne p1, v0, :cond_1

    goto :goto_1

    :cond_1
    :goto_0
    return v1

    :cond_2
    :goto_1
    iget p0, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;->mHeadsetType:I

    if-ne p0, p1, :cond_3

    const/4 p0, 0x1

    return p0

    :cond_3
    return v1
.end method

.method public setAudioDeviceChangeCallback(Lio/agora/rtc2/internal/AudioRoutingController$AudioDeviceChangedCallback;)V
    .locals 0

    iput-object p1, p0, Lio/agora/rtc2/internal/AudioDeviceInventoryMocker;->mAudioDeviceChangedCb:Lio/agora/rtc2/internal/AudioRoutingController$AudioDeviceChangedCallback;

    return-void
.end method
