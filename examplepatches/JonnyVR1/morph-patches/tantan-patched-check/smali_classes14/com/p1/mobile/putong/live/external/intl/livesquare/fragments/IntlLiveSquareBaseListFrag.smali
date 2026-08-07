.class public abstract Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;
.super Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;
.source "SourceFile"

# interfaces
.implements Ll/jn50;


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
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;->K:Z

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic k5(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;->p5(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic l5(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;->s5()V

    return-void
.end method

.method public static synthetic m5(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;Lcom/google/android/material/appbar/AppBarLayout;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;->q5(Lcom/google/android/material/appbar/AppBarLayout;I)V

    return-void
.end method

.method public static synthetic n5(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;->r5(Landroid/view/View;)V

    return-void
.end method

.method private synthetic p5(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;->z:Lv/VPullDownRefreshLayout;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;->w2(Ll/mvc0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic q5(Lcom/google/android/material/appbar/AppBarLayout;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;->z:Lv/VPullDownRefreshLayout;

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

.method private synthetic r5(Landroid/view/View;)V
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

.method private synthetic s5()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;->A:Lcom/google/android/material/appbar/AppBarLayout;

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


# virtual methods
.method public Y4()V
    .locals 0

    .line 1
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;->J:Lv/VText;

    .line 5
    .line 6
    new-instance v0, Ll/f2o;

    .line 7
    .line 8
    invoke-direct {v0, p0}, Ll/f2o;-><init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;->z:Lv/VPullDownRefreshLayout;

    .line 15
    .line 16
    invoke-virtual {p1, p0}, Lv/VPullDownRefreshLayout;->O(Ll/jn50;)Ll/mvc0;

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;->A:Lcom/google/android/material/appbar/AppBarLayout;

    .line 20
    .line 21
    new-instance v0, Ll/g2o;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Ll/g2o;-><init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;)V

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
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;->B:Lv/VText;

    .line 42
    .line 43
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 44
    .line 45
    .line 46
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;->B:Lv/VText;

    .line 47
    .line 48
    new-instance v0, Ll/h2o;

    .line 49
    .line 50
    invoke-direct {v0, p0}, Ll/h2o;-><init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;)V

    .line 51
    .line 52
    .line 53
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;->o5(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public o5(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/j2o;->b(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public t5(ZZ)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;->C:Lv/VRecyclerView;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;->D:Landroidx/core/widget/NestedScrollView;

    .line 7
    .line 8
    xor-int/lit8 p2, p2, 0x1

    .line 9
    .line 10
    invoke-static {p1, p2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Ll/ppi0;->l()Ll/ppi0;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p1}, Ll/ppi0;->x()Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;->F:Lv/VText;

    .line 24
    .line 25
    sget-object p2, Ll/tbs;->a:Landroid/app/Application;

    .line 26
    .line 27
    sget v0, Lcom/p1/mobile/putong/live/external/R$string;->w:I

    .line 28
    .line 29
    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;->E:Lv/VImage;

    .line 37
    .line 38
    sget p2, Ll/nbc0;->N0:I

    .line 39
    .line 40
    invoke-virtual {p1, p2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 41
    .line 42
    .line 43
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;->G:Landroidx/core/widget/NestedScrollView;

    .line 44
    .line 45
    const/4 p1, 0x4

    .line 46
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public u5()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;->G:Landroidx/core/widget/NestedScrollView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;->C:Lv/VRecyclerView;

    .line 8
    .line 9
    const/4 v1, 0x4

    .line 10
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;->D:Landroidx/core/widget/NestedScrollView;

    .line 14
    .line 15
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public v5()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;->z:Lv/VPullDownRefreshLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Lv/smart_refresh/SmartRefreshLayout;->t()Ll/mvc0;

    .line 4
    .line 5
    .line 6
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;->K:Z

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
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;->K:Z

    .line 24
    .line 25
    new-instance v0, Ll/i2o;

    .line 26
    .line 27
    invoke-direct {v0, p0}, Ll/i2o;-><init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;)V

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

.method public abstract w2(Ll/mvc0;)V
    .param p1    # Ll/mvc0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
.end method
