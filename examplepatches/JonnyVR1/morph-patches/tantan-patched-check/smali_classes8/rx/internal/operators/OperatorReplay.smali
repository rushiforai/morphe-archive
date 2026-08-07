.class public final Lrx/internal/operators/OperatorReplay;
.super Ll/ax5;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrx/internal/operators/OperatorReplay$SizeAndTimeBoundReplayBuffer;,
        Lrx/internal/operators/OperatorReplay$SizeBoundReplayBuffer;,
        Lrx/internal/operators/OperatorReplay$BoundedReplayBuffer;,
        Lrx/internal/operators/OperatorReplay$Node;,
        Lrx/internal/operators/OperatorReplay$UnboundedReplayBuffer;,
        Lrx/internal/operators/OperatorReplay$h;,
        Lrx/internal/operators/OperatorReplay$InnerProducer;,
        Lrx/internal/operators/OperatorReplay$i;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ll/ax5<",
        "TT;>;"
    }
.end annotation


# static fields
.field public static final d:Ll/pcj;


# instance fields
.field public final a:Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/c<",
            "+TT;>;"
        }
    .end annotation
.end field

.field public final b:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Lrx/internal/operators/OperatorReplay$i<",
            "TT;>;>;"
        }
    .end annotation
.end field

.field public final c:Ll/pcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pcj<",
            "+",
            "Lrx/internal/operators/OperatorReplay$h<",
            "TT;>;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lrx/internal/operators/OperatorReplay$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lrx/internal/operators/OperatorReplay$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lrx/internal/operators/OperatorReplay;->d:Ll/pcj;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Lrx/c$a;Lrx/c;Ljava/util/concurrent/atomic/AtomicReference;Ll/pcj;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/c$a<",
            "TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Lrx/internal/operators/OperatorReplay$i<",
            "TT;>;>;",
            "Ll/pcj<",
            "+",
            "Lrx/internal/operators/OperatorReplay$h<",
            "TT;>;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/ax5;-><init>(Lrx/c$a;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lrx/internal/operators/OperatorReplay;->a:Lrx/c;

    .line 5
    .line 6
    iput-object p3, p0, Lrx/internal/operators/OperatorReplay;->b:Ljava/util/concurrent/atomic/AtomicReference;

    .line 7
    .line 8
    iput-object p4, p0, Lrx/internal/operators/OperatorReplay;->c:Ll/pcj;

    .line 9
    .line 10
    return-void
.end method

.method public static e(Lrx/c;)Ll/ax5;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT;>;)",
            "Ll/ax5<",
            "TT;>;"
        }
    .end annotation

    .line 1
    sget-object v0, Lrx/internal/operators/OperatorReplay;->d:Ll/pcj;

    .line 2
    .line 3
    invoke-static {p0, v0}, Lrx/internal/operators/OperatorReplay;->i(Lrx/c;Ll/pcj;)Ll/ax5;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static f(Lrx/c;I)Ll/ax5;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT;>;I)",
            "Ll/ax5<",
            "TT;>;"
        }
    .end annotation

    .line 1
    const v0, 0x7fffffff

    .line 2
    .line 3
    .line 4
    if-ne p1, v0, :cond_0

    .line 5
    .line 6
    invoke-static {p0}, Lrx/internal/operators/OperatorReplay;->e(Lrx/c;)Ll/ax5;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0

    .line 11
    :cond_0
    new-instance v0, Lrx/internal/operators/OperatorReplay$e;

    .line 12
    .line 13
    invoke-direct {v0, p1}, Lrx/internal/operators/OperatorReplay$e;-><init>(I)V

    .line 14
    .line 15
    .line 16
    invoke-static {p0, v0}, Lrx/internal/operators/OperatorReplay;->i(Lrx/c;Ll/pcj;)Ll/ax5;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public static g(Lrx/c;JLjava/util/concurrent/TimeUnit;Ll/f2e0;)Ll/ax5;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT;>;J",
            "Ljava/util/concurrent/TimeUnit;",
            "Ll/f2e0;",
            ")",
            "Ll/ax5<",
            "TT;>;"
        }
    .end annotation

    .line 1
    const v5, 0x7fffffff

    .line 2
    .line 3
    .line 4
    move-object v0, p0

    .line 5
    move-wide v1, p1

    .line 6
    move-object v3, p3

    .line 7
    move-object v4, p4

    .line 8
    invoke-static/range {v0 .. v5}, Lrx/internal/operators/OperatorReplay;->h(Lrx/c;JLjava/util/concurrent/TimeUnit;Ll/f2e0;I)Ll/ax5;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static h(Lrx/c;JLjava/util/concurrent/TimeUnit;Ll/f2e0;I)Ll/ax5;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT;>;J",
            "Ljava/util/concurrent/TimeUnit;",
            "Ll/f2e0;",
            "I)",
            "Ll/ax5<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p3, p1, p2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    .line 2
    .line 3
    .line 4
    move-result-wide p1

    .line 5
    new-instance p3, Lrx/internal/operators/OperatorReplay$f;

    .line 6
    .line 7
    invoke-direct {p3, p5, p1, p2, p4}, Lrx/internal/operators/OperatorReplay$f;-><init>(IJLl/f2e0;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p0, p3}, Lrx/internal/operators/OperatorReplay;->i(Lrx/c;Ll/pcj;)Ll/ax5;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static i(Lrx/c;Ll/pcj;)Ll/ax5;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT;>;",
            "Ll/pcj<",
            "+",
            "Lrx/internal/operators/OperatorReplay$h<",
            "TT;>;>;)",
            "Ll/ax5<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Lrx/internal/operators/OperatorReplay$g;

    .line 7
    .line 8
    invoke-direct {v1, v0, p1}, Lrx/internal/operators/OperatorReplay$g;-><init>(Ljava/util/concurrent/atomic/AtomicReference;Ll/pcj;)V

    .line 9
    .line 10
    .line 11
    new-instance v2, Lrx/internal/operators/OperatorReplay;

    .line 12
    .line 13
    invoke-direct {v2, v1, p0, v0, p1}, Lrx/internal/operators/OperatorReplay;-><init>(Lrx/c$a;Lrx/c;Ljava/util/concurrent/atomic/AtomicReference;Ll/pcj;)V

    .line 14
    .line 15
    .line 16
    return-object v2
.end method

.method public static j(Ll/pcj;Ll/qcj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "U:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/pcj<",
            "+",
            "Ll/ax5<",
            "TU;>;>;",
            "Ll/qcj<",
            "-",
            "Lrx/c<",
            "TU;>;+",
            "Lrx/c<",
            "TR;>;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lrx/internal/operators/OperatorReplay$b;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lrx/internal/operators/OperatorReplay$b;-><init>(Ll/pcj;Ll/qcj;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static k(Ll/ax5;Ll/f2e0;)Ll/ax5;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/ax5<",
            "TT;>;",
            "Ll/f2e0;",
            ")",
            "Ll/ax5<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Lrx/internal/operators/OperatorReplay$c;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Lrx/internal/operators/OperatorReplay$c;-><init>(Lrx/c;)V

    .line 8
    .line 9
    .line 10
    new-instance p1, Lrx/internal/operators/OperatorReplay$d;

    .line 11
    .line 12
    invoke-direct {p1, v0, p0}, Lrx/internal/operators/OperatorReplay$d;-><init>(Lrx/c$a;Ll/ax5;)V

    .line 13
    .line 14
    .line 15
    return-object p1
.end method


# virtual methods
.method public c(Ll/y20;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "-",
            "Ll/kcg0;",
            ">;)V"
        }
    .end annotation

    .line 1
    :goto_0
    iget-object v0, p0, Lrx/internal/operators/OperatorReplay;->b:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lrx/internal/operators/OperatorReplay$i;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/gcg0;->isUnsubscribed()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_2

    .line 16
    .line 17
    :cond_0
    new-instance v1, Lrx/internal/operators/OperatorReplay$i;

    .line 18
    .line 19
    iget-object v2, p0, Lrx/internal/operators/OperatorReplay;->c:Ll/pcj;

    .line 20
    .line 21
    invoke-interface {v2}, Ll/pcj;->call()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    check-cast v2, Lrx/internal/operators/OperatorReplay$h;

    .line 26
    .line 27
    invoke-direct {v1, v2}, Lrx/internal/operators/OperatorReplay$i;-><init>(Lrx/internal/operators/OperatorReplay$h;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v1}, Lrx/internal/operators/OperatorReplay$i;->i()V

    .line 31
    .line 32
    .line 33
    iget-object v2, p0, Lrx/internal/operators/OperatorReplay;->b:Ljava/util/concurrent/atomic/AtomicReference;

    .line 34
    .line 35
    invoke-static {v2, v0, v1}, Ll/m31;->a(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    move-object v0, v1

    .line 43
    :cond_2
    iget-object v1, v0, Lrx/internal/operators/OperatorReplay$i;->m:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 44
    .line 45
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    const/4 v2, 0x0

    .line 50
    if-nez v1, :cond_3

    .line 51
    .line 52
    iget-object v1, v0, Lrx/internal/operators/OperatorReplay$i;->m:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 53
    .line 54
    const/4 v3, 0x1

    .line 55
    invoke-virtual {v1, v2, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    if-eqz v1, :cond_3

    .line 60
    .line 61
    move v2, v3

    .line 62
    :cond_3
    invoke-interface {p1, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 63
    .line 64
    .line 65
    if-eqz v2, :cond_4

    .line 66
    .line 67
    iget-object p0, p0, Lrx/internal/operators/OperatorReplay;->a:Lrx/c;

    .line 68
    .line 69
    invoke-virtual {p0, v0}, Lrx/c;->unsafeSubscribe(Ll/gcg0;)Ll/kcg0;

    .line 70
    .line 71
    .line 72
    :cond_4
    return-void
.end method
