.class final Le/e/a/Following190$Pager;
.super Le/e/a/TabViewport110;
.source "Following190.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/Following190;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Pager"
.end annotation


# instance fields
.field animating:Z

.field changed:Ljava/lang/Runnable;

.field selected:I


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .registers 2

    .line 37
    invoke-direct {p0, p1}, Le/e/a/TabViewport110;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method synthetic lambda$0$e-e-a-Following190$Pager(Landroid/view/View;)V
    .registers 3

    .line 39
    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationX(F)V

    const/4 p1, 0x0

    iput-boolean p1, p0, Le/e/a/Following190$Pager;->animating:Z

    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 5

    .line 40
    const/4 v0, 0x0

    move v1, v0

    :goto_2
    invoke-virtual {p0}, Le/e/a/Following190$Pager;->getChildCount()I

    move-result v2

    if-lt v1, v2, :cond_e

    iput-boolean v0, p0, Le/e/a/Following190$Pager;->animating:Z

    invoke-super {p0}, Le/e/a/TabViewport110;->onDetachedFromWindow()V

    return-void

    :cond_e
    invoke-virtual {p0, v1}, Le/e/a/Following190$Pager;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/ViewPropertyAnimator;->cancel()V

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/view/View;->setTranslationX(F)V

    iget v3, p0, Le/e/a/Following190$Pager;->selected:I

    if-ne v1, v3, :cond_23

    move v3, v0

    goto :goto_25

    :cond_23
    const/16 v3, 0x8

    :goto_25
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_2
.end method

.method select(I)V
    .registers 9

    .line 39
    if-ltz p1, :cond_74

    const/4 v0, 0x3

    if-ge p1, v0, :cond_74

    iget v0, p0, Le/e/a/Following190$Pager;->selected:I

    if-eq p1, v0, :cond_74

    iget-boolean v1, p0, Le/e/a/Following190$Pager;->animating:Z

    if-eqz v1, :cond_e

    goto :goto_74

    :cond_e
    iput p1, p0, Le/e/a/Following190$Pager;->selected:I

    invoke-virtual {p0, v0}, Le/e/a/Following190$Pager;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {p0, p1}, Le/e/a/Following190$Pager;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    const/4 v3, 0x1

    if-le p1, v0, :cond_1d

    move p1, v3

    goto :goto_1e

    :cond_1d
    const/4 p1, -0x1

    :goto_1e
    const/4 v0, 0x0

    invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0}, Le/e/a/Following190$Pager;->getWidth()I

    move-result v0

    mul-int/2addr v0, p1

    int-to-float v0, v0

    invoke-virtual {v2, v0}, Landroid/view/View;->setTranslationX(F)V

    iget-object v0, p0, Le/e/a/Following190$Pager;->changed:Ljava/lang/Runnable;

    if-eqz v0, :cond_32

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    :cond_32
    invoke-virtual {p0}, Le/e/a/Following190$Pager;->getWidth()I

    move-result v0

    const/4 v4, 0x0

    if-nez v0, :cond_42

    const/16 p1, 0x8

    invoke-virtual {v1, p1}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v2, v4}, Landroid/view/View;->setTranslationX(F)V

    return-void

    :cond_42
    iput-boolean v3, p0, Le/e/a/Following190$Pager;->animating:Z

    invoke-virtual {v1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    neg-int p1, p1

    invoke-virtual {p0}, Le/e/a/Following190$Pager;->getWidth()I

    move-result v3

    mul-int/2addr p1, v3

    int-to-float p1, p1

    invoke-virtual {v0, p1}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    const-wide/16 v5, 0xc8

    invoke-virtual {p1, v5, v6}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->start()V

    invoke-virtual {v2}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, v4}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, v5, v6}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    new-instance v0, Le/e/a/Following190$Pager$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0, v1}, Le/e/a/Following190$Pager$$ExternalSyntheticLambda0;-><init>(Le/e/a/Following190$Pager;Landroid/view/View;)V

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->start()V

    :cond_74
    :goto_74
    return-void
.end method

.method swipe(I)V
    .registers 3

    .line 38
    iget v0, p0, Le/e/a/Following190$Pager;->selected:I

    add-int/2addr v0, p1

    invoke-virtual {p0, v0}, Le/e/a/Following190$Pager;->select(I)V

    return-void
.end method

.method switching()Z
    .registers 2

    .line 38
    iget-boolean v0, p0, Le/e/a/Following190$Pager;->animating:Z

    return v0
.end method
