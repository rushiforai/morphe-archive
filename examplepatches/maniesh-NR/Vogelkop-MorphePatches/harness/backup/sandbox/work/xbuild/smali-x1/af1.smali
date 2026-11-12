.class public final synthetic Laf1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 5

    iput-byte p4, p0, Laf1;->a:B

    iput-object p1, p0, Laf1;->b:Ljava/lang/Object;

    iput-object p2, p0, Laf1;->c:Ljava/lang/Object;

    iput-object p3, p0, Laf1;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .registers 6

    iget-byte v0, p0, Laf1;->a:B

    iget-object v1, p0, Laf1;->d:Ljava/lang/Object;

    iget-object v2, p0, Laf1;->c:Ljava/lang/Object;

    iget-object p0, p0, Laf1;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_94

    check-cast p0, Lcom/opera/android/search/behavior/ScrollableToolbarBehavior;

    check-cast v2, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    check-cast v1, Landroid/view/View;

    sget-object v0, Lcom/opera/android/search/behavior/ScrollableToolbarBehavior;->g:Landroid/view/animation/DecelerateInterpolator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iget-object v0, p0, Lcom/opera/android/search/behavior/ViewOffsetBehavior;->a:Lr05;

    if-eqz v0, :cond_2b

    iget p0, v0, Lr05;->d:I

    if-eq p0, p1, :cond_2d

    iput p1, v0, Lr05;->d:I

    invoke-virtual {v0}, Lr05;->s()V

    goto :goto_2d

    :cond_2b
    iput p1, p0, Lcom/opera/android/search/behavior/ViewOffsetBehavior;->b:I

    :cond_2d
    :goto_2d
    invoke-virtual {v2, v1}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->f(Landroid/view/View;)V

    return-void

    :pswitch_31
    check-cast p0, Lji7;

    check-cast v2, Lni7;

    check-cast v1, Lkotlin/jvm/functions/Function1;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    iput p1, p0, Lji7;->a:F

    sget p0, Lni7;->C:I

    const p0, 0x3a83126f    # 0.001f

    cmpg-float p0, p1, p0

    if-gez p0, :cond_4e

    const/4 p1, 0x0

    goto :goto_57

    :cond_4e
    const p0, 0x3f7fbe77    # 0.999f

    cmpl-float p0, p1, p0

    if-lez p0, :cond_57

    const/high16 p1, 0x3f800000    # 1.0f

    :cond_57
    :goto_57
    invoke-virtual {v2}, Lni7;->g()V

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    invoke-interface {v1, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_62
    check-cast p0, Luh7;

    check-cast v2, Luh7;

    check-cast v1, Landroid/view/View;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    iget v0, p0, Luh7;->a:F

    iget v3, v2, Luh7;->a:F

    sub-float/2addr v3, v0

    mul-float/2addr v3, p1

    add-float/2addr v3, v0

    invoke-virtual {v1, v3}, Landroid/view/View;->setScaleX(F)V

    invoke-virtual {v1, v3}, Landroid/view/View;->setScaleY(F)V

    iget v0, p0, Luh7;->b:F

    iget v3, v2, Luh7;->b:F

    sub-float/2addr v3, v0

    mul-float/2addr v3, p1

    add-float/2addr v3, v0

    invoke-virtual {v1, v3}, Landroid/view/View;->setAlpha(F)V

    iget p0, p0, Luh7;->c:F

    iget v0, v2, Luh7;->c:F

    sub-float/2addr v0, p0

    mul-float/2addr v0, p1

    add-float/2addr v0, p0

    invoke-virtual {v1, v0}, Landroid/view/View;->setTranslationZ(F)V

    return-void

    :pswitch_data_94
    .packed-switch 0x0
        :pswitch_62
        :pswitch_31
    .end packed-switch
.end method
