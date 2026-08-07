.class public Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;
.super Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;
.source "SourceFile"

# interfaces
.implements Ll/jn50;
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;",
        "Ll/jn50;",
        "Ll/iam<",
        "Ll/y3o;",
        ">;"
    }
.end annotation


# instance fields
.field public A:Lcom/google/android/material/appbar/AppBarLayout;

.field public B:Lv/VText;

.field public C:Lv/VRecyclerView;

.field public D:Landroidx/core/widget/NestedScrollView;

.field public E:Lv/VImage;

.field public F:Lv/VText;

.field public G:Landroidx/core/widget/NestedScrollView;

.field public H:Lv/VImage;

.field public I:Lv/VText;

.field public J:Lv/VText;

.field public K:Z

.field public L:Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;

.field public M:Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

.field public final N:Ll/r0u;

.field public O:Ll/y3o;

.field public z:Lv/VPullDownRefreshLayout;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->K:Z

    .line 6
    .line 7
    invoke-static {}, Ll/r0u;->J0()Ll/r0u;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->N:Ll/r0u;

    .line 12
    .line 13
    return-void
.end method

.method private synthetic A5()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->A:Lcom/google/android/material/appbar/AppBarLayout;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Lcom/google/android/material/appbar/AppBarLayout;->setExpanded(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private B5(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->O:Ll/y3o;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/y3o;->i3()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->g5(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic k5(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->w5(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic l5(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->y5(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic m5(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->A5()V

    return-void
.end method

.method public static synthetic n5(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->z5(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic o5(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->t5()V

    return-void
.end method

.method public static synthetic p5(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic q5(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;Lcom/google/android/material/appbar/AppBarLayout;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->x5(Lcom/google/android/material/appbar/AppBarLayout;I)V

    return-void
.end method

.method private t5()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->O:Ll/y3o;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->O:Ll/y3o;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/y3o;->n()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method private synthetic w5(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->z:Lv/VPullDownRefreshLayout;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->w2(Ll/mvc0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic x5(Lcom/google/android/material/appbar/AppBarLayout;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->z:Lv/VPullDownRefreshLayout;

    .line 2
    .line 3
    if-ltz p2, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p1, 0x0

    .line 8
    :goto_0
    invoke-virtual {p0, p1}, Lv/smart_refresh/SmartRefreshLayout;->I(Z)Ll/mvc0;

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private synthetic y5(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;->Z1(Landroid/content/Context;)Landroid/content/Intent;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 14
    .line 15
    .line 16
    const-string p0, "e_anchor_search"

    .line 17
    .line 18
    const-string p1, "p_audio_explore_recommend"

    .line 19
    .line 20
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private synthetic z5(Ljava/lang/Integer;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->N:Ll/r0u;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->getItemCount()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    add-int/lit8 v0, v0, -0x2

    .line 12
    .line 13
    if-ne p1, v0, :cond_0

    .line 14
    .line 15
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->O:Ll/y3o;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->L:Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;

    .line 18
    .line 19
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->disableFilterRepeat:Z

    .line 20
    .line 21
    invoke-virtual {p1, p0}, Ll/y3o;->j3(Z)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public C5()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->K5()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->N:Ll/r0u;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/v6u;->k0()V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->N:Ll/r0u;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/r0u;->K0()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public D5()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->N:Ll/r0u;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->h5(Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public E5()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->z:Lv/VPullDownRefreshLayout;

    .line 2
    .line 3
    invoke-virtual {p0}, Lv/smart_refresh/SmartRefreshLayout;->n()Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public F5(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->J5()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public G5()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->N:Ll/r0u;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->getItemCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->C:Lv/VRecyclerView;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public H5(Ll/p5u;)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->u5()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance p1, Ljava/lang/NullPointerException;

    .line 8
    .line 9
    const-string v0, "LiveSetting is Null!"

    .line 10
    .line 11
    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->F5(Ljava/lang/Throwable;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    const/4 v0, 0x1

    .line 19
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->loaded:Z

    .line 20
    .line 21
    new-instance v1, Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 24
    .line 25
    .line 26
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->L:Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;

    .line 27
    .line 28
    invoke-static {p1, v2}, Ll/lao;->c(Ll/p5u;Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;)Ljava/util/ArrayList;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    new-instance v3, Ll/hk4;

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 35
    .line 36
    .line 37
    move-result-object v4

    .line 38
    invoke-direct {v3, v4}, Ll/hk4;-><init>(Ll/ner;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v3, v0}, Ll/hk4;->c(I)V

    .line 42
    .line 43
    .line 44
    invoke-static {v3, v2}, Ll/e4s;->b(Ll/hk4;Ljava/util/List;)Ljava/util/List;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-interface {v1, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 49
    .line 50
    .line 51
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    xor-int/2addr v2, v0

    .line 56
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    xor-int/2addr v3, v0

    .line 61
    invoke-virtual {p0, v2, v3}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->I5(ZZ)V

    .line 62
    .line 63
    .line 64
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    if-nez v2, :cond_1

    .line 69
    .line 70
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->v5(Ll/p5u;Z)Ll/h2u;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->N:Ll/r0u;

    .line 78
    .line 79
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public I5(ZZ)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->C:Lv/VRecyclerView;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->D:Landroidx/core/widget/NestedScrollView;

    .line 7
    .line 8
    xor-int/lit8 p2, p2, 0x1

    .line 9
    .line 10
    invoke-static {p1, p2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->G:Landroidx/core/widget/NestedScrollView;

    .line 14
    .line 15
    const/4 p1, 0x4

    .line 16
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public J5()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->G:Landroidx/core/widget/NestedScrollView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->C:Lv/VRecyclerView;

    .line 8
    .line 9
    const/4 v1, 0x4

    .line 10
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->D:Landroidx/core/widget/NestedScrollView;

    .line 14
    .line 15
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public K5()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->z:Lv/VPullDownRefreshLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Lv/smart_refresh/SmartRefreshLayout;->t()Ll/mvc0;

    .line 4
    .line 5
    .line 6
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->K:Z

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isAdded()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isRemoving()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    const/4 v0, 0x1

    .line 23
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->K:Z

    .line 24
    .line 25
    new-instance v0, Ll/p3o;

    .line 26
    .line 27
    invoke-direct {v0, p0}, Ll/p3o;-><init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;)V

    .line 28
    .line 29
    .line 30
    const-wide/16 v1, 0xc8

    .line 31
    .line 32
    invoke-static {p0, v0, v1, v2}, Ll/l51;->I(Lcom/p1/mobile/android/app/Frag;Ljava/lang/Runnable;J)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public S4(ZIJ)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->S4(ZIJ)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_2

    .line 5
    .line 6
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->loaded:Z

    .line 7
    .line 8
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->O:Ll/y3o;

    .line 9
    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p2}, Ll/y3o;->i3()V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-virtual {p2}, Ll/a1u;->P2()I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    int-to-long p1, p1

    .line 21
    const-wide/16 v0, 0x3e8

    .line 22
    .line 23
    mul-long/2addr p1, v0

    .line 24
    cmp-long p1, p3, p1

    .line 25
    .line 26
    if-lez p1, :cond_1

    .line 27
    .line 28
    const/4 p1, 0x0

    .line 29
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->B5(Z)V

    .line 30
    .line 31
    .line 32
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->N:Ll/r0u;

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/r0u;->K0()V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->N:Ll/r0u;

    .line 39
    .line 40
    invoke-virtual {p0}, Ll/r0u;->L0()V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public U4(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 1
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->U4(Landroid/view/View;Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/y3o;

    .line 5
    .line 6
    new-instance p2, Ll/nus;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->Z4()Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-direct {p2, v0, p0}, Ll/nus;-><init>(Lcom/tantan/live/home/eventbus/LiveHomeEventBus;Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;)V

    .line 13
    .line 14
    .line 15
    invoke-direct {p1, p0, p2}, Ll/y3o;-><init>(Ll/ner;Ll/nus;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1, p0}, Ll/l6t;->C(Ll/iam;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public Y4()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->O:Ll/y3o;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->B5(Z)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->G5()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public d4()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->d4()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->L:Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "TAB_INFO_BEAN"

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;

    .line 25
    .line 26
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->L:Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;

    .line 27
    .line 28
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->L:Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;

    .line 29
    .line 30
    if-nez v0, :cond_1

    .line 31
    .line 32
    new-instance v0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;

    .line 33
    .line 34
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->L:Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;

    .line 38
    .line 39
    :cond_1
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public f4()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/i3o;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/i3o;-><init>()V

    .line 7
    .line 8
    .line 9
    new-instance v1, Ll/j3o;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/j3o;-><init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/app/Frag;->creates(Ll/y20;Ll/x20;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->J:Lv/VText;

    .line 5
    .line 6
    new-instance v0, Ll/k3o;

    .line 7
    .line 8
    invoke-direct {v0, p0}, Ll/k3o;-><init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->z:Lv/VPullDownRefreshLayout;

    .line 15
    .line 16
    invoke-virtual {p1, p0}, Lv/VPullDownRefreshLayout;->O(Ll/jn50;)Ll/mvc0;

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->A:Lcom/google/android/material/appbar/AppBarLayout;

    .line 20
    .line 21
    new-instance v0, Ll/l3o;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Ll/l3o;-><init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1, v0}, Lcom/google/android/material/appbar/AppBarLayout;->addOnOffsetChangedListener(Lcom/google/android/material/appbar/AppBarLayout$OnOffsetChangedListener;)V

    .line 27
    .line 28
    .line 29
    sget-object p1, Ll/tbs;->b:Ll/vwt;

    .line 30
    .line 31
    invoke-virtual {p1}, Ll/vwt;->m5()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_0

    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->B:Lv/VText;

    .line 42
    .line 43
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 44
    .line 45
    .line 46
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->B:Lv/VText;

    .line 47
    .line 48
    new-instance v0, Ll/m3o;

    .line 49
    .line 50
    invoke-direct {v0, p0}, Ll/m3o;-><init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;)V

    .line 51
    .line 52
    .line 53
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->z:Lv/VPullDownRefreshLayout;

    .line 57
    .line 58
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 63
    .line 64
    sget v0, Ll/qa00;->c:I

    .line 65
    .line 66
    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 67
    .line 68
    new-instance p1, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 69
    .line 70
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    const/4 v1, 0x6

    .line 75
    invoke-direct {p1, v0, v1}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 76
    .line 77
    .line 78
    new-instance v0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag$a;

    .line 79
    .line 80
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag$a;-><init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/GridLayoutManager;->v(Landroidx/recyclerview/widget/GridLayoutManager$c;)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->C:Lv/VRecyclerView;

    .line 87
    .line 88
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 89
    .line 90
    .line 91
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->C:Lv/VRecyclerView;

    .line 92
    .line 93
    const/4 v0, 0x0

    .line 94
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setItemAnimator(Landroidx/recyclerview/widget/RecyclerView$l;)V

    .line 95
    .line 96
    .line 97
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->N:Ll/r0u;

    .line 98
    .line 99
    const/4 v0, 0x0

    .line 100
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->X(Z)V

    .line 101
    .line 102
    .line 103
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->N:Ll/r0u;

    .line 104
    .line 105
    new-instance v0, Ll/n3o;

    .line 106
    .line 107
    invoke-direct {v0, p0}, Ll/n3o;-><init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;)V

    .line 108
    .line 109
    .line 110
    sget-object v1, Lcom/p1/mobile/putong/live/external/page/teenmode/LiveTeenDialogAct;->g:Lrx/subjects/b;

    .line 111
    .line 112
    invoke-virtual {p1, p0, v0, v1}, Ll/v6u;->o0(Lcom/p1/mobile/android/app/Frag;Ll/pcj;Lrx/subjects/b;)V

    .line 113
    .line 114
    .line 115
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->N:Ll/r0u;

    .line 116
    .line 117
    const/4 v0, 0x1

    .line 118
    invoke-virtual {p1, p0, v0}, Ll/r0u;->E0(Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;Z)V

    .line 119
    .line 120
    .line 121
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->N:Ll/r0u;

    .line 122
    .line 123
    new-instance v0, Ll/o3o;

    .line 124
    .line 125
    invoke-direct {v0, p0}, Ll/o3o;-><init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->c0(Ll/y20;)V

    .line 129
    .line 130
    .line 131
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->C:Lv/VRecyclerView;

    .line 132
    .line 133
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->N:Ll/r0u;

    .line 134
    .line 135
    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 136
    .line 137
    .line 138
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/y3o;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->s5(Ll/y3o;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->r5(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public pageId()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->tabInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "live_square_tab_info"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 22
    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->tabInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 24
    .line 25
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->tabInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 26
    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->pageId:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->tabInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->pageId:Ljava/lang/String;

    .line 40
    .line 41
    return-object p0

    .line 42
    :cond_1
    const-string p0, "p_live_recommend"

    .line 43
    .line 44
    return-object p0
.end method

.method public r5(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/q3o;->b(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public s5(Ll/y3o;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->O:Ll/y3o;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->tabInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 8
    .line 9
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->tabInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->tabInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Ll/a1u;->S2(Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1}, Ll/y3o;->I2()V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->L:Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;

    .line 23
    .line 24
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->disableReplaceStopped:Z

    .line 25
    .line 26
    if-nez p0, :cond_1

    .line 27
    .line 28
    invoke-virtual {p1}, Ll/y3o;->k3()V

    .line 29
    .line 30
    .line 31
    :cond_1
    return-void
.end method

.method public u5()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->M:Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Ll/tbs;->b:Ll/vwt;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->M:Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 12
    .line 13
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->M:Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 14
    .line 15
    return-object p0
.end method

.method public v5(Ll/p5u;Z)Ll/h2u;
    .locals 1

    .line 1
    new-instance p0, Ll/h2u;

    .line 2
    .line 3
    const/4 v0, 0x6

    .line 4
    invoke-virtual {p1}, Ll/ubu;->t()Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    invoke-direct {p0, v0, p1, p2}, Ll/h2u;-><init>(IZZ)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public w2(Ll/mvc0;)V
    .locals 0
    .param p1    # Ll/mvc0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 p1, 0x1

    .line 2
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/IntlLiveSquareCommonFeedFrag;->B5(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method
