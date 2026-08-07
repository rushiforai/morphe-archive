.class public Ll/bws;
.super Ll/dvs;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/dvs<",
        "Ll/kxs;",
        ">;"
    }
.end annotation


# instance fields
.field public f:Ljava/lang/String;

.field public g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;",
            ">;"
        }
    .end annotation
.end field

.field public h:J

.field public i:I

.field public j:I

.field public k:Ll/fk3$b;


# direct methods
.method public constructor <init>(Ll/ner;Ll/nus;Landroidx/viewpager/widget/ViewPager;Lcom/google/android/material/tabs/TabLayout;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/dvs;-><init>(Ll/ner;Ll/nus;)V

    .line 2
    .line 3
    .line 4
    const-string p1, ""

    .line 5
    .line 6
    iput-object p1, p0, Ll/bws;->f:Ljava/lang/String;

    .line 7
    .line 8
    const/4 p1, -0x1

    .line 9
    iput p1, p0, Ll/bws;->i:I

    .line 10
    .line 11
    iput p1, p0, Ll/bws;->j:I

    .line 12
    .line 13
    new-instance p1, Ll/kxs;

    .line 14
    .line 15
    invoke-direct {p1, p3, p4, p5}, Ll/kxs;-><init>(Landroidx/viewpager/widget/ViewPager;Lcom/google/android/material/tabs/TabLayout;Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private H3(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;Ljava/util/HashMap;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean<",
            "Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;",
            ">;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    :goto_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;->getList()Ljava/util/List;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-ge p0, v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;->getList()Ljava/util/List;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-interface {v0, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->getTabId()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {p2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;

    .line 31
    .line 32
    if-eqz v1, :cond_0

    .line 33
    .line 34
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->isDisplay()Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->setDisplay(Z)V

    .line 39
    .line 40
    .line 41
    :cond_0
    add-int/lit8 p0, p0, 0x1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;->getList()Ljava/util/List;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    new-instance p1, Ll/uws;

    .line 49
    .line 50
    invoke-direct {p1}, Ll/uws;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-static {p0, p1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    return-object p0
.end method

.method private K3(Z)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Ll/bws;->L3(ZLandroid/os/Bundle;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private L3(ZLandroid/os/Bundle;)V
    .locals 4

    .line 1
    invoke-static {}, Ll/ppi0;->l()Ll/ppi0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/ppi0;->x()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    if-nez p1, :cond_1

    .line 13
    .line 14
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    iget-wide v2, p0, Ll/bws;->h:J

    .line 19
    .line 20
    sub-long/2addr v0, v2

    .line 21
    const-wide/32 v2, 0xea60

    .line 22
    .line 23
    .line 24
    cmp-long p1, v0, v2

    .line 25
    .line 26
    if-gtz p1, :cond_1

    .line 27
    .line 28
    :goto_0
    return-void

    .line 29
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 30
    .line 31
    .line 32
    move-result-wide v0

    .line 33
    iput-wide v0, p0, Ll/bws;->h:J

    .line 34
    .line 35
    invoke-static {}, Lcom/p1/mobile/putong/live/external/module/api/LiveSquareApi;->requestTab()Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    new-instance v0, Ll/mvs;

    .line 44
    .line 45
    invoke-direct {v0, p0}, Ll/mvs;-><init>(Ll/bws;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    new-instance v0, Ll/nvs;

    .line 53
    .line 54
    invoke-direct {v0, p0, p2}, Ll/nvs;-><init>(Ll/bws;Landroid/os/Bundle;)V

    .line 55
    .line 56
    .line 57
    new-instance p2, Ll/ovs;

    .line 58
    .line 59
    invoke-direct {p2, p0}, Ll/ovs;-><init>(Ll/bws;)V

    .line 60
    .line 61
    .line 62
    invoke-static {v0, p2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method private M3(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ll/ivs;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/ivs;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-static {p1, v0}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iput v0, p0, Ll/bws;->i:I

    .line 17
    .line 18
    new-instance v0, Ll/jvs;

    .line 19
    .line 20
    invoke-direct {v0}, Ll/jvs;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-static {p1, v0}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    iput v0, p0, Ll/bws;->j:I

    .line 28
    .line 29
    :cond_0
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 30
    .line 31
    check-cast v0, Ll/kxs;

    .line 32
    .line 33
    invoke-virtual {v0, p1}, Ll/kxs;->E(Ljava/util/List;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/mus;->F2()Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iget-object p1, p1, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->LiveHomePageEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomePageEvent;

    .line 41
    .line 42
    invoke-virtual {p1}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomePageEvent;->onRenderTabSelectPageId()Ll/v3f$d;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p0}, Ll/bws;->o3()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p1, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method private N3()V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "-100"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->setTabId(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sget-object v1, Ll/tbs;->a:Landroid/app/Application;

    .line 12
    .line 13
    sget v2, Lcom/p1/mobile/putong/live/external/R$string;->c0:I

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->setName(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const-string v1, "square-teen-mode"

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->setRequestName(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    const/4 v1, 0x1

    .line 28
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->setDisplay(Z)V

    .line 29
    .line 30
    .line 31
    filled-new-array {v0}, [Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-direct {p0, v0}, Ll/bws;->M3(Ljava/util/List;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public static synthetic P2(Ll/lc3;)Ljava/lang/Boolean;
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

.method public static synthetic Q2(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->getRequestName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/y6u;->s(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic R2(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic S2(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->getRequestName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/y6u;->s(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->isDisplay()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public static synthetic T2(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->requestName:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "fakeLiveSquare"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->isDisplay()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public static synthetic U2(Ll/bws;Landroid/os/Bundle;Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/bws;->E3(Landroid/os/Bundle;Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)V

    return-void
.end method

.method public static synthetic V2(Ll/bws;Ll/sys;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bws;->u3(Ll/sys;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic W2(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->requestName:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "square-curated"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic X2(Ll/bws;Ll/evs;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bws;->s3(Ll/evs;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Y2(Ll/bws;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bws;->t3(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic Z2(Ll/bws;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bws;->y3(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic a3(Ll/bws;Ll/jcs;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bws;->v3(Ll/jcs;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b3(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->getRequestName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/y6u;->s(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic c3(Ll/bws;Ll/fk3$b;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bws;->z3(Ll/fk3$b;)V

    return-void
.end method

.method public static synthetic d3(Ll/bws;Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bws;->D3(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic e3(Ll/bws;Lcom/p1/mobile/putong/live/external/square/LiveSquareSummaryInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bws;->C3(Lcom/p1/mobile/putong/live/external/square/LiveSquareSummaryInfo;)V

    return-void
.end method

.method public static synthetic f3(Ll/bws;Ll/lc3;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bws;->x3(Ll/lc3;)V

    return-void
.end method

.method public static synthetic g3(Ll/bws;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/bws;->r3(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic h3(Ll/bws;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bws;->w3(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic i3(Ll/bws;Ll/t4u$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bws;->B3(Ll/t4u$a;)V

    return-void
.end method

.method public static synthetic j3(Ll/bws;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bws;->F3(Ljava/lang/Throwable;)V

    return-void
.end method

.method private k3(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;Ljava/util/HashMap;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean<",
            "Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;",
            ">;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;",
            ">;)Z"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    move v0, p0

    .line 3
    :goto_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;->getList()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-ge v0, v1, :cond_1

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;->getList()Ljava/util/List;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;

    .line 22
    .line 23
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->getTabId()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {p2, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-nez v2, :cond_0

    .line 32
    .line 33
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->isDisplay()Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_0

    .line 38
    .line 39
    return p0

    .line 40
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    const/4 p0, 0x1

    .line 44
    return p0
.end method

.method private m3(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean<",
            "Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/bws;->g:Ljava/util/List;

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    const/4 v3, 0x0

    .line 10
    if-eqz v1, :cond_1

    .line 11
    .line 12
    move v1, v3

    .line 13
    move v4, v1

    .line 14
    :goto_0
    iget-object v5, p0, Ll/bws;->g:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v5

    .line 20
    if-ge v1, v5, :cond_2

    .line 21
    .line 22
    iget-object v5, p0, Ll/bws;->g:Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {v5, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v5

    .line 28
    check-cast v5, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;

    .line 29
    .line 30
    invoke-virtual {v5}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->getTabId()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v6

    .line 34
    invoke-virtual {v0, v6, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v5}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->getRequestName()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v5

    .line 41
    invoke-static {v5}, Ll/y6u;->s(Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result v5

    .line 45
    if-eqz v5, :cond_0

    .line 46
    .line 47
    move v4, v2

    .line 48
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    move v4, v3

    .line 52
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;->getList()Ljava/util/List;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    new-instance v5, Ll/pvs;

    .line 57
    .line 58
    invoke-direct {v5}, Ll/pvs;-><init>()V

    .line 59
    .line 60
    .line 61
    invoke-static {v1, v5}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;->getList()Ljava/util/List;

    .line 66
    .line 67
    .line 68
    move-result-object v5

    .line 69
    new-instance v6, Ll/rvs;

    .line 70
    .line 71
    invoke-direct {v6}, Ll/rvs;-><init>()V

    .line 72
    .line 73
    .line 74
    invoke-static {v5, v6}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 75
    .line 76
    .line 77
    move-result v5

    .line 78
    if-eqz v1, :cond_4

    .line 79
    .line 80
    if-eqz v5, :cond_3

    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_3
    move v2, v3

    .line 84
    :cond_4
    :goto_1
    if-eqz v4, :cond_5

    .line 85
    .line 86
    if-eqz v2, :cond_5

    .line 87
    .line 88
    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 89
    .line 90
    .line 91
    goto :goto_2

    .line 92
    :cond_5
    invoke-direct {p0, p1, v0}, Ll/bws;->k3(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;Ljava/util/HashMap;)Z

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    if-eqz v1, :cond_6

    .line 97
    .line 98
    return-void

    .line 99
    :cond_6
    :goto_2
    invoke-direct {p0, p1, v0}, Ll/bws;->H3(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;Ljava/util/HashMap;)Ljava/util/List;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    iput-object p1, p0, Ll/bws;->g:Ljava/util/List;

    .line 104
    .line 105
    invoke-direct {p0, p1}, Ll/bws;->M3(Ljava/util/List;)V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method private n3()Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean<",
            "Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    new-instance v1, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;

    .line 12
    .line 13
    invoke-direct {v1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;-><init>()V

    .line 14
    .line 15
    .line 16
    const-string v2, "\u63a8\u8350"

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->setName(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const/4 v2, 0x1

    .line 22
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->setDefault(Z)V

    .line 23
    .line 24
    .line 25
    const-string v3, "2"

    .line 26
    .line 27
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->setTabId(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    const-string v3, "square-suggested"

    .line 31
    .line 32
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->setRequestName(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    const-string v3, "p_live_recommend"

    .line 36
    .line 37
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->setPageId(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->setDisplay(Z)V

    .line 41
    .line 42
    .line 43
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    new-instance v1, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;

    .line 47
    .line 48
    invoke-direct {v1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;-><init>()V

    .line 49
    .line 50
    .line 51
    const-string v3, "\u9644\u8fd1"

    .line 52
    .line 53
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->setName(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    const/4 v3, 0x0

    .line 57
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->setDefault(Z)V

    .line 58
    .line 59
    .line 60
    const-string v3, "1"

    .line 61
    .line 62
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->setTabId(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    const-string v3, "square-nearby"

    .line 66
    .line 67
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->setRequestName(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    const-string v3, "p_live_nearby"

    .line 71
    .line 72
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->setPageId(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->setDisplay(Z)V

    .line 76
    .line 77
    .line 78
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;->setList(Ljava/util/List;)V

    .line 82
    .line 83
    .line 84
    return-object p0
.end method

.method private p3(Landroid/os/Bundle;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/bws;->k:Ll/fk3$b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-object p1, v0, Ll/fk3$b;->a:Ljava/lang/String;

    .line 7
    .line 8
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast v0, Ll/kxs;

    .line 11
    .line 12
    iget-object v2, p0, Ll/bws;->g:Ljava/util/List;

    .line 13
    .line 14
    invoke-virtual {v0, v2, p1}, Ll/kxs;->K(Ljava/util/List;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iput-object v1, p0, Ll/bws;->k:Ll/fk3$b;

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    if-nez p1, :cond_1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    const-string v0, "default_tab_id"

    .line 24
    .line 25
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v1, "action"

    .line 30
    .line 31
    invoke-virtual {p1, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    const-string v2, "userId"

    .line 36
    .line 37
    invoke-virtual {p1, v2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iget-object v2, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 42
    .line 43
    check-cast v2, Ll/kxs;

    .line 44
    .line 45
    iget-object v3, p0, Ll/bws;->g:Ljava/util/List;

    .line 46
    .line 47
    invoke-virtual {v2, v3, v0}, Ll/kxs;->K(Ljava/util/List;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Ll/bws;->g:Ljava/util/List;

    .line 51
    .line 52
    new-instance v2, Ll/svs;

    .line 53
    .line 54
    invoke-direct {v2}, Ll/svs;-><init>()V

    .line 55
    .line 56
    .line 57
    invoke-static {v0, v2}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_2

    .line 62
    .line 63
    const-string v0, "openVideoChatProfile"

    .line 64
    .line 65
    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-eqz v0, :cond_2

    .line 70
    .line 71
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-nez v0, :cond_2

    .line 76
    .line 77
    invoke-virtual {p0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    const/4 v0, 0x0

    .line 82
    invoke-static {p0, p1, v0}, Ll/mbs;->m0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)V

    .line 83
    .line 84
    .line 85
    :cond_2
    :goto_0
    return-void
.end method

.method private synthetic r3(Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-direct {p0}, Ll/bws;->N3()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    const-wide/16 v0, 0x0

    .line 12
    .line 13
    iput-wide v0, p0, Ll/bws;->h:J

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    iput-object p1, p0, Ll/bws;->g:Ljava/util/List;

    .line 17
    .line 18
    const/4 p1, 0x1

    .line 19
    invoke-direct {p0, p1}, Ll/bws;->K3(Z)V

    .line 20
    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public final synthetic B3(Ll/t4u$a;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/bws;->k:Ll/fk3$b;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p1, Ll/fk3$b;->a:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast v0, Ll/kxs;

    .line 10
    .line 11
    iget-object v1, p0, Ll/bws;->g:Ljava/util/List;

    .line 12
    .line 13
    invoke-virtual {v0, v1, p1}, Ll/kxs;->K(Ljava/util/List;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    iput-object p1, p0, Ll/bws;->k:Ll/fk3$b;

    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public final synthetic C3(Lcom/p1/mobile/putong/live/external/square/LiveSquareSummaryInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mus;->F2()Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->LiveHomeSummaryEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeSummaryEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeSummaryEvent;->summary()Ll/v3f$d;

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

.method public final synthetic D3(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    invoke-direct {p0}, Ll/bws;->n3()Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0

    .line 8
    :cond_0
    return-object p1
.end method

.method public final synthetic E3(Landroid/os/Bundle;Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p2}, Ll/bws;->m3(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Ll/bws;->p3(Landroid/os/Bundle;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic F3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-direct {p0}, Ll/bws;->n3()Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-direct {p0, p1}, Ll/bws;->m3(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public G3()V
    .locals 2

    .line 1
    invoke-static {}, Ll/ppi0;->l()Ll/ppi0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/ppi0;->x()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    const-string v0, "live-tab"

    .line 13
    .line 14
    invoke-static {v0}, Lcom/p1/mobile/putong/live/external/module/api/LiveSquareApi;->getLiveSquareSummaryInfo(Ljava/lang/String;)Lrx/c;

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
    new-instance v1, Ll/kvs;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/kvs;-><init>(Ll/bws;)V

    .line 25
    .line 26
    .line 27
    new-instance p0, Ll/lvs;

    .line 28
    .line 29
    invoke-direct {p0}, Ll/lvs;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public I3(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {v0}, Ll/mbs;->A(Lcom/p1/mobile/android/app/Act;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    sget-object v0, Ll/tbs;->f:Ll/j6t;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-virtual {v0, v1}, Ll/j6t;->p(Z)V

    .line 20
    .line 21
    .line 22
    :cond_1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 23
    .line 24
    check-cast v0, Ll/kxs;

    .line 25
    .line 26
    invoke-virtual {v0, p1}, Ll/kxs;->v(I)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iput-object p1, p0, Ll/bws;->f:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {}, Ll/ppi0;->l()Ll/ppi0;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p1}, Ll/ppi0;->x()Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    if-eqz p1, :cond_2

    .line 41
    .line 42
    invoke-virtual {p0}, Ll/mus;->F2()Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    iget-object p0, p0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->LiveHomePageEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomePageEvent;

    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomePageEvent;->tabSelected()Ll/v3f$d;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    const-string p1, "tab_teen"

    .line 53
    .line 54
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_2
    invoke-virtual {p0}, Ll/mus;->F2()Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    iget-object p1, p1, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->LiveHomePageEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomePageEvent;

    .line 63
    .line 64
    invoke-virtual {p1}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomePageEvent;->tabSelected()Ll/v3f$d;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    iget-object p0, p0, Ll/bws;->f:Ljava/lang/String;

    .line 69
    .line 70
    invoke-virtual {p1, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public J3(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    invoke-virtual {p0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-static {p1, v0}, Ll/n4u;->j(Landroid/os/Bundle;Lcom/p1/mobile/android/app/Act;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    :goto_0
    return-void

    .line 15
    :cond_1
    const-string v0, "from"

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    invoke-virtual {p0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-static {p1, v0, v1}, Ll/n4u;->g(Landroid/os/Bundle;ILcom/p1/mobile/android/app/Act;)V

    .line 27
    .line 28
    .line 29
    const/4 v0, 0x1

    .line 30
    invoke-direct {p0, v0, p1}, Ll/bws;->L3(ZLandroid/os/Bundle;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public T()V
    .locals 4

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast v0, Ll/kxs;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/kxs;->r()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/mus;->H2()Ll/nus;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v0, v0, Ll/nus;->b:Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0, v0}, Ll/bws;->J3(Landroid/os/Bundle;)V

    .line 22
    .line 23
    .line 24
    invoke-static {}, Ll/ppi0;->l()Ll/ppi0;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Ll/ppi0;->y()Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    new-instance v1, Ll/fvs;

    .line 37
    .line 38
    invoke-direct {v1, p0}, Ll/fvs;-><init>(Ll/bws;)V

    .line 39
    .line 40
    .line 41
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 46
    .line 47
    .line 48
    new-instance v0, Ll/uvs;

    .line 49
    .line 50
    invoke-direct {v0, p0}, Ll/uvs;-><init>(Ll/bws;)V

    .line 51
    .line 52
    .line 53
    const-class v1, Ll/evs;

    .line 54
    .line 55
    invoke-virtual {p0, v1, v0}, Ll/mus;->E2(Ljava/lang/Class;Ll/qcj;)V

    .line 56
    .line 57
    .line 58
    new-instance v0, Ll/vvs;

    .line 59
    .line 60
    invoke-direct {v0, p0}, Ll/vvs;-><init>(Ll/bws;)V

    .line 61
    .line 62
    .line 63
    const-class v1, Ll/sys;

    .line 64
    .line 65
    invoke-virtual {p0, v1, v0}, Ll/mus;->E2(Ljava/lang/Class;Ll/qcj;)V

    .line 66
    .line 67
    .line 68
    new-instance v0, Ll/wvs;

    .line 69
    .line 70
    invoke-direct {v0, p0}, Ll/wvs;-><init>(Ll/bws;)V

    .line 71
    .line 72
    .line 73
    const-class v1, Ll/jcs;

    .line 74
    .line 75
    invoke-virtual {p0, v1, v0}, Ll/mus;->E2(Ljava/lang/Class;Ll/qcj;)V

    .line 76
    .line 77
    .line 78
    sget-object v0, Ll/itd0;->b:Ll/itd0;

    .line 79
    .line 80
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    check-cast v1, Ll/fk3;

    .line 85
    .line 86
    invoke-virtual {v1}, Ll/fk3;->A()Lrx/c;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-virtual {p0, v1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    new-instance v2, Ll/xvs;

    .line 95
    .line 96
    invoke-direct {v2, p0}, Ll/xvs;-><init>(Ll/bws;)V

    .line 97
    .line 98
    .line 99
    invoke-static {v2}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 104
    .line 105
    .line 106
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    check-cast v1, Ll/fk3;

    .line 111
    .line 112
    invoke-virtual {v1}, Ll/fk3;->s()Lrx/c;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    invoke-virtual {p0, v1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    new-instance v2, Ll/yvs;

    .line 121
    .line 122
    invoke-direct {v2}, Ll/yvs;-><init>()V

    .line 123
    .line 124
    .line 125
    invoke-virtual {v1, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    invoke-virtual {v1, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    new-instance v2, Ll/zvs;

    .line 138
    .line 139
    invoke-direct {v2, p0}, Ll/zvs;-><init>(Ll/bws;)V

    .line 140
    .line 141
    .line 142
    invoke-static {v2}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 143
    .line 144
    .line 145
    move-result-object v2

    .line 146
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 147
    .line 148
    .line 149
    invoke-virtual {p0}, Ll/mus;->F2()Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    iget-object v1, v1, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->LiveHomePageEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomePageEvent;

    .line 154
    .line 155
    invoke-virtual {v1}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomePageEvent;->tabSelected()Ll/v3f$d;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    invoke-virtual {v1}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 160
    .line 161
    .line 162
    move-result-object v1

    .line 163
    check-cast v1, Lrx/c;

    .line 164
    .line 165
    invoke-virtual {p0, v1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 166
    .line 167
    .line 168
    move-result-object v1

    .line 169
    const/4 v2, 0x1

    .line 170
    invoke-virtual {v1, v2}, Lrx/c;->skip(I)Lrx/c;

    .line 171
    .line 172
    .line 173
    move-result-object v1

    .line 174
    new-instance v3, Ll/aws;

    .line 175
    .line 176
    invoke-direct {v3, p0}, Ll/aws;-><init>(Ll/bws;)V

    .line 177
    .line 178
    .line 179
    invoke-static {v3}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 180
    .line 181
    .line 182
    move-result-object v3

    .line 183
    invoke-virtual {v1, v3}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 184
    .line 185
    .line 186
    invoke-direct {p0, v2}, Ll/bws;->K3(Z)V

    .line 187
    .line 188
    .line 189
    invoke-virtual {p0}, Ll/bws;->G3()V

    .line 190
    .line 191
    .line 192
    sget-object v1, Ll/itd0;->e:Ll/itd0;

    .line 193
    .line 194
    invoke-static {v1}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 195
    .line 196
    .line 197
    move-result-object v1

    .line 198
    check-cast v1, Ll/fm3;

    .line 199
    .line 200
    invoke-virtual {v1}, Ll/fm3;->c()Z

    .line 201
    .line 202
    .line 203
    move-result v1

    .line 204
    if-nez v1, :cond_0

    .line 205
    .line 206
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 207
    .line 208
    check-cast v1, Ll/kxs;

    .line 209
    .line 210
    invoke-virtual {v1, v2}, Ll/kxs;->G(Z)V

    .line 211
    .line 212
    .line 213
    :cond_0
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 214
    .line 215
    .line 216
    move-result-object v0

    .line 217
    check-cast v0, Ll/fk3;

    .line 218
    .line 219
    invoke-virtual {v0}, Ll/fk3;->y()Lrx/c;

    .line 220
    .line 221
    .line 222
    move-result-object v0

    .line 223
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 224
    .line 225
    .line 226
    move-result-object v0

    .line 227
    new-instance v1, Ll/gvs;

    .line 228
    .line 229
    invoke-direct {v1, p0}, Ll/gvs;-><init>(Ll/bws;)V

    .line 230
    .line 231
    .line 232
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 233
    .line 234
    .line 235
    move-result-object v1

    .line 236
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 237
    .line 238
    .line 239
    invoke-static {}, Ll/t4u;->j()Lrx/c;

    .line 240
    .line 241
    .line 242
    move-result-object v0

    .line 243
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 244
    .line 245
    .line 246
    move-result-object v0

    .line 247
    new-instance v1, Ll/hvs;

    .line 248
    .line 249
    invoke-direct {v1, p0}, Ll/hvs;-><init>(Ll/bws;)V

    .line 250
    .line 251
    .line 252
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 253
    .line 254
    .line 255
    move-result-object v1

    .line 256
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 257
    .line 258
    .line 259
    invoke-virtual {p0}, Ll/mus;->F2()Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 260
    .line 261
    .line 262
    move-result-object v0

    .line 263
    iget-object v0, v0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->LiveHomeMenuEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeMenuEvent;

    .line 264
    .line 265
    invoke-virtual {v0}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeMenuEvent;->isLiveVideoStyle()Ll/v3f$d;

    .line 266
    .line 267
    .line 268
    move-result-object v0

    .line 269
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 270
    .line 271
    .line 272
    move-result-object v0

    .line 273
    check-cast v0, Lrx/c;

    .line 274
    .line 275
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 276
    .line 277
    .line 278
    move-result-object v0

    .line 279
    new-instance v1, Ll/qvs;

    .line 280
    .line 281
    invoke-direct {v1, p0}, Ll/qvs;-><init>(Ll/bws;)V

    .line 282
    .line 283
    .line 284
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 285
    .line 286
    .line 287
    move-result-object v1

    .line 288
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 289
    .line 290
    .line 291
    sget-object v0, Ll/tbs;->f:Ll/j6t;

    .line 292
    .line 293
    const/4 v1, 0x0

    .line 294
    invoke-virtual {v0, v1}, Ll/j6t;->p(Z)V

    .line 295
    .line 296
    .line 297
    invoke-virtual {p0}, Ll/mus;->F2()Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 298
    .line 299
    .line 300
    move-result-object v0

    .line 301
    iget-object v0, v0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->LiveHomePageEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomePageEvent;

    .line 302
    .line 303
    invoke-virtual {v0}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomePageEvent;->processBundle()Ll/v3f$d;

    .line 304
    .line 305
    .line 306
    move-result-object v0

    .line 307
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 308
    .line 309
    .line 310
    move-result-object v0

    .line 311
    check-cast v0, Lrx/c;

    .line 312
    .line 313
    invoke-virtual {p0, v0, v1}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 314
    .line 315
    .line 316
    move-result-object v0

    .line 317
    new-instance v1, Ll/tvs;

    .line 318
    .line 319
    invoke-direct {v1, p0}, Ll/tvs;-><init>(Ll/bws;)V

    .line 320
    .line 321
    .line 322
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 323
    .line 324
    .line 325
    move-result-object p0

    .line 326
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 327
    .line 328
    .line 329
    return-void
.end method

.method public o3()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/kxs;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/kxs;->s()Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;

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

.method public q3(I)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/kxs;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/kxs;->u(I)Lcom/p1/mobile/android/app/Frag;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    instance-of p1, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    check-cast p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->d5()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method public final synthetic s3(Ll/evs;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/bws;->o3()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic t3(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/kxs;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/kxs;->J(Ljava/lang/Boolean;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic u3(Ll/sys;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bws;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic v3(Ll/jcs;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget p0, p0, Ll/bws;->j:I

    .line 2
    .line 3
    if-ltz p0, :cond_0

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

.method public final synthetic w3(Ll/uxj0;)V
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
    check-cast v0, Ll/kxs;

    .line 7
    .line 8
    iget-object v0, v0, Ll/kxs;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    check-cast p1, Ll/kxs;

    .line 13
    .line 14
    iget-object p1, p1, Ll/kxs;->c:Lcom/google/android/material/tabs/TabLayout;

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
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 24
    .line 25
    move-object p1, p0

    .line 26
    check-cast p1, Ll/kxs;

    .line 27
    .line 28
    move-object v0, p0

    .line 29
    check-cast v0, Ll/kxs;

    .line 30
    .line 31
    check-cast p0, Ll/kxs;

    .line 32
    .line 33
    iget-object p0, p0, Ll/kxs;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/google/android/material/tabs/TabLayout;->getSelectedTabPosition()I

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    invoke-virtual {v0, p0}, Ll/kxs;->v(I)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    const/4 v0, 0x1

    .line 44
    invoke-virtual {p1, p0, v0}, Ll/kxs;->A(Ljava/lang/String;Z)V

    .line 45
    .line 46
    .line 47
    :cond_0
    return-void
.end method

.method public final synthetic x3(Ll/lc3;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/kxs;

    .line 4
    .line 5
    iget p1, p1, Ll/lc3;->c:I

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/kxs;->F(I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic y3(Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "square-curated"

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    sget-object p1, Ll/itd0;->e:Ll/itd0;

    .line 10
    .line 11
    invoke-static {p1}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Ll/fm3;

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    invoke-virtual {p1, v0}, Ll/fm3;->h(Z)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 22
    .line 23
    check-cast p0, Ll/kxs;

    .line 24
    .line 25
    const/4 p1, 0x0

    .line 26
    invoke-virtual {p0, p1}, Ll/kxs;->G(Z)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public final synthetic z3(Ll/fk3$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bws;->k:Ll/fk3$b;

    .line 2
    .line 3
    return-void
.end method
