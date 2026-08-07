.class Lorg/eclipse/jetty/server/handler/HandlerCollection$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jetty/server/handler/HandlerCollection;->doStart()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jetty/server/handler/HandlerCollection;

.field final synthetic val$h:I

.field final synthetic val$latch:Ljava/util/concurrent/CountDownLatch;

.field final synthetic val$loader:Ljava/lang/ClassLoader;

.field final synthetic val$mex:Lorg/eclipse/jetty/util/MultiException;


# direct methods
.method public constructor <init>(Lorg/eclipse/jetty/server/handler/HandlerCollection;Ljava/lang/ClassLoader;ILorg/eclipse/jetty/util/MultiException;Ljava/util/concurrent/CountDownLatch;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/server/handler/HandlerCollection$1;->this$0:Lorg/eclipse/jetty/server/handler/HandlerCollection;

    .line 2
    .line 3
    iput-object p2, p0, Lorg/eclipse/jetty/server/handler/HandlerCollection$1;->val$loader:Ljava/lang/ClassLoader;

    .line 4
    .line 5
    iput p3, p0, Lorg/eclipse/jetty/server/handler/HandlerCollection$1;->val$h:I

    .line 6
    .line 7
    iput-object p4, p0, Lorg/eclipse/jetty/server/handler/HandlerCollection$1;->val$mex:Lorg/eclipse/jetty/util/MultiException;

    .line 8
    .line 9
    iput-object p5, p0, Lorg/eclipse/jetty/server/handler/HandlerCollection$1;->val$latch:Ljava/util/concurrent/CountDownLatch;

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    :try_start_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object v2, p0, Lorg/eclipse/jetty/server/handler/HandlerCollection$1;->val$loader:Ljava/lang/ClassLoader;

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/Thread;->setContextClassLoader(Ljava/lang/ClassLoader;)V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lorg/eclipse/jetty/server/handler/HandlerCollection$1;->this$0:Lorg/eclipse/jetty/server/handler/HandlerCollection;

    .line 19
    .line 20
    invoke-static {v1}, Lorg/eclipse/jetty/server/handler/HandlerCollection;->access$000(Lorg/eclipse/jetty/server/handler/HandlerCollection;)[Lorg/eclipse/jetty/server/Handler;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iget v2, p0, Lorg/eclipse/jetty/server/handler/HandlerCollection$1;->val$h:I

    .line 25
    .line 26
    aget-object v1, v1, v2

    .line 27
    .line 28
    invoke-interface {v1}, Lorg/eclipse/jetty/util/component/LifeCycle;->start()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    .line 30
    .line 31
    :goto_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v1, v0}, Ljava/lang/Thread;->setContextClassLoader(Ljava/lang/ClassLoader;)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/HandlerCollection$1;->val$latch:Ljava/util/concurrent/CountDownLatch;

    .line 39
    .line 40
    invoke-virtual {p0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :catchall_0
    move-exception v1

    .line 45
    :try_start_1
    iget-object v2, p0, Lorg/eclipse/jetty/server/handler/HandlerCollection$1;->val$mex:Lorg/eclipse/jetty/util/MultiException;

    .line 46
    .line 47
    invoke-virtual {v2, v1}, Lorg/eclipse/jetty/util/MultiException;->add(Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :catchall_1
    move-exception v1

    .line 52
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-virtual {v2, v0}, Ljava/lang/Thread;->setContextClassLoader(Ljava/lang/ClassLoader;)V

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/HandlerCollection$1;->val$latch:Ljava/util/concurrent/CountDownLatch;

    .line 60
    .line 61
    invoke-virtual {p0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 62
    .line 63
    .line 64
    throw v1
.end method
