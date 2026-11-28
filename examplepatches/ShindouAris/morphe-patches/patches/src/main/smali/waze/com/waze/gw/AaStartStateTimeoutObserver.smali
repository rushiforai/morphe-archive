.class public final Lcom/waze/gw/AaStartStateTimeoutObserver;
.super Ljava/lang/Object;
.source "WazeSource"

.implements Landroidx/lifecycle/DefaultLifecycleObserver;

.field public final a:Lcom/waze/car_lib/f/u;
.field public b:Landroid/os/Handler;
.field public c:Ljava/lang/Runnable;

.method public constructor <init>(Lcom/waze/car_lib/f/u;)V
    .locals 0

    iput-object p1, p0, Lcom/waze/gw/AaStartStateTimeoutObserver;->a:Lcom/waze/car_lib/f/u;
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public final onCreate(Landroidx/lifecycle/LifecycleOwner;)V
    .locals 6

    invoke-static {p0, p1}, Landroidx/lifecycle/DefaultLifecycleObserver$-CC;->$default$onCreate(Landroidx/lifecycle/DefaultLifecycleObserver;Landroidx/lifecycle/LifecycleOwner;)V

    :try_start_0
    invoke-static {}, Lcom/waze/gw/Gateway;->getAaSuggestWidgetMode()I
    move-result v0

    const/4 v1, 0x3
    if-eq v0, v1, :cond_done

    const-wide/16 v1, 0x5dc
    if-nez v0, :cond_check_10s
    goto :cond_delay_ready

    :cond_check_10s
    const/4 v2, 0x1
    if-ne v0, v2, :cond_one_minute
    const-wide/16 v1, 0x2710
    goto :cond_delay_ready

    :cond_one_minute
    const-wide/32 v1, 0xea60

    :cond_delay_ready
    new-instance v3, Landroid/os/Handler;
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v4
    invoke-direct {v3, v4}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    iput-object v3, p0, Lcom/waze/gw/AaStartStateTimeoutObserver;->b:Landroid/os/Handler;

    new-instance v4, Lcom/waze/gw/AaStartStateTimeoutRunnable;
    iget-object v5, p0, Lcom/waze/gw/AaStartStateTimeoutObserver;->a:Lcom/waze/car_lib/f/u;
    invoke-direct {v4, v5}, Lcom/waze/gw/AaStartStateTimeoutRunnable;-><init>(Lcom/waze/car_lib/f/u;)V
    iput-object v4, p0, Lcom/waze/gw/AaStartStateTimeoutObserver;->c:Ljava/lang/Runnable;
    invoke-virtual {v3, v4, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :cond_done
    return-void

    :catch_0
    move-exception v0
    return-void
.end method

.method public final onDestroy(Landroidx/lifecycle/LifecycleOwner;)V
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcom/waze/gw/AaStartStateTimeoutObserver;->b:Landroid/os/Handler;
    if-eqz v0, :cond_done
    iget-object v1, p0, Lcom/waze/gw/AaStartStateTimeoutObserver;->c:Ljava/lang/Runnable;
    if-eqz v1, :cond_done
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
    :cond_done
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    goto :goto_parent

    :catch_0
    move-exception v0

    :goto_parent
    invoke-static {p0, p1}, Landroidx/lifecycle/DefaultLifecycleObserver$-CC;->$default$onDestroy(Landroidx/lifecycle/DefaultLifecycleObserver;Landroidx/lifecycle/LifecycleOwner;)V
    return-void
.end method

.method public final synthetic onPause(Landroidx/lifecycle/LifecycleOwner;)V
    .locals 0
    invoke-static {p0, p1}, Landroidx/lifecycle/DefaultLifecycleObserver$-CC;->$default$onPause(Landroidx/lifecycle/DefaultLifecycleObserver;Landroidx/lifecycle/LifecycleOwner;)V
    return-void
.end method

.method public final synthetic onResume(Landroidx/lifecycle/LifecycleOwner;)V
    .locals 0
    invoke-static {p0, p1}, Landroidx/lifecycle/DefaultLifecycleObserver$-CC;->$default$onResume(Landroidx/lifecycle/DefaultLifecycleObserver;Landroidx/lifecycle/LifecycleOwner;)V
    return-void
.end method

.method public final synthetic onStart(Landroidx/lifecycle/LifecycleOwner;)V
    .locals 0
    invoke-static {p0, p1}, Landroidx/lifecycle/DefaultLifecycleObserver$-CC;->$default$onStart(Landroidx/lifecycle/DefaultLifecycleObserver;Landroidx/lifecycle/LifecycleOwner;)V
    return-void
.end method

.method public final synthetic onStop(Landroidx/lifecycle/LifecycleOwner;)V
    .locals 0
    invoke-static {p0, p1}, Landroidx/lifecycle/DefaultLifecycleObserver$-CC;->$default$onStop(Landroidx/lifecycle/DefaultLifecycleObserver;Landroidx/lifecycle/LifecycleOwner;)V
    return-void
.end method
