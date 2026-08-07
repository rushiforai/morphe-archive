.class public Ll/o04;
.super Ll/h84;
.source "SourceFile"


# instance fields
.field public final j:Ll/r2s;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetView;Ll/r2s;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/h84;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallWidgetView;Ll/n54;)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Ll/o04;->j:Ll/r2s;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic e4(Ll/o04;Lcom/p1/mobile/putong/live/base/data/BLiveCall;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/o04;->k4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f4(Ll/o04;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/o04;->j4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic g4(Ljava/lang/Throwable;)V
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

.method public static synthetic h4(Ll/o04;Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/o04;->l4(Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;)V

    return-void
.end method


# virtual methods
.method public N3()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/h84;->N3()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/b45;

    .line 5
    .line 6
    const/16 v1, 0x1130

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ll/b45;-><init>(I)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ljava/lang/Boolean;

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    new-instance v0, Ll/th0$a;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-direct {v0, v1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 30
    .line 31
    .line 32
    iget-object v1, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 33
    .line 34
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->f2:I

    .line 35
    .line 36
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v0, v1}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->g2:I

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Ll/th0$a;->i(I)Ll/th0$a;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    sget v1, Ll/n9c0;->p0:I

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Ll/th0$a;->p(I)Ll/th0$a;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->o2:I

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Ll/th0$a;->q(I)Ll/th0$a;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    new-instance v1, Ll/l04;

    .line 63
    .line 64
    invoke-direct {v1, p0}, Ll/l04;-><init>(Ll/o04;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0, v1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    sget v0, Ll/n9c0;->X0:I

    .line 72
    .line 73
    invoke-virtual {p0, v0}, Ll/th0$a;->d(I)Ll/th0$a;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->N1:I

    .line 78
    .line 79
    invoke-virtual {p0, v0}, Ll/th0$a;->e(I)Ll/th0$a;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :cond_0
    invoke-virtual {p0}, Ll/o04;->m4()V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public P3(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/o04;->j:Ll/r2s;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/n54;->Z3()Ll/qvd;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p1}, Ll/qvd;->d(I)Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    invoke-static {p1}, Ll/u54;->h(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-virtual {p0, p1}, Ll/o04;->i4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    :goto_0
    return-void
.end method

.method public Y3(Lcom/p1/mobile/putong/live/base/data/BLiveCall;Ll/h64;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->CallEvent:Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;->personalManager()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v0, Ll/u24;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/u24;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ll/u24;->a(Ll/h64;)Ll/u24;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    invoke-virtual {p2, p1}, Ll/u24;->b(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)Ll/u24;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public Z3(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->CallEvent:Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;->anchorCallManageDialog()Ll/v3f$c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public i4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V
    .locals 4

    .line 1
    new-instance v0, Ll/th0$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->r2:I

    .line 13
    .line 14
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userName:Ljava/lang/String;

    .line 15
    .line 16
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    sget v1, Ll/n9c0;->p0:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ll/th0$a;->p(I)Ll/th0$a;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->v2:I

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Ll/th0$a;->q(I)Ll/th0$a;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v1, Ll/k04;

    .line 41
    .line 42
    invoke-direct {v1, p0, p1}, Ll/k04;-><init>(Ll/o04;Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    sget p1, Ll/n9c0;->X0:I

    .line 50
    .line 51
    invoke-virtual {p0, p1}, Ll/th0$a;->d(I)Ll/th0$a;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->N1:I

    .line 56
    .line 57
    invoke-virtual {p0, p1}, Ll/th0$a;->e(I)Ll/th0$a;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public final synthetic j4(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/o04;->m4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic k4(Lcom/p1/mobile/putong/live/base/data/BLiveCall;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o04;->j:Ll/r2s;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/n54;->W3(Lcom/p1/mobile/putong/live/base/data/BLiveCall;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic l4(Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/o04;->n4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final m4()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->O7(Z)Lrx/c;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Ll/m04;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/m04;-><init>(Ll/o04;)V

    .line 13
    .line 14
    .line 15
    new-instance p0, Ll/n04;

    .line 16
    .line 17
    invoke-direct {p0}, Ll/n04;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final n4()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->CallEvent:Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;->anchorCall()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
