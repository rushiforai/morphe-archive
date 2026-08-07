.class public Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;
.super Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;
.source "SourceFile"

# interfaces
.implements Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$j;


# instance fields
.field public S:Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;

.field public T:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public static synthetic w(Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;JLl/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;->z(JLl/uxj0;)V

    return-void
.end method

.method public static synthetic x(Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;->A(Ljava/lang/Throwable;)V

    return-void
.end method


# virtual methods
.method public final synthetic A(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public onFinishInflate()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;->y(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;->S:Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setOnRefreshListener(Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$j;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;->S:Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;

    .line 13
    .line 14
    sget v0, Ll/k9c0;->k0:I

    .line 15
    .line 16
    sget v1, Ll/k9c0;->h0:I

    .line 17
    .line 18
    sget v2, Ll/k9c0;->i0:I

    .line 19
    .line 20
    sget v3, Ll/k9c0;->j0:I

    .line 21
    .line 22
    filled-new-array {v0, v1, v2, v3}, [I

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p0, v0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setColorSchemeResources([I)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public p()V
    .locals 4

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;->T:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 6
    .line 7
    invoke-virtual {v2}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->V()Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    new-instance v3, Ll/g110;

    .line 12
    .line 13
    invoke-direct {v3, p0, v0, v1}, Ll/g110;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;J)V

    .line 14
    .line 15
    .line 16
    new-instance v0, Ll/h110;

    .line 17
    .line 18
    invoke-direct {v0, p0}, Ll/h110;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v3, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final y(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/i110;->a(Lcom/p1/mobile/putong/feed/ui/moments/MomentsOrStoriesFeedPage;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic z(JLl/uxj0;)V
    .locals 2

    .line 1
    const/4 p3, 0x0

    .line 2
    invoke-virtual {p0, p3}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    .line 3
    .line 4
    .line 5
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    sub-long/2addr v0, p1

    .line 10
    const-string p0, "moments"

    .line 11
    .line 12
    invoke-static {p0, v0, v1}, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil;->b0(Ljava/lang/String;J)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
