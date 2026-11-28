.class final Le/e/a/LocalRefresh243;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;
.implements Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$OnChildScrollUpCallback;


# instance fields
.field private final page:Le/e/a/LocalPlaylists$Page;

.field private wrapper:Le/e/a/FeedRefresh209;


# direct methods
.method private constructor <init>(Le/e/a/LocalPlaylists$Page;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/LocalRefresh243;->page:Le/e/a/LocalPlaylists$Page;

    return-void
.end method

.method public static add(Le/e/a/LocalPlaylists$Page;Landroid/view/ViewGroup;Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    .registers 7

    new-instance v0, Le/e/a/LocalRefresh243;

    invoke-direct {v0, p0}, Le/e/a/LocalRefresh243;-><init>(Le/e/a/LocalPlaylists$Page;)V

    new-instance v1, Le/e/a/FeedRefresh209;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2, p2, v0}, Le/e/a/FeedRefresh209;-><init>(Landroid/content/Context;Landroid/view/View;Ljava/lang/Runnable;)V

    iput-object v1, v0, Le/e/a/LocalRefresh243;->wrapper:Le/e/a/FeedRefresh209;

    iget-object v2, v1, Le/e/a/FeedRefresh209;->swipe:Landroid/view/ViewGroup;

    check-cast v2, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    invoke-virtual {v2, v0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setOnChildScrollUpCallback(Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$OnChildScrollUpCallback;)V

    invoke-virtual {p1, v1, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method


# virtual methods
.method public canChildScrollUp(Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;Landroid/view/View;)Z
    .registers 4

    iget-object v0, p0, Le/e/a/LocalRefresh243;->page:Le/e/a/LocalPlaylists$Page;

    invoke-virtual {v0}, Le/e/a/LocalPlaylists$Page;->canRefresh243()Z

    move-result v0

    if-eqz v0, :cond_0

    if-eqz p2, :cond_0

    const/4 v0, -0x1

    invoke-virtual {p2, v0}, Landroid/view/View;->canScrollVertically(I)Z

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method public run()V
    .registers 3

    iget-object v0, p0, Le/e/a/LocalRefresh243;->wrapper:Le/e/a/FeedRefresh209;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Le/e/a/FeedRefresh209;->setRefreshing(Z)V

    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Le/e/a/LocalRefresh243;->page:Le/e/a/LocalPlaylists$Page;

    invoke-virtual {v0}, Le/e/a/LocalPlaylists$Page;->canRefresh243()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Le/e/a/LocalPlaylists$Page;->render()V

    :cond_0
    return-void
.end method
