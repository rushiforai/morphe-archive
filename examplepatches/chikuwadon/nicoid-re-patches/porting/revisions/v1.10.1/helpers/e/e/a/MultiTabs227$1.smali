.class Le/e/a/MultiTabs227$1;
.super Ljava/lang/Object;
.source "MultiTabs227.java"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/MultiTabs227;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic lambda$0(Landroid/app/Activity;)V
    .registers 2

    .line 20
    const/4 v0, 0x0

    invoke-static {p0, v0}, Le/e/a/MultiTabs227;->bind(Landroid/app/Activity;I)V

    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    .line 19
    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .registers 4

    .line 23
    invoke-static {p1}, Le/e/a/GestureControls110;->dispose(Landroid/app/Activity;)V

    sget-object v0, Le/e/a/MultiTabs227;->HOSTS:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/MultiTabs227$Host;

    if-eqz v0, :cond_21

    iget v1, v0, Le/e/a/MultiTabs227$Host;->generation:I

    add-int/lit8 v1, v1, 0x1

    iput v1, v0, Le/e/a/MultiTabs227$Host;->generation:I

    invoke-static {v0}, Le/e/a/TabPreview235;->destroy(Le/e/a/MultiTabs227$Host;)V

    invoke-static {v0}, Le/e/a/TabRecovery244;->clear(Le/e/a/MultiTabs227$Host;)V

    invoke-virtual {v0}, Le/e/a/MultiTabs227$Host;->removeBar()V

    iget-object v0, v0, Le/e/a/MultiTabs227$Host;->pages:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->clear()V

    :cond_21
    invoke-static {p1}, Le/e/a/TabRoutes228;->destroy(Landroid/app/Activity;)V

    invoke-static {p1}, Le/e/a/TabGestures228;->destroy(Landroid/app/Activity;)V

    sget-object v0, Le/e/a/MultiTabs227;->listHost:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p1, :cond_37

    new-instance p1, Ljava/lang/ref/WeakReference;

    const/4 v0, 0x0

    invoke-direct {p1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object p1, Le/e/a/MultiTabs227;->listHost:Ljava/lang/ref/WeakReference;

    :cond_37
    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .registers 4

    .line 21
    sget-object v0, Le/e/a/TabRoutes228;->foreground:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p1, :cond_10

    new-instance v0, Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Le/e/a/TabRoutes228;->foreground:Ljava/lang/ref/WeakReference;

    :cond_10
    sget-object v0, Le/e/a/MultiTabs227;->HOSTS:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Le/e/a/MultiTabs227$Host;

    if-eqz p1, :cond_20

    invoke-virtual {p1}, Le/e/a/MultiTabs227$Host;->capture()V

    invoke-static {}, Le/e/a/MultiTabs227;->save()V

    :cond_20
    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .registers 4

    .line 20
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Le/e/a/TabRoutes228;->foreground:Ljava/lang/ref/WeakReference;

    invoke-static {}, Le/e/a/MultiTabs227;->enabled()Z

    move-result v0

    if-eqz v0, :cond_1e

    invoke-static {p1}, Le/e/a/TabRoutes228;->supported(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_14

    goto :goto_1e

    :cond_14
    sget-object v0, Le/e/a/MultiTabs227;->MAIN:Landroid/os/Handler;

    new-instance v1, Le/e/a/MultiTabs227$1$$ExternalSyntheticLambda1;

    invoke-direct {v1, p1}, Le/e/a/MultiTabs227$1$$ExternalSyntheticLambda1;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_1e
    :goto_1e
    return-void
.end method

.method public onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    .line 22
    sget-object p2, Le/e/a/MultiTabs227;->HOSTS:Ljava/util/Map;

    invoke-interface {p2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Le/e/a/MultiTabs227$Host;

    if-eqz p1, :cond_10

    invoke-virtual {p1}, Le/e/a/MultiTabs227$Host;->capture()V

    invoke-static {}, Le/e/a/MultiTabs227;->save()V

    :cond_10
    return-void
.end method

.method public onActivityStarted(Landroid/app/Activity;)V
    .registers 2

    .line 19
    return-void
.end method

.method public onActivityStopped(Landroid/app/Activity;)V
    .registers 2

    .line 22
    return-void
.end method
