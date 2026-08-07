.class public Lorg/eclipse/jetty/server/AsyncContinuation$AsyncTimeout;
.super Lorg/eclipse/jetty/util/thread/Timeout$Task;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/server/AsyncContinuation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "AsyncTimeout"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jetty/server/AsyncContinuation;


# direct methods
.method public constructor <init>(Lorg/eclipse/jetty/server/AsyncContinuation;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/server/AsyncContinuation$AsyncTimeout;->this$0:Lorg/eclipse/jetty/server/AsyncContinuation;

    .line 2
    .line 3
    invoke-direct {p0}, Lorg/eclipse/jetty/util/thread/Timeout$Task;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public expired()V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AsyncContinuation$AsyncTimeout;->this$0:Lorg/eclipse/jetty/server/AsyncContinuation;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AsyncContinuation;->expired()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public run()V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AsyncContinuation$AsyncTimeout;->this$0:Lorg/eclipse/jetty/server/AsyncContinuation;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AsyncContinuation;->expired()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
