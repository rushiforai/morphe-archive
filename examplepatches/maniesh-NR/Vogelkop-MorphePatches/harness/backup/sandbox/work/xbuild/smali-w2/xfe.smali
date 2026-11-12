.class public final synthetic Lxfe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Lfge;

.field public final synthetic b:Z

.field public final synthetic c:I

.field public final synthetic d:I


# direct methods
.method public synthetic constructor <init>(Lfge;ZII)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lxfe;->a:Lfge;

    iput-boolean p2, p0, Lxfe;->b:Z

    iput p3, p0, Lxfe;->c:I

    iput p4, p0, Lxfe;->d:I

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .registers 8

    sget-object v0, Llf1;->l:Landroid/view/animation/PathInterpolator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    move-result p1

    invoke-virtual {v0, p1}, Landroid/view/animation/PathInterpolator;->getInterpolation(F)F

    move-result p1

    iget-boolean v0, p0, Lxfe;->b:Z

    const/high16 v1, 0x3f800000    # 1.0f

    if-nez v0, :cond_12

    sub-float p1, v1, p1

    :cond_12
    iget v0, p0, Lxfe;->c:I

    int-to-float v2, v0

    iget v3, p0, Lxfe;->d:I

    sub-int/2addr v0, v3

    int-to-float v0, v0

    mul-float/2addr v0, p1

    sub-float/2addr v2, v0

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v0

    iget-object p0, p0, Lxfe;->a:Lfge;

    iget-object v2, p0, Lfge;->F:Lcom/opera/android/custom_views/StylingEditText;

    invoke-virtual {v2}, Lcom/opera/android/custom_views/OperaEditText;->l()Z

    move-result v2

    iget-object v3, p0, Lfge;->F:Lcom/opera/android/custom_views/StylingEditText;

    if-eqz v2, :cond_30

    invoke-virtual {v3}, Landroid/view/View;->getPaddingLeft()I

    move-result v4

    goto :goto_31

    :cond_30
    move v4, v0

    :goto_31
    iget-object v5, p0, Lfge;->F:Lcom/opera/android/custom_views/StylingEditText;

    invoke-virtual {v5}, Landroid/view/View;->getPaddingTop()I

    move-result v5

    if-nez v2, :cond_3f

    iget-object v0, p0, Lfge;->F:Lcom/opera/android/custom_views/StylingEditText;

    invoke-virtual {v0}, Landroid/view/View;->getPaddingRight()I

    move-result v0

    :cond_3f
    iget-object v2, p0, Lfge;->F:Lcom/opera/android/custom_views/StylingEditText;

    invoke-virtual {v2}, Landroid/view/View;->getPaddingBottom()I

    move-result v2

    invoke-virtual {v3, v4, v5, v0, v2}, Landroid/view/View;->setPadding(IIII)V

    sub-float p1, v1, p1

    const/high16 v0, 0x40000000    # 2.0f

    mul-float/2addr p1, v0

    sub-float/2addr p1, v1

    const/4 v0, 0x0

    invoke-static {v0, p1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    iget-object p0, p0, Lfge;->C:Landroid/view/View;

    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    return-void
.end method
