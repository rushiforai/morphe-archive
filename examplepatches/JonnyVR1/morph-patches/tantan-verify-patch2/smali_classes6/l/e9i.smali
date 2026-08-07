.class public Ll/e9i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;
.implements Ll/s2m;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/d9i;",
        ">;",
        "Ll/s2m;"
    }
.end annotation


# instance fields
.field public a:Landroid/widget/FrameLayout;

.field public b:Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicMomentFragment;

.field public c:Ll/d9i;

.field public d:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

.field public e:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicMomentFragment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/e9i;->b:Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicMomentFragment;

    .line 5
    .line 6
    return-void
.end method

.method private e()Ll/ld70;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e9i;->e:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->z:Ll/y670;

    .line 4
    .line 5
    check-cast p0, Ll/ld70;

    .line 6
    .line 7
    return-object p0
.end method

.method private f()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/e9i;->b:Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicMomentFragment;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "PhotoAlbumFeedBaseFrag"

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 14
    .line 15
    iput-object v0, p0, Ll/e9i;->e:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    const/4 v2, 0x1

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget-object v0, p0, Ll/e9i;->e:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 25
    .line 26
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->k5(Z)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/e9i;->e:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 30
    .line 31
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->j5(Z)V

    .line 32
    .line 33
    .line 34
    invoke-direct {p0}, Ll/e9i;->l()V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    iget-object v0, p0, Ll/e9i;->c:Ll/d9i;

    .line 39
    .line 40
    iget-object v3, v0, Ll/d9i;->g:Ljava/lang/String;

    .line 41
    .line 42
    iget-object v4, v0, Ll/d9i;->e:Ljava/lang/String;

    .line 43
    .line 44
    iget-object v5, v0, Ll/d9i;->a:Ljava/lang/String;

    .line 45
    .line 46
    iget v0, v0, Ll/d9i;->b:I

    .line 47
    .line 48
    invoke-static {v3, v4, v5, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;->q5(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iput-object v0, p0, Ll/e9i;->e:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 53
    .line 54
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->k5(Z)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ll/e9i;->e:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 58
    .line 59
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->j5(Z)V

    .line 60
    .line 61
    .line 62
    invoke-direct {p0}, Ll/e9i;->l()V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Ll/e9i;->b:Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicMomentFragment;

    .line 66
    .line 67
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    sget v2, Ll/hdc0;->g:I

    .line 76
    .line 77
    iget-object p0, p0, Ll/e9i;->e:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 78
    .line 79
    invoke-virtual {v0, v2, p0, v1}, Landroidx/fragment/app/k;->c(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/k;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0}, Landroidx/fragment/app/k;->j()I

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method private l()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/e9i;->e:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->h5(Ll/s2m;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public L0()Ll/n570;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e9i;->c:Ll/d9i;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/d9i;->k0()Ll/n570;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public X0()Ll/s8h;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/f9i;->b(Ll/e9i;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public b()V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/f9i;->c(Ll/e9i;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c(Ll/d9i;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/e9i;->c:Ll/d9i;

    .line 2
    .line 3
    return-void
.end method

.method public d()Lv/VRecyclerView;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/e9i;->e()Ll/ld70;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Ll/ld70;->p:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 6
    .line 7
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public i(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/e9i;->f()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/d9i;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/e9i;->c(Ll/d9i;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/e9i;->a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p1, -0x1

    .line 6
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 7
    .line 8
    .line 9
    return-object p0
.end method

.method public j()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/e9i;->e()Ll/ld70;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/ld70;->z()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public k(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e9i;->c:Ll/d9i;

    .line 2
    .line 3
    iget-object p0, p0, Ll/d9i;->j:Lrx/subjects/a;

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public n1(Ljava/util/List;ZLcom/p1/mobile/putong/data/User;I)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;",
            ">;Z",
            "Lcom/p1/mobile/putong/data/User;",
            "I)Z"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public p()V
    .locals 0

    .line 1
    return-void
.end method

.method public s0()Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;
    .locals 7

    .line 1
    iget-object v2, p0, Ll/e9i;->c:Ll/d9i;

    .line 2
    .line 3
    iget-boolean v0, v2, Ll/d9i;->k:Z

    .line 4
    .line 5
    iget-object v1, p0, Ll/e9i;->e:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Ll/tsb0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/e9i;->d()Lv/VRecyclerView;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    iget-object v4, p0, Ll/e9i;->c:Ll/d9i;

    .line 16
    .line 17
    move-object v5, v4

    .line 18
    iget-object v4, v5, Ll/d9i;->g:Ljava/lang/String;

    .line 19
    .line 20
    move-object v6, v5

    .line 21
    iget-object v5, v6, Ll/d9i;->a:Ljava/lang/String;

    .line 22
    .line 23
    iget v6, v6, Ll/d9i;->b:I

    .line 24
    .line 25
    invoke-direct/range {v0 .. v6}, Ll/tsb0;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;Ll/d9i;Lv/VRecyclerView;Ljava/lang/String;Ljava/lang/String;I)V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Ll/e9i;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 29
    .line 30
    return-object v0

    .line 31
    :cond_0
    new-instance v0, Ll/e7j0;

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/e9i;->d()Lv/VRecyclerView;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    iget-object v4, p0, Ll/e9i;->c:Ll/d9i;

    .line 38
    .line 39
    move-object v5, v4

    .line 40
    iget-object v4, v5, Ll/d9i;->g:Ljava/lang/String;

    .line 41
    .line 42
    move-object v6, v5

    .line 43
    iget-object v5, v6, Ll/d9i;->a:Ljava/lang/String;

    .line 44
    .line 45
    iget v6, v6, Ll/d9i;->b:I

    .line 46
    .line 47
    invoke-direct/range {v0 .. v6}, Ll/e7j0;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;Ll/d9i;Lv/VRecyclerView;Ljava/lang/String;Ljava/lang/String;I)V

    .line 48
    .line 49
    .line 50
    iput-object v0, p0, Ll/e9i;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 51
    .line 52
    return-object v0
.end method
