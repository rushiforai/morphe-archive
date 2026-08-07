.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSeeMoreFollowingMomentView;
.super Lv/VRelative;
.source "SourceFile"


# instance fields
.field public d:Landroid/widget/LinearLayout;

.field public e:Lv/VText;

.field public f:Landroid/widget/ImageView;

.field public g:Lcom/p1/mobile/putong/feed/data/FeedSeeMoreFollowingMomentInfo;

.field public h:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VRelative;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VRelative;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VRelative;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method private getTrackingMoreType()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSeeMoreFollowingMomentView;->g:Lcom/p1/mobile/putong/feed/data/FeedSeeMoreFollowingMomentInfo;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, "error"

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    iget p0, p0, Lcom/p1/mobile/putong/feed/data/FeedSeeMoreFollowingMomentInfo;->action:I

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    if-ne p0, v0, :cond_1

    .line 12
    .line 13
    const-string p0, "expand"

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_1
    const/4 v0, 0x2

    .line 17
    if-ne p0, v0, :cond_2

    .line 18
    .line 19
    const-string p0, "jump"

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_2
    const-string p0, "other"

    .line 23
    .line 24
    return-object p0
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSeeMoreFollowingMomentView;Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSeeMoreFollowingMomentView;->H(Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final B()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSeeMoreFollowingMomentView;->g:Lcom/p1/mobile/putong/feed/data/FeedSeeMoreFollowingMomentInfo;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    iget p0, p0, Lcom/p1/mobile/putong/feed/data/FeedSeeMoreFollowingMomentInfo;->action:I

    .line 6
    .line 7
    const/4 v0, 0x3

    .line 8
    if-ne p0, v0, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0

    .line 13
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 14
    return p0
.end method

.method public final synthetic H(Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;Landroid/view/View;)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSeeMoreFollowingMomentView;->B()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    new-instance p2, Ll/pf60;

    .line 9
    .line 10
    const-string v0, "more_type"

    .line 11
    .line 12
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSeeMoreFollowingMomentView;->getTrackingMoreType()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-direct {p2, v0, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    filled-new-array {p2}, [Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    const-string v0, "e_follow_more"

    .line 24
    .line 25
    const-string v1, "p_discover_dating"

    .line 26
    .line 27
    invoke-static {v0, v1, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 28
    .line 29
    .line 30
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSeeMoreFollowingMomentView;->g:Lcom/p1/mobile/putong/feed/data/FeedSeeMoreFollowingMomentInfo;

    .line 31
    .line 32
    iget v0, p2, Lcom/p1/mobile/putong/feed/data/FeedSeeMoreFollowingMomentInfo;->action:I

    .line 33
    .line 34
    const/4 v1, 0x2

    .line 35
    const/4 v2, 0x3

    .line 36
    const/4 v3, 0x1

    .line 37
    if-ne v0, v3, :cond_5

    .line 38
    .line 39
    if-nez p1, :cond_1

    .line 40
    .line 41
    const-string p0, "frag\u6570\u636e\u5f02\u5e38"

    .line 42
    .line 43
    invoke-static {p0}, Ll/r1j0;->b(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    new-instance p2, Ljava/util/ArrayList;

    .line 48
    .line 49
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSeeMoreFollowingMomentView;->g:Lcom/p1/mobile/putong/feed/data/FeedSeeMoreFollowingMomentInfo;

    .line 53
    .line 54
    iget v4, v0, Lcom/p1/mobile/putong/feed/data/FeedSeeMoreFollowingMomentInfo;->unReadfollowingFeeds:I

    .line 55
    .line 56
    if-gt v4, v2, :cond_2

    .line 57
    .line 58
    iput v2, v0, Lcom/p1/mobile/putong/feed/data/FeedSeeMoreFollowingMomentInfo;->action:I

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_2
    iput v1, v0, Lcom/p1/mobile/putong/feed/data/FeedSeeMoreFollowingMomentInfo;->action:I

    .line 62
    .line 63
    :goto_0
    invoke-static {v4, v2}, Ljava/lang/Math;->min(II)I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSeeMoreFollowingMomentView;->g:Lcom/p1/mobile/putong/feed/data/FeedSeeMoreFollowingMomentInfo;

    .line 68
    .line 69
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/FeedSeeMoreFollowingMomentInfo;->followingMoments:Ljava/util/List;

    .line 70
    .line 71
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    if-nez v1, :cond_3

    .line 76
    .line 77
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSeeMoreFollowingMomentView;->g:Lcom/p1/mobile/putong/feed/data/FeedSeeMoreFollowingMomentInfo;

    .line 78
    .line 79
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/FeedSeeMoreFollowingMomentInfo;->followingMoments:Ljava/util/List;

    .line 80
    .line 81
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    if-lt v1, v0, :cond_3

    .line 86
    .line 87
    if-le v0, v3, :cond_3

    .line 88
    .line 89
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSeeMoreFollowingMomentView;->g:Lcom/p1/mobile/putong/feed/data/FeedSeeMoreFollowingMomentInfo;

    .line 90
    .line 91
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/FeedSeeMoreFollowingMomentInfo;->followingMoments:Ljava/util/List;

    .line 92
    .line 93
    invoke-interface {p0, v3, v0}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-interface {p2, p0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 98
    .line 99
    .line 100
    :cond_3
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 101
    .line 102
    .line 103
    move-result p0

    .line 104
    if-nez p0, :cond_4

    .line 105
    .line 106
    invoke-virtual {p1, v3, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->W4(ILjava/util/List;)Z

    .line 107
    .line 108
    .line 109
    :cond_4
    :goto_1
    return-void

    .line 110
    :cond_5
    if-ne v0, v1, :cond_7

    .line 111
    .line 112
    iget-object p1, p2, Lcom/p1/mobile/putong/feed/data/FeedSeeMoreFollowingMomentInfo;->followingMoments:Ljava/util/List;

    .line 113
    .line 114
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 115
    .line 116
    .line 117
    move-result p1

    .line 118
    if-le p1, v2, :cond_6

    .line 119
    .line 120
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSeeMoreFollowingMomentView;->g:Lcom/p1/mobile/putong/feed/data/FeedSeeMoreFollowingMomentInfo;

    .line 121
    .line 122
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/FeedSeeMoreFollowingMomentInfo;->followingMoments:Ljava/util/List;

    .line 123
    .line 124
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    check-cast p0, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 129
    .line 130
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 131
    .line 132
    goto :goto_2

    .line 133
    :cond_6
    const-string p0, ""

    .line 134
    .line 135
    :goto_2
    invoke-static {}, Ll/t8c;->e()Ll/t8c;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    invoke-virtual {p1, p0}, Ll/t8c;->c(Ljava/lang/String;)Z

    .line 140
    .line 141
    .line 142
    return-void

    .line 143
    :cond_7
    const-string p0, "\u6570\u636e\u5f02\u5e38"

    .line 144
    .line 145
    invoke-static {p0}, Ll/r1j0;->b(Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    return-void
.end method

.method public I(Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;Lcom/p1/mobile/putong/feed/data/FeedSeeMoreFollowingMomentInfo;)V
    .locals 4

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSeeMoreFollowingMomentView;->g:Lcom/p1/mobile/putong/feed/data/FeedSeeMoreFollowingMomentInfo;

    .line 2
    .line 3
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSeeMoreFollowingMomentView;->d:Landroid/widget/LinearLayout;

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSeeMoreFollowingMomentView;->d:Landroid/widget/LinearLayout;

    .line 10
    .line 11
    sget v1, Ll/qa00;->j:I

    .line 12
    .line 13
    sget v2, Ll/qa00;->i:I

    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    invoke-virtual {p2, v1, v3, v2, v3}, Landroid/view/View;->setPadding(IIII)V

    .line 17
    .line 18
    .line 19
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSeeMoreFollowingMomentView;->g:Lcom/p1/mobile/putong/feed/data/FeedSeeMoreFollowingMomentInfo;

    .line 20
    .line 21
    iget p2, p2, Lcom/p1/mobile/putong/feed/data/FeedSeeMoreFollowingMomentInfo;->action:I

    .line 22
    .line 23
    if-ne p2, v0, :cond_0

    .line 24
    .line 25
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSeeMoreFollowingMomentView;->e:Lv/VText;

    .line 26
    .line 27
    const-string v1, "\u66f4\u591a\u5173\u6ce8\u4eba\u7684\u65b0\u52a8\u6001"

    .line 28
    .line 29
    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 30
    .line 31
    .line 32
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSeeMoreFollowingMomentView;->f:Landroid/widget/ImageView;

    .line 33
    .line 34
    sget v1, Ll/lbc0;->Q4:I

    .line 35
    .line 36
    invoke-virtual {p2, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 37
    .line 38
    .line 39
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSeeMoreFollowingMomentView;->f:Landroid/widget/ImageView;

    .line 40
    .line 41
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    const/4 v2, 0x2

    .line 46
    if-ne p2, v2, :cond_1

    .line 47
    .line 48
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSeeMoreFollowingMomentView;->e:Lv/VText;

    .line 49
    .line 50
    const-string v1, "\u67e5\u770b\u66f4\u591a\u5173\u6ce8\u4eba\u7684\u52a8\u6001"

    .line 51
    .line 52
    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 53
    .line 54
    .line 55
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSeeMoreFollowingMomentView;->f:Landroid/widget/ImageView;

    .line 56
    .line 57
    sget v1, Ll/lbc0;->R4:I

    .line 58
    .line 59
    invoke-virtual {p2, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 60
    .line 61
    .line 62
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSeeMoreFollowingMomentView;->f:Landroid/widget/ImageView;

    .line 63
    .line 64
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 65
    .line 66
    .line 67
    iget-boolean p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSeeMoreFollowingMomentView;->h:Z

    .line 68
    .line 69
    if-nez p2, :cond_3

    .line 70
    .line 71
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSeeMoreFollowingMomentView;->h:Z

    .line 72
    .line 73
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSeeMoreFollowingMomentView;->z()V

    .line 74
    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSeeMoreFollowingMomentView;->d:Landroid/widget/LinearLayout;

    .line 78
    .line 79
    const/4 v2, 0x3

    .line 80
    if-ne p2, v2, :cond_2

    .line 81
    .line 82
    invoke-virtual {v0, v1, v3, v1, v3}, Landroid/view/View;->setPadding(IIII)V

    .line 83
    .line 84
    .line 85
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSeeMoreFollowingMomentView;->e:Lv/VText;

    .line 86
    .line 87
    const-string v0, "\u5173\u6ce8\u7684\u65b0\u52a8\u6001\u90fd\u770b\u5b8c\u4e86\uff0c\u5411\u4e0b\u67e5\u770b\u66f4\u591a"

    .line 88
    .line 89
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 90
    .line 91
    .line 92
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSeeMoreFollowingMomentView;->f:Landroid/widget/ImageView;

    .line 93
    .line 94
    invoke-static {p2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 95
    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_2
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 99
    .line 100
    .line 101
    :cond_3
    :goto_0
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSeeMoreFollowingMomentView;->d:Landroid/widget/LinearLayout;

    .line 102
    .line 103
    new-instance v0, Ll/zyh;

    .line 104
    .line 105
    invoke-direct {v0, p0, p1}, Ll/zyh;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSeeMoreFollowingMomentView;Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;)V

    .line 106
    .line 107
    .line 108
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 109
    .line 110
    .line 111
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSeeMoreFollowingMomentView;->q(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final q(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/azh;->a(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSeeMoreFollowingMomentView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public z()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSeeMoreFollowingMomentView;->B()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance v0, Ll/pf60;

    .line 9
    .line 10
    const-string v1, "more_type"

    .line 11
    .line 12
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSeeMoreFollowingMomentView;->getTrackingMoreType()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-direct {v0, v1, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    filled-new-array {v0}, [Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string v0, "e_follow_more"

    .line 24
    .line 25
    const-string v1, "p_discover_dating"

    .line 26
    .line 27
    invoke-static {v0, v1, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method
