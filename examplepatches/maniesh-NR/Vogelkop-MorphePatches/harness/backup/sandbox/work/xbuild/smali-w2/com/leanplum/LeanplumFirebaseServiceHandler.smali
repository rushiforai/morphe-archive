.class public final Lcom/leanplum/LeanplumFirebaseServiceHandler;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private getBundle(Ljava/util/Map;)Landroid/os/Bundle;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Landroid/os/Bundle;"
        }
    .end annotation

    new-instance p0, Landroid/os/Bundle;

    invoke-direct {p0}, Landroid/os/Bundle;-><init>()V

    if-eqz p1, :cond_2b

    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_f
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2b

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0, v1, v0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_f

    :cond_2b
    return-object p0
.end method


# virtual methods
.method public onCreate(Landroid/content/Context;)V
    .registers 2

    invoke-static {p1}, Lcom/leanplum/Leanplum;->setApplicationContext(Landroid/content/Context;)V

    return-void
.end method

.method public onMessageReceived(Lrth;Landroid/content/Context;)V
    .registers 7

    :try_start_0
    invoke-virtual {p1}, Lrth;->getData()Ljava/util/Map;

    move-result-object p1

    const-string v0, "Received push notification message: %s"

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/leanplum/internal/Log;->i(Ljava/lang/String;[Ljava/lang/Object;)V

    const-string v0, "_test_in_app_"

    move-object v1, p1

    check-cast v1, Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2a

    const-string p0, "_test_in_app_data_"

    invoke-virtual {v1, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    if-eqz p0, :cond_62

    invoke-static {p0}, Lcom/leanplum/OperaExtension;->handleTestInAppMessage(Ljava/lang/String;)V

    return-void

    :cond_2a
    const-string v0, "lp_silent_track"

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_35

    const-string v0, "FCM_SILENT_TRACK"

    goto :goto_37

    :cond_35
    const-string v0, "FCM"

    :goto_37
    const-string v2, "lp_message"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2
    :try_end_3d
    .catchall {:try_start_0 .. :try_end_3d} :catchall_63

    const-string v3, "_channel_internal"

    if-eqz v2, :cond_4c

    :try_start_41
    invoke-direct {p0, p1}, Lcom/leanplum/LeanplumFirebaseServiceHandler;->getBundle(Ljava/util/Map;)Landroid/os/Bundle;

    move-result-object p0

    invoke-virtual {p0, v3, v0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {p2, p0}, Lcom/leanplum/LeanplumPushService;->handleNotification(Landroid/content/Context;Landroid/os/Bundle;)V

    return-void

    :cond_4c
    const-string v2, "pns_lp_message"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_62

    invoke-static {p1}, Lcom/leanplum/OperaExtension;->removePNSPrefix(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/leanplum/LeanplumFirebaseServiceHandler;->getBundle(Ljava/util/Map;)Landroid/os/Bundle;

    move-result-object p0

    invoke-virtual {p0, v3, v0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {p2, p0}, Lcom/leanplum/OperaExtension;->handleScheduledLocalPushMessage(Landroid/content/Context;Landroid/os/Bundle;)V
    :try_end_62
    .catchall {:try_start_41 .. :try_end_62} :catchall_63

    :cond_62
    return-void

    :catchall_63
    move-exception p0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return-void
.end method

.method public onNewToken(Ljava/lang/String;Landroid/content/Context;)V
    .registers 3

    invoke-static {}, Lcom/leanplum/LeanplumPushService;->getPushProviders()Lcom/leanplum/PushProviders;

    move-result-object p0

    sget-object p2, Lcom/leanplum/PushProviderType;->FCM:Lcom/leanplum/PushProviderType;

    invoke-virtual {p0, p2, p1}, Lcom/leanplum/PushProviders;->setRegistrationId(Lcom/leanplum/PushProviderType;Ljava/lang/String;)V

    return-void
.end method
