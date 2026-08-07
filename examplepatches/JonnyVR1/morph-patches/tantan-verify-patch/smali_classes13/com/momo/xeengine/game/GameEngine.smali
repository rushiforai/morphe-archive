.class public final Lcom/momo/xeengine/game/GameEngine;
.super Lcom/momo/xeengine/xnative/XEEngineInstanceJava;
.source "SourceFile"

# interfaces
.implements Lcom/momo/xeengine/IXEngine;


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/xeengine/game/GameEngine$RenderMode;
    }
.end annotation


# instance fields
.field private beforeUpdateRunnable:Ljava/lang/Runnable;

.field private eventDispatcher:Lcom/momo/xeengine/xnative/XEEventDispatcher;

.field private logger:Lcom/momo/xeengine/XELogger;

.field private luaEngine:Lcom/momo/xeengine/lua/XELuaEngine;

.field private needUpdate:Z

.field private renderMode:Lcom/momo/xeengine/game/GameEngine$RenderMode;

.field private final renderThreadExecutor:Lcom/momo/xeengine/utils/XERenderThreadExecutor;

.field private renderTime:J

.field private window:Lcom/momo/xeengine/xnative/XWindowImpl;


# direct methods
.method public constructor <init>()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/momo/xeengine/XEngineException;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/momo/xeengine/game/GameEngine;->renderTime:J

    .line 7
    .line 8
    new-instance v0, Lcom/momo/xeengine/utils/XERenderThreadExecutor;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/momo/xeengine/utils/XERenderThreadExecutor;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/momo/xeengine/game/GameEngine;->renderThreadExecutor:Lcom/momo/xeengine/utils/XERenderThreadExecutor;

    .line 14
    .line 15
    sget-object v0, Lcom/momo/xeengine/game/GameEngine$RenderMode;->Auto:Lcom/momo/xeengine/game/GameEngine$RenderMode;

    .line 16
    .line 17
    iput-object v0, p0, Lcom/momo/xeengine/game/GameEngine;->renderMode:Lcom/momo/xeengine/game/GameEngine$RenderMode;

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    iput-boolean v0, p0, Lcom/momo/xeengine/game/GameEngine;->needUpdate:Z

    .line 21
    .line 22
    invoke-static {}, Lcom/momo/xeengine/XEnginePreferences;->checkEngineEnv()V

    .line 23
    .line 24
    .line 25
    invoke-static {}, Lcom/momo/xeengine/XEngineModuleManager;->engineLibraryLoaded()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;->nativeCreateEngine()J

    .line 29
    .line 30
    .line 31
    move-result-wide v0

    .line 32
    iput-wide v0, p0, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;->engineIns:J

    .line 33
    .line 34
    invoke-direct {p0}, Lcom/momo/xeengine/game/GameEngine;->init()V

    .line 35
    .line 36
    .line 37
    invoke-static {p0}, Lcom/momo/xeengine/XEngineModuleManager;->engineCreate(Lcom/momo/xeengine/IXEngine;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public static synthetic a(Lcom/momo/xeengine/game/GameEngine;Z)V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;->engineIns:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, v0, v1, p1}, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;->nativeShowDebugInfo(JZ)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public static synthetic b(Lcom/momo/xeengine/game/GameEngine;Lcom/momo/xeengine/event/DataEvent;)V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;->engineIns:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/momo/xeengine/event/DataEvent;->getName()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {p1}, Lcom/momo/xeengine/event/DataEvent;->getContent()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, v0, v1, v2, p1}, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;->nativeSendDataEvent(JLjava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public static synthetic c(Lcom/momo/xeengine/game/GameEngine;Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;->engineIns:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, v0, v1, p1}, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;->nativeRemoveLibraryPath(JLjava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public static synthetic d(Lcom/momo/xeengine/game/GameEngine;Lcom/momo/xeengine/audio/IXAudioPlayer;)V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;->engineIns:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, v0, v1, p1}, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;->nativeSetUserAudioPlayer(JLcom/momo/xeengine/audio/IXAudioPlayer;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public static synthetic e(Lcom/momo/xeengine/game/GameEngine;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;->nativeAddLibraryPath(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private init()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/game/GameEngine;->renderThreadExecutor:Lcom/momo/xeengine/utils/XERenderThreadExecutor;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/momo/xeengine/utils/XERenderThreadExecutor;->init()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lcom/momo/xeengine/xnative/XWindowImpl;

    .line 7
    .line 8
    iget-object v1, p0, Lcom/momo/xeengine/game/GameEngine;->renderThreadExecutor:Lcom/momo/xeengine/utils/XERenderThreadExecutor;

    .line 9
    .line 10
    iget-wide v2, p0, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;->engineIns:J

    .line 11
    .line 12
    invoke-virtual {p0, v2, v3}, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;->nativeGetWindow(J)J

    .line 13
    .line 14
    .line 15
    move-result-wide v2

    .line 16
    invoke-direct {v0, v1, v2, v3}, Lcom/momo/xeengine/xnative/XWindowImpl;-><init>(Ljava/util/concurrent/Executor;J)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/momo/xeengine/game/GameEngine;->window:Lcom/momo/xeengine/xnative/XWindowImpl;

    .line 20
    .line 21
    new-instance v0, Lcom/momo/xeengine/XELogger;

    .line 22
    .line 23
    iget-wide v1, p0, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;->engineIns:J

    .line 24
    .line 25
    invoke-virtual {p0, v1, v2}, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;->nativeGetLogger(J)J

    .line 26
    .line 27
    .line 28
    move-result-wide v1

    .line 29
    invoke-direct {v0, v1, v2}, Lcom/momo/xeengine/XELogger;-><init>(J)V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Lcom/momo/xeengine/game/GameEngine;->logger:Lcom/momo/xeengine/XELogger;

    .line 33
    .line 34
    new-instance v0, Lcom/momo/xeengine/lua/XELuaEngine;

    .line 35
    .line 36
    iget-object v1, p0, Lcom/momo/xeengine/game/GameEngine;->renderThreadExecutor:Lcom/momo/xeengine/utils/XERenderThreadExecutor;

    .line 37
    .line 38
    iget-wide v2, p0, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;->engineIns:J

    .line 39
    .line 40
    invoke-virtual {p0, v2, v3}, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;->nativeGetScriptEngine(J)J

    .line 41
    .line 42
    .line 43
    move-result-wide v2

    .line 44
    invoke-direct {v0, v1, v2, v3}, Lcom/momo/xeengine/lua/XELuaEngine;-><init>(Ljava/util/concurrent/Executor;J)V

    .line 45
    .line 46
    .line 47
    iput-object v0, p0, Lcom/momo/xeengine/game/GameEngine;->luaEngine:Lcom/momo/xeengine/lua/XELuaEngine;

    .line 48
    .line 49
    new-instance v0, Lcom/momo/xeengine/xnative/XEEventDispatcher;

    .line 50
    .line 51
    iget-wide v1, p0, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;->engineIns:J

    .line 52
    .line 53
    invoke-virtual {p0, v1, v2}, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;->nativeGetEventDispatcher(J)J

    .line 54
    .line 55
    .line 56
    move-result-wide v1

    .line 57
    invoke-direct {v0, v1, v2}, Lcom/momo/xeengine/xnative/XEEventDispatcher;-><init>(J)V

    .line 58
    .line 59
    .line 60
    iput-object v0, p0, Lcom/momo/xeengine/game/GameEngine;->eventDispatcher:Lcom/momo/xeengine/xnative/XEEventDispatcher;

    .line 61
    .line 62
    return-void
.end method

.method private renderImpl()V
    .locals 7

    .line 1
    iget-wide v0, p0, Lcom/momo/xeengine/game/GameEngine;->renderTime:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    iput-wide v0, p0, Lcom/momo/xeengine/game/GameEngine;->renderTime:J

    .line 14
    .line 15
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    iget-object v2, p0, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;->mEngineListeners:Ljava/util/Set;

    .line 20
    .line 21
    invoke-interface {v2}, Ljava/util/Set;->size()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-lez v2, :cond_1

    .line 26
    .line 27
    new-instance v2, Ljava/util/HashSet;

    .line 28
    .line 29
    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 30
    .line 31
    .line 32
    iget-object v3, p0, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;->mEngineListeners:Ljava/util/Set;

    .line 33
    .line 34
    monitor-enter v3

    .line 35
    :try_start_0
    iget-object v4, p0, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;->mEngineListeners:Ljava/util/Set;

    .line 36
    .line 37
    invoke-interface {v2, v4}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 38
    .line 39
    .line 40
    monitor-exit v3

    .line 41
    goto :goto_0

    .line 42
    :catchall_0
    move-exception p0

    .line 43
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 44
    throw p0

    .line 45
    :cond_1
    const/4 v2, 0x0

    .line 46
    :goto_0
    if-eqz v2, :cond_2

    .line 47
    .line 48
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    if-eqz v4, :cond_2

    .line 57
    .line 58
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v4

    .line 62
    check-cast v4, Lcom/momo/xeengine/xnative/IXEngineListener;

    .line 63
    .line 64
    invoke-interface {v4}, Lcom/momo/xeengine/xnative/IXEngineListener;->preRender()V

    .line 65
    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_2
    iget-wide v3, p0, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;->engineIns:J

    .line 69
    .line 70
    iget-wide v5, p0, Lcom/momo/xeengine/game/GameEngine;->renderTime:J

    .line 71
    .line 72
    sub-long v5, v0, v5

    .line 73
    .line 74
    invoke-virtual {p0, v3, v4, v5, v6}, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;->nativeRender(JJ)V

    .line 75
    .line 76
    .line 77
    if-eqz v2, :cond_3

    .line 78
    .line 79
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 84
    .line 85
    .line 86
    move-result v3

    .line 87
    if-eqz v3, :cond_3

    .line 88
    .line 89
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object v3

    .line 93
    check-cast v3, Lcom/momo/xeengine/xnative/IXEngineListener;

    .line 94
    .line 95
    invoke-interface {v3}, Lcom/momo/xeengine/xnative/IXEngineListener;->postRender()V

    .line 96
    .line 97
    .line 98
    goto :goto_2

    .line 99
    :cond_3
    iput-wide v0, p0, Lcom/momo/xeengine/game/GameEngine;->renderTime:J

    .line 100
    .line 101
    return-void
.end method


# virtual methods
.method public addLibraryPath(Ljava/lang/String;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/momo/xeengine/game/GameEngine;->renderThreadExecutor:Lcom/momo/xeengine/utils/XERenderThreadExecutor;

    .line 9
    .line 10
    new-instance v1, Ll/wkj;

    .line 11
    .line 12
    invoke-direct {v1, p0, p1}, Ll/wkj;-><init>(Lcom/momo/xeengine/game/GameEngine;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/momo/xeengine/utils/XERenderThreadExecutor;->execute(Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public getEventDispatcher()Lcom/momo/xeengine/event/IXEventDispatcher;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/game/GameEngine;->eventDispatcher:Lcom/momo/xeengine/xnative/XEEventDispatcher;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLogger()Lcom/momo/xeengine/XELogger;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/game/GameEngine;->logger:Lcom/momo/xeengine/XELogger;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRenderMode()Lcom/momo/xeengine/game/GameEngine$RenderMode;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/game/GameEngine;->renderMode:Lcom/momo/xeengine/game/GameEngine$RenderMode;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRenderThreadExecutor()Lcom/momo/xeengine/utils/XERenderThreadExecutor;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/game/GameEngine;->renderThreadExecutor:Lcom/momo/xeengine/utils/XERenderThreadExecutor;

    .line 2
    .line 3
    return-object p0
.end method

.method public getScriptBridge()Lcom/momo/xeengine/script/ScriptBridge;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/game/GameEngine;->luaEngine:Lcom/momo/xeengine/lua/XELuaEngine;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/momo/xeengine/lua/XELuaEngine;->getScriptBridge()Lcom/momo/xeengine/script/ScriptBridge;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public getScriptEngine()Lcom/momo/xeengine/lua/XELuaEngine;
    .locals 0

    .line 6
    iget-object p0, p0, Lcom/momo/xeengine/game/GameEngine;->luaEngine:Lcom/momo/xeengine/lua/XELuaEngine;

    return-object p0
.end method

.method public bridge synthetic getScriptEngine()Lcom/momo/xeengine/script/XEScriptEngine;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/momo/xeengine/game/GameEngine;->getScriptEngine()Lcom/momo/xeengine/lua/XELuaEngine;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getTag()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/game/GameEngine;->logger:Lcom/momo/xeengine/XELogger;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/momo/xeengine/XELogger;->getTag()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public getWindow()Lcom/momo/xeengine/xnative/IXWindow;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/game/GameEngine;->window:Lcom/momo/xeengine/xnative/XWindowImpl;

    .line 2
    .line 3
    return-object p0
.end method

.method public postTickEvent()V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;->engineIns:J

    .line 2
    .line 3
    invoke-virtual {p0, v0, v1}, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;->nativePostTickEvent(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public release()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/game/GameEngine;->window:Lcom/momo/xeengine/xnative/XWindowImpl;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/momo/xeengine/xnative/XWindowImpl;->release()V

    .line 7
    .line 8
    .line 9
    iput-object v1, p0, Lcom/momo/xeengine/game/GameEngine;->window:Lcom/momo/xeengine/xnative/XWindowImpl;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/momo/xeengine/game/GameEngine;->luaEngine:Lcom/momo/xeengine/lua/XELuaEngine;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/momo/xeengine/lua/XELuaEngine;->release()V

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Lcom/momo/xeengine/game/GameEngine;->luaEngine:Lcom/momo/xeengine/lua/XELuaEngine;

    .line 19
    .line 20
    :cond_1
    iget-object v0, p0, Lcom/momo/xeengine/game/GameEngine;->logger:Lcom/momo/xeengine/XELogger;

    .line 21
    .line 22
    if-eqz v0, :cond_2

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/momo/xeengine/XELogger;->release()V

    .line 25
    .line 26
    .line 27
    iput-object v1, p0, Lcom/momo/xeengine/game/GameEngine;->logger:Lcom/momo/xeengine/XELogger;

    .line 28
    .line 29
    :cond_2
    iget-object v0, p0, Lcom/momo/xeengine/game/GameEngine;->eventDispatcher:Lcom/momo/xeengine/xnative/XEEventDispatcher;

    .line 30
    .line 31
    if-eqz v0, :cond_3

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/momo/xeengine/xnative/XEEventDispatcher;->release()V

    .line 34
    .line 35
    .line 36
    iput-object v1, p0, Lcom/momo/xeengine/game/GameEngine;->eventDispatcher:Lcom/momo/xeengine/xnative/XEEventDispatcher;

    .line 37
    .line 38
    :cond_3
    iget-object v0, p0, Lcom/momo/xeengine/game/GameEngine;->renderThreadExecutor:Lcom/momo/xeengine/utils/XERenderThreadExecutor;

    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/momo/xeengine/utils/XERenderThreadExecutor;->release()V

    .line 41
    .line 42
    .line 43
    iget-wide v0, p0, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;->engineIns:J

    .line 44
    .line 45
    const-wide/16 v2, 0x0

    .line 46
    .line 47
    cmp-long v0, v0, v2

    .line 48
    .line 49
    if-eqz v0, :cond_4

    .line 50
    .line 51
    invoke-virtual {p0}, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;->nativeReleaseEngine()V

    .line 52
    .line 53
    .line 54
    iput-wide v2, p0, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;->engineIns:J

    .line 55
    .line 56
    :cond_4
    return-void
.end method

.method public removeLibraryPath(Ljava/lang/String;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/momo/xeengine/game/GameEngine;->renderThreadExecutor:Lcom/momo/xeengine/utils/XERenderThreadExecutor;

    .line 9
    .line 10
    new-instance v1, Ll/ukj;

    .line 11
    .line 12
    invoke-direct {v1, p0, p1}, Ll/ukj;-><init>(Lcom/momo/xeengine/game/GameEngine;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/momo/xeengine/utils/XERenderThreadExecutor;->execute(Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public render()Z
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;->engineIns:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_2

    .line 9
    .line 10
    iget-object v0, p0, Lcom/momo/xeengine/game/GameEngine;->eventDispatcher:Lcom/momo/xeengine/xnative/XEEventDispatcher;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/momo/xeengine/xnative/XEEventDispatcher;->executeQueue()V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/momo/xeengine/game/GameEngine;->renderThreadExecutor:Lcom/momo/xeengine/utils/XERenderThreadExecutor;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/momo/xeengine/utils/XERenderThreadExecutor;->executeQueue()V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/momo/xeengine/game/GameEngine;->renderMode:Lcom/momo/xeengine/game/GameEngine$RenderMode;

    .line 21
    .line 22
    sget-object v2, Lcom/momo/xeengine/game/GameEngine$RenderMode;->Auto:Lcom/momo/xeengine/game/GameEngine$RenderMode;

    .line 23
    .line 24
    const/4 v3, 0x1

    .line 25
    if-ne v0, v2, :cond_0

    .line 26
    .line 27
    invoke-direct {p0}, Lcom/momo/xeengine/game/GameEngine;->renderImpl()V

    .line 28
    .line 29
    .line 30
    return v3

    .line 31
    :cond_0
    iget-boolean v0, p0, Lcom/momo/xeengine/game/GameEngine;->needUpdate:Z

    .line 32
    .line 33
    if-eqz v0, :cond_2

    .line 34
    .line 35
    iget-object v0, p0, Lcom/momo/xeengine/game/GameEngine;->beforeUpdateRunnable:Ljava/lang/Runnable;

    .line 36
    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 40
    .line 41
    .line 42
    const/4 v0, 0x0

    .line 43
    iput-object v0, p0, Lcom/momo/xeengine/game/GameEngine;->beforeUpdateRunnable:Ljava/lang/Runnable;

    .line 44
    .line 45
    :cond_1
    invoke-direct {p0}, Lcom/momo/xeengine/game/GameEngine;->renderImpl()V

    .line 46
    .line 47
    .line 48
    iput-boolean v1, p0, Lcom/momo/xeengine/game/GameEngine;->needUpdate:Z

    .line 49
    .line 50
    return v3

    .line 51
    :cond_2
    return v1
.end method

.method public requestRender()V
    .locals 1

    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/momo/xeengine/game/GameEngine;->needUpdate:Z

    return-void
.end method

.method public requestRender(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/momo/xeengine/game/GameEngine;->needUpdate:Z

    .line 3
    .line 4
    iput-object p1, p0, Lcom/momo/xeengine/game/GameEngine;->beforeUpdateRunnable:Ljava/lang/Runnable;

    .line 5
    .line 6
    return-void
.end method

.method public sendEvent(Lcom/momo/xeengine/event/XEvent;)V
    .locals 2
    .param p1    # Lcom/momo/xeengine/event/XEvent;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    instance-of v0, p1, Lcom/momo/xeengine/event/DataEvent;

    .line 5
    .line 6
    if-eqz v0, :cond_2

    .line 7
    .line 8
    check-cast p1, Lcom/momo/xeengine/event/DataEvent;

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/momo/xeengine/event/DataEvent;->getName()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    iget-object v0, p0, Lcom/momo/xeengine/game/GameEngine;->renderThreadExecutor:Lcom/momo/xeengine/utils/XERenderThreadExecutor;

    .line 22
    .line 23
    new-instance v1, Ll/skj;

    .line 24
    .line 25
    invoke-direct {v1, p0, p1}, Ll/skj;-><init>(Lcom/momo/xeengine/game/GameEngine;Lcom/momo/xeengine/event/DataEvent;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Lcom/momo/xeengine/utils/XERenderThreadExecutor;->execute(Ljava/lang/Runnable;)V

    .line 29
    .line 30
    .line 31
    :cond_2
    :goto_0
    return-void
.end method

.method public setOnBackground(Z)V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;->engineIns:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, v0, v1, p1}, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;->nativeSetOnBackground(JZ)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public setRenderMode(Lcom/momo/xeengine/game/GameEngine$RenderMode;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/game/GameEngine;->renderMode:Lcom/momo/xeengine/game/GameEngine$RenderMode;

    .line 2
    .line 3
    return-void
.end method

.method public setTag(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/game/GameEngine;->logger:Lcom/momo/xeengine/XELogger;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/xeengine/XELogger;->setTag(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setUserAudioPlayer(Lcom/momo/xeengine/audio/IXAudioPlayer;)V
    .locals 2
    .param p1    # Lcom/momo/xeengine/audio/IXAudioPlayer;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/momo/xeengine/game/GameEngine;->renderThreadExecutor:Lcom/momo/xeengine/utils/XERenderThreadExecutor;

    .line 5
    .line 6
    new-instance v1, Ll/vkj;

    .line 7
    .line 8
    invoke-direct {v1, p0, p1}, Ll/vkj;-><init>(Lcom/momo/xeengine/game/GameEngine;Lcom/momo/xeengine/audio/IXAudioPlayer;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/momo/xeengine/utils/XERenderThreadExecutor;->execute(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public showDebugInfo(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/game/GameEngine;->renderThreadExecutor:Lcom/momo/xeengine/utils/XERenderThreadExecutor;

    .line 2
    .line 3
    new-instance v1, Ll/tkj;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/tkj;-><init>(Lcom/momo/xeengine/game/GameEngine;Z)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/momo/xeengine/utils/XERenderThreadExecutor;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
