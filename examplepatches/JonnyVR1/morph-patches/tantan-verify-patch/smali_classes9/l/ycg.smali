.class public Ll/ycg;
.super Ll/tk2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/tk2<",
        "Ll/ucg;",
        ">;"
    }
.end annotation


# instance fields
.field public j:Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;

.field public k:Ljava/lang/String;

.field public l:I

.field public m:Ljava/lang/String;

.field public n:Ll/vk2;


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 6

    .line 1
    invoke-direct {p0, p1}, Ll/tk2;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/nbg;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/nbg;-><init>()V

    .line 7
    .line 8
    .line 9
    new-instance v1, Ll/q9g;

    .line 10
    .line 11
    invoke-direct {v1}, Ll/q9g;-><init>()V

    .line 12
    .line 13
    .line 14
    new-instance v2, Ll/x9g;

    .line 15
    .line 16
    invoke-direct {v2}, Ll/x9g;-><init>()V

    .line 17
    .line 18
    .line 19
    new-instance v3, Ll/u9g;

    .line 20
    .line 21
    invoke-direct {v3}, Ll/u9g;-><init>()V

    .line 22
    .line 23
    .line 24
    const/4 v4, 0x4

    .line 25
    new-array v4, v4, [Ll/vr4;

    .line 26
    .line 27
    const/4 v5, 0x0

    .line 28
    aput-object v0, v4, v5

    .line 29
    .line 30
    const/4 v0, 0x1

    .line 31
    aput-object v1, v4, v0

    .line 32
    .line 33
    const/4 v0, 0x2

    .line 34
    aput-object v2, v4, v0

    .line 35
    .line 36
    const/4 v0, 0x3

    .line 37
    aput-object v3, v4, v0

    .line 38
    .line 39
    invoke-static {v4}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-static {v0}, Ll/vr4;->a(Ljava/util/List;)Ll/vr4;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Ll/vk2;

    .line 48
    .line 49
    iput-object v0, p0, Ll/ycg;->n:Ll/vk2;

    .line 50
    .line 51
    new-instance v0, Ll/ucg;

    .line 52
    .line 53
    iget-object p1, p1, Ll/dum;->a:Lcom/p1/mobile/android/app/Act;

    .line 54
    .line 55
    invoke-direct {v0, p1, p0}, Ll/ucg;-><init>(Lcom/p1/mobile/android/app/Act;Ll/ycg;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0, v0}, Ll/l6t;->C(Ll/iam;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public static synthetic i4(Ll/ycg;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ycg;->k4(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic j4(Ll/ycg;Ll/kx50;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ycg;->l4(Ll/kx50;)V

    return-void
.end method


# virtual methods
.method public final synthetic k4(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast p1, Ll/ucg;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->FansClubEvent:Lcom/tantan/live/eventbus/LiveEventBus$FansClubEvent;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$FansClubEvent;->hideFansClubCompanyDialog()Ll/v3f$c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public final synthetic l4(Ll/kx50;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/kx50;->c()Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/kx50;->c()Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Ll/ycg;->j:Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/kx50;->b()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Ll/ycg;->k:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/kx50;->a()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iput v0, p0, Ll/ycg;->l:I

    .line 24
    .line 25
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 26
    .line 27
    check-cast v0, Ll/ucg;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->E()V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 33
    .line 34
    check-cast v0, Ll/ucg;

    .line 35
    .line 36
    invoke-virtual {p1}, Ll/kx50;->d()Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    invoke-virtual {p1}, Ll/kx50;->c()Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {v0, v1, p1}, Ll/ucg;->O(ZLcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Ll/ycg;->n:Ll/vk2;

    .line 48
    .line 49
    invoke-virtual {p1, p0}, Ll/vk2;->j(Ll/ycg;)V

    .line 50
    .line 51
    .line 52
    :cond_0
    return-void
.end method

.method public m4()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/oo2;->r0()Ll/v5g;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Ll/uqb0;->b0:Ll/sre0;

    .line 10
    .line 11
    iget-object v1, v1, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 12
    .line 13
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Ll/v5g;->c(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    const-string v0, "fanbase_accompany"

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const-string v0, "fanbase_accompany_and_join_fanbase"

    .line 27
    .line 28
    :goto_0
    iput-object v0, p0, Ll/ycg;->m:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v0, p0, Ll/ycg;->n:Ll/vk2;

    .line 31
    .line 32
    new-instance v1, Ll/xcg;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Ll/xcg;-><init>(Ll/ycg;)V

    .line 35
    .line 36
    .line 37
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {v0, p0}, Ll/vk2;->i(Ll/pf60;)Ll/vxj0;

    .line 42
    .line 43
    .line 44
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
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->FansClubEvent:Lcom/tantan/live/eventbus/LiveEventBus$FansClubEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$FansClubEvent;->showFansClubSendGiftDialog()Ll/v3f$d;

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
    new-instance v1, Ll/wcg;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/wcg;-><init>(Ll/ycg;)V

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
