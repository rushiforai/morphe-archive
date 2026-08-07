.class public Ll/tak0;
.super Ll/ms2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/oo2;",
        ">",
        "Ll/ms2<",
        "Ll/d8k0<",
        "TD;>;TD;>;"
    }
.end annotation


# static fields
.field public static final p:I

.field public static final q:I


# instance fields
.field public final k:Ll/xak0;

.field public l:Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;

.field public m:Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

.field public n:Ljava/lang/String;

.field public o:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/16 v0, 0xf

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->f(I)I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    sput v1, Ll/tak0;->p:I

    .line 8
    .line 9
    invoke-static {v0}, Ll/qa00;->f(I)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    sput v0, Ll/tak0;->q:I

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>(Ll/dum;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TD;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/ms2;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/xak0;

    .line 5
    .line 6
    invoke-direct {p1}, Ll/xak0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/tak0;->k:Ll/xak0;

    .line 10
    .line 11
    new-instance p1, Ll/d8k0;

    .line 12
    .line 13
    invoke-direct {p1, p0}, Ll/d8k0;-><init>(Ll/tak0;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static synthetic A4(Ll/y20;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const-string p1, ""

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic B4(Ll/tak0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tak0;->S4(Ljava/lang/Throwable;)V

    return-void
.end method

.method private synthetic V4(Ll/vxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/d8k0;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic j4(Ljava/lang/Throwable;)V
    .locals 1

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
    iget-object v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->c3:I

    .line 22
    .line 23
    invoke-static {p0}, Ll/o1j0;->C(I)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static synthetic k4(Ll/tak0;Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;Ll/pf60;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/tak0;->O4(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;Ll/pf60;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic l4(Ll/tak0;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/tak0;->V4(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic m4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic n4(Ll/tak0;Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tak0;->P4(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;)V

    return-void
.end method

.method public static synthetic o4(Ll/tak0;Lcom/p1/mobile/putong/data/User;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/tak0;->M4(Lcom/p1/mobile/putong/data/User;Ljava/util/List;)V

    return-void
.end method

.method public static synthetic p4(Ll/tak0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tak0;->L4(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic q4(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveFakeUserProfile;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p1, ""

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFakeUserProfile;->profileText:Ljava/lang/String;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic r4(Ll/tak0;Ll/vak0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tak0;->R4(Ll/vak0;)V

    return-void
.end method

.method public static synthetic s4(Ll/tak0;Ll/vx50;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tak0;->W4(Ll/vx50;)V

    return-void
.end method

.method public static synthetic t4(Ljava/lang/Throwable;)Ll/vak0;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public static synthetic u4(Ll/tak0;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tak0;->N4(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic v4(Ll/tak0;Ll/d36;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tak0;->U4(Ll/d36;)V

    return-void
.end method

.method public static synthetic w4(Ll/tak0;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ll/d36;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tak0;->T4(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ll/d36;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic x4(Ll/tak0;Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;Ll/vak0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/tak0;->Q4(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;Ll/vak0;)V

    return-void
.end method

.method public static synthetic y4(Ll/tak0;Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tak0;->J4(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;)V

    return-void
.end method

.method public static synthetic z4(Ll/tak0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tak0;->K4()V

    return-void
.end method


# virtual methods
.method public C4()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->e4(Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/dak0;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/dak0;-><init>(Ll/tak0;)V

    .line 22
    .line 23
    .line 24
    new-instance p0, Ll/eak0;

    .line 25
    .line 26
    invoke-direct {p0}, Ll/eak0;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

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

.method public D4(Ll/x20;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast v0, Ll/d8k0;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->q(Ll/x20;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-virtual {p0}, Ll/tak0;->F4()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->getSource()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const-string v0, "contribution"

    .line 19
    .line 20
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->PlugPubEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlugPubEvent;

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$PlugPubEvent;->dismissContributeDialog()Ll/v3f$d;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    const/16 p1, 0xed8

    .line 37
    .line 38
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void
.end method

.method public final E4()V
    .locals 8

    .line 1
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v6

    .line 21
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 22
    .line 23
    move-object v2, v0

    .line 24
    check-cast v2, Ll/d8k0;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/tak0;->F4()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->isShowShadow()Z

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    iget-boolean v5, p0, Ll/tak0;->o:Z

    .line 35
    .line 36
    iget-object v7, p0, Ll/tak0;->n:Ljava/lang/String;

    .line 37
    .line 38
    const/4 v4, 0x0

    .line 39
    invoke-virtual/range {v2 .. v7}, Ll/d8k0;->T0(ZLl/vak0;ZZLjava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Ll/tak0;->k5()V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public F4()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tak0;->l:Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;->userCardData:Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-object v0

    .line 10
    :cond_0
    iget-object p0, p0, Ll/tak0;->m:Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 11
    .line 12
    return-object p0
.end method

.method public G4(Ljava/lang/String;Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/gbk0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/gbk0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ll/gbk0;->k(Ljava/lang/String;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0, p1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    new-instance p1, Ll/jak0;

    .line 23
    .line 24
    invoke-direct {p1, p2}, Ll/jak0;-><init>(Ll/y20;)V

    .line 25
    .line 26
    .line 27
    new-instance v0, Ll/kak0;

    .line 28
    .line 29
    invoke-direct {v0, p2}, Ll/kak0;-><init>(Ll/y20;)V

    .line 30
    .line 31
    .line 32
    invoke-static {p1, v0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final H4(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/bf10;->N(Ll/i6t;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p0, "multiCall"

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->getScene()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public I4()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/vwt;->u7()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public final synthetic J4(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;)V
    .locals 1

    .line 1
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->q3:I

    .line 2
    .line 3
    invoke-static {p1}, Ll/o1j0;->w(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->FansGroupEvent:Lcom/tantan/live/eventbus/LiveEventBus$FansGroupEvent;

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$FansGroupEvent;->showFansGroupPanel()Ll/v3f$d;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ll/ms2;->a4()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final synthetic K4()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/tak0;->F4()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->userId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {p0, v0}, Ll/jlk0;->i(Ll/i6t;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic L4(Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "contribution"

    .line 2
    .line 3
    invoke-static {p0, p1, v0}, Ll/jlk0;->j(Ll/i6t;Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic M4(Lcom/p1/mobile/putong/data/User;Ljava/util/List;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/d8k0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/d8k0;->M0()V

    .line 6
    .line 7
    .line 8
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->x8:I

    .line 9
    .line 10
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 11
    .line 12
    const/16 p2, 0x8

    .line 13
    .line 14
    invoke-static {p1, p2}, Ll/bf10;->w(Ljava/lang/String;I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-static {p0, p1}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final synthetic N4(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/tak0;->F4()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->userId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {p0, p1, v0}, Ll/jlk0;->k(Ll/i6t;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public O3()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/y8s;->O3()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/tak0;->k:Ll/xak0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/xak0;->b()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic O4(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;Ll/pf60;)Lrx/c;
    .locals 10

    .line 1
    iget-object p2, p2, Ll/pf60;->b:Ljava/lang/Object;

    .line 2
    .line 3
    if-eqz p2, :cond_1

    .line 4
    .line 5
    move-object v0, p2

    .line 6
    check-cast v0, Ll/cm0;

    .line 7
    .line 8
    iget-object v0, v0, Ll/cm0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    const/4 p2, 0x0

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    check-cast p2, Ll/cm0;

    .line 15
    .line 16
    iget-object p2, p2, Ll/cm0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 17
    .line 18
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->color:Ljava/lang/String;

    .line 19
    .line 20
    :goto_0
    iput-object p2, p0, Ll/tak0;->n:Ljava/lang/String;

    .line 21
    .line 22
    :cond_1
    new-instance v0, Ll/gbk0;

    .line 23
    .line 24
    invoke-direct {v0}, Ll/gbk0;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->userId()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    invoke-virtual {p2}, Ll/vp20;->k()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->getFromIdentity()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->getTo()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    invoke-virtual {p0, p1}, Ll/tak0;->H4(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v5

    .line 51
    invoke-virtual {p0}, Ll/tak0;->F4()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->getSource()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v6

    .line 59
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-virtual {p1}, Ll/vp20;->o()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v7

    .line 67
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-virtual {p1}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    iget-object v8, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 76
    .line 77
    invoke-static {p0}, Ll/bf10;->z(Ll/i6t;)Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 78
    .line 79
    .line 80
    move-result-object v9

    .line 81
    invoke-virtual/range {v0 .. v9}, Ll/gbk0;->o(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Lrx/c;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    return-object p0
.end method

.method public P3()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/l6t;->b:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/tak0;->l:Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/jlk0;->h(Ljava/util/Collection;Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;)V

    .line 10
    .line 11
    .line 12
    invoke-super {p0}, Ll/y8s;->P3()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic P4(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/tak0;->k:Ll/xak0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Ll/vp20;->k()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 20
    .line 21
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    const-string v1, "p_live_profile"

    .line 28
    .line 29
    move-object v5, p1

    .line 30
    invoke-virtual/range {v0 .. v5}, Ll/xak0;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final synthetic Q4(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;Ll/vak0;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;

    .line 2
    .line 3
    invoke-direct {v0, p2, p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;-><init>(Ll/vak0;Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/tak0;->l:Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;

    .line 7
    .line 8
    return-void
.end method

.method public R3()V
    .locals 4
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    new-instance v0, Ll/u9k0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 4
    .line 5
    iget-object v2, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast v2, Ll/d8k0;

    .line 8
    .line 9
    iget-object v2, v2, Ll/d8k0;->r:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;

    .line 10
    .line 11
    invoke-direct {v0, v1, v2}, Ll/u9k0;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 15
    .line 16
    .line 17
    new-instance v0, Ll/m9k0;

    .line 18
    .line 19
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 20
    .line 21
    iget-object v2, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 22
    .line 23
    check-cast v2, Ll/d8k0;

    .line 24
    .line 25
    iget-object v2, v2, Ll/d8k0;->L:Lv/VImage;

    .line 26
    .line 27
    const/4 v3, 0x0

    .line 28
    invoke-direct {v0, v1, v3, v2}, Ll/m9k0;-><init>(Ll/dum;Lv/VText;Lv/VImage;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 32
    .line 33
    .line 34
    new-instance v0, Ll/z8k0;

    .line 35
    .line 36
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 37
    .line 38
    iget-object v2, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 39
    .line 40
    move-object v3, v2

    .line 41
    check-cast v3, Ll/d8k0;

    .line 42
    .line 43
    iget-object v3, v3, Ll/d8k0;->x:Landroid/widget/LinearLayout;

    .line 44
    .line 45
    check-cast v2, Ll/d8k0;

    .line 46
    .line 47
    iget-object v2, v2, Ll/d8k0;->y:Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardEntranceView;

    .line 48
    .line 49
    invoke-direct {v0, v1, v3, v2}, Ll/z8k0;-><init>(Ll/dum;Landroid/widget/LinearLayout;Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardEntranceView;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 53
    .line 54
    .line 55
    new-instance v0, Ll/w9k0;

    .line 56
    .line 57
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 58
    .line 59
    iget-object v2, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 60
    .line 61
    check-cast v2, Ll/d8k0;

    .line 62
    .line 63
    iget-object v2, v2, Ll/d8k0;->z:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/view/LiveNewGiftWallEntranceView;

    .line 64
    .line 65
    invoke-direct {v0, v1, v2}, Ll/w9k0;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/view/LiveNewGiftWallEntranceView;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 69
    .line 70
    .line 71
    new-instance v0, Ll/j8k0;

    .line 72
    .line 73
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 74
    .line 75
    iget-object v2, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 76
    .line 77
    check-cast v2, Ll/d8k0;

    .line 78
    .line 79
    iget-object v2, v2, Ll/d8k0;->M:Lv/VText;

    .line 80
    .line 81
    invoke-direct {v0, v1, v2}, Ll/j8k0;-><init>(Ll/dum;Lv/VText;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public final synthetic R4(Ll/vak0;)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Ll/tak0;->g4()Ll/vak0;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/tak0;->E4()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0}, Ll/tak0;->g4()Ll/vak0;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object p1, p1, Ll/vak0;->c:Ll/nsv;

    .line 16
    .line 17
    iget-object p1, p1, Ll/nsv;->a:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v5

    .line 37
    invoke-virtual {p0}, Ll/tak0;->g4()Ll/vak0;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iget-object p1, p1, Ll/vak0;->c:Ll/nsv;

    .line 42
    .line 43
    iget-object p1, p1, Ll/nsv;->a:Ljava/lang/Object;

    .line 44
    .line 45
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 46
    .line 47
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->fanbaseHierarchy:Lcom/p1/mobile/putong/data/LiveFansClubLevel;

    .line 48
    .line 49
    iget-object p1, p1, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->userType:Ljava/lang/String;

    .line 50
    .line 51
    const-string v0, "anchor"

    .line 52
    .line 53
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    iput-boolean p1, p0, Ll/tak0;->o:Z

    .line 58
    .line 59
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 60
    .line 61
    move-object v1, p1

    .line 62
    check-cast v1, Ll/d8k0;

    .line 63
    .line 64
    invoke-virtual {p0}, Ll/tak0;->F4()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->isShowShadow()Z

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    invoke-virtual {p0}, Ll/tak0;->g4()Ll/vak0;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    iget-boolean v4, p0, Ll/tak0;->o:Z

    .line 77
    .line 78
    iget-object v6, p0, Ll/tak0;->n:Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual/range {v1 .. v6}, Ll/d8k0;->T0(ZLl/vak0;ZZLjava/lang/String;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0}, Ll/tak0;->k5()V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public final synthetic S4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tak0;->E4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic T4(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ll/d36;
    .locals 1

    .line 1
    new-instance v0, Ll/d36$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/d36$a;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ll/d36$a;->d(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ll/d36$a;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Ll/oo2;->W0()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    invoke-virtual {p1, p0}, Ll/d36$a;->e(Z)Ll/d36$a;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Ll/d36$a;->c()Ll/d36;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public final synthetic U4(Ll/d36;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/d8k0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/d8k0;->x0(Ll/d36;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic W4(Ll/vx50;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/vx50;->a()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Ll/vx50;->c()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {p1}, Ll/vx50;->b()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, v0, v1, p1}, Ll/tak0;->c5(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public X4(Ljava/lang/String;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/tak0;->D4(Ll/x20;)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->MemberEvent:Lcom/tantan/live/eventbus/LiveEventBus$MemberEvent;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$MemberEvent;->dismiss()Ll/v3f$c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/v3f$c;->p()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ll/xzs;->K2()Ll/t8s;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->CALL_ANCHOR_CHECK_DIALOG:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ll/t8s;->m(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;)Z

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->chatInputClick()Ll/v3f$d;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    new-instance v1, Ll/vv4;

    .line 38
    .line 39
    const/4 v2, 0x1

    .line 40
    invoke-direct {v1, v2, p1}, Ll/vv4;-><init>(ZLjava/lang/String;)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Ll/tak0;->l:Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;

    .line 44
    .line 45
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;->userCardData:Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 46
    .line 47
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->userId()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {v1, p1}, Ll/vv4;->a(Ljava/lang/String;)Ll/vv4;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    const-string v1, "3"

    .line 56
    .line 57
    invoke-virtual {p1, v1}, Ll/vv4;->b(Ljava/lang/String;)Ll/vv4;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {v0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->HourLeaderBoardEvent:Lcom/tantan/live/eventbus/LiveEventBus$HourLeaderBoardEvent;

    .line 69
    .line 70
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$HourLeaderBoardEvent;->show()Ll/v3f$d;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 75
    .line 76
    invoke-virtual {p1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->KnightGuardEvent:Lcom/tantan/live/eventbus/LiveEventBus$KnightGuardEvent;

    .line 84
    .line 85
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$KnightGuardEvent;->closeDialog()Ll/v3f$d;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    new-instance p1, Ll/y1r;

    .line 90
    .line 91
    const/16 v0, 0xed8

    .line 92
    .line 93
    invoke-direct {p1, v0}, Ll/y1r;-><init>(I)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p1, v2}, Ll/y1r;->f(Z)Ll/y1r;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public Y4()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/tak0;->F4()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->jumpOtherRoomCallBack()Ll/x20;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, v0}, Ll/tak0;->D4(Ll/x20;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ll/tak0;->F4()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->jumpOtherRoomCallBack()Ll/x20;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-interface {p0}, Ll/x20;->call()V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public Z4()V
    .locals 1

    .line 1
    new-instance v0, Ll/oak0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/oak0;-><init>(Ll/tak0;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/tak0;->D4(Ll/x20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public a5(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftWallV2Event:Lcom/tantan/live/eventbus/LiveEventBus$GiftWallV2Event;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftWallV2Event;->showGiftWallV2Dialog()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/nx50;

    .line 15
    .line 16
    iget-object v2, p0, Ll/tak0;->l:Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;

    .line 17
    .line 18
    invoke-direct {v1, p1, v2}, Ll/nx50;-><init>(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    const/4 p1, 0x0

    .line 25
    invoke-virtual {p0, p1}, Ll/tak0;->D4(Ll/x20;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public b5(Lcom/p1/mobile/putong/data/User;)V
    .locals 4

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 5
    .line 6
    invoke-interface {v0}, Ll/bn5;->userId()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p0, v0}, Ll/ms2;->i0(Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    const-string v0, "anchorGuard"

    .line 17
    .line 18
    invoke-static {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    goto :goto_0

    .line 23
    :cond_1
    const-string v0, "userGuard"

    .line 24
    .line 25
    invoke-static {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    :goto_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    iget-object v1, v1, Lcom/tantan/live/eventbus/LiveEventBus;->KnightGuardEvent:Lcom/tantan/live/eventbus/LiveEventBus$KnightGuardEvent;

    .line 34
    .line 35
    invoke-virtual {v1}, Lcom/tantan/live/eventbus/LiveEventBus$KnightGuardEvent;->openDialog()Ll/v3f$d;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    new-instance v2, Ll/y1r;

    .line 40
    .line 41
    const/16 v3, 0xed8

    .line 42
    .line 43
    invoke-direct {v2, v3}, Ll/y1r;-><init>(I)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v2, v0}, Ll/y1r;->i(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;)Ll/y1r;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v0, p1}, Ll/y1r;->g(Lcom/p1/mobile/putong/data/User;)Ll/y1r;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    const-string v0, "p_live_profile"

    .line 55
    .line 56
    invoke-virtual {p1, v0}, Ll/y1r;->h(Ljava/lang/String;)Ll/y1r;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-virtual {v1, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    const/4 p1, 0x0

    .line 64
    invoke-virtual {p0, p1}, Ll/tak0;->D4(Ll/x20;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public c5(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_4

    .line 6
    .line 7
    iget-object v0, p0, Ll/xzs;->e:Ll/dum;

    .line 8
    .line 9
    iget-object v0, v0, Ll/dum;->h:Ll/oo2;

    .line 10
    .line 11
    invoke-static {v0}, Ll/u9t;->c(Ll/oo2;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto :goto_2

    .line 18
    :cond_0
    invoke-static {p0}, Ll/bf10;->P(Ll/i6t;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_3

    .line 23
    .line 24
    new-instance v0, Ll/v24;

    .line 25
    .line 26
    const/16 v1, 0xed8

    .line 27
    .line 28
    const/4 v2, 0x4

    .line 29
    invoke-direct {v0, v1, v2}, Ll/v24;-><init>(II)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Ljava/lang/Boolean;

    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_1
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 46
    .line 47
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    if-eqz v0, :cond_2

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p0}, Ll/vp20;->o()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    goto :goto_0

    .line 62
    :cond_2
    const/4 p0, 0x0

    .line 63
    :goto_0
    const-string v0, "live"

    .line 64
    .line 65
    invoke-static {v0, p0}, Ll/g7k0;->d(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v7

    .line 69
    const-string v5, "live_user_card"

    .line 70
    .line 71
    const/4 v6, 0x1

    .line 72
    move-object v2, p1

    .line 73
    move-object v3, p2

    .line 74
    move-object v4, p3

    .line 75
    invoke-virtual/range {v1 .. v7}, Ll/wrv;->B0(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_3
    :goto_1
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->x1:I

    .line 80
    .line 81
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :cond_4
    :goto_2
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 86
    .line 87
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Y1:I

    .line 88
    .line 89
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public d5(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance v0, Ll/cak0;

    .line 9
    .line 10
    invoke-direct {v0, p0, p1}, Ll/cak0;-><init>(Ll/tak0;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ll/tak0;->D4(Ll/x20;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public e5(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object p2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-static {p0}, Ll/bf10;->A(Ll/i6t;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget-object v1, Ll/cd10;->D:Ljava/lang/String;

    .line 12
    .line 13
    sget-object v2, Ll/cd10;->u:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {p2, v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->A7(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-virtual {p0, p2}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    new-instance v0, Ll/bak0;

    .line 24
    .line 25
    invoke-direct {v0, p0, p1}, Ll/bak0;-><init>(Ll/tak0;Lcom/p1/mobile/putong/data/User;)V

    .line 26
    .line 27
    .line 28
    new-instance p0, Ll/z2e0;

    .line 29
    .line 30
    invoke-direct {p0}, Ll/z2e0;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-static {v0, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public f5(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-static {}, Ll/xak0;->h()V

    .line 5
    .line 6
    .line 7
    new-instance v0, Ll/nak0;

    .line 8
    .line 9
    invoke-direct {v0, p0, p1}, Ll/nak0;-><init>(Ll/tak0;Lcom/p1/mobile/putong/data/User;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Ll/tak0;->D4(Ll/x20;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public g4()Ll/vak0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tak0;->l:Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;->profileData:Ll/vak0;

    .line 4
    .line 5
    return-object p0
.end method

.method public g5(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;)V
    .locals 3

    .line 1
    iput-object p1, p0, Ll/tak0;->m:Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/oo2;->m2()Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget-object v1, v1, Ll/oo2;->B:Ll/x7g;

    .line 16
    .line 17
    invoke-virtual {v1}, Ll/x7g;->z()Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    new-instance v2, Ll/pak0;

    .line 22
    .line 23
    invoke-direct {v2}, Ll/pak0;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-static {v0, v1, v2}, Lrx/c;->zip(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Ll/qak0;

    .line 31
    .line 32
    invoke-direct {v1, p0, p1}, Ll/qak0;-><init>(Ll/tak0;Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    new-instance v1, Ll/rak0;

    .line 44
    .line 45
    invoke-direct {v1}, Ll/rak0;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, v1}, Lrx/c;->onErrorReturn(Ll/qcj;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    new-instance v1, Ll/sak0;

    .line 53
    .line 54
    invoke-direct {v1, p0, p1}, Ll/sak0;-><init>(Ll/tak0;Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, v1}, Lrx/c;->doOnSubscribe(Ll/x20;)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    new-instance v1, Ll/y9k0;

    .line 62
    .line 63
    invoke-direct {v1, p0, p1}, Ll/y9k0;-><init>(Ll/tak0;Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-virtual {p1, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    new-instance v0, Ll/z9k0;

    .line 79
    .line 80
    invoke-direct {v0, p0}, Ll/z9k0;-><init>(Ll/tak0;)V

    .line 81
    .line 82
    .line 83
    new-instance v1, Ll/aak0;

    .line 84
    .line 85
    invoke-direct {v1, p0}, Ll/aak0;-><init>(Ll/tak0;)V

    .line 86
    .line 87
    .line 88
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public h4()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/ms2;->h4()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p0, Ll/d8k0;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/d8k0;->H0()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public h5()V
    .locals 5

    .line 1
    new-instance v0, Ll/x34;

    .line 2
    .line 3
    const/16 v1, 0xed8

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/x34;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/tak0;->F4()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->userId()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Ll/x34;->e(Ljava/lang/String;)Ll/x34;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Ll/q54;

    .line 25
    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    invoke-virtual {v0}, Ll/q54;->b()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v2}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_1

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v1}, Ll/vp20;->k()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    goto :goto_0

    .line 58
    :cond_1
    invoke-virtual {v0}, Ll/q54;->a()Ll/p54;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    iget-object v1, v1, Ll/p54;->a:Ljava/lang/String;

    .line 63
    .line 64
    :goto_0
    invoke-virtual {v0}, Ll/q54;->a()Ll/p54;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    iget-object v0, v0, Ll/p54;->b:Ljava/lang/String;

    .line 69
    .line 70
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    invoke-virtual {v2}, Ll/oo2;->W0()Z

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    const/4 v3, 0x0

    .line 79
    const/16 v4, 0x9

    .line 80
    .line 81
    invoke-static {v0, v1, v3, v4, v2}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->v5(Ljava/lang/String;Ljava/lang/String;IIZ)Lrx/c;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    new-instance v1, Ll/fak0;

    .line 90
    .line 91
    invoke-direct {v1, p0}, Ll/fak0;-><init>(Ll/tak0;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    new-instance v1, Ll/gak0;

    .line 99
    .line 100
    invoke-direct {v1, p0}, Ll/gak0;-><init>(Ll/tak0;)V

    .line 101
    .line 102
    .line 103
    new-instance p0, Ll/hak0;

    .line 104
    .line 105
    invoke-direct {p0}, Ll/hak0;-><init>()V

    .line 106
    .line 107
    .line 108
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 113
    .line 114
    .line 115
    return-void
.end method

.method public i5(Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v1}, Ll/p6s;->w0()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-nez v1, :cond_2

    .line 35
    .line 36
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v1}, Ll/p6s;->w0()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    const-string v2, "%3F"

    .line 45
    .line 46
    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    if-eqz v3, :cond_1

    .line 51
    .line 52
    const-string v2, "%26"

    .line 53
    .line 54
    invoke-virtual {v1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    goto :goto_0

    .line 59
    :cond_1
    invoke-virtual {v1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 64
    .line 65
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    const-string v1, "userId%3D"

    .line 72
    .line 73
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    const-string p1, "%26anchorId%3D"

    .line 80
    .line 81
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->SchemeHandleEvent:Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;

    .line 96
    .line 97
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;->handleScheme()Ll/v3f$d;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    new-instance v0, Ll/bae0$a;

    .line 102
    .line 103
    const/16 v1, 0x64

    .line 104
    .line 105
    invoke-direct {v0, v1}, Ll/bae0$a;-><init>(I)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v0, p1}, Ll/bae0$a;->e(Ljava/lang/String;)Ll/bae0$a;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    invoke-virtual {p1}, Ll/bae0$a;->c()Ll/bae0;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 117
    .line 118
    .line 119
    :cond_2
    :goto_1
    return-void
.end method

.method public j5()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->MemberEvent:Lcom/tantan/live/eventbus/LiveEventBus$MemberEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$MemberEvent;->show()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/4 v0, 0x2

    .line 12
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final k5()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/tak0;->F4()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/tak0;->F4()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->isFromJs()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/xzs;->K2()Ll/t8s;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->WEBVIEW:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Ll/t8s;->m(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;)Z

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public l5()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/tak0;->F4()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/tak0;->F4()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {v0, p0}, Ll/xak0;->f(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public m5(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/tak0;->l:Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;->userCardData:Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;->profileData:Ll/vak0;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/vak0;->m()Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Ll/tak0;->l:Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;->userCardData:Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->userId()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_0

    .line 32
    .line 33
    iget-object p0, p0, Ll/tak0;->l:Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;->profileData:Ll/vak0;

    .line 36
    .line 37
    invoke-virtual {p0}, Ll/vak0;->m()Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    const-string p1, "blocked"

    .line 42
    .line 43
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->blockStatus:Ljava/lang/String;

    .line 44
    .line 45
    :cond_0
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
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->OpenUserCardDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;->show()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Ll/i6t;->f3(Ll/v3f$b;)Ll/i6t$a;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/x9k0;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/x9k0;-><init>(Ll/tak0;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ll/i6t$a;->b(Ll/y20;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->OpenUserCardDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;

    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;->dismiss()Ll/v3f$c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {p0, v0}, Ll/i6t;->f3(Ll/v3f$b;)Ll/i6t$a;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v1, Ll/iak0;

    .line 41
    .line 42
    invoke-direct {v1, p0}, Ll/iak0;-><init>(Ll/tak0;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ll/i6t$a;->b(Ll/y20;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftWallV2Event:Lcom/tantan/live/eventbus/LiveEventBus$GiftWallV2Event;

    .line 53
    .line 54
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftWallV2Event;->openProfilePage()Ll/v3f$d;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {p0, v0}, Ll/i6t;->f3(Ll/v3f$b;)Ll/i6t$a;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    new-instance v1, Ll/lak0;

    .line 63
    .line 64
    invoke-direct {v1, p0}, Ll/lak0;-><init>(Ll/tak0;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0, v1}, Ll/i6t$a;->b(Ll/y20;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LiveBlackListEvent:Lcom/tantan/live/eventbus/LiveEventBus$LiveBlackListEvent;

    .line 75
    .line 76
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LiveBlackListEvent;->updateBlackStatus()Ll/v3f$d;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {p0, v0}, Ll/i6t;->f3(Ll/v3f$b;)Ll/i6t$a;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    new-instance v1, Ll/mak0;

    .line 85
    .line 86
    invoke-direct {v1, p0}, Ll/mak0;-><init>(Ll/tak0;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0, v1}, Ll/i6t$a;->b(Ll/y20;)V

    .line 90
    .line 91
    .line 92
    return-void
.end method
