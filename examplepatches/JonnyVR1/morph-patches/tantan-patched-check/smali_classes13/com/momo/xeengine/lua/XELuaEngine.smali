.class public final Lcom/momo/xeengine/lua/XELuaEngine;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/xeengine/script/XEScriptEngine;


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation


# instance fields
.field private final executor:Ljava/util/concurrent/Executor;

.field private mLuaScriptBridge:Lcom/momo/xeengine/lua/LuaScriptBridge;

.field private mPointer:J


# direct methods
.method public constructor <init>(Ljava/util/concurrent/Executor;J)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/momo/xeengine/lua/XELuaEngine;->executor:Ljava/util/concurrent/Executor;

    .line 5
    .line 6
    iput-wide p2, p0, Lcom/momo/xeengine/lua/XELuaEngine;->mPointer:J

    .line 7
    .line 8
    new-instance v0, Lcom/momo/xeengine/lua/LuaScriptBridge;

    .line 9
    .line 10
    invoke-direct {p0, p2, p3}, Lcom/momo/xeengine/lua/XELuaEngine;->nativeGetScriptBridge(J)J

    .line 11
    .line 12
    .line 13
    move-result-wide p2

    .line 14
    invoke-direct {v0, p1, p2, p3}, Lcom/momo/xeengine/lua/LuaScriptBridge;-><init>(Ljava/util/concurrent/Executor;J)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/momo/xeengine/lua/XELuaEngine;->mLuaScriptBridge:Lcom/momo/xeengine/lua/LuaScriptBridge;

    .line 18
    .line 19
    return-void
.end method

.method public static synthetic a(Lcom/momo/xeengine/lua/XELuaEngine;Lcom/momo/xeengine/script/XEScriptEngine$XEScriptEngineRegister;)V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/momo/xeengine/lua/XELuaEngine;->mPointer:J

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
    invoke-direct {p0, v0, v1}, Lcom/momo/xeengine/lua/XELuaEngine;->nativeGetLuaState(J)J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    invoke-interface {p1, v0, v1}, Lcom/momo/xeengine/script/XEScriptEngine$XEScriptEngineRegister;->register(J)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public static synthetic b(Lcom/momo/xeengine/lua/XELuaEngine;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/xeengine/lua/XELuaEngine;->mPointer:J

    .line 2
    .line 3
    invoke-direct {p0, v0, v1, p1}, Lcom/momo/xeengine/lua/XELuaEngine;->nativeSetSecretKey(JLjava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic c(Lcom/momo/xeengine/lua/XELuaEngine;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/momo/xeengine/lua/XELuaEngine;->mPointer:J

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
    invoke-direct {p0, v0, v1, p1, p2}, Lcom/momo/xeengine/lua/XELuaEngine;->nativeStartGameScriptFile(JLjava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public static synthetic d(Lcom/momo/xeengine/lua/XELuaEngine;Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/momo/xeengine/lua/XELuaEngine;->mPointer:J

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
    invoke-direct {p0, v0, v1, p1}, Lcom/momo/xeengine/lua/XELuaEngine;->nativeExecuteString(JLjava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public static synthetic e(Lcom/momo/xeengine/lua/XELuaEngine;Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/momo/xeengine/lua/XELuaEngine;->mPointer:J

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
    invoke-direct {p0, v0, v1, p1}, Lcom/momo/xeengine/lua/XELuaEngine;->nativeExecuteScriptFile(JLjava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method private native nativeExecuteScriptFile(JLjava/lang/String;)V
.end method

.method private native nativeExecuteString(JLjava/lang/String;)V
.end method

.method private native nativeGetLuaState(J)J
.end method

.method private native nativeGetScriptBridge(J)J
.end method

.method private native nativeSetSecretKey(JLjava/lang/String;)V
.end method

.method private native nativeStartGameScriptFile(JLjava/lang/String;Ljava/lang/String;)V
.end method


# virtual methods
.method public callOnPause()V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/momo/xeengine/lua/XELuaEngine;->mPointer:J

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
    invoke-virtual {p0, v0, v1}, Lcom/momo/xeengine/lua/XELuaEngine;->nativeCallOnPause(J)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public callOnResume()V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/momo/xeengine/lua/XELuaEngine;->mPointer:J

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
    invoke-virtual {p0, v0, v1}, Lcom/momo/xeengine/lua/XELuaEngine;->nativeCallOnResume(J)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public executeScriptFile(Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/momo/xeengine/lua/XELuaEngine;->mPointer:J

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
    goto :goto_0

    .line 10
    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    :goto_0
    return-void

    .line 17
    :cond_1
    iget-object v0, p0, Lcom/momo/xeengine/lua/XELuaEngine;->executor:Ljava/util/concurrent/Executor;

    .line 18
    .line 19
    new-instance v1, Ll/plq0;

    .line 20
    .line 21
    invoke-direct {v1, p0, p1}, Ll/plq0;-><init>(Lcom/momo/xeengine/lua/XELuaEngine;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public executeScriptString(Ljava/lang/String;)V
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
    iget-object v0, p0, Lcom/momo/xeengine/lua/XELuaEngine;->executor:Ljava/util/concurrent/Executor;

    .line 9
    .line 10
    new-instance v1, Ll/tlq0;

    .line 11
    .line 12
    invoke-direct {v1, p0, p1}, Ll/tlq0;-><init>(Lcom/momo/xeengine/lua/XELuaEngine;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public getNative()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/xeengine/lua/XELuaEngine;->mPointer:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getScriptBridge()Lcom/momo/xeengine/script/ScriptBridge;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/lua/XELuaEngine;->mLuaScriptBridge:Lcom/momo/xeengine/lua/LuaScriptBridge;

    .line 2
    .line 3
    return-object p0
.end method

.method public native nativeCallOnPause(J)V
.end method

.method public native nativeCallOnResume(J)V
.end method

.method public registerModule(Lcom/momo/xeengine/script/XEScriptEngine$XEScriptEngineRegister;)V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/momo/xeengine/lua/XELuaEngine;->mPointer:J

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
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/momo/xeengine/lua/XELuaEngine;->executor:Ljava/util/concurrent/Executor;

    .line 11
    .line 12
    new-instance v1, Ll/rlq0;

    .line 13
    .line 14
    invoke-direct {v1, p0, p1}, Ll/rlq0;-><init>(Lcom/momo/xeengine/lua/XELuaEngine;Lcom/momo/xeengine/script/XEScriptEngine$XEScriptEngineRegister;)V

    .line 15
    .line 16
    .line 17
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public release()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/momo/xeengine/lua/XELuaEngine;->mPointer:J

    .line 4
    .line 5
    iget-object v0, p0, Lcom/momo/xeengine/lua/XELuaEngine;->mLuaScriptBridge:Lcom/momo/xeengine/lua/LuaScriptBridge;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/momo/xeengine/lua/LuaScriptBridge;->release()V

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-object v0, p0, Lcom/momo/xeengine/lua/XELuaEngine;->mLuaScriptBridge:Lcom/momo/xeengine/lua/LuaScriptBridge;

    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public setSecretKey(Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/momo/xeengine/lua/XELuaEngine;->mPointer:J

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
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/momo/xeengine/lua/XELuaEngine;->executor:Ljava/util/concurrent/Executor;

    .line 11
    .line 12
    new-instance v1, Ll/slq0;

    .line 13
    .line 14
    invoke-direct {v1, p0, p1}, Ll/slq0;-><init>(Lcom/momo/xeengine/lua/XELuaEngine;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public startGameScriptFile(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 19
    invoke-virtual {p0, p1, v0}, Lcom/momo/xeengine/lua/XELuaEngine;->startGameScriptFile(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public startGameScriptFile(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

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
    iget-object v0, p0, Lcom/momo/xeengine/lua/XELuaEngine;->executor:Ljava/util/concurrent/Executor;

    .line 9
    .line 10
    new-instance v1, Ll/qlq0;

    .line 11
    .line 12
    invoke-direct {v1, p0, p1, p2}, Ll/qlq0;-><init>(Lcom/momo/xeengine/lua/XELuaEngine;Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
