.class public Ll/xre;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ll/oo2;",
        ">",
        "Ll/i6t<",
        "TT;",
        "Ll/bse;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Ll/p6g0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/p6g0<",
            "+TT;>;"
        }
    .end annotation
.end field

.field public j:Ll/q6g0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/q6g0<",
            "+TT;>;"
        }
    .end annotation
.end field

.field public k:Ll/dse;


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/bse;

    .line 5
    .line 6
    invoke-direct {p1}, Ll/bse;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic J3(Ll/xre;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/xre;->L3(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic K3(Ll/xre;Ll/sre;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xre;->N3(Ll/sre;)V

    return-void
.end method

.method private synthetic L3(Ll/vxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/bse;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/bse;->i()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public M3()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xre;->k:Ll/dse;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/dse;->V()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    :goto_0
    if-nez v0, :cond_1

    .line 12
    .line 13
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 14
    .line 15
    check-cast p0, Ll/bse;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/bse;->i()V

    .line 18
    .line 19
    .line 20
    :cond_1
    return-void
.end method

.method public final N3(Ll/sre;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/bse;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/bse;->j()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast v0, Ll/bse;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/bse;->n()V

    .line 16
    .line 17
    .line 18
    :cond_0
    invoke-virtual {p0, p1}, Ll/xre;->O3(Ll/sre;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final O3(Ll/sre;)V
    .locals 2

    .line 1
    sget-object v0, Ll/xre$a;->a:[I

    .line 2
    .line 3
    iget-object v1, p1, Ll/sre;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    aget v0, v0, v1

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    if-eq v0, v1, :cond_1

    .line 13
    .line 14
    iget-object v0, p0, Ll/xre;->i:Ll/p6g0;

    .line 15
    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    new-instance v0, Ll/p6g0;

    .line 19
    .line 20
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 21
    .line 22
    invoke-direct {v0, v1}, Ll/p6g0;-><init>(Ll/dum;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Ll/p6g0;

    .line 30
    .line 31
    iput-object v0, p0, Ll/xre;->i:Ll/p6g0;

    .line 32
    .line 33
    :cond_0
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 34
    .line 35
    check-cast v0, Ll/bse;

    .line 36
    .line 37
    iget-object v1, p0, Ll/xre;->i:Ll/p6g0;

    .line 38
    .line 39
    invoke-virtual {v0, v1, p1}, Ll/bse;->p(Ll/dse;Ll/sre;)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Ll/xre;->i:Ll/p6g0;

    .line 43
    .line 44
    iput-object p1, p0, Ll/xre;->k:Ll/dse;

    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    iget-object v0, p0, Ll/xre;->j:Ll/q6g0;

    .line 48
    .line 49
    if-nez v0, :cond_2

    .line 50
    .line 51
    new-instance v0, Ll/q6g0;

    .line 52
    .line 53
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 54
    .line 55
    invoke-direct {v0, v1}, Ll/q6g0;-><init>(Ll/dum;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    check-cast v0, Ll/q6g0;

    .line 63
    .line 64
    iput-object v0, p0, Ll/xre;->j:Ll/q6g0;

    .line 65
    .line 66
    :cond_2
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 67
    .line 68
    check-cast v0, Ll/bse;

    .line 69
    .line 70
    iget-object v1, p0, Ll/xre;->j:Ll/q6g0;

    .line 71
    .line 72
    invoke-virtual {v0, v1, p1}, Ll/bse;->p(Ll/dse;Ll/sre;)V

    .line 73
    .line 74
    .line 75
    iget-object p1, p0, Ll/xre;->j:Ll/q6g0;

    .line 76
    .line 77
    iput-object p1, p0, Ll/xre;->k:Ll/dse;

    .line 78
    .line 79
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->EffectsDanmakuEvent:Lcom/tantan/live/eventbus/LiveEventBus$EffectsDanmakuEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$EffectsDanmakuEvent;->showEffectsDanmakuDialog()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lrx/c;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/ure;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/ure;-><init>(Ll/xre;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->EffectsDanmakuEvent:Lcom/tantan/live/eventbus/LiveEventBus$EffectsDanmakuEvent;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$EffectsDanmakuEvent;->dismissEffectsDanmakuDialog()Ll/v3f$c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lrx/c;

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v1, Ll/vre;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/vre;-><init>(Ll/xre;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->EffectsDanmakuEvent:Lcom/tantan/live/eventbus/LiveEventBus$EffectsDanmakuEvent;

    .line 73
    .line 74
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$EffectsDanmakuEvent;->verticalTranslateDialogContent()Ll/v3f$d;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    check-cast v0, Lrx/c;

    .line 83
    .line 84
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 89
    .line 90
    check-cast p0, Ll/bse;

    .line 91
    .line 92
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    new-instance v1, Ll/wre;

    .line 96
    .line 97
    invoke-direct {v1, p0}, Ll/wre;-><init>(Ll/bse;)V

    .line 98
    .line 99
    .line 100
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 105
    .line 106
    .line 107
    return-void
.end method
