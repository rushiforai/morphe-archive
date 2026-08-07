.class public Ll/gil;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/oo2;",
        "Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Z

.field public j:Z

.field public k:Z


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ll/gil;->j:Z

    .line 6
    .line 7
    iput-boolean p1, p0, Ll/gil;->k:Z

    .line 8
    .line 9
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic J3(Ll/gil;Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/gil;->N3(Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData;)V

    return-void
.end method

.method public static synthetic K3(Ll/gil;Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gil;->O3(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;)V

    return-void
.end method

.method public static synthetic L3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method private synthetic N3(Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData;->b()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iput-boolean p1, p0, Ll/gil;->k:Z

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/gil;->M3()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final M3()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;

    .line 4
    .line 5
    iget-boolean v1, p0, Ll/gil;->i:Z

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-boolean p0, p0, Ll/gil;->k:Z

    .line 10
    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    :goto_0
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->J(Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic O3(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->currentHourSuggestConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCurrentHourSuggestConfig;

    .line 2
    .line 3
    iget-boolean v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCurrentHourSuggestConfig;->enable:Z

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->isOpen:Z

    .line 8
    .line 9
    iput-boolean v0, p0, Ll/gil;->i:Z

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/gil;->M3()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Ll/vp20;->o()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->roomId:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 31
    .line 32
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->setNewRank(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void

    .line 38
    :cond_1
    const/4 p1, 0x0

    .line 39
    iput-boolean p1, p0, Ll/gil;->i:Z

    .line 40
    .line 41
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 42
    .line 43
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->J(Z)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public P3()V
    .locals 2

    .line 1
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/vwt;->v4()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_1

    .line 14
    .line 15
    const/4 v1, 0x2

    .line 16
    invoke-static {v1}, Ll/wft;->b(I)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->SchemeHandleEvent:Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;->handleScheme()Ll/v3f$d;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const/16 v1, 0xd48

    .line 34
    .line 35
    invoke-static {v1, v0}, Ll/bae0;->b(ILjava/lang/String;)Ll/bae0;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_1
    :goto_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->HourLeaderBoardEvent:Lcom/tantan/live/eventbus/LiveEventBus$HourLeaderBoardEvent;

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$HourLeaderBoardEvent;->show()Ll/v3f$d;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 54
    .line 55
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->init()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->KeyboardEvent:Lcom/tantan/live/eventbus/LiveEventBus$KeyboardEvent;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$KeyboardEvent;->show()Ll/v3f$d;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lrx/c;

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/dil;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/dil;-><init>(Ll/gil;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 41
    .line 42
    .line 43
    return-void
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
    iput-boolean v0, p0, Ll/gil;->k:Z

    .line 6
    .line 7
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
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/aj1;->d()Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/eil;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/eil;-><init>(Ll/gil;)V

    .line 23
    .line 24
    .line 25
    new-instance p0, Ll/fil;

    .line 26
    .line 27
    invoke-direct {p0}, Ll/fil;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 35
    .line 36
    .line 37
    return-void
.end method
