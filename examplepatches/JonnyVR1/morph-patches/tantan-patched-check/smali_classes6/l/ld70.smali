.class public Ll/ld70;
.super Ll/y670;
.source "SourceFile"

# interfaces
.implements Ll/jn50;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/y670<",
        "Ll/kd70;",
        ">;",
        "Ll/jn50;"
    }
.end annotation


# instance fields
.field public n:Lv/VFrame;

.field public o:Lv/VPullDownRefreshLayout;

.field public p:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

.field public q:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/y670;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public I()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ld70;->p:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 2
    .line 3
    iput-object v0, p0, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 4
    .line 5
    return-void
.end method

.method public L(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ld70;->o:Lv/VPullDownRefreshLayout;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0, p1}, Lv/smart_refresh/SmartRefreshLayout;->w(Z)Ll/mvc0;

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public M(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/md70;->b(Ll/ld70;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public N()V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/md70;->c(Ll/ld70;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public O(Ll/kd70;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y670;->d:Ll/v670;

    .line 2
    .line 3
    return-void
.end method

.method public P(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/ld70;->q:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public Q()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ld70;->o:Lv/VPullDownRefreshLayout;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    invoke-virtual {p0, v0}, Lv/smart_refresh/SmartRefreshLayout;->w(Z)Ll/mvc0;

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/kd70;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ld70;->O(Ll/kd70;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public n(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ld70;->M(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p2, p0, Ll/y670;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 6
    .line 7
    invoke-virtual {p2}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    sget v0, Ll/k9c0;->p0:I

    .line 12
    .line 13
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    invoke-interface {p2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->I4()Z

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    if-eqz p2, :cond_0

    .line 29
    .line 30
    iget-object p0, p0, Ll/y670;->d:Ll/v670;

    .line 31
    .line 32
    iget-object p0, p0, Ll/v670;->d:Ljava/lang/String;

    .line 33
    .line 34
    const-string p2, "from_live_square_tab"

    .line 35
    .line 36
    invoke-static {p0, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    :cond_0
    return-object p1
.end method

.method public v(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/y670;->v(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/ld70;->o:Lv/VPullDownRefreshLayout;

    .line 5
    .line 6
    invoke-virtual {p1, p0}, Lv/VPullDownRefreshLayout;->O(Ll/jn50;)Ll/mvc0;

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Ll/y670;->d:Ll/v670;

    .line 10
    .line 11
    iget-boolean p1, p1, Ll/v670;->i:Z

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/ld70;->o:Lv/VPullDownRefreshLayout;

    .line 16
    .line 17
    invoke-virtual {p0}, Lv/smart_refresh/SmartRefreshLayout;->l()Z

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public w()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ld70;->o:Lv/VPullDownRefreshLayout;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-virtual {p0}, Lv/smart_refresh/SmartRefreshLayout;->B()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public w2(Ll/mvc0;)V
    .locals 1
    .param p1    # Ll/mvc0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    iget-object p1, p0, Ll/y670;->d:Ll/v670;

    .line 2
    .line 3
    iget-object p1, p1, Ll/v670;->b:Ll/n570;

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ld70;->Q()V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Lcom/p1/mobile/putong/feed/helper/exception/FeedOnRefreshException;->reportFeedOnRefreshException()V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-static {}, Ll/cmg;->K()Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    sget-object p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->K0:Lrx/subjects/b;

    .line 21
    .line 22
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    :cond_1
    iget-object p1, p0, Ll/ld70;->q:Ll/y20;

    .line 28
    .line 29
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_2

    .line 34
    .line 35
    iget-object p1, p0, Ll/ld70;->q:Ll/y20;

    .line 36
    .line 37
    const-string v0, ""

    .line 38
    .line 39
    invoke-interface {p1, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    :cond_2
    invoke-virtual {p0}, Ll/y670;->y()V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public z()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ld70;->o:Lv/VPullDownRefreshLayout;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Lv/smart_refresh/SmartRefreshLayout;->B()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p0, Ll/ld70;->o:Lv/VPullDownRefreshLayout;

    .line 13
    .line 14
    invoke-virtual {v0}, Lv/smart_refresh/SmartRefreshLayout;->l()Z

    .line 15
    .line 16
    .line 17
    invoke-super {p0}, Ll/y670;->z()V

    .line 18
    .line 19
    .line 20
    :cond_1
    :goto_0
    return-void
.end method
