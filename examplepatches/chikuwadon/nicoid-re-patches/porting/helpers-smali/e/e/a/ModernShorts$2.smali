.class Le/e/a/ModernShorts$2;
.super Ljava/lang/Object;
.source "ModernShorts.java"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/ModernShorts;->register(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 742
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    .line 743
    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .registers 4

    .line 777
    # getter for: Le/e/a/ModernShorts;->STATES:Ljava/util/WeakHashMap;
    invoke-static {}, Le/e/a/ModernShorts;->access$400()Ljava/util/WeakHashMap;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/ModernShorts$State;

    # getter for: Le/e/a/ModernShorts;->MENU_STATE:Ljava/util/WeakHashMap;
    invoke-static {}, Le/e/a/ModernShorts;->access$700()Ljava/util/WeakHashMap;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 778
    if-eqz v0, :cond_44

    const/4 v1, 0x1

    iput-boolean v1, v0, Le/e/a/ModernShorts$State;->dead:Z

    # invokes: Le/e/a/ModernShorts;->cancelRequest(Le/e/a/ModernShorts$State;)V
    invoke-static {v0}, Le/e/a/ModernShorts;->access$1100(Le/e/a/ModernShorts$State;)V

    const/4 v1, 0x0

    iput-object v1, v0, Le/e/a/ModernShorts$State;->resumeRequest:Ljava/lang/Runnable;

    iput-object v1, v0, Le/e/a/ModernShorts$State;->redraw:Ljava/lang/Runnable;

    invoke-static {p1}, Le/e/a/ShortImages;->cancel(Landroid/app/Activity;)V

    iget-object v1, v0, Le/e/a/ModernShorts$State;->listener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    if-eqz v1, :cond_44

    .line 779
    const v1, 0x1020002

    invoke-virtual {p1, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p1

    .line 780
    invoke-virtual {p1}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v1

    if-eqz v1, :cond_44

    iget-object v1, v0, Le/e/a/ModernShorts$State;->listener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    invoke-virtual {p1, v1}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 781
    iget-object v1, v0, Le/e/a/ModernShorts$State;->controlsListener:Landroid/view/ViewTreeObserver$OnPreDrawListener;

    if-eqz v1, :cond_44

    iget-object v0, v0, Le/e/a/ModernShorts$State;->controlsListener:Landroid/view/ViewTreeObserver$OnPreDrawListener;

    invoke-virtual {p1, v0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 783
    :cond_44
    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .registers 5

    .line 767
    # getter for: Le/e/a/ModernShorts;->REFRESH_MONITORS:Ljava/util/WeakHashMap;
    invoke-static {}, Le/e/a/ModernShorts;->access$500()Ljava/util/WeakHashMap;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 768
    # getter for: Le/e/a/ModernShorts;->REFRESH_MONITORS:Ljava/util/WeakHashMap;
    invoke-static {}, Le/e/a/ModernShorts;->access$500()Ljava/util/WeakHashMap;

    move-result-object v1

    const/4 v2, 0x1

    if-nez v0, :cond_12

    goto :goto_17

    :cond_12
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    add-int/2addr v2, v0

    :goto_17
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v1, p1, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 769
    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .registers 12

    .line 746
    # getter for: Le/e/a/ModernShorts;->STATES:Ljava/util/WeakHashMap;
    invoke-static {}, Le/e/a/ModernShorts;->access$400()Ljava/util/WeakHashMap;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/ModernShorts$State;

    .line 747
    const/4 v1, 0x0

    if-eqz v0, :cond_13

    iget-boolean v2, v0, Le/e/a/ModernShorts$State;->home:Z

    if-eqz v2, :cond_13

    iput-boolean v1, v0, Le/e/a/ModernShorts$State;->launching:Z

    .line 748
    :cond_13
    const/4 v2, 0x0

    if-eqz v0, :cond_32

    iget-boolean v3, v0, Le/e/a/ModernShorts$State;->dead:Z

    if-nez v3, :cond_32

    .line 749
    iget-object v3, v0, Le/e/a/ModernShorts$State;->redraw:Ljava/lang/Runnable;

    if-eqz v3, :cond_23

    iget-object v3, v0, Le/e/a/ModernShorts$State;->redraw:Ljava/lang/Runnable;

    invoke-interface {v3}, Ljava/lang/Runnable;->run()V

    .line 750
    :cond_23
    iget-boolean v3, v0, Le/e/a/ModernShorts$State;->busy:Z

    if-nez v3, :cond_32

    iget-object v3, v0, Le/e/a/ModernShorts$State;->resumeRequest:Ljava/lang/Runnable;

    if-eqz v3, :cond_32

    .line 751
    iget-object v3, v0, Le/e/a/ModernShorts$State;->resumeRequest:Ljava/lang/Runnable;

    iput-object v2, v0, Le/e/a/ModernShorts$State;->resumeRequest:Ljava/lang/Runnable;

    invoke-interface {v3}, Ljava/lang/Runnable;->run()V

    .line 754
    :cond_32
    invoke-static {p1}, Le/e/a/ShortImages;->resume(Landroid/app/Activity;)V

    .line 755
    # getter for: Le/e/a/ModernShorts;->REFRESH_MONITORS:Ljava/util/WeakHashMap;
    invoke-static {}, Le/e/a/ModernShorts;->access$500()Ljava/util/WeakHashMap;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    const/4 v3, 0x1

    if-eqz v0, :cond_50

    # getter for: Le/e/a/ModernShorts;->REFRESH_MONITORS:Ljava/util/WeakHashMap;
    invoke-static {}, Le/e/a/ModernShorts;->access$500()Ljava/util/WeakHashMap;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    add-int/2addr v0, v3

    goto :goto_51

    :cond_50
    const/4 v0, 0x1

    .line 756
    :goto_51
    # getter for: Le/e/a/ModernShorts;->REFRESH_MONITORS:Ljava/util/WeakHashMap;
    invoke-static {}, Le/e/a/ModernShorts;->access$500()Ljava/util/WeakHashMap;

    move-result-object v4

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, p1, v5}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    # invokes: Le/e/a/ModernShorts;->monitorRefresh(Landroid/app/Activity;I)V
    invoke-static {p1, v0}, Le/e/a/ModernShorts;->access$600(Landroid/app/Activity;I)V

    .line 757
    # getter for: Le/e/a/ModernShorts;->MENU_STATE:Ljava/util/WeakHashMap;
    invoke-static {}, Le/e/a/ModernShorts;->access$700()Ljava/util/WeakHashMap;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    # invokes: Le/e/a/ModernShorts;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    invoke-static {p1}, Le/e/a/ModernShorts;->access$800(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v4

    const-string v5, "show_shorts_menu"

    invoke-interface {v4, v5, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    .line 758
    if-eqz v0, :cond_b5

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eq v0, v4, :cond_b5

    .line 759
    const-string v0, "menu_listview"

    # invokes: Le/e/a/ModernShorts;->find(Landroid/app/Activity;Ljava/lang/String;)Landroid/view/View;
    invoke-static {p1, v0}, Le/e/a/ModernShorts;->access$900(Landroid/app/Activity;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    .line 760
    instance-of v5, v0, Landroid/widget/ListView;

    if-eqz v5, :cond_aa

    .line 761
    :try_start_85
    const-string v5, "com.sauzask.nicoid.NicoidTopActivity"

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    const-string v6, "a"

    const/4 v7, 0x2

    new-array v8, v7, [Ljava/lang/Class;

    const-class v9, Landroid/content/Context;

    aput-object v9, v8, v1

    const-class v9, Landroid/widget/ListView;

    aput-object v9, v8, v3

    invoke-virtual {v5, v6, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    new-array v6, v7, [Ljava/lang/Object;

    aput-object p1, v6, v1

    aput-object v0, v6, v3

    invoke-virtual {v5, v2, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_a5
    .catch Ljava/lang/Exception; {:try_start_85 .. :try_end_a5} :catch_a6

    .line 762
    goto :goto_aa

    :catch_a6
    move-exception v0

    # invokes: Le/e/a/ModernShorts;->log(Ljava/lang/Exception;)V
    invoke-static {v0}, Le/e/a/ModernShorts;->access$1000(Ljava/lang/Exception;)V

    .line 763
    :cond_aa
    :goto_aa
    # getter for: Le/e/a/ModernShorts;->MENU_STATE:Ljava/util/WeakHashMap;
    invoke-static {}, Le/e/a/ModernShorts;->access$700()Ljava/util/WeakHashMap;

    move-result-object v0

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 765
    :cond_b5
    return-void
.end method

.method public onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    .line 775
    return-void
.end method

.method public onActivityStarted(Landroid/app/Activity;)V
    .registers 2

    .line 744
    return-void
.end method

.method public onActivityStopped(Landroid/app/Activity;)V
    .registers 4

    .line 771
    # getter for: Le/e/a/ModernShorts;->STATES:Ljava/util/WeakHashMap;
    invoke-static {}, Le/e/a/ModernShorts;->access$400()Ljava/util/WeakHashMap;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/ModernShorts$State;

    .line 772
    if-eqz v0, :cond_1a

    # invokes: Le/e/a/ModernShorts;->cancelRequest(Le/e/a/ModernShorts$State;)V
    invoke-static {v0}, Le/e/a/ModernShorts;->access$1100(Le/e/a/ModernShorts$State;)V

    iget-object v1, v0, Le/e/a/ModernShorts$State;->progress:Landroid/widget/ProgressBar;

    if-eqz v1, :cond_1a

    iget-object v0, v0, Le/e/a/ModernShorts$State;->progress:Landroid/widget/ProgressBar;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 773
    :cond_1a
    invoke-static {p1}, Le/e/a/ShortImages;->cancel(Landroid/app/Activity;)V

    .line 774
    return-void
.end method
