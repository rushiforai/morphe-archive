.class public final Le/e/a/SearchSwipe;
.super Landroid/widget/FrameLayout;
.source "SearchSwipe.java"

# interfaces
.implements Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$OnRefreshListener;
.implements Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$OnChildScrollUpCallback;


# instance fields
.field final fragment:Ljava/lang/Object;

.field final list:Landroid/widget/ListView;

.field refreshing:Z

.field final swipe:Landroid/view/ViewGroup;


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/lang/Object;Landroid/widget/ListView;)V
    .registers 7

    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Le/e/a/SearchSwipe;->fragment:Ljava/lang/Object;

    iput-object p3, p0, Le/e/a/SearchSwipe;->list:Landroid/widget/ListView;

    const/4 v1, 0x0

    new-instance v0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    invoke-direct {v0, p1, v1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    iput-object v0, p0, Le/e/a/SearchSwipe;->swipe:Landroid/view/ViewGroup;

    invoke-virtual {v0, p0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setTag(Ljava/lang/Object;)V

    invoke-virtual {v0, p0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setOnRefreshListener(Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$OnRefreshListener;)V

    invoke-virtual {v0, p0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setOnChildScrollUpCallback(Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$OnChildScrollUpCallback;)V

    invoke-static {p1}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v1

    filled-new-array {v1}, [I

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setColorSchemeColors([I)V

    invoke-static {p1}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_0

    const v1, -0xd6d4cf

    goto :goto_0

    :cond_0
    const v1, -0x50506

    :goto_0
    invoke-virtual {v0, v1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setProgressBackgroundColorSchemeColor(I)V

    const/16 v1, 0x40

    invoke-static {p1, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setDistanceToTriggerSync(I)V

    const/4 v1, -0x1

    new-instance v2, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v2, v1, v1}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v0, p3, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v2, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v0, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method public static install(Ljava/lang/Object;)V
    .registers 9

    .line 25
    :try_start_0
    invoke-static {p0}, Le/e/a/LocalReload244;->local(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "d0"

    invoke-static {p0, v0}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/SearchSwipe;->refreshable(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 26
    :cond_0
    const-string v0, "b0"

    invoke-static {p0, v0}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    if-eqz v0, :cond_8

    invoke-virtual {v0}, Landroid/widget/ListView;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    instance-of v1, v1, Landroid/view/ViewGroup;

    if-nez v1, :cond_1

    goto/16 :goto_2

    .line 27
    :cond_1
    invoke-virtual {v0}, Landroid/widget/ListView;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    instance-of v2, v1, Le/e/a/SearchSwipe;

    if-nez v2, :cond_7

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    instance-of v2, v2, Le/e/a/SearchSwipe;

    if-eqz v2, :cond_2

    goto :goto_1

    .line 28
    :cond_2
    nop

    .line 29
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "androidx.swiperefreshlayout.widget.SwipeRefreshLayout"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    move-object v3, v1

    goto :goto_0

    :cond_3
    move-object v3, v0

    move-object v2, v1

    .line 30
    :goto_0
    if-nez v2, :cond_4

    return-void

    :cond_4
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v4

    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    .line 31
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 32
    :try_start_1
    new-instance v6, Le/e/a/SearchSwipe;

    invoke-virtual {v0}, Landroid/widget/ListView;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-direct {v6, v7, p0, v0}, Le/e/a/SearchSwipe;-><init>(Landroid/content/Context;Ljava/lang/Object;Landroid/widget/ListView;)V

    if-eq v3, v0, :cond_5

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_5
    invoke-virtual {v2, v6, v4, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_3

    .line 33
    :catch_0
    move-exception p0

    :try_start_2
    invoke-virtual {v0}, Landroid/widget/ListView;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    instance-of v2, v2, Landroid/view/ViewGroup;

    if-eqz v2, :cond_6

    invoke-virtual {v0}, Landroid/widget/ListView;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_6
    new-instance v2, Landroid/view/ViewGroup$LayoutParams;

    const/4 v3, -0x1

    invoke-direct {v2, v3, v3}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v0, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    throw p0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 27
    :cond_7
    :goto_1
    return-void

    .line 26
    :cond_8
    :goto_2
    return-void

    .line 34
    :catch_1
    move-exception p0

    const-string v0, "nicoid-refresh"

    const-string v1, "Refresh binding failed"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_3
    return-void
.end method

.method static mylistRoute243(Ljava/lang/String;)Z
    .registers 2

    if-eqz p0, :cond_0

    const-string v0, "(?:[0-9]+|deflist|https?://www\\.nicovideo\\.jp/(?:mylist|user)/[0-9]+(?:[/?#].*)?|https://nvapi\\.nicovideo\\.jp/v2/(?:mylists/[0-9]+|users/[0-9]+/videos)(?:[/?#].*)?)"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method static refreshable(Ljava/lang/String;)Z
    .registers 2

    .line 23
    if-eqz p0, :cond_1

    invoke-static {p0}, Le/e/a/SearchSwipe;->mylistRoute243(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "/search/video"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "nicovideo.jp/search/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "nicovideo.jp/tag/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "/ranking/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "/by_ranking"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "/watch/history"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_1

    :cond_0
    const/4 p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method


# virtual methods
.method begin()V
    .registers 3

    .line 22
    iget-boolean v0, p0, Le/e/a/SearchSwipe;->refreshing:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Le/e/a/SearchSwipe;->fragment:Ljava/lang/Object;

    check-cast v0, Lcom/sauzask/nicoid/NicoidVideoListFragment;

    iget-boolean v1, v0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->k0:Z

    if-eqz v1, :cond_1

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Le/e/a/SearchSwipe;->setRefreshing(Z)V

    return-void

    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/SearchSwipe;->refreshing:Z

    iget-object v0, p0, Le/e/a/SearchSwipe;->fragment:Ljava/lang/Object;

    invoke-static {v0}, Le/e/a/LocalReload244;->local(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-static {p0}, Le/e/a/LocalReload244;->start(Le/e/a/SearchSwipe;)V

    return-void

    :cond_2
    invoke-static {v0, p0}, Le/e/a/Refresh192;->start(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public c()V
    .registers 2

    .line 38
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Le/e/a/SearchSwipe;->setRefreshing(Z)V

    return-void
.end method

.method public canChildScrollUp(Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;Landroid/view/View;)Z
    .registers 4

    iget-object v0, p0, Le/e/a/SearchSwipe;->fragment:Ljava/lang/Object;

    check-cast v0, Lcom/sauzask/nicoid/NicoidVideoListFragment;

    iget-boolean v0, v0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->k0:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Le/e/a/SearchSwipe;->list:Landroid/widget/ListView;

    invoke-virtual {v0}, Landroid/view/View;->isEnabled()Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, -0x1

    invoke-virtual {v0, p1}, Landroid/view/View;->canScrollVertically(I)Z

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method protected onDetachedFromWindow()V
    .registers 2

    .line 40
    iget-object v0, p0, Le/e/a/SearchSwipe;->fragment:Ljava/lang/Object;

    invoke-static {v0}, Le/e/a/Refresh192;->detach(Ljava/lang/Object;)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Le/e/a/SearchSwipe;->setRefreshing(Z)V

    invoke-super {p0}, Landroid/widget/FrameLayout;->onDetachedFromWindow()V

    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 2

    .line 35
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public onRefresh()V
    .registers 3

    :try_start_0
    invoke-virtual {p0}, Le/e/a/SearchSwipe;->begin()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Le/e/a/SearchSwipe;->setRefreshing(Z)V

    invoke-static {v0}, Le/e/a/FeedbackFixes;->log(Ljava/lang/Exception;)V

    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 2

    .line 36
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public requestDisallowInterceptTouchEvent(Z)V
    .registers 2

    .line 37
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->requestDisallowInterceptTouchEvent(Z)V

    return-void
.end method

.method public setRefreshing(Z)V
    .registers 3

    iput-boolean p1, p0, Le/e/a/SearchSwipe;->refreshing:Z

    iget-object v0, p0, Le/e/a/SearchSwipe;->swipe:Landroid/view/ViewGroup;

    check-cast v0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    invoke-virtual {v0, p1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    return-void
.end method
