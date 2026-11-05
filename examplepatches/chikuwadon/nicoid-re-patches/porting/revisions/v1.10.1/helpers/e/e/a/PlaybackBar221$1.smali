.class Le/e/a/PlaybackBar221$1;
.super Ljava/lang/Object;
.source "PlaybackBar221.java"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/PlaybackBar221;
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


# virtual methods
.method public onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .registers 3

    .line 25
    # getter for: Le/e/a/PlaybackBar221;->shown:Le/e/a/PlaybackBar221$Binding;
    invoke-static {}, Le/e/a/PlaybackBar221;->access$2()Le/e/a/PlaybackBar221$Binding;

    move-result-object v0

    if-eqz v0, :cond_11

    # getter for: Le/e/a/PlaybackBar221;->shown:Le/e/a/PlaybackBar221$Binding;
    invoke-static {}, Le/e/a/PlaybackBar221;->access$2()Le/e/a/PlaybackBar221$Binding;

    move-result-object v0

    iget-object v0, v0, Le/e/a/PlaybackBar221$Binding;->activity:Landroid/app/Activity;

    if-ne v0, p1, :cond_11

    invoke-static {}, Le/e/a/PlaybackBar221;->remove()V

    :cond_11
    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .registers 4

    .line 22
    # getter for: Le/e/a/PlaybackBar221;->foreground:Ljava/lang/ref/WeakReference;
    invoke-static {}, Le/e/a/PlaybackBar221;->access$1()Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p1, :cond_13

    new-instance v0, Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-static {v0}, Le/e/a/PlaybackBar221;->access$0(Ljava/lang/ref/WeakReference;)V

    :cond_13
    # getter for: Le/e/a/PlaybackBar221;->shown:Le/e/a/PlaybackBar221$Binding;
    invoke-static {}, Le/e/a/PlaybackBar221;->access$2()Le/e/a/PlaybackBar221$Binding;

    move-result-object v0

    if-eqz v0, :cond_24

    # getter for: Le/e/a/PlaybackBar221;->shown:Le/e/a/PlaybackBar221$Binding;
    invoke-static {}, Le/e/a/PlaybackBar221;->access$2()Le/e/a/PlaybackBar221$Binding;

    move-result-object v0

    iget-object v0, v0, Le/e/a/PlaybackBar221$Binding;->activity:Landroid/app/Activity;

    if-ne v0, p1, :cond_24

    invoke-static {}, Le/e/a/PlaybackBar221;->remove()V

    :cond_24
    invoke-static {p1}, Le/e/a/PlayerGestures219;->destroy(Landroid/app/Activity;)V

    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .registers 3

    .line 21
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-static {v0}, Le/e/a/PlaybackBar221;->access$0(Ljava/lang/ref/WeakReference;)V

    invoke-static {p1}, Le/e/a/FeedbackHud219;->foreground(Landroid/app/Activity;)V

    invoke-static {}, Le/e/a/PlaybackBar221;->refresh()V

    :try_start_e
    const-string v0, "v"

    invoke-static {p1, v0}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Le/e/a/PlaybackTransfer221;->portrait(Ljava/lang/Object;)V
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_17} :catch_17

    :catch_17
    return-void
.end method

.method public onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    return-void
.end method

.method public onActivityStarted(Landroid/app/Activity;)V
    .registers 2

    return-void
.end method

.method public onActivityStopped(Landroid/app/Activity;)V
    .registers 2

    return-void
.end method
