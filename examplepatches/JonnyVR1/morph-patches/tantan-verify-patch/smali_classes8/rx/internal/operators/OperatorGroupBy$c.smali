.class public final Lrx/internal/operators/OperatorGroupBy$c;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/operators/OperatorGroupBy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrx/internal/operators/OperatorGroupBy$c$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ll/gcg0<",
        "TT;>;"
    }
.end annotation


# static fields
.field public static final u:Ljava/lang/Object;


# instance fields
.field public final e:Ll/gcg0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/gcg0<",
            "-",
            "Ll/oqk<",
            "TK;TV;>;>;"
        }
    .end annotation
.end field

.field public final f:Ll/qcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qcj<",
            "-TT;+TK;>;"
        }
    .end annotation
.end field

.field public final g:Ll/qcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qcj<",
            "-TT;+TV;>;"
        }
    .end annotation
.end field

.field public final h:I

.field public final i:Z

.field public final j:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Lrx/internal/operators/OperatorGroupBy$d<",
            "TK;TV;>;>;"
        }
    .end annotation
.end field

.field public final k:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Ll/oqk<",
            "TK;TV;>;>;"
        }
    .end annotation
.end field

.field public final l:Lrx/internal/operators/OperatorGroupBy$b;

.field public final m:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "TK;>;"
        }
    .end annotation
.end field

.field public final n:Ll/xk90;

.field public final o:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public final p:Ljava/util/concurrent/atomic/AtomicLong;

.field public final q:Ljava/util/concurrent/atomic/AtomicInteger;

.field public r:Ljava/lang/Throwable;

.field public volatile s:Z

.field public final t:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lrx/internal/operators/OperatorGroupBy$c;->u:Ljava/lang/Object;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Ll/gcg0;Ll/qcj;Ll/qcj;IZLl/qcj;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-",
            "Ll/oqk<",
            "TK;TV;>;>;",
            "Ll/qcj<",
            "-TT;+TK;>;",
            "Ll/qcj<",
            "-TT;+TV;>;IZ",
            "Ll/qcj<",
            "Ll/y20<",
            "TK;>;",
            "Ljava/util/Map<",
            "TK;",
            "Ljava/lang/Object;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lrx/internal/operators/OperatorGroupBy$c;->e:Ll/gcg0;

    .line 5
    .line 6
    iput-object p2, p0, Lrx/internal/operators/OperatorGroupBy$c;->f:Ll/qcj;

    .line 7
    .line 8
    iput-object p3, p0, Lrx/internal/operators/OperatorGroupBy$c;->g:Ll/qcj;

    .line 9
    .line 10
    iput p4, p0, Lrx/internal/operators/OperatorGroupBy$c;->h:I

    .line 11
    .line 12
    iput-boolean p5, p0, Lrx/internal/operators/OperatorGroupBy$c;->i:Z

    .line 13
    .line 14
    new-instance p1, Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 15
    .line 16
    invoke-direct {p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Lrx/internal/operators/OperatorGroupBy$c;->k:Ljava/util/Queue;

    .line 20
    .line 21
    new-instance p1, Ll/xk90;

    .line 22
    .line 23
    invoke-direct {p1}, Ll/xk90;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, Lrx/internal/operators/OperatorGroupBy$c;->n:Ll/xk90;

    .line 27
    .line 28
    int-to-long p2, p4

    .line 29
    invoke-virtual {p1, p2, p3}, Ll/xk90;->request(J)V

    .line 30
    .line 31
    .line 32
    new-instance p1, Lrx/internal/operators/OperatorGroupBy$b;

    .line 33
    .line 34
    invoke-direct {p1, p0}, Lrx/internal/operators/OperatorGroupBy$b;-><init>(Lrx/internal/operators/OperatorGroupBy$c;)V

    .line 35
    .line 36
    .line 37
    iput-object p1, p0, Lrx/internal/operators/OperatorGroupBy$c;->l:Lrx/internal/operators/OperatorGroupBy$b;

    .line 38
    .line 39
    new-instance p1, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 40
    .line 41
    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object p1, p0, Lrx/internal/operators/OperatorGroupBy$c;->o:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 45
    .line 46
    new-instance p1, Ljava/util/concurrent/atomic/AtomicLong;

    .line 47
    .line 48
    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    .line 49
    .line 50
    .line 51
    iput-object p1, p0, Lrx/internal/operators/OperatorGroupBy$c;->p:Ljava/util/concurrent/atomic/AtomicLong;

    .line 52
    .line 53
    new-instance p1, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 54
    .line 55
    const/4 p2, 0x1

    .line 56
    invoke-direct {p1, p2}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 57
    .line 58
    .line 59
    iput-object p1, p0, Lrx/internal/operators/OperatorGroupBy$c;->q:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 60
    .line 61
    new-instance p1, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 62
    .line 63
    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 64
    .line 65
    .line 66
    iput-object p1, p0, Lrx/internal/operators/OperatorGroupBy$c;->t:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 67
    .line 68
    if-nez p6, :cond_0

    .line 69
    .line 70
    new-instance p1, Ljava/util/concurrent/ConcurrentHashMap;

    .line 71
    .line 72
    invoke-direct {p1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 73
    .line 74
    .line 75
    iput-object p1, p0, Lrx/internal/operators/OperatorGroupBy$c;->j:Ljava/util/Map;

    .line 76
    .line 77
    const/4 p1, 0x0

    .line 78
    iput-object p1, p0, Lrx/internal/operators/OperatorGroupBy$c;->m:Ljava/util/Queue;

    .line 79
    .line 80
    return-void

    .line 81
    :cond_0
    new-instance p1, Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 82
    .line 83
    invoke-direct {p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    .line 84
    .line 85
    .line 86
    iput-object p1, p0, Lrx/internal/operators/OperatorGroupBy$c;->m:Ljava/util/Queue;

    .line 87
    .line 88
    new-instance p2, Lrx/internal/operators/OperatorGroupBy$c$a;

    .line 89
    .line 90
    invoke-direct {p2, p1}, Lrx/internal/operators/OperatorGroupBy$c$a;-><init>(Ljava/util/Queue;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p0, p6, p2}, Lrx/internal/operators/OperatorGroupBy$c;->j(Ll/qcj;Ll/y20;)Ljava/util/Map;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    iput-object p1, p0, Lrx/internal/operators/OperatorGroupBy$c;->j:Ljava/util/Map;

    .line 98
    .line 99
    return-void
.end method


# virtual methods
.method public f(Ll/vk90;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lrx/internal/operators/OperatorGroupBy$c;->n:Ll/xk90;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/xk90;->c(Ll/vk90;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public g()V
    .locals 3

    .line 1
    iget-object v0, p0, Lrx/internal/operators/OperatorGroupBy$c;->o:Ljava/util/concurrent/atomic/AtomicBoolean;

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
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lrx/internal/operators/OperatorGroupBy$c;->q:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public h(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    sget-object p1, Lrx/internal/operators/OperatorGroupBy$c;->u:Ljava/lang/Object;

    .line 5
    .line 6
    :goto_0
    iget-object v0, p0, Lrx/internal/operators/OperatorGroupBy$c;->j:Ljava/util/Map;

    .line 7
    .line 8
    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    if-eqz p1, :cond_1

    .line 13
    .line 14
    iget-object p1, p0, Lrx/internal/operators/OperatorGroupBy$c;->q:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 15
    .line 16
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-nez p1, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 23
    .line 24
    .line 25
    :cond_1
    return-void
.end method

.method public i(ZZLl/gcg0;Ljava/util/Queue;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZ",
            "Ll/gcg0<",
            "-",
            "Ll/oqk<",
            "TK;TV;>;>;",
            "Ljava/util/Queue<",
            "*>;)Z"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object p1, p0, Lrx/internal/operators/OperatorGroupBy$c;->r:Ljava/lang/Throwable;

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p3, p4, p1}, Lrx/internal/operators/OperatorGroupBy$c;->l(Ll/gcg0;Ljava/util/Queue;Ljava/lang/Throwable;)V

    .line 9
    .line 10
    .line 11
    return v0

    .line 12
    :cond_0
    if-eqz p2, :cond_1

    .line 13
    .line 14
    iget-object p0, p0, Lrx/internal/operators/OperatorGroupBy$c;->e:Ll/gcg0;

    .line 15
    .line 16
    invoke-interface {p0}, Ll/bb50;->onCompleted()V

    .line 17
    .line 18
    .line 19
    return v0

    .line 20
    :cond_1
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method public final j(Ll/qcj;Ll/y20;)Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qcj<",
            "Ll/y20<",
            "TK;>;",
            "Ljava/util/Map<",
            "TK;",
            "Ljava/lang/Object;",
            ">;>;",
            "Ll/y20<",
            "TK;>;)",
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Lrx/internal/operators/OperatorGroupBy$d<",
            "TK;TV;>;>;"
        }
    .end annotation

    .line 1
    invoke-interface {p1, p2}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/util/Map;

    .line 6
    .line 7
    return-object p0
.end method

.method public k()V
    .locals 13

    .line 1
    iget-object v0, p0, Lrx/internal/operators/OperatorGroupBy$c;->t:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_3

    .line 10
    :cond_0
    iget-object v0, p0, Lrx/internal/operators/OperatorGroupBy$c;->k:Ljava/util/Queue;

    .line 11
    .line 12
    iget-object v1, p0, Lrx/internal/operators/OperatorGroupBy$c;->e:Ll/gcg0;

    .line 13
    .line 14
    const/4 v2, 0x1

    .line 15
    move v3, v2

    .line 16
    :cond_1
    iget-boolean v4, p0, Lrx/internal/operators/OperatorGroupBy$c;->s:Z

    .line 17
    .line 18
    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    .line 19
    .line 20
    .line 21
    move-result v5

    .line 22
    invoke-virtual {p0, v4, v5, v1, v0}, Lrx/internal/operators/OperatorGroupBy$c;->i(ZZLl/gcg0;Ljava/util/Queue;)Z

    .line 23
    .line 24
    .line 25
    move-result v4

    .line 26
    if-eqz v4, :cond_2

    .line 27
    .line 28
    goto :goto_3

    .line 29
    :cond_2
    iget-object v4, p0, Lrx/internal/operators/OperatorGroupBy$c;->p:Ljava/util/concurrent/atomic/AtomicLong;

    .line 30
    .line 31
    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 32
    .line 33
    .line 34
    move-result-wide v4

    .line 35
    const-wide/16 v6, 0x0

    .line 36
    .line 37
    move-wide v8, v6

    .line 38
    :goto_0
    cmp-long v10, v8, v4

    .line 39
    .line 40
    if-eqz v10, :cond_6

    .line 41
    .line 42
    iget-boolean v10, p0, Lrx/internal/operators/OperatorGroupBy$c;->s:Z

    .line 43
    .line 44
    invoke-interface {v0}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v11

    .line 48
    check-cast v11, Ll/oqk;

    .line 49
    .line 50
    if-nez v11, :cond_3

    .line 51
    .line 52
    move v12, v2

    .line 53
    goto :goto_1

    .line 54
    :cond_3
    const/4 v12, 0x0

    .line 55
    :goto_1
    invoke-virtual {p0, v10, v12, v1, v0}, Lrx/internal/operators/OperatorGroupBy$c;->i(ZZLl/gcg0;Ljava/util/Queue;)Z

    .line 56
    .line 57
    .line 58
    move-result v10

    .line 59
    if-eqz v10, :cond_4

    .line 60
    .line 61
    goto :goto_3

    .line 62
    :cond_4
    if-eqz v12, :cond_5

    .line 63
    .line 64
    goto :goto_2

    .line 65
    :cond_5
    invoke-interface {v1, v11}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 66
    .line 67
    .line 68
    const-wide/16 v10, 0x1

    .line 69
    .line 70
    add-long/2addr v8, v10

    .line 71
    goto :goto_0

    .line 72
    :cond_6
    :goto_2
    cmp-long v6, v8, v6

    .line 73
    .line 74
    if-eqz v6, :cond_8

    .line 75
    .line 76
    const-wide v6, 0x7fffffffffffffffL

    .line 77
    .line 78
    .line 79
    .line 80
    .line 81
    cmp-long v4, v4, v6

    .line 82
    .line 83
    if-eqz v4, :cond_7

    .line 84
    .line 85
    iget-object v4, p0, Lrx/internal/operators/OperatorGroupBy$c;->p:Ljava/util/concurrent/atomic/AtomicLong;

    .line 86
    .line 87
    invoke-static {v4, v8, v9}, Ll/rc2;->i(Ljava/util/concurrent/atomic/AtomicLong;J)J

    .line 88
    .line 89
    .line 90
    :cond_7
    iget-object v4, p0, Lrx/internal/operators/OperatorGroupBy$c;->n:Ll/xk90;

    .line 91
    .line 92
    invoke-virtual {v4, v8, v9}, Ll/xk90;->request(J)V

    .line 93
    .line 94
    .line 95
    :cond_8
    iget-object v4, p0, Lrx/internal/operators/OperatorGroupBy$c;->t:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 96
    .line 97
    neg-int v3, v3

    .line 98
    invoke-virtual {v4, v3}, Ljava/util/concurrent/atomic/AtomicInteger;->addAndGet(I)I

    .line 99
    .line 100
    .line 101
    move-result v3

    .line 102
    if-nez v3, :cond_1

    .line 103
    .line 104
    :goto_3
    return-void
.end method

.method public l(Ll/gcg0;Ljava/util/Queue;Ljava/lang/Throwable;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-",
            "Ll/oqk<",
            "TK;TV;>;>;",
            "Ljava/util/Queue<",
            "*>;",
            "Ljava/lang/Throwable;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-interface {p2}, Ljava/util/Collection;->clear()V

    .line 2
    .line 3
    .line 4
    new-instance p2, Ljava/util/ArrayList;

    .line 5
    .line 6
    iget-object v0, p0, Lrx/internal/operators/OperatorGroupBy$c;->j:Ljava/util/Map;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-direct {p2, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lrx/internal/operators/OperatorGroupBy$c;->j:Ljava/util/Map;

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lrx/internal/operators/OperatorGroupBy$c;->m:Ljava/util/Queue;

    .line 21
    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    invoke-interface {p0}, Ljava/util/Collection;->clear()V

    .line 25
    .line 26
    .line 27
    :cond_0
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 32
    .line 33
    .line 34
    move-result p2

    .line 35
    if-eqz p2, :cond_1

    .line 36
    .line 37
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    check-cast p2, Lrx/internal/operators/OperatorGroupBy$d;

    .line 42
    .line 43
    invoke-virtual {p2, p3}, Lrx/internal/operators/OperatorGroupBy$d;->onError(Ljava/lang/Throwable;)V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    invoke-interface {p1, p3}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public m(J)V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-ltz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lrx/internal/operators/OperatorGroupBy$c;->p:Ljava/util/concurrent/atomic/AtomicLong;

    .line 8
    .line 9
    invoke-static {v0, p1, p2}, Ll/rc2;->b(Ljava/util/concurrent/atomic/AtomicLong;J)J

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lrx/internal/operators/OperatorGroupBy$c;->k()V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    const-string p0, "n >= 0 required but it was "

    .line 17
    .line 18
    invoke-static {p0, p1, p2}, Ll/fcg0;->a(Ljava/lang/String;J)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public onCompleted()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lrx/internal/operators/OperatorGroupBy$c;->s:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lrx/internal/operators/OperatorGroupBy$c;->j:Ljava/util/Map;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Lrx/internal/operators/OperatorGroupBy$d;

    .line 27
    .line 28
    invoke-virtual {v1}, Lrx/internal/operators/OperatorGroupBy$d;->b()V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    iget-object v0, p0, Lrx/internal/operators/OperatorGroupBy$c;->j:Ljava/util/Map;

    .line 33
    .line 34
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lrx/internal/operators/OperatorGroupBy$c;->m:Ljava/util/Queue;

    .line 38
    .line 39
    if-eqz v0, :cond_2

    .line 40
    .line 41
    invoke-interface {v0}, Ljava/util/Collection;->clear()V

    .line 42
    .line 43
    .line 44
    :cond_2
    const/4 v0, 0x1

    .line 45
    iput-boolean v0, p0, Lrx/internal/operators/OperatorGroupBy$c;->s:Z

    .line 46
    .line 47
    iget-object v0, p0, Lrx/internal/operators/OperatorGroupBy$c;->q:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 48
    .line 49
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Lrx/internal/operators/OperatorGroupBy$c;->k()V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lrx/internal/operators/OperatorGroupBy$c;->s:Z

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
    iput-object p1, p0, Lrx/internal/operators/OperatorGroupBy$c;->r:Ljava/lang/Throwable;

    .line 10
    .line 11
    const/4 p1, 0x1

    .line 12
    iput-boolean p1, p0, Lrx/internal/operators/OperatorGroupBy$c;->s:Z

    .line 13
    .line 14
    iget-object p1, p0, Lrx/internal/operators/OperatorGroupBy$c;->q:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 15
    .line 16
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Lrx/internal/operators/OperatorGroupBy$c;->k()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lrx/internal/operators/OperatorGroupBy$c;->s:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_3

    .line 6
    :cond_0
    iget-object v0, p0, Lrx/internal/operators/OperatorGroupBy$c;->k:Ljava/util/Queue;

    .line 7
    .line 8
    iget-object v1, p0, Lrx/internal/operators/OperatorGroupBy$c;->e:Ll/gcg0;

    .line 9
    .line 10
    :try_start_0
    iget-object v2, p0, Lrx/internal/operators/OperatorGroupBy$c;->f:Ll/qcj;

    .line 11
    .line 12
    invoke-interface {v2, p1}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 16
    if-eqz v2, :cond_1

    .line 17
    .line 18
    move-object v3, v2

    .line 19
    goto :goto_0

    .line 20
    :cond_1
    sget-object v3, Lrx/internal/operators/OperatorGroupBy$c;->u:Ljava/lang/Object;

    .line 21
    .line 22
    :goto_0
    iget-object v4, p0, Lrx/internal/operators/OperatorGroupBy$c;->j:Ljava/util/Map;

    .line 23
    .line 24
    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v4

    .line 28
    check-cast v4, Lrx/internal/operators/OperatorGroupBy$d;

    .line 29
    .line 30
    if-nez v4, :cond_2

    .line 31
    .line 32
    iget-object v4, p0, Lrx/internal/operators/OperatorGroupBy$c;->o:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 33
    .line 34
    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    if-nez v4, :cond_5

    .line 39
    .line 40
    iget v4, p0, Lrx/internal/operators/OperatorGroupBy$c;->h:I

    .line 41
    .line 42
    iget-boolean v5, p0, Lrx/internal/operators/OperatorGroupBy$c;->i:Z

    .line 43
    .line 44
    invoke-static {v2, v4, p0, v5}, Lrx/internal/operators/OperatorGroupBy$d;->a(Ljava/lang/Object;ILrx/internal/operators/OperatorGroupBy$c;Z)Lrx/internal/operators/OperatorGroupBy$d;

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    iget-object v2, p0, Lrx/internal/operators/OperatorGroupBy$c;->j:Ljava/util/Map;

    .line 49
    .line 50
    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    iget-object v2, p0, Lrx/internal/operators/OperatorGroupBy$c;->q:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 54
    .line 55
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    .line 56
    .line 57
    .line 58
    invoke-interface {v0, v4}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0}, Lrx/internal/operators/OperatorGroupBy$c;->k()V

    .line 62
    .line 63
    .line 64
    const/4 v2, 0x0

    .line 65
    goto :goto_1

    .line 66
    :cond_2
    const/4 v2, 0x1

    .line 67
    :goto_1
    :try_start_1
    iget-object v3, p0, Lrx/internal/operators/OperatorGroupBy$c;->g:Ll/qcj;

    .line 68
    .line 69
    invoke-interface {v3, p1}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 73
    invoke-virtual {v4, p1}, Lrx/internal/operators/OperatorGroupBy$d;->onNext(Ljava/lang/Object;)V

    .line 74
    .line 75
    .line 76
    iget-object p1, p0, Lrx/internal/operators/OperatorGroupBy$c;->m:Ljava/util/Queue;

    .line 77
    .line 78
    if-eqz p1, :cond_4

    .line 79
    .line 80
    :cond_3
    :goto_2
    iget-object p1, p0, Lrx/internal/operators/OperatorGroupBy$c;->m:Ljava/util/Queue;

    .line 81
    .line 82
    invoke-interface {p1}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    if-eqz p1, :cond_4

    .line 87
    .line 88
    iget-object v0, p0, Lrx/internal/operators/OperatorGroupBy$c;->j:Ljava/util/Map;

    .line 89
    .line 90
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    check-cast p1, Lrx/internal/operators/OperatorGroupBy$d;

    .line 95
    .line 96
    if-eqz p1, :cond_3

    .line 97
    .line 98
    invoke-virtual {p1}, Lrx/internal/operators/OperatorGroupBy$d;->b()V

    .line 99
    .line 100
    .line 101
    goto :goto_2

    .line 102
    :cond_4
    if-eqz v2, :cond_5

    .line 103
    .line 104
    iget-object p0, p0, Lrx/internal/operators/OperatorGroupBy$c;->n:Ll/xk90;

    .line 105
    .line 106
    const-wide/16 v0, 0x1

    .line 107
    .line 108
    invoke-virtual {p0, v0, v1}, Ll/xk90;->request(J)V

    .line 109
    .line 110
    .line 111
    :cond_5
    :goto_3
    return-void

    .line 112
    :catchall_0
    move-exception p1

    .line 113
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 114
    .line 115
    .line 116
    invoke-virtual {p0, v1, v0, p1}, Lrx/internal/operators/OperatorGroupBy$c;->l(Ll/gcg0;Ljava/util/Queue;Ljava/lang/Throwable;)V

    .line 117
    .line 118
    .line 119
    return-void

    .line 120
    :catchall_1
    move-exception p1

    .line 121
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 122
    .line 123
    .line 124
    invoke-virtual {p0, v1, v0, p1}, Lrx/internal/operators/OperatorGroupBy$c;->l(Ll/gcg0;Ljava/util/Queue;Ljava/lang/Throwable;)V

    .line 125
    .line 126
    .line 127
    return-void
.end method
