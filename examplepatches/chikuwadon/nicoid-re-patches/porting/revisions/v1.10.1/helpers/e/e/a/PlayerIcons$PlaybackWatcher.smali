.class final Le/e/a/PlayerIcons$PlaybackWatcher;
.super Ljava/lang/Object;
.source "PlayerIcons.java"

# interfaces
.implements Ljava/lang/Runnable;
.implements Landroid/view/View$OnAttachStateChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/PlayerIcons;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "PlaybackWatcher"
.end annotation


# instance fields
.field final owner:Ljava/lang/ref/WeakReference;
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

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Le/e/a/PlayerIcons$PlaybackWatcher;->owner:Ljava/lang/ref/WeakReference;

    return-void
.end method


# virtual methods
.method public onViewAttachedToWindow(Landroid/view/View;)V
    .registers 2

    .line 29
    invoke-virtual {p1, p0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    invoke-virtual {p1, p0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .registers 3

    .line 30
    invoke-virtual {p1, p0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    const-string v0, "viewbutton"

    # invokes: Le/e/a/PlayerIcons;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    invoke-static {p1, v0}, Le/e/a/PlayerIcons;->access$1(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_12

    # getter for: Le/e/a/PlayerIcons;->PLAYING:Ljava/util/Map;
    invoke-static {}, Le/e/a/PlayerIcons;->access$2()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_12
    return-void
.end method

.method public run()V
    .registers 7

    .line 28
    iget-object v0, p0, Le/e/a/PlayerIcons$PlaybackWatcher;->owner:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-eqz v0, :cond_83

    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v1

    if-nez v1, :cond_12

    goto/16 :goto_83

    :cond_12
    :try_start_12
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    # invokes: Le/e/a/PlayerIcons;->activity(Landroid/content/Context;)Landroid/app/Activity;
    invoke-static {v1}, Le/e/a/PlayerIcons;->access$0(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v1

    const/4 v2, 0x0

    if-nez v1, :cond_1f

    move-object v1, v2

    goto :goto_25

    :cond_1f
    const-string v3, "v"

    invoke-static {v1, v3}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    :goto_25
    if-nez v1, :cond_28

    :goto_27
    goto :goto_2f

    :cond_28
    const-string v2, "a0"

    invoke-static {v1, v2}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    goto :goto_27

    :goto_2f
    const/4 v1, 0x0

    if-eqz v2, :cond_4d

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "isPlaying"

    new-array v5, v1, [Ljava/lang/Class;

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    new-array v4, v1, [Ljava/lang/Object;

    invoke-virtual {v3, v2, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_4d

    const/4 v1, 0x1

    :cond_4d
    const-string v2, "viewbutton"

    # invokes: Le/e/a/PlayerIcons;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    invoke-static {v0, v2}, Le/e/a/PlayerIcons;->access$1(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_7e

    # getter for: Le/e/a/PlayerIcons;->PLAYING:Ljava/util/Map;
    invoke-static {}, Le/e/a/PlayerIcons;->access$2()Ljava/util/Map;

    move-result-object v3

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-static {v3, v4}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_7e

    # getter for: Le/e/a/PlayerIcons;->PLAYING:Ljava/util/Map;
    invoke-static {}, Le/e/a/PlayerIcons;->access$2()Ljava/util/Map;

    move-result-object v3

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-interface {v3, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz v1, :cond_77

    const-string v1, "pause"

    goto :goto_79

    :cond_77
    const-string v1, "play"

    :goto_79
    # invokes: Le/e/a/PlayerIcons;->apply(Landroid/view/View;Ljava/lang/String;)V
    invoke-static {v2, v1}, Le/e/a/PlayerIcons;->access$3(Landroid/view/View;Ljava/lang/String;)V
    :try_end_7c
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_7c} :catch_7d

    goto :goto_7e

    :catch_7d
    move-exception v1

    :cond_7e
    :goto_7e
    const-wide/16 v1, 0x190

    invoke-virtual {v0, p0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_83
    :goto_83
    return-void
.end method
