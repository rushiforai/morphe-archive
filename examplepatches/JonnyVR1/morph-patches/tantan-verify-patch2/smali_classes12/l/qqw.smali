.class public Ll/qqw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/zxl;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/qqw$b;
    }
.end annotation


# instance fields
.field private a:Ll/lnc0;

.field private final b:Ljava/lang/Object;

.field private c:Ljava/util/concurrent/ScheduledFuture;

.field private volatile d:Z

.field private volatile e:Z

.field private f:Ll/lre0;


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/Object;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/qqw;->b:Ljava/lang/Object;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Ll/qqw;->d:Z

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    iput-boolean v0, p0, Ll/qqw;->e:Z

    .line 16
    .line 17
    invoke-static {}, Ll/lre0;->c()Ll/lre0;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iput-object v0, p0, Ll/qqw;->f:Ll/lre0;

    .line 22
    .line 23
    new-instance v0, Ll/lnc0;

    .line 24
    .line 25
    invoke-static {}, Ll/gqw;->f()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    invoke-static {}, Ll/gqw;->g()I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    invoke-static {}, Ll/gqw;->h()I

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    invoke-direct {v0, v1, v2, v3}, Ll/lnc0;-><init>(III)V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Ll/qqw;->a:Ll/lnc0;

    .line 41
    .line 42
    return-void
.end method

.method public static synthetic d(Ll/qqw;Ll/fzv;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qqw;->a:Ll/lnc0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/lnc0;->d(Ll/fzv;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ll/qqw;->o()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic e(Ll/qqw;)Z
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/qqw;->m()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic f(Ll/qqw;)Ll/lre0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qqw;->f:Ll/lre0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic g(Ll/qqw;Ll/lre0;)Ll/lre0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qqw;->f:Ll/lre0;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic h(Ll/qqw;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qqw;->b:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic i(Ll/qqw;)Ll/lnc0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qqw;->a:Ll/lnc0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic j(Ll/qqw;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/qqw;->d:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic k(Ll/qqw;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/qqw;->d:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic l(Ll/qqw;Ll/lre0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qqw;->n(Ll/lre0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private m()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/qqw;->e:Z

    .line 2
    .line 3
    if-nez p0, :cond_1

    .line 4
    .line 5
    invoke-static {}, Ll/gqw;->a()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 15
    return p0
.end method

.method private declared-synchronized n(Ll/lre0;)V
    .locals 8

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iput-object p1, p0, Ll/qqw;->f:Ll/lre0;

    .line 3
    .line 4
    invoke-virtual {p1}, Ll/lre0;->a()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    iget-object v0, p0, Ll/qqw;->c:Ljava/util/concurrent/ScheduledFuture;

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    invoke-interface {v0, v1}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 16
    .line 17
    .line 18
    :cond_0
    const-string v0, "channel cooled, wait until scheduledFuture cancelled..."

    .line 19
    .line 20
    invoke-static {v0}, Ll/gqw;->w(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/qqw;->c:Ljava/util/concurrent/ScheduledFuture;

    .line 24
    .line 25
    invoke-interface {v0}, Ljava/util/concurrent/Future;->isCancelled()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    new-instance v2, Ll/qqw$b;

    .line 32
    .line 33
    const/4 v0, 0x0

    .line 34
    invoke-direct {v2, p0, v0}, Ll/qqw$b;-><init>(Ll/qqw;Ll/qqw$a;)V

    .line 35
    .line 36
    .line 37
    iget p1, p1, Ll/lre0;->d:I

    .line 38
    .line 39
    int-to-long v3, p1

    .line 40
    iget-object p1, p0, Ll/qqw;->a:Ll/lnc0;

    .line 41
    .line 42
    invoke-virtual {p1}, Ll/lnc0;->c()I

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    int-to-long v5, p1

    .line 47
    sget-object v7, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 48
    .line 49
    const/4 v1, 0x5

    .line 50
    invoke-static/range {v1 .. v7}, Lcom/immomo/mmutil/task/c;->f(ILjava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    iput-object p1, p0, Ll/qqw;->c:Ljava/util/concurrent/ScheduledFuture;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :catchall_0
    move-exception v0

    .line 58
    move-object p1, v0

    .line 59
    goto :goto_1

    .line 60
    :cond_1
    :goto_0
    monitor-exit p0

    .line 61
    return-void

    .line 62
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 63
    throw p1
.end method

.method private declared-synchronized o()V
    .locals 8

    .line 1
    const-string v0, "tryTriggerUpload but "

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    invoke-static {}, Ll/gqw;->q()Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-eqz v1, :cond_2

    .line 9
    .line 10
    invoke-direct {p0}, Ll/qqw;->m()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_2

    .line 15
    .line 16
    iget-object v0, p0, Ll/qqw;->a:Ll/lnc0;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/lnc0;->a()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    iget-boolean v0, p0, Ll/qqw;->d:Z

    .line 25
    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    const-string v0, "tryTriggerUpload --->  start upload task"

    .line 29
    .line 30
    invoke-static {v0}, Ll/gqw;->s(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    new-instance v2, Ll/qqw$b;

    .line 34
    .line 35
    const/4 v0, 0x0

    .line 36
    invoke-direct {v2, p0, v0}, Ll/qqw$b;-><init>(Ll/qqw;Ll/qqw$a;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/qqw;->a:Ll/lnc0;

    .line 40
    .line 41
    invoke-virtual {v0}, Ll/lnc0;->c()I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    int-to-long v5, v0

    .line 46
    sget-object v7, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 47
    .line 48
    const/4 v1, 0x5

    .line 49
    const-wide/16 v3, 0x0

    .line 50
    .line 51
    invoke-static/range {v1 .. v7}, Lcom/immomo/mmutil/task/c;->f(ILjava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iput-object v0, p0, Ll/qqw;->c:Ljava/util/concurrent/ScheduledFuture;

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :catchall_0
    move-exception v0

    .line 59
    goto :goto_2

    .line 60
    :cond_0
    const-string v0, "queue has data, notify fixed rate task"

    .line 61
    .line 62
    invoke-static {v0}, Ll/gqw;->s(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    iget-object v1, p0, Ll/qqw;->b:Ljava/lang/Object;

    .line 66
    .line 67
    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 68
    :try_start_1
    iget-object v0, p0, Ll/qqw;->b:Ljava/lang/Object;

    .line 69
    .line 70
    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 71
    .line 72
    .line 73
    monitor-exit v1

    .line 74
    goto :goto_1

    .line 75
    :catchall_1
    move-exception v0

    .line 76
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 77
    :try_start_2
    throw v0

    .line 78
    :cond_1
    const-string v0, "tryTriggerUpload --->  record array is null"

    .line 79
    .line 80
    invoke-static {v0}, Ll/gqw;->w(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_2
    invoke-static {}, Ll/gqw;->q()Z

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    if-nez v1, :cond_3

    .line 89
    .line 90
    const-string v1, "realtime disabled"

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_3
    const-string v1, "app background"

    .line 94
    .line 95
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-static {v0}, Ll/gqw;->w(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 100
    .line 101
    .line 102
    :goto_1
    monitor-exit p0

    .line 103
    return-void

    .line 104
    :goto_2
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 105
    throw v0
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/qqw;->e:Z

    .line 3
    .line 4
    return-void
.end method

.method public b(Ll/fzv;)V
    .locals 1
    .param p1    # Ll/fzv;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/qqw;->f:Ll/lre0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/lre0;->a()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Ll/pqw;

    .line 10
    .line 11
    invoke-direct {v0, p0, p1}, Ll/pqw;-><init>(Ll/qqw;Ll/fzv;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x2

    .line 15
    invoke-static {p0, v0}, Lcom/immomo/mmutil/task/c;->d(ILjava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    const-string p0, "channel cooled, drop log record"

    .line 20
    .line 21
    invoke-static {p0}, Ll/gqw;->w(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public c()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/qqw;->e:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/qqw;->f:Ll/lre0;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/lre0;->a()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Ll/qqw;->b:Ljava/lang/Object;

    .line 13
    .line 14
    monitor-enter v0

    .line 15
    :try_start_0
    iget-object p0, p0, Ll/qqw;->b:Ljava/lang/Object;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 18
    .line 19
    .line 20
    const-string p0, "appEnter, notify task"

    .line 21
    .line 22
    invoke-static {p0}, Ll/gqw;->w(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    monitor-exit v0

    .line 26
    return-void

    .line 27
    :catchall_0
    move-exception p0

    .line 28
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    throw p0

    .line 30
    :cond_0
    return-void
.end method
