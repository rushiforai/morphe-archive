.class public Lcom/quickjs/QuickJS;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/quickjs/QuickJS$MethodDescriptor;
    }
.end annotation


# static fields
.field static JS_EVAL_FLAG_BACKTRACE_BARRIER:I

.field static JS_EVAL_FLAG_COMPILE_ONLY:I

.field static JS_EVAL_FLAG_STRICT:I

.field static JS_EVAL_FLAG_STRIP:I

.field static JS_EVAL_TYPE_GLOBAL:I

.field static JS_EVAL_TYPE_MASK:I

.field static JS_EVAL_TYPE_MODULE:I

.field static final sContextMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Long;",
            "Lcom/quickjs/JSContext;",
            ">;"
        }
    .end annotation
.end field

.field private static sId:I


# instance fields
.field final quickJSNative:Lcom/quickjs/EventQueue;

.field released:Z

.field final runtimePtr:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sput-object v0, Lcom/quickjs/QuickJS;->sContextMap:Ljava/util/Map;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    sput v0, Lcom/quickjs/QuickJS;->sId:I

    .line 14
    .line 15
    sput v0, Lcom/quickjs/QuickJS;->JS_EVAL_TYPE_GLOBAL:I

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    sput v0, Lcom/quickjs/QuickJS;->JS_EVAL_TYPE_MODULE:I

    .line 19
    .line 20
    const/4 v0, 0x3

    .line 21
    sput v0, Lcom/quickjs/QuickJS;->JS_EVAL_TYPE_MASK:I

    .line 22
    .line 23
    const/16 v0, 0x8

    .line 24
    .line 25
    sput v0, Lcom/quickjs/QuickJS;->JS_EVAL_FLAG_STRICT:I

    .line 26
    .line 27
    const/16 v0, 0x10

    .line 28
    .line 29
    sput v0, Lcom/quickjs/QuickJS;->JS_EVAL_FLAG_STRIP:I

    .line 30
    .line 31
    const/16 v0, 0x20

    .line 32
    .line 33
    sput v0, Lcom/quickjs/QuickJS;->JS_EVAL_FLAG_COMPILE_ONLY:I

    .line 34
    .line 35
    const/16 v0, 0x40

    .line 36
    .line 37
    sput v0, Lcom/quickjs/QuickJS;->JS_EVAL_FLAG_BACKTRACE_BARRIER:I

    .line 38
    .line 39
    const-string v0, "quickjs"

    .line 40
    .line 41
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    const-string v0, "quickjs-android"

    .line 45
    .line 46
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method private constructor <init>(JLandroid/os/HandlerThread;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Lcom/quickjs/QuickJS;->runtimePtr:J

    .line 5
    .line 6
    new-instance p1, Lcom/quickjs/EventQueue;

    .line 7
    .line 8
    invoke-direct {p1, p0, p3}, Lcom/quickjs/EventQueue;-><init>(Lcom/quickjs/QuickJS;Landroid/os/HandlerThread;)V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/quickjs/QuickJS;->quickJSNative:Lcom/quickjs/EventQueue;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic b(Lcom/quickjs/QuickJS;)V
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/quickjs/QuickJS;->released:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    sget-object v0, Lcom/quickjs/QuickJS;->sContextMap:Ljava/util/Map;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/Map;->size()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    new-array v2, v1, [Lcom/quickjs/JSContext;

    .line 13
    .line 14
    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-interface {v0, v2}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    :goto_0
    if-ge v0, v1, :cond_2

    .line 23
    .line 24
    aget-object v3, v2, v0

    .line 25
    .line 26
    invoke-virtual {v3}, Lcom/quickjs/JSContext;->getQuickJS()Lcom/quickjs/QuickJS;

    .line 27
    .line 28
    .line 29
    move-result-object v4

    .line 30
    if-ne v4, p0, :cond_1

    .line 31
    .line 32
    invoke-virtual {v3}, Lcom/quickjs/JSContext;->close()V

    .line 33
    .line 34
    .line 35
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_2
    invoke-virtual {p0}, Lcom/quickjs/QuickJS;->getNative()Lcom/quickjs/QuickJSNative;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iget-wide v1, p0, Lcom/quickjs/QuickJS;->runtimePtr:J

    .line 43
    .line 44
    invoke-interface {v0, v1, v2}, Lcom/quickjs/QuickJSNative;->_releaseRuntime(J)V

    .line 45
    .line 46
    .line 47
    const/4 v0, 0x1

    .line 48
    iput-boolean v0, p0, Lcom/quickjs/QuickJS;->released:Z

    .line 49
    .line 50
    iget-object p0, p0, Lcom/quickjs/QuickJS;->quickJSNative:Lcom/quickjs/EventQueue;

    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/quickjs/EventQueue;->interrupt()V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public static callJavaCallback(JILcom/quickjs/JSValue;Lcom/quickjs/JSArray;Z)Ljava/lang/Object;
    .locals 1
    .annotation build Landroidx/annotation/Keep;
    .end annotation

    .line 1
    sget-object v0, Lcom/quickjs/QuickJS;->sContextMap:Ljava/util/Map;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/quickjs/JSContext;

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    if-nez p0, :cond_0

    .line 15
    .line 16
    return-object p1

    .line 17
    :cond_0
    iget-object p0, p0, Lcom/quickjs/JSContext;->functionRegistry:Ljava/util/Map;

    .line 18
    .line 19
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    invoke-interface {p0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Lcom/quickjs/QuickJS$MethodDescriptor;

    .line 28
    .line 29
    if-nez p0, :cond_1

    .line 30
    .line 31
    return-object p1

    .line 32
    :cond_1
    instance-of p2, p3, Lcom/quickjs/JSObject;

    .line 33
    .line 34
    if-eqz p2, :cond_2

    .line 35
    .line 36
    check-cast p3, Lcom/quickjs/JSObject;

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_2
    move-object p3, p1

    .line 40
    :goto_0
    if-eqz p5, :cond_3

    .line 41
    .line 42
    :try_start_0
    iget-object p0, p0, Lcom/quickjs/QuickJS$MethodDescriptor;->voidCallback:Lcom/quickjs/JavaVoidCallback;

    .line 43
    .line 44
    invoke-interface {p0, p3, p4}, Lcom/quickjs/JavaVoidCallback;->invoke(Lcom/quickjs/JSObject;Lcom/quickjs/JSArray;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 45
    .line 46
    .line 47
    goto :goto_1

    .line 48
    :catch_0
    move-exception p0

    .line 49
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 50
    .line 51
    .line 52
    :goto_1
    return-object p1

    .line 53
    :cond_3
    :try_start_1
    iget-object p0, p0, Lcom/quickjs/QuickJS$MethodDescriptor;->callback:Lcom/quickjs/JavaCallback;

    .line 54
    .line 55
    invoke-interface {p0, p3, p4}, Lcom/quickjs/JavaCallback;->invoke(Lcom/quickjs/JSObject;Lcom/quickjs/JSArray;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p0
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_1

    .line 59
    return-object p0

    .line 60
    :catch_1
    move-exception p0

    .line 61
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 62
    .line 63
    .line 64
    return-object p1
.end method

.method public static checkException(Lcom/quickjs/JSContext;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/quickjs/JSContext;->getNative()Lcom/quickjs/QuickJSNative;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/quickjs/JSContext;->getContextPtr()J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    invoke-interface {v0, v1, v2}, Lcom/quickjs/QuickJSNative;->_getException(J)[Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 19
    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    aget-object v1, p0, v1

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const/16 v1, 0xa

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const/4 v1, 0x2

    .line 33
    :goto_0
    array-length v2, p0

    .line 34
    if-ge v1, v2, :cond_1

    .line 35
    .line 36
    aget-object v2, p0, v1

    .line 37
    .line 38
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    add-int/lit8 v1, v1, 0x1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    new-instance v1, Lcom/quickjs/QuickJSException;

    .line 45
    .line 46
    const/4 v2, 0x0

    .line 47
    aget-object p0, p0, v2

    .line 48
    .line 49
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-direct {v1, p0, v0}, Lcom/quickjs/QuickJSException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    throw v1
.end method

.method public static convertModuleName(JLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .annotation build Landroidx/annotation/Keep;
    .end annotation

    .line 1
    sget-object v0, Lcom/quickjs/QuickJS;->sContextMap:Ljava/util/Map;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/quickjs/JSContext;

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    if-nez p0, :cond_0

    .line 15
    .line 16
    return-object p1

    .line 17
    :cond_0
    instance-of v0, p0, Lcom/quickjs/Module;

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    check-cast p0, Lcom/quickjs/Module;

    .line 22
    .line 23
    invoke-virtual {p0, p2, p3}, Lcom/quickjs/Module;->convertModuleName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0

    .line 28
    :cond_1
    return-object p1
.end method

.method public static createJSValue(JIJIDJ)Lcom/quickjs/JSValue;
    .locals 1
    .annotation build Landroidx/annotation/Keep;
    .end annotation

    .line 1
    sget-object v0, Lcom/quickjs/QuickJS;->sContextMap:Ljava/util/Map;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/quickjs/JSContext;

    .line 12
    .line 13
    const/4 p1, 0x5

    .line 14
    if-eq p2, p1, :cond_3

    .line 15
    .line 16
    const/4 p1, 0x6

    .line 17
    if-eq p2, p1, :cond_2

    .line 18
    .line 19
    const/4 p1, 0x7

    .line 20
    if-eq p2, p1, :cond_1

    .line 21
    .line 22
    const/16 p1, 0x63

    .line 23
    .line 24
    if-eq p2, p1, :cond_0

    .line 25
    .line 26
    new-instance p1, Lcom/quickjs/JSValue;

    .line 27
    .line 28
    move-object p2, p0

    .line 29
    invoke-direct/range {p1 .. p9}, Lcom/quickjs/JSValue;-><init>(Lcom/quickjs/JSContext;JIDJ)V

    .line 30
    .line 31
    .line 32
    return-object p1

    .line 33
    :cond_0
    move-object p2, p0

    .line 34
    new-instance p1, Lcom/quickjs/JSObject$Undefined;

    .line 35
    .line 36
    invoke-direct/range {p1 .. p9}, Lcom/quickjs/JSObject$Undefined;-><init>(Lcom/quickjs/JSContext;JIDJ)V

    .line 37
    .line 38
    .line 39
    return-object p1

    .line 40
    :cond_1
    move-object p2, p0

    .line 41
    new-instance p1, Lcom/quickjs/JSFunction;

    .line 42
    .line 43
    invoke-direct/range {p1 .. p9}, Lcom/quickjs/JSFunction;-><init>(Lcom/quickjs/JSContext;JIDJ)V

    .line 44
    .line 45
    .line 46
    return-object p1

    .line 47
    :cond_2
    move-object p2, p0

    .line 48
    new-instance p1, Lcom/quickjs/JSObject;

    .line 49
    .line 50
    invoke-direct/range {p1 .. p9}, Lcom/quickjs/JSObject;-><init>(Lcom/quickjs/JSContext;JIDJ)V

    .line 51
    .line 52
    .line 53
    return-object p1

    .line 54
    :cond_3
    move-object p2, p0

    .line 55
    new-instance p1, Lcom/quickjs/JSArray;

    .line 56
    .line 57
    invoke-direct/range {p1 .. p9}, Lcom/quickjs/JSArray;-><init>(Lcom/quickjs/JSContext;JIDJ)V

    .line 58
    .line 59
    .line 60
    return-object p1
.end method

.method public static createRuntime()Lcom/quickjs/QuickJS;
    .locals 4

    .line 1
    new-instance v0, Lcom/quickjs/QuickJS;

    .line 2
    .line 3
    invoke-static {}, Lcom/quickjs/QuickJSNativeImpl;->_createRuntime()J

    .line 4
    .line 5
    .line 6
    move-result-wide v1

    .line 7
    const/4 v3, 0x0

    .line 8
    invoke-direct {v0, v1, v2, v3}, Lcom/quickjs/QuickJS;-><init>(JLandroid/os/HandlerThread;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public static createRuntimeWithEventQueue()Lcom/quickjs/QuickJS;
    .locals 5

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [Ljava/lang/Object;

    .line 3
    .line 4
    new-instance v1, Landroid/os/HandlerThread;

    .line 5
    .line 6
    new-instance v2, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v3, "QuickJS-"

    .line 9
    .line 10
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    sget v3, Lcom/quickjs/QuickJS;->sId:I

    .line 14
    .line 15
    add-int/lit8 v4, v3, 0x1

    .line 16
    .line 17
    sput v4, Lcom/quickjs/QuickJS;->sId:I

    .line 18
    .line 19
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-direct {v1, v2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 30
    .line 31
    .line 32
    new-instance v2, Landroid/os/Handler;

    .line 33
    .line 34
    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    invoke-direct {v2, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 39
    .line 40
    .line 41
    new-instance v3, Ll/q6c0;

    .line 42
    .line 43
    invoke-direct {v3, v0, v1}, Ll/q6c0;-><init>([Ljava/lang/Object;Landroid/os/HandlerThread;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 47
    .line 48
    .line 49
    monitor-enter v0

    .line 50
    const/4 v1, 0x1

    .line 51
    :try_start_0
    aget-object v1, v0, v1

    .line 52
    .line 53
    if-nez v1, :cond_0

    .line 54
    .line 55
    invoke-virtual {v0}, Ljava/lang/Object;->wait()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :catchall_0
    move-exception v1

    .line 60
    goto :goto_1

    .line 61
    :catch_0
    move-exception v1

    .line 62
    :try_start_1
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 63
    .line 64
    .line 65
    :cond_0
    :goto_0
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 66
    const/4 v1, 0x0

    .line 67
    aget-object v0, v0, v1

    .line 68
    .line 69
    check-cast v0, Lcom/quickjs/QuickJS;

    .line 70
    .line 71
    return-object v0

    .line 72
    :goto_1
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 73
    throw v1
.end method

.method public static synthetic d([Ljava/lang/Object;Landroid/os/HandlerThread;)V
    .locals 3

    .line 1
    new-instance v0, Lcom/quickjs/QuickJS;

    .line 2
    .line 3
    invoke-static {}, Lcom/quickjs/QuickJSNativeImpl;->_createRuntime()J

    .line 4
    .line 5
    .line 6
    move-result-wide v1

    .line 7
    invoke-direct {v0, v1, v2, p1}, Lcom/quickjs/QuickJS;-><init>(JLandroid/os/HandlerThread;)V

    .line 8
    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    aput-object v0, p0, p1

    .line 12
    .line 13
    monitor-enter p0

    .line 14
    :try_start_0
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 15
    .line 16
    const/4 v0, 0x1

    .line 17
    aput-object p1, p0, v0

    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 20
    .line 21
    .line 22
    monitor-exit p0

    .line 23
    return-void

    .line 24
    :catchall_0
    move-exception p1

    .line 25
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    throw p1
.end method

.method public static executeFunction(Lcom/quickjs/JSContext;Lcom/quickjs/JSValue;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7

    .line 1
    new-instance v6, Lcom/quickjs/JSArray;

    .line 2
    .line 3
    invoke-direct {v6, p0}, Lcom/quickjs/JSArray;-><init>(Lcom/quickjs/JSContext;)V

    .line 4
    .line 5
    .line 6
    if-eqz p3, :cond_5

    .line 7
    .line 8
    array-length v0, p3

    .line 9
    const/4 v1, 0x0

    .line 10
    :goto_0
    if-ge v1, v0, :cond_5

    .line 11
    .line 12
    aget-object v2, p3, v1

    .line 13
    .line 14
    instance-of v3, v2, Ljava/lang/Integer;

    .line 15
    .line 16
    if-eqz v3, :cond_0

    .line 17
    .line 18
    check-cast v2, Ljava/lang/Integer;

    .line 19
    .line 20
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    invoke-virtual {v6, v2}, Lcom/quickjs/JSArray;->push(I)Lcom/quickjs/JSArray;

    .line 25
    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_0
    instance-of v3, v2, Ljava/lang/Double;

    .line 29
    .line 30
    if-eqz v3, :cond_1

    .line 31
    .line 32
    check-cast v2, Ljava/lang/Double;

    .line 33
    .line 34
    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    .line 35
    .line 36
    .line 37
    move-result-wide v2

    .line 38
    invoke-virtual {v6, v2, v3}, Lcom/quickjs/JSArray;->push(D)Lcom/quickjs/JSArray;

    .line 39
    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_1
    instance-of v3, v2, Ljava/lang/Boolean;

    .line 43
    .line 44
    if-eqz v3, :cond_2

    .line 45
    .line 46
    check-cast v2, Ljava/lang/Boolean;

    .line 47
    .line 48
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    invoke-virtual {v6, v2}, Lcom/quickjs/JSArray;->push(Z)Lcom/quickjs/JSArray;

    .line 53
    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_2
    instance-of v3, v2, Ljava/lang/String;

    .line 57
    .line 58
    if-eqz v3, :cond_3

    .line 59
    .line 60
    check-cast v2, Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {v6, v2}, Lcom/quickjs/JSArray;->push(Ljava/lang/String;)Lcom/quickjs/JSArray;

    .line 63
    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_3
    instance-of v3, v2, Lcom/quickjs/JSValue;

    .line 67
    .line 68
    if-eqz v3, :cond_4

    .line 69
    .line 70
    check-cast v2, Lcom/quickjs/JSValue;

    .line 71
    .line 72
    invoke-virtual {v6, v2}, Lcom/quickjs/JSArray;->push(Lcom/quickjs/JSValue;)Lcom/quickjs/JSArray;

    .line 73
    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_4
    const/4 v2, 0x0

    .line 77
    invoke-virtual {v6, v2}, Lcom/quickjs/JSArray;->push(Lcom/quickjs/JSValue;)Lcom/quickjs/JSArray;

    .line 78
    .line 79
    .line 80
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_5
    invoke-virtual {p0}, Lcom/quickjs/JSContext;->getNative()Lcom/quickjs/QuickJSNative;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-virtual {p0}, Lcom/quickjs/JSContext;->getContextPtr()J

    .line 88
    .line 89
    .line 90
    move-result-wide v1

    .line 91
    const/4 v3, 0x0

    .line 92
    move-object v4, p1

    .line 93
    move-object v5, p2

    .line 94
    invoke-interface/range {v0 .. v6}, Lcom/quickjs/QuickJSNative;->_executeFunction(JILcom/quickjs/JSValue;Ljava/lang/String;Lcom/quickjs/JSValue;)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    return-object p0
.end method

.method public static getModuleScript(JLjava/lang/String;)Ljava/lang/String;
    .locals 1
    .annotation build Landroidx/annotation/Keep;
    .end annotation

    .line 1
    sget-object v0, Lcom/quickjs/QuickJS;->sContextMap:Ljava/util/Map;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/quickjs/JSContext;

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    if-nez p0, :cond_0

    .line 15
    .line 16
    return-object p1

    .line 17
    :cond_0
    instance-of v0, p0, Lcom/quickjs/Module;

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    check-cast p0, Lcom/quickjs/Module;

    .line 22
    .line 23
    invoke-virtual {p0, p2}, Lcom/quickjs/Module;->getModuleScript(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0

    .line 28
    :cond_1
    return-object p1
.end method


# virtual methods
.method public checkReleased()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/quickjs/QuickJS;->isReleased()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance p0, Ljava/lang/Error;

    .line 9
    .line 10
    const-string v0, "Runtime disposed error"

    .line 11
    .line 12
    invoke-direct {p0, v0}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    throw p0
.end method

.method public close()V
    .locals 1

    .line 1
    new-instance v0, Ll/p6c0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/p6c0;-><init>(Lcom/quickjs/QuickJS;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/quickjs/QuickJS;->postEventQueue(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public createContext()Lcom/quickjs/JSContext;
    .locals 4

    .line 1
    new-instance v0, Lcom/quickjs/JSContext;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/quickjs/QuickJS;->getNative()Lcom/quickjs/QuickJSNative;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget-wide v2, p0, Lcom/quickjs/QuickJS;->runtimePtr:J

    .line 8
    .line 9
    invoke-interface {v1, v2, v3}, Lcom/quickjs/QuickJSNative;->_createContext(J)J

    .line 10
    .line 11
    .line 12
    move-result-wide v1

    .line 13
    invoke-direct {v0, p0, v1, v2}, Lcom/quickjs/JSContext;-><init>(Lcom/quickjs/QuickJS;J)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method

.method public getNative()Lcom/quickjs/QuickJSNative;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/quickjs/QuickJS;->quickJSNative:Lcom/quickjs/EventQueue;

    .line 2
    .line 3
    return-object p0
.end method

.method public isReleased()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/quickjs/QuickJS;->released:Z

    .line 2
    .line 3
    return p0
.end method

.method public postEventQueue(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/quickjs/QuickJS;->quickJSNative:Lcom/quickjs/EventQueue;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, p1, v0}, Lcom/quickjs/EventQueue;->postVoid(Ljava/lang/Runnable;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
