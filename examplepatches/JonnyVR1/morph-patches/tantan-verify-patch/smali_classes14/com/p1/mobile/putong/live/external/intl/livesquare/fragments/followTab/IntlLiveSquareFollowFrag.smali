.class public final Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;
.super Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;
.source "SourceFile"

# interfaces
.implements Ll/iam;
.implements Ll/jn50;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;",
        "Ll/iam<",
        "Ll/i5o;",
        ">;",
        "Ll/jn50;"
    }
.end annotation


# instance fields
.field public A:Lv/VRecyclerView;

.field public B:Lv/VRelative;

.field public C:Lv/VImage;

.field public D:Lv/VRelative;

.field public E:Lv/VImage;

.field public final F:Ljava/lang/String;

.field public G:Ll/i5o;

.field public H:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

.field public I:Ll/jxd0;

.field public J:Ll/twn;

.field public K:Ll/kcg0;

.field public z:Lv/VPullDownRefreshLayout;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    const-class v0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->F:Ljava/lang/String;

    .line 11
    .line 12
    new-instance v0, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 13
    .line 14
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->H:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 18
    .line 19
    new-instance v0, Ll/jxd0;

    .line 20
    .line 21
    new-instance v1, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    const-string v2, "intl_has_live_follow_activities_recommend_shown"

    .line 24
    .line 25
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-static {}, Ll/mbs;->o0()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 40
    .line 41
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->I:Ll/jxd0;

    .line 45
    .line 46
    return-void
.end method

.method private B5()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->A:Lv/VRecyclerView;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->H:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag$a;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag$a;-><init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->A:Lv/VRecyclerView;

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setItemAnimator(Landroidx/recyclerview/widget/RecyclerView$l;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->A:Lv/VRecyclerView;

    .line 19
    .line 20
    new-instance v1, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag$b;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag$b;-><init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method private H5(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->O5(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method private K5()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->G:Ll/i5o;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/i5o;->g3()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->z:Lv/VPullDownRefreshLayout;

    .line 7
    .line 8
    invoke-virtual {p0}, Lv/smart_refresh/SmartRefreshLayout;->n()Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private M5(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget v0, Ll/xec0;->v:I

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {p0, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlFollowVText;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlFollowVText;->w(Landroid/view/View;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private O5(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object p3, Ll/tbs;->f:Ll/j6t;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->getBuilder()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->D(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const-string v1, "live-activity"

    .line 16
    .line 17
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->O(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->y(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->u()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p3, v0, p1}, Ll/j6t;->f(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)Landroid/content/Intent;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->startActivity(Landroid/content/Intent;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public static synthetic k5(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->y5()V

    return-void
.end method

.method public static synthetic l5(Ljava/lang/Throwable;)Lcom/p1/mobile/putong/live/base/data/BLiveCounter;
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveCounter;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveCounter;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic m5(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Lcom/p1/mobile/putong/live/base/data/BLiveActivity;ILl/str;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->C5(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Lcom/p1/mobile/putong/live/base/data/BLiveActivity;ILl/str;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic n5(Lcom/p1/mobile/putong/live/base/data/BLiveCounter;)Lrx/c;
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/external/intl/module/api/IntlLiveSquareApi;->getLiveActivitySummaryInSquare()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic o5(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;ILl/str;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/ovn;->b(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;ILl/str;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic p5(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->D5(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method

.method public static synthetic q5(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->E5(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic r5(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static bridge synthetic s5(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;)Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->H:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    return-object p0
.end method

.method public static bridge synthetic t5(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;)Ll/i5o;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->G:Ll/i5o;

    return-object p0
.end method

.method public static bridge synthetic u5(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->M5(Landroid/view/View;)V

    return-void
.end method

.method private y5()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->G:Ll/i5o;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->G:Ll/i5o;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/l6t;->n()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method


# virtual methods
.method public final A5()Lrx/subjects/a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/a<",
            "Ll/qrr;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Ll/itd0;->c:Ll/itd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/gm3;

    .line 8
    .line 9
    iget-object p0, p0, Ll/gm3;->b:Lrx/subjects/a;

    .line 10
    .line 11
    return-object p0
.end method

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

.method public final synthetic C5(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Lcom/p1/mobile/putong/live/base/data/BLiveActivity;ILl/str;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->getRecommendCategory()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p5

    .line 5
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveActivity;->valueType:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {p0, p1, p5, p2}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->H5(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p1, p3, p4}, Ll/ovn;->a(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;ILl/str;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic D5(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 2

    .line 1
    sget-object v0, Ll/itd0;->b:Ll/itd0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/fk3;

    .line 8
    .line 9
    const-string v1, "live_activities_entry"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ll/fk3;->I(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->A5()Lrx/subjects/a;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    new-instance v0, Ll/qrr;

    .line 19
    .line 20
    invoke-direct {v0, p1}, Ll/qrr;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ll/qrr;->a()Ll/qrr;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final synthetic E5(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->A5()Lrx/subjects/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ll/qrr;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Ll/qrr;-><init>(Ljava/lang/Throwable;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0}, Ll/qrr;->a()Ll/qrr;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public F5(Ll/mvn;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->H:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->x5(Ll/mvn;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 p1, 0x0

    .line 8
    invoke-virtual {v0, p0, p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->a0(Ljava/util/List;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public G5(Ll/mvn;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->z5()Ll/twn;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Ll/twn;->I(Ll/mvn;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->H:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->z5()Ll/twn;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->O(Ll/d3q;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public I5()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->z:Lv/VPullDownRefreshLayout;

    .line 2
    .line 3
    invoke-virtual {p0}, Lv/smart_refresh/SmartRefreshLayout;->n()Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public J5(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->B:Lv/VRelative;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->A:Lv/VRecyclerView;

    .line 8
    .line 9
    const/4 v0, 0x4

    .line 10
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->D:Lv/VRelative;

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->z:Lv/VPullDownRefreshLayout;

    .line 19
    .line 20
    invoke-virtual {p0}, Lv/smart_refresh/SmartRefreshLayout;->t()Ll/mvc0;

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public L5()V
    .locals 3

    .line 1
    sget-object v0, Ll/itd0;->e:Ll/itd0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/fm3;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/fm3;->e()V

    .line 10
    .line 11
    .line 12
    sget-object v0, Ll/itd0;->c:Ll/itd0;

    .line 13
    .line 14
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Ll/gm3;

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/gm3;->j()V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->K:Ll/kcg0;

    .line 24
    .line 25
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 26
    .line 27
    .line 28
    const-string v0, "clearActivitySquareDetailUnread"

    .line 29
    .line 30
    invoke-static {v0}, Lcom/p1/mobile/putong/live/external/intl/module/api/IntlLiveCounterApi;->patchReddot(Ljava/lang/String;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v1, Ll/r4o;

    .line 35
    .line 36
    invoke-direct {v1}, Ll/r4o;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v1}, Lrx/c;->onErrorReturn(Ll/qcj;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    new-instance v1, Ll/s4o;

    .line 44
    .line 45
    invoke-direct {v1}, Ll/s4o;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    new-instance v1, Ll/t4o;

    .line 53
    .line 54
    invoke-direct {v1, p0}, Ll/t4o;-><init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;)V

    .line 55
    .line 56
    .line 57
    new-instance v2, Ll/u4o;

    .line 58
    .line 59
    invoke-direct {v2, p0}, Ll/u4o;-><init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;)V

    .line 60
    .line 61
    .line 62
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->K:Ll/kcg0;

    .line 71
    .line 72
    return-void
.end method

.method public N5(Ll/mvn;)V
    .locals 4
    .param p1    # Ll/mvn;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->z:Lv/VPullDownRefreshLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Lv/smart_refresh/SmartRefreshLayout;->t()Ll/mvc0;

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->B:Lv/VRelative;

    .line 7
    .line 8
    const/4 v1, 0x4

    .line 9
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Ll/mvn;->i()Ljava/util/List;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    const/4 v1, 0x0

    .line 21
    const/4 v2, 0x1

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    invoke-virtual {p1}, Ll/mvn;->h()Ljava/util/List;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    move v0, v2

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    move v0, v1

    .line 37
    :goto_0
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->D:Lv/VRelative;

    .line 38
    .line 39
    invoke-static {v3, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 40
    .line 41
    .line 42
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->A:Lv/VRecyclerView;

    .line 43
    .line 44
    xor-int/2addr v0, v2

    .line 45
    invoke-static {v3, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->H:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 49
    .line 50
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->x5(Ll/mvn;)Ljava/util/List;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->a0(Ljava/util/List;Z)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public S4(ZIJ)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->S4(ZIJ)V

    .line 2
    .line 3
    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->loaded:Z

    .line 8
    .line 9
    if-nez p1, :cond_1

    .line 10
    .line 11
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->K5()V

    .line 12
    .line 13
    .line 14
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->L5()V

    .line 15
    .line 16
    .line 17
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
    new-instance p1, Ll/i5o;

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
    invoke-direct {p1, p0, p2}, Ll/i5o;-><init>(Ll/ner;Ll/nus;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1, p0}, Ll/l6t;->C(Ll/iam;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->G:Ll/i5o;

    .line 22
    .line 23
    invoke-virtual {p1}, Ll/i5o;->m3()V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->G:Ll/i5o;

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/i5o;->g3()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public Y4()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->G:Ll/i5o;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->K5()V

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
    new-instance v0, Ll/p4o;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/p4o;-><init>()V

    .line 7
    .line 8
    .line 9
    new-instance v1, Ll/q4o;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/q4o;-><init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;)V

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
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->z:Lv/VPullDownRefreshLayout;

    .line 5
    .line 6
    invoke-virtual {p1, p0}, Lv/VPullDownRefreshLayout;->O(Ll/jn50;)Ll/mvc0;

    .line 7
    .line 8
    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->B5()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/i5o;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->w5(Ll/i5o;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->v5(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_live_follow"

    .line 2
    .line 3
    return-object p0
.end method

.method public v5(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/x4o;->b(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public w2(Ll/mvc0;)V
    .locals 0
    .param p1    # Ll/mvc0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->G:Ll/i5o;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/i5o;->g3()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->g5(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public w5(Ll/i5o;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->G:Ll/i5o;

    .line 2
    .line 3
    return-void
.end method

.method public final x5(Ll/mvn;)Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/mvn;",
            ")",
            "Ljava/util/List<",
            "Ll/d3q<",
            "*>;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Ll/mvn;->j()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/4 v2, 0x0

    .line 11
    move v7, v2

    .line 12
    :goto_0
    invoke-virtual {p1}, Ll/mvn;->i()Ljava/util/List;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-ge v7, v2, :cond_2

    .line 21
    .line 22
    invoke-virtual {p1}, Ll/mvn;->i()Ljava/util/List;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-interface {v2, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    move-object v6, v2

    .line 31
    check-cast v6, Lcom/p1/mobile/putong/live/base/data/BLiveActivity;

    .line 32
    .line 33
    iget-object v2, v6, Lcom/p1/mobile/putong/live/base/data/BLiveActivity;->reference:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 34
    .line 35
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {p1, v2}, Ll/mvn;->t(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 38
    .line 39
    .line 40
    move-result-object v5

    .line 41
    if-nez v5, :cond_0

    .line 42
    .line 43
    move-object v4, p0

    .line 44
    goto :goto_1

    .line 45
    :cond_0
    if-ne v7, v1, :cond_1

    .line 46
    .line 47
    invoke-virtual {p1}, Ll/mvn;->h()Ljava/util/List;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-nez v2, :cond_1

    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->z5()Ll/twn;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    invoke-virtual {v2, p1}, Ll/twn;->I(Ll/mvn;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->z5()Ll/twn;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    :cond_1
    iget-object v2, v6, Lcom/p1/mobile/putong/live/base/data/BLiveActivity;->owner:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 72
    .line 73
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 74
    .line 75
    invoke-virtual {p1, v2}, Ll/mvn;->v(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    iget-object v3, v5, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 80
    .line 81
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 82
    .line 83
    invoke-virtual {p1, v3}, Ll/mvn;->u(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;

    .line 84
    .line 85
    .line 86
    move-result-object v3

    .line 87
    new-instance v8, Ll/str;

    .line 88
    .line 89
    invoke-direct {v8, v6, v2, v5, v3}, Ll/str;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveActivity;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;)V

    .line 90
    .line 91
    .line 92
    new-instance v2, Ll/v4o;

    .line 93
    .line 94
    invoke-direct {v2, v5, v7, v8}, Ll/v4o;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;ILl/str;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v8, v2}, Ll/d3q;->z(Ljava/lang/Runnable;)V

    .line 98
    .line 99
    .line 100
    new-instance v3, Ll/w4o;

    .line 101
    .line 102
    move-object v4, p0

    .line 103
    invoke-direct/range {v3 .. v8}, Ll/w4o;-><init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Lcom/p1/mobile/putong/live/base/data/BLiveActivity;ILl/str;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {v8, v3}, Ll/d3q;->A(Landroid/view/View$OnClickListener;)V

    .line 107
    .line 108
    .line 109
    invoke-interface {v0, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    :goto_1
    add-int/lit8 v7, v7, 0x1

    .line 113
    .line 114
    move-object p0, v4

    .line 115
    goto :goto_0

    .line 116
    :cond_2
    move-object v4, p0

    .line 117
    invoke-virtual {p1}, Ll/mvn;->i()Ljava/util/List;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 122
    .line 123
    .line 124
    move-result p0

    .line 125
    if-ne p0, v1, :cond_3

    .line 126
    .line 127
    invoke-virtual {p1}, Ll/mvn;->h()Ljava/util/List;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 132
    .line 133
    .line 134
    move-result p0

    .line 135
    if-nez p0, :cond_3

    .line 136
    .line 137
    invoke-virtual {v4}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->z5()Ll/twn;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    invoke-virtual {p0, p1}, Ll/twn;->I(Ll/mvn;)V

    .line 142
    .line 143
    .line 144
    invoke-virtual {v4}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->z5()Ll/twn;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 149
    .line 150
    .line 151
    :cond_3
    new-instance p0, Ll/dtr;

    .line 152
    .line 153
    invoke-virtual {p1}, Ll/mvn;->m()Z

    .line 154
    .line 155
    .line 156
    move-result p1

    .line 157
    invoke-direct {p0, p1}, Ll/dtr;-><init>(Z)V

    .line 158
    .line 159
    .line 160
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 161
    .line 162
    .line 163
    return-object v0
.end method

.method public final z5()Ll/twn;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->J:Ll/twn;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/twn;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->G:Ll/i5o;

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ll/twn;-><init>(Ll/i5o;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->J:Ll/twn;

    .line 13
    .line 14
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->J:Ll/twn;

    .line 15
    .line 16
    return-object p0
.end method
