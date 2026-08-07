.class public Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager$a;
.super Landroidx/recyclerview/widget/n;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->smoothScrollToPosition(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;Landroid/content/Context;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager$a;->a:Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/n;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public calculateSpeedPerPixel(Landroid/util/DisplayMetrics;)F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager$a;->a:Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->E(Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;)F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    iget p1, p1, Landroid/util/DisplayMetrics;->densityDpi:I

    .line 8
    .line 9
    int-to-float p1, p1

    .line 10
    div-float/2addr p0, p1

    .line 11
    return p0
.end method

.method public computeScrollVectorForPosition(I)Landroid/graphics/PointF;
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$z;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$z;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/LinearLayoutManager;->computeScrollVectorForPosition(I)Landroid/graphics/PointF;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public onStop()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroidx/recyclerview/widget/n;->onStop()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager$a;->a:Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->F(Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;)Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager$a;->a:Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->F(Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;)Ljava/util/List;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_1

    .line 31
    .line 32
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    check-cast v1, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager$c;

    .line 37
    .line 38
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    if-eqz v2, :cond_0

    .line 43
    .line 44
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager$a;->a:Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;

    .line 45
    .line 46
    invoke-static {v2}, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->G(Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;)I

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager$a;->a:Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;

    .line 51
    .line 52
    invoke-static {v3}, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->H(Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;)I

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    invoke-interface {v1, v2, v3}, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager$c;->a(II)V

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager$a;->a:Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;

    .line 61
    .line 62
    const/4 v0, 0x1

    .line 63
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->I(Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;Z)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public onTargetFound(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView$a0;Landroidx/recyclerview/widget/RecyclerView$z$a;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$z;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    goto :goto_2

    .line 8
    :cond_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/n;->getHorizontalSnapPreference()I

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    invoke-virtual {p0, p1, p2}, Landroidx/recyclerview/widget/n;->calculateDxToMakeVisible(Landroid/view/View;I)I

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    invoke-virtual {p0}, Landroidx/recyclerview/widget/n;->getVerticalSnapPreference()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-virtual {p0, p1, v0}, Landroidx/recyclerview/widget/n;->calculateDyToMakeVisible(Landroid/view/View;I)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-lez p2, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$z;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v1, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->getLeftDecorationWidth(Landroid/view/View;)I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    sub-int/2addr p2, v1

    .line 35
    goto :goto_0

    .line 36
    :cond_1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$z;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v1, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->getRightDecorationWidth(Landroid/view/View;)I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    add-int/2addr p2, v1

    .line 45
    :goto_0
    if-lez v0, :cond_2

    .line 46
    .line 47
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$z;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v1, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->getTopDecorationHeight(Landroid/view/View;)I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    sub-int/2addr v0, p1

    .line 56
    goto :goto_1

    .line 57
    :cond_2
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$z;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v1, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->getBottomDecorationHeight(Landroid/view/View;)I

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    add-int/2addr v0, p1

    .line 66
    :goto_1
    mul-int p1, p2, p2

    .line 67
    .line 68
    mul-int v1, v0, v0

    .line 69
    .line 70
    add-int/2addr p1, v1

    .line 71
    int-to-double v1, p1

    .line 72
    invoke-static {v1, v2}, Ljava/lang/Math;->sqrt(D)D

    .line 73
    .line 74
    .line 75
    move-result-wide v1

    .line 76
    double-to-int p1, v1

    .line 77
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/n;->calculateTimeForDeceleration(I)I

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    if-lez p1, :cond_3

    .line 82
    .line 83
    neg-int p2, p2

    .line 84
    neg-int v0, v0

    .line 85
    iget-object p0, p0, Landroidx/recyclerview/widget/n;->mDecelerateInterpolator:Landroid/view/animation/DecelerateInterpolator;

    .line 86
    .line 87
    invoke-virtual {p3, p2, v0, p1, p0}, Landroidx/recyclerview/widget/RecyclerView$z$a;->d(IIILandroid/view/animation/Interpolator;)V

    .line 88
    .line 89
    .line 90
    :cond_3
    :goto_2
    return-void
.end method
