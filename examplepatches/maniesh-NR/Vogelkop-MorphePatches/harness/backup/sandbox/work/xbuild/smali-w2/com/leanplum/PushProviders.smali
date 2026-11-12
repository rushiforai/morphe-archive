.class Lcom/leanplum/PushProviders;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static FCM_PROVIDER_CLASS:Ljava/lang/String; = "com.leanplum.LeanplumFcmProvider"

.field private static MIPUSH_PROVIDER_CLASS:Ljava/lang/String; = "com.leanplum.LeanplumMiPushProvider"


# instance fields
.field private initialized:Z

.field private final providers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/leanplum/PushProviderType;",
            "Lcom/leanplum/IPushProvider;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/leanplum/PushProviders;->providers:Ljava/util/Map;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/leanplum/PushProviders;->initialized:Z

    invoke-virtual {p0}, Lcom/leanplum/PushProviders;->init()V

    return-void
.end method

.method private static createFcm()Lcom/leanplum/IPushProvider;
    .registers 3

    invoke-static {}, Lcom/leanplum/internal/Util;->hasPlayServices()Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-nez v0, :cond_10

    const-string v0, "No valid Google Play Services APK found. FCM will not initialize."

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/leanplum/internal/Log;->i(Ljava/lang/String;[Ljava/lang/Object;)V

    return-object v2

    :cond_10
    :try_start_10
    sget-object v0, Lcom/leanplum/PushProviders;->FCM_PROVIDER_CLASS:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/leanplum/IPushProvider;
    :try_end_20
    .catchall {:try_start_10 .. :try_end_20} :catchall_21

    return-object v0

    :catchall_21
    const-string v0, "FCM module not found. For Firebase messaging include dependency \"com.leanplum:leanplum-fcm\"."

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/leanplum/internal/Log;->i(Ljava/lang/String;[Ljava/lang/Object;)V

    return-object v2
.end method

.method private static createMiPush()Lcom/leanplum/IPushProvider;
    .registers 4

    const/4 v0, 0x0

    const/4 v1, 0x0

    :try_start_2
    sget-object v2, Lcom/leanplum/PushProviders;->MIPUSH_PROVIDER_CLASS:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    invoke-static {}, Lcom/leanplum/internal/Util;->isXiaomiDevice()Z

    move-result v3

    if-nez v3, :cond_16

    const-string v2, "Will not initialize MiPush provider for non-Xiaomi device."

    new-array v3, v0, [Ljava/lang/Object;

    invoke-static {v2, v3}, Lcom/leanplum/internal/Log;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    return-object v1

    :cond_16
    invoke-virtual {v2, v1}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/leanplum/IPushProvider;
    :try_end_20
    .catchall {:try_start_2 .. :try_end_20} :catchall_21

    return-object v2

    :catchall_21
    const-string v2, "MiPush module not found. For Mi Push messaging include dependency \"com.leanplum:leanplum-mipush\"."

    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {v2, v0}, Lcom/leanplum/internal/Log;->i(Ljava/lang/String;[Ljava/lang/Object;)V

    return-object v1
.end method

.method public static hasAppIDChanged(Ljava/lang/String;)Z
    .registers 8

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_8

    return v1

    :cond_8
    invoke-static {}, Lcom/leanplum/Leanplum;->getContext()Landroid/content/Context;

    move-result-object v0

    if-nez v0, :cond_f

    return v1

    :cond_f
    const-string v2, "__leanplum_push__"

    const-string v3, "__app_id"

    invoke-static {v0, v2, v3}, Lcom/leanplum/utils/SharedPreferencesUtil;->getString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_31

    const-string v5, "Saving the application id in the shared preferences."

    new-array v6, v1, [Ljava/lang/Object;

    invoke-static {v5, v6}, Lcom/leanplum/internal/Log;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-static {v0, v2, v3, p0}, Lcom/leanplum/utils/SharedPreferencesUtil;->setString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, ""

    invoke-virtual {p0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_31

    const/4 p0, 0x1

    return p0

    :cond_31
    return v1
.end method


# virtual methods
.method public declared-synchronized init()V
    .registers 4

    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcom/leanplum/PushProviders;->initialized:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_30

    if-eqz v0, :cond_7

    monitor-exit p0

    return-void

    :cond_7
    :try_start_7
    invoke-static {}, Lcom/leanplum/Leanplum;->getContext()Landroid/content/Context;

    move-result-object v0
    :try_end_b
    .catchall {:try_start_7 .. :try_end_b} :catchall_30

    if-nez v0, :cond_f

    monitor-exit p0

    return-void

    :cond_f
    :try_start_f
    invoke-static {}, Lcom/leanplum/PushProviders;->createFcm()Lcom/leanplum/IPushProvider;

    move-result-object v0

    if-eqz v0, :cond_1c

    iget-object v1, p0, Lcom/leanplum/PushProviders;->providers:Ljava/util/Map;

    sget-object v2, Lcom/leanplum/PushProviderType;->FCM:Lcom/leanplum/PushProviderType;

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1c
    invoke-static {}, Lcom/leanplum/PushProviders;->createMiPush()Lcom/leanplum/IPushProvider;

    move-result-object v0

    if-eqz v0, :cond_29

    iget-object v1, p0, Lcom/leanplum/PushProviders;->providers:Ljava/util/Map;

    sget-object v2, Lcom/leanplum/PushProviderType;->MIPUSH:Lcom/leanplum/PushProviderType;

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_29
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/leanplum/PushProviders;->initialized:Z
    :try_end_2c
    .catchall {:try_start_f .. :try_end_2c} :catchall_30

    monitor-exit p0

    return-void

    :goto_2e
    :try_start_2e
    monitor-exit p0
    :try_end_2f
    .catchall {:try_start_2e .. :try_end_2f} :catchall_30

    throw v0

    :catchall_30
    move-exception v0

    goto :goto_2e
.end method

.method public setRegistrationId(Lcom/leanplum/PushProviderType;Ljava/lang/String;)V
    .registers 4

    iget-object v0, p0, Lcom/leanplum/PushProviders;->providers:Ljava/util/Map;

    monitor-enter v0

    :try_start_3
    iget-object p0, p0, Lcom/leanplum/PushProviders;->providers:Ljava/util/Map;

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/leanplum/IPushProvider;

    if-eqz p0, :cond_10

    invoke-interface {p0, p2}, Lcom/leanplum/IPushProvider;->setRegistrationId(Ljava/lang/String;)V

    :cond_10
    monitor-exit v0

    return-void

    :goto_12
    monitor-exit v0
    :try_end_13
    .catchall {:try_start_3 .. :try_end_13} :catchall_14

    throw p0

    :catchall_14
    move-exception p0

    goto :goto_12
.end method

.method public updateRegistrationIdsAndBackend()V
    .registers 7

    invoke-static {}, Lcom/leanplum/internal/APIConfig;->getInstance()Lcom/leanplum/internal/APIConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/leanplum/internal/APIConfig;->appId()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/leanplum/PushProviders;->hasAppIDChanged(Ljava/lang/String;)Z

    move-result v0

    iget-object v1, p0, Lcom/leanplum/PushProviders;->providers:Ljava/util/Map;

    monitor-enter v1

    :try_start_f
    iget-object v2, p0, Lcom/leanplum/PushProviders;->providers:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_19
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_37

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/leanplum/IPushProvider;

    if-eqz v0, :cond_2a

    invoke-interface {v3}, Lcom/leanplum/IPushProvider;->unregister()V

    :cond_2a
    invoke-static {}, Lcom/leanplum/internal/OperationQueue;->sharedInstance()Lcom/leanplum/internal/OperationQueue;

    move-result-object v4

    new-instance v5, Lcom/leanplum/PushProviders$1;

    invoke-direct {v5, p0, v3}, Lcom/leanplum/PushProviders$1;-><init>(Lcom/leanplum/PushProviders;Lcom/leanplum/IPushProvider;)V

    invoke-virtual {v4, v5}, Lcom/leanplum/internal/OperationQueue;->addParallelOperation(Ljava/lang/Runnable;)V

    goto :goto_19

    :cond_37
    monitor-exit v1

    return-void

    :goto_39
    monitor-exit v1
    :try_end_3a
    .catchall {:try_start_f .. :try_end_3a} :catchall_3b

    throw p0

    :catchall_3b
    move-exception p0

    goto :goto_39
.end method
