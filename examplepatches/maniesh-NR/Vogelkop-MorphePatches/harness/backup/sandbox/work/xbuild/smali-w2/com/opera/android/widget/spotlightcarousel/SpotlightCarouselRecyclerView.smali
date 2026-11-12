.class public final Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselRecyclerView;
.super Lcom/opera/android/theme/ThemeableRecyclerView;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0007\u0018\u00002\u00020\u0001:\u0001\u0002\u00a8\u0006\u0003"
    }
    d2 = {
        "Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselRecyclerView;",
        "Lcom/opera/android/theme/ThemeableRecyclerView;",
        "w1k",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final synthetic L0:I


# instance fields
.field public final G0:I

.field public final H0:I

.field public final I0:Lw1k;

.field public final J0:Lyc3;

.field public K0:Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselLayoutManager;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/opera/android/theme/ThemeableRecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result p1

    iput p1, p0, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselRecyclerView;->G0:I

    int-to-float p1, p1

    const/high16 p2, 0x3fc00000    # 1.5f

    mul-float/2addr p1, p2

    invoke-static {p1}, Lzed;->b(F)I

    move-result p1

    iput p1, p0, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselRecyclerView;->H0:I

    new-instance p1, Lw1k;

    invoke-direct {p1, p0}, Lw1k;-><init>(Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselRecyclerView;)V

    iput-object p1, p0, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselRecyclerView;->I0:Lw1k;

    new-instance p1, Lyc3;

    const/4 p2, 0x7

    invoke-direct {p1, p0, p2}, Lyc3;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselRecyclerView;->J0:Lyc3;

    return-void
.end method


# virtual methods
.method public final C0(Landroidx/recyclerview/widget/f;)V
    .registers 3

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    instance-of v0, p1, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselLayoutManager;

    if-eqz v0, :cond_a

    check-cast p1, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselLayoutManager;

    goto :goto_b

    :cond_a
    const/4 p1, 0x0

    :goto_b
    iput-object p1, p0, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselRecyclerView;->K0:Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselLayoutManager;

    return-void
.end method

.method public final O(II)Z
    .registers 7

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->isLayoutSuppressed()Z

    move-result v0

    if-nez v0, :cond_93

    iget-object v0, p0, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselRecyclerView;->K0:Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselLayoutManager;

    if-eqz v0, :cond_95

    if-eqz p1, :cond_93

    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    iget v2, p0, Landroidx/recyclerview/widget/RecyclerView;->W:I

    if-lt v1, v2, :cond_93

    int-to-float v1, p1

    int-to-float p2, p2

    invoke-virtual {p0, v1, p2}, Landroidx/recyclerview/widget/RecyclerView;->dispatchNestedPreFling(FF)Z

    move-result v2

    if-nez v2, :cond_93

    const/4 v2, 0x1

    invoke-virtual {p0, v1, p2, v2}, Landroidx/recyclerview/widget/RecyclerView;->dispatchNestedFling(FFZ)Z

    invoke-virtual {p0}, Landroid/view/View;->getLayoutDirection()I

    move-result p2

    const/4 v1, 0x0

    if-nez p2, :cond_2a

    if-lez p1, :cond_65

    goto :goto_2c

    :cond_2a
    if-gez p1, :cond_65

    :goto_2c
    iget p1, v0, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselLayoutManager;->e:I

    if-eqz p1, :cond_80

    iget p1, v0, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselLayoutManager;->g:I

    int-to-float p1, p1

    invoke-virtual {v0}, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselLayoutManager;->r()I

    move-result p2

    int-to-float p2, p2

    div-float/2addr p1, p2

    float-to-double p1, p1

    invoke-static {p1, p2}, Ljava/lang/Math;->floor(D)D

    move-result-wide p1

    double-to-float p1, p1

    float-to-int p1, p1

    add-int/2addr p1, v2

    invoke-virtual {v0}, Landroidx/recyclerview/widget/f;->getItemCount()I

    move-result p2

    invoke-virtual {v0, p2}, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselLayoutManager;->p(I)I

    move-result p2

    if-gt p1, p2, :cond_80

    invoke-virtual {v0}, Landroidx/recyclerview/widget/f;->getItemCount()I

    move-result p2

    invoke-virtual {v0}, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselLayoutManager;->r()I

    move-result v3

    mul-int/2addr v3, p1

    invoke-virtual {v0, p2}, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselLayoutManager;->q(I)I

    move-result p2

    invoke-static {v3, p2}, Ljava/lang/Math;->min(II)I

    move-result p2

    iget v3, v0, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselLayoutManager;->g:I

    if-le p2, v3, :cond_80

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    goto :goto_80

    :cond_65
    iget p1, v0, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselLayoutManager;->e:I

    if-eqz p1, :cond_80

    iget p1, v0, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselLayoutManager;->g:I

    int-to-float p1, p1

    invoke-virtual {v0}, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselLayoutManager;->r()I

    move-result p2

    int-to-float p2, p2

    div-float/2addr p1, p2

    float-to-double p1, p1

    invoke-static {p1, p2}, Ljava/lang/Math;->ceil(D)D

    move-result-wide p1

    double-to-float p1, p1

    float-to-int p1, p1

    sub-int/2addr p1, v2

    if-ltz p1, :cond_80

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    :cond_80
    :goto_80
    if-eqz v1, :cond_93

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    new-instance p2, Lv1k;

    invoke-direct {p2, p1, p0, v0}, Lv1k;-><init>(ILandroid/content/Context;Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselLayoutManager;)V

    invoke-virtual {v0, p2}, Landroidx/recyclerview/widget/f;->startSmoothScroll(Luph;)V

    return v2

    :cond_93
    const/4 p0, 0x0

    return p0

    :cond_95
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->O(II)Z

    move-result p0

    return p0
.end method

.method public final canScrollHorizontally(I)Z
    .registers 4

    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->n:Landroidx/recyclerview/widget/f;

    const/4 v1, 0x0

    if-eqz v0, :cond_a

    invoke-virtual {v0}, Landroidx/recyclerview/widget/f;->canScrollHorizontally()Z

    move-result v0

    goto :goto_b

    :cond_a
    move v0, v1

    :goto_b
    if-nez v0, :cond_14

    invoke-super {p0, p1}, Landroid/view/View;->canScrollHorizontally(I)Z

    move-result p0

    if-nez p0, :cond_14

    return v1

    :cond_14
    const/4 p0, 0x1

    return p0
.end method

.method public final onAttachedToWindow()V
    .registers 2

    invoke-super {p0}, Landroidx/recyclerview/widget/RecyclerView;->onAttachedToWindow()V

    iget-object v0, p0, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselRecyclerView;->J0:Lyc3;

    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->o(Loph;)V

    iget-object v0, p0, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselRecyclerView;->I0:Lw1k;

    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->n(Lnph;)V

    return-void
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 3

    invoke-super {p0, p1}, Landroid/view/View;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    new-instance p1, Lmni;

    const/16 v0, 0x14

    invoke-direct {p1, p0, v0}, Lmni;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, p1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final onDetachedFromWindow()V
    .registers 2

    invoke-super {p0}, Landroidx/recyclerview/widget/RecyclerView;->onDetachedFromWindow()V

    iget-object v0, p0, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselRecyclerView;->J0:Lyc3;

    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->t0(Loph;)V

    iget-object v0, p0, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselRecyclerView;->I0:Lw1k;

    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->s0(Lnph;)V

    return-void
.end method
