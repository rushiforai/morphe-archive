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

    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    .line 63
    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .registers 4

    .line 77
    # getter for: Le/e/a/AppSwitchGuard;->PENDING:Ljava/util/WeakHashMap;
    invoke-static {}, Le/e/a/AppSwitchGuard;->access$0()Ljava/util/WeakHashMap;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Runnable;

    .line 78
    if-eqz v0, :cond_13

    # getter for: Le/e/a/AppSwitchGuard;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/AppSwitchGuard;->access$4()Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 79
    :cond_13
    # getter for: Le/e/a/AppSwitchGuard;->resumed:Ljava/lang/ref/WeakReference;
    invoke-static {}, Le/e/a/AppSwitchGuard;->access$1()Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p1, :cond_26

    new-instance p1, Ljava/lang/ref/WeakReference;

    const/4 v0, 0x0

    invoke-direct {p1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-static {p1}, Le/e/a/AppSwitchGuard;->access$3(Ljava/lang/ref/WeakReference;)V

    .line 80
    :cond_26
    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .registers 3

    .line 72
    # getter for: Le/e/a/AppSwitchGuard;->resumed:Ljava/lang/ref/WeakReference;
    invoke-static {}, Le/e/a/AppSwitchGuard;->access$1()Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p1, :cond_13

    new-instance p1, Ljava/lang/ref/WeakReference;

    const/4 v0, 0x0

    invoke-direct {p1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-static {p1}, Le/e/a/AppSwitchGuard;->access$3(Ljava/lang/ref/WeakReference;)V

    .line 73
    :cond_13
    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .registers 5

    .line 66
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-static {v0}, Le/e/a/AppSwitchGuard;->access$3(Ljava/lang/ref/WeakReference;)V

    .line 67
    # getter for: Le/e/a/AppSwitchGuard;->PENDING:Ljava/util/WeakHashMap;
    invoke-static {}, Le/e/a/AppSwitchGuard;->access$0()Ljava/util/WeakHashMap;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/WeakHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_14
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_25

    .line 68
    # getter for: Le/e/a/AppSwitchGuard;->PENDING:Ljava/util/WeakHashMap;
    invoke-static {}, Le/e/a/AppSwitchGuard;->access$0()Ljava/util/WeakHashMap;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/WeakHashMap;->clear()V

    .line 69
    invoke-static {p1}, Le/e/a/PlaybackReturn;->foreground(Landroid/app/Activity;)V

    .line 70
    return-void

    .line 67
    :cond_25
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Runnable;

    # getter for: Le/e/a/AppSwitchGuard;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/AppSwitchGuard;->access$4()Landroid/os/Handler;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    goto :goto_14
.end method

.method public onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    .line 75
    return-void
.end method

.method public onActivityStarted(Landroid/app/Activity;)V
    .registers 2

    .line 64
    return-void
.end method

.method public onActivityStopped(Landroid/app/Activity;)V
    .registers 2

    .line 74
    return-void
.end method
