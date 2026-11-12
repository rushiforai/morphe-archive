.class public final Lv1k;
.super Lifc;
.source "SourceFile"


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselLayoutManager;


# direct methods
.method public constructor <init>(ILandroid/content/Context;Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselLayoutManager;)V
    .registers 4

    iput p1, p0, Lv1k;->a:I

    iput-object p3, p0, Lv1k;->b:Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselLayoutManager;

    invoke-direct {p0, p2}, Lifc;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, p1}, Luph;->setTargetPosition(I)V

    return-void
.end method


# virtual methods
.method public final calculateSpeedPerPixel(Landroid/util/DisplayMetrics;)F
    .registers 2

    iget p0, p1, Landroid/util/DisplayMetrics;->densityDpi:I

    int-to-float p0, p0

    const/high16 p1, 0x41f00000    # 30.0f

    div-float/2addr p1, p0

    return p1
.end method

.method public final calculateTimeForDeceleration(I)I
    .registers 2

    if-nez p1, :cond_4

    const/4 p0, 0x0

    return p0

    :cond_4
    invoke-super {p0, p1}, Lifc;->calculateTimeForDeceleration(I)I

    move-result p0

    return p0
.end method

.method public final onTargetFound(Landroid/view/View;Lvph;Lsph;)V
    .registers 7

    iget-object p1, p0, Lv1k;->b:Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselLayoutManager;

    iget p2, p1, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselLayoutManager;->e:I

    const/4 v0, 0x0

    if-nez p2, :cond_9

    move p2, v0

    goto :goto_27

    :cond_9
    invoke-virtual {p1}, Landroidx/recyclerview/widget/f;->getItemCount()I

    move-result p2

    invoke-virtual {p1}, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselLayoutManager;->r()I

    move-result v1

    iget v2, p0, Lv1k;->a:I

    mul-int/2addr v1, v2

    invoke-virtual {p1, p2}, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselLayoutManager;->q(I)I

    move-result p2

    invoke-static {v1, p2}, Ljava/lang/Math;->min(II)I

    move-result p2

    iget v1, p1, Lcom/opera/android/widget/spotlightcarousel/SpotlightCarouselLayoutManager;->g:I

    sub-int/2addr p2, v1

    invoke-virtual {p1}, Landroidx/recyclerview/widget/f;->getLayoutDirection()I

    move-result p1

    const/4 v1, 0x1

    if-ne p1, v1, :cond_27

    neg-int p2, p2

    :cond_27
    :goto_27
    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    move-result p1

    invoke-virtual {p0, p1}, Lv1k;->calculateTimeForDeceleration(I)I

    move-result p1

    if-lez p1, :cond_36

    iget-object p0, p0, Lifc;->mDecelerateInterpolator:Landroid/view/animation/DecelerateInterpolator;

    invoke-virtual {p3, p2, v0, p1, p0}, Lsph;->b(IIILandroid/view/animation/Interpolator;)V

    :cond_36
    return-void
.end method
