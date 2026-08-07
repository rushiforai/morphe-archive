.class public final Lcom/momo/xeengine/somanager/XEngineSOManager;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation


# static fields
.field private static engineSOLoader:Lcom/momo/xeengine/somanager/IXEngineSOLoader;

.field private static isEngineSOLoaded:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

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

.method public static check(Lcom/momo/xeengine/somanager/IXEngineSOLoader$LoaderCallback;)Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/momo/xeengine/somanager/XEngineSOManager;->loadEngineSO()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    sget-object v0, Lcom/momo/xeengine/somanager/XEngineSOManager;->engineSOLoader:Lcom/momo/xeengine/somanager/IXEngineSOLoader;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    const-string v0, "native lib load failed"

    .line 14
    .line 15
    invoke-interface {p0, v0}, Lcom/momo/xeengine/somanager/IXEngineSOLoader$LoaderCallback;->onFailed(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_1
    invoke-interface {v0, p0}, Lcom/momo/xeengine/somanager/IXEngineSOLoader;->checkEngineSO(Lcom/momo/xeengine/somanager/IXEngineSOLoader$LoaderCallback;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0
.end method

.method private static native engineNativeInit(Landroid/content/res/AssetManager;)V
.end method

.method public static declared-synchronized loadEngineSO()Z
    .locals 4

    .line 1
    const-string v0, "\u5f15\u64ceSO\u52a0\u8f7d\u5931\u8d25:"

    .line 2
    .line 3
    const-class v1, Lcom/momo/xeengine/somanager/XEngineSOManager;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    :try_start_0
    sget-boolean v2, Lcom/momo/xeengine/somanager/XEngineSOManager;->isEngineSOLoaded:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 7
    .line 8
    const/4 v3, 0x1

    .line 9
    if-eqz v2, :cond_0

    .line 10
    .line 11
    monitor-exit v1

    .line 12
    return v3

    .line 13
    :cond_0
    :try_start_1
    const-string v2, "c++_shared"

    .line 14
    .line 15
    invoke-static {v2}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const-string v2, "cvcontainer"

    .line 19
    .line 20
    invoke-static {v2}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const-string v2, "xeengine"

    .line 24
    .line 25
    invoke-static {v2}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-static {}, Lcom/momo/xeengine/XEnginePreferences;->getContext()Landroid/content/Context;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-virtual {v2}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-static {v2}, Lcom/momo/xeengine/somanager/XEngineSOManager;->engineNativeInit(Landroid/content/res/AssetManager;)V

    .line 37
    .line 38
    .line 39
    sput-boolean v3, Lcom/momo/xeengine/somanager/XEngineSOManager;->isEngineSOLoaded:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :catchall_0
    move-exception v2

    .line 43
    :try_start_2
    new-instance v3, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-static {v0}, Lcom/momo/xeengine/XELogger;->e([Ljava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    :goto_0
    sget-boolean v0, Lcom/momo/xeengine/somanager/XEngineSOManager;->isEngineSOLoaded:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 63
    .line 64
    monitor-exit v1

    .line 65
    return v0

    .line 66
    :catchall_1
    move-exception v0

    .line 67
    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 68
    throw v0
.end method

.method public static setEngineSOLoader(Lcom/momo/xeengine/somanager/IXEngineSOLoader;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/momo/xeengine/somanager/XEngineSOManager;->engineSOLoader:Lcom/momo/xeengine/somanager/IXEngineSOLoader;

    .line 2
    .line 3
    return-void
.end method
