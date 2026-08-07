.class public final Ll/cq10;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/dw40;",
        "Ll/wp10;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000<\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0018\u00002\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001B\u0015\u0012\u000c\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00050\u0004\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u000f\u0010\n\u001a\u00020\tH\u0016\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\u0015\u0010\u000e\u001a\u00020\t2\u0006\u0010\r\u001a\u00020\u000c\u00a2\u0006\u0004\u0008\u000e\u0010\u000fJ\r\u0010\u0010\u001a\u00020\t\u00a2\u0006\u0004\u0008\u0010\u0010\u000bJ\r\u0010\u0011\u001a\u00020\t\u00a2\u0006\u0004\u0008\u0011\u0010\u000bJ\u000f\u0010\u0012\u001a\u00020\tH\u0016\u00a2\u0006\u0004\u0008\u0012\u0010\u000bJ\u000f\u0010\u0013\u001a\u00020\tH\u0002\u00a2\u0006\u0004\u0008\u0013\u0010\u000bR\u0016\u0010\u0017\u001a\u00020\u00148\u0002@\u0002X\u0082.\u00a2\u0006\u0006\n\u0004\u0008\u0015\u0010\u0016R\u0018\u0010\u001b\u001a\u0004\u0018\u00010\u00188\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0019\u0010\u001a\u00a8\u0006\u001c"
    }
    d2 = {
        "Ll/cq10;",
        "Ll/i6t;",
        "Ll/dw40;",
        "Ll/wp10;",
        "Ll/dum;",
        "Ll/ou40;",
        "info",
        "<init>",
        "(Ll/dum;)V",
        "",
        "t",
        "()V",
        "",
        "showSeconds",
        "O3",
        "(I)V",
        "S3",
        "R3",
        "n",
        "P3",
        "Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;",
        "i",
        "Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;",
        "multiCallData",
        "Ll/kcg0;",
        "j",
        "Ll/kcg0;",
        "subscribe",
        "livingroom_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public i:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

.field public j:Ll/kcg0;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0
    .param p1    # Ll/dum;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "Ll/ou40;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 5
    .line 6
    .line 7
    new-instance p1, Ll/wp10;

    .line 8
    .line 9
    invoke-direct {p1}, Ll/wp10;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static J3(Ll/cq10;)Lkotlin/Unit;
    .locals 4

    .line 1
    sget-object v0, Ll/fp10;->INSTANCE:Ll/fp10;

    .line 2
    .line 3
    iget-object v1, p0, Ll/cq10;->i:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const-string v3, "multiCallData"

    .line 7
    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    move-object v1, v2

    .line 14
    :cond_0
    invoke-virtual {v0, v1}, Ll/fp10;->f(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_2

    .line 19
    .line 20
    iget-object v0, p0, Ll/cq10;->i:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 21
    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    move-object v2, v0

    .line 29
    :goto_0
    iget-object v0, v2, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->id:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->R7(Ljava/lang/String;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    new-instance v1, Ll/aq10;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ll/aq10;-><init>(Ll/cq10;)V

    .line 42
    .line 43
    .line 44
    new-instance p0, Ll/bq10;

    .line 45
    .line 46
    invoke-direct {p0}, Ll/bq10;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 54
    .line 55
    .line 56
    :cond_2
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 57
    .line 58
    return-object p0
.end method

.method public static K3(ILl/cq10;Ljava/lang/Long;)V
    .locals 2

    .line 1
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    long-to-int v0, v0

    .line 6
    if-lt v0, p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p1}, Ll/cq10;->R3()V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object p1, p1, Ll/cyr;->viewModel:Ll/iam;

    .line 13
    .line 14
    check-cast p1, Ll/wp10;

    .line 15
    .line 16
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    .line 17
    .line 18
    .line 19
    move-result-wide v0

    .line 20
    invoke-virtual {p1, p0, v0, v1}, Ll/wp10;->k(IJ)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic L3(Ll/cq10;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/cq10;->T3(Ll/cq10;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V

    return-void
.end method

.method public static M3(Ll/cq10;Ll/v7t;)V
    .locals 1

    .line 1
    iget-object p1, p1, Ll/v7t;->a:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Ll/cq10;->i:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 7
    .line 8
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast v0, Ll/wp10;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ll/wp10;->j(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast p0, Ll/wp10;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/wp10;->l()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static synthetic N3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/cq10;->U3(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static final T3(Ll/cq10;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->MultiCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->switchToVideo()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Ll/cq10;->i:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 17
    .line 18
    if-nez p1, :cond_0

    .line 19
    .line 20
    const-string p1, "multiCallData"

    .line 21
    .line 22
    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    const/4 p1, 0x0

    .line 26
    :cond_0
    const-string v0, "audience accept"

    .line 27
    .line 28
    invoke-static {p0, p1, v0}, Ll/bf10;->i0(Ll/i6t;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public static final U3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p0}, Ll/bf10;->j(Ljava/lang/Throwable;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public final O3(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/wp10;

    .line 4
    .line 5
    const-wide/16 v1, 0x0

    .line 6
    .line 7
    invoke-virtual {v0, p1, v1, v2}, Ll/wp10;->k(IJ)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/cq10;->j:Ll/kcg0;

    .line 11
    .line 12
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Ll/dw40;

    .line 20
    .line 21
    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 22
    .line 23
    const/4 v2, 0x1

    .line 24
    invoke-virtual {v0, v2, v1}, Ll/oo2;->h2(ILjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {p0, v0, v2}, Ll/i6t;->I3(Lrx/c;Z)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0, p1}, Lrx/c;->take(I)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    new-instance v1, Ll/yp10;

    .line 49
    .line 50
    invoke-direct {v1, p1, p0}, Ll/yp10;-><init>(ILl/cq10;)V

    .line 51
    .line 52
    .line 53
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-virtual {v0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    iput-object p1, p0, Ll/cq10;->j:Ll/kcg0;

    .line 62
    .line 63
    return-void
.end method

.method public final P3()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/wp10;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/wp10;->e()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/cq10;->j:Ll/kcg0;

    .line 9
    .line 10
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final R3()V
    .locals 1

    .line 1
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->u8:I

    .line 2
    .line 3
    invoke-static {v0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/cq10;->i:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    const-string v0, "multiCallData"

    .line 15
    .line 16
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->id:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->S6(Ljava/lang/String;)Lrx/c;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Ll/cq10;->P3()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final S3()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/cq10;->P3()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/vb10;->INSTANCE:Ll/vb10;

    .line 5
    .line 6
    sget-object v1, Ll/cd10;->i:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    new-instance v2, Ll/zp10;

    .line 12
    .line 13
    invoke-direct {v2, p0}, Ll/zp10;-><init>(Ll/cq10;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p0, v1, v2}, Ll/vb10;->o(Ll/i6t;Ljava/lang/String;Lkotlin/jvm/functions/Function0;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/cq10;->P3()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->c5(Ll/i6t;)Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Ll/xp10;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Ll/xp10;-><init>(Ll/cq10;)V

    .line 15
    .line 16
    .line 17
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 22
    .line 23
    .line 24
    return-void
.end method
