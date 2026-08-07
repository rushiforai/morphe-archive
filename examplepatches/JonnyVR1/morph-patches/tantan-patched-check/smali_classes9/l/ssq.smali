.class public Ll/ssq;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/oo2;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Z


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic J3(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 2
    .line 3
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->H9:I

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

.method public static synthetic K3(Ll/ssq;Ll/msq;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ssq;->S3(Ll/msq;)V

    return-void
.end method

.method public static synthetic L3(Ll/ssq;Ll/tsq;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ssq;->O3(Ll/tsq;)V

    return-void
.end method

.method public static synthetic M3(Ll/ssq;Ll/tsq;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ssq;->R3(Ll/tsq;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic N3(Ll/ssq;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ssq;->P3()V

    return-void
.end method


# virtual methods
.method public final O3(Ll/tsq;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    if-eqz v0, :cond_4

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    iget-boolean v0, p0, Ll/ssq;->i:Z

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 17
    .line 18
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->P6:I

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    instance-of v0, v0, Ll/rwn0;

    .line 33
    .line 34
    if-eqz v0, :cond_2

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Ll/rwn0;

    .line 41
    .line 42
    invoke-virtual {v0}, Ll/rwn0;->i3()Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_2

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_2
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_3

    .line 54
    .line 55
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->c7:I

    .line 56
    .line 57
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_3
    :goto_0
    const/4 v0, 0x1

    .line 62
    iput-boolean v0, p0, Ll/ssq;->i:Z

    .line 63
    .line 64
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 65
    .line 66
    invoke-virtual {p1}, Ll/tsq;->b()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-static {v1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->q5(Ljava/lang/String;)Lrx/c;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    new-instance v1, Ll/psq;

    .line 79
    .line 80
    invoke-direct {v1, p0}, Ll/psq;-><init>(Ll/ssq;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0, v1}, Lrx/c;->doOnUnsubscribe(Ll/x20;)Lrx/c;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    new-instance v1, Ll/qsq;

    .line 88
    .line 89
    invoke-direct {v1, p0, p1}, Ll/qsq;-><init>(Ll/ssq;Ll/tsq;)V

    .line 90
    .line 91
    .line 92
    new-instance p0, Ll/rsq;

    .line 93
    .line 94
    invoke-direct {p0}, Ll/rsq;-><init>()V

    .line 95
    .line 96
    .line 97
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 102
    .line 103
    .line 104
    :cond_4
    :goto_1
    return-void
.end method

.method public final synthetic P3()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/ssq;->i:Z

    .line 3
    .line 4
    return-void
.end method

.method public final synthetic R3(Ll/tsq;Lcom/p1/mobile/putong/data/User;)V
    .locals 6

    .line 1
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    iget-object v1, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/tsq;->b()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v3

    .line 9
    invoke-virtual {p1}, Ll/tsq;->a()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v4

    .line 13
    const/4 v5, 0x1

    .line 14
    move-object v2, p2

    .line 15
    invoke-virtual/range {v0 .. v5}, Ll/wrv;->A0(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic S3(Ll/msq;)V
    .locals 2

    .line 1
    new-instance v0, Ll/tsq;

    .line 2
    .line 3
    iget-object v1, p1, Ll/msq;->a:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p1, p1, Ll/msq;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {v0, v1, p1}, Ll/tsq;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ll/ssq;->O3(Ll/tsq;)V

    .line 11
    .line 12
    .line 13
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
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LiveBridgeImplEvent:Lcom/tantan/live/eventbus/LiveEventBus$LiveBridgeImplEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LiveBridgeImplEvent;->jumpToProfile()Ll/v3f$d;

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
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Ll/nsq;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Ll/nsq;-><init>(Ll/ssq;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->JumpProfileEvent:Lcom/tantan/live/eventbus/LiveEventBus$JumpProfileEvent;

    .line 49
    .line 50
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$JumpProfileEvent;->jump()Ll/v3f$d;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    check-cast v0, Lrx/c;

    .line 59
    .line 60
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    new-instance v1, Ll/osq;

    .line 65
    .line 66
    invoke-direct {v1, p0}, Ll/osq;-><init>(Ll/ssq;)V

    .line 67
    .line 68
    .line 69
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 74
    .line 75
    .line 76
    return-void
.end method
