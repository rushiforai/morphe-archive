.class public abstract Ll/xl2;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/xl2$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/oo2;",
        "Ll/il2;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Z

.field public j:Ll/vxd0;

.field public k:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;",
            ">;"
        }
    .end annotation
.end field

.field public l:Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;

.field public m:Ll/uoe0;

.field public n:Lcom/p1/mobile/putong/live/base/data/BLiveData;

.field public o:I

.field public p:Ljava/lang/String;

.field public q:Ljava/lang/String;

.field public r:Ll/kcg0;


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Ll/xl2;->i:Z

    .line 6
    .line 7
    new-instance p1, Ll/vxd0;

    .line 8
    .line 9
    const-string v0, "live_ttb_recent_recharge_num"

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-direct {p1, v0, v1}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Ll/xl2;->j:Ll/vxd0;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/xl2;->u4()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic J3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic K3(Ll/xl2;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/xl2;->e4(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic L3(Ll/xl2;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xl2;->f4(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic M3(Ll/xl2;Ll/uoe0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xl2;->j4(Ll/uoe0;)V

    return-void
.end method

.method public static synthetic N3(Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;->isCustomRecharge:Z

    .line 2
    .line 3
    xor-int/lit8 p0, p0, 0x1

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic O3(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 2
    .line 3
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ob:I

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic P3(Ll/xl2;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/xl2;->g4(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic R3(Ll/xl2;ILcom/p1/mobile/putong/live/base/data/BLiveCoin;)Lcom/p1/mobile/putong/live/base/data/BLiveCoin;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/xl2;->h4(ILcom/p1/mobile/putong/live/base/data/BLiveCoin;)Lcom/p1/mobile/putong/live/base/data/BLiveCoin;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic S3(Lcom/p1/mobile/putong/live/base/data/BLiveCoin;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic T3(Ll/xl2;Ll/uoe0;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/xl2;->i4(Ll/uoe0;I)V

    return-void
.end method

.method private synthetic e4(Ljava/lang/Long;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/il2;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/il2;->X(Ljava/lang/Long;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic g4(Ll/vxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/il2;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/il2;->v()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public A4(Ll/bkg;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xl2;->a4()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p1, p1, Ll/bkg;->c:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-static {p1, v1}, Ll/gpc0;->b(Ljava/lang/String;Z)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Ll/xl2;->q:Ljava/lang/String;

    .line 16
    .line 17
    iget-boolean p0, p0, Ll/xl2;->i:Z

    .line 18
    .line 19
    invoke-static {p1, v0, p0, p2}, Ll/gpc0;->i(Ljava/lang/String;Ljava/util/List;ZLjava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public T()V
    .locals 4

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/htd0;->c:Ll/htd0;

    .line 5
    .line 6
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Ll/hiv;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/hiv;->h()Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/ll2;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/ll2;-><init>(Ll/xl2;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Ll/xl2;->W3()Lrx/c;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Ll/xl2;->W3()Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {p0}, Ll/xl2;->X3()Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {p0}, Ll/xl2;->Y3()Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    new-instance v3, Ll/ol2;

    .line 48
    .line 49
    invoke-direct {v3, p0}, Ll/ol2;-><init>(Ll/xl2;)V

    .line 50
    .line 51
    .line 52
    invoke-static {v0, v1, v2, v3}, Lrx/c;->zip(Lrx/c;Lrx/c;Lrx/c;Ll/scj;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    const/4 v1, 0x1

    .line 69
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    new-instance v1, Ll/pl2;

    .line 74
    .line 75
    invoke-direct {v1, p0}, Ll/pl2;-><init>(Ll/xl2;)V

    .line 76
    .line 77
    .line 78
    new-instance v2, Ll/ql2;

    .line 79
    .line 80
    invoke-direct {v2}, Ll/ql2;-><init>()V

    .line 81
    .line 82
    .line 83
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 88
    .line 89
    .line 90
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->FastRechargeEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$FastRechargeEventGroup;

    .line 95
    .line 96
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$FastRechargeEventGroup;->showFastRechargeDialog()Ll/v3f$d;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    check-cast v0, Lrx/c;

    .line 105
    .line 106
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    new-instance v1, Ll/rl2;

    .line 115
    .line 116
    invoke-direct {v1, p0}, Ll/rl2;-><init>(Ll/xl2;)V

    .line 117
    .line 118
    .line 119
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 124
    .line 125
    .line 126
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->FastRechargeEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$FastRechargeEventGroup;

    .line 131
    .line 132
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$FastRechargeEventGroup;->closeFastRechargeDialog()Ll/v3f$c;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    check-cast v0, Lrx/c;

    .line 141
    .line 142
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    new-instance v1, Ll/sl2;

    .line 151
    .line 152
    invoke-direct {v1, p0}, Ll/sl2;-><init>(Ll/xl2;)V

    .line 153
    .line 154
    .line 155
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 160
    .line 161
    .line 162
    return-void
.end method

.method public U3(Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;Lcom/p1/mobile/putong/live/base/data/BLiveData;)Ljava/util/List;
    .locals 0
    .param p3    # Lcom/p1/mobile/putong/live/base/data/BLiveData;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;",
            ">;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveData;",
            ")",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iput-object p1, p0, Ll/xl2;->k:Ljava/util/List;

    .line 2
    .line 3
    iput-object p3, p0, Ll/xl2;->n:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 4
    .line 5
    iput-object p2, p0, Ll/xl2;->l:Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;

    .line 6
    .line 7
    new-instance p2, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {p2, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p2}, Ll/xl2;->V3(Ljava/util/List;)Ljava/util/List;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public abstract V3(Ljava/util/List;)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;",
            ">;"
        }
    .end annotation
.end method

.method public abstract W3()Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;",
            ">;>;"
        }
    .end annotation
.end method

.method public abstract X3()Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;",
            ">;"
        }
    .end annotation
.end method

.method public abstract Y3()Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveData;",
            ">;"
        }
    .end annotation
.end method

.method public final Z3(D)D
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmpl-double v0, p1, v0

    .line 4
    .line 5
    iget-object v1, p0, Ll/xl2;->j:Ll/vxd0;

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ljava/lang/Integer;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_0
    iget-object p0, p0, Ll/xl2;->j:Ll/vxd0;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    check-cast p0, Ljava/lang/Integer;

    .line 29
    .line 30
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    :goto_0
    int-to-double p0, p0

    .line 35
    return-wide p0

    .line 36
    :cond_1
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Ljava/lang/Integer;

    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    int-to-double v0, v0

    .line 47
    cmpg-double v0, p1, v0

    .line 48
    .line 49
    if-gez v0, :cond_2

    .line 50
    .line 51
    iget-object p0, p0, Ll/xl2;->j:Ll/vxd0;

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    check-cast p0, Ljava/lang/Integer;

    .line 58
    .line 59
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    goto :goto_0

    .line 64
    :cond_2
    :goto_1
    return-wide p1
.end method

.method public a4()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/xl2;->k:Ljava/util/List;

    .line 2
    .line 3
    new-instance v0, Ll/nl2;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/nl2;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public b4()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xl2;->n:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->firstChargeCampaigns:Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;->isCoinRecharged:Z

    .line 10
    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public final c4()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0

    .line 22
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 23
    return p0
.end method

.method public d4()Z
    .locals 1

    .line 1
    iget p0, p0, Ll/xl2;->o:I

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public final synthetic f4(Ljava/util/List;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/il2;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/il2;->V(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic h4(ILcom/p1/mobile/putong/live/base/data/BLiveCoin;)Lcom/p1/mobile/putong/live/base/data/BLiveCoin;
    .locals 3

    .line 1
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 2
    .line 3
    invoke-static {}, Ll/u8n;->a()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->c2:I

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->b2:I

    .line 13
    .line 14
    :goto_0
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Ll/xl2;->j:Ll/vxd0;

    .line 30
    .line 31
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p0, p1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    return-object p2
.end method

.method public final synthetic i4(Ll/uoe0;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/xl2;->w4(Ll/uoe0;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic j4(Ll/uoe0;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/uoe0;->k()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-object v0, p1, Ll/uoe0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 9
    .line 10
    :cond_0
    invoke-virtual {p0, p1}, Ll/xl2;->s4(Ll/uoe0;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const/4 v0, 0x1

    .line 18
    invoke-static {p1, p0, v0}, Ll/gpc0;->d(Ll/uoe0;Ljava/lang/String;Z)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public k4(IZLl/uoe0;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/aiv;->k1()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/tl2;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ll/tl2;-><init>(Ll/xl2;I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/ul2;

    .line 15
    .line 16
    invoke-direct {v1}, Ll/ul2;-><init>()V

    .line 17
    .line 18
    .line 19
    new-instance v2, Ll/vl2;

    .line 20
    .line 21
    invoke-direct {v2}, Ll/vl2;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iput-object v0, p0, Ll/xl2;->r:Ll/kcg0;

    .line 33
    .line 34
    if-eqz p2, :cond_0

    .line 35
    .line 36
    new-instance p2, Ll/wl2;

    .line 37
    .line 38
    invoke-direct {p2, p0, p3, p1}, Ll/wl2;-><init>(Ll/xl2;Ll/uoe0;I)V

    .line 39
    .line 40
    .line 41
    invoke-static {p2}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method

.method public abstract l4(Ll/xl2$b;)V
.end method

.method public m4()V
    .locals 0

    .line 1
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/xl2;->r:Ll/kcg0;

    .line 5
    .line 6
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public n4()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xl2;->m4()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast v0, Ll/il2;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/il2;->U()V

    .line 9
    .line 10
    .line 11
    iget-boolean v0, p0, Ll/xl2;->i:Z

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast p0, Ll/il2;

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    invoke-virtual {p0, v0}, Ll/il2;->y(Z)V

    .line 21
    .line 22
    .line 23
    :cond_0
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->oe:I

    .line 24
    .line 25
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public o4(IZ)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xl2;->p4()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/xl2;->o:I

    .line 5
    .line 6
    const/4 v1, 0x2

    .line 7
    const/4 v2, 0x1

    .line 8
    if-eq v0, v2, :cond_1

    .line 9
    .line 10
    if-ne v0, v1, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-static {}, Ll/aiv;->k1()Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-static {}, Ll/dhw;->c()Ll/t9t;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 22
    .line 23
    .line 24
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->qe:I

    .line 25
    .line 26
    invoke-static {p1}, Ll/o1j0;->w(I)V

    .line 27
    .line 28
    .line 29
    goto :goto_2

    .line 30
    :cond_1
    :goto_0
    if-eqz p2, :cond_2

    .line 31
    .line 32
    if-ne v0, v1, :cond_2

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_2
    const/4 v2, 0x0

    .line 36
    :goto_1
    iget-object p2, p0, Ll/xl2;->m:Ll/uoe0;

    .line 37
    .line 38
    invoke-virtual {p0, p1, v2, p2}, Ll/xl2;->k4(IZLl/uoe0;)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 42
    .line 43
    check-cast p1, Ll/il2;

    .line 44
    .line 45
    invoke-virtual {p1}, Ll/il2;->v()V

    .line 46
    .line 47
    .line 48
    :goto_2
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 53
    .line 54
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->hideFirstRecharge()Ll/v3f$c;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {p1}, Ll/v3f$c;->p()V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0}, Ll/xl2;->r4()V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public p4()V
    .locals 0

    .line 1
    return-void
.end method

.method public q4()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/xl2;->k:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/xl2;->l:Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v1, p0, Ll/xl2;->k:Ljava/util/List;

    .line 15
    .line 16
    iget-object v2, p0, Ll/xl2;->n:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 17
    .line 18
    invoke-virtual {p0, v1, v0, v2}, Ll/xl2;->U3(Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;Lcom/p1/mobile/putong/live/base/data/BLiveData;)Ljava/util/List;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 23
    .line 24
    check-cast p0, Ll/il2;

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Ll/il2;->V(Ljava/util/List;)V

    .line 27
    .line 28
    .line 29
    :cond_1
    :goto_0
    return-void
.end method

.method public final r4()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/xl2;->k:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/xl2;->l:Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/xl2;->b4()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Ll/xl2;->n:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 20
    .line 21
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->firstChargeCampaigns:Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;

    .line 22
    .line 23
    if-nez v1, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 v2, 0x1

    .line 27
    iput-boolean v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;->isCoinRecharged:Z

    .line 28
    .line 29
    iget-object v1, p0, Ll/xl2;->k:Ljava/util/List;

    .line 30
    .line 31
    iget-object v2, p0, Ll/xl2;->l:Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;

    .line 32
    .line 33
    invoke-virtual {p0, v1, v2, v0}, Ll/xl2;->U3(Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;Lcom/p1/mobile/putong/live/base/data/BLiveData;)Ljava/util/List;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 38
    .line 39
    check-cast p0, Ll/il2;

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Ll/il2;->V(Ljava/util/List;)V

    .line 42
    .line 43
    .line 44
    :cond_1
    :goto_0
    return-void
.end method

.method public final s4(Ll/uoe0;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->SendGiftEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$SendGiftEventGroup;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$SendGiftEventGroup;->sendGift()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v0, Ll/hne0$a;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/hne0$a;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ll/hne0$a;->y(Ll/uoe0;)Ll/hne0;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public t4(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/xl2;->i:Z

    .line 2
    .line 3
    return-void
.end method

.method public abstract u4()V
.end method

.method public abstract v4(Ll/bkg;)V
.end method

.method public final w4(Ll/uoe0;I)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    iget-object v1, p1, Ll/uoe0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 11
    .line 12
    if-nez v1, :cond_1

    .line 13
    .line 14
    goto :goto_1

    .line 15
    :cond_1
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sget-object v2, Ll/zrv;->e:Landroid/app/Application;

    .line 20
    .line 21
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->n5:I

    .line 22
    .line 23
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/app/Dialog$e;->G0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    sget-object v2, Ll/zrv;->e:Landroid/app/Application;

    .line 32
    .line 33
    invoke-static {}, Ll/u8n;->a()Z

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    if-eqz v3, :cond_2

    .line 38
    .line 39
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->Qb:I

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_2
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->Pb:I

    .line 43
    .line 44
    :goto_0
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->localName:Lcom/p1/mobile/putong/data/LangModel;

    .line 49
    .line 50
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/LangModel;->getLocalName()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    filled-new-array {p2, v1}, [Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    invoke-virtual {v2, v3, p2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    invoke-virtual {v0, p2}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 67
    .line 68
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->m5:I

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    new-instance v1, Ll/ml2;

    .line 75
    .line 76
    invoke-direct {v1, p0, p1}, Ll/ml2;-><init>(Ll/xl2;Ll/uoe0;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p2, v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->v0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 80
    .line 81
    .line 82
    move-result-object p2

    .line 83
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 84
    .line 85
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->e5:I

    .line 86
    .line 87
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    new-instance v1, Ll/xl2$a;

    .line 92
    .line 93
    invoke-direct {v1, p0, p1}, Ll/xl2$a;-><init>(Ll/xl2;Ll/uoe0;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p2, v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->n0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 97
    .line 98
    .line 99
    move-result-object p2

    .line 100
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 101
    .line 102
    .line 103
    move-result-object p2

    .line 104
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    invoke-static {p1, p0}, Ll/gpc0;->e(Ll/uoe0;Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    :cond_3
    :goto_1
    return-void
.end method

.method public x4(Ll/bkg;)V
    .locals 6

    .line 1
    iget v0, p1, Ll/bkg;->a:I

    .line 2
    .line 3
    iget-object v1, p1, Ll/bkg;->b:Ll/uoe0;

    .line 4
    .line 5
    iget-object v2, p1, Ll/bkg;->c:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {}, Ll/aiv;->k1()Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    invoke-static {}, Ll/dhw;->c()Ll/t9t;

    .line 12
    .line 13
    .line 14
    move-result-object v4

    .line 15
    invoke-virtual {v3, v4}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Ll/xl2;->m:Ll/uoe0;

    .line 19
    .line 20
    iput v0, p0, Ll/xl2;->o:I

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    invoke-static {v2, v0}, Ll/gpc0;->b(Ljava/lang/String;Z)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iput-object v0, p0, Ll/xl2;->p:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {p1}, Ll/bkg;->a()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-nez v0, :cond_0

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/xzs;->K2()Ll/t8s;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    sget-object v2, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->WEBVIEW:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 43
    .line 44
    invoke-virtual {v0, v2}, Ll/t8s;->m(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;)Z

    .line 45
    .line 46
    .line 47
    :cond_0
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 48
    .line 49
    check-cast v0, Ll/il2;

    .line 50
    .line 51
    if-eqz v1, :cond_2

    .line 52
    .line 53
    iget-object v2, v1, Ll/uoe0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 54
    .line 55
    if-nez v2, :cond_1

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_1
    iget-wide v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->purchasePrice:J

    .line 59
    .line 60
    iget v1, v1, Ll/uoe0;->f:I

    .line 61
    .line 62
    int-to-long v4, v1

    .line 63
    mul-long/2addr v2, v4

    .line 64
    long-to-double v1, v2

    .line 65
    goto :goto_1

    .line 66
    :cond_2
    :goto_0
    const-wide/16 v1, 0x0

    .line 67
    .line 68
    :goto_1
    invoke-virtual {p0, v1, v2}, Ll/xl2;->Z3(D)D

    .line 69
    .line 70
    .line 71
    move-result-wide v1

    .line 72
    invoke-virtual {v0, v1, v2, p1}, Ll/il2;->Z(DLl/bkg;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public y4()V
    .locals 3

    .line 1
    new-instance v0, Ll/csj;

    .line 2
    .line 3
    const/16 v1, 0x2bc

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/csj;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Ll/wpj;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/xl2;->c4()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    if-nez v0, :cond_1

    .line 22
    .line 23
    invoke-static {}, Ll/awr;->f()V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->openGiftDialogEvent()Ll/v3f$d;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    new-instance v1, Ll/lx50;

    .line 38
    .line 39
    invoke-direct {v1}, Ll/lx50;-><init>()V

    .line 40
    .line 41
    .line 42
    const/16 v2, 0x384

    .line 43
    .line 44
    invoke-virtual {v1, v2}, Ll/lx50;->i(I)Ll/lx50;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v0}, Ll/wpj;->a()Ll/cqj;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-virtual {v1, v2}, Ll/lx50;->h(Ll/cqj;)Ll/lx50;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v0}, Ll/wpj;->b()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {v1, v0}, Ll/lx50;->j(Ljava/lang/String;)Ll/lx50;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public abstract z4()Z
.end method
