.class public final Le/e/a/FeedRefresh209;
.super Landroid/widget/FrameLayout;
.source "FeedRefresh209.java"

# interfaces
.implements Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$OnRefreshListener;


# instance fields
.field private final content:Landroid/view/View;

.field private final refresh:Ljava/lang/Runnable;

.field final swipe:Landroid/view/ViewGroup;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/view/View;Ljava/lang/Runnable;)V
    .registers 8

    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Le/e/a/FeedRefresh209;->content:Landroid/view/View;

    iput-object p3, p0, Le/e/a/FeedRefresh209;->refresh:Ljava/lang/Runnable;

    const/4 v1, 0x0

    new-instance v0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    invoke-direct {v0, p1, v1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    iput-object v0, p0, Le/e/a/FeedRefresh209;->swipe:Landroid/view/ViewGroup;

    invoke-virtual {v0, p0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setTag(Ljava/lang/Object;)V

    invoke-virtual {v0, p0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setOnRefreshListener(Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$OnRefreshListener;)V

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

    new-instance v1, Le/e/a/FeedRefresh209$1;

    invoke-direct {v1, p0, p1}, Le/e/a/FeedRefresh209$1;-><init>(Le/e/a/FeedRefresh209;Landroid/content/Context;)V

    const/4 v2, -0x1

    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v3, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, p2, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v3, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v3, v2, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v3, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v0, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method static synthetic access$1(Le/e/a/FeedRefresh209;)Landroid/view/View;
    .registers 1

    .line 11
    iget-object p0, p0, Le/e/a/FeedRefresh209;->content:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$2(Landroid/view/View;I)Z
    .registers 2

    .line 33
    invoke-static {p0, p1}, Le/e/a/FeedRefresh209;->scrolls(Landroid/view/View;I)Z

    move-result p0

    return p0
.end method

.method private static scrolls(Landroid/view/View;I)Z
    .registers 6

    .line 33
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    :cond_0
    invoke-virtual {p0, p1}, Landroid/view/View;->canScrollVertically(I)Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    return v2

    :cond_1
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_4

    check-cast p0, Landroid/view/ViewGroup;

    move v0, v1

    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    if-lt v0, v3, :cond_2

    goto :goto_1

    :cond_2
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-static {v3, p1}, Le/e/a/FeedRefresh209;->scrolls(Landroid/view/View;I)Z

    move-result v3

    if-eqz v3, :cond_3

    return v2

    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_4
    :goto_1
    return v1
.end method


# virtual methods
.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 2

    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public onRefresh()V
    .registers 3

    :try_start_0
    iget-object v0, p0, Le/e/a/FeedRefresh209;->refresh:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Le/e/a/FeedRefresh209;->setRefreshing(Z)V

    invoke-static {v0}, Le/e/a/FeedbackFixes;->log(Ljava/lang/Exception;)V

    return-void
.end method

.method public setRefreshing(Z)V
    .registers 3

    iget-object v0, p0, Le/e/a/FeedRefresh209;->swipe:Landroid/view/ViewGroup;

    check-cast v0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    invoke-virtual {v0, p1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    return-void
.end method
