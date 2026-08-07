.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/livesuqare/LiveSquareFeedFrag;
.super Lcom/p1/mobile/putong/app/PutongFrag;
.source "SourceFile"

# interfaces
.implements Ll/s2m;


# instance fields
.field public A:Landroid/widget/FrameLayout;

.field public B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

.field public C:Ljava/lang/String;

.field public D:Ljava/lang/String;

.field public E:Ll/e2u;

.field public F:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

.field public z:Landroid/widget/LinearLayout;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "PhotoAlbumFeedBaseFrag"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/livesuqare/LiveSquareFeedFrag;->C:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public static N4(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/livesuqare/LiveSquareFeedFrag;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/livesuqare/LiveSquareFeedFrag;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/livesuqare/LiveSquareFeedFrag;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Landroid/os/Bundle;

    .line 7
    .line 8
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v2, "user_id"

    .line 12
    .line 13
    invoke-virtual {v1, v2, p0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 17
    .line 18
    .line 19
    return-object v0
.end method


# virtual methods
.method public I4()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/livesuqare/LiveSquareFeedFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->z:Ll/y670;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/y670;->z()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public L0()Ll/n570;
    .locals 2

    .line 1
    new-instance v0, Ll/e2u;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/livesuqare/LiveSquareFeedFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/e2u;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;)V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/livesuqare/LiveSquareFeedFrag;->E:Ll/e2u;

    .line 9
    .line 10
    return-object v0
.end method

.method public M4(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/f2u;->b(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/livesuqare/LiveSquareFeedFrag;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public X0()Ll/s8h;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 7

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    const-string v0, "user_id"

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/livesuqare/LiveSquareFeedFrag;->D:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-interface {p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->I4()Z

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/livesuqare/LiveSquareFeedFrag;->C:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 34
    .line 35
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/livesuqare/LiveSquareFeedFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 36
    .line 37
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    const/4 v0, 0x1

    .line 42
    if-eqz p1, :cond_0

    .line 43
    .line 44
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/livesuqare/LiveSquareFeedFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 45
    .line 46
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->k5(Z)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/livesuqare/LiveSquareFeedFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 50
    .line 51
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->j5(Z)V

    .line 52
    .line 53
    .line 54
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/livesuqare/LiveSquareFeedFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 55
    .line 56
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->h5(Ll/s2m;)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/livesuqare/LiveSquareFeedFrag;->D:Ljava/lang/String;

    .line 61
    .line 62
    const/16 v5, 0x13

    .line 63
    .line 64
    const/4 v6, 0x1

    .line 65
    const-string v2, "from_live_square_tab"

    .line 66
    .line 67
    const/4 v3, 0x0

    .line 68
    const-string v4, ""

    .line 69
    .line 70
    invoke-static/range {v1 .. v6}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;->p5(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;IZ)Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/livesuqare/LiveSquareFeedFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 75
    .line 76
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->k5(Z)V

    .line 77
    .line 78
    .line 79
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/livesuqare/LiveSquareFeedFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 80
    .line 81
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->j5(Z)V

    .line 82
    .line 83
    .line 84
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/livesuqare/LiveSquareFeedFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 85
    .line 86
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->h5(Ll/s2m;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-virtual {p1}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    sget v0, Ll/hdc0;->g:I

    .line 98
    .line 99
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/livesuqare/LiveSquareFeedFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 100
    .line 101
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/livesuqare/LiveSquareFeedFrag;->C:Ljava/lang/String;

    .line 102
    .line 103
    invoke-virtual {p1, v0, v1, p0}, Landroidx/fragment/app/k;->c(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/k;

    .line 104
    .line 105
    .line 106
    invoke-virtual {p1}, Landroidx/fragment/app/k;->j()I

    .line 107
    .line 108
    .line 109
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/livesuqare/LiveSquareFeedFrag;->M4(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
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
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/livesuqare/LiveSquareFeedFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 4
    .line 5
    iget-object v2, v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->z:Ll/y670;

    .line 6
    .line 7
    iget-object v2, v2, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 8
    .line 9
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/livesuqare/LiveSquareFeedFrag;->D:Ljava/lang/String;

    .line 10
    .line 11
    const/16 v5, 0x13

    .line 12
    .line 13
    const/4 v6, 0x1

    .line 14
    const-string v4, "from_live_square_tab"

    .line 15
    .line 16
    invoke-direct/range {v0 .. v6}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;Lv/VRecyclerView;Ljava/lang/String;Ljava/lang/String;IZ)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/livesuqare/LiveSquareFeedFrag;->F:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 20
    .line 21
    return-object v0
.end method
