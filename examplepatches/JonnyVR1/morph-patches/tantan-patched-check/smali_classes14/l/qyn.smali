.class public Ll/qyn;
.super Ll/dvs;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/dvs<",
        "Ll/bzn;",
        ">;"
    }
.end annotation


# instance fields
.field public final f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;",
            ">;"
        }
    .end annotation
.end field

.field public final g:Ll/b8o;

.field public h:Ljava/lang/String;

.field public i:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/ner;Ll/nus;Landroidx/viewpager/widget/ViewPager;Lcom/google/android/material/tabs/TabLayout;Ll/b8o;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/dvs;-><init>(Ll/ner;Ll/nus;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/qyn;->f:Ljava/util/List;

    .line 10
    .line 11
    const-string p1, ""

    .line 12
    .line 13
    iput-object p1, p0, Ll/qyn;->i:Ljava/lang/String;

    .line 14
    .line 15
    new-instance p1, Ll/bzn;

    .line 16
    .line 17
    invoke-direct {p1, p3, p4}, Ll/bzn;-><init>(Landroidx/viewpager/widget/ViewPager;Lcom/google/android/material/tabs/TabLayout;)V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 23
    .line 24
    .line 25
    iput-object p5, p0, Ll/qyn;->g:Ll/b8o;

    .line 26
    .line 27
    return-void
.end method

.method private G3(Ljava/lang/Boolean;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/bzn;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/bzn;->F()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    new-instance v0, Ll/cyn;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Ll/cyn;-><init>(Ll/qyn;)V

    .line 18
    .line 19
    .line 20
    const-wide/16 v1, 0x12c

    .line 21
    .line 22
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public static synthetic P2(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/external/internal/api/LiveVoiceApi;->notifyRefreshVoiceActivitiesNum()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Q2(Ll/qyn;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/qyn;->C3()V

    return-void
.end method

.method public static synthetic R2(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic S2(Ll/qyn;Ll/evs;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qyn;->t3(Ll/evs;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic T2(Ljava/util/List;Lcom/p1/mobile/android/app/c;)Ljava/util/List;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic U2(Ll/qyn;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qyn;->w3(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic V2(Ll/qyn;Ll/f7s;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qyn;->J3(Ll/f7s;)V

    return-void
.end method

.method public static synthetic W2(Ll/qyn;Ll/lc3;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qyn;->x3(Ll/lc3;)V

    return-void
.end method

.method public static synthetic X2(Ll/qyn;Ljava/util/List;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qyn;->z3(Ljava/util/List;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Y2(Ll/qyn;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qyn;->D3(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic Z2(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic a3(Ll/qyn;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qyn;->s3(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic b3(Ll/qyn;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/qyn;->y3()V

    return-void
.end method

.method public static synthetic c3(Ll/qyn;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/qyn;->E3()V

    return-void
.end method

.method public static synthetic d3(Ll/qyn;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qyn;->p3(Z)V

    return-void
.end method

.method public static synthetic e3(Ll/qyn;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qyn;->G3(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic f3(Ll/qyn;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qyn;->v3(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic g3(Ll/lc3;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

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

.method public static synthetic h3(Ll/qyn;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qyn;->B3(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic i3(Ll/qyn;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qyn;->u3(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic j3(Ll/qyn;Ll/f7s;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qyn;->F3(Ll/f7s;)V

    return-void
.end method

.method private p3(Z)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/qyn;->k3()V

    .line 4
    .line 5
    .line 6
    :cond_0
    invoke-virtual {p0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    new-instance v0, Ll/byn;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/byn;-><init>(Ll/qyn;)V

    .line 13
    .line 14
    .line 15
    invoke-static {p1, v0}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private synthetic s3(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/t4u;->h()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Ll/qyn;->r3()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/qyn;->r3()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-static {v0}, Ll/t4u;->m(Z)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, Ll/qyn;->g:Ll/b8o;

    .line 19
    .line 20
    invoke-virtual {v0, p1}, Ll/b8o;->x(Landroid/os/Bundle;)V

    .line 21
    .line 22
    .line 23
    const-string v0, "voice-push-big-anchor"

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    const-string v0, "voice-suggest-scheme"

    .line 33
    .line 34
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-nez v1, :cond_1

    .line 43
    .line 44
    const/4 v1, 0x0

    .line 45
    invoke-static {v0, v1}, Ll/v5k0;->k(Ljava/lang/String;Ll/z20;)V

    .line 46
    .line 47
    .line 48
    :cond_1
    invoke-static {}, Ll/y6u;->t()Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_2

    .line 53
    .line 54
    invoke-virtual {p0, p1}, Ll/qyn;->o3(Landroid/os/Bundle;)V

    .line 55
    .line 56
    .line 57
    :cond_2
    return-void
.end method

.method private synthetic t3(Ll/evs;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/qyn;->m3()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private synthetic u3(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/bzn;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/bzn;->V(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic v3(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/bzn;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0, p1}, Ll/bzn;->M(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private synthetic w3(Ll/uxj0;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    move-object v0, p1

    .line 6
    check-cast v0, Ll/bzn;

    .line 7
    .line 8
    iget-object v0, v0, Ll/bzn;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    check-cast p1, Ll/bzn;

    .line 13
    .line 14
    iget-object p1, p1, Ll/bzn;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout;->getSelectedTabPosition()I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    const/4 v0, -0x1

    .line 21
    if-eq p1, v0, :cond_0

    .line 22
    .line 23
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 24
    .line 25
    move-object v0, p1

    .line 26
    check-cast v0, Ll/bzn;

    .line 27
    .line 28
    check-cast p1, Ll/bzn;

    .line 29
    .line 30
    iget-object p1, p1, Ll/bzn;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout;->getSelectedTabPosition()I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    invoke-virtual {p0, p1}, Ll/qyn;->n3(I)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    const/4 p1, 0x1

    .line 41
    invoke-virtual {v0, p0, p1}, Ll/bzn;->K(Ljava/lang/String;Z)V

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method

.method private synthetic x3(Ll/lc3;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/bzn;

    .line 4
    .line 5
    iget-object v0, v0, Ll/bzn;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 6
    .line 7
    const-string v1, "square-intlFollowing"

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v2, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 14
    .line 15
    check-cast v2, Ll/bzn;

    .line 16
    .line 17
    iget-object v2, v2, Ll/bzn;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 18
    .line 19
    invoke-virtual {v2, v1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 28
    .line 29
    check-cast p0, Ll/bzn;

    .line 30
    .line 31
    iget p1, p1, Ll/lc3;->c:I

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Ll/bzn;->S(I)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 38
    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    check-cast p0, Ll/bzn;

    .line 42
    .line 43
    iget p1, p1, Ll/lc3;->c:I

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Ll/bzn;->Q(I)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_1
    check-cast p0, Ll/bzn;

    .line 50
    .line 51
    iget p1, p1, Ll/lc3;->c:I

    .line 52
    .line 53
    invoke-virtual {p0, p1}, Ll/bzn;->S(I)V

    .line 54
    .line 55
    .line 56
    return-void
.end method


# virtual methods
.method public final synthetic B3(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mus;->F2()Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->LiveHomePageEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomePageEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomePageEvent;->onTabClicked()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic C3()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qyn;->i:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/qyn;->g:Ll/b8o;

    .line 10
    .line 11
    iget-object v1, p0, Ll/qyn;->i:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/b8o;->i(Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-ltz v0, :cond_0

    .line 18
    .line 19
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 20
    .line 21
    check-cast v1, Ll/bzn;

    .line 22
    .line 23
    iget-object v1, v1, Ll/bzn;->b:Landroidx/viewpager/widget/ViewPager;

    .line 24
    .line 25
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-ge v0, v1, :cond_0

    .line 30
    .line 31
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 32
    .line 33
    check-cast v1, Ll/bzn;

    .line 34
    .line 35
    invoke-virtual {v1, v0}, Ll/bzn;->P(I)V

    .line 36
    .line 37
    .line 38
    :cond_0
    const-string v0, ""

    .line 39
    .line 40
    iput-object v0, p0, Ll/qyn;->i:Ljava/lang/String;

    .line 41
    .line 42
    :cond_1
    return-void
.end method

.method public final synthetic D3(Ljava/util/List;)V
    .locals 4

    .line 1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->toJson()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 15
    .line 16
    check-cast v0, Ll/bzn;

    .line 17
    .line 18
    new-instance v1, Ljava/util/ArrayList;

    .line 19
    .line 20
    iget-object v2, p0, Ll/qyn;->f:Ljava/util/List;

    .line 21
    .line 22
    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 23
    .line 24
    .line 25
    iget-object v2, p0, Ll/qyn;->g:Ll/b8o;

    .line 26
    .line 27
    invoke-virtual {v2}, Ll/b8o;->j()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    new-instance v3, Ll/gyn;

    .line 32
    .line 33
    invoke-direct {v3, p0}, Ll/gyn;-><init>(Ll/qyn;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1, p1, v2, v3}, Ll/bzn;->O(Ljava/util/List;Ljava/util/List;Ljava/lang/String;Ll/y20;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/qyn;->f:Ljava/util/List;

    .line 40
    .line 41
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Ll/qyn;->f:Ljava/util/List;

    .line 45
    .line 46
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Ll/mus;->F2()Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    iget-object p1, p1, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->LiveHomePageEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomePageEvent;

    .line 54
    .line 55
    invoke-virtual {p1}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomePageEvent;->onRenderTabSelectPageId()Ll/v3f$d;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {p0}, Ll/qyn;->m3()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {p1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 64
    .line 65
    .line 66
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 67
    .line 68
    check-cast p1, Ll/bzn;

    .line 69
    .line 70
    iget-object p1, p1, Ll/bzn;->b:Landroidx/viewpager/widget/ViewPager;

    .line 71
    .line 72
    new-instance v0, Ll/hyn;

    .line 73
    .line 74
    invoke-direct {v0, p0}, Ll/hyn;-><init>(Ll/qyn;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public final synthetic E3()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    check-cast p0, Ll/bzn;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/bzn;->s()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic F3(Ll/f7s;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/bzn;

    .line 4
    .line 5
    const-string v1, "square-following"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/bzn;->C(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 11
    .line 12
    check-cast v0, Ll/bzn;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/bzn;->E()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1}, Ll/f7s;->a()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    iget p1, p1, Ll/f7s;->g:I

    .line 24
    .line 25
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    sget-object v0, Ll/tbs;->b:Ll/vwt;

    .line 30
    .line 31
    invoke-virtual {v0}, Ll/vwt;->V5()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    const-string v1, "red_dot_figure"

    .line 36
    .line 37
    if-eqz v0, :cond_0

    .line 38
    .line 39
    move-object v0, v1

    .line 40
    goto :goto_0

    .line 41
    :cond_0
    const-string v0, "red_dot_normal"

    .line 42
    .line 43
    :goto_0
    iget-object v2, p0, Ll/qyn;->g:Ll/b8o;

    .line 44
    .line 45
    iget-object v3, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 46
    .line 47
    check-cast v3, Ll/bzn;

    .line 48
    .line 49
    invoke-virtual {v3}, Ll/bzn;->z()I

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    invoke-virtual {v2, v3}, Ll/b8o;->m(I)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    invoke-static {v0, p1, v2}, Ll/sft;->h(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 61
    .line 62
    check-cast p0, Ll/bzn;

    .line 63
    .line 64
    invoke-virtual {p0, p1, v1}, Ll/bzn;->W(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_1
    invoke-virtual {p1}, Ll/f7s;->b()Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-eqz v0, :cond_2

    .line 73
    .line 74
    iget-object v0, p0, Ll/qyn;->g:Ll/b8o;

    .line 75
    .line 76
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 77
    .line 78
    check-cast v1, Ll/bzn;

    .line 79
    .line 80
    invoke-virtual {v1}, Ll/bzn;->z()I

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    invoke-virtual {v0, v1}, Ll/b8o;->m(I)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    const-string v1, "red_dot_word"

    .line 89
    .line 90
    const-string v2, ""

    .line 91
    .line 92
    invoke-static {v1, v2, v0}, Ll/sft;->h(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 96
    .line 97
    check-cast p0, Ll/bzn;

    .line 98
    .line 99
    iget-object p1, p1, Ll/f7s;->c:Ljava/util/List;

    .line 100
    .line 101
    const/4 v0, 0x0

    .line 102
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    check-cast p1, Ljava/lang/String;

    .line 107
    .line 108
    invoke-virtual {p0, p1, v1}, Ll/bzn;->W(Ljava/lang/String;Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    :cond_2
    return-void
.end method

.method public H3(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qyn;->g:Ll/b8o;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/b8o;->y(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/qyn;->n3(I)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Ll/qyn;->h:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/qyn;->n3(I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    const-string v0, "voice-live"

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ll/qyn;->n3(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/mus;->F2()Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-object v0, v0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->LiveHomePageEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomePageEvent;

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomePageEvent;->tabSelected()Ll/v3f$d;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const-string v1, "tab_voice"

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 43
    .line 44
    check-cast v0, Ll/bzn;

    .line 45
    .line 46
    iget-object v1, p0, Ll/qyn;->h:Ljava/lang/String;

    .line 47
    .line 48
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-eqz v1, :cond_0

    .line 53
    .line 54
    invoke-virtual {p0, p1}, Ll/qyn;->n3(I)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    goto :goto_0

    .line 59
    :cond_0
    iget-object v1, p0, Ll/qyn;->h:Ljava/lang/String;

    .line 60
    .line 61
    :goto_0
    invoke-virtual {v0, v1}, Ll/bzn;->Z(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    invoke-static {}, Ll/mbs;->G()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->ce()Ll/f7s;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {v0}, Ll/f7s;->b()Z

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    if-eqz v1, :cond_3

    .line 77
    .line 78
    invoke-virtual {v0}, Ll/f7s;->a()Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-nez v0, :cond_3

    .line 83
    .line 84
    invoke-virtual {p0}, Ll/mus;->F2()Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    iget-object v0, v0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->LiveHomeVoiceSelectTopic:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeVoiceSelectTopic;

    .line 89
    .line 90
    invoke-virtual {v0}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeVoiceSelectTopic;->selectTopic()Ll/v3f$d;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    sget-object v1, Ll/b5p0;->b:Ljava/lang/String;

    .line 95
    .line 96
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 97
    .line 98
    .line 99
    goto :goto_1

    .line 100
    :cond_1
    invoke-static {}, Ll/ppi0;->l()Ll/ppi0;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-virtual {v0}, Ll/ppi0;->x()Z

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    if-eqz v0, :cond_2

    .line 109
    .line 110
    invoke-virtual {p0}, Ll/mus;->F2()Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    iget-object v0, v0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->LiveHomePageEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomePageEvent;

    .line 115
    .line 116
    invoke-virtual {v0}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomePageEvent;->tabSelected()Ll/v3f$d;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    const-string v1, "tab_teen"

    .line 121
    .line 122
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 123
    .line 124
    .line 125
    goto :goto_1

    .line 126
    :cond_2
    invoke-virtual {p0}, Ll/mus;->F2()Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    iget-object v0, v0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->LiveHomePageEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomePageEvent;

    .line 131
    .line 132
    invoke-virtual {v0}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomePageEvent;->tabSelected()Ll/v3f$d;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    iget-object v1, p0, Ll/qyn;->h:Ljava/lang/String;

    .line 137
    .line 138
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 139
    .line 140
    .line 141
    :cond_3
    :goto_1
    const-string v0, "square-intlGame"

    .line 142
    .line 143
    invoke-virtual {p0, p1}, Ll/qyn;->n3(I)Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 148
    .line 149
    .line 150
    move-result p1

    .line 151
    if-eqz p1, :cond_4

    .line 152
    .line 153
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 154
    .line 155
    check-cast p1, Ll/bzn;

    .line 156
    .line 157
    iget-object p0, p0, Ll/qyn;->g:Ll/b8o;

    .line 158
    .line 159
    invoke-virtual {p0}, Ll/b8o;->h()Ljava/util/List;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    const/4 v0, 0x0

    .line 164
    invoke-virtual {p1, v0, p0}, Ll/bzn;->R(ZLjava/util/List;)V

    .line 165
    .line 166
    .line 167
    :cond_4
    return-void
.end method

.method public I3(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/bzn;

    .line 4
    .line 5
    iget-object v0, v0, Ll/bzn;->b:Landroidx/viewpager/widget/ViewPager;

    .line 6
    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Ll/cf60;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-ne p1, v1, :cond_1

    .line 21
    .line 22
    sget-object p1, Ll/tbs;->b:Ll/vwt;

    .line 23
    .line 24
    invoke-virtual {p1}, Ll/vwt;->I6()Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p1, :cond_2

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/qyn;->k3()V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    const/4 p0, 0x1

    .line 35
    invoke-virtual {v0, p1, p0}, Landroidx/viewpager/widget/ViewPager;->T(IZ)V

    .line 36
    .line 37
    .line 38
    :cond_2
    :goto_0
    return-void
.end method

.method public final J3(Ll/f7s;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/ayn;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ll/ayn;-><init>(Ll/qyn;Ll/f7s;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public T()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast v0, Ll/bzn;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/bzn;->r()V

    .line 9
    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Live:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 12
    .line 13
    invoke-static {v0}, Ll/mbs;->u(Lcom/p1/mobile/putong/newui/main/base/TabName;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/cws;

    .line 18
    .line 19
    invoke-direct {v1}, Ll/cws;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const/4 v1, 0x0

    .line 27
    invoke-virtual {p0, v0, v1}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    new-instance v1, Ll/kyn;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ll/kyn;-><init>(Ll/qyn;)V

    .line 42
    .line 43
    .line 44
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Ll/qyn;->q3()V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Ll/qyn;->g:Ll/b8o;

    .line 55
    .line 56
    invoke-virtual {v0}, Ll/b8o;->n()V

    .line 57
    .line 58
    .line 59
    invoke-static {}, Ll/mbs;->v()Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    new-instance v1, Ll/lyn;

    .line 68
    .line 69
    invoke-direct {v1, p0}, Ll/lyn;-><init>(Ll/qyn;)V

    .line 70
    .line 71
    .line 72
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0}, Ll/mus;->F2()Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    iget-object v0, v0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->LiveHomePageEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomePageEvent;

    .line 84
    .line 85
    invoke-virtual {v0}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomePageEvent;->onTabClicked()Ll/v3f$d;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    check-cast v0, Lrx/c;

    .line 94
    .line 95
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    new-instance v1, Ll/myn;

    .line 100
    .line 101
    invoke-direct {v1, p0}, Ll/myn;-><init>(Ll/qyn;)V

    .line 102
    .line 103
    .line 104
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 109
    .line 110
    .line 111
    new-instance v0, Ll/nyn;

    .line 112
    .line 113
    invoke-direct {v0, p0}, Ll/nyn;-><init>(Ll/qyn;)V

    .line 114
    .line 115
    .line 116
    const-class v1, Ll/evs;

    .line 117
    .line 118
    invoke-virtual {p0, v1, v0}, Ll/mus;->E2(Ljava/lang/Class;Ll/qcj;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {p0}, Ll/mus;->F2()Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    iget-object v0, v0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->LiveHomePageEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomePageEvent;

    .line 126
    .line 127
    invoke-virtual {v0}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomePageEvent;->tabTextColorChanged()Ll/v3f$d;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    check-cast v0, Lrx/c;

    .line 136
    .line 137
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 142
    .line 143
    .line 144
    move-result-object v1

    .line 145
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    new-instance v1, Ll/oyn;

    .line 150
    .line 151
    invoke-direct {v1, p0}, Ll/oyn;-><init>(Ll/qyn;)V

    .line 152
    .line 153
    .line 154
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 155
    .line 156
    .line 157
    move-result-object v1

    .line 158
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 159
    .line 160
    .line 161
    invoke-virtual {p0}, Ll/mus;->F2()Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    iget-object v0, v0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->LiveHomePageEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomePageEvent;

    .line 166
    .line 167
    invoke-virtual {v0}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomePageEvent;->removeDefaultSelectListener()Ll/v3f$d;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    check-cast v0, Lrx/c;

    .line 176
    .line 177
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    new-instance v1, Ll/pyn;

    .line 182
    .line 183
    invoke-direct {v1, p0}, Ll/pyn;-><init>(Ll/qyn;)V

    .line 184
    .line 185
    .line 186
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 187
    .line 188
    .line 189
    move-result-object v1

    .line 190
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 191
    .line 192
    .line 193
    invoke-static {}, Ll/y6u;->t()Z

    .line 194
    .line 195
    .line 196
    move-result v0

    .line 197
    if-eqz v0, :cond_0

    .line 198
    .line 199
    sget-object v0, Ll/itd0;->c:Ll/itd0;

    .line 200
    .line 201
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 202
    .line 203
    .line 204
    move-result-object v1

    .line 205
    check-cast v1, Ll/gm3;

    .line 206
    .line 207
    invoke-virtual {v1}, Ll/gm3;->h()Lrx/subjects/a;

    .line 208
    .line 209
    .line 210
    move-result-object v1

    .line 211
    invoke-virtual {p0, v1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 212
    .line 213
    .line 214
    move-result-object v1

    .line 215
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 216
    .line 217
    .line 218
    move-result-object v2

    .line 219
    invoke-virtual {v1, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 220
    .line 221
    .line 222
    move-result-object v1

    .line 223
    new-instance v2, Ll/ynt;

    .line 224
    .line 225
    invoke-direct {v2}, Ll/ynt;-><init>()V

    .line 226
    .line 227
    .line 228
    invoke-virtual {v1, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 229
    .line 230
    .line 231
    move-result-object v1

    .line 232
    new-instance v2, Ll/vxn;

    .line 233
    .line 234
    invoke-direct {v2, p0}, Ll/vxn;-><init>(Ll/qyn;)V

    .line 235
    .line 236
    .line 237
    invoke-static {v2}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 238
    .line 239
    .line 240
    move-result-object v2

    .line 241
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 242
    .line 243
    .line 244
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 245
    .line 246
    .line 247
    move-result-object v0

    .line 248
    check-cast v0, Ll/gm3;

    .line 249
    .line 250
    invoke-virtual {v0}, Ll/gm3;->g()Lrx/c;

    .line 251
    .line 252
    .line 253
    move-result-object v0

    .line 254
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 255
    .line 256
    .line 257
    move-result-object v0

    .line 258
    new-instance v1, Ll/wxn;

    .line 259
    .line 260
    invoke-direct {v1}, Ll/wxn;-><init>()V

    .line 261
    .line 262
    .line 263
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 264
    .line 265
    .line 266
    move-result-object v1

    .line 267
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 268
    .line 269
    .line 270
    :cond_0
    sget-object v0, Ll/itd0;->b:Ll/itd0;

    .line 271
    .line 272
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 273
    .line 274
    .line 275
    move-result-object v1

    .line 276
    check-cast v1, Ll/fk3;

    .line 277
    .line 278
    invoke-virtual {v1}, Ll/fk3;->A()Lrx/c;

    .line 279
    .line 280
    .line 281
    move-result-object v1

    .line 282
    invoke-virtual {p0, v1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 283
    .line 284
    .line 285
    move-result-object v1

    .line 286
    new-instance v2, Ll/uxn;

    .line 287
    .line 288
    invoke-direct {v2, p0}, Ll/uxn;-><init>(Ll/qyn;)V

    .line 289
    .line 290
    .line 291
    invoke-static {v2}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 292
    .line 293
    .line 294
    move-result-object v2

    .line 295
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 296
    .line 297
    .line 298
    invoke-static {}, Ll/t4u;->i()Lrx/c;

    .line 299
    .line 300
    .line 301
    move-result-object v1

    .line 302
    invoke-virtual {p0, v1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 303
    .line 304
    .line 305
    move-result-object v1

    .line 306
    new-instance v2, Ll/fyn;

    .line 307
    .line 308
    invoke-direct {v2, p0}, Ll/fyn;-><init>(Ll/qyn;)V

    .line 309
    .line 310
    .line 311
    invoke-static {v2}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 312
    .line 313
    .line 314
    move-result-object v2

    .line 315
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 316
    .line 317
    .line 318
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 319
    .line 320
    .line 321
    move-result-object v0

    .line 322
    check-cast v0, Ll/fk3;

    .line 323
    .line 324
    invoke-virtual {v0}, Ll/fk3;->s()Lrx/c;

    .line 325
    .line 326
    .line 327
    move-result-object v0

    .line 328
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 329
    .line 330
    .line 331
    move-result-object v0

    .line 332
    new-instance v1, Ll/iyn;

    .line 333
    .line 334
    invoke-direct {v1}, Ll/iyn;-><init>()V

    .line 335
    .line 336
    .line 337
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 338
    .line 339
    .line 340
    move-result-object v0

    .line 341
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 342
    .line 343
    .line 344
    move-result-object v1

    .line 345
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 346
    .line 347
    .line 348
    move-result-object v0

    .line 349
    new-instance v1, Ll/jyn;

    .line 350
    .line 351
    invoke-direct {v1, p0}, Ll/jyn;-><init>(Ll/qyn;)V

    .line 352
    .line 353
    .line 354
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 355
    .line 356
    .line 357
    move-result-object p0

    .line 358
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 359
    .line 360
    .line 361
    return-void
.end method

.method public k3()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/bzn;

    .line 4
    .line 5
    iget-object p0, p0, Ll/bzn;->b:Landroidx/viewpager/widget/ViewPager;

    .line 6
    .line 7
    if-eqz p0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Ll/cf60;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Ll/cf60;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Ll/n5o;

    .line 21
    .line 22
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    invoke-virtual {v0, p0}, Ll/bvu;->getItem(I)Landroidx/fragment/app/Fragment;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    instance-of v0, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;

    .line 31
    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    check-cast p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->Y4()V

    .line 37
    .line 38
    .line 39
    :cond_1
    :goto_0
    return-void
.end method

.method public m3()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/bzn;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/bzn;->y()Lcom/p1/mobile/android/app/Frag;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const-string p0, "p_live_recommend"

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->pageId()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public n3(I)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qyn;->g:Ll/b8o;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/b8o;->m(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final o3(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    const-string v0, "navigation_live_intent"

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_1

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast v0, Ll/bzn;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/bzn;->F()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    iput-object p1, p0, Ll/qyn;->i:Ljava/lang/String;

    .line 26
    .line 27
    :cond_0
    iget-object v0, p0, Ll/qyn;->g:Ll/b8o;

    .line 28
    .line 29
    invoke-virtual {v0, p1}, Ll/b8o;->i(Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-ltz p1, :cond_1

    .line 34
    .line 35
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 36
    .line 37
    check-cast v0, Ll/bzn;

    .line 38
    .line 39
    iget-object v0, v0, Ll/bzn;->b:Landroidx/viewpager/widget/ViewPager;

    .line 40
    .line 41
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-ge p1, v0, :cond_1

    .line 46
    .line 47
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 48
    .line 49
    check-cast p0, Ll/bzn;

    .line 50
    .line 51
    invoke-virtual {p0, p1}, Ll/bzn;->P(I)V

    .line 52
    .line 53
    .line 54
    :cond_1
    return-void
.end method

.method public final q3()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qyn;->g:Ll/b8o;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/b8o;->k()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/xxn;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/xxn;-><init>(Ll/qyn;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Ll/yxn;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Ll/yxn;-><init>(Ll/qyn;)V

    .line 35
    .line 36
    .line 37
    new-instance p0, Ll/zxn;

    .line 38
    .line 39
    invoke-direct {p0}, Ll/zxn;-><init>()V

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

.method public r3()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mus;->H2()Ll/nus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Ll/nus;->b:Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isHidden()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public final synthetic y3()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/qyn;->g:Ll/b8o;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/b8o;->j()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-static {}, Ll/mqr;->e()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast v1, Ll/bzn;

    .line 18
    .line 19
    invoke-virtual {v1}, Ll/bzn;->x()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-nez v2, :cond_0

    .line 28
    .line 29
    move-object v0, v1

    .line 30
    :cond_0
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 31
    .line 32
    check-cast v1, Ll/bzn;

    .line 33
    .line 34
    iget-object p0, p0, Ll/qyn;->f:Ljava/util/List;

    .line 35
    .line 36
    invoke-virtual {v1, p0, v0}, Ll/bzn;->X(Ljava/util/List;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    :cond_1
    return-void
.end method

.method public final synthetic z3(Ljava/util/List;)Lrx/c;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/cyr;->lifecycle()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ll/dyn;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/dyn;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Lrx/c;->takeFirst(Ll/qcj;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    new-instance v0, Ll/eyn;

    .line 15
    .line 16
    invoke-direct {v0, p1}, Ll/eyn;-><init>(Ljava/util/List;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method
