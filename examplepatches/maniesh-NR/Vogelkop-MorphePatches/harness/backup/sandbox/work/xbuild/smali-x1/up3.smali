.class public final synthetic Lup3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:F

.field public final synthetic c:F

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;FFB)V
    .registers 5

    iput-byte p4, p0, Lup3;->a:B

    iput-object p1, p0, Lup3;->d:Ljava/lang/Object;

    iput p2, p0, Lup3;->b:F

    iput p3, p0, Lup3;->c:F

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .registers 6

    iget-byte v0, p0, Lup3;->a:B

    iget v1, p0, Lup3;->c:F

    iget v2, p0, Lup3;->b:F

    iget-object p0, p0, Lup3;->d:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_4a

    check-cast p0, Lg7m;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    iget-object p0, p0, Lg7m;->g:Ljava/lang/Object;

    check-cast p0, Lkze;

    sub-float/2addr v1, v2

    mul-float/2addr v1, p1

    add-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    invoke-static {p0, p1}, Lxf8;->G0(Lkze;Ljava/lang/Object;)Z

    return-void

    :pswitch_26
    check-cast p0, Lcom/opera/android/custom_views/BottomIndicatorButtonGroup;

    sget-object v0, Lcom/opera/android/custom_views/BottomIndicatorButtonGroup;->i:Landroid/view/animation/PathInterpolator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getInterpolator()Landroid/animation/TimeInterpolator;

    move-result-object v0

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    move-result v3

    invoke-interface {v0, v3}, Landroid/animation/TimeInterpolator;->getInterpolation(F)F

    move-result v0

    mul-float/2addr v0, v1

    add-float/2addr v0, v2

    iput v0, p0, Lcom/opera/android/custom_views/BottomIndicatorButtonGroup;->g:F

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    iput p1, p0, Lcom/opera/android/custom_views/BottomIndicatorButtonGroup;->h:F

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void

    :pswitch_data_4a
    .packed-switch 0x0
        :pswitch_26
    .end packed-switch
.end method
