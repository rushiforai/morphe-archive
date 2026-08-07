.class public Ll/rz3;
.super Ll/i6t;
.source "SourceFile"

# interfaces
.implements Ll/c6m;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/dw40;",
        "Ll/c44;",
        ">;",
        "Ll/c6m;"
    }
.end annotation


# instance fields
.field public final i:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetView;

.field public final j:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/LiveCallView;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetView;Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/LiveCallView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/rz3;->i:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetView;

    .line 5
    .line 6
    iput-object p3, p0, Ll/rz3;->j:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/LiveCallView;

    .line 7
    .line 8
    new-instance p1, Ll/c44;

    .line 9
    .line 10
    invoke-direct {p1}, Ll/c44;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic J3(Ll/rz3;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rz3;->Y3(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic K3(Ll/rz3;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rz3;->T3(Z)V

    return-void
.end method

.method public static synthetic L3(Ll/rz3;Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rz3;->Z3(Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;)V

    return-void
.end method

.method public static synthetic M3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->J9:I

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic N3(Lcom/p1/mobile/putong/live/base/data/BLive;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "obs"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic O3(Ljava/lang/Integer;Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic P3(Ll/rz3;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/rz3;->V3(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic R3(Ll/rz3;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rz3;->W3(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic S3(Ll/rz3;Lcom/p1/mobile/putong/live/base/data/BLive;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rz3;->X3(Lcom/p1/mobile/putong/live/base/data/BLive;)V

    return-void
.end method

.method private synthetic V3(Ll/vxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/c44;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/c44;->l()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast v0, Ll/c44;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/c44;->r()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->CallEvent:Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;->anchorCallManageDialog()Ll/v3f$c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lrx/c;

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/iz3;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/iz3;-><init>(Ll/rz3;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->CallEvent:Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;

    .line 48
    .line 49
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;->updateCallNum()Ll/v3f$d;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    check-cast v0, Lrx/c;

    .line 58
    .line 59
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    new-instance v1, Ll/jz3;

    .line 64
    .line 65
    invoke-direct {v1, p0}, Ll/jz3;-><init>(Ll/rz3;)V

    .line 66
    .line 67
    .line 68
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->CallEvent:Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;

    .line 80
    .line 81
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;->anchorCall()Ll/v3f$d;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    check-cast v0, Lrx/c;

    .line 90
    .line 91
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    new-instance v1, Ll/kz3;

    .line 96
    .line 97
    invoke-direct {v1, p0}, Ll/kz3;-><init>(Ll/rz3;)V

    .line 98
    .line 99
    .line 100
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 105
    .line 106
    .line 107
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    check-cast v0, Ll/dw40;

    .line 112
    .line 113
    invoke-virtual {v0}, Ll/dw40;->A2()Ll/ew40;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-virtual {v0}, Ll/ew40;->d()Lrx/c;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    new-instance v1, Ll/lz3;

    .line 126
    .line 127
    invoke-direct {v1}, Ll/lz3;-><init>()V

    .line 128
    .line 129
    .line 130
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    new-instance v1, Ll/mz3;

    .line 135
    .line 136
    invoke-direct {v1, p0}, Ll/mz3;-><init>(Ll/rz3;)V

    .line 137
    .line 138
    .line 139
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 144
    .line 145
    .line 146
    return-void
.end method

.method public final T3(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    invoke-virtual {p0, p1}, Ll/rz3;->b4(Z)V

    .line 5
    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const/4 p1, 0x0

    .line 9
    invoke-virtual {p0, p1}, Ll/rz3;->b4(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public U3(Z)V
    .locals 2

    .line 1
    if-nez p1, :cond_1

    .line 2
    .line 3
    new-instance p1, Ll/b45;

    .line 4
    .line 5
    const/16 v0, 0x1130

    .line 6
    .line 7
    invoke-direct {p1, v0}, Ll/b45;-><init>(I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Ljava/lang/Boolean;

    .line 15
    .line 16
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    new-instance p1, Ll/th0$a;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-direct {p1, v0}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->f2:I

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {p1, v0}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->g2:I

    .line 44
    .line 45
    invoke-virtual {p1, v0}, Ll/th0$a;->i(I)Ll/th0$a;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    sget v0, Ll/n9c0;->p0:I

    .line 50
    .line 51
    invoke-virtual {p1, v0}, Ll/th0$a;->p(I)Ll/th0$a;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->u2:I

    .line 56
    .line 57
    invoke-virtual {p1, v0}, Ll/th0$a;->q(I)Ll/th0$a;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    new-instance v0, Ll/nz3;

    .line 62
    .line 63
    invoke-direct {v0, p0}, Ll/nz3;-><init>(Ll/rz3;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p1, v0}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    sget p1, Ll/n9c0;->X0:I

    .line 71
    .line 72
    invoke-virtual {p0, p1}, Ll/th0$a;->d(I)Ll/th0$a;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->N1:I

    .line 77
    .line 78
    invoke-virtual {p0, p1}, Ll/th0$a;->e(I)Ll/th0$a;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :cond_0
    const/4 p1, 0x0

    .line 91
    invoke-virtual {p0, p1}, Ll/rz3;->a4(Z)V

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :cond_1
    const/4 p1, 0x1

    .line 96
    invoke-virtual {p0, p1}, Ll/rz3;->a4(Z)V

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method public final synthetic W3(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/c44;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0, p1}, Ll/c44;->m(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic X3(Lcom/p1/mobile/putong/live/base/data/BLive;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Ll/rz3;->U3(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic Y3(Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Ll/rz3;->a4(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic Z3(Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->liveSetting:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorSetting;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchorSetting;->callSwitch:Lcom/p1/mobile/putong/live/base/data/BLiveCallSwitch;

    .line 4
    .line 5
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCallSwitch;->on:Z

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/rz3;->b4(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public a4(Z)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->O7(Z)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    new-instance v0, Ll/pz3;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/pz3;-><init>(Ll/rz3;)V

    .line 12
    .line 13
    .line 14
    new-instance p0, Ll/qz3;

    .line 15
    .line 16
    invoke-direct {p0}, Ll/qz3;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {v0, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final b4(Z)V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "anchor setCallSwitch enable:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Ll/g64;->d(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 19
    .line 20
    check-cast v0, Ll/c44;

    .line 21
    .line 22
    invoke-virtual {v0, p1}, Ll/c44;->k(Z)V

    .line 23
    .line 24
    .line 25
    new-instance v0, Ll/t610;

    .line 26
    .line 27
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;->multi_connect:Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;

    .line 28
    .line 29
    invoke-direct {v0, p1, v1}, Ll/t610;-><init>(ZLcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;)V

    .line 30
    .line 31
    .line 32
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 33
    .line 34
    if-eqz p1, :cond_0

    .line 35
    .line 36
    new-instance p1, Ll/z34;

    .line 37
    .line 38
    check-cast v1, Ll/c44;

    .line 39
    .line 40
    iget-object v1, v1, Ll/c44;->f:Landroid/widget/FrameLayout;

    .line 41
    .line 42
    iget-object v2, p0, Ll/rz3;->i:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetView;

    .line 43
    .line 44
    iget-object v3, p0, Ll/rz3;->j:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/LiveCallView;

    .line 45
    .line 46
    invoke-direct {p1, v1, v2, v3}, Ll/z34;-><init>(Landroid/widget/FrameLayout;Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetView;Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/LiveCallView;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, p1}, Ll/t610;->b(Ll/g0m;)Ll/t610;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    new-instance v1, Ll/oz3;

    .line 54
    .line 55
    invoke-direct {v1}, Ll/oz3;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p1, v1}, Ll/t610;->a(Ll/z20;)Ll/t610;

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_0
    check-cast v1, Ll/c44;

    .line 63
    .line 64
    const/4 p1, 0x0

    .line 65
    invoke-virtual {v1, p1}, Ll/c44;->m(I)V

    .line 66
    .line 67
    .line 68
    :goto_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->MotionEvent:Lcom/tantan/live/eventbus/LiveEventBus$MotionEvent;

    .line 73
    .line 74
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$MotionEvent;->motionSwitch()Ll/v3f$d;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 79
    .line 80
    .line 81
    return-void
.end method
