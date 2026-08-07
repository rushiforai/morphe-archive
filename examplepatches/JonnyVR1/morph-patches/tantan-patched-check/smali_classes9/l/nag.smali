.class public Ll/nag;
.super Ll/acg;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/acg;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public C4()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/acg;->C4()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/lag;

    .line 5
    .line 6
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 7
    .line 8
    invoke-direct {v0, v1, p0}, Ll/lag;-><init>(Ll/dum;Ll/tk2;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 15
    .line 16
    check-cast v0, Ll/f8g;

    .line 17
    .line 18
    iget-object v0, v0, Ll/f8g;->y:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubEventView;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubEventView;->c:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/tab/FansClubTabView;->k()V

    .line 23
    .line 24
    .line 25
    new-instance v0, Ll/xhg;

    .line 26
    .line 27
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 28
    .line 29
    invoke-direct {v0, v1}, Ll/xhg;-><init>(Ll/dum;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 33
    .line 34
    .line 35
    new-instance v0, Ll/ahg;

    .line 36
    .line 37
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 38
    .line 39
    invoke-direct {v0, v1}, Ll/ahg;-><init>(Ll/dum;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public F4()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/acg;->j:Ll/x7g;

    .line 2
    .line 3
    iget-object v0, v0, Ll/x7g;->b:Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->FansClubMedalEvent:Lcom/tantan/live/eventbus/LiveEventBus$FansClubMedalEvent;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$FansClubMedalEvent;->showDialog()Ll/v3f$d;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public O3()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->FansRecallEvent:Lcom/tantan/live/eventbus/LiveEventBus$FansRecallEvent;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$FansRecallEvent;->hideFansRecallSelectPanel()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    invoke-super {p0}, Ll/acg;->O3()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public t()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/acg;->t()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
