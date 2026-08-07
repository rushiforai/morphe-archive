.class public Ll/dxi;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/oo2;",
        "Ll/uwi;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/uwi;

    .line 5
    .line 6
    invoke-direct {p1}, Ll/uwi;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic J3(Ll/dxi;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dxi;->W3(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic K3(Ll/dxi;Lcom/p1/mobile/putong/live/base/data/BLiveFollowRatePopupV2;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/dxi;->U3(Lcom/p1/mobile/putong/live/base/data/BLiveFollowRatePopupV2;Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic L3(Ll/dxi;Lcom/p1/mobile/putong/data/Followship;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/dxi;->X3(Lcom/p1/mobile/putong/data/Followship;)V

    return-void
.end method

.method public static synthetic M3()V
    .locals 1

    .line 1
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->L4:I

    .line 2
    .line 3
    invoke-static {v0}, Ll/o1j0;->w(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic N3(Ll/dxi;Lcom/p1/mobile/putong/live/base/data/BLiveFollowRatePopupV2;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dxi;->V3(Lcom/p1/mobile/putong/live/base/data/BLiveFollowRatePopupV2;)V

    return-void
.end method

.method public static synthetic O3(Ll/dxi;Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dxi;->T3(Ljava/lang/Long;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic P3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method private synthetic X3(Lcom/p1/mobile/putong/data/Followship;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/uwi;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/uwi;->v()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public R3(Ljava/lang/String;Z)V
    .locals 4

    .line 1
    iget-object p2, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p2, Ll/uwi;

    .line 4
    .line 5
    invoke-virtual {p2}, Ll/uwi;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/cxi;

    .line 20
    .line 21
    invoke-direct {v1}, Ll/cxi;-><init>()V

    .line 22
    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    const-string v3, "live_popupwindow"

    .line 26
    .line 27
    invoke-virtual {p2, v2, v0, v3, v1}, Ll/oo2;->e0(ZLjava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    invoke-virtual {p0, p1}, Ll/dxi;->S3(Ljava/lang/String;)Ll/tfs;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-static {p2, p0}, Ll/afu;->c(Ljava/lang/String;Ll/tfs;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method public S3(Ljava/lang/String;)Ll/tfs;
    .locals 2

    .line 1
    invoke-static {}, Ll/tfs;->k()Ll/tfs$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "live_popupwindow"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/tfs$a;->e(Ljava/lang/String;)Ll/tfs$a;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0, p1}, Ll/tfs$a;->i(Ljava/lang/String;)Ll/tfs$a;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object v1, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p1, v1}, Ll/tfs$a;->d(Ljava/lang/String;)Ll/tfs$a;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v1, v0}, Ll/tfs$a;->h(Ljava/lang/String;)Ll/tfs$a;

    .line 34
    .line 35
    .line 36
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    if-eqz p0, :cond_1

    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {p1, v0}, Ll/tfs$a;->f(Ljava/lang/String;)Ll/tfs$a;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->state:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 53
    .line 54
    invoke-virtual {v0, p0}, Ll/tfs$a;->g(Lcom/p1/mobile/putong/live/base/data/BLiveState;)Ll/tfs$a;

    .line 55
    .line 56
    .line 57
    :cond_1
    invoke-virtual {p1}, Ll/tfs$a;->a()Ll/tfs;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    return-object p0
.end method

.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->FollowDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$FollowDialogEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$FollowDialogEvent;->show()Ll/v3f$d;

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
    new-instance v1, Ll/wwi;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/wwi;-><init>(Ll/dxi;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final synthetic T3(Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/oo2;->R0()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    xor-int/lit8 p0, p0, 0x1

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic U3(Lcom/p1/mobile/putong/live/base/data/BLiveFollowRatePopupV2;Ljava/lang/Long;)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/uwi;

    .line 4
    .line 5
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRatePopupV2;->tickerTime:I

    .line 6
    .line 7
    int-to-long v0, p1

    .line 8
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    .line 9
    .line 10
    .line 11
    move-result-wide p1

    .line 12
    sub-long/2addr v0, p1

    .line 13
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, p1}, Ll/uwi;->s(Ljava/lang/Long;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic V3(Lcom/p1/mobile/putong/live/base/data/BLiveFollowRatePopupV2;)V
    .locals 1

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRatePopupV2;->text:Ljava/lang/String;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, p1, v0}, Ll/dxi;->R3(Ljava/lang/String;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic W3(Ljava/lang/Long;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/uwi;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/uwi;->i()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public Y3(Lcom/p1/mobile/putong/live/base/data/BLiveFollowRatePopupV2;)V
    .locals 4

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->K2()Ll/t8s;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->SIGN_IN:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 8
    .line 9
    filled-new-array {v1}, [Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/t8s;->l([Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/xzs;->K2()Ll/t8s;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ll/t8s;->g()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    goto/16 :goto_0

    .line 30
    .line 31
    :cond_0
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 32
    .line 33
    check-cast v0, Ll/uwi;

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v1}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v0, v1, p1}, Ll/uwi;->q(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/live/base/data/BLiveFollowRatePopupV2;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRatePopupV2;->text:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {p0, v1}, Ll/dxi;->S3(Ljava/lang/String;)Ll/tfs;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-static {v0, v1}, Ll/afu;->d(Ljava/lang/String;Ll/tfs;)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRatePopupV2;->type:Ljava/lang/String;

    .line 60
    .line 61
    const-string v1, "ticker"

    .line 62
    .line 63
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 68
    .line 69
    if-eqz v0, :cond_1

    .line 70
    .line 71
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {v0, v1}, Ll/oo2;->k2(Ljava/util/concurrent/TimeUnit;)Lrx/c;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {p0, v0}, Ll/i6t;->H3(Lrx/c;)Lrx/c;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    new-instance v1, Ll/xwi;

    .line 84
    .line 85
    invoke-direct {v1, p0}, Ll/xwi;-><init>(Ll/dxi;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRatePopupV2;->tickerTime:I

    .line 93
    .line 94
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    new-instance v1, Ll/ywi;

    .line 99
    .line 100
    invoke-direct {v1, p0, p1}, Ll/ywi;-><init>(Ll/dxi;Lcom/p1/mobile/putong/live/base/data/BLiveFollowRatePopupV2;)V

    .line 101
    .line 102
    .line 103
    new-instance v2, Ll/zwi;

    .line 104
    .line 105
    invoke-direct {v2}, Ll/zwi;-><init>()V

    .line 106
    .line 107
    .line 108
    new-instance v3, Ll/axi;

    .line 109
    .line 110
    invoke-direct {v3, p0, p1}, Ll/axi;-><init>(Ll/dxi;Lcom/p1/mobile/putong/live/base/data/BLiveFollowRatePopupV2;)V

    .line 111
    .line 112
    .line 113
    invoke-static {v1, v2, v3}, Ll/dhw;->f(Ll/y20;Ll/y20;Ll/x20;)Ll/t9t;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 118
    .line 119
    .line 120
    return-void

    .line 121
    :cond_1
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRatePopupV2;->showDuration:I

    .line 122
    .line 123
    if-lez v0, :cond_2

    .line 124
    .line 125
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRatePopupV2;->showDuration:I

    .line 130
    .line 131
    invoke-virtual {v0, p1, v1}, Ll/oo2;->h2(ILjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    invoke-virtual {p0, p1}, Ll/i6t;->H3(Lrx/c;)Lrx/c;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    const/4 v0, 0x1

    .line 140
    invoke-virtual {p1, v0}, Lrx/c;->take(I)Lrx/c;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    new-instance v0, Ll/bxi;

    .line 145
    .line 146
    invoke-direct {v0, p0}, Ll/bxi;-><init>(Ll/dxi;)V

    .line 147
    .line 148
    .line 149
    invoke-static {v0}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 154
    .line 155
    .line 156
    :cond_2
    :goto_0
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/oo2;->t0()Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ll/vwi;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/vwi;-><init>(Ll/dxi;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    return-void
.end method
