.class public final Lrx/internal/operators/OperatorWindowWithSize$WindowSkip;
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
    name = "WindowSkip"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrx/internal/operators/OperatorWindowWithSize$WindowSkip$WindowSkipProducer;
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

.field public j:I

.field public k:Ll/wbg0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/wbg0<",
            "TT;TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/gcg0;II)V
    .locals 0
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
    iput-object p1, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowSkip;->e:Ll/gcg0;

    .line 5
    .line 6
    iput p2, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowSkip;->f:I

    .line 7
    .line 8
    iput p3, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowSkip;->g:I

    .line 9
    .line 10
    new-instance p1, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 11
    .line 12
    const/4 p2, 0x1

    .line 13
    invoke-direct {p1, p2}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowSkip;->h:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 17
    .line 18
    invoke-static {p0}, Ll/pcg0;->a(Ll/x20;)Ll/kcg0;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iput-object p1, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowSkip;->i:Ll/kcg0;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 25
    .line 26
    .line 27
    const-wide/16 p1, 0x0

    .line 28
    .line 29
    invoke-virtual {p0, p1, p2}, Ll/gcg0;->e(J)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public static synthetic g(Lrx/internal/operators/OperatorWindowWithSize$WindowSkip;J)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/gcg0;->e(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h(Lrx/internal/operators/OperatorWindowWithSize$WindowSkip;J)V
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
    iget-object v0, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowSkip;->h:Ljava/util/concurrent/atomic/AtomicInteger;

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

.method public i()Ll/vk90;
    .locals 1

    .line 1
    new-instance v0, Lrx/internal/operators/OperatorWindowWithSize$WindowSkip$WindowSkipProducer;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lrx/internal/operators/OperatorWindowWithSize$WindowSkip$WindowSkipProducer;-><init>(Lrx/internal/operators/OperatorWindowWithSize$WindowSkip;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public onCompleted()V
    .locals 2

    .line 1
    iget-object v0, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowSkip;->k:Ll/wbg0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    iput-object v1, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowSkip;->k:Ll/wbg0;

    .line 7
    .line 8
    invoke-interface {v0}, Ll/bb50;->onCompleted()V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p0, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowSkip;->e:Ll/gcg0;

    .line 12
    .line 13
    invoke-interface {p0}, Ll/bb50;->onCompleted()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowSkip;->k:Ll/wbg0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    iput-object v1, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowSkip;->k:Ll/wbg0;

    .line 7
    .line 8
    invoke-interface {v0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p0, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowSkip;->e:Ll/gcg0;

    .line 12
    .line 13
    invoke-interface {p0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget v0, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowSkip;->j:I

    .line 2
    .line 3
    iget-object v1, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowSkip;->k:Ll/wbg0;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v1, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowSkip;->h:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    .line 10
    .line 11
    .line 12
    iget v1, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowSkip;->f:I

    .line 13
    .line 14
    invoke-static {v1, p0}, Lrx/subjects/UnicastSubject;->d(ILl/x20;)Lrx/subjects/UnicastSubject;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iput-object v1, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowSkip;->k:Ll/wbg0;

    .line 19
    .line 20
    iget-object v2, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowSkip;->e:Ll/gcg0;

    .line 21
    .line 22
    invoke-interface {v2, v1}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 26
    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    invoke-interface {v1, p1}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    :cond_1
    iget p1, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowSkip;->f:I

    .line 33
    .line 34
    if-ne v0, p1, :cond_2

    .line 35
    .line 36
    iput v0, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowSkip;->j:I

    .line 37
    .line 38
    const/4 p1, 0x0

    .line 39
    iput-object p1, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowSkip;->k:Ll/wbg0;

    .line 40
    .line 41
    invoke-interface {v1}, Ll/bb50;->onCompleted()V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_2
    iget p1, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowSkip;->g:I

    .line 46
    .line 47
    if-ne v0, p1, :cond_3

    .line 48
    .line 49
    const/4 p1, 0x0

    .line 50
    iput p1, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowSkip;->j:I

    .line 51
    .line 52
    return-void

    .line 53
    :cond_3
    iput v0, p0, Lrx/internal/operators/OperatorWindowWithSize$WindowSkip;->j:I

    .line 54
    .line 55
    return-void
.end method
