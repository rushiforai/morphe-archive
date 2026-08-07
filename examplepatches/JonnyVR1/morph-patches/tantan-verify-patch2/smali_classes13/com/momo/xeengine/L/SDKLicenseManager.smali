.class Lcom/momo/xeengine/L/SDKLicenseManager;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/xeengine/L/SDKLicenseManager$LicenseRequestTask;,
        Lcom/momo/xeengine/L/SDKLicenseManager$InstanceHolder;
    }
.end annotation


# static fields
.field private static final ENABLE_KEY:Ljava/lang/String; = "sdk.expire"

.field private static MODULE_ENABLE:Z = false

.field private static final PREF_NAME:Ljava/lang/String; = "com.immomo.xengine"

.field private static final RENEW_THRESHOLD_MILLIS:J = 0x5265c00L

.field private static final SAVE_TIME_KEY:Ljava/lang/String; = "sdk.save"

.field private static final SECRET_TOKEN:Ljava/lang/String; = "K3sRVijq0qar6xWICc9PPA=="

.field private static final SERVER_URL:Ljava/lang/String; = "https://melon-gateway-os.immomo.com/cosmos_middleware/gift/getResource"


# instance fields
.field private appID:Ljava/lang/String;

.field private volatile enable:Z

.field private final executor:Ljava/util/concurrent/Executor;

.field private packageName:Ljava/lang/String;

.field private final requestTask:Ljava/lang/Runnable;

.field private volatile saveTime:J


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/momo/xeengine/L/SDKLicenseManager;->enable:Z

    .line 6
    .line 7
    const-wide/16 v0, 0x0

    .line 8
    .line 9
    iput-wide v0, p0, Lcom/momo/xeengine/L/SDKLicenseManager;->saveTime:J

    .line 10
    .line 11
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/momo/xeengine/L/SDKLicenseManager;->executor:Ljava/util/concurrent/Executor;

    .line 16
    .line 17
    new-instance v1, Lcom/momo/xeengine/L/SDKLicenseManager$LicenseRequestTask;

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-direct {v1, p0, v2}, Lcom/momo/xeengine/L/SDKLicenseManager$LicenseRequestTask;-><init>(Lcom/momo/xeengine/L/SDKLicenseManager;Lcom/momo/xeengine/L/SDKLicenseManager$1;)V

    .line 21
    .line 22
    .line 23
    iput-object v1, p0, Lcom/momo/xeengine/L/SDKLicenseManager;->requestTask:Ljava/lang/Runnable;

    .line 24
    .line 25
    sget-boolean v1, Lcom/momo/xeengine/L/SDKLicenseManager;->MODULE_ENABLE:Z

    .line 26
    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    new-instance v1, Lcom/momo/xeengine/L/a;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Lcom/momo/xeengine/L/a;-><init>(Lcom/momo/xeengine/L/SDKLicenseManager;)V

    .line 32
    .line 33
    .line 34
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method public synthetic constructor <init>(Lcom/momo/xeengine/L/SDKLicenseManager$1;)V
    .locals 0

    .line 38
    invoke-direct {p0}, Lcom/momo/xeengine/L/SDKLicenseManager;-><init>()V

    return-void
.end method

.method public static synthetic a(Lcom/momo/xeengine/L/SDKLicenseManager;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/xeengine/L/SDKLicenseManager;->loadLicenseFromStorage()V

    return-void
.end method

.method public static synthetic access$300(Lcom/momo/xeengine/L/SDKLicenseManager;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/L/SDKLicenseManager;->appID:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$400(Lcom/momo/xeengine/L/SDKLicenseManager;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/L/SDKLicenseManager;->packageName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$500(Lcom/momo/xeengine/L/SDKLicenseManager;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/momo/xeengine/L/SDKLicenseManager;->saveEnable(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static getInstance()Lcom/momo/xeengine/L/SDKLicenseManager;
    .locals 1

    .line 1
    invoke-static {}, Lcom/momo/xeengine/L/SDKLicenseManager$InstanceHolder;->access$100()Lcom/momo/xeengine/L/SDKLicenseManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method private getPrefs()Landroid/content/SharedPreferences;
    .locals 2

    .line 1
    invoke-static {}, Lcom/momo/xeengine/XEnginePreferences;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "com.immomo.xengine"

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method private loadLicenseFromStorage()V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/momo/xeengine/L/SDKLicenseManager;->getPrefs()Landroid/content/SharedPreferences;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "sdk.expire"

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    iput-boolean v1, p0, Lcom/momo/xeengine/L/SDKLicenseManager;->enable:Z

    .line 13
    .line 14
    const-string v1, "sdk.save"

    .line 15
    .line 16
    const-wide/16 v2, 0x0

    .line 17
    .line 18
    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    .line 19
    .line 20
    .line 21
    move-result-wide v0

    .line 22
    iput-wide v0, p0, Lcom/momo/xeengine/L/SDKLicenseManager;->saveTime:J

    .line 23
    .line 24
    return-void
.end method

.method private saveEnable(Z)V
    .locals 2

    .line 1
    iput-boolean p1, p0, Lcom/momo/xeengine/L/SDKLicenseManager;->enable:Z

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/momo/xeengine/L/SDKLicenseManager;->getPrefs()Landroid/content/SharedPreferences;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string v0, "sdk.expire"

    .line 12
    .line 13
    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 14
    .line 15
    .line 16
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 17
    .line 18
    .line 19
    move-result-wide v0

    .line 20
    const-string p1, "sdk.save"

    .line 21
    .line 22
    invoke-interface {p0, p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 23
    .line 24
    .line 25
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 26
    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public declared-synchronized isLicenseValid()Z
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lcom/momo/xeengine/L/SDKLicenseManager;->enable:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return v0

    .line 6
    :catchall_0
    move-exception v0

    .line 7
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 8
    throw v0
.end method

.method public setAppID(Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/momo/xeengine/L/SDKLicenseManager;->MODULE_ENABLE:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/momo/xeengine/L/SDKLicenseManager;->appID:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iput-object p1, p0, Lcom/momo/xeengine/L/SDKLicenseManager;->appID:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {}, Lcom/momo/xeengine/XEnginePreferences;->getContext()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iput-object p1, p0, Lcom/momo/xeengine/L/SDKLicenseManager;->packageName:Ljava/lang/String;

    .line 26
    .line 27
    :cond_0
    iget-object p1, p0, Lcom/momo/xeengine/L/SDKLicenseManager;->executor:Ljava/util/concurrent/Executor;

    .line 28
    .line 29
    new-instance v0, Lcom/momo/xeengine/L/b;

    .line 30
    .line 31
    invoke-direct {v0, p0}, Lcom/momo/xeengine/L/b;-><init>(Lcom/momo/xeengine/L/SDKLicenseManager;)V

    .line 32
    .line 33
    .line 34
    invoke-interface {p1, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 35
    .line 36
    .line 37
    :cond_1
    return-void
.end method

.method public updateLicense()V
    .locals 6

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Lcom/momo/xeengine/L/SDKLicenseManager;->saveTime:J

    .line 6
    .line 7
    const-wide/32 v4, 0x5265c00

    .line 8
    .line 9
    .line 10
    add-long/2addr v2, v4

    .line 11
    cmp-long v2, v2, v0

    .line 12
    .line 13
    if-lez v2, :cond_1

    .line 14
    .line 15
    iget-wide v2, p0, Lcom/momo/xeengine/L/SDKLicenseManager;->saveTime:J

    .line 16
    .line 17
    cmp-long v0, v0, v2

    .line 18
    .line 19
    if-gez v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    return-void

    .line 23
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/momo/xeengine/L/SDKLicenseManager;->executor:Ljava/util/concurrent/Executor;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/momo/xeengine/L/SDKLicenseManager;->requestTask:Ljava/lang/Runnable;

    .line 26
    .line 27
    invoke-interface {v0, p0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method
