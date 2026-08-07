.class public Ll/r7j;
.super Ll/em2;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/em2;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic o([Ll/th0;Landroid/view/View;)V
    .locals 1

    .line 1
    const/4 p1, 0x0

    .line 2
    aget-object v0, p0, p1

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    invoke-virtual {v0}, Ll/th0;->c()V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    aput-object v0, p0, p1

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic p(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/data/Media;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    instance-of p0, p0, Lcom/p1/mobile/putong/data/Video;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    goto :goto_1

    .line 12
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 13
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static synthetic r(Lcom/p1/mobile/putong/data/Media;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    instance-of p0, p0, Lcom/p1/mobile/putong/data/Video;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    goto :goto_1

    .line 12
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 13
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->o()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->A4:Z

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic t(Ll/r7j;Landroid/content/Context;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/r7j;->x(Landroid/content/Context;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic u(Ll/x20;[Ll/th0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    aget-object p2, p1, p0

    .line 6
    .line 7
    if-nez p2, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {p2}, Ll/th0;->c()V

    .line 11
    .line 12
    .line 13
    const/4 p2, 0x0

    .line 14
    aput-object p2, p1, p0

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic v(Lcom/p1/mobile/putong/data/Media;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    instance-of p0, p0, Lcom/p1/mobile/putong/data/Video;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    goto :goto_1

    .line 12
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 13
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method


# virtual methods
.method public final A(Lv/VDraweeView;Lcom/p1/mobile/putong/data/Media;)V
    .locals 1

    .line 1
    const/4 p0, 0x1

    .line 2
    invoke-static {p1, p0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    instance-of p0, p2, Lcom/p1/mobile/putong/data/Video;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    move-object p0, p2

    .line 15
    check-cast p0, Lcom/p1/mobile/putong/data/Picture;

    .line 16
    .line 17
    :goto_0
    if-eqz p0, :cond_1

    .line 18
    .line 19
    iget-object p2, p0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 20
    .line 21
    const-string v0, "raw"

    .line 22
    .line 23
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    if-nez p2, :cond_1

    .line 28
    .line 29
    iget-object p2, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result p2

    .line 35
    if-nez p2, :cond_1

    .line 36
    .line 37
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 38
    .line 39
    sget v0, Ll/qa00;->G:I

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Picture;->calculatedWidth(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p2, p1, p0}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 46
    .line 47
    .line 48
    :cond_1
    return-void
.end method

.method public final B(Lcom/p1/mobile/android/app/Act;)V
    .locals 8

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isJailedOrRestrict()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->startJailedDialogLikeAct()V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-interface {p0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->isPostingMoment()Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_1

    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const/4 p0, 0x0

    .line 39
    new-array p0, p0, [Lcom/p1/mobile/putong/data/Media;

    .line 40
    .line 41
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-static {}, Ll/luh;->d()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v5

    .line 49
    invoke-static {}, Ll/luh;->e()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v6

    .line 53
    const/4 v7, 0x0

    .line 54
    const/4 v3, 0x1

    .line 55
    const-string v4, "other"

    .line 56
    .line 57
    move-object v1, p1

    .line 58
    invoke-interface/range {v0 .. v7}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Nr(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public bridge synthetic a(Ll/oql;ILcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;Landroid/content/Context;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/r7j;->y(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;ILcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;Landroid/content/Context;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public c(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;Landroid/view/View;Landroid/widget/FrameLayout;ILandroid/content/Context;)V
    .locals 6

    .line 1
    invoke-super/range {p0 .. p5}, Ll/em2;->c(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;Landroid/view/View;Landroid/widget/FrameLayout;ILandroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    instance-of p3, p2, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentLayout;

    .line 5
    .line 6
    if-eqz p3, :cond_8

    .line 7
    .line 8
    move-object p3, p2

    .line 9
    check-cast p3, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentLayout;

    .line 10
    .line 11
    iget-object v0, p3, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentLayout;->c:Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;

    .line 12
    .line 13
    invoke-virtual {p0, v0, p1, p4}, Ll/em2;->k(Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;I)V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 17
    .line 18
    .line 19
    move-result-object p4

    .line 20
    invoke-interface {p4}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->u6()Z

    .line 21
    .line 22
    .line 23
    move-result p4

    .line 24
    const/4 v0, 0x0

    .line 25
    const/4 v1, 0x0

    .line 26
    if-eqz p4, :cond_3

    .line 27
    .line 28
    iget-object p4, p3, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentLayout;->e:Lv/VLinear;

    .line 29
    .line 30
    invoke-virtual {p4}, Landroid/view/ViewGroup;->getChildCount()I

    .line 31
    .line 32
    .line 33
    move-result p4

    .line 34
    move-object v3, v0

    .line 35
    move v2, v1

    .line 36
    :goto_0
    if-ge v2, p4, :cond_1

    .line 37
    .line 38
    iget-object v4, p3, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentLayout;->e:Lv/VLinear;

    .line 39
    .line 40
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    instance-of v5, v4, Ll/skq0;

    .line 45
    .line 46
    if-eqz v5, :cond_0

    .line 47
    .line 48
    move-object v3, v4

    .line 49
    check-cast v3, Ll/skq0;

    .line 50
    .line 51
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    if-nez v3, :cond_2

    .line 55
    .line 56
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 57
    .line 58
    .line 59
    move-result-object p4

    .line 60
    move-object v2, p5

    .line 61
    check-cast v2, Lcom/p1/mobile/android/app/Act;

    .line 62
    .line 63
    const-string v3, "p_suggest_users_home_view"

    .line 64
    .line 65
    invoke-interface {p4, v2, v3}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Gk(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Ll/skq0;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    iget-object p4, p3, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentLayout;->e:Lv/VLinear;

    .line 70
    .line 71
    invoke-interface {v3}, Ll/skq0;->getView()Landroid/view/View;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    invoke-virtual {p4, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 76
    .line 77
    .line 78
    invoke-interface {v3}, Ll/skq0;->getView()Landroid/view/View;

    .line 79
    .line 80
    .line 81
    move-result-object p4

    .line 82
    const/high16 v2, 0x40800000    # 4.0f

    .line 83
    .line 84
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 85
    .line 86
    .line 87
    move-result v2

    .line 88
    invoke-static {p4, v2}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 89
    .line 90
    .line 91
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 92
    .line 93
    .line 94
    move-result-object p4

    .line 95
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    invoke-interface {v2}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Ns()I

    .line 100
    .line 101
    .line 102
    move-result v2

    .line 103
    invoke-interface {v3, p4, v2}, Ll/skq0;->b(Lcom/p1/mobile/putong/data/User;I)V

    .line 104
    .line 105
    .line 106
    :cond_3
    iget-object p4, p3, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentLayout;->g:Lv/VLinear;

    .line 107
    .line 108
    const/4 v2, 0x1

    .line 109
    invoke-static {p4, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 110
    .line 111
    .line 112
    iget-object p4, p3, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentLayout;->l:Lv/VRelative;

    .line 113
    .line 114
    invoke-static {p4, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 115
    .line 116
    .line 117
    iget-object p4, p3, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentLayout;->h:Lv/VDraweeView;

    .line 118
    .line 119
    invoke-static {p4, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 120
    .line 121
    .line 122
    iget-object p4, p3, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentLayout;->i:Lv/VDraweeView;

    .line 123
    .line 124
    invoke-static {p4, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 125
    .line 126
    .line 127
    iget-object p4, p3, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentLayout;->j:Lv/VDraweeView;

    .line 128
    .line 129
    invoke-static {p4, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 130
    .line 131
    .line 132
    iget-object p4, p3, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentLayout;->k:Lv/VDraweeView;

    .line 133
    .line 134
    invoke-static {p4, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUserInfo()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 138
    .line 139
    .line 140
    move-result-object p4

    .line 141
    iget-object p4, p4, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->userMedia:Ljava/util/List;

    .line 142
    .line 143
    new-instance v3, Ll/j7j;

    .line 144
    .line 145
    invoke-direct {v3}, Ll/j7j;-><init>()V

    .line 146
    .line 147
    .line 148
    invoke-static {p4, v3}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 149
    .line 150
    .line 151
    move-result-object p4

    .line 152
    invoke-interface {p4}, Ljava/util/List;->size()I

    .line 153
    .line 154
    .line 155
    move-result v3

    .line 156
    if-lez v3, :cond_4

    .line 157
    .line 158
    iget-object v3, p3, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentLayout;->h:Lv/VDraweeView;

    .line 159
    .line 160
    invoke-interface {p4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 161
    .line 162
    .line 163
    move-result-object v4

    .line 164
    check-cast v4, Lcom/p1/mobile/putong/data/Media;

    .line 165
    .line 166
    invoke-virtual {p0, v3, v4}, Ll/r7j;->A(Lv/VDraweeView;Lcom/p1/mobile/putong/data/Media;)V

    .line 167
    .line 168
    .line 169
    :cond_4
    invoke-interface {p4}, Ljava/util/List;->size()I

    .line 170
    .line 171
    .line 172
    move-result v3

    .line 173
    if-le v3, v2, :cond_5

    .line 174
    .line 175
    iget-object v3, p3, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentLayout;->i:Lv/VDraweeView;

    .line 176
    .line 177
    invoke-interface {p4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 178
    .line 179
    .line 180
    move-result-object v4

    .line 181
    check-cast v4, Lcom/p1/mobile/putong/data/Media;

    .line 182
    .line 183
    invoke-virtual {p0, v3, v4}, Ll/r7j;->A(Lv/VDraweeView;Lcom/p1/mobile/putong/data/Media;)V

    .line 184
    .line 185
    .line 186
    :cond_5
    invoke-interface {p4}, Ljava/util/List;->size()I

    .line 187
    .line 188
    .line 189
    move-result v3

    .line 190
    const/4 v4, 0x2

    .line 191
    if-le v3, v4, :cond_6

    .line 192
    .line 193
    iget-object v3, p3, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentLayout;->j:Lv/VDraweeView;

    .line 194
    .line 195
    invoke-interface {p4, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 196
    .line 197
    .line 198
    move-result-object v4

    .line 199
    check-cast v4, Lcom/p1/mobile/putong/data/Media;

    .line 200
    .line 201
    invoke-virtual {p0, v3, v4}, Ll/r7j;->A(Lv/VDraweeView;Lcom/p1/mobile/putong/data/Media;)V

    .line 202
    .line 203
    .line 204
    :cond_6
    invoke-interface {p4}, Ljava/util/List;->size()I

    .line 205
    .line 206
    .line 207
    move-result v3

    .line 208
    const/4 v4, 0x3

    .line 209
    if-le v3, v4, :cond_7

    .line 210
    .line 211
    iget-object v3, p3, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentLayout;->k:Lv/VDraweeView;

    .line 212
    .line 213
    invoke-interface {p4, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 214
    .line 215
    .line 216
    move-result-object v4

    .line 217
    check-cast v4, Lcom/p1/mobile/putong/data/Media;

    .line 218
    .line 219
    invoke-virtual {p0, v3, v4}, Ll/r7j;->A(Lv/VDraweeView;Lcom/p1/mobile/putong/data/Media;)V

    .line 220
    .line 221
    .line 222
    sget v3, Ll/qa00;->E:I

    .line 223
    .line 224
    invoke-static {p2, v3}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 225
    .line 226
    .line 227
    :cond_7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 228
    .line 229
    .line 230
    move-result-object p2

    .line 231
    invoke-interface {p2}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Rc()Z

    .line 232
    .line 233
    .line 234
    move-result p2

    .line 235
    if-eqz p2, :cond_8

    .line 236
    .line 237
    invoke-static {p4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 238
    .line 239
    .line 240
    move-result p2

    .line 241
    if-eqz p2, :cond_8

    .line 242
    .line 243
    iget-object p2, p3, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentLayout;->g:Lv/VLinear;

    .line 244
    .line 245
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 246
    .line 247
    .line 248
    iget-object p2, p3, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentLayout;->l:Lv/VRelative;

    .line 249
    .line 250
    invoke-static {p2, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 251
    .line 252
    .line 253
    iget-object p2, p3, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentLayout;->n:Lv/VText;

    .line 254
    .line 255
    invoke-virtual {p2, v0, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 256
    .line 257
    .line 258
    iget-object p2, p3, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentLayout;->o:Lv/VText;

    .line 259
    .line 260
    invoke-static {}, Ll/luh;->c()Ljava/lang/String;

    .line 261
    .line 262
    .line 263
    move-result-object p4

    .line 264
    invoke-virtual {p2, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 265
    .line 266
    .line 267
    iget-object p2, p3, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentLayout;->n:Lv/VText;

    .line 268
    .line 269
    invoke-static {}, Ll/luh;->b()Ljava/lang/String;

    .line 270
    .line 271
    .line 272
    move-result-object p4

    .line 273
    invoke-virtual {p2, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 274
    .line 275
    .line 276
    iget-object p2, p3, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomMomentLayout;->l:Lv/VRelative;

    .line 277
    .line 278
    invoke-virtual {p0, p1, p2, p5}, Ll/r7j;->w(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;Landroid/view/View;Landroid/content/Context;)V

    .line 279
    .line 280
    .line 281
    :cond_8
    return-void
.end method

.method public final w(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;Landroid/view/View;Landroid/content/Context;)V
    .locals 0

    .line 1
    new-instance p1, Ll/m7j;

    .line 2
    .line 3
    invoke-direct {p1, p0, p3}, Ll/m7j;-><init>(Ll/r7j;Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p2, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic x(Landroid/content/Context;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/luh;->d()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-static {}, Ll/luh;->c()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "p_edit_profile_view"

    .line 10
    .line 11
    invoke-static {p2, v0, v1}, Ll/luh;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    const v0, 0x1020002

    .line 21
    .line 22
    .line 23
    invoke-virtual {p2, v0}, Landroidx/fragment/app/FragmentManager;->h0(I)Landroidx/fragment/app/Fragment;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    check-cast p2, Lcom/p1/mobile/android/app/Frag;

    .line 28
    .line 29
    instance-of v0, p2, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 30
    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    check-cast p2, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 34
    .line 35
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->N8()Lcom/p1/mobile/putong/data/User;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_0

    .line 44
    .line 45
    new-instance v0, Ll/n7j;

    .line 46
    .line 47
    invoke-direct {v0, p2}, Ll/n7j;-><init>(Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0, p1, v0}, Ll/r7j;->z(Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_0
    invoke-virtual {p0, p1}, Ll/r7j;->B(Lcom/p1/mobile/android/app/Act;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public y(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;ILcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/CardBottomFrame;Landroid/content/Context;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUser()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p2, 0x0

    .line 6
    if-eqz p0, :cond_3

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUserInfo()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    if-nez p0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {p0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Rc()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    const/4 p3, 0x1

    .line 24
    if-eqz p0, :cond_2

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->k()Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    if-eqz p0, :cond_2

    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUserInfo()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->userMedia:Ljava/util/List;

    .line 37
    .line 38
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    if-nez p0, :cond_1

    .line 43
    .line 44
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUserInfo()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->userMedia:Ljava/util/List;

    .line 49
    .line 50
    new-instance p4, Ll/k7j;

    .line 51
    .line 52
    invoke-direct {p4}, Ll/k7j;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-static {p0, p4}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    if-nez p0, :cond_2

    .line 60
    .line 61
    :cond_1
    return p3

    .line 62
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUserInfo()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->userMedia:Ljava/util/List;

    .line 67
    .line 68
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    if-nez p0, :cond_3

    .line 73
    .line 74
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;->getUserInfo()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->userMedia:Ljava/util/List;

    .line 79
    .line 80
    new-instance p1, Ll/l7j;

    .line 81
    .line 82
    invoke-direct {p1}, Ll/l7j;-><init>()V

    .line 83
    .line 84
    .line 85
    invoke-static {p0, p1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result p0

    .line 93
    if-eqz p0, :cond_3

    .line 94
    .line 95
    return p3

    .line 96
    :cond_3
    :goto_0
    return p2
.end method

.method public final z(Lcom/p1/mobile/android/app/Act;Ll/x20;)V
    .locals 2

    .line 1
    const/4 p0, 0x1

    .line 2
    new-array p0, p0, [Ll/th0;

    .line 3
    .line 4
    new-instance v0, Ll/th0$a;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 7
    .line 8
    .line 9
    const-string p1, "\u5f53\u524d\u6709\u8fd8\u672a\u4fdd\u5b58\u7684\u8d44\u6599\uff0c\u70b9\u51fb\u4fdd\u5b58\u540e\u53ef\u76f4\u63a5\u8df3\u8f6c\u52a8\u6001\u53d1\u5e03"

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const-string v1, "\u8d44\u6599\u5c1a\u672a\u4fdd\u5b58"

    .line 16
    .line 17
    invoke-virtual {p1, v1}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    sget v1, Lcom/p1/mobile/putong/core/R$string;->u:I

    .line 22
    .line 23
    invoke-virtual {p1, v1}, Ll/th0$a;->q(I)Ll/th0$a;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    new-instance v1, Ll/o7j;

    .line 28
    .line 29
    invoke-direct {v1, p2, p0}, Ll/o7j;-><init>(Ll/x20;[Ll/th0;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1, v1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    sget p2, Lcom/p1/mobile/putong/core/R$string;->c:I

    .line 37
    .line 38
    invoke-virtual {p1, p2}, Ll/th0$a;->e(I)Ll/th0$a;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    new-instance p2, Ll/p7j;

    .line 43
    .line 44
    invoke-direct {p2}, Ll/p7j;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1, p2}, Ll/th0$a;->m(Landroid/content/DialogInterface$OnDismissListener;)Ll/th0$a;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    new-instance p2, Ll/q7j;

    .line 52
    .line 53
    invoke-direct {p2, p0}, Ll/q7j;-><init>([Ll/th0;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p1, p2}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0}, Ll/th0$a;->a()Ll/th0;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    const/4 p2, 0x0

    .line 64
    aput-object p1, p0, p2

    .line 65
    .line 66
    invoke-virtual {p1}, Ll/th0;->g()V

    .line 67
    .line 68
    .line 69
    return-void
.end method
