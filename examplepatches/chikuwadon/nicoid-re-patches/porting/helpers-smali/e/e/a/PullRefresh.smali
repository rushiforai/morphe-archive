.class public final Le/e/a/PullRefresh;
.super Ljava/lang/Object;
.source "PullRefresh.java"

# interfaces
.implements Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$h;
.implements Ljava/lang/Runnable;


# instance fields
.field private final fragment:Lcom/sauzask/nicoid/NicoidVideoListFragment;

.field private final layout:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;


# direct methods
.method private constructor <init>(Lcom/sauzask/nicoid/NicoidVideoListFragment;Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/PullRefresh;->fragment:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    iput-object p2, p0, Le/e/a/PullRefresh;->layout:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    return-void
.end method

.method public static install(Lcom/sauzask/nicoid/NicoidVideoListFragment;)V
    .registers 1

    invoke-static {p0}, Le/e/a/SearchSwipe;->install(Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public a()V
    .registers 3

    invoke-static {}, Le/e/a/PageCache;->refresh()V

    iget-object v0, p0, Le/e/a/PullRefresh;->fragment:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    iget-object v1, p0, Le/e/a/PullRefresh;->layout:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    invoke-static {v1}, Le/e/a/RefreshDispatch;->enter(Ljava/lang/Object;)V

    invoke-static {v0, v1}, Le/e/a/FeedbackFixes;->refresh(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public run()V
    .registers 2

    iget-object v0, p0, Le/e/a/PullRefresh;->fragment:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    if-eqz v0, :cond_9

    invoke-virtual {v0}, Landroid/app/Activity;->recreate()V

    :cond_9
    return-void
.end method
