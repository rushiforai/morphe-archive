.class public Ll/gzn0;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/oo2;",
        "Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/leaderboard/hourleaderboard/widget/VoiceLiveHourBoardEntryView;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/leaderboard/hourleaderboard/widget/VoiceLiveHourBoardEntryView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/oo2;",
            ">;",
            "Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/leaderboard/hourleaderboard/widget/VoiceLiveHourBoardEntryView;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic J3(Ll/gzn0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gzn0;->K3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;)V

    return-void
.end method


# virtual methods
.method public final synthetic K3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/vp20;->o()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->roomId:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 18
    .line 19
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/leaderboard/hourleaderboard/widget/VoiceLiveHourBoardEntryView;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/leaderboard/hourleaderboard/widget/VoiceLiveHourBoardEntryView;->setNewRank(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public L3()V
    .locals 3

    .line 1
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/vwt;->A4()Ljava/lang/String;

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
    if-nez v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iget-object v1, v1, Lcom/tantan/live/eventbus/LiveEventBus;->SchemeHandleEvent:Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;->handleScheme()Ll/v3f$d;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const/16 v2, 0x464

    .line 26
    .line 27
    invoke-static {v2, v0}, Ll/bae0;->b(ILjava/lang/String;)Ll/bae0;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-eqz p0, :cond_1

    .line 39
    .line 40
    invoke-static {}, Ll/v1n0;->k()V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_1
    invoke-static {}, Ll/v1n0;->l()V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public T()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/leaderboard/hourleaderboard/widget/VoiceLiveHourBoardEntryView;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/leaderboard/hourleaderboard/widget/VoiceLiveHourBoardEntryView;->init()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/vwt;->r7()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/leaderboard/hourleaderboard/widget/VoiceLiveHourBoardEntryView;

    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/leaderboard/hourleaderboard/widget/VoiceLiveHourBoardEntryView;->B(Z)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Ll/aj1;->F0()Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    new-instance v1, Ll/fzn0;

    .line 39
    .line 40
    invoke-direct {v1, p0}, Ll/fzn0;-><init>(Ll/gzn0;)V

    .line 41
    .line 42
    .line 43
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_0
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/leaderboard/hourleaderboard/widget/VoiceLiveHourBoardEntryView;

    .line 52
    .line 53
    const/4 p0, 0x0

    .line 54
    invoke-virtual {v1, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/leaderboard/hourleaderboard/widget/VoiceLiveHourBoardEntryView;->B(Z)V

    .line 55
    .line 56
    .line 57
    return-void
.end method
