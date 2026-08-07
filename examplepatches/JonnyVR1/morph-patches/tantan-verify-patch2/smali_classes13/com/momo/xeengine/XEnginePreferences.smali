.class public final Lcom/momo/xeengine/XEnginePreferences;
.super Lcom/momo/xeengine/xnative/XEnginePreferencesNative;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation


# static fields
.field private static APP_ID:Ljava/lang/String; = null

.field private static APP_KEY:Ljava/lang/String; = null

.field public static final ARCHIVE_TIME:J = 0x69c5f9f0L

.field private static DEFAULT_FONT_PATH:Ljava/lang/String; = null

.field private static IS_INTERNATIONAL:Z = false

.field public static final VERSION:Ljava/lang/String; = "5.0.7"

.field public static final VERSION_NUM:I = 0x1fb

.field private static analyticsCallback:Lcom/momo/xeengine/AnalyticsCallback;

.field private static clientInfoProvider:Lcom/momo/xeengine/ClientInfoProvider;

.field private static sContext:Landroid/content/Context;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "StaticFieldLeak"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/momo/xeengine/xnative/XEnginePreferencesNative;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance p0, Ljava/lang/RuntimeException;

    .line 5
    .line 6
    const-string v0, "Stub!"

    .line 7
    .line 8
    invoke-direct {p0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    throw p0
.end method

.method public static AddEngineModule(Lcom/momo/xeengine/IXEngineModule;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/momo/xeengine/XEngineModuleManager;->AddEngineModule(Lcom/momo/xeengine/IXEngineModule;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static checkEngineEnv()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/momo/xeengine/XEngineException;
        }
    .end annotation

    .line 1
    const-string v0, "\u5f15\u64ce\u52a8\u6001\u5e93\u7248\u672c\u9519\u8bef"

    .line 2
    .line 3
    const-string v1, "\u5f15\u64ce\u52a8\u6001\u5e93\u52a0\u8f7d\u9519\u8bef"

    .line 4
    .line 5
    sget-object v2, Lcom/momo/xeengine/XEnginePreferences;->sContext:Landroid/content/Context;

    .line 6
    .line 7
    if-eqz v2, :cond_2

    .line 8
    .line 9
    :try_start_0
    invoke-static {}, Lcom/momo/xeengine/somanager/XEngineSOManager;->loadEngineSO()Z

    .line 10
    .line 11
    .line 12
    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 13
    if-eqz v2, :cond_1

    .line 14
    .line 15
    :try_start_1
    invoke-static {}, Lcom/momo/xeengine/xnative/XEnginePreferencesNative;->getEngineSoArchiveTime()J

    .line 16
    .line 17
    .line 18
    move-result-wide v1

    .line 19
    const-wide/32 v3, 0x69c5f9f0

    .line 20
    .line 21
    .line 22
    cmp-long v1, v3, v1

    .line 23
    .line 24
    if-nez v1, :cond_0

    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    new-instance v1, Lcom/momo/xeengine/XEngineException;

    .line 28
    .line 29
    invoke-direct {v1, v0}, Lcom/momo/xeengine/XEngineException;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 33
    :catchall_0
    new-instance v1, Lcom/momo/xeengine/XEngineException;

    .line 34
    .line 35
    invoke-direct {v1, v0}, Lcom/momo/xeengine/XEngineException;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    throw v1

    .line 39
    :cond_1
    :try_start_2
    new-instance v0, Lcom/momo/xeengine/XEngineException;

    .line 40
    .line 41
    invoke-direct {v0, v1}, Lcom/momo/xeengine/XEngineException;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 45
    :catchall_1
    new-instance v0, Lcom/momo/xeengine/XEngineException;

    .line 46
    .line 47
    invoke-direct {v0, v1}, Lcom/momo/xeengine/XEngineException;-><init>(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    throw v0

    .line 51
    :cond_2
    new-instance v0, Lcom/momo/xeengine/XEngineException;

    .line 52
    .line 53
    const-string v1, "\u5f15\u64ce\u5168\u5c40\u4e0a\u4e0b\u6587\u672a\u8bbe\u7f6e"

    .line 54
    .line 55
    invoke-direct {v0, v1}, Lcom/momo/xeengine/XEngineException;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    throw v0
.end method

.method public static getAnalyticsCallback()Lcom/momo/xeengine/AnalyticsCallback;
    .locals 1

    .line 1
    sget-object v0, Lcom/momo/xeengine/XEnginePreferences;->analyticsCallback:Lcom/momo/xeengine/AnalyticsCallback;

    .line 2
    .line 3
    return-object v0
.end method

.method public static getAppId()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/momo/xeengine/XEnginePreferences;->APP_ID:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static getAppKey()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/momo/xeengine/XEnginePreferences;->APP_KEY:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static getClientInfoProvider()Lcom/momo/xeengine/ClientInfoProvider;
    .locals 1

    .line 1
    sget-object v0, Lcom/momo/xeengine/XEnginePreferences;->clientInfoProvider:Lcom/momo/xeengine/ClientInfoProvider;

    .line 2
    .line 3
    return-object v0
.end method

.method public static getContext()Landroid/content/Context;
    .locals 1

    .line 1
    sget-object v0, Lcom/momo/xeengine/XEnginePreferences;->sContext:Landroid/content/Context;

    .line 2
    .line 3
    return-object v0
.end method

.method public static getDefaultFontPath()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/momo/xeengine/XEnginePreferences;->DEFAULT_FONT_PATH:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static initSDK(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-static {p0}, Lcom/momo/xeengine/XEnginePreferences;->setApplicationContext(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    sput-object p1, Lcom/momo/xeengine/XEnginePreferences;->APP_ID:Ljava/lang/String;

    .line 5
    .line 6
    sput-object p2, Lcom/momo/xeengine/XEnginePreferences;->APP_KEY:Ljava/lang/String;

    .line 7
    .line 8
    sput-boolean p3, Lcom/momo/xeengine/XEnginePreferences;->IS_INTERNATIONAL:Z

    .line 9
    .line 10
    return-void
.end method

.method public static isInternational()Z
    .locals 1

    .line 1
    sget-boolean v0, Lcom/momo/xeengine/XEnginePreferences;->IS_INTERNATIONAL:Z

    .line 2
    .line 3
    return v0
.end method

.method public static setAnalyticsCallback(Lcom/momo/xeengine/AnalyticsCallback;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/momo/xeengine/XEnginePreferences;->analyticsCallback:Lcom/momo/xeengine/AnalyticsCallback;

    .line 2
    .line 3
    return-void
.end method

.method public static setApplicationContext(Landroid/content/Context;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/momo/xeengine/XEnginePreferences;->sContext:Landroid/content/Context;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sput-object p0, Lcom/momo/xeengine/XEnginePreferences;->sContext:Landroid/content/Context;

    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public static setClientInfoProvider(Lcom/momo/xeengine/ClientInfoProvider;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/momo/xeengine/XEnginePreferences;->clientInfoProvider:Lcom/momo/xeengine/ClientInfoProvider;

    .line 2
    .line 3
    return-void
.end method

.method public static setDefaultFontPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/momo/xeengine/XEnginePreferences;->DEFAULT_FONT_PATH:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
