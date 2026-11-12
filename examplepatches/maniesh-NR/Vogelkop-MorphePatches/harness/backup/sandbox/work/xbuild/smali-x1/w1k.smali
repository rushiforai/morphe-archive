.class public final Lw1k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnph;


# instance fields
.field public a:F

.field public b:F

.field public c:I

.field public d:Z

.field public final synthetic e:Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselRecyclerView;


# direct methods
.method public constructor <init>(Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselRecyclerView;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lw1k;->e:Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselRecyclerView;

    const/4 p1, -0x1

    iput p1, p0, Lw1k;->c:I

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/MotionEvent;)Z
    .registers 5

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iget v1, p0, Lw1k;->a:F

    sub-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    iget-object v1, p0, Lw1k;->e:Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselRecyclerView;

    iget v1, v1, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselRecyclerView;->G0:I

    int-to-float v2, v1

    cmpl-float v0, v0, v2

    if-gtz v0, :cond_26

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iget p0, p0, Lw1k;->b:F

    sub-float/2addr p1, p0

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p0

    int-to-float p1, v1

    cmpl-float p0, p0, p1

    if-gtz p0, :cond_26

    const/4 p0, 0x0

    return p0

    :cond_26
    const/4 p0, 0x1

    return p0
.end method

.method public final b(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/MotionEvent;)Z
    .registers 11

    iget-object v0, p0, Lw1k;->e:Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselRecyclerView;

    iget-object v1, v0, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselRecyclerView;->K0:Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselLayoutManager;

    const/4 v2, 0x0

    if-eqz v1, :cond_104

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v3

    const/4 v4, 0x1

    const/4 v5, -0x1

    if-eqz v3, :cond_d9

    if-eq v3, v4, :cond_53

    const/4 v1, 0x2

    if-eq v3, v1, :cond_29

    const/4 p2, 0x3

    if-ne v3, p2, :cond_104

    iput v5, p0, Lw1k;->c:I

    iget-boolean p2, p0, Lw1k;->d:Z

    if-eqz p2, :cond_104

    iput-boolean v2, p0, Lw1k;->d:Z

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    if-eqz p0, :cond_104

    invoke-interface {p0, v2}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    return v2

    :cond_29
    invoke-virtual {p0, p2}, Lw1k;->a(Landroid/view/MotionEvent;)Z

    move-result v1

    if-eqz v1, :cond_31

    iput v5, p0, Lw1k;->c:I

    :cond_31
    iget-boolean v1, p0, Lw1k;->d:Z

    if-eqz v1, :cond_104

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result p2

    iget v1, p0, Lw1k;->b:F

    sub-float/2addr p2, v1

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result p2

    iget v0, v0, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselRecyclerView;->H0:I

    int-to-float v0, v0

    cmpl-float p2, p2, v0

    if-lez p2, :cond_104

    iput-boolean v2, p0, Lw1k;->d:Z

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    if-eqz p0, :cond_104

    invoke-interface {p0, v2}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    return v2

    :cond_53
    iget v3, p0, Lw1k;->c:I

    iput v5, p0, Lw1k;->c:I

    iget-boolean v6, p0, Lw1k;->d:Z

    if-eqz v6, :cond_66

    iput-boolean v2, p0, Lw1k;->d:Z

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    if-eqz p1, :cond_66

    invoke-interface {p1, v2}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    :cond_66
    if-eq v3, v5, :cond_104

    invoke-virtual {p0, p2}, Lw1k;->a(Landroid/view/MotionEvent;)Z

    move-result p0

    if-nez p0, :cond_104

    iget p0, v1, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselLayoutManager;->e:I

    const/4 p1, 0x0

    if-eqz p0, :cond_c4

    invoke-virtual {v1}, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselLayoutManager;->r()I

    move-result p0

    invoke-virtual {v1}, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselLayoutManager;->s()I

    move-result p2

    mul-int/2addr v3, p0

    add-int/2addr v3, p2

    iget p2, v1, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselLayoutManager;->g:I

    sub-int/2addr v3, p2

    iget p2, v1, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselLayoutManager;->e:I

    add-int/2addr p2, v3

    invoke-virtual {v1}, Landroidx/recyclerview/widget/f;->getPaddingStart()I

    move-result v5

    invoke-virtual {v1}, Landroidx/recyclerview/widget/f;->getWidth()I

    move-result v6

    invoke-virtual {v1}, Landroidx/recyclerview/widget/f;->getPaddingEnd()I

    move-result v7

    sub-int/2addr v6, v7

    if-ge v3, v5, :cond_98

    iget p1, v1, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselLayoutManager;->g:I

    sub-int/2addr v5, v3

    sub-int p2, p1, v5

    goto :goto_9e

    :cond_98
    if-le p2, v6, :cond_c4

    iget p1, v1, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselLayoutManager;->g:I

    sub-int/2addr p2, v6

    add-int/2addr p2, p1

    :goto_9e
    if-ge p2, p1, :cond_ab

    int-to-float p1, p2

    int-to-float p0, p0

    div-float/2addr p1, p0

    float-to-double p0, p1

    invoke-static {p0, p1}, Ljava/lang/Math;->floor(D)D

    move-result-wide p0

    :goto_a8
    double-to-float p0, p0

    float-to-int p0, p0

    goto :goto_b4

    :cond_ab
    int-to-float p1, p2

    int-to-float p0, p0

    div-float/2addr p1, p0

    float-to-double p0, p1

    invoke-static {p0, p1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide p0

    goto :goto_a8

    :goto_b4
    invoke-virtual {v1}, Landroidx/recyclerview/widget/f;->getItemCount()I

    move-result p1

    invoke-virtual {v1, p1}, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselLayoutManager;->p(I)I

    move-result p1

    invoke-static {p0, v2, p1}, Lcs5;->t(III)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    :cond_c4
    if-eqz p1, :cond_104

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p0

    sget p1, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselRecyclerView;->L0:I

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    new-instance p2, Lv1k;

    invoke-direct {p2, p0, p1, v1}, Lv1k;-><init>(ILandroid/content/Context;Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselLayoutManager;)V

    invoke-virtual {v1, p2}, Landroidx/recyclerview/widget/f;->startSmoothScroll(Luph;)V

    return v4

    :cond_d9
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    iput v1, p0, Lw1k;->a:F

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    iput v1, p0, Lw1k;->b:F

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result p2

    invoke-virtual {v0, v1, p2}, Landroidx/recyclerview/widget/RecyclerView;->H(FF)Landroid/view/View;

    move-result-object p2

    if-eqz p2, :cond_f7

    invoke-static {p2}, Landroidx/recyclerview/widget/RecyclerView;->S(Landroid/view/View;)I

    move-result v5

    :cond_f7
    iput v5, p0, Lw1k;->c:I

    iput-boolean v4, p0, Lw1k;->d:Z

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    if-eqz p0, :cond_104

    invoke-interface {p0, v4}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    :cond_104
    return v2
.end method

.method public final c(Z)V
    .registers 2

    return-void
.end method

.method public final d(Landroid/view/MotionEvent;)V
    .registers 2

    return-void
.end method
