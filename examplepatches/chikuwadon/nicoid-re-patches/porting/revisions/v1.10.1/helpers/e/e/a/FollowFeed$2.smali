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

    .line 123
    iput-object p1, p0, Le/e/a/FollowFeed$2;->val$a:Landroid/app/Activity;

    iput-object p2, p0, Le/e/a/FollowFeed$2;->val$state:Le/e/a/FollowFeed$State;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    .line 124
    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .registers 6

    .line 130
    iget-object v0, p0, Le/e/a/FollowFeed$2;->val$a:Landroid/app/Activity;

    if-ne p1, v0, :cond_2f

    iget-object p1, p0, Le/e/a/FollowFeed$2;->val$state:Le/e/a/FollowFeed$State;

    iget-object p1, p1, Le/e/a/FollowFeed$State;->pages:[Le/e/a/FollowFeed$State;

    array-length v0, p1

    const/4 v1, 0x0

    :goto_a
    if-lt v1, v0, :cond_1f

    # getter for: Le/e/a/FollowFeed;->STATES:Ljava/util/WeakHashMap;
    invoke-static {}, Le/e/a/FollowFeed;->access$14()Ljava/util/WeakHashMap;

    move-result-object p1

    iget-object v0, p0, Le/e/a/FollowFeed$2;->val$a:Landroid/app/Activity;

    invoke-virtual {p1, v0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, p0, Le/e/a/FollowFeed$2;->val$a:Landroid/app/Activity;

    invoke-virtual {p1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/app/Application;->unregisterActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    goto :goto_2f

    :cond_1f
    aget-object v2, p1, v1

    if-eqz v2, :cond_2c

    iget-object v3, v2, Le/e/a/FollowFeed$State;->task:Le/e/a/NetworkTask;

    if-eqz v3, :cond_2c

    iget-object v2, v2, Le/e/a/FollowFeed$State;->task:Le/e/a/NetworkTask;

    invoke-virtual {v2}, Le/e/a/NetworkTask;->cancel()V

    :cond_2c
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    :cond_2f
    :goto_2f
    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .registers 2

    .line 127
    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .registers 6

    .line 126
    iget-object v0, p0, Le/e/a/FollowFeed$2;->val$a:Landroid/app/Activity;

    if-ne p1, v0, :cond_38

    iget-object p1, p0, Le/e/a/FollowFeed$2;->val$state:Le/e/a/FollowFeed$State;

    iget-object p1, p1, Le/e/a/FollowFeed$State;->pages:[Le/e/a/FollowFeed$State;

    array-length v0, p1

    const/4 v1, 0x0

    move v2, v1

    :goto_b
    if-lt v2, v0, :cond_2f

    iget-object p1, p0, Le/e/a/FollowFeed$2;->val$a:Landroid/app/Activity;

    invoke-static {p1}, Le/e/a/ShortImages;->resume(Landroid/app/Activity;)V

    iget-object p1, p0, Le/e/a/FollowFeed$2;->val$state:Le/e/a/FollowFeed$State;

    iget-object p1, p1, Le/e/a/FollowFeed$State;->current:Le/e/a/FollowFeed$State;

    iget-object v0, p0, Le/e/a/FollowFeed$2;->val$a:Landroid/app/Activity;

    # invokes: Le/e/a/FollowFeed;->updateFooter(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V
    invoke-static {v0, p1}, Le/e/a/FollowFeed;->access$12(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V

    iget-boolean v0, p1, Le/e/a/FollowFeed$State;->busy:Z

    if-nez v0, :cond_38

    iget-boolean v0, p1, Le/e/a/FollowFeed$State;->initialized:Z

    if-nez v0, :cond_38

    iget-object v0, p0, Le/e/a/FollowFeed$2;->val$a:Landroid/app/Activity;

    # invokes: Le/e/a/FollowFeed;->rebuild(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V
    invoke-static {v0, p1}, Le/e/a/FollowFeed;->access$13(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V

    iget-object v0, p0, Le/e/a/FollowFeed$2;->val$a:Landroid/app/Activity;

    const/4 v1, 0x1

    # invokes: Le/e/a/FollowFeed;->request(Landroid/app/Activity;Le/e/a/FollowFeed$State;Z)V
    invoke-static {v0, p1, v1}, Le/e/a/FollowFeed;->access$11(Landroid/app/Activity;Le/e/a/FollowFeed$State;Z)V

    goto :goto_38

    :cond_2f
    aget-object v3, p1, v2

    if-eqz v3, :cond_35

    iput-boolean v1, v3, Le/e/a/FollowFeed$State;->stopped:Z

    :cond_35
    add-int/lit8 v2, v2, 0x1

    goto :goto_b

    :cond_38
    :goto_38
    return-void
.end method

.method public onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    .line 129
    return-void
.end method

.method public onActivityStarted(Landroid/app/Activity;)V
    .registers 2

    .line 125
    return-void
.end method

.method public onActivityStopped(Landroid/app/Activity;)V
    .registers 7

    .line 128
    iget-object v0, p0, Le/e/a/FollowFeed$2;->val$a:Landroid/app/Activity;

    if-ne p1, v0, :cond_3f

    iget-object p1, p0, Le/e/a/FollowFeed$2;->val$state:Le/e/a/FollowFeed$State;

    iget-object p1, p1, Le/e/a/FollowFeed$State;->pages:[Le/e/a/FollowFeed$State;

    array-length v0, p1

    const/4 v1, 0x0

    move v2, v1

    :goto_b
    if-lt v2, v0, :cond_1c

    iget-object p1, p0, Le/e/a/FollowFeed$2;->val$a:Landroid/app/Activity;

    iget-object v0, p0, Le/e/a/FollowFeed$2;->val$state:Le/e/a/FollowFeed$State;

    iget-object v0, v0, Le/e/a/FollowFeed$State;->current:Le/e/a/FollowFeed$State;

    # invokes: Le/e/a/FollowFeed;->updateFooter(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V
    invoke-static {p1, v0}, Le/e/a/FollowFeed;->access$12(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V

    iget-object p1, p0, Le/e/a/FollowFeed$2;->val$a:Landroid/app/Activity;

    invoke-static {p1}, Le/e/a/ShortImages;->cancel(Landroid/app/Activity;)V

    goto :goto_3f

    :cond_1c
    aget-object v3, p1, v2

    if-eqz v3, :cond_3c

    const/4 v4, 0x1

    iput-boolean v4, v3, Le/e/a/FollowFeed$State;->stopped:Z

    iget-object v4, v3, Le/e/a/FollowFeed$State;->task:Le/e/a/NetworkTask;

    if-eqz v4, :cond_2c

    iget-object v4, v3, Le/e/a/FollowFeed$State;->task:Le/e/a/NetworkTask;

    invoke-virtual {v4}, Le/e/a/NetworkTask;->cancel()V

    :cond_2c
    iget-boolean v4, v3, Le/e/a/FollowFeed$State;->busy:Z

    if-eqz v4, :cond_3a

    iget-object v4, v3, Le/e/a/FollowFeed$State;->items:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_3a

    iput-boolean v1, v3, Le/e/a/FollowFeed$State;->initialized:Z

    :cond_3a
    iput-boolean v1, v3, Le/e/a/FollowFeed$State;->busy:Z

    :cond_3c
    add-int/lit8 v2, v2, 0x1

    goto :goto_b

    :cond_3f
    :goto_3f
    return-void
.end method
