.class public Lcom/quickjs/plugin/SetTimeoutPlugin;
.super Lcom/quickjs/Plugin;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/quickjs/Plugin;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Lcom/quickjs/JSFunction;Lcom/quickjs/JSContext;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/quickjs/JSValue;->getContext()Lcom/quickjs/JSContext;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/quickjs/JSContext;->isReleased()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Lcom/quickjs/JSArray;

    .line 12
    .line 13
    invoke-direct {v0, p1}, Lcom/quickjs/JSArray;-><init>(Lcom/quickjs/JSContext;)V

    .line 14
    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    invoke-virtual {p0, p1, v0}, Lcom/quickjs/JSFunction;->call(Lcom/quickjs/JSObject;Lcom/quickjs/JSArray;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public static synthetic b(JLcom/quickjs/JSFunction;Lcom/quickjs/JSContext;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-static {p0, p1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    goto :goto_0

    .line 5
    :catch_0
    move-exception p0

    .line 6
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 7
    .line 8
    .line 9
    :goto_0
    invoke-virtual {p2}, Lcom/quickjs/JSValue;->getQuickJS()Lcom/quickjs/QuickJS;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    new-instance p1, Ll/xue0;

    .line 14
    .line 15
    invoke-direct {p1, p2, p3}, Ll/xue0;-><init>(Lcom/quickjs/JSFunction;Lcom/quickjs/JSContext;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, p1}, Lcom/quickjs/QuickJS;->postEventQueue(Ljava/lang/Runnable;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static synthetic c(Lcom/quickjs/JSContext;Lcom/quickjs/JSObject;Lcom/quickjs/JSArray;)V
    .locals 3

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p2, p1}, Lcom/quickjs/JSArray;->getObject(I)Lcom/quickjs/JSObject;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    check-cast p1, Lcom/quickjs/JSFunction;

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    invoke-virtual {p2, v0}, Lcom/quickjs/JSArray;->getDouble(I)D

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    double-to-long v0, v0

    .line 14
    new-instance p2, Ljava/lang/Thread;

    .line 15
    .line 16
    new-instance v2, Ll/wue0;

    .line 17
    .line 18
    invoke-direct {v2, v0, v1, p1, p0}, Ll/wue0;-><init>(JLcom/quickjs/JSFunction;Lcom/quickjs/JSContext;)V

    .line 19
    .line 20
    .line 21
    invoke-direct {p2, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p2}, Ljava/lang/Thread;->start()V

    .line 25
    .line 26
    .line 27
    return-void
.end method


# virtual methods
.method public close(Lcom/quickjs/JSContext;)V
    .locals 0

    return-void
.end method

.method public setup(Lcom/quickjs/JSContext;)V
    .locals 1

    .line 1
    new-instance p0, Ll/yue0;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ll/yue0;-><init>(Lcom/quickjs/JSContext;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "setTimeout"

    .line 7
    .line 8
    invoke-virtual {p1, p0, v0}, Lcom/quickjs/JSObject;->registerJavaMethod(Lcom/quickjs/JavaVoidCallback;Ljava/lang/String;)Lcom/quickjs/JSFunction;

    .line 9
    .line 10
    .line 11
    return-void
.end method
