.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;

.field public b:Lv/VButton;

.field public c:Landroid/widget/RelativeLayout;

.field public d:Landroid/widget/FrameLayout;

.field public e:Lv/VDraweeView;

.field public f:Landroid/widget/LinearLayout;

.field public g:Lv/VText;

.field public h:Lv/VImage;

.field public i:Lv/VText;

.field public j:Lv/VDraweeView;

.field public k:Landroid/view/View;

.field public l:Lv/VImage;

.field public m:Lcom/p1/mobile/putong/data/User;

.field public n:Z

.field public o:Ll/th0;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->o()V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->i()V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->m(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->j(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->k(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->l(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final g(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/jd70;->a(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public h()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method public final synthetic i()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->o:Ll/th0;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->o:Ll/th0;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->o:Ll/th0;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/th0;->c()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public final synthetic j(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->m:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_5

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->m:Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 12
    .line 13
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_5

    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->m:Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 22
    .line 23
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 24
    .line 25
    const-string v0, "followed"

    .line 26
    .line 27
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_2

    .line 32
    .line 33
    const-string v0, "default"

    .line 34
    .line 35
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_2

    .line 40
    .line 41
    const-string v0, "unfollow"

    .line 42
    .line 43
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_0

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    const-string v0, "matched"

    .line 51
    .line 52
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-nez v0, :cond_1

    .line 57
    .line 58
    const-string v0, "following"

    .line 59
    .line 60
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    if-eqz p1, :cond_5

    .line 65
    .line 66
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->p()V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->m:Lcom/p1/mobile/putong/data/User;

    .line 71
    .line 72
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 73
    .line 74
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->moments:Lcom/p1/mobile/putong/data/Moments;

    .line 75
    .line 76
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/Moments;->hidePublicMoments:Z

    .line 77
    .line 78
    if-eqz p1, :cond_3

    .line 79
    .line 80
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->q:I

    .line 81
    .line 82
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 83
    .line 84
    .line 85
    return-void

    .line 86
    :cond_3
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 87
    .line 88
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->m:Lcom/p1/mobile/putong/data/User;

    .line 97
    .line 98
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->n:Z

    .line 99
    .line 100
    if-eqz p0, :cond_4

    .line 101
    .line 102
    const-string p0, "p_fans"

    .line 103
    .line 104
    goto :goto_1

    .line 105
    :cond_4
    const-string p0, "p_follow_list"

    .line 106
    .line 107
    :goto_1
    const/4 v2, 0x1

    .line 108
    invoke-virtual {p1, v0, v1, v2, p0}, Ll/jka;->m7(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;)Lrx/c;

    .line 109
    .line 110
    .line 111
    :cond_5
    return-void
.end method

.method public final synthetic k(Landroid/view/View;)V
    .locals 4

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->m:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->h()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->h()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->m:Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 20
    .line 21
    const/4 v1, -0x1

    .line 22
    const/4 v2, 0x2

    .line 23
    const-string v3, "fan_list"

    .line 24
    .line 25
    invoke-static {v0, p0, v3, v1, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;->X1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;II)Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public final synthetic l(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->o:Ll/th0;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->m:Lcom/p1/mobile/putong/data/User;

    .line 17
    .line 18
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->n:Z

    .line 19
    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    const-string p0, "p_fans"

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const-string p0, "p_follow_list"

    .line 26
    .line 27
    :goto_0
    const/4 v2, 0x0

    .line 28
    invoke-virtual {p1, v0, v1, v2, p0}, Ll/jka;->m7(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;)Lrx/c;

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final synthetic m(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->o:Ll/th0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/th0;->c()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public n(Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;)V
    .locals 8

    .line 1
    iput-boolean p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->n:Z

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->m:Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->e:Lv/VDraweeView;

    .line 12
    .line 13
    invoke-static {p1}, Ll/m9h;->a(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->j:Lv/VDraweeView;

    .line 21
    .line 22
    const/16 v1, 0x8

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->headFrame:Lcom/p1/mobile/putong/data/HeadFrame;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/data/HeadFrame;->expiredTime:Ljava/util/List;

    .line 34
    .line 35
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    const/4 v3, 0x0

    .line 40
    if-nez v2, :cond_0

    .line 41
    .line 42
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Ljava/lang/Double;

    .line 47
    .line 48
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    .line 49
    .line 50
    .line 51
    move-result-wide v4

    .line 52
    invoke-static {}, Ll/pzi0;->o()J

    .line 53
    .line 54
    .line 55
    move-result-wide v6

    .line 56
    long-to-double v6, v6

    .line 57
    cmpl-double v0, v4, v6

    .line 58
    .line 59
    if-lez v0, :cond_0

    .line 60
    .line 61
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 62
    .line 63
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 64
    .line 65
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->headFrame:Lcom/p1/mobile/putong/data/HeadFrame;

    .line 66
    .line 67
    iget-object v0, v0, Lcom/p1/mobile/putong/data/HeadFrame;->url:Ljava/util/List;

    .line 68
    .line 69
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-nez v0, :cond_0

    .line 74
    .line 75
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->j:Lv/VDraweeView;

    .line 76
    .line 77
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 78
    .line 79
    .line 80
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 81
    .line 82
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->j:Lv/VDraweeView;

    .line 83
    .line 84
    iget-object v4, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 85
    .line 86
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 87
    .line 88
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Extensions;->headFrame:Lcom/p1/mobile/putong/data/HeadFrame;

    .line 89
    .line 90
    iget-object v4, v4, Lcom/p1/mobile/putong/data/HeadFrame;->url:Ljava/util/List;

    .line 91
    .line 92
    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object v4

    .line 96
    check-cast v4, Ljava/lang/String;

    .line 97
    .line 98
    invoke-virtual {v0, v2, v4}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->g:Lv/VText;

    .line 102
    .line 103
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 104
    .line 105
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 106
    .line 107
    .line 108
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 109
    .line 110
    iget-object v0, v0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 111
    .line 112
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->h()Lcom/p1/mobile/android/app/Act;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->h:Lv/VImage;

    .line 117
    .line 118
    invoke-interface {v0, v2, p1, v4}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->showUserVerificationLogo(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Lv/VImage;)V

    .line 119
    .line 120
    .line 121
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    if-eqz v0, :cond_8

    .line 126
    .line 127
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 128
    .line 129
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    if-eqz v0, :cond_8

    .line 134
    .line 135
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->i:Lv/VText;

    .line 136
    .line 137
    if-eqz p2, :cond_1

    .line 138
    .line 139
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 140
    .line 141
    iget-wide v4, p2, Lcom/p1/mobile/putong/data/Followship;->otherUserTime:D

    .line 142
    .line 143
    invoke-static {v4, v5}, Ll/pzi0;->G(D)Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object p2

    .line 147
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 148
    .line 149
    .line 150
    goto :goto_0

    .line 151
    :cond_1
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 152
    .line 153
    iget-wide v4, p2, Lcom/p1/mobile/putong/data/Followship;->userTime:D

    .line 154
    .line 155
    invoke-static {v4, v5}, Ll/pzi0;->G(D)Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object p2

    .line 159
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 160
    .line 161
    .line 162
    :goto_0
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->b:Lv/VButton;

    .line 163
    .line 164
    invoke-static {}, Ll/cmg;->K()Z

    .line 165
    .line 166
    .line 167
    move-result v0

    .line 168
    if-eqz v0, :cond_2

    .line 169
    .line 170
    move v0, v1

    .line 171
    goto :goto_1

    .line 172
    :cond_2
    move v0, v3

    .line 173
    :goto_1
    invoke-virtual {p2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 174
    .line 175
    .line 176
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->l:Lv/VImage;

    .line 177
    .line 178
    invoke-virtual {p2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 179
    .line 180
    .line 181
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 182
    .line 183
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 184
    .line 185
    .line 186
    move-result p2

    .line 187
    if-eqz p2, :cond_8

    .line 188
    .line 189
    invoke-static {}, Ll/cmg;->K()Z

    .line 190
    .line 191
    .line 192
    move-result p2

    .line 193
    if-nez p2, :cond_8

    .line 194
    .line 195
    const-string p2, "following"

    .line 196
    .line 197
    invoke-static {p3, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 198
    .line 199
    .line 200
    move-result p3

    .line 201
    const-string v0, "#ffffff"

    .line 202
    .line 203
    if-eqz p3, :cond_3

    .line 204
    .line 205
    iget-object p3, p1, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 206
    .line 207
    const-string v1, "default"

    .line 208
    .line 209
    invoke-static {p3, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 210
    .line 211
    .line 212
    move-result p3

    .line 213
    if-eqz p3, :cond_3

    .line 214
    .line 215
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->b:Lv/VButton;

    .line 216
    .line 217
    sget p2, Ll/lbc0;->D6:I

    .line 218
    .line 219
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 220
    .line 221
    .line 222
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->b:Lv/VButton;

    .line 223
    .line 224
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 225
    .line 226
    .line 227
    move-result p2

    .line 228
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 229
    .line 230
    .line 231
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->b:Lv/VButton;

    .line 232
    .line 233
    invoke-virtual {p1, v3}, Landroid/view/View;->setSelected(Z)V

    .line 234
    .line 235
    .line 236
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->b:Lv/VButton;

    .line 237
    .line 238
    sget p2, Lcom/p1/mobile/putong/feed/R$string;->Q2:I

    .line 239
    .line 240
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 241
    .line 242
    .line 243
    goto/16 :goto_5

    .line 244
    .line 245
    :cond_3
    iget-object p3, p1, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 246
    .line 247
    const-string v1, "followed"

    .line 248
    .line 249
    invoke-static {p3, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 250
    .line 251
    .line 252
    move-result p3

    .line 253
    if-nez p3, :cond_5

    .line 254
    .line 255
    iget-object p3, p1, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 256
    .line 257
    invoke-static {p3, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 258
    .line 259
    .line 260
    move-result p2

    .line 261
    if-eqz p2, :cond_4

    .line 262
    .line 263
    goto :goto_2

    .line 264
    :cond_4
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 265
    .line 266
    const-string p2, "matched"

    .line 267
    .line 268
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 269
    .line 270
    .line 271
    move-result p1

    .line 272
    if-eqz p1, :cond_8

    .line 273
    .line 274
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->b:Lv/VButton;

    .line 275
    .line 276
    const-string p2, "#61000000"

    .line 277
    .line 278
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 279
    .line 280
    .line 281
    move-result p2

    .line 282
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 283
    .line 284
    .line 285
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->b:Lv/VButton;

    .line 286
    .line 287
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->h()Lcom/p1/mobile/android/app/Act;

    .line 288
    .line 289
    .line 290
    move-result-object p2

    .line 291
    invoke-virtual {p2}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 292
    .line 293
    .line 294
    move-result-object p2

    .line 295
    sget p3, Ll/lbc0;->C6:I

    .line 296
    .line 297
    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 298
    .line 299
    .line 300
    move-result-object p2

    .line 301
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 302
    .line 303
    .line 304
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->b:Lv/VButton;

    .line 305
    .line 306
    sget p2, Lcom/p1/mobile/putong/feed/R$string;->O2:I

    .line 307
    .line 308
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 309
    .line 310
    .line 311
    goto :goto_5

    .line 312
    :cond_5
    :goto_2
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->b:Lv/VButton;

    .line 313
    .line 314
    sget p3, Ll/lbc0;->D6:I

    .line 315
    .line 316
    invoke-virtual {p2, p3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 317
    .line 318
    .line 319
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 320
    .line 321
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 322
    .line 323
    .line 324
    move-result p1

    .line 325
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->b:Lv/VButton;

    .line 326
    .line 327
    if-eqz p1, :cond_6

    .line 328
    .line 329
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 330
    .line 331
    .line 332
    move-result p1

    .line 333
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 334
    .line 335
    .line 336
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->b:Lv/VButton;

    .line 337
    .line 338
    invoke-virtual {p1, v3}, Landroid/view/View;->setSelected(Z)V

    .line 339
    .line 340
    .line 341
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->b:Lv/VButton;

    .line 342
    .line 343
    sget p2, Lcom/p1/mobile/putong/feed/R$string;->Q2:I

    .line 344
    .line 345
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 346
    .line 347
    .line 348
    goto :goto_3

    .line 349
    :cond_6
    const-string p1, "#bfbfbf"

    .line 350
    .line 351
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 352
    .line 353
    .line 354
    move-result p1

    .line 355
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 356
    .line 357
    .line 358
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->b:Lv/VButton;

    .line 359
    .line 360
    const/4 p2, 0x1

    .line 361
    invoke-virtual {p1, p2}, Landroid/view/View;->setSelected(Z)V

    .line 362
    .line 363
    .line 364
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->b:Lv/VButton;

    .line 365
    .line 366
    sget p2, Lcom/p1/mobile/putong/feed/R$string;->P2:I

    .line 367
    .line 368
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 369
    .line 370
    .line 371
    :goto_3
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->n:Z

    .line 372
    .line 373
    if-eqz p1, :cond_7

    .line 374
    .line 375
    const-string p1, "p_fans"

    .line 376
    .line 377
    goto :goto_4

    .line 378
    :cond_7
    const-string p1, "p_follow_list"

    .line 379
    .line 380
    :goto_4
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->m:Lcom/p1/mobile/putong/data/User;

    .line 381
    .line 382
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 383
    .line 384
    const-string p3, "owner_id"

    .line 385
    .line 386
    invoke-static {p3, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 387
    .line 388
    .line 389
    move-result-object p2

    .line 390
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->m:Lcom/p1/mobile/putong/data/User;

    .line 391
    .line 392
    iget-object p3, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 393
    .line 394
    const-string v0, "receiver_user_id"

    .line 395
    .line 396
    invoke-static {v0, p3}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 397
    .line 398
    .line 399
    move-result-object p3

    .line 400
    filled-new-array {p2, p3}, [Ll/pf60;

    .line 401
    .line 402
    .line 403
    move-result-object p2

    .line 404
    const-string p3, "e_follow"

    .line 405
    .line 406
    invoke-static {p3, p1, p2}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 407
    .line 408
    .line 409
    :cond_8
    :goto_5
    new-instance p1, Ll/gd70;

    .line 410
    .line 411
    invoke-direct {p1, p0}, Ll/gd70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;)V

    .line 412
    .line 413
    .line 414
    invoke-virtual {p0, p1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 415
    .line 416
    .line 417
    return-void
.end method

.method public final o()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->g:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ll/bnl0;->y0()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/high16 v1, 0x41800000    # 16.0f

    .line 14
    .line 15
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    sub-int/2addr v0, v2

    .line 20
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->d:Landroid/widget/FrameLayout;

    .line 21
    .line 22
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    sub-int/2addr v0, v2

    .line 27
    const/high16 v2, 0x41200000    # 10.0f

    .line 28
    .line 29
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    sub-int/2addr v0, v3

    .line 34
    const/high16 v3, 0x41900000    # 18.0f

    .line 35
    .line 36
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    sub-int/2addr v0, v3

    .line 41
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    sub-int/2addr v0, v2

    .line 46
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->b:Lv/VButton;

    .line 47
    .line 48
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    sub-int/2addr v0, v2

    .line 53
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    sub-int/2addr v0, v1

    .line 58
    const/high16 v1, 0x3f800000    # 1.0f

    .line 59
    .line 60
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    sub-int/2addr v0, v1

    .line 65
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->g:Lv/VText;

    .line 66
    .line 67
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setMaxWidth(I)V

    .line 68
    .line 69
    .line 70
    :cond_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->g(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->h()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/bd70;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/bd70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;)V

    .line 14
    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    invoke-virtual {v0, v2, v1}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;Ll/x20;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->b:Lv/VButton;

    .line 21
    .line 22
    new-instance v1, Ll/cd70;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/cd70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->c:Landroid/widget/RelativeLayout;

    .line 31
    .line 32
    new-instance v1, Ll/dd70;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Ll/dd70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public p()V
    .locals 3

    .line 1
    new-instance v0, Ll/th0$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->h()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->z:I

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ll/th0$a;->i(I)Ll/th0$a;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->r:I

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Ll/th0$a;->q(I)Ll/th0$a;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    new-instance v2, Ll/ed70;

    .line 23
    .line 24
    invoke-direct {v2, p0}, Ll/ed70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1, v2}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->a:I

    .line 32
    .line 33
    invoke-virtual {v1, v2}, Ll/th0$a;->e(I)Ll/th0$a;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    new-instance v2, Ll/fd70;

    .line 38
    .line 39
    invoke-direct {v2, p0}, Ll/fd70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1, v2}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Ll/th0$a;->a()Ll/th0;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFansView;->o:Ll/th0;

    .line 50
    .line 51
    invoke-virtual {v0}, Ll/th0;->g()V

    .line 52
    .line 53
    .line 54
    return-void
.end method
