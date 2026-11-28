.class final Le/e/a/LocalReload244$Job;
.super Ljava/lang/Object;
.source "LocalReload244.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/LocalReload244;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Job"
.end annotation


# instance fields
.field final activity:Landroid/app/Activity;

.field bytes:J

.field final cache:Le/e/a/LocalReload244$CachePull;

.field final fragment:Lcom/sauzask/nicoid/NicoidVideoListFragment;

.field final list:Landroid/widget/ListView;

.field rows:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Le/e/a/x1;",
            ">;"
        }
    .end annotation
.end field

.field final search:Le/e/a/SearchSwipe;

.field success:Z

.field final thumbnails:Z

.field final type:I


# direct methods
.method constructor <init>(Lcom/sauzask/nicoid/NicoidVideoListFragment;Landroid/app/Activity;Landroid/widget/ListView;Le/e/a/SearchSwipe;Le/e/a/LocalReload244$CachePull;)V
    .registers 6

    .line 95
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/LocalReload244$Job;->fragment:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    iput-object p2, p0, Le/e/a/LocalReload244$Job;->activity:Landroid/app/Activity;

    iput-object p3, p0, Le/e/a/LocalReload244$Job;->list:Landroid/widget/ListView;

    iput-object p4, p0, Le/e/a/LocalReload244$Job;->search:Le/e/a/SearchSwipe;

    iput-object p5, p0, Le/e/a/LocalReload244$Job;->cache:Le/e/a/LocalReload244$CachePull;

    if-nez p1, :cond_0

    const/16 p2, 0xb

    goto :goto_0

    :cond_0
    iget p2, p1, Lcom/sauzask/nicoid/NicoidVideoListFragment;->g0:I

    :goto_0
    iput p2, p0, Le/e/a/LocalReload244$Job;->type:I

    if-eqz p1, :cond_1

    iget-boolean p1, p1, Lcom/sauzask/nicoid/NicoidVideoListFragment;->m0:Z

    if-eqz p1, :cond_1

    const/4 p1, 0x1

    goto :goto_1

    :cond_1
    const/4 p1, 0x0

    :goto_1
    iput-boolean p1, p0, Le/e/a/LocalReload244$Job;->thumbnails:Z

    return-void
.end method


# virtual methods
.method complete()V
    .registers 10

    .line 103
    const-string v0, "nicoid-refresh244"

    # getter for: Le/e/a/LocalReload244;->ACTIVE:Ljava/util/Map;
    invoke-static {}, Le/e/a/LocalReload244;->access$200()Ljava/util/Map;

    move-result-object v1

    iget-object v2, p0, Le/e/a/LocalReload244$Job;->list:Landroid/widget/ListView;

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eq v1, p0, :cond_0

    return-void

    .line 105
    :cond_0
    const/4 v1, 0x1

    :try_start_0
    iget-boolean v2, p0, Le/e/a/LocalReload244$Job;->success:Z

    if-eqz v2, :cond_6

    iget-object v2, p0, Le/e/a/LocalReload244$Job;->activity:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->isFinishing()Z

    move-result v2

    if-nez v2, :cond_6

    iget-object v2, p0, Le/e/a/LocalReload244$Job;->activity:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->isDestroyed()Z

    move-result v2

    if-nez v2, :cond_6

    iget-object v2, p0, Le/e/a/LocalReload244$Job;->list:Landroid/widget/ListView;

    invoke-virtual {v2}, Landroid/widget/ListView;->isAttachedToWindow()Z

    move-result v2

    if-eqz v2, :cond_6

    .line 106
    iget-object v2, p0, Le/e/a/LocalReload244$Job;->fragment:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    if-eqz v2, :cond_4

    .line 107
    iget-object v2, p0, Le/e/a/LocalReload244$Job;->fragment:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    iget-object v2, v2, Lcom/sauzask/nicoid/NicoidVideoListFragment;->b0:Landroid/widget/ListView;

    iget-object v3, p0, Le/e/a/LocalReload244$Job;->list:Landroid/widget/ListView;

    if-ne v2, v3, :cond_3

    iget-object v2, p0, Le/e/a/LocalReload244$Job;->fragment:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    iget-object v2, v2, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    iget-object v3, p0, Le/e/a/LocalReload244$Job;->activity:Landroid/app/Activity;

    if-ne v2, v3, :cond_3

    iget-object v2, p0, Le/e/a/LocalReload244$Job;->fragment:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    iget v2, v2, Lcom/sauzask/nicoid/NicoidVideoListFragment;->g0:I

    iget v3, p0, Le/e/a/LocalReload244$Job;->type:I

    if-ne v2, v3, :cond_3

    iget-object v2, p0, Le/e/a/LocalReload244$Job;->fragment:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    iget-boolean v2, v2, Lcom/sauzask/nicoid/NicoidVideoListFragment;->k0:Z

    if-nez v2, :cond_3

    iget-object v2, p0, Le/e/a/LocalReload244$Job;->fragment:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    iget-object v2, v2, Lcom/sauzask/nicoid/NicoidVideoListFragment;->a0:Ljava/util/ArrayList;

    if-eqz v2, :cond_3

    iget-object v2, p0, Le/e/a/LocalReload244$Job;->fragment:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    iget-object v2, v2, Lcom/sauzask/nicoid/NicoidVideoListFragment;->p0:Le/e/a/b0;

    if-eqz v2, :cond_3

    iget-object v2, p0, Le/e/a/LocalReload244$Job;->list:Landroid/widget/ListView;

    invoke-virtual {v2}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 108
    iget-object v2, p0, Le/e/a/LocalReload244$Job;->fragment:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    iget-object v2, v2, Lcom/sauzask/nicoid/NicoidVideoListFragment;->a0:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    iget-object v2, p0, Le/e/a/LocalReload244$Job;->fragment:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    iget-object v2, v2, Lcom/sauzask/nicoid/NicoidVideoListFragment;->a0:Ljava/util/ArrayList;

    iget-object v3, p0, Le/e/a/LocalReload244$Job;->rows:Ljava/util/ArrayList;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 109
    iget-object v2, p0, Le/e/a/LocalReload244$Job;->fragment:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    iget-object v2, v2, Lcom/sauzask/nicoid/NicoidVideoListFragment;->p0:Le/e/a/b0;

    iget-object v2, v2, Le/e/a/b0;->b:Ljava/util/ArrayList;

    iget-object v3, p0, Le/e/a/LocalReload244$Job;->fragment:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    iget-object v3, v3, Lcom/sauzask/nicoid/NicoidVideoListFragment;->a0:Ljava/util/ArrayList;

    if-eq v2, v3, :cond_1

    iget-object v2, p0, Le/e/a/LocalReload244$Job;->fragment:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    iget-object v2, v2, Lcom/sauzask/nicoid/NicoidVideoListFragment;->p0:Le/e/a/b0;

    iget-object v2, v2, Le/e/a/b0;->b:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    iget-object v2, p0, Le/e/a/LocalReload244$Job;->fragment:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    iget-object v2, v2, Lcom/sauzask/nicoid/NicoidVideoListFragment;->p0:Le/e/a/b0;

    iget-object v2, v2, Le/e/a/b0;->b:Ljava/util/ArrayList;

    iget-object v3, p0, Le/e/a/LocalReload244$Job;->rows:Ljava/util/ArrayList;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 110
    :cond_1
    iget v2, p0, Le/e/a/LocalReload244$Job;->type:I

    const/16 v3, 0x8

    if-ne v2, v3, :cond_2

    iget-object v2, p0, Le/e/a/LocalReload244$Job;->fragment:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    invoke-static {v2}, Le/e/a/ListActions;->historyLoaded(Ljava/lang/Object;)V

    .line 111
    :cond_2
    iget-object v2, p0, Le/e/a/LocalReload244$Job;->fragment:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    iget-object v2, v2, Lcom/sauzask/nicoid/NicoidVideoListFragment;->p0:Le/e/a/b0;

    invoke-virtual {v2}, Le/e/a/b0;->notifyDataSetChanged()V

    .line 112
    iget-object v2, p0, Le/e/a/LocalReload244$Job;->fragment:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    iget-object v3, p0, Le/e/a/LocalReload244$Job;->list:Landroid/widget/ListView;

    invoke-static {v2, v3}, Le/e/a/LocalReload244;->top(Ljava/lang/Object;Landroid/widget/ListView;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 124
    :cond_3
    # getter for: Le/e/a/LocalReload244;->ACTIVE:Ljava/util/Map;
    invoke-static {}, Le/e/a/LocalReload244;->access$200()Ljava/util/Map;

    move-result-object v0

    iget-object v2, p0, Le/e/a/LocalReload244$Job;->list:Landroid/widget/ListView;

    invoke-interface {v0, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Le/e/a/LocalReload244$Job;->list:Landroid/widget/ListView;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setEnabled(Z)V

    invoke-virtual {p0}, Le/e/a/LocalReload244$Job;->stop()V

    .line 107
    return-void

    .line 114
    :cond_4
    :try_start_1
    iget-object v2, p0, Le/e/a/LocalReload244$Job;->cache:Le/e/a/LocalReload244$CachePull;

    iget-object v2, v2, Le/e/a/LocalReload244$CachePull;->a:Lcom/sauzask/nicoid/NicoidCacheManagerActivity;

    .line 115
    iget-object v3, v2, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->A:Landroid/widget/ListView;

    iget-object v4, p0, Le/e/a/LocalReload244$Job;->list:Landroid/widget/ListView;

    if-ne v3, v4, :cond_5

    iget-boolean v3, v2, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->G:Z

    if-nez v3, :cond_5

    iget-object v3, v2, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->z:Ljava/util/ArrayList;

    if-eqz v3, :cond_5

    iget-object v3, v2, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->C:Le/e/a/b0;

    if-eqz v3, :cond_5

    .line 117
    new-instance v3, Ljava/util/ArrayList;

    iget-object v4, v2, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->z:Ljava/util/ArrayList;

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iget-wide v4, v2, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->M:J
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 118
    :try_start_2
    iget-object v6, v2, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->z:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->clear()V

    iget-wide v6, p0, Le/e/a/LocalReload244$Job;->bytes:J

    iput-wide v6, v2, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->M:J

    new-instance v6, Le/e/a/n$a;

    new-instance v7, Le/e/a/n;

    invoke-direct {v7, v2}, Le/e/a/n;-><init>(Lcom/sauzask/nicoid/NicoidCacheManagerActivity;)V

    iget-object v8, p0, Le/e/a/LocalReload244$Job;->rows:Ljava/util/ArrayList;

    invoke-direct {v6, v7, v8}, Le/e/a/n$a;-><init>(Le/e/a/n;Ljava/util/ArrayList;)V

    invoke-virtual {v6}, Le/e/a/n$a;->run()V
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 119
    nop

    .line 120
    :try_start_3
    iget-object v2, p0, Le/e/a/LocalReload244$Job;->list:Landroid/widget/ListView;

    const/4 v3, 0x0

    invoke-static {v3, v2}, Le/e/a/LocalReload244;->top(Ljava/lang/Object;Landroid/widget/ListView;)V

    .line 122
    :goto_0
    const-string v2, "Local list reload completed"

    invoke-static {v0, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 119
    :catch_0
    move-exception v6

    iget-object v7, v2, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->z:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->clear()V

    iget-object v7, v2, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->z:Ljava/util/ArrayList;

    invoke-virtual {v7, v3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    iput-wide v4, v2, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->M:J

    iget-object v2, v2, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->C:Le/e/a/b0;

    invoke-virtual {v2}, Le/e/a/b0;->notifyDataSetChanged()V

    throw v6
    :try_end_3
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 124
    :cond_5
    # getter for: Le/e/a/LocalReload244;->ACTIVE:Ljava/util/Map;
    invoke-static {}, Le/e/a/LocalReload244;->access$200()Ljava/util/Map;

    move-result-object v0

    iget-object v2, p0, Le/e/a/LocalReload244$Job;->list:Landroid/widget/ListView;

    invoke-interface {v0, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Le/e/a/LocalReload244$Job;->list:Landroid/widget/ListView;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setEnabled(Z)V

    invoke-virtual {p0}, Le/e/a/LocalReload244$Job;->stop()V

    .line 115
    return-void

    .line 124
    :cond_6
    # getter for: Le/e/a/LocalReload244;->ACTIVE:Ljava/util/Map;
    invoke-static {}, Le/e/a/LocalReload244;->access$200()Ljava/util/Map;

    move-result-object v0

    iget-object v2, p0, Le/e/a/LocalReload244$Job;->list:Landroid/widget/ListView;

    invoke-interface {v0, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Le/e/a/LocalReload244$Job;->list:Landroid/widget/ListView;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setEnabled(Z)V

    invoke-virtual {p0}, Le/e/a/LocalReload244$Job;->stop()V

    .line 105
    return-void

    .line 123
    :catch_1
    move-exception v2

    :try_start_4
    const-string v3, "Local reload completion failed"

    invoke-static {v0, v3, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 124
    :goto_1
    # getter for: Le/e/a/LocalReload244;->ACTIVE:Ljava/util/Map;
    invoke-static {}, Le/e/a/LocalReload244;->access$200()Ljava/util/Map;

    move-result-object v0

    iget-object v2, p0, Le/e/a/LocalReload244$Job;->list:Landroid/widget/ListView;

    invoke-interface {v0, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Le/e/a/LocalReload244$Job;->list:Landroid/widget/ListView;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setEnabled(Z)V

    invoke-virtual {p0}, Le/e/a/LocalReload244$Job;->stop()V

    .line 125
    return-void

    .line 124
    :catchall_0
    move-exception v0

    # getter for: Le/e/a/LocalReload244;->ACTIVE:Ljava/util/Map;
    invoke-static {}, Le/e/a/LocalReload244;->access$200()Ljava/util/Map;

    move-result-object v2

    iget-object v3, p0, Le/e/a/LocalReload244$Job;->list:Landroid/widget/ListView;

    invoke-interface {v2, v3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v2, p0, Le/e/a/LocalReload244$Job;->list:Landroid/widget/ListView;

    invoke-virtual {v2, v1}, Landroid/widget/ListView;->setEnabled(Z)V

    invoke-virtual {p0}, Le/e/a/LocalReload244$Job;->stop()V

    throw v0
.end method

.method public run()V
    .registers 4

    .line 97
    :try_start_0
    iget v0, p0, Le/e/a/LocalReload244$Job;->type:I

    const/16 v1, 0x8

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Le/e/a/LocalReload244$Job;->activity:Landroid/app/Activity;

    iget-boolean v1, p0, Le/e/a/LocalReload244$Job;->thumbnails:Z

    invoke-static {v0, v1}, Le/e/a/LocalReload244;->history(Landroid/content/Context;Z)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Le/e/a/LocalReload244$Job;->rows:Ljava/util/ArrayList;

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Le/e/a/LocalReload244$Job;->rows:Ljava/util/ArrayList;

    iget-object v0, p0, Le/e/a/LocalReload244$Job;->rows:Ljava/util/ArrayList;

    iget-object v1, p0, Le/e/a/LocalReload244$Job;->activity:Landroid/app/Activity;

    invoke-static {v0, v1}, Le/e/a/CacheListing;->load(Ljava/util/ArrayList;Landroid/content/Context;)J

    move-result-wide v0

    iput-wide v0, p0, Le/e/a/LocalReload244$Job;->bytes:J

    :goto_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/LocalReload244$Job;->success:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 98
    goto :goto_1

    :catch_0
    move-exception v0

    const-string v1, "nicoid-refresh244"

    const-string v2, "Local reload failed; retained displayed rows"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 99
    :goto_1
    # getter for: Le/e/a/LocalReload244;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/LocalReload244;->access$100()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Le/e/a/LocalReload244$Job$0;

    invoke-direct {v1, p0}, Le/e/a/LocalReload244$Job$0;-><init>(Le/e/a/LocalReload244$Job;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 100
    return-void
.end method

.method stop()V
    .registers 3

    .line 101
    iget-object v0, p0, Le/e/a/LocalReload244$Job;->search:Le/e/a/SearchSwipe;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Le/e/a/LocalReload244$Job;->search:Le/e/a/SearchSwipe;

    invoke-virtual {v0, v1}, Le/e/a/SearchSwipe;->setRefreshing(Z)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Le/e/a/LocalReload244$Job;->cache:Le/e/a/LocalReload244$CachePull;

    iget-object v0, v0, Le/e/a/LocalReload244$CachePull;->wrapper:Le/e/a/FeedRefresh209;

    invoke-virtual {v0, v1}, Le/e/a/FeedRefresh209;->setRefreshing(Z)V

    :goto_0
    return-void
.end method
