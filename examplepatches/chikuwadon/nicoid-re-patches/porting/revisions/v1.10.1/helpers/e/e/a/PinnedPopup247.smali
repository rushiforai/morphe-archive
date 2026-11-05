.class public final Le/e/a/PinnedPopup247;
.super Landroid/widget/RelativeLayout;
.source "PinnedPopup247.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2

    .line 11
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3

    .line 12
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4

    .line 13
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method static pinned(Landroid/view/View;)Z
    .registers 4

    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getId()I

    move-result v0

    const/4 v1, -0x1

    const/4 v2, 0x0

    if-ne v0, v1, :cond_9

    return v2

    .line 17
    :cond_9
    :try_start_9
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p0}, Landroid/view/View;->getId()I

    move-result v1

    invoke-static {v0, v1}, Le/e/a/ResourceNames110;->entry(Landroid/content/res/Resources;I)Ljava/lang/String;

    move-result-object v0
    :try_end_15
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_9 .. :try_end_15} :catch_3a

    .line 18
    const-string v1, "topmenulay"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2d

    const-string v1, "controller"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2d

    const-string v1, "bottommenulay"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_39

    :cond_2d
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    const/4 v0, 0x1

    invoke-static {p0, v0}, Le/e/a/PlayerVisibility192;->enabled(Landroid/content/Context;Z)Z

    move-result p0

    if-eqz p0, :cond_39

    return v0

    :cond_39
    return v2

    .line 17
    :catch_3a
    move-exception p0

    return v2
.end method


# virtual methods
.method public setAlpha(F)V
    .registers 3

    .line 21
    invoke-static {p0}, Le/e/a/PinnedPopup247;->pinned(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_8

    const/high16 p1, 0x3f800000    # 1.0f

    :cond_8
    invoke-super {p0, p1}, Landroid/widget/RelativeLayout;->setAlpha(F)V

    return-void
.end method

.method public setAnimation(Landroid/view/animation/Animation;)V
    .registers 3

    .line 23
    invoke-static {p0}, Le/e/a/PinnedPopup247;->pinned(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_7

    const/4 p1, 0x0

    :cond_7
    invoke-super {p0, p1}, Landroid/widget/RelativeLayout;->setAnimation(Landroid/view/animation/Animation;)V

    return-void
.end method

.method public setVisibility(I)V
    .registers 3

    .line 20
    invoke-static {p0}, Le/e/a/PinnedPopup247;->pinned(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_7

    const/4 p1, 0x0

    :cond_7
    invoke-super {p0, p1}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    return-void
.end method

.method public startAnimation(Landroid/view/animation/Animation;)V
    .registers 3

    .line 22
    invoke-static {p0}, Le/e/a/PinnedPopup247;->pinned(Landroid/view/View;)Z

    move-result v0

    if-nez v0, :cond_9

    invoke-super {p0, p1}, Landroid/widget/RelativeLayout;->startAnimation(Landroid/view/animation/Animation;)V

    :cond_9
    return-void
.end method
