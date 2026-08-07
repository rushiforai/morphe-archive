.class public final Ll/pfv0;
.super Ll/yhv0;
.source "SourceFile"


# direct methods
.method public static a(Ljava/lang/Object;)Ll/lqv0;
    .locals 1

    .line 1
    new-instance v0, Ll/ejv0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ejv0;-><init>(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static b(Ll/lqv0;JLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/ScheduledExecutorService;)Ll/lqv0;
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/util/concurrent/Future;->isDone()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    const-wide/16 p1, 0x6f54

    .line 9
    .line 10
    invoke-static {p0, p1, p2, p3, p4}, Lcom/google/android/gms/internal/play_billing/t;->B(Ll/lqv0;JLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/ScheduledExecutorService;)Ll/lqv0;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static c(Ll/lqv0;Ll/edv0;Ljava/util/concurrent/Executor;)V
    .locals 1

    .line 1
    new-instance v0, Ll/jev0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/jev0;-><init>(Ljava/util/concurrent/Future;Ll/edv0;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p0, v0, p2}, Ll/lqv0;->h(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
