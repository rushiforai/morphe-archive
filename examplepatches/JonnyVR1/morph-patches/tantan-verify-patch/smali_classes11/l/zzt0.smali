.class public final Ll/zzt0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/concurrent/Executor;

.field public final b:Ljava/util/concurrent/ScheduledExecutorService;

.field public final c:Ll/hpr;

.field public volatile d:Z


# direct methods
.method public constructor <init>(Ljava/util/concurrent/Executor;Ljava/util/concurrent/ScheduledExecutorService;Ll/hpr;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/zzt0;->d:Z

    .line 6
    .line 7
    iput-object p1, p0, Ll/zzt0;->a:Ljava/util/concurrent/Executor;

    .line 8
    .line 9
    iput-object p2, p0, Ll/zzt0;->b:Ljava/util/concurrent/ScheduledExecutorService;

    .line 10
    .line 11
    iput-object p3, p0, Ll/zzt0;->c:Ll/hpr;

    .line 12
    .line 13
    return-void
.end method

.method public static bridge synthetic b(Ll/zzt0;Ljava/util/List;Ll/lvw0;)V
    .locals 5

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    invoke-static {v0}, Ll/pvw0;->h(Ljava/lang/Object;)Ll/hpr;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Ll/hpr;

    .line 30
    .line 31
    new-instance v2, Ll/vzt0;

    .line 32
    .line 33
    invoke-direct {v2, p2}, Ll/vzt0;-><init>(Ll/lvw0;)V

    .line 34
    .line 35
    .line 36
    iget-object v3, p0, Ll/zzt0;->a:Ljava/util/concurrent/Executor;

    .line 37
    .line 38
    const-class v4, Ljava/lang/Throwable;

    .line 39
    .line 40
    invoke-static {v0, v4, v2, v3}, Ll/pvw0;->f(Ll/hpr;Ljava/lang/Class;Ll/xuw0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    new-instance v2, Ll/wzt0;

    .line 45
    .line 46
    invoke-direct {v2, p0, p2, v1}, Ll/wzt0;-><init>(Ll/zzt0;Ll/lvw0;Ll/hpr;)V

    .line 47
    .line 48
    .line 49
    iget-object v1, p0, Ll/zzt0;->a:Ljava/util/concurrent/Executor;

    .line 50
    .line 51
    invoke-static {v0, v2, v1}, Ll/pvw0;->n(Ll/hpr;Ll/xuw0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    goto :goto_0

    .line 56
    :cond_1
    new-instance p1, Ll/yzt0;

    .line 57
    .line 58
    invoke-direct {p1, p0, p2}, Ll/yzt0;-><init>(Ll/zzt0;Ll/lvw0;)V

    .line 59
    .line 60
    .line 61
    iget-object p0, p0, Ll/zzt0;->a:Ljava/util/concurrent/Executor;

    .line 62
    .line 63
    invoke-static {v0, p1, p0}, Ll/pvw0;->r(Ll/hpr;Ll/lvw0;Ljava/util/concurrent/Executor;)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_2
    :goto_1
    iget-object p0, p0, Ll/zzt0;->a:Ljava/util/concurrent/Executor;

    .line 68
    .line 69
    new-instance p1, Ll/uzt0;

    .line 70
    .line 71
    invoke-direct {p1, p2}, Ll/uzt0;-><init>(Ll/lvw0;)V

    .line 72
    .line 73
    .line 74
    invoke-interface {p0, p1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public static bridge synthetic c(Ll/zzt0;)V
    .locals 2

    .line 1
    sget-object v0, Ll/oct0;->e:Ll/xvw0;

    .line 2
    .line 3
    new-instance v1, Ll/tzt0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/tzt0;-><init>(Ll/zzt0;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final synthetic a(Ll/lvw0;Ll/hpr;Ll/kzt0;)Ll/hpr;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    invoke-interface {p1, p3}, Ll/lvw0;->zzb(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    :cond_0
    sget-object p1, Ll/ujs0;->b:Ll/kis0;

    .line 7
    .line 8
    invoke-virtual {p1}, Ll/kis0;->e()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Ljava/lang/Long;

    .line 13
    .line 14
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    iget-object p0, p0, Ll/zzt0;->b:Ljava/util/concurrent/ScheduledExecutorService;

    .line 19
    .line 20
    sget-object p1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 21
    .line 22
    invoke-static {p2, v0, v1, p1, p0}, Ll/pvw0;->o(Ll/hpr;JLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/ScheduledExecutorService;)Ll/hpr;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public final synthetic d()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/zzt0;->d:Z

    .line 3
    .line 4
    return-void
.end method

.method public final e(Ll/lvw0;)V
    .locals 1

    .line 1
    new-instance v0, Ll/xzt0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/xzt0;-><init>(Ll/zzt0;Ll/lvw0;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/zzt0;->a:Ljava/util/concurrent/Executor;

    .line 7
    .line 8
    iget-object p0, p0, Ll/zzt0;->c:Ll/hpr;

    .line 9
    .line 10
    invoke-static {p0, v0, p1}, Ll/pvw0;->r(Ll/hpr;Ll/lvw0;Ljava/util/concurrent/Executor;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final f()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/zzt0;->d:Z

    .line 2
    .line 3
    return p0
.end method
