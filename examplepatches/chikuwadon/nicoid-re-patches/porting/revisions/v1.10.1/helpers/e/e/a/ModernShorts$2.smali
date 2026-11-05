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

    .line 811
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    .line 812
    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .registers 4

    .line 847
    # getter for: Le/e/a/ModernShorts;->STATES:Ljava/util/WeakHashMap;
    invoke-static {}, Le/e/a/ModernShorts;->access$1()Ljava/util/WeakHashMap;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/ModernShorts$State;

    # getter for: Le/e/a/ModernShorts;->MENU_STATE:Ljava/util/WeakHashMap;
    invoke-static {}, Le/e/a/ModernShorts;->access$6()Ljava/util/WeakHashMap;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 848
    if-eqz v0, :cond_44

    const/4 v1, 0x1

    iput-boolean v1, v0, Le/e/a/ModernShorts$State;->dead:Z

    # invokes: Le/e/a/ModernShorts;->cancelRequest(Le/e/a/ModernShorts$State;)V
    invoke-static {v0}, Le/e/a/ModernShorts;->access$10(Le/e/a/ModernShorts$State;)V

    const/4 v1, 0x0

    iput-object v1, v0, Le/e/a/ModernShorts$State;->resumeRequest:Ljava/lang/Runnable;

    iput-object v1, v0, Le/e/a/ModernShorts$State;->redraw:Ljava/lang/Runnable;

    invoke-static {p1}, Le/e/a/ShortImages;->cancel(Landroid/app/Activity;)V

    iget-object v1, v0, Le/e/a/ModernShorts$State;->listener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    if-eqz v1, :cond_44

    .line 849
    const v1, 0x1020002

    invoke-virtual {p1, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p1

    .line 850
    invoke-virtual {p1}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v1

    if-eqz v1, :cond_44

    iget-object v1, v0, Le/e/a/ModernShorts$State;->listener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    invoke-virtual {p1, v1}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 851
    iget-object v1, v0, Le/e/a/ModernShorts$State;->controlsListener:Landroid/view/ViewTreeObserver$OnPreDrawListener;

    if-eqz v1, :cond_44

    iget-object v0, v0, Le/e/a/ModernShorts$State;->controlsListener:Landroid/view/ViewTreeObserver$OnPreDrawListener;

    invoke-virtual {p1, v0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 853
    :cond_44
    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .registers 5

    .line 837
    # getter for: Le/e/a/ModernShorts;->REFRESH_MONITORS:Ljava/util/WeakHashMap;
    invoke-static {}, Le/e/a/ModernShorts;->access$4()Ljava/util/WeakHashMap;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 838
    # getter for: Le/e/a/ModernShorts;->REFRESH_MONITORS:Ljava/util/WeakHashMap;
    invoke-static {}, Le/e/a/ModernShorts;->access$4()Ljava/util/WeakHashMap;

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

    .line 839
    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .registers 12

    .line 815
    # getter for: Le/e/a/ModernShorts;->STATES:Ljava/util/WeakHashMap;
    invoke-static {}, Le/e/a/ModernShorts;->access$1()Ljava/util/WeakHashMap;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/ModernShorts$State;

    .line 816
    const/4 v1, 0x0

    if-eqz v0, :cond_13

    iget-boolean v2, v0, Le/e/a/ModernShorts$State;->home:Z

    if-eqz v2, :cond_13

    iput-boolean v1, v0, Le/e/a/ModernShorts$State;->launching:Z

    .line 817
    :cond_13
    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v0, :cond_92

    iget-boolean v4, v0, Le/e/a/ModernShorts$State;->dead:Z

    if-nez v4, :cond_92

    .line 818
    iget-boolean v4, v0, Le/e/a/ModernShorts$State;->returnFromNormal:Z

    if-eqz v4, :cond_7a

    iget-boolean v4, v0, Le/e/a/ModernShorts$State;->home:Z

    if-nez v4, :cond_7a

    iput-boolean v1, v0, Le/e/a/ModernShorts$State;->returnFromNormal:Z

    iget-object v2, v0, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    # invokes: Le/e/a/ModernShorts;->remember(Le/e/a/ModernShorts$Feed;)V
    invoke-static {v2}, Le/e/a/ModernShorts;->access$2(Le/e/a/ModernShorts$Feed;)V

    iget-object v2, v0, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    iget-object v2, v2, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    iget v4, v0, Le/e/a/ModernShorts$State;->index:I

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le/e/a/ModernShorts$Item;

    iget-object v2, v2, Le/e/a/ModernShorts$Item;->id:Ljava/lang/String;

    # invokes: Le/e/a/ModernShorts;->player(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;
    invoke-static {p1, v2}, Le/e/a/ModernShorts;->access$3(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v2

    const-string v4, "nicoid_re_shorts"

    invoke-virtual {v2, v4, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v2

    iget-object v3, v0, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    iget-object v3, v3, Le/e/a/ModernShorts$Feed;->key:Ljava/lang/String;

    const-string v4, "nicoid_re_shorts_session"

    invoke-virtual {v2, v4, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v2

    const-string v3, "nicoid_re_shorts_index"

    iget v4, v0, Le/e/a/ModernShorts$State;->index:I

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v2

    iget-object v3, v0, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    iget-object v3, v3, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    iget v4, v0, Le/e/a/ModernShorts$State;->index:I

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Le/e/a/ModernShorts$Item;

    iget-object v3, v3, Le/e/a/ModernShorts$Item;->title:Ljava/lang/String;

    const-string v4, "title"

    invoke-virtual {v2, v4, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v2

    const-string v3, "nicoid_resume_position"

    iget-wide v4, v0, Le/e/a/ModernShorts$State;->returnPosition:J

    invoke-virtual {v2, v3, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    invoke-virtual {p1}, Landroid/app/Activity;->finish()V

    invoke-virtual {p1, v1, v1}, Landroid/app/Activity;->overridePendingTransition(II)V

    return-void

    .line 819
    :cond_7a
    iget-object v4, v0, Le/e/a/ModernShorts$State;->redraw:Ljava/lang/Runnable;

    if-eqz v4, :cond_83

    iget-object v4, v0, Le/e/a/ModernShorts$State;->redraw:Ljava/lang/Runnable;

    invoke-interface {v4}, Ljava/lang/Runnable;->run()V

    .line 820
    :cond_83
    iget-boolean v4, v0, Le/e/a/ModernShorts$State;->busy:Z

    if-nez v4, :cond_92

    iget-object v4, v0, Le/e/a/ModernShorts$State;->resumeRequest:Ljava/lang/Runnable;

    if-eqz v4, :cond_92

    .line 821
    iget-object v4, v0, Le/e/a/ModernShorts$State;->resumeRequest:Ljava/lang/Runnable;

    iput-object v2, v0, Le/e/a/ModernShorts$State;->resumeRequest:Ljava/lang/Runnable;

    invoke-interface {v4}, Ljava/lang/Runnable;->run()V

    .line 824
    :cond_92
    invoke-static {p1}, Le/e/a/ShortImages;->resume(Landroid/app/Activity;)V

    .line 825
    # getter for: Le/e/a/ModernShorts;->REFRESH_MONITORS:Ljava/util/WeakHashMap;
    invoke-static {}, Le/e/a/ModernShorts;->access$4()Ljava/util/WeakHashMap;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_af

    # getter for: Le/e/a/ModernShorts;->REFRESH_MONITORS:Ljava/util/WeakHashMap;
    invoke-static {}, Le/e/a/ModernShorts;->access$4()Ljava/util/WeakHashMap;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    add-int/2addr v0, v3

    goto :goto_b0

    :cond_af
    const/4 v0, 0x1

    .line 826
    :goto_b0
    # getter for: Le/e/a/ModernShorts;->REFRESH_MONITORS:Ljava/util/WeakHashMap;
    invoke-static {}, Le/e/a/ModernShorts;->access$4()Ljava/util/WeakHashMap;

    move-result-object v4

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, p1, v5}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    # invokes: Le/e/a/ModernShorts;->monitorRefresh(Landroid/app/Activity;I)V
    invoke-static {p1, v0}, Le/e/a/ModernShorts;->access$5(Landroid/app/Activity;I)V

    .line 827
    # getter for: Le/e/a/ModernShorts;->MENU_STATE:Ljava/util/WeakHashMap;
    invoke-static {}, Le/e/a/ModernShorts;->access$6()Ljava/util/WeakHashMap;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    # invokes: Le/e/a/ModernShorts;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    invoke-static {p1}, Le/e/a/ModernShorts;->access$7(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v4

    const-string v5, "show_shorts_menu"

    invoke-interface {v4, v5, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    .line 828
    if-eqz v0, :cond_114

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eq v0, v4, :cond_114

    .line 829
    const-string v0, "menu_listview"

    # invokes: Le/e/a/ModernShorts;->find(Landroid/app/Activity;Ljava/lang/String;)Landroid/view/View;
    invoke-static {p1, v0}, Le/e/a/ModernShorts;->access$8(Landroid/app/Activity;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    .line 830
    instance-of v5, v0, Landroid/widget/ListView;

    if-eqz v5, :cond_109

    .line 831
    :try_start_e4
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
    :try_end_104
    .catch Ljava/lang/Exception; {:try_start_e4 .. :try_end_104} :catch_105

    .line 832
    goto :goto_109

    :catch_105
    move-exception v0

    # invokes: Le/e/a/ModernShorts;->log(Ljava/lang/Exception;)V
    invoke-static {v0}, Le/e/a/ModernShorts;->access$9(Ljava/lang/Exception;)V

    .line 833
    :cond_109
    :goto_109
    # getter for: Le/e/a/ModernShorts;->MENU_STATE:Ljava/util/WeakHashMap;
    invoke-static {}, Le/e/a/ModernShorts;->access$6()Ljava/util/WeakHashMap;

    move-result-object v0

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 835
    :cond_114
    return-void
.end method

.method public onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    .line 845
    return-void
.end method

.method public onActivityStarted(Landroid/app/Activity;)V
    .registers 2

    .line 813
    return-void
.end method

.method public onActivityStopped(Landroid/app/Activity;)V
    .registers 4

    .line 841
    # getter for: Le/e/a/ModernShorts;->STATES:Ljava/util/WeakHashMap;
    invoke-static {}, Le/e/a/ModernShorts;->access$1()Ljava/util/WeakHashMap;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/ModernShorts$State;

    .line 842
    if-eqz v0, :cond_1a

    # invokes: Le/e/a/ModernShorts;->cancelRequest(Le/e/a/ModernShorts$State;)V
    invoke-static {v0}, Le/e/a/ModernShorts;->access$10(Le/e/a/ModernShorts$State;)V

    iget-object v1, v0, Le/e/a/ModernShorts$State;->progress:Landroid/widget/ProgressBar;

    if-eqz v1, :cond_1a

    iget-object v0, v0, Le/e/a/ModernShorts$State;->progress:Landroid/widget/ProgressBar;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 843
    :cond_1a
    invoke-static {p1}, Le/e/a/ShortImages;->cancel(Landroid/app/Activity;)V

    .line 844
    return-void
.end method
