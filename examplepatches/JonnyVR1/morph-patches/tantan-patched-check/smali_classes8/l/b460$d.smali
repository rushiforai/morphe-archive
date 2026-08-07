.class public final Ll/b460$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vk90;
.implements Ll/bb50;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/b460;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "d"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ll/vk90;",
        "Ll/bb50<",
        "TR;>;"
    }
.end annotation


# instance fields
.field public final a:Ll/gcg0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/gcg0<",
            "-TR;>;"
        }
    .end annotation
.end field

.field public final b:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public c:Z

.field public d:Z

.field public e:J

.field public final f:Ljava/util/concurrent/atomic/AtomicLong;

.field public volatile g:Ll/vk90;

.field public volatile h:Z

.field public i:Ljava/lang/Throwable;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Ll/gcg0;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TR;",
            "Ll/gcg0<",
            "-TR;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/b460$d;->a:Ll/gcg0;

    .line 5
    .line 6
    invoke-static {}, Lrx/internal/util/unsafe/UnsafeAccess;->isUnsafeAvailable()Z

    .line 7
    .line 8
    .line 9
    move-result p2

    .line 10
    if-eqz p2, :cond_0

    .line 11
    .line 12
    new-instance p2, Lrx/internal/util/unsafe/SpscLinkedQueue;

    .line 13
    .line 14
    invoke-direct {p2}, Lrx/internal/util/unsafe/SpscLinkedQueue;-><init>()V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    new-instance p2, Ll/qzf0;

    .line 19
    .line 20
    invoke-direct {p2}, Ll/qzf0;-><init>()V

    .line 21
    .line 22
    .line 23
    :goto_0
    iput-object p2, p0, Ll/b460$d;->b:Ljava/util/Queue;

    .line 24
    .line 25
    invoke-static {}, Lrx/internal/operators/NotificationLite;->f()Lrx/internal/operators/NotificationLite;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0, p1}, Lrx/internal/operators/NotificationLite;->j(Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-interface {p2, p1}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    new-instance p1, Ljava/util/concurrent/atomic/AtomicLong;

    .line 37
    .line 38
    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    .line 39
    .line 40
    .line 41
    iput-object p1, p0, Ll/b460$d;->f:Ljava/util/concurrent/atomic/AtomicLong;

    .line 42
    .line 43
    return-void
.end method


# virtual methods
.method public a(ZZLl/gcg0;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZ",
            "Ll/gcg0<",
            "-TR;>;)Z"
        }
    .end annotation

    .line 1
    invoke-virtual {p3}, Ll/gcg0;->isUnsubscribed()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    if-eqz p1, :cond_2

    .line 10
    .line 11
    iget-object p0, p0, Ll/b460$d;->i:Ljava/lang/Throwable;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    invoke-interface {p3, p0}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 16
    .line 17
    .line 18
    return v1

    .line 19
    :cond_1
    if-eqz p2, :cond_2

    .line 20
    .line 21
    invoke-interface {p3}, Ll/bb50;->onCompleted()V

    .line 22
    .line 23
    .line 24
    return v1

    .line 25
    :cond_2
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public b()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Ll/b460$d;->c:Z

    .line 3
    .line 4
    const/4 v1, 0x1

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iput-boolean v1, p0, Ll/b460$d;->d:Z

    .line 8
    .line 9
    monitor-exit p0

    .line 10
    return-void

    .line 11
    :catchall_0
    move-exception v0

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iput-boolean v1, p0, Ll/b460$d;->c:Z

    .line 14
    .line 15
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    invoke-virtual {p0}, Ll/b460$d;->c()V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 21
    throw v0
.end method

.method public c()V
    .locals 14

    .line 1
    iget-object v0, p0, Ll/b460$d;->a:Ll/gcg0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/b460$d;->b:Ljava/util/Queue;

    .line 4
    .line 5
    invoke-static {}, Lrx/internal/operators/NotificationLite;->f()Lrx/internal/operators/NotificationLite;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    iget-object v3, p0, Ll/b460$d;->f:Ljava/util/concurrent/atomic/AtomicLong;

    .line 10
    .line 11
    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 12
    .line 13
    .line 14
    move-result-wide v4

    .line 15
    :goto_0
    iget-boolean v6, p0, Ll/b460$d;->h:Z

    .line 16
    .line 17
    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    .line 18
    .line 19
    .line 20
    move-result v7

    .line 21
    invoke-virtual {p0, v6, v7, v0}, Ll/b460$d;->a(ZZLl/gcg0;)Z

    .line 22
    .line 23
    .line 24
    move-result v6

    .line 25
    if-eqz v6, :cond_0

    .line 26
    .line 27
    goto :goto_3

    .line 28
    :cond_0
    const-wide/16 v6, 0x0

    .line 29
    .line 30
    move-wide v8, v6

    .line 31
    :goto_1
    cmp-long v10, v8, v4

    .line 32
    .line 33
    const/4 v11, 0x0

    .line 34
    if-eqz v10, :cond_4

    .line 35
    .line 36
    iget-boolean v10, p0, Ll/b460$d;->h:Z

    .line 37
    .line 38
    invoke-interface {v1}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v12

    .line 42
    if-nez v12, :cond_1

    .line 43
    .line 44
    const/4 v13, 0x1

    .line 45
    goto :goto_2

    .line 46
    :cond_1
    move v13, v11

    .line 47
    :goto_2
    invoke-virtual {p0, v10, v13, v0}, Ll/b460$d;->a(ZZLl/gcg0;)Z

    .line 48
    .line 49
    .line 50
    move-result v10

    .line 51
    if-eqz v10, :cond_2

    .line 52
    .line 53
    :goto_3
    return-void

    .line 54
    :cond_2
    if-eqz v13, :cond_3

    .line 55
    .line 56
    goto :goto_4

    .line 57
    :cond_3
    invoke-virtual {v2, v12}, Lrx/internal/operators/NotificationLite;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v10

    .line 61
    :try_start_0
    invoke-interface {v0, v10}, Ll/bb50;->onNext(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 62
    .line 63
    .line 64
    const-wide/16 v10, 0x1

    .line 65
    .line 66
    add-long/2addr v8, v10

    .line 67
    goto :goto_1

    .line 68
    :catchall_0
    move-exception p0

    .line 69
    invoke-static {p0, v0, v10}, Ll/j6f;->g(Ljava/lang/Throwable;Ll/bb50;Ljava/lang/Object;)V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_4
    :goto_4
    cmp-long v6, v8, v6

    .line 74
    .line 75
    if-eqz v6, :cond_5

    .line 76
    .line 77
    const-wide v6, 0x7fffffffffffffffL

    .line 78
    .line 79
    .line 80
    .line 81
    .line 82
    cmp-long v6, v4, v6

    .line 83
    .line 84
    if-eqz v6, :cond_5

    .line 85
    .line 86
    invoke-static {v3, v8, v9}, Ll/rc2;->i(Ljava/util/concurrent/atomic/AtomicLong;J)J

    .line 87
    .line 88
    .line 89
    move-result-wide v4

    .line 90
    :cond_5
    monitor-enter p0

    .line 91
    :try_start_1
    iget-boolean v6, p0, Ll/b460$d;->d:Z

    .line 92
    .line 93
    if-nez v6, :cond_6

    .line 94
    .line 95
    iput-boolean v11, p0, Ll/b460$d;->c:Z

    .line 96
    .line 97
    monitor-exit p0

    .line 98
    return-void

    .line 99
    :catchall_1
    move-exception v0

    .line 100
    goto :goto_5

    .line 101
    :cond_6
    iput-boolean v11, p0, Ll/b460$d;->d:Z

    .line 102
    .line 103
    monitor-exit p0

    .line 104
    goto :goto_0

    .line 105
    :goto_5
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 106
    throw v0
.end method

.method public d(Ll/vk90;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/b460$d;->f:Ljava/util/concurrent/atomic/AtomicLong;

    .line 5
    .line 6
    monitor-enter v0

    .line 7
    :try_start_0
    iget-object v1, p0, Ll/b460$d;->g:Ll/vk90;

    .line 8
    .line 9
    if-nez v1, :cond_2

    .line 10
    .line 11
    iget-wide v1, p0, Ll/b460$d;->e:J

    .line 12
    .line 13
    const-wide v3, 0x7fffffffffffffffL

    .line 14
    .line 15
    .line 16
    .line 17
    .line 18
    cmp-long v3, v1, v3

    .line 19
    .line 20
    if-eqz v3, :cond_0

    .line 21
    .line 22
    const-wide/16 v3, 0x1

    .line 23
    .line 24
    sub-long/2addr v1, v3

    .line 25
    :cond_0
    const-wide/16 v3, 0x0

    .line 26
    .line 27
    iput-wide v3, p0, Ll/b460$d;->e:J

    .line 28
    .line 29
    iput-object p1, p0, Ll/b460$d;->g:Ll/vk90;

    .line 30
    .line 31
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    cmp-long v0, v1, v3

    .line 33
    .line 34
    if-lez v0, :cond_1

    .line 35
    .line 36
    invoke-interface {p1, v1, v2}, Ll/vk90;->request(J)V

    .line 37
    .line 38
    .line 39
    :cond_1
    invoke-virtual {p0}, Ll/b460$d;->b()V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :catchall_0
    move-exception p0

    .line 44
    goto :goto_0

    .line 45
    :cond_2
    :try_start_1
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 46
    .line 47
    const-string p1, "Can\'t set more than one Producer!"

    .line 48
    .line 49
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    throw p0

    .line 53
    :goto_0
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 54
    throw p0
.end method

.method public onCompleted()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/b460$d;->h:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/b460$d;->b()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/b460$d;->i:Ljava/lang/Throwable;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    iput-boolean p1, p0, Ll/b460$d;->h:Z

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/b460$d;->b()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TR;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/b460$d;->b:Ljava/util/Queue;

    .line 2
    .line 3
    invoke-static {}, Lrx/internal/operators/NotificationLite;->f()Lrx/internal/operators/NotificationLite;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1, p1}, Lrx/internal/operators/NotificationLite;->j(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-interface {v0, p1}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/b460$d;->b()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public request(J)V
    .locals 4

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-ltz v0, :cond_4

    .line 6
    .line 7
    if-eqz v0, :cond_3

    .line 8
    .line 9
    iget-object v0, p0, Ll/b460$d;->f:Ljava/util/concurrent/atomic/AtomicLong;

    .line 10
    .line 11
    invoke-static {v0, p1, p2}, Ll/rc2;->b(Ljava/util/concurrent/atomic/AtomicLong;J)J

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/b460$d;->g:Ll/vk90;

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    iget-object v1, p0, Ll/b460$d;->f:Ljava/util/concurrent/atomic/AtomicLong;

    .line 19
    .line 20
    monitor-enter v1

    .line 21
    :try_start_0
    iget-object v0, p0, Ll/b460$d;->g:Ll/vk90;

    .line 22
    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    iget-wide v2, p0, Ll/b460$d;->e:J

    .line 26
    .line 27
    invoke-static {v2, v3, p1, p2}, Ll/rc2;->a(JJ)J

    .line 28
    .line 29
    .line 30
    move-result-wide v2

    .line 31
    iput-wide v2, p0, Ll/b460$d;->e:J

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :catchall_0
    move-exception p0

    .line 35
    goto :goto_1

    .line 36
    :cond_0
    :goto_0
    monitor-exit v1

    .line 37
    goto :goto_2

    .line 38
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 39
    throw p0

    .line 40
    :cond_1
    :goto_2
    if-eqz v0, :cond_2

    .line 41
    .line 42
    invoke-interface {v0, p1, p2}, Ll/vk90;->request(J)V

    .line 43
    .line 44
    .line 45
    :cond_2
    invoke-virtual {p0}, Ll/b460$d;->b()V

    .line 46
    .line 47
    .line 48
    :cond_3
    return-void

    .line 49
    :cond_4
    const-string p0, "n >= required but it was "

    .line 50
    .line 51
    invoke-static {p0, p1, p2}, Ll/fcg0;->a(Ljava/lang/String;J)V

    .line 52
    .line 53
    .line 54
    return-void
.end method
