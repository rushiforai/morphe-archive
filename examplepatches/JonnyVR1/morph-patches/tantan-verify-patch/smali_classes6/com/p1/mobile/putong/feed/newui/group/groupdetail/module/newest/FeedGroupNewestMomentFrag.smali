.class public Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/newest/FeedGroupNewestMomentFrag;
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

.field public E:Z

.field public F:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

.field public G:Ll/s8h;

.field public H:Ll/fkh;

.field public I:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

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

.method public static synthetic M4(Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/newest/FeedGroupNewestMomentFrag;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/newest/FeedGroupNewestMomentFrag;->Q4(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic N4(Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/newest/FeedGroupNewestMomentFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/newest/FeedGroupNewestMomentFrag;->P4()V

    return-void
.end method

.method private synthetic P4()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/newest/FeedGroupNewestMomentFrag;->H:Ll/fkh;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/fkh;->A()V

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
    new-instance v0, Ll/r7h;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/r7h;-><init>(Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/newest/FeedGroupNewestMomentFrag;)V

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
    new-instance v0, Ll/fkh;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/newest/FeedGroupNewestMomentFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/newest/FeedGroupNewestMomentFrag;->D:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Ll/fkh;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/newest/FeedGroupNewestMomentFrag;->H:Ll/fkh;

    .line 11
    .line 12
    return-object v0
.end method

.method public N0()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/newest/FeedGroupNewestMomentFrag;->E:Z

    .line 3
    .line 4
    return-void
.end method

.method public O4(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/s7h;->b(Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/newest/FeedGroupNewestMomentFrag;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/newest/FeedGroupNewestMomentFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 2
    .line 3
    return-object p0
.end method

.method public X0()Ll/s8h;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/newest/FeedGroupNewestMomentFrag;->G:Ll/s8h;

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
    new-instance v1, Ll/q7h;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/q7h;-><init>(Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/newest/FeedGroupNewestMomentFrag;)V

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
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/newest/FeedGroupNewestMomentFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

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
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/newest/FeedGroupNewestMomentFrag;->C:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/newest/FeedGroupNewestMomentFrag;->D:Ljava/lang/String;

    .line 41
    .line 42
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/newest/FeedGroupNewestMomentFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 43
    .line 44
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    const/4 v1, 0x1

    .line 49
    if-eqz p1, :cond_0

    .line 50
    .line 51
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/newest/FeedGroupNewestMomentFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 52
    .line 53
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->k5(Z)V

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/newest/FeedGroupNewestMomentFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 57
    .line 58
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->j5(Z)V

    .line 59
    .line 60
    .line 61
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/newest/FeedGroupNewestMomentFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 62
    .line 63
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->h5(Ll/s2m;)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/newest/FeedGroupNewestMomentFrag;->C:Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    const-string v3, "selected_item_position"

    .line 74
    .line 75
    invoke-virtual {v2, v3}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 80
    .line 81
    .line 82
    move-result-object v3

    .line 83
    const-string v4, "target_moment_id"

    .line 84
    .line 85
    invoke-virtual {v3, v4}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v3

    .line 89
    const/4 v4, 0x7

    .line 90
    const-string v5, "from_group_detail_new"

    .line 91
    .line 92
    invoke-static {p1, v5, v2, v3, v4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;->n5(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/newest/FeedGroupNewestMomentFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 97
    .line 98
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->k5(Z)V

    .line 99
    .line 100
    .line 101
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/newest/FeedGroupNewestMomentFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 102
    .line 103
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->j5(Z)V

    .line 104
    .line 105
    .line 106
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/newest/FeedGroupNewestMomentFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 107
    .line 108
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->h5(Ll/s2m;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    invoke-virtual {p1}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    sget v1, Ll/hdc0;->g:I

    .line 120
    .line 121
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/newest/FeedGroupNewestMomentFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 122
    .line 123
    invoke-virtual {p1, v1, p0, v0}, Landroidx/fragment/app/k;->c(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/k;

    .line 124
    .line 125
    .line 126
    invoke-virtual {p1}, Landroidx/fragment/app/k;->j()I

    .line 127
    .line 128
    .line 129
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/newest/FeedGroupNewestMomentFrag;->O4(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/newest/FeedGroupNewestMomentFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 4
    .line 5
    iget-object v2, v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->z:Ll/y670;

    .line 6
    .line 7
    iget-object v2, v2, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 8
    .line 9
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/newest/FeedGroupNewestMomentFrag;->C:Ljava/lang/String;

    .line 10
    .line 11
    const/4 v5, 0x7

    .line 12
    const/4 v6, 0x0

    .line 13
    const-string v4, "from_group_detail_new"

    .line 14
    .line 15
    invoke-direct/range {v0 .. v6}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;Lv/VRecyclerView;Ljava/lang/String;Ljava/lang/String;IZ)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/newest/FeedGroupNewestMomentFrag;->F:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/newest/FeedGroupNewestMomentFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/newest/FeedGroupNewestMomentFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/newest/FeedGroupNewestMomentFrag;->B:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 45
    .line 46
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->z:Ll/y670;

    .line 47
    .line 48
    iget-object v0, v0, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 49
    .line 50
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/newest/FeedGroupNewestMomentFrag;->I:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 51
    .line 52
    const/high16 v1, 0x431c0000    # 156.0f

    .line 53
    .line 54
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    invoke-static {v0, v1}, Ll/bnl0;->c0(Landroid/view/View;I)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/newest/FeedGroupNewestMomentFrag;->I:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 62
    .line 63
    const/4 v1, 0x0

    .line 64
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setClipToPadding(Z)V

    .line 65
    .line 66
    .line 67
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/newest/FeedGroupNewestMomentFrag;->F:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 68
    .line 69
    return-object p0
.end method

.method public w1()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/newest/FeedGroupNewestMomentFrag;->E:Z

    .line 2
    .line 3
    return p0
.end method
