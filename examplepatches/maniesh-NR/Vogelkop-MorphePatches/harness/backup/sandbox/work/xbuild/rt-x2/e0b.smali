.class public final Le0b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public a:F

.field public b:F

.field public final synthetic c:Landroid/animation/ValueAnimator;

.field public final synthetic d:Landroid/animation/ValueAnimator;

.field public final synthetic e:Lydb;


# direct methods
.method public constructor <init>(Lydb;Landroid/animation/ValueAnimator;Landroid/animation/ValueAnimator;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le0b;->e:Lydb;

    iput-object p2, p0, Le0b;->c:Landroid/animation/ValueAnimator;

    iput-object p3, p0, Le0b;->d:Landroid/animation/ValueAnimator;

    const/4 p1, 0x0

    iput p1, p0, Le0b;->a:F

    iput p1, p0, Le0b;->b:F

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .registers 8

    iget-object p1, p0, Le0b;->c:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    iget-object v0, p0, Le0b;->d:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    iget v1, p0, Le0b;->a:F

    sub-float v1, p1, v1

    float-to-double v1, v1

    iget v3, p0, Le0b;->b:F

    sub-float v3, v0, v3

    float-to-double v3, v3

    iget-object v5, p0, Le0b;->e:Lydb;

    invoke-virtual {v5, v1, v2, v3, v4}, Lydb;->k(DD)V

    iput p1, p0, Le0b;->a:F

    iput v0, p0, Le0b;->b:F

    invoke-virtual {v5}, Landroid/view/View;->postInvalidateOnAnimation()V

    return-void
.end method
