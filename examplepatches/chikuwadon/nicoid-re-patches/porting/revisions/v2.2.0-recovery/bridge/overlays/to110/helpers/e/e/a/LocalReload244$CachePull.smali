.class final Le/e/a/LocalReload244$CachePull;
.super Ljava/lang/Object;
.source "LocalReload244.java"

# interfaces
.implements Ljava/lang/Runnable;
.implements Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$OnChildScrollUpCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/LocalReload244;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "CachePull"
.end annotation


# instance fields
.field final a:Lcom/sauzask/nicoid/NicoidCacheManagerActivity;

.field final list:Landroid/widget/ListView;

.field wrapper:Le/e/a/FeedRefresh209;


# direct methods
.method constructor <init>(Lcom/sauzask/nicoid/NicoidCacheManagerActivity;Landroid/widget/ListView;)V
    .registers 3

    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/LocalReload244$CachePull;->a:Lcom/sauzask/nicoid/NicoidCacheManagerActivity;

    iput-object p2, p0, Le/e/a/LocalReload244$CachePull;->list:Landroid/widget/ListView;

    return-void
.end method


# virtual methods
.method public canChildScrollUp(Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;Landroid/view/View;)Z
    .registers 3

    .line 81
    iget-object p1, p0, Le/e/a/LocalReload244$CachePull;->a:Lcom/sauzask/nicoid/NicoidCacheManagerActivity;

    iget-boolean p1, p1, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->G:Z

    if-nez p1, :cond_0

    iget-object p1, p0, Le/e/a/LocalReload244$CachePull;->list:Landroid/widget/ListView;

    invoke-virtual {p1}, Landroid/widget/ListView;->isEnabled()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Le/e/a/LocalReload244$CachePull;->list:Landroid/widget/ListView;

    const/4 p2, -0x1

    invoke-virtual {p1, p2}, Landroid/widget/ListView;->canScrollVertically(I)Z

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const/4 p1, 0x1

    :goto_0
    return p1
.end method

.method public run()V
    .registers 9

    .line 82
    iget-object v0, p0, Le/e/a/LocalReload244$CachePull;->a:Lcom/sauzask/nicoid/NicoidCacheManagerActivity;

    iget-boolean v0, v0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->G:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Le/e/a/LocalReload244$CachePull;->a:Lcom/sauzask/nicoid/NicoidCacheManagerActivity;

    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->A:Landroid/widget/ListView;

    iget-object v1, p0, Le/e/a/LocalReload244$CachePull;->list:Landroid/widget/ListView;

    if-ne v0, v1, :cond_0

    new-instance v2, Le/e/a/LocalReload244$Job;

    iget-object v4, p0, Le/e/a/LocalReload244$CachePull;->a:Lcom/sauzask/nicoid/NicoidCacheManagerActivity;

    iget-object v5, p0, Le/e/a/LocalReload244$CachePull;->list:Landroid/widget/ListView;

    const/4 v6, 0x0

    const/4 v3, 0x0

    move-object v7, p0

    invoke-direct/range {v2 .. v7}, Le/e/a/LocalReload244$Job;-><init>(Lcom/sauzask/nicoid/NicoidVideoListFragment;Landroid/app/Activity;Landroid/widget/ListView;Le/e/a/SearchSwipe;Le/e/a/LocalReload244$CachePull;)V

    # invokes: Le/e/a/LocalReload244;->launch(Le/e/a/LocalReload244$Job;)V
    invoke-static {v2}, Le/e/a/LocalReload244;->access$000(Le/e/a/LocalReload244$Job;)V

    return-void

    :cond_0
    iget-object v0, p0, Le/e/a/LocalReload244$CachePull;->wrapper:Le/e/a/FeedRefresh209;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Le/e/a/FeedRefresh209;->setRefreshing(Z)V

    return-void
.end method
