.class public final Lcom/momo/xeengine/lua/LuaScriptBridge;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/xeengine/script/ScriptBridge;


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/xeengine/lua/LuaScriptBridge$JCallback;
    }
.end annotation


# instance fields
.field private final executor:Ljava/util/concurrent/Executor;

.field private final handlers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private nativePointer:J


# direct methods
.method public constructor <init>(Ljava/util/concurrent/Executor;J)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/momo/xeengine/lua/LuaScriptBridge;->handlers:Ljava/util/Map;

    .line 10
    .line 11
    iput-object p1, p0, Lcom/momo/xeengine/lua/LuaScriptBridge;->executor:Ljava/util/concurrent/Executor;

    .line 12
    .line 13
    iput-wide p2, p0, Lcom/momo/xeengine/lua/LuaScriptBridge;->nativePointer:J

    .line 14
    .line 15
    invoke-direct {p0, p2, p3, p0}, Lcom/momo/xeengine/lua/LuaScriptBridge;->nativeBindJavaObj(JLcom/momo/xeengine/lua/LuaScriptBridge;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic a(Lcom/momo/xeengine/lua/LuaScriptBridge;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    .line 1
    iget-wide v1, p0, Lcom/momo/xeengine/lua/LuaScriptBridge;->nativePointer:J

    .line 2
    .line 3
    const-wide/16 v3, 0x0

    .line 4
    .line 5
    cmp-long v0, v1, v3

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    move-object v0, p0

    .line 10
    move-object v3, p1

    .line 11
    move-object v4, p2

    .line 12
    move-object v5, p3

    .line 13
    invoke-direct/range {v0 .. v5}, Lcom/momo/xeengine/lua/LuaScriptBridge;->nativeJavaCallLua(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public static synthetic access$100(Lcom/momo/xeengine/lua/LuaScriptBridge;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/xeengine/lua/LuaScriptBridge;->nativePointer:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$200(JLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/momo/xeengine/lua/LuaScriptBridge;->nativeCallback(JLjava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$300(J)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/momo/xeengine/lua/LuaScriptBridge;->nativeDeleteCallbackFunc(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private callFormScript(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/momo/xeengine/lua/ScriptException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/lua/LuaScriptBridge;->handlers:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_2

    .line 8
    .line 9
    instance-of v0, p0, Ljava/lang/Class;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    check-cast p0, Ljava/lang/Class;

    .line 15
    .line 16
    move-object v0, v1

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    move-object v3, v0

    .line 23
    move-object v0, p0

    .line 24
    move-object p0, v3

    .line 25
    :goto_0
    :try_start_0
    const-class v2, Ljava/lang/String;

    .line 26
    .line 27
    filled-new-array {v2}, [Ljava/lang/Class;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {p0, p2, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    filled-new-array {p3}, [Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p3

    .line 39
    invoke-virtual {p0, v0, p3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    instance-of p3, p0, Ljava/lang/String;

    .line 44
    .line 45
    if-eqz p3, :cond_1

    .line 46
    .line 47
    check-cast p0, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 48
    .line 49
    return-object p0

    .line 50
    :cond_1
    return-object v1

    .line 51
    :catchall_0
    const-string p0, "error to call method "

    .line 52
    .line 53
    invoke-static {p0, p2, p1}, Ll/ghw;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    return-object v1

    .line 57
    :catch_0
    const-string p0, "no method "

    .line 58
    .line 59
    invoke-static {p0, p2, p1}, Ll/ghw;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    return-object v1

    .line 63
    :cond_2
    new-instance p0, Lcom/momo/xeengine/lua/ScriptException;

    .line 64
    .line 65
    new-instance p2, Ljava/lang/StringBuilder;

    .line 66
    .line 67
    const-string p3, "no handler  "

    .line 68
    .line 69
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-direct {p0, p1}, Lcom/momo/xeengine/lua/ScriptException;-><init>(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    throw p0
.end method

.method private native nativeBindJavaObj(JLcom/momo/xeengine/lua/LuaScriptBridge;)V
.end method

.method private static native nativeCallback(JLjava/lang/String;)V
.end method

.method private static native nativeDeleteCallbackFunc(J)V
.end method

.method private native nativeJavaCallLua(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
.end method


# virtual methods
.method public add(Ljava/lang/Object;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/momo/xeengine/lua/LuaScriptBridge;->regist(Ljava/lang/Object;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public call(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/momo/xeengine/lua/LuaScriptBridge;->nativePointer:J

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
    if-nez v0, :cond_0

    .line 9
    .line 10
    return-object v1

    .line 11
    :cond_0
    iget-object v0, p0, Lcom/momo/xeengine/lua/LuaScriptBridge;->executor:Ljava/util/concurrent/Executor;

    .line 12
    .line 13
    new-instance v2, Ll/hhw;

    .line 14
    .line 15
    invoke-direct {v2, p0, p1, p2, p3}, Ll/hhw;-><init>(Lcom/momo/xeengine/lua/LuaScriptBridge;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-interface {v0, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 19
    .line 20
    .line 21
    return-object v1
.end method

.method public callFormScript(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/momo/xeengine/lua/ScriptException;
        }
    .end annotation

    .line 83
    iget-object v0, p0, Lcom/momo/xeengine/lua/LuaScriptBridge;->handlers:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 84
    instance-of v1, v0, Ljava/lang/Class;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 85
    check-cast v0, Ljava/lang/Class;

    move-object v1, v2

    goto :goto_0

    .line 86
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    .line 87
    :goto_0
    :try_start_0
    const-class v3, Ljava/lang/String;

    const-class v4, Lcom/momo/xeengine/script/ScriptBridge$Callback;

    filled-new-array {v3, v4}, [Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v0, p2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 88
    new-instance v3, Lcom/momo/xeengine/lua/LuaScriptBridge$JCallback;

    invoke-direct {v3, p0, p4, p5, v2}, Lcom/momo/xeengine/lua/LuaScriptBridge$JCallback;-><init>(Lcom/momo/xeengine/lua/LuaScriptBridge;JLcom/momo/xeengine/lua/LuaScriptBridge$1;)V

    filled-new-array {p3, v3}, [Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v1, p0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    .line 89
    :catchall_0
    const-string p0, "error to call method "

    invoke-static {p0, p2, p1}, Ll/ghw;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void

    .line 90
    :catch_0
    const-string p0, "no method "

    invoke-static {p0, p2, p1}, Ll/ghw;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void

    .line 91
    :cond_1
    new-instance p0, Lcom/momo/xeengine/lua/ScriptException;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "no handler  "

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/momo/xeengine/lua/ScriptException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public luaCallJava(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/momo/xeengine/lua/ScriptException;
        }
    .end annotation

    .line 1
    const-string v0, ":"

    .line 2
    .line 3
    invoke-virtual {p2, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    add-int/lit8 v0, v0, -0x1

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {p2, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    :cond_0
    invoke-direct {p0, p1, p2, p3}, Lcom/momo/xeengine/lua/LuaScriptBridge;->callFormScript(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public luaCallJavaAsync(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/momo/xeengine/lua/ScriptException;
        }
    .end annotation

    .line 1
    const-string v0, ":"

    .line 2
    .line 3
    invoke-virtual {p2, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    add-int/lit8 v0, v0, -0x1

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {p2, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    :cond_0
    move-object v0, p0

    .line 21
    move-object v1, p1

    .line 22
    move-object v2, p2

    .line 23
    move-object v3, p3

    .line 24
    move-wide v4, p4

    .line 25
    invoke-virtual/range {v0 .. v5}, Lcom/momo/xeengine/lua/LuaScriptBridge;->callFormScript(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public regist(Ljava/lang/Object;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/lua/LuaScriptBridge;->handlers:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public release()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/momo/xeengine/lua/LuaScriptBridge;->unregistAll()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/momo/xeengine/lua/LuaScriptBridge;->nativePointer:J

    .line 7
    .line 8
    return-void
.end method

.method public remove(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/momo/xeengine/lua/LuaScriptBridge;->unregist(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public removeAll()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/momo/xeengine/lua/LuaScriptBridge;->unregistAll()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public unregist(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/lua/LuaScriptBridge;->handlers:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public unregistAll()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/lua/LuaScriptBridge;->handlers:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/Map;->clear()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
