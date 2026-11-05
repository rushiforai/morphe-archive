.class Le/e/a/DirectBootstrap238$1;
.super Ljava/lang/Object;
.source "DirectBootstrap238.java"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/DirectBootstrap238;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    .line 16
    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .registers 4

    .line 16
    sget-object v0, Le/e/a/DirectBootstrap238;->pending:Le/e/a/DirectBootstrap238$Pending;

    if-eqz v0, :cond_c

    iget-object v1, v0, Le/e/a/DirectBootstrap238$Pending;->source:Landroid/app/Activity;

    if-ne v1, p1, :cond_c

    const/4 p1, 0x0

    invoke-static {v0, p1}, Le/e/a/DirectBootstrap238;->cancel(Le/e/a/DirectBootstrap238$Pending;Z)V

    :cond_c
    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .registers 2

    .line 16
    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .registers 2

    .line 16
    return-void
.end method

.method public onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    .line 16
    return-void
.end method

.method public onActivityStarted(Landroid/app/Activity;)V
    .registers 2

    .line 16
    return-void
.end method

.method public onActivityStopped(Landroid/app/Activity;)V
    .registers 2

    .line 16
    return-void
.end method
