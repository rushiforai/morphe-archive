.class final Le/e/a/PlayerVisibility192$Popup;
.super Ljava/lang/Object;
.source "PlayerVisibility192.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;
.implements Landroid/view/View$OnAttachStateChangeListener;
.implements Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/PlayerVisibility192;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Popup"
.end annotation


# instance fields
.field final controls:[Landroid/view/View;

.field hold:Z

.field final prefs:Landroid/content/SharedPreferences;

.field final root:Landroid/view/View;


# direct methods
.method constructor <init>(Landroid/view/View;)V
    .registers 3

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    const/4 v0, 0x4

    new-array v0, v0, [Landroid/view/View;

    iput-object v0, p0, Le/e/a/PlayerVisibility192$Popup;->controls:[Landroid/view/View;

    .line 14
    iput-object p1, p0, Le/e/a/PlayerVisibility192$Popup;->root:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Le/e/a/PlayerVisibility192$Popup;->prefs:Landroid/content/SharedPreferences;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const/4 v0, 0x1

    invoke-static {p1, v0}, Le/e/a/PlayerVisibility192;->enabled(Landroid/content/Context;Z)Z

    move-result p1

    iput-boolean p1, p0, Le/e/a/PlayerVisibility192$Popup;->hold:Z

    invoke-virtual {p0}, Le/e/a/PlayerVisibility192$Popup;->cache()V

    return-void
.end method


# virtual methods
.method cache()V
    .registers 6

    .line 15
    const-string v0, "viewctrllay"

    const-string v1, "bottommenulay"

    const-string v2, "topmenulay"

    const-string v3, "controller"

    filled-new-array {v2, v3, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_d
    const/4 v2, 0x4

    if-lt v1, v2, :cond_11

    return-void

    :cond_11
    iget-object v2, p0, Le/e/a/PlayerVisibility192$Popup;->controls:[Landroid/view/View;

    aget-object v2, v2, v1

    if-nez v2, :cond_23

    iget-object v2, p0, Le/e/a/PlayerVisibility192$Popup;->controls:[Landroid/view/View;

    iget-object v3, p0, Le/e/a/PlayerVisibility192$Popup;->root:Landroid/view/View;

    aget-object v4, v0, v1

    invoke-static {v3, v4}, Le/e/a/PlayerVisibility192;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v3

    aput-object v3, v2, v1

    :cond_23
    add-int/lit8 v1, v1, 0x1

    goto :goto_d
.end method

.method public onGlobalLayout()V
    .registers 1

    .line 16
    invoke-virtual {p0}, Le/e/a/PlayerVisibility192$Popup;->cache()V

    invoke-virtual {p0}, Le/e/a/PlayerVisibility192$Popup;->update()V

    return-void
.end method

.method public onPreDraw()Z
    .locals 3
    iget-object v0, p0, Le/e/a/PlayerVisibility192$Popup;->root:Landroid/view/View;
    iget-object v1, p0, Le/e/a/PlayerVisibility192$Popup;->controls:[Landroid/view/View;
    iget-boolean v2, p0, Le/e/a/PlayerVisibility192$Popup;->hold:Z
    invoke-static {v0, v1, v2}, Le/e/a/PopupVisibility246;->draw(Landroid/view/View;[Landroid/view/View;Z)Z
    move-result v0
    return v0
.end method

.method public onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .registers 3

    .line 20
    const-string p1, "player_controls_visibility_mode"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_12

    iget-object p1, p0, Le/e/a/PlayerVisibility192$Popup;->root:Landroid/view/View;

    new-instance p2, Le/e/a/PlayerVisibility192$Popup$$ExternalSyntheticLambda0;

    invoke-direct {p2, p0}, Le/e/a/PlayerVisibility192$Popup$$ExternalSyntheticLambda0;-><init>(Le/e/a/PlayerVisibility192$Popup;)V

    invoke-virtual {p1, p2}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    :cond_12
    return-void
.end method

.method public onViewAttachedToWindow(Landroid/view/View;)V
    .registers 3

    .line 21
    iget-object v0, p0, Le/e/a/PlayerVisibility192$Popup;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v0, p0}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_1d

    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    :cond_1d
    invoke-virtual {p0}, Le/e/a/PlayerVisibility192$Popup;->update()V

    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .registers 3

    .line 22
    iget-object v0, p0, Le/e/a/PlayerVisibility192$Popup;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v0, p0}, Landroid/content/SharedPreferences;->unregisterOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_1d

    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    :cond_1d
    return-void
.end method

.method show()V
    .registers 8

    .line 18
    iget-object v0, p0, Le/e/a/PlayerVisibility192$Popup;->controls:[Landroid/view/View;

    array-length v1, v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_5
    if-lt v3, v1, :cond_8

    return-void

    :cond_8
    const/4 v4, 0x2

    if-eq v3, v4, :cond_35

    aget-object v4, v0, v3

    if-eqz v4, :cond_35

    invoke-virtual {v4}, Landroid/view/View;->getVisibility()I

    move-result v5

    const/high16 v6, 0x3f800000    # 1.0f

    if-nez v5, :cond_25

    invoke-virtual {v4}, Landroid/view/View;->getAlpha()F

    move-result v5

    cmpl-float v5, v5, v6

    if-nez v5, :cond_25

    invoke-virtual {v4}, Landroid/view/View;->getAnimation()Landroid/view/animation/Animation;

    move-result-object v5

    if-eqz v5, :cond_35

    :cond_25
    invoke-virtual {v4}, Landroid/view/View;->clearAnimation()V

    invoke-virtual {v4}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/ViewPropertyAnimator;->cancel()V

    invoke-virtual {v4, v6}, Landroid/view/View;->setAlpha(F)V

    invoke-virtual {v4, v2}, Landroid/view/View;->setVisibility(I)V

    :cond_35
    add-int/lit8 v3, v3, 0x1

    goto :goto_5
.end method

.method update()V
    .registers 3

    .line 19
    iget-object v0, p0, Le/e/a/PlayerVisibility192$Popup;->root:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v0, v1}, Le/e/a/PlayerVisibility192;->enabled(Landroid/content/Context;Z)Z

    move-result v0

    iput-boolean v0, p0, Le/e/a/PlayerVisibility192$Popup;->hold:Z

    iget-object v0, p0, Le/e/a/PlayerVisibility192$Popup;->root:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v1

    if-eqz v1, :cond_1f

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    :cond_1f
    iget-boolean v0, p0, Le/e/a/PlayerVisibility192$Popup;->hold:Z

    if-eqz v0, :cond_26

    invoke-virtual {p0}, Le/e/a/PlayerVisibility192$Popup;->show()V

    :cond_26
    return-void
.end method
