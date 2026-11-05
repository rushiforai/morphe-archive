.class public final Le/e/a/PinnedPopupLinear248;
.super Landroid/widget/LinearLayout;
.source "PinnedPopupLinear248.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2

    .line 8
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3

    .line 9
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public setAlpha(F)V
    .registers 3

    .line 12
    invoke-static {p0}, Le/e/a/PinnedPopup247;->pinned(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_8

    const/high16 p1, 0x3f800000    # 1.0f

    :cond_8
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->setAlpha(F)V

    return-void
.end method

.method public setAnimation(Landroid/view/animation/Animation;)V
    .registers 3

    .line 14
    invoke-static {p0}, Le/e/a/PinnedPopup247;->pinned(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_7

    const/4 p1, 0x0

    :cond_7
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->setAnimation(Landroid/view/animation/Animation;)V

    return-void
.end method

.method public setVisibility(I)V
    .registers 3

    .line 11
    invoke-static {p0}, Le/e/a/PinnedPopup247;->pinned(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_7

    const/4 p1, 0x0

    :cond_7
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    return-void
.end method

.method public startAnimation(Landroid/view/animation/Animation;)V
    .registers 3

    .line 13
    invoke-static {p0}, Le/e/a/PinnedPopup247;->pinned(Landroid/view/View;)Z

    move-result v0

    if-nez v0, :cond_9

    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->startAnimation(Landroid/view/animation/Animation;)V

    :cond_9
    return-void
.end method
