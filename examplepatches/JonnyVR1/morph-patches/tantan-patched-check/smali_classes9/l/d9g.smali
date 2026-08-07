.class public Ll/d9g;
.super Ll/y8s;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/y8s<",
        "Ll/oo2;",
        "Ll/m8g;",
        ">;"
    }
.end annotation


# instance fields
.field public j:Ll/a8g;


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/y8s;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/m8g;

    .line 5
    .line 6
    iget-object p1, p1, Ll/dum;->a:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    invoke-direct {v0, p1, p0}, Ll/m8g;-><init>(Lcom/p1/mobile/android/app/Act;Ll/d9g;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/l6t;->C(Ll/iam;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private synthetic D4(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_3

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->FansClubEvent:Lcom/tantan/live/eventbus/LiveEventBus$FansClubEvent;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$FansClubEvent;->showFansClubDialog()Ll/v3f$d;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    invoke-direct {p0}, Ll/d9g;->r4()Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_2

    .line 34
    .line 35
    invoke-direct {p0}, Ll/d9g;->q4()Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_1

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->FansClubEvent:Lcom/tantan/live/eventbus/LiveEventBus$FansClubEvent;

    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$FansClubEvent;->showFansClubDialog()Ll/v3f$d;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 52
    .line 53
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_1
    invoke-direct {p0}, Ll/d9g;->J4()V

    .line 58
    .line 59
    .line 60
    :cond_2
    return-void

    .line 61
    :cond_3
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 62
    .line 63
    check-cast p0, Ll/m8g;

    .line 64
    .line 65
    const/4 p1, 0x0

    .line 66
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->q(Ll/x20;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method private J4()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/m8g;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->E()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/d9g;->H4()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic S3(Ll/d9g;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d9g;->u4(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method

.method public static synthetic T3(Ll/d9g;Ll/ppq;Lcom/p1/mobile/putong/live/base/data/BLiveJoinFanBaseContent;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/d9g;->B4(Ll/ppq;Lcom/p1/mobile/putong/live/base/data/BLiveJoinFanBaseContent;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method

.method public static synthetic U3(Ll/d9g;Ll/cm0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d9g;->y4(Ll/cm0;)V

    return-void
.end method

.method public static synthetic V3(Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ll/a8g;
    .locals 1

    .line 1
    new-instance v0, Ll/a8g;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {v0, p1, p0}, Ll/a8g;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public static synthetic W3(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ll/cm0;
    .locals 1

    .line 1
    new-instance v0, Ll/cm0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/cm0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static synthetic X3(Ll/d9g;Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;Ll/a8g;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/d9g;->A4(Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;Ll/a8g;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Y3(Ll/d9g;Ll/vvl;Ll/a8g;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/d9g;->w4(Ll/vvl;Ll/a8g;)V

    return-void
.end method

.method public static synthetic Z3(Ll/d9g;Ll/drq;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d9g;->E4(Ll/drq;)V

    return-void
.end method

.method public static synthetic a4(Ll/d9g;Ll/e9g;)Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d9g;->G4(Ll/e9g;)Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b4(Ll/d9g;Ll/ppq;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/d9g;->C4(Ll/ppq;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic c4(Ll/d9g;Ll/ppq;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/d9g;->x4(Ll/ppq;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic d4(Ll/d9g;Ll/co5;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d9g;->F4(Ll/co5;)V

    return-void
.end method

.method public static synthetic e4(Ll/d9g;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/d9g;->D4(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic f4(Ll/d9g;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d9g;->v4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic g4(Ll/d9g;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d9g;->z4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static bridge synthetic h4(Ll/d9g;)Ll/a8g;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d9g;->j:Ll/a8g;

    return-object p0
.end method

.method public static bridge synthetic i4(Ll/d9g;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d9g;->n4(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic j4(Ll/d9g;Ll/ppq;Lcom/p1/mobile/putong/live/base/data/BLiveJoinFanBaseContent;Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/d9g;->I4(Ll/ppq;Lcom/p1/mobile/putong/live/base/data/BLiveJoinFanBaseContent;Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;)V

    return-void
.end method

.method public static synthetic k4(Ll/d9g;)Ll/iam;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic l4(Ll/d9g;)Ll/iam;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    return-object p0
.end method

.method private q4()Z
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, Ll/oo2;->r0()Ll/v5g;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0}, Ll/oo2;->r0()Ll/v5g;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0, v0}, Ll/v5g;->c(Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-eqz p0, :cond_0

    .line 42
    .line 43
    const/4 p0, 0x1

    .line 44
    return p0

    .line 45
    :cond_0
    const/4 p0, 0x0

    .line 46
    return p0
.end method

.method private r4()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/oo2;->V0()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method


# virtual methods
.method public final synthetic A4(Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;Ll/a8g;)Lrx/c;
    .locals 0

    .line 1
    iput-object p2, p0, Ll/d9g;->j:Ll/a8g;

    .line 2
    .line 3
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 4
    .line 5
    check-cast p0, Ll/m8g;

    .line 6
    .line 7
    invoke-virtual {p0, p2}, Ll/m8g;->T(Ll/a8g;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;->id:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->N4(Ljava/lang/String;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public final synthetic B4(Ll/ppq;Lcom/p1/mobile/putong/live/base/data/BLiveJoinFanBaseContent;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/ppq;->b()Ll/y20;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const-string v0, "1"

    .line 6
    .line 7
    invoke-interface {p1, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveJoinFanBaseContent;->anchorId:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    invoke-virtual {p2}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p1, p3}, Ll/oo2;->l2(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->reloadGift()Ll/v3f$d;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    const/16 p1, 0x384

    .line 46
    .line 47
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    :cond_0
    return-void
.end method

.method public final synthetic C4(Ll/ppq;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/ppq;->b()Ll/y20;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const-string p2, "0"

    .line 6
    .line 7
    invoke-interface {p1, p2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 11
    .line 12
    check-cast p0, Ll/m8g;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/m8g;->P()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic E4(Ll/drq;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/d9g;->p4(Ll/vvl;)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public final synthetic F4(Ll/co5;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/d9g;->p4(Ll/vvl;)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public final synthetic G4(Ll/e9g;)Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/d9g;->o4()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final H4()V
    .locals 3

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
    goto :goto_0

    .line 12
    :cond_0
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 13
    .line 14
    check-cast v1, Ll/m8g;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    invoke-virtual {v1, v0, v2}, Ll/m8g;->S(Lcom/p1/mobile/putong/data/User;Z)V

    .line 21
    .line 22
    .line 23
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 24
    .line 25
    iget-object v0, v0, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 26
    .line 27
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v1}, Ll/oo2;->r0()Ll/v5g;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v1}, Ll/v5g;->b()Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    if-eqz v1, :cond_1

    .line 44
    .line 45
    iget-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;->id:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {v2, v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->J4(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    new-instance v2, Ll/x8g;

    .line 56
    .line 57
    invoke-direct {v2, v1}, Ll/x8g;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    new-instance v2, Ll/y8g;

    .line 65
    .line 66
    invoke-direct {v2, p0, v1}, Ll/y8g;-><init>(Ll/d9g;Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0, v2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    new-instance v1, Ll/z8g;

    .line 74
    .line 75
    invoke-direct {v1}, Ll/z8g;-><init>()V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    new-instance v1, Ll/a9g;

    .line 83
    .line 84
    invoke-direct {v1, p0}, Ll/a9g;-><init>(Ll/d9g;)V

    .line 85
    .line 86
    .line 87
    new-instance v2, Ll/b9g;

    .line 88
    .line 89
    invoke-direct {v2, p0}, Ll/b9g;-><init>(Ll/d9g;)V

    .line 90
    .line 91
    .line 92
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 97
    .line 98
    .line 99
    :cond_1
    :goto_0
    return-void
.end method

.method public final I4(Ll/ppq;Lcom/p1/mobile/putong/live/base/data/BLiveJoinFanBaseContent;Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;)V
    .locals 1

    .line 1
    iget-object p3, p3, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveJoinFanBaseContent;->userId:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p3, v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->k6(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    invoke-virtual {p0, p3}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p3

    .line 13
    new-instance v0, Ll/s8g;

    .line 14
    .line 15
    invoke-direct {v0, p0, p1, p2}, Ll/s8g;-><init>(Ll/d9g;Ll/ppq;Lcom/p1/mobile/putong/live/base/data/BLiveJoinFanBaseContent;)V

    .line 16
    .line 17
    .line 18
    new-instance p2, Ll/t8g;

    .line 19
    .line 20
    invoke-direct {p2, p0, p1}, Ll/t8g;-><init>(Ll/d9g;Ll/ppq;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v0, p2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p3, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final K4()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->FansClubEvent:Lcom/tantan/live/eventbus/LiveEventBus$FansClubEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$FansClubEvent;->showFansClubDialog()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final m4()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/eb20;->b()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->w9:I

    .line 8
    .line 9
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public n()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/d9g;->j:Ll/a8g;

    .line 6
    .line 7
    return-void
.end method

.method public final n4(Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->k6(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

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
    new-instance v0, Ll/q8g;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Ll/q8g;-><init>(Ll/d9g;)V

    .line 20
    .line 21
    .line 22
    new-instance v1, Ll/r8g;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/r8g;-><init>(Ll/d9g;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final o4()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/d9g;->j:Ll/a8g;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Ll/a8g;->a:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Ll/htd0;->c:Ll/htd0;

    .line 10
    .line 11
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ll/hiv;

    .line 16
    .line 17
    iget-object p0, p0, Ll/d9g;->j:Ll/a8g;

    .line 18
    .line 19
    iget-object p0, p0, Ll/a8g;->a:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;->joinFanbase:Lcom/p1/mobile/putong/live/base/data/BLiveJoinFanBase;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveJoinFanBase;->giftId:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v0, p0}, Ll/hiv;->m(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0

    .line 30
    :cond_0
    const/4 p0, 0x0

    .line 31
    return-object p0
.end method

.method public final p4(Ll/vvl;)V
    .locals 3

    .line 1
    invoke-interface {p1}, Ll/vvl;->b()Ll/ppq;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/ppq;->a()Lcom/p1/mobile/putong/live/base/data/BLiveJoinFanBaseContent;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-interface {p1}, Ll/vvl;->b()Ll/ppq;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v1}, Ll/ppq;->a()Lcom/p1/mobile/putong/live/base/data/BLiveJoinFanBaseContent;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iget-object v2, p0, Ll/d9g;->j:Ll/a8g;

    .line 23
    .line 24
    if-eqz v2, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0, p1, v2}, Ll/d9g;->s4(Ll/vvl;Ll/a8g;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    invoke-static {v1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->K4(Lcom/p1/mobile/putong/live/base/data/BLiveJoinFanBaseContent;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {p0, v1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    new-instance v2, Ll/c9g;

    .line 39
    .line 40
    invoke-direct {v2, p0, p1}, Ll/c9g;-><init>(Ll/d9g;Ll/vvl;)V

    .line 41
    .line 42
    .line 43
    new-instance p1, Ll/p8g;

    .line 44
    .line 45
    invoke-direct {p1, p0, v0}, Ll/p8g;-><init>(Ll/d9g;Ll/ppq;)V

    .line 46
    .line 47
    .line 48
    invoke-static {v2, p1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {v1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 53
    .line 54
    .line 55
    :cond_2
    :goto_0
    return-void
.end method

.method public final s4(Ll/vvl;Ll/a8g;)V
    .locals 2

    .line 1
    iput-object p2, p0, Ll/d9g;->j:Ll/a8g;

    .line 2
    .line 3
    iget-object p2, p2, Ll/a8g;->a:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/d9g;->m4()Z

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
    if-nez p2, :cond_1

    .line 13
    .line 14
    invoke-interface {p1}, Ll/vvl;->b()Ll/ppq;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p1}, Ll/ppq;->b()Ll/y20;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const-string p2, "0"

    .line 23
    .line 24
    invoke-interface {p1, p2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 28
    .line 29
    check-cast p0, Ll/m8g;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/m8g;->P()V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;->joinFanbase:Lcom/p1/mobile/putong/live/base/data/BLiveJoinFanBase;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveJoinFanBase;->giftId:Ljava/lang/String;

    .line 38
    .line 39
    new-instance v1, Ll/d9g$a;

    .line 40
    .line 41
    invoke-direct {v1, p0, p1, p2}, Ll/d9g$a;-><init>(Ll/d9g;Ll/vvl;Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;)V

    .line 42
    .line 43
    .line 44
    invoke-interface {p1, p0, v0, v1}, Ll/vvl;->a(Ll/i6t;Ljava/lang/String;Ll/aiv$a$a;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/oo2;->D0()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "group_profile_fans"

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-direct {p0}, Ll/d9g;->J4()V

    .line 21
    .line 22
    .line 23
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->FansClubEntryEvent:Lcom/tantan/live/eventbus/LiveEventBus$FansClubEntryEvent;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$FansClubEntryEvent;->openEntry()Ll/v3f$d;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lrx/c;

    .line 38
    .line 39
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    new-instance v1, Ll/o8g;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Ll/o8g;-><init>(Ll/d9g;)V

    .line 46
    .line 47
    .line 48
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LiveBridgeImplEvent:Lcom/tantan/live/eventbus/LiveEventBus$LiveBridgeImplEvent;

    .line 60
    .line 61
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LiveBridgeImplEvent;->fanBaseController()Ll/v3f$d;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    check-cast v0, Lrx/c;

    .line 70
    .line 71
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    new-instance v1, Ll/u8g;

    .line 76
    .line 77
    invoke-direct {v1, p0}, Ll/u8g;-><init>(Ll/d9g;)V

    .line 78
    .line 79
    .line 80
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->FansClubEntryEvent:Lcom/tantan/live/eventbus/LiveEventBus$FansClubEntryEvent;

    .line 92
    .line 93
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$FansClubEntryEvent;->companyFansGift()Ll/v3f$d;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    check-cast v0, Lrx/c;

    .line 102
    .line 103
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    new-instance v1, Ll/v8g;

    .line 108
    .line 109
    invoke-direct {v1, p0}, Ll/v8g;-><init>(Ll/d9g;)V

    .line 110
    .line 111
    .line 112
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 117
    .line 118
    .line 119
    new-instance v0, Ll/w8g;

    .line 120
    .line 121
    invoke-direct {v0, p0}, Ll/w8g;-><init>(Ll/d9g;)V

    .line 122
    .line 123
    .line 124
    const-class v1, Ll/e9g;

    .line 125
    .line 126
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 127
    .line 128
    .line 129
    return-void
.end method

.method public t4()V
    .locals 8

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
    iget-object v1, p0, Ll/d9g;->j:Ll/a8g;

    .line 10
    .line 11
    if-eqz v1, :cond_3

    .line 12
    .line 13
    iget-object v1, v1, Ll/a8g;->a:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;

    .line 14
    .line 15
    if-eqz v1, :cond_3

    .line 16
    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->matchedOrFollowed()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    const-string v2, "fanbase_entry"

    .line 35
    .line 36
    const/4 v3, 0x1

    .line 37
    invoke-virtual {v0, v3, v1, v2}, Ll/oo2;->d0(ZLjava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    :cond_1
    invoke-virtual {p0}, Ll/d9g;->m4()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_2

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->SendGiftEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$SendGiftEventGroup;

    .line 52
    .line 53
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$SendGiftEventGroup;->sendGift()Ll/v3f$d;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    new-instance v1, Ll/hne0$a;

    .line 58
    .line 59
    invoke-direct {v1}, Ll/hne0$a;-><init>()V

    .line 60
    .line 61
    .line 62
    iget-object v2, p0, Ll/d9g;->j:Ll/a8g;

    .line 63
    .line 64
    iget-object v2, v2, Ll/a8g;->a:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;

    .line 65
    .line 66
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;->joinFanbase:Lcom/p1/mobile/putong/live/base/data/BLiveJoinFanBase;

    .line 67
    .line 68
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveJoinFanBase;->giftId:Ljava/lang/String;

    .line 69
    .line 70
    new-instance v3, Ll/d9g$b;

    .line 71
    .line 72
    invoke-direct {v3, p0}, Ll/d9g$b;-><init>(Ll/d9g;)V

    .line 73
    .line 74
    .line 75
    const-string p0, "fans"

    .line 76
    .line 77
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->getNativeTraceServerData(Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 82
    .line 83
    .line 84
    move-result-object v7

    .line 85
    const/4 v4, 0x1

    .line 86
    const-string v5, "fans_club"

    .line 87
    .line 88
    const-string v6, "join_club"

    .line 89
    .line 90
    invoke-virtual/range {v1 .. v7}, Ll/hne0$a;->u(Ljava/lang/String;Ll/aiv$a$a;ILjava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;)Ll/hne0$a;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-virtual {p0}, Ll/hne0$a;->t()Ll/hne0;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    invoke-virtual {v0, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 99
    .line 100
    .line 101
    :cond_3
    :goto_0
    return-void
.end method

.method public final synthetic u4(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/m8g;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/m8g;->Q()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0, p1}, Ll/oo2;->l2(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast p1, Ll/m8g;

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->q(Ll/x20;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ll/d9g;->K4()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->reloadGift()Ll/v3f$d;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    const/16 v0, 0x384

    .line 37
    .line 38
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {p1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {p1}, Ll/oo2;->D0()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    const-string v0, "group_profile_fans"

    .line 54
    .line 55
    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    if-eqz p1, :cond_0

    .line 60
    .line 61
    new-instance p1, Ll/d9g$c;

    .line 62
    .line 63
    invoke-direct {p1, p0}, Ll/d9g$c;-><init>(Ll/d9g;)V

    .line 64
    .line 65
    .line 66
    const-wide/16 v0, 0x1f4

    .line 67
    .line 68
    invoke-virtual {p0, v0, v1, p1}, Ll/i6t;->z3(JLjava/lang/Runnable;)V

    .line 69
    .line 70
    .line 71
    :cond_0
    return-void
.end method

.method public final synthetic v4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/m8g;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/m8g;->P()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic w4(Ll/vvl;Ll/a8g;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/d9g;->s4(Ll/vvl;Ll/a8g;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic x4(Ll/ppq;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/ppq;->b()Ll/y20;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const-string p2, "0"

    .line 6
    .line 7
    invoke-interface {p1, p2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 11
    .line 12
    check-cast p0, Ll/m8g;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/m8g;->P()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic y4(Ll/cm0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/m8g;

    .line 4
    .line 5
    iget-object p0, p0, Ll/d9g;->j:Ll/a8g;

    .line 6
    .line 7
    invoke-virtual {v0, p1, p0}, Ll/m8g;->U(Ll/cm0;Ll/a8g;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic z4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/m8g;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/m8g;->R(Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
