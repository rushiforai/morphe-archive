.class final Le/e/a/Revision201$Watch;
.super Ljava/lang/Object;
.source "Revision201.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;
.implements Landroid/view/View$OnAttachStateChangeListener;
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/Revision201;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Watch"
.end annotation


# instance fields
.field initial:Z

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

    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 85
    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/Revision201$Watch;->initial:Z

    .line 86
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Le/e/a/Revision201$Watch;->root:Ljava/lang/ref/WeakReference;

    return-void
.end method


# virtual methods
.method add()V
    .registers 3

    .line 87
    iget-object v0, p0, Le/e/a/Revision201$Watch;->root:Ljava/lang/ref/WeakReference;

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

.method enforce(Landroid/view/View;)V
    .registers 11

    .line 89
    invoke-static {p1}, Le/e/a/Revision201;->normalFrame(Landroid/view/View;)V

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "player_buttons_hidden_v1"

    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getStringSet(Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_19
    :goto_19
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_20

    return-void

    :cond_20
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    :try_start_26
    const-string v2, "PlayerControls194"

    const-string v3, "button"

    const/4 v4, 0x2

    new-array v5, v4, [Ljava/lang/Class;

    const-class v6, Landroid/view/View;

    const/4 v7, 0x0

    aput-object v6, v5, v7

    const-class v6, Ljava/lang/String;

    const/4 v8, 0x1

    aput-object v6, v5, v8

    new-array v4, v4, [Ljava/lang/Object;

    aput-object p1, v4, v7

    aput-object v1, v4, v8

    invoke-static {v2, v3, v5, v4}, Le/e/a/Revision201;->call(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    instance-of v2, v1, Landroid/view/View;

    if-eqz v2, :cond_19

    move-object v2, v1

    check-cast v2, Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v2

    const/16 v3, 0x8

    if-eq v2, v3, :cond_19

    check-cast v1, Landroid/view/View;

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V
    :try_end_55
    .catch Ljava/lang/Exception; {:try_start_26 .. :try_end_55} :catch_56

    goto :goto_19

    :catch_56
    move-exception v1

    goto :goto_19
.end method

.method public onPreDraw()Z
    .registers 3

    .line 90
    iget-object v0, p0, Le/e/a/Revision201$Watch;->root:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-eqz v0, :cond_17

    iget-boolean v1, p0, Le/e/a/Revision201$Watch;->initial:Z

    if-eqz v1, :cond_14

    const/4 v1, 0x0

    iput-boolean v1, p0, Le/e/a/Revision201$Watch;->initial:Z

    invoke-virtual {p0}, Le/e/a/Revision201$Watch;->run()V

    :cond_14
    invoke-virtual {p0, v0}, Le/e/a/Revision201$Watch;->enforce(Landroid/view/View;)V

    :cond_17
    const/4 v0, 0x1

    return v0
.end method

.method public onViewAttachedToWindow(Landroid/view/View;)V
    .registers 3

    .line 91
    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/Revision201$Watch;->initial:Z

    invoke-virtual {p0}, Le/e/a/Revision201$Watch;->add()V

    invoke-virtual {p1, p0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .registers 3

    .line 92
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

.method public run()V
    .registers 10

    .line 88
    iget-object v0, p0, Le/e/a/Revision201$Watch;->root:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-nez v0, :cond_b

    return-void

    :cond_b
    const-string v1, "topmenulay"

    invoke-static {v0, v1}, Le/e/a/Revision201;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v1

    :try_start_11
    instance-of v2, v1, Landroid/widget/LinearLayout;

    if-eqz v2, :cond_31

    const-string v2, "PlayerControls194"

    const-string v3, "arrange"

    const/4 v4, 0x2

    new-array v5, v4, [Ljava/lang/Class;

    const-class v6, Landroid/widget/LinearLayout;

    const/4 v7, 0x0

    aput-object v6, v5, v7

    const-class v6, Landroid/view/View;

    const/4 v8, 0x1

    aput-object v6, v5, v8

    new-array v4, v4, [Ljava/lang/Object;

    aput-object v1, v4, v7

    aput-object v0, v4, v8

    invoke-static {v2, v3, v5, v4}, Le/e/a/Revision201;->call(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2f
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_2f} :catch_30

    goto :goto_31

    :catch_30
    move-exception v1

    :cond_31
    :goto_31
    invoke-virtual {p0, v0}, Le/e/a/Revision201$Watch;->enforce(Landroid/view/View;)V

    return-void
.end method
