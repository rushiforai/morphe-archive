.class Lorg/eclipse/jetty/client/AbstractHttpConnection$ConnectionIdleTask;
.super Lorg/eclipse/jetty/util/thread/Timeout$Task;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/client/AbstractHttpConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ConnectionIdleTask"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jetty/client/AbstractHttpConnection;


# direct methods
.method private constructor <init>(Lorg/eclipse/jetty/client/AbstractHttpConnection;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection$ConnectionIdleTask;->this$0:Lorg/eclipse/jetty/client/AbstractHttpConnection;

    .line 2
    .line 3
    invoke-direct {p0}, Lorg/eclipse/jetty/util/thread/Timeout$Task;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lorg/eclipse/jetty/client/AbstractHttpConnection;Lorg/eclipse/jetty/client/AbstractHttpConnection$1;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lorg/eclipse/jetty/client/AbstractHttpConnection$ConnectionIdleTask;-><init>(Lorg/eclipse/jetty/client/AbstractHttpConnection;)V

    return-void
.end method


# virtual methods
.method public expired()V
    .locals 3

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection$ConnectionIdleTask;->this$0:Lorg/eclipse/jetty/client/AbstractHttpConnection;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/eclipse/jetty/client/AbstractHttpConnection;->access$400(Lorg/eclipse/jetty/client/AbstractHttpConnection;)Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x1

    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection$ConnectionIdleTask;->this$0:Lorg/eclipse/jetty/client/AbstractHttpConnection;

    .line 16
    .line 17
    iget-object v0, p0, Lorg/eclipse/jetty/client/AbstractHttpConnection;->_destination:Lorg/eclipse/jetty/client/HttpDestination;

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Lorg/eclipse/jetty/client/HttpDestination;->returnIdleConnection(Lorg/eclipse/jetty/client/AbstractHttpConnection;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method
