.class Lorg/eclipse/jetty/client/HttpClient$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jetty/client/HttpClient;->doStart()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jetty/client/HttpClient;


# direct methods
.method public constructor <init>(Lorg/eclipse/jetty/client/HttpClient;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/client/HttpClient$1;->this$0:Lorg/eclipse/jetty/client/HttpClient;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    :catch_0
    :goto_0
    iget-object v0, p0, Lorg/eclipse/jetty/client/HttpClient$1;->this$0:Lorg/eclipse/jetty/client/HttpClient;

    .line 2
    .line 3
    invoke-virtual {v0}, Lorg/eclipse/jetty/util/component/AbstractLifeCycle;->isRunning()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lorg/eclipse/jetty/client/HttpClient$1;->this$0:Lorg/eclipse/jetty/client/HttpClient;

    .line 10
    .line 11
    invoke-static {v0}, Lorg/eclipse/jetty/client/HttpClient;->access$100(Lorg/eclipse/jetty/client/HttpClient;)Lorg/eclipse/jetty/util/thread/Timeout;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 16
    .line 17
    .line 18
    move-result-wide v1

    .line 19
    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jetty/util/thread/Timeout;->tick(J)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lorg/eclipse/jetty/client/HttpClient$1;->this$0:Lorg/eclipse/jetty/client/HttpClient;

    .line 23
    .line 24
    invoke-static {v0}, Lorg/eclipse/jetty/client/HttpClient;->access$200(Lorg/eclipse/jetty/client/HttpClient;)Lorg/eclipse/jetty/util/thread/Timeout;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget-object v1, p0, Lorg/eclipse/jetty/client/HttpClient$1;->this$0:Lorg/eclipse/jetty/client/HttpClient;

    .line 29
    .line 30
    invoke-static {v1}, Lorg/eclipse/jetty/client/HttpClient;->access$100(Lorg/eclipse/jetty/client/HttpClient;)Lorg/eclipse/jetty/util/thread/Timeout;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v1}, Lorg/eclipse/jetty/util/thread/Timeout;->getNow()J

    .line 35
    .line 36
    .line 37
    move-result-wide v1

    .line 38
    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jetty/util/thread/Timeout;->tick(J)V

    .line 39
    .line 40
    .line 41
    const-wide/16 v0, 0xc8

    .line 42
    .line 43
    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    return-void
.end method
