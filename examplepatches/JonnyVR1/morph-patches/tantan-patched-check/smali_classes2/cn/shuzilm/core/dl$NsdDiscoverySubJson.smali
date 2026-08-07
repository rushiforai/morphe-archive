.class Lcn/shuzilm/core/dl$NsdDiscoverySubJson;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field a:Ljava/lang/String;

.field b:I

.field c:Lorg/json/JSONObject;


# direct methods
.method public constructor <init>(Ljava/lang/String;I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcn/shuzilm/core/dl$NsdDiscoverySubJson;->c:Lorg/json/JSONObject;

    .line 6
    .line 7
    iput-object p1, p0, Lcn/shuzilm/core/dl$NsdDiscoverySubJson;->a:Ljava/lang/String;

    .line 8
    .line 9
    iput p2, p0, Lcn/shuzilm/core/dl$NsdDiscoverySubJson;->b:I

    .line 10
    .line 11
    const/4 p1, 0x1

    .line 12
    if-eq p2, p1, :cond_0

    .line 13
    .line 14
    new-instance p1, Lorg/json/JSONObject;

    .line 15
    .line 16
    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Lcn/shuzilm/core/dl$NsdDiscoverySubJson;->c:Lorg/json/JSONObject;

    .line 20
    .line 21
    :cond_0
    return-void
.end method


# virtual methods
.method public discoverySubType()V
    .locals 6

    .line 1
    :try_start_0
    new-instance v2, Lcn/shuzilm/core/dl$NsdDiscoverySubJson$1;

    .line 2
    .line 3
    invoke-direct {v2, p0}, Lcn/shuzilm/core/dl$NsdDiscoverySubJson$1;-><init>(Lcn/shuzilm/core/dl$NsdDiscoverySubJson;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcn/shuzilm/core/dl;->e()Landroid/net/nsd/NsdManager;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object v1, p0, Lcn/shuzilm/core/dl$NsdDiscoverySubJson;->a:Ljava/lang/String;

    .line 11
    .line 12
    const/4 v3, 0x1

    .line 13
    invoke-virtual {v0, v1, v3, v2}, Landroid/net/nsd/NsdManager;->discoverServices(Ljava/lang/String;ILandroid/net/nsd/NsdManager$DiscoveryListener;)V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Lcn/shuzilm/core/dl;->f()Ljava/util/Timer;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    new-instance v0, Ljava/util/Timer;

    .line 23
    .line 24
    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-static {v0}, Lcn/shuzilm/core/dl;->a(Ljava/util/Timer;)Ljava/util/Timer;

    .line 28
    .line 29
    .line 30
    :cond_0
    new-instance v0, Lcn/shuzilm/core/dl$sd;

    .line 31
    .line 32
    invoke-static {}, Lcn/shuzilm/core/dl;->e()Landroid/net/nsd/NsdManager;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    iget v3, p0, Lcn/shuzilm/core/dl$NsdDiscoverySubJson;->b:I

    .line 37
    .line 38
    iget-object v4, p0, Lcn/shuzilm/core/dl$NsdDiscoverySubJson;->a:Ljava/lang/String;

    .line 39
    .line 40
    iget-object v5, p0, Lcn/shuzilm/core/dl$NsdDiscoverySubJson;->c:Lorg/json/JSONObject;

    .line 41
    .line 42
    invoke-direct/range {v0 .. v5}, Lcn/shuzilm/core/dl$sd;-><init>(Landroid/net/nsd/NsdManager;Landroid/net/nsd/NsdManager$DiscoveryListener;ILjava/lang/String;Lorg/json/JSONObject;)V

    .line 43
    .line 44
    .line 45
    iget p0, p0, Lcn/shuzilm/core/dl$NsdDiscoverySubJson;->b:I

    .line 46
    .line 47
    const/4 v1, 0x2

    .line 48
    if-ne p0, v1, :cond_1

    .line 49
    .line 50
    const/16 p0, 0x258

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    const/16 p0, 0x320

    .line 54
    .line 55
    :goto_0
    invoke-static {}, Lcn/shuzilm/core/dl;->f()Ljava/util/Timer;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    int-to-long v2, p0

    .line 60
    invoke-virtual {v1, v0, v2, v3}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 61
    .line 62
    .line 63
    :catchall_0
    return-void
.end method
