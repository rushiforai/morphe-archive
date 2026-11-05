.class final Le/e/a/Ui110$Swipe;
.super Le/e/a/TabViewport110;
.source "Ui110.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/Ui110;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Swipe"
.end annotation


# instance fields
.field busy:Z

.field final changed:Ljava/util/function/IntConsumer;

.field count:I

.field selected:I


# direct methods
.method constructor <init>(Landroid/content/Context;ILjava/util/function/IntConsumer;)V
    .registers 4

    .line 10
    invoke-direct {p0, p1}, Le/e/a/TabViewport110;-><init>(Landroid/content/Context;)V

    iput p2, p0, Le/e/a/Ui110$Swipe;->count:I

    iput-object p3, p0, Le/e/a/Ui110$Swipe;->changed:Ljava/util/function/IntConsumer;

    return-void
.end method


# virtual methods
.method synthetic lambda$0$e-e-a-Ui110$Swipe(ILandroid/view/View;I)V
    .registers 5

    .line 10
    iget-object v0, p0, Le/e/a/Ui110$Swipe;->changed:Ljava/util/function/IntConsumer;

    invoke-interface {v0, p1}, Ljava/util/function/IntConsumer;->accept(I)V

    invoke-virtual {p0}, Le/e/a/Ui110$Swipe;->getWidth()I

    move-result p1

    mul-int p3, p3, p1

    int-to-float p1, p3

    invoke-virtual {p2, p1}, Landroid/view/View;->setTranslationX(F)V

    invoke-virtual {p2}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    const/high16 p2, 0x3f800000    # 1.0f

    invoke-virtual {p1, p2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    const-wide/16 p2, 0x96

    invoke-virtual {p1, p2, p3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    new-instance p2, Le/e/a/Ui110$Swipe$$ExternalSyntheticLambda1;

    invoke-direct {p2, p0}, Le/e/a/Ui110$Swipe$$ExternalSyntheticLambda1;-><init>(Le/e/a/Ui110$Swipe;)V

    invoke-virtual {p1, p2}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->start()V

    return-void
.end method

.method synthetic lambda$1$e-e-a-Ui110$Swipe()V
    .registers 2

    .line 10
    const/4 v0, 0x0

    iput-boolean v0, p0, Le/e/a/Ui110$Swipe;->busy:Z

    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 4

    .line 10
    invoke-virtual {p0}, Le/e/a/Ui110$Swipe;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    if-lez v0, :cond_23

    invoke-virtual {p0, v1}, Le/e/a/Ui110$Swipe;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    invoke-virtual {p0, v1}, Le/e/a/Ui110$Swipe;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/view/View;->setTranslationX(F)V

    invoke-virtual {p0, v1}, Le/e/a/Ui110$Swipe;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v0, v2}, Landroid/view/View;->setAlpha(F)V

    :cond_23
    iput-boolean v1, p0, Le/e/a/Ui110$Swipe;->busy:Z

    invoke-super {p0}, Le/e/a/TabViewport110;->onDetachedFromWindow()V

    return-void
.end method

.method select(I)V
    .registers 7

    .line 10
    if-ltz p1, :cond_51

    iget v0, p0, Le/e/a/Ui110$Swipe;->count:I

    if-ge p1, v0, :cond_51

    iget v0, p0, Le/e/a/Ui110$Swipe;->selected:I

    if-eq p1, v0, :cond_51

    iget-boolean v0, p0, Le/e/a/Ui110$Swipe;->busy:Z

    if-eqz v0, :cond_f

    goto :goto_51

    :cond_f
    iget v0, p0, Le/e/a/Ui110$Swipe;->selected:I

    const/4 v1, 0x1

    if-le p1, v0, :cond_16

    const/4 v0, 0x1

    goto :goto_17

    :cond_16
    const/4 v0, -0x1

    :goto_17
    iput p1, p0, Le/e/a/Ui110$Swipe;->selected:I

    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Le/e/a/Ui110$Swipe;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    if-nez v2, :cond_26

    iget-object v0, p0, Le/e/a/Ui110$Swipe;->changed:Ljava/util/function/IntConsumer;

    invoke-interface {v0, p1}, Ljava/util/function/IntConsumer;->accept(I)V

    return-void

    :cond_26
    iput-boolean v1, p0, Le/e/a/Ui110$Swipe;->busy:Z

    invoke-virtual {v2}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    neg-int v3, v0

    invoke-virtual {p0}, Le/e/a/Ui110$Swipe;->getWidth()I

    move-result v4

    mul-int v3, v3, v4

    int-to-float v3, v3

    invoke-virtual {v1, v3}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    const v3, 0x3ecccccd    # 0.4f

    invoke-virtual {v1, v3}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    const-wide/16 v3, 0x5a

    invoke-virtual {v1, v3, v4}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    new-instance v3, Le/e/a/Ui110$Swipe$$ExternalSyntheticLambda0;

    invoke-direct {v3, p0, p1, v2, v0}, Le/e/a/Ui110$Swipe$$ExternalSyntheticLambda0;-><init>(Le/e/a/Ui110$Swipe;ILandroid/view/View;I)V

    invoke-virtual {v1, v3}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->start()V

    :cond_51
    :goto_51
    return-void
.end method

.method swipe(I)V
    .registers 3

    .line 10
    iget v0, p0, Le/e/a/Ui110$Swipe;->selected:I

    add-int/2addr v0, p1

    invoke-virtual {p0, v0}, Le/e/a/Ui110$Swipe;->select(I)V

    return-void
.end method

.method switching()Z
    .registers 2

    .line 10
    iget-boolean v0, p0, Le/e/a/Ui110$Swipe;->busy:Z

    return v0
.end method
