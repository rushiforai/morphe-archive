.class public Lcom/cosmos/photon/push/util/NetUtil;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cosmos/photon/push/util/NetUtil$NetChangeReceiver;
    }
.end annotation


# static fields
.field public static final NETWORK_CLASS_2G:Ljava/lang/String; = "2g"

.field public static final NETWORK_CLASS_3G:Ljava/lang/String; = "3g"

.field public static final NETWORK_CLASS_4G:Ljava/lang/String; = "4g"

.field public static final NETWORK_CLASS_5G:Ljava/lang/String; = "5G"

.field public static final NETWORK_CLASS_UNKNOWN:Ljava/lang/String; = "unknown"

.field public static final NETWORK_TYPE_WIFI:Ljava/lang/String; = "wifi"

.field private static final TAG:Ljava/lang/String; = "NetUtil"

.field public static context:Landroid/content/Context; = null

.field public static lastActiveNetworkInfo:Landroid/net/NetworkInfo; = null

.field public static lastConnected:Z = true

.field public static lastWifiInfo:Landroid/net/wifi/WifiInfo;

.field private static netChangeBroadcastReceiver:Landroid/content/BroadcastReceiver;

.field private static receiverList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/cosmos/photon/push/util/NetUtil$NetChangeReceiver;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sput-object v0, Lcom/cosmos/photon/push/util/NetUtil;->receiverList:Ljava/util/List;

    .line 11
    .line 12
    new-instance v0, Lcom/cosmos/photon/push/util/NetUtil$1;

    .line 13
    .line 14
    invoke-direct {v0}, Lcom/cosmos/photon/push/util/NetUtil$1;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v0, Lcom/cosmos/photon/push/util/NetUtil;->netChangeBroadcastReceiver:Landroid/content/BroadcastReceiver;

    .line 18
    .line 19
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

.method public static synthetic access$000()Ljava/util/List;
    .locals 1

    .line 1
    sget-object v0, Lcom/cosmos/photon/push/util/NetUtil;->receiverList:Ljava/util/List;

    .line 2
    .line 3
    return-object v0
.end method

.method public static clearAllReceivers()V
    .locals 1

    .line 1
    sget-object v0, Lcom/cosmos/photon/push/util/NetUtil;->receiverList:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static getNetType()I
    .locals 4

    .line 1
    sget-object v0, Lcom/cosmos/photon/push/util/NetUtil;->context:Landroid/content/Context;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    :try_start_0
    const-string v2, "connectivity"

    .line 7
    .line 8
    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Landroid/net/ConnectivityManager;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getType()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    const/4 v3, 0x1

    .line 25
    if-ne v2, v3, :cond_0

    .line 26
    .line 27
    const/4 v0, 0x4

    .line 28
    return v0

    .line 29
    :cond_0
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getSubtype()I

    .line 30
    .line 31
    .line 32
    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 33
    packed-switch v0, :pswitch_data_0

    .line 34
    .line 35
    .line 36
    return v1

    .line 37
    :pswitch_0
    const/4 v0, 0x3

    .line 38
    return v0

    .line 39
    :pswitch_1
    const/4 v0, 0x2

    .line 40
    return v0

    .line 41
    :pswitch_2
    return v3

    .line 42
    :catch_0
    move-exception v0

    .line 43
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 44
    .line 45
    .line 46
    :cond_1
    return v1

    .line 47
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method public static getNetTypeContent()Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {}, Lcom/cosmos/photon/push/util/NetUtil;->getNetType()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eq v0, v1, :cond_3

    .line 7
    .line 8
    const/4 v1, 0x2

    .line 9
    if-eq v0, v1, :cond_2

    .line 10
    .line 11
    const/4 v1, 0x3

    .line 12
    if-eq v0, v1, :cond_1

    .line 13
    .line 14
    const/4 v1, 0x4

    .line 15
    if-eq v0, v1, :cond_0

    .line 16
    .line 17
    const-string v0, "unknow"

    .line 18
    .line 19
    return-object v0

    .line 20
    :cond_0
    const-string v0, "wifi"

    .line 21
    .line 22
    return-object v0

    .line 23
    :cond_1
    const-string v0, "4g"

    .line 24
    .line 25
    return-object v0

    .line 26
    :cond_2
    const-string v0, "3g"

    .line 27
    .line 28
    return-object v0

    .line 29
    :cond_3
    const-string v0, "2g"

    .line 30
    .line 31
    return-object v0
.end method

.method public static getNetWorkClass()Ljava/lang/String;
    .locals 3

    .line 1
    :try_start_0
    sget-object v0, Lcom/cosmos/photon/push/util/AppContext;->sContext:Landroid/content/Context;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    const-string v1, "connectivity"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Landroid/net/ConnectivityManager;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getType()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    const/4 v2, 0x1

    .line 24
    if-ne v1, v2, :cond_0

    .line 25
    .line 26
    const-string v0, "wifi"

    .line 27
    .line 28
    return-object v0

    .line 29
    :cond_0
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getType()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-nez v1, :cond_1

    .line 34
    .line 35
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getSubtype()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    invoke-static {v0}, Lcom/cosmos/photon/push/util/NetUtil;->getNetworkClass(I)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 43
    return-object v0

    .line 44
    :catchall_0
    move-exception v0

    .line 45
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 46
    .line 47
    .line 48
    :cond_1
    const/4 v0, 0x0

    .line 49
    return-object v0
.end method

.method private static getNetworkClass(I)Ljava/lang/String;
    .locals 1

    .line 1
    const/16 v0, 0x14

    .line 2
    .line 3
    if-eq p0, v0, :cond_0

    .line 4
    .line 5
    packed-switch p0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    const-string p0, "unknown"

    .line 9
    .line 10
    return-object p0

    .line 11
    :pswitch_0
    const-string p0, "4g"

    .line 12
    .line 13
    return-object p0

    .line 14
    :pswitch_1
    const-string p0, "3g"

    .line 15
    .line 16
    return-object p0

    .line 17
    :pswitch_2
    const-string p0, "2g"

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_0
    const-string p0, "5G"

    .line 21
    .line 22
    return-object p0

    .line 23
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method public static init(Landroid/content/Context;)V
    .locals 2

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    sget-object v0, Lcom/cosmos/photon/push/util/NetUtil;->context:Landroid/content/Context;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sput-object p0, Lcom/cosmos/photon/push/util/NetUtil;->context:Landroid/content/Context;

    .line 12
    .line 13
    new-instance p0, Landroid/content/IntentFilter;

    .line 14
    .line 15
    invoke-direct {p0}, Landroid/content/IntentFilter;-><init>()V

    .line 16
    .line 17
    .line 18
    const-string v0, "android.net.conn.CONNECTIVITY_CHANGE"

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    sget-object v0, Lcom/cosmos/photon/push/util/NetUtil;->context:Landroid/content/Context;

    .line 24
    .line 25
    sget-object v1, Lcom/cosmos/photon/push/util/NetUtil;->netChangeBroadcastReceiver:Landroid/content/BroadcastReceiver;

    .line 26
    .line 27
    invoke-static {v0, v1, p0}, Ll/jj5;->l(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public static isNetworkAvailable()Z
    .locals 3

    .line 1
    sget-object v0, Lcom/cosmos/photon/push/util/NetUtil;->context:Landroid/content/Context;

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
    const-string v2, "connectivity"

    .line 8
    .line 9
    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Landroid/net/ConnectivityManager;

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    return v2

    .line 19
    :cond_1
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnectedOrConnecting()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    return v2

    .line 32
    :cond_2
    return v1
.end method

.method public static registerNetChangeReceiver(Lcom/cosmos/photon/push/util/NetUtil$NetChangeReceiver;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/cosmos/photon/push/util/NetUtil;->receiverList:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static unregisterNetChangeReceiver(Lcom/cosmos/photon/push/util/NetUtil$NetChangeReceiver;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/cosmos/photon/push/util/NetUtil;->receiverList:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Lcom/cosmos/photon/push/util/NetUtil;->receiverList:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0, p0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method
