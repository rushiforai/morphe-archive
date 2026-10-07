.class Le/e/a/ThemeChoice$1;
.super Ljava/lang/Object;
.source "ThemeChoice.java"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/ThemeChoice;->apply(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    .line 49
    invoke-static {p1}, Le/e/a/ThemeChoice;->amoled(Landroid/content/Context;)Z

    move-result p2

    if-eqz p2, :cond_10

    const p2, 0x1020002

    invoke-virtual {p1, p2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-static {p1}, Le/e/a/ThemeChoice;->background(Landroid/view/View;)V

    :cond_10
    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .registers 3

    .line 61
    # getter for: Le/e/a/ThemeChoice;->APPLIED:Ljava/util/WeakHashMap;
    invoke-static {}, Le/e/a/ThemeChoice;->access$000()Ljava/util/WeakHashMap;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .registers 2

    .line 58
    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .registers 4

    .line 52
    # getter for: Le/e/a/ThemeChoice;->APPLIED:Ljava/util/WeakHashMap;
    invoke-static {}, Le/e/a/ThemeChoice;->access$000()Ljava/util/WeakHashMap;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    # invokes: Le/e/a/ThemeChoice;->stamp(Landroid/content/Context;)Ljava/lang/String;
    invoke-static {p1}, Le/e/a/ThemeChoice;->access$100(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 53
    if-eqz v0, :cond_36

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_36

    invoke-virtual {p1}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_36

    .line 54
    # getter for: Le/e/a/ThemeChoice;->APPLIED:Ljava/util/WeakHashMap;
    invoke-static {}, Le/e/a/ThemeChoice;->access$000()Ljava/util/WeakHashMap;

    move-result-object v0

    invoke-virtual {v0, p1, v1}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Le/e/a/ThemeChoice$1$$ExternalSyntheticLambda0;

    invoke-direct {v1, p1}, Le/e/a/ThemeChoice$1$$ExternalSyntheticLambda0;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 57
    :cond_36
    return-void
.end method

.method public onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    .line 60
    return-void
.end method

.method public onActivityStarted(Landroid/app/Activity;)V
    .registers 2

    .line 50
    return-void
.end method

.method public onActivityStopped(Landroid/app/Activity;)V
    .registers 2

    .line 59
    return-void
.end method
