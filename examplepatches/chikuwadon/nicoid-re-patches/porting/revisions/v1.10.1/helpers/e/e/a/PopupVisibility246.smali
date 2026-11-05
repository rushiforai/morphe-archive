.class public final Le/e/a/PopupVisibility246;
.super Ljava/lang/Object;
.source "PopupVisibility246.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static background(Ljava/lang/Object;Landroid/view/View;)V
    .registers 2

    .line 7
    invoke-static {p0}, Le/e/a/MiniSession225;->minimize(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_a

    const/4 p1, 0x1

    invoke-static {p0, p1}, Le/e/a/PlaybackTransfer221;->popup(Ljava/lang/Object;Z)Z

    :cond_a
    return-void
.end method

.method public static center(Landroid/view/View;)V
    .registers 3

    .line 6
    const-string v0, "controller"

    invoke-static {p0, v0}, Le/e/a/PopupCenter242;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    const-string v1, "viewctrllay"

    invoke-static {p0, v1}, Le/e/a/PopupCenter242;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object p0

    if-eqz v0, :cond_13

    if-eqz p0, :cond_13

    invoke-static {v0, p0}, Le/e/a/PopupCenter242;->inherit(Landroid/view/View;Landroid/view/View;)V

    :cond_13
    return-void
.end method

.method public static draw(Landroid/view/View;[Landroid/view/View;Z)Z
    .registers 7

    .line 5
    if-eqz p2, :cond_39

    const/4 p2, 0x0

    move v0, p2

    :goto_4
    array-length v1, p1

    if-lt v0, v1, :cond_8

    goto :goto_39

    :cond_8
    aget-object v1, p1, v0

    const/4 v2, 0x2

    if-eq v0, v2, :cond_36

    if-nez v1, :cond_10

    goto :goto_36

    :cond_10
    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v2

    const/high16 v3, 0x3f800000    # 1.0f

    if-nez v2, :cond_26

    invoke-virtual {v1}, Landroid/view/View;->getAlpha()F

    move-result v2

    cmpl-float v2, v2, v3

    if-nez v2, :cond_26

    invoke-virtual {v1}, Landroid/view/View;->getAnimation()Landroid/view/animation/Animation;

    move-result-object v2

    if-eqz v2, :cond_36

    :cond_26
    invoke-virtual {v1}, Landroid/view/View;->clearAnimation()V

    invoke-virtual {v1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/ViewPropertyAnimator;->cancel()V

    invoke-virtual {v1, v3}, Landroid/view/View;->setAlpha(F)V

    invoke-virtual {v1, p2}, Landroid/view/View;->setVisibility(I)V

    :cond_36
    :goto_36
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    :cond_39
    :goto_39
    invoke-static {p0}, Le/e/a/PopupVisibility246;->center(Landroid/view/View;)V

    const/4 p0, 0x1

    return p0
.end method
