.class public Ll/vpj;
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
        "Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogBottomBar;",
        ">;"
    }
.end annotation


# instance fields
.field public i:J


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogBottomBar;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+TT;>;",
            "Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogBottomBar;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic J3(Ll/vpj;Lcom/p1/mobile/putong/live/base/data/BLiveCoin;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vpj;->U3(Lcom/p1/mobile/putong/live/base/data/BLiveCoin;)V

    return-void
.end method

.method public static synthetic K3(Ll/vpj;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vpj;->T3(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic L3(Ll/vpj;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/vpj;->R3(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic M3(Ll/vpj;Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshGiftTabBalanceMsg;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vpj;->V3(Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshGiftTabBalanceMsg;)V

    return-void
.end method

.method public static synthetic N3(Ll/vpj;Ll/ox50;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vpj;->P3(Ll/ox50;)V

    return-void
.end method

.method public static synthetic O3(Ll/vpj;Ll/unj;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vpj;->S3(Ll/unj;)V

    return-void
.end method

.method private synthetic R3(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vpj;->Y3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final synthetic P3(Ll/ox50;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/ox50;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Ll/ox50;->b()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {p1}, Ll/ox50;->a()Ll/uoe0;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, v0, v1, p1}, Ll/vpj;->X3(ZLjava/lang/String;Ll/uoe0;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic S3(Ll/unj;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogBottomBar;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogBottomBar;->o0(Ll/unj;)V

    .line 6
    .line 7
    .line 8
    return-void
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
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->openGoWallet()Ll/v3f$d;

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
    new-instance v1, Ll/ppj;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/ppj;-><init>(Ll/vpj;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

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
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->openSendGiftRecordsPage()Ll/v3f$c;

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
    new-instance v1, Ll/qpj;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/qpj;-><init>(Ll/vpj;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

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
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 73
    .line 74
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->refreshBottomIndicator()Ll/v3f$d;

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
    new-instance v1, Ll/rpj;

    .line 89
    .line 90
    invoke-direct {v1, p0}, Ll/rpj;-><init>(Ll/vpj;)V

    .line 91
    .line 92
    .line 93
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 98
    .line 99
    .line 100
    sget-object v0, Ll/htd0;->c:Ll/htd0;

    .line 101
    .line 102
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    check-cast v0, Ll/hiv;

    .line 107
    .line 108
    invoke-virtual {v0}, Ll/hiv;->h()Lrx/c;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    new-instance v1, Ll/spj;

    .line 117
    .line 118
    invoke-direct {v1, p0}, Ll/spj;-><init>(Ll/vpj;)V

    .line 119
    .line 120
    .line 121
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 126
    .line 127
    .line 128
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    iget-object v0, v0, Ll/aj1;->i2:Lrx/subjects/b;

    .line 137
    .line 138
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    new-instance v1, Ll/tpj;

    .line 143
    .line 144
    invoke-direct {v1, p0}, Ll/tpj;-><init>(Ll/vpj;)V

    .line 145
    .line 146
    .line 147
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 152
    .line 153
    .line 154
    return-void
.end method

.method public final synthetic T3(Ljava/lang/Long;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogBottomBar;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogBottomBar;->setAvailableCoin(Ljava/lang/Long;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic U3(Lcom/p1/mobile/putong/live/base/data/BLiveCoin;)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogBottomBar;

    .line 4
    .line 5
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCoin;->available:J

    .line 6
    .line 7
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogBottomBar;->setAvailableCoin(Ljava/lang/Long;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic V3(Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshGiftTabBalanceMsg;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/intl_light_push/LongLinkIntlLightPushMessage$RefreshGiftTabBalanceMsg;->getUserId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    invoke-static {}, Ll/aiv;->k1()Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    new-instance v0, Ll/upj;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Ll/upj;-><init>(Ll/vpj;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v0}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public W3(ZLjava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Ll/vpj;->X3(ZLjava/lang/String;Ll/uoe0;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final X3(ZLjava/lang/String;Ll/uoe0;)V
    .locals 4
    .param p3    # Ll/uoe0;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Ll/vpj;->i:J

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    const-wide/16 v2, 0x1f4

    .line 9
    .line 10
    cmp-long v0, v0, v2

    .line 11
    .line 12
    if-lez v0, :cond_2

    .line 13
    .line 14
    if-nez p3, :cond_0

    .line 15
    .line 16
    const-string v0, ""

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-object v0, p3, Ll/uoe0;->A:Ljava/lang/String;

    .line 20
    .line 21
    :goto_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 22
    .line 23
    .line 24
    move-result-wide v1

    .line 25
    iput-wide v1, p0, Ll/vpj;->i:J

    .line 26
    .line 27
    invoke-virtual {p0, p3}, Ll/vpj;->Z3(Ll/uoe0;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iget-object v1, v1, Lcom/tantan/live/eventbus/LiveEventBus;->FastRechargeEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$FastRechargeEventGroup;

    .line 35
    .line 36
    invoke-virtual {v1}, Lcom/tantan/live/eventbus/LiveEventBus$FastRechargeEventGroup;->showFastRechargeDialog()Ll/v3f$d;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    new-instance v2, Ll/bkg$a;

    .line 41
    .line 42
    invoke-direct {v2}, Ll/bkg$a;-><init>()V

    .line 43
    .line 44
    .line 45
    if-eqz p1, :cond_1

    .line 46
    .line 47
    const/4 p1, 0x2

    .line 48
    goto :goto_1

    .line 49
    :cond_1
    const/4 p1, 0x1

    .line 50
    :goto_1
    invoke-virtual {v2, p1}, Ll/bkg$a;->g(I)Ll/bkg$a;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p1, p3}, Ll/bkg$a;->h(Ll/uoe0;)Ll/bkg$a;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {p1, p2}, Ll/bkg$a;->j(Ljava/lang/String;)Ll/bkg$a;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p1, v0}, Ll/bkg$a;->i(Ljava/lang/String;)Ll/bkg$a;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-virtual {p1}, Ll/bkg$a;->e()Ll/bkg;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-virtual {v1, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->FansClubEntryEvent:Lcom/tantan/live/eventbus/LiveEventBus$FansClubEntryEvent;

    .line 78
    .line 79
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$FansClubEntryEvent;->openEntry()Ll/v3f$d;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 84
    .line 85
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 86
    .line 87
    .line 88
    :cond_2
    return-void
.end method

.method public Y3()V
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
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    sget-object v0, Ll/efv;->A:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/live/base/webview/LiveWebViewAct;->d2(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    :goto_0
    return-void
.end method

.method public final Z3(Ll/uoe0;)V
    .locals 0
    .param p1    # Ll/uoe0;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->dismissGiftDialog()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/16 p1, 0x1b5b

    .line 12
    .line 13
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
