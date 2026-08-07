.class public abstract Ll/acg;
.super Ll/tk2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/tk2<",
        "Ll/f8g;",
        ">;"
    }
.end annotation


# instance fields
.field public final j:Ll/x7g;


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/tk2;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Ll/oo2;->B:Ll/x7g;

    .line 9
    .line 10
    iput-object v0, p0, Ll/acg;->j:Ll/x7g;

    .line 11
    .line 12
    new-instance v0, Ll/f8g;

    .line 13
    .line 14
    iget-object p1, p1, Ll/dum;->a:Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    invoke-direct {v0, p1, p0}, Ll/f8g;-><init>(Lcom/p1/mobile/android/app/Act;Ll/acg;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v0}, Ll/l6t;->C(Ll/iam;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method private synthetic A4(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/f8g;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/f8g;->L()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic i4(Ll/acg;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/acg;->u4(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic j4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic k4(Ll/acg;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/acg;->y4(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic l4(Ll/acg;Ll/v9g;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/acg;->w4(Ll/v9g;)V

    return-void
.end method

.method public static synthetic m4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic n4(Ll/acg;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/acg;->v4()V

    return-void
.end method

.method public static synthetic o4(Ll/acg;Ll/yhg;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/acg;->z4(Ll/yhg;)V

    return-void
.end method

.method public static synthetic p4(Ll/acg;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/acg;->x4()V

    return-void
.end method

.method public static synthetic q4(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
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

.method public static synthetic r4(Ll/acg;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/acg;->A4(Ljava/lang/Boolean;)V

    return-void
.end method

.method private synthetic y4(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/acg;->s4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public B4()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/oo2;->h0()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/y8s;->N3(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/pbg;

    .line 14
    .line 15
    invoke-direct {v1}, Ll/pbg;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/rbg;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/rbg;-><init>(Ll/acg;)V

    .line 25
    .line 26
    .line 27
    new-instance v2, Ll/sbg;

    .line 28
    .line 29
    invoke-direct {v2}, Ll/sbg;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/acg;->j:Ll/x7g;

    .line 40
    .line 41
    invoke-virtual {v0}, Ll/x7g;->S()Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {p0, v0}, Ll/y8s;->N3(Lrx/c;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    new-instance v1, Ll/tbg;

    .line 50
    .line 51
    invoke-direct {v1, p0}, Ll/tbg;-><init>(Ll/acg;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0, v1}, Lrx/c;->doOnSubscribe(Ll/x20;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    new-instance v1, Ll/ubg;

    .line 59
    .line 60
    invoke-direct {v1, p0}, Ll/ubg;-><init>(Ll/acg;)V

    .line 61
    .line 62
    .line 63
    new-instance p0, Ll/vbg;

    .line 64
    .line 65
    invoke-direct {p0}, Ll/vbg;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public C4()V
    .locals 0

    .line 1
    return-void
.end method

.method public D4(Ljava/lang/Boolean;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/acg;->t4()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->FansClubEntryEvent:Lcom/tantan/live/eventbus/LiveEventBus$FansClubEntryEvent;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$FansClubEntryEvent;->openEntry()Ll/v3f$d;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    return p0

    .line 30
    :cond_1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 31
    .line 32
    check-cast p0, Ll/f8g;

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->E()V

    .line 35
    .line 36
    .line 37
    const/4 p0, 0x1

    .line 38
    return p0
.end method

.method public E4()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/f8g;

    .line 4
    .line 5
    iget-object v0, v0, Ll/f8g;->m:Landroid/widget/LinearLayout;

    .line 6
    .line 7
    new-instance v1, Ll/qbg;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Ll/qbg;-><init>(Ll/acg;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public F4()V
    .locals 0

    .line 1
    return-void
.end method

.method public O3()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/y8s;->O3()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p0, Ll/f8g;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/f8g;->w()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public P3()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/y8s;->P3()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/acg;->B4()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/acg;->j:Ll/x7g;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/x7g;->Y()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public s4()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/f8g;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->q(Ll/x20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public t()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/acg;->j:Ll/x7g;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {v2}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0, v1, p0, v2}, Ll/x7g;->D(ZLl/ner;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-super {p0}, Ll/l6t;->t()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->FansClubEvent:Lcom/tantan/live/eventbus/LiveEventBus$FansClubEvent;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$FansClubEvent;->showFansClubDialog()Ll/v3f$d;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lrx/c;

    .line 38
    .line 39
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    new-instance v1, Ll/wbg;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Ll/wbg;-><init>(Ll/acg;)V

    .line 46
    .line 47
    .line 48
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->FansClubEvent:Lcom/tantan/live/eventbus/LiveEventBus$FansClubEvent;

    .line 60
    .line 61
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$FansClubEvent;->hideFansClubDialog()Ll/v3f$c;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    check-cast v0, Lrx/c;

    .line 70
    .line 71
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    new-instance v1, Ll/xbg;

    .line 76
    .line 77
    invoke-direct {v1, p0}, Ll/xbg;-><init>(Ll/acg;)V

    .line 78
    .line 79
    .line 80
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->FansRecallEvent:Lcom/tantan/live/eventbus/LiveEventBus$FansRecallEvent;

    .line 92
    .line 93
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$FansRecallEvent;->showFansRecallSelectPanel()Ll/v3f$d;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    check-cast v0, Lrx/c;

    .line 102
    .line 103
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    new-instance v1, Ll/ybg;

    .line 108
    .line 109
    invoke-direct {v1, p0}, Ll/ybg;-><init>(Ll/acg;)V

    .line 110
    .line 111
    .line 112
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 117
    .line 118
    .line 119
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->FansRecallEvent:Lcom/tantan/live/eventbus/LiveEventBus$FansRecallEvent;

    .line 124
    .line 125
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$FansRecallEvent;->hideFansRecallSelectPanel()Ll/v3f$d;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    check-cast v0, Lrx/c;

    .line 134
    .line 135
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    new-instance v1, Ll/zbg;

    .line 140
    .line 141
    invoke-direct {v1, p0}, Ll/zbg;-><init>(Ll/acg;)V

    .line 142
    .line 143
    .line 144
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 149
    .line 150
    .line 151
    return-void
.end method

.method public final t4()Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 10
    .line 11
    iget-object v0, v0, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 12
    .line 13
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v2}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    if-eqz v2, :cond_1

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v2}, Ll/oo2;->r0()Ll/v5g;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    if-eqz v2, :cond_1

    .line 36
    .line 37
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p0}, Ll/oo2;->r0()Ll/v5g;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p0, v0}, Ll/v5g;->c(Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    if-eqz p0, :cond_1

    .line 50
    .line 51
    return v1

    .line 52
    :cond_1
    const/4 p0, 0x0

    .line 53
    return p0
.end method

.method public final synthetic u4(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/f8g;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/f8g;->T(Lcom/p1/mobile/putong/data/User;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic v4()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/f8g;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {v0, v1}, Ll/f8g;->M(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 13
    .line 14
    check-cast v0, Ll/f8g;

    .line 15
    .line 16
    iget-object v0, v0, Ll/f8g;->n:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubAnchorProfileView;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubAnchorProfileView;->l0(Z)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 23
    .line 24
    check-cast p0, Ll/f8g;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/f8g;->Q()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final synthetic w4(Ll/v9g;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/f8g;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/f8g;->R(Ll/v9g;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic x4()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/f8g;

    .line 4
    .line 5
    iget-object v0, v0, Ll/f8g;->m:Landroid/widget/LinearLayout;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/high16 v1, 0x41a00000    # 20.0f

    .line 12
    .line 13
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    add-int/2addr v0, v1

    .line 18
    invoke-static {p0, v0}, Ll/seg;->f(Ll/i6t;I)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic z4(Ll/yhg;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/f8g;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/f8g;->S(Ll/yhg;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
