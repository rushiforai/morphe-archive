.class Lcom/quickjs/plugin/WorkerPlugin$Worker;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/quickjs/plugin/WorkerPlugin;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Worker"
.end annotation


# instance fields
.field private final context:Lcom/quickjs/JSContext;

.field private final quickJS:Lcom/quickjs/QuickJS;

.field private terminate:Z

.field private final workerObj:Lcom/quickjs/JSObject;


# direct methods
.method public constructor <init>(Lcom/quickjs/plugin/WorkerPlugin;Lcom/quickjs/JSObject;Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/quickjs/QuickJS;->createRuntimeWithEventQueue()Lcom/quickjs/QuickJS;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/quickjs/plugin/WorkerPlugin$Worker;->quickJS:Lcom/quickjs/QuickJS;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/quickjs/QuickJS;->createContext()Lcom/quickjs/JSContext;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/quickjs/plugin/WorkerPlugin$Worker;->context:Lcom/quickjs/JSContext;

    .line 15
    .line 16
    new-instance v1, Lcom/quickjs/plugin/ConsolePlugin;

    .line 17
    .line 18
    invoke-direct {v1}, Lcom/quickjs/plugin/ConsolePlugin;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lcom/quickjs/JSContext;->addPlugin(Lcom/quickjs/Plugin;)V

    .line 22
    .line 23
    .line 24
    new-instance v1, Lcom/quickjs/plugin/SetTimeoutPlugin;

    .line 25
    .line 26
    invoke-direct {v1}, Lcom/quickjs/plugin/SetTimeoutPlugin;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lcom/quickjs/JSContext;->addPlugin(Lcom/quickjs/Plugin;)V

    .line 30
    .line 31
    .line 32
    new-instance v1, Lcom/quickjs/plugin/WorkerPlugin$Worker$1;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Lcom/quickjs/plugin/WorkerPlugin$Worker$1;-><init>(Lcom/quickjs/plugin/WorkerPlugin$Worker;)V

    .line 35
    .line 36
    .line 37
    const-string v2, "postMessage"

    .line 38
    .line 39
    invoke-virtual {v0, v1, v2}, Lcom/quickjs/JSObject;->registerJavaMethod(Lcom/quickjs/JavaVoidCallback;Ljava/lang/String;)Lcom/quickjs/JSFunction;

    .line 40
    .line 41
    .line 42
    iput-object p2, p0, Lcom/quickjs/plugin/WorkerPlugin$Worker;->workerObj:Lcom/quickjs/JSObject;

    .line 43
    .line 44
    invoke-direct {p0}, Lcom/quickjs/plugin/WorkerPlugin$Worker;->initWorkerReceiver()V

    .line 45
    .line 46
    .line 47
    new-instance p2, Ljava/lang/Thread;

    .line 48
    .line 49
    new-instance v0, Lcom/quickjs/plugin/WorkerPlugin$Worker$2;

    .line 50
    .line 51
    invoke-direct {v0, p0, p1, p3}, Lcom/quickjs/plugin/WorkerPlugin$Worker$2;-><init>(Lcom/quickjs/plugin/WorkerPlugin$Worker;Lcom/quickjs/plugin/WorkerPlugin;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    invoke-direct {p2, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p2}, Ljava/lang/Thread;->start()V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public static synthetic access$000(Lcom/quickjs/plugin/WorkerPlugin$Worker;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/quickjs/plugin/WorkerPlugin$Worker;->sendMessageReceiver(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$100(Lcom/quickjs/plugin/WorkerPlugin$Worker;)Lcom/quickjs/JSContext;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/quickjs/plugin/WorkerPlugin$Worker;->context:Lcom/quickjs/JSContext;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Lcom/quickjs/plugin/WorkerPlugin$Worker;Lcom/quickjs/JSObject;Lcom/quickjs/JSArray;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/quickjs/plugin/WorkerPlugin$Worker;->close()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Lcom/quickjs/plugin/WorkerPlugin$Worker;Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/quickjs/plugin/WorkerPlugin$Worker;->workerObj:Lcom/quickjs/JSObject;

    .line 2
    .line 3
    const-string v1, "onmessage"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/quickjs/JSObject;->getObject(Ljava/lang/String;)Lcom/quickjs/JSObject;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    instance-of v1, v0, Lcom/quickjs/JSFunction;

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    check-cast v0, Lcom/quickjs/JSFunction;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/quickjs/plugin/WorkerPlugin$Worker;->workerObj:Lcom/quickjs/JSObject;

    .line 16
    .line 17
    new-instance v1, Lcom/quickjs/JSArray;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/quickjs/JSValue;->getContext()Lcom/quickjs/JSContext;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-direct {v1, v2}, Lcom/quickjs/JSArray;-><init>(Lcom/quickjs/JSContext;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1, p1}, Lcom/quickjs/JSArray;->push(Ljava/lang/String;)Lcom/quickjs/JSArray;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {v0, p0, p1}, Lcom/quickjs/JSFunction;->call(Lcom/quickjs/JSObject;Lcom/quickjs/JSArray;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public static synthetic e(Lcom/quickjs/plugin/WorkerPlugin$Worker;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/quickjs/plugin/WorkerPlugin$Worker;->context:Lcom/quickjs/JSContext;

    .line 2
    .line 3
    const-string v1, "onmessage"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/quickjs/JSObject;->getObject(Ljava/lang/String;)Lcom/quickjs/JSObject;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/quickjs/JSValue;->isUndefined()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    check-cast v0, Lcom/quickjs/JSFunction;

    .line 18
    .line 19
    new-instance v1, Lcom/quickjs/JSArray;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/quickjs/plugin/WorkerPlugin$Worker;->context:Lcom/quickjs/JSContext;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Lcom/quickjs/JSArray;-><init>(Lcom/quickjs/JSContext;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1, p1}, Lcom/quickjs/JSArray;->push(Ljava/lang/String;)Lcom/quickjs/JSArray;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const/4 p1, 0x0

    .line 31
    invoke-virtual {v0, p1, p0}, Lcom/quickjs/JSFunction;->call(Lcom/quickjs/JSObject;Lcom/quickjs/JSArray;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method private initWorkerReceiver()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/quickjs/plugin/WorkerPlugin$Worker;->workerObj:Lcom/quickjs/JSObject;

    .line 2
    .line 3
    new-instance v1, Lcom/quickjs/plugin/b;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/quickjs/plugin/b;-><init>(Lcom/quickjs/plugin/WorkerPlugin$Worker;)V

    .line 6
    .line 7
    .line 8
    const-string v2, "terminate"

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Lcom/quickjs/JSObject;->registerJavaMethod(Lcom/quickjs/JavaVoidCallback;Ljava/lang/String;)Lcom/quickjs/JSFunction;

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/quickjs/plugin/WorkerPlugin$Worker;->workerObj:Lcom/quickjs/JSObject;

    .line 14
    .line 15
    new-instance v1, Lcom/quickjs/plugin/WorkerPlugin$Worker$3;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Lcom/quickjs/plugin/WorkerPlugin$Worker$3;-><init>(Lcom/quickjs/plugin/WorkerPlugin$Worker;)V

    .line 18
    .line 19
    .line 20
    const-string p0, "postMessage"

    .line 21
    .line 22
    invoke-virtual {v0, v1, p0}, Lcom/quickjs/JSObject;->registerJavaMethod(Lcom/quickjs/JavaVoidCallback;Ljava/lang/String;)Lcom/quickjs/JSFunction;

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method private sendMessageReceiver(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/quickjs/plugin/WorkerPlugin$Worker;->workerObj:Lcom/quickjs/JSObject;

    .line 2
    .line 3
    new-instance v1, Lcom/quickjs/plugin/a;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Lcom/quickjs/plugin/a;-><init>(Lcom/quickjs/plugin/WorkerPlugin$Worker;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/quickjs/JSValue;->postEventQueue(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public close()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/quickjs/plugin/WorkerPlugin$Worker;->terminate:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/quickjs/plugin/WorkerPlugin$Worker;->terminate:Z

    .line 8
    .line 9
    iget-object p0, p0, Lcom/quickjs/plugin/WorkerPlugin$Worker;->quickJS:Lcom/quickjs/QuickJS;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    new-instance v0, Ll/jkq0;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Ll/jkq0;-><init>(Lcom/quickjs/QuickJS;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v0}, Lcom/quickjs/QuickJS;->postEventQueue(Ljava/lang/Runnable;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public postMessage(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/quickjs/plugin/WorkerPlugin$Worker;->quickJS:Lcom/quickjs/QuickJS;

    .line 2
    .line 3
    new-instance v1, Lcom/quickjs/plugin/c;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Lcom/quickjs/plugin/c;-><init>(Lcom/quickjs/plugin/WorkerPlugin$Worker;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/quickjs/QuickJS;->postEventQueue(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
