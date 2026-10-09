.class Le/e/a/FollowFeed$2;
.super Ljava/lang/Object;
.source "FollowFeed.java"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/FollowFeed;->load(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$a:Landroid/app/Activity;

.field private final synthetic val$state:Le/e/a/FollowFeed$State;


# direct methods
.method constructor <init>(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V
    .registers 3

    .line 125
    iput-object p1, p0, Le/e/a/FollowFeed$2;->val$a:Landroid/app/Activity;

    iput-object p2, p0, Le/e/a/FollowFeed$2;->val$state:Le/e/a/FollowFeed$State;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    .line 126
    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .registers 3

    .line 132
    iget-object v0, p0, Le/e/a/FollowFeed$2;->val$a:Landroid/app/Activity;

    if-ne p1, v0, :cond_23

    iget-object p1, p0, Le/e/a/FollowFeed$2;->val$state:Le/e/a/FollowFeed$State;

    iget-object p1, p1, Le/e/a/FollowFeed$State;->task:Le/e/a/NetworkTask;

    if-eqz p1, :cond_11

    iget-object p1, p0, Le/e/a/FollowFeed$2;->val$state:Le/e/a/FollowFeed$State;

    iget-object p1, p1, Le/e/a/FollowFeed$State;->task:Le/e/a/NetworkTask;

    invoke-virtual {p1}, Le/e/a/NetworkTask;->cancel()V

    :cond_11
    # getter for: Le/e/a/FollowFeed;->STATES:Ljava/util/WeakHashMap;
    invoke-static {}, Le/e/a/FollowFeed;->access$15()Ljava/util/WeakHashMap;

    move-result-object p1

    iget-object v0, p0, Le/e/a/FollowFeed$2;->val$a:Landroid/app/Activity;

    invoke-virtual {p1, v0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, p0, Le/e/a/FollowFeed$2;->val$a:Landroid/app/Activity;

    invoke-virtual {p1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/app/Application;->unregisterActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    :cond_23
    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .registers 2

    .line 129
    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .registers 4

    .line 128
    iget-object v0, p0, Le/e/a/FollowFeed$2;->val$a:Landroid/app/Activity;

    if-ne p1, v0, :cond_3a

    iget-object p1, p0, Le/e/a/FollowFeed$2;->val$state:Le/e/a/FollowFeed$State;

    const/4 v0, 0x0

    iput-boolean v0, p1, Le/e/a/FollowFeed$State;->stopped:Z

    iget-object p1, p0, Le/e/a/FollowFeed$2;->val$a:Landroid/app/Activity;

    invoke-static {p1}, Le/e/a/ShortImages;->resume(Landroid/app/Activity;)V

    iget-object p1, p0, Le/e/a/FollowFeed$2;->val$a:Landroid/app/Activity;

    iget-object v0, p0, Le/e/a/FollowFeed$2;->val$state:Le/e/a/FollowFeed$State;

    # invokes: Le/e/a/FollowFeed;->updateFooter(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V
    invoke-static {p1, v0}, Le/e/a/FollowFeed;->access$13(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V

    iget-object p1, p0, Le/e/a/FollowFeed$2;->val$state:Le/e/a/FollowFeed$State;

    iget-boolean p1, p1, Le/e/a/FollowFeed$State;->busy:Z

    if-nez p1, :cond_3a

    iget-object p1, p0, Le/e/a/FollowFeed$2;->val$a:Landroid/app/Activity;

    iget-object v0, p0, Le/e/a/FollowFeed$2;->val$state:Le/e/a/FollowFeed$State;

    # invokes: Le/e/a/FollowFeed;->rebuild(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V
    invoke-static {p1, v0}, Le/e/a/FollowFeed;->access$14(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V

    iget-object p1, p0, Le/e/a/FollowFeed$2;->val$state:Le/e/a/FollowFeed$State;

    iget-object p1, p1, Le/e/a/FollowFeed$State;->items:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_3a

    iget-object p1, p0, Le/e/a/FollowFeed$2;->val$state:Le/e/a/FollowFeed$State;

    iget-boolean p1, p1, Le/e/a/FollowFeed$State;->failed:Z

    if-nez p1, :cond_3a

    iget-object p1, p0, Le/e/a/FollowFeed$2;->val$a:Landroid/app/Activity;

    iget-object v0, p0, Le/e/a/FollowFeed$2;->val$state:Le/e/a/FollowFeed$State;

    const/4 v1, 0x1

    # invokes: Le/e/a/FollowFeed;->request(Landroid/app/Activity;Le/e/a/FollowFeed$State;Z)V
    invoke-static {p1, v0, v1}, Le/e/a/FollowFeed;->access$12(Landroid/app/Activity;Le/e/a/FollowFeed$State;Z)V

    :cond_3a
    return-void
.end method

.method public onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    .line 131
    return-void
.end method

.method public onActivityStarted(Landroid/app/Activity;)V
    .registers 2

    .line 127
    return-void
.end method

.method public onActivityStopped(Landroid/app/Activity;)V
    .registers 3

    .line 130
    iget-object v0, p0, Le/e/a/FollowFeed$2;->val$a:Landroid/app/Activity;

    if-ne p1, v0, :cond_27

    iget-object p1, p0, Le/e/a/FollowFeed$2;->val$state:Le/e/a/FollowFeed$State;

    const/4 v0, 0x1

    iput-boolean v0, p1, Le/e/a/FollowFeed$State;->stopped:Z

    iget-object p1, p0, Le/e/a/FollowFeed$2;->val$state:Le/e/a/FollowFeed$State;

    iget-object p1, p1, Le/e/a/FollowFeed$State;->task:Le/e/a/NetworkTask;

    if-eqz p1, :cond_16

    iget-object p1, p0, Le/e/a/FollowFeed$2;->val$state:Le/e/a/FollowFeed$State;

    iget-object p1, p1, Le/e/a/FollowFeed$State;->task:Le/e/a/NetworkTask;

    invoke-virtual {p1}, Le/e/a/NetworkTask;->cancel()V

    :cond_16
    iget-object p1, p0, Le/e/a/FollowFeed$2;->val$state:Le/e/a/FollowFeed$State;

    const/4 v0, 0x0

    iput-boolean v0, p1, Le/e/a/FollowFeed$State;->busy:Z

    iget-object p1, p0, Le/e/a/FollowFeed$2;->val$a:Landroid/app/Activity;

    iget-object v0, p0, Le/e/a/FollowFeed$2;->val$state:Le/e/a/FollowFeed$State;

    # invokes: Le/e/a/FollowFeed;->updateFooter(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V
    invoke-static {p1, v0}, Le/e/a/FollowFeed;->access$13(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V

    iget-object p1, p0, Le/e/a/FollowFeed$2;->val$a:Landroid/app/Activity;

    invoke-static {p1}, Le/e/a/ShortImages;->cancel(Landroid/app/Activity;)V

    :cond_27
    return-void
.end method
