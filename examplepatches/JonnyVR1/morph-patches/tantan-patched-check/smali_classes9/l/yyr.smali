.class public Ll/yyr;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/oo2;",
        "Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2, p3}, Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;->setPlayerMaskView(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic J3(Ll/yyr;Ll/vyr;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yyr;->L3(Ll/vyr;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic K3(Ll/yyr;Ll/vyr;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yyr;->M3(Ll/vyr;)V

    return-void
.end method


# virtual methods
.method public final synthetic L3(Ll/vyr;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/vp20;->m()Ll/jsv;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/jsv;->j()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic M3(Ll/vyr;)V
    .locals 3

    .line 1
    iget v0, p1, Ll/vyr;->c:I

    .line 2
    .line 3
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 4
    .line 5
    const/4 v2, -0x1

    .line 6
    if-ne v0, v2, :cond_0

    .line 7
    .line 8
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-virtual {v1, v2, v0}, Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;->c(ZI)V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;

    .line 16
    .line 17
    const/4 v2, 0x1

    .line 18
    invoke-virtual {v1, v2, v0}, Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;->c(ZI)V

    .line 19
    .line 20
    .line 21
    :goto_0
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 22
    .line 23
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;

    .line 24
    .line 25
    iget-object v0, p1, Ll/vyr;->a:Ljava/lang/String;

    .line 26
    .line 27
    iget-object p1, p1, Ll/vyr;->b:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public T()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    instance-of v0, v0, Ll/mc50;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 13
    .line 14
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;

    .line 15
    .line 16
    const/4 v0, 0x1

    .line 17
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/base/room/LiveBgView;->setOfficialShowMode(Z)V

    .line 18
    .line 19
    .line 20
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
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LiveBgEvent:Lcom/tantan/live/eventbus/LiveEventBus$LiveBgEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LiveBgEvent;->showBg()Ll/v3f$d;

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
    new-instance v1, Ll/wyr;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/wyr;-><init>(Ll/yyr;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/xyr;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/xyr;-><init>(Ll/yyr;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    return-void
.end method
