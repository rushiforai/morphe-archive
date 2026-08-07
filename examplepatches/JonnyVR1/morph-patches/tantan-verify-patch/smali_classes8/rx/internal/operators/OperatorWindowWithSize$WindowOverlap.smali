.class public final Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;
.super Ll/gcg0;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/operators/OperatorWindowWithSize;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "WindowOverlap"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap$WindowOverlapProducer;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ll/gcg0<",
        "TT;>;",
        "Ll/x20;"
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

.field public final f:I

.field public final g:I

.field public final h:Ljava/util/concurrent/atomic/AtomicInteger;

.field public final i:Ll/kcg0;

.field public final j:Ljava/util/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayDeque<",
            "Ll/wbg0<",
            "TT;TT;>;>;"
        }
    .end annotation
.end field

.field public final k:Ljava/util/concurrent/atomic/AtomicLong;

.field public final l:Ljava/util/concurrent/atomic/AtomicInteger;

.field public final m:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Ll/wbg0<",
            "TT;TT;>;>;"
        }
    .end annotation
.end field

.field public n:Ljava/lang/Throwable;

.field public volatile o:Z

.field public p:I

.field public q:I


# direct methods
.method public constructor <init>(Ll/gcg0;II)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-",
            "Lrx/c<",
            "TT;>;>;II)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;->e:Ll/gcg0;

    .line 5
    .line 6
    iput p2, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;->f:I

    .line 7
    .line 8
    iput p3, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;->g:I

    .line 9
    .line 10
    new-instance p1, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    invoke-direct {p1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;->h:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 17
    .line 18
    new-instance p1, Ljava/util/ArrayDeque;

    .line 19
    .line 20
    invoke-direct {p1}, Ljava/util/ArrayDeque;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;->j:Ljava/util/ArrayDeque;

    .line 24
    .line 25
    new-instance p1, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 26
    .line 27
    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object p1, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;->l:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 31
    .line 32
    new-instance p1, Ljava/util/concurrent/atomic/AtomicLong;

    .line 33
    .line 34
    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object p1, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;->k:Ljava/util/concurrent/atomic/AtomicLong;

    .line 38
    .line 39
    invoke-static {p0}, Ll/pcg0;->a(Ll/x20;)Ll/kcg0;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iput-object p1, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;->i:Ll/kcg0;

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 46
    .line 47
    .line 48
    const-wide/16 v0, 0x0

    .line 49
    .line 50
    invoke-virtual {p0, v0, v1}, Ll/gcg0;->e(J)V

    .line 51
    .line 52
    .line 53
    add-int/lit8 p1, p3, -0x1

    .line 54
    .line 55
    add-int/2addr p2, p1

    .line 56
    div-int/2addr p2, p3

    .line 57
    new-instance p1, Ll/pzf0;

    .line 58
    .line 59
    invoke-direct {p1, p2}, Ll/pzf0;-><init>(I)V

    .line 60
    .line 61
    .line 62
    iput-object p1, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;->m:Ljava/util/Queue;

    .line 63
    .line 64
    return-void
.end method

.method public static synthetic g(Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;J)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/gcg0;->e(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h(Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;J)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/gcg0;->e(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public call()V
    .locals 1

    .line 1
    iget-object v0, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;->h:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public i(ZZLl/gcg0;Ljava/util/Queue;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZ",
            "Ll/gcg0<",
            "-",
            "Ll/wbg0<",
            "TT;TT;>;>;",
            "Ljava/util/Queue<",
            "Ll/wbg0<",
            "TT;TT;>;>;)Z"
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
    invoke-interface {p4}, Ljava/util/Collection;->clear()V

    .line 9
    .line 10
    .line 11
    return v1

    .line 12
    :cond_0
    if-eqz p1, :cond_2

    .line 13
    .line 14
    iget-object p0, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;->n:Ljava/lang/Throwable;

    .line 15
    .line 16
    if-eqz p0, :cond_1

    .line 17
    .line 18
    invoke-interface {p4}, Ljava/util/Collection;->clear()V

    .line 19
    .line 20
    .line 21
    invoke-interface {p3, p0}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 22
    .line 23
    .line 24
    return v1

    .line 25
    :cond_1
    if-eqz p2, :cond_2

    .line 26
    .line 27
    invoke-interface {p3}, Ll/bb50;->onCompleted()V

    .line 28
    .line 29
    .line 30
    return v1

    .line 31
    :cond_2
    const/4 p0, 0x0

    .line 32
    return p0
.end method

.method public j()Ll/vk90;
    .locals 1

    .line 1
    new-instance v0, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap$WindowOverlapProducer;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap$WindowOverlapProducer;-><init>(Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public k()V
    .locals 15

    .line 1
    iget-object v0, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;->l:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    goto :goto_3

    .line 10
    :cond_0
    iget-object v1, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;->e:Ll/gcg0;

    .line 11
    .line 12
    iget-object v2, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;->m:Ljava/util/Queue;

    .line 13
    .line 14
    const/4 v3, 0x1

    .line 15
    move v4, v3

    .line 16
    :cond_1
    iget-object v5, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;->k:Ljava/util/concurrent/atomic/AtomicLong;

    .line 17
    .line 18
    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 19
    .line 20
    .line 21
    move-result-wide v5

    .line 22
    const-wide/16 v7, 0x0

    .line 23
    .line 24
    move-wide v9, v7

    .line 25
    :goto_0
    cmp-long v11, v9, v5

    .line 26
    .line 27
    if-eqz v11, :cond_5

    .line 28
    .line 29
    iget-boolean v12, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;->o:Z

    .line 30
    .line 31
    invoke-interface {v2}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v13

    .line 35
    check-cast v13, Ll/wbg0;

    .line 36
    .line 37
    if-nez v13, :cond_2

    .line 38
    .line 39
    move v14, v3

    .line 40
    goto :goto_1

    .line 41
    :cond_2
    const/4 v14, 0x0

    .line 42
    :goto_1
    invoke-virtual {p0, v12, v14, v1, v2}, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;->i(ZZLl/gcg0;Ljava/util/Queue;)Z

    .line 43
    .line 44
    .line 45
    move-result v12

    .line 46
    if-eqz v12, :cond_3

    .line 47
    .line 48
    goto :goto_3

    .line 49
    :cond_3
    if-eqz v14, :cond_4

    .line 50
    .line 51
    goto :goto_2

    .line 52
    :cond_4
    invoke-interface {v1, v13}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    const-wide/16 v11, 0x1

    .line 56
    .line 57
    add-long/2addr v9, v11

    .line 58
    goto :goto_0

    .line 59
    :cond_5
    :goto_2
    if-nez v11, :cond_6

    .line 60
    .line 61
    iget-boolean v11, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;->o:Z

    .line 62
    .line 63
    invoke-interface {v2}, Ljava/util/Collection;->isEmpty()Z

    .line 64
    .line 65
    .line 66
    move-result v12

    .line 67
    invoke-virtual {p0, v11, v12, v1, v2}, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;->i(ZZLl/gcg0;Ljava/util/Queue;)Z

    .line 68
    .line 69
    .line 70
    move-result v11

    .line 71
    if-eqz v11, :cond_6

    .line 72
    .line 73
    goto :goto_3

    .line 74
    :cond_6
    cmp-long v7, v9, v7

    .line 75
    .line 76
    if-eqz v7, :cond_7

    .line 77
    .line 78
    const-wide v7, 0x7fffffffffffffffL

    .line 79
    .line 80
    .line 81
    .line 82
    .line 83
    cmp-long v5, v5, v7

    .line 84
    .line 85
    if-eqz v5, :cond_7

    .line 86
    .line 87
    iget-object v5, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;->k:Ljava/util/concurrent/atomic/AtomicLong;

    .line 88
    .line 89
    neg-long v6, v9

    .line 90
    invoke-virtual {v5, v6, v7}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    .line 91
    .line 92
    .line 93
    :cond_7
    neg-int v4, v4

    .line 94
    invoke-virtual {v0, v4}, Ljava/util/concurrent/atomic/AtomicInteger;->addAndGet(I)I

    .line 95
    .line 96
    .line 97
    move-result v4

    .line 98
    if-nez v4, :cond_1

    .line 99
    .line 100
    :goto_3
    return-void
.end method

.method public onCompleted()V
    .locals 2

    .line 1
    iget-object v0, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;->j:Ljava/util/ArrayDeque;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ll/wbg0;

    .line 18
    .line 19
    invoke-interface {v1}, Ll/bb50;->onCompleted()V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget-object v0, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;->j:Ljava/util/ArrayDeque;

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->clear()V

    .line 26
    .line 27
    .line 28
    const/4 v0, 0x1

    .line 29
    iput-boolean v0, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;->o:Z

    .line 30
    .line 31
    invoke-virtual {p0}, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;->k()V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;->j:Ljava/util/ArrayDeque;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ll/wbg0;

    .line 18
    .line 19
    invoke-interface {v1, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget-object v0, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;->j:Ljava/util/ArrayDeque;

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->clear()V

    .line 26
    .line 27
    .line 28
    iput-object p1, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;->n:Ljava/lang/Throwable;

    .line 29
    .line 30
    const/4 p1, 0x1

    .line 31
    iput-boolean p1, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;->o:Z

    .line 32
    .line 33
    invoke-virtual {p0}, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;->k()V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget v0, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;->p:I

    .line 2
    .line 3
    iget-object v1, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;->j:Ljava/util/ArrayDeque;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v2, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;->e:Ll/gcg0;

    .line 8
    .line 9
    invoke-virtual {v2}, Ll/gcg0;->isUnsubscribed()Z

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-nez v2, :cond_0

    .line 14
    .line 15
    iget-object v2, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;->h:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 16
    .line 17
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    .line 18
    .line 19
    .line 20
    const/16 v2, 0x10

    .line 21
    .line 22
    invoke-static {v2, p0}, Lrx/subjects/UnicastSubject;->d(ILl/x20;)Lrx/subjects/UnicastSubject;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {v1, v2}, Ljava/util/ArrayDeque;->offer(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    iget-object v3, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;->m:Ljava/util/Queue;

    .line 30
    .line 31
    invoke-interface {v3, v2}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;->k()V

    .line 35
    .line 36
    .line 37
    :cond_0
    iget-object v2, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;->j:Ljava/util/ArrayDeque;

    .line 38
    .line 39
    invoke-virtual {v2}, Ljava/util/ArrayDeque;->iterator()Ljava/util/Iterator;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    if-eqz v3, :cond_1

    .line 48
    .line 49
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    check-cast v3, Ll/wbg0;

    .line 54
    .line 55
    invoke-interface {v3, p1}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_1
    iget p1, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;->q:I

    .line 60
    .line 61
    add-int/lit8 p1, p1, 0x1

    .line 62
    .line 63
    iget v2, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;->f:I

    .line 64
    .line 65
    if-ne p1, v2, :cond_2

    .line 66
    .line 67
    iget v2, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;->g:I

    .line 68
    .line 69
    sub-int/2addr p1, v2

    .line 70
    iput p1, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;->q:I

    .line 71
    .line 72
    invoke-virtual {v1}, Ljava/util/ArrayDeque;->poll()Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    check-cast p1, Ll/wbg0;

    .line 77
    .line 78
    if-eqz p1, :cond_3

    .line 79
    .line 80
    invoke-interface {p1}, Ll/bb50;->onCompleted()V

    .line 81
    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_2
    iput p1, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;->q:I

    .line 85
    .line 86
    :cond_3
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 87
    .line 88
    iget p1, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;->g:I

    .line 89
    .line 90
    if-ne v0, p1, :cond_4

    .line 91
    .line 92
    const/4 p1, 0x0

    .line 93
    iput p1, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;->p:I

    .line 94
    .line 95
    return-void

    .line 96
    :cond_4
    iput v0, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowOverlap;->p:I

    .line 97
    .line 98
    return-void
.end method
