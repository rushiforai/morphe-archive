.class public Ll/mwp0;
.super Ll/qhl;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/oo2;",
        ">",
        "Ll/qhl<",
        "TD;",
        "Ll/jwp0;",
        ">;"
    }
.end annotation


# instance fields
.field public j:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TD;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/qhl;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/mwp0;->j:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ll/jwp0;

    .line 12
    .line 13
    iget-object p1, p1, Ll/dum;->a:Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    invoke-direct {v0, p1}, Ll/jwp0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ll/l6t;->C(Ll/iam;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static synthetic W3(Ll/mwp0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/mwp0;->a4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic X3(Ll/mwp0;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/mwp0;->Z3(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method

.method private synthetic Z3(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/jwp0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/jwp0;->m()V

    .line 6
    .line 7
    .line 8
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 9
    .line 10
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->anchorLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLeaderboard;

    .line 11
    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast v0, Ll/jwp0;

    .line 18
    .line 19
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLeaderboard;->notices:Ljava/util/List;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ll/jwp0;->k(Ljava/util/List;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 25
    .line 26
    check-cast v0, Ll/jwp0;

    .line 27
    .line 28
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLeaderboard;->currentLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ll/jwp0;->j(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLeaderboard;->leaderboards:Ljava/util/List;

    .line 34
    .line 35
    iput-object p1, p0, Ll/mwp0;->j:Ljava/util/List;

    .line 36
    .line 37
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 38
    .line 39
    check-cast p0, Ll/jwp0;

    .line 40
    .line 41
    invoke-virtual {p0, p1}, Ll/jwp0;->i(Ljava/util/List;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method private synthetic a4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/jwp0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/jwp0;->m()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public O3()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/y8s;->O3()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/mwp0;->j:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast p0, Ll/jwp0;

    .line 12
    .line 13
    iget-object p0, p0, Ll/jwp0;->a:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->a:Landroid/widget/RadioGroup;

    .line 16
    .line 17
    sget v0, Ll/mdc0;->N4:I

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Landroid/widget/RadioGroup;->check(I)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public P3()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/y8s;->P3()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p0, Ll/jwp0;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/jwp0;->l()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public S3()Ll/tll;
    .locals 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance v0, Ll/tll;

    .line 2
    .line 3
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 4
    .line 5
    check-cast p0, Ll/jwp0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/jwp0;->d()Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/4 v1, 0x2

    .line 12
    const-string v2, "\u4e3b\u64ad\u5468\u699c"

    .line 13
    .line 14
    invoke-direct {v0, v2, p0, v1}, Ll/tll;-><init>(Ljava/lang/String;Landroid/view/View;I)V

    .line 15
    .line 16
    .line 17
    return-object v0
.end method

.method public T3()I
    .locals 0

    .line 1
    const/4 p0, 0x2

    .line 2
    return p0
.end method

.method public V3()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mwp0;->j:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 8
    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    check-cast v1, Ll/jwp0;

    .line 12
    .line 13
    iget-object v0, v1, Ll/jwp0;->a:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->k()V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 19
    .line 20
    check-cast v0, Ll/jwp0;

    .line 21
    .line 22
    iget-object p0, p0, Ll/mwp0;->j:Ljava/util/List;

    .line 23
    .line 24
    invoke-virtual {v0, p0}, Ll/jwp0;->i(Ljava/util/List;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    check-cast v1, Ll/jwp0;

    .line 29
    .line 30
    iget-object v0, v1, Ll/jwp0;->a:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->a:Landroid/widget/RadioGroup;

    .line 33
    .line 34
    invoke-virtual {v0}, Landroid/widget/RadioGroup;->getCheckedRadioButtonId()I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    sget v1, Ll/mdc0;->N4:I

    .line 39
    .line 40
    if-ne v0, v1, :cond_1

    .line 41
    .line 42
    const-string v0, "currentWeek"

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    const-string v0, "lastWeek"

    .line 46
    .line 47
    :goto_0
    invoke-virtual {p0, v0}, Ll/mwp0;->Y3(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public Y3(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/jwp0;

    .line 4
    .line 5
    iget-object v0, v0, Ll/jwp0;->a:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/WeekLeaderBoardContentView;->k()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/oo2;->j0()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v1}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 27
    .line 28
    invoke-static {v0, v1, p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->D6(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    new-instance v0, Ll/kwp0;

    .line 37
    .line 38
    invoke-direct {v0, p0}, Ll/kwp0;-><init>(Ll/mwp0;)V

    .line 39
    .line 40
    .line 41
    new-instance v1, Ll/lwp0;

    .line 42
    .line 43
    invoke-direct {v1, p0}, Ll/lwp0;-><init>(Ll/mwp0;)V

    .line 44
    .line 45
    .line 46
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 51
    .line 52
    .line 53
    return-void
.end method
