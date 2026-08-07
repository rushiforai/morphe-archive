.class public Lcn/shuzilm/core/dl;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field static a:I

.field private static b:Landroid/content/Context;

.field private static c:Landroid/net/nsd/NsdManager;

.field private static d:Ljava/util/LinkedList;

.field private static e:Lorg/json/JSONObject;

.field private static f:Lorg/json/JSONObject;

.field private static g:Ljava/util/Timer;

.field private static h:I

.field private static i:I

.field private static j:Ljava/lang/String;

.field private static k:Ljava/lang/String;

.field private static l:Ljava/lang/String;

.field private static m:I

.field private static n:Ljava/lang/String;

.field private static o:I

.field private static p:I

.field private static q:I

.field private static r:I

.field private static s:I

.field private static t:Ljava/lang/String;

.field private static u:Ljava/lang/String;

.field private static v:I

.field private static w:Ljava/lang/String;

.field private static final x:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Ljava/util/LinkedList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcn/shuzilm/core/dl;->d:Ljava/util/LinkedList;

    .line 7
    .line 8
    new-instance v0, Lorg/json/JSONObject;

    .line 9
    .line 10
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcn/shuzilm/core/dl;->e:Lorg/json/JSONObject;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    sput-object v0, Lcn/shuzilm/core/dl;->f:Lorg/json/JSONObject;

    .line 17
    .line 18
    sput-object v0, Lcn/shuzilm/core/dl;->g:Ljava/util/Timer;

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    sput v1, Lcn/shuzilm/core/dl;->h:I

    .line 22
    .line 23
    sput v1, Lcn/shuzilm/core/dl;->i:I

    .line 24
    .line 25
    const-string v2, ""

    .line 26
    .line 27
    sput-object v2, Lcn/shuzilm/core/dl;->j:Ljava/lang/String;

    .line 28
    .line 29
    sput-object v2, Lcn/shuzilm/core/dl;->k:Ljava/lang/String;

    .line 30
    .line 31
    sput-object v2, Lcn/shuzilm/core/dl;->l:Ljava/lang/String;

    .line 32
    .line 33
    sput v1, Lcn/shuzilm/core/dl;->m:I

    .line 34
    .line 35
    sput-object v2, Lcn/shuzilm/core/dl;->n:Ljava/lang/String;

    .line 36
    .line 37
    sput v1, Lcn/shuzilm/core/dl;->o:I

    .line 38
    .line 39
    const/4 v3, -0x1

    .line 40
    sput v3, Lcn/shuzilm/core/dl;->p:I

    .line 41
    .line 42
    sput v3, Lcn/shuzilm/core/dl;->q:I

    .line 43
    .line 44
    sput v3, Lcn/shuzilm/core/dl;->r:I

    .line 45
    .line 46
    sput v3, Lcn/shuzilm/core/dl;->s:I

    .line 47
    .line 48
    sput-object v0, Lcn/shuzilm/core/dl;->t:Ljava/lang/String;

    .line 49
    .line 50
    sput-object v0, Lcn/shuzilm/core/dl;->u:Ljava/lang/String;

    .line 51
    .line 52
    sput v1, Lcn/shuzilm/core/dl;->v:I

    .line 53
    .line 54
    sput-object v2, Lcn/shuzilm/core/dl;->w:Ljava/lang/String;

    .line 55
    .line 56
    new-instance v0, Ljava/lang/Object;

    .line 57
    .line 58
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 59
    .line 60
    .line 61
    sput-object v0, Lcn/shuzilm/core/dl;->x:Ljava/lang/Object;

    .line 62
    .line 63
    sput v1, Lcn/shuzilm/core/dl;->a:I

    .line 64
    .line 65
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

.method public static synthetic a(I)I
    .locals 0

    .line 21
    sput p0, Lcn/shuzilm/core/dl;->i:I

    return p0
.end method

.method public static synthetic a(Landroid/net/Network;Ljava/lang/String;I)Ljava/lang/String;
    .locals 0

    .line 20
    invoke-static {p0, p1, p2}, Lcn/shuzilm/core/dl;->d(Landroid/net/Network;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic a(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 18
    invoke-static {p0}, Lcn/shuzilm/core/dl;->f(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic a(Ljava/util/Timer;)Ljava/util/Timer;
    .locals 0

    .line 24
    sput-object p0, Lcn/shuzilm/core/dl;->g:Ljava/util/Timer;

    return-object p0
.end method

.method public static synthetic a()Lorg/json/JSONObject;
    .locals 1

    .line 19
    sget-object v0, Lcn/shuzilm/core/dl;->e:Lorg/json/JSONObject;

    return-object v0
.end method

.method public static synthetic a(Landroid/net/Network;)V
    .locals 0

    .line 25
    invoke-static {p0}, Lcn/shuzilm/core/dl;->b(Landroid/net/Network;)V

    return-void
.end method

.method public static synthetic a(Landroid/net/nsd/NsdManager;Landroid/net/nsd/NsdManager$DiscoveryListener;)V
    .locals 0

    .line 26
    invoke-static {p0, p1}, Lcn/shuzilm/core/dl;->b(Landroid/net/nsd/NsdManager;Landroid/net/nsd/NsdManager$DiscoveryListener;)V

    return-void
.end method

.method public static synthetic a(Landroid/net/nsd/NsdServiceInfo;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 0

    .line 23
    invoke-static {p0, p1, p2, p3}, Lcn/shuzilm/core/dl;->b(Landroid/net/nsd/NsdServiceInfo;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V

    return-void
.end method

.method private static declared-synchronized a(Ljava/lang/String;I)V
    .locals 2

    .line 1
    const-class p1, Lcn/shuzilm/core/dl;

    .line 2
    .line 3
    monitor-enter p1

    .line 4
    :try_start_0
    new-instance v0, Lcn/shuzilm/core/dl$NsdDiscoverySubJson;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-direct {v0, p0, v1}, Lcn/shuzilm/core/dl$NsdDiscoverySubJson;-><init>(Ljava/lang/String;I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0}, Lcn/shuzilm/core/dl$NsdDiscoverySubJson;->discoverySubType()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    .line 13
    monitor-exit p1

    .line 14
    return-void

    .line 15
    :catchall_0
    move-exception p0

    .line 16
    :try_start_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 17
    throw p0
.end method

.method public static synthetic a(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 22
    invoke-static {p0, p1}, Lcn/shuzilm/core/dl;->b(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic b()I
    .locals 1

    .line 93
    sget v0, Lcn/shuzilm/core/dl;->m:I

    return v0
.end method

.method public static synthetic b(Landroid/net/Network;Ljava/lang/String;I)Ljava/lang/String;
    .locals 0

    .line 78
    invoke-static {p0, p1, p2}, Lcn/shuzilm/core/dl;->c(Landroid/net/Network;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 79
    sput-object p0, Lcn/shuzilm/core/dl;->t:Ljava/lang/String;

    return-object p0
.end method

.method public static synthetic b(I)V
    .locals 0

    .line 80
    invoke-static {p0}, Lcn/shuzilm/core/dl;->d(I)V

    return-void
.end method

.method private static b(Landroid/net/Network;)V
    .locals 2

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    :try_start_0
    sget-object v0, Lcn/shuzilm/core/dl;->b:Landroid/content/Context;

    .line 5
    .line 6
    const-string v1, "connectivity"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Landroid/net/ConnectivityManager;

    .line 13
    .line 14
    invoke-virtual {v0, p0}, Landroid/net/ConnectivityManager;->getLinkProperties(Landroid/net/Network;)Landroid/net/LinkProperties;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    if-nez p0, :cond_1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    invoke-virtual {p0}, Landroid/net/LinkProperties;->getLinkAddresses()Ljava/util/List;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    if-nez p0, :cond_2

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_2
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    :cond_3
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_4

    .line 37
    .line 38
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Landroid/net/LinkAddress;

    .line 43
    .line 44
    invoke-virtual {v0}, Landroid/net/LinkAddress;->getAddress()Ljava/net/InetAddress;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    if-eqz v0, :cond_3

    .line 53
    .line 54
    const-string v1, ":"

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    if-eqz v1, :cond_3

    .line 61
    .line 62
    const-string v1, "fe80"

    .line 63
    .line 64
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    if-nez v1, :cond_3

    .line 69
    .line 70
    sget-object p0, Lcn/shuzilm/core/dl;->b:Landroid/content/Context;

    .line 71
    .line 72
    const/16 v1, 0xcc

    .line 73
    .line 74
    invoke-static {p0, v1, v0}, Lcn/shuzilm/core/DUHelper;->c(Landroid/content/Context;ILjava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 75
    .line 76
    .line 77
    :catchall_0
    :cond_4
    :goto_0
    return-void
.end method

.method private static declared-synchronized b(Landroid/net/nsd/NsdManager;Landroid/net/nsd/NsdManager$DiscoveryListener;)V
    .locals 1

    const-class v0, Lcn/shuzilm/core/dl;

    monitor-enter v0

    .line 92
    :try_start_0
    invoke-virtual {p0, p1}, Landroid/net/nsd/NsdManager;->stopServiceDiscovery(Landroid/net/nsd/NsdManager$DiscoveryListener;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    monitor-exit v0

    return-void
.end method

.method private static declared-synchronized b(Landroid/net/nsd/NsdServiceInfo;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 2

    const-class v0, Lcn/shuzilm/core/dl;

    monitor-enter v0

    if-eqz p1, :cond_1

    .line 87
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    if-eqz p0, :cond_1

    if-nez p3, :cond_0

    goto :goto_1

    .line 88
    :cond_0
    new-instance v1, Lcn/shuzilm/core/dl$ResolveListenerAddress;

    invoke-direct {v1, p1, p2, p3}, Lcn/shuzilm/core/dl$ResolveListenerAddress;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 89
    sget-object p1, Lcn/shuzilm/core/dl;->c:Landroid/net/nsd/NsdManager;

    invoke-virtual {p1, p0, v1}, Landroid/net/nsd/NsdManager;->resolveService(Landroid/net/nsd/NsdServiceInfo;Landroid/net/nsd/NsdManager$ResolveListener;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p0

    .line 90
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0

    .line 91
    :catch_0
    :goto_0
    monitor-exit v0

    return-void

    :cond_1
    :goto_1
    monitor-exit v0

    return-void
.end method

.method private static declared-synchronized b(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    const-class v0, Lcn/shuzilm/core/dl;

    monitor-enter v0

    .line 81
    :try_start_0
    const-string v1, "."

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 82
    const-string v1, "\\."

    .line 83
    invoke-virtual {p1, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    const/4 v1, 0x0

    .line 84
    aget-object p1, p1, v1

    .line 85
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "."

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "."

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 86
    sget-object p1, Lcn/shuzilm/core/dl;->d:Ljava/util/LinkedList;

    invoke-virtual {p1, p0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    :cond_0
    monitor-exit v0

    return-void
.end method

.method private static declared-synchronized c(Landroid/net/Network;Ljava/lang/String;I)Ljava/lang/String;
    .locals 2

    const-class p2, Lcn/shuzilm/core/dl;

    monitor-enter p2

    const/4 v0, 0x0

    if-eqz p1, :cond_7

    .line 228
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    if-eqz v1, :cond_0

    goto/16 :goto_6

    :cond_0
    if-eqz p0, :cond_1

    .line 229
    :try_start_1
    new-instance v1, Ljava/net/URL;

    invoke-direct {v1, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Landroid/net/Network;->openConnection(Ljava/net/URL;)Ljava/net/URLConnection;

    move-result-object p0

    goto :goto_0

    .line 230
    :cond_1
    new-instance p0, Ljava/net/URL;

    invoke-direct {p0, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 231
    invoke-virtual {p0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p0

    check-cast p0, Ljava/net/HttpURLConnection;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_0
    if-nez p0, :cond_2

    monitor-exit p2

    return-object v0

    :cond_2
    const/16 p1, 0x1388

    .line 232
    :try_start_2
    invoke-virtual {p0, p1}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    .line 233
    invoke-virtual {p0, p1}, Ljava/net/URLConnection;->setReadTimeout(I)V

    const/4 p1, 0x1

    .line 234
    invoke-virtual {p0, p1}, Ljava/net/URLConnection;->setDoInput(Z)V

    .line 235
    invoke-virtual {p0}, Ljava/net/URLConnection;->connect()V

    .line 236
    move-object p1, p0

    check-cast p1, Ljava/net/HttpURLConnection;

    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result p1

    const/16 v1, 0xc8

    if-ne p1, v1, :cond_3

    .line 237
    invoke-virtual {p0}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 238
    :try_start_3
    invoke-static {p0}, Lcn/shuzilm/core/u;->a(Ljava/io/InputStream;)[B

    move-result-object p1

    .line 239
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, p1}, Ljava/lang/String;-><init>([B)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    move-object v0, p0

    goto :goto_1

    :cond_3
    move-object v1, v0

    :goto_1
    if-eqz v0, :cond_4

    goto :goto_3

    :catch_0
    :cond_4
    :goto_2
    move-object v0, v1

    goto :goto_4

    :catchall_0
    move-object p0, v0

    .line 240
    :catchall_1
    :try_start_4
    const-string p1, "shuzilm"

    const-string v1, "[20001] network connect error."

    invoke-static {p1, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    if-eqz p0, :cond_5

    move-object v1, v0

    move-object v0, p0

    .line 241
    :goto_3
    :try_start_5
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    goto :goto_2

    :catchall_2
    move-exception p0

    goto :goto_5

    .line 242
    :cond_5
    :goto_4
    monitor-exit p2

    return-object v0

    :catchall_3
    move-exception p1

    if-eqz p0, :cond_6

    .line 243
    :try_start_6
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 244
    :catch_1
    :cond_6
    :try_start_7
    throw p1

    :goto_5
    monitor-exit p2
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    throw p0

    :cond_7
    :goto_6
    monitor-exit p2

    return-object v0
.end method

.method public static synthetic c(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 245
    sput-object p0, Lcn/shuzilm/core/dl;->u:Ljava/lang/String;

    return-object p0
.end method

.method public static synthetic c()Ljava/util/LinkedList;
    .locals 1

    .line 246
    sget-object v0, Lcn/shuzilm/core/dl;->d:Ljava/util/LinkedList;

    return-object v0
.end method

.method private static c(I)V
    .locals 8

    .line 1
    sget v0, Lcn/shuzilm/core/dl;->q:I

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto/16 :goto_7

    .line 6
    .line 7
    :cond_0
    const/4 v0, 0x0

    .line 8
    :try_start_0
    new-instance v1, Ljava/util/concurrent/CountDownLatch;

    .line 9
    .line 10
    const/4 v2, 0x3

    .line 11
    invoke-direct {v1, v2}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 12
    .line 13
    .line 14
    sget-object v2, Lcn/shuzilm/core/dl;->b:Landroid/content/Context;

    .line 15
    .line 16
    const-string v3, "connectivity"

    .line 17
    .line 18
    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    check-cast v2, Landroid/net/ConnectivityManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 23
    .line 24
    const/16 v3, 0xc

    .line 25
    .line 26
    const/4 v4, 0x1

    .line 27
    const-string v5, "0"

    .line 28
    .line 29
    if-nez p0, :cond_1

    .line 30
    .line 31
    :try_start_1
    sget v6, Lcn/shuzilm/core/dl;->r:I

    .line 32
    .line 33
    if-nez v6, :cond_1

    .line 34
    .line 35
    sget v6, Lcn/shuzilm/core/dl;->s:I

    .line 36
    .line 37
    if-eqz v6, :cond_3

    .line 38
    .line 39
    :cond_1
    if-nez p0, :cond_2

    .line 40
    .line 41
    sget v6, Lcn/shuzilm/core/dl;->r:I

    .line 42
    .line 43
    if-nez v6, :cond_2

    .line 44
    .line 45
    sget v6, Lcn/shuzilm/core/dl;->p:I

    .line 46
    .line 47
    if-eqz v6, :cond_3

    .line 48
    .line 49
    :cond_2
    if-ne p0, v4, :cond_4

    .line 50
    .line 51
    sget v6, Lcn/shuzilm/core/dl;->r:I

    .line 52
    .line 53
    if-nez v6, :cond_4

    .line 54
    .line 55
    :cond_3
    new-instance v6, Landroid/net/NetworkRequest$Builder;

    .line 56
    .line 57
    invoke-direct {v6}, Landroid/net/NetworkRequest$Builder;-><init>()V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v6, v3}, Landroid/net/NetworkRequest$Builder;->addCapability(I)Landroid/net/NetworkRequest$Builder;

    .line 61
    .line 62
    .line 63
    move-result-object v6

    .line 64
    const/4 v7, 0x0

    .line 65
    invoke-virtual {v6, v7}, Landroid/net/NetworkRequest$Builder;->addTransportType(I)Landroid/net/NetworkRequest$Builder;

    .line 66
    .line 67
    .line 68
    move-result-object v6

    .line 69
    invoke-virtual {v6}, Landroid/net/NetworkRequest$Builder;->build()Landroid/net/NetworkRequest;

    .line 70
    .line 71
    .line 72
    move-result-object v6

    .line 73
    new-instance v7, Lcn/shuzilm/core/dl$2;

    .line 74
    .line 75
    invoke-direct {v7, p0, v1}, Lcn/shuzilm/core/dl$2;-><init>(ILjava/util/concurrent/CountDownLatch;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 76
    .line 77
    .line 78
    :try_start_2
    invoke-virtual {v2, v6, v7}, Landroid/net/ConnectivityManager;->requestNetwork(Landroid/net/NetworkRequest;Landroid/net/ConnectivityManager$NetworkCallback;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_4

    .line 79
    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_4
    :try_start_3
    invoke-virtual {v1}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 83
    .line 84
    .line 85
    sget-object v6, Lcn/shuzilm/core/dl;->b:Landroid/content/Context;

    .line 86
    .line 87
    const/16 v7, 0xc9

    .line 88
    .line 89
    invoke-static {v6, v7, v5}, Lcn/shuzilm/core/DUHelper;->c(Landroid/content/Context;ILjava/lang/String;)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    sput-object v5, Lcn/shuzilm/core/dl;->t:Ljava/lang/String;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 93
    .line 94
    move-object v7, v0

    .line 95
    :goto_0
    if-nez p0, :cond_5

    .line 96
    .line 97
    :try_start_4
    sget v6, Lcn/shuzilm/core/dl;->p:I

    .line 98
    .line 99
    if-nez v6, :cond_5

    .line 100
    .line 101
    sget v6, Lcn/shuzilm/core/dl;->s:I

    .line 102
    .line 103
    if-eqz v6, :cond_6

    .line 104
    .line 105
    :cond_5
    if-ne p0, v4, :cond_7

    .line 106
    .line 107
    sget v6, Lcn/shuzilm/core/dl;->s:I

    .line 108
    .line 109
    if-nez v6, :cond_7

    .line 110
    .line 111
    :cond_6
    new-instance v6, Landroid/net/NetworkRequest$Builder;

    .line 112
    .line 113
    invoke-direct {v6}, Landroid/net/NetworkRequest$Builder;-><init>()V

    .line 114
    .line 115
    .line 116
    invoke-virtual {v6, v3}, Landroid/net/NetworkRequest$Builder;->addCapability(I)Landroid/net/NetworkRequest$Builder;

    .line 117
    .line 118
    .line 119
    move-result-object v3

    .line 120
    invoke-virtual {v3, v4}, Landroid/net/NetworkRequest$Builder;->addTransportType(I)Landroid/net/NetworkRequest$Builder;

    .line 121
    .line 122
    .line 123
    move-result-object v3

    .line 124
    invoke-virtual {v3}, Landroid/net/NetworkRequest$Builder;->build()Landroid/net/NetworkRequest;

    .line 125
    .line 126
    .line 127
    move-result-object v3

    .line 128
    new-instance v4, Lcn/shuzilm/core/dl$3;

    .line 129
    .line 130
    invoke-direct {v4, p0, v1}, Lcn/shuzilm/core/dl$3;-><init>(ILjava/util/concurrent/CountDownLatch;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 131
    .line 132
    .line 133
    :try_start_5
    invoke-virtual {v2, v3, v4}, Landroid/net/ConnectivityManager;->requestNetwork(Landroid/net/NetworkRequest;Landroid/net/ConnectivityManager$NetworkCallback;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 134
    .line 135
    .line 136
    move-object v0, v4

    .line 137
    goto :goto_1

    .line 138
    :catchall_0
    move-object v0, v4

    .line 139
    goto :goto_5

    .line 140
    :cond_7
    :try_start_6
    invoke-virtual {v1}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 141
    .line 142
    .line 143
    sget-object v3, Lcn/shuzilm/core/dl;->b:Landroid/content/Context;

    .line 144
    .line 145
    const/16 v4, 0xca

    .line 146
    .line 147
    invoke-static {v3, v4, v5}, Lcn/shuzilm/core/DUHelper;->c(Landroid/content/Context;ILjava/lang/String;)Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    sput-object v5, Lcn/shuzilm/core/dl;->u:Ljava/lang/String;

    .line 151
    .line 152
    :goto_1
    sget v3, Lcn/shuzilm/core/dl;->p:I
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 153
    .line 154
    if-nez v3, :cond_8

    .line 155
    .line 156
    :try_start_7
    new-instance v3, Ljava/lang/Thread;

    .line 157
    .line 158
    new-instance v4, Lcn/shuzilm/core/dl$4;

    .line 159
    .line 160
    invoke-direct {v4, p0, v1}, Lcn/shuzilm/core/dl$4;-><init>(ILjava/util/concurrent/CountDownLatch;)V

    .line 161
    .line 162
    .line 163
    invoke-direct {v3, v4}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 164
    .line 165
    .line 166
    invoke-virtual {v3}, Ljava/lang/Thread;->start()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_0
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 167
    .line 168
    .line 169
    goto :goto_2

    .line 170
    :catch_0
    :try_start_8
    invoke-virtual {v1}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 171
    .line 172
    .line 173
    goto :goto_2

    .line 174
    :cond_8
    sget-object p0, Lcn/shuzilm/core/dl;->b:Landroid/content/Context;

    .line 175
    .line 176
    const/16 v3, 0xcb

    .line 177
    .line 178
    invoke-static {p0, v3, v5}, Lcn/shuzilm/core/DUHelper;->c(Landroid/content/Context;ILjava/lang/String;)Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    invoke-virtual {v1}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 182
    .line 183
    .line 184
    :goto_2
    sget-object p0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 185
    .line 186
    const-wide/16 v3, 0x7d0

    .line 187
    .line 188
    invoke-virtual {v1, v3, v4, p0}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 189
    .line 190
    .line 191
    if-eqz v2, :cond_9

    .line 192
    .line 193
    if-eqz v7, :cond_9

    .line 194
    .line 195
    :try_start_9
    invoke-virtual {v2, v7}, Landroid/net/ConnectivityManager;->unregisterNetworkCallback(Landroid/net/ConnectivityManager$NetworkCallback;)V

    .line 196
    .line 197
    .line 198
    :cond_9
    if-eqz v2, :cond_b

    .line 199
    .line 200
    if-eqz v0, :cond_b

    .line 201
    .line 202
    goto :goto_6

    .line 203
    :catchall_1
    move-object p0, v0

    .line 204
    :goto_3
    move-object v0, v2

    .line 205
    goto :goto_4

    .line 206
    :catchall_2
    move-object p0, v0

    .line 207
    move-object v7, p0

    .line 208
    goto :goto_3

    .line 209
    :catchall_3
    move-object p0, v0

    .line 210
    move-object v7, p0

    .line 211
    :goto_4
    move-object v2, v0

    .line 212
    move-object v0, p0

    .line 213
    :catchall_4
    :goto_5
    if-eqz v2, :cond_a

    .line 214
    .line 215
    if-eqz v7, :cond_a

    .line 216
    .line 217
    invoke-virtual {v2, v7}, Landroid/net/ConnectivityManager;->unregisterNetworkCallback(Landroid/net/ConnectivityManager$NetworkCallback;)V

    .line 218
    .line 219
    .line 220
    :cond_a
    if-eqz v2, :cond_b

    .line 221
    .line 222
    if-eqz v0, :cond_b

    .line 223
    .line 224
    :goto_6
    invoke-virtual {v2, v0}, Landroid/net/ConnectivityManager;->unregisterNetworkCallback(Landroid/net/ConnectivityManager$NetworkCallback;)V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_1

    .line 225
    .line 226
    .line 227
    :catch_1
    :cond_b
    :goto_7
    return-void
.end method

.method public static synthetic d()I
    .locals 2

    .line 121
    sget v0, Lcn/shuzilm/core/dl;->m:I

    add-int/lit8 v1, v0, 0x1

    sput v1, Lcn/shuzilm/core/dl;->m:I

    return v0
.end method

.method private static d(Landroid/net/Network;Ljava/lang/String;I)Ljava/lang/String;
    .locals 2

    .line 1
    sget-object p2, Lcn/shuzilm/core/dl;->x:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter p2

    .line 4
    const/4 v0, 0x0

    .line 5
    if-eqz p1, :cond_7

    .line 6
    .line 7
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 8
    .line 9
    .line 10
    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    goto/16 :goto_5

    .line 14
    .line 15
    :cond_0
    if-eqz p0, :cond_1

    .line 16
    .line 17
    :try_start_1
    new-instance v1, Ljava/net/URL;

    .line 18
    .line 19
    invoke-direct {v1, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v1}, Landroid/net/Network;->openConnection(Ljava/net/URL;)Ljava/net/URLConnection;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    goto :goto_0

    .line 27
    :cond_1
    new-instance p0, Ljava/net/URL;

    .line 28
    .line 29
    invoke-direct {p0, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    check-cast p0, Ljava/net/HttpURLConnection;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 37
    .line 38
    :goto_0
    if-nez p0, :cond_2

    .line 39
    .line 40
    :try_start_2
    monitor-exit p2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 41
    return-object v0

    .line 42
    :catchall_0
    move-exception p0

    .line 43
    goto :goto_6

    .line 44
    :cond_2
    const/16 p1, 0x1388

    .line 45
    .line 46
    :try_start_3
    invoke-virtual {p0, p1}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0, p1}, Ljava/net/URLConnection;->setReadTimeout(I)V

    .line 50
    .line 51
    .line 52
    const/4 p1, 0x1

    .line 53
    invoke-virtual {p0, p1}, Ljava/net/URLConnection;->setDoInput(Z)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0}, Ljava/net/URLConnection;->connect()V

    .line 57
    .line 58
    .line 59
    move-object p1, p0

    .line 60
    check-cast p1, Ljava/net/HttpURLConnection;

    .line 61
    .line 62
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    const/16 v1, 0xc8

    .line 67
    .line 68
    if-ne p1, v1, :cond_3

    .line 69
    .line 70
    invoke-virtual {p0}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    .line 71
    .line 72
    .line 73
    move-result-object p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 74
    :try_start_4
    invoke-static {p0}, Lcn/shuzilm/core/u;->a(Ljava/io/InputStream;)[B

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    new-instance v1, Ljava/lang/String;

    .line 79
    .line 80
    invoke-direct {v1, p1}, Ljava/lang/String;-><init>([B)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 81
    .line 82
    .line 83
    move-object v0, p0

    .line 84
    goto :goto_1

    .line 85
    :cond_3
    move-object v1, v0

    .line 86
    :goto_1
    if-eqz v0, :cond_4

    .line 87
    .line 88
    goto :goto_3

    .line 89
    :catch_0
    :cond_4
    :goto_2
    move-object v0, v1

    .line 90
    goto :goto_4

    .line 91
    :catchall_1
    move-object p0, v0

    .line 92
    :catchall_2
    :try_start_5
    const-string p1, "shuzilm"

    .line 93
    .line 94
    const-string v1, "[20007] network connect error."

    .line 95
    .line 96
    invoke-static {p1, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 97
    .line 98
    .line 99
    if-eqz p0, :cond_5

    .line 100
    .line 101
    move-object v1, v0

    .line 102
    move-object v0, p0

    .line 103
    :goto_3
    :try_start_6
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 104
    .line 105
    .line 106
    goto :goto_2

    .line 107
    :cond_5
    :goto_4
    :try_start_7
    monitor-exit p2
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 108
    return-object v0

    .line 109
    :catchall_3
    move-exception p1

    .line 110
    if-eqz p0, :cond_6

    .line 111
    .line 112
    :try_start_8
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_1
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 113
    .line 114
    .line 115
    :catch_1
    :cond_6
    :try_start_9
    throw p1

    .line 116
    :cond_7
    :goto_5
    monitor-exit p2

    .line 117
    return-object v0

    .line 118
    :goto_6
    monitor-exit p2
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 119
    throw p0
.end method

.method private static declared-synchronized d(I)V
    .locals 3

    const-class v0, Lcn/shuzilm/core/dl;

    monitor-enter v0

    .line 122
    :try_start_0
    sget-object v1, Lcn/shuzilm/core/dl;->b:Landroid/content/Context;

    const-string v2, "android.permission.CHANGE_NETWORK_STATE"

    invoke-static {v1, v2}, Lcn/shuzilm/core/u;->a(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    monitor-exit v0

    return-void

    .line 123
    :cond_0
    :try_start_1
    invoke-static {}, Lcn/shuzilm/core/dl;->t()V

    .line 124
    invoke-static {p0}, Lcn/shuzilm/core/dl;->c(I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p0
.end method

.method public static d(Landroid/content/Context;Ljava/lang/String;Z)V
    .locals 0

    .line 125
    sget p1, Lcn/shuzilm/core/dl;->a:I

    if-lez p1, :cond_0

    goto :goto_0

    .line 126
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    sput-object p0, Lcn/shuzilm/core/dl;->b:Landroid/content/Context;

    if-nez p0, :cond_1

    :goto_0
    return-void

    .line 127
    :cond_1
    new-instance p0, Ljava/lang/Thread;

    new-instance p1, Lcn/shuzilm/core/dl$5;

    invoke-direct {p1, p2}, Lcn/shuzilm/core/dl$5;-><init>(Z)V

    invoke-direct {p0, p1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 128
    invoke-virtual {p0}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 129
    :catchall_0
    sget p0, Lcn/shuzilm/core/dl;->a:I

    add-int/lit8 p0, p0, 0x1

    sput p0, Lcn/shuzilm/core/dl;->a:I

    return-void
.end method

.method public static synthetic d(Ljava/lang/String;)V
    .locals 0

    .line 120
    invoke-static {p0}, Lcn/shuzilm/core/dl;->e(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic e()Landroid/net/nsd/NsdManager;
    .locals 1

    .line 69
    sget-object v0, Lcn/shuzilm/core/dl;->c:Landroid/net/nsd/NsdManager;

    return-object v0
.end method

.method private static e(Ljava/lang/String;)V
    .locals 3

    .line 1
    const-string v0, "_service"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :try_start_0
    sput v1, Lcn/shuzilm/core/dl;->m:I

    .line 5
    .line 6
    const-string v1, "TV^geaVn#TiXe#"

    .line 7
    .line 8
    invoke-static {v1}, Lcn/shuzilm/core/dl;->f(Ljava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    sput-object v1, Lcn/shuzilm/core/dl;->l:Ljava/lang/String;

    .line 13
    .line 14
    sget-object v1, Lcn/shuzilm/core/dl;->e:Lorg/json/JSONObject;

    .line 15
    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    invoke-virtual {v1}, Lorg/json/JSONObject;->length()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-gtz v1, :cond_1

    .line 23
    .line 24
    sget-object v1, Lcn/shuzilm/core/dl;->d:Ljava/util/LinkedList;

    .line 25
    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-lez v1, :cond_0

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    sget-object v1, Lcn/shuzilm/core/dl;->b:Landroid/content/Context;

    .line 36
    .line 37
    const-string v2, "servicediscovery"

    .line 38
    .line 39
    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    check-cast v1, Landroid/net/nsd/NsdManager;

    .line 44
    .line 45
    sput-object v1, Lcn/shuzilm/core/dl;->c:Landroid/net/nsd/NsdManager;

    .line 46
    .line 47
    new-instance v1, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    const-string p0, "."

    .line 56
    .line 57
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    const/4 v0, 0x1

    .line 65
    invoke-static {p0, v0}, Lcn/shuzilm/core/dl;->a(Ljava/lang/String;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 66
    .line 67
    .line 68
    :catchall_0
    :cond_1
    :goto_0
    return-void
.end method

.method private static f(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    array-length v0, p0

    .line 10
    const/4 v1, 0x0

    .line 11
    :goto_0
    if-ge v1, v0, :cond_1

    .line 12
    .line 13
    aget-byte v2, p0, v1

    .line 14
    .line 15
    add-int/lit8 v2, v2, 0xb

    .line 16
    .line 17
    int-to-byte v2, v2

    .line 18
    aput-byte v2, p0, v1

    .line 19
    .line 20
    add-int/lit8 v1, v1, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    new-instance v0, Ljava/lang/String;

    .line 24
    .line 25
    invoke-direct {v0, p0}, Ljava/lang/String;-><init>([B)V

    .line 26
    .line 27
    .line 28
    return-object v0
.end method

.method public static synthetic f()Ljava/util/Timer;
    .locals 1

    .line 29
    sget-object v0, Lcn/shuzilm/core/dl;->g:Ljava/util/Timer;

    return-object v0
.end method

.method public static synthetic g()Landroid/content/Context;
    .locals 1

    .line 1
    sget-object v0, Lcn/shuzilm/core/dl;->b:Landroid/content/Context;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic h()V
    .locals 0

    .line 1
    invoke-static {}, Lcn/shuzilm/core/dl;->q()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i()I
    .locals 1

    .line 1
    invoke-static {}, Lcn/shuzilm/core/dl;->r()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    return v0
.end method

.method public static declared-synchronized ia(Landroid/content/Context;)V
    .locals 2

    .line 1
    const-class v0, Lcn/shuzilm/core/dl;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sput-object p0, Lcn/shuzilm/core/dl;->b:Landroid/content/Context;

    .line 5
    .line 6
    sget p0, Lcn/shuzilm/core/dl;->o:I

    .line 7
    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    sput p0, Lcn/shuzilm/core/dl;->q:I

    .line 12
    .line 13
    const-string p0, ""

    .line 14
    .line 15
    sput-object p0, Lcn/shuzilm/core/dl;->n:Ljava/lang/String;

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_1

    .line 20
    :cond_0
    :goto_0
    const/4 p0, 0x1

    .line 21
    invoke-static {p0}, Lcn/shuzilm/core/dl;->d(I)V

    .line 22
    .line 23
    .line 24
    sget v1, Lcn/shuzilm/core/dl;->o:I

    .line 25
    .line 26
    add-int/2addr v1, p0

    .line 27
    sput v1, Lcn/shuzilm/core/dl;->o:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    .line 29
    monitor-exit v0

    .line 30
    return-void

    .line 31
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 32
    throw p0
.end method

.method public static synthetic j()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcn/shuzilm/core/dl;->t:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic k()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcn/shuzilm/core/dl;->u:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic l()V
    .locals 0

    .line 1
    invoke-static {}, Lcn/shuzilm/core/dl;->o()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static m()I
    .locals 3

    .line 1
    sget-object v0, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v1, Ljava/util/Random;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/util/Random;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v1}, Ljava/util/Random;->nextInt()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    new-instance v2, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    rem-int/lit16 v0, v0, 0xe3

    .line 36
    .line 37
    if-gez v0, :cond_0

    .line 38
    .line 39
    neg-int v0, v0

    .line 40
    :cond_0
    add-int/lit8 v0, v0, 0x1d

    .line 41
    .line 42
    return v0
.end method

.method private static n()V
    .locals 0

    return-void
.end method

.method private static o()V
    .locals 2

    .line 1
    sget-object v0, Lcn/shuzilm/core/dl;->b:Landroid/content/Context;

    .line 2
    .line 3
    sget-object v1, Lcn/shuzilm/core/dl;->e:Lorg/json/JSONObject;

    .line 4
    .line 5
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {v0, v1}, Lcn/shuzilm/core/DUHelper;->bm(Landroid/content/Context;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private static p()Ljava/lang/String;
    .locals 8

    .line 1
    const-string v0, "."

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    :try_start_0
    sget-object v2, Lcn/shuzilm/core/dl;->b:Landroid/content/Context;

    .line 6
    .line 7
    const-string v3, "connectivity"

    .line 8
    .line 9
    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    check-cast v2, Landroid/net/ConnectivityManager;

    .line 14
    .line 15
    invoke-virtual {v2}, Landroid/net/ConnectivityManager;->getActiveNetwork()Landroid/net/Network;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    invoke-virtual {v2, v3}, Landroid/net/ConnectivityManager;->getLinkProperties(Landroid/net/Network;)Landroid/net/LinkProperties;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    if-nez v2, :cond_0

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_0
    invoke-virtual {v2}, Landroid/net/LinkProperties;->getInterfaceName()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    if-eqz v3, :cond_2

    .line 31
    .line 32
    const-string v4, "wlan"

    .line 33
    .line 34
    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    if-eqz v3, :cond_2

    .line 39
    .line 40
    invoke-virtual {v2}, Landroid/net/LinkProperties;->getLinkAddresses()Ljava/util/List;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    const/4 v4, 0x0

    .line 49
    move v5, v4

    .line 50
    :goto_0
    if-ge v5, v3, :cond_2

    .line 51
    .line 52
    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v6

    .line 56
    check-cast v6, Landroid/net/LinkAddress;

    .line 57
    .line 58
    invoke-virtual {v6}, Landroid/net/LinkAddress;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v6

    .line 62
    if-eqz v6, :cond_1

    .line 63
    .line 64
    invoke-virtual {v6, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 65
    .line 66
    .line 67
    move-result v7

    .line 68
    if-eqz v7, :cond_1

    .line 69
    .line 70
    const-string v7, ":"

    .line 71
    .line 72
    invoke-virtual {v6, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 73
    .line 74
    .line 75
    move-result v7

    .line 76
    if-nez v7, :cond_1

    .line 77
    .line 78
    invoke-virtual {v6, v0}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    .line 79
    .line 80
    .line 81
    move-result v7

    .line 82
    add-int/lit8 v7, v7, 0x1

    .line 83
    .line 84
    invoke-virtual {v6, v4, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 88
    :cond_1
    add-int/lit8 v5, v5, 0x1

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :catchall_0
    :cond_2
    :goto_1
    return-object v1
.end method

.method private static q()V
    .locals 7

    .line 1
    invoke-static {}, Lcn/shuzilm/core/dl;->m()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    :try_start_0
    sget-object v1, Lcn/shuzilm/core/dl;->b:Landroid/content/Context;

    .line 6
    .line 7
    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    sget-object v2, Lcn/shuzilm/core/dl;->b:Landroid/content/Context;

    .line 12
    .line 13
    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    const/4 v3, 0x0

    .line 18
    invoke-virtual {v1, v2, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iget-wide v1, v1, Landroid/content/pm/PackageInfo;->lastUpdateTime:J

    .line 23
    .line 24
    const-wide/16 v3, 0x3e8

    .line 25
    .line 26
    div-long/2addr v1, v3

    .line 27
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 28
    .line 29
    .line 30
    move-result-wide v5

    .line 31
    div-long/2addr v5, v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    sub-long/2addr v5, v1

    .line 33
    const-wide/32 v1, 0x186a0

    .line 34
    .line 35
    .line 36
    cmp-long v1, v5, v1

    .line 37
    .line 38
    if-gez v1, :cond_0

    .line 39
    .line 40
    const/4 v0, 0x2

    .line 41
    :catchall_0
    :cond_0
    :try_start_1
    invoke-static {}, Lcn/shuzilm/core/dl;->p()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 45
    const-string v2, ""

    .line 46
    .line 47
    const-string v3, "."

    .line 48
    .line 49
    if-eqz v1, :cond_1

    .line 50
    .line 51
    if-eq v1, v2, :cond_2

    .line 52
    .line 53
    :cond_1
    :try_start_2
    sget-object v4, Lcn/shuzilm/core/dl;->b:Landroid/content/Context;

    .line 54
    .line 55
    invoke-static {v4}, Lcn/shuzilm/core/u;->b(Landroid/content/Context;)I

    .line 56
    .line 57
    .line 58
    move-result v4

    .line 59
    if-eqz v4, :cond_2

    .line 60
    .line 61
    and-int/lit16 v1, v4, 0xff

    .line 62
    .line 63
    shr-int/lit8 v5, v4, 0x8

    .line 64
    .line 65
    and-int/lit16 v5, v5, 0xff

    .line 66
    .line 67
    shr-int/lit8 v4, v4, 0x10

    .line 68
    .line 69
    and-int/lit16 v4, v4, 0xff

    .line 70
    .line 71
    new-instance v6, Ljava/lang/StringBuilder;

    .line 72
    .line 73
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    :cond_2
    if-eqz v1, :cond_3

    .line 99
    .line 100
    if-eq v1, v2, :cond_3

    .line 101
    .line 102
    invoke-virtual {v1, v3}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    .line 103
    .line 104
    .line 105
    move-result v2

    .line 106
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 107
    .line 108
    .line 109
    move-result v3

    .line 110
    const/4 v4, 0x1

    .line 111
    sub-int/2addr v3, v4

    .line 112
    if-ne v2, v3, :cond_3

    .line 113
    .line 114
    :goto_0
    if-ge v4, v0, :cond_3

    .line 115
    .line 116
    new-instance v2, Ljava/lang/StringBuilder;

    .line 117
    .line 118
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 119
    .line 120
    .line 121
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v3

    .line 128
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    invoke-static {v2}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    .line 136
    .line 137
    .line 138
    move-result-object v2

    .line 139
    const/16 v3, 0x3c

    .line 140
    .line 141
    invoke-virtual {v2, v3}, Ljava/net/InetAddress;->isReachable(I)Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 142
    .line 143
    .line 144
    add-int/lit8 v4, v4, 0x1

    .line 145
    .line 146
    goto :goto_0

    .line 147
    :catch_0
    :cond_3
    return-void
.end method

.method private static r()I
    .locals 9

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    sget v1, Lcn/shuzilm/core/DUHelper;->mPopu:I

    .line 3
    .line 4
    const/16 v2, 0x2711

    .line 5
    .line 6
    if-ne v1, v2, :cond_0

    .line 7
    .line 8
    const/4 v0, -0x6

    .line 9
    return v0

    .line 10
    :cond_0
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 11
    .line 12
    const/16 v2, 0x1c

    .line 13
    .line 14
    const/4 v3, -0x1

    .line 15
    if-ge v1, v2, :cond_1

    .line 16
    .line 17
    return v3

    .line 18
    :cond_1
    sget-object v2, Lcn/shuzilm/core/dl;->b:Landroid/content/Context;

    .line 19
    .line 20
    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    sget-object v4, Lcn/shuzilm/core/dl;->b:Landroid/content/Context;

    .line 25
    .line 26
    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v4

    .line 30
    const-string v5, "android.permission.ACCESS_FINE_LOCATION"

    .line 31
    .line 32
    invoke-virtual {v2, v5, v4}, Landroid/content/pm/PackageManager;->checkPermission(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    move-result v5

    .line 36
    const-string v6, "android.permission.CHANGE_WIFI_STATE"

    .line 37
    .line 38
    invoke-virtual {v2, v6, v4}, Landroid/content/pm/PackageManager;->checkPermission(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    move-result v6

    .line 42
    const-string v7, "android.permission.ACCESS_WIFI_STATE"

    .line 43
    .line 44
    invoke-virtual {v2, v7, v4}, Landroid/content/pm/PackageManager;->checkPermission(Ljava/lang/String;Ljava/lang/String;)I

    .line 45
    .line 46
    .line 47
    move-result v7

    .line 48
    const/4 v8, -0x2

    .line 49
    if-nez v5, :cond_d

    .line 50
    .line 51
    if-nez v6, :cond_d

    .line 52
    .line 53
    if-eqz v7, :cond_2

    .line 54
    .line 55
    goto/16 :goto_1

    .line 56
    .line 57
    :cond_2
    const/16 v5, 0x20

    .line 58
    .line 59
    if-le v1, v5, :cond_3

    .line 60
    .line 61
    const-string v1, "android.permission.NEARBY_WIFI_DEVICES"

    .line 62
    .line 63
    invoke-virtual {v2, v1, v4}, Landroid/content/pm/PackageManager;->checkPermission(Ljava/lang/String;Ljava/lang/String;)I

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    if-eqz v1, :cond_3

    .line 68
    .line 69
    return v8

    .line 70
    :cond_3
    invoke-static {}, Ll/oyq0;->a()I

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    if-gtz v1, :cond_4

    .line 75
    .line 76
    return v3

    .line 77
    :cond_4
    const/4 v2, 0x2

    .line 78
    if-le v1, v2, :cond_5

    .line 79
    .line 80
    add-int/lit8 v1, v1, -0x1

    .line 81
    .line 82
    :cond_5
    sget-object v2, Lcn/shuzilm/core/dl;->b:Landroid/content/Context;

    .line 83
    .line 84
    const-string v3, "wifirtt"

    .line 85
    .line 86
    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    invoke-static {v2}, Ll/pyq0;->a(Ljava/lang/Object;)Landroid/net/wifi/rtt/WifiRttManager;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    invoke-static {v2}, Ll/qyq0;->a(Landroid/net/wifi/rtt/WifiRttManager;)Z

    .line 95
    .line 96
    .line 97
    move-result v3

    .line 98
    const/4 v4, -0x3

    .line 99
    if-nez v3, :cond_6

    .line 100
    .line 101
    return v4

    .line 102
    :cond_6
    sget-object v3, Lcn/shuzilm/core/dl;->b:Landroid/content/Context;

    .line 103
    .line 104
    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    const-string v5, "android.hardware.wifi.rtt"

    .line 109
    .line 110
    invoke-virtual {v3, v5}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    .line 111
    .line 112
    .line 113
    move-result v3

    .line 114
    if-nez v3, :cond_7

    .line 115
    .line 116
    return v4

    .line 117
    :cond_7
    sget-object v3, Lcn/shuzilm/core/dl;->b:Landroid/content/Context;

    .line 118
    .line 119
    const-string v5, "wifi"

    .line 120
    .line 121
    invoke-virtual {v3, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object v3

    .line 125
    check-cast v3, Landroid/net/wifi/WifiManager;

    .line 126
    .line 127
    invoke-virtual {v3}, Landroid/net/wifi/WifiManager;->getWifiState()I

    .line 128
    .line 129
    .line 130
    move-result v5

    .line 131
    const/4 v6, 0x3

    .line 132
    if-eq v5, v6, :cond_8

    .line 133
    .line 134
    return v4

    .line 135
    :cond_8
    invoke-static {}, Ll/wyq0;->a()V

    .line 136
    .line 137
    .line 138
    invoke-static {}, Ll/vyq0;->a()Landroid/net/wifi/rtt/RangingRequest$Builder;

    .line 139
    .line 140
    .line 141
    move-result-object v4

    .line 142
    invoke-virtual {v3}, Landroid/net/wifi/WifiManager;->getScanResults()Ljava/util/List;

    .line 143
    .line 144
    .line 145
    move-result-object v3

    .line 146
    const/4 v5, -0x4

    .line 147
    if-nez v3, :cond_9

    .line 148
    .line 149
    return v5

    .line 150
    :cond_9
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 151
    .line 152
    .line 153
    move-result v6

    .line 154
    if-gtz v6, :cond_a

    .line 155
    .line 156
    return v5

    .line 157
    :cond_a
    if-ge v6, v1, :cond_b

    .line 158
    .line 159
    move v1, v6

    .line 160
    :cond_b
    move v5, v0

    .line 161
    :goto_0
    if-ge v5, v1, :cond_c

    .line 162
    .line 163
    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 164
    .line 165
    .line 166
    move-result-object v6

    .line 167
    check-cast v6, Landroid/net/wifi/ScanResult;

    .line 168
    .line 169
    invoke-static {v4, v6}, Ll/ryq0;->a(Landroid/net/wifi/rtt/RangingRequest$Builder;Landroid/net/wifi/ScanResult;)Landroid/net/wifi/rtt/RangingRequest$Builder;

    .line 170
    .line 171
    .line 172
    add-int/lit8 v5, v5, 0x1

    .line 173
    .line 174
    goto :goto_0

    .line 175
    :cond_c
    invoke-static {v4}, Ll/syq0;->a(Landroid/net/wifi/rtt/RangingRequest$Builder;)Landroid/net/wifi/rtt/RangingRequest;

    .line 176
    .line 177
    .line 178
    move-result-object v1

    .line 179
    sget-object v3, Lcn/shuzilm/core/dl;->b:Landroid/content/Context;

    .line 180
    .line 181
    invoke-static {v3}, Ll/tyq0;->a(Landroid/content/Context;)Ljava/util/concurrent/Executor;

    .line 182
    .line 183
    .line 184
    move-result-object v3

    .line 185
    new-instance v4, Lcn/shuzilm/core/dl$1;

    .line 186
    .line 187
    invoke-direct {v4}, Lcn/shuzilm/core/dl$1;-><init>()V

    .line 188
    .line 189
    .line 190
    invoke-static {v2, v1, v3, v4}, Ll/uyq0;->a(Landroid/net/wifi/rtt/WifiRttManager;Landroid/net/wifi/rtt/RangingRequest;Ljava/util/concurrent/Executor;Landroid/net/wifi/rtt/RangingResultCallback;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 191
    .line 192
    .line 193
    goto :goto_2

    .line 194
    :cond_d
    :goto_1
    return v8

    .line 195
    :catchall_0
    :goto_2
    return v0
.end method

.method private static s()Z
    .locals 5

    .line 1
    const/4 v0, 0x1

    .line 2
    :try_start_0
    sget-object v1, Lcn/shuzilm/core/dl;->b:Landroid/content/Context;

    .line 3
    .line 4
    const-string v2, "connectivity"

    .line 5
    .line 6
    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    check-cast v1, Landroid/net/ConnectivityManager;

    .line 11
    .line 12
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    const-string v3, "getMobileDataEnabled"

    .line 25
    .line 26
    const/4 v4, 0x0

    .line 27
    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v2, v0}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v2, v1, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    check-cast v1, Ljava/lang/Boolean;

    .line 39
    .line 40
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 41
    .line 42
    .line 43
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 44
    :catchall_0
    return v0
.end method

.method private static t()V
    .locals 9

    .line 1
    const-string v0, "0"

    .line 2
    .line 3
    sget-object v1, Lcn/shuzilm/core/dl;->b:Landroid/content/Context;

    .line 4
    .line 5
    const-string v2, "phone"

    .line 6
    .line 7
    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 12
    .line 13
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getSimOperator()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    if-nez v2, :cond_0

    .line 18
    .line 19
    const-string v2, ""

    .line 20
    .line 21
    :cond_0
    const/4 v3, 0x1

    .line 22
    const/4 v4, 0x0

    .line 23
    :try_start_0
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getSimState()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    const/4 v5, 0x5

    .line 28
    if-ne v1, v5, :cond_1

    .line 29
    .line 30
    invoke-static {}, Lcn/shuzilm/core/dl;->s()Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    sput v4, Lcn/shuzilm/core/dl;->r:I

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    sput v3, Lcn/shuzilm/core/dl;->r:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    .line 41
    :catch_0
    :goto_0
    sget-object v1, Lcn/shuzilm/core/dl;->b:Landroid/content/Context;

    .line 42
    .line 43
    invoke-static {v1}, Lcn/shuzilm/core/u;->b(Landroid/content/Context;)I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_2

    .line 48
    .line 49
    sput v4, Lcn/shuzilm/core/dl;->s:I

    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_2
    sput v3, Lcn/shuzilm/core/dl;->s:I

    .line 53
    .line 54
    :goto_1
    :try_start_1
    sget-object v5, Lcn/shuzilm/core/dl;->b:Landroid/content/Context;

    .line 55
    .line 56
    const-string v6, "connectivity"

    .line 57
    .line 58
    invoke-virtual {v5, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v5

    .line 62
    check-cast v5, Landroid/net/ConnectivityManager;

    .line 63
    .line 64
    invoke-virtual {v5}, Landroid/net/ConnectivityManager;->getActiveNetwork()Landroid/net/Network;

    .line 65
    .line 66
    .line 67
    move-result-object v6

    .line 68
    if-nez v6, :cond_3

    .line 69
    .line 70
    sput v3, Lcn/shuzilm/core/dl;->q:I

    .line 71
    .line 72
    sput-object v0, Lcn/shuzilm/core/dl;->t:Ljava/lang/String;

    .line 73
    .line 74
    sput-object v0, Lcn/shuzilm/core/dl;->u:Ljava/lang/String;

    .line 75
    .line 76
    sget-object v3, Lcn/shuzilm/core/dl;->b:Landroid/content/Context;

    .line 77
    .line 78
    const/16 v5, 0xc9

    .line 79
    .line 80
    invoke-static {v3, v5, v0}, Lcn/shuzilm/core/DUHelper;->c(Landroid/content/Context;ILjava/lang/String;)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    sget-object v3, Lcn/shuzilm/core/dl;->b:Landroid/content/Context;

    .line 84
    .line 85
    const/16 v5, 0xca

    .line 86
    .line 87
    invoke-static {v3, v5, v0}, Lcn/shuzilm/core/DUHelper;->c(Landroid/content/Context;ILjava/lang/String;)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    goto :goto_2

    .line 91
    :catchall_0
    move-exception v0

    .line 92
    goto/16 :goto_7

    .line 93
    .line 94
    :cond_3
    invoke-virtual {v5, v6}, Landroid/net/ConnectivityManager;->getLinkProperties(Landroid/net/Network;)Landroid/net/LinkProperties;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    if-nez v0, :cond_4

    .line 99
    .line 100
    :goto_2
    return-void

    .line 101
    :cond_4
    invoke-virtual {v0}, Landroid/net/LinkProperties;->getLinkAddresses()Ljava/util/List;

    .line 102
    .line 103
    .line 104
    move-result-object v5

    .line 105
    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    .line 106
    .line 107
    .line 108
    move-result v6

    .line 109
    if-nez v6, :cond_9

    .line 110
    .line 111
    new-instance v6, Ljava/lang/StringBuilder;

    .line 112
    .line 113
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 114
    .line 115
    .line 116
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 117
    .line 118
    .line 119
    move-result-object v5

    .line 120
    :cond_5
    :goto_3
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 121
    .line 122
    .line 123
    move-result v7

    .line 124
    if-eqz v7, :cond_7

    .line 125
    .line 126
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object v7

    .line 130
    check-cast v7, Landroid/net/LinkAddress;

    .line 131
    .line 132
    invoke-virtual {v7}, Landroid/net/LinkAddress;->getAddress()Ljava/net/InetAddress;

    .line 133
    .line 134
    .line 135
    move-result-object v7

    .line 136
    invoke-virtual {v7}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v7

    .line 140
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    sget-object v8, Lcn/shuzilm/core/dl;->n:Ljava/lang/String;

    .line 144
    .line 145
    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z

    .line 146
    .line 147
    .line 148
    move-result v8

    .line 149
    if-eqz v8, :cond_6

    .line 150
    .line 151
    goto :goto_3

    .line 152
    :cond_6
    sget-object v8, Lcn/shuzilm/core/dl;->n:Ljava/lang/String;

    .line 153
    .line 154
    invoke-virtual {v8, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 155
    .line 156
    .line 157
    move-result v7

    .line 158
    if-eqz v7, :cond_5

    .line 159
    .line 160
    sput v3, Lcn/shuzilm/core/dl;->q:I

    .line 161
    .line 162
    move v5, v3

    .line 163
    goto :goto_4

    .line 164
    :cond_7
    move v5, v4

    .line 165
    :goto_4
    sget-object v7, Lcn/shuzilm/core/dl;->n:Ljava/lang/String;

    .line 166
    .line 167
    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    .line 168
    .line 169
    .line 170
    move-result v7

    .line 171
    if-eqz v7, :cond_8

    .line 172
    .line 173
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object v7

    .line 177
    sput-object v7, Lcn/shuzilm/core/dl;->n:Ljava/lang/String;

    .line 178
    .line 179
    sput v4, Lcn/shuzilm/core/dl;->q:I

    .line 180
    .line 181
    :cond_8
    if-nez v5, :cond_a

    .line 182
    .line 183
    sget-object v5, Lcn/shuzilm/core/dl;->n:Ljava/lang/String;

    .line 184
    .line 185
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    .line 186
    .line 187
    .line 188
    move-result v5

    .line 189
    if-nez v5, :cond_a

    .line 190
    .line 191
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object v5

    .line 195
    sput-object v5, Lcn/shuzilm/core/dl;->n:Ljava/lang/String;

    .line 196
    .line 197
    sput v4, Lcn/shuzilm/core/dl;->q:I

    .line 198
    .line 199
    goto :goto_5

    .line 200
    :cond_9
    sput v3, Lcn/shuzilm/core/dl;->q:I

    .line 201
    .line 202
    :cond_a
    :goto_5
    invoke-virtual {v0}, Landroid/net/LinkProperties;->getHttpProxy()Landroid/net/ProxyInfo;

    .line 203
    .line 204
    .line 205
    move-result-object v5

    .line 206
    if-eqz v5, :cond_c

    .line 207
    .line 208
    invoke-virtual {v5}, Landroid/net/ProxyInfo;->getHost()Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v5

    .line 212
    if-eqz v5, :cond_b

    .line 213
    .line 214
    sput v4, Lcn/shuzilm/core/dl;->p:I

    .line 215
    .line 216
    goto :goto_6

    .line 217
    :cond_b
    sput v3, Lcn/shuzilm/core/dl;->p:I

    .line 218
    .line 219
    goto :goto_6

    .line 220
    :cond_c
    sput v3, Lcn/shuzilm/core/dl;->p:I

    .line 221
    .line 222
    :goto_6
    invoke-virtual {v0}, Landroid/net/LinkProperties;->getInterfaceName()Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object v0

    .line 226
    if-eqz v0, :cond_e

    .line 227
    .line 228
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 229
    .line 230
    .line 231
    move-result v3

    .line 232
    if-nez v3, :cond_e

    .line 233
    .line 234
    const-string v3, "tun"

    .line 235
    .line 236
    invoke-virtual {v0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 237
    .line 238
    .line 239
    move-result v3

    .line 240
    if-nez v3, :cond_d

    .line 241
    .line 242
    const-string v3, "ppp"

    .line 243
    .line 244
    invoke-virtual {v0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 245
    .line 246
    .line 247
    move-result v0

    .line 248
    if-eqz v0, :cond_e

    .line 249
    .line 250
    :cond_d
    sput v4, Lcn/shuzilm/core/dl;->p:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 251
    .line 252
    goto :goto_8

    .line 253
    :goto_7
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 254
    .line 255
    .line 256
    :cond_e
    :goto_8
    sget-object v0, Lcn/shuzilm/core/dl;->w:Ljava/lang/String;

    .line 257
    .line 258
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 259
    .line 260
    .line 261
    move-result v0

    .line 262
    if-nez v0, :cond_10

    .line 263
    .line 264
    sget-object v0, Lcn/shuzilm/core/dl;->w:Ljava/lang/String;

    .line 265
    .line 266
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 267
    .line 268
    .line 269
    move-result v0

    .line 270
    if-eqz v0, :cond_f

    .line 271
    .line 272
    sget-object v0, Lcn/shuzilm/core/dl;->t:Ljava/lang/String;

    .line 273
    .line 274
    if-nez v0, :cond_10

    .line 275
    .line 276
    :cond_f
    sput v4, Lcn/shuzilm/core/dl;->q:I

    .line 277
    .line 278
    :cond_10
    sput-object v2, Lcn/shuzilm/core/dl;->w:Ljava/lang/String;

    .line 279
    .line 280
    sget v0, Lcn/shuzilm/core/dl;->v:I

    .line 281
    .line 282
    if-eqz v0, :cond_12

    .line 283
    .line 284
    if-ne v0, v1, :cond_11

    .line 285
    .line 286
    sget-object v0, Lcn/shuzilm/core/dl;->u:Ljava/lang/String;

    .line 287
    .line 288
    if-nez v0, :cond_12

    .line 289
    .line 290
    :cond_11
    sput v4, Lcn/shuzilm/core/dl;->q:I

    .line 291
    .line 292
    :cond_12
    sput v1, Lcn/shuzilm/core/dl;->v:I

    .line 293
    .line 294
    return-void
.end method
