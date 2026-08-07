.class public abstract Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;
.super Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/suggestedTab/a$a;
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<P:",
        "Ll/k4o;",
        ">",
        "Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;",
        "Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/suggestedTab/a$a;",
        "Ll/iam<",
        "TP;>;"
    }
.end annotation


# instance fields
.field public L:Ll/m4o;

.field public M:Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

.field public final N:Ll/j0u;

.field public O:Ll/k4o;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TP;"
        }
    .end annotation
.end field

.field public P:Z

.field public Q:Z

.field public R:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/m4o;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/m4o;-><init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;->L:Ll/m4o;

    .line 10
    .line 11
    invoke-static {}, Ll/j0u;->H0()Ll/j0u;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;->N:Ll/j0u;

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;->Q:Z

    .line 19
    .line 20
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;->R:Z

    .line 21
    .line 22
    return-void
.end method

.method public static synthetic A5(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;->G5(Ljava/lang/Object;)V

    return-void
.end method

.method private C5()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;->O:Ll/k4o;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;->O:Ll/k4o;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/k4o;->n()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method private synthetic F5(Ljava/lang/Integer;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;->N:Ll/j0u;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;->O:Ll/k4o;

    .line 19
    .line 20
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;->R:Z

    .line 21
    .line 22
    invoke-virtual {p1, p0}, Ll/k4o;->h3(Z)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method private H5(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;->O:Ll/k4o;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/k4o;->g3()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->g5(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic w5(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic x5(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;->C5()V

    return-void
.end method

.method public static synthetic y5(Ljava/lang/Boolean;)Ljava/lang/Boolean;
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

.method public static synthetic z5(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;->F5(Ljava/lang/Integer;)V

    return-void
.end method


# virtual methods
.method public B5(Ll/k4o;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TP;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;->O:Ll/k4o;

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
    invoke-virtual {p1, v0}, Ll/k2o;->T2(Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1}, Ll/k4o;->I2()V

    .line 20
    .line 21
    .line 22
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;->Q:Z

    .line 23
    .line 24
    if-nez p0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p1}, Ll/k4o;->i3()V

    .line 27
    .line 28
    .line 29
    :cond_1
    return-void
.end method

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

.method public D5()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;->M:Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;->M:Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 12
    .line 13
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;->M:Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 14
    .line 15
    return-object p0
.end method

.method public E5(Ll/z8o;Z)Ll/j5o;
    .locals 1

    .line 1
    new-instance v0, Ll/j5o;

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->layoutColumnNum:I

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/ubu;->t()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-direct {v0, p0, p1, p2}, Ll/j5o;-><init>(IZZ)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method public final synthetic G5(Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p1, Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {p0, p1}, Ll/mbs;->T(Lcom/p1/mobile/android/app/Act;Landroid/net/Uri;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public I5()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;->N:Ll/j0u;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;->C:Lv/VRecyclerView;

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

.method public J5()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;->v5()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;->N:Ll/j0u;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/v6u;->k0()V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;->N:Ll/j0u;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/j0u;->I0()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public K5()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;->N:Ll/j0u;

    .line 2
    .line 3
    invoke-static {p0}, Ll/p1o;->d(Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public L5()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;->z:Lv/VPullDownRefreshLayout;

    .line 2
    .line 3
    invoke-virtual {p0}, Lv/smart_refresh/SmartRefreshLayout;->n()Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public M5(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;->u5()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final N5()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;->N:Ll/j0u;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->getItemCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-gtz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;->N:Ll/j0u;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->getItemCount()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-virtual {p0, v0, v1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemRangeChanged(II)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public S4(ZIJ)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->S4(ZIJ)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_4

    .line 5
    .line 6
    const/16 p1, 0x8

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    if-ne p2, p1, :cond_0

    .line 10
    .line 11
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;->P:Z

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;->P:Z

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->g5(Z)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->loaded:Z

    .line 21
    .line 22
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;->O:Ll/k4o;

    .line 23
    .line 24
    if-nez p1, :cond_1

    .line 25
    .line 26
    invoke-virtual {p2}, Ll/k4o;->g3()V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    invoke-virtual {p2}, Ll/k2o;->P2()I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    int-to-long p1, p1

    .line 35
    const-wide/16 v1, 0x3e8

    .line 36
    .line 37
    mul-long/2addr p1, v1

    .line 38
    cmp-long p1, p3, p1

    .line 39
    .line 40
    if-lez p1, :cond_2

    .line 41
    .line 42
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;->H5(Z)V

    .line 43
    .line 44
    .line 45
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;->N:Ll/j0u;

    .line 46
    .line 47
    invoke-virtual {p1}, Ll/j0u;->I0()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;->N5()V

    .line 51
    .line 52
    .line 53
    :goto_0
    invoke-static {}, Ll/mqr;->h()Z

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    if-eqz p0, :cond_3

    .line 58
    .line 59
    invoke-static {}, Ll/mjj;->l()V

    .line 60
    .line 61
    .line 62
    :cond_3
    invoke-static {}, Ll/ppi0;->l()Ll/ppi0;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p0}, Ll/ppi0;->f()Z

    .line 67
    .line 68
    .line 69
    :cond_4
    return-void
.end method

.method public Y4()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;->O:Ll/k4o;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;->H5(Z)V

    .line 7
    .line 8
    .line 9
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
    new-instance v0, Ll/b4o;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/b4o;-><init>()V

    .line 7
    .line 8
    .line 9
    new-instance v1, Ll/c4o;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/c4o;-><init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/app/Frag;->creates(Ll/y20;Ll/x20;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public f5()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->f5()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;->N:Ll/j0u;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;->z:Lv/VPullDownRefreshLayout;

    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 11
    .line 12
    sget v0, Ll/qa00;->c:I

    .line 13
    .line 14
    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 15
    .line 16
    iget p1, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->layoutColumnNum:I

    .line 17
    .line 18
    const/4 v0, 0x2

    .line 19
    const/4 v1, 0x1

    .line 20
    if-ge p1, v1, :cond_0

    .line 21
    .line 22
    iput v0, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->layoutColumnNum:I

    .line 23
    .line 24
    :cond_0
    new-instance p1, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;

    .line 25
    .line 26
    invoke-direct {p1, v0, v1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;-><init>(II)V

    .line 27
    .line 28
    .line 29
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;->C:Lv/VRecyclerView;

    .line 30
    .line 31
    invoke-virtual {v2, p1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->U(I)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;->C:Lv/VRecyclerView;

    .line 38
    .line 39
    const/4 v0, 0x0

    .line 40
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setItemAnimator(Landroidx/recyclerview/widget/RecyclerView$l;)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;->N:Ll/j0u;

    .line 44
    .line 45
    const/4 v0, 0x0

    .line 46
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->X(Z)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;->N:Ll/j0u;

    .line 50
    .line 51
    sget-object v0, Lcom/p1/mobile/putong/live/external/page/teenmode/LiveTeenDialogAct;->g:Lrx/subjects/b;

    .line 52
    .line 53
    invoke-virtual {p1, p0, v0}, Ll/v6u;->n0(Lcom/p1/mobile/android/app/Frag;Lrx/subjects/b;)V

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;->N:Ll/j0u;

    .line 57
    .line 58
    invoke-virtual {p1, p0, v1}, Ll/j0u;->C0(Lcom/p1/mobile/android/app/Frag;Z)V

    .line 59
    .line 60
    .line 61
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;->N:Ll/j0u;

    .line 62
    .line 63
    new-instance v0, Ll/d4o;

    .line 64
    .line 65
    invoke-direct {v0, p0}, Ll/d4o;-><init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->c0(Ll/y20;)V

    .line 69
    .line 70
    .line 71
    invoke-static {}, Ll/mqr;->l()Z

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    if-eqz p1, :cond_1

    .line 76
    .line 77
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;->N:Ll/j0u;

    .line 78
    .line 79
    invoke-static {}, Ll/t4u;->i()Lrx/c;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {v0}, Lrx/c;->asObservable()Lrx/c;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    new-instance v1, Ll/e4o;

    .line 88
    .line 89
    invoke-direct {v1}, Ll/e4o;-><init>()V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    const-string v1, "LiveSquareHomeFrag"

    .line 97
    .line 98
    invoke-virtual {p1, v0, p0, v1}, Ll/j0u;->A0(Lrx/c;Lcom/p1/mobile/android/app/Frag;Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/IntlLiveSquareBaseListFrag;->C:Lv/VRecyclerView;

    .line 102
    .line 103
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;->N:Ll/j0u;

    .line 104
    .line 105
    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/k4o;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;->B5(Ll/k4o;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public t3(Lcom/p1/mobile/putong/live/external/square/api/LiveBannerTabBean;)V
    .locals 2

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/external/square/api/LiveBannerTabBean;->jumpUrl:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string v0, "tantanapp://liveBannerCustom"

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;->O:Ll/k4o;

    .line 18
    .line 19
    new-instance v1, Ll/f4o;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/f4o;-><init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, p1, v1}, Ll/k4o;->Z2(Ljava/lang/String;Ll/y20;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-static {p0, p1}, Ll/mbs;->T(Lcom/p1/mobile/android/app/Act;Landroid/net/Uri;)V

    .line 37
    .line 38
    .line 39
    return-void
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
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/feedbase/IntlLiveSquareFeedBaseFrag;->H5(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method
