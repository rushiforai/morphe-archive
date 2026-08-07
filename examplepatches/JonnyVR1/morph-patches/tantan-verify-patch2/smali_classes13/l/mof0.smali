.class public Ll/mof0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Lcom/tantanapp/common/network/RunnerProxy;

.field public c:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "TT;>;"
        }
    .end annotation
.end field

.field public final d:Ll/dji;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/dji<",
            "TT;>;"
        }
    .end annotation
.end field

.field public final e:Ll/pcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pcj<",
            "Lrx/c<",
            "TT;>;>;"
        }
    .end annotation
.end field

.field public f:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public final g:Z


# direct methods
.method public constructor <init>(Lcom/tantanapp/common/network/RunnerProxy;Ljava/lang/String;Ll/dji;Ll/pcj;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantanapp/common/network/RunnerProxy;",
            "Ljava/lang/String;",
            "Ll/dji<",
            "TT;>;",
            "Ll/pcj<",
            "Lrx/c<",
            "TT;>;>;)V"
        }
    .end annotation

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    .line 29
    invoke-direct/range {v0 .. v5}, Ll/mof0;-><init>(Lcom/tantanapp/common/network/RunnerProxy;Ljava/lang/String;Ll/dji;Ll/pcj;Z)V

    return-void
.end method

.method public constructor <init>(Lcom/tantanapp/common/network/RunnerProxy;Ljava/lang/String;Ll/dji;Ll/pcj;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantanapp/common/network/RunnerProxy;",
            "Ljava/lang/String;",
            "Ll/dji<",
            "TT;>;",
            "Ll/pcj<",
            "Lrx/c<",
            "TT;>;>;Z)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/mof0;->c:Lrx/subjects/a;

    .line 9
    .line 10
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/mof0;->f:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 17
    .line 18
    iput-object p1, p0, Ll/mof0;->b:Lcom/tantanapp/common/network/RunnerProxy;

    .line 19
    .line 20
    iput-object p2, p0, Ll/mof0;->a:Ljava/lang/String;

    .line 21
    .line 22
    iput-object p3, p0, Ll/mof0;->d:Ll/dji;

    .line 23
    .line 24
    iput-object p4, p0, Ll/mof0;->e:Ll/pcj;

    .line 25
    .line 26
    iput-boolean p5, p0, Ll/mof0;->g:Z

    .line 27
    .line 28
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ll/dji;Ll/pcj;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ll/dji<",
            "TT;>;",
            "Ll/pcj<",
            "Lrx/c<",
            "TT;>;>;)V"
        }
    .end annotation

    .line 30
    new-instance v0, Lcom/tantanapp/common/network/RunnerProxy;

    invoke-direct {v0}, Lcom/tantanapp/common/network/RunnerProxy;-><init>()V

    invoke-direct {p0, v0, p1, p2, p3}, Ll/mof0;-><init>(Lcom/tantanapp/common/network/RunnerProxy;Ljava/lang/String;Ll/dji;Ll/pcj;)V

    return-void
.end method

.method public static synthetic a(Ll/mof0;Ll/dji$a;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mof0;->r(Ll/dji$a;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b(Ll/mof0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mof0;->v(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic c(Ll/mof0;Ll/dji$a;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mof0;->u(Ll/dji$a;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic d(Ll/mof0;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mof0;->x(Ljava/lang/Object;)V

    return-void
.end method

.method public static synthetic e(Ll/mof0;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mof0;->w(Z)V

    return-void
.end method

.method public static synthetic f(Ll/mof0;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mof0;->p(Ljava/lang/Object;)V

    return-void
.end method

.method public static synthetic g(Ll/mof0;Ljava/lang/Object;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mof0;->y(Ljava/lang/Object;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic h(Ll/mof0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mof0;->q()V

    return-void
.end method

.method public static synthetic i(Ll/mof0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mof0;->t(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic j(Ll/mof0;Ljava/lang/Object;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mof0;->s(Ljava/lang/Object;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public A(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/mof0;->d:Ll/dji;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/dji;->p(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/mof0;->c:Lrx/subjects/a;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public k()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ll/mof0;->l(Z)Lrx/c;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public l(Z)Lrx/c;
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SubscribeOnError"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/mof0;->c:Lrx/subjects/a;

    .line 2
    .line 3
    new-instance v1, Ll/cof0;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/cof0;-><init>(Ll/mof0;Z)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lrx/c;->doOnSubscribe(Ll/x20;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p0, p1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public m()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/mof0;->c:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/mof0;->c:Lrx/subjects/a;

    .line 14
    .line 15
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    iget-object p0, p0, Ll/mof0;->d:Ll/dji;

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/dji;->b()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public n()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/mof0;->c:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public o()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mof0;->d:Ll/dji;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/dji;->c()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/mof0;->c:Lrx/subjects/a;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic p(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mof0;->d:Ll/dji;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/dji;->p(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic q()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mof0;->z()Lrx/c;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic r(Ll/dji$a;)Lrx/c;
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Ll/mof0;->f:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Ll/mof0;->e:Ll/pcj;

    .line 14
    .line 15
    invoke-interface {p1}, Ll/pcj;->call()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Lrx/c;

    .line 20
    .line 21
    new-instance v0, Ll/kof0;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Ll/kof0;-><init>(Ll/mof0;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1, v0}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0

    .line 31
    :cond_0
    iget-boolean v0, p1, Ll/dji$a;->b:Z

    .line 32
    .line 33
    if-nez v0, :cond_1

    .line 34
    .line 35
    new-instance v0, Ll/lof0;

    .line 36
    .line 37
    invoke-direct {v0, p0}, Ll/lof0;-><init>(Ll/mof0;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 41
    .line 42
    .line 43
    :cond_1
    iget-object p0, p1, Ll/dji$a;->a:Ljava/lang/Object;

    .line 44
    .line 45
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    return-object p0
.end method

.method public final synthetic s(Ljava/lang/Object;)Ll/uxj0;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/mof0;->f:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/mof0;->c:Lrx/subjects/a;

    .line 9
    .line 10
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Ll/mof0;->c:Lrx/subjects/a;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 22
    .line 23
    return-object p0
.end method

.method public final synthetic t(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/mof0;->f:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    const/4 v1, 0x0

    .line 5
    invoke-virtual {p1, v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 6
    .line 7
    .line 8
    iget-boolean p1, p0, Ll/mof0;->g:Z

    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Ll/mof0;->c:Lrx/subjects/a;

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public final synthetic u(Ll/dji$a;)Ll/uxj0;
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Ll/mof0;->c:Lrx/subjects/a;

    .line 4
    .line 5
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/mof0;->c:Lrx/subjects/a;

    .line 12
    .line 13
    iget-object p1, p1, Ll/dji$a;->a:Ljava/lang/Object;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 19
    .line 20
    return-object p0
.end method

.method public final synthetic v(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-boolean p1, p0, Ll/mof0;->g:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/mof0;->c:Lrx/subjects/a;

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public final synthetic w(Z)V
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/mof0;->c:Lrx/subjects/a;

    .line 3
    .line 4
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    iget-object v0, p0, Ll/mof0;->b:Lcom/tantanapp/common/network/RunnerProxy;

    .line 11
    .line 12
    iget-object v1, p0, Ll/mof0;->a:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    .line 14
    iget-object v2, p0, Ll/mof0;->d:Ll/dji;

    .line 15
    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    :try_start_1
    invoke-virtual {v2}, Ll/dji;->k()Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    new-instance v2, Ll/fof0;

    .line 23
    .line 24
    invoke-direct {v2, p0}, Ll/fof0;-><init>(Ll/mof0;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1, v2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    sget-object v2, Lcom/p1/mobile/android/rx/rxthread/FastIoScheduler;->b:Ll/f2e0;

    .line 32
    .line 33
    invoke-virtual {p1, v2}, Lrx/c;->subscribeOn(Ll/f2e0;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-virtual {p1, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    new-instance v2, Ll/gof0;

    .line 46
    .line 47
    invoke-direct {v2, p0}, Ll/gof0;-><init>(Ll/mof0;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    new-instance v2, Ll/hof0;

    .line 55
    .line 56
    invoke-direct {v2, p0}, Ll/hof0;-><init>(Ll/mof0;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p1, v2}, Lrx/c;->doOnError(Ll/y20;)Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    goto :goto_0

    .line 64
    :catchall_0
    move-exception p1

    .line 65
    goto :goto_1

    .line 66
    :cond_0
    invoke-virtual {v2}, Ll/dji;->k()Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    sget-object v2, Lcom/p1/mobile/android/rx/rxthread/FastIoScheduler;->b:Ll/f2e0;

    .line 71
    .line 72
    invoke-virtual {p1, v2}, Lrx/c;->subscribeOn(Ll/f2e0;)Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    invoke-virtual {p1, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    new-instance v2, Ll/iof0;

    .line 85
    .line 86
    invoke-direct {v2, p0}, Ll/iof0;-><init>(Ll/mof0;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p1, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    new-instance v2, Ll/jof0;

    .line 94
    .line 95
    invoke-direct {v2, p0}, Ll/jof0;-><init>(Ll/mof0;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p1, v2}, Lrx/c;->doOnError(Ll/y20;)Lrx/c;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    :goto_0
    const/4 v2, 0x1

    .line 103
    invoke-virtual {v0, v1, p1, v2}, Lcom/tantanapp/common/network/RunnerProxy;->now(Ljava/lang/String;Lrx/c;Z)Lrx/c;

    .line 104
    .line 105
    .line 106
    :cond_1
    monitor-exit p0

    .line 107
    return-void

    .line 108
    :goto_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 109
    throw p1
.end method

.method public final synthetic x(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mof0;->d:Ll/dji;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/dji;->p(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic y(Ljava/lang/Object;)Ll/uxj0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mof0;->c:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 7
    .line 8
    return-object p0
.end method

.method public z()Lrx/c;
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SubscribeOnError"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/mof0;->f:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 10
    .line 11
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget-object v1, Lcom/p1/mobile/android/rx/rxthread/FastIoScheduler;->b:Ll/f2e0;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object v0, p0, Ll/mof0;->b:Lcom/tantanapp/common/network/RunnerProxy;

    .line 21
    .line 22
    new-instance v1, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 25
    .line 26
    .line 27
    iget-object v2, p0, Ll/mof0;->a:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string v2, "_refresh"

    .line 33
    .line 34
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    iget-object v2, p0, Ll/mof0;->e:Ll/pcj;

    .line 42
    .line 43
    invoke-interface {v2}, Ll/pcj;->call()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    check-cast v2, Lrx/c;

    .line 48
    .line 49
    sget-object v3, Lcom/p1/mobile/android/rx/rxthread/FastIoScheduler;->b:Ll/f2e0;

    .line 50
    .line 51
    invoke-virtual {v2, v3}, Lrx/c;->subscribeOn(Ll/f2e0;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-virtual {v2, v3}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    new-instance v3, Ll/dof0;

    .line 60
    .line 61
    invoke-direct {v3, p0}, Ll/dof0;-><init>(Ll/mof0;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v2, v3}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    invoke-virtual {v2, v3}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    new-instance v3, Ll/eof0;

    .line 77
    .line 78
    invoke-direct {v3, p0}, Ll/eof0;-><init>(Ll/mof0;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v2, v3}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    const/4 v2, 0x0

    .line 86
    invoke-virtual {v0, v1, p0, v2}, Lcom/tantanapp/common/network/RunnerProxy;->now(Ljava/lang/String;Lrx/c;Z)Lrx/c;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    return-object p0
.end method
