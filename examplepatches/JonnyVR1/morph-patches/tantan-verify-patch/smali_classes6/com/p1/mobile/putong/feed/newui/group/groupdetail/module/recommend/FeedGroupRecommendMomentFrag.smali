.class public Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/recommend/FeedGroupRecommendMomentFrag;
.super Lcom/p1/mobile/putong/app/PutongFrag;
.source "SourceFile"

# interfaces
.implements Ll/s2m;
.implements Ll/n2m;
.implements Ll/v0q;


# instance fields
.field public A:Landroid/widget/FrameLayout;

.field public B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

.field public C:Ljava/lang/String;

.field public D:Ljava/lang/String;

.field public E:Ljava/lang/String;

.field public F:Z

.field public G:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

.field public H:Ll/s8h;

.field public I:Ll/b8h;

.field public J:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

.field public z:Landroid/widget/LinearLayout;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic M4(Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/recommend/FeedGroupRecommendMomentFrag;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/recommend/FeedGroupRecommendMomentFrag;->Q4(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic N4(Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/recommend/FeedGroupRecommendMomentFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/recommend/FeedGroupRecommendMomentFrag;->P4()V

    return-void
.end method

.method private synthetic P4()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/recommend/FeedGroupRecommendMomentFrag;->I:Ll/b8h;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/b8h;->A()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic Q4(Ll/uxj0;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Ll/e8h;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/e8h;-><init>(Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/recommend/FeedGroupRecommendMomentFrag;)V

    .line 8
    .line 9
    .line 10
    const-wide/16 v1, 0x3e8

    .line 11
    .line 12
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 13
    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public B3(Ll/pf60;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/lang/Boolean;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public B4()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public L0()Ll/n570;
    .locals 3

    .line 1
    new-instance v0, Ll/b8h;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/recommend/FeedGroupRecommendMomentFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/recommend/FeedGroupRecommendMomentFrag;->D:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Ll/b8h;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/recommend/FeedGroupRecommendMomentFrag;->I:Ll/b8h;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/recommend/FeedGroupRecommendMomentFrag;->E:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ll/b8h;->W(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/recommend/FeedGroupRecommendMomentFrag;->I:Ll/b8h;

    .line 18
    .line 19
    return-object p0
.end method

.method public N0()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/recommend/FeedGroupRecommendMomentFrag;->F:Z

    .line 3
    .line 4
    return-void
.end method

.method public O4(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/f8h;->b(Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/recommend/FeedGroupRecommendMomentFrag;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Q0()Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/recommend/FeedGroupRecommendMomentFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 2
    .line 3
    return-object p0
.end method

.method public X0()Ll/s8h;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/recommend/FeedGroupRecommendMomentFrag;->H:Ll/s8h;

    .line 2
    .line 3
    return-object p0
.end method

.method public f4()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->u8()Lrx/subjects/a;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ll/d8h;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/d8h;-><init>(Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/recommend/FeedGroupRecommendMomentFrag;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 6

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    const-string v0, "PhotoAlbumFeedBaseFrag"

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 15
    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/recommend/FeedGroupRecommendMomentFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 17
    .line 18
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const-string v1, "user_id"

    .line 23
    .line 24
    invoke-virtual {p1, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/recommend/FeedGroupRecommendMomentFrag;->C:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    const-string v1, "groupId"

    .line 35
    .line 36
    invoke-virtual {p1, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/recommend/FeedGroupRecommendMomentFrag;->D:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    const-string v1, "first_append_moment_id"

    .line 47
    .line 48
    invoke-virtual {p1, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/recommend/FeedGroupRecommendMomentFrag;->E:Ljava/lang/String;

    .line 53
    .line 54
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/recommend/FeedGroupRecommendMomentFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 55
    .line 56
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    const/4 v1, 0x1

    .line 61
    if-eqz p1, :cond_0

    .line 62
    .line 63
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/recommend/FeedGroupRecommendMomentFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 64
    .line 65
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->k5(Z)V

    .line 66
    .line 67
    .line 68
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/recommend/FeedGroupRecommendMomentFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 69
    .line 70
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->j5(Z)V

    .line 71
    .line 72
    .line 73
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/recommend/FeedGroupRecommendMomentFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 74
    .line 75
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->h5(Ll/s2m;)V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/recommend/FeedGroupRecommendMomentFrag;->C:Ljava/lang/String;

    .line 80
    .line 81
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    const-string v3, "selected_item_position"

    .line 86
    .line 87
    invoke-virtual {v2, v3}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 88
    .line 89
    .line 90
    move-result v2

    .line 91
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    const-string v4, "target_moment_id"

    .line 96
    .line 97
    invoke-virtual {v3, v4}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v3

    .line 101
    const/4 v4, 0x7

    .line 102
    const-string v5, "from_group_detail_recommend"

    .line 103
    .line 104
    invoke-static {p1, v5, v2, v3, v4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;->n5(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/recommend/FeedGroupRecommendMomentFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 109
    .line 110
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->k5(Z)V

    .line 111
    .line 112
    .line 113
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/recommend/FeedGroupRecommendMomentFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 114
    .line 115
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->j5(Z)V

    .line 116
    .line 117
    .line 118
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/recommend/FeedGroupRecommendMomentFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 119
    .line 120
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->h5(Ll/s2m;)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    invoke-virtual {p1}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    sget v1, Ll/hdc0;->g:I

    .line 132
    .line 133
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/recommend/FeedGroupRecommendMomentFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 134
    .line 135
    invoke-virtual {p1, v1, p0, v0}, Landroidx/fragment/app/k;->c(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/k;

    .line 136
    .line 137
    .line 138
    invoke-virtual {p1}, Landroidx/fragment/app/k;->j()I

    .line 139
    .line 140
    .line 141
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/recommend/FeedGroupRecommendMomentFrag;->O4(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

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

.method public o()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onResume()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Frag;->onResume()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onStop()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Frag;->onStop()V

    .line 2
    .line 3
    .line 4
    return-void
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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/recommend/FeedGroupRecommendMomentFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 4
    .line 5
    iget-object v2, v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->z:Ll/y670;

    .line 6
    .line 7
    iget-object v2, v2, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 8
    .line 9
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/recommend/FeedGroupRecommendMomentFrag;->C:Ljava/lang/String;

    .line 10
    .line 11
    const/4 v5, 0x7

    .line 12
    const/4 v6, 0x0

    .line 13
    const-string v4, "from_group_detail_recommend"

    .line 14
    .line 15
    invoke-direct/range {v0 .. v6}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;Lv/VRecyclerView;Ljava/lang/String;Ljava/lang/String;IZ)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/recommend/FeedGroupRecommendMomentFrag;->G:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/recommend/FeedGroupRecommendMomentFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->z:Ll/y670;

    .line 23
    .line 24
    iget-object v0, v0, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 25
    .line 26
    const-string v1, "SECOND_RECYCLER_TAG"

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/recommend/FeedGroupRecommendMomentFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->z:Ll/y670;

    .line 34
    .line 35
    iget-object v0, v0, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 36
    .line 37
    invoke-static {}, Ll/bnl0;->w0()I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;->setMaxHeight(I)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/recommend/FeedGroupRecommendMomentFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 45
    .line 46
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->z:Ll/y670;

    .line 47
    .line 48
    iget-object v0, v0, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 49
    .line 50
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/recommend/FeedGroupRecommendMomentFrag;->J:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 51
    .line 52
    const/4 v1, 0x0

    .line 53
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setClipToPadding(Z)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/recommend/FeedGroupRecommendMomentFrag;->J:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 57
    .line 58
    const/high16 v1, 0x431c0000    # 156.0f

    .line 59
    .line 60
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    invoke-static {v0, v1}, Ll/bnl0;->c0(Landroid/view/View;I)V

    .line 65
    .line 66
    .line 67
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/recommend/FeedGroupRecommendMomentFrag;->G:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 68
    .line 69
    return-object p0
.end method

.method public w1()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/recommend/FeedGroupRecommendMomentFrag;->F:Z

    .line 2
    .line 3
    return p0
.end method
