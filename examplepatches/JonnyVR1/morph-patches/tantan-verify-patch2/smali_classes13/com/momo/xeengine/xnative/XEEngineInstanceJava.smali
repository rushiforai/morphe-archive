.class public abstract Lcom/momo/xeengine/xnative/XEEngineInstanceJava;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation


# instance fields
.field protected engineIns:J

.field protected final mEngineListeners:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/momo/xeengine/xnative/IXEngineListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashSet;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;->mEngineListeners:Ljava/util/Set;

    .line 10
    .line 11
    return-void
.end method

.method private native nativeAddLibraryPath(JLjava/lang/String;)V
.end method

.method private native nativeReleaseEngine(J)V
.end method


# virtual methods
.method public addEngineListener(Lcom/momo/xeengine/xnative/IXEngineListener;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;->mEngineListeners:Ljava/util/Set;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;->mEngineListeners:Ljava/util/Set;

    .line 5
    .line 6
    invoke-interface {p0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    monitor-exit v0

    .line 10
    return-void

    .line 11
    :catchall_0
    move-exception p0

    .line 12
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    throw p0
.end method

.method public getEngineIns()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;->engineIns:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public nativeAddLibraryPath(Ljava/lang/String;)V
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
    invoke-direct {p0, v0, v1, p1}, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;->nativeAddLibraryPath(JLjava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public native nativeCreateEngine()J
.end method

.method public native nativeGetEventDispatcher(J)J
.end method

.method public native nativeGetLogger(J)J
.end method

.method public native nativeGetScriptEngine(J)J
.end method

.method public native nativeGetWindow(J)J
.end method

.method public native nativePostTickEvent(J)V
.end method

.method public nativeReleaseEngine()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;->runReleaseQueue()V

    .line 2
    .line 3
    .line 4
    iget-wide v0, p0, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;->engineIns:J

    .line 5
    .line 6
    invoke-direct {p0, v0, v1}, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;->nativeReleaseEngine(J)V

    .line 7
    .line 8
    .line 9
    const-wide/16 v0, 0x0

    .line 10
    .line 11
    iput-wide v0, p0, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;->engineIns:J

    .line 12
    .line 13
    return-void
.end method

.method public native nativeRemoveLibraryPath(JLjava/lang/String;)V
.end method

.method public native nativeRender(JJ)V
.end method

.method public native nativeSendDataEvent(JLjava/lang/String;Ljava/lang/String;)V
.end method

.method public native nativeSetOnBackground(JZ)V
.end method

.method public native nativeSetUserAudioPlayer(JLcom/momo/xeengine/audio/IXAudioPlayer;)V
.end method

.method public native nativeShowDebugInfo(JZ)V
.end method

.method public runReleaseQueue()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;->mEngineListeners:Ljava/util/Set;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/momo/xeengine/xnative/XEEngineInstanceJava;->mEngineListeners:Ljava/util/Set;

    .line 5
    .line 6
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Lcom/momo/xeengine/xnative/IXEngineListener;

    .line 21
    .line 22
    invoke-interface {v1}, Lcom/momo/xeengine/xnative/IXEngineListener;->onEngineRelease()V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :catchall_0
    move-exception p0

    .line 27
    goto :goto_1

    .line 28
    :cond_0
    monitor-exit v0

    .line 29
    return-void

    .line 30
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    throw p0
.end method
