.class public Ll/p1p0;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/rwn0;",
        "Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetRankListView;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetRankListView;)V
    .locals 0

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

.method public static synthetic J3(Ll/p1p0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/p1p0;->M3(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic K3(Ll/p1p0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpLeaderBoards;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/p1p0;->L3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpLeaderBoards;)V

    return-void
.end method


# virtual methods
.method public final synthetic L3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpLeaderBoards;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetRankListView;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetRankListView;->q0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpLeaderBoards;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic M3(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetRankListView;

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->J9:I

    .line 7
    .line 8
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetRankListView;->r0(ZI)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetRankListView;

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetRankListView;->q0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpLeaderBoards;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public N3()V
    .locals 3

    .line 1
    invoke-static {}, Ll/fwo0;->l()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/n1p0;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/n1p0;-><init>(Ll/p1p0;)V

    .line 12
    .line 13
    .line 14
    new-instance v2, Ll/o1p0;

    .line 15
    .line 16
    invoke-direct {v2, p0}, Ll/o1p0;-><init>(Ll/p1p0;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public t()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
