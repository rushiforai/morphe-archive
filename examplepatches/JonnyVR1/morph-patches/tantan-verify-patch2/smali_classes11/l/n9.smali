.class public Ll/n9;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/n9$a;
    }
.end annotation


# instance fields
.field public a:Ll/kcg0;

.field public b:Ll/kcg0;

.field public final c:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Landroid/util/Pair<",
            "Ljava/lang/Integer;",
            "Ll/bkj0<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Long;",
            ">;>;>;"
        }
    .end annotation
.end field

.field public final d:Ll/x20;

.field public final e:Ll/x20;

.field public f:Z


# direct methods
.method public constructor <init>()V
    .locals 1

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
    iput-object v0, p0, Ll/n9;->c:Lrx/subjects/a;

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    iput-boolean v0, p0, Ll/n9;->f:Z

    .line 12
    .line 13
    new-instance v0, Ll/e9;

    .line 14
    .line 15
    invoke-direct {v0, p0}, Ll/e9;-><init>(Ll/n9;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Ll/n9;->d:Ll/x20;

    .line 19
    .line 20
    new-instance v0, Ll/f9;

    .line 21
    .line 22
    invoke-direct {v0, p0}, Ll/f9;-><init>(Ll/n9;)V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Ll/n9;->e:Ll/x20;

    .line 26
    .line 27
    return-void
.end method

.method public synthetic constructor <init>(Ll/o9;)V
    .locals 0

    .line 28
    invoke-direct {p0}, Ll/n9;-><init>()V

    return-void
.end method

.method public static synthetic a(Ll/n9;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/n9;->m(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic b(Ll/n9;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/n9;->r()V

    return-void
.end method

.method public static synthetic c(Ll/x20;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Lcom/google/common/base/Optional;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/common/base/Optional;->get()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/data/AcceleratePairingStatus;

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/AcceleratePairingStatus;->active:Z

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic e(Ll/n9;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/n9;->n(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic f(Landroid/net/NetworkInfo;Lcom/google/common/base/Optional;)Lcom/google/common/base/Optional;
    .locals 0

    .line 1
    return-object p1
.end method

.method public static synthetic g(Lcom/google/common/base/Optional;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/common/base/Optional;->isPresent()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_1

    .line 6
    .line 7
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->g()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->c2:Ll/dw6;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/dw6;->y3()Lrx/c;

    .line 18
    .line 19
    .line 20
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_1
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 24
    .line 25
    return-object p0
.end method

.method public static synthetic h(Ll/n9;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/n9;->k()V

    return-void
.end method

.method public static synthetic i(Ll/n9;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/n9;->l()V

    return-void
.end method

.method public static j()Ll/n9;
    .locals 1

    .line 1
    invoke-static {}, Ll/n9$a;->a()Ll/n9;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method


# virtual methods
.method public final synthetic k()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/n9;->a:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-object v0, p0, Ll/n9;->a:Ll/kcg0;

    .line 8
    .line 9
    return-void
.end method

.method public final synthetic l()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/n9;->b:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-object v0, p0, Ll/n9;->b:Ll/kcg0;

    .line 8
    .line 9
    return-void
.end method

.method public final synthetic m(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n9;->d:Ll/x20;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/x20;->call()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic n(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/n9;->r()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public o(Ll/bb50;)Ll/kcg0;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bb50<",
            "Landroid/util/Pair<",
            "Ljava/lang/Integer;",
            "Ll/bkj0<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Long;",
            ">;>;>;)",
            "Ll/kcg0;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/n9;->q()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/n9;->c:Lrx/subjects/a;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final p(ILl/bkj0;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ll/bkj0<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x2

    .line 2
    const/4 v1, 0x1

    .line 3
    if-eq p1, v1, :cond_0

    .line 4
    .line 5
    iget-object v2, p0, Ll/n9;->d:Ll/x20;

    .line 6
    .line 7
    invoke-interface {v2}, Ll/x20;->call()V

    .line 8
    .line 9
    .line 10
    iput-boolean v1, p0, Ll/n9;->f:Z

    .line 11
    .line 12
    if-ne p1, v0, :cond_0

    .line 13
    .line 14
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->c2:Ll/dw6;

    .line 17
    .line 18
    invoke-virtual {v1}, Ll/dw6;->H3()V

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-object v1, p0, Ll/n9;->c:Lrx/subjects/a;

    .line 22
    .line 23
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-static {v2, p2}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    invoke-virtual {v1, p2}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    if-ne p1, v0, :cond_1

    .line 35
    .line 36
    iget-object p0, p0, Ll/n9;->c:Lrx/subjects/a;

    .line 37
    .line 38
    const/4 p1, -0x1

    .line 39
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    const/4 p2, 0x0

    .line 44
    invoke-static {p1, p2}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    :cond_1
    return-void
.end method

.method public final q()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/n9;->u()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final r()V
    .locals 6

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->c2:Ll/dw6;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dw6;->t3()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    const/4 v0, -0x1

    .line 13
    invoke-virtual {p0, v0, v1}, Ll/n9;->p(ILl/bkj0;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->c2:Ll/dw6;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/dw6;->q3()J

    .line 22
    .line 23
    .line 24
    move-result-wide v2

    .line 25
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 28
    .line 29
    .line 30
    move-result-wide v4

    .line 31
    sub-long/2addr v2, v4

    .line 32
    const-wide/16 v4, 0x0

    .line 33
    .line 34
    cmp-long v0, v2, v4

    .line 35
    .line 36
    const/4 v4, 0x2

    .line 37
    if-gtz v0, :cond_1

    .line 38
    .line 39
    invoke-virtual {p0, v4, v1}, Ll/n9;->p(ILl/bkj0;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_1
    invoke-static {v2, v3}, Ll/fa;->c(J)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    const/16 v5, 0x64

    .line 48
    .line 49
    if-lt v0, v5, :cond_2

    .line 50
    .line 51
    invoke-virtual {p0, v4, v1}, Ll/n9;->p(ILl/bkj0;)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_2
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    iget-boolean v4, p0, Ll/n9;->f:Z

    .line 60
    .line 61
    invoke-static {v0, v2, v3, v4}, Ll/fa;->b(IJZ)F

    .line 62
    .line 63
    .line 64
    move-result v4

    .line 65
    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v4

    .line 73
    const-string v5, "%.1f"

    .line 74
    .line 75
    invoke-static {v1, v5, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    const/4 v4, 0x0

    .line 80
    iput-boolean v4, p0, Ll/n9;->f:Z

    .line 81
    .line 82
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    invoke-static {v1, v0, v2}, Ll/bkj0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    const/4 v1, 0x1

    .line 95
    invoke-virtual {p0, v1, v0}, Ll/n9;->p(ILl/bkj0;)V

    .line 96
    .line 97
    .line 98
    new-instance v0, Ll/k9;

    .line 99
    .line 100
    invoke-direct {v0, p0}, Ll/k9;-><init>(Ll/n9;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {p0, v0}, Ll/n9;->t(Ll/x20;)V

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public s()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/n9;->e:Ll/x20;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/x20;->call()V

    .line 4
    .line 5
    .line 6
    const/4 v0, -0x1

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p0, v0, v1}, Ll/n9;->p(ILl/bkj0;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final t(Ll/x20;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/n9;->a:Ll/kcg0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-wide/16 v0, 0x1f4

    .line 6
    .line 7
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 8
    .line 9
    const-wide/16 v3, 0x0

    .line 10
    .line 11
    invoke-static {v3, v4, v0, v1, v2}, Lrx/c;->interval(JJLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/l9;

    .line 28
    .line 29
    invoke-direct {v1, p1}, Ll/l9;-><init>(Ll/x20;)V

    .line 30
    .line 31
    .line 32
    new-instance p1, Ll/m9;

    .line 33
    .line 34
    invoke-direct {p1, p0}, Ll/m9;-><init>(Ll/n9;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v1, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {v0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iput-object p1, p0, Ll/n9;->a:Ll/kcg0;

    .line 46
    .line 47
    :cond_0
    return-void
.end method

.method public final u()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/n9;->b:Ll/kcg0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->m()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->c2:Ll/dw6;

    .line 12
    .line 13
    invoke-virtual {v1}, Ll/dw6;->o3()Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    new-instance v2, Ll/g9;

    .line 18
    .line 19
    invoke-direct {v2}, Ll/g9;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-static {v0, v1, v2}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/h9;

    .line 27
    .line 28
    invoke-direct {v1}, Ll/h9;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    new-instance v1, Ll/i9;

    .line 36
    .line 37
    invoke-direct {v1}, Ll/i9;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    new-instance v1, Ll/j9;

    .line 49
    .line 50
    invoke-direct {v1, p0}, Ll/j9;-><init>(Ll/n9;)V

    .line 51
    .line 52
    .line 53
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    iput-object v0, p0, Ll/n9;->b:Ll/kcg0;

    .line 62
    .line 63
    :cond_0
    return-void
.end method
