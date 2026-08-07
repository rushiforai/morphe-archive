.class public final Ll/wo10;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/oo2;",
        "Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallSettingsView;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0007\u0018\u00002\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001B\u001d\u0012\u000c\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00050\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u000f\u0010\u000b\u001a\u00020\nH\u0016\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u0017\u0010\u000f\u001a\u00020\n2\u0008\u0008\u0001\u0010\u000e\u001a\u00020\r\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\u0015\u0010\u0013\u001a\u00020\n2\u0006\u0010\u0012\u001a\u00020\u0011\u00a2\u0006\u0004\u0008\u0013\u0010\u0014J\u0015\u0010\u0015\u001a\u00020\n2\u0006\u0010\u0012\u001a\u00020\u0011\u00a2\u0006\u0004\u0008\u0015\u0010\u0014J\r\u0010\u0016\u001a\u00020\n\u00a2\u0006\u0004\u0008\u0016\u0010\u000cJ\r\u0010\u0017\u001a\u00020\n\u00a2\u0006\u0004\u0008\u0017\u0010\u000c\u00a8\u0006\u0018"
    }
    d2 = {
        "Ll/wo10;",
        "Ll/i6t;",
        "Ll/oo2;",
        "Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallSettingsView;",
        "Ll/dum;",
        "Ll/mu40;",
        "info",
        "settingView",
        "<init>",
        "(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallSettingsView;)V",
        "",
        "t",
        "()V",
        "",
        "count",
        "T3",
        "(I)V",
        "",
        "accept",
        "O3",
        "(Z)V",
        "S3",
        "R3",
        "P3",
        "livingroom_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallSettingsView;)V
    .locals 0
    .param p1    # Ll/dum;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallSettingsView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "Ll/mu40;",
            ">;",
            "Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallSettingsView;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static J3(Ll/wo10;IILandroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-virtual {p3}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    iget-object p3, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {p3, v0, p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->P7(Ljava/lang/String;Ljava/lang/String;I)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p3

    .line 23
    invoke-virtual {p0, p3}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p3

    .line 27
    new-instance v0, Ll/vo10;

    .line 28
    .line 29
    invoke-direct {v0, p2, p1, p0}, Ll/vo10;-><init>(IILl/wo10;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v0}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p3, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public static synthetic K3(IILl/wo10;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Ll/wo10;->U3(IILl/wo10;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static L3(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->R8:I

    .line 8
    .line 9
    invoke-static {p0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Q8:I

    .line 18
    .line 19
    invoke-static {p0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static M3(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->V8:I

    .line 8
    .line 9
    invoke-static {p0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->U8:I

    .line 18
    .line 19
    invoke-static {p0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static N3(Ll/wo10;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAsset;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallSettingsView;

    .line 4
    .line 5
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAsset;->rejectInvite:Z

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallSettingsView;->q0(Z)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 11
    .line 12
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallSettingsView;

    .line 13
    .line 14
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAsset;->freeCall:Z

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallSettingsView;->p0(Z)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 20
    .line 21
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallSettingsView;

    .line 22
    .line 23
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAsset;->maxCallNum:I

    .line 24
    .line 25
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallAsset;->canSwitchMaxCallNum:Z

    .line 26
    .line 27
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallSettingsView;->s0(IZ)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public static final U3(IILl/wo10;Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-object p0, p2, Ll/cyr;->viewModel:Ll/iam;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallSettingsView;

    .line 13
    .line 14
    const/4 p3, 0x2

    .line 15
    const/4 v0, 0x0

    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-static {p0, p1, v1, p3, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallSettingsView;->t0(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallSettingsView;IZILjava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p2}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->MultiCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->switchDeputyCount()Ll/v3f$d;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p2}, Ll/wo10;->P3()V

    .line 38
    .line 39
    .line 40
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->le:I

    .line 41
    .line 42
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 43
    .line 44
    .line 45
    :cond_0
    return-void
.end method


# virtual methods
.method public final O3(Z)V
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
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v1}, Ll/vp20;->k()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-static {v0, p1, v1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->u3(Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    new-instance p1, Ll/to10;

    .line 35
    .line 36
    invoke-direct {p1}, Ll/to10;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-static {p1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final P3()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->MultiCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->openManageDialog()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/16 v0, -0x64

    .line 12
    .line 13
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final R3()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xzs;->e:Ll/dum;

    .line 2
    .line 3
    iget-object v0, v0, Ll/dum;->j:Ll/x6t;

    .line 4
    .line 5
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;->multi_call:Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/x6t;->L3(Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->MultiCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->prepareCloseMultiCall()Ll/v3f$d;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public final S3(Z)V
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
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v1}, Ll/vp20;->k()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-static {v0, p1, v1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->x6(Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    new-instance p1, Ll/uo10;

    .line 35
    .line 36
    invoke-direct {p1}, Ll/uo10;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-static {p1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final T3(I)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallSettingsView;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallSettingsView;->getCurrentSelectedDeputyCount()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-le p1, v0, :cond_0

    .line 10
    .line 11
    new-instance v1, Ll/th0$a;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/cyr;->C0()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-direct {v1, v2}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 18
    .line 19
    .line 20
    sget-object v2, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    .line 21
    .line 22
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->t2:I

    .line 23
    .line 24
    invoke-static {v2}, Ll/xau;->t(I)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 29
    .line 30
    .line 31
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    const/4 v4, 0x1

    .line 40
    invoke-static {v3, v4}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-virtual {v1, v2}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->o2:I

    .line 53
    .line 54
    invoke-virtual {v1, v2}, Ll/th0$a;->q(I)Ll/th0$a;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    const/4 v2, 0x0

    .line 59
    invoke-virtual {v1, v2}, Ll/th0$a;->h(Z)Ll/th0$a;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    new-instance v2, Ll/ro10;

    .line 64
    .line 65
    invoke-direct {v2, p0, p1, v0}, Ll/ro10;-><init>(Ll/wo10;II)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v1, v2}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->N1:I

    .line 73
    .line 74
    invoke-virtual {p0, p1}, Ll/th0$a;->e(I)Ll/th0$a;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 83
    .line 84
    .line 85
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
    sget-object v0, Ll/htd0;->e:Ll/htd0;

    .line 5
    .line 6
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Ll/ifv;

    .line 11
    .line 12
    iget-object v0, v0, Ll/ifv;->d:Ll/qjt;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/hxd0;->obs()Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/so10;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/so10;-><init>(Ll/wo10;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

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
