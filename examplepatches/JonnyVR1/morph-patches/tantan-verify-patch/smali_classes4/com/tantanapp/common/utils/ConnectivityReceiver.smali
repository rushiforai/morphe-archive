.class public Lcom/tantanapp/common/utils/ConnectivityReceiver;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantanapp/common/utils/ConnectivityReceiver$ConnectivityInterReceiver;
    }
.end annotation


# static fields
.field public static final a:Lcom/tantanapp/common/utils/ConnectivityReceiver$ConnectivityInterReceiver;

.field public static b:Z

.field public static c:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Landroid/net/NetworkInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static d:Landroid/net/NetworkInfo;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/tantanapp/common/utils/ConnectivityReceiver$ConnectivityInterReceiver;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tantanapp/common/utils/ConnectivityReceiver$ConnectivityInterReceiver;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/tantanapp/common/utils/ConnectivityReceiver;->a:Lcom/tantanapp/common/utils/ConnectivityReceiver$ConnectivityInterReceiver;

    .line 7
    .line 8
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sput-object v0, Lcom/tantanapp/common/utils/ConnectivityReceiver;->c:Lrx/subjects/a;

    .line 13
    .line 14
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->p()V

    .line 15
    .line 16
    .line 17
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

.method public static synthetic a()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->c()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/tantanapp/common/utils/ConnectivityReceiver;->c:Lrx/subjects/a;

    .line 5
    .line 6
    sget-object v1, Lcom/tantanapp/common/utils/ConnectivityReceiver;->d:Landroid/net/NetworkInfo;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic b()V
    .locals 0

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->p()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static c()V
    .locals 3

    .line 1
    invoke-static {}, Ll/k26;->a()Landroid/app/Application;

    .line 2
    .line 3
    .line 4
    move-result-object v0

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
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Ll/k26;->a()Landroid/app/Application;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const-string v2, "android.permission.ACCESS_NETWORK_STATE"

    .line 20
    .line 21
    invoke-static {v1, v2}, Ll/ms60;->a(Landroid/content/Context;Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    sput-object v0, Lcom/tantanapp/common/utils/ConnectivityReceiver;->d:Landroid/net/NetworkInfo;

    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    const/4 v0, 0x0

    .line 35
    sput-object v0, Lcom/tantanapp/common/utils/ConnectivityReceiver;->d:Landroid/net/NetworkInfo;

    .line 36
    .line 37
    sget-boolean v0, Ll/kmk0;->c:Z

    .line 38
    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    const-string v0, "acquire network info fail,Reason:ConnectivityManager is null or no ACCESS_NETWORK_STATE permission"

    .line 42
    .line 43
    invoke-static {v0}, Ll/r1j0;->b(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    :cond_1
    return-void
.end method

.method public static d()Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->l()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "wifi"

    .line 8
    .line 9
    return-object v0

    .line 10
    :cond_0
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->j()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const-string v1, "unknown"

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    sget-object v0, Lcom/tantanapp/common/utils/ConnectivityReceiver;->d:Landroid/net/NetworkInfo;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getSubtype()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    packed-switch v0, :pswitch_data_0

    .line 27
    .line 28
    .line 29
    return-object v1

    .line 30
    :pswitch_0
    const-string v0, "cellular(4g)"

    .line 31
    .line 32
    return-object v0

    .line 33
    :pswitch_1
    const-string v0, "cellular(3g)"

    .line 34
    .line 35
    return-object v0

    .line 36
    :pswitch_2
    const-string v0, "cellular(2g)"

    .line 37
    .line 38
    return-object v0

    .line 39
    :cond_1
    return-object v1

    .line 40
    nop

    .line 41
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

.method public static e()Ljava/lang/String;
    .locals 3

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->l()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "WiFi"

    .line 8
    .line 9
    return-object v0

    .line 10
    :cond_0
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->j()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const-string v1, ""

    .line 15
    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    sget-object v0, Lcom/tantanapp/common/utils/ConnectivityReceiver;->d:Landroid/net/NetworkInfo;

    .line 19
    .line 20
    if-eqz v0, :cond_2

    .line 21
    .line 22
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getSubtype()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    const/16 v2, 0x14

    .line 27
    .line 28
    if-eq v0, v2, :cond_1

    .line 29
    .line 30
    packed-switch v0, :pswitch_data_0

    .line 31
    .line 32
    .line 33
    return-object v1

    .line 34
    :pswitch_0
    const-string v0, "4G"

    .line 35
    .line 36
    return-object v0

    .line 37
    :pswitch_1
    const-string v0, "3G"

    .line 38
    .line 39
    return-object v0

    .line 40
    :pswitch_2
    const-string v0, "2G"

    .line 41
    .line 42
    return-object v0

    .line 43
    :cond_1
    const-string v0, "5G"

    .line 44
    .line 45
    return-object v0

    .line 46
    :cond_2
    return-object v1

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

.method public static f()Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->l()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "wifi"

    .line 8
    .line 9
    return-object v0

    .line 10
    :cond_0
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->j()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const-string v1, "unknown"

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    sget-object v0, Lcom/tantanapp/common/utils/ConnectivityReceiver;->d:Landroid/net/NetworkInfo;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getSubtype()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    packed-switch v0, :pswitch_data_0

    .line 27
    .line 28
    .line 29
    return-object v1

    .line 30
    :pswitch_0
    const-string v0, "4G"

    .line 31
    .line 32
    return-object v0

    .line 33
    :pswitch_1
    const-string v0, "3G"

    .line 34
    .line 35
    return-object v0

    .line 36
    :pswitch_2
    const-string v0, "2G"

    .line 37
    .line 38
    return-object v0

    .line 39
    :cond_1
    return-object v1

    .line 40
    nop

    .line 41
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

.method public static g()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->c()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/tantanapp/common/utils/ConnectivityReceiver;->d:Landroid/net/NetworkInfo;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    return v0

    .line 16
    :cond_0
    const/4 v0, 0x0

    .line 17
    return v0
.end method

.method public static h(II)Z
    .locals 2

    .line 1
    const/4 v0, 0x1

    if-ne p0, v0, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-nez p0, :cond_1

    packed-switch p1, :pswitch_data_0

    :pswitch_0
    return v1

    :pswitch_1
    return v0

    :cond_1
    return v1

    nop

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method public static i()Z
    .locals 2

    .line 1
    sget-object v0, Lcom/tantanapp/common/utils/ConnectivityReceiver;->d:Landroid/net/NetworkInfo;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getType()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getSubtype()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-static {v1, v0}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->h(II)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    return v0

    .line 27
    :cond_0
    const/4 v0, 0x0

    .line 28
    return v0
.end method

.method public static j()Z
    .locals 2

    .line 1
    sget-object v0, Lcom/tantanapp/common/utils/ConnectivityReceiver;->d:Landroid/net/NetworkInfo;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getType()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    return v0

    .line 19
    :cond_0
    const/4 v0, 0x0

    .line 20
    return v0
.end method

.method public static k()Z
    .locals 3

    .line 1
    sget-object v0, Lcom/tantanapp/common/utils/ConnectivityReceiver;->d:Landroid/net/NetworkInfo;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getType()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-ne v0, v1, :cond_3

    .line 12
    .line 13
    invoke-static {}, Ll/k26;->a()Landroid/app/Application;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v2, "wifi"

    .line 22
    .line 23
    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Landroid/net/wifi/WifiManager;

    .line 28
    .line 29
    if-eqz v0, :cond_3

    .line 30
    .line 31
    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    return v1

    .line 38
    :cond_1
    invoke-virtual {v0}, Landroid/net/wifi/WifiInfo;->getRssi()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    const/16 v2, -0x46

    .line 43
    .line 44
    if-ge v0, v2, :cond_2

    .line 45
    .line 46
    const/16 v2, -0x64

    .line 47
    .line 48
    if-lt v0, v2, :cond_2

    .line 49
    .line 50
    return v1

    .line 51
    :cond_2
    const/4 v0, 0x0

    .line 52
    return v0

    .line 53
    :cond_3
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->i()Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    xor-int/2addr v0, v1

    .line 58
    return v0
.end method

.method public static l()Z
    .locals 2

    .line 1
    sget-object v0, Lcom/tantanapp/common/utils/ConnectivityReceiver;->d:Landroid/net/NetworkInfo;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getType()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x1

    .line 16
    if-ne v0, v1, :cond_0

    .line 17
    .line 18
    return v1

    .line 19
    :cond_0
    const/4 v0, 0x0

    .line 20
    return v0
.end method

.method public static m()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Landroid/net/NetworkInfo;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/tantanapp/common/utils/ConnectivityReceiver;->c:Lrx/subjects/a;

    .line 2
    .line 3
    return-object v0
.end method

.method public static n(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/k26;->a()Landroid/app/Application;

    .line 2
    .line 3
    .line 4
    move-result-object v0

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
    if-nez v0, :cond_0

    .line 14
    .line 15
    invoke-static {p0}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->o(Landroid/content/Context;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    new-instance p0, Landroid/net/NetworkRequest$Builder;

    .line 20
    .line 21
    invoke-direct {p0}, Landroid/net/NetworkRequest$Builder;-><init>()V

    .line 22
    .line 23
    .line 24
    const/16 v1, 0xc

    .line 25
    .line 26
    invoke-virtual {p0, v1}, Landroid/net/NetworkRequest$Builder;->addCapability(I)Landroid/net/NetworkRequest$Builder;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const/4 v1, 0x1

    .line 31
    invoke-virtual {p0, v1}, Landroid/net/NetworkRequest$Builder;->addTransportType(I)Landroid/net/NetworkRequest$Builder;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const/4 v1, 0x0

    .line 36
    invoke-virtual {p0, v1}, Landroid/net/NetworkRequest$Builder;->addTransportType(I)Landroid/net/NetworkRequest$Builder;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p0}, Landroid/net/NetworkRequest$Builder;->build()Landroid/net/NetworkRequest;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    new-instance v1, Lcom/tantanapp/common/utils/ConnectivityReceiver$a;

    .line 45
    .line 46
    invoke-direct {v1}, Lcom/tantanapp/common/utils/ConnectivityReceiver$a;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-static {v0, p0, v1}, Ll/jj5;->j(Landroid/net/ConnectivityManager;Landroid/net/NetworkRequest;Landroid/net/ConnectivityManager$NetworkCallback;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public static o(Landroid/content/Context;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    sput-boolean v0, Lcom/tantanapp/common/utils/ConnectivityReceiver;->b:Z

    .line 3
    .line 4
    new-instance v0, Landroid/content/IntentFilter;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 7
    .line 8
    .line 9
    const-string v1, "android.net.conn.CONNECTIVITY_CHANGE"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    sget-object v1, Lcom/tantanapp/common/utils/ConnectivityReceiver;->a:Lcom/tantanapp/common/utils/ConnectivityReceiver$ConnectivityInterReceiver;

    .line 15
    .line 16
    invoke-static {p0, v1, v0}, Ll/jj5;->l(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static p()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "network changed : "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->d()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "[common][network]"

    .line 20
    .line 21
    invoke-static {v1, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    new-instance v0, Ll/px5;

    .line 25
    .line 26
    invoke-direct {v0}, Ll/px5;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-static {v0}, Lcom/tantanapp/common/utils/ThreadUtil;->i(Ljava/lang/Runnable;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method
