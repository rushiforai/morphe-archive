.class public Ll/eur;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/rtr;",
            ">;"
        }
    .end annotation
.end field

.field public final b:Ljava/lang/String;

.field public c:Ll/rtr;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Ll/eur;->a:Lrx/subjects/a;

    .line 9
    .line 10
    const-class p1, Ll/eur;

    .line 11
    .line 12
    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iput-object p1, p0, Ll/eur;->b:Ljava/lang/String;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic e0(Ll/rtr;)Ljava/lang/Boolean;
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

.method public static synthetic f0(Ll/eur;Ll/gur;Lcom/p1/mobile/putong/data/Followship;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/eur;->r0(Ll/gur;Lcom/p1/mobile/putong/data/Followship;)V

    return-void
.end method

.method public static synthetic g0(Ll/eur;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/eur;->n0()V

    return-void
.end method

.method public static synthetic h0()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic i0(Ll/eur;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/eur;->o0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic j0(Ll/eur;Ll/rtr;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/eur;->s0(Ll/rtr;)V

    return-void
.end method

.method public static synthetic k0(Ljava/lang/Throwable;)V
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

.method public static synthetic l0(Ll/eur;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/eur;->q0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic m0(Ll/eur;Ll/rtr;Ll/rtr;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/eur;->p0(Ll/rtr;Ll/rtr;)V

    return-void
.end method

.method private synthetic n0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->u2()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic q0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic o0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->v2(Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic p0(Ll/rtr;Ll/rtr;)V
    .locals 0

    .line 1
    invoke-virtual {p1, p2}, Ll/rtr;->r(Ll/rtr;)Ll/rtr;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/eur;->a:Lrx/subjects/a;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public r()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/eur;->a:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/rtr;

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/rtr;->m()Z

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
    invoke-virtual {v0}, Ll/rtr;->k()Lcom/p1/mobile/putong/data/Pagination;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-static {v1}, Lcom/p1/mobile/putong/live/external/module/api/LiveSquareApi;->getNextPage(Lcom/p1/mobile/putong/data/Pagination;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {p0, v1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    new-instance v2, Ll/aur;

    .line 31
    .line 32
    invoke-direct {v2, p0, v0}, Ll/aur;-><init>(Ll/eur;Ll/rtr;)V

    .line 33
    .line 34
    .line 35
    new-instance v0, Ll/bur;

    .line 36
    .line 37
    invoke-direct {v0, p0}, Ll/bur;-><init>(Ll/eur;)V

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

.method public final synthetic r0(Ll/gur;Lcom/p1/mobile/putong/data/Followship;)V
    .locals 0

    .line 1
    iget-object p2, p0, Ll/eur;->a:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p2}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    check-cast p2, Ll/rtr;

    .line 8
    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    invoke-virtual {p2, p1}, Ll/rtr;->x(Ll/gur;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 15
    .line 16
    check-cast p0, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;

    .line 17
    .line 18
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->q2(Ll/rtr;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public final synthetic s0(Ll/rtr;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/eur;->c:Ll/rtr;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->y2(Ll/rtr;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public t0()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/external/module/api/LiveSquareApi;->getLiveActivitiesInfo()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/wtr;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/wtr;-><init>(Ll/eur;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lrx/c;->doOnSubscribe(Ll/x20;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p0, Ll/eur;->a:Lrx/subjects/a;

    .line 15
    .line 16
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    new-instance v2, Ll/xtr;

    .line 20
    .line 21
    invoke-direct {v2, v1}, Ll/xtr;-><init>(Lrx/subjects/a;)V

    .line 22
    .line 23
    .line 24
    new-instance v1, Ll/ytr;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/ytr;-><init>(Ll/eur;)V

    .line 27
    .line 28
    .line 29
    new-instance p0, Ll/ztr;

    .line 30
    .line 31
    invoke-direct {p0}, Ll/ztr;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-static {v2, v1, p0}, Ll/dhw;->f(Ll/y20;Ll/y20;Ll/x20;)Ll/t9t;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public u0(Ll/gur;I)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ll/tbs;->f:Ll/j6t;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

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
    iget-object v4, p1, Ll/gur;->d:Lcom/p1/mobile/putong/live/base/data/BLive;

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
    iget-object v1, p1, Ll/gur;->d:Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ll/kfd0$a;->b(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Ll/kfd0$a;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iget-object p1, p1, Ll/gur;->a:Lcom/p1/mobile/putong/data/User;

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
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 71
    .line 72
    check-cast p0, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;

    .line 73
    .line 74
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->pageId()Ljava/lang/String;

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

.method public x0(Ll/gur;)V
    .locals 7

    .line 1
    invoke-static {}, Ll/mbs;->o0()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p1, Ll/gur;->a:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    iget-object v2, p1, Ll/gur;->d:Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 8
    .line 9
    iget-object v4, v2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast v2, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;

    .line 14
    .line 15
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->pageId()Ljava/lang/String;

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
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Ll/cur;

    .line 33
    .line 34
    invoke-direct {v1, p0, p1}, Ll/cur;-><init>(Ll/eur;Ll/gur;)V

    .line 35
    .line 36
    .line 37
    new-instance p0, Ll/dur;

    .line 38
    .line 39
    invoke-direct {p0}, Ll/dur;-><init>()V

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

.method public y0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->pageId()Ljava/lang/String;

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
    iget-object v0, p0, Ll/eur;->a:Lrx/subjects/a;

    .line 15
    .line 16
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Ll/rtr;

    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    invoke-virtual {v0}, Ll/rtr;->w()V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 28
    .line 29
    check-cast p0, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/internal/live/square/activities/LiveActivitiesAct;->r2(Ll/rtr;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public z0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/eur;->a:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/c;->asObservable()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

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
    new-instance v1, Ll/utr;

    .line 20
    .line 21
    invoke-direct {v1}, Ll/utr;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lrx/c;->skipWhile(Ll/qcj;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/vtr;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/vtr;-><init>(Ll/eur;)V

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
