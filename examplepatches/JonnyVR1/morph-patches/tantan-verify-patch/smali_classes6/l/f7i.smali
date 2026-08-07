.class public Ll/f7i;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/dj70;

.field public b:Landroid/view/View;

.field public c:Landroid/widget/TextView;

.field public d:Lcom/p1/mobile/putong/feed/data/Moment;

.field public e:Lcom/tantan/library/svga/SVGAnimationView;

.field public f:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(ZLcom/p1/mobile/putong/data/Followship;)V
    .locals 0

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->M0:I

    .line 4
    .line 5
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static synthetic b(Ll/dj70;Landroid/view/View;Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 4
    .line 5
    const/16 p0, 0x8

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Landroid/view/View;->setVisibility(I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic c(Ll/f7i;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/f7i;->n(Ljava/lang/String;Z)V

    return-void
.end method

.method public static synthetic d(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic e(Ll/f7i;Ll/dj70;Landroid/view/View;Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/f7i;->o(Ll/dj70;Landroid/view/View;Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;Lcom/p1/mobile/putong/data/Relationship;)V

    return-void
.end method

.method public static synthetic f(Ll/f7i;Landroid/widget/TextView;Ll/dj70;Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;Ljava/lang/String;Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p7}, Ll/f7i;->p(Landroid/widget/TextView;Ll/dj70;Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;Ljava/lang/String;Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic g(Ll/f7i;Lcom/p1/mobile/putong/data/FollowshipStatus;Ll/dj70;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/f7i;->q(Lcom/p1/mobile/putong/data/FollowshipStatus;Ll/dj70;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic h(Landroid/view/View;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic i(ZLcom/p1/mobile/putong/data/Followship;)V
    .locals 0

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->b3:I

    .line 4
    .line 5
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static synthetic j(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static k(Lcom/p1/mobile/putong/data/User;Z)I
    .locals 1

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, -0x1

    .line 4
    return p0

    .line 5
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 6
    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_2

    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 16
    .line 17
    const-string v0, "liked"

    .line 18
    .line 19
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 28
    .line 29
    const-string p1, "matched"

    .line 30
    .line 31
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_2

    .line 36
    .line 37
    :cond_1
    const/4 p0, 0x5

    .line 38
    return p0

    .line 39
    :cond_2
    const/4 p0, 0x4

    .line 40
    return p0
.end method

.method public static l(Lcom/p1/mobile/putong/data/User;Z)I
    .locals 5

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    goto/16 :goto_0

    .line 4
    .line 5
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x3

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {p0}, Ll/kyi;->a(Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-eqz p0, :cond_7

    .line 19
    .line 20
    if-nez p1, :cond_7

    .line 21
    .line 22
    return v1

    .line 23
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    const-string v2, "matched"

    .line 30
    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 36
    .line 37
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    iget-object v0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {v0}, Ll/kyi;->a(Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_2

    .line 50
    .line 51
    if-nez p1, :cond_2

    .line 52
    .line 53
    return v1

    .line 54
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 55
    .line 56
    const/4 v0, 0x0

    .line 57
    if-eqz p1, :cond_8

    .line 58
    .line 59
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 60
    .line 61
    if-nez p1, :cond_3

    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_3
    const-string v3, "following"

    .line 65
    .line 66
    invoke-static {p1, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    const/4 v3, 0x2

    .line 71
    if-eqz p1, :cond_4

    .line 72
    .line 73
    return v3

    .line 74
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 75
    .line 76
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 77
    .line 78
    const-string v4, "default"

    .line 79
    .line 80
    invoke-static {p1, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    if-nez p1, :cond_8

    .line 85
    .line 86
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 87
    .line 88
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 89
    .line 90
    const-string v4, "followed"

    .line 91
    .line 92
    invoke-static {p1, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 93
    .line 94
    .line 95
    move-result p1

    .line 96
    if-nez p1, :cond_8

    .line 97
    .line 98
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 99
    .line 100
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 101
    .line 102
    const-string v4, "unfollow"

    .line 103
    .line 104
    invoke-static {p1, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 105
    .line 106
    .line 107
    move-result p1

    .line 108
    if-nez p1, :cond_8

    .line 109
    .line 110
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 111
    .line 112
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 113
    .line 114
    const-string v4, "unknown_"

    .line 115
    .line 116
    invoke-static {p1, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 117
    .line 118
    .line 119
    move-result p1

    .line 120
    if-eqz p1, :cond_5

    .line 121
    .line 122
    goto :goto_1

    .line 123
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 124
    .line 125
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 126
    .line 127
    invoke-static {p1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 128
    .line 129
    .line 130
    move-result p1

    .line 131
    if-eqz p1, :cond_7

    .line 132
    .line 133
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 134
    .line 135
    invoke-static {p0}, Ll/kyi;->a(Ljava/lang/String;)Z

    .line 136
    .line 137
    .line 138
    move-result p0

    .line 139
    if-eqz p0, :cond_6

    .line 140
    .line 141
    return v1

    .line 142
    :cond_6
    return v3

    .line 143
    :cond_7
    :goto_0
    const/4 p0, -0x1

    .line 144
    return p0

    .line 145
    :cond_8
    :goto_1
    return v0
.end method


# virtual methods
.method public final m(Ljava/lang/String;)Z
    .locals 0

    .line 1
    const-string p0, "topic_latest"

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final synthetic n(Ljava/lang/String;Z)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget-object p0, p0, Ll/f7i;->a:Ll/dj70;

    .line 12
    .line 13
    iget-object p0, p0, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-virtual {v0, v1, p0, v2, p1}, Ll/jka;->m7(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    new-instance p1, Ll/d7i;

    .line 21
    .line 22
    invoke-direct {p1, p2}, Ll/d7i;-><init>(Z)V

    .line 23
    .line 24
    .line 25
    new-instance p2, Ll/e7i;

    .line 26
    .line 27
    invoke-direct {p2}, Ll/e7i;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-static {p1, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final synthetic o(Ll/dj70;Landroid/view/View;Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 2

    .line 1
    iget-boolean p4, p1, Ll/dj70;->c:Z

    .line 2
    .line 3
    const-string v0, "from_discover_dating"

    .line 4
    .line 5
    if-nez p4, :cond_0

    .line 6
    .line 7
    iget-object p4, p1, Ll/dj70;->b:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p4, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p4

    .line 13
    if-eqz p4, :cond_0

    .line 14
    .line 15
    sget-object p4, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->I0:Lrx/subjects/b;

    .line 16
    .line 17
    sget-object v1, Ll/uxj0;->a:Ll/uxj0;

    .line 18
    .line 19
    invoke-virtual {p4, v1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-boolean p4, p1, Ll/dj70;->c:Z

    .line 23
    .line 24
    if-nez p4, :cond_2

    .line 25
    .line 26
    iget-object p4, p1, Ll/dj70;->b:Ljava/lang/String;

    .line 27
    .line 28
    invoke-static {p4, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result p4

    .line 32
    if-nez p4, :cond_1

    .line 33
    .line 34
    iget-object p4, p1, Ll/dj70;->b:Ljava/lang/String;

    .line 35
    .line 36
    const-string v0, "from_like"

    .line 37
    .line 38
    invoke-static {p4, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result p4

    .line 42
    if-eqz p4, :cond_2

    .line 43
    .line 44
    :cond_1
    invoke-virtual {p0, p1, p2, p3}, Ll/f7i;->v(Ll/dj70;Landroid/view/View;Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;)V

    .line 45
    .line 46
    .line 47
    :cond_2
    return-void
.end method

.method public final synthetic p(Landroid/widget/TextView;Ll/dj70;Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;Ljava/lang/String;Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;Landroid/view/View;)V
    .locals 23

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    move-object/from16 v2, p3

    .line 6
    .line 7
    move-object/from16 v5, p4

    .line 8
    .line 9
    invoke-virtual/range {p1 .. p1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    const-string v4, "\u6253\u62db\u547c"

    .line 18
    .line 19
    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    const/4 v10, 0x1

    .line 24
    const/4 v4, 0x0

    .line 25
    if-nez v3, :cond_3

    .line 26
    .line 27
    invoke-virtual/range {p1 .. p1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    const-string v6, "\u804a\u5929"

    .line 36
    .line 37
    invoke-static {v3, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    if-eqz v3, :cond_0

    .line 42
    .line 43
    goto/16 :goto_0

    .line 44
    .line 45
    :cond_0
    invoke-virtual/range {p1 .. p1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    const-string v6, "\u8d85\u7ea7\u559c\u6b22"

    .line 54
    .line 55
    invoke-static {v3, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    const-string v11, "moment"

    .line 60
    .line 61
    const-string v6, "moments_user_id"

    .line 62
    .line 63
    if-eqz v3, :cond_1

    .line 64
    .line 65
    iget-object v0, v1, Ll/dj70;->b:Ljava/lang/String;

    .line 66
    .line 67
    invoke-static {v0, v4}, Ll/ksg;->K(Ljava/lang/String;Z)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    iget-object v3, v1, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 72
    .line 73
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 74
    .line 75
    invoke-static {v6, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 76
    .line 77
    .line 78
    move-result-object v3

    .line 79
    iget-object v4, v1, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 80
    .line 81
    iget-object v4, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 82
    .line 83
    const-string v6, "is_privileged"

    .line 84
    .line 85
    invoke-static {v6, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 86
    .line 87
    .line 88
    move-result-object v4

    .line 89
    const-string v6, "showfrom_superlike"

    .line 90
    .line 91
    iget-object v7, v1, Ll/dj70;->b:Ljava/lang/String;

    .line 92
    .line 93
    invoke-static {v6, v7}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 94
    .line 95
    .line 96
    move-result-object v6

    .line 97
    filled-new-array {v3, v4, v6}, [Ll/pf60;

    .line 98
    .line 99
    .line 100
    move-result-object v3

    .line 101
    const-string v4, "e_superlikeButton"

    .line 102
    .line 103
    invoke-static {v4, v0, v3}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 104
    .line 105
    .line 106
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 107
    .line 108
    .line 109
    move-result-object v12

    .line 110
    iget-object v13, v1, Ll/dj70;->g:Lcom/p1/mobile/android/app/Act;

    .line 111
    .line 112
    iget-object v14, v1, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 113
    .line 114
    iget-boolean v0, v1, Ll/dj70;->e:Z

    .line 115
    .line 116
    xor-int/lit8 v16, v0, 0x1

    .line 117
    .line 118
    invoke-static {v11}, Lcom/p1/mobile/putong/data/LikeFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LikeFrom;

    .line 119
    .line 120
    .line 121
    move-result-object v18

    .line 122
    iget-object v0, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 123
    .line 124
    iget-object v2, v1, Ll/dj70;->l:Ll/fj70;

    .line 125
    .line 126
    invoke-virtual {v2}, Ll/fj70;->c()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v2

    .line 130
    invoke-static {v2}, Ll/ksg;->N(Ljava/lang/String;)Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v20

    .line 134
    new-instance v2, Ll/x6i;

    .line 135
    .line 136
    invoke-direct {v2, v1, v5}, Ll/x6i;-><init>(Ll/dj70;Landroid/view/View;)V

    .line 137
    .line 138
    .line 139
    const/16 v22, 0x0

    .line 140
    .line 141
    const/4 v15, 0x1

    .line 142
    const/16 v17, 0x0

    .line 143
    .line 144
    move-object/from16 v19, v0

    .line 145
    .line 146
    move-object/from16 v21, v2

    .line 147
    .line 148
    invoke-interface/range {v12 .. v22}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->v8(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZLjava/lang/String;Lcom/p1/mobile/putong/data/LikeFrom;Ljava/lang/String;Ljava/lang/String;Ll/y20;Ll/y20;)V

    .line 149
    .line 150
    .line 151
    return-void

    .line 152
    :cond_1
    iget-object v3, v1, Ll/dj70;->l:Ll/fj70;

    .line 153
    .line 154
    invoke-virtual {v3}, Ll/fj70;->c()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object v3

    .line 158
    iget-object v4, v1, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 159
    .line 160
    iget-object v4, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 161
    .line 162
    invoke-static {v6, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 163
    .line 164
    .line 165
    move-result-object v4

    .line 166
    const-string v6, "moment_id"

    .line 167
    .line 168
    iget-object v7, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 169
    .line 170
    invoke-static {v6, v7}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 171
    .line 172
    .line 173
    move-result-object v6

    .line 174
    filled-new-array {v4, v6}, [Ll/pf60;

    .line 175
    .line 176
    .line 177
    move-result-object v4

    .line 178
    const-string v6, "e_likeButton"

    .line 179
    .line 180
    invoke-static {v6, v3, v4}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 181
    .line 182
    .line 183
    invoke-static/range {p5 .. p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 184
    .line 185
    .line 186
    move-result v3

    .line 187
    if-eqz v3, :cond_2

    .line 188
    .line 189
    iget-object v3, v1, Ll/dj70;->g:Lcom/p1/mobile/android/app/Act;

    .line 190
    .line 191
    const/high16 v4, 0x41200000    # 10.0f

    .line 192
    .line 193
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 194
    .line 195
    .line 196
    move-result v4

    .line 197
    neg-int v4, v4

    .line 198
    int-to-float v7, v4

    .line 199
    const/high16 v8, 0x42400000    # 48.0f

    .line 200
    .line 201
    const/high16 v9, 0x42400000    # 48.0f

    .line 202
    .line 203
    const/4 v6, 0x0

    .line 204
    move-object/from16 v4, p6

    .line 205
    .line 206
    invoke-static/range {v3 .. v9}, Ll/qyh;->a(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;Landroid/view/View;FFFF)Lcom/tantan/library/svga/SVGAnimationView;

    .line 207
    .line 208
    .line 209
    move-result-object v3

    .line 210
    iput-object v3, v0, Ll/f7i;->e:Lcom/tantan/library/svga/SVGAnimationView;

    .line 211
    .line 212
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 213
    .line 214
    .line 215
    move-result-object v12

    .line 216
    iget-object v13, v1, Ll/dj70;->g:Lcom/p1/mobile/android/app/Act;

    .line 217
    .line 218
    iget-object v14, v1, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 219
    .line 220
    iget-boolean v3, v1, Ll/dj70;->e:Z

    .line 221
    .line 222
    xor-int/lit8 v15, v3, 0x1

    .line 223
    .line 224
    invoke-static {v11}, Lcom/p1/mobile/putong/data/LikeFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LikeFrom;

    .line 225
    .line 226
    .line 227
    move-result-object v17

    .line 228
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 229
    .line 230
    new-instance v3, Ll/y6i;

    .line 231
    .line 232
    invoke-direct {v3, v0, v1, v5, v4}, Ll/y6i;-><init>(Ll/f7i;Ll/dj70;Landroid/view/View;Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;)V

    .line 233
    .line 234
    .line 235
    new-instance v0, Ll/z6i;

    .line 236
    .line 237
    invoke-direct {v0, v5}, Ll/z6i;-><init>(Landroid/view/View;)V

    .line 238
    .line 239
    .line 240
    const/16 v16, 0x0

    .line 241
    .line 242
    move-object/from16 v20, v0

    .line 243
    .line 244
    move-object/from16 v18, v2

    .line 245
    .line 246
    move-object/from16 v19, v3

    .line 247
    .line 248
    invoke-interface/range {v12 .. v20}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->kn(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;Lcom/p1/mobile/putong/data/LikeFrom;Ljava/lang/String;Ll/y20;Ll/y20;)V

    .line 249
    .line 250
    .line 251
    return-void

    .line 252
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 253
    .line 254
    .line 255
    move-result-object v0

    .line 256
    iget-object v2, v1, Ll/dj70;->g:Lcom/p1/mobile/android/app/Act;

    .line 257
    .line 258
    iget-object v3, v1, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 259
    .line 260
    const-string v4, "greet"

    .line 261
    .line 262
    invoke-static {v4}, Lcom/p1/mobile/putong/data/LikeFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LikeFrom;

    .line 263
    .line 264
    .line 265
    move-result-object v4

    .line 266
    iget-object v1, v1, Ll/dj70;->l:Ll/fj70;

    .line 267
    .line 268
    invoke-virtual {v1}, Ll/fj70;->c()Ljava/lang/String;

    .line 269
    .line 270
    .line 271
    move-result-object v1

    .line 272
    const/4 v5, 0x1

    .line 273
    const/4 v6, 0x0

    .line 274
    const/4 v7, 0x1

    .line 275
    move-object/from16 p0, v0

    .line 276
    .line 277
    move-object/from16 p7, v1

    .line 278
    .line 279
    move-object/from16 p1, v2

    .line 280
    .line 281
    move-object/from16 p2, v3

    .line 282
    .line 283
    move-object/from16 p4, v4

    .line 284
    .line 285
    move/from16 p3, v5

    .line 286
    .line 287
    move-object/from16 p5, v6

    .line 288
    .line 289
    move/from16 p6, v7

    .line 290
    .line 291
    invoke-interface/range {p0 .. p7}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Rs(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLcom/p1/mobile/putong/data/LikeFrom;Ljava/lang/String;ZLjava/lang/String;)V

    .line 292
    .line 293
    .line 294
    return-void

    .line 295
    :cond_3
    :goto_0
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 296
    .line 297
    .line 298
    move-result-object v0

    .line 299
    iget-object v2, v1, Ll/dj70;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 300
    .line 301
    iget-object v3, v1, Ll/dj70;->b:Ljava/lang/String;

    .line 302
    .line 303
    invoke-static {v3, v4}, Ll/ksg;->K(Ljava/lang/String;Z)Ljava/lang/String;

    .line 304
    .line 305
    .line 306
    move-result-object v3

    .line 307
    invoke-virtual {v0, v2, v3, v10, v4}, Ll/er60;->s(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ZZ)V

    .line 308
    .line 309
    .line 310
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 311
    .line 312
    iget-object v2, v1, Ll/dj70;->g:Lcom/p1/mobile/android/app/Act;

    .line 313
    .line 314
    iget-object v3, v1, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 315
    .line 316
    iget-object v5, v1, Ll/dj70;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 317
    .line 318
    iget-object v1, v1, Ll/dj70;->b:Ljava/lang/String;

    .line 319
    .line 320
    invoke-static {v1, v4}, Ll/ksg;->K(Ljava/lang/String;Z)Ljava/lang/String;

    .line 321
    .line 322
    .line 323
    move-result-object v1

    .line 324
    const/4 v4, 0x0

    .line 325
    move-object/from16 p0, v0

    .line 326
    .line 327
    move-object/from16 p4, v1

    .line 328
    .line 329
    move-object/from16 p1, v2

    .line 330
    .line 331
    move-object/from16 p2, v3

    .line 332
    .line 333
    move/from16 p5, v4

    .line 334
    .line 335
    move-object/from16 p3, v5

    .line 336
    .line 337
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/feed/api/b;->f3(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Z)V

    .line 338
    .line 339
    .line 340
    return-void
.end method

.method public final synthetic q(Lcom/p1/mobile/putong/data/FollowshipStatus;Ll/dj70;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-boolean p2, p2, Ll/dj70;->c:Z

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/f7i;->r(Lcom/p1/mobile/putong/data/FollowshipStatus;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final r(Lcom/p1/mobile/putong/data/FollowshipStatus;Z)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/f7i;->a:Ll/dj70;

    .line 2
    .line 3
    iget-object v0, v0, Ll/dj70;->q:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/f7i;->a:Ll/dj70;

    .line 12
    .line 13
    iget-object v0, v0, Ll/dj70;->q:Ljava/lang/String;

    .line 14
    .line 15
    const-string v1, "trigger_time"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    filled-new-array {v0}, [Ll/tfj0$a;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "e_follow_behind_guide"

    .line 26
    .line 27
    const-string v2, "p_user_moment_interactions_details_view"

    .line 28
    .line 29
    invoke-static {v1, v2, v0}, Ll/tfj0;->f(Ljava/lang/String;Ljava/lang/String;[Ll/tfj0$a;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    const-string v0, "following"

    .line 39
    .line 40
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-nez v0, :cond_1

    .line 45
    .line 46
    const-string v0, "matched"

    .line 47
    .line 48
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-eqz p1, :cond_2

    .line 53
    .line 54
    :cond_1
    const/4 p1, 0x0

    .line 55
    invoke-virtual {p0, p1}, Ll/f7i;->t(Z)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    iget-object v0, p0, Ll/f7i;->a:Ll/dj70;

    .line 60
    .line 61
    iget-object v0, v0, Ll/dj70;->g:Lcom/p1/mobile/android/app/Act;

    .line 62
    .line 63
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->z:I

    .line 68
    .line 69
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    new-instance v2, Ll/a7i;

    .line 74
    .line 75
    invoke-direct {v2, p0, p1, p2}, Ll/a7i;-><init>(Ll/f7i;Ljava/lang/String;Z)V

    .line 76
    .line 77
    .line 78
    invoke-static {v0, v1, v2}, Ll/k3h;->v0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;)V

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :cond_2
    const/4 p1, 0x1

    .line 83
    invoke-virtual {p0, p1}, Ll/f7i;->t(Z)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v6

    .line 87
    iget-object p1, p0, Ll/f7i;->a:Ll/dj70;

    .line 88
    .line 89
    iget-object p1, p1, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 90
    .line 91
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 92
    .line 93
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->moments:Lcom/p1/mobile/putong/data/Moments;

    .line 94
    .line 95
    iget-boolean v0, v0, Lcom/p1/mobile/putong/data/Moments;->hidePublicMoments:Z

    .line 96
    .line 97
    if-eqz v0, :cond_3

    .line 98
    .line 99
    invoke-static {p1}, Lcom/p1/mobile/putong/data/User;->isMatched(Lcom/p1/mobile/putong/data/User;)Z

    .line 100
    .line 101
    .line 102
    move-result p1

    .line 103
    if-nez p1, :cond_3

    .line 104
    .line 105
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->q:I

    .line 106
    .line 107
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 108
    .line 109
    .line 110
    return-void

    .line 111
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 112
    .line 113
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    iget-object p1, p0, Ll/f7i;->a:Ll/dj70;

    .line 122
    .line 123
    iget-object v2, p1, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 124
    .line 125
    iget-object p0, p0, Ll/f7i;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 126
    .line 127
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 128
    .line 129
    iget-object v5, p0, Lcom/p1/mobile/putong/data/Live;->id:Ljava/lang/String;

    .line 130
    .line 131
    const/4 v3, 0x1

    .line 132
    const-string v4, "liveMomentNearby"

    .line 133
    .line 134
    invoke-virtual/range {v0 .. v6}, Ll/jka;->n7(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    new-instance p1, Ll/b7i;

    .line 139
    .line 140
    invoke-direct {p1, p2}, Ll/b7i;-><init>(Z)V

    .line 141
    .line 142
    .line 143
    new-instance p2, Ll/c7i;

    .line 144
    .line 145
    invoke-direct {p2}, Ll/c7i;-><init>()V

    .line 146
    .line 147
    .line 148
    invoke-static {p1, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 153
    .line 154
    .line 155
    return-void
.end method

.method public s(Ll/dj70;Landroid/view/View;Landroid/widget/TextView;Ljava/lang/String;Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;)V
    .locals 10

    .line 1
    iput-object p1, p0, Ll/f7i;->a:Ll/dj70;

    .line 2
    .line 3
    iput-object p2, p0, Ll/f7i;->b:Landroid/view/View;

    .line 4
    .line 5
    iput-object p3, p0, Ll/f7i;->c:Landroid/widget/TextView;

    .line 6
    .line 7
    iget-object v4, p1, Ll/dj70;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 8
    .line 9
    iget-object v0, p0, Ll/f7i;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    if-eqz v4, :cond_0

    .line 15
    .line 16
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v2, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_1

    .line 25
    .line 26
    :cond_0
    iput-boolean v1, p0, Ll/f7i;->f:Z

    .line 27
    .line 28
    :cond_1
    iput-object v4, p0, Ll/f7i;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 29
    .line 30
    invoke-static {v4}, Ll/at0;->d(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    const/16 v2, 0x8

    .line 35
    .line 36
    if-nez v0, :cond_2

    .line 37
    .line 38
    iget-object v0, p1, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-nez v0, :cond_2

    .line 45
    .line 46
    iget-object v0, p1, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 47
    .line 48
    invoke-static {v0}, Lcom/p1/mobile/putong/data/User;->isMatched(Lcom/p1/mobile/putong/data/User;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_3

    .line 53
    .line 54
    invoke-static {}, Ll/cmg;->o()Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-nez v0, :cond_3

    .line 59
    .line 60
    :cond_2
    move-object v5, p2

    .line 61
    goto/16 :goto_9

    .line 62
    .line 63
    :cond_3
    invoke-static {}, Ll/cmg;->K()Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    const/4 v3, 0x1

    .line 68
    const-string v5, "from_live_square_tab"

    .line 69
    .line 70
    if-nez v0, :cond_e

    .line 71
    .line 72
    invoke-static {}, Ll/cmg;->Y()Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-eqz v0, :cond_4

    .line 77
    .line 78
    iget-object v0, v4, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 79
    .line 80
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 81
    .line 82
    .line 83
    move-result-object v6

    .line 84
    invoke-interface {v6}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v6

    .line 88
    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-nez v0, :cond_4

    .line 93
    .line 94
    iget-object v0, p1, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 95
    .line 96
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    if-eqz v0, :cond_e

    .line 101
    .line 102
    :cond_4
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    if-eqz v0, :cond_e

    .line 107
    .line 108
    iget-object v0, p1, Ll/dj70;->b:Ljava/lang/String;

    .line 109
    .line 110
    invoke-static {v0, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    if-eqz v0, :cond_5

    .line 115
    .line 116
    iget-boolean v0, p1, Ll/dj70;->c:Z

    .line 117
    .line 118
    if-nez v0, :cond_5

    .line 119
    .line 120
    goto/16 :goto_3

    .line 121
    .line 122
    :cond_5
    invoke-static {}, Ll/gj70;->a()Ll/gj70;

    .line 123
    .line 124
    .line 125
    move-result-object p4

    .line 126
    invoke-virtual {p4}, Ll/gj70;->b()Ljava/util/Map;

    .line 127
    .line 128
    .line 129
    move-result-object p4

    .line 130
    iget-object p5, p1, Ll/dj70;->b:Ljava/lang/String;

    .line 131
    .line 132
    invoke-interface {p4, p5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    move-result-object p4

    .line 136
    check-cast p4, Ll/gj70$a;

    .line 137
    .line 138
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    move-result p5

    .line 142
    const/4 v0, 0x0

    .line 143
    if-eqz p5, :cond_6

    .line 144
    .line 145
    iget-boolean p4, p4, Ll/gj70$a;->a:Z

    .line 146
    .line 147
    if-eqz p4, :cond_6

    .line 148
    .line 149
    iget-object p4, p1, Ll/dj70;->b:Ljava/lang/String;

    .line 150
    .line 151
    invoke-virtual {p0, p4}, Ll/f7i;->m(Ljava/lang/String;)Z

    .line 152
    .line 153
    .line 154
    move-result p4

    .line 155
    if-eqz p4, :cond_7

    .line 156
    .line 157
    :cond_6
    iget-boolean p4, p1, Ll/dj70;->c:Z

    .line 158
    .line 159
    if-eqz p4, :cond_d

    .line 160
    .line 161
    :cond_7
    iget-object p4, v4, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 162
    .line 163
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 164
    .line 165
    .line 166
    move-result-object p5

    .line 167
    invoke-interface {p5}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object p5

    .line 171
    invoke-virtual {p4, p5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    move-result p4

    .line 175
    if-nez p4, :cond_c

    .line 176
    .line 177
    iget-object p4, p1, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 178
    .line 179
    iget-object p4, p4, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 180
    .line 181
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 182
    .line 183
    .line 184
    move-result p4

    .line 185
    const-string p5, "matched"

    .line 186
    .line 187
    if-eqz p4, :cond_8

    .line 188
    .line 189
    iget-object p4, p1, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 190
    .line 191
    iget-object p4, p4, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 192
    .line 193
    iget-object p4, p4, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 194
    .line 195
    invoke-static {p4, p5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 196
    .line 197
    .line 198
    move-result p4

    .line 199
    if-eqz p4, :cond_8

    .line 200
    .line 201
    goto/16 :goto_1

    .line 202
    .line 203
    :cond_8
    sget p4, Lcom/p1/mobile/putong/feed/R$string;->Q2:I

    .line 204
    .line 205
    sget v2, Ll/lbc0;->y:I

    .line 206
    .line 207
    iget-object v4, p1, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 208
    .line 209
    iget-object v4, v4, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 210
    .line 211
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 212
    .line 213
    .line 214
    move-result v4

    .line 215
    const-string v5, "#f55a43"

    .line 216
    .line 217
    if-eqz v4, :cond_b

    .line 218
    .line 219
    iget-object v0, p1, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 220
    .line 221
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 222
    .line 223
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 224
    .line 225
    const-string v4, "following"

    .line 226
    .line 227
    invoke-static {v0, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 228
    .line 229
    .line 230
    move-result v4

    .line 231
    if-eqz v4, :cond_9

    .line 232
    .line 233
    invoke-virtual {p2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 234
    .line 235
    .line 236
    iget-object p4, p1, Ll/dj70;->g:Lcom/p1/mobile/android/app/Act;

    .line 237
    .line 238
    invoke-virtual {p4}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 239
    .line 240
    .line 241
    move-result-object p4

    .line 242
    sget p5, Ll/k9c0;->F:I

    .line 243
    .line 244
    invoke-virtual {p4, p5}, Landroid/content/res/Resources;->getColor(I)I

    .line 245
    .line 246
    .line 247
    move-result p4

    .line 248
    invoke-virtual {p3, p4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 249
    .line 250
    .line 251
    sget p4, Lcom/p1/mobile/putong/feed/R$string;->P2:I

    .line 252
    .line 253
    invoke-virtual {p3, p4}, Landroid/widget/TextView;->setText(I)V

    .line 254
    .line 255
    .line 256
    iget-object p4, p1, Ll/dj70;->g:Lcom/p1/mobile/android/app/Act;

    .line 257
    .line 258
    invoke-virtual {p4}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 259
    .line 260
    .line 261
    move-result-object p4

    .line 262
    sget p5, Ll/lbc0;->c:I

    .line 263
    .line 264
    invoke-virtual {p4, p5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 265
    .line 266
    .line 267
    move-result-object p4

    .line 268
    invoke-virtual {p2, p4}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 269
    .line 270
    .line 271
    goto :goto_0

    .line 272
    :cond_9
    invoke-static {v0, p5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 273
    .line 274
    .line 275
    move-result p5

    .line 276
    if-eqz p5, :cond_a

    .line 277
    .line 278
    invoke-virtual {p2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 279
    .line 280
    .line 281
    iget-object p4, p1, Ll/dj70;->g:Lcom/p1/mobile/android/app/Act;

    .line 282
    .line 283
    invoke-virtual {p4}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 284
    .line 285
    .line 286
    move-result-object p4

    .line 287
    sget p5, Ll/k9c0;->F:I

    .line 288
    .line 289
    invoke-virtual {p4, p5}, Landroid/content/res/Resources;->getColor(I)I

    .line 290
    .line 291
    .line 292
    move-result p4

    .line 293
    invoke-virtual {p3, p4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 294
    .line 295
    .line 296
    sget p4, Lcom/p1/mobile/putong/feed/R$string;->N2:I

    .line 297
    .line 298
    invoke-virtual {p3, p4}, Landroid/widget/TextView;->setText(I)V

    .line 299
    .line 300
    .line 301
    iget-object p4, p1, Ll/dj70;->g:Lcom/p1/mobile/android/app/Act;

    .line 302
    .line 303
    invoke-virtual {p4}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 304
    .line 305
    .line 306
    move-result-object p4

    .line 307
    sget p5, Ll/lbc0;->c:I

    .line 308
    .line 309
    invoke-virtual {p4, p5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 310
    .line 311
    .line 312
    move-result-object p4

    .line 313
    invoke-virtual {p2, p4}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 314
    .line 315
    .line 316
    goto :goto_0

    .line 317
    :cond_a
    iget-boolean p5, p1, Ll/dj70;->c:Z

    .line 318
    .line 319
    invoke-virtual {p0, p5}, Ll/f7i;->u(Z)V

    .line 320
    .line 321
    .line 322
    invoke-virtual {p2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 323
    .line 324
    .line 325
    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 326
    .line 327
    .line 328
    move-result p5

    .line 329
    invoke-virtual {p3, p5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 330
    .line 331
    .line 332
    invoke-virtual {p3, p4}, Landroid/widget/TextView;->setText(I)V

    .line 333
    .line 334
    .line 335
    iget-object p4, p1, Ll/dj70;->g:Lcom/p1/mobile/android/app/Act;

    .line 336
    .line 337
    invoke-virtual {p4}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 338
    .line 339
    .line 340
    move-result-object p4

    .line 341
    invoke-virtual {p4, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 342
    .line 343
    .line 344
    move-result-object p4

    .line 345
    invoke-virtual {p2, p4}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 346
    .line 347
    .line 348
    goto :goto_0

    .line 349
    :cond_b
    iget-boolean p5, p1, Ll/dj70;->c:Z

    .line 350
    .line 351
    invoke-virtual {p0, p5}, Ll/f7i;->u(Z)V

    .line 352
    .line 353
    .line 354
    invoke-virtual {p2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 355
    .line 356
    .line 357
    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 358
    .line 359
    .line 360
    move-result p5

    .line 361
    invoke-virtual {p3, p5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 362
    .line 363
    .line 364
    invoke-virtual {p3, p4}, Landroid/widget/TextView;->setText(I)V

    .line 365
    .line 366
    .line 367
    iget-object p4, p1, Ll/dj70;->g:Lcom/p1/mobile/android/app/Act;

    .line 368
    .line 369
    invoke-virtual {p4}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 370
    .line 371
    .line 372
    move-result-object p4

    .line 373
    invoke-virtual {p4, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 374
    .line 375
    .line 376
    move-result-object p4

    .line 377
    invoke-virtual {p2, p4}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 378
    .line 379
    .line 380
    :goto_0
    invoke-virtual {p3}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 381
    .line 382
    .line 383
    move-result-object p3

    .line 384
    invoke-virtual {p3, v3}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 385
    .line 386
    .line 387
    goto :goto_2

    .line 388
    :cond_c
    :goto_1
    invoke-virtual {p2, v2}, Landroid/view/View;->setVisibility(I)V

    .line 389
    .line 390
    .line 391
    goto :goto_2

    .line 392
    :cond_d
    invoke-virtual {p2, v2}, Landroid/view/View;->setVisibility(I)V

    .line 393
    .line 394
    .line 395
    :goto_2
    new-instance p3, Ll/w6i;

    .line 396
    .line 397
    invoke-direct {p3, p0, v0, p1}, Ll/w6i;-><init>(Ll/f7i;Lcom/p1/mobile/putong/data/FollowshipStatus;Ll/dj70;)V

    .line 398
    .line 399
    .line 400
    invoke-virtual {p2, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 401
    .line 402
    .line 403
    return-void

    .line 404
    :cond_e
    :goto_3
    invoke-virtual {p2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 405
    .line 406
    .line 407
    iget-object v0, p1, Ll/dj70;->b:Ljava/lang/String;

    .line 408
    .line 409
    const-string v6, "from_like"

    .line 410
    .line 411
    invoke-static {v0, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 412
    .line 413
    .line 414
    move-result v0

    .line 415
    const/high16 v7, 0x41200000    # 10.0f

    .line 416
    .line 417
    if-eqz v0, :cond_f

    .line 418
    .line 419
    iget-object v0, p1, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 420
    .line 421
    invoke-static {v0}, Ll/hyh;->k(Lcom/p1/mobile/putong/data/User;)Z

    .line 422
    .line 423
    .line 424
    move-result v0

    .line 425
    if-eqz v0, :cond_10

    .line 426
    .line 427
    :cond_f
    iget-object v0, p1, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 428
    .line 429
    invoke-static {v0}, Ll/hyh;->l(Lcom/p1/mobile/putong/data/User;)Z

    .line 430
    .line 431
    .line 432
    move-result v0

    .line 433
    if-eqz v0, :cond_10

    .line 434
    .line 435
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 436
    .line 437
    .line 438
    move-result v0

    .line 439
    if-eqz v0, :cond_10

    .line 440
    .line 441
    invoke-static {}, Ll/cmg;->o()Z

    .line 442
    .line 443
    .line 444
    move-result v0

    .line 445
    if-nez v0, :cond_10

    .line 446
    .line 447
    invoke-virtual {p2, v2}, Landroid/view/View;->setVisibility(I)V

    .line 448
    .line 449
    .line 450
    goto/16 :goto_7

    .line 451
    .line 452
    :cond_10
    invoke-static {}, Ll/cmg;->K()Z

    .line 453
    .line 454
    .line 455
    move-result v0

    .line 456
    const/high16 v8, 0x41400000    # 12.0f

    .line 457
    .line 458
    if-nez v0, :cond_11

    .line 459
    .line 460
    iget-object v0, p1, Ll/dj70;->b:Ljava/lang/String;

    .line 461
    .line 462
    invoke-static {v0, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 463
    .line 464
    .line 465
    move-result v0

    .line 466
    if-eqz v0, :cond_13

    .line 467
    .line 468
    :cond_11
    iget-boolean v0, p1, Ll/dj70;->c:Z

    .line 469
    .line 470
    if-eqz v0, :cond_12

    .line 471
    .line 472
    const/high16 v0, 0x41600000    # 14.0f

    .line 473
    .line 474
    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 475
    .line 476
    .line 477
    const/high16 v0, 0x42080000    # 34.0f

    .line 478
    .line 479
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 480
    .line 481
    .line 482
    move-result v0

    .line 483
    invoke-static {p3, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 484
    .line 485
    .line 486
    iget-object v0, p1, Ll/dj70;->g:Lcom/p1/mobile/android/app/Act;

    .line 487
    .line 488
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 489
    .line 490
    .line 491
    move-result-object v0

    .line 492
    sget v9, Ll/lbc0;->t1:I

    .line 493
    .line 494
    invoke-virtual {v0, v9}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 495
    .line 496
    .line 497
    move-result-object v0

    .line 498
    invoke-virtual {p2, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 499
    .line 500
    .line 501
    goto :goto_4

    .line 502
    :cond_12
    invoke-virtual {p3, v8}, Landroid/widget/TextView;->setTextSize(F)V

    .line 503
    .line 504
    .line 505
    const/high16 v0, 0x41e00000    # 28.0f

    .line 506
    .line 507
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 508
    .line 509
    .line 510
    move-result v0

    .line 511
    invoke-static {p3, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 512
    .line 513
    .line 514
    iget-object v0, p1, Ll/dj70;->g:Lcom/p1/mobile/android/app/Act;

    .line 515
    .line 516
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 517
    .line 518
    .line 519
    move-result-object v0

    .line 520
    sget v9, Ll/lbc0;->s1:I

    .line 521
    .line 522
    invoke-virtual {v0, v9}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 523
    .line 524
    .line 525
    move-result-object v0

    .line 526
    invoke-virtual {p2, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 527
    .line 528
    .line 529
    :cond_13
    :goto_4
    const-string v0, "#fe7e1d"

    .line 530
    .line 531
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 532
    .line 533
    .line 534
    move-result v0

    .line 535
    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 536
    .line 537
    .line 538
    invoke-virtual {p2, v1}, Landroid/view/View;->setSelected(Z)V

    .line 539
    .line 540
    .line 541
    iget-object v0, p1, Ll/dj70;->b:Ljava/lang/String;

    .line 542
    .line 543
    invoke-static {v0, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 544
    .line 545
    .line 546
    move-result v0

    .line 547
    if-eqz v0, :cond_16

    .line 548
    .line 549
    iget-object v0, p1, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 550
    .line 551
    invoke-static {v0}, Ll/hyh;->k(Lcom/p1/mobile/putong/data/User;)Z

    .line 552
    .line 553
    .line 554
    move-result v0

    .line 555
    if-nez v0, :cond_16

    .line 556
    .line 557
    iget-object v0, p1, Ll/dj70;->b:Ljava/lang/String;

    .line 558
    .line 559
    invoke-static {v0, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 560
    .line 561
    .line 562
    move-result v0

    .line 563
    if-eqz v0, :cond_14

    .line 564
    .line 565
    iget-object v0, p0, Ll/f7i;->e:Lcom/tantan/library/svga/SVGAnimationView;

    .line 566
    .line 567
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 568
    .line 569
    .line 570
    move-result v0

    .line 571
    if-eqz v0, :cond_14

    .line 572
    .line 573
    iget-object v0, p0, Ll/f7i;->e:Lcom/tantan/library/svga/SVGAnimationView;

    .line 574
    .line 575
    invoke-virtual {v0}, Lcom/tantan/library/svga/SVGAnimationView;->isAnimating()Z

    .line 576
    .line 577
    .line 578
    move-result v0

    .line 579
    if-eqz v0, :cond_14

    .line 580
    .line 581
    invoke-virtual {p2, v2}, Landroid/view/View;->setVisibility(I)V

    .line 582
    .line 583
    .line 584
    :cond_14
    const-string v0, "#cc000000"

    .line 585
    .line 586
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 587
    .line 588
    .line 589
    move-result v0

    .line 590
    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 591
    .line 592
    .line 593
    const-string v0, "\u8d85\u7ea7\u559c\u6b22"

    .line 594
    .line 595
    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 596
    .line 597
    .line 598
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 599
    .line 600
    sget v2, Ll/lbc0;->p5:I

    .line 601
    .line 602
    invoke-virtual {v0, v2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 603
    .line 604
    .line 605
    move-result-object v0

    .line 606
    invoke-static {p3, v0}, Ll/bnl0;->k(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;)V

    .line 607
    .line 608
    .line 609
    const/high16 v0, 0x40800000    # 4.0f

    .line 610
    .line 611
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 612
    .line 613
    .line 614
    move-result v0

    .line 615
    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 616
    .line 617
    .line 618
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 619
    .line 620
    .line 621
    move-result v0

    .line 622
    invoke-static {p3, v0}, Ll/bnl0;->d0(Landroid/view/View;I)V

    .line 623
    .line 624
    .line 625
    iget-boolean v0, p1, Ll/dj70;->c:Z

    .line 626
    .line 627
    if-eqz v0, :cond_15

    .line 628
    .line 629
    invoke-static {v8}, Ll/qa00;->d(F)I

    .line 630
    .line 631
    .line 632
    move-result v0

    .line 633
    goto :goto_5

    .line 634
    :cond_15
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 635
    .line 636
    .line 637
    move-result v0

    .line 638
    :goto_5
    invoke-static {p3, v0}, Ll/bnl0;->e0(Landroid/view/View;I)V

    .line 639
    .line 640
    .line 641
    goto :goto_7

    .line 642
    :cond_16
    invoke-static {v8}, Ll/qa00;->d(F)I

    .line 643
    .line 644
    .line 645
    move-result v0

    .line 646
    invoke-static {p3, v0}, Ll/bnl0;->d0(Landroid/view/View;I)V

    .line 647
    .line 648
    .line 649
    invoke-static {v8}, Ll/qa00;->d(F)I

    .line 650
    .line 651
    .line 652
    move-result v0

    .line 653
    invoke-static {p3, v0}, Ll/bnl0;->e0(Landroid/view/View;I)V

    .line 654
    .line 655
    .line 656
    invoke-virtual {p3, v1, v1, v1, v1}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 657
    .line 658
    .line 659
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 660
    .line 661
    .line 662
    move-result v0

    .line 663
    if-eqz v0, :cond_17

    .line 664
    .line 665
    const-string v0, "\u559c\u6b22"

    .line 666
    .line 667
    goto :goto_6

    .line 668
    :cond_17
    move-object v0, p4

    .line 669
    :goto_6
    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 670
    .line 671
    .line 672
    :goto_7
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 673
    .line 674
    .line 675
    move-result v0

    .line 676
    if-eqz v0, :cond_18

    .line 677
    .line 678
    iget-boolean v0, p0, Ll/f7i;->f:Z

    .line 679
    .line 680
    if-nez v0, :cond_18

    .line 681
    .line 682
    iput-boolean v3, p0, Ll/f7i;->f:Z

    .line 683
    .line 684
    iget-object v0, p1, Ll/dj70;->l:Ll/fj70;

    .line 685
    .line 686
    invoke-virtual {v0}, Ll/fj70;->c()Ljava/lang/String;

    .line 687
    .line 688
    .line 689
    move-result-object v0

    .line 690
    iget-object v2, p1, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 691
    .line 692
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 693
    .line 694
    const-string v3, "moments_user_id"

    .line 695
    .line 696
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 697
    .line 698
    .line 699
    move-result-object v2

    .line 700
    const-string v3, "moment_id"

    .line 701
    .line 702
    iget-object v6, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 703
    .line 704
    invoke-static {v3, v6}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 705
    .line 706
    .line 707
    move-result-object v3

    .line 708
    filled-new-array {v2, v3}, [Ll/pf60;

    .line 709
    .line 710
    .line 711
    move-result-object v2

    .line 712
    const-string v3, "e_likeButton"

    .line 713
    .line 714
    invoke-static {v3, v0, v2}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 715
    .line 716
    .line 717
    :cond_18
    invoke-static {}, Ll/cmg;->o()Z

    .line 718
    .line 719
    .line 720
    move-result v0

    .line 721
    if-eqz v0, :cond_1a

    .line 722
    .line 723
    iget-object v0, p1, Ll/dj70;->b:Ljava/lang/String;

    .line 724
    .line 725
    invoke-static {v5, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 726
    .line 727
    .line 728
    move-result v0

    .line 729
    if-nez v0, :cond_1a

    .line 730
    .line 731
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 732
    .line 733
    .line 734
    move-result v0

    .line 735
    invoke-static {p3, v0}, Ll/bnl0;->d0(Landroid/view/View;I)V

    .line 736
    .line 737
    .line 738
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 739
    .line 740
    .line 741
    move-result v0

    .line 742
    invoke-static {p3, v0}, Ll/bnl0;->e0(Landroid/view/View;I)V

    .line 743
    .line 744
    .line 745
    const/high16 v0, 0x41800000    # 16.0f

    .line 746
    .line 747
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 748
    .line 749
    .line 750
    move-result v0

    .line 751
    invoke-static {p2, v0}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 752
    .line 753
    .line 754
    iget-object v0, p1, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 755
    .line 756
    invoke-static {v0}, Lcom/p1/mobile/putong/data/User;->isMatched(Lcom/p1/mobile/putong/data/User;)Z

    .line 757
    .line 758
    .line 759
    move-result v0

    .line 760
    if-eqz v0, :cond_19

    .line 761
    .line 762
    const-string v0, "\u804a\u5929"

    .line 763
    .line 764
    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 765
    .line 766
    .line 767
    goto :goto_8

    .line 768
    :cond_19
    const-string v0, "\u6253\u62db\u547c"

    .line 769
    .line 770
    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 771
    .line 772
    .line 773
    :goto_8
    invoke-virtual {p2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 774
    .line 775
    .line 776
    :cond_1a
    new-instance v0, Ll/v6i;

    .line 777
    .line 778
    move-object v1, p0

    .line 779
    move-object v3, p1

    .line 780
    move-object v5, p2

    .line 781
    move-object v2, p3

    .line 782
    move-object v6, p4

    .line 783
    move-object v7, p5

    .line 784
    invoke-direct/range {v0 .. v7}, Ll/v6i;-><init>(Ll/f7i;Landroid/widget/TextView;Ll/dj70;Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;Ljava/lang/String;Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;)V

    .line 785
    .line 786
    .line 787
    invoke-static {v5, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 788
    .line 789
    .line 790
    return-void

    .line 791
    :goto_9
    invoke-virtual {v5, v2}, Landroid/view/View;->setVisibility(I)V

    .line 792
    .line 793
    .line 794
    return-void
.end method

.method public final t(Z)Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/f7i;->a:Ll/dj70;

    .line 2
    .line 3
    iget-object v0, v0, Ll/dj70;->l:Ll/fj70;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/fj70;->c()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Ll/f7i;->a:Ll/dj70;

    .line 10
    .line 11
    iget-object v1, v1, Ll/dj70;->l:Ll/fj70;

    .line 12
    .line 13
    invoke-virtual {v1, p1}, Ll/fj70;->a(Z)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iget-object p0, p0, Ll/f7i;->a:Ll/dj70;

    .line 18
    .line 19
    iget-object v1, p0, Ll/dj70;->b:Ljava/lang/String;

    .line 20
    .line 21
    iget-object p0, p0, Ll/dj70;->l:Ll/fj70;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/fj70;->b()[Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {v1, p0}, Ll/ksg;->i(Ljava/lang/String;[Ll/pf60;)[Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p1, v0, p0}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 32
    .line 33
    .line 34
    return-object v0
.end method

.method public final u(Z)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Ll/f7i;->c:Landroid/widget/TextView;

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object p0, p0, Ll/f7i;->a:Ll/dj70;

    .line 10
    .line 11
    iget-object p0, p0, Ll/dj70;->g:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    sget v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->k:I

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public v(Ll/dj70;Landroid/view/View;Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;)V
    .locals 3

    .line 1
    invoke-virtual {p3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Landroid/view/View$OnAttachStateChangeListener;

    .line 12
    .line 13
    invoke-virtual {p3, v0}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    new-instance v0, Ll/f7i$a;

    .line 17
    .line 18
    invoke-direct {v0, p0, p3}, Ll/f7i$a;-><init>(Ll/f7i;Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p3, v0}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p3, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/f7i;->e:Lcom/tantan/library/svga/SVGAnimationView;

    .line 28
    .line 29
    const/4 v1, 0x0

    .line 30
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p1, Ll/dj70;->g:Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    const-string v2, "https://auto.tancdn.com/v1/raw/edf12e0b-b98f-410b-bb94-230b17af6c7313.pdf"

    .line 40
    .line 41
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    const/4 v1, 0x1

    .line 50
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    new-instance v1, Ll/f7i$b;

    .line 55
    .line 56
    invoke-direct {v1, p0, p2, p3, p1}, Ll/f7i$b;-><init>(Ll/f7i;Landroid/view/View;Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;Ll/dj70;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->animListener(Lcom/tantan/library/svga/AnimListener;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    iget-object p2, p0, Ll/f7i;->e:Lcom/tantan/library/svga/SVGAnimationView;

    .line 64
    .line 65
    invoke-virtual {p1, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 66
    .line 67
    .line 68
    iget-object p0, p0, Ll/f7i;->e:Lcom/tantan/library/svga/SVGAnimationView;

    .line 69
    .line 70
    invoke-virtual {p0}, Lcom/tantan/library/svga/SVGAnimationView;->startAnimation()V

    .line 71
    .line 72
    .line 73
    return-void
.end method
