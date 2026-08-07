.class public Ll/i5o;
.super Ll/mus;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/mus<",
        "Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;",
        ">;"
    }
.end annotation


# instance fields
.field public final f:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/mvn;",
            ">;"
        }
    .end annotation
.end field

.field public final g:Ljava/lang/String;

.field public h:Ll/mvn;


# direct methods
.method public constructor <init>(Ll/ner;Ll/nus;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/mus;-><init>(Ll/ner;Ll/nus;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Ll/i5o;->f:Lrx/subjects/a;

    .line 9
    .line 10
    const-class p1, Ll/i5o;

    .line 11
    .line 12
    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iput-object p1, p0, Ll/i5o;->g:Ljava/lang/String;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic P2(Ll/i5o;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/i5o;->d3(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic Q2(Ll/i5o;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/i5o;->Z2()V

    return-void
.end method

.method public static synthetic R2(Ll/i5o;Ll/nvn;Lcom/p1/mobile/putong/data/Followship;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/i5o;->e3(Ll/nvn;Lcom/p1/mobile/putong/data/Followship;)V

    return-void
.end method

.method public static synthetic S2(Ll/i5o;Ll/mvn;Ll/mvn;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/i5o;->c3(Ll/mvn;Ll/mvn;)V

    return-void
.end method

.method public static synthetic T2(Ll/i5o;Ll/mvn;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/i5o;->f3(Ll/mvn;)V

    return-void
.end method

.method public static synthetic U2()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic V2(Ll/i5o;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/i5o;->b3(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic W2(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    sget-object p0, Ll/tbs;->a:Landroid/app/Application;

    .line 2
    .line 3
    sget v0, Lcom/p1/mobile/putong/live/base/R$string;->M:I

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic X2(Ll/mvn;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static synthetic Y2(Ll/i5o;Ll/mvn;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/i5o;->a3(Ll/mvn;)V

    return-void
.end method


# virtual methods
.method public final synthetic Z2()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->I5()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic a3(Ll/mvn;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i5o;->f:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic b3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->J5(Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic c3(Ll/mvn;Ll/mvn;)V
    .locals 0

    .line 1
    invoke-virtual {p1, p2}, Ll/mvn;->r(Ll/mvn;)Ll/mvn;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/i5o;->f:Lrx/subjects/a;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic d3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic e3(Ll/nvn;Lcom/p1/mobile/putong/data/Followship;)V
    .locals 0

    .line 1
    iget-object p2, p0, Ll/i5o;->f:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p2}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    check-cast p2, Ll/mvn;

    .line 8
    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    invoke-virtual {p2, p1}, Ll/mvn;->x(Ll/nvn;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 15
    .line 16
    check-cast p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;

    .line 17
    .line 18
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->F5(Ll/mvn;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public final synthetic f3(Ll/mvn;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/i5o;->h:Ll/mvn;

    .line 2
    .line 3
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->N5(Ll/mvn;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public g3()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/external/intl/module/api/IntlLiveActivitiesApi;->getLiveActivitiesInfo()Lrx/c;

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
    new-instance v1, Ll/y4o;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/y4o;-><init>(Ll/i5o;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lrx/c;->doOnSubscribe(Ll/x20;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/z4o;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/z4o;-><init>(Ll/i5o;)V

    .line 21
    .line 22
    .line 23
    new-instance v2, Ll/a5o;

    .line 24
    .line 25
    invoke-direct {v2, p0}, Ll/a5o;-><init>(Ll/i5o;)V

    .line 26
    .line 27
    .line 28
    new-instance p0, Ll/b5o;

    .line 29
    .line 30
    invoke-direct {p0}, Ll/b5o;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-static {v1, v2, p0}, Ll/dhw;->f(Ll/y20;Ll/y20;Ll/x20;)Ll/t9t;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public h3()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/i5o;->f:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/mvn;

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/mvn;->m()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {v0}, Ll/mvn;->k()Lcom/p1/mobile/putong/data/Pagination;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-static {v1}, Lcom/p1/mobile/putong/live/external/intl/module/api/IntlLiveActivitiesApi;->getNextPage(Lcom/p1/mobile/putong/data/Pagination;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {p0, v1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    new-instance v2, Ll/e5o;

    .line 31
    .line 32
    invoke-direct {v2, p0, v0}, Ll/e5o;-><init>(Ll/i5o;Ll/mvn;)V

    .line 33
    .line 34
    .line 35
    new-instance v0, Ll/f5o;

    .line 36
    .line 37
    invoke-direct {v0, p0}, Ll/f5o;-><init>(Ll/i5o;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v2, v0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {v1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 45
    .line 46
    .line 47
    :cond_1
    :goto_0
    return-void
.end method

.method public i3(Ll/nvn;I)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ll/tbs;->f:Ll/j6t;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->getBuilder()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    iget-object v4, p1, Ll/nvn;->d:Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 16
    .line 17
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->D(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    const-string v4, "live-activity-suggested"

    .line 22
    .line 23
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->O(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-virtual {v3}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->u()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-virtual {v1, v2, v3}, Ll/j6t;->f(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)Landroid/content/Intent;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 36
    .line 37
    .line 38
    invoke-static {}, Ll/kfd0;->x()Ll/kfd0$a;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iget-object v1, p1, Ll/nvn;->d:Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ll/kfd0$a;->b(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Ll/kfd0$a;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iget-object p1, p1, Ll/nvn;->a:Lcom/p1/mobile/putong/data/User;

    .line 49
    .line 50
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {v0, p1}, Ll/kfd0$a;->g(Ljava/lang/String;)Ll/kfd0$a;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p1, p2}, Ll/kfd0$a;->l(I)Ll/kfd0$a;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    const-string p2, "e_anchor_recommend"

    .line 61
    .line 62
    invoke-virtual {p1, p2}, Ll/kfd0$a;->w(Ljava/lang/String;)Ll/kfd0$a;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-virtual {p1}, Ll/kfd0$a;->a()Ll/kfd0;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 71
    .line 72
    check-cast p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;

    .line 73
    .line 74
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->pageId()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-static {p1, p0}, Ll/bfu;->c(Ll/kfd0;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public j3(Ll/nvn;)V
    .locals 7

    .line 1
    invoke-static {}, Ll/mbs;->o0()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p1, Ll/nvn;->a:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    iget-object v2, p1, Ll/nvn;->d:Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 8
    .line 9
    iget-object v4, v2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v2, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast v2, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;

    .line 14
    .line 15
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->pageId()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v5

    .line 19
    const-string v6, "liveActivityAnchorSuggest"

    .line 20
    .line 21
    const/4 v2, 0x1

    .line 22
    const-string v3, "liveActivityAnchorSuggest"

    .line 23
    .line 24
    invoke-static/range {v0 .. v6}, Ll/mbs;->k(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Ll/g5o;

    .line 33
    .line 34
    invoke-direct {v1, p0, p1}, Ll/g5o;-><init>(Ll/i5o;Ll/nvn;)V

    .line 35
    .line 36
    .line 37
    new-instance p0, Ll/h5o;

    .line 38
    .line 39
    invoke-direct {p0}, Ll/h5o;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public k3()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "e_live_follow_change"

    .line 10
    .line 11
    invoke-static {v1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/i5o;->f:Lrx/subjects/a;

    .line 15
    .line 16
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Ll/mvn;

    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    invoke-virtual {v0}, Ll/mvn;->w()V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 28
    .line 29
    check-cast p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->G5(Ll/mvn;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public m3()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/i5o;->f:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/c;->asObservable()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/c5o;

    .line 20
    .line 21
    invoke-direct {v1}, Ll/c5o;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lrx/c;->skipWhile(Ll/qcj;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/d5o;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/d5o;-><init>(Ll/i5o;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    return-void
.end method
