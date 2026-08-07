.class Lcn/shuzilm/core/dl$NsdDiscoverySubJson$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/net/nsd/NsdManager$DiscoveryListener;


# instance fields
.field final synthetic a:Lcn/shuzilm/core/dl$NsdDiscoverySubJson;


# direct methods
.method public constructor <init>(Lcn/shuzilm/core/dl$NsdDiscoverySubJson;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcn/shuzilm/core/dl$NsdDiscoverySubJson$1;->a:Lcn/shuzilm/core/dl$NsdDiscoverySubJson;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onDiscoveryStarted(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public onDiscoveryStopped(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public onServiceFound(Landroid/net/nsd/NsdServiceInfo;)V
    .locals 4

    .line 1
    :try_start_0
    invoke-virtual {p1}, Landroid/net/nsd/NsdServiceInfo;->getServiceName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Landroid/net/nsd/NsdServiceInfo;->getServiceType()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v2, p0, Lcn/shuzilm/core/dl$NsdDiscoverySubJson$1;->a:Lcn/shuzilm/core/dl$NsdDiscoverySubJson;

    .line 10
    .line 11
    iget v2, v2, Lcn/shuzilm/core/dl$NsdDiscoverySubJson;->b:I

    .line 12
    .line 13
    const/4 v3, 0x1

    .line 14
    if-ne v2, v3, :cond_0

    .line 15
    .line 16
    invoke-static {v0, v1}, Lcn/shuzilm/core/dl;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object p0, p0, Lcn/shuzilm/core/dl$NsdDiscoverySubJson$1;->a:Lcn/shuzilm/core/dl$NsdDiscoverySubJson;

    .line 20
    .line 21
    iget v2, p0, Lcn/shuzilm/core/dl$NsdDiscoverySubJson;->b:I

    .line 22
    .line 23
    const/4 v3, 0x2

    .line 24
    if-ne v2, v3, :cond_1

    .line 25
    .line 26
    iget-object p0, p0, Lcn/shuzilm/core/dl$NsdDiscoverySubJson;->c:Lorg/json/JSONObject;

    .line 27
    .line 28
    invoke-static {p1, v0, v1, p0}, Lcn/shuzilm/core/dl;->a(Landroid/net/nsd/NsdServiceInfo;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    .line 30
    .line 31
    :catchall_0
    :cond_1
    return-void
.end method

.method public onServiceLost(Landroid/net/nsd/NsdServiceInfo;)V
    .locals 0

    return-void
.end method

.method public onStartDiscoveryFailed(Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-static {}, Lcn/shuzilm/core/dl;->e()Landroid/net/nsd/NsdManager;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1, p0}, Lcn/shuzilm/core/dl;->a(Landroid/net/nsd/NsdManager;Landroid/net/nsd/NsdManager$DiscoveryListener;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onStopDiscoveryFailed(Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-static {}, Lcn/shuzilm/core/dl;->e()Landroid/net/nsd/NsdManager;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1, p0}, Lcn/shuzilm/core/dl;->a(Landroid/net/nsd/NsdManager;Landroid/net/nsd/NsdManager$DiscoveryListener;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
