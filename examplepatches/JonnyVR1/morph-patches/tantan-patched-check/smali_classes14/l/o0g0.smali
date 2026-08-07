.class public Ll/o0g0;
.super Ll/dvs;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/dvs<",
        "Ll/s0g0;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/ner;Ll/nus;Ll/s0g0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/dvs;-><init>(Ll/ner;Ll/nus;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p3}, Ll/l6t;->C(Ll/iam;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    instance-of p1, p1, Lcom/p1/mobile/putong/app/PutongAct;

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->setTransparentStatusBar()V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public static synthetic P2(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    sget-object p0, Ll/tbs;->b:Ll/vwt;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/vwt;->d7()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic Q2(Ll/o0g0;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/o0g0;->V2(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic R2(Ll/o0g0;Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/o0g0;->W2(Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;)V

    return-void
.end method

.method public static synthetic S2(Lcom/p1/mobile/putong/live/base/data/BLiveSettings;)Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveSkinConfig:Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic T2(Ll/o0g0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/o0g0;->X2(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic U2(Lcom/p1/mobile/putong/live/base/data/BLiveSettings;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveSkinConfig:Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method


# virtual methods
.method public M2()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/mus;->M2()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/t4u;->i()Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-virtual {p0, v0, v1}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v0, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v2, Ll/i0g0;

    .line 22
    .line 23
    invoke-direct {v2}, Ll/i0g0;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v2, Ll/j0g0;

    .line 31
    .line 32
    invoke-direct {v2, p0}, Ll/j0g0;-><init>(Ll/o0g0;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v2}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 40
    .line 41
    .line 42
    sget-object v0, Ll/tbs;->b:Ll/vwt;

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ll/mof0;->l(Z)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {p0, v0, v1}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    new-instance v1, Ll/k0g0;

    .line 53
    .line 54
    invoke-direct {v1}, Ll/k0g0;-><init>()V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    new-instance v1, Ll/l0g0;

    .line 62
    .line 63
    invoke-direct {v1}, Ll/l0g0;-><init>()V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    new-instance v1, Ll/m0g0;

    .line 75
    .line 76
    invoke-direct {v1, p0}, Ll/m0g0;-><init>(Ll/o0g0;)V

    .line 77
    .line 78
    .line 79
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0}, Ll/mus;->F2()Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    iget-object v0, v0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->LiveHomePageEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomePageEvent;

    .line 91
    .line 92
    invoke-virtual {v0}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomePageEvent;->tabSelected()Ll/v3f$d;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    check-cast v0, Lrx/c;

    .line 101
    .line 102
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    new-instance v1, Ll/n0g0;

    .line 107
    .line 108
    invoke-direct {v1, p0}, Ll/n0g0;-><init>(Ll/o0g0;)V

    .line 109
    .line 110
    .line 111
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 116
    .line 117
    .line 118
    return-void
.end method

.method public final synthetic V2(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/s0g0;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0, p1}, Ll/s0g0;->k(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic W2(Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/s0g0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/s0g0;->n(Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic X2(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/s0g0;

    .line 4
    .line 5
    const-string v0, "fakeLiveSquare"

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-virtual {p0, p1}, Ll/s0g0;->l(Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
