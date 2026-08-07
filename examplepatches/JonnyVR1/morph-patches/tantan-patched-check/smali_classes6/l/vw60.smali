.class public Ll/vw60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;
.implements Landroid/view/View$OnClickListener;
.implements Ll/s2m;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/wv60;",
        ">;",
        "Landroid/view/View$OnClickListener;",
        "Ll/s2m;"
    }
.end annotation


# static fields
.field public static final K:Ll/l4g0;


# instance fields
.field public A:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/AlbumFeedHeader;

.field public B:Ll/tt60;

.field public C:Ll/s8h;

.field public D:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

.field public E:Lcom/p1/mobile/putong/data/User;

.field public F:Z

.field public G:Ll/w30;

.field public H:Ll/th0;

.field public I:Ll/th0;

.field public J:Z

.field public a:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public b:Lv/navigationbar/VNavigationBar;

.field public c:Landroid/widget/FrameLayout;

.field public d:Lv/VFrame;

.field public e:Lv/VLinear;

.field public f:Lv/VImage;

.field public g:Lv/VText;

.field public h:Lv/VLinear;

.field public i:Lv/VImage;

.field public j:Lv/VText;

.field public k:Lv/VRelative;

.field public l:Lv/VButton;

.field public m:Lv/VLinear;

.field public n:Lv/VImage;

.field public o:Lv/VText;

.field public p:Lv/VRelative;

.field public q:Lv/VButton;

.field public r:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public s:Lv/VLinear;

.field public t:Landroid/widget/LinearLayout;

.field public u:Lv/VDraweeView;

.field public v:Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView;

.field public w:Landroid/widget/TextView;

.field public x:Landroid/widget/TextView;

.field public y:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personalfeed/PersonalPhotoAlbumFeedFrag;

.field public z:Ll/wv60;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-class v0, Landroid/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "p_album_more_popup"

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sput-object v0, Ll/vw60;->K:Ll/l4g0;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personalfeed/PersonalPhotoAlbumFeedFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/vw60;->y:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personalfeed/PersonalPhotoAlbumFeedFrag;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic A(Ll/vw60;Lcom/p1/mobile/putong/data/User;[Ljava/lang/Boolean;Ll/x20;ZLjava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/vw60;->c0(Lcom/p1/mobile/putong/data/User;[Ljava/lang/Boolean;Ll/x20;ZLjava/util/List;)V

    return-void
.end method

.method public static synthetic C(Ll/vw60;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/vw60;->f0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic F(Ll/vw60;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vw60;->M(Ljava/lang/String;)V

    return-void
.end method

.method private Q()Lv/VRecyclerView;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vw60;->S()Ll/y670;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 6
    .line 7
    return-object p0
.end method

.method private W()V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/vw60;->y:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personalfeed/PersonalPhotoAlbumFeedFrag;

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
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 14
    .line 15
    iput-object v0, p0, Ll/vw60;->D:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

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
    iget-object v0, p0, Ll/vw60;->D:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 25
    .line 26
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->k5(Z)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/vw60;->D:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 30
    .line 31
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->j5(Z)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Ll/vw60;->x0()V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    iget-object v0, p0, Ll/vw60;->z:Ll/wv60;

    .line 39
    .line 40
    iget-boolean v3, v0, Ll/wv60;->m:Z

    .line 41
    .line 42
    iget-object v4, v0, Ll/wv60;->d:Ljava/lang/String;

    .line 43
    .line 44
    iget-object v5, v0, Ll/wv60;->e:Ljava/lang/String;

    .line 45
    .line 46
    iget v6, v0, Ll/wv60;->g:I

    .line 47
    .line 48
    iget-object v7, v0, Ll/wv60;->h:Ljava/lang/String;

    .line 49
    .line 50
    iget v8, v0, Ll/wv60;->f:I

    .line 51
    .line 52
    const/4 v9, 0x1

    .line 53
    invoke-static/range {v3 .. v9}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->N4(ZLjava/lang/String;Ljava/lang/String;ILjava/lang/String;IZ)Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    iput-object v0, p0, Ll/vw60;->D:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 58
    .line 59
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->k5(Z)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Ll/vw60;->D:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 63
    .line 64
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->j5(Z)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0}, Ll/vw60;->x0()V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Ll/vw60;->y:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personalfeed/PersonalPhotoAlbumFeedFrag;

    .line 71
    .line 72
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    sget v2, Ll/hdc0;->g:I

    .line 81
    .line 82
    iget-object p0, p0, Ll/vw60;->D:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 83
    .line 84
    invoke-virtual {v0, v2, p0, v1}, Landroidx/fragment/app/k;->c(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/k;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v0}, Landroidx/fragment/app/k;->j()I

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public static synthetic a(Ll/vw60;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/vw60;->e0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    sget-object p0, Ll/vw60;->K:Ll/l4g0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/l4g0;->k()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/l4g0;->j()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public static synthetic c(Ll/vw60;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/vw60;->g0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/vw60;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;ZLl/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/vw60;->b0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;ZLl/uxj0;)V

    return-void
.end method

.method public static synthetic e(Ll/vw60;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vw60;->m0(Landroid/view/View;)V

    return-void
.end method

.method private synthetic e0(Landroid/view/View;)V
    .locals 11

    .line 1
    iget-object p1, p0, Ll/vw60;->E:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    const-string v0, "moments_user_id"

    .line 6
    .line 7
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    filled-new-array {p1}, [Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const-string v0, "e_likeButton"

    .line 16
    .line 17
    const-string v1, "p_album"

    .line 18
    .line 19
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 20
    .line 21
    .line 22
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {p0}, Ll/vw60;->I()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    iget-object v4, p0, Ll/vw60;->E:Lcom/p1/mobile/putong/data/User;

    .line 31
    .line 32
    iget-object p0, p0, Ll/vw60;->z:Ll/wv60;

    .line 33
    .line 34
    iget-boolean p0, p0, Ll/wv60;->m:Z

    .line 35
    .line 36
    xor-int/lit8 v5, p0, 0x1

    .line 37
    .line 38
    const-string p0, "moment"

    .line 39
    .line 40
    invoke-static {p0}, Lcom/p1/mobile/putong/data/LikeFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LikeFrom;

    .line 41
    .line 42
    .line 43
    move-result-object v7

    .line 44
    const/4 v9, 0x0

    .line 45
    const/4 v10, 0x0

    .line 46
    const/4 v6, 0x0

    .line 47
    const/4 v8, 0x0

    .line 48
    invoke-interface/range {v2 .. v10}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->kn(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;Lcom/p1/mobile/putong/data/LikeFrom;Ljava/lang/String;Ll/y20;Ll/y20;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {v0, p0, v1}, Ll/jka;->Ic(Lcom/p1/mobile/putong/data/User;Z)V

    .line 8
    .line 9
    .line 10
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    invoke-virtual {v0, p0, v1}, Ll/jka;->cc(Ljava/lang/String;Z)Lrx/c;

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private synthetic f0(Landroid/view/View;)V
    .locals 6

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/vw60;->I()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget-object v2, p0, Ll/vw60;->E:Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    iget-object p0, p0, Ll/vw60;->z:Ll/wv60;

    .line 10
    .line 11
    iget-boolean v5, p0, Ll/wv60;->m:Z

    .line 12
    .line 13
    const/4 v3, 0x0

    .line 14
    const-string v4, "p_album"

    .line 15
    .line 16
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/feed/api/b;->f3(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private synthetic g0(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/vw60;->L()V

    .line 2
    .line 3
    .line 4
    const-string p0, "album_post_source"

    .line 5
    .line 6
    const-string p1, "bottom_post_button"

    .line 7
    .line 8
    invoke-static {p0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const-string p1, "post_guide_type"

    .line 13
    .line 14
    const-string v0, ""

    .line 15
    .line 16
    invoke-static {p1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    filled-new-array {p0, p1}, [Ll/pf60;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const-string p1, "e_moment_post"

    .line 25
    .line 26
    const-string v0, "p_album"

    .line 27
    .line 28
    invoke-static {p1, v0, p0}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method private synthetic h0(Landroid/view/View;)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Ll/vw60;->I()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const-string v1, "is_match"

    .line 15
    .line 16
    invoke-static {v1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object v1, p0, Ll/vw60;->E:Lcom/p1/mobile/putong/data/User;

    .line 21
    .line 22
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 23
    .line 24
    const-string v2, "owner_id"

    .line 25
    .line 26
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    filled-new-array {v0, v1}, [Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const-string v1, "e_send_message"

    .line 35
    .line 36
    invoke-static {v1, p1, v0}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 37
    .line 38
    .line 39
    sget-object v2, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/vw60;->I()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    iget-object v4, p0, Ll/vw60;->E:Lcom/p1/mobile/putong/data/User;

    .line 46
    .line 47
    iget-object p0, p0, Ll/vw60;->z:Ll/wv60;

    .line 48
    .line 49
    iget-boolean v7, p0, Ll/wv60;->m:Z

    .line 50
    .line 51
    const/4 v5, 0x0

    .line 52
    const-string v6, "p_album"

    .line 53
    .line 54
    invoke-virtual/range {v2 .. v7}, Lcom/p1/mobile/putong/feed/api/b;->f3(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Z)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public static synthetic i(Ll/vw60;Lcom/p1/mobile/putong/data/User;ZLl/x20;ZZLandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Ll/vw60;->a0(Lcom/p1/mobile/putong/data/User;ZLl/x20;ZZLandroid/view/View;)V

    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/android/app/Act;Ll/x20;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->supportInvalidateOptionsMenu()V

    .line 2
    .line 3
    .line 4
    invoke-interface {p1}, Ll/x20;->call()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic k(Ll/vw60;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vw60;->Z(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic l(Ll/vw60;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vw60;->T()V

    return-void
.end method

.method public static synthetic m(Ll/vw60;Lcom/p1/mobile/putong/data/User;[Ljava/lang/Boolean;Ll/x20;ZLjava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/vw60;->d0(Lcom/p1/mobile/putong/data/User;[Ljava/lang/Boolean;Ll/x20;ZLjava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic n(Ll/vw60;Lcom/p1/mobile/putong/data/User;ZLandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/vw60;->k0(Lcom/p1/mobile/putong/data/User;ZLandroid/view/View;)V

    return-void
.end method

.method public static synthetic q(Ll/vw60;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vw60;->l0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic s(Ll/vw60;Ljava/lang/String;ZLcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/x20;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p8}, Ll/vw60;->j0(Ljava/lang/String;ZLcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/x20;Lv/VListCell;Lv/VListCell$a;I)V

    return-void
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/feed/data/TopicOperations;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->operationType:Lcom/p1/mobile/putong/feed/data/OperationType;

    .line 2
    .line 3
    const-string v0, "bubble"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic v(Ll/vw60;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vw60;->i0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic w(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic x(Ll/vw60;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/vw60;->h0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic y(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/TopicMoment;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic z(Ll/vw60;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vw60;->n0(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public A0(Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ll/th0$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/vw60;->I()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p3}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 11
    .line 12
    .line 13
    move-result-object p3

    .line 14
    invoke-virtual {p3, p4}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 15
    .line 16
    .line 17
    move-result-object p3

    .line 18
    invoke-virtual {p3, p5}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 19
    .line 20
    .line 21
    move-result-object p3

    .line 22
    new-instance p4, Ll/jw60;

    .line 23
    .line 24
    invoke-direct {p4, p0, p1, p2}, Ll/jw60;-><init>(Ll/vw60;Lcom/p1/mobile/putong/data/User;Z)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p3, p4}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    sget p2, Lcom/p1/mobile/putong/feed/R$string;->a:I

    .line 32
    .line 33
    invoke-virtual {p1, p2}, Ll/th0$a;->e(I)Ll/th0$a;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    new-instance p2, Ll/kw60;

    .line 38
    .line 39
    invoke-direct {p2, p0}, Ll/kw60;-><init>(Ll/vw60;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1, p2}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Ll/th0$a;->a()Ll/th0;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    iput-object p1, p0, Ll/vw60;->H:Ll/th0;

    .line 50
    .line 51
    invoke-virtual {p1}, Ll/th0;->g()V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public B0(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public D0()Z
    .locals 3

    .line 1
    invoke-static {}, Ll/gj70;->a()Ll/gj70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gj70;->b()Ljava/util/Map;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Ll/vw60;->z:Ll/wv60;

    .line 10
    .line 11
    iget-object v1, v1, Ll/wv60;->e:Ljava/lang/String;

    .line 12
    .line 13
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/gj70$a;

    .line 18
    .line 19
    iget-object v1, p0, Ll/vw60;->z:Ll/wv60;

    .line 20
    .line 21
    iget-object v1, v1, Ll/wv60;->e:Ljava/lang/String;

    .line 22
    .line 23
    const-string v2, "from_activities_moment"

    .line 24
    .line 25
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-nez v1, :cond_1

    .line 30
    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    iget-boolean v0, v0, Ll/gj70$a;->b:Z

    .line 34
    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget-object p0, p0, Ll/vw60;->z:Ll/wv60;

    .line 46
    .line 47
    iget-object p0, p0, Ll/wv60;->d:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    if-eqz p0, :cond_0

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_0
    const/4 p0, 0x0

    .line 57
    return p0

    .line 58
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 59
    return p0
.end method

.method public E0(Lcom/p1/mobile/putong/data/User;Z)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/vw60;->I()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v0, "is_reply"

    .line 10
    .line 11
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    invoke-static {v0, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    const/4 v0, 0x0

    .line 20
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const-string v1, "is_match"

    .line 25
    .line 26
    invoke-static {v1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const-string v1, "owner_id"

    .line 31
    .line 32
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {v1, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    filled-new-array {p2, v0, p1}, [Ll/pf60;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    const-string p2, "e_send_message"

    .line 43
    .line 44
    invoke-static {p2, p0, p1}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public G(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/ww60;->b(Ll/vw60;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public G0(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ll/th0$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/vw60;->I()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->r:I

    .line 15
    .line 16
    invoke-virtual {p1, v1}, Ll/th0$a;->q(I)Ll/th0$a;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    sget v1, Ll/k9c0;->n:I

    .line 21
    .line 22
    invoke-virtual {p1, v1}, Ll/th0$a;->p(I)Ll/th0$a;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    new-instance v1, Ll/uw60;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/uw60;-><init>(Ll/vw60;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1, v1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->a:I

    .line 36
    .line 37
    invoke-virtual {p1, v1}, Ll/th0$a;->e(I)Ll/th0$a;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    new-instance v1, Ll/yv60;

    .line 42
    .line 43
    invoke-direct {v1, p0}, Ll/yv60;-><init>(Ll/vw60;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1, v1}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0}, Ll/th0$a;->a()Ll/th0;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    iput-object p1, p0, Ll/vw60;->I:Ll/th0;

    .line 54
    .line 55
    invoke-virtual {p1}, Ll/th0;->g()V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public H()V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/ww60;->c(Ll/vw60;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public H0(Ljava/lang/String;)V
    .locals 7

    .line 1
    invoke-static {}, Ll/mrb0;->C()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object v1

    .line 5
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->isJailedOrRestrict()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/orb0;->I()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object v1, p0, Ll/vw60;->z:Ll/wv60;

    .line 16
    .line 17
    iget-object v1, v1, Ll/wv60;->l:Ll/bkj0;

    .line 18
    .line 19
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    const/4 v2, 0x0

    .line 24
    if-eqz v1, :cond_2

    .line 25
    .line 26
    const-string v1, "moment_post_bubble"

    .line 27
    .line 28
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_2

    .line 33
    .line 34
    iget-object v1, p0, Ll/vw60;->z:Ll/wv60;

    .line 35
    .line 36
    iget-object v1, v1, Ll/wv60;->l:Ll/bkj0;

    .line 37
    .line 38
    iget-object v1, v1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 39
    .line 40
    check-cast v1, Ljava/util/Collection;

    .line 41
    .line 42
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-nez v1, :cond_2

    .line 47
    .line 48
    iget-object v1, p0, Ll/vw60;->z:Ll/wv60;

    .line 49
    .line 50
    iget-object v1, v1, Ll/wv60;->l:Ll/bkj0;

    .line 51
    .line 52
    iget-object v1, v1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 53
    .line 54
    check-cast v1, Ljava/util/Collection;

    .line 55
    .line 56
    new-instance v4, Ll/zv60;

    .line 57
    .line 58
    invoke-direct {v4}, Ll/zv60;-><init>()V

    .line 59
    .line 60
    .line 61
    invoke-static {v1, v4}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    check-cast v1, Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 66
    .line 67
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v4

    .line 71
    if-eqz v4, :cond_2

    .line 72
    .line 73
    iget-object v4, v1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->postGuide:Lcom/p1/mobile/putong/feed/data/PostGuide;

    .line 74
    .line 75
    iget-object v4, v4, Lcom/p1/mobile/putong/feed/data/PostGuide;->topicId:Ljava/lang/String;

    .line 76
    .line 77
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 78
    .line 79
    .line 80
    move-result v5

    .line 81
    if-nez v5, :cond_1

    .line 82
    .line 83
    iget-object v5, p0, Ll/vw60;->z:Ll/wv60;

    .line 84
    .line 85
    iget-object v5, v5, Ll/wv60;->l:Ll/bkj0;

    .line 86
    .line 87
    iget-object v5, v5, Ll/bkj0;->b:Ljava/lang/Object;

    .line 88
    .line 89
    check-cast v5, Ljava/util/Collection;

    .line 90
    .line 91
    invoke-static {v5}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 92
    .line 93
    .line 94
    move-result v5

    .line 95
    if-nez v5, :cond_1

    .line 96
    .line 97
    iget-object v5, p0, Ll/vw60;->z:Ll/wv60;

    .line 98
    .line 99
    iget-object v5, v5, Ll/wv60;->l:Ll/bkj0;

    .line 100
    .line 101
    iget-object v5, v5, Ll/bkj0;->b:Ljava/lang/Object;

    .line 102
    .line 103
    check-cast v5, Ljava/util/Collection;

    .line 104
    .line 105
    new-instance v6, Ll/aw60;

    .line 106
    .line 107
    invoke-direct {v6, v4}, Ll/aw60;-><init>(Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    invoke-static {v5, v6}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object v4

    .line 114
    move-object v6, v4

    .line 115
    check-cast v6, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 116
    .line 117
    invoke-static {v6}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result v4

    .line 121
    if-eqz v4, :cond_1

    .line 122
    .line 123
    iget-object v0, p0, Ll/vw60;->y:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personalfeed/PersonalPhotoAlbumFeedFrag;

    .line 124
    .line 125
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    new-array v2, v2, [Lcom/p1/mobile/putong/data/Media;

    .line 130
    .line 131
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    iget-object v4, v1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->postGuide:Lcom/p1/mobile/putong/feed/data/PostGuide;

    .line 136
    .line 137
    iget-object v4, v4, Lcom/p1/mobile/putong/feed/data/PostGuide;->momentValue:Ljava/lang/String;

    .line 138
    .line 139
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->operationType:Lcom/p1/mobile/putong/feed/data/OperationType;

    .line 140
    .line 141
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v5

    .line 145
    move-object v1, v2

    .line 146
    const/4 v2, 0x1

    .line 147
    move-object v3, p1

    .line 148
    invoke-static/range {v0 .. v6}, Ll/cn40;->m0(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    .line 149
    .line 150
    .line 151
    return-void

    .line 152
    :cond_1
    iget-object v0, p0, Ll/vw60;->y:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personalfeed/PersonalPhotoAlbumFeedFrag;

    .line 153
    .line 154
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    new-array v2, v2, [Lcom/p1/mobile/putong/data/Media;

    .line 159
    .line 160
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 161
    .line 162
    .line 163
    move-result-object v2

    .line 164
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->postGuide:Lcom/p1/mobile/putong/feed/data/PostGuide;

    .line 165
    .line 166
    iget-object v4, v3, Lcom/p1/mobile/putong/feed/data/PostGuide;->momentValue:Ljava/lang/String;

    .line 167
    .line 168
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->operationType:Lcom/p1/mobile/putong/feed/data/OperationType;

    .line 169
    .line 170
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object v5

    .line 174
    move-object v1, v2

    .line 175
    const/4 v2, 0x1

    .line 176
    move-object v3, p1

    .line 177
    invoke-static/range {v0 .. v5}, Ll/cn40;->l0(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 178
    .line 179
    .line 180
    return-void

    .line 181
    :cond_2
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 182
    .line 183
    .line 184
    move-result v1

    .line 185
    const/4 v4, 0x1

    .line 186
    if-nez v1, :cond_3

    .line 187
    .line 188
    iget-object v0, p0, Ll/vw60;->y:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personalfeed/PersonalPhotoAlbumFeedFrag;

    .line 189
    .line 190
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    new-array v1, v2, [Lcom/p1/mobile/putong/data/Media;

    .line 195
    .line 196
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 197
    .line 198
    .line 199
    move-result-object v1

    .line 200
    invoke-static {v0, v1, v4, p1}, Ll/cn40;->k0(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ZLjava/lang/String;)V

    .line 201
    .line 202
    .line 203
    return-void

    .line 204
    :cond_3
    invoke-virtual {p0}, Ll/vw60;->I()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    new-array v1, v2, [Lcom/p1/mobile/putong/data/Media;

    .line 209
    .line 210
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 211
    .line 212
    .line 213
    move-result-object v1

    .line 214
    const-string v2, "myalbum"

    .line 215
    .line 216
    invoke-static {v0, v1, v4, v2}, Ll/cn40;->k0(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ZLjava/lang/String;)V

    .line 217
    .line 218
    .line 219
    return-void
.end method

.method public I()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/vw60;->y:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personalfeed/PersonalPhotoAlbumFeedFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;

    .line 8
    .line 9
    return-object p0
.end method

.method public final I0(Landroid/view/View;Z)Z
    .locals 1

    .line 1
    const/4 p0, 0x0

    .line 2
    if-eqz p2, :cond_0

    .line 3
    .line 4
    move p2, p0

    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/16 p2, 0x8

    .line 7
    .line 8
    :goto_0
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eq v0, p2, :cond_1

    .line 13
    .line 14
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 15
    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    :cond_1
    return p0
.end method

.method public J(Lcom/p1/mobile/putong/data/User;ZLl/x20;ZZ)V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/vw60;->b:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    invoke-virtual {v0}, Lv/navigationbar/VNavigationBar;->B()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/cmg;->Z()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_2

    .line 11
    .line 12
    new-instance v0, Lv/VText;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/vw60;->I()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-direct {v0, v1}, Lv/VText;-><init>(Landroid/content/Context;)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Ll/vw60;->g:Lv/VText;

    .line 22
    .line 23
    invoke-virtual {v1}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
    const/high16 v1, 0x41800000    # 16.0f

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 37
    .line 38
    .line 39
    iget-object v1, p0, Ll/vw60;->g:Lv/VText;

    .line 40
    .line 41
    invoke-virtual {v1}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 50
    .line 51
    .line 52
    const-string v2, "\u5173\u6ce8"

    .line 53
    .line 54
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    if-nez v1, :cond_0

    .line 59
    .line 60
    const-string v1, "#26000000"

    .line 61
    .line 62
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_0
    const-string v1, "#fe7e1d"

    .line 71
    .line 72
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 77
    .line 78
    .line 79
    :goto_0
    invoke-virtual {v0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    invoke-virtual {p0}, Ll/vw60;->I()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    sget v3, Lcom/p1/mobile/putong/feed/R$string;->N2:I

    .line 92
    .line 93
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    if-eqz v1, :cond_1

    .line 102
    .line 103
    return-void

    .line 104
    :cond_1
    iget-object v1, p0, Ll/vw60;->b:Lv/navigationbar/VNavigationBar;

    .line 105
    .line 106
    const/4 v2, 0x1

    .line 107
    new-array v2, v2, [Landroid/view/View;

    .line 108
    .line 109
    const/4 v3, 0x0

    .line 110
    aput-object v0, v2, v3

    .line 111
    .line 112
    invoke-virtual {v1, v2}, Lv/navigationbar/VNavigationBar;->z([Landroid/view/View;)V

    .line 113
    .line 114
    .line 115
    new-instance v1, Ll/bw60;

    .line 116
    .line 117
    invoke-direct {v1, p0}, Ll/bw60;-><init>(Ll/vw60;)V

    .line 118
    .line 119
    .line 120
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 121
    .line 122
    .line 123
    :cond_2
    iget-object v0, p0, Ll/vw60;->b:Lv/navigationbar/VNavigationBar;

    .line 124
    .line 125
    sget v1, Ll/lbc0;->r:I

    .line 126
    .line 127
    new-instance v2, Ll/cw60;

    .line 128
    .line 129
    move-object v3, p0

    .line 130
    move-object v4, p1

    .line 131
    move v5, p2

    .line 132
    move-object v6, p3

    .line 133
    move v7, p4

    .line 134
    move v8, p5

    .line 135
    invoke-direct/range {v2 .. v8}, Ll/cw60;-><init>(Ll/vw60;Lcom/p1/mobile/putong/data/User;ZLl/x20;ZZ)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {v0, v1, v2}, Lv/navigationbar/VNavigationBar;->w(ILandroid/view/View$OnClickListener;)V

    .line 139
    .line 140
    .line 141
    return-void
.end method

.method public K(Ll/wv60;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vw60;->z:Ll/wv60;

    .line 2
    .line 3
    return-void
.end method

.method public final L()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/vw60;->M(Ljava/lang/String;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public L0()Ll/n570;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vw60;->z:Ll/wv60;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/wv60;->C0()Ll/n570;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final M(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/pb1;->c()Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    sget-object p0, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->CHAT_ROOM_WINDOW:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 16
    .line 17
    if-ne v0, p0, :cond_0

    .line 18
    .line 19
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->D2:I

    .line 20
    .line 21
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->getBusinessMsg()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    invoke-virtual {p0, p1}, Ll/vw60;->H0(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public N(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Z)V
    .locals 3

    .line 1
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->U2:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(IZ)Landroid/app/Dialog;

    .line 5
    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/api/b;->M:Lcom/p1/mobile/putong/feed/api/b$a;

    .line 10
    .line 11
    iget-object v1, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    xor-int/lit8 v2, p3, 0x1

    .line 14
    .line 15
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/feed/api/b$a;->M(Ljava/lang/String;Z)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/lw60;

    .line 20
    .line 21
    invoke-direct {v1, p0, p2, p1, p3}, Ll/lw60;-><init>(Ll/vw60;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Z)V

    .line 22
    .line 23
    .line 24
    new-instance p0, Ll/mw60;

    .line 25
    .line 26
    invoke-direct {p0, p1}, Ll/mw60;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public O(Lcom/p1/mobile/putong/data/User;)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/vw60;->I()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->R2:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Ll/vw60;->g:Lv/VText;

    .line 12
    .line 13
    invoke-virtual {v1}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/vw60;->I()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "receiver_user_id"

    .line 28
    .line 29
    const-string v2, "owner_id"

    .line 30
    .line 31
    const-string v3, "p_album"

    .line 32
    .line 33
    const-string v4, "e_follow"

    .line 34
    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    invoke-virtual {p0}, Ll/vw60;->I()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;->a2()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    const-string v0, "p_christmas_profile"

    .line 46
    .line 47
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-eqz p0, :cond_0

    .line 52
    .line 53
    iget-object p0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 54
    .line 55
    invoke-static {v2, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    const-string v2, "album_from"

    .line 60
    .line 61
    invoke-static {v2, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 66
    .line 67
    invoke-static {v1, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    filled-new-array {p0, v0, p1}, [Ll/pf60;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-static {v4, v3, p0}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_0
    iget-object p0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 80
    .line 81
    invoke-static {v2, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 86
    .line 87
    invoke-static {v1, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    filled-new-array {p0, p1}, [Ll/pf60;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-static {v4, v3, p0}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 96
    .line 97
    .line 98
    :cond_1
    return-void
.end method

.method public P()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/vw60;->J:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Ll/vw60;->J:Z

    .line 8
    .line 9
    iget-object p0, p0, Ll/vw60;->z:Ll/wv60;

    .line 10
    .line 11
    iget-object p0, p0, Ll/wv60;->d:Ljava/lang/String;

    .line 12
    .line 13
    const-string v0, "moments_user_id"

    .line 14
    .line 15
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-string v0, "moment_id"

    .line 20
    .line 21
    const-string v1, ""

    .line 22
    .line 23
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    filled-new-array {p0, v0}, [Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const-string v0, "e_likeButton"

    .line 32
    .line 33
    const-string v1, "p_album"

    .line 34
    .line 35
    invoke-static {v0, v1, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public R(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "moment_greeting"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_2

    .line 16
    .line 17
    new-instance v1, Lorg/json/JSONObject;

    .line 18
    .line 19
    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/vw60;->E:Lcom/p1/mobile/putong/data/User;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 25
    .line 26
    const-string v0, "female"

    .line 27
    .line 28
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-eqz p0, :cond_0

    .line 33
    .line 34
    const-string p0, "femaleDoc"

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :catch_0
    move-exception p0

    .line 38
    goto :goto_2

    .line 39
    :cond_0
    const-string p0, "maleDoc"

    .line 40
    .line 41
    :goto_0
    new-instance v0, Lorg/json/JSONArray;

    .line 42
    .line 43
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-direct {v0, p0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    if-nez p0, :cond_1

    .line 55
    .line 56
    const-string p0, ""

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_1
    const/4 p0, 0x0

    .line 60
    invoke-virtual {v0, p0}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    goto :goto_1

    .line 65
    :cond_2
    move-object p0, p1

    .line 66
    :goto_1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 67
    .line 68
    .line 69
    move-result v0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 70
    if-eqz v0, :cond_3

    .line 71
    .line 72
    return-object p1

    .line 73
    :cond_3
    return-object p0

    .line 74
    :goto_2
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 75
    .line 76
    .line 77
    return-object p1
.end method

.method public final S()Ll/y670;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vw60;->D:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->z:Ll/y670;

    .line 8
    .line 9
    return-object p0
.end method

.method public final T()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vw60;->z:Ll/wv60;

    .line 2
    .line 3
    iget-object p0, p0, Ll/wv60;->j:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public U()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vw60;->A:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/AlbumFeedHeader;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/vw60;->A:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/AlbumFeedHeader;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/AlbumFeedHeader;->Q()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public V(Lcom/p1/mobile/putong/data/User;)V
    .locals 7

    .line 1
    new-instance v4, Ll/pw60;

    .line 2
    .line 3
    invoke-direct {v4, p1}, Ll/pw60;-><init>(Lcom/p1/mobile/putong/data/User;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    filled-new-array {v0}, [Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object v3

    .line 12
    iget-object v0, p0, Ll/vw60;->z:Ll/wv60;

    .line 13
    .line 14
    iget-object v0, v0, Ll/wv60;->e:Ljava/lang/String;

    .line 15
    .line 16
    const-string v1, "from_kan_kan"

    .line 17
    .line 18
    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    xor-int/lit8 v5, v0, 0x1

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/vw60;->I()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 29
    .line 30
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/api/b;->M:Lcom/p1/mobile/putong/feed/api/b$a;

    .line 31
    .line 32
    invoke-virtual {v1}, Ll/mof0;->k()Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0}, Lrx/c;->first()Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v6

    .line 44
    new-instance v0, Ll/qw60;

    .line 45
    .line 46
    move-object v1, p0

    .line 47
    move-object v2, p1

    .line 48
    invoke-direct/range {v0 .. v5}, Ll/qw60;-><init>(Ll/vw60;Lcom/p1/mobile/putong/data/User;[Ljava/lang/Boolean;Ll/x20;Z)V

    .line 49
    .line 50
    .line 51
    move-object p0, v0

    .line 52
    new-instance v0, Ll/rw60;

    .line 53
    .line 54
    invoke-direct/range {v0 .. v5}, Ll/rw60;-><init>(Ll/vw60;Lcom/p1/mobile/putong/data/User;[Ljava/lang/Boolean;Ll/x20;Z)V

    .line 55
    .line 56
    .line 57
    invoke-static {p0, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {v6, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public X(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/vw60;->b:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/vw60;->I()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p1, v0}, Lv/navigationbar/VNavigationBar;->setLeftIconAsBack(Landroid/app/Activity;)V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0}, Ll/vw60;->W()V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Ll/vw60;->h:Lv/VLinear;

    .line 14
    .line 15
    new-instance v0, Ll/xv60;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Ll/xv60;-><init>(Ll/vw60;)V

    .line 18
    .line 19
    .line 20
    invoke-static {p1, v0}, Ll/ksg;->G0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Ll/vw60;->s:Lv/VLinear;

    .line 24
    .line 25
    new-instance v0, Ll/iw60;

    .line 26
    .line 27
    invoke-direct {v0, p0}, Ll/iw60;-><init>(Ll/vw60;)V

    .line 28
    .line 29
    .line 30
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Ll/vw60;->t:Landroid/widget/LinearLayout;

    .line 34
    .line 35
    new-instance v0, Ll/nw60;

    .line 36
    .line 37
    invoke-direct {v0, p0}, Ll/nw60;-><init>(Ll/vw60;)V

    .line 38
    .line 39
    .line 40
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Ll/vw60;->q:Lv/VButton;

    .line 44
    .line 45
    new-instance v0, Ll/ow60;

    .line 46
    .line 47
    invoke-direct {v0, p0}, Ll/ow60;-><init>(Ll/vw60;)V

    .line 48
    .line 49
    .line 50
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Ll/vw60;->e:Lv/VLinear;

    .line 54
    .line 55
    invoke-virtual {p1, p0}, Lv/VLinear;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 56
    .line 57
    .line 58
    iget-object p1, p0, Ll/vw60;->l:Lv/VButton;

    .line 59
    .line 60
    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 61
    .line 62
    .line 63
    iget-object p1, p0, Ll/vw60;->m:Lv/VLinear;

    .line 64
    .line 65
    invoke-virtual {p1, p0}, Lv/VLinear;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 66
    .line 67
    .line 68
    iget-object p1, p0, Ll/vw60;->d:Lv/VFrame;

    .line 69
    .line 70
    const/4 v0, 0x0

    .line 71
    invoke-virtual {p1, v0}, Lv/VFrame;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 72
    .line 73
    .line 74
    iget-object p1, p0, Ll/vw60;->g:Lv/VText;

    .line 75
    .line 76
    invoke-virtual {p0, p1}, Ll/vw60;->y0(Landroid/widget/TextView;)V

    .line 77
    .line 78
    .line 79
    iget-object p1, p0, Ll/vw60;->j:Lv/VText;

    .line 80
    .line 81
    invoke-virtual {p0, p1}, Ll/vw60;->y0(Landroid/widget/TextView;)V

    .line 82
    .line 83
    .line 84
    iget-object p1, p0, Ll/vw60;->o:Lv/VText;

    .line 85
    .line 86
    invoke-virtual {p0, p1}, Ll/vw60;->y0(Landroid/widget/TextView;)V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public X0()Ll/s8h;
    .locals 2

    .line 1
    new-instance v0, Ll/s8h;

    .line 2
    .line 3
    iget-object v1, p0, Ll/vw60;->B:Ll/tt60;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/s8h;-><init>(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Ll/vw60;->C:Ll/s8h;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/vw60;->p0()V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/vw60;->C:Ll/s8h;

    .line 14
    .line 15
    return-object p0
.end method

.method public Y(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/vw60;->w:Landroid/widget/TextView;

    .line 2
    .line 3
    xor-int/lit8 v1, p1, 0x1

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/vw60;->v:Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView;

    .line 9
    .line 10
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic Z(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vw60;->z:Ll/wv60;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/wv60;->u0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic a0(Lcom/p1/mobile/putong/data/User;ZLl/x20;ZZLandroid/view/View;)V
    .locals 0

    .line 1
    move p6, p5

    .line 2
    move p5, p4

    .line 3
    move-object p4, p3

    .line 4
    move p3, p2

    .line 5
    move-object p2, p1

    .line 6
    invoke-virtual {p0}, Ll/vw60;->I()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual/range {p0 .. p6}, Ll/vw60;->z0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLl/x20;ZZ)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public bridge synthetic act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/vw60;->I()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic b0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;ZLl/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vw60;->V(Lcom/p1/mobile/putong/data/User;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 5
    .line 6
    .line 7
    if-eqz p3, :cond_0

    .line 8
    .line 9
    invoke-static {p2}, Ll/j1i;->p(Landroid/content/Context;)Ll/j1i;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ll/j1i;->j()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-static {p2}, Ll/j1i;->p(Landroid/content/Context;)Ll/j1i;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Ll/j1i;->g()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    :goto_0
    invoke-virtual {p2}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    sget p4, Ll/lbc0;->Z1:I

    .line 31
    .line 32
    invoke-virtual {p2, p4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    invoke-static {p0, p2}, Ll/o1j0;->q(Ljava/lang/String;Landroid/graphics/drawable/Drawable;)V

    .line 37
    .line 38
    .line 39
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 40
    .line 41
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 42
    .line 43
    xor-int/lit8 p2, p3, 0x1

    .line 44
    .line 45
    invoke-virtual {p0, p1, p2}, Ll/jka;->cc(Ljava/lang/String;Z)Lrx/c;

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final synthetic c0(Lcom/p1/mobile/putong/data/User;[Ljava/lang/Boolean;Ll/x20;ZLjava/util/List;)V
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p5, :cond_0

    .line 3
    .line 4
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 5
    .line 6
    invoke-interface {p5, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result p5

    .line 10
    if-eqz p5, :cond_0

    .line 11
    .line 12
    const/4 p5, 0x1

    .line 13
    move v6, p5

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    move v6, v0

    .line 16
    :goto_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 17
    .line 18
    .line 19
    move-result p5

    .line 20
    if-eqz p5, :cond_1

    .line 21
    .line 22
    iget-object p0, p0, Ll/vw60;->b:Lv/navigationbar/VNavigationBar;

    .line 23
    .line 24
    invoke-virtual {p0}, Lv/navigationbar/VNavigationBar;->B()V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    aget-object p2, p2, v0

    .line 29
    .line 30
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    move-object v1, p0

    .line 35
    move-object v2, p1

    .line 36
    move-object v4, p3

    .line 37
    move v5, p4

    .line 38
    invoke-virtual/range {v1 .. v6}, Ll/vw60;->J(Lcom/p1/mobile/putong/data/User;ZLl/x20;ZZ)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final synthetic d0(Lcom/p1/mobile/putong/data/User;[Ljava/lang/Boolean;Ll/x20;ZLjava/lang/Throwable;)V
    .locals 6

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 2
    .line 3
    .line 4
    move-result p5

    .line 5
    if-eqz p5, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/vw60;->b:Lv/navigationbar/VNavigationBar;

    .line 8
    .line 9
    invoke-virtual {p0}, Lv/navigationbar/VNavigationBar;->B()V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    const/4 p5, 0x0

    .line 14
    aget-object p2, p2, p5

    .line 15
    .line 16
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    const/4 v5, 0x0

    .line 21
    move-object v0, p0

    .line 22
    move-object v1, p1

    .line 23
    move-object v3, p3

    .line 24
    move v4, p4

    .line 25
    invoke-virtual/range {v0 .. v5}, Ll/vw60;->J(Lcom/p1/mobile/putong/data/User;ZLl/x20;ZZ)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public destroy()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vw60;->H:Ll/th0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/vw60;->H:Ll/th0;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/th0;->d()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/vw60;->H:Ll/th0;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/th0;->c()V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object v0, p0, Ll/vw60;->G:Ll/w30;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    iget-object v0, p0, Ll/vw60;->G:Ll/w30;

    .line 31
    .line 32
    invoke-virtual {v0}, Ll/w30;->d()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    iget-object v0, p0, Ll/vw60;->G:Ll/w30;

    .line 39
    .line 40
    invoke-virtual {v0}, Ll/w30;->b()V

    .line 41
    .line 42
    .line 43
    :cond_1
    iget-object v0, p0, Ll/vw60;->I:Ll/th0;

    .line 44
    .line 45
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_2

    .line 50
    .line 51
    iget-object v0, p0, Ll/vw60;->I:Ll/th0;

    .line 52
    .line 53
    invoke-virtual {v0}, Ll/th0;->d()Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_2

    .line 58
    .line 59
    iget-object p0, p0, Ll/vw60;->I:Ll/th0;

    .line 60
    .line 61
    invoke-virtual {p0}, Ll/th0;->c()V

    .line 62
    .line 63
    .line 64
    :cond_2
    return-void
.end method

.method public final synthetic i0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vw60;->G:Ll/w30;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/wv60;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/vw60;->K(Ll/wv60;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/vw60;->G(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p2, p0, Ll/vw60;->y:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personalfeed/PersonalPhotoAlbumFeedFrag;

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
    iget-object p2, p0, Ll/vw60;->z:Ll/wv60;

    .line 21
    .line 22
    invoke-virtual {p2}, Ll/wv60;->a1()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Ll/vw60;->I()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    sget p2, Ll/b9c0;->p:I

    .line 30
    .line 31
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/app/PutongAct;->setStatusBarColorResId(I)V

    .line 32
    .line 33
    .line 34
    return-object p1
.end method

.method public final synthetic j0(Ljava/lang/String;ZLcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/x20;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 6

    .line 1
    iget-object p6, p7, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 2
    .line 3
    invoke-static {p6, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_3

    .line 8
    .line 9
    if-eqz p2, :cond_1

    .line 10
    .line 11
    invoke-static {p3}, Ll/j1i;->p(Landroid/content/Context;)Ll/j1i;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Ll/j1i;->d()Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    invoke-static {p3}, Ll/j1i;->p(Landroid/content/Context;)Ll/j1i;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p1}, Ll/j1i;->f()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p5

    .line 29
    invoke-static {p3}, Ll/j1i;->p(Landroid/content/Context;)Ll/j1i;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p4}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 34
    .line 35
    .line 36
    move-result p6

    .line 37
    invoke-virtual {p1, p6}, Ll/j1i;->k(Z)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p6

    .line 41
    invoke-static {p3}, Ll/j1i;->p(Landroid/content/Context;)Ll/j1i;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {p1}, Ll/j1i;->i()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p7

    .line 49
    move-object p3, p4

    .line 50
    move p4, p2

    .line 51
    move-object p2, p0

    .line 52
    invoke-virtual/range {p2 .. p7}, Ll/vw60;->A0(Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    goto/16 :goto_1

    .line 56
    .line 57
    :cond_0
    move-object v1, p4

    .line 58
    move p4, p2

    .line 59
    move-object p2, p0

    .line 60
    invoke-virtual {p2, p3, v1, p4}, Ll/vw60;->N(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Z)V

    .line 61
    .line 62
    .line 63
    goto/16 :goto_1

    .line 64
    .line 65
    :cond_1
    move-object v1, p4

    .line 66
    move p4, p2

    .line 67
    move-object p2, p0

    .line 68
    invoke-static {p3}, Ll/j1i;->p(Landroid/content/Context;)Ll/j1i;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {p0}, Ll/j1i;->h()Z

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    if-eqz p0, :cond_2

    .line 77
    .line 78
    invoke-static {p3}, Ll/j1i;->p(Landroid/content/Context;)Ll/j1i;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {p0}, Ll/j1i;->e()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v3

    .line 86
    invoke-static {p3}, Ll/j1i;->p(Landroid/content/Context;)Ll/j1i;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-virtual {p0}, Ll/j1i;->b()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v4

    .line 94
    invoke-static {p3}, Ll/j1i;->p(Landroid/content/Context;)Ll/j1i;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    invoke-virtual {p0}, Ll/j1i;->c()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v5

    .line 102
    move-object v0, p2

    .line 103
    move v2, p4

    .line 104
    invoke-virtual/range {v0 .. v5}, Ll/vw60;->A0(Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    goto/16 :goto_1

    .line 108
    .line 109
    :cond_2
    invoke-virtual {p2, p3, v1, p4}, Ll/vw60;->N(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Z)V

    .line 110
    .line 111
    .line 112
    goto/16 :goto_1

    .line 113
    .line 114
    :cond_3
    move-object p2, p0

    .line 115
    move-object v1, p4

    .line 116
    iget-object p0, p7, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 117
    .line 118
    invoke-virtual {p2}, Ll/vw60;->I()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    sget p4, Lcom/p1/mobile/putong/feed/R$string;->z4:I

    .line 123
    .line 124
    invoke-virtual {p1, p4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 129
    .line 130
    .line 131
    move-result p0

    .line 132
    if-eqz p0, :cond_4

    .line 133
    .line 134
    iget-object p4, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 135
    .line 136
    new-instance p7, Ll/gw60;

    .line 137
    .line 138
    invoke-direct {p7, p3, p5}, Ll/gw60;-><init>(Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 139
    .line 140
    .line 141
    const-string p8, "moment_page"

    .line 142
    .line 143
    const/4 p5, 0x0

    .line 144
    const/4 p6, 0x0

    .line 145
    invoke-static/range {p3 .. p8}, Ll/orb0;->D(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;Ll/x20;Ll/x20;Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    goto :goto_1

    .line 149
    :cond_4
    iget-object p0, p7, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 150
    .line 151
    const-string p1, "\u53d6\u6d88\u559c\u6b22"

    .line 152
    .line 153
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 154
    .line 155
    .line 156
    move-result p0

    .line 157
    if-eqz p0, :cond_6

    .line 158
    .line 159
    const-string p0, "unlike_from"

    .line 160
    .line 161
    const-string p1, "profile_moment"

    .line 162
    .line 163
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 164
    .line 165
    .line 166
    move-result-object p0

    .line 167
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 168
    .line 169
    .line 170
    move-result p1

    .line 171
    if-eqz p1, :cond_5

    .line 172
    .line 173
    iget-object p1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 174
    .line 175
    goto :goto_0

    .line 176
    :cond_5
    const-string p1, ""

    .line 177
    .line 178
    :goto_0
    const-string p4, "other_user_id"

    .line 179
    .line 180
    invoke-static {p4, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    filled-new-array {p0, p1}, [Ll/pf60;

    .line 185
    .line 186
    .line 187
    move-result-object p0

    .line 188
    const-string p1, "e_unlike"

    .line 189
    .line 190
    const-string p4, "p_album_more_popup"

    .line 191
    .line 192
    invoke-static {p1, p4, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 193
    .line 194
    .line 195
    invoke-virtual {p2}, Ll/vw60;->I()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;

    .line 196
    .line 197
    .line 198
    move-result-object p0

    .line 199
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;->pageId()Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    move-result-object p0

    .line 203
    new-instance p1, Ll/hw60;

    .line 204
    .line 205
    invoke-direct {p1}, Ll/hw60;-><init>()V

    .line 206
    .line 207
    .line 208
    invoke-static {p3, v1, p0, p1}, Ll/hyh;->f(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ll/y20;)V

    .line 209
    .line 210
    .line 211
    goto :goto_1

    .line 212
    :cond_6
    iget-object p0, p7, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 213
    .line 214
    const-string p1, "\u53d6\u6d88\u5173\u6ce8"

    .line 215
    .line 216
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 217
    .line 218
    .line 219
    move-result p0

    .line 220
    if-eqz p0, :cond_7

    .line 221
    .line 222
    invoke-virtual {p2}, Ll/vw60;->I()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;

    .line 223
    .line 224
    .line 225
    move-result-object p0

    .line 226
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;->pageId()Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    move-result-object p0

    .line 230
    const/4 p1, 0x0

    .line 231
    invoke-static {p3, v1, p0, p1}, Ll/hyh;->e(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Z)V

    .line 232
    .line 233
    .line 234
    :cond_7
    :goto_1
    iget-object p0, p2, Ll/vw60;->G:Ll/w30;

    .line 235
    .line 236
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 237
    .line 238
    .line 239
    return-void
.end method

.method public final synthetic k0(Lcom/p1/mobile/putong/data/User;ZLandroid/view/View;)V
    .locals 0

    .line 1
    iget-object p3, p0, Ll/vw60;->H:Ll/th0;

    .line 2
    .line 3
    invoke-virtual {p3}, Ll/th0;->c()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/vw60;->I()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;

    .line 7
    .line 8
    .line 9
    move-result-object p3

    .line 10
    invoke-virtual {p0, p3, p1, p2}, Ll/vw60;->N(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic l0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vw60;->H:Ll/th0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/th0;->c()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic m0(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/vw60;->I:Ll/th0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/th0;->c()V

    .line 4
    .line 5
    .line 6
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object p0, p0, Ll/vw60;->z:Ll/wv60;

    .line 17
    .line 18
    iget-object p0, p0, Ll/wv60;->j:Lcom/p1/mobile/putong/data/User;

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-virtual {p1, v0, p0, v1}, Ll/jka;->f7(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Z)Lrx/c;

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final synthetic n0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vw60;->I:Ll/th0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/th0;->c()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public n1(Ljava/util/List;ZLcom/p1/mobile/putong/data/User;I)Z
    .locals 1
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
    invoke-virtual {p0}, Ll/vw60;->S()Ll/y670;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1, p2, p3, p4}, Ll/y670;->E(Ljava/util/List;ZLcom/p1/mobile/putong/data/User;I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/vw60;->p0()V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Ll/vw60;->B:Ll/tt60;

    .line 12
    .line 13
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    const/4 p2, 0x0

    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    iget-object p1, p0, Ll/vw60;->A:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/AlbumFeedHeader;

    .line 21
    .line 22
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_1

    .line 27
    .line 28
    iget-object p1, p0, Ll/vw60;->A:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/AlbumFeedHeader;

    .line 29
    .line 30
    iget-object p3, p0, Ll/vw60;->z:Ll/wv60;

    .line 31
    .line 32
    iget-object p3, p3, Ll/wv60;->l:Ll/bkj0;

    .line 33
    .line 34
    iget-object p0, p0, Ll/vw60;->B:Ll/tt60;

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->C()I

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    const/4 p4, 0x2

    .line 41
    if-lt p0, p4, :cond_0

    .line 42
    .line 43
    const/4 p0, 0x1

    .line 44
    goto :goto_0

    .line 45
    :cond_0
    move p0, p2

    .line 46
    :goto_0
    invoke-virtual {p1, p3, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/AlbumFeedHeader;->T(Ll/bkj0;Z)V

    .line 47
    .line 48
    .line 49
    :cond_1
    return p2
.end method

.method public final o0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/vw60;->E:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/p1/mobile/putong/data/User;->isWisdomStar(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 12
    .line 13
    iget-object v1, p0, Ll/vw60;->E:Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ll/jka;->R7(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/NotifyUsers;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    if-eqz v0, :cond_3

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->albumButton:Lcom/p1/mobile/putong/feed/data/AlbumButton;

    .line 24
    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/AlbumButton;->deepLink:Ljava/lang/String;

    .line 29
    .line 30
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    invoke-virtual {p0}, Ll/vw60;->I()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-static {v1, v0}, Ll/ryh;->b(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Ll/vw60;->I()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;->pageId()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iget-object p0, p0, Ll/vw60;->E:Lcom/p1/mobile/putong/data/User;

    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 59
    .line 60
    const-string v1, "robotname"

    .line 61
    .line 62
    invoke-static {v1, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    filled-new-array {p0}, [Ll/pf60;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    const-string v1, "e_moment_post"

    .line 71
    .line 72
    invoke-static {v1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :cond_2
    iget-object v0, p0, Ll/vw60;->z:Ll/wv60;

    .line 77
    .line 78
    iget-object v0, v0, Ll/wv60;->j:Lcom/p1/mobile/putong/data/User;

    .line 79
    .line 80
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-eqz v0, :cond_3

    .line 85
    .line 86
    invoke-virtual {p0}, Ll/vw60;->I()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-virtual {p0}, Ll/vw60;->I()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    iget-object p0, p0, Ll/vw60;->z:Ll/wv60;

    .line 95
    .line 96
    iget-object p0, p0, Ll/wv60;->j:Lcom/p1/mobile/putong/data/User;

    .line 97
    .line 98
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 99
    .line 100
    const/4 v2, 0x0

    .line 101
    invoke-static {v1, p0, v2, v2}, Ll/orb0;->c(Landroid/content/Context;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 106
    .line 107
    .line 108
    :cond_3
    :goto_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 11

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    sget v0, Ll/hdc0;->d:I

    .line 6
    .line 7
    const-string v1, "p_album"

    .line 8
    .line 9
    if-ne v0, p1, :cond_1

    .line 10
    .line 11
    invoke-static {}, Ll/cmg;->K()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    iget-object v0, p0, Ll/vw60;->z:Ll/wv60;

    .line 16
    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    const-string p1, "moments_user_id"

    .line 20
    .line 21
    iget-object v0, v0, Ll/wv60;->d:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    const-string v0, "moment_id"

    .line 28
    .line 29
    const-string v2, ""

    .line 30
    .line 31
    invoke-static {v0, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    filled-new-array {p1, v0}, [Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    const-string v0, "e_likeButton"

    .line 40
    .line 41
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 42
    .line 43
    .line 44
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-virtual {p0}, Ll/vw60;->I()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    iget-object v4, p0, Ll/vw60;->E:Lcom/p1/mobile/putong/data/User;

    .line 53
    .line 54
    iget-object p0, p0, Ll/vw60;->z:Ll/wv60;

    .line 55
    .line 56
    iget-boolean p0, p0, Ll/wv60;->m:Z

    .line 57
    .line 58
    xor-int/lit8 v5, p0, 0x1

    .line 59
    .line 60
    const-string p0, "moment"

    .line 61
    .line 62
    invoke-static {p0}, Lcom/p1/mobile/putong/data/LikeFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LikeFrom;

    .line 63
    .line 64
    .line 65
    move-result-object v7

    .line 66
    const/4 v9, 0x0

    .line 67
    const/4 v10, 0x0

    .line 68
    const/4 v6, 0x0

    .line 69
    const/4 v8, 0x0

    .line 70
    invoke-interface/range {v2 .. v10}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->kn(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;Lcom/p1/mobile/putong/data/LikeFrom;Ljava/lang/String;Ll/y20;Ll/y20;)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_0
    invoke-virtual {v0}, Ll/wv60;->u0()V

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_1
    sget v0, Ll/hdc0;->f2:I

    .line 79
    .line 80
    if-ne v0, p1, :cond_2

    .line 81
    .line 82
    iget-object p1, p0, Ll/vw60;->z:Ll/wv60;

    .line 83
    .line 84
    iget-object p1, p1, Ll/wv60;->j:Lcom/p1/mobile/putong/data/User;

    .line 85
    .line 86
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    if-eqz p1, :cond_4

    .line 91
    .line 92
    invoke-virtual {p0}, Ll/vw60;->I()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->z:I

    .line 101
    .line 102
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    iget-object v0, p0, Ll/vw60;->z:Ll/wv60;

    .line 107
    .line 108
    iget-object v0, v0, Ll/wv60;->j:Lcom/p1/mobile/putong/data/User;

    .line 109
    .line 110
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 111
    .line 112
    const-string v2, "owner_id"

    .line 113
    .line 114
    invoke-static {v2, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    iget-object v2, p0, Ll/vw60;->z:Ll/wv60;

    .line 119
    .line 120
    iget-object v2, v2, Ll/wv60;->j:Lcom/p1/mobile/putong/data/User;

    .line 121
    .line 122
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 123
    .line 124
    const-string v3, "receiver_user_id"

    .line 125
    .line 126
    invoke-static {v3, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 127
    .line 128
    .line 129
    move-result-object v2

    .line 130
    filled-new-array {v0, v2}, [Ll/pf60;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    const-string v2, "e_cancelfollow"

    .line 135
    .line 136
    invoke-static {v2, v1, v0}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {p0, p1}, Ll/vw60;->G0(Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    return-void

    .line 143
    :cond_2
    sget v0, Ll/hdc0;->F1:I

    .line 144
    .line 145
    if-ne v0, p1, :cond_3

    .line 146
    .line 147
    invoke-virtual {p0}, Ll/vw60;->o0()V

    .line 148
    .line 149
    .line 150
    return-void

    .line 151
    :cond_3
    sget v0, Ll/hdc0;->t:I

    .line 152
    .line 153
    if-ne v0, p1, :cond_4

    .line 154
    .line 155
    iget-object p0, p0, Ll/vw60;->y:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personalfeed/PersonalPhotoAlbumFeedFrag;

    .line 156
    .line 157
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personalfeed/PersonalPhotoAlbumFeedFrag;->o()V

    .line 158
    .line 159
    .line 160
    :cond_4
    return-void
.end method

.method public p()V
    .locals 0

    .line 1
    return-void
.end method

.method public p0()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/vw60;->B:Ll/tt60;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/tt60;->A0()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Ll/vw60;->B:Ll/tt60;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->C()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-gt v0, v2, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Ll/vw60;->B:Ll/tt60;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/tt60;->B0()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    :cond_0
    iget-object v0, p0, Ll/vw60;->z:Ll/wv60;

    .line 30
    .line 31
    invoke-virtual {v0}, Ll/wv60;->F0()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    move v0, v2

    .line 38
    goto :goto_0

    .line 39
    :cond_1
    move v0, v1

    .line 40
    :goto_0
    iget-object v3, p0, Ll/vw60;->A:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/AlbumFeedHeader;

    .line 41
    .line 42
    if-nez v3, :cond_2

    .line 43
    .line 44
    new-instance v3, Landroidx/recyclerview/widget/RecyclerView$p;

    .line 45
    .line 46
    const/4 v4, -0x1

    .line 47
    const/4 v5, -0x2

    .line 48
    invoke-direct {v3, v4, v5}, Landroidx/recyclerview/widget/RecyclerView$p;-><init>(II)V

    .line 49
    .line 50
    .line 51
    new-instance v4, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/AlbumFeedHeader;

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/vw60;->I()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;

    .line 54
    .line 55
    .line 56
    move-result-object v5

    .line 57
    invoke-direct {v4, v5}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/AlbumFeedHeader;-><init>(Landroid/content/Context;)V

    .line 58
    .line 59
    .line 60
    iput-object v4, p0, Ll/vw60;->A:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/AlbumFeedHeader;

    .line 61
    .line 62
    iget-object v5, p0, Ll/vw60;->z:Ll/wv60;

    .line 63
    .line 64
    iget-object v5, v5, Ll/wv60;->d:Ljava/lang/String;

    .line 65
    .line 66
    invoke-virtual {v4, v5}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/AlbumFeedHeader;->setUserId(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    iget-object v4, p0, Ll/vw60;->A:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/AlbumFeedHeader;

    .line 70
    .line 71
    iget-object v5, p0, Ll/vw60;->z:Ll/wv60;

    .line 72
    .line 73
    iget-object v5, v5, Ll/wv60;->d:Ljava/lang/String;

    .line 74
    .line 75
    invoke-virtual {v4, v5}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/AlbumFeedHeader;->R(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    iget-object v4, p0, Ll/vw60;->A:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/AlbumFeedHeader;

    .line 79
    .line 80
    invoke-virtual {v4, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 81
    .line 82
    .line 83
    :cond_2
    iget-object v3, p0, Ll/vw60;->A:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/AlbumFeedHeader;

    .line 84
    .line 85
    new-instance v4, Ll/sw60;

    .line 86
    .line 87
    invoke-direct {v4, p0}, Ll/sw60;-><init>(Ll/vw60;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v3, v0, v4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/AlbumFeedHeader;->X(ZLl/y20;)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Ll/vw60;->E:Lcom/p1/mobile/putong/data/User;

    .line 94
    .line 95
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    if-eqz v0, :cond_3

    .line 100
    .line 101
    iget-object v0, p0, Ll/vw60;->A:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/AlbumFeedHeader;

    .line 102
    .line 103
    iget-object v3, p0, Ll/vw60;->E:Lcom/p1/mobile/putong/data/User;

    .line 104
    .line 105
    new-instance v4, Ll/tw60;

    .line 106
    .line 107
    invoke-direct {v4, p0}, Ll/tw60;-><init>(Ll/vw60;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {v0, v3, v4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/AlbumFeedHeader;->V(Lcom/p1/mobile/putong/data/User;Ll/x20;)V

    .line 111
    .line 112
    .line 113
    :cond_3
    iget-object v0, p0, Ll/vw60;->A:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/AlbumFeedHeader;

    .line 114
    .line 115
    iget-object v3, p0, Ll/vw60;->C:Ll/s8h;

    .line 116
    .line 117
    if-eqz v0, :cond_4

    .line 118
    .line 119
    if-eqz v3, :cond_5

    .line 120
    .line 121
    invoke-virtual {v3}, Ll/zzk;->A()Z

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    if-nez v0, :cond_5

    .line 126
    .line 127
    iget-object v0, p0, Ll/vw60;->C:Ll/s8h;

    .line 128
    .line 129
    iget-object v1, p0, Ll/vw60;->A:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/AlbumFeedHeader;

    .line 130
    .line 131
    invoke-virtual {v0, v1}, Ll/zzk;->H(Landroid/view/View;)V

    .line 132
    .line 133
    .line 134
    iget-object p0, p0, Ll/vw60;->B:Ll/tt60;

    .line 135
    .line 136
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->s0(I)V

    .line 137
    .line 138
    .line 139
    return-void

    .line 140
    :cond_4
    if-eqz v3, :cond_5

    .line 141
    .line 142
    invoke-virtual {v3}, Ll/zzk;->A()Z

    .line 143
    .line 144
    .line 145
    move-result v0

    .line 146
    if-eqz v0, :cond_5

    .line 147
    .line 148
    iget-object v0, p0, Ll/vw60;->C:Ll/s8h;

    .line 149
    .line 150
    invoke-virtual {v0}, Ll/zzk;->D()V

    .line 151
    .line 152
    .line 153
    iget-object p0, p0, Ll/vw60;->B:Ll/tt60;

    .line 154
    .line 155
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->s0(I)V

    .line 156
    .line 157
    .line 158
    :cond_5
    return-void
.end method

.method public q0(Lcom/p1/mobile/putong/data/User;)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/vw60;->z:Ll/wv60;

    .line 2
    .line 3
    iget-boolean v0, v0, Ll/wv60;->i:Z

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    const/4 v2, 0x0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    move v5, v1

    .line 10
    move v0, v2

    .line 11
    move v3, v0

    .line 12
    move v4, v3

    .line 13
    goto/16 :goto_8

    .line 14
    .line 15
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/high16 v3, 0x43800000    # 256.0f

    .line 20
    .line 21
    if-eqz v0, :cond_3

    .line 22
    .line 23
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/p1/mobile/putong/data/User;->isWisdomStar(Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    invoke-static {}, Ll/cmg;->x()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    :goto_0
    move v0, v1

    .line 38
    goto :goto_1

    .line 39
    :cond_1
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {v0}, Ll/kyi;->a(Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_2

    .line 46
    .line 47
    iget-boolean v0, p0, Ll/vw60;->F:Z

    .line 48
    .line 49
    if-nez v0, :cond_2

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    move v0, v2

    .line 53
    :goto_1
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    iget-object v4, p0, Ll/vw60;->l:Lv/VButton;

    .line 58
    .line 59
    new-array v5, v1, [Landroid/view/View;

    .line 60
    .line 61
    aput-object v4, v5, v2

    .line 62
    .line 63
    invoke-static {v3, v5}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 64
    .line 65
    .line 66
    move v3, v0

    .line 67
    :goto_2
    move v0, v2

    .line 68
    move v4, v0

    .line 69
    :goto_3
    move v5, v4

    .line 70
    goto/16 :goto_8

    .line 71
    .line 72
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 73
    .line 74
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    const-string v4, "matched"

    .line 79
    .line 80
    if-eqz v0, :cond_4

    .line 81
    .line 82
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 83
    .line 84
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 85
    .line 86
    invoke-static {v0, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    if-eqz v0, :cond_4

    .line 91
    .line 92
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 93
    .line 94
    invoke-static {v0}, Ll/kyi;->a(Ljava/lang/String;)Z

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    if-eqz v0, :cond_4

    .line 99
    .line 100
    iget-boolean v0, p0, Ll/vw60;->F:Z

    .line 101
    .line 102
    if-nez v0, :cond_4

    .line 103
    .line 104
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    iget-object v3, p0, Ll/vw60;->l:Lv/VButton;

    .line 109
    .line 110
    new-array v4, v1, [Landroid/view/View;

    .line 111
    .line 112
    aput-object v3, v4, v2

    .line 113
    .line 114
    invoke-static {v0, v4}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 115
    .line 116
    .line 117
    move v3, v1

    .line 118
    goto :goto_2

    .line 119
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 120
    .line 121
    const-string v3, "#ffffff"

    .line 122
    .line 123
    if-eqz v0, :cond_c

    .line 124
    .line 125
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 126
    .line 127
    if-nez v0, :cond_5

    .line 128
    .line 129
    goto/16 :goto_7

    .line 130
    .line 131
    :cond_5
    const-string v5, "following"

    .line 132
    .line 133
    invoke-static {v0, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    const-string v5, "#bfbfbf"

    .line 138
    .line 139
    if-eqz v0, :cond_6

    .line 140
    .line 141
    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    sget-object v3, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 146
    .line 147
    sget v4, Lcom/p1/mobile/putong/feed/R$string;->P2:I

    .line 148
    .line 149
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v3

    .line 153
    invoke-virtual {p0, v1, v0, v3}, Ll/vw60;->w0(ZILjava/lang/String;)Z

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    :goto_4
    move v3, v2

    .line 158
    :goto_5
    move v4, v3

    .line 159
    goto :goto_3

    .line 160
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 161
    .line 162
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 163
    .line 164
    const-string v6, "default"

    .line 165
    .line 166
    invoke-static {v0, v6}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 167
    .line 168
    .line 169
    move-result v0

    .line 170
    if-nez v0, :cond_a

    .line 171
    .line 172
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 173
    .line 174
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 175
    .line 176
    const-string v6, "followed"

    .line 177
    .line 178
    invoke-static {v0, v6}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 179
    .line 180
    .line 181
    move-result v0

    .line 182
    if-nez v0, :cond_a

    .line 183
    .line 184
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 185
    .line 186
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 187
    .line 188
    const-string v6, "unfollow"

    .line 189
    .line 190
    invoke-static {v0, v6}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 191
    .line 192
    .line 193
    move-result v0

    .line 194
    if-nez v0, :cond_a

    .line 195
    .line 196
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 197
    .line 198
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 199
    .line 200
    const-string v6, "unknown_"

    .line 201
    .line 202
    invoke-static {v0, v6}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 203
    .line 204
    .line 205
    move-result v0

    .line 206
    if-eqz v0, :cond_7

    .line 207
    .line 208
    goto :goto_6

    .line 209
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 210
    .line 211
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 212
    .line 213
    invoke-static {v0, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 214
    .line 215
    .line 216
    move-result v0

    .line 217
    if-eqz v0, :cond_9

    .line 218
    .line 219
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 220
    .line 221
    invoke-static {v0}, Ll/kyi;->a(Ljava/lang/String;)Z

    .line 222
    .line 223
    .line 224
    move-result v0

    .line 225
    if-eqz v0, :cond_8

    .line 226
    .line 227
    invoke-static {}, Ll/cmg;->K()Z

    .line 228
    .line 229
    .line 230
    move-result v0

    .line 231
    xor-int/2addr v0, v1

    .line 232
    move v4, v0

    .line 233
    move v3, v1

    .line 234
    move v0, v2

    .line 235
    move v5, v0

    .line 236
    goto :goto_8

    .line 237
    :cond_8
    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 238
    .line 239
    .line 240
    move-result v0

    .line 241
    sget-object v3, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 242
    .line 243
    sget v4, Lcom/p1/mobile/putong/feed/R$string;->N2:I

    .line 244
    .line 245
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 246
    .line 247
    .line 248
    move-result-object v3

    .line 249
    invoke-virtual {p0, v1, v0, v3}, Ll/vw60;->w0(ZILjava/lang/String;)Z

    .line 250
    .line 251
    .line 252
    move-result v0

    .line 253
    goto :goto_4

    .line 254
    :cond_9
    move v0, v2

    .line 255
    move v3, v0

    .line 256
    goto :goto_5

    .line 257
    :cond_a
    :goto_6
    invoke-static {}, Ll/cmg;->K()Z

    .line 258
    .line 259
    .line 260
    move-result v0

    .line 261
    if-nez v0, :cond_b

    .line 262
    .line 263
    invoke-virtual {p0, p1}, Ll/vw60;->O(Lcom/p1/mobile/putong/data/User;)V

    .line 264
    .line 265
    .line 266
    :cond_b
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 267
    .line 268
    .line 269
    move-result v0

    .line 270
    sget-object v3, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 271
    .line 272
    sget v4, Lcom/p1/mobile/putong/feed/R$string;->R2:I

    .line 273
    .line 274
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 275
    .line 276
    .line 277
    move-result-object v3

    .line 278
    invoke-virtual {p0, v2, v0, v3}, Ll/vw60;->w0(ZILjava/lang/String;)Z

    .line 279
    .line 280
    .line 281
    move-result v0

    .line 282
    goto :goto_4

    .line 283
    :cond_c
    :goto_7
    invoke-static {}, Ll/cmg;->K()Z

    .line 284
    .line 285
    .line 286
    move-result v0

    .line 287
    if-nez v0, :cond_d

    .line 288
    .line 289
    invoke-virtual {p0, p1}, Ll/vw60;->O(Lcom/p1/mobile/putong/data/User;)V

    .line 290
    .line 291
    .line 292
    :cond_d
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 293
    .line 294
    .line 295
    move-result v0

    .line 296
    sget-object v3, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 297
    .line 298
    sget v4, Lcom/p1/mobile/putong/feed/R$string;->R2:I

    .line 299
    .line 300
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 301
    .line 302
    .line 303
    move-result-object v3

    .line 304
    invoke-virtual {p0, v2, v0, v3}, Ll/vw60;->w0(ZILjava/lang/String;)Z

    .line 305
    .line 306
    .line 307
    move-result v0

    .line 308
    goto/16 :goto_4

    .line 309
    .line 310
    :goto_8
    invoke-virtual {p0, v0}, Ll/vw60;->B0(Z)V

    .line 311
    .line 312
    .line 313
    if-nez v0, :cond_f

    .line 314
    .line 315
    if-nez v3, :cond_f

    .line 316
    .line 317
    if-eqz v5, :cond_e

    .line 318
    .line 319
    goto :goto_9

    .line 320
    :cond_e
    move v6, v2

    .line 321
    goto :goto_a

    .line 322
    :cond_f
    :goto_9
    move v6, v1

    .line 323
    :goto_a
    iget-object v7, p0, Ll/vw60;->m:Lv/VLinear;

    .line 324
    .line 325
    invoke-virtual {p0, v7, v4}, Ll/vw60;->I0(Landroid/view/View;Z)Z

    .line 326
    .line 327
    .line 328
    iget-object v4, p0, Ll/vw60;->e:Lv/VLinear;

    .line 329
    .line 330
    invoke-static {}, Ll/cmg;->K()Z

    .line 331
    .line 332
    .line 333
    move-result v7

    .line 334
    if-eqz v7, :cond_10

    .line 335
    .line 336
    invoke-static {p1}, Ll/hyh;->i(Lcom/p1/mobile/putong/data/User;)Z

    .line 337
    .line 338
    .line 339
    move-result v7

    .line 340
    if-nez v7, :cond_11

    .line 341
    .line 342
    :cond_10
    if-eqz v0, :cond_11

    .line 343
    .line 344
    move v0, v1

    .line 345
    goto :goto_b

    .line 346
    :cond_11
    move v0, v2

    .line 347
    :goto_b
    invoke-virtual {p0, v4, v0}, Ll/vw60;->I0(Landroid/view/View;Z)Z

    .line 348
    .line 349
    .line 350
    iget-object v0, p0, Ll/vw60;->k:Lv/VRelative;

    .line 351
    .line 352
    invoke-virtual {p0, v0, v3}, Ll/vw60;->I0(Landroid/view/View;Z)Z

    .line 353
    .line 354
    .line 355
    iget-object v0, p0, Ll/vw60;->p:Lv/VRelative;

    .line 356
    .line 357
    invoke-virtual {p0, v0, v5}, Ll/vw60;->I0(Landroid/view/View;Z)Z

    .line 358
    .line 359
    .line 360
    iget-object v0, p0, Ll/vw60;->d:Lv/VFrame;

    .line 361
    .line 362
    invoke-virtual {p0, v0, v6}, Ll/vw60;->I0(Landroid/view/View;Z)Z

    .line 363
    .line 364
    .line 365
    invoke-virtual {p0}, Ll/vw60;->D0()Z

    .line 366
    .line 367
    .line 368
    move-result v0

    .line 369
    if-nez v0, :cond_12

    .line 370
    .line 371
    invoke-virtual {p0, p1}, Ll/vw60;->V(Lcom/p1/mobile/putong/data/User;)V

    .line 372
    .line 373
    .line 374
    :cond_12
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 375
    .line 376
    invoke-static {v0}, Ll/kyi;->a(Ljava/lang/String;)Z

    .line 377
    .line 378
    .line 379
    move-result v0

    .line 380
    invoke-static {}, Ll/cmg;->Y()Z

    .line 381
    .line 382
    .line 383
    move-result v4

    .line 384
    if-eqz v4, :cond_14

    .line 385
    .line 386
    iget-object v4, p0, Ll/vw60;->z:Ll/wv60;

    .line 387
    .line 388
    iget-boolean v4, v4, Ll/wv60;->i:Z

    .line 389
    .line 390
    if-nez v4, :cond_14

    .line 391
    .line 392
    if-nez v0, :cond_14

    .line 393
    .line 394
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 395
    .line 396
    invoke-static {v0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 397
    .line 398
    .line 399
    move-result v0

    .line 400
    if-nez v0, :cond_14

    .line 401
    .line 402
    if-nez v3, :cond_14

    .line 403
    .line 404
    iget-object v0, p0, Ll/vw60;->d:Lv/VFrame;

    .line 405
    .line 406
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 407
    .line 408
    .line 409
    iget-object v0, p0, Ll/vw60;->r:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 410
    .line 411
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 412
    .line 413
    .line 414
    iget-object v0, p0, Ll/vw60;->r:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 415
    .line 416
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 417
    .line 418
    .line 419
    move-result v0

    .line 420
    if-eqz v0, :cond_13

    .line 421
    .line 422
    invoke-static {}, Ll/cmg;->e0()Z

    .line 423
    .line 424
    .line 425
    move-result v0

    .line 426
    if-eqz v0, :cond_13

    .line 427
    .line 428
    iget-object v0, p0, Ll/vw60;->t:Landroid/widget/LinearLayout;

    .line 429
    .line 430
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 431
    .line 432
    .line 433
    :cond_13
    invoke-static {p1}, Ll/hyh;->i(Lcom/p1/mobile/putong/data/User;)Z

    .line 434
    .line 435
    .line 436
    move-result v0

    .line 437
    if-eqz v0, :cond_14

    .line 438
    .line 439
    iget-object v0, p0, Ll/vw60;->s:Lv/VLinear;

    .line 440
    .line 441
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 442
    .line 443
    .line 444
    :cond_14
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 445
    .line 446
    invoke-static {v0}, Lcom/p1/mobile/putong/data/User;->isWisdomStar(Ljava/lang/String;)Z

    .line 447
    .line 448
    .line 449
    move-result v0

    .line 450
    if-eqz v0, :cond_17

    .line 451
    .line 452
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 453
    .line 454
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 455
    .line 456
    invoke-virtual {v0, p1}, Ll/jka;->R7(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/NotifyUsers;

    .line 457
    .line 458
    .line 459
    move-result-object p1

    .line 460
    if-eqz p1, :cond_16

    .line 461
    .line 462
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->albumButton:Lcom/p1/mobile/putong/feed/data/AlbumButton;

    .line 463
    .line 464
    if-eqz v0, :cond_16

    .line 465
    .line 466
    invoke-static {}, Ll/cmg;->x()Z

    .line 467
    .line 468
    .line 469
    move-result v0

    .line 470
    if-nez v0, :cond_15

    .line 471
    .line 472
    goto :goto_c

    .line 473
    :cond_15
    iget-object v0, p0, Ll/vw60;->l:Lv/VButton;

    .line 474
    .line 475
    sget v1, Ll/qa00;->R:I

    .line 476
    .line 477
    invoke-static {v0, v1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 478
    .line 479
    .line 480
    iget-object v0, p0, Ll/vw60;->l:Lv/VButton;

    .line 481
    .line 482
    invoke-static {v0, v1}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 483
    .line 484
    .line 485
    iget-object v0, p0, Ll/vw60;->l:Lv/VButton;

    .line 486
    .line 487
    sget v1, Ll/qa00;->B:I

    .line 488
    .line 489
    invoke-static {v0, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 490
    .line 491
    .line 492
    iget-object p0, p0, Ll/vw60;->l:Lv/VButton;

    .line 493
    .line 494
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->albumButton:Lcom/p1/mobile/putong/feed/data/AlbumButton;

    .line 495
    .line 496
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/AlbumButton;->value:Ljava/lang/String;

    .line 497
    .line 498
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 499
    .line 500
    .line 501
    return-void

    .line 502
    :cond_16
    :goto_c
    iget-object p0, p0, Ll/vw60;->k:Lv/VRelative;

    .line 503
    .line 504
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 505
    .line 506
    .line 507
    :cond_17
    return-void
.end method

.method public r0(Ljava/util/List;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/RecommendMessage;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "female"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz p1, :cond_5

    .line 5
    .line 6
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 7
    .line 8
    .line 9
    move-result v2

    .line 10
    if-nez v2, :cond_0

    .line 11
    .line 12
    goto/16 :goto_1

    .line 13
    .line 14
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    const-string v3, "\u56de\u5e94\u4ed6"

    .line 19
    .line 20
    const-string v4, "\u56de\u5e94\u5979"

    .line 21
    .line 22
    const/4 v5, 0x1

    .line 23
    if-ne v2, v5, :cond_2

    .line 24
    .line 25
    invoke-virtual {p0, v1}, Ll/vw60;->Y(Z)V

    .line 26
    .line 27
    .line 28
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 29
    .line 30
    iget-object v6, p0, Ll/vw60;->u:Lv/VDraweeView;

    .line 31
    .line 32
    iget-object v7, p0, Ll/vw60;->E:Lcom/p1/mobile/putong/data/User;

    .line 33
    .line 34
    invoke-virtual {v7}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 35
    .line 36
    .line 37
    move-result-object v7

    .line 38
    invoke-virtual {v7}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 39
    .line 40
    .line 41
    move-result-object v7

    .line 42
    invoke-virtual {v2, v6, v7}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 43
    .line 44
    .line 45
    iget-object v2, p0, Ll/vw60;->w:Landroid/widget/TextView;

    .line 46
    .line 47
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    check-cast p1, Lcom/p1/mobile/putong/data/RecommendMessage;

    .line 52
    .line 53
    iget-object p1, p1, Lcom/p1/mobile/putong/data/RecommendMessage;->messageValue:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 56
    .line 57
    .line 58
    iget-object p1, p0, Ll/vw60;->w:Landroid/widget/TextView;

    .line 59
    .line 60
    const-string v1, "#e6000000"

    .line 61
    .line 62
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 67
    .line 68
    .line 69
    iget-object p1, p0, Ll/vw60;->x:Landroid/widget/TextView;

    .line 70
    .line 71
    iget-object v1, p0, Ll/vw60;->E:Lcom/p1/mobile/putong/data/User;

    .line 72
    .line 73
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 74
    .line 75
    invoke-static {v1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-eqz v0, :cond_1

    .line 80
    .line 81
    move-object v3, v4

    .line 82
    :cond_1
    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 83
    .line 84
    .line 85
    iget-object p1, p0, Ll/vw60;->E:Lcom/p1/mobile/putong/data/User;

    .line 86
    .line 87
    invoke-virtual {p0, p1, v5}, Ll/vw60;->E0(Lcom/p1/mobile/putong/data/User;Z)V

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :cond_2
    iget-object v2, p0, Ll/vw60;->E:Lcom/p1/mobile/putong/data/User;

    .line 92
    .line 93
    invoke-virtual {p0, v2, v5}, Ll/vw60;->E0(Lcom/p1/mobile/putong/data/User;Z)V

    .line 94
    .line 95
    .line 96
    iget-object v2, p0, Ll/vw60;->x:Landroid/widget/TextView;

    .line 97
    .line 98
    iget-object v6, p0, Ll/vw60;->E:Lcom/p1/mobile/putong/data/User;

    .line 99
    .line 100
    iget-object v6, v6, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 101
    .line 102
    invoke-static {v6, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    if-eqz v0, :cond_3

    .line 107
    .line 108
    move-object v3, v4

    .line 109
    :cond_3
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {p0, v5}, Ll/vw60;->Y(Z)V

    .line 113
    .line 114
    .line 115
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 116
    .line 117
    iget-object v2, p0, Ll/vw60;->u:Lv/VDraweeView;

    .line 118
    .line 119
    iget-object v3, p0, Ll/vw60;->E:Lcom/p1/mobile/putong/data/User;

    .line 120
    .line 121
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 122
    .line 123
    .line 124
    move-result-object v3

    .line 125
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 126
    .line 127
    .line 128
    move-result-object v3

    .line 129
    invoke-virtual {v0, v2, v3}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 130
    .line 131
    .line 132
    new-instance v0, Ljava/util/ArrayList;

    .line 133
    .line 134
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 135
    .line 136
    .line 137
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 138
    .line 139
    .line 140
    move-result v2

    .line 141
    if-ge v1, v2, :cond_4

    .line 142
    .line 143
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    move-result-object v2

    .line 147
    check-cast v2, Lcom/p1/mobile/putong/data/RecommendMessage;

    .line 148
    .line 149
    iget-object v2, v2, Lcom/p1/mobile/putong/data/RecommendMessage;->messageValue:Ljava/lang/String;

    .line 150
    .line 151
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 152
    .line 153
    .line 154
    add-int/lit8 v1, v1, 0x1

    .line 155
    .line 156
    goto :goto_0

    .line 157
    :cond_4
    iget-object p1, p0, Ll/vw60;->v:Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView;

    .line 158
    .line 159
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView;->setList(Ljava/util/List;)V

    .line 160
    .line 161
    .line 162
    iget-object p0, p0, Ll/vw60;->v:Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView;

    .line 163
    .line 164
    const/16 p1, 0x7d0

    .line 165
    .line 166
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/newui/view/CoreAutoScrollTextView;->h(I)V

    .line 167
    .line 168
    .line 169
    return-void

    .line 170
    :cond_5
    :goto_1
    invoke-virtual {p0, v1}, Ll/vw60;->Y(Z)V

    .line 171
    .line 172
    .line 173
    iget-object p1, p0, Ll/vw60;->u:Lv/VDraweeView;

    .line 174
    .line 175
    sget v2, Ll/lbc0;->i:I

    .line 176
    .line 177
    invoke-virtual {p1, v2}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 178
    .line 179
    .line 180
    new-instance p1, Ljava/lang/StringBuilder;

    .line 181
    .line 182
    const-string v2, "\u804a\u804a"

    .line 183
    .line 184
    invoke-direct {p1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    iget-object v2, p0, Ll/vw60;->E:Lcom/p1/mobile/putong/data/User;

    .line 188
    .line 189
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 190
    .line 191
    invoke-static {v2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 192
    .line 193
    .line 194
    move-result v0

    .line 195
    if-eqz v0, :cond_6

    .line 196
    .line 197
    const-string v0, "\u5979"

    .line 198
    .line 199
    goto :goto_2

    .line 200
    :cond_6
    const-string v0, "\u4ed6"

    .line 201
    .line 202
    :goto_2
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 203
    .line 204
    .line 205
    const-string v0, "\u7684\u52a8\u6001\u5427\uff0c\u66f4\u6709\u53ef\u80fd\u5f97\u5230\u56de\u590d"

    .line 206
    .line 207
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 208
    .line 209
    .line 210
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 211
    .line 212
    .line 213
    move-result-object p1

    .line 214
    invoke-virtual {p0, p1}, Ll/vw60;->R(Ljava/lang/String;)Ljava/lang/String;

    .line 215
    .line 216
    .line 217
    move-result-object p1

    .line 218
    iget-object v0, p0, Ll/vw60;->w:Landroid/widget/TextView;

    .line 219
    .line 220
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 221
    .line 222
    .line 223
    iget-object p1, p0, Ll/vw60;->w:Landroid/widget/TextView;

    .line 224
    .line 225
    const-string v0, "#26000000"

    .line 226
    .line 227
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 228
    .line 229
    .line 230
    move-result v0

    .line 231
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 232
    .line 233
    .line 234
    iget-object p1, p0, Ll/vw60;->x:Landroid/widget/TextView;

    .line 235
    .line 236
    invoke-virtual {p0}, Ll/vw60;->I()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;

    .line 237
    .line 238
    .line 239
    move-result-object v0

    .line 240
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->Q0:I

    .line 241
    .line 242
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 243
    .line 244
    .line 245
    move-result-object v0

    .line 246
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 247
    .line 248
    .line 249
    iget-object p1, p0, Ll/vw60;->E:Lcom/p1/mobile/putong/data/User;

    .line 250
    .line 251
    invoke-virtual {p0, p1, v1}, Ll/vw60;->E0(Lcom/p1/mobile/putong/data/User;Z)V

    .line 252
    .line 253
    .line 254
    return-void
.end method

.method public s0()Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;
    .locals 8

    .line 1
    new-instance v0, Ll/tt60;

    .line 2
    .line 3
    iget-object v1, p0, Ll/vw60;->D:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 4
    .line 5
    iget-object v2, p0, Ll/vw60;->z:Ll/wv60;

    .line 6
    .line 7
    invoke-direct {p0}, Ll/vw60;->Q()Lv/VRecyclerView;

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    iget-object v4, p0, Ll/vw60;->z:Ll/wv60;

    .line 12
    .line 13
    move-object v5, v4

    .line 14
    iget-object v4, v5, Ll/wv60;->d:Ljava/lang/String;

    .line 15
    .line 16
    iget v6, v5, Ll/wv60;->f:I

    .line 17
    .line 18
    const/4 v7, 0x1

    .line 19
    const-string v5, "from_album"

    .line 20
    .line 21
    invoke-direct/range {v0 .. v7}, Ll/tt60;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;Ll/v0q;Lv/VRecyclerView;Ljava/lang/String;Ljava/lang/String;IZ)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Ll/vw60;->B:Ll/tt60;

    .line 25
    .line 26
    return-object v0
.end method

.method public t0(Z)V
    .locals 1

    .line 1
    xor-int/lit8 v0, p1, 0x1

    .line 2
    .line 3
    iput-boolean v0, p0, Ll/vw60;->F:Z

    .line 4
    .line 5
    iget-object v0, p0, Ll/vw60;->k:Lv/VRelative;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    iget-object p1, p0, Ll/vw60;->E:Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ll/vw60;->q0(Lcom/p1/mobile/putong/data/User;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public u0(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    new-instance p1, Ljava/lang/Exception;

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v1, "PhotoAlbumProfileInfoView render user = null userId:"

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/vw60;->z:Ll/wv60;

    .line 13
    .line 14
    iget-object p0, p0, Ll/wv60;->d:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-direct {p1, p0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    iput-object p1, p0, Ll/vw60;->E:Lcom/p1/mobile/putong/data/User;

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/vw60;->p0()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, p1}, Ll/vw60;->q0(Lcom/p1/mobile/putong/data/User;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public v0(Lcom/p1/mobile/putong/data/BubbleInfo;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/vw60;->A:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/AlbumFeedHeader;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/vw60;->E:Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/vw60;->A:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/AlbumFeedHeader;

    .line 18
    .line 19
    iget-object v1, p0, Ll/vw60;->E:Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/vw60;->I()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-string v2, "from_album"

    .line 26
    .line 27
    invoke-virtual {v0, v1, p0, v2, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/AlbumFeedHeader;->W(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;Ljava/lang/String;Lcom/p1/mobile/putong/data/BubbleInfo;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public final w0(ZILjava/lang/String;)Z
    .locals 2
    .param p2    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    invoke-static {}, Ll/cmg;->K()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    iget-object p1, p0, Ll/vw60;->E:Lcom/p1/mobile/putong/data/User;

    .line 9
    .line 10
    invoke-static {p1}, Ll/hyh;->i(Lcom/p1/mobile/putong/data/User;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    return v1

    .line 17
    :cond_0
    iget-object p1, p0, Ll/vw60;->e:Lv/VLinear;

    .line 18
    .line 19
    const/4 p2, 0x0

    .line 20
    invoke-virtual {p1, p2}, Landroid/view/View;->setSelected(Z)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Ll/vw60;->g:Lv/VText;

    .line 24
    .line 25
    const-string p2, "#ffffff"

    .line 26
    .line 27
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Ll/vw60;->g:Lv/VText;

    .line 35
    .line 36
    const-string p2, "\u559c\u6b22"

    .line 37
    .line 38
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ll/vw60;->P()V

    .line 42
    .line 43
    .line 44
    return v1

    .line 45
    :cond_1
    iget-object v0, p0, Ll/vw60;->e:Lv/VLinear;

    .line 46
    .line 47
    invoke-virtual {v0, p1}, Landroid/view/View;->setSelected(Z)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Ll/vw60;->g:Lv/VText;

    .line 51
    .line 52
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 53
    .line 54
    .line 55
    iget-object p0, p0, Ll/vw60;->g:Lv/VText;

    .line 56
    .line 57
    invoke-virtual {p0, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 58
    .line 59
    .line 60
    return v1
.end method

.method public x0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vw60;->D:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->h5(Ll/s2m;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final y0(Landroid/widget/TextView;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public z0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLl/x20;ZZ)V
    .locals 9

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Ll/vw60;->K:Ll/l4g0;

    .line 7
    .line 8
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    if-eqz v2, :cond_0

    .line 13
    .line 14
    iget-object v2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const-string v2, ""

    .line 18
    .line 19
    :goto_0
    const-string v3, "other_user_id"

    .line 20
    .line 21
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    filled-new-array {v2}, [Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v1, v2}, Ll/l4g0;->p([Ll/pf60;)V

    .line 30
    .line 31
    .line 32
    invoke-static {}, Ll/cmg;->K()Z

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-eqz v2, :cond_2

    .line 37
    .line 38
    invoke-static {p2}, Ll/hyh;->l(Lcom/p1/mobile/putong/data/User;)Z

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    if-eqz v2, :cond_1

    .line 43
    .line 44
    const-string v2, "\u53d6\u6d88\u559c\u6b22"

    .line 45
    .line 46
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_1
    invoke-static {p2}, Ll/hyh;->h(Lcom/p1/mobile/putong/data/User;)Z

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    if-eqz v2, :cond_2

    .line 55
    .line 56
    const-string v2, "\u53d6\u6d88\u5173\u6ce8"

    .line 57
    .line 58
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    :cond_2
    :goto_1
    if-eqz p5, :cond_4

    .line 62
    .line 63
    if-nez p6, :cond_3

    .line 64
    .line 65
    invoke-static {p1}, Ll/j1i;->p(Landroid/content/Context;)Ll/j1i;

    .line 66
    .line 67
    .line 68
    move-result-object p5

    .line 69
    invoke-virtual {p5}, Ll/j1i;->l()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p5

    .line 73
    goto :goto_2

    .line 74
    :cond_3
    invoke-static {p1}, Ll/j1i;->p(Landroid/content/Context;)Ll/j1i;

    .line 75
    .line 76
    .line 77
    move-result-object p5

    .line 78
    invoke-virtual {p5}, Ll/j1i;->a()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p5

    .line 82
    :goto_2
    invoke-interface {v0, p5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    :goto_3
    move-object v4, p5

    .line 86
    goto :goto_4

    .line 87
    :cond_4
    const/4 p5, 0x0

    .line 88
    goto :goto_3

    .line 89
    :goto_4
    if-eqz p3, :cond_5

    .line 90
    .line 91
    invoke-virtual {p0}, Ll/vw60;->I()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;

    .line 92
    .line 93
    .line 94
    move-result-object p3

    .line 95
    sget p5, Lcom/p1/mobile/putong/feed/R$string;->z4:I

    .line 96
    .line 97
    invoke-virtual {p3, p5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object p3

    .line 101
    invoke-interface {v0, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    :cond_5
    new-instance p3, Ll/w30$b;

    .line 105
    .line 106
    invoke-virtual {p0}, Ll/vw60;->I()Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;

    .line 107
    .line 108
    .line 109
    move-result-object p5

    .line 110
    invoke-direct {p3, p5}, Ll/w30$b;-><init>(Landroid/content/Context;)V

    .line 111
    .line 112
    .line 113
    sget p5, Lcom/p1/mobile/putong/feed/R$string;->a:I

    .line 114
    .line 115
    invoke-virtual {p3, p5}, Ll/w30$b;->H(I)Ll/w30$b;

    .line 116
    .line 117
    .line 118
    move-result-object p5

    .line 119
    new-instance v2, Ll/dw60;

    .line 120
    .line 121
    invoke-direct {v2, p0}, Ll/dw60;-><init>(Ll/vw60;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {p5, v2}, Ll/w30$b;->U(Landroid/view/View$OnClickListener;)Ll/w30$b;

    .line 125
    .line 126
    .line 127
    move-result-object p5

    .line 128
    new-instance v2, Ll/ew60;

    .line 129
    .line 130
    invoke-direct {v2}, Ll/ew60;-><init>()V

    .line 131
    .line 132
    .line 133
    invoke-virtual {p5, v2}, Ll/w30$b;->T(Landroid/content/DialogInterface$OnDismissListener;)Ll/w30$b;

    .line 134
    .line 135
    .line 136
    move-result-object p5

    .line 137
    invoke-virtual {p5, v0}, Ll/w30$b;->Q(Ljava/util/List;)Ll/w30$b;

    .line 138
    .line 139
    .line 140
    move-result-object p5

    .line 141
    new-instance v2, Ll/fw60;

    .line 142
    .line 143
    move-object v3, p0

    .line 144
    move-object v6, p1

    .line 145
    move-object v7, p2

    .line 146
    move-object v8, p4

    .line 147
    move v5, p6

    .line 148
    invoke-direct/range {v2 .. v8}, Ll/fw60;-><init>(Ll/vw60;Ljava/lang/String;ZLcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/x20;)V

    .line 149
    .line 150
    .line 151
    invoke-virtual {p5, v2}, Ll/w30$b;->V(Ll/w30$d;)Ll/w30$b;

    .line 152
    .line 153
    .line 154
    invoke-virtual {p3}, Ll/w30$b;->F()Ll/w30;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    iput-object p0, v3, Ll/vw60;->G:Ll/w30;

    .line 159
    .line 160
    invoke-virtual {p0}, Ll/w30;->f()V

    .line 161
    .line 162
    .line 163
    if-eqz v1, :cond_6

    .line 164
    .line 165
    invoke-virtual {v1}, Ll/l4g0;->i()V

    .line 166
    .line 167
    .line 168
    invoke-virtual {v1}, Ll/l4g0;->l()V

    .line 169
    .line 170
    .line 171
    :cond_6
    return-void
.end method
