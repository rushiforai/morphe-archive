.class final Le/e/a/PortraitTimeline213$State;
.super Ljava/lang/Object;
.source "PortraitTimeline213.java"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;
.implements Landroid/view/View$OnLayoutChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/PortraitTimeline213;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "State"
.end annotation


# instance fields
.field final autoHost:Landroid/view/ViewGroup;

.field final bg:Landroid/graphics/drawable/Drawable;

.field final bottom:Landroid/view/View;

.field final bottomParams:Landroid/view/ViewGroup$LayoutParams;

.field final controller:Landroid/view/View;

.field final frame:Landroid/widget/RelativeLayout;

.field final index:I

.field final original:Landroid/view/ViewGroup$LayoutParams;

.field final parent:Landroid/view/ViewGroup;

.field final root:Landroid/view/View;


# direct methods
.method constructor <init>(Landroid/view/View;Landroid/widget/RelativeLayout;Landroid/view/View;)V
    .registers 7

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/PortraitTimeline213$State;->root:Landroid/view/View;

    iput-object p2, p0, Le/e/a/PortraitTimeline213$State;->frame:Landroid/widget/RelativeLayout;

    iput-object p3, p0, Le/e/a/PortraitTimeline213$State;->controller:Landroid/view/View;

    invoke-virtual {p3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Le/e/a/PortraitTimeline213$State;->parent:Landroid/view/ViewGroup;

    const-string v1, "statuslay"

    invoke-static {p1, v1}, Le/e/a/PortraitTimeline213;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v1

    instance-of v2, v1, Landroid/widget/RelativeLayout;

    if-eqz v2, :cond_24

    invoke-static {v1, p2}, Le/e/a/PortraitTimeline213$State;->inside(Landroid/view/View;Landroid/view/View;)Z

    move-result v2

    if-eqz v2, :cond_24

    move-object p2, v1

    check-cast p2, Landroid/view/ViewGroup;

    :cond_24
    iput-object p2, p0, Le/e/a/PortraitTimeline213$State;->autoHost:Landroid/view/ViewGroup;

    invoke-virtual {v0, p3}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result p2

    iput p2, p0, Le/e/a/PortraitTimeline213$State;->index:I

    invoke-virtual {p3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p2

    invoke-static {p2}, Le/e/a/PortraitTimeline213;->copy(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object p2

    iput-object p2, p0, Le/e/a/PortraitTimeline213$State;->original:Landroid/view/ViewGroup$LayoutParams;

    invoke-virtual {p3}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p2

    iput-object p2, p0, Le/e/a/PortraitTimeline213$State;->bg:Landroid/graphics/drawable/Drawable;

    const-string p2, "bottommenulay"

    invoke-static {p1, p2}, Le/e/a/PortraitTimeline213;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Le/e/a/PortraitTimeline213$State;->bottom:Landroid/view/View;

    if-nez p2, :cond_48

    const/4 p2, 0x0

    goto :goto_50

    :cond_48
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p2

    invoke-static {p2}, Le/e/a/PortraitTimeline213;->copy(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object p2

    :goto_50
    iput-object p2, p0, Le/e/a/PortraitTimeline213$State;->bottomParams:Landroid/view/ViewGroup$LayoutParams;

    invoke-virtual {p1, p0}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    invoke-virtual {p3, p0}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    invoke-virtual {p0}, Le/e/a/PortraitTimeline213$State;->place()V

    return-void
.end method

.method static inside(Landroid/view/View;Landroid/view/View;)Z
    .registers 3

    :goto_0
    if-nez p0, :cond_4

    const/4 p0, 0x0

    return p0

    :cond_4
    if-ne p0, p1, :cond_8

    const/4 p0, 0x1

    return p0

    .line 13
    :cond_8
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    instance-of v0, p0, Landroid/view/View;

    if-eqz v0, :cond_13

    check-cast p0, Landroid/view/View;

    goto :goto_0

    :cond_13
    const/4 p0, 0x0

    goto :goto_0
.end method


# virtual methods
.method apply()V
    .registers 6

    .line 15
    invoke-virtual {p0}, Le/e/a/PortraitTimeline213$State;->place()V

    iget-object v0, p0, Le/e/a/PortraitTimeline213$State;->controller:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    iget-object v0, p0, Le/e/a/PortraitTimeline213$State;->controller:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationX(F)V

    iget-object v0, p0, Le/e/a/PortraitTimeline213$State;->controller:Landroid/view/View;

    const/high16 v1, -0x67000000

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    iget-object v0, p0, Le/e/a/PortraitTimeline213$State;->controller:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->bringToFront()V

    iget-object v0, p0, Le/e/a/PortraitTimeline213$State;->bottom:Landroid/view/View;

    if-eqz v0, :cond_5e

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    instance-of v0, v0, Landroid/widget/RelativeLayout$LayoutParams;

    if-eqz v0, :cond_5e

    iget-object v0, p0, Le/e/a/PortraitTimeline213$State;->bottom:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    iget-object v1, p0, Le/e/a/PortraitTimeline213$State;->controller:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v1

    iget-object v2, p0, Le/e/a/PortraitTimeline213$State;->controller:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    const/4 v2, 0x2

    invoke-virtual {v0, v2}, Landroid/widget/RelativeLayout$LayoutParams;->getRule(I)I

    move-result v3

    const/16 v4, 0xc

    if-nez v3, :cond_51

    invoke-virtual {v0, v4}, Landroid/widget/RelativeLayout$LayoutParams;->getRule(I)I

    move-result v3

    if-eqz v3, :cond_51

    iget v3, v0, Landroid/widget/RelativeLayout$LayoutParams;->bottomMargin:I

    if-eq v3, v1, :cond_5e

    :cond_51
    invoke-virtual {v0, v2}, Landroid/widget/RelativeLayout$LayoutParams;->removeRule(I)V

    invoke-virtual {v0, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    iput v1, v0, Landroid/widget/RelativeLayout$LayoutParams;->bottomMargin:I

    iget-object v1, p0, Le/e/a/PortraitTimeline213$State;->bottom:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_5e
    return-void
.end method

.method public onLayoutChange(Landroid/view/View;IIIIIIII)V
    .registers 10

    .line 17
    invoke-virtual {p0}, Le/e/a/PortraitTimeline213$State;->apply()V

    return-void
.end method

.method public onViewAttachedToWindow(Landroid/view/View;)V
    .registers 2

    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .registers 2

    .line 18
    iget-object p1, p0, Le/e/a/PortraitTimeline213$State;->root:Landroid/view/View;

    invoke-static {p1}, Le/e/a/PortraitTimeline213;->restore(Landroid/view/View;)V

    return-void
.end method

.method place()V
    .registers 7

    .line 14
    iget-object v0, p0, Le/e/a/PortraitTimeline213$State;->root:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/PlayerControlsDock;->enabled(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_f

    iget-object v0, p0, Le/e/a/PortraitTimeline213$State;->frame:Landroid/widget/RelativeLayout;

    goto :goto_11

    :cond_f
    iget-object v0, p0, Le/e/a/PortraitTimeline213$State;->autoHost:Landroid/view/ViewGroup;

    :goto_11
    iget-object v1, p0, Le/e/a/PortraitTimeline213$State;->controller:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    iget-object v2, p0, Le/e/a/PortraitTimeline213$State;->controller:Landroid/view/View;

    const/4 v3, -0x2

    const/4 v4, -0x1

    const/16 v5, 0xc

    if-ne v1, v0, :cond_48

    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    instance-of v0, v0, Landroid/widget/RelativeLayout$LayoutParams;

    if-eqz v0, :cond_30

    iget-object v0, p0, Le/e/a/PortraitTimeline213$State;->controller:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    goto :goto_31

    :cond_30
    const/4 v0, 0x0

    :goto_31
    if-eqz v0, :cond_3a

    invoke-virtual {v0, v5}, Landroid/widget/RelativeLayout$LayoutParams;->getRule(I)I

    move-result v0

    if-eqz v0, :cond_3a

    return-void

    :cond_3a
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v4, v3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v5}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    iget-object v1, p0, Le/e/a/PortraitTimeline213$State;->controller:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void

    :cond_48
    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    instance-of v2, v1, Landroid/view/ViewGroup;

    if-eqz v2, :cond_57

    check-cast v1, Landroid/view/ViewGroup;

    iget-object v2, p0, Le/e/a/PortraitTimeline213$State;->controller:Landroid/view/View;

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_57
    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v1, v4, v3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v5}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    iget-object v2, p0, Le/e/a/PortraitTimeline213$State;->controller:Landroid/view/View;

    invoke-virtual {v0, v2, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method restore()V
    .registers 5

    .line 16
    iget-object v0, p0, Le/e/a/PortraitTimeline213$State;->root:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    iget-object v0, p0, Le/e/a/PortraitTimeline213$State;->controller:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    iget-object v0, p0, Le/e/a/PortraitTimeline213$State;->bottom:Landroid/view/View;

    if-eqz v0, :cond_15

    iget-object v1, p0, Le/e/a/PortraitTimeline213$State;->bottomParams:Landroid/view/ViewGroup$LayoutParams;

    if-eqz v1, :cond_15

    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_15
    iget-object v0, p0, Le/e/a/PortraitTimeline213$State;->controller:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    iget-object v1, p0, Le/e/a/PortraitTimeline213$State;->frame:Landroid/widget/RelativeLayout;

    if-eq v0, v1, :cond_29

    iget-object v0, p0, Le/e/a/PortraitTimeline213$State;->controller:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    iget-object v1, p0, Le/e/a/PortraitTimeline213$State;->autoHost:Landroid/view/ViewGroup;

    if-ne v0, v1, :cond_49

    :cond_29
    iget-object v0, p0, Le/e/a/PortraitTimeline213$State;->controller:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iget-object v1, p0, Le/e/a/PortraitTimeline213$State;->controller:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    iget-object v0, p0, Le/e/a/PortraitTimeline213$State;->parent:Landroid/view/ViewGroup;

    iget-object v1, p0, Le/e/a/PortraitTimeline213$State;->controller:Landroid/view/View;

    iget v2, p0, Le/e/a/PortraitTimeline213$State;->index:I

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    iget-object v3, p0, Le/e/a/PortraitTimeline213$State;->original:Landroid/view/ViewGroup$LayoutParams;

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    :cond_49
    iget-object v0, p0, Le/e/a/PortraitTimeline213$State;->controller:Landroid/view/View;

    iget-object v1, p0, Le/e/a/PortraitTimeline213$State;->bg:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method
