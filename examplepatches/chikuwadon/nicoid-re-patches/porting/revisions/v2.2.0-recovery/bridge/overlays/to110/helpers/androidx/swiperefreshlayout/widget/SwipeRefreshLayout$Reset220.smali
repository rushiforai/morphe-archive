.class public final Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$Reset220;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final view:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;


# direct methods
.method public constructor <init>(Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$Reset220;->view:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    iget-object v0, p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$Reset220;->view:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-boolean v1, v0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->c:Z

    if-nez v1, :cond_0

    iget-boolean v1, v0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->q:Z

    if-nez v1, :cond_0

    iget-boolean v1, v0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->l:Z

    if-nez v1, :cond_0

    iget v1, v0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->f:F

    const/4 v2, 0x0

    cmpl-float v1, v1, v2

    if-nez v1, :cond_0

    invoke-virtual {v0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->c()V

    :cond_0
    return-void
.end method
