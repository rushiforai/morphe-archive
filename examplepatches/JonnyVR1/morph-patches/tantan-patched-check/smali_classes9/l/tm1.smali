.class public Ll/tm1;
.super Ll/in1;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/in1<",
        "Ll/mu40;",
        ">;"
    }
.end annotation


# instance fields
.field public k:Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;

.field public final l:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/in1;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Ll/tm1;->k:Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;

    .line 6
    .line 7
    sget-object p1, Ll/uqb0;->b0:Ll/sre0;

    .line 8
    .line 9
    iget-object p1, p1, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 10
    .line 11
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Ll/tm1;->l:Ljava/lang/String;

    .line 16
    .line 17
    return-void
.end method

.method public static synthetic o4(Ll/tm1;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ll/v5g;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tm1;->v4(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ll/v5g;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic p4(Ll/tm1;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tm1;->t4(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic q4(Ll/tm1;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/tm1;->x4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic r4(Ll/tm1;Ll/v5g;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tm1;->w4(Ll/v5g;)V

    return-void
.end method

.method public static synthetic s4(Ll/tm1;Lrx/Notification;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tm1;->u4(Lrx/Notification;)V

    return-void
.end method

.method private synthetic x4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/in1;->m4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public b4()Z
    .locals 1

    .line 1
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wrv;->G()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ll/mu40;

    .line 14
    .line 15
    iget-boolean v0, v0, Ll/oo2;->D:Z

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Ll/mu40;

    .line 24
    .line 25
    iget-object p0, p0, Ll/oo2;->B:Ll/x7g;

    .line 26
    .line 27
    iget-object p0, p0, Ll/x7g;->b:Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;

    .line 28
    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    return p0

    .line 33
    :cond_0
    const/4 p0, 0x0

    .line 34
    return p0

    .line 35
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    check-cast p0, Ll/mu40;

    .line 40
    .line 41
    iget-boolean p0, p0, Ll/oo2;->D:Z

    .line 42
    .line 43
    return p0
.end method

.method public l4(I)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/in1;->l4(I)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x3

    .line 5
    if-ne p1, v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Ll/mu40;

    .line 12
    .line 13
    iget-boolean p1, p1, Ll/oo2;->D:Z

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->FansClubEvent:Lcom/tantan/live/eventbus/LiveEventBus$FansClubEvent;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$FansClubEvent;->showFansClubDialog()Ll/v3f$d;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Ll/tm1;->z4()V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public n()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/in1;->n()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/tm1;->k:Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;

    .line 6
    .line 7
    return-void
.end method

.method public t()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/in1;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Ll/mu40;

    .line 9
    .line 10
    iget-boolean v0, v0, Ll/oo2;->D:Z

    .line 11
    .line 12
    if-eqz v0, :cond_2

    .line 13
    .line 14
    iget-object v0, p0, Ll/tm1;->l:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    const-string v0, "null"

    .line 23
    .line 24
    iget-object v1, p0, Ll/tm1;->l:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    :cond_0
    new-instance v0, Ljava/lang/Exception;

    .line 33
    .line 34
    const-string v1, "AvatarLivePresenter getAnchorFanbases"

    .line 35
    .line 36
    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 40
    .line 41
    .line 42
    :cond_1
    iget-object v0, p0, Ll/tm1;->l:Ljava/lang/String;

    .line 43
    .line 44
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->t4(Ljava/lang/String;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    new-instance v1, Ll/pm1;

    .line 53
    .line 54
    invoke-direct {v1, p0}, Ll/pm1;-><init>(Ll/tm1;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    new-instance v1, Ll/qm1;

    .line 62
    .line 63
    invoke-direct {v1, p0}, Ll/qm1;-><init>(Ll/tm1;)V

    .line 64
    .line 65
    .line 66
    new-instance v2, Ll/rm1;

    .line 67
    .line 68
    invoke-direct {v2, p0}, Ll/rm1;-><init>(Ll/tm1;)V

    .line 69
    .line 70
    .line 71
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 76
    .line 77
    .line 78
    :cond_2
    return-void
.end method

.method public final synthetic t4(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-lez p1, :cond_0

    .line 10
    .line 11
    const/4 p1, 0x1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p1, 0x0

    .line 14
    :goto_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->B(Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic u4(Lrx/Notification;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/AvatarView;->B(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic v4(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ll/v5g;
    .locals 2

    .line 1
    new-instance v0, Ll/v5g;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbases:Ljava/util/List;

    .line 6
    .line 7
    sget-object v1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 8
    .line 9
    invoke-direct {v0, p1, v1}, Ll/v5g;-><init>(Ljava/util/List;Ljava/util/List;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Ll/mu40;

    .line 17
    .line 18
    iget-object p0, p0, Ll/oo2;->B:Ll/x7g;

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/v5g;->b()Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iput-object p1, p0, Ll/x7g;->b:Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;

    .line 25
    .line 26
    return-object v0
.end method

.method public final synthetic w4(Ll/v5g;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/v5g;->b()Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Ll/tm1;->k:Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/in1;->m4()V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Ll/tm1;->k:Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;

    .line 11
    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;->id:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ll/tm1;->y4(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public final y4(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->O4(Ljava/lang/String;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    new-instance v0, Ll/sm1;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/sm1;-><init>(Ll/tm1;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final z4()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/tm1;->k:Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->V6(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lrx/c;->materialize()Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/om1;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/om1;-><init>(Ll/tm1;)V

    .line 22
    .line 23
    .line 24
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method
