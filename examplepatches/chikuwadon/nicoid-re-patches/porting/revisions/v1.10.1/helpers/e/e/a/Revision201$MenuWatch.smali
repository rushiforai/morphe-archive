.class final Le/e/a/Revision201$MenuWatch;
.super Ljava/lang/Object;
.source "Revision201.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;
.implements Landroid/view/View$OnAttachStateChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/Revision201;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "MenuWatch"
.end annotation


# instance fields
.field final button:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/view/View;)V
    .registers 3

    .line 123
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Le/e/a/Revision201$MenuWatch;->button:Ljava/lang/ref/WeakReference;

    return-void
.end method


# virtual methods
.method add()V
    .registers 3

    .line 124
    iget-object v0, p0, Le/e/a/Revision201$MenuWatch;->button:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-eqz v0, :cond_22

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v1

    if-eqz v1, :cond_22

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    :cond_22
    return-void
.end method

.method public onPreDraw()Z
    .registers 9

    .line 125
    iget-object v0, p0, Le/e/a/Revision201$MenuWatch;->button:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-eqz v0, :cond_c0

    invoke-virtual {v0}, Landroid/view/View;->isShown()Z

    move-result v1

    if-eqz v1, :cond_c0

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Le/e/a/PanelUi;->ink(Landroid/content/Context;)I

    move-result v1

    instance-of v2, v0, Landroid/widget/TextView;

    if-eqz v2, :cond_28

    move-object v2, v0

    check-cast v2, Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getCurrentTextColor()I

    move-result v3

    if-eq v3, v1, :cond_28

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setTextColor(I)V

    :cond_28
    const/4 v1, 0x0

    move-object v2, v0

    :goto_2a
    const/4 v3, 0x4

    if-ge v1, v3, :cond_c0

    if-nez v2, :cond_31

    goto/16 :goto_c0

    :cond_31
    :try_start_31
    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v2}, Landroid/view/View;->getId()I

    move-result v4

    invoke-static {v3, v4}, Le/e/a/ResourceNames110;->entry(Landroid/content/res/Resources;I)Ljava/lang/String;
    :try_end_3c
    .catch Ljava/lang/Exception; {:try_start_31 .. :try_end_3c} :catch_3d

    goto :goto_3e

    :catch_3d
    move-exception v3

    :goto_3e
    if-eq v2, v0, :cond_44

    instance-of v3, v2, Landroid/view/ViewGroup;

    if-eqz v3, :cond_a9

    :cond_44
    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Le/e/a/UiDialogs;->surface(Landroid/content/Context;)I

    move-result v3

    invoke-virtual {v2}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    if-ne v2, v0, :cond_9a

    sget-object v5, Le/e/a/Revision201;->MENU_BG:Ljava/util/Map;

    invoke-interface {v5, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-ne v5, v4, :cond_6a

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    sget-object v5, Le/e/a/Revision201;->MENU_COLOR:Ljava/util/Map;

    invoke-interface {v5, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_a9

    :cond_6a
    new-instance v4, Landroid/graphics/drawable/RippleDrawable;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v5

    const v6, 0xffffff

    and-int/2addr v5, v6

    const/high16 v6, 0x33000000

    or-int/2addr v5, v6

    invoke-static {v5}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v5

    new-instance v6, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v6, v3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    const/4 v7, 0x0

    invoke-direct {v4, v5, v6, v7}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v2, v4}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    sget-object v5, Le/e/a/Revision201;->MENU_BG:Ljava/util/Map;

    invoke-interface {v5, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v4, Le/e/a/Revision201;->MENU_COLOR:Ljava/util/Map;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v4, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_a9

    :cond_9a
    instance-of v5, v4, Landroid/graphics/drawable/ColorDrawable;

    if-eqz v5, :cond_a6

    check-cast v4, Landroid/graphics/drawable/ColorDrawable;

    invoke-virtual {v4}, Landroid/graphics/drawable/ColorDrawable;->getColor()I

    move-result v4

    if-eq v4, v3, :cond_a9

    :cond_a6
    invoke-virtual {v2, v3}, Landroid/view/View;->setBackgroundColor(I)V

    :cond_a9
    :goto_a9
    instance-of v3, v2, Landroid/widget/ScrollView;

    if-nez v3, :cond_c0

    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    instance-of v3, v3, Landroid/view/View;

    if-nez v3, :cond_b6

    goto :goto_c0

    :cond_b6
    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_2a

    :cond_c0
    :goto_c0
    const/4 v0, 0x1

    return v0
.end method

.method public onViewAttachedToWindow(Landroid/view/View;)V
    .registers 2

    .line 126
    invoke-virtual {p0}, Le/e/a/Revision201$MenuWatch;->add()V

    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .registers 3

    .line 127
    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_11

    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    :cond_11
    return-void
.end method
