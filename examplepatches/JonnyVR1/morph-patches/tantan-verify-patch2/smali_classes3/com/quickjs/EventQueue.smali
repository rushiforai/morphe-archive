.class Lcom/quickjs/EventQueue;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/quickjs/QuickJSNative;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/quickjs/EventQueue$Event;
    }
.end annotation


# instance fields
.field private final handler:Landroid/os/Handler;

.field private final handlerThread:Landroid/os/HandlerThread;

.field private final quickJS:Lcom/quickjs/QuickJS;

.field private final quickJSNative:Lcom/quickjs/QuickJSNative;

.field private final thread:Ljava/lang/Thread;

.field private final threadChecker:Lcom/quickjs/ThreadChecker;


# direct methods
.method public constructor <init>(Lcom/quickjs/QuickJS;Landroid/os/HandlerThread;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/quickjs/EventQueue;->quickJS:Lcom/quickjs/QuickJS;

    .line 5
    .line 6
    new-instance v0, Lcom/quickjs/QuickJSNativeImpl;

    .line 7
    .line 8
    invoke-direct {v0}, Lcom/quickjs/QuickJSNativeImpl;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/quickjs/EventQueue;->quickJSNative:Lcom/quickjs/QuickJSNative;

    .line 12
    .line 13
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lcom/quickjs/EventQueue;->thread:Ljava/lang/Thread;

    .line 18
    .line 19
    iput-object p2, p0, Lcom/quickjs/EventQueue;->handlerThread:Landroid/os/HandlerThread;

    .line 20
    .line 21
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    if-eqz p2, :cond_0

    .line 26
    .line 27
    new-instance p2, Landroid/os/Handler;

    .line 28
    .line 29
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-direct {p2, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    const/4 p2, 0x0

    .line 38
    :goto_0
    iput-object p2, p0, Lcom/quickjs/EventQueue;->handler:Landroid/os/Handler;

    .line 39
    .line 40
    new-instance p2, Lcom/quickjs/ThreadChecker;

    .line 41
    .line 42
    invoke-direct {p2, p1}, Lcom/quickjs/ThreadChecker;-><init>(Lcom/quickjs/QuickJS;)V

    .line 43
    .line 44
    .line 45
    iput-object p2, p0, Lcom/quickjs/EventQueue;->threadChecker:Lcom/quickjs/ThreadChecker;

    .line 46
    .line 47
    return-void
.end method

.method public static synthetic A(Lcom/quickjs/EventQueue;JIZ)Lcom/quickjs/JSFunction;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/quickjs/EventQueue;->quickJSNative:Lcom/quickjs/QuickJSNative;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2, p3, p4}, Lcom/quickjs/QuickJSNative;->_initNewJSFunction(JIZ)Lcom/quickjs/JSFunction;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic a(Lcom/quickjs/EventQueue;JJIDJ)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/quickjs/EventQueue;->quickJSNative:Lcom/quickjs/QuickJSNative;

    .line 2
    .line 3
    invoke-interface/range {p0 .. p9}, Lcom/quickjs/QuickJSNative;->_releasePtr(JJIDJ)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic b(Lcom/quickjs/EventQueue;JLcom/quickjs/JSValue;Ljava/lang/String;IZ)Lcom/quickjs/JSFunction;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/quickjs/EventQueue;->quickJSNative:Lcom/quickjs/QuickJSNative;

    .line 2
    .line 3
    invoke-interface/range {p0 .. p6}, Lcom/quickjs/QuickJSNative;->_registerJavaMethod(JLcom/quickjs/JSValue;Ljava/lang/String;IZ)Lcom/quickjs/JSFunction;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic c([Ljava/lang/Object;Lcom/quickjs/EventQueue$Event;[Ljava/lang/RuntimeException;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    invoke-interface {p1}, Lcom/quickjs/EventQueue$Event;->run()Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    aput-object p1, p0, v0
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :catch_0
    move-exception p1

    .line 10
    aput-object p1, p2, v0

    .line 11
    .line 12
    :goto_0
    monitor-enter p0

    .line 13
    :try_start_1
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 14
    .line 15
    const/4 p2, 0x1

    .line 16
    aput-object p1, p0, p2

    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 19
    .line 20
    .line 21
    monitor-exit p0

    .line 22
    return-void

    .line 23
    :catchall_0
    move-exception p1

    .line 24
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 25
    throw p1
.end method

.method public static synthetic d(Lcom/quickjs/EventQueue;JILcom/quickjs/JSValue;Ljava/lang/String;Lcom/quickjs/JSValue;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/quickjs/EventQueue;->quickJSNative:Lcom/quickjs/QuickJSNative;

    .line 2
    .line 3
    invoke-interface/range {p0 .. p6}, Lcom/quickjs/QuickJSNative;->_executeFunction(JILcom/quickjs/JSValue;Ljava/lang/String;Lcom/quickjs/JSValue;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic e(Lcom/quickjs/EventQueue;JLcom/quickjs/JSValue;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/quickjs/EventQueue;->quickJSNative:Lcom/quickjs/QuickJSNative;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2, p3}, Lcom/quickjs/QuickJSNative;->_isUndefined(JLcom/quickjs/JSValue;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic f(Lcom/quickjs/EventQueue;JLcom/quickjs/JSValue;)[Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/quickjs/EventQueue;->quickJSNative:Lcom/quickjs/QuickJSNative;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2, p3}, Lcom/quickjs/QuickJSNative;->_getKeys(JLcom/quickjs/JSValue;)[Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic g(Lcom/quickjs/EventQueue;J)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/quickjs/EventQueue;->quickJSNative:Lcom/quickjs/QuickJSNative;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Lcom/quickjs/QuickJSNative;->_releaseContext(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic h(Lcom/quickjs/EventQueue;Ljava/lang/Runnable;[Ljava/lang/RuntimeException;Z[Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/quickjs/EventQueue;->quickJS:Lcom/quickjs/QuickJS;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/quickjs/QuickJS;->isReleased()Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    if-nez p0, :cond_0

    .line 11
    .line 12
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catch_0
    move-exception p0

    .line 17
    const/4 p1, 0x0

    .line 18
    aput-object p0, p2, p1

    .line 19
    .line 20
    :cond_0
    :goto_0
    if-eqz p3, :cond_1

    .line 21
    .line 22
    monitor-enter p4

    .line 23
    :try_start_1
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 24
    .line 25
    const/4 p1, 0x1

    .line 26
    aput-object p0, p4, p1

    .line 27
    .line 28
    invoke-virtual {p4}, Ljava/lang/Object;->notifyAll()V

    .line 29
    .line 30
    .line 31
    monitor-exit p4

    .line 32
    goto :goto_1

    .line 33
    :catchall_0
    move-exception p0

    .line 34
    monitor-exit p4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 35
    throw p0

    .line 36
    :cond_1
    :goto_1
    return-void
.end method

.method public static synthetic i(Lcom/quickjs/EventQueue;J)Lcom/quickjs/JSValue;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/quickjs/EventQueue;->quickJSNative:Lcom/quickjs/QuickJSNative;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Lcom/quickjs/QuickJSNative;->_Undefined(J)Lcom/quickjs/JSValue;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic j(Lcom/quickjs/EventQueue;JILcom/quickjs/JSValue;Lcom/quickjs/JSValue;Lcom/quickjs/JSValue;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/quickjs/EventQueue;->quickJSNative:Lcom/quickjs/QuickJSNative;

    .line 2
    .line 3
    invoke-interface/range {p0 .. p6}, Lcom/quickjs/QuickJSNative;->_executeFunction2(JILcom/quickjs/JSValue;Lcom/quickjs/JSValue;Lcom/quickjs/JSValue;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic k(Lcom/quickjs/EventQueue;JLcom/quickjs/JSArray;I)Lcom/quickjs/JSValue;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/quickjs/EventQueue;->quickJSNative:Lcom/quickjs/QuickJSNative;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2, p3, p4}, Lcom/quickjs/QuickJSNative;->_arrayGetValue(JLcom/quickjs/JSArray;I)Lcom/quickjs/JSValue;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic l(Lcom/quickjs/EventQueue;J)Lcom/quickjs/JSArray;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/quickjs/EventQueue;->quickJSNative:Lcom/quickjs/QuickJSNative;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Lcom/quickjs/QuickJSNative;->_initNewJSArray(J)Lcom/quickjs/JSArray;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic m(Lcom/quickjs/EventQueue;JLcom/quickjs/JSValue;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/quickjs/EventQueue;->quickJSNative:Lcom/quickjs/QuickJSNative;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2, p3}, Lcom/quickjs/QuickJSNative;->_getObjectType(JLcom/quickjs/JSValue;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic n(Lcom/quickjs/EventQueue;J)Lcom/quickjs/JSObject;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/quickjs/EventQueue;->quickJSNative:Lcom/quickjs/QuickJSNative;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Lcom/quickjs/QuickJSNative;->_initNewJSObject(J)Lcom/quickjs/JSObject;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic o(Lcom/quickjs/EventQueue;J)[Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/quickjs/EventQueue;->quickJSNative:Lcom/quickjs/QuickJSNative;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Lcom/quickjs/QuickJSNative;->_getException(J)[Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic p(Lcom/quickjs/EventQueue;JILcom/quickjs/JSValue;Ljava/lang/String;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/quickjs/EventQueue;->quickJSNative:Lcom/quickjs/QuickJSNative;

    .line 2
    .line 3
    invoke-interface/range {p0 .. p5}, Lcom/quickjs/QuickJSNative;->_get(JILcom/quickjs/JSValue;Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method private post(Lcom/quickjs/EventQueue$Event;)Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/quickjs/EventQueue$Event<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/quickjs/EventQueue;->quickJS:Lcom/quickjs/QuickJS;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/quickjs/QuickJS;->isReleased()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_5

    .line 8
    .line 9
    iget-object v0, p0, Lcom/quickjs/EventQueue;->handlerThread:Landroid/os/HandlerThread;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Thread;->isInterrupted()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    goto :goto_2

    .line 20
    :cond_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object v1, p0, Lcom/quickjs/EventQueue;->thread:Ljava/lang/Thread;

    .line 25
    .line 26
    if-ne v0, v1, :cond_1

    .line 27
    .line 28
    invoke-interface {p1}, Lcom/quickjs/EventQueue$Event;->run()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0

    .line 33
    :cond_1
    iget-object v0, p0, Lcom/quickjs/EventQueue;->handler:Landroid/os/Handler;

    .line 34
    .line 35
    if-nez v0, :cond_2

    .line 36
    .line 37
    iget-object p0, p0, Lcom/quickjs/EventQueue;->threadChecker:Lcom/quickjs/ThreadChecker;

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/quickjs/ThreadChecker;->checkThread()V

    .line 40
    .line 41
    .line 42
    invoke-interface {p1}, Lcom/quickjs/EventQueue$Event;->run()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0

    .line 47
    :cond_2
    const/4 p0, 0x2

    .line 48
    new-array p0, p0, [Ljava/lang/Object;

    .line 49
    .line 50
    const/4 v1, 0x1

    .line 51
    new-array v2, v1, [Ljava/lang/RuntimeException;

    .line 52
    .line 53
    new-instance v3, Lcom/quickjs/x;

    .line 54
    .line 55
    invoke-direct {v3, p0, p1, v2}, Lcom/quickjs/x;-><init>([Ljava/lang/Object;Lcom/quickjs/EventQueue$Event;[Ljava/lang/RuntimeException;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 59
    .line 60
    .line 61
    monitor-enter p0

    .line 62
    :try_start_0
    aget-object p1, p0, v1

    .line 63
    .line 64
    if-nez p1, :cond_3

    .line 65
    .line 66
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :catchall_0
    move-exception p1

    .line 71
    goto :goto_1

    .line 72
    :catch_0
    move-exception p1

    .line 73
    :try_start_1
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 74
    .line 75
    .line 76
    :cond_3
    :goto_0
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 77
    const/4 p1, 0x0

    .line 78
    aget-object v0, v2, p1

    .line 79
    .line 80
    if-nez v0, :cond_4

    .line 81
    .line 82
    aget-object p0, p0, p1

    .line 83
    .line 84
    return-object p0

    .line 85
    :cond_4
    throw v0

    .line 86
    :goto_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 87
    throw p1

    .line 88
    :cond_5
    :goto_2
    const-string p0, "QuickJS"

    .line 89
    .line 90
    const-string p1, "QuickJS is released"

    .line 91
    .line 92
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    .line 94
    .line 95
    const/4 p0, 0x0

    .line 96
    return-object p0
.end method

.method public static synthetic q(Lcom/quickjs/EventQueue;JLcom/quickjs/JSValue;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/quickjs/EventQueue;->quickJSNative:Lcom/quickjs/QuickJSNative;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2, p3, p4}, Lcom/quickjs/QuickJSNative;->_contains(JLcom/quickjs/JSValue;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic r(Lcom/quickjs/EventQueue;J)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/quickjs/EventQueue;->quickJSNative:Lcom/quickjs/QuickJSNative;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Lcom/quickjs/QuickJSNative;->_releaseRuntime(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic s(Lcom/quickjs/EventQueue;J)Lcom/quickjs/JSObject;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/quickjs/EventQueue;->quickJSNative:Lcom/quickjs/QuickJSNative;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Lcom/quickjs/QuickJSNative;->_getGlobalObject(J)Lcom/quickjs/JSObject;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic t(Lcom/quickjs/EventQueue;JILjava/lang/String;Ljava/lang/String;I)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/quickjs/EventQueue;->quickJSNative:Lcom/quickjs/QuickJSNative;

    .line 2
    .line 3
    invoke-interface/range {p0 .. p6}, Lcom/quickjs/QuickJSNative;->_executeScript(JILjava/lang/String;Ljava/lang/String;I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic u(Lcom/quickjs/EventQueue;JLcom/quickjs/JSValue;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/quickjs/EventQueue;->quickJSNative:Lcom/quickjs/QuickJSNative;

    .line 2
    .line 3
    invoke-interface/range {p0 .. p5}, Lcom/quickjs/QuickJSNative;->_set(JLcom/quickjs/JSValue;Ljava/lang/String;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic v(Lcom/quickjs/EventQueue;JLcom/quickjs/JSObject;Ljava/lang/String;)Lcom/quickjs/JSValue;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/quickjs/EventQueue;->quickJSNative:Lcom/quickjs/QuickJSNative;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2, p3, p4}, Lcom/quickjs/QuickJSNative;->_getValue(JLcom/quickjs/JSObject;Ljava/lang/String;)Lcom/quickjs/JSValue;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic w(Lcom/quickjs/EventQueue;JILjava/lang/String;I)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/quickjs/EventQueue;->quickJSNative:Lcom/quickjs/QuickJSNative;

    .line 2
    .line 3
    invoke-interface/range {p0 .. p5}, Lcom/quickjs/QuickJSNative;->_executeBinaryScript(JILjava/lang/String;I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic x(Lcom/quickjs/EventQueue;JLcom/quickjs/JSValue;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/quickjs/EventQueue;->quickJSNative:Lcom/quickjs/QuickJSNative;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2, p3, p4}, Lcom/quickjs/QuickJSNative;->_arrayAdd(JLcom/quickjs/JSValue;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic y(Lcom/quickjs/EventQueue;JI)Lcom/quickjs/JSFunction;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/quickjs/EventQueue;->quickJSNative:Lcom/quickjs/QuickJSNative;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2, p3}, Lcom/quickjs/QuickJSNative;->_newClass(JI)Lcom/quickjs/JSFunction;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic z(Lcom/quickjs/EventQueue;JILcom/quickjs/JSValue;I)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/quickjs/EventQueue;->quickJSNative:Lcom/quickjs/QuickJSNative;

    .line 2
    .line 3
    invoke-interface/range {p0 .. p5}, Lcom/quickjs/QuickJSNative;->_arrayGet(JILcom/quickjs/JSValue;I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method


# virtual methods
.method public _Undefined(J)Lcom/quickjs/JSValue;
    .locals 1

    .line 1
    new-instance v0, Lcom/quickjs/f;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/quickjs/f;-><init>(Lcom/quickjs/EventQueue;J)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/quickjs/EventQueue;->post(Lcom/quickjs/EventQueue$Event;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lcom/quickjs/JSValue;

    .line 11
    .line 12
    return-object p0
.end method

.method public _arrayAdd(JLcom/quickjs/JSValue;Ljava/lang/Object;)V
    .locals 6

    .line 1
    new-instance v0, Lcom/quickjs/k;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-wide v2, p1

    .line 5
    move-object v4, p3

    .line 6
    move-object v5, p4

    .line 7
    invoke-direct/range {v0 .. v5}, Lcom/quickjs/k;-><init>(Lcom/quickjs/EventQueue;JLcom/quickjs/JSValue;Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, v0}, Lcom/quickjs/EventQueue;->postVoid(Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public _arrayGet(JILcom/quickjs/JSValue;I)Ljava/lang/Object;
    .locals 7

    .line 1
    new-instance v0, Lcom/quickjs/q;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-wide v2, p1

    .line 5
    move v4, p3

    .line 6
    move-object v5, p4

    .line 7
    move v6, p5

    .line 8
    invoke-direct/range {v0 .. v6}, Lcom/quickjs/q;-><init>(Lcom/quickjs/EventQueue;JILcom/quickjs/JSValue;I)V

    .line 9
    .line 10
    .line 11
    invoke-direct {v1, v0}, Lcom/quickjs/EventQueue;->post(Lcom/quickjs/EventQueue$Event;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public _arrayGetValue(JLcom/quickjs/JSArray;I)Lcom/quickjs/JSValue;
    .locals 6

    .line 1
    new-instance v0, Lcom/quickjs/i;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-wide v2, p1

    .line 5
    move-object v4, p3

    .line 6
    move v5, p4

    .line 7
    invoke-direct/range {v0 .. v5}, Lcom/quickjs/i;-><init>(Lcom/quickjs/EventQueue;JLcom/quickjs/JSArray;I)V

    .line 8
    .line 9
    .line 10
    invoke-direct {v1, v0}, Lcom/quickjs/EventQueue;->post(Lcom/quickjs/EventQueue$Event;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Lcom/quickjs/JSValue;

    .line 15
    .line 16
    return-object p0
.end method

.method public _contains(JLcom/quickjs/JSValue;Ljava/lang/String;)Z
    .locals 6

    .line 1
    new-instance v0, Lcom/quickjs/l;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-wide v2, p1

    .line 5
    move-object v4, p3

    .line 6
    move-object v5, p4

    .line 7
    invoke-direct/range {v0 .. v5}, Lcom/quickjs/l;-><init>(Lcom/quickjs/EventQueue;JLcom/quickjs/JSValue;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-direct {v1, v0}, Lcom/quickjs/EventQueue;->post(Lcom/quickjs/EventQueue$Event;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Ljava/lang/Boolean;

    .line 15
    .line 16
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0
.end method

.method public _createContext(J)J
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/quickjs/EventQueue;->quickJSNative:Lcom/quickjs/QuickJSNative;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Lcom/quickjs/QuickJSNative;->_createContext(J)J

    .line 4
    .line 5
    .line 6
    move-result-wide p0

    .line 7
    return-wide p0
.end method

.method public _executeBinaryScript(JILjava/lang/String;I)Ljava/lang/Object;
    .locals 7

    .line 1
    new-instance v0, Lcom/quickjs/d;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-wide v2, p1

    .line 5
    move v4, p3

    .line 6
    move-object v5, p4

    .line 7
    move v6, p5

    .line 8
    invoke-direct/range {v0 .. v6}, Lcom/quickjs/d;-><init>(Lcom/quickjs/EventQueue;JILjava/lang/String;I)V

    .line 9
    .line 10
    .line 11
    invoke-direct {v1, v0}, Lcom/quickjs/EventQueue;->post(Lcom/quickjs/EventQueue$Event;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public _executeFunction(JILcom/quickjs/JSValue;Ljava/lang/String;Lcom/quickjs/JSValue;)Ljava/lang/Object;
    .locals 8

    .line 1
    new-instance v0, Lcom/quickjs/m;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-wide v2, p1

    .line 5
    move v4, p3

    .line 6
    move-object v5, p4

    .line 7
    move-object v6, p5

    .line 8
    move-object v7, p6

    .line 9
    invoke-direct/range {v0 .. v7}, Lcom/quickjs/m;-><init>(Lcom/quickjs/EventQueue;JILcom/quickjs/JSValue;Ljava/lang/String;Lcom/quickjs/JSValue;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {v1, v0}, Lcom/quickjs/EventQueue;->post(Lcom/quickjs/EventQueue$Event;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public _executeFunction2(JILcom/quickjs/JSValue;Lcom/quickjs/JSValue;Lcom/quickjs/JSValue;)Ljava/lang/Object;
    .locals 8

    .line 1
    new-instance v0, Lcom/quickjs/a;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-wide v2, p1

    .line 5
    move v4, p3

    .line 6
    move-object v5, p4

    .line 7
    move-object v6, p5

    .line 8
    move-object v7, p6

    .line 9
    invoke-direct/range {v0 .. v7}, Lcom/quickjs/a;-><init>(Lcom/quickjs/EventQueue;JILcom/quickjs/JSValue;Lcom/quickjs/JSValue;Lcom/quickjs/JSValue;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {v1, v0}, Lcom/quickjs/EventQueue;->post(Lcom/quickjs/EventQueue$Event;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public _executeScript(JILjava/lang/String;Ljava/lang/String;I)Ljava/lang/Object;
    .locals 8

    .line 1
    new-instance v0, Lcom/quickjs/n;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-wide v2, p1

    .line 5
    move v4, p3

    .line 6
    move-object v5, p4

    .line 7
    move-object v6, p5

    .line 8
    move v7, p6

    .line 9
    invoke-direct/range {v0 .. v7}, Lcom/quickjs/n;-><init>(Lcom/quickjs/EventQueue;JILjava/lang/String;Ljava/lang/String;I)V

    .line 10
    .line 11
    .line 12
    invoke-direct {v1, v0}, Lcom/quickjs/EventQueue;->post(Lcom/quickjs/EventQueue$Event;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public _get(JILcom/quickjs/JSValue;Ljava/lang/String;)Ljava/lang/Object;
    .locals 7

    .line 1
    new-instance v0, Lcom/quickjs/b;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-wide v2, p1

    .line 5
    move v4, p3

    .line 6
    move-object v5, p4

    .line 7
    move-object v6, p5

    .line 8
    invoke-direct/range {v0 .. v6}, Lcom/quickjs/b;-><init>(Lcom/quickjs/EventQueue;JILcom/quickjs/JSValue;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {v1, v0}, Lcom/quickjs/EventQueue;->post(Lcom/quickjs/EventQueue$Event;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public _getException(J)[Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Lcom/quickjs/t;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/quickjs/t;-><init>(Lcom/quickjs/EventQueue;J)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/quickjs/EventQueue;->post(Lcom/quickjs/EventQueue$Event;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, [Ljava/lang/String;

    .line 11
    .line 12
    return-object p0
.end method

.method public _getGlobalObject(J)Lcom/quickjs/JSObject;
    .locals 1

    .line 1
    new-instance v0, Lcom/quickjs/s;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/quickjs/s;-><init>(Lcom/quickjs/EventQueue;J)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/quickjs/EventQueue;->post(Lcom/quickjs/EventQueue$Event;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lcom/quickjs/JSObject;

    .line 11
    .line 12
    return-object p0
.end method

.method public _getKeys(JLcom/quickjs/JSValue;)[Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Lcom/quickjs/j;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Lcom/quickjs/j;-><init>(Lcom/quickjs/EventQueue;JLcom/quickjs/JSValue;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/quickjs/EventQueue;->post(Lcom/quickjs/EventQueue$Event;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, [Ljava/lang/String;

    .line 11
    .line 12
    return-object p0
.end method

.method public _getObjectType(JLcom/quickjs/JSValue;)I
    .locals 1

    .line 1
    new-instance v0, Lcom/quickjs/y;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Lcom/quickjs/y;-><init>(Lcom/quickjs/EventQueue;JLcom/quickjs/JSValue;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/quickjs/EventQueue;->post(Lcom/quickjs/EventQueue$Event;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Ljava/lang/Integer;

    .line 11
    .line 12
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0
.end method

.method public _getValue(JLcom/quickjs/JSObject;Ljava/lang/String;)Lcom/quickjs/JSValue;
    .locals 6

    .line 1
    new-instance v0, Lcom/quickjs/w;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-wide v2, p1

    .line 5
    move-object v4, p3

    .line 6
    move-object v5, p4

    .line 7
    invoke-direct/range {v0 .. v5}, Lcom/quickjs/w;-><init>(Lcom/quickjs/EventQueue;JLcom/quickjs/JSObject;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-direct {v1, v0}, Lcom/quickjs/EventQueue;->post(Lcom/quickjs/EventQueue$Event;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Lcom/quickjs/JSValue;

    .line 15
    .line 16
    return-object p0
.end method

.method public _initNewJSArray(J)Lcom/quickjs/JSArray;
    .locals 1

    .line 1
    new-instance v0, Lcom/quickjs/z;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/quickjs/z;-><init>(Lcom/quickjs/EventQueue;J)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/quickjs/EventQueue;->post(Lcom/quickjs/EventQueue$Event;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lcom/quickjs/JSArray;

    .line 11
    .line 12
    return-object p0
.end method

.method public _initNewJSFunction(JIZ)Lcom/quickjs/JSFunction;
    .locals 6

    .line 1
    new-instance v0, Lcom/quickjs/g;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-wide v2, p1

    .line 5
    move v4, p3

    .line 6
    move v5, p4

    .line 7
    invoke-direct/range {v0 .. v5}, Lcom/quickjs/g;-><init>(Lcom/quickjs/EventQueue;JIZ)V

    .line 8
    .line 9
    .line 10
    invoke-direct {v1, v0}, Lcom/quickjs/EventQueue;->post(Lcom/quickjs/EventQueue$Event;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Lcom/quickjs/JSFunction;

    .line 15
    .line 16
    return-object p0
.end method

.method public _initNewJSObject(J)Lcom/quickjs/JSObject;
    .locals 1

    .line 1
    new-instance v0, Lcom/quickjs/v;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/quickjs/v;-><init>(Lcom/quickjs/EventQueue;J)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/quickjs/EventQueue;->post(Lcom/quickjs/EventQueue$Event;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lcom/quickjs/JSObject;

    .line 11
    .line 12
    return-object p0
.end method

.method public _isUndefined(JLcom/quickjs/JSValue;)Z
    .locals 1

    .line 1
    new-instance v0, Lcom/quickjs/a0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Lcom/quickjs/a0;-><init>(Lcom/quickjs/EventQueue;JLcom/quickjs/JSValue;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/quickjs/EventQueue;->post(Lcom/quickjs/EventQueue$Event;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Ljava/lang/Boolean;

    .line 11
    .line 12
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0
.end method

.method public _newClass(JI)Lcom/quickjs/JSFunction;
    .locals 1

    .line 1
    new-instance v0, Lcom/quickjs/h;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Lcom/quickjs/h;-><init>(Lcom/quickjs/EventQueue;JI)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/quickjs/EventQueue;->post(Lcom/quickjs/EventQueue$Event;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lcom/quickjs/JSFunction;

    .line 11
    .line 12
    return-object p0
.end method

.method public _registerJavaMethod(JLcom/quickjs/JSValue;Ljava/lang/String;IZ)Lcom/quickjs/JSFunction;
    .locals 8

    .line 1
    new-instance v0, Lcom/quickjs/o;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-wide v2, p1

    .line 5
    move-object v4, p3

    .line 6
    move-object v5, p4

    .line 7
    move v6, p5

    .line 8
    move v7, p6

    .line 9
    invoke-direct/range {v0 .. v7}, Lcom/quickjs/o;-><init>(Lcom/quickjs/EventQueue;JLcom/quickjs/JSValue;Ljava/lang/String;IZ)V

    .line 10
    .line 11
    .line 12
    invoke-direct {v1, v0}, Lcom/quickjs/EventQueue;->post(Lcom/quickjs/EventQueue$Event;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Lcom/quickjs/JSFunction;

    .line 17
    .line 18
    return-object p0
.end method

.method public _releaseContext(J)V
    .locals 1

    .line 1
    new-instance v0, Lcom/quickjs/u;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/quickjs/u;-><init>(Lcom/quickjs/EventQueue;J)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/quickjs/EventQueue;->postVoid(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public _releasePtr(JJIDJ)Z
    .locals 12

    .line 1
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 2
    .line 3
    new-instance v1, Lcom/quickjs/e;

    .line 4
    .line 5
    move-object v2, p0

    .line 6
    move-wide v3, p1

    .line 7
    move-wide v5, p3

    .line 8
    move/from16 v7, p5

    .line 9
    .line 10
    move-wide/from16 v8, p6

    .line 11
    .line 12
    move-wide/from16 v10, p8

    .line 13
    .line 14
    invoke-direct/range {v1 .. v11}, Lcom/quickjs/e;-><init>(Lcom/quickjs/EventQueue;JJIDJ)V

    .line 15
    .line 16
    .line 17
    invoke-direct {p0, v1}, Lcom/quickjs/EventQueue;->post(Lcom/quickjs/EventQueue$Event;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {v0, p0}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    return p0
.end method

.method public _releaseRuntime(J)V
    .locals 1

    .line 1
    new-instance v0, Lcom/quickjs/p;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/quickjs/p;-><init>(Lcom/quickjs/EventQueue;J)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/quickjs/EventQueue;->postVoid(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public _set(JLcom/quickjs/JSValue;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 7

    .line 1
    new-instance v0, Lcom/quickjs/b0;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-wide v2, p1

    .line 5
    move-object v4, p3

    .line 6
    move-object v5, p4

    .line 7
    move-object v6, p5

    .line 8
    invoke-direct/range {v0 .. v6}, Lcom/quickjs/b0;-><init>(Lcom/quickjs/EventQueue;JLcom/quickjs/JSValue;Ljava/lang/String;Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v1, v0}, Lcom/quickjs/EventQueue;->postVoid(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public interrupt()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/quickjs/EventQueue;->handlerThread:Landroid/os/HandlerThread;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/Thread;->interrupt()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public postVoid(Ljava/lang/Runnable;)V
    .locals 1

    const/4 v0, 0x1

    .line 100
    invoke-virtual {p0, p1, v0}, Lcom/quickjs/EventQueue;->postVoid(Ljava/lang/Runnable;Z)V

    return-void
.end method

.method public postVoid(Ljava/lang/Runnable;Z)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/quickjs/EventQueue;->quickJS:Lcom/quickjs/QuickJS;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/quickjs/QuickJS;->isReleased()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_6

    .line 8
    .line 9
    iget-object v0, p0, Lcom/quickjs/EventQueue;->handlerThread:Landroid/os/HandlerThread;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Thread;->isInterrupted()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    goto :goto_3

    .line 20
    :cond_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object v1, p0, Lcom/quickjs/EventQueue;->thread:Ljava/lang/Thread;

    .line 25
    .line 26
    if-ne v0, v1, :cond_1

    .line 27
    .line 28
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    iget-object v0, p0, Lcom/quickjs/EventQueue;->handler:Landroid/os/Handler;

    .line 33
    .line 34
    if-nez v0, :cond_2

    .line 35
    .line 36
    iget-object p0, p0, Lcom/quickjs/EventQueue;->threadChecker:Lcom/quickjs/ThreadChecker;

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/quickjs/ThreadChecker;->checkThread()V

    .line 39
    .line 40
    .line 41
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_2
    const/4 v1, 0x2

    .line 46
    new-array v7, v1, [Ljava/lang/Object;

    .line 47
    .line 48
    const/4 v1, 0x1

    .line 49
    new-array v5, v1, [Ljava/lang/RuntimeException;

    .line 50
    .line 51
    new-instance v2, Lcom/quickjs/c;

    .line 52
    .line 53
    move-object v3, p0

    .line 54
    move-object v4, p1

    .line 55
    move v6, p2

    .line 56
    invoke-direct/range {v2 .. v7}, Lcom/quickjs/c;-><init>(Lcom/quickjs/EventQueue;Ljava/lang/Runnable;[Ljava/lang/RuntimeException;Z[Ljava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 60
    .line 61
    .line 62
    if-eqz v6, :cond_5

    .line 63
    .line 64
    monitor-enter v7

    .line 65
    :try_start_0
    aget-object p0, v7, v1

    .line 66
    .line 67
    if-nez p0, :cond_3

    .line 68
    .line 69
    invoke-virtual {v7}, Ljava/lang/Object;->wait()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 70
    .line 71
    .line 72
    goto :goto_0

    .line 73
    :catchall_0
    move-exception v0

    .line 74
    move-object p0, v0

    .line 75
    goto :goto_1

    .line 76
    :catch_0
    move-exception v0

    .line 77
    move-object p0, v0

    .line 78
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 79
    .line 80
    .line 81
    :cond_3
    :goto_0
    monitor-exit v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 82
    const/4 p0, 0x0

    .line 83
    aget-object p0, v5, p0

    .line 84
    .line 85
    if-nez p0, :cond_4

    .line 86
    .line 87
    goto :goto_2

    .line 88
    :cond_4
    throw p0

    .line 89
    :goto_1
    :try_start_2
    monitor-exit v7
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 90
    throw p0

    .line 91
    :cond_5
    :goto_2
    return-void

    .line 92
    :cond_6
    :goto_3
    const-string p0, "QuickJS"

    .line 93
    .line 94
    const-string p1, "QuickJS is released"

    .line 95
    .line 96
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 97
    .line 98
    .line 99
    return-void
.end method
