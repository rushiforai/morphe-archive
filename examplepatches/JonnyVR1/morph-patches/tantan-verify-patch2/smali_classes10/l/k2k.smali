.class public Ll/k2k;
.super Ll/s0k;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/rwn0;",
        "VM:",
        "Ll/g2k;",
        ">",
        "Ll/s0k<",
        "TD;TVM;>;"
    }
.end annotation


# instance fields
.field public j:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/dum;Ll/g2k;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TD;>;TVM;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/s0k;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic V3(Ll/k2k;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/k2k;->Z3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;)V

    return-void
.end method

.method public static synthetic W3(Ll/k2k;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/k2k;->b4(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic X3(Ll/k2k;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/k2k;->a4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWall;)V

    return-void
.end method

.method private c4()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/k2k;->j:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Ll/rwn0;

    .line 8
    .line 9
    invoke-virtual {v1}, Ll/vp20;->o()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {v0, v1}, Ll/wkn0;->e(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/h2k;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/h2k;-><init>(Ll/k2k;)V

    .line 24
    .line 25
    .line 26
    new-instance v2, Ll/z2e0;

    .line 27
    .line 28
    invoke-direct {v2}, Ll/z2e0;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/k2k;->j:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    check-cast v1, Ll/rwn0;

    .line 45
    .line 46
    invoke-virtual {v1}, Ll/vp20;->o()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-static {v0, v1}, Ll/wkn0;->f(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    new-instance v1, Ll/i2k;

    .line 59
    .line 60
    invoke-direct {v1, p0}, Ll/i2k;-><init>(Ll/k2k;)V

    .line 61
    .line 62
    .line 63
    new-instance p0, Ll/z2e0;

    .line 64
    .line 65
    invoke-direct {p0}, Ll/z2e0;-><init>()V

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


# virtual methods
.method public O3()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/k2k;->Y3()V

    .line 2
    .line 3
    .line 4
    invoke-super {p0}, Ll/y8s;->O3()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public P3()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/y8s;->P3()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/k2k;->init()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public S3()Ll/u0k;
    .locals 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance v0, Ll/u0k;

    .line 2
    .line 3
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 4
    .line 5
    check-cast p0, Ll/g2k;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/g2k;->c()Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/4 v1, 0x0

    .line 12
    const-string v2, "\u793c\u7269\u5899"

    .line 13
    .line 14
    invoke-direct {v0, v2, p0, v1}, Ll/u0k;-><init>(Ljava/lang/String;Landroid/view/View;I)V

    .line 15
    .line 16
    .line 17
    return-object v0
.end method

.method public T3()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public Y3()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/g2k;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/g2k;->b()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic Z3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;->id:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "0001"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->GiftWallDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$GiftWallDialogEvent;

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$GiftWallDialogEvent;->openGiftDialogFromGiftWall()Ll/v3f$c;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p1}, Ll/v3f$c;->p()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->GiftWallDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$GiftWallDialogEvent;

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$GiftWallDialogEvent;->closeLocalGiftWallDialog()Ll/v3f$c;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p1}, Ll/v3f$c;->p()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->OpenUserCardDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;->dismiss()Ll/v3f$c;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_0
    invoke-virtual {p0, p1}, Ll/k2k;->e4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public final synthetic a4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWall;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/g2k;

    .line 4
    .line 5
    iget-object v0, v0, Ll/g2k;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/giftwall/GiftWallPageView;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/giftwall/GiftWallPageView;->H:Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/giftwall/VoiceGiftWallBriefView;

    .line 8
    .line 9
    new-instance v1, Ll/j2k;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/j2k;-><init>(Ll/k2k;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, p1, v1}, Lcom/p1/mobile/putong/live/livingroom/virtual/giftwalllocal/giftwall/VoiceGiftWallBriefView;->k0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWall;Ll/y20;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftWallDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$GiftWallDialogEvent;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftWallDialogEvent;->updateLightedGifts()Ll/v3f$d;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWall;->process:Lcom/p1/mobile/putong/live/base/data/BLiveCommonCount;

    .line 28
    .line 29
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonCount;->current:I

    .line 30
    .line 31
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWall;->process:Lcom/p1/mobile/putong/live/base/data/BLiveCommonCount;

    .line 36
    .line 37
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCommonCount;->total:I

    .line 38
    .line 39
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final synthetic b4(Ljava/util/List;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/g2k;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/g2k;->d(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public d4(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/k2k;->j:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public e4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;)V
    .locals 7

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;->interact:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallGiftItemInteract;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallGiftItemInteract;->title:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sget v1, Ll/yec0;->J1:I

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    move-object v1, v0

    .line 28
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/view/GiftWallSendGiftDialogContentView;

    .line 29
    .line 30
    new-instance v0, Ll/jl80$a;

    .line 31
    .line 32
    iget-object v2, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 33
    .line 34
    invoke-direct {v0, v2}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ll/jl80$a;->R(Landroid/view/View;)Ll/jl80$a;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    const/4 v2, 0x1

    .line 42
    invoke-virtual {v0, v2}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    const/4 v2, 0x0

    .line 47
    invoke-virtual {v0, v2}, Ll/jl80$a;->M(Z)Ll/jl80$a;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0}, Ll/jl80$a;->O()Ll/jl80;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    const/4 v4, 0x0

    .line 56
    const/4 v5, 0x0

    .line 57
    move-object v6, p0

    .line 58
    move-object v2, p1

    .line 59
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/view/GiftWallSendGiftDialogContentView;->n0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftItem;Ll/jl80;ZZLl/i6t;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v3}, Ll/jl80;->show()V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public init()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/g2k;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/g2k;->r()V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Ll/k2k;->c4()V

    .line 9
    .line 10
    .line 11
    return-void
.end method
