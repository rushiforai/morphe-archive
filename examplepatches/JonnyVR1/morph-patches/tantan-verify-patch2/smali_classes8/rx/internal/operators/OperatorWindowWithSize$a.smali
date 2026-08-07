.class public final Lrx/internal/operators/OperatorWindowWithSize$a;
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
    name = "a"
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

.field public final g:Ljava/util/concurrent/atomic/AtomicInteger;

.field public final h:Ll/kcg0;

.field public i:I

.field public j:Ll/wbg0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/wbg0<",
            "TT;TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/gcg0;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-",
            "Lrx/c<",
            "TT;>;>;I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lrx/internal/operators/OperatorWindowWithSize$a;->e:Ll/gcg0;

    .line 5
    .line 6
    iput p2, p0, Lrx/internal/operators/OperatorWindowWithSize$a;->f:I

    .line 7
    .line 8
    new-instance p1, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 9
    .line 10
    const/4 p2, 0x1

    .line 11
    invoke-direct {p1, p2}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Lrx/internal/operators/OperatorWindowWithSize$a;->g:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 15
    .line 16
    invoke-static {p0}, Ll/pcg0;->a(Ll/x20;)Ll/kcg0;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iput-object p1, p0, Lrx/internal/operators/OperatorWindowWithSize$a;->h:Ll/kcg0;

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 23
    .line 24
    .line 25
    const-wide/16 p1, 0x0

    .line 26
    .line 27
    invoke-virtual {p0, p1, p2}, Ll/gcg0;->e(J)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public static synthetic g(Lrx/internal/operators/OperatorWindowWithSize$a;J)V
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
    iget-object v0, p0, Lrx/internal/operators/OperatorWindowWithSize$a;->g:Ljava/util/concurrent/atomic/AtomicInteger;

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

.method public h()Ll/vk90;
    .locals 1

    .line 1
    new-instance v0, Lrx/internal/operators/OperatorWindowWithSize$a$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lrx/internal/operators/OperatorWindowWithSize$a$a;-><init>(Lrx/internal/operators/OperatorWindowWithSize$a;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public onCompleted()V
    .locals 2

    .line 1
    iget-object v0, p0, Lrx/internal/operators/OperatorWindowWithSize$a;->j:Ll/wbg0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    iput-object v1, p0, Lrx/internal/operators/OperatorWindowWithSize$a;->j:Ll/wbg0;

    .line 7
    .line 8
    invoke-interface {v0}, Ll/bb50;->onCompleted()V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p0, p0, Lrx/internal/operators/OperatorWindowWithSize$a;->e:Ll/gcg0;

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
    iget-object v0, p0, Lrx/internal/operators/OperatorWindowWithSize$a;->j:Ll/wbg0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    iput-object v1, p0, Lrx/internal/operators/OperatorWindowWithSize$a;->j:Ll/wbg0;

    .line 7
    .line 8
    invoke-interface {v0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p0, p0, Lrx/internal/operators/OperatorWindowWithSize$a;->e:Ll/gcg0;

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
    iget v0, p0, Lrx/internal/operators/OperatorWindowWithSize$a;->i:I

    .line 2
    .line 3
    iget-object v1, p0, Lrx/internal/operators/OperatorWindowWithSize$a;->j:Ll/wbg0;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v1, p0, Lrx/internal/operators/OperatorWindowWithSize$a;->g:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    .line 10
    .line 11
    .line 12
    iget v1, p0, Lrx/internal/operators/OperatorWindowWithSize$a;->f:I

    .line 13
    .line 14
    invoke-static {v1, p0}, Lrx/subjects/UnicastSubject;->d(ILl/x20;)Lrx/subjects/UnicastSubject;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iput-object v1, p0, Lrx/internal/operators/OperatorWindowWithSize$a;->j:Ll/wbg0;

    .line 19
    .line 20
    iget-object v2, p0, Lrx/internal/operators/OperatorWindowWithSize$a;->e:Ll/gcg0;

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
    invoke-interface {v1, p1}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    iget p1, p0, Lrx/internal/operators/OperatorWindowWithSize$a;->f:I

    .line 31
    .line 32
    if-ne v0, p1, :cond_1

    .line 33
    .line 34
    const/4 p1, 0x0

    .line 35
    iput p1, p0, Lrx/internal/operators/OperatorWindowWithSize$a;->i:I

    .line 36
    .line 37
    const/4 p1, 0x0

    .line 38
    iput-object p1, p0, Lrx/internal/operators/OperatorWindowWithSize$a;->j:Ll/wbg0;

    .line 39
    .line 40
    invoke-interface {v1}, Ll/bb50;->onCompleted()V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_1
    iput v0, p0, Lrx/internal/operators/OperatorWindowWithSize$a;->i:I

    .line 45
    .line 46
    return-void
.end method
