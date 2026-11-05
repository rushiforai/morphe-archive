.class Le/e/a/DirectBackground235$1;
.super Ljava/lang/Object;
.source "DirectBackground235.java"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/DirectBackground235;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    .line 25
    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .registers 4

    .line 25
    sget-object v0, Le/e/a/DirectBackground235;->active:Le/e/a/DirectBackground235$State;

    if-eqz v0, :cond_b

    iget-object v1, v0, Le/e/a/DirectBackground235$State;->host:Landroid/app/Activity;

    if-ne v1, p1, :cond_b

    invoke-virtual {v0}, Le/e/a/DirectBackground235$State;->detach()V

    :cond_b
    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .registers 4

    .line 25
    sget-object v0, Le/e/a/DirectBackground235;->active:Le/e/a/DirectBackground235$State;

    if-eqz v0, :cond_13

    iget-object v1, v0, Le/e/a/DirectBackground235$State;->host:Landroid/app/Activity;

    if-ne v1, p1, :cond_13

    new-instance p1, Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    invoke-direct {p1, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, v0, Le/e/a/DirectBackground235$State;->foreground:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Le/e/a/DirectBackground235$State;->detach()V

    :cond_13
    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .registers 5

    .line 25
    sget-object v0, Le/e/a/DirectBackground235;->active:Le/e/a/DirectBackground235$State;

    if-nez v0, :cond_7

    invoke-static {}, Le/e/a/DirectBackground235;->refresh()V

    :cond_7
    sget-object v0, Le/e/a/DirectBackground235;->active:Le/e/a/DirectBackground235$State;

    if-nez v0, :cond_c

    return-void

    :cond_c
    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v1, v0, Le/e/a/DirectBackground235$State;->foreground:Ljava/lang/ref/WeakReference;

    invoke-static {p1}, Le/e/a/PlaybackBar221;->player(Landroid/app/Activity;)Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_26

    iget-boolean p1, v0, Le/e/a/DirectBackground235$State;->restoring:Z

    if-eqz p1, :cond_22

    invoke-virtual {v0}, Le/e/a/DirectBackground235$State;->detach()V

    goto :goto_25

    :cond_22
    invoke-virtual {v0, v2}, Le/e/a/DirectBackground235$State;->close(Z)V

    :goto_25
    return-void

    :cond_26
    :try_start_26
    invoke-virtual {v0, p1}, Le/e/a/DirectBackground235$State;->attach(Landroid/app/Activity;)V
    :try_end_29
    .catch Ljava/lang/Exception; {:try_start_26 .. :try_end_29} :catch_2a

    goto :goto_2e

    :catch_2a
    move-exception p1

    invoke-virtual {v0, v2}, Le/e/a/DirectBackground235$State;->close(Z)V

    :goto_2e
    return-void
.end method

.method public onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    .line 25
    return-void
.end method

.method public onActivityStarted(Landroid/app/Activity;)V
    .registers 2

    .line 25
    return-void
.end method

.method public onActivityStopped(Landroid/app/Activity;)V
    .registers 2

    .line 25
    return-void
.end method
