.class public final Ll/j560$b;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/j560;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
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

.field public final f:Ll/f2e0$a;

.field public final g:Ljava/lang/Object;

.field public h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public i:Z

.field public volatile j:Ll/j560$d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/j560$d<",
            "TT;>;"
        }
    .end annotation
.end field

.field public final synthetic k:Ll/j560;


# direct methods
.method public constructor <init>(Ll/j560;Ll/gcg0;Ll/f2e0$a;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-",
            "Lrx/c<",
            "TT;>;>;",
            "Ll/f2e0$a;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/j560$b;->k:Ll/j560;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ll/are0;

    .line 7
    .line 8
    invoke-direct {v0, p2}, Ll/are0;-><init>(Ll/gcg0;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/j560$b;->e:Ll/gcg0;

    .line 12
    .line 13
    iput-object p3, p0, Ll/j560$b;->f:Ll/f2e0$a;

    .line 14
    .line 15
    new-instance p3, Ljava/lang/Object;

    .line 16
    .line 17
    invoke-direct {p3}, Ljava/lang/Object;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object p3, p0, Ll/j560$b;->g:Ljava/lang/Object;

    .line 21
    .line 22
    invoke-static {}, Ll/j560$d;->c()Ll/j560$d;

    .line 23
    .line 24
    .line 25
    move-result-object p3

    .line 26
    iput-object p3, p0, Ll/j560$b;->j:Ll/j560$d;

    .line 27
    .line 28
    new-instance p3, Ll/j560$b$a;

    .line 29
    .line 30
    invoke-direct {p3, p0, p1}, Ll/j560$b$a;-><init>(Ll/j560$b;Ll/j560;)V

    .line 31
    .line 32
    .line 33
    invoke-static {p3}, Ll/pcg0;->a(Ll/x20;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p2, p0}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 38
    .line 39
    .line 40
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
    iget-object v0, p0, Ll/j560$b;->j:Ll/j560$d;

    .line 2
    .line 3
    iget-object v0, v0, Ll/j560$d;->a:Ll/bb50;

    .line 4
    .line 5
    iget-object v1, p0, Ll/j560$b;->j:Ll/j560$d;

    .line 6
    .line 7
    invoke-virtual {v1}, Ll/j560$d;->a()Ll/j560$d;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iput-object v1, p0, Ll/j560$b;->j:Ll/j560$d;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-interface {v0}, Ll/bb50;->onCompleted()V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, Ll/j560$b;->e:Ll/gcg0;

    .line 19
    .line 20
    invoke-interface {v0}, Ll/bb50;->onCompleted()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public h(Ljava/util/List;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;)Z"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    :cond_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_5

    .line 14
    .line 15
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    sget-object v2, Ll/j560;->f:Ljava/lang/Object;

    .line 20
    .line 21
    const/4 v3, 0x0

    .line 22
    if-ne v1, v2, :cond_2

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/j560$b;->l()Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-nez v1, :cond_1

    .line 29
    .line 30
    return v3

    .line 31
    :cond_2
    sget-object v2, Ll/j560;->g:Lrx/internal/operators/NotificationLite;

    .line 32
    .line 33
    invoke-virtual {v2, v1}, Lrx/internal/operators/NotificationLite;->h(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    if-eqz v4, :cond_3

    .line 38
    .line 39
    invoke-virtual {v2, v1}, Lrx/internal/operators/NotificationLite;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p0, p1}, Ll/j560$b;->j(Ljava/lang/Throwable;)V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_3
    invoke-virtual {v2, v1}, Lrx/internal/operators/NotificationLite;->g(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    if-eqz v2, :cond_4

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/j560$b;->g()V

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_4
    invoke-virtual {p0, v1}, Ll/j560$b;->i(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-nez v1, :cond_1

    .line 62
    .line 63
    return v3

    .line 64
    :cond_5
    :goto_0
    return v0
.end method

.method public i(Ljava/lang/Object;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/j560$b;->j:Ll/j560$d;

    .line 2
    .line 3
    iget-object v1, v0, Ll/j560$d;->a:Ll/bb50;

    .line 4
    .line 5
    if-nez v1, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/j560$b;->l()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return p0

    .line 15
    :cond_0
    iget-object v0, p0, Ll/j560$b;->j:Ll/j560$d;

    .line 16
    .line 17
    :cond_1
    iget-object v1, v0, Ll/j560$d;->a:Ll/bb50;

    .line 18
    .line 19
    invoke-interface {v1, p1}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    iget p1, v0, Ll/j560$d;->c:I

    .line 23
    .line 24
    iget-object v1, p0, Ll/j560$b;->k:Ll/j560;

    .line 25
    .line 26
    iget v1, v1, Ll/j560;->e:I

    .line 27
    .line 28
    const/4 v2, 0x1

    .line 29
    sub-int/2addr v1, v2

    .line 30
    if-ne p1, v1, :cond_2

    .line 31
    .line 32
    iget-object p1, v0, Ll/j560$d;->a:Ll/bb50;

    .line 33
    .line 34
    invoke-interface {p1}, Ll/bb50;->onCompleted()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Ll/j560$d;->a()Ll/j560$d;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    goto :goto_0

    .line 42
    :cond_2
    invoke-virtual {v0}, Ll/j560$d;->d()Ll/j560$d;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    :goto_0
    iput-object p1, p0, Ll/j560$b;->j:Ll/j560$d;

    .line 47
    .line 48
    return v2
.end method

.method public j(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/j560$b;->j:Ll/j560$d;

    .line 2
    .line 3
    iget-object v0, v0, Ll/j560$d;->a:Ll/bb50;

    .line 4
    .line 5
    iget-object v1, p0, Ll/j560$b;->j:Ll/j560$d;

    .line 6
    .line 7
    invoke-virtual {v1}, Ll/j560$d;->a()Ll/j560$d;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iput-object v1, p0, Ll/j560$b;->j:Ll/j560$d;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-interface {v0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, Ll/j560$b;->e:Ll/gcg0;

    .line 19
    .line 20
    invoke-interface {v0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public k()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/j560$b;->g:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-boolean v1, p0, Ll/j560$b;->i:Z

    .line 5
    .line 6
    if-eqz v1, :cond_1

    .line 7
    .line 8
    iget-object v1, p0, Ll/j560$b;->h:Ljava/util/List;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v1, p0, Ll/j560$b;->h:Ljava/util/List;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    goto :goto_4

    .line 22
    :cond_0
    :goto_0
    iget-object p0, p0, Ll/j560$b;->h:Ljava/util/List;

    .line 23
    .line 24
    sget-object v1, Ll/j560;->f:Ljava/lang/Object;

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
    const/4 v1, 0x1

    .line 32
    iput-boolean v1, p0, Ll/j560$b;->i:Z

    .line 33
    .line 34
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 35
    const/4 v0, 0x0

    .line 36
    :try_start_1
    invoke-virtual {p0}, Ll/j560$b;->l()Z

    .line 37
    .line 38
    .line 39
    move-result v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_5

    .line 40
    if-nez v2, :cond_2

    .line 41
    .line 42
    iget-object v2, p0, Ll/j560$b;->g:Ljava/lang/Object;

    .line 43
    .line 44
    monitor-enter v2

    .line 45
    :try_start_2
    iput-boolean v0, p0, Ll/j560$b;->i:Z

    .line 46
    .line 47
    monitor-exit v2

    .line 48
    return-void

    .line 49
    :catchall_1
    move-exception p0

    .line 50
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 51
    throw p0

    .line 52
    :cond_2
    :try_start_3
    iget-object v2, p0, Ll/j560$b;->g:Ljava/lang/Object;

    .line 53
    .line 54
    monitor-enter v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_5

    .line 55
    :try_start_4
    iget-object v3, p0, Ll/j560$b;->h:Ljava/util/List;

    .line 56
    .line 57
    if-nez v3, :cond_3

    .line 58
    .line 59
    iput-boolean v0, p0, Ll/j560$b;->i:Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 60
    .line 61
    :try_start_5
    monitor-exit v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 62
    return-void

    .line 63
    :catchall_2
    move-exception v3

    .line 64
    goto :goto_1

    .line 65
    :catchall_3
    move-exception v3

    .line 66
    move v1, v0

    .line 67
    goto :goto_1

    .line 68
    :cond_3
    const/4 v4, 0x0

    .line 69
    :try_start_6
    iput-object v4, p0, Ll/j560$b;->h:Ljava/util/List;

    .line 70
    .line 71
    monitor-exit v2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 72
    :try_start_7
    invoke-virtual {p0, v3}, Ll/j560$b;->h(Ljava/util/List;)Z

    .line 73
    .line 74
    .line 75
    move-result v2
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_5

    .line 76
    if-nez v2, :cond_2

    .line 77
    .line 78
    iget-object v2, p0, Ll/j560$b;->g:Ljava/lang/Object;

    .line 79
    .line 80
    monitor-enter v2

    .line 81
    :try_start_8
    iput-boolean v0, p0, Ll/j560$b;->i:Z

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
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_4

    .line 87
    throw p0

    .line 88
    :catchall_5
    move-exception v1

    .line 89
    move v2, v0

    .line 90
    goto :goto_2

    .line 91
    :goto_1
    :try_start_9
    monitor-exit v2
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    .line 92
    :try_start_a
    throw v3
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_6

    .line 93
    :catchall_6
    move-exception v2

    .line 94
    move-object v5, v2

    .line 95
    move v2, v1

    .line 96
    move-object v1, v5

    .line 97
    :goto_2
    if-nez v2, :cond_4

    .line 98
    .line 99
    iget-object v2, p0, Ll/j560$b;->g:Ljava/lang/Object;

    .line 100
    .line 101
    monitor-enter v2

    .line 102
    :try_start_b
    iput-boolean v0, p0, Ll/j560$b;->i:Z

    .line 103
    .line 104
    monitor-exit v2

    .line 105
    goto :goto_3

    .line 106
    :catchall_7
    move-exception p0

    .line 107
    monitor-exit v2
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_7

    .line 108
    throw p0

    .line 109
    :cond_4
    :goto_3
    throw v1

    .line 110
    :goto_4
    :try_start_c
    monitor-exit v0
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    .line 111
    throw p0
.end method

.method public l()Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/j560$b;->j:Ll/j560$d;

    .line 2
    .line 3
    iget-object v0, v0, Ll/j560$d;->a:Ll/bb50;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {v0}, Ll/bb50;->onCompleted()V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object v0, p0, Ll/j560$b;->e:Ll/gcg0;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/gcg0;->isUnsubscribed()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, Ll/j560$b;->j:Ll/j560$d;

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/j560$d;->a()Ll/j560$d;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object v0, p0, Ll/j560$b;->j:Ll/j560$d;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 27
    .line 28
    .line 29
    const/4 p0, 0x0

    .line 30
    return p0

    .line 31
    :cond_1
    invoke-static {}, Lrx/subjects/UnicastSubject;->b()Lrx/subjects/UnicastSubject;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iget-object v1, p0, Ll/j560$b;->j:Ll/j560$d;

    .line 36
    .line 37
    invoke-virtual {v1, v0, v0}, Ll/j560$d;->b(Ll/bb50;Lrx/c;)Ll/j560$d;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    iput-object v1, p0, Ll/j560$b;->j:Ll/j560$d;

    .line 42
    .line 43
    iget-object p0, p0, Ll/j560$b;->e:Ll/gcg0;

    .line 44
    .line 45
    invoke-interface {p0, v0}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    const/4 p0, 0x1

    .line 49
    return p0
.end method

.method public m()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/j560$b;->f:Ll/f2e0$a;

    .line 2
    .line 3
    new-instance v1, Ll/j560$b$b;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/j560$b$b;-><init>(Ll/j560$b;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/j560$b;->k:Ll/j560;

    .line 9
    .line 10
    iget-wide v4, p0, Ll/j560;->a:J

    .line 11
    .line 12
    iget-object v6, p0, Ll/j560;->c:Ljava/util/concurrent/TimeUnit;

    .line 13
    .line 14
    const-wide/16 v2, 0x0

    .line 15
    .line 16
    invoke-virtual/range {v0 .. v6}, Ll/f2e0$a;->d(Ll/x20;JJLjava/util/concurrent/TimeUnit;)Ll/kcg0;

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public onCompleted()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/j560$b;->g:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-boolean v1, p0, Ll/j560$b;->i:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    iget-object v2, p0, Ll/j560$b;->h:Ljava/util/List;

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
    iput-object v1, p0, Ll/j560$b;->h:Ljava/util/List;

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
    iget-object p0, p0, Ll/j560$b;->h:Ljava/util/List;

    .line 23
    .line 24
    sget-object v1, Ll/j560;->g:Lrx/internal/operators/NotificationLite;

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
    iput-object v1, p0, Ll/j560$b;->h:Ljava/util/List;

    .line 37
    .line 38
    const/4 v1, 0x1

    .line 39
    iput-boolean v1, p0, Ll/j560$b;->i:Z

    .line 40
    .line 41
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 42
    :try_start_2
    invoke-virtual {p0, v2}, Ll/j560$b;->h(Ljava/util/List;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Ll/j560$b;->g()V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :catchall_1
    move-exception v0

    .line 50
    invoke-virtual {p0, v0}, Ll/j560$b;->j(Ljava/lang/Throwable;)V

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
    iget-object v0, p0, Ll/j560$b;->g:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-boolean v1, p0, Ll/j560$b;->i:Z

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    sget-object v1, Ll/j560;->g:Lrx/internal/operators/NotificationLite;

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
    iput-object p1, p0, Ll/j560$b;->h:Ljava/util/List;

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
    iput-object v1, p0, Ll/j560$b;->h:Ljava/util/List;

    .line 26
    .line 27
    const/4 v1, 0x1

    .line 28
    iput-boolean v1, p0, Ll/j560$b;->i:Z

    .line 29
    .line 30
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    invoke-virtual {p0, p1}, Ll/j560$b;->j(Ljava/lang/Throwable;)V

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
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/j560$b;->g:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-boolean v1, p0, Ll/j560$b;->i:Z

    .line 5
    .line 6
    if-eqz v1, :cond_1

    .line 7
    .line 8
    iget-object v1, p0, Ll/j560$b;->h:Ljava/util/List;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v1, p0, Ll/j560$b;->h:Ljava/util/List;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    goto :goto_4

    .line 22
    :cond_0
    :goto_0
    iget-object p0, p0, Ll/j560$b;->h:Ljava/util/List;

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
    const/4 v1, 0x1

    .line 30
    iput-boolean v1, p0, Ll/j560$b;->i:Z

    .line 31
    .line 32
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    const/4 v0, 0x0

    .line 34
    :try_start_1
    invoke-virtual {p0, p1}, Ll/j560$b;->i(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_5

    .line 38
    if-nez p1, :cond_2

    .line 39
    .line 40
    iget-object p1, p0, Ll/j560$b;->g:Ljava/lang/Object;

    .line 41
    .line 42
    monitor-enter p1

    .line 43
    :try_start_2
    iput-boolean v0, p0, Ll/j560$b;->i:Z

    .line 44
    .line 45
    monitor-exit p1

    .line 46
    return-void

    .line 47
    :catchall_1
    move-exception p0

    .line 48
    monitor-exit p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 49
    throw p0

    .line 50
    :cond_2
    :try_start_3
    iget-object p1, p0, Ll/j560$b;->g:Ljava/lang/Object;

    .line 51
    .line 52
    monitor-enter p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_5

    .line 53
    :try_start_4
    iget-object v2, p0, Ll/j560$b;->h:Ljava/util/List;

    .line 54
    .line 55
    if-nez v2, :cond_3

    .line 56
    .line 57
    iput-boolean v0, p0, Ll/j560$b;->i:Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 58
    .line 59
    :try_start_5
    monitor-exit p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 60
    return-void

    .line 61
    :catchall_2
    move-exception v2

    .line 62
    goto :goto_1

    .line 63
    :catchall_3
    move-exception v2

    .line 64
    move v1, v0

    .line 65
    goto :goto_1

    .line 66
    :cond_3
    const/4 v3, 0x0

    .line 67
    :try_start_6
    iput-object v3, p0, Ll/j560$b;->h:Ljava/util/List;

    .line 68
    .line 69
    monitor-exit p1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 70
    :try_start_7
    invoke-virtual {p0, v2}, Ll/j560$b;->h(Ljava/util/List;)Z

    .line 71
    .line 72
    .line 73
    move-result p1
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_5

    .line 74
    if-nez p1, :cond_2

    .line 75
    .line 76
    iget-object p1, p0, Ll/j560$b;->g:Ljava/lang/Object;

    .line 77
    .line 78
    monitor-enter p1

    .line 79
    :try_start_8
    iput-boolean v0, p0, Ll/j560$b;->i:Z

    .line 80
    .line 81
    monitor-exit p1

    .line 82
    return-void

    .line 83
    :catchall_4
    move-exception p0

    .line 84
    monitor-exit p1
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_4

    .line 85
    throw p0

    .line 86
    :catchall_5
    move-exception p1

    .line 87
    move v1, v0

    .line 88
    goto :goto_2

    .line 89
    :goto_1
    :try_start_9
    monitor-exit p1
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    .line 90
    :try_start_a
    throw v2
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_6

    .line 91
    :catchall_6
    move-exception p1

    .line 92
    :goto_2
    if-nez v1, :cond_4

    .line 93
    .line 94
    iget-object v1, p0, Ll/j560$b;->g:Ljava/lang/Object;

    .line 95
    .line 96
    monitor-enter v1

    .line 97
    :try_start_b
    iput-boolean v0, p0, Ll/j560$b;->i:Z

    .line 98
    .line 99
    monitor-exit v1

    .line 100
    goto :goto_3

    .line 101
    :catchall_7
    move-exception p0

    .line 102
    monitor-exit v1
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_7

    .line 103
    throw p0

    .line 104
    :cond_4
    :goto_3
    throw p1

    .line 105
    :goto_4
    :try_start_c
    monitor-exit v0
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    .line 106
    throw p0
.end method
