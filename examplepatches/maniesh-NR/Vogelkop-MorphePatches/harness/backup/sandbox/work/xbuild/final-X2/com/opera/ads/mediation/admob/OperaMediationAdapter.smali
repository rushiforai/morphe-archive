.class public Lcom/opera/ads/mediation/admob/OperaMediationAdapter;
.super Lcom/google/android/gms/ads/mediation/Adapter;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation


# instance fields
.field private final mLogger:Lqhf;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 4

    invoke-direct {p0}, Lcom/google/android/gms/ads/mediation/Adapter;-><init>()V

    new-instance v0, Lqhf;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sget-object v1, Lqhf;->b:Ljava/util/Map;

    monitor-enter v1

    :try_start_b
    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    if-nez v2, :cond_20

    sget-object v2, Lqhf;->a:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, p0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_20
    monitor-exit v1
    :try_end_21
    .catchall {:try_start_b .. :try_end_21} :catchall_2b

    iput-object v0, p0, Lcom/opera/ads/mediation/admob/OperaMediationAdapter;->mLogger:Lqhf;

    const-string v0, "onCreate"

    invoke-direct {p0, v0}, Lcom/opera/ads/mediation/admob/OperaMediationAdapter;->log(Ljava/lang/String;)V

    return-void

    :goto_29
    :try_start_29
    monitor-exit v1
    :try_end_2a
    .catchall {:try_start_29 .. :try_end_2a} :catchall_2b

    throw p0

    :catchall_2b
    move-exception p0

    goto :goto_29
.end method

.method public static synthetic access$000(Lcom/opera/ads/mediation/admob/OperaMediationAdapter;Ljava/lang/String;)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/opera/ads/mediation/admob/OperaMediationAdapter;->log(Ljava/lang/String;)V

    return-void
.end method

.method private log(Ljava/lang/String;)V
    .registers 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    iget-object p0, p0, Lcom/opera/ads/mediation/admob/OperaMediationAdapter;->mLogger:Lqhf;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lqhf;->a()V

    return-void
.end method


# virtual methods
.method public getSDKVersionInfo()Lcom/google/android/gms/ads/VersionInfo;
    .registers 6
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    const-string v0, "2.14.0"

    const-string v1, "\\."

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x3

    const/4 v3, 0x0

    if-lt v1, v2, :cond_27

    :try_start_d
    aget-object v1, v0, v3

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    const/4 v2, 0x1

    aget-object v2, v0, v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    const/4 v4, 0x2

    aget-object v0, v0, v4

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    new-instance v4, Lcom/google/android/gms/ads/VersionInfo;

    invoke-direct {v4, v1, v2, v0}, Lcom/google/android/gms/ads/VersionInfo;-><init>(III)V
    :try_end_26
    .catch Ljava/lang/NumberFormatException; {:try_start_d .. :try_end_26} :catch_27

    return-object v4

    :catch_27
    :cond_27
    const-string v0, "getSDKVersionInfo: Unexpected SDK version 2.14.0"

    invoke-direct {p0, v0}, Lcom/opera/ads/mediation/admob/OperaMediationAdapter;->log(Ljava/lang/String;)V

    new-instance p0, Lcom/google/android/gms/ads/VersionInfo;

    invoke-direct {p0, v3, v3, v3}, Lcom/google/android/gms/ads/VersionInfo;-><init>(III)V

    return-object p0
.end method

.method public getVersionInfo()Lcom/google/android/gms/ads/VersionInfo;
    .registers 7
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    const-string v0, "2.14.0.0"

    const-string v1, "\\."

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x4

    const/4 v3, 0x0

    if-lt v1, v2, :cond_31

    :try_start_d
    aget-object v1, v0, v3

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    const/4 v2, 0x1

    aget-object v2, v0, v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    const/4 v4, 0x2

    aget-object v4, v0, v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    mul-int/lit8 v4, v4, 0x64

    const/4 v5, 0x3

    aget-object v0, v0, v5

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    add-int/2addr v4, v0

    new-instance v0, Lcom/google/android/gms/ads/VersionInfo;

    invoke-direct {v0, v1, v2, v4}, Lcom/google/android/gms/ads/VersionInfo;-><init>(III)V
    :try_end_30
    .catch Ljava/lang/NumberFormatException; {:try_start_d .. :try_end_30} :catch_31

    return-object v0

    :catch_31
    :cond_31
    const-string v0, "getVersionInfo: Unexpected adapter version 2.14.0.0"

    invoke-direct {p0, v0}, Lcom/opera/ads/mediation/admob/OperaMediationAdapter;->log(Ljava/lang/String;)V

    new-instance p0, Lcom/google/android/gms/ads/VersionInfo;

    invoke-direct {p0, v3, v3, v3}, Lcom/google/android/gms/ads/VersionInfo;-><init>(III)V

    return-object p0
.end method

.method public initialize(Landroid/content/Context;Lcom/google/android/gms/ads/mediation/InitializationCompleteCallback;Ljava/util/List;)V
    .registers 7
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/google/android/gms/ads/mediation/InitializationCompleteCallback;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/google/android/gms/ads/mediation/InitializationCompleteCallback;",
            "Ljava/util/List<",
            "Lcom/google/android/gms/ads/mediation/MediationConfiguration;",
            ">;)V"
        }
    .end annotation

    const-string v0, "initialize"

    invoke-direct {p0, v0}, Lcom/opera/ads/mediation/admob/OperaMediationAdapter;->log(Ljava/lang/String;)V

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :catch_e
    :cond_e
    :goto_e
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3f

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/ads/mediation/MediationConfiguration;

    invoke-virtual {v1}, Lcom/google/android/gms/ads/mediation/MediationConfiguration;->getServerParameters()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "parameter"

    invoke-virtual {v1, v2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_e

    :try_start_2a
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v1, "appId"

    invoke-virtual {v2, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_e

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
    :try_end_3e
    .catch Lorg/json/JSONException; {:try_start_2a .. :try_end_3e} :catch_e

    goto :goto_e

    :cond_3f
    invoke-virtual {v0}, Ljava/util/HashSet;->isEmpty()Z

    move-result p3

    if-eqz p3, :cond_66

    const/16 p1, 0x65

    const-string p3, "Failed to initialize Opera Ads SDK. Missing or invalid App ID."

    invoke-static {p1, p3}, Lrm5;->o(ILjava/lang/String;)Lcom/google/android/gms/ads/AdError;

    move-result-object p1

    new-instance p3, Ljava/lang/StringBuilder;

    const-string v0, "initialize: failed, error="

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-direct {p0, p3}, Lcom/opera/ads/mediation/admob/OperaMediationAdapter;->log(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-interface {p2, p0}, Lcom/google/android/gms/ads/mediation/InitializationCompleteCallback;->onInitializationFailed(Ljava/lang/String;)V

    return-void

    :cond_66
    invoke-virtual {v0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object p3

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/util/HashSet;->size()I

    move-result v1

    const/4 v2, 0x1

    if-le v1, v2, :cond_8a

    const-string v1, "Found multiple app IDs in %s. Using %s to initialize Opera Ads SDK."

    filled-new-array {v0, p3}, [Ljava/lang/Object;

    move-result-object v0

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "initialize: "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/opera/ads/mediation/admob/OperaMediationAdapter;->log(Ljava/lang/String;)V

    :cond_8a
    invoke-static {}, Lc37;->s()Lc37;

    move-result-object v0

    new-instance v1, Lesg;

    const/16 v2, 0x1c

    invoke-direct {v1, p0, p2, v2}, Lesg;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, p0, Lcom/opera/ads/mediation/admob/OperaMediationAdapter;->mLogger:Lqhf;

    invoke-virtual {v0, p1, p3, v1, p0}, Lc37;->x(Landroid/content/Context;Ljava/lang/String;Lzkf;Lqhf;)V

    return-void
.end method

.method public loadAppOpenAd(Lcom/google/android/gms/ads/mediation/MediationAppOpenAdConfiguration;Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;)V
    .registers 9
    .param p1    # Lcom/google/android/gms/ads/mediation/MediationAppOpenAdConfiguration;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/ads/mediation/MediationAppOpenAdConfiguration;",
            "Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback<",
            "Lcom/google/android/gms/ads/mediation/MediationAppOpenAd;",
            "Lcom/google/android/gms/ads/mediation/MediationAppOpenAdCallback;",
            ">;)V"
        }
    .end annotation

    const-string v0, "loadAppOpenAd"

    invoke-direct {p0, v0}, Lcom/opera/ads/mediation/admob/OperaMediationAdapter;->log(Ljava/lang/String;)V

    new-instance v0, Lmpf;

    iget-object p0, p0, Lcom/opera/ads/mediation/admob/OperaMediationAdapter;->mLogger:Lqhf;

    invoke-direct {v0, p2, p0}, Lmpf;-><init>(Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;Lqhf;)V

    invoke-virtual {p1}, Lcom/google/android/gms/ads/mediation/MediationAppOpenAdConfiguration;->getServerParameters()Landroid/os/Bundle;

    move-result-object v1

    invoke-static {v1}, Lrm5;->J(Landroid/os/Bundle;)Lc5o;

    move-result-object v1

    if-nez v1, :cond_33

    const/16 p0, 0x65

    const-string p1, "Missing or invalid server parameters."

    invoke-static {p0, p1}, Lrm5;->o(ILjava/lang/String;)Lcom/google/android/gms/ads/AdError;

    move-result-object p0

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v1, "loadAd: failed, error="

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lmpf;->a(Ljava/lang/String;)V

    invoke-interface {p2, p0}, Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;->onFailure(Lcom/google/android/gms/ads/AdError;)V

    return-void

    :cond_33
    invoke-virtual {p1}, Lcom/google/android/gms/ads/mediation/MediationAppOpenAdConfiguration;->getContext()Landroid/content/Context;

    move-result-object p2

    iget-object v2, v1, Lc5o;->a:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    iget-object v1, v1, Lc5o;->b:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "loadAd: placementId="

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lmpf;->a(Ljava/lang/String;)V

    invoke-static {}, Lc37;->s()Lc37;

    move-result-object v3

    new-instance v4, Lghf;

    const/4 v5, 0x1

    invoke-direct {v4, v0, p1, v1, v5}, Lghf;-><init>(Ljava/lang/Object;Lcom/google/android/gms/ads/mediation/MediationAdConfiguration;Ljava/lang/String;B)V

    invoke-virtual {v3, p2, v2, v4, p0}, Lc37;->x(Landroid/content/Context;Ljava/lang/String;Lzkf;Lqhf;)V

    return-void
.end method

.method public loadBannerAd(Lcom/google/android/gms/ads/mediation/MediationBannerAdConfiguration;Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;)V
    .registers 13
    .param p1    # Lcom/google/android/gms/ads/mediation/MediationBannerAdConfiguration;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/ads/mediation/MediationBannerAdConfiguration;",
            "Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback<",
            "Lcom/google/android/gms/ads/mediation/MediationBannerAd;",
            "Lcom/google/android/gms/ads/mediation/MediationBannerAdCallback;",
            ">;)V"
        }
    .end annotation

    const-string v0, "loadBannerAd"

    invoke-direct {p0, v0}, Lcom/opera/ads/mediation/admob/OperaMediationAdapter;->log(Ljava/lang/String;)V

    new-instance v0, Lnpf;

    iget-object p0, p0, Lcom/opera/ads/mediation/admob/OperaMediationAdapter;->mLogger:Lqhf;

    invoke-direct {v0, p2, p0}, Lnpf;-><init>(Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;Lqhf;)V

    invoke-virtual {p1}, Lcom/google/android/gms/ads/mediation/MediationBannerAdConfiguration;->getServerParameters()Landroid/os/Bundle;

    move-result-object p0

    invoke-static {p0}, Lrm5;->J(Landroid/os/Bundle;)Lc5o;

    move-result-object p0

    const-string v1, "loadAd: failed, error="

    if-nez p0, :cond_33

    const/16 p0, 0x65

    const-string p1, "Missing or invalid server parameters."

    invoke-static {p0, p1}, Lrm5;->o(ILjava/lang/String;)Lcom/google/android/gms/ads/AdError;

    move-result-object p0

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lnpf;->a(Ljava/lang/String;)V

    invoke-interface {p2, p0}, Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;->onFailure(Lcom/google/android/gms/ads/AdError;)V

    return-void

    :cond_33
    invoke-virtual {p1}, Lcom/google/android/gms/ads/mediation/MediationBannerAdConfiguration;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lc5o;->a:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    iget-object p0, p0, Lc5o;->b:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    invoke-virtual {p1}, Lcom/google/android/gms/ads/mediation/MediationBannerAdConfiguration;->getAdSize()Lcom/google/android/gms/ads/AdSize;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "loadAd: placementId="

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, ", size="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Lnpf;->a(Ljava/lang/String;)V

    invoke-virtual {v4}, Lcom/google/android/gms/ads/AdSize;->getWidth()I

    move-result v5

    invoke-virtual {v4}, Lcom/google/android/gms/ads/AdSize;->getHeight()I

    move-result v4

    sget-object v6, Leq;->f:Ljava/util/List;

    invoke-interface {v6}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_6a
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_80

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    move-object v8, v7

    check-cast v8, Leq;

    iget-short v9, v8, Leq;->a:S

    if-ne v9, v5, :cond_6a

    iget-short v8, v8, Leq;->b:S

    if-ne v8, v4, :cond_6a

    goto :goto_81

    :cond_80
    const/4 v7, 0x0

    :goto_81
    check-cast v7, Leq;

    if-nez v7, :cond_a0

    const/16 p0, 0x66

    const-string p1, "Failed to load Banner ad. Unsupported banner size."

    invoke-static {p0, p1}, Lrm5;->q(ILjava/lang/String;)Lcom/google/android/gms/ads/AdError;

    move-result-object p0

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lnpf;->a(Ljava/lang/String;)V

    invoke-interface {p2, p0}, Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;->onFailure(Lcom/google/android/gms/ads/AdError;)V

    return-void

    :cond_a0
    invoke-static {}, Lc37;->s()Lc37;

    move-result-object p2

    new-instance v1, Lx79;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v0, v1, Lx79;->e:Ljava/lang/Object;

    iput-object p1, v1, Lx79;->a:Ljava/lang/Object;

    iput-object v2, v1, Lx79;->b:Ljava/lang/Object;

    iput-object p0, v1, Lx79;->c:Ljava/lang/Object;

    iput-object v7, v1, Lx79;->d:Ljava/lang/Object;

    iget-object p0, v0, Lnpf;->b:Lqhf;

    invoke-virtual {p2, v2, v3, v1, p0}, Lc37;->x(Landroid/content/Context;Ljava/lang/String;Lzkf;Lqhf;)V

    return-void
.end method

.method public loadInterstitialAd(Lcom/google/android/gms/ads/mediation/MediationInterstitialAdConfiguration;Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;)V
    .registers 9
    .param p1    # Lcom/google/android/gms/ads/mediation/MediationInterstitialAdConfiguration;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/ads/mediation/MediationInterstitialAdConfiguration;",
            "Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback<",
            "Lcom/google/android/gms/ads/mediation/MediationInterstitialAd;",
            "Lcom/google/android/gms/ads/mediation/MediationInterstitialAdCallback;",
            ">;)V"
        }
    .end annotation

    const-string v0, "loadInterstitialAd"

    invoke-direct {p0, v0}, Lcom/opera/ads/mediation/admob/OperaMediationAdapter;->log(Ljava/lang/String;)V

    new-instance v0, Lopf;

    iget-object p0, p0, Lcom/opera/ads/mediation/admob/OperaMediationAdapter;->mLogger:Lqhf;

    invoke-direct {v0, p2, p0}, Lopf;-><init>(Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;Lqhf;)V

    invoke-virtual {p1}, Lcom/google/android/gms/ads/mediation/MediationInterstitialAdConfiguration;->getServerParameters()Landroid/os/Bundle;

    move-result-object v1

    invoke-static {v1}, Lrm5;->J(Landroid/os/Bundle;)Lc5o;

    move-result-object v1

    if-nez v1, :cond_33

    const/16 p0, 0x65

    const-string p1, "Missing or invalid server parameters."

    invoke-static {p0, p1}, Lrm5;->o(ILjava/lang/String;)Lcom/google/android/gms/ads/AdError;

    move-result-object p0

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v1, "loadAd: failed, error="

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lopf;->a(Ljava/lang/String;)V

    invoke-interface {p2, p0}, Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;->onFailure(Lcom/google/android/gms/ads/AdError;)V

    return-void

    :cond_33
    invoke-virtual {p1}, Lcom/google/android/gms/ads/mediation/MediationInterstitialAdConfiguration;->getContext()Landroid/content/Context;

    move-result-object p2

    iget-object v2, v1, Lc5o;->a:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    iget-object v1, v1, Lc5o;->b:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "loadAd: placementId="

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lopf;->a(Ljava/lang/String;)V

    invoke-static {}, Lc37;->s()Lc37;

    move-result-object v3

    new-instance v4, Lp8f;

    const/4 v5, 0x2

    invoke-direct {v4, v0, p1, v1, v5}, Lp8f;-><init>(Ljava/lang/Object;Lcom/google/android/gms/ads/mediation/MediationAdConfiguration;Ljava/lang/String;B)V

    invoke-virtual {v3, p2, v2, v4, p0}, Lc37;->x(Landroid/content/Context;Ljava/lang/String;Lzkf;Lqhf;)V

    return-void
.end method

.method public loadNativeAdMapper(Lcom/google/android/gms/ads/mediation/MediationNativeAdConfiguration;Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;)V
    .registers 7
    .param p1    # Lcom/google/android/gms/ads/mediation/MediationNativeAdConfiguration;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/ads/mediation/MediationNativeAdConfiguration;",
            "Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback<",
            "Lcom/google/android/gms/ads/mediation/NativeAdMapper;",
            "Lcom/google/android/gms/ads/mediation/MediationNativeAdCallback;",
            ">;)V"
        }
    .end annotation

    const-string v0, "loadNativeAdMapper"

    invoke-direct {p0, v0}, Lcom/opera/ads/mediation/admob/OperaMediationAdapter;->log(Ljava/lang/String;)V

    new-instance v0, Lppf;

    iget-object p0, p0, Lcom/opera/ads/mediation/admob/OperaMediationAdapter;->mLogger:Lqhf;

    invoke-direct {v0, p2, p0}, Lhnf;-><init>(Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;Lqhf;)V

    invoke-virtual {p1}, Lcom/google/android/gms/ads/mediation/MediationNativeAdConfiguration;->getServerParameters()Landroid/os/Bundle;

    move-result-object p0

    invoke-static {p0}, Lrm5;->J(Landroid/os/Bundle;)Lc5o;

    move-result-object p0

    if-nez p0, :cond_35

    const/16 p0, 0x65

    const-string p1, "Missing or invalid server parameters."

    invoke-static {p0, p1}, Lrm5;->o(ILjava/lang/String;)Lcom/google/android/gms/ads/AdError;

    move-result-object p0

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "loadAd: failed, error="

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lhnf;->a(Ljava/lang/String;)V

    iget-object p1, v0, Lhnf;->t:Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;

    invoke-interface {p1, p0}, Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;->onFailure(Lcom/google/android/gms/ads/AdError;)V

    return-void

    :cond_35
    invoke-virtual {p1}, Lcom/google/android/gms/ads/mediation/MediationNativeAdConfiguration;->getContext()Landroid/content/Context;

    move-result-object p2

    iget-object v1, p0, Lc5o;->a:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    iget-object p0, p0, Lc5o;->b:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "loadAd: placementId="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lhnf;->a(Ljava/lang/String;)V

    invoke-static {}, Lc37;->s()Lc37;

    move-result-object v2

    new-instance v3, Lr9i;

    invoke-direct {v3, v0, p1, p2, p0}, Lr9i;-><init>(Lppf;Lcom/google/android/gms/ads/mediation/MediationNativeAdConfiguration;Landroid/content/Context;Ljava/lang/String;)V

    iget-object p0, v0, Lhnf;->u:Lqhf;

    invoke-virtual {v2, p2, v1, v3, p0}, Lc37;->x(Landroid/content/Context;Ljava/lang/String;Lzkf;Lqhf;)V

    return-void
.end method

.method public loadRewardedAd(Lcom/google/android/gms/ads/mediation/MediationRewardedAdConfiguration;Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;)V
    .registers 9
    .param p1    # Lcom/google/android/gms/ads/mediation/MediationRewardedAdConfiguration;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/ads/mediation/MediationRewardedAdConfiguration;",
            "Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback<",
            "Lcom/google/android/gms/ads/mediation/MediationRewardedAd;",
            "Lcom/google/android/gms/ads/mediation/MediationRewardedAdCallback;",
            ">;)V"
        }
    .end annotation

    const-string v0, "loadRewardedAd"

    invoke-direct {p0, v0}, Lcom/opera/ads/mediation/admob/OperaMediationAdapter;->log(Ljava/lang/String;)V

    new-instance v0, Lqpf;

    iget-object p0, p0, Lcom/opera/ads/mediation/admob/OperaMediationAdapter;->mLogger:Lqhf;

    const/4 v1, 0x0

    invoke-direct {v0, p2, p0, v1}, Lqpf;-><init>(Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;Lqhf;B)V

    invoke-virtual {p1}, Lcom/google/android/gms/ads/mediation/MediationRewardedAdConfiguration;->getServerParameters()Landroid/os/Bundle;

    move-result-object v1

    invoke-static {v1}, Lrm5;->J(Landroid/os/Bundle;)Lc5o;

    move-result-object v1

    if-nez v1, :cond_34

    const/16 p0, 0x65

    const-string p1, "Missing or invalid server parameters."

    invoke-static {p0, p1}, Lrm5;->o(ILjava/lang/String;)Lcom/google/android/gms/ads/AdError;

    move-result-object p0

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v1, "loadAd: failed, error="

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lqpf;->a(Ljava/lang/String;)V

    invoke-interface {p2, p0}, Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;->onFailure(Lcom/google/android/gms/ads/AdError;)V

    return-void

    :cond_34
    invoke-virtual {p1}, Lcom/google/android/gms/ads/mediation/MediationRewardedAdConfiguration;->getContext()Landroid/content/Context;

    move-result-object p2

    iget-object v2, v1, Lc5o;->a:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    iget-object v1, v1, Lc5o;->b:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "loadAd: placementId="

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lqpf;->a(Ljava/lang/String;)V

    invoke-static {}, Lc37;->s()Lc37;

    move-result-object v3

    new-instance v4, Lghf;

    const/4 v5, 0x2

    invoke-direct {v4, v0, p1, v1, v5}, Lghf;-><init>(Ljava/lang/Object;Lcom/google/android/gms/ads/mediation/MediationAdConfiguration;Ljava/lang/String;B)V

    invoke-virtual {v3, p2, v2, v4, p0}, Lc37;->x(Landroid/content/Context;Ljava/lang/String;Lzkf;Lqhf;)V

    return-void
.end method

.method public loadRewardedInterstitialAd(Lcom/google/android/gms/ads/mediation/MediationRewardedAdConfiguration;Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;)V
    .registers 9
    .param p1    # Lcom/google/android/gms/ads/mediation/MediationRewardedAdConfiguration;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/ads/mediation/MediationRewardedAdConfiguration;",
            "Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback<",
            "Lcom/google/android/gms/ads/mediation/MediationRewardedAd;",
            "Lcom/google/android/gms/ads/mediation/MediationRewardedAdCallback;",
            ">;)V"
        }
    .end annotation

    const-string v0, "loadRewardedInterstitialAd"

    invoke-direct {p0, v0}, Lcom/opera/ads/mediation/admob/OperaMediationAdapter;->log(Ljava/lang/String;)V

    new-instance v0, Lqpf;

    iget-object p0, p0, Lcom/opera/ads/mediation/admob/OperaMediationAdapter;->mLogger:Lqhf;

    const/4 v1, 0x1

    invoke-direct {v0, p2, p0, v1}, Lqpf;-><init>(Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;Lqhf;B)V

    invoke-virtual {p1}, Lcom/google/android/gms/ads/mediation/MediationRewardedAdConfiguration;->getServerParameters()Landroid/os/Bundle;

    move-result-object v1

    invoke-static {v1}, Lrm5;->J(Landroid/os/Bundle;)Lc5o;

    move-result-object v1

    if-nez v1, :cond_34

    const/16 p0, 0x65

    const-string p1, "Missing or invalid server parameters."

    invoke-static {p0, p1}, Lrm5;->o(ILjava/lang/String;)Lcom/google/android/gms/ads/AdError;

    move-result-object p0

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v1, "loadAd: failed, error="

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lqpf;->b(Ljava/lang/String;)V

    invoke-interface {p2, p0}, Lcom/google/android/gms/ads/mediation/MediationAdLoadCallback;->onFailure(Lcom/google/android/gms/ads/AdError;)V

    return-void

    :cond_34
    invoke-virtual {p1}, Lcom/google/android/gms/ads/mediation/MediationRewardedAdConfiguration;->getContext()Landroid/content/Context;

    move-result-object p2

    iget-object v2, v1, Lc5o;->a:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    iget-object v1, v1, Lc5o;->b:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "loadAd: placementId="

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lqpf;->b(Ljava/lang/String;)V

    invoke-static {}, Lc37;->s()Lc37;

    move-result-object v3

    new-instance v4, Lp8f;

    const/4 v5, 0x3

    invoke-direct {v4, v0, p1, v1, v5}, Lp8f;-><init>(Ljava/lang/Object;Lcom/google/android/gms/ads/mediation/MediationAdConfiguration;Ljava/lang/String;B)V

    invoke-virtual {v3, p2, v2, v4, p0}, Lc37;->x(Landroid/content/Context;Ljava/lang/String;Lzkf;Lqhf;)V

    return-void
.end method
