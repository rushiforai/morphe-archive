.class public Ll/ar0;
.super Ll/zq0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/ar0$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Ll/yq0;",
        ">",
        "Ll/zq0<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public final e:Ll/l610;

.field public final f:Ljava/util/concurrent/ScheduledExecutorService;

.field public g:Z

.field public h:J

.field public i:J

.field public j:J

.field public k:Ll/ar0$b;

.field public final l:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Ll/yq0;Ll/ar0$b;Ll/l610;Ljava/util/concurrent/ScheduledExecutorService;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ll/ar0$b;",
            "Ll/l610;",
            "Ljava/util/concurrent/ScheduledExecutorService;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/zq0;-><init>(Ll/yq0;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ll/ar0;->g:Z

    .line 6
    .line 7
    const-wide/16 v0, 0x7d0

    .line 8
    .line 9
    iput-wide v0, p0, Ll/ar0;->i:J

    .line 10
    .line 11
    const-wide/16 v0, 0x3e8

    .line 12
    .line 13
    iput-wide v0, p0, Ll/ar0;->j:J

    .line 14
    .line 15
    new-instance p1, Ll/ar0$a;

    .line 16
    .line 17
    invoke-direct {p1, p0}, Ll/ar0$a;-><init>(Ll/ar0;)V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Ll/ar0;->l:Ljava/lang/Runnable;

    .line 21
    .line 22
    iput-object p2, p0, Ll/ar0;->k:Ll/ar0$b;

    .line 23
    .line 24
    iput-object p3, p0, Ll/ar0;->e:Ll/l610;

    .line 25
    .line 26
    iput-object p4, p0, Ll/ar0;->f:Ljava/util/concurrent/ScheduledExecutorService;

    .line 27
    .line 28
    return-void
.end method

.method public static bridge synthetic j(Ll/ar0;)Ll/ar0$b;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar0;->k:Ll/ar0$b;

    return-object p0
.end method

.method public static bridge synthetic k(Ll/ar0;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/ar0;->g:Z

    return-void
.end method

.method public static bridge synthetic l(Ll/ar0;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar0;->p()Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic m(Ll/ar0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar0;->q()V

    return-void
.end method

.method public static n(Ll/yq0;Ll/ar0$b;Ll/l610;Ljava/util/concurrent/ScheduledExecutorService;)Ll/zq0;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ll/yq0;",
            ">(TT;",
            "Ll/ar0$b;",
            "Ll/l610;",
            "Ljava/util/concurrent/ScheduledExecutorService;",
            ")",
            "Ll/zq0<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/ar0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Ll/ar0;-><init>(Ll/yq0;Ll/ar0$b;Ll/l610;Ljava/util/concurrent/ScheduledExecutorService;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static o(Ll/yq0;Ll/l610;Ljava/util/concurrent/ScheduledExecutorService;)Ll/zq0;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ll/yq0;",
            ":",
            "Ll/ar0$b;",
            ">(TT;",
            "Ll/l610;",
            "Ljava/util/concurrent/ScheduledExecutorService;",
            ")",
            "Ll/zq0<",
            "TT;>;"
        }
    .end annotation

    .line 1
    move-object v0, p0

    .line 2
    check-cast v0, Ll/ar0$b;

    .line 3
    .line 4
    invoke-static {p0, v0, p1, p2}, Ll/ar0;->n(Ll/yq0;Ll/ar0$b;Ll/l610;Ljava/util/concurrent/ScheduledExecutorService;)Ll/zq0;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method


# virtual methods
.method public i(Landroid/graphics/drawable/Drawable;Landroid/graphics/Canvas;I)Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar0;->e:Ll/l610;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/l610;->now()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    iput-wide v0, p0, Ll/ar0;->h:J

    .line 8
    .line 9
    invoke-super {p0, p1, p2, p3}, Ll/zq0;->i(Landroid/graphics/drawable/Drawable;Landroid/graphics/Canvas;I)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    invoke-virtual {p0}, Ll/ar0;->q()V

    .line 14
    .line 15
    .line 16
    return p1
.end method

.method public final p()Z
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ar0;->e:Ll/l610;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/l610;->now()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    iget-wide v2, p0, Ll/ar0;->h:J

    .line 8
    .line 9
    sub-long/2addr v0, v2

    .line 10
    iget-wide v2, p0, Ll/ar0;->i:J

    .line 11
    .line 12
    cmp-long p0, v0, v2

    .line 13
    .line 14
    if-lez p0, :cond_0

    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    return p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0
.end method

.method public final declared-synchronized q()V
    .locals 5

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Ll/ar0;->g:Z

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Ll/ar0;->g:Z

    .line 8
    .line 9
    iget-object v0, p0, Ll/ar0;->f:Ljava/util/concurrent/ScheduledExecutorService;

    .line 10
    .line 11
    iget-object v1, p0, Ll/ar0;->l:Ljava/lang/Runnable;

    .line 12
    .line 13
    iget-wide v2, p0, Ll/ar0;->j:J

    .line 14
    .line 15
    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 16
    .line 17
    invoke-interface {v0, v1, v2, v3, v4}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :catchall_0
    move-exception v0

    .line 22
    goto :goto_1

    .line 23
    :cond_0
    :goto_0
    monitor-exit p0

    .line 24
    return-void

    .line 25
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 26
    throw v0
.end method
