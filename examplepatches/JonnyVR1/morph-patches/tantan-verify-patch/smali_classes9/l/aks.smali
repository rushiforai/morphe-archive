.class public Ll/aks;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/oo2;",
        "Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftLayer;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftLayer;)V
    .locals 0

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

.method public static synthetic J3(Ll/aks;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/aks;->P3(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic K3(Ll/aks;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/aks;->O3(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/a;)V

    return-void
.end method

.method private L3()Z
    .locals 1

    .line 1
    sget-object p0, Landroid/os/Build;->BRAND:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "MEIZU"

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    sget-object p0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string v0, "15"

    .line 22
    .line 23
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    return p0

    .line 31
    :cond_0
    const/4 p0, 0x0

    .line 32
    return p0
.end method

.method private M3()Z
    .locals 1

    .line 1
    sget-object p0, Landroid/os/Build;->BRAND:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "OPPO"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    sget-object p0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string v0, "PBDM00"

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    return p0

    .line 31
    :cond_0
    const/4 p0, 0x0

    .line 32
    return p0
.end method


# virtual methods
.method public N3(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)Z
    .locals 3

    .line 1
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->r()Z

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
    if-nez p1, :cond_1

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return p0

    .line 13
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->type:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v0}, Ll/wqe;->d(Ljava/lang/String;)Ll/l4;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->id:Ljava/lang/String;

    .line 20
    .line 21
    new-instance v2, Ll/aks$a;

    .line 22
    .line 23
    invoke-direct {v2, p0, p2, p3}, Ll/aks$a;-><init>(Ll/aks;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p1, v1, v2}, Ll/l4;->e(Ljava/lang/String;ZLl/w8e;)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    return p0
.end method

.method public final synthetic O3(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/a;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/a;->f:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/aks;->S3(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic P3(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftLayer;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftLayer;->c()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public R3(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/a$b;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/a$b;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/a$b;->a:Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

    .line 7
    .line 8
    iput-object p2, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/a$b;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftTraysEvent:Lcom/tantan/live/eventbus/LiveEventBus$GiftTraysEvent;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftTraysEvent;->playGameEffect()Ll/v3f$d;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public S3(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftLayer;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftLayer;->b(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

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
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftTraysEvent:Lcom/tantan/live/eventbus/LiveEventBus$GiftTraysEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftTraysEvent;->playGiftLayer()Ll/v3f$d;

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
    new-instance v1, Ll/zjs;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/zjs;-><init>(Ll/aks;)V

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

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/aks;->M3()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    invoke-direct {p0}, Ll/aks;->L3()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    return-void

    .line 18
    :cond_1
    :goto_0
    invoke-virtual {p0}, Ll/i6t;->lifecycle()Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/yjs;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/yjs;-><init>(Ll/aks;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    return-void
.end method
