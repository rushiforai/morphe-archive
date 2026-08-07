.class public Ll/lpc0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ll/i6t;ZLandroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/lpc0;->d(Ll/i6t;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Ll/jl80;Ll/i6t;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->OpenH5Event:Lcom/tantan/live/eventbus/LiveEventBus$OpenH5Event;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$OpenH5Event;->open()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const/16 p1, 0x384

    .line 15
    .line 16
    invoke-static {p1}, Ll/px50;->c(I)Ll/px50$a;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    sget-object v0, Ll/efv;->s:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {p1, v0}, Ll/px50$a;->B(Ljava/lang/String;)Ll/px50$a;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    const/16 v0, 0x50

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Ll/px50$a;->t(I)Ll/px50$a;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-static {}, Ll/bnl0;->y0()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    const/high16 v1, 0x44110000    # 580.0f

    .line 37
    .line 38
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    invoke-virtual {p1, v0, v1}, Ll/px50$a;->A(II)Ll/px50$a;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p1}, Ll/px50$a;->q()Ll/px50;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public static synthetic c(ZLl/uoe0;Ljava/lang/String;Ljava/lang/String;Ll/jl80;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/i6t;Z)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    invoke-static {p1, p2, p0}, Ll/gpc0;->d(Ll/uoe0;Ljava/lang/String;Z)V

    .line 7
    .line 8
    .line 9
    :cond_0
    invoke-static {p3}, Ll/gpc0;->f(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    invoke-virtual {p4, p0}, Ll/g1e;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p4}, Ll/g1e;->dismiss()V

    .line 17
    .line 18
    .line 19
    if-eqz p5, :cond_1

    .line 20
    .line 21
    invoke-virtual {p6}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->SendGiftEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$SendGiftEventGroup;

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$SendGiftEventGroup;->sendGift()Ll/v3f$d;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    new-instance p1, Ll/hne0$a;

    .line 32
    .line 33
    invoke-direct {p1}, Ll/hne0$a;-><init>()V

    .line 34
    .line 35
    .line 36
    new-instance p2, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 39
    .line 40
    .line 41
    iget p3, p5, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->id:I

    .line 42
    .line 43
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string p3, ""

    .line 47
    .line 48
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    new-instance p3, Ll/lpc0$a;

    .line 56
    .line 57
    invoke-direct {p3, p6, p7}, Ll/lpc0$a;-><init>(Ll/i6t;Z)V

    .line 58
    .line 59
    .line 60
    const-string p4, "firstrecharge"

    .line 61
    .line 62
    invoke-static {p4}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;

    .line 63
    .line 64
    .line 65
    move-result-object p4

    .line 66
    invoke-static {p4}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->getNativeTraceServerData(Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 67
    .line 68
    .line 69
    move-result-object p7

    .line 70
    const/4 p4, 0x1

    .line 71
    const-string p5, ""

    .line 72
    .line 73
    const-string p6, ""

    .line 74
    .line 75
    invoke-virtual/range {p1 .. p7}, Ll/hne0$a;->u(Ljava/lang/String;Ll/aiv$a$a;ILjava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;)Ll/hne0$a;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-virtual {p1}, Ll/hne0$a;->t()Ll/hne0;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 84
    .line 85
    .line 86
    :cond_1
    return-void
.end method

.method public static d(Ll/i6t;Z)V
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->openGiftDialogEvent()Ll/v3f$d;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance p1, Ll/lx50;

    .line 16
    .line 17
    invoke-direct {p1}, Ll/lx50;-><init>()V

    .line 18
    .line 19
    .line 20
    const/16 v0, 0xbb8

    .line 21
    .line 22
    invoke-virtual {p1, v0}, Ll/lx50;->i(I)Ll/lx50;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    const-string v0, "live"

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Ll/lx50;->j(Ljava/lang/String;)Ll/lx50;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public static e(Ll/i6t;Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ljava/lang/String;Ll/uoe0;Ljava/lang/String;ZZ)V
    .locals 10

    .line 1
    new-instance v0, Ll/jl80$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    sget v1, Ll/yec0;->B4:I

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ll/jl80$a;->Q(I)Ll/jl80$a;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget v1, Ll/obc0;->Na:I

    .line 17
    .line 18
    invoke-static {v1}, Ll/n3d0;->b(I)Landroid/graphics/drawable/Drawable;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Ll/jl80$a;->N(Landroid/graphics/drawable/Drawable;)Ll/jl80$a;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 27
    .line 28
    .line 29
    move-result-object v6

    .line 30
    invoke-static {p3}, Ll/gpc0;->g(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v6}, Ll/jl80;->show()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v6}, Ll/jl80;->L()Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/NewFirstRechargePaySuccessDialog;

    .line 41
    .line 42
    new-instance v1, Ll/jpc0;

    .line 43
    .line 44
    move/from16 v9, p7

    .line 45
    .line 46
    invoke-direct {v1, p0, v9}, Ll/jpc0;-><init>(Ll/i6t;Z)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v6, v1}, Ll/g1e;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 50
    .line 51
    .line 52
    if-eqz p1, :cond_0

    .line 53
    .line 54
    new-instance v1, Ll/kpc0;

    .line 55
    .line 56
    move-object v8, p0

    .line 57
    move-object v7, p2

    .line 58
    move-object v5, p3

    .line 59
    move-object v3, p4

    .line 60
    move-object v4, p5

    .line 61
    move/from16 v2, p6

    .line 62
    .line 63
    invoke-direct/range {v1 .. v9}, Ll/kpc0;-><init>(ZLl/uoe0;Ljava/lang/String;Ljava/lang/String;Ll/jl80;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/i6t;Z)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0, p1, p2, v2, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/NewFirstRechargePaySuccessDialog;->j0(Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;ZLl/x20;)V

    .line 67
    .line 68
    .line 69
    :cond_0
    return-void
.end method

.method public static f(Ll/i6t;Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;)V
    .locals 4

    .line 1
    new-instance v0, Ll/jl80$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    sget v1, Ll/yec0;->b1:I

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ll/jl80$a;->Q(I)Ll/jl80$a;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget v1, Ll/obc0;->Na:I

    .line 17
    .line 18
    invoke-static {v1}, Ll/n3d0;->b(I)Landroid/graphics/drawable/Drawable;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Ll/jl80$a;->N(Landroid/graphics/drawable/Drawable;)Ll/jl80$a;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Ll/jl80;->show()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Ll/jl80;->L()Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/FirstRechargePaySuccessDialog;

    .line 38
    .line 39
    if-eqz p1, :cond_0

    .line 40
    .line 41
    new-instance v2, Ll/hpc0;

    .line 42
    .line 43
    invoke-direct {v2, v0, p0}, Ll/hpc0;-><init>(Ll/jl80;Ll/i6t;)V

    .line 44
    .line 45
    .line 46
    new-instance v3, Ll/ipc0;

    .line 47
    .line 48
    invoke-direct {v3, v0}, Ll/ipc0;-><init>(Ll/jl80;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1, p0, p1, v2, v3}, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/FirstRechargePaySuccessDialog;->j0(Ll/i6t;Lcom/p1/mobile/putong/live/base/data/BLiveFirstRechargeDetail;Ll/x20;Ll/x20;)V

    .line 52
    .line 53
    .line 54
    :cond_0
    return-void
.end method

.method public static g(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget v0, Ll/yec0;->Q:I

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Dialog$e;->M(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->u()Lcom/p1/mobile/android/app/Dialog$e;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->P()Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveRemindDialog;

    .line 27
    .line 28
    new-instance v1, Ll/sqk;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/sqk;-><init>(Lcom/p1/mobile/android/app/Dialog;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, p1, p2, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LiveRemindDialog;->k0(Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method
