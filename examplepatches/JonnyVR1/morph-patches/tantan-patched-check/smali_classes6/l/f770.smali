.class public Ll/f770;
.super Ll/t4;
.source "SourceFile"


# instance fields
.field public A:Lv/VDraweeView;

.field public B:Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;

.field public C:Lcom/tantan/library/svga/SVGAnimationView;

.field public D:Lv/VLinear;

.field public E:Lv/VImage;

.field public F:Landroid/widget/TextView;

.field public G:Lv/VLinear;

.field public H:Lv/VImage;

.field public I:Landroid/widget/TextView;

.field public J:Lv/VText;

.field public K:Lv/VText;

.field public L:Landroid/widget/ImageView;

.field public M:Lv/VText;

.field public N:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public O:Lv/VDraweeView;

.field public P:Lv/VText;

.field public Q:Lv/VImage;

.field public R:Lv/VText;

.field public S:Lv/VLinear;

.field public T:Lv/VText;

.field public U:Lv/VDraweeView;

.field public V:Landroid/widget/ImageView;

.field public W:Landroid/view/View;

.field public X:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/FeedInsertCommentView;

.field public a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

.field public b:Lv/VLinear;

.field public c:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public d:Lv/VDraweeView;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Landroid/widget/LinearLayout;

.field public h:Lv/VLinear;

.field public i:Lv/VText;

.field public j:Lv/VText;

.field public k:Lv/VText;

.field public l:Lv/VText;

.field public m:Lv/VText;

.field public n:Lv/VText;

.field public o:Lv/VLinear;

.field public p:Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;

.field public q:Lv/VText;

.field public r:Lv/VImage;

.field public s:Lv/VText;

.field public t:Landroid/widget/RelativeLayout;

.field public u:Lv/VText;

.field public v:Landroid/widget/ImageView;

.field public w:Landroid/widget/RelativeLayout;

.field public x:Lv/VRelative;

.field public y:Lv/VFrame;

.field public z:Lv/VImage;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/t4;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic O(Ll/f770;Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/f770;->X(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic P(Ll/f770;Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/f770;->Z(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Landroid/view/View;)V
    .locals 5

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    const-string v0, "moment_id"

    .line 6
    .line 7
    invoke-static {v0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ll/er60;->y(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "moment_type"

    .line 22
    .line 23
    invoke-static {v1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    filled-new-array {p1, v0}, [Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    const-string v0, "e_profile_moment_chat_input"

    .line 32
    .line 33
    const-string v1, "p_suggest_user_profile_info_view"

    .line 34
    .line 35
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 51
    .line 52
    iget-object v3, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 53
    .line 54
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 55
    .line 56
    const-string v4, "from_moment"

    .line 57
    .line 58
    invoke-interface {v0, v1, v3, v2, v4}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->k9(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    const/4 p1, 0x0

    .line 70
    invoke-virtual {p0, p1, p1}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public static synthetic R(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Landroid/view/View;)V
    .locals 8

    .line 1
    iget-object p3, p1, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 8
    .line 9
    invoke-static {v1, p2}, Ll/orb0;->m(Lcom/p1/mobile/putong/data/Live;Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {p0, p3, v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->C1(Lcom/p1/mobile/putong/data/Live;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    iget v5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->U:I

    .line 21
    .line 22
    iget-boolean v6, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->R:Z

    .line 23
    .line 24
    iget-object v7, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->T:Ll/n570;

    .line 25
    .line 26
    move-object v4, p1

    .line 27
    move-object v3, p2

    .line 28
    invoke-static/range {v2 .. v7}, Ll/dug;->h(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;IZLl/n570;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public static synthetic S(Ll/f770;Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/f770;->Y(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public A()Lv/VImage;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f770;->z:Lv/VImage;

    .line 2
    .line 3
    return-object p0
.end method

.method public B()Lv/VText;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f770;->m:Lv/VText;

    .line 2
    .line 3
    return-object p0
.end method

.method public C()Lv/VText;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f770;->n:Lv/VText;

    .line 2
    .line 3
    return-object p0
.end method

.method public D()Lv/VText;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f770;->M:Lv/VText;

    .line 2
    .line 3
    return-object p0
.end method

.method public E()Lv/VLinear;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f770;->S:Lv/VLinear;

    .line 2
    .line 3
    return-object p0
.end method

.method public F()Landroid/widget/ImageView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f770;->L:Landroid/widget/ImageView;

    .line 2
    .line 3
    return-object p0
.end method

.method public G()Lv/VText;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f770;->j:Lv/VText;

    .line 2
    .line 3
    return-object p0
.end method

.method public H()Lv/VText;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f770;->i:Lv/VText;

    .line 2
    .line 3
    return-object p0
.end method

.method public I()Lv/VLinear;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f770;->h:Lv/VLinear;

    .line 2
    .line 3
    return-object p0
.end method

.method public J()Lv/VText;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f770;->k:Lv/VText;

    .line 2
    .line 3
    return-object p0
.end method

.method public K()Lv/VImage;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f770;->r:Lv/VImage;

    .line 2
    .line 3
    return-object p0
.end method

.method public L()Lv/VText;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f770;->q:Lv/VText;

    .line 2
    .line 3
    return-object p0
.end method

.method public M()Lv/VLinear;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f770;->o:Lv/VLinear;

    .line 2
    .line 3
    return-object p0
.end method

.method public N(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public final T(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/g770;->a(Ll/f770;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public U(Landroid/view/View;Z)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final V()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/f770;->b:Lv/VLinear;

    .line 2
    .line 3
    const/high16 v1, 0x42200000    # 40.0f

    .line 4
    .line 5
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/high16 v2, 0x41200000    # 10.0f

    .line 10
    .line 11
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    const/high16 v3, 0x40000000    # 2.0f

    .line 16
    .line 17
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    const/4 v4, 0x0

    .line 22
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/view/View;->setPadding(IIII)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/f770;->i:Lv/VText;

    .line 26
    .line 27
    invoke-static {v0, v4}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Ll/f770;->b:Lv/VLinear;

    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    check-cast p0, Landroid/widget/RelativeLayout;

    .line 37
    .line 38
    invoke-static {p0, v4}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public W(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)V
    .locals 7

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "from_profile_album"

    .line 12
    .line 13
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 22
    .line 23
    iget-boolean v2, v1, Lcom/p1/mobile/putong/feed/data/Moment;->isLive:Z

    .line 24
    .line 25
    if-nez v2, :cond_1

    .line 26
    .line 27
    iget-boolean v2, v1, Lcom/p1/mobile/putong/feed/data/Moment;->isVoiceLive:Z

    .line 28
    .line 29
    if-nez v2, :cond_1

    .line 30
    .line 31
    invoke-static {v1}, Ll/ksg;->V(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-nez v1, :cond_1

    .line 36
    .line 37
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-interface {v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-nez v1, :cond_1

    .line 52
    .line 53
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 58
    .line 59
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 60
    .line 61
    invoke-interface {v1, v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Zj(Ljava/lang/String;)Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-static {v1}, Ll/ksg;->U(Lcom/p1/mobile/putong/data/ConversationStatus;)Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    if-eqz v1, :cond_1

    .line 70
    .line 71
    iget-object v1, p0, Ll/f770;->X:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/FeedInsertCommentView;

    .line 72
    .line 73
    if-nez v1, :cond_0

    .line 74
    .line 75
    new-instance v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/FeedInsertCommentView;

    .line 76
    .line 77
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    const/4 v3, 0x0

    .line 82
    invoke-direct {v1, v2, v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/FeedInsertCommentView;-><init>(Landroid/content/Context;Z)V

    .line 83
    .line 84
    .line 85
    iput-object v1, p0, Ll/f770;->X:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/FeedInsertCommentView;

    .line 86
    .line 87
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 88
    .line 89
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/FeedInsertCommentView;->a:Lv/VDraweeView;

    .line 90
    .line 91
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    invoke-interface {v3}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 100
    .line 101
    .line 102
    move-result-object v3

    .line 103
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 104
    .line 105
    invoke-virtual {v2, v1, v3}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    iget-object v1, p0, Ll/f770;->b:Lv/VLinear;

    .line 109
    .line 110
    iget-object v2, p0, Ll/f770;->X:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/FeedInsertCommentView;

    .line 111
    .line 112
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 113
    .line 114
    .line 115
    iget-object v1, p0, Ll/f770;->X:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/FeedInsertCommentView;

    .line 116
    .line 117
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/FeedInsertCommentView;->b:Lv/VText;

    .line 118
    .line 119
    new-instance v2, Ljava/lang/StringBuilder;

    .line 120
    .line 121
    const-string v3, " "

    .line 122
    .line 123
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    sget-object v4, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 127
    .line 128
    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 129
    .line 130
    .line 131
    move-result-object v4

    .line 132
    sget v5, Lcom/p1/mobile/putong/feed/R$string;->Z3:I

    .line 133
    .line 134
    new-instance v6, Ljava/lang/StringBuilder;

    .line 135
    .line 136
    invoke-direct {v6, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 140
    .line 141
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    invoke-virtual {v4, v5, v0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 164
    .line 165
    .line 166
    iget-object v0, p0, Ll/f770;->X:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/FeedInsertCommentView;

    .line 167
    .line 168
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/FeedInsertCommentView;->b:Lv/VText;

    .line 169
    .line 170
    new-instance v1, Ll/a770;

    .line 171
    .line 172
    invoke-direct {v1, p1}, Ll/a770;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)V

    .line 173
    .line 174
    .line 175
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 176
    .line 177
    .line 178
    iget-object v0, p0, Ll/f770;->X:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/FeedInsertCommentView;

    .line 179
    .line 180
    const/high16 v1, 0x41800000    # 16.0f

    .line 181
    .line 182
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 183
    .line 184
    .line 185
    move-result v1

    .line 186
    invoke-static {v0, v1}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 187
    .line 188
    .line 189
    iget-object v0, p0, Ll/f770;->X:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/FeedInsertCommentView;

    .line 190
    .line 191
    const/high16 v1, 0x41400000    # 12.0f

    .line 192
    .line 193
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 194
    .line 195
    .line 196
    move-result v1

    .line 197
    invoke-static {v0, v1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 198
    .line 199
    .line 200
    iget-object v0, p0, Ll/f770;->X:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/FeedInsertCommentView;

    .line 201
    .line 202
    const/high16 v1, 0x41a80000    # 21.0f

    .line 203
    .line 204
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 205
    .line 206
    .line 207
    move-result v1

    .line 208
    invoke-static {v0, v1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 209
    .line 210
    .line 211
    iget-object v0, p0, Ll/f770;->X:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/FeedInsertCommentView;

    .line 212
    .line 213
    const/high16 v1, 0x42380000    # 46.0f

    .line 214
    .line 215
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 216
    .line 217
    .line 218
    move-result v1

    .line 219
    invoke-static {v0, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 220
    .line 221
    .line 222
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->O:Ljava/util/HashMap;

    .line 223
    .line 224
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 225
    .line 226
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 227
    .line 228
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 229
    .line 230
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 231
    .line 232
    .line 233
    iget-object v0, p0, Ll/f770;->X:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/FeedInsertCommentView;

    .line 234
    .line 235
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/FeedInsertCommentView;->d:Lv/VText;

    .line 236
    .line 237
    new-instance v1, Ll/b770;

    .line 238
    .line 239
    invoke-direct {v1, p0, p1}, Ll/b770;-><init>(Ll/f770;Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)V

    .line 240
    .line 241
    .line 242
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 243
    .line 244
    .line 245
    iget-object v0, p0, Ll/f770;->X:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/FeedInsertCommentView;

    .line 246
    .line 247
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/FeedInsertCommentView;->e:Lv/VText;

    .line 248
    .line 249
    new-instance v1, Ll/c770;

    .line 250
    .line 251
    invoke-direct {v1, p0, p1}, Ll/c770;-><init>(Ll/f770;Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)V

    .line 252
    .line 253
    .line 254
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 255
    .line 256
    .line 257
    iget-object v0, p0, Ll/f770;->X:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/FeedInsertCommentView;

    .line 258
    .line 259
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/FeedInsertCommentView;->f:Lv/VText;

    .line 260
    .line 261
    new-instance v1, Ll/d770;

    .line 262
    .line 263
    invoke-direct {v1, p0, p1}, Ll/d770;-><init>(Ll/f770;Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)V

    .line 264
    .line 265
    .line 266
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 267
    .line 268
    .line 269
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 270
    .line 271
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 272
    .line 273
    const-string v0, "moment_id"

    .line 274
    .line 275
    invoke-static {v0, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 276
    .line 277
    .line 278
    move-result-object p0

    .line 279
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 280
    .line 281
    .line 282
    move-result-object v0

    .line 283
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 284
    .line 285
    invoke-virtual {v0, p1}, Ll/er60;->y(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/String;

    .line 286
    .line 287
    .line 288
    move-result-object p1

    .line 289
    const-string v0, "moment_type"

    .line 290
    .line 291
    invoke-static {v0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 292
    .line 293
    .line 294
    move-result-object p1

    .line 295
    filled-new-array {p0, p1}, [Ll/pf60;

    .line 296
    .line 297
    .line 298
    move-result-object p0

    .line 299
    const-string p1, "e_profile_moment_chat_input"

    .line 300
    .line 301
    const-string v0, "p_suggest_user_profile_info_view"

    .line 302
    .line 303
    invoke-static {p1, v0, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 304
    .line 305
    .line 306
    return-void

    .line 307
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->O:Ljava/util/HashMap;

    .line 308
    .line 309
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 310
    .line 311
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 312
    .line 313
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 314
    .line 315
    .line 316
    move-result v0

    .line 317
    if-eqz v0, :cond_3

    .line 318
    .line 319
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->O:Ljava/util/HashMap;

    .line 320
    .line 321
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 322
    .line 323
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 324
    .line 325
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 326
    .line 327
    .line 328
    move-result-object v0

    .line 329
    check-cast v0, Ljava/lang/Boolean;

    .line 330
    .line 331
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 332
    .line 333
    .line 334
    move-result v0

    .line 335
    if-nez v0, :cond_2

    .line 336
    .line 337
    goto :goto_0

    .line 338
    :cond_2
    return-void

    .line 339
    :cond_3
    :goto_0
    iget-object v0, p0, Ll/f770;->b:Lv/VLinear;

    .line 340
    .line 341
    iget-object p0, p0, Ll/f770;->X:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/FeedInsertCommentView;

    .line 342
    .line 343
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 344
    .line 345
    .line 346
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->O:Ljava/util/HashMap;

    .line 347
    .line 348
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 349
    .line 350
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 351
    .line 352
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 353
    .line 354
    invoke-virtual {p0, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 355
    .line 356
    .line 357
    return-void
.end method

.method public final synthetic X(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p2, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    const-string v0, "moment_id"

    .line 6
    .line 7
    invoke-static {v0, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    const-string v0, "moment_chat_send_from"

    .line 12
    .line 13
    const-string v1, "profile_emoji"

    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 24
    .line 25
    invoke-virtual {v1, v2}, Ll/er60;->y(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    const-string v2, "moment_type"

    .line 30
    .line 31
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    filled-new-array {p2, v0, v1}, [Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    const-string v0, "e_profile_moment_chat_send"

    .line 40
    .line 41
    const-string v1, "p_suggest_user_profile_info_view"

    .line 42
    .line 43
    invoke-static {v0, v1, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 44
    .line 45
    .line 46
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iget-object p0, p0, Ll/f770;->X:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/FeedInsertCommentView;

    .line 55
    .line 56
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/FeedInsertCommentView;->d:Lv/VText;

    .line 57
    .line 58
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 67
    .line 68
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 69
    .line 70
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 71
    .line 72
    invoke-interface {p2, v0, p0, v1, p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->hd(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public final synthetic Y(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p2, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    const-string v0, "moment_id"

    .line 6
    .line 7
    invoke-static {v0, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    const-string v0, "moment_chat_send_from"

    .line 12
    .line 13
    const-string v1, "profile_emoji"

    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 24
    .line 25
    invoke-virtual {v1, v2}, Ll/er60;->y(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    const-string v2, "moment_type"

    .line 30
    .line 31
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    filled-new-array {p2, v0, v1}, [Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    const-string v0, "e_profile_moment_chat_send"

    .line 40
    .line 41
    const-string v1, "p_suggest_user_profile_info_view"

    .line 42
    .line 43
    invoke-static {v0, v1, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 44
    .line 45
    .line 46
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iget-object p0, p0, Ll/f770;->X:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/FeedInsertCommentView;

    .line 55
    .line 56
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/FeedInsertCommentView;->e:Lv/VText;

    .line 57
    .line 58
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 67
    .line 68
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 69
    .line 70
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 71
    .line 72
    invoke-interface {p2, v0, p0, v1, p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->hd(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public final synthetic Z(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p2, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    const-string v0, "moment_id"

    .line 6
    .line 7
    invoke-static {v0, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    const-string v0, "moment_chat_send_from"

    .line 12
    .line 13
    const-string v1, "profile_emoji"

    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 24
    .line 25
    invoke-virtual {v1, v2}, Ll/er60;->y(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    const-string v2, "moment_type"

    .line 30
    .line 31
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    filled-new-array {p2, v0, v1}, [Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    const-string v0, "e_profile_moment_chat_send"

    .line 40
    .line 41
    const-string v1, "p_suggest_user_profile_info_view"

    .line 42
    .line 43
    invoke-static {v0, v1, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 44
    .line 45
    .line 46
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iget-object p0, p0, Ll/f770;->X:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/FeedInsertCommentView;

    .line 55
    .line 56
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinprofile/FeedInsertCommentView;->f:Lv/VText;

    .line 57
    .line 58
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 67
    .line 68
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 69
    .line 70
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 71
    .line 72
    invoke-interface {p2, v0, p0, v1, p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->hd(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public bridge synthetic a(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/f770;->d0(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final a0(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)Z
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->A1(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    return p0
.end method

.method public bridge synthetic b(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/f770;->c0(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public b0(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/f770;->T(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic c(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/f770;->b0(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c0(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)Z
    .locals 1

    .line 1
    invoke-static {}, Ll/j4h;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/f770;->g0(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public d()Lcom/tantan/library/svga/SVGAnimationView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f770;->C:Lcom/tantan/library/svga/SVGAnimationView;

    .line 2
    .line 3
    return-object p0
.end method

.method public d0(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)Z
    .locals 4

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    invoke-static {}, Ll/j4h;->d()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x0

    .line 8
    if-eqz v1, :cond_1

    .line 9
    .line 10
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    iget-boolean v1, v0, Lcom/p1/mobile/putong/feed/data/Moment;->isLive:Z

    .line 17
    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ll/f770;->a0(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->c:Landroid/widget/RelativeLayout;

    .line 27
    .line 28
    invoke-virtual {p0, v1, v2}, Ll/f770;->U(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Ll/f770;->V:Landroid/widget/ImageView;

    .line 32
    .line 33
    const/4 v3, 0x1

    .line 34
    invoke-virtual {p0, v1, v3}, Ll/f770;->U(Landroid/view/View;Z)V

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Ll/f770;->V:Landroid/widget/ImageView;

    .line 38
    .line 39
    iput-object v1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->a:Landroid/widget/ImageView;

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    iget-object v1, p0, Ll/f770;->V:Landroid/widget/ImageView;

    .line 43
    .line 44
    invoke-virtual {p0, v1, v2}, Ll/f770;->U(Landroid/view/View;Z)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0}, Ll/f770;->F()Landroid/widget/ImageView;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    iput-object v1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->a:Landroid/widget/ImageView;

    .line 52
    .line 53
    :cond_1
    :goto_0
    iget-boolean v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->isLive:Z

    .line 54
    .line 55
    if-nez v0, :cond_2

    .line 56
    .line 57
    iget-object v0, p0, Ll/f770;->L:Landroid/widget/ImageView;

    .line 58
    .line 59
    iput-object v0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->a:Landroid/widget/ImageView;

    .line 60
    .line 61
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->L0()Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-eqz v0, :cond_3

    .line 66
    .line 67
    invoke-virtual {p0}, Ll/f770;->V()V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0}, Ll/f770;->i0()V

    .line 71
    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_3
    invoke-virtual {p0}, Ll/f770;->h0()V

    .line 75
    .line 76
    .line 77
    :goto_1
    invoke-virtual {p0, p1}, Ll/f770;->W(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0}, Ll/f770;->f0()V

    .line 81
    .line 82
    .line 83
    return v2
.end method

.method public e()Landroidx/constraintlayout/widget/ConstraintLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f770;->N:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public e0(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-boolean p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->isVoiceLive:Z

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->voiceLive:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 12
    .line 13
    iget-wide v0, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->messageCount:D

    .line 14
    .line 15
    double-to-int p0, v0

    .line 16
    invoke-virtual {p2, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->H1(I)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->voiceLive:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 20
    .line 21
    iget-wide p0, p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->rewarderCount:D

    .line 22
    .line 23
    double-to-int p0, p0

    .line 24
    invoke-virtual {p2, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->M1(I)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public f()Lv/VImage;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f770;->Q:Lv/VImage;

    .line 2
    .line 3
    return-object p0
.end method

.method public f0()V
    .locals 3

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/f770;->U:Lv/VDraweeView;

    .line 4
    .line 5
    sget v2, Ll/lbc0;->f2:I

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/f770;->T:Lv/VText;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-virtual {p0, v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public g()Lv/VDraweeView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f770;->O:Lv/VDraweeView;

    .line 2
    .line 3
    return-object p0
.end method

.method public g0(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)V
    .locals 5

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    iget-object v1, p0, Ll/f770;->t:Landroid/widget/RelativeLayout;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-virtual {p0, v1, v2}, Ll/f770;->U(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 10
    .line 11
    iget-boolean v3, v0, Lcom/p1/mobile/putong/feed/data/Moment;->isLive:Z

    .line 12
    .line 13
    const/4 v4, 0x1

    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->d:Lv/VRelative;

    .line 17
    .line 18
    invoke-virtual {p0, v3, v2}, Ll/f770;->U(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->e:Lv/VLinear;

    .line 22
    .line 23
    invoke-virtual {p0, v3, v2}, Ll/f770;->U(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    const-string v3, "from_discover_dating"

    .line 27
    .line 28
    invoke-static {v1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    iget-object v3, p0, Ll/f770;->J:Lv/VText;

    .line 32
    .line 33
    invoke-virtual {p0, v3, v4}, Ll/f770;->U(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    iget-object v3, p0, Ll/f770;->K:Lv/VText;

    .line 37
    .line 38
    invoke-virtual {p0, v3, v2}, Ll/f770;->U(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    iget-object v3, p0, Ll/f770;->w:Landroid/widget/RelativeLayout;

    .line 42
    .line 43
    sget v4, Ll/qa00;->B:I

    .line 44
    .line 45
    invoke-static {v3, v4}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 46
    .line 47
    .line 48
    iget-object v3, p0, Ll/f770;->J:Lv/VText;

    .line 49
    .line 50
    new-instance v4, Ll/e770;

    .line 51
    .line 52
    invoke-direct {v4, p1, v0, v1}, Ll/e770;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v3, v4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 56
    .line 57
    .line 58
    iget-object p1, p0, Ll/f770;->s:Lv/VText;

    .line 59
    .line 60
    invoke-virtual {p0, p1, v2}, Ll/f770;->U(Landroid/view/View;Z)V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_0
    iget-object v1, p0, Ll/f770;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 65
    .line 66
    const/4 v3, 0x0

    .line 67
    invoke-virtual {v1, v3}, Lv/VFrame;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 68
    .line 69
    .line 70
    iget-object v1, p0, Ll/f770;->s:Lv/VText;

    .line 71
    .line 72
    invoke-virtual {p0, v1, v2}, Ll/f770;->U(Landroid/view/View;Z)V

    .line 73
    .line 74
    .line 75
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->d:Lv/VRelative;

    .line 76
    .line 77
    invoke-virtual {p0, v1, v4}, Ll/f770;->U(Landroid/view/View;Z)V

    .line 78
    .line 79
    .line 80
    iget-object v1, p0, Ll/f770;->J:Lv/VText;

    .line 81
    .line 82
    invoke-virtual {p0, v1, v2}, Ll/f770;->U(Landroid/view/View;Z)V

    .line 83
    .line 84
    .line 85
    iget-object v1, p0, Ll/f770;->K:Lv/VText;

    .line 86
    .line 87
    invoke-virtual {p0, v1, v2}, Ll/f770;->U(Landroid/view/View;Z)V

    .line 88
    .line 89
    .line 90
    invoke-static {}, Ll/cmg;->o()Z

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    if-eqz v1, :cond_1

    .line 95
    .line 96
    const-string v1, "from_live_square_tab"

    .line 97
    .line 98
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 99
    .line 100
    invoke-static {v1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    if-nez v1, :cond_1

    .line 105
    .line 106
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->e:Lv/VLinear;

    .line 107
    .line 108
    invoke-virtual {p0, v1, v2}, Ll/f770;->U(Landroid/view/View;Z)V

    .line 109
    .line 110
    .line 111
    iget-object v1, p0, Ll/f770;->G:Lv/VLinear;

    .line 112
    .line 113
    invoke-virtual {p0, v1, v2}, Ll/f770;->U(Landroid/view/View;Z)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {p0}, Ll/f770;->w()Lv/VRelative;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    check-cast v1, Landroid/widget/RelativeLayout$LayoutParams;

    .line 125
    .line 126
    const/16 v2, 0xb

    .line 127
    .line 128
    const/4 v3, -0x1

    .line 129
    invoke-virtual {v1, v2, v3}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 130
    .line 131
    .line 132
    const/high16 v2, 0x41400000    # 12.0f

    .line 133
    .line 134
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 135
    .line 136
    .line 137
    move-result v2

    .line 138
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginEnd(I)V

    .line 139
    .line 140
    .line 141
    goto :goto_0

    .line 142
    :cond_1
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->e:Lv/VLinear;

    .line 143
    .line 144
    invoke-virtual {p0, v1, v4}, Ll/f770;->U(Landroid/view/View;Z)V

    .line 145
    .line 146
    .line 147
    :goto_0
    invoke-virtual {p0, v0, p1}, Ll/f770;->e0(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)V

    .line 148
    .line 149
    .line 150
    return-void
.end method

.method public h()Lv/VText;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f770;->P:Lv/VText;

    .line 2
    .line 3
    return-object p0
.end method

.method public final h0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/f770;->W:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 8
    .line 9
    const/high16 v1, 0x429c0000    # 78.0f

    .line 10
    .line 11
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 16
    .line 17
    const/high16 v1, 0x41800000    # 16.0f

    .line 18
    .line 19
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 24
    .line 25
    const/high16 v1, 0x3f000000    # 0.5f

    .line 26
    .line 27
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 32
    .line 33
    iget-object v1, p0, Ll/f770;->W:Landroid/view/View;

    .line 34
    .line 35
    const-string v2, "#f2f2f2"

    .line 36
    .line 37
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Ll/f770;->W:Landroid/view/View;

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public i()Lv/VText;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f770;->R:Lv/VText;

    .line 2
    .line 3
    return-object p0
.end method

.method public final i0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/f770;->W:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 8
    .line 9
    const/high16 v1, 0x3f000000    # 0.5f

    .line 10
    .line 11
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 16
    .line 17
    iget-object v1, p0, Ll/f770;->W:Landroid/view/View;

    .line 18
    .line 19
    const-string v2, "#f2f2f2"

    .line 20
    .line 21
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Ll/f770;->W:Landroid/view/View;

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public j()Lv/VLinear;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f770;->D:Lv/VLinear;

    .line 2
    .line 3
    return-object p0
.end method

.method public k()Landroid/widget/TextView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f770;->F:Landroid/widget/TextView;

    .line 2
    .line 3
    return-object p0
.end method

.method public l()Lv/VLinear;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f770;->b:Lv/VLinear;

    .line 2
    .line 3
    return-object p0
.end method

.method public m()Lv/VText;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f770;->l:Lv/VText;

    .line 2
    .line 3
    return-object p0
.end method

.method public n()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f770;->W:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public o()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f770;->J:Lv/VText;

    .line 2
    .line 3
    return-object p0
.end method

.method public p()Landroid/widget/LinearLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f770;->g:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public q()Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f770;->p:Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;

    .line 2
    .line 3
    return-object p0
.end method

.method public r()Lv/VDraweeView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f770;->d:Lv/VDraweeView;

    .line 2
    .line 3
    return-object p0
.end method

.method public s()Lv/VText;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f770;->f:Lv/VText;

    .line 2
    .line 3
    return-object p0
.end method

.method public t()Lv/VText;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f770;->e:Lv/VText;

    .line 2
    .line 3
    return-object p0
.end method

.method public u()Landroidx/constraintlayout/widget/ConstraintLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f770;->c:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public v()Landroid/widget/RelativeLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f770;->w:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public w()Lv/VRelative;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f770;->x:Lv/VRelative;

    .line 2
    .line 3
    return-object p0
.end method

.method public x()Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f770;->B:Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;

    .line 2
    .line 3
    return-object p0
.end method

.method public y()Lv/VDraweeView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f770;->A:Lv/VDraweeView;

    .line 2
    .line 3
    return-object p0
.end method

.method public z()Lv/VFrame;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f770;->y:Lv/VFrame;

    .line 2
    .line 3
    return-object p0
.end method
