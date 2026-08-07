.class public Ll/j650;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/zy0$a;


# instance fields
.field public a:Ll/rg50;

.field public volatile b:Z

.field public c:J


# direct methods
.method public constructor <init>(Ll/rg50;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/j650;->a:Ll/rg50;

    .line 5
    .line 6
    invoke-static {}, Ll/zy0;->c()Ll/zy0;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p1, p0}, Ll/zy0;->h(Ll/zy0$a;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public a(Landroid/app/Activity;)V
    .locals 0

    .line 1
    return-void
.end method

.method public b(Z)V
    .locals 4

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    iput-wide v0, p0, Ll/j650;->c:J

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-wide v0, p0, Ll/j650;->c:J

    .line 11
    .line 12
    const-wide/16 v2, 0x0

    .line 13
    .line 14
    cmp-long p1, v0, v2

    .line 15
    .line 16
    if-eqz p1, :cond_2

    .line 17
    .line 18
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 19
    .line 20
    .line 21
    move-result-wide v0

    .line 22
    iget-wide v2, p0, Ll/j650;->c:J

    .line 23
    .line 24
    sub-long/2addr v0, v2

    .line 25
    const-wide/32 v2, 0x493e0

    .line 26
    .line 27
    .line 28
    cmp-long p1, v0, v2

    .line 29
    .line 30
    if-lez p1, :cond_1

    .line 31
    .line 32
    const/4 p1, 0x1

    .line 33
    goto :goto_0

    .line 34
    :cond_1
    const/4 p1, 0x0

    .line 35
    :goto_0
    iput-boolean p1, p0, Ll/j650;->b:Z

    .line 36
    .line 37
    :cond_2
    return-void
.end method

.method public c(Landroid/app/Activity;)V
    .locals 0

    .line 1
    return-void
.end method

.method public d(Landroid/app/Activity;)V
    .locals 0

    .line 1
    return-void
.end method

.method public e()Ll/rg50;
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/j650;->b:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    monitor-enter p0

    .line 6
    :try_start_0
    iget-boolean v0, p0, Ll/j650;->b:Z

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Ll/j650;->a:Ll/rg50;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/rg50;->v()Ll/rg50$b;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ll/lx5;

    .line 17
    .line 18
    invoke-direct {v1}, Ll/lx5;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ll/rg50$b;->g(Ll/lx5;)Ll/rg50$b;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Ll/rg50$b;->c()Ll/rg50;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Ll/j650;->a:Ll/rg50;

    .line 30
    .line 31
    const/4 v0, 0x0

    .line 32
    iput-boolean v0, p0, Ll/j650;->b:Z

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :catchall_0
    move-exception v0

    .line 36
    goto :goto_1

    .line 37
    :cond_0
    :goto_0
    monitor-exit p0

    .line 38
    goto :goto_2

    .line 39
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 40
    throw v0

    .line 41
    :cond_1
    :goto_2
    iget-object p0, p0, Ll/j650;->a:Ll/rg50;

    .line 42
    .line 43
    return-object p0
.end method

.method public f(Ll/xq4;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/j650;->a:Ll/rg50;

    .line 3
    .line 4
    invoke-virtual {v0}, Ll/rg50;->v()Ll/rg50$b;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0, p1}, Ll/rg50$b;->e(Ll/xq4;)Ll/rg50$b;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    new-instance v0, Ll/lx5;

    .line 13
    .line 14
    invoke-direct {v0}, Ll/lx5;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1, v0}, Ll/rg50$b;->g(Ll/lx5;)Ll/rg50$b;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p1}, Ll/rg50$b;->c()Ll/rg50;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iput-object p1, p0, Ll/j650;->a:Ll/rg50;

    .line 26
    .line 27
    const/4 p1, 0x0

    .line 28
    iput-boolean p1, p0, Ll/j650;->b:Z

    .line 29
    .line 30
    monitor-exit p0

    .line 31
    return-void

    .line 32
    :catchall_0
    move-exception p1

    .line 33
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    throw p1
.end method

.method public g(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/j650;->b:Z

    .line 2
    .line 3
    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onActivityStarted(Landroid/app/Activity;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onActivityStopped(Landroid/app/Activity;)V
    .locals 0

    .line 1
    return-void
.end method
