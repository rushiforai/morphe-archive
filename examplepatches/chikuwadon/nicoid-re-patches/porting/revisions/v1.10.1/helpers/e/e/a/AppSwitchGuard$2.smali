.class Le/e/a/AppSwitchGuard$2;
.super Ljava/lang/Object;
.source "AppSwitchGuard.java"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/AppSwitchGuard;->track(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    .line 68
    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .registers 4

    .line 87
    # getter for: Le/e/a/AppSwitchGuard;->STOPPED:Ljava/util/WeakHashMap;
    invoke-static {}, Le/e/a/AppSwitchGuard;->access$0()Ljava/util/WeakHashMap;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    # getter for: Le/e/a/AppSwitchGuard;->PENDING:Ljava/util/WeakHashMap;
    invoke-static {}, Le/e/a/AppSwitchGuard;->access$1()Ljava/util/WeakHashMap;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Runnable;

    .line 89
    if-eqz v0, :cond_1a

    # getter for: Le/e/a/AppSwitchGuard;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/AppSwitchGuard;->access$5()Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 90
    :cond_1a
    # getter for: Le/e/a/AppSwitchGuard;->resumed:Ljava/lang/ref/WeakReference;
    invoke-static {}, Le/e/a/AppSwitchGuard;->access$2()Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p1, :cond_2d

    new-instance p1, Ljava/lang/ref/WeakReference;

    const/4 v0, 0x0

    invoke-direct {p1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-static {p1}, Le/e/a/AppSwitchGuard;->access$4(Ljava/lang/ref/WeakReference;)V

    .line 91
    :cond_2d
    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .registers 3

    .line 78
    # getter for: Le/e/a/AppSwitchGuard;->resumed:Ljava/lang/ref/WeakReference;
    invoke-static {}, Le/e/a/AppSwitchGuard;->access$2()Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p1, :cond_13

    new-instance p1, Ljava/lang/ref/WeakReference;

    const/4 v0, 0x0

    invoke-direct {p1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-static {p1}, Le/e/a/AppSwitchGuard;->access$4(Ljava/lang/ref/WeakReference;)V

    .line 79
    :cond_13
    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .registers 5

    .line 71
    # getter for: Le/e/a/AppSwitchGuard;->STOPPED:Ljava/util/WeakHashMap;
    invoke-static {}, Le/e/a/AppSwitchGuard;->access$0()Ljava/util/WeakHashMap;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-static {v0}, Le/e/a/AppSwitchGuard;->access$4(Ljava/lang/ref/WeakReference;)V

    .line 73
    # getter for: Le/e/a/AppSwitchGuard;->PENDING:Ljava/util/WeakHashMap;
    invoke-static {}, Le/e/a/AppSwitchGuard;->access$1()Ljava/util/WeakHashMap;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/WeakHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_2c

    .line 74
    # getter for: Le/e/a/AppSwitchGuard;->PENDING:Ljava/util/WeakHashMap;
    invoke-static {}, Le/e/a/AppSwitchGuard;->access$1()Ljava/util/WeakHashMap;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/WeakHashMap;->clear()V

    .line 75
    invoke-static {p1}, Le/e/a/PlaybackReturn;->foreground(Landroid/app/Activity;)V

    .line 76
    return-void

    .line 73
    :cond_2c
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Runnable;

    # getter for: Le/e/a/AppSwitchGuard;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/AppSwitchGuard;->access$5()Landroid/os/Handler;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    goto :goto_1b
.end method

.method public onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    .line 85
    return-void
.end method

.method public onActivityStarted(Landroid/app/Activity;)V
    .registers 3

    .line 69
    # getter for: Le/e/a/AppSwitchGuard;->STOPPED:Ljava/util/WeakHashMap;
    invoke-static {}, Le/e/a/AppSwitchGuard;->access$0()Ljava/util/WeakHashMap;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public onActivityStopped(Landroid/app/Activity;)V
    .registers 5

    .line 81
    # getter for: Le/e/a/AppSwitchGuard;->STOPPED:Ljava/util/WeakHashMap;
    invoke-static {}, Le/e/a/AppSwitchGuard;->access$0()Ljava/util/WeakHashMap;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    # getter for: Le/e/a/AppSwitchGuard;->PENDING:Ljava/util/WeakHashMap;
    invoke-static {}, Le/e/a/AppSwitchGuard;->access$1()Ljava/util/WeakHashMap;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Runnable;

    .line 83
    if-eqz p1, :cond_28

    # getter for: Le/e/a/AppSwitchGuard;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/AppSwitchGuard;->access$5()Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    # getter for: Le/e/a/AppSwitchGuard;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/AppSwitchGuard;->access$5()Landroid/os/Handler;

    move-result-object v0

    const-wide/16 v1, 0xb4

    invoke-virtual {v0, p1, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 84
    :cond_28
    return-void
.end method
