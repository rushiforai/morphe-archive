.class public Lcom/tantanapp/beatles/NetConnectivityReceiver;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantanapp/beatles/NetConnectivityReceiver$a;
    }
.end annotation


# static fields
.field private static final instance:Lcom/tantanapp/beatles/NetConnectivityReceiver;

.field private static sCallBacks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/tantanapp/beatles/NetConnectivityReceiver$a;",
            ">;"
        }
    .end annotation
.end field

.field private static sNetConnected:Z

.field private static sNetType:Ljava/lang/String;


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
    sput-object v0, Lcom/tantanapp/beatles/NetConnectivityReceiver;->sCallBacks:Ljava/util/List;

    .line 7
    .line 8
    new-instance v0, Lcom/tantanapp/beatles/NetConnectivityReceiver;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/tantanapp/beatles/NetConnectivityReceiver;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/tantanapp/beatles/NetConnectivityReceiver;->instance:Lcom/tantanapp/beatles/NetConnectivityReceiver;

    .line 14
    .line 15
    const-string v0, ""

    .line 16
    .line 17
    sput-object v0, Lcom/tantanapp/beatles/NetConnectivityReceiver;->sNetType:Ljava/lang/String;

    .line 18
    .line 19
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private getNetStatus(Landroid/content/Context;)Z
    .locals 2

    .line 1
    const-string v0, "connectivity"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Landroid/net/ConnectivityManager;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p1, 0x0

    .line 17
    :goto_0
    if-eqz p1, :cond_3

    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/net/NetworkInfo;->isConnected()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_3

    .line 24
    .line 25
    invoke-virtual {p1}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sget-object v1, Landroid/net/NetworkInfo$State;->CONNECTED:Landroid/net/NetworkInfo$State;

    .line 30
    .line 31
    if-ne v0, v1, :cond_3

    .line 32
    .line 33
    invoke-virtual {p1}, Landroid/net/NetworkInfo;->getType()I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    const/4 v1, 0x1

    .line 38
    if-ne v0, v1, :cond_1

    .line 39
    .line 40
    const-string p0, "wifi"

    .line 41
    .line 42
    sput-object p0, Lcom/tantanapp/beatles/NetConnectivityReceiver;->sNetType:Ljava/lang/String;

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_1
    invoke-virtual {p1}, Landroid/net/NetworkInfo;->getType()I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-nez v0, :cond_2

    .line 50
    .line 51
    invoke-direct {p0, p1}, Lcom/tantanapp/beatles/NetConnectivityReceiver;->getNetworkType(Landroid/net/NetworkInfo;)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    sput-object p0, Lcom/tantanapp/beatles/NetConnectivityReceiver;->sNetType:Ljava/lang/String;

    .line 56
    .line 57
    :cond_2
    :goto_1
    return v1

    .line 58
    :cond_3
    const/4 p0, 0x0

    .line 59
    return p0
.end method

.method public static getNetType()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/tantanapp/beatles/NetConnectivityReceiver;->sNetType:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method private getNetworkType(Landroid/net/NetworkInfo;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/net/NetworkInfo;->getSubtype()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/16 p1, 0x14

    .line 6
    .line 7
    if-eq p0, p1, :cond_0

    .line 8
    .line 9
    packed-switch p0, :pswitch_data_0

    .line 10
    .line 11
    .line 12
    const-string p0, "unknown"

    .line 13
    .line 14
    return-object p0

    .line 15
    :pswitch_0
    const-string p0, "4G"

    .line 16
    .line 17
    return-object p0

    .line 18
    :pswitch_1
    const-string p0, "3G"

    .line 19
    .line 20
    return-object p0

    .line 21
    :pswitch_2
    const-string p0, "2G"

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_0
    const-string p0, "5G"

    .line 25
    .line 26
    return-object p0

    .line 27
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

.method public static registerCallBack(Lcom/tantanapp/beatles/NetConnectivityReceiver$a;)V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/tantanapp/beatles/NetConnectivityReceiver;->sNetConnected:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-interface {p0, v0}, Lcom/tantanapp/beatles/NetConnectivityReceiver$a;->a(Z)V

    .line 7
    .line 8
    .line 9
    :cond_0
    sget-object v0, Lcom/tantanapp/beatles/NetConnectivityReceiver;->sCallBacks:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static registerConnectivityReceiver(Landroid/content/Context;)V
    .locals 2

    .line 1
    new-instance v0, Landroid/content/IntentFilter;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "android.net.conn.CONNECTIVITY_CHANGE"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sget-object v1, Lcom/tantanapp/beatles/NetConnectivityReceiver;->instance:Lcom/tantanapp/beatles/NetConnectivityReceiver;

    .line 12
    .line 13
    invoke-static {p0, v1, v0}, Ll/jj5;->l(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    .line 1
    sget-object p2, Lcom/tantanapp/beatles/NetConnectivityReceiver;->sCallBacks:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    invoke-direct {p0, p1}, Lcom/tantanapp/beatles/NetConnectivityReceiver;->getNetStatus(Landroid/content/Context;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    sget-boolean p1, Lcom/tantanapp/beatles/NetConnectivityReceiver;->sNetConnected:Z

    .line 10
    .line 11
    if-eq p1, p0, :cond_0

    .line 12
    .line 13
    sput-boolean p0, Lcom/tantanapp/beatles/NetConnectivityReceiver;->sNetConnected:Z

    .line 14
    .line 15
    sget-object p0, Lcom/tantanapp/beatles/NetConnectivityReceiver;->sCallBacks:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    check-cast p1, Lcom/tantanapp/beatles/NetConnectivityReceiver$a;

    .line 32
    .line 33
    sget-boolean p2, Lcom/tantanapp/beatles/NetConnectivityReceiver;->sNetConnected:Z

    .line 34
    .line 35
    invoke-interface {p1, p2}, Lcom/tantanapp/beatles/NetConnectivityReceiver$a;->a(Z)V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    return-void
.end method
