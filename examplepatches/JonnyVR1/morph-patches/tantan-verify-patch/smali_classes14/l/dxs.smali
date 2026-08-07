.class public Ll/dxs;
.super Ll/dvs;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/dvs<",
        "Ll/sxs;",
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
.method public constructor <init>(Ll/ner;Ll/nus;Landroidx/viewpager/widget/ViewPager;Lcom/google/android/material/tabs/TabLayout;Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/skin/ToolBarSkinView;Lv/VDraweeView;Lv/VDraweeView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/dvs;-><init>(Ll/ner;Ll/nus;)V

    .line 2
    .line 3
    .line 4
    const-string p1, ""

    .line 5
    .line 6
    iput-object p1, p0, Ll/dxs;->f:Ljava/lang/String;

    .line 7
    .line 8
    const/4 p1, -0x1

    .line 9
    iput p1, p0, Ll/dxs;->i:I

    .line 10
    .line 11
    iput p1, p0, Ll/dxs;->j:I

    .line 12
    .line 13
    new-instance p2, Ll/sxs;

    .line 14
    .line 15
    invoke-direct/range {p2 .. p7}, Ll/sxs;-><init>(Landroidx/viewpager/widget/ViewPager;Lcom/google/android/material/tabs/TabLayout;Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/skin/ToolBarSkinView;Lv/VDraweeView;Lv/VDraweeView;)V

    .line 16
    .line 17
    .line 18
    iput-object p2, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 19
    .line 20
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic P2(Ll/dxs;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/dxs;->y3(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic Q2(Ll/dxs;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dxs;->H3(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic R2(Ll/dxs;Ll/lc3;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dxs;->G3(Ll/lc3;)V

    return-void
.end method

.method public static synthetic S2(Ll/dxs;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dxs;->P3(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic T2(Ll/dxs;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dxs;->F3(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic U2(Ll/lc3;)Ljava/lang/Boolean;
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

.method public static synthetic V2(Ll/dxs;Ll/t4u$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dxs;->z3(Ll/t4u$a;)V

    return-void
.end method

.method public static synthetic W2(Ll/dxs;Ll/sys;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dxs;->D3(Ll/sys;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic X2(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;)Ljava/lang/Boolean;
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

.method public static synthetic Y2(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;)Ljava/lang/Boolean;
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

.method public static synthetic Z2(Ll/dxs;Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dxs;->K3(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic a3(Ll/dxs;Ll/evs;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dxs;->C3(Ll/evs;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic c3(Ll/dxs;Ll/jcs;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dxs;->E3(Ll/jcs;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic d3(Ll/dxs;Ll/fk3$b;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dxs;->I3(Ll/fk3$b;)V

    return-void
.end method

.method public static synthetic e3(Ll/dxs;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dxs;->x3(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic f3(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;)Ljava/lang/Boolean;
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

.method public static synthetic g3(Ll/dxs;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dxs;->B3(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic h3(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;)Ljava/lang/Boolean;
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

.method public static synthetic i3(Ll/dxs;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dxs;->M3(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic j3(Ll/dxs;Lcom/p1/mobile/putong/live/external/square/LiveSquareSummaryInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dxs;->J3(Lcom/p1/mobile/putong/live/external/square/LiveSquareSummaryInfo;)V

    return-void
.end method

.method public static synthetic k3(Ll/dxs;Landroid/os/Bundle;Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/dxs;->L3(Landroid/os/Bundle;Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)V

    return-void
.end method

.method public static synthetic m3(Ll/dxs;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dxs;->u3(Z)V

    return-void
.end method

.method public static synthetic n3(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;)Ljava/lang/Boolean;
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

.method private synthetic y3(Ljava/lang/Boolean;)V
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
    invoke-virtual {p0}, Ll/dxs;->X3()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    const-wide/16 v0, 0x0

    .line 12
    .line 13
    iput-wide v0, p0, Ll/dxs;->h:J

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    iput-object p1, p0, Ll/dxs;->g:Ljava/util/List;

    .line 17
    .line 18
    const/4 p1, 0x1

    .line 19
    invoke-virtual {p0, p1}, Ll/dxs;->T3(Z)V

    .line 20
    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public final synthetic B3(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/sxs;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/sxs;->F(Ljava/lang/Boolean;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic C3(Ll/evs;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/dxs;->s3()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic D3(Ll/sys;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dxs;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic E3(Ll/jcs;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget p0, p0, Ll/dxs;->j:I

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

.method public final synthetic F3(Ll/uxj0;)V
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
    check-cast v0, Ll/sxs;

    .line 7
    .line 8
    iget-object v0, v0, Ll/sxs;->d:Lcom/google/android/material/tabs/TabLayout;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    check-cast p1, Ll/sxs;

    .line 13
    .line 14
    iget-object p1, p1, Ll/sxs;->d:Lcom/google/android/material/tabs/TabLayout;

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
    check-cast p1, Ll/sxs;

    .line 27
    .line 28
    move-object v0, p0

    .line 29
    check-cast v0, Ll/sxs;

    .line 30
    .line 31
    check-cast p0, Ll/sxs;

    .line 32
    .line 33
    iget-object p0, p0, Ll/sxs;->d:Lcom/google/android/material/tabs/TabLayout;

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/google/android/material/tabs/TabLayout;->getSelectedTabPosition()I

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    invoke-virtual {v0, p0}, Ll/sxs;->v(I)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    const/4 v0, 0x1

    .line 44
    invoke-virtual {p1, p0, v0}, Ll/sxs;->A(Ljava/lang/String;Z)V

    .line 45
    .line 46
    .line 47
    :cond_0
    return-void
.end method

.method public final synthetic G3(Ll/lc3;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/sxs;

    .line 4
    .line 5
    iget p1, p1, Ll/lc3;->c:I

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/sxs;->G(I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic H3(Ljava/lang/String;)V
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
    check-cast p0, Ll/sxs;

    .line 24
    .line 25
    const/4 p1, 0x0

    .line 26
    invoke-virtual {p0, p1}, Ll/sxs;->H(Z)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public final synthetic I3(Ll/fk3$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dxs;->k:Ll/fk3$b;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic J3(Lcom/p1/mobile/putong/live/external/square/LiveSquareSummaryInfo;)V
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

.method public final synthetic K3(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/dxs;->q3()Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;

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

.method public final synthetic L3(Landroid/os/Bundle;Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p2}, Ll/dxs;->p3(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/dxs;->t3(Landroid/os/Bundle;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic M3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-virtual {p0}, Ll/dxs;->q3()Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/dxs;->p3(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)V
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

.method public N3()V
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
    new-instance v1, Ll/pws;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/pws;-><init>(Ll/dxs;)V

    .line 25
    .line 26
    .line 27
    new-instance p0, Ll/qws;

    .line 28
    .line 29
    invoke-direct {p0}, Ll/qws;-><init>()V

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

.method public final O3(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;Ljava/util/HashMap;)Ljava/util/List;
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

.method public final P3(Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->w8(Lcom/p1/mobile/android/app/Act;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    sget-object v0, Ll/tbs;->f:Ll/j6t;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ll/j6t;->p(Z)V

    .line 19
    .line 20
    .line 21
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    invoke-static {v1}, Ll/mbs;->U(Z)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    invoke-virtual {p0}, Ll/dxs;->V3()V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public R3(I)V
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
    check-cast v0, Ll/sxs;

    .line 25
    .line 26
    invoke-virtual {v0, p1}, Ll/sxs;->v(I)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iput-object p1, p0, Ll/dxs;->f:Ljava/lang/String;

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
    move-result-object p1

    .line 46
    iget-object p1, p1, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->LiveHomePageEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomePageEvent;

    .line 47
    .line 48
    invoke-virtual {p1}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomePageEvent;->tabSelected()Ll/v3f$d;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    const-string v0, "tab_teen"

    .line 53
    .line 54
    invoke-virtual {p1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    goto :goto_0

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
    iget-object v0, p0, Ll/dxs;->f:Ljava/lang/String;

    .line 69
    .line 70
    invoke-virtual {p1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 71
    .line 72
    .line 73
    :goto_0
    invoke-virtual {p0}, Ll/dxs;->V3()V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public S3(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    new-instance p0, Ljava/lang/NullPointerException;

    .line 4
    .line 5
    const-string p1, "LiveSquareAct start intent lost data"

    .line 6
    .line 7
    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-virtual {p0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {p1, v0}, Ll/n4u;->j(Landroid/os/Bundle;Lcom/p1/mobile/android/app/Act;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    const-string v0, "from"

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    invoke-virtual {p0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-static {p1, v0, v1}, Ll/n4u;->g(Landroid/os/Bundle;ILcom/p1/mobile/android/app/Act;)V

    .line 37
    .line 38
    .line 39
    const/4 v0, 0x1

    .line 40
    invoke-virtual {p0, v0, p1}, Ll/dxs;->U3(ZLandroid/os/Bundle;)V

    .line 41
    .line 42
    .line 43
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
    check-cast v0, Ll/sxs;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/sxs;->r()V

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
    new-instance v1, Ll/axs;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ll/axs;-><init>(Ll/dxs;)V

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
    invoke-static {}, Ll/mbs;->v()Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    new-instance v1, Ll/bxs;

    .line 60
    .line 61
    invoke-direct {v1, p0}, Ll/bxs;-><init>(Ll/dxs;)V

    .line 62
    .line 63
    .line 64
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 69
    .line 70
    .line 71
    invoke-static {}, Ll/ppi0;->l()Ll/ppi0;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {v0}, Ll/ppi0;->y()Lrx/c;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    new-instance v1, Ll/cxs;

    .line 84
    .line 85
    invoke-direct {v1, p0}, Ll/cxs;-><init>(Ll/dxs;)V

    .line 86
    .line 87
    .line 88
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 93
    .line 94
    .line 95
    new-instance v0, Ll/dws;

    .line 96
    .line 97
    invoke-direct {v0, p0}, Ll/dws;-><init>(Ll/dxs;)V

    .line 98
    .line 99
    .line 100
    const-class v1, Ll/evs;

    .line 101
    .line 102
    invoke-virtual {p0, v1, v0}, Ll/mus;->E2(Ljava/lang/Class;Ll/qcj;)V

    .line 103
    .line 104
    .line 105
    new-instance v0, Ll/ews;

    .line 106
    .line 107
    invoke-direct {v0, p0}, Ll/ews;-><init>(Ll/dxs;)V

    .line 108
    .line 109
    .line 110
    const-class v1, Ll/sys;

    .line 111
    .line 112
    invoke-virtual {p0, v1, v0}, Ll/mus;->E2(Ljava/lang/Class;Ll/qcj;)V

    .line 113
    .line 114
    .line 115
    new-instance v0, Ll/fws;

    .line 116
    .line 117
    invoke-direct {v0, p0}, Ll/fws;-><init>(Ll/dxs;)V

    .line 118
    .line 119
    .line 120
    const-class v1, Ll/jcs;

    .line 121
    .line 122
    invoke-virtual {p0, v1, v0}, Ll/mus;->E2(Ljava/lang/Class;Ll/qcj;)V

    .line 123
    .line 124
    .line 125
    sget-object v0, Ll/itd0;->b:Ll/itd0;

    .line 126
    .line 127
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    check-cast v1, Ll/fk3;

    .line 132
    .line 133
    invoke-virtual {v1}, Ll/fk3;->A()Lrx/c;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    invoke-virtual {p0, v1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    new-instance v2, Ll/gws;

    .line 142
    .line 143
    invoke-direct {v2, p0}, Ll/gws;-><init>(Ll/dxs;)V

    .line 144
    .line 145
    .line 146
    invoke-static {v2}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 147
    .line 148
    .line 149
    move-result-object v2

    .line 150
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 151
    .line 152
    .line 153
    invoke-static {}, Ll/t4u;->i()Lrx/c;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    invoke-virtual {p0, v1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 158
    .line 159
    .line 160
    move-result-object v1

    .line 161
    new-instance v2, Ll/hws;

    .line 162
    .line 163
    invoke-direct {v2, p0}, Ll/hws;-><init>(Ll/dxs;)V

    .line 164
    .line 165
    .line 166
    invoke-static {v2}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 167
    .line 168
    .line 169
    move-result-object v2

    .line 170
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 171
    .line 172
    .line 173
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 174
    .line 175
    .line 176
    move-result-object v1

    .line 177
    check-cast v1, Ll/fk3;

    .line 178
    .line 179
    invoke-virtual {v1}, Ll/fk3;->s()Lrx/c;

    .line 180
    .line 181
    .line 182
    move-result-object v1

    .line 183
    invoke-virtual {p0, v1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 184
    .line 185
    .line 186
    move-result-object v1

    .line 187
    new-instance v2, Ll/iws;

    .line 188
    .line 189
    invoke-direct {v2}, Ll/iws;-><init>()V

    .line 190
    .line 191
    .line 192
    invoke-virtual {v1, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 193
    .line 194
    .line 195
    move-result-object v1

    .line 196
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 197
    .line 198
    .line 199
    move-result-object v2

    .line 200
    invoke-virtual {v1, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 201
    .line 202
    .line 203
    move-result-object v1

    .line 204
    new-instance v2, Ll/nws;

    .line 205
    .line 206
    invoke-direct {v2, p0}, Ll/nws;-><init>(Ll/dxs;)V

    .line 207
    .line 208
    .line 209
    invoke-static {v2}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 210
    .line 211
    .line 212
    move-result-object v2

    .line 213
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 214
    .line 215
    .line 216
    invoke-virtual {p0}, Ll/mus;->F2()Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 217
    .line 218
    .line 219
    move-result-object v1

    .line 220
    iget-object v1, v1, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->LiveHomeMenuEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeMenuEvent;

    .line 221
    .line 222
    invoke-virtual {v1}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeMenuEvent;->isLiveVideoStyle()Ll/v3f$d;

    .line 223
    .line 224
    .line 225
    move-result-object v1

    .line 226
    invoke-virtual {v1}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 227
    .line 228
    .line 229
    move-result-object v1

    .line 230
    check-cast v1, Lrx/c;

    .line 231
    .line 232
    invoke-virtual {p0, v1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 233
    .line 234
    .line 235
    move-result-object v1

    .line 236
    new-instance v2, Ll/vws;

    .line 237
    .line 238
    invoke-direct {v2, p0}, Ll/vws;-><init>(Ll/dxs;)V

    .line 239
    .line 240
    .line 241
    invoke-static {v2}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 242
    .line 243
    .line 244
    move-result-object v2

    .line 245
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 246
    .line 247
    .line 248
    invoke-virtual {p0}, Ll/mus;->F2()Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 249
    .line 250
    .line 251
    move-result-object v1

    .line 252
    iget-object v1, v1, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->LiveHomePageEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomePageEvent;

    .line 253
    .line 254
    invoke-virtual {v1}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomePageEvent;->tabSelected()Ll/v3f$d;

    .line 255
    .line 256
    .line 257
    move-result-object v1

    .line 258
    invoke-virtual {v1}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 259
    .line 260
    .line 261
    move-result-object v1

    .line 262
    check-cast v1, Lrx/c;

    .line 263
    .line 264
    invoke-virtual {p0, v1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 265
    .line 266
    .line 267
    move-result-object v1

    .line 268
    const/4 v2, 0x1

    .line 269
    invoke-virtual {v1, v2}, Lrx/c;->skip(I)Lrx/c;

    .line 270
    .line 271
    .line 272
    move-result-object v1

    .line 273
    new-instance v3, Ll/wws;

    .line 274
    .line 275
    invoke-direct {v3, p0}, Ll/wws;-><init>(Ll/dxs;)V

    .line 276
    .line 277
    .line 278
    invoke-static {v3}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 279
    .line 280
    .line 281
    move-result-object v3

    .line 282
    invoke-virtual {v1, v3}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 283
    .line 284
    .line 285
    invoke-virtual {p0, v2}, Ll/dxs;->T3(Z)V

    .line 286
    .line 287
    .line 288
    invoke-virtual {p0}, Ll/dxs;->N3()V

    .line 289
    .line 290
    .line 291
    sget-object v1, Ll/itd0;->e:Ll/itd0;

    .line 292
    .line 293
    invoke-static {v1}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 294
    .line 295
    .line 296
    move-result-object v1

    .line 297
    check-cast v1, Ll/fm3;

    .line 298
    .line 299
    invoke-virtual {v1}, Ll/fm3;->c()Z

    .line 300
    .line 301
    .line 302
    move-result v1

    .line 303
    if-nez v1, :cond_0

    .line 304
    .line 305
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 306
    .line 307
    check-cast v1, Ll/sxs;

    .line 308
    .line 309
    invoke-virtual {v1, v2}, Ll/sxs;->H(Z)V

    .line 310
    .line 311
    .line 312
    :cond_0
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 313
    .line 314
    .line 315
    move-result-object v0

    .line 316
    check-cast v0, Ll/fk3;

    .line 317
    .line 318
    invoke-virtual {v0}, Ll/fk3;->y()Lrx/c;

    .line 319
    .line 320
    .line 321
    move-result-object v0

    .line 322
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 323
    .line 324
    .line 325
    move-result-object v0

    .line 326
    new-instance v1, Ll/xws;

    .line 327
    .line 328
    invoke-direct {v1, p0}, Ll/xws;-><init>(Ll/dxs;)V

    .line 329
    .line 330
    .line 331
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 332
    .line 333
    .line 334
    move-result-object v1

    .line 335
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 336
    .line 337
    .line 338
    invoke-static {}, Ll/t4u;->j()Lrx/c;

    .line 339
    .line 340
    .line 341
    move-result-object v0

    .line 342
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 343
    .line 344
    .line 345
    move-result-object v0

    .line 346
    new-instance v1, Ll/yws;

    .line 347
    .line 348
    invoke-direct {v1, p0}, Ll/yws;-><init>(Ll/dxs;)V

    .line 349
    .line 350
    .line 351
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 352
    .line 353
    .line 354
    move-result-object v1

    .line 355
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 356
    .line 357
    .line 358
    invoke-virtual {p0}, Ll/mus;->F2()Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 359
    .line 360
    .line 361
    move-result-object v0

    .line 362
    iget-object v0, v0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->LiveHomeMenuEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeMenuEvent;

    .line 363
    .line 364
    invoke-virtual {v0}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeMenuEvent;->onMenuDialogShow()Ll/v3f$d;

    .line 365
    .line 366
    .line 367
    move-result-object v0

    .line 368
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 369
    .line 370
    .line 371
    move-result-object v0

    .line 372
    check-cast v0, Lrx/c;

    .line 373
    .line 374
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 375
    .line 376
    .line 377
    move-result-object v0

    .line 378
    new-instance v1, Ll/zws;

    .line 379
    .line 380
    invoke-direct {v1, p0}, Ll/zws;-><init>(Ll/dxs;)V

    .line 381
    .line 382
    .line 383
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 384
    .line 385
    .line 386
    move-result-object p0

    .line 387
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 388
    .line 389
    .line 390
    return-void
.end method

.method public final T3(Z)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/dxs;->U3(ZLandroid/os/Bundle;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final U3(ZLandroid/os/Bundle;)V
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
    iget-wide v2, p0, Ll/dxs;->h:J

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
    iput-wide v0, p0, Ll/dxs;->h:J

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
    new-instance v0, Ll/lws;

    .line 44
    .line 45
    invoke-direct {v0, p0}, Ll/lws;-><init>(Ll/dxs;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    new-instance v0, Ll/mws;

    .line 53
    .line 54
    invoke-direct {v0, p0, p2}, Ll/mws;-><init>(Ll/dxs;Landroid/os/Bundle;)V

    .line 55
    .line 56
    .line 57
    new-instance p2, Ll/ows;

    .line 58
    .line 59
    invoke-direct {p2, p0}, Ll/ows;-><init>(Ll/dxs;)V

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

.method public final V3()V
    .locals 2

    .line 1
    invoke-static {}, Ll/t4u;->h()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast v0, Ll/sxs;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/sxs;->s()Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->c5()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    invoke-static {v0}, Ll/mbs;->U(Z)V

    .line 23
    .line 24
    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    sget v1, Ll/m9c0;->H:I

    .line 40
    .line 41
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/app/Act;->setStatusBarColor(I)V

    .line 46
    .line 47
    .line 48
    :cond_1
    :goto_0
    return-void

    .line 49
    :cond_2
    const/4 p0, 0x0

    .line 50
    invoke-static {p0}, Ll/mbs;->U(Z)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final W3(Ljava/util/List;)V
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
    new-instance v0, Ll/jws;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/jws;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-static {p1, v0}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iput v0, p0, Ll/dxs;->i:I

    .line 17
    .line 18
    new-instance v0, Ll/kws;

    .line 19
    .line 20
    invoke-direct {v0}, Ll/kws;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-static {p1, v0}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    iput v0, p0, Ll/dxs;->j:I

    .line 28
    .line 29
    :cond_0
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 30
    .line 31
    check-cast v0, Ll/sxs;

    .line 32
    .line 33
    invoke-virtual {v0, p1}, Ll/sxs;->E(Ljava/util/List;)V

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
    invoke-virtual {p0}, Ll/dxs;->s3()Ljava/lang/String;

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

.method public final X3()V
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
    invoke-virtual {p0, v0}, Ll/dxs;->W3(Ljava/util/List;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public Y3(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/sxs;

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ll/sxs;->I(Ljava/lang/Boolean;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 13
    .line 14
    check-cast p0, Ll/sxs;

    .line 15
    .line 16
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p0, p1}, Ll/sxs;->L(Ljava/lang/Boolean;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final o3(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;Ljava/util/HashMap;)Z
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

.method public final p3(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)V
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
    iget-object v1, p0, Ll/dxs;->g:Ljava/util/List;

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
    iget-object v5, p0, Ll/dxs;->g:Ljava/util/List;

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
    iget-object v5, p0, Ll/dxs;->g:Ljava/util/List;

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
    new-instance v5, Ll/rws;

    .line 57
    .line 58
    invoke-direct {v5}, Ll/rws;-><init>()V

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
    new-instance v6, Ll/sws;

    .line 70
    .line 71
    invoke-direct {v6}, Ll/sws;-><init>()V

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
    invoke-virtual {p0, p1, v0}, Ll/dxs;->o3(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;Ljava/util/HashMap;)Z

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
    invoke-virtual {p0, p1, v0}, Ll/dxs;->O3(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;Ljava/util/HashMap;)Ljava/util/List;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    iput-object p1, p0, Ll/dxs;->g:Ljava/util/List;

    .line 104
    .line 105
    invoke-virtual {p0, p1}, Ll/dxs;->W3(Ljava/util/List;)V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method public final q3()Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;
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

.method public r3()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/sxs;

    .line 4
    .line 5
    iget-object p0, p0, Ll/sxs;->c:Landroidx/viewpager/widget/ViewPager;

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
    check-cast v0, Ll/n2u;

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

.method public s3()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/sxs;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/sxs;->s()Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;

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

.method public final t3(Landroid/os/Bundle;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/dxs;->k:Ll/fk3$b;

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
    check-cast v0, Ll/sxs;

    .line 11
    .line 12
    iget-object v2, p0, Ll/dxs;->g:Ljava/util/List;

    .line 13
    .line 14
    invoke-virtual {v0, v2, p1}, Ll/sxs;->M(Ljava/util/List;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iput-object v1, p0, Ll/dxs;->k:Ll/fk3$b;

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
    check-cast v2, Ll/sxs;

    .line 44
    .line 45
    iget-object v3, p0, Ll/dxs;->g:Ljava/util/List;

    .line 46
    .line 47
    invoke-virtual {v2, v3, v0}, Ll/sxs;->M(Ljava/util/List;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Ll/dxs;->g:Ljava/util/List;

    .line 51
    .line 52
    new-instance v2, Ll/tws;

    .line 53
    .line 54
    invoke-direct {v2}, Ll/tws;-><init>()V

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

.method public final u3(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/dxs;->r3()V

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    const/4 p1, 0x0

    .line 8
    invoke-virtual {p0, p1}, Ll/dxs;->T3(Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public v3(I)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/sxs;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/sxs;->u(I)Lcom/p1/mobile/android/app/Frag;

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

.method public w3()Z
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

.method public final synthetic x3(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/t4u;->h()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Ll/dxs;->w3()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/dxs;->w3()Z

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
    invoke-virtual {p0, p1}, Ll/dxs;->S3(Landroid/os/Bundle;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic z3(Ll/t4u$a;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/dxs;->k:Ll/fk3$b;

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
    check-cast v0, Ll/sxs;

    .line 10
    .line 11
    iget-object v1, p0, Ll/dxs;->g:Ljava/util/List;

    .line 12
    .line 13
    invoke-virtual {v0, v1, p1}, Ll/sxs;->M(Ljava/util/List;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    iput-object p1, p0, Ll/dxs;->k:Ll/fk3$b;

    .line 18
    .line 19
    :cond_0
    return-void
.end method
