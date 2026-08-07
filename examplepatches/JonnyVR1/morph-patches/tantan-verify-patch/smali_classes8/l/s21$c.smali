.class public final Ll/s21$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vk90;
.implements Ll/kcg0;
.implements Ll/bb50;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/s21;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<S:",
        "Ljava/lang/Object;",
        "T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ll/vk90;",
        "Ll/kcg0;",
        "Ll/bb50<",
        "Lrx/c<",
        "+TT;>;>;"
    }
.end annotation


# instance fields
.field public final a:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public final b:Ll/s21;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/s21<",
            "TS;TT;>;"
        }
    .end annotation
.end field

.field public final c:Ll/yqe0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/yqe0<",
            "Lrx/c<",
            "+TT;>;>;"
        }
    .end annotation
.end field

.field public final d:Ll/ft5;

.field public e:Z

.field public f:Z

.field public g:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TS;"
        }
    .end annotation
.end field

.field public final h:Ll/s21$d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/s21$d<",
            "Lrx/c<",
            "TT;>;>;"
        }
    .end annotation
.end field

.field public i:Z

.field public j:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field public k:Ll/vk90;

.field public l:J


# direct methods
.method public constructor <init>(Ll/s21;Ljava/lang/Object;Ll/s21$d;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/s21<",
            "TS;TT;>;TS;",
            "Ll/s21$d<",
            "Lrx/c<",
            "TT;>;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ft5;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/ft5;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/s21$c;->d:Ll/ft5;

    .line 10
    .line 11
    iput-object p1, p0, Ll/s21$c;->b:Ll/s21;

    .line 12
    .line 13
    new-instance p1, Ll/yqe0;

    .line 14
    .line 15
    invoke-direct {p1, p0}, Ll/yqe0;-><init>(Ll/bb50;)V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Ll/s21$c;->c:Ll/yqe0;

    .line 19
    .line 20
    iput-object p2, p0, Ll/s21$c;->g:Ljava/lang/Object;

    .line 21
    .line 22
    iput-object p3, p0, Ll/s21$c;->h:Ll/s21$d;

    .line 23
    .line 24
    new-instance p1, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 25
    .line 26
    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object p1, p0, Ll/s21$c;->a:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 30
    .line 31
    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/s21$c;->d:Ll/ft5;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ft5;->unsubscribe()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-object v0, p0, Ll/s21$c;->b:Ll/s21;

    .line 7
    .line 8
    iget-object v1, p0, Ll/s21$c;->g:Ljava/lang/Object;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/s21;->d(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :catchall_0
    move-exception v0

    .line 15
    invoke-virtual {p0, v0}, Ll/s21$c;->b(Ljava/lang/Throwable;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final b(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/s21$c;->e:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {p1}, Ll/hrd0;->j(Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const/4 v0, 0x1

    .line 10
    iput-boolean v0, p0, Ll/s21$c;->e:Z

    .line 11
    .line 12
    iget-object v0, p0, Ll/s21$c;->h:Ll/s21$d;

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Ll/s21$d;->onError(Ljava/lang/Throwable;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ll/s21$c;->a()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public c(J)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/s21$c;->b:Ll/s21;

    .line 2
    .line 3
    iget-object v1, p0, Ll/s21$c;->g:Ljava/lang/Object;

    .line 4
    .line 5
    iget-object v2, p0, Ll/s21$c;->c:Ll/yqe0;

    .line 6
    .line 7
    invoke-virtual {v0, v1, p1, p2, v2}, Ll/s21;->c(Ljava/lang/Object;JLl/bb50;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Ll/s21$c;->g:Ljava/lang/Object;

    .line 12
    .line 13
    return-void
.end method

.method public d(Lrx/c;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/c<",
            "+TT;>;)V"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/s21$c;->f:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Ll/s21$c;->f:Z

    .line 7
    .line 8
    iget-boolean v0, p0, Ll/s21$c;->e:Z

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {p0, p1}, Ll/s21$c;->g(Lrx/c;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_1
    const-string p0, "onNext called multiple times!"

    .line 18
    .line 19
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public e(J)V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    if-ltz v0, :cond_6

    .line 9
    .line 10
    monitor-enter p0

    .line 11
    :try_start_0
    iget-boolean v0, p0, Ll/s21$c;->i:Z

    .line 12
    .line 13
    if-eqz v0, :cond_2

    .line 14
    .line 15
    iget-object v0, p0, Ll/s21$c;->j:Ljava/util/List;

    .line 16
    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    new-instance v0, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Ll/s21$c;->j:Ljava/util/List;

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :catchall_0
    move-exception p1

    .line 28
    goto :goto_3

    .line 29
    :cond_1
    :goto_0
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    monitor-exit p0

    .line 37
    return-void

    .line 38
    :cond_2
    const/4 v0, 0x1

    .line 39
    iput-boolean v0, p0, Ll/s21$c;->i:Z

    .line 40
    .line 41
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 42
    invoke-virtual {p0, p1, p2}, Ll/s21$c;->h(J)Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-eqz p1, :cond_3

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_3
    monitor-enter p0

    .line 50
    :try_start_1
    iget-object p1, p0, Ll/s21$c;->j:Ljava/util/List;

    .line 51
    .line 52
    if-nez p1, :cond_4

    .line 53
    .line 54
    const/4 p1, 0x0

    .line 55
    iput-boolean p1, p0, Ll/s21$c;->i:Z

    .line 56
    .line 57
    monitor-exit p0

    .line 58
    return-void

    .line 59
    :catchall_1
    move-exception p1

    .line 60
    goto :goto_2

    .line 61
    :cond_4
    const/4 p2, 0x0

    .line 62
    iput-object p2, p0, Ll/s21$c;->j:Ljava/util/List;

    .line 63
    .line 64
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 65
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    :cond_5
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 70
    .line 71
    .line 72
    move-result p2

    .line 73
    if-eqz p2, :cond_3

    .line 74
    .line 75
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object p2

    .line 79
    check-cast p2, Ljava/lang/Long;

    .line 80
    .line 81
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    .line 82
    .line 83
    .line 84
    move-result-wide v0

    .line 85
    invoke-virtual {p0, v0, v1}, Ll/s21$c;->h(J)Z

    .line 86
    .line 87
    .line 88
    move-result p2

    .line 89
    if-eqz p2, :cond_5

    .line 90
    .line 91
    :goto_1
    return-void

    .line 92
    :goto_2
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 93
    throw p1

    .line 94
    :goto_3
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 95
    throw p1

    .line 96
    :cond_6
    const-string p0, "Request can\'t be negative! "

    .line 97
    .line 98
    invoke-static {p0, p1, p2}, Ll/qc2;->a(Ljava/lang/String;J)V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method public f(Ll/vk90;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/s21$c;->k:Ll/vk90;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iput-object p1, p0, Ll/s21$c;->k:Ll/vk90;

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const-string p0, "setConcatProducer may be called at most once!"

    .line 9
    .line 10
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final g(Lrx/c;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/c<",
            "+TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Lrx/internal/operators/BufferUntilSubscriber;->b()Lrx/internal/operators/BufferUntilSubscriber;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-wide v1, p0, Ll/s21$c;->l:J

    .line 6
    .line 7
    new-instance v3, Ll/s21$c$a;

    .line 8
    .line 9
    invoke-direct {v3, p0, v1, v2, v0}, Ll/s21$c$a;-><init>(Ll/s21$c;JLrx/internal/operators/BufferUntilSubscriber;)V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Ll/s21$c;->d:Ll/ft5;

    .line 13
    .line 14
    invoke-virtual {v1, v3}, Ll/ft5;->a(Ll/kcg0;)V

    .line 15
    .line 16
    .line 17
    new-instance v1, Ll/s21$c$b;

    .line 18
    .line 19
    invoke-direct {v1, p0, v3}, Ll/s21$c$b;-><init>(Ll/s21$c;Ll/gcg0;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1, v1}, Lrx/c;->doOnTerminate(Ll/x20;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p1, v3}, Lrx/c;->subscribe(Ll/gcg0;)Ll/kcg0;

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Ll/s21$c;->h:Ll/s21$d;

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Ll/s21$d;->onNext(Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public h(J)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/s21$c;->isUnsubscribed()Z

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
    invoke-virtual {p0}, Ll/s21$c;->a()V

    .line 9
    .line 10
    .line 11
    return v1

    .line 12
    :cond_0
    const/4 v0, 0x0

    .line 13
    :try_start_0
    iput-boolean v0, p0, Ll/s21$c;->f:Z

    .line 14
    .line 15
    iput-wide p1, p0, Ll/s21$c;->l:J

    .line 16
    .line 17
    invoke-virtual {p0, p1, p2}, Ll/s21$c;->c(J)V

    .line 18
    .line 19
    .line 20
    iget-boolean p1, p0, Ll/s21$c;->e:Z

    .line 21
    .line 22
    if-nez p1, :cond_3

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/s21$c;->isUnsubscribed()Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p1, :cond_1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    iget-boolean p1, p0, Ll/s21$c;->f:Z

    .line 32
    .line 33
    if-nez p1, :cond_2

    .line 34
    .line 35
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 36
    .line 37
    const-string p2, "No events emitted!"

    .line 38
    .line 39
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0, p1}, Ll/s21$c;->b(Ljava/lang/Throwable;)V

    .line 43
    .line 44
    .line 45
    return v1

    .line 46
    :catchall_0
    move-exception p1

    .line 47
    goto :goto_1

    .line 48
    :cond_2
    return v0

    .line 49
    :cond_3
    :goto_0
    invoke-virtual {p0}, Ll/s21$c;->a()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 50
    .line 51
    .line 52
    return v1

    .line 53
    :goto_1
    invoke-virtual {p0, p1}, Ll/s21$c;->b(Ljava/lang/Throwable;)V

    .line 54
    .line 55
    .line 56
    return v1
.end method

.method public isUnsubscribed()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s21$c;->a:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public onCompleted()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/s21$c;->e:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Ll/s21$c;->e:Z

    .line 7
    .line 8
    iget-object p0, p0, Ll/s21$c;->h:Ll/s21$d;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/s21$d;->onCompleted()V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const-string p0, "Terminal event already emitted."

    .line 15
    .line 16
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/s21$c;->e:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Ll/s21$c;->e:Z

    .line 7
    .line 8
    iget-object p0, p0, Ll/s21$c;->h:Ll/s21$d;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/s21$d;->onError(Ljava/lang/Throwable;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const-string p0, "Terminal event already emitted."

    .line 15
    .line 16
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public bridge synthetic onNext(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lrx/c;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/s21$c;->d(Lrx/c;)V

    .line 4
    .line 5
    .line 6
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
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_2

    .line 8
    :cond_0
    if-ltz v0, :cond_7

    .line 9
    .line 10
    monitor-enter p0

    .line 11
    :try_start_0
    iget-boolean v0, p0, Ll/s21$c;->i:Z

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    const/4 v2, 0x0

    .line 15
    if-eqz v0, :cond_2

    .line 16
    .line 17
    iget-object v0, p0, Ll/s21$c;->j:Ljava/util/List;

    .line 18
    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    new-instance v0, Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Ll/s21$c;->j:Ljava/util/List;

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :catchall_0
    move-exception p1

    .line 30
    goto :goto_4

    .line 31
    :cond_1
    :goto_0
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_2
    iput-boolean v1, p0, Ll/s21$c;->i:Z

    .line 40
    .line 41
    move v1, v2

    .line 42
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 43
    iget-object v0, p0, Ll/s21$c;->k:Ll/vk90;

    .line 44
    .line 45
    invoke-interface {v0, p1, p2}, Ll/vk90;->request(J)V

    .line 46
    .line 47
    .line 48
    if-eqz v1, :cond_3

    .line 49
    .line 50
    goto :goto_2

    .line 51
    :cond_3
    invoke-virtual {p0, p1, p2}, Ll/s21$c;->h(J)Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-eqz p1, :cond_4

    .line 56
    .line 57
    goto :goto_2

    .line 58
    :cond_4
    monitor-enter p0

    .line 59
    :try_start_1
    iget-object p1, p0, Ll/s21$c;->j:Ljava/util/List;

    .line 60
    .line 61
    if-nez p1, :cond_5

    .line 62
    .line 63
    iput-boolean v2, p0, Ll/s21$c;->i:Z

    .line 64
    .line 65
    monitor-exit p0

    .line 66
    return-void

    .line 67
    :catchall_1
    move-exception p1

    .line 68
    goto :goto_3

    .line 69
    :cond_5
    const/4 p2, 0x0

    .line 70
    iput-object p2, p0, Ll/s21$c;->j:Ljava/util/List;

    .line 71
    .line 72
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 73
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    :cond_6
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 78
    .line 79
    .line 80
    move-result p2

    .line 81
    if-eqz p2, :cond_4

    .line 82
    .line 83
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object p2

    .line 87
    check-cast p2, Ljava/lang/Long;

    .line 88
    .line 89
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    .line 90
    .line 91
    .line 92
    move-result-wide v0

    .line 93
    invoke-virtual {p0, v0, v1}, Ll/s21$c;->h(J)Z

    .line 94
    .line 95
    .line 96
    move-result p2

    .line 97
    if-eqz p2, :cond_6

    .line 98
    .line 99
    :goto_2
    return-void

    .line 100
    :goto_3
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 101
    throw p1

    .line 102
    :goto_4
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 103
    throw p1

    .line 104
    :cond_7
    const-string p0, "Request can\'t be negative! "

    .line 105
    .line 106
    invoke-static {p0, p1, p2}, Ll/qc2;->a(Ljava/lang/String;J)V

    .line 107
    .line 108
    .line 109
    return-void
.end method

.method public unsubscribe()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/s21$c;->a:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    monitor-enter p0

    .line 12
    :try_start_0
    iget-boolean v0, p0, Ll/s21$c;->i:Z

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    new-instance v0, Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Ll/s21$c;->j:Ljava/util/List;

    .line 22
    .line 23
    const-wide/16 v1, 0x0

    .line 24
    .line 25
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    monitor-exit p0

    .line 33
    return-void

    .line 34
    :catchall_0
    move-exception v0

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    iput-boolean v2, p0, Ll/s21$c;->i:Z

    .line 37
    .line 38
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 39
    invoke-virtual {p0}, Ll/s21$c;->a()V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 44
    throw v0

    .line 45
    :cond_1
    return-void
.end method
