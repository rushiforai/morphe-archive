.class public final Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;
.super Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;",
        "Ll/iam<",
        "Ll/h7o;",
        ">;"
    }
.end annotation


# instance fields
.field public final L:Ljava/lang/String;

.field public M:Ll/h7o;

.field public N:Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlNearbyLiveListPlug;

.field public O:Ll/j0u;

.field public P:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    const-class v0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;->L:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {}, Ll/j0u;->H0()Ll/j0u;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;->O:Ll/j0u;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic A5(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic B5(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static bridge synthetic C5(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;)Ll/j0u;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;->O:Ll/j0u;

    return-object p0
.end method

.method private E5()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;->M:Ll/h7o;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;->M:Ll/h7o;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/h7o;->n()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method private synthetic G5(Ljava/lang/Integer;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;->O:Ll/j0u;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->getItemCount()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget v1, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->layoutColumnNum:I

    .line 12
    .line 13
    mul-int/lit8 v1, v1, 0x5

    .line 14
    .line 15
    sub-int/2addr v0, v1

    .line 16
    if-lt p1, v0, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;->N:Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlNearbyLiveListPlug;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlNearbyLiveListPlug;->loadMore()V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method private L5()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;->N:Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlNearbyLiveListPlug;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;->z:Lv/VPullDownRefreshLayout;

    .line 6
    .line 7
    invoke-virtual {v0}, Lv/smart_refresh/SmartRefreshLayout;->n()Z

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;->N:Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlNearbyLiveListPlug;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlNearbyLiveListPlug;->getData()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method private N5()V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;->O:Ll/j0u;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->getItemCount()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-virtual {p0, v0, v1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemRangeChanged(II)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic w5(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;Ll/h7o;Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;->F5(Ll/h7o;Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic x5(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;->G5(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic y5(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;->E5()V

    return-void
.end method

.method public static synthetic z5(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;Ll/q7o;Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;->H5(Ll/q7o;Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public D5(Ll/h7o;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;->M:Ll/h7o;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/h7o;->I2()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Ll/h7o;->i3()V

    .line 7
    .line 8
    .line 9
    new-instance v0, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlNearbyLiveListPlug;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlNearbyLiveListPlug;-><init>(Ll/ner;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;->N:Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlNearbyLiveListPlug;

    .line 15
    .line 16
    new-instance v1, Ll/i7o;

    .line 17
    .line 18
    invoke-direct {v1, p0, p1}, Ll/i7o;-><init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;Ll/h7o;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlBaseAsyncPlug;->observe(Lkotlin/jvm/functions/Function1;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final synthetic F5(Ll/h7o;Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;)Lkotlin/Unit;
    .locals 1

    .line 1
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;->isError()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;->v5()V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;->N:Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlNearbyLiveListPlug;

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlNearbyLiveListPlug;->getLiveInfo()Ll/z8o;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;->N:Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlNearbyLiveListPlug;

    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlNearbyLiveListPlug;->getLiveInfo()Ll/z8o;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iget-object p1, p1, Ll/ubu;->a:Ljava/util/List;

    .line 25
    .line 26
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;->K5()V

    .line 34
    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_1
    :goto_0
    sget-object p1, Ll/tbs;->a:Landroid/app/Application;

    .line 38
    .line 39
    sget v0, Lcom/p1/mobile/putong/live/external/R$string;->P:I

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-static {p1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;->getThrowable()Ljava/lang/Throwable;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;->J5(Ljava/lang/Throwable;)V

    .line 53
    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_2
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;->isSuccess()Z

    .line 57
    .line 58
    .line 59
    move-result p2

    .line 60
    if-eqz p2, :cond_3

    .line 61
    .line 62
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;->N:Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlNearbyLiveListPlug;

    .line 63
    .line 64
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlNearbyLiveListPlug;->getLiveInfo()Ll/z8o;

    .line 65
    .line 66
    .line 67
    move-result-object p2

    .line 68
    invoke-virtual {p1, p2}, Ll/h7o;->h3(Ll/z8o;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;->I5()V

    .line 72
    .line 73
    .line 74
    :cond_3
    :goto_1
    const/4 p0, 0x0

    .line 75
    return-object p0
.end method

.method public final synthetic H5(Ll/q7o;Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;Landroid/view/View;)V
    .locals 1

    .line 1
    const/4 p3, 0x1

    .line 2
    iput-boolean p3, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;->P:Z

    .line 3
    .line 4
    invoke-virtual {p1}, Ll/z0u;->Q()V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;->M:Ll/h7o;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->tabInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->name:Ljava/lang/String;

    .line 12
    .line 13
    iget-object p3, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->recommendInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;

    .line 14
    .line 15
    iget-object p3, p3, Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;->category:Ljava/lang/String;

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    invoke-virtual {p1, p2, p0, p3, v0}, Ll/k2o;->R2(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public I5()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;->v5()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;->O:Ll/j0u;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/v6u;->k0()V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;->O:Ll/j0u;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/j0u;->I0()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public J5(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;->u5()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public K5()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;->O:Ll/j0u;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-static {p0}, Ll/p1o;->d(Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public M5(Ll/z8o;)V
    .locals 8

    .line 1
    sget-object v0, Ll/tbs;->b:Ll/vwt;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 4
    .line 5
    .line 6
    move-result-object v3

    .line 7
    if-nez v3, :cond_0

    .line 8
    .line 9
    new-instance p1, Ljava/lang/NullPointerException;

    .line 10
    .line 11
    const-string v0, "LiveSetting is Null!"

    .line 12
    .line 13
    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;->J5(Ljava/lang/Throwable;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    const/4 v0, 0x1

    .line 21
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->loaded:Z

    .line 22
    .line 23
    new-instance v7, Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 26
    .line 27
    .line 28
    const/4 v1, 0x0

    .line 29
    :goto_0
    iget-object v2, p1, Ll/ubu;->a:Ljava/util/List;

    .line 30
    .line 31
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-ge v1, v2, :cond_2

    .line 36
    .line 37
    iget-object v2, p1, Ll/ubu;->a:Ljava/util/List;

    .line 38
    .line 39
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 44
    .line 45
    iget-object v4, v2, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->specialLabel:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;

    .line 46
    .line 47
    if-eqz v4, :cond_1

    .line 48
    .line 49
    :goto_1
    move-object v5, v4

    .line 50
    move v4, v1

    .line 51
    goto :goto_2

    .line 52
    :cond_1
    const/4 v4, 0x0

    .line 53
    goto :goto_1

    .line 54
    :goto_2
    new-instance v1, Ll/q7o;

    .line 55
    .line 56
    move v6, v4

    .line 57
    iget v4, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->layoutColumnNum:I

    .line 58
    .line 59
    add-int/lit8 v6, v6, 0x1

    .line 60
    .line 61
    invoke-direct/range {v1 .. v6}, Ll/q7o;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;Lcom/p1/mobile/putong/live/base/data/BLiveSettings;ILcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;I)V

    .line 62
    .line 63
    .line 64
    const-string v4, "p_live_nearby"

    .line 65
    .line 66
    invoke-virtual {v1, v4}, Ll/d3q;->B(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    invoke-interface {v7, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    new-instance v4, Ll/n7o;

    .line 73
    .line 74
    invoke-direct {v4, p0, v1, v2}, Ll/n7o;-><init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;Ll/q7o;Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v1, v4}, Ll/d3q;->A(Landroid/view/View$OnClickListener;)V

    .line 78
    .line 79
    .line 80
    move v1, v6

    .line 81
    goto :goto_0

    .line 82
    :cond_2
    new-instance v1, Ll/j5o;

    .line 83
    .line 84
    iget v2, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->layoutColumnNum:I

    .line 85
    .line 86
    invoke-virtual {p1}, Ll/ubu;->t()Z

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    invoke-direct {v1, v2, p1}, Ll/j5o;-><init>(IZ)V

    .line 91
    .line 92
    .line 93
    invoke-interface {v7, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    invoke-static {v7}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    xor-int/2addr p1, v0

    .line 101
    invoke-virtual {p0, p1, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;->t5(ZZ)V

    .line 102
    .line 103
    .line 104
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;->O:Ll/j0u;

    .line 105
    .line 106
    invoke-virtual {p0, v7}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 107
    .line 108
    .line 109
    return-void
.end method

.method public S4(ZIJ)V
    .locals 4

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->S4(ZIJ)V

    .line 2
    .line 3
    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    goto :goto_1

    .line 7
    :cond_0
    invoke-static {}, Ll/mqr;->h()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    invoke-static {}, Ll/mjj;->k()V

    .line 14
    .line 15
    .line 16
    :cond_1
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;->P:Z

    .line 17
    .line 18
    const/4 p2, 0x0

    .line 19
    if-eqz p1, :cond_2

    .line 20
    .line 21
    iput-boolean p2, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;->P:Z

    .line 22
    .line 23
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->g5(Z)V

    .line 24
    .line 25
    .line 26
    :cond_2
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->loaded:Z

    .line 27
    .line 28
    if-nez p1, :cond_3

    .line 29
    .line 30
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;->L5()V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;->M:Ll/h7o;

    .line 35
    .line 36
    invoke-virtual {p1}, Ll/k2o;->P2()I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    int-to-long v0, p1

    .line 41
    const-wide/16 v2, 0x3e8

    .line 42
    .line 43
    mul-long/2addr v0, v2

    .line 44
    cmp-long p1, p3, v0

    .line 45
    .line 46
    if-lez p1, :cond_4

    .line 47
    .line 48
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;->L5()V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->g5(Z)V

    .line 52
    .line 53
    .line 54
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;->O:Ll/j0u;

    .line 55
    .line 56
    invoke-virtual {p1}, Ll/j0u;->I0()V

    .line 57
    .line 58
    .line 59
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;->N5()V

    .line 60
    .line 61
    .line 62
    :goto_0
    invoke-static {}, Ll/mqr;->h()Z

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    if-eqz p0, :cond_5

    .line 67
    .line 68
    invoke-static {}, Ll/mjj;->k()V

    .line 69
    .line 70
    .line 71
    :cond_5
    :goto_1
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
    new-instance p1, Ll/h7o;

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
    invoke-direct {p1, p0, p2}, Ll/h7o;-><init>(Ll/ner;Ll/nus;)V

    .line 16
    .line 17
    .line 18
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->tabInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 19
    .line 20
    invoke-virtual {p1, p2}, Ll/k2o;->T2(Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1, p0}, Ll/l6t;->C(Ll/iam;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public Y4()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;->M:Ll/h7o;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;->L5()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->g5(Z)V

    .line 10
    .line 11
    .line 12
    :cond_0
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
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 5
    .line 6
    .line 7
    new-instance v0, Ll/l7o;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/l7o;-><init>()V

    .line 10
    .line 11
    .line 12
    new-instance v1, Ll/m7o;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Ll/m7o;-><init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/app/Frag;->creates(Ll/y20;Ll/x20;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public f5()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->f5()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;->O:Ll/j0u;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/j0u;->K0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget p1, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->layoutColumnNum:I

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    if-ge p1, v0, :cond_0

    .line 8
    .line 9
    const/4 p1, 0x3

    .line 10
    iput p1, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->layoutColumnNum:I

    .line 11
    .line 12
    :cond_0
    new-instance p1, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iget v2, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->layoutColumnNum:I

    .line 19
    .line 20
    invoke-direct {p1, v1, v2}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 21
    .line 22
    .line 23
    new-instance v1, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag$a;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag$a;-><init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1, v1}, Landroidx/recyclerview/widget/GridLayoutManager;->v(Landroidx/recyclerview/widget/GridLayoutManager$c;)V

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;->C:Lv/VRecyclerView;

    .line 32
    .line 33
    invoke-virtual {v1, p1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;->O:Ll/j0u;

    .line 37
    .line 38
    const/4 v1, 0x0

    .line 39
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->X(Z)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;->O:Ll/j0u;

    .line 43
    .line 44
    sget-object v1, Lcom/p1/mobile/putong/live/external/page/teenmode/LiveTeenDialogAct;->g:Lrx/subjects/b;

    .line 45
    .line 46
    invoke-virtual {p1, p0, v1}, Ll/v6u;->n0(Lcom/p1/mobile/android/app/Frag;Lrx/subjects/b;)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;->O:Ll/j0u;

    .line 50
    .line 51
    invoke-virtual {p1, p0, v0}, Ll/j0u;->C0(Lcom/p1/mobile/android/app/Frag;Z)V

    .line 52
    .line 53
    .line 54
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;->O:Ll/j0u;

    .line 55
    .line 56
    new-instance v0, Ll/j7o;

    .line 57
    .line 58
    invoke-direct {v0, p0}, Ll/j7o;-><init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->c0(Ll/y20;)V

    .line 62
    .line 63
    .line 64
    invoke-static {}, Ll/mqr;->l()Z

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    if-eqz p1, :cond_1

    .line 69
    .line 70
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;->O:Ll/j0u;

    .line 71
    .line 72
    invoke-static {}, Ll/t4u;->i()Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {v0}, Lrx/c;->asObservable()Lrx/c;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    new-instance v1, Ll/k7o;

    .line 81
    .line 82
    invoke-direct {v1}, Ll/k7o;-><init>()V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    const-string v1, "LiveSquareHomeFrag"

    .line 90
    .line 91
    invoke-virtual {p1, v0, p0, v1}, Ll/j0u;->A0(Lrx/c;Lcom/p1/mobile/android/app/Frag;Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;->C:Lv/VRecyclerView;

    .line 95
    .line 96
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;->O:Ll/j0u;

    .line 97
    .line 98
    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/h7o;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;->D5(Ll/h7o;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_live_nearby"

    .line 2
    .line 3
    return-object p0
.end method

.method public w2(Ll/mvc0;)V
    .locals 0
    .param p1    # Ll/mvc0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/nearbyTab/IntlLiveSquareNearbyFrag;->L5()V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->g5(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
