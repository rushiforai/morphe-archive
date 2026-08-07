.class public final Lrx/internal/operators/OperatorBufferWithSize$BufferOverlap;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/operators/OperatorBufferWithSize;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "BufferOverlap"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrx/internal/operators/OperatorBufferWithSize$BufferOverlap$BufferOverlapProducer;
    }
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
.field public final e:Ll/gcg0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/gcg0<",
            "-",
            "Ljava/util/List<",
            "TT;>;>;"
        }
    .end annotation
.end field

.field public final f:I

.field public final g:I

.field public h:J

.field public final i:Ljava/util/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayDeque<",
            "Ljava/util/List<",
            "TT;>;>;"
        }
    .end annotation
.end field

.field public final j:Ljava/util/concurrent/atomic/AtomicLong;

.field public k:J


# direct methods
.method public constructor <init>(Ll/gcg0;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-",
            "Ljava/util/List<",
            "TT;>;>;II)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lrx/internal/operators/OperatorBufferWithSize$BufferOverlap;->e:Ll/gcg0;

    .line 5
    .line 6
    iput p2, p0, Lrx/internal/operators/OperatorBufferWithSize$BufferOverlap;->f:I

    .line 7
    .line 8
    iput p3, p0, Lrx/internal/operators/OperatorBufferWithSize$BufferOverlap;->g:I

    .line 9
    .line 10
    new-instance p1, Ljava/util/ArrayDeque;

    .line 11
    .line 12
    invoke-direct {p1}, Ljava/util/ArrayDeque;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Lrx/internal/operators/OperatorBufferWithSize$BufferOverlap;->i:Ljava/util/ArrayDeque;

    .line 16
    .line 17
    new-instance p1, Ljava/util/concurrent/atomic/AtomicLong;

    .line 18
    .line 19
    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, Lrx/internal/operators/OperatorBufferWithSize$BufferOverlap;->j:Ljava/util/concurrent/atomic/AtomicLong;

    .line 23
    .line 24
    const-wide/16 p1, 0x0

    .line 25
    .line 26
    invoke-virtual {p0, p1, p2}, Ll/gcg0;->e(J)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public static synthetic g(Lrx/internal/operators/OperatorBufferWithSize$BufferOverlap;J)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/gcg0;->e(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h(Lrx/internal/operators/OperatorBufferWithSize$BufferOverlap;J)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/gcg0;->e(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public i()Ll/vk90;
    .locals 1

    .line 1
    new-instance v0, Lrx/internal/operators/OperatorBufferWithSize$BufferOverlap$BufferOverlapProducer;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lrx/internal/operators/OperatorBufferWithSize$BufferOverlap$BufferOverlapProducer;-><init>(Lrx/internal/operators/OperatorBufferWithSize$BufferOverlap;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public onCompleted()V
    .locals 5

    .line 1
    iget-wide v0, p0, Lrx/internal/operators/OperatorBufferWithSize$BufferOverlap;->k:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    if-eqz v2, :cond_1

    .line 8
    .line 9
    iget-object v2, p0, Lrx/internal/operators/OperatorBufferWithSize$BufferOverlap;->j:Ljava/util/concurrent/atomic/AtomicLong;

    .line 10
    .line 11
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 12
    .line 13
    .line 14
    move-result-wide v2

    .line 15
    cmp-long v2, v0, v2

    .line 16
    .line 17
    if-lez v2, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Lrx/internal/operators/OperatorBufferWithSize$BufferOverlap;->e:Ll/gcg0;

    .line 20
    .line 21
    new-instance v2, Lrx/exceptions/MissingBackpressureException;

    .line 22
    .line 23
    new-instance v3, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    const-string v4, "More produced than requested? "

    .line 26
    .line 27
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-direct {v2, v0}, Lrx/exceptions/MissingBackpressureException;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-interface {p0, v2}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    iget-object v2, p0, Lrx/internal/operators/OperatorBufferWithSize$BufferOverlap;->j:Ljava/util/concurrent/atomic/AtomicLong;

    .line 45
    .line 46
    neg-long v0, v0

    .line 47
    invoke-virtual {v2, v0, v1}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    .line 48
    .line 49
    .line 50
    :cond_1
    iget-object v0, p0, Lrx/internal/operators/OperatorBufferWithSize$BufferOverlap;->j:Ljava/util/concurrent/atomic/AtomicLong;

    .line 51
    .line 52
    iget-object v1, p0, Lrx/internal/operators/OperatorBufferWithSize$BufferOverlap;->i:Ljava/util/ArrayDeque;

    .line 53
    .line 54
    iget-object p0, p0, Lrx/internal/operators/OperatorBufferWithSize$BufferOverlap;->e:Ll/gcg0;

    .line 55
    .line 56
    invoke-static {v0, v1, p0}, Ll/rc2;->d(Ljava/util/concurrent/atomic/AtomicLong;Ljava/util/Queue;Ll/gcg0;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lrx/internal/operators/OperatorBufferWithSize$BufferOverlap;->i:Ljava/util/ArrayDeque;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lrx/internal/operators/OperatorBufferWithSize$BufferOverlap;->e:Ll/gcg0;

    .line 7
    .line 8
    invoke-interface {p0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget-wide v0, p0, Lrx/internal/operators/OperatorBufferWithSize$BufferOverlap;->h:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v4, v0, v2

    .line 6
    .line 7
    if-nez v4, :cond_0

    .line 8
    .line 9
    new-instance v4, Ljava/util/ArrayList;

    .line 10
    .line 11
    iget v5, p0, Lrx/internal/operators/OperatorBufferWithSize$BufferOverlap;->f:I

    .line 12
    .line 13
    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 14
    .line 15
    .line 16
    iget-object v5, p0, Lrx/internal/operators/OperatorBufferWithSize$BufferOverlap;->i:Ljava/util/ArrayDeque;

    .line 17
    .line 18
    invoke-virtual {v5, v4}, Ljava/util/ArrayDeque;->offer(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    :cond_0
    const-wide/16 v4, 0x1

    .line 22
    .line 23
    add-long/2addr v0, v4

    .line 24
    iget v6, p0, Lrx/internal/operators/OperatorBufferWithSize$BufferOverlap;->g:I

    .line 25
    .line 26
    int-to-long v6, v6

    .line 27
    cmp-long v6, v0, v6

    .line 28
    .line 29
    if-nez v6, :cond_1

    .line 30
    .line 31
    iput-wide v2, p0, Lrx/internal/operators/OperatorBufferWithSize$BufferOverlap;->h:J

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    iput-wide v0, p0, Lrx/internal/operators/OperatorBufferWithSize$BufferOverlap;->h:J

    .line 35
    .line 36
    :goto_0
    iget-object v0, p0, Lrx/internal/operators/OperatorBufferWithSize$BufferOverlap;->i:Ljava/util/ArrayDeque;

    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->iterator()Ljava/util/Iterator;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-eqz v1, :cond_2

    .line 47
    .line 48
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    check-cast v1, Ljava/util/List;

    .line 53
    .line 54
    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_2
    iget-object p1, p0, Lrx/internal/operators/OperatorBufferWithSize$BufferOverlap;->i:Ljava/util/ArrayDeque;

    .line 59
    .line 60
    invoke-virtual {p1}, Ljava/util/ArrayDeque;->peek()Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    check-cast p1, Ljava/util/List;

    .line 65
    .line 66
    if-eqz p1, :cond_3

    .line 67
    .line 68
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    iget v1, p0, Lrx/internal/operators/OperatorBufferWithSize$BufferOverlap;->f:I

    .line 73
    .line 74
    if-ne v0, v1, :cond_3

    .line 75
    .line 76
    iget-object v0, p0, Lrx/internal/operators/OperatorBufferWithSize$BufferOverlap;->i:Ljava/util/ArrayDeque;

    .line 77
    .line 78
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->poll()Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    iget-wide v0, p0, Lrx/internal/operators/OperatorBufferWithSize$BufferOverlap;->k:J

    .line 82
    .line 83
    add-long/2addr v0, v4

    .line 84
    iput-wide v0, p0, Lrx/internal/operators/OperatorBufferWithSize$BufferOverlap;->k:J

    .line 85
    .line 86
    iget-object p0, p0, Lrx/internal/operators/OperatorBufferWithSize$BufferOverlap;->e:Ll/gcg0;

    .line 87
    .line 88
    invoke-interface {p0, p1}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 89
    .line 90
    .line 91
    :cond_3
    return-void
.end method
