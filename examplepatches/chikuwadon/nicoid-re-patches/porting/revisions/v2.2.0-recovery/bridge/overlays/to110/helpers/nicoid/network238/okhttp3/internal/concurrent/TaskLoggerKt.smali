.class public final Lnicoid/network238/okhttp3/internal/concurrent/TaskLoggerKt;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000*\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0008\n\u0002\u0010\t\n\u0000\u001a.\u0010\u0000\u001a\u00020\u0001*\u00020\u00022\u0006\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u00062\u000c\u0010\u0007\u001a\u0008\u0012\u0004\u0012\u00020\t0\u0008H\u0080\u0008\u00f8\u0001\u0000\u001a9\u0010\n\u001a\u0002H\u000b\"\u0004\u0008\u0000\u0010\u000b*\u00020\u00022\u0006\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u00062\u000c\u0010\u000c\u001a\u0008\u0012\u0004\u0012\u0002H\u000b0\u0008H\u0080\u0008\u00f8\u0001\u0000\u00a2\u0006\u0002\u0010\r\u001a$\u0010\u000e\u001a\u00020\u0001*\u00020\u00022\u0006\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u000f\u001a\u00020\tH\u0002\u001a\u000e\u0010\u0010\u001a\u00020\t2\u0006\u0010\u0011\u001a\u00020\u0012\u0082\u0002\u0007\n\u0005\u0008\u009920\u0001\u00a8\u0006\u0013"
    }
    d2 = {
        "taskLog",
        "",
        "Ljava/util/logging/Logger;",
        "task",
        "Lnicoid/network238/okhttp3/internal/concurrent/Task;",
        "queue",
        "Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;",
        "messageBlock",
        "Lnicoid/network238/kotlin/Function0;",
        "",
        "logElapsed",
        "T",
        "block",
        "(Ljava/util/logging/Logger;Lnicoid/network238/okhttp3/internal/concurrent/Task;Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;Lnicoid/network238/kotlin/jvm/functions/Function0;)Ljava/lang/Object;",
        "log",
        "message",
        "formatDuration",
        "ns",
        "",
        "okhttp"
    }
    k = 0x2
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public static final synthetic access$log(Ljava/util/logging/Logger;Lnicoid/network238/okhttp3/internal/concurrent/Task;Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;Ljava/lang/String;)V
    .registers 4

    .line 1
    invoke-static {p0, p1, p2, p3}, Lnicoid/network238/okhttp3/internal/concurrent/TaskLoggerKt;->log(Ljava/util/logging/Logger;Lnicoid/network238/okhttp3/internal/concurrent/Task;Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;Ljava/lang/String;)V

    return-void
.end method

.method public static final formatDuration(J)Ljava/lang/String;
    .registers 20

    const-wide/32 v0, -0x3b9328e0

    cmp-long v0, p0, v0

    const-string v1, " s "

    const-wide/32 v2, 0x3b9aca00

    const-wide/32 v4, 0x1dcd6500

    if-gtz v0, :cond_0

    .line 79
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sub-long v4, p0, v4

    div-long/2addr v4, v2

    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0

    :cond_0
    const-wide/32 v6, -0xf404c

    cmp-long v0, p0, v6

    const-string v6, " ms"

    const-wide/32 v7, 0xf4240

    const-wide/32 v9, 0x7a120

    if-gtz v0, :cond_1

    .line 80
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sub-long v1, p0, v9

    div-long/2addr v1, v7

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_1
    const-wide/16 v11, 0x0

    cmp-long v0, p0, v11

    const-string v11, " \u00b5s"

    const-wide/16 v12, 0x3e8

    const-wide/16 v14, 0x1f4

    if-gtz v0, :cond_2

    .line 81
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sub-long v1, p0, v14

    div-long/2addr v1, v12

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_2
    const-wide/32 v16, 0xf404c

    cmp-long v0, p0, v16

    if-gez v0, :cond_3

    .line 82
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    add-long v1, p0, v14

    div-long/2addr v1, v12

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_3
    const-wide/32 v11, 0x3b9328e0

    cmp-long v0, p0, v11

    if-gez v0, :cond_4

    .line 83
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    add-long v1, p0, v9

    div-long/2addr v1, v7

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 84
    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    add-long v4, p0, v4

    div-long/2addr v4, v2

    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 86
    :goto_0
    sget-object v1, Lnicoid/network238/kotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lnicoid/network238/kotlin/jvm/internal/StringCompanionObject;

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    const-string v1, "%6s"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static final log(Ljava/util/logging/Logger;Lnicoid/network238/okhttp3/internal/concurrent/Task;Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;Ljava/lang/String;)V
    .registers 5

    .line 65
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->getName$okhttp()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const/16 v0, 0x20

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object p2

    sget-object v0, Lnicoid/network238/kotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lnicoid/network238/kotlin/jvm/internal/StringCompanionObject;

    filled-new-array {p3}, [Ljava/lang/Object;

    move-result-object p3

    const/4 v0, 0x1

    invoke-static {p3, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p3

    const-string v0, "%-22s"

    invoke-static {v0, p3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string p3, ": "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/concurrent/Task;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    return-void
.end method

.method public static final logElapsed(Ljava/util/logging/Logger;Lnicoid/network238/okhttp3/internal/concurrent/Task;Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;Lnicoid/network238/kotlin/jvm/functions/Function0;)Ljava/lang/Object;
    .registers 14
    .param p0, "$this$logElapsed"    # Ljava/util/logging/Logger;
    .param p1, "task"    # Lnicoid/network238/okhttp3/internal/concurrent/Task;
    .param p2, "queue"    # Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;
    .param p3, "block"    # Lnicoid/network238/kotlin/jvm/functions/Function0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/logging/Logger;",
            "Lnicoid/network238/okhttp3/internal/concurrent/Task;",
            "Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;",
            "Lnicoid/network238/kotlin/jvm/functions/Function0;",
            ")TT;"
        }
    .end annotation

    const-string v0, "finished run in "

    const-string v1, "<this>"

    invoke-static {p0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "task"

    invoke-static {p1, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "queue"

    invoke-static {p2, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "block"

    invoke-static {p3, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v1, 0x0

    .line 36
    .local v1, "$i$f$logElapsed":I
    const-wide/16 v2, -0x1

    .line 37
    .local v2, "startNs":J
    sget-object v4, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {p0, v4}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v4

    .line 38
    .local v4, "loggingEnabled":Z
    if-eqz v4, :cond_0

    .line 39
    invoke-virtual {p2}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->getTaskRunner$okhttp()Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    move-result-object v5

    invoke-virtual {v5}, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->getBackend()Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner$Backend;

    move-result-object v5

    invoke-interface {v5}, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner$Backend;->nanoTime()J

    move-result-wide v2

    .line 40
    const-string v5, "starting"

    # invokes: Lnicoid/network238/okhttp3/internal/concurrent/TaskLoggerKt;->log(Ljava/util/logging/Logger;Lnicoid/network238/okhttp3/internal/concurrent/Task;Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;Ljava/lang/String;)V
    invoke-static {p0, p1, p2, v5}, Lnicoid/network238/okhttp3/internal/concurrent/TaskLoggerKt;->access$log(Ljava/util/logging/Logger;Lnicoid/network238/okhttp3/internal/concurrent/Task;Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;Ljava/lang/String;)V

    .line 43
    :cond_0
    const/4 v5, 0x0

    .line 44
    .local v5, "completedNormally":Z
    nop

    .line 45
    :try_start_0
    invoke-interface {p3}, Lnicoid/network238/kotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 46
    .local v6, "result":Ljava/lang/Object;
    const/4 v5, 0x1

    .line 47
    nop

    .line 49
    .end local v6    # "result":Ljava/lang/Object;
    if-eqz v4, :cond_1

    .line 50
    invoke-virtual {p2}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->getTaskRunner$okhttp()Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    move-result-object v7

    invoke-virtual {v7}, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->getBackend()Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner$Backend;

    move-result-object v7

    invoke-interface {v7}, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner$Backend;->nanoTime()J

    move-result-wide v7

    sub-long/2addr v7, v2

    .line 51
    .local v7, "elapsedNs":J
    nop

    .line 52
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {v7, v8}, Lnicoid/network238/okhttp3/internal/concurrent/TaskLoggerKt;->formatDuration(J)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    # invokes: Lnicoid/network238/okhttp3/internal/concurrent/TaskLoggerKt;->log(Ljava/util/logging/Logger;Lnicoid/network238/okhttp3/internal/concurrent/Task;Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;Ljava/lang/String;)V
    invoke-static {p0, p1, p2, v0}, Lnicoid/network238/okhttp3/internal/concurrent/TaskLoggerKt;->access$log(Ljava/util/logging/Logger;Lnicoid/network238/okhttp3/internal/concurrent/Task;Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;Ljava/lang/String;)V

    .end local v7    # "elapsedNs":J
    :cond_1
    move-object v0, v6

    .line 47
    .local v0, "result":Ljava/lang/Object;
    return-object v6

    .line 49
    .end local v0    # "result":Ljava/lang/Object;
    :catchall_0
    move-exception v6

    if-eqz v4, :cond_3

    .line 50
    invoke-virtual {p2}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->getTaskRunner$okhttp()Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    move-result-object v7

    invoke-virtual {v7}, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->getBackend()Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner$Backend;

    move-result-object v7

    invoke-interface {v7}, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner$Backend;->nanoTime()J

    move-result-wide v7

    sub-long/2addr v7, v2

    .line 51
    .restart local v7    # "elapsedNs":J
    if-eqz v5, :cond_2

    .line 52
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {v7, v8}, Lnicoid/network238/okhttp3/internal/concurrent/TaskLoggerKt;->formatDuration(J)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    # invokes: Lnicoid/network238/okhttp3/internal/concurrent/TaskLoggerKt;->log(Ljava/util/logging/Logger;Lnicoid/network238/okhttp3/internal/concurrent/Task;Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;Ljava/lang/String;)V
    invoke-static {p0, p1, p2, v0}, Lnicoid/network238/okhttp3/internal/concurrent/TaskLoggerKt;->access$log(Ljava/util/logging/Logger;Lnicoid/network238/okhttp3/internal/concurrent/Task;Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;Ljava/lang/String;)V

    goto :goto_0

    .line 54
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "failed a run in "

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {v7, v8}, Lnicoid/network238/okhttp3/internal/concurrent/TaskLoggerKt;->formatDuration(J)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    # invokes: Lnicoid/network238/okhttp3/internal/concurrent/TaskLoggerKt;->log(Ljava/util/logging/Logger;Lnicoid/network238/okhttp3/internal/concurrent/Task;Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;Ljava/lang/String;)V
    invoke-static {p0, p1, p2, v0}, Lnicoid/network238/okhttp3/internal/concurrent/TaskLoggerKt;->access$log(Ljava/util/logging/Logger;Lnicoid/network238/okhttp3/internal/concurrent/Task;Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;Ljava/lang/String;)V

    .end local v7    # "elapsedNs":J
    :cond_3
    :goto_0
    throw v6
.end method

.method public static final taskLog(Ljava/util/logging/Logger;Lnicoid/network238/okhttp3/internal/concurrent/Task;Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;Lnicoid/network238/kotlin/jvm/functions/Function0;)V
    .registers 6
    .param p0, "$this$taskLog"    # Ljava/util/logging/Logger;
    .param p1, "task"    # Lnicoid/network238/okhttp3/internal/concurrent/Task;
    .param p2, "queue"    # Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;
    .param p3, "messageBlock"    # Lnicoid/network238/kotlin/jvm/functions/Function0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/logging/Logger;",
            "Lnicoid/network238/okhttp3/internal/concurrent/Task;",
            "Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;",
            "Lnicoid/network238/kotlin/jvm/functions/Function0;",
            ")V"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "task"

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "queue"

    invoke-static {p2, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "messageBlock"

    invoke-static {p3, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 26
    .local v0, "$i$f$taskLog":I
    sget-object v1, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {p0, v1}, Ljava/util/logging/Logger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 27
    invoke-interface {p3}, Lnicoid/network238/kotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    # invokes: Lnicoid/network238/okhttp3/internal/concurrent/TaskLoggerKt;->log(Ljava/util/logging/Logger;Lnicoid/network238/okhttp3/internal/concurrent/Task;Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;Ljava/lang/String;)V
    invoke-static {p0, p1, p2, v1}, Lnicoid/network238/okhttp3/internal/concurrent/TaskLoggerKt;->access$log(Ljava/util/logging/Logger;Lnicoid/network238/okhttp3/internal/concurrent/Task;Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;Ljava/lang/String;)V

    .line 29
    :cond_0
    return-void
.end method
