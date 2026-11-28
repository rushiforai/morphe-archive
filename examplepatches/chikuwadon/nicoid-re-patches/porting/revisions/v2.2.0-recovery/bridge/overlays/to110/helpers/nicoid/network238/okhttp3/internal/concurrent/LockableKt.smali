.class public final Lnicoid/network238/okhttp3/internal/concurrent/LockableKt;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u001e\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\t\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u001a\r\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\u0087\u0008\u001a\r\u0010\u0003\u001a\u00020\u0001*\u00020\u0002H\u0087\u0008\u001a\r\u0010\u0004\u001a\u00020\u0001*\u00020\u0002H\u0087\u0008\u001a\u0015\u0010\u0005\u001a\u00020\u0001*\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u0007H\u0087\u0008\u001a\r\u0010\u0008\u001a\u00020\u0001*\u00020\u0002H\u0080\u0008\u001a\r\u0010\t\u001a\u00020\u0001*\u00020\u0002H\u0080\u0008\u001a6\u0010\n\u001a\u0002H\u000b\"\u0004\u0008\u0000\u0010\u000b*\u00020\u00022\u000c\u0010\u000c\u001a\u0008\u0012\u0004\u0012\u0002H\u000b0\rH\u0086\u0008\u00f8\u0001\u0000\u0082\u0002\n\n\u0008\u0008\u0001\u0012\u0002\u0010\u0001 \u0001\u00a2\u0006\u0002\u0010\u000e\u0082\u0002\u0007\n\u0005\u0008\u009920\u0001\u00a8\u0006\u000f"
    }
    d2 = {
        "wait",
        "",
        "Lnicoid/network238/okhttp3/internal/concurrent/Lockable;",
        "notify",
        "notifyAll",
        "awaitNanos",
        "nanos",
        "",
        "assertLockNotHeld",
        "assertLockHeld",
        "withLock",
        "T",
        "action",
        "Lnicoid/network238/kotlin/Function0;",
        "(Lnicoid/network238/okhttp3/internal/concurrent/Lockable;Lnicoid/network238/kotlin/jvm/functions/Function0;)Ljava/lang/Object;",
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
.method public static final assertLockHeld(Lnicoid/network238/okhttp3/internal/concurrent/Lockable;)V
    .registers 5
    .param p0, "$this$assertLockHeld"    # Lnicoid/network238/okhttp3/internal/concurrent/Lockable;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 60
    .local v0, "$i$f$assertLockHeld":I
    sget-boolean v1, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->assertionsEnabled:Z

    if-eqz v1, :cond_0

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 61
    new-instance v1, Ljava/lang/AssertionError;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Thread "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " MUST hold lock on "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1

    .line 63
    :cond_0
    return-void
.end method

.method public static final assertLockNotHeld(Lnicoid/network238/okhttp3/internal/concurrent/Lockable;)V
    .registers 5
    .param p0, "$this$assertLockNotHeld"    # Lnicoid/network238/okhttp3/internal/concurrent/Lockable;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 54
    .local v0, "$i$f$assertLockNotHeld":I
    sget-boolean v1, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->assertionsEnabled:Z

    if-eqz v1, :cond_0

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 55
    new-instance v1, Ljava/lang/AssertionError;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Thread "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " MUST NOT hold lock on "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1

    .line 57
    :cond_0
    return-void
.end method

.method public static final awaitNanos(Lnicoid/network238/okhttp3/internal/concurrent/Lockable;J)V
    .registers 11
    .param p0, "$this$awaitNanos"    # Lnicoid/network238/okhttp3/internal/concurrent/Lockable;
    .param p1, "nanos"    # J

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 46
    .local v0, "$i$f$awaitNanos":I
    const-wide/32 v1, 0xf4240

    div-long v3, p1, v1

    .line 47
    .local v3, "ms":J
    mul-long/2addr v1, v3

    sub-long v1, p1, v1

    .line 48
    .local v1, "ns":J
    const-wide/16 v5, 0x0

    cmp-long v7, v3, v5

    if-gtz v7, :cond_0

    cmp-long v5, p1, v5

    if-gtz v5, :cond_0

    goto :goto_0

    .line 49
    :cond_0
    move-object v5, p0

    check-cast v5, Ljava/lang/Object;

    long-to-int v6, v1

    invoke-virtual {v5, v3, v4, v6}, Ljava/lang/Object;->wait(JI)V

    .line 51
    :goto_0
    return-void
.end method

.method public static final notify(Lnicoid/network238/okhttp3/internal/concurrent/Lockable;)V
    .registers 3
    .param p0, "$this$notify"    # Lnicoid/network238/okhttp3/internal/concurrent/Lockable;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 39
    .local v0, "$i$f$notify":I
    move-object v1, p0

    check-cast v1, Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->notify()V

    return-void
.end method

.method public static final notifyAll(Lnicoid/network238/okhttp3/internal/concurrent/Lockable;)V
    .registers 3
    .param p0, "$this$notifyAll"    # Lnicoid/network238/okhttp3/internal/concurrent/Lockable;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 42
    .local v0, "$i$f$notifyAll":I
    move-object v1, p0

    check-cast v1, Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    return-void
.end method

.method public static final wait(Lnicoid/network238/okhttp3/internal/concurrent/Lockable;)V
    .registers 3
    .param p0, "$this$wait"    # Lnicoid/network238/okhttp3/internal/concurrent/Lockable;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 36
    .local v0, "$i$f$wait":I
    move-object v1, p0

    check-cast v1, Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V

    return-void
.end method

.method public static final withLock(Lnicoid/network238/okhttp3/internal/concurrent/Lockable;Lnicoid/network238/kotlin/jvm/functions/Function0;)Ljava/lang/Object;
    .registers 4
    .param p0, "$this$withLock"    # Lnicoid/network238/okhttp3/internal/concurrent/Lockable;
    .param p1, "action"    # Lnicoid/network238/kotlin/jvm/functions/Function0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lnicoid/network238/okhttp3/internal/concurrent/Lockable;",
            "Lnicoid/network238/kotlin/jvm/functions/Function0;",
            ")TT;"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "action"

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 68
    .local v0, "$i$f$withLock":I
    monitor-enter p0

    :try_start_0
    invoke-interface {p1}, Lnicoid/network238/kotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method
