.class public Ll/av70;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/dw40;",
        "Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;",
        ">;"
    }
.end annotation


# instance fields
.field public final i:Ll/sx70;

.field public j:Ll/jxd0;

.field public k:Lcom/p1/mobile/android/app/Dialog;

.field public l:Lcom/p1/mobile/putong/live/base/data/BLivePkFirstKillGift;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;Ll/sx70;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/jxd0;

    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v1, "pk_first_gift_dialog_show_internal"

    .line 9
    .line 10
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 14
    .line 15
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 27
    .line 28
    invoke-direct {p1, v0, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 29
    .line 30
    .line 31
    iput-object p1, p0, Ll/av70;->j:Ll/jxd0;

    .line 32
    .line 33
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 34
    .line 35
    .line 36
    iput-object p3, p0, Ll/av70;->i:Ll/sx70;

    .line 37
    .line 38
    return-void
.end method

.method public static synthetic J3(Ll/av70;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/av70;->T3()V

    return-void
.end method

.method public static synthetic K3(Ll/av70;Lcom/p1/mobile/putong/live/base/data/BLivePkFirstKillGift;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/av70;->a4(Lcom/p1/mobile/putong/live/base/data/BLivePkFirstKillGift;)V

    return-void
.end method

.method public static synthetic L3(Ll/av70;Lcom/p1/mobile/putong/live/base/data/BLivePkFirstKillGift;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/av70;->d4(Lcom/p1/mobile/putong/live/base/data/BLivePkFirstKillGift;)V

    return-void
.end method

.method public static synthetic M3(Ll/av70;Lcom/p1/mobile/putong/live/base/data/BLivePkFirstKillGift;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/av70;->Y3(Lcom/p1/mobile/putong/live/base/data/BLivePkFirstKillGift;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic N3(Ll/av70;Ll/hv70;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/av70;->Z3(Ll/hv70;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic O3(Ll/av70;)Ll/jxd0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/av70;->j:Ll/jxd0;

    return-object p0
.end method


# virtual methods
.method public P3()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/av70;->V3()Ljava/util/Map;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "e_live_first_blood_gift_icon"

    .line 10
    .line 11
    invoke-static {v2, v0, v1}, Ll/i4g0;->s(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/av70;->S3()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public R3()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/av70;->V3()Ljava/util/Map;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "e_live_first_blood_button"

    .line 10
    .line 11
    invoke-static {v2, v0, v1}, Ll/i4g0;->s(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/av70;->S3()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public S3()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/av70;->j:Ll/jxd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/av70;->c4()V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-virtual {p0}, Ll/av70;->e4()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final T3()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/av70;->V3()Ljava/util/Map;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "e_live_first_blood_popup"

    .line 10
    .line 11
    invoke-static {v2, v0, v1}, Ll/i4g0;->s(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/av70;->k:Lcom/p1/mobile/android/app/Dialog;

    .line 15
    .line 16
    invoke-static {v0}, Ll/ynp0;->n(Landroid/app/Dialog;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/av70;->i:Ll/sx70;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/sx70;->e4()Ljava/lang/Boolean;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/av70;->c4()V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->xa:I

    .line 36
    .line 37
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final U3()Ll/hne0;
    .locals 7

    .line 1
    new-instance v0, Ll/hne0$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/hne0$a;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/av70;->l:Lcom/p1/mobile/putong/live/base/data/BLivePkFirstKillGift;

    .line 7
    .line 8
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLivePkFirstKillGift;->giftId:Ljava/lang/String;

    .line 9
    .line 10
    new-instance v2, Ll/av70$a;

    .line 11
    .line 12
    invoke-direct {v2, p0}, Ll/av70$a;-><init>(Ll/av70;)V

    .line 13
    .line 14
    .line 15
    const-string p0, "PK"

    .line 16
    .line 17
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerLocation;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerLocation;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string v3, "firstblood"

    .line 22
    .line 23
    invoke-static {v3}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-static {p0, v3}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->getNativeTraceServerData(Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerLocation;Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 28
    .line 29
    .line 30
    move-result-object v6

    .line 31
    const/4 v3, 0x1

    .line 32
    const-string v4, "pk"

    .line 33
    .line 34
    const-string v5, "pk"

    .line 35
    .line 36
    invoke-virtual/range {v0 .. v6}, Ll/hne0$a;->u(Ljava/lang/String;Ll/aiv$a$a;ILjava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;)Ll/hne0$a;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p0}, Ll/hne0$a;->t()Ll/hne0;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    return-object p0
.end method

.method public final V3()Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    check-cast v1, Ll/dw40;

    .line 11
    .line 12
    invoke-virtual {v1}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 17
    .line 18
    const-string v2, "anchor_id"

    .line 19
    .line 20
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Ll/dw40;

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 34
    .line 35
    const-string v1, "live_id"

    .line 36
    .line 37
    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    return-object v0
.end method

.method public W3()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/av70;->i:Ll/sx70;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/sx70;->e4()Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/av70;->b4()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 18
    .line 19
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;->p0()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public X3()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;->p0()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic Y3(Lcom/p1/mobile/putong/live/base/data/BLivePkFirstKillGift;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/av70;->i:Ll/sx70;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/sx70;->e4()Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic Z3(Ll/hv70;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/av70;->i:Ll/sx70;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/sx70;->e4()Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final a4(Lcom/p1/mobile/putong/live/base/data/BLivePkFirstKillGift;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkFirstKillGift;->giftId:Ljava/lang/String;

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
    goto :goto_0

    .line 12
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    const-string v1, "renderFirstKillGift id:"

    .line 15
    .line 16
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkFirstKillGift;->giftId:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {v0}, Ll/n180;->j(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 32
    .line 33
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;

    .line 34
    .line 35
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;->t0(Lcom/p1/mobile/putong/live/base/data/BLivePkFirstKillGift;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p0}, Ll/av70;->V3()Ljava/util/Map;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    const-string v1, "e_live_first_blood_button"

    .line 47
    .line 48
    invoke-static {v1, p1, v0}, Ll/i4g0;->y(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p0}, Ll/av70;->V3()Ljava/util/Map;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    const-string v0, "e_live_first_blood_gift_icon"

    .line 60
    .line 61
    invoke-static {v0, p1, p0}, Ll/i4g0;->y(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 62
    .line 63
    .line 64
    :cond_1
    :goto_0
    return-void
.end method

.method public b4()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/av70;->l:Lcom/p1/mobile/putong/live/base/data/BLivePkFirstKillGift;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ll/av70;->a4(Lcom/p1/mobile/putong/live/base/data/BLivePkFirstKillGift;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->H5()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/xu70;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/xu70;-><init>(Ll/av70;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/yu70;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/yu70;-><init>(Ll/av70;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    new-instance v1, Ll/zu70;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Ll/zu70;-><init>(Ll/av70;)V

    .line 38
    .line 39
    .line 40
    new-instance p0, Ll/ga80;

    .line 41
    .line 42
    invoke-direct {p0}, Ll/ga80;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final c4()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->SendGiftEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$SendGiftEventGroup;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$SendGiftEventGroup;->sendGift()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0}, Ll/av70;->U3()Ll/hne0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {v0, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final d4(Lcom/p1/mobile/putong/live/base/data/BLivePkFirstKillGift;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/av70;->l:Lcom/p1/mobile/putong/live/base/data/BLivePkFirstKillGift;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePkEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;->updateFirstGift()Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final e4()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/av70;->l:Lcom/p1/mobile/putong/live/base/data/BLivePkFirstKillGift;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v1, p0, Ll/av70;->l:Lcom/p1/mobile/putong/live/base/data/BLivePkFirstKillGift;

    .line 13
    .line 14
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLivePkFirstKillGift;->firstKillDescription:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->s5:I

    .line 21
    .line 22
    new-instance v2, Ll/vu70;

    .line 23
    .line 24
    invoke-direct {v2, p0}, Ll/vu70;-><init>(Ll/av70;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->V6:I

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->k0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const/4 v1, 0x0

    .line 38
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iput-object v0, p0, Ll/av70;->k:Lcom/p1/mobile/android/app/Dialog;

    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {p0}, Ll/av70;->V3()Ljava/util/Map;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    const-string v1, "e_live_first_blood_popup"

    .line 60
    .line 61
    invoke-static {v1, v0, p0}, Ll/i4g0;->y(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/av70;->k:Lcom/p1/mobile/android/app/Dialog;

    .line 5
    .line 6
    invoke-static {p0}, Ll/ynp0;->n(Landroid/app/Dialog;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/wu70;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/wu70;-><init>(Ll/av70;)V

    .line 7
    .line 8
    .line 9
    const-class v1, Ll/hv70;

    .line 10
    .line 11
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
