.class public Ll/p2k0;
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
.field public i:Ljava/lang/String;

.field public j:Ll/t1k0;

.field public k:Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftContentView;

.field public l:Lcom/p1/mobile/android/app/Act;

.field public m:Ll/qxj;


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p1, Ll/dum;->a:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    iput-object p1, p0, Ll/p2k0;->l:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic J3(Ll/p2k0;Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/p2k0;->W3(Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;)V

    return-void
.end method

.method public static synthetic K3(Ll/p2k0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/p2k0;->Y3(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic L3(Ll/p2k0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/p2k0;->X3(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic M3(Ll/p2k0;Ll/x1k0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/p2k0;->U3(Ll/x1k0;)V

    return-void
.end method

.method public static synthetic N3(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 6
    .line 7
    iget v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 8
    .line 9
    const v1, 0xa15a

    .line 10
    .line 11
    .line 12
    if-ne v0, v1, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public static synthetic O3(Ll/p2k0;Ll/a2k0;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/p2k0;->V3(Ll/a2k0;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    return-void
.end method

.method public static synthetic P3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public R3()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/p2k0;->j:Ll/t1k0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/p2k0;->j:Ll/t1k0;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public S3(Ll/a2k0;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Ll/a2k0;->e()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Ll/a2k0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {v2}, Ll/vp20;->n()Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->id:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    invoke-virtual {v3}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {v0, v1, v2, v3}, Ll/aiv;->q0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    new-instance v1, Ll/i2k0;

    .line 40
    .line 41
    invoke-direct {v1, p0, p1}, Ll/i2k0;-><init>(Ll/p2k0;Ll/a2k0;)V

    .line 42
    .line 43
    .line 44
    new-instance p0, Ll/j2k0;

    .line 45
    .line 46
    invoke-direct {p0}, Ll/j2k0;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 54
    .line 55
    .line 56
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
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->UpgradeGiftEvent:Lcom/tantan/live/eventbus/LiveEventBus$UpgradeGiftEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$UpgradeGiftEvent;->showUpgradeDialog()Ll/v3f$d;

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
    new-instance v1, Ll/k2k0;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/k2k0;-><init>(Ll/p2k0;)V

    .line 27
    .line 28
    .line 29
    new-instance p0, Ll/l2k0;

    .line 30
    .line 31
    invoke-direct {p0}, Ll/l2k0;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public T3()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p2k0;->i:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic U3(Ll/x1k0;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/x1k0;->c()Ll/qxj;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Ll/p2k0;->m:Ll/qxj;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/x1k0;->b()Ll/jjs;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0, p1}, Ll/p2k0;->c4(Ll/jjs;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic V3(Ll/a2k0;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V
    .locals 1

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Ll/p2k0;->m:Ll/qxj;

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    invoke-interface {v0, p2}, Ll/qxj;->a(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 9
    .line 10
    .line 11
    :cond_1
    iget-object p0, p0, Ll/p2k0;->k:Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftContentView;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftContentView;->o0(Ll/a2k0;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic W3(Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/p2k0;->k:Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftContentView;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftContentView;->m0(Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;Ll/p2k0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic X3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p2k0;->k:Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftContentView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftContentView;->n0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic Y3(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/p2k0;->k:Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftContentView;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftContentView;->onDestroy()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-object p1, p0, Ll/p2k0;->m:Ll/qxj;

    .line 8
    .line 9
    return-void
.end method

.method public Z3(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->SchemeHandleEvent:Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;->handleScheme()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v0, Ll/bae0$a;

    .line 12
    .line 13
    const/16 v1, 0x59d8

    .line 14
    .line 15
    invoke-direct {v0, v1}, Ll/bae0$a;-><init>(I)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ll/bae0$a;->e(Ljava/lang/String;)Ll/bae0$a;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1}, Ll/bae0$a;->c()Ll/bae0;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final a4(Ll/jjs;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->slotGiftInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSlotGiftInfo;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSlotGiftInfo;->slotId:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p1}, Ll/aiv;->Q0(Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p1, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    new-instance v0, Ll/n2k0;

    .line 26
    .line 27
    invoke-direct {v0, p0}, Ll/n2k0;-><init>(Ll/p2k0;)V

    .line 28
    .line 29
    .line 30
    new-instance v1, Ll/o2k0;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/o2k0;-><init>(Ll/p2k0;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public b4(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/p2k0;->i:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public final c4(Ll/jjs;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/p2k0;->k:Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftContentView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/p2k0;->l:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget v1, Ll/yec0;->u6:I

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftContentView;

    .line 19
    .line 20
    iput-object v0, p0, Ll/p2k0;->k:Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftContentView;

    .line 21
    .line 22
    :cond_0
    iget-object v0, p0, Ll/p2k0;->j:Ll/t1k0;

    .line 23
    .line 24
    if-nez v0, :cond_1

    .line 25
    .line 26
    new-instance v0, Ll/t1k0;

    .line 27
    .line 28
    iget-object v1, p0, Ll/p2k0;->k:Lcom/p1/mobile/putong/live/livingroom/increment/gift/upgradegift/view/UpgradeGiftContentView;

    .line 29
    .line 30
    invoke-direct {v0, p0, v1}, Ll/t1k0;-><init>(Ll/xzs;Landroid/view/View;)V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Ll/p2k0;->j:Ll/t1k0;

    .line 34
    .line 35
    new-instance v1, Ll/m2k0;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Ll/m2k0;-><init>(Ll/p2k0;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 41
    .line 42
    .line 43
    :cond_1
    iget-object v0, p0, Ll/p2k0;->j:Ll/t1k0;

    .line 44
    .line 45
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, p1}, Ll/p2k0;->a4(Ll/jjs;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public t()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
