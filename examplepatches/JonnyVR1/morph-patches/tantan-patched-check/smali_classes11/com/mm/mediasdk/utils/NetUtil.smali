.class public Lcom/mm/mediasdk/utils/NetUtil;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mm/mediasdk/utils/NetUtil$a;,
        Lcom/mm/mediasdk/utils/NetUtil$b;
    }
.end annotation


# static fields
.field public static a:Landroid/content/Context; = null

.field public static b:Landroid/net/NetworkInfo; = null

.field public static c:Landroid/net/wifi/WifiInfo; = null

.field public static d:Z = true

.field private static e:Lcom/mm/mediasdk/utils/NetUtil$a;

.field private static f:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/mm/mediasdk/utils/NetUtil$a;",
            ">;"
        }
    .end annotation
.end field

.field private static g:Landroid/content/BroadcastReceiver;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/mm/mediasdk/utils/NetUtil;->f:Ljava/util/Set;

    .line 7
    .line 8
    new-instance v0, Lcom/mm/mediasdk/utils/NetUtil$1;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/mm/mediasdk/utils/NetUtil$1;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/mm/mediasdk/utils/NetUtil;->g:Landroid/content/BroadcastReceiver;

    .line 14
    .line 15
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

.method public static synthetic a()Lcom/mm/mediasdk/utils/NetUtil$b;
    .locals 1

    .line 1
    const/4 v0, 0x0

    return-object v0
.end method

.method public static synthetic b()Ljava/util/Set;
    .locals 1

    .line 1
    sget-object v0, Lcom/mm/mediasdk/utils/NetUtil;->f:Ljava/util/Set;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic c()Lcom/mm/mediasdk/utils/NetUtil$a;
    .locals 1

    .line 1
    sget-object v0, Lcom/mm/mediasdk/utils/NetUtil;->e:Lcom/mm/mediasdk/utils/NetUtil$a;

    .line 2
    .line 3
    return-object v0
.end method

.method public static d(Landroid/content/Context;)V
    .locals 2

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    sget-object v0, Lcom/mm/mediasdk/utils/NetUtil;->a:Landroid/content/Context;

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
    sput-object p0, Lcom/mm/mediasdk/utils/NetUtil;->a:Landroid/content/Context;

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
    sget-object v0, Lcom/mm/mediasdk/utils/NetUtil;->a:Landroid/content/Context;

    .line 24
    .line 25
    sget-object v1, Lcom/mm/mediasdk/utils/NetUtil;->g:Landroid/content/BroadcastReceiver;

    .line 26
    .line 27
    invoke-static {v0, v1, p0}, Ll/jj5;->l(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public static e()Z
    .locals 3

    .line 1
    sget-object v0, Lcom/mm/mediasdk/utils/NetUtil;->a:Landroid/content/Context;

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

.method public static f(Lcom/mm/mediasdk/utils/NetUtil$a;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/mm/mediasdk/utils/NetUtil;->e:Lcom/mm/mediasdk/utils/NetUtil$a;

    .line 2
    .line 3
    return-void
.end method
