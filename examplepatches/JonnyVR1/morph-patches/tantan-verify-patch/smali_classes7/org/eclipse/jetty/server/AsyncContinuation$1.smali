.class Lorg/eclipse/jetty/server/AsyncContinuation$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jetty/server/AsyncContinuation;->start(Ljava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jetty/server/AsyncContinuation;

.field final synthetic val$event:Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;

.field final synthetic val$run:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Lorg/eclipse/jetty/server/AsyncContinuation;Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/server/AsyncContinuation$1;->this$0:Lorg/eclipse/jetty/server/AsyncContinuation;

    .line 2
    .line 3
    iput-object p2, p0, Lorg/eclipse/jetty/server/AsyncContinuation$1;->val$event:Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;

    .line 4
    .line 5
    iput-object p3, p0, Lorg/eclipse/jetty/server/AsyncContinuation$1;->val$run:Ljava/lang/Runnable;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/server/AsyncContinuation$1;->val$event:Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;

    .line 2
    .line 3
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/AsyncContinuation$AsyncEventState;->getServletContext()Ll/ase0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;

    .line 8
    .line 9
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->getContextHandler()Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object p0, p0, Lorg/eclipse/jetty/server/AsyncContinuation$1;->val$run:Ljava/lang/Runnable;

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Lorg/eclipse/jetty/server/handler/ContextHandler;->handle(Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
