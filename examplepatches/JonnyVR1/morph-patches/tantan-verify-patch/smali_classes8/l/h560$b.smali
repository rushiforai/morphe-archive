.class public final Ll/h560$b;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/h560;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "U:",
        "Ljava/lang/Object;",
        ">",
        "Ll/gcg0<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public final e:Ll/gcg0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/gcg0<",
            "-",
            "Lrx/c<",
            "TT;>;>;"
        }
    .end annotation
.end field

.field public final f:Ljava/lang/Object;

.field public g:Ll/bb50;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/bb50<",
            "TT;>;"
        }
    .end annotation
.end field

.field public h:Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation
.end field

.field public i:Z

.field public j:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public final k:Ll/wqe0;

.field public final l:Ll/pcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pcj<",
            "+",
            "Lrx/c<",
            "+TU;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/gcg0;Ll/pcj;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-",
            "Lrx/c<",
            "TT;>;>;",
            "Ll/pcj<",
            "+",
            "Lrx/c<",
            "+TU;>;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/are0;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ll/are0;-><init>(Ll/gcg0;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/h560$b;->e:Ll/gcg0;

    .line 10
    .line 11
    new-instance p1, Ljava/lang/Object;

    .line 12
    .line 13
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Ll/h560$b;->f:Ljava/lang/Object;

    .line 17
    .line 18
    new-instance p1, Ll/wqe0;

    .line 19
    .line 20
    invoke-direct {p1}, Ll/wqe0;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Ll/h560$b;->k:Ll/wqe0;

    .line 24
    .line 25
    iput-object p2, p0, Ll/h560$b;->l:Ll/pcj;

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method


# virtual methods
.method public d()V
    .locals 2

    .line 1
    const-wide v0, 0x7fffffffffffffffL

    .line 2
    .line 3
    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0, v1}, Ll/gcg0;->e(J)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public g()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/h560$b;->g:Ll/bb50;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iput-object v1, p0, Ll/h560$b;->g:Ll/bb50;

    .line 5
    .line 6
    iput-object v1, p0, Ll/h560$b;->h:Lrx/c;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-interface {v0}, Ll/bb50;->onCompleted()V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Ll/h560$b;->e:Ll/gcg0;

    .line 14
    .line 15
    invoke-interface {v0}, Ll/bb50;->onCompleted()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public h()V
    .locals 2

    .line 1
    invoke-static {}, Lrx/subjects/UnicastSubject;->b()Lrx/subjects/UnicastSubject;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Ll/h560$b;->g:Ll/bb50;

    .line 6
    .line 7
    iput-object v0, p0, Ll/h560$b;->h:Lrx/c;

    .line 8
    .line 9
    :try_start_0
    iget-object v0, p0, Ll/h560$b;->l:Ll/pcj;

    .line 10
    .line 11
    invoke-interface {v0}, Ll/pcj;->call()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lrx/c;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    .line 17
    new-instance v1, Ll/h560$a;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/h560$a;-><init>(Ll/h560$b;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/h560$b;->k:Ll/wqe0;

    .line 23
    .line 24
    invoke-virtual {p0, v1}, Ll/wqe0;->b(Ll/kcg0;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->unsafeSubscribe(Ll/gcg0;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :catchall_0
    move-exception v0

    .line 32
    iget-object v1, p0, Ll/h560$b;->e:Ll/gcg0;

    .line 33
    .line 34
    invoke-interface {v1, v0}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public i(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_1

    .line 4
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_4

    .line 13
    .line 14
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget-object v1, Ll/h560;->b:Ljava/lang/Object;

    .line 19
    .line 20
    if-ne v0, v1, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/h560$b;->l()V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    sget-object v1, Ll/h560;->c:Lrx/internal/operators/NotificationLite;

    .line 27
    .line 28
    invoke-virtual {v1, v0}, Lrx/internal/operators/NotificationLite;->h(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-eqz v2, :cond_2

    .line 33
    .line 34
    invoke-virtual {v1, v0}, Lrx/internal/operators/NotificationLite;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p0, p1}, Ll/h560$b;->k(Ljava/lang/Throwable;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_2
    invoke-virtual {v1, v0}, Lrx/internal/operators/NotificationLite;->g(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-eqz v1, :cond_3

    .line 47
    .line 48
    invoke-virtual {p0}, Ll/h560$b;->g()V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_3
    invoke-virtual {p0, v0}, Ll/h560$b;->j(Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_4
    :goto_1
    return-void
.end method

.method public j(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/h560$b;->g:Ll/bb50;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public k(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/h560$b;->g:Ll/bb50;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iput-object v1, p0, Ll/h560$b;->g:Ll/bb50;

    .line 5
    .line 6
    iput-object v1, p0, Ll/h560$b;->h:Lrx/c;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-interface {v0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Ll/h560$b;->e:Ll/gcg0;

    .line 14
    .line 15
    invoke-interface {v0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public l()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/h560$b;->g:Ll/bb50;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/bb50;->onCompleted()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-virtual {p0}, Ll/h560$b;->h()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/h560$b;->e:Ll/gcg0;

    .line 12
    .line 13
    iget-object p0, p0, Ll/h560$b;->h:Lrx/c;

    .line 14
    .line 15
    invoke-interface {v0, p0}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public m()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/h560$b;->f:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-boolean v1, p0, Ll/h560$b;->i:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    iget-object v2, p0, Ll/h560$b;->j:Ljava/util/List;

    .line 7
    .line 8
    if-eqz v1, :cond_1

    .line 9
    .line 10
    if-nez v2, :cond_0

    .line 11
    .line 12
    :try_start_1
    new-instance v1, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v1, p0, Ll/h560$b;->j:Ljava/util/List;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    goto :goto_6

    .line 22
    :cond_0
    :goto_0
    iget-object p0, p0, Ll/h560$b;->j:Ljava/util/List;

    .line 23
    .line 24
    sget-object v1, Ll/h560;->b:Ljava/lang/Object;

    .line 25
    .line 26
    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    monitor-exit v0

    .line 30
    return-void

    .line 31
    :cond_1
    const/4 v1, 0x0

    .line 32
    iput-object v1, p0, Ll/h560$b;->j:Ljava/util/List;

    .line 33
    .line 34
    const/4 v3, 0x1

    .line 35
    iput-boolean v3, p0, Ll/h560$b;->i:Z

    .line 36
    .line 37
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 38
    move v0, v3

    .line 39
    :goto_1
    const/4 v4, 0x0

    .line 40
    :try_start_2
    invoke-virtual {p0, v2}, Ll/h560$b;->i(Ljava/util/List;)V

    .line 41
    .line 42
    .line 43
    if-eqz v0, :cond_2

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/h560$b;->l()V

    .line 46
    .line 47
    .line 48
    move v0, v4

    .line 49
    goto :goto_2

    .line 50
    :catchall_1
    move-exception v0

    .line 51
    move v3, v4

    .line 52
    goto :goto_4

    .line 53
    :cond_2
    :goto_2
    iget-object v2, p0, Ll/h560$b;->f:Ljava/lang/Object;

    .line 54
    .line 55
    monitor-enter v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 56
    :try_start_3
    iget-object v5, p0, Ll/h560$b;->j:Ljava/util/List;

    .line 57
    .line 58
    iput-object v1, p0, Ll/h560$b;->j:Ljava/util/List;

    .line 59
    .line 60
    if-nez v5, :cond_3

    .line 61
    .line 62
    iput-boolean v4, p0, Ll/h560$b;->i:Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    .line 63
    .line 64
    :try_start_4
    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 65
    return-void

    .line 66
    :catchall_2
    move-exception v0

    .line 67
    goto :goto_3

    .line 68
    :catchall_3
    move-exception v0

    .line 69
    move v3, v4

    .line 70
    goto :goto_3

    .line 71
    :cond_3
    :try_start_5
    monitor-exit v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 72
    :try_start_6
    iget-object v2, p0, Ll/h560$b;->e:Ll/gcg0;

    .line 73
    .line 74
    invoke-virtual {v2}, Ll/gcg0;->isUnsubscribed()Z

    .line 75
    .line 76
    .line 77
    move-result v2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 78
    if-eqz v2, :cond_4

    .line 79
    .line 80
    iget-object v2, p0, Ll/h560$b;->f:Ljava/lang/Object;

    .line 81
    .line 82
    monitor-enter v2

    .line 83
    :try_start_7
    iput-boolean v4, p0, Ll/h560$b;->i:Z

    .line 84
    .line 85
    monitor-exit v2

    .line 86
    return-void

    .line 87
    :catchall_4
    move-exception p0

    .line 88
    monitor-exit v2
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_4

    .line 89
    throw p0

    .line 90
    :cond_4
    move-object v2, v5

    .line 91
    goto :goto_1

    .line 92
    :goto_3
    :try_start_8
    monitor-exit v2
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 93
    :try_start_9
    throw v0
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_5

    .line 94
    :catchall_5
    move-exception v0

    .line 95
    :goto_4
    if-nez v3, :cond_5

    .line 96
    .line 97
    iget-object v1, p0, Ll/h560$b;->f:Ljava/lang/Object;

    .line 98
    .line 99
    monitor-enter v1

    .line 100
    :try_start_a
    iput-boolean v4, p0, Ll/h560$b;->i:Z

    .line 101
    .line 102
    monitor-exit v1

    .line 103
    goto :goto_5

    .line 104
    :catchall_6
    move-exception p0

    .line 105
    monitor-exit v1
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_6

    .line 106
    throw p0

    .line 107
    :cond_5
    :goto_5
    throw v0

    .line 108
    :goto_6
    :try_start_b
    monitor-exit v0
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    .line 109
    throw p0
.end method

.method public onCompleted()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/h560$b;->f:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-boolean v1, p0, Ll/h560$b;->i:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    iget-object v2, p0, Ll/h560$b;->j:Ljava/util/List;

    .line 7
    .line 8
    if-eqz v1, :cond_1

    .line 9
    .line 10
    if-nez v2, :cond_0

    .line 11
    .line 12
    :try_start_1
    new-instance v1, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v1, p0, Ll/h560$b;->j:Ljava/util/List;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    iget-object p0, p0, Ll/h560$b;->j:Ljava/util/List;

    .line 23
    .line 24
    sget-object v1, Ll/h560;->c:Lrx/internal/operators/NotificationLite;

    .line 25
    .line 26
    invoke-virtual {v1}, Lrx/internal/operators/NotificationLite;->b()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    monitor-exit v0

    .line 34
    return-void

    .line 35
    :cond_1
    const/4 v1, 0x0

    .line 36
    iput-object v1, p0, Ll/h560$b;->j:Ljava/util/List;

    .line 37
    .line 38
    const/4 v1, 0x1

    .line 39
    iput-boolean v1, p0, Ll/h560$b;->i:Z

    .line 40
    .line 41
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 42
    :try_start_2
    invoke-virtual {p0, v2}, Ll/h560$b;->i(Ljava/util/List;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Ll/h560$b;->g()V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :catchall_1
    move-exception v0

    .line 50
    invoke-virtual {p0, v0}, Ll/h560$b;->k(Ljava/lang/Throwable;)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :goto_1
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 55
    throw p0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/h560$b;->f:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-boolean v1, p0, Ll/h560$b;->i:Z

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    sget-object v1, Ll/h560;->c:Lrx/internal/operators/NotificationLite;

    .line 9
    .line 10
    invoke-virtual {v1, p1}, Lrx/internal/operators/NotificationLite;->c(Ljava/lang/Throwable;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, Ll/h560$b;->j:Ljava/util/List;

    .line 19
    .line 20
    monitor-exit v0

    .line 21
    return-void

    .line 22
    :catchall_0
    move-exception p0

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 v1, 0x0

    .line 25
    iput-object v1, p0, Ll/h560$b;->j:Ljava/util/List;

    .line 26
    .line 27
    const/4 v1, 0x1

    .line 28
    iput-boolean v1, p0, Ll/h560$b;->i:Z

    .line 29
    .line 30
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    invoke-virtual {p0, p1}, Ll/h560$b;->k(Ljava/lang/Throwable;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :goto_0
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 36
    throw p0
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/h560$b;->f:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-boolean v1, p0, Ll/h560$b;->i:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    iget-object v2, p0, Ll/h560$b;->j:Ljava/util/List;

    .line 7
    .line 8
    if-eqz v1, :cond_1

    .line 9
    .line 10
    if-nez v2, :cond_0

    .line 11
    .line 12
    :try_start_1
    new-instance v1, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v1, p0, Ll/h560$b;->j:Ljava/util/List;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    goto :goto_6

    .line 22
    :cond_0
    :goto_0
    iget-object p0, p0, Ll/h560$b;->j:Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    monitor-exit v0

    .line 28
    return-void

    .line 29
    :cond_1
    const/4 v1, 0x0

    .line 30
    iput-object v1, p0, Ll/h560$b;->j:Ljava/util/List;

    .line 31
    .line 32
    const/4 v3, 0x1

    .line 33
    iput-boolean v3, p0, Ll/h560$b;->i:Z

    .line 34
    .line 35
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 36
    move v0, v3

    .line 37
    :goto_1
    const/4 v4, 0x0

    .line 38
    :try_start_2
    invoke-virtual {p0, v2}, Ll/h560$b;->i(Ljava/util/List;)V

    .line 39
    .line 40
    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    invoke-virtual {p0, p1}, Ll/h560$b;->j(Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    move v0, v4

    .line 47
    goto :goto_2

    .line 48
    :catchall_1
    move-exception p1

    .line 49
    move v3, v4

    .line 50
    goto :goto_4

    .line 51
    :cond_2
    :goto_2
    iget-object v2, p0, Ll/h560$b;->f:Ljava/lang/Object;

    .line 52
    .line 53
    monitor-enter v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 54
    :try_start_3
    iget-object v5, p0, Ll/h560$b;->j:Ljava/util/List;

    .line 55
    .line 56
    iput-object v1, p0, Ll/h560$b;->j:Ljava/util/List;

    .line 57
    .line 58
    if-nez v5, :cond_3

    .line 59
    .line 60
    iput-boolean v4, p0, Ll/h560$b;->i:Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    .line 61
    .line 62
    :try_start_4
    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 63
    return-void

    .line 64
    :catchall_2
    move-exception p1

    .line 65
    goto :goto_3

    .line 66
    :catchall_3
    move-exception p1

    .line 67
    move v3, v4

    .line 68
    goto :goto_3

    .line 69
    :cond_3
    :try_start_5
    monitor-exit v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 70
    :try_start_6
    iget-object v2, p0, Ll/h560$b;->e:Ll/gcg0;

    .line 71
    .line 72
    invoke-virtual {v2}, Ll/gcg0;->isUnsubscribed()Z

    .line 73
    .line 74
    .line 75
    move-result v2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 76
    if-eqz v2, :cond_4

    .line 77
    .line 78
    iget-object v2, p0, Ll/h560$b;->f:Ljava/lang/Object;

    .line 79
    .line 80
    monitor-enter v2

    .line 81
    :try_start_7
    iput-boolean v4, p0, Ll/h560$b;->i:Z

    .line 82
    .line 83
    monitor-exit v2

    .line 84
    return-void

    .line 85
    :catchall_4
    move-exception p0

    .line 86
    monitor-exit v2
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_4

    .line 87
    throw p0

    .line 88
    :cond_4
    move-object v2, v5

    .line 89
    goto :goto_1

    .line 90
    :goto_3
    :try_start_8
    monitor-exit v2
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 91
    :try_start_9
    throw p1
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_5

    .line 92
    :catchall_5
    move-exception p1

    .line 93
    :goto_4
    if-nez v3, :cond_5

    .line 94
    .line 95
    iget-object v0, p0, Ll/h560$b;->f:Ljava/lang/Object;

    .line 96
    .line 97
    monitor-enter v0

    .line 98
    :try_start_a
    iput-boolean v4, p0, Ll/h560$b;->i:Z

    .line 99
    .line 100
    monitor-exit v0

    .line 101
    goto :goto_5

    .line 102
    :catchall_6
    move-exception p0

    .line 103
    monitor-exit v0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_6

    .line 104
    throw p0

    .line 105
    :cond_5
    :goto_5
    throw p1

    .line 106
    :goto_6
    :try_start_b
    monitor-exit v0
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    .line 107
    throw p0
.end method
