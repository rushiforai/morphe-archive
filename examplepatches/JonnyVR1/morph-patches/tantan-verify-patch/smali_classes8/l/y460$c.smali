.class public final Ll/y460$c;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/y460;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ll/gcg0<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public final e:Ll/wqe0;

.field public final f:Ll/are0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/are0<",
            "TT;>;"
        }
    .end annotation
.end field

.field public final g:Ll/y460$b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y460$b<",
            "TT;>;"
        }
    .end annotation
.end field

.field public final h:Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/c<",
            "+TT;>;"
        }
    .end annotation
.end field

.field public final i:Ll/f2e0$a;

.field public final j:Ll/xk90;

.field public k:Z

.field public l:J


# direct methods
.method public constructor <init>(Ll/are0;Ll/y460$b;Ll/wqe0;Lrx/c;Ll/f2e0$a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/are0<",
            "TT;>;",
            "Ll/y460$b<",
            "TT;>;",
            "Ll/wqe0;",
            "Lrx/c<",
            "+TT;>;",
            "Ll/f2e0$a;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/y460$c;->f:Ll/are0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/y460$c;->g:Ll/y460$b;

    .line 7
    .line 8
    iput-object p3, p0, Ll/y460$c;->e:Ll/wqe0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/y460$c;->h:Lrx/c;

    .line 11
    .line 12
    iput-object p5, p0, Ll/y460$c;->i:Ll/f2e0$a;

    .line 13
    .line 14
    new-instance p1, Ll/xk90;

    .line 15
    .line 16
    invoke-direct {p1}, Ll/xk90;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Ll/y460$c;->j:Ll/xk90;

    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public f(Ll/vk90;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y460$c;->j:Ll/xk90;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/xk90;->c(Ll/vk90;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public g(J)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Ll/y460$c;->l:J

    .line 3
    .line 4
    cmp-long p1, p1, v0

    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    iget-boolean p1, p0, Ll/y460$c;->k:Z

    .line 9
    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    const/4 p1, 0x1

    .line 13
    iput-boolean p1, p0, Ll/y460$c;->k:Z

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception p1

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    const/4 p1, 0x0

    .line 19
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    if-eqz p1, :cond_2

    .line 21
    .line 22
    iget-object p1, p0, Ll/y460$c;->h:Lrx/c;

    .line 23
    .line 24
    if-nez p1, :cond_1

    .line 25
    .line 26
    iget-object p0, p0, Ll/y460$c;->f:Ll/are0;

    .line 27
    .line 28
    new-instance p1, Ljava/util/concurrent/TimeoutException;

    .line 29
    .line 30
    invoke-direct {p1}, Ljava/util/concurrent/TimeoutException;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, p1}, Ll/are0;->onError(Ljava/lang/Throwable;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    new-instance p1, Ll/y460$c$a;

    .line 38
    .line 39
    invoke-direct {p1, p0}, Ll/y460$c$a;-><init>(Ll/y460$c;)V

    .line 40
    .line 41
    .line 42
    iget-object p2, p0, Ll/y460$c;->h:Lrx/c;

    .line 43
    .line 44
    invoke-virtual {p2, p1}, Lrx/c;->unsafeSubscribe(Ll/gcg0;)Ll/kcg0;

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Ll/y460$c;->e:Ll/wqe0;

    .line 48
    .line 49
    invoke-virtual {p0, p1}, Ll/wqe0;->b(Ll/kcg0;)V

    .line 50
    .line 51
    .line 52
    :cond_2
    return-void

    .line 53
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 54
    throw p1
.end method

.method public onCompleted()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Ll/y460$c;->k:Z

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Ll/y460$c;->k:Z

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :catchall_0
    move-exception v0

    .line 11
    goto :goto_1

    .line 12
    :cond_0
    const/4 v0, 0x0

    .line 13
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object v0, p0, Ll/y460$c;->e:Ll/wqe0;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/wqe0;->unsubscribe()V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Ll/y460$c;->f:Ll/are0;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/are0;->onCompleted()V

    .line 24
    .line 25
    .line 26
    :cond_1
    return-void

    .line 27
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 28
    throw v0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Ll/y460$c;->k:Z

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Ll/y460$c;->k:Z

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :catchall_0
    move-exception p1

    .line 11
    goto :goto_1

    .line 12
    :cond_0
    const/4 v0, 0x0

    .line 13
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object v0, p0, Ll/y460$c;->e:Ll/wqe0;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/wqe0;->unsubscribe()V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Ll/y460$c;->f:Ll/are0;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ll/are0;->onError(Ljava/lang/Throwable;)V

    .line 24
    .line 25
    .line 26
    :cond_1
    return-void

    .line 27
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 28
    throw p1
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Ll/y460$c;->k:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    iget-wide v1, p0, Ll/y460$c;->l:J

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    const-wide/16 v3, 0x1

    .line 9
    .line 10
    add-long/2addr v1, v3

    .line 11
    :try_start_1
    iput-wide v1, p0, Ll/y460$c;->l:J

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    goto :goto_0

    .line 15
    :catchall_0
    move-exception p1

    .line 16
    goto :goto_1

    .line 17
    :cond_0
    const/4 v0, 0x0

    .line 18
    :goto_0
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    iget-object v0, p0, Ll/y460$c;->f:Ll/are0;

    .line 22
    .line 23
    invoke-virtual {v0, p1}, Ll/are0;->onNext(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/y460$c;->e:Ll/wqe0;

    .line 27
    .line 28
    iget-object v3, p0, Ll/y460$c;->g:Ll/y460$b;

    .line 29
    .line 30
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iget-object v2, p0, Ll/y460$c;->i:Ll/f2e0$a;

    .line 35
    .line 36
    invoke-interface {v3, p0, v1, p1, v2}, Ll/tcj;->b(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    check-cast p0, Ll/kcg0;

    .line 41
    .line 42
    invoke-virtual {v0, p0}, Ll/wqe0;->b(Ll/kcg0;)V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void

    .line 46
    :goto_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 47
    throw p1
.end method
