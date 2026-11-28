.class final Lnicoid/network238/okio/AsyncTimeout$Watchdog;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okio/AsyncTimeout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Watchdog"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000\u0008\u0002\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0008\u0010\u0004\u001a\u00020\u0005H\u0016\u00a8\u0006\u0006"
    }
    d2 = {
        "Lnicoid/network238/okio/AsyncTimeout$Watchdog;",
        "Ljava/lang/Thread;",
        "<init>",
        "()V",
        "run",
        "",
        "okio"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 225
    const-string v0, "Okio Watchdog"

    invoke-direct {p0, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 227
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Ljava/lang/Thread;->setDaemon(Z)V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 234
    :cond_0
    :goto_0
    nop

    :goto_1
    :try_start_0
    # getter for: Lnicoid/network238/okio/AsyncTimeout;->Companion:Lnicoid/network238/okio/AsyncTimeout$Companion;
    invoke-static {}, Lnicoid/network238/okio/AsyncTimeout;->access$getCompanion$p()Lnicoid/network238/okio/AsyncTimeout$Companion;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okio/AsyncTimeout$Companion;->getLock()Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 235
    :try_start_1
    # getter for: Lnicoid/network238/okio/AsyncTimeout;->Companion:Lnicoid/network238/okio/AsyncTimeout$Companion;
    invoke-static {}, Lnicoid/network238/okio/AsyncTimeout;->access$getCompanion$p()Lnicoid/network238/okio/AsyncTimeout$Companion;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okio/AsyncTimeout$Companion;->awaitTimeout()Lnicoid/network238/okio/AsyncTimeout;

    move-result-object v1

    .line 239
    # getter for: Lnicoid/network238/okio/AsyncTimeout;->Companion:Lnicoid/network238/okio/AsyncTimeout$Companion;
    invoke-static {}, Lnicoid/network238/okio/AsyncTimeout;->access$getCompanion$p()Lnicoid/network238/okio/AsyncTimeout$Companion;

    move-result-object v2

    invoke-virtual {v2}, Lnicoid/network238/okio/AsyncTimeout$Companion;->getIdleSentinel()Lnicoid/network238/okio/AsyncTimeout;

    move-result-object v2

    if-ne v1, v2, :cond_1

    .line 240
    # getter for: Lnicoid/network238/okio/AsyncTimeout;->Companion:Lnicoid/network238/okio/AsyncTimeout$Companion;
    invoke-static {}, Lnicoid/network238/okio/AsyncTimeout;->access$getCompanion$p()Lnicoid/network238/okio/AsyncTimeout$Companion;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lnicoid/network238/okio/AsyncTimeout$Companion;->setIdleSentinel(Lnicoid/network238/okio/AsyncTimeout;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 234
    :try_start_2
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0

    return-void

    .line 243
    :cond_1
    :try_start_3
    sget-object v2, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 234
    :try_start_4
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    if-eqz v1, :cond_0

    .line 246
    invoke-virtual {v1}, Lnicoid/network238/okio/AsyncTimeout;->timedOut()V

    goto :goto_1

    :catchall_0
    move-exception v1

    .line 234
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
    :try_end_4
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_0

    :catch_0
    move-exception v0

    goto :goto_0
.end method
