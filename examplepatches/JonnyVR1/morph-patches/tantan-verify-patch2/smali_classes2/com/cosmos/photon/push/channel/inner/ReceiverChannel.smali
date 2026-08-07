.class public Lcom/cosmos/photon/push/channel/inner/ReceiverChannel;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# static fields
.field private static sChannelReceiver:Lcom/cosmos/photon/push/channel/inner/ReceiverChannel;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static registerChannelReceiver(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/cosmos/photon/push/channel/inner/ReceiverChannel;->unRegisterChannelReceiver()V

    .line 2
    .line 3
    .line 4
    const-string v0, "MoPush-Channel"

    .line 5
    .line 6
    const-string v1, "registerChannelReceiver"

    .line 7
    .line 8
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Landroid/content/IntentFilter;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const/16 p0, 0x3e8

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Landroid/content/IntentFilter;->setPriority(I)V

    .line 19
    .line 20
    .line 21
    new-instance p0, Lcom/cosmos/photon/push/channel/inner/ReceiverChannel;

    .line 22
    .line 23
    invoke-direct {p0}, Lcom/cosmos/photon/push/channel/inner/ReceiverChannel;-><init>()V

    .line 24
    .line 25
    .line 26
    sput-object p0, Lcom/cosmos/photon/push/channel/inner/ReceiverChannel;->sChannelReceiver:Lcom/cosmos/photon/push/channel/inner/ReceiverChannel;

    .line 27
    .line 28
    sget p0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 29
    .line 30
    const/16 v1, 0x1a

    .line 31
    .line 32
    if-lt p0, v1, :cond_0

    .line 33
    .line 34
    invoke-static {}, Lcom/cosmos/photon/push/util/AppContext;->getContext()Landroid/content/Context;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    sget-object v1, Lcom/cosmos/photon/push/channel/inner/ReceiverChannel;->sChannelReceiver:Lcom/cosmos/photon/push/channel/inner/ReceiverChannel;

    .line 39
    .line 40
    const/4 v2, 0x2

    .line 41
    invoke-static {p0, v1, v0, v2}, Ll/jdy0;->a(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_0
    invoke-static {}, Lcom/cosmos/photon/push/util/AppContext;->getContext()Landroid/content/Context;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    sget-object v1, Lcom/cosmos/photon/push/channel/inner/ReceiverChannel;->sChannelReceiver:Lcom/cosmos/photon/push/channel/inner/ReceiverChannel;

    .line 50
    .line 51
    invoke-static {p0, v1, v0}, Ll/jj5;->l(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public static sendChannelRequest(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/cosmos/photon/push/util/AppContext;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Landroid/content/Intent;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const-string p0, "key_pkg"

    .line 15
    .line 16
    invoke-virtual {v1, p0, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    const-string p0, "sendBRChannelRequest %s"

    .line 20
    .line 21
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v2, "MoPush-Channel"

    .line 26
    .line 27
    invoke-static {v2, p0, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    invoke-static {}, Lcom/cosmos/photon/push/util/AppContext;->getContext()Landroid/content/Context;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public static unRegisterChannelReceiver()V
    .locals 2

    .line 1
    const-string v0, "MoPush-Channel"

    .line 2
    .line 3
    const-string v1, "unRegisterChannelReceiver"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/cosmos/photon/push/channel/inner/ReceiverChannel;->sChannelReceiver:Lcom/cosmos/photon/push/channel/inner/ReceiverChannel;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-static {}, Lcom/cosmos/photon/push/util/AppContext;->getContext()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget-object v1, Lcom/cosmos/photon/push/channel/inner/ReceiverChannel;->sChannelReceiver:Lcom/cosmos/photon/push/channel/inner/ReceiverChannel;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    const/4 v0, 0x0

    .line 22
    sput-object v0, Lcom/cosmos/photon/push/channel/inner/ReceiverChannel;->sChannelReceiver:Lcom/cosmos/photon/push/channel/inner/ReceiverChannel;

    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3

    .line 1
    const-string p0, "key_pkg"

    .line 2
    .line 3
    :try_start_0
    invoke-virtual {p2, p0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    goto :goto_0

    .line 8
    :catch_0
    const-string p2, ""

    .line 9
    .line 10
    :goto_0
    const-string v0, "BR onReceive packageName:%s"

    .line 11
    .line 12
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const-string v2, "MoPush-Channel"

    .line 17
    .line 18
    invoke-static {v2, v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    new-instance v0, Landroid/os/Bundle;

    .line 22
    .line 23
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {v0, p0, p1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    const-string p0, "channel_receive"

    .line 34
    .line 35
    invoke-static {p2, p0, v0}, Lcom/cosmos/photon/push/channel/PushContentHelper;->executeAction(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;

    .line 36
    .line 37
    .line 38
    return-void
.end method
