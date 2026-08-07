.class final Lcom/momo/xeengine/lightningrender/LightningRenderImpl;
.super Lcom/momo/xeengine/lightningrender/LightningRenderJNI;
.source "SourceFile"

# interfaces
.implements Lcom/momo/xeengine/lightningrender/ILightningRender;


# instance fields
.field private eventDispatcher:Lcom/momo/xeengine/xnative/XEEventDispatcher;

.field private final innerProcessorName:Ljava/lang/String;

.field private logger:Lcom/momo/xeengine/XELogger;

.field private luaEngine:Lcom/momo/xeengine/lua/XELuaEngine;

.field private final mBeautyLevel:Lcom/momo/xeengine/lightningrender/ILightningRender$IBeautyLevel;

.field private final mLookupLevel:Lcom/momo/xeengine/lightningrender/ILightningRender$ILookupLevel;

.field private final mMakeupLevel:Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;

.field private final mStickerLevel:Lcom/momo/xeengine/lightningrender/ILightningRender$IStickerLevel;

.field private mStickerListener:Lcom/momo/xeengine/lightningrender/ILightningRender$StickerListener;

.field private final renderThreadExecutor:Lcom/momo/xeengine/utils/XERenderThreadExecutor;

.field private tag:Ljava/lang/String;

.field private final useInnerProcessor:Z

.field private window:Lcom/momo/xeengine/xnative/XWindowImpl;


# direct methods
.method public constructor <init>(Ljava/lang/String;ZLjava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/momo/xeengine/utils/XERenderThreadExecutor;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/momo/xeengine/utils/XERenderThreadExecutor;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->renderThreadExecutor:Lcom/momo/xeengine/utils/XERenderThreadExecutor;

    .line 10
    .line 11
    new-instance v0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;-><init>(Lcom/momo/xeengine/lightningrender/LightningRenderImpl;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->mMakeupLevel:Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;

    .line 17
    .line 18
    new-instance v0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;-><init>(Lcom/momo/xeengine/lightningrender/LightningRenderImpl;)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->mBeautyLevel:Lcom/momo/xeengine/lightningrender/ILightningRender$IBeautyLevel;

    .line 24
    .line 25
    new-instance v0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$3;

    .line 26
    .line 27
    invoke-direct {v0, p0}, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$3;-><init>(Lcom/momo/xeengine/lightningrender/LightningRenderImpl;)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->mLookupLevel:Lcom/momo/xeengine/lightningrender/ILightningRender$ILookupLevel;

    .line 31
    .line 32
    const/4 v0, 0x0

    .line 33
    iput-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->mStickerListener:Lcom/momo/xeengine/lightningrender/ILightningRender$StickerListener;

    .line 34
    .line 35
    new-instance v0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$4;

    .line 36
    .line 37
    invoke-direct {v0, p0}, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$4;-><init>(Lcom/momo/xeengine/lightningrender/LightningRenderImpl;)V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->mStickerLevel:Lcom/momo/xeengine/lightningrender/ILightningRender$IStickerLevel;

    .line 41
    .line 42
    iput-object p1, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->tag:Ljava/lang/String;

    .line 43
    .line 44
    iput-boolean p2, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->useInnerProcessor:Z

    .line 45
    .line 46
    iput-object p3, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->innerProcessorName:Ljava/lang/String;

    .line 47
    .line 48
    return-void
.end method

.method public static synthetic a(Lcom/momo/xeengine/lightningrender/LightningRenderImpl;Ljava/lang/String;)V
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

.method public static synthetic access$000(Lcom/momo/xeengine/lightningrender/LightningRenderImpl;)Lcom/momo/xeengine/utils/XERenderThreadExecutor;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->renderThreadExecutor:Lcom/momo/xeengine/utils/XERenderThreadExecutor;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$102(Lcom/momo/xeengine/lightningrender/LightningRenderImpl;Lcom/momo/xeengine/lightningrender/ILightningRender$StickerListener;)Lcom/momo/xeengine/lightningrender/ILightningRender$StickerListener;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->mStickerListener:Lcom/momo/xeengine/lightningrender/ILightningRender$StickerListener;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic b(Lcom/momo/xeengine/lightningrender/LightningRenderImpl;Lcom/momo/xeengine/event/DataEvent;)V
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

.method public static synthetic c(Lcom/momo/xeengine/lightningrender/LightningRenderImpl;Lcom/momo/xeengine/audio/IXAudioPlayer;)V
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

.method public static synthetic d(Lcom/momo/xeengine/lightningrender/LightningRenderImpl;Z)V
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

.method public static synthetic e(Lcom/momo/xeengine/lightningrender/LightningRenderImpl;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;->nativeAddLibraryPath(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
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
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->renderThreadExecutor:Lcom/momo/xeengine/utils/XERenderThreadExecutor;

    .line 9
    .line 10
    new-instance v1, Lcom/momo/xeengine/lightningrender/b;

    .line 11
    .line 12
    invoke-direct {v1, p0, p1}, Lcom/momo/xeengine/lightningrender/b;-><init>(Lcom/momo/xeengine/lightningrender/LightningRenderImpl;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/momo/xeengine/utils/XERenderThreadExecutor;->execute(Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public getBeautyLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$IBeautyLevel;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->mBeautyLevel:Lcom/momo/xeengine/lightningrender/ILightningRender$IBeautyLevel;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCartoonFaceEnable()Z
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->lightningRenderPointer:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v2, v0, v2

    .line 7
    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, v0, v1}, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->nativeGetCartoonFaceEnable(J)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    goto :goto_0

    .line 15
    :catchall_0
    move-exception v0

    .line 16
    goto :goto_1

    .line 17
    :cond_0
    const/4 v0, 0x0

    .line 18
    :goto_0
    monitor-exit p0

    .line 19
    return v0

    .line 20
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    throw v0
.end method

.method public getEventDispatcher()Lcom/momo/xeengine/event/IXEventDispatcher;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->eventDispatcher:Lcom/momo/xeengine/xnative/XEEventDispatcher;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLogger()Lcom/momo/xeengine/XELogger;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->logger:Lcom/momo/xeengine/XELogger;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLookupLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$ILookupLevel;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->mLookupLevel:Lcom/momo/xeengine/lightningrender/ILightningRender$ILookupLevel;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMakeupLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->mMakeupLevel:Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;

    .line 2
    .line 3
    return-object p0
.end method

.method public getScriptBridge()Lcom/momo/xeengine/script/ScriptBridge;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->luaEngine:Lcom/momo/xeengine/lua/XELuaEngine;

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

.method public getScriptEngine()Lcom/momo/xeengine/script/XEScriptEngine;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->luaEngine:Lcom/momo/xeengine/lua/XELuaEngine;

    .line 2
    .line 3
    return-object p0
.end method

.method public getStickerLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$IStickerLevel;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->mStickerLevel:Lcom/momo/xeengine/lightningrender/ILightningRender$IStickerLevel;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTag()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->tag:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public init()V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->lightningRenderPointer:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v0, v0, v2

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    invoke-static {}, Lcom/momo/xeengine/XEngineModuleManager;->engineLibraryLoaded()V

    .line 11
    .line 12
    .line 13
    iget-boolean v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->useInnerProcessor:Z

    .line 14
    .line 15
    iget-object v1, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->innerProcessorName:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p0, v0, v1}, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->nativeLightningRenderCreate(ZLjava/lang/String;)J

    .line 18
    .line 19
    .line 20
    move-result-wide v0

    .line 21
    iput-wide v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->lightningRenderPointer:J

    .line 22
    .line 23
    invoke-virtual {p0, v0, v1}, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->nativeGetEngineInstance(J)J

    .line 24
    .line 25
    .line 26
    move-result-wide v0

    .line 27
    iput-wide v0, p0, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;->engineIns:J

    .line 28
    .line 29
    new-instance v2, Lcom/momo/xeengine/xnative/XWindowImpl;

    .line 30
    .line 31
    iget-object v3, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->renderThreadExecutor:Lcom/momo/xeengine/utils/XERenderThreadExecutor;

    .line 32
    .line 33
    invoke-virtual {p0, v0, v1}, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;->nativeGetWindow(J)J

    .line 34
    .line 35
    .line 36
    move-result-wide v0

    .line 37
    invoke-direct {v2, v3, v0, v1}, Lcom/momo/xeengine/xnative/XWindowImpl;-><init>(Ljava/util/concurrent/Executor;J)V

    .line 38
    .line 39
    .line 40
    iput-object v2, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->window:Lcom/momo/xeengine/xnative/XWindowImpl;

    .line 41
    .line 42
    new-instance v0, Lcom/momo/xeengine/XELogger;

    .line 43
    .line 44
    iget-wide v1, p0, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;->engineIns:J

    .line 45
    .line 46
    invoke-virtual {p0, v1, v2}, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;->nativeGetLogger(J)J

    .line 47
    .line 48
    .line 49
    move-result-wide v1

    .line 50
    invoke-direct {v0, v1, v2}, Lcom/momo/xeengine/XELogger;-><init>(J)V

    .line 51
    .line 52
    .line 53
    iput-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->logger:Lcom/momo/xeengine/XELogger;

    .line 54
    .line 55
    iget-object v1, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->tag:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Lcom/momo/xeengine/XELogger;->setTag(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->logger:Lcom/momo/xeengine/XELogger;

    .line 61
    .line 62
    const/4 v1, 0x1

    .line 63
    invoke-virtual {v0, v1}, Lcom/momo/xeengine/XELogger;->setLogEnable(Z)V

    .line 64
    .line 65
    .line 66
    new-instance v0, Lcom/momo/xeengine/lua/XELuaEngine;

    .line 67
    .line 68
    iget-object v1, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->renderThreadExecutor:Lcom/momo/xeengine/utils/XERenderThreadExecutor;

    .line 69
    .line 70
    iget-wide v2, p0, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;->engineIns:J

    .line 71
    .line 72
    invoke-virtual {p0, v2, v3}, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;->nativeGetScriptEngine(J)J

    .line 73
    .line 74
    .line 75
    move-result-wide v2

    .line 76
    invoke-direct {v0, v1, v2, v3}, Lcom/momo/xeengine/lua/XELuaEngine;-><init>(Ljava/util/concurrent/Executor;J)V

    .line 77
    .line 78
    .line 79
    iput-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->luaEngine:Lcom/momo/xeengine/lua/XELuaEngine;

    .line 80
    .line 81
    new-instance v0, Lcom/momo/xeengine/xnative/XEEventDispatcher;

    .line 82
    .line 83
    iget-wide v1, p0, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;->engineIns:J

    .line 84
    .line 85
    invoke-virtual {p0, v1, v2}, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;->nativeGetEventDispatcher(J)J

    .line 86
    .line 87
    .line 88
    move-result-wide v1

    .line 89
    invoke-direct {v0, v1, v2}, Lcom/momo/xeengine/xnative/XEEventDispatcher;-><init>(J)V

    .line 90
    .line 91
    .line 92
    iput-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->eventDispatcher:Lcom/momo/xeengine/xnative/XEEventDispatcher;

    .line 93
    .line 94
    invoke-static {p0}, Lcom/momo/xeengine/XEngineModuleManager;->engineCreate(Lcom/momo/xeengine/IXEngine;)V

    .line 95
    .line 96
    .line 97
    goto :goto_0

    .line 98
    :catchall_0
    move-exception v0

    .line 99
    goto :goto_1

    .line 100
    :cond_0
    :goto_0
    monitor-exit p0

    .line 101
    return-void

    .line 102
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 103
    throw v0
.end method

.method public onStickerPlayCompleted(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JII)V
    .locals 0

    .line 1
    iget-object p4, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->mStickerListener:Lcom/momo/xeengine/lightningrender/ILightningRender$StickerListener;

    .line 2
    .line 3
    if-eqz p4, :cond_0

    .line 4
    .line 5
    new-instance p4, Lcom/momo/xeengine/lightningrender/StickerModel;

    .line 6
    .line 7
    invoke-direct {p4}, Lcom/momo/xeengine/lightningrender/StickerModel;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p4, p1}, Lcom/momo/xeengine/lightningrender/StickerModel;->setAssetPath(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p4, p2}, Lcom/momo/xeengine/lightningrender/StickerModel;->setStickerId(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p4, p3}, Lcom/momo/xeengine/lightningrender/StickerModel;->setBusinessType(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p4, p6}, Lcom/momo/xeengine/lightningrender/StickerModel;->setUserFlag(I)V

    .line 20
    .line 21
    .line 22
    :try_start_0
    iget-object p0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->mStickerListener:Lcom/momo/xeengine/lightningrender/ILightningRender$StickerListener;

    .line 23
    .line 24
    invoke-interface {p0, p4}, Lcom/momo/xeengine/lightningrender/ILightningRender$StickerListener;->onStickerCompleted(Lcom/momo/xeengine/lightningrender/StickerModel;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    .line 26
    .line 27
    :catchall_0
    :cond_0
    return-void
.end method

.method public preprocessor([BILandroid/util/Size;ILjava/util/Map;)Ljava/util/Map;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([BI",
            "Landroid/util/Size;",
            "I",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->lightningRenderPointer:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v0, v0, v2

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    new-instance v10, Ljava/util/HashMap;

    .line 11
    .line 12
    invoke-direct {v10}, Ljava/util/HashMap;-><init>()V

    .line 13
    .line 14
    .line 15
    iget-wide v2, p0, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->lightningRenderPointer:J

    .line 16
    .line 17
    invoke-virtual {p3}, Landroid/util/Size;->getWidth()I

    .line 18
    .line 19
    .line 20
    move-result v6

    .line 21
    invoke-virtual {p3}, Landroid/util/Size;->getHeight()I

    .line 22
    .line 23
    .line 24
    move-result v7

    .line 25
    move-object v1, p0

    .line 26
    move-object v4, p1

    .line 27
    move v5, p2

    .line 28
    move v8, p4

    .line 29
    move-object/from16 v9, p5

    .line 30
    .line 31
    invoke-virtual/range {v1 .. v10}, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->nativePreprocessor(J[BIIIILjava/util/Map;Ljava/util/Map;)Z

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :catchall_0
    move-exception v0

    .line 36
    move-object p1, v0

    .line 37
    goto :goto_1

    .line 38
    :cond_0
    const/4 v10, 0x0

    .line 39
    :goto_0
    monitor-exit p0

    .line 40
    return-object v10

    .line 41
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 42
    throw p1
.end method

.method public release()V
    .locals 5

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->lightningRenderPointer:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v4, v0, v2

    .line 7
    .line 8
    if-eqz v4, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, v0, v1}, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->nativeLightningRenderRelease(J)V

    .line 11
    .line 12
    .line 13
    iput-wide v2, p0, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->lightningRenderPointer:J

    .line 14
    .line 15
    iput-wide v2, p0, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;->engineIns:J

    .line 16
    .line 17
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->window:Lcom/momo/xeengine/xnative/XWindowImpl;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/momo/xeengine/xnative/XWindowImpl;->release()V

    .line 20
    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    iput-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->window:Lcom/momo/xeengine/xnative/XWindowImpl;

    .line 24
    .line 25
    iget-object v1, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->logger:Lcom/momo/xeengine/XELogger;

    .line 26
    .line 27
    invoke-virtual {v1}, Lcom/momo/xeengine/XELogger;->release()V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->logger:Lcom/momo/xeengine/XELogger;

    .line 31
    .line 32
    iget-object v1, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->luaEngine:Lcom/momo/xeengine/lua/XELuaEngine;

    .line 33
    .line 34
    invoke-virtual {v1}, Lcom/momo/xeengine/lua/XELuaEngine;->release()V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->luaEngine:Lcom/momo/xeengine/lua/XELuaEngine;

    .line 38
    .line 39
    iget-object v1, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->eventDispatcher:Lcom/momo/xeengine/xnative/XEEventDispatcher;

    .line 40
    .line 41
    invoke-virtual {v1}, Lcom/momo/xeengine/xnative/XEEventDispatcher;->release()V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->eventDispatcher:Lcom/momo/xeengine/xnative/XEEventDispatcher;

    .line 45
    .line 46
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->renderThreadExecutor:Lcom/momo/xeengine/utils/XERenderThreadExecutor;

    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/momo/xeengine/utils/XERenderThreadExecutor;->release()V

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :catchall_0
    move-exception v0

    .line 53
    goto :goto_1

    .line 54
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;->runReleaseQueue()V

    .line 55
    .line 56
    .line 57
    monitor-exit p0

    .line 58
    return-void

    .line 59
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 60
    throw v0
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
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->renderThreadExecutor:Lcom/momo/xeengine/utils/XERenderThreadExecutor;

    .line 9
    .line 10
    new-instance v1, Lcom/momo/xeengine/lightningrender/e;

    .line 11
    .line 12
    invoke-direct {v1, p0, p1}, Lcom/momo/xeengine/lightningrender/e;-><init>(Lcom/momo/xeengine/lightningrender/LightningRenderImpl;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/momo/xeengine/utils/XERenderThreadExecutor;->execute(Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public render(II)V
    .locals 4

    .line 1
    invoke-static {p0}, Lcom/momo/xeengine/L/L;->M(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    monitor-enter p0

    .line 9
    :try_start_0
    iget-wide v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->lightningRenderPointer:J

    .line 10
    .line 11
    const-wide/16 v2, 0x0

    .line 12
    .line 13
    cmp-long v2, v0, v2

    .line 14
    .line 15
    if-eqz v2, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0, v0, v1, p1, p2}, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->nativeDrawFrame(JII)V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :catchall_0
    move-exception p1

    .line 22
    goto :goto_1

    .line 23
    :cond_1
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    const/16 p0, 0xb44

    .line 25
    .line 26
    invoke-static {p0}, Landroid/opengl/GLES20;->glDisable(I)V

    .line 27
    .line 28
    .line 29
    const/16 p0, 0xc11

    .line 30
    .line 31
    invoke-static {p0}, Landroid/opengl/GLES20;->glDisable(I)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 36
    throw p1
.end method

.method public renderTest()Z
    .locals 1

    const/4 v0, 0x0

    .line 56
    invoke-virtual {p0, v0, v0}, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->renderTest(II)Z

    move-result p0

    return p0
.end method

.method public renderTest(II)Z
    .locals 6

    .line 1
    invoke-static {p0}, Lcom/momo/xeengine/L/L;->M(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    monitor-enter p0

    .line 10
    :try_start_0
    iget-wide v2, p0, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->lightningRenderPointer:J

    .line 11
    .line 12
    const-wide/16 v4, 0x0

    .line 13
    .line 14
    cmp-long v0, v2, v4

    .line 15
    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->renderThreadExecutor:Lcom/momo/xeengine/utils/XERenderThreadExecutor;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/momo/xeengine/utils/XERenderThreadExecutor;->init()V

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    if-le p1, v0, :cond_1

    .line 25
    .line 26
    if-le p2, v0, :cond_1

    .line 27
    .line 28
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->window:Lcom/momo/xeengine/xnative/XWindowImpl;

    .line 29
    .line 30
    invoke-virtual {v0, p1, p2}, Lcom/momo/xeengine/xnative/XWindowImpl;->SetSize(II)V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :catchall_0
    move-exception p1

    .line 35
    goto :goto_1

    .line 36
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->renderThreadExecutor:Lcom/momo/xeengine/utils/XERenderThreadExecutor;

    .line 37
    .line 38
    invoke-virtual {p1}, Lcom/momo/xeengine/utils/XERenderThreadExecutor;->executeQueue()V

    .line 39
    .line 40
    .line 41
    iget-wide p1, p0, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->lightningRenderPointer:J

    .line 42
    .line 43
    invoke-virtual {p0, p1, p2}, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->nativeRenderTest(J)Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    iget-object p1, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->eventDispatcher:Lcom/momo/xeengine/xnative/XEEventDispatcher;

    .line 48
    .line 49
    invoke-virtual {p1}, Lcom/momo/xeengine/xnative/XEEventDispatcher;->executeQueue()V

    .line 50
    .line 51
    .line 52
    :cond_2
    monitor-exit p0

    .line 53
    return v1

    .line 54
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 55
    throw p1
.end method

.method public runOnRenderThread(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->renderThreadExecutor:Lcom/momo/xeengine/utils/XERenderThreadExecutor;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/momo/xeengine/utils/XERenderThreadExecutor;->execute(Ljava/lang/Runnable;)V

    .line 4
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
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->renderThreadExecutor:Lcom/momo/xeengine/utils/XERenderThreadExecutor;

    .line 22
    .line 23
    new-instance v1, Lcom/momo/xeengine/lightningrender/d;

    .line 24
    .line 25
    invoke-direct {v1, p0, p1}, Lcom/momo/xeengine/lightningrender/d;-><init>(Lcom/momo/xeengine/lightningrender/LightningRenderImpl;Lcom/momo/xeengine/event/DataEvent;)V

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

.method public setCartoonFaceEnable(Z)V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->lightningRenderPointer:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v2, v0, v2

    .line 7
    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, v0, v1, p1}, Lcom/momo/xeengine/lightningrender/LightningRenderJNI;->nativeSetCartoonFaceEnable(JZ)V

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catchall_0
    move-exception p1

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    :goto_0
    monitor-exit p0

    .line 17
    return-void

    .line 18
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    throw p1
.end method

.method public setTag(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->tag:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->logger:Lcom/momo/xeengine/XELogger;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/momo/xeengine/XELogger;->setTag(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
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
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->renderThreadExecutor:Lcom/momo/xeengine/utils/XERenderThreadExecutor;

    .line 5
    .line 6
    new-instance v1, Lcom/momo/xeengine/lightningrender/c;

    .line 7
    .line 8
    invoke-direct {v1, p0, p1}, Lcom/momo/xeengine/lightningrender/c;-><init>(Lcom/momo/xeengine/lightningrender/LightningRenderImpl;Lcom/momo/xeengine/audio/IXAudioPlayer;)V

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
    .locals 1

    .line 1
    new-instance v0, Lcom/momo/xeengine/lightningrender/a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/momo/xeengine/lightningrender/a;-><init>(Lcom/momo/xeengine/lightningrender/LightningRenderImpl;Z)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->runOnRenderThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
