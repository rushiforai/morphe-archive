.class public Ll/g9f0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/v5m;


# instance fields
.field public final a:Ll/tf3;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/tf3<",
            "Ll/wwt;",
            ">;"
        }
    .end annotation
.end field

.field public final b:Lcom/p1/mobile/android/app/Frag;

.field public final c:Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;

.field public final d:Ll/u8f0;

.field public final e:Ll/ft5;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;Ljava/lang/String;)V
    .locals 2
    .param p2    # Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/tf3;

    .line 5
    .line 6
    new-instance v1, Ll/wwt;

    .line 7
    .line 8
    invoke-direct {v1}, Ll/wwt;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-direct {v0, v1}, Ll/tf3;-><init>(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/g9f0;->a:Ll/tf3;

    .line 15
    .line 16
    new-instance v0, Ll/ft5;

    .line 17
    .line 18
    invoke-direct {v0}, Ll/ft5;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Ll/g9f0;->e:Ll/ft5;

    .line 22
    .line 23
    iput-object p1, p0, Ll/g9f0;->b:Lcom/p1/mobile/android/app/Frag;

    .line 24
    .line 25
    iput-object p2, p0, Ll/g9f0;->c:Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;

    .line 26
    .line 27
    new-instance p1, Ll/u8f0;

    .line 28
    .line 29
    invoke-direct {p1, p2, p3}, Ll/u8f0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iput-object p1, p0, Ll/g9f0;->d:Ll/u8f0;

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/g9f0;->v()V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public static synthetic k(Ll/ubu;Ll/wwt;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/wwt;->g()Ll/ubu;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1, p0}, Ll/ubu;->w(Ll/ubu;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic l(Ljava/lang/Throwable;)Ll/ubu;
    .locals 0

    .line 1
    invoke-static {}, Ll/ubu;->o()Ll/ubu;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic m(Ll/g9f0;Ll/ubu;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/g9f0;->x(Ll/ubu;)V

    return-void
.end method

.method public static synthetic n(Ljava/util/List;Ll/j7u;)V
    .locals 2

    .line 1
    iget-object v0, p1, Ll/j7u;->a:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 2
    .line 3
    const-string v1, "onlive"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object p1, p1, Ll/j7u;->b:Ljava/lang/String;

    .line 12
    .line 13
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public static synthetic o(Ljava/lang/Throwable;)Ll/ubu;
    .locals 0

    .line 1
    invoke-static {}, Ll/ubu;->o()Ll/ubu;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic p(Ljava/util/List;)Ljava/util/List;
    .locals 2

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/e9f0;

    .line 7
    .line 8
    invoke-direct {v1, v0}, Ll/e9f0;-><init>(Ljava/util/List;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public static synthetic q(Ljava/util/Collection;Ll/wwt;)V
    .locals 0

    .line 1
    invoke-virtual {p1, p0}, Ll/wwt;->h(Ljava/util/Collection;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic r(Ll/g9f0;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/g9f0;->y(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic s(Ll/g9f0;Ll/wwt;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/g9f0;->w(Ll/wwt;)V

    return-void
.end method

.method public static synthetic t(Ll/ubu;Ll/ubu;Ll/ubu;)Ll/wwt;
    .locals 2

    .line 1
    new-instance v0, Ll/wwt;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/wwt;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p2}, Ll/wwt;->j(Ll/ubu;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p2}, Ll/ubu;->p()Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {p0, v1}, Ll/ubu;->C(Ljava/util/Collection;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p0}, Ll/wwt;->i(Ll/ubu;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p2}, Ll/ubu;->p()Ljava/util/List;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    invoke-virtual {p1, p2}, Ll/ubu;->C(Ljava/util/Collection;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ll/ubu;->p()Ljava/util/List;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p1, p0}, Ll/ubu;->C(Ljava/util/Collection;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, p1}, Ll/wwt;->k(Ll/ubu;)V

    .line 34
    .line 35
    .line 36
    return-object v0
.end method

.method public static synthetic u(Ljava/lang/Throwable;)Ll/ubu;
    .locals 0

    .line 1
    invoke-static {}, Ll/ubu;->o()Ll/ubu;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    invoke-interface {p0}, Ll/v5m;->j()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/g9f0;->v()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public b()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g9f0;->e:Ll/ft5;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ft5;->c()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c()Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g9f0;->c:Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Ljava/util/Collection;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/g9f0;->a:Ll/tf3;

    .line 2
    .line 3
    new-instance v0, Ll/w8f0;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/w8f0;-><init>(Ljava/util/Collection;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/tf3;->a(Ll/y20;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public e()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/wwt;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/g9f0;->a:Ll/tf3;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/tf3;->d()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public f()Ll/wwt;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g9f0;->a:Ll/tf3;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/tf3;->c()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/wwt;

    .line 8
    .line 9
    return-object p0
.end method

.method public h()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/g9f0;->b:Lcom/p1/mobile/android/app/Frag;

    .line 2
    .line 3
    iget-object v1, p0, Ll/g9f0;->d:Ll/u8f0;

    .line 4
    .line 5
    iget-object v2, p0, Ll/g9f0;->a:Ll/tf3;

    .line 6
    .line 7
    invoke-virtual {v2}, Ll/tf3;->c()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    check-cast v2, Ll/wwt;

    .line 12
    .line 13
    invoke-virtual {v2}, Ll/wwt;->g()Ll/ubu;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v1, v2}, Ll/u8f0;->c(Ll/ubu;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/b9f0;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/b9f0;-><init>(Ll/g9f0;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iget-object p0, p0, Ll/g9f0;->e:Ll/ft5;

    .line 47
    .line 48
    invoke-virtual {p0, v0}, Ll/ft5;->a(Ll/kcg0;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public i()V
    .locals 3

    .line 1
    invoke-interface {p0}, Ll/v5m;->j()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/g9f0;->b:Lcom/p1/mobile/android/app/Frag;

    .line 6
    .line 7
    iget-object v2, p0, Ll/g9f0;->d:Ll/u8f0;

    .line 8
    .line 9
    invoke-virtual {v2, v0}, Ll/u8f0;->f(Ljava/util/List;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v1, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/c9f0;

    .line 18
    .line 19
    invoke-direct {v1}, Ll/c9f0;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v1, Ll/d9f0;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Ll/d9f0;-><init>(Ll/g9f0;)V

    .line 37
    .line 38
    .line 39
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iget-object p0, p0, Ll/g9f0;->e:Ll/ft5;

    .line 48
    .line 49
    invoke-virtual {p0, v0}, Ll/ft5;->a(Ll/kcg0;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final v()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/g9f0;->d:Ll/u8f0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/u8f0;->a()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/v8f0;

    .line 8
    .line 9
    invoke-direct {v1}, Ll/v8f0;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lrx/c;->onErrorReturn(Ll/qcj;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v1, p0, Ll/g9f0;->d:Ll/u8f0;

    .line 17
    .line 18
    invoke-virtual {v1}, Ll/u8f0;->d()Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    new-instance v2, Ll/x8f0;

    .line 23
    .line 24
    invoke-direct {v2}, Ll/x8f0;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1, v2}, Lrx/c;->onErrorReturn(Ll/qcj;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iget-object v2, p0, Ll/g9f0;->d:Ll/u8f0;

    .line 32
    .line 33
    invoke-virtual {v2}, Ll/u8f0;->b()Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    new-instance v3, Ll/y8f0;

    .line 38
    .line 39
    invoke-direct {v3}, Ll/y8f0;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v2, v3}, Lrx/c;->onErrorReturn(Ll/qcj;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    new-instance v3, Ll/z8f0;

    .line 47
    .line 48
    invoke-direct {v3}, Ll/z8f0;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-static {v0, v1, v2, v3}, Lrx/c;->zip(Lrx/c;Lrx/c;Lrx/c;Ll/scj;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iget-object v1, p0, Ll/g9f0;->b:Lcom/p1/mobile/android/app/Frag;

    .line 56
    .line 57
    invoke-virtual {v1, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    new-instance v1, Ll/a9f0;

    .line 70
    .line 71
    invoke-direct {v1, p0}, Ll/a9f0;-><init>(Ll/g9f0;)V

    .line 72
    .line 73
    .line 74
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    iget-object p0, p0, Ll/g9f0;->e:Ll/ft5;

    .line 83
    .line 84
    invoke-virtual {p0, v0}, Ll/ft5;->a(Ll/kcg0;)V

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public final synthetic w(Ll/wwt;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g9f0;->a:Ll/tf3;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/tf3;->e(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic x(Ll/ubu;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/g9f0;->a:Ll/tf3;

    .line 2
    .line 3
    new-instance v0, Ll/f9f0;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/f9f0;-><init>(Ll/ubu;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/tf3;->a(Ll/y20;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic y(Ljava/util/List;)V
    .locals 1

    .line 1
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/g9f0;->d(Ljava/util/Collection;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method
