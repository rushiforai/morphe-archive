.class final Le/e/a/DetailActions195$Binding;
.super Ljava/lang/Object;
.source "DetailActions195.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;
.implements Landroid/view/View$OnAttachStateChangeListener;
.implements Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/DetailActions195;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Binding"
.end annotation


# instance fields
.field final prefs:Landroid/content/SharedPreferences;

.field final root:Ljava/lang/ref/WeakReference;
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

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Le/e/a/DetailActions195$Binding;->root:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    iput-object p1, p0, Le/e/a/DetailActions195$Binding;->prefs:Landroid/content/SharedPreferences;

    return-void
.end method


# virtual methods
.method synthetic lambda$0$e-e-a-DetailActions195$Binding()V
    .registers 1

    .line 22
    invoke-virtual {p0}, Le/e/a/DetailActions195$Binding;->update()V

    return-void
.end method

.method public onGlobalLayout()V
    .registers 1

    .line 22
    invoke-virtual {p0}, Le/e/a/DetailActions195$Binding;->update()V

    return-void
.end method

.method public onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .registers 3

    .line 22
    sget-object p1, Le/e/a/DetailActions195;->KEYS:[Ljava/lang/String;

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1e

    iget-object p1, p0, Le/e/a/DetailActions195$Binding;->root:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    if-eqz p1, :cond_1e

    new-instance p2, Le/e/a/DetailActions195$Binding$$ExternalSyntheticLambda0;

    invoke-direct {p2, p0}, Le/e/a/DetailActions195$Binding$$ExternalSyntheticLambda0;-><init>(Le/e/a/DetailActions195$Binding;)V

    invoke-virtual {p1, p2}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    :cond_1e
    return-void
.end method

.method public onViewAttachedToWindow(Landroid/view/View;)V
    .registers 3

    .line 23
    iget-object v0, p0, Le/e/a/DetailActions195$Binding;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v0, p0}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    invoke-virtual {p0}, Le/e/a/DetailActions195$Binding;->update()V

    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .registers 3

    .line 24
    iget-object v0, p0, Le/e/a/DetailActions195$Binding;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v0, p0}, Landroid/content/SharedPreferences;->unregisterOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_16

    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    :cond_16
    return-void
.end method

.method update()V
    .registers 8

    .line 21
    iget-object v0, p0, Le/e/a/DetailActions195$Binding;->root:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-nez v0, :cond_b

    return-void

    :cond_b
    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_d
    const/4 v3, 0x3

    if-lt v2, v3, :cond_11

    return-void

    :cond_11
    sget-object v3, Le/e/a/DetailActions195;->TAGS:[Ljava/lang/String;

    aget-object v3, v3, v2

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_35

    iget-object v4, p0, Le/e/a/DetailActions195$Binding;->prefs:Landroid/content/SharedPreferences;

    sget-object v5, Le/e/a/DetailActions195;->KEYS:[Ljava/lang/String;

    aget-object v5, v5, v2

    const/4 v6, 0x1

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    if-eqz v4, :cond_2a

    const/4 v4, 0x0

    goto :goto_2c

    :cond_2a
    const/16 v4, 0x8

    :goto_2c
    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    move-result v5

    if-eq v5, v4, :cond_35

    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    :cond_35
    add-int/lit8 v2, v2, 0x1

    goto :goto_d
.end method
