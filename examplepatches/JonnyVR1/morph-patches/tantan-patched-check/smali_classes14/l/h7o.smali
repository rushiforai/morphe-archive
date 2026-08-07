.class public Ll/h7o;
.super Ll/k2o;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/k2o<",
        "Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;",
        ">;"
    }
.end annotation


# instance fields
.field public final l:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/z8o;",
            ">;"
        }
    .end annotation
.end field

.field public final m:Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;


# direct methods
.method public constructor <init>(Ll/ner;Ll/nus;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/k2o;-><init>(Ll/ner;Ll/nus;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Ll/h7o;->l:Lrx/subjects/a;

    .line 9
    .line 10
    new-instance p1, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;

    .line 11
    .line 12
    const-string p2, "LiveSquareNearBy"

    .line 13
    .line 14
    invoke-direct {p1, p2}, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Ll/h7o;->m:Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;

    .line 18
    .line 19
    return-void
.end method

.method public static synthetic V2(Ll/z8o;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static synthetic W2(Ll/h7o;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/h7o;->m3(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic X2(Ll/h7o;Ll/z8o;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/h7o;->n3(Ll/z8o;)V

    return-void
.end method

.method public static synthetic Y2(Ll/h7o;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/h7o;->o3(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic Z2(Ll/h7o;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/h7o;->k3(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic a3(Ljava/lang/Throwable;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b3(Ll/h7o;Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/h7o;->j3(Ljava/lang/Long;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c3(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->id:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d3(Ll/h7o;Ll/z8o;Ljava/util/List;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/h7o;->r3(Ll/z8o;Ljava/util/List;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic e3(Ll/h7o;Ll/z8o;Ll/z8o;Ljava/lang/Long;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/h7o;->q3(Ll/z8o;Ll/z8o;Ljava/lang/Long;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic f3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic g3(Ll/h7o;Ljava/util/List;Ll/z8o;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/h7o;->p3(Ljava/util/List;Ll/z8o;)Lrx/c;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public I2()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/h7o;->l:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/c;->asObservable()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/a7o;

    .line 12
    .line 13
    invoke-direct {v1}, Ll/a7o;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/b7o;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/b7o;-><init>(Ll/h7o;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    const/4 v0, 0x3

    .line 41
    invoke-static {v0}, Ll/t4u;->e(I)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    new-instance v1, Ll/c7o;

    .line 50
    .line 51
    invoke-direct {v1, p0}, Ll/c7o;-><init>(Ll/h7o;)V

    .line 52
    .line 53
    .line 54
    new-instance p0, Ll/d7o;

    .line 55
    .line 56
    invoke-direct {p0}, Ll/d7o;-><init>()V

    .line 57
    .line 58
    .line 59
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public h3(Ll/z8o;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h7o;->l:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public i3()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/k2o;->f:Ll/ft5;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ft5;->c()V

    .line 4
    .line 5
    .line 6
    iget v0, p0, Ll/k2o;->g:I

    .line 7
    .line 8
    int-to-long v0, v0

    .line 9
    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 10
    .line 11
    invoke-static {v0, v1, v2}, Lrx/c;->interval(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/v6o;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/v6o;-><init>(Ll/h7o;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v1, Ll/y6o;

    .line 41
    .line 42
    invoke-direct {v1, p0}, Ll/y6o;-><init>(Ll/h7o;)V

    .line 43
    .line 44
    .line 45
    new-instance v2, Ll/z6o;

    .line 46
    .line 47
    invoke-direct {v2, p0}, Ll/z6o;-><init>(Ll/h7o;)V

    .line 48
    .line 49
    .line 50
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    iget-object p0, p0, Ll/k2o;->f:Ll/ft5;

    .line 59
    .line 60
    invoke-virtual {p0, v0}, Ll/ft5;->a(Ll/kcg0;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public final synthetic j3(Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;->Q4()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public final synthetic k3(Ljava/lang/Long;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/h7o;->l:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ll/z8o;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object v0, p1, Ll/ubu;->a:Ljava/util/List;

    .line 12
    .line 13
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ll/h7o;->t3(Ll/z8o;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public final synthetic m3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public n()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/l6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/h7o;->m:Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;->d()V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/k2o;->f:Ll/ft5;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/ft5;->c()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic n3(Ll/z8o;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;->M5(Ll/z8o;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic o3(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;

    .line 4
    .line 5
    const/4 p1, 0x1

    .line 6
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;->P:Z

    .line 7
    .line 8
    return-void
.end method

.method public final synthetic p3(Ljava/util/List;Ll/z8o;)Lrx/c;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/h7o;->l:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/z8o;

    .line 8
    .line 9
    iget-object v1, v0, Ll/ubu;->a:Ljava/util/List;

    .line 10
    .line 11
    iget-object v2, p2, Ll/ubu;->a:Ljava/util/List;

    .line 12
    .line 13
    invoke-virtual {v0, v1, v2}, Ll/ubu;->q(Ljava/util/List;Ljava/util/List;)I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-nez v1, :cond_0

    .line 18
    .line 19
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 20
    .line 21
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0

    .line 26
    :cond_0
    invoke-virtual {v0, p1, v1}, Ll/ubu;->E(Ljava/util/List;I)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Ll/h7o;->l:Lrx/subjects/a;

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    const-wide/16 v1, 0xbb8

    .line 35
    .line 36
    sget-object p1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 37
    .line 38
    invoke-static {v1, v2, p1}, Lrx/c;->timer(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {p1, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    new-instance v1, Ll/w6o;

    .line 51
    .line 52
    invoke-direct {v1, p0, v0, p2}, Ll/w6o;-><init>(Ll/h7o;Ll/z8o;Ll/z8o;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p1, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    new-instance p1, Ll/x6o;

    .line 60
    .line 61
    invoke-direct {p1}, Ll/x6o;-><init>()V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0, p1}, Lrx/c;->onErrorReturn(Ll/qcj;)Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    return-object p0
.end method

.method public final synthetic q3(Ll/z8o;Ll/z8o;Ljava/lang/Long;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p1, p2}, Ll/ubu;->z(Ll/ubu;)Ll/ubu;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/h7o;->l:Lrx/subjects/a;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 10
    .line 11
    return-object p0
.end method

.method public final synthetic r3(Ll/z8o;Ljava/util/List;)Lrx/c;
    .locals 5

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    if-eqz v3, :cond_2

    .line 20
    .line 21
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 26
    .line 27
    invoke-virtual {v3}, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->isOnLive()Z

    .line 28
    .line 29
    .line 30
    move-result v4

    .line 31
    if-nez v4, :cond_1

    .line 32
    .line 33
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->id:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {p1, v3}, Ll/ubu;->B(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    if-eqz v3, :cond_1

    .line 40
    .line 41
    iget-object v4, v3, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->id:Ljava/lang/String;

    .line 42
    .line 43
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    invoke-virtual {v3}, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->getRecommendCategory()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    :cond_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    const/16 v4, 0xa

    .line 58
    .line 59
    if-lt v3, v4, :cond_0

    .line 60
    .line 61
    :cond_2
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    if-eqz p1, :cond_3

    .line 66
    .line 67
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 68
    .line 69
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    return-object p0

    .line 74
    :cond_3
    invoke-virtual {p0, v0, v1, p2}, Ll/h7o;->s3(Ljava/util/List;Ljava/util/List;Ljava/util/List;)Lrx/c;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    return-object p0
.end method

.method public final s3(Ljava/util/List;Ljava/util/List;Ljava/util/List;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;",
            ">;)",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/k2o;->k:Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->name:Ljava/lang/String;

    .line 4
    .line 5
    sget-object v1, Ll/fdn;->Companion:Ll/fdn$a;

    .line 6
    .line 7
    invoke-virtual {v1}, Ll/fdn$a;->v()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-static {p1, p2, v0, v1}, Lcom/p1/mobile/putong/live/external/intl/module/api/IntlLiveSquareApi;->refreshStoppedLivesV2(Ljava/util/List;Ljava/util/List;Ljava/lang/String;Z)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    new-instance p2, Ll/g7o;

    .line 16
    .line 17
    invoke-direct {p2, p0, p3}, Ll/g7o;-><init>(Ll/h7o;Ljava/util/List;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, p2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public final t3(Ll/z8o;)V
    .locals 2
    .param p1    # Ll/z8o;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p1, Ll/ubu;->a:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/e7o;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/e7o;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/external/intl/module/api/IntlLiveSquareApi;->queryCurrentLivesInfo(Ljava/util/List;Z)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/f7o;

    .line 18
    .line 19
    invoke-direct {v1, p0, p1}, Ll/f7o;-><init>(Ll/h7o;Ll/z8o;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iget-object p0, p0, Ll/h7o;->m:Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;

    .line 27
    .line 28
    const-string v0, "updateLives"

    .line 29
    .line 30
    const/16 v1, -0x64

    .line 31
    .line 32
    invoke-virtual {p0, v0, p1, v1}, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;->f(Ljava/lang/String;Lrx/c;I)Lrx/c;

    .line 33
    .line 34
    .line 35
    return-void
.end method
