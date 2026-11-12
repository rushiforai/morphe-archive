.class public final synthetic Lb48;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Ld48;

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:F

.field public final synthetic d:F

.field public final synthetic e:F


# direct methods
.method public synthetic constructor <init>(Ld48;Landroid/view/View;FFF)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lb48;->a:Ld48;

    iput-object p2, p0, Lb48;->b:Landroid/view/View;

    iput p3, p0, Lb48;->c:F

    iput p4, p0, Lb48;->d:F

    iput p5, p0, Lb48;->e:F

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .registers 7

    iget-object v0, p0, Lb48;->a:Ld48;

    iget-object v0, v0, Ld48;->e:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/view/View;->invalidate()V

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    const/high16 v0, 0x3f800000    # 1.0f

    mul-float v1, v0, p1

    const/4 v2, 0x0

    add-float/2addr v1, v2

    iget-object v3, p0, Lb48;->b:Landroid/view/View;

    invoke-virtual {v3, v1}, Landroid/view/View;->setAlpha(F)V

    iget v1, p0, Lb48;->c:F

    sub-float v4, v2, v1

    mul-float/2addr v4, p1

    add-float/2addr v4, v1

    invoke-virtual {v3, v4}, Landroid/view/View;->setTranslationX(F)V

    iget v1, p0, Lb48;->d:F

    sub-float/2addr v2, v1

    mul-float/2addr v2, p1

    add-float/2addr v2, v1

    invoke-virtual {v3, v2}, Landroid/view/View;->setTranslationY(F)V

    iget p0, p0, Lb48;->e:F

    sub-float/2addr v0, p0

    mul-float/2addr v0, p1

    add-float/2addr v0, p0

    invoke-virtual {v3, v0}, Landroid/view/View;->setScaleX(F)V

    invoke-virtual {v3, v0}, Landroid/view/View;->setScaleY(F)V

    return-void
.end method
