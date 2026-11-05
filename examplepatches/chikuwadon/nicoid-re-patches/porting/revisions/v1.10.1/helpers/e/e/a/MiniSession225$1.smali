.class Le/e/a/MiniSession225$1;
.super Ljava/lang/Object;
.source "MiniSession225.java"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/MiniSession225;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    .line 44
    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .registers 4

    .line 58
    # getter for: Le/e/a/MiniSession225;->active:Le/e/a/MiniSession225$Session;
    invoke-static {}, Le/e/a/MiniSession225;->access$2()Le/e/a/MiniSession225$Session;

    move-result-object v0

    if-eqz v0, :cond_16

    iget-object v1, v0, Le/e/a/MiniSession225$Session;->source:Landroid/app/Activity;

    if-ne v1, p1, :cond_f

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Le/e/a/MiniSession225$Session;->close(Z)V

    goto :goto_16

    :cond_f
    iget-object v1, v0, Le/e/a/MiniSession225$Session;->host:Landroid/app/Activity;

    if-ne v1, p1, :cond_16

    invoke-virtual {v0}, Le/e/a/MiniSession225$Session;->detach()V

    :cond_16
    :goto_16
    # getter for: Le/e/a/MiniSession225;->previous:Ljava/lang/ref/WeakReference;
    invoke-static {}, Le/e/a/MiniSession225;->access$5()Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p1, :cond_29

    new-instance p1, Ljava/lang/ref/WeakReference;

    const/4 v0, 0x0

    invoke-direct {p1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-static {p1}, Le/e/a/MiniSession225;->access$1(Ljava/lang/ref/WeakReference;)V

    :cond_29
    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .registers 5

    .line 55
    # getter for: Le/e/a/MiniSession225;->foreground:Ljava/lang/ref/WeakReference;
    invoke-static {}, Le/e/a/MiniSession225;->access$4()Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p1, :cond_13

    new-instance v0, Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-static {v0}, Le/e/a/MiniSession225;->access$0(Ljava/lang/ref/WeakReference;)V

    :cond_13
    # getter for: Le/e/a/MiniSession225;->active:Le/e/a/MiniSession225$Session;
    invoke-static {}, Le/e/a/MiniSession225;->access$2()Le/e/a/MiniSession225$Session;

    move-result-object v0

    if-eqz v0, :cond_34

    iget-object v1, v0, Le/e/a/MiniSession225$Session;->host:Landroid/app/Activity;

    if-ne v1, p1, :cond_20

    invoke-virtual {v0}, Le/e/a/MiniSession225$Session;->detach()V

    :cond_20
    # getter for: Le/e/a/MiniSession225;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/MiniSession225;->access$3()Landroid/os/Handler;

    move-result-object p1

    iget-object v1, v0, Le/e/a/MiniSession225$Session;->away:Ljava/lang/Runnable;

    invoke-virtual {p1, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    # getter for: Le/e/a/MiniSession225;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/MiniSession225;->access$3()Landroid/os/Handler;

    move-result-object p1

    iget-object v0, v0, Le/e/a/MiniSession225$Session;->away:Ljava/lang/Runnable;

    const-wide/16 v1, 0x28a

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_34
    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .registers 5

    .line 47
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-static {v0}, Le/e/a/MiniSession225;->access$0(Ljava/lang/ref/WeakReference;)V

    .line 48
    invoke-static {p1}, Le/e/a/MiniSession225;->player(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_16

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-static {v0}, Le/e/a/MiniSession225;->access$1(Ljava/lang/ref/WeakReference;)V

    .line 49
    :cond_16
    # getter for: Le/e/a/MiniSession225;->active:Le/e/a/MiniSession225$Session;
    invoke-static {}, Le/e/a/MiniSession225;->access$2()Le/e/a/MiniSession225$Session;

    move-result-object v0

    if-nez v0, :cond_1d

    return-void

    :cond_1d
    invoke-static {}, Le/e/a/DirectBackground235;->showing()Z

    move-result v1

    if-eqz v1, :cond_28

    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Le/e/a/MiniSession225$Session;->close(Z)V

    return-void

    :cond_28
    # getter for: Le/e/a/MiniSession225;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/MiniSession225;->access$3()Landroid/os/Handler;

    move-result-object v1

    iget-object v2, v0, Le/e/a/MiniSession225$Session;->away:Ljava/lang/Runnable;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 50
    iget-object v1, v0, Le/e/a/MiniSession225$Session;->source:Landroid/app/Activity;

    if-ne p1, v1, :cond_3d

    iget-boolean p1, v0, Le/e/a/MiniSession225$Session;->openingDirect:Z

    if-nez p1, :cond_3c

    invoke-virtual {v0}, Le/e/a/MiniSession225$Session;->finishRestore()V

    :cond_3c
    return-void

    .line 52
    :cond_3d
    invoke-static {p1}, Le/e/a/MiniSession225;->player(Landroid/app/Activity;)Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_48

    invoke-virtual {v0, v2}, Le/e/a/MiniSession225$Session;->close(Z)V

    return-void

    .line 53
    :cond_48
    :try_start_48
    invoke-virtual {v0, p1}, Le/e/a/MiniSession225$Session;->attach(Landroid/app/Activity;)V
    :try_end_4b
    .catch Ljava/lang/Exception; {:try_start_48 .. :try_end_4b} :catch_4c

    goto :goto_55

    :catch_4c
    move-exception p1

    const-string v1, "Cannot attach retained player"

    invoke-static {v1, p1}, Le/e/a/MiniSession225;->log(Ljava/lang/String;Ljava/lang/Exception;)V

    invoke-virtual {v0, v2}, Le/e/a/MiniSession225$Session;->close(Z)V

    .line 54
    :goto_55
    return-void
.end method

.method public onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    .line 57
    return-void
.end method

.method public onActivityStarted(Landroid/app/Activity;)V
    .registers 2

    .line 45
    return-void
.end method

.method public onActivityStopped(Landroid/app/Activity;)V
    .registers 2

    .line 56
    return-void
.end method
