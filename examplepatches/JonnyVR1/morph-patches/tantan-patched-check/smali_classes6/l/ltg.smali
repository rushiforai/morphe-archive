.class public Ll/ltg;
.super Ll/ptg;
.source "SourceFile"


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/mtg;Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterImageView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/ptg;-><init>(Lcom/p1/mobile/android/app/Act;Ll/mtg;Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterImageView;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Ll/ltg;Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ltg;->j(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ll/ltg;Ljava/util/HashMap;Lcom/p1/mobile/putong/feed/data/Moment;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/ltg;->k(Ljava/util/HashMap;Lcom/p1/mobile/putong/feed/data/Moment;Z)V

    return-void
.end method


# virtual methods
.method public c(ILcom/p1/mobile/putong/feed/data/Moment;Ljava/util/HashMap;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p1, p0, Ll/ptg;->s:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterImageView;

    .line 2
    .line 3
    sget v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterImageView;->F:I

    .line 4
    .line 5
    iget p1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterImageView;->B:I

    .line 6
    .line 7
    iget-object v1, p0, Ll/ptg;->i:Lv/VText;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-virtual {p0, v1, v2}, Ll/ptg;->b(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Ll/ptg;->l:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 14
    .line 15
    invoke-virtual {p0, v1, v2}, Ll/ptg;->b(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Ll/ptg;->k:Lv/VText;

    .line 19
    .line 20
    invoke-virtual {p0, v1, v2}, Ll/ptg;->b(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Ll/ptg;->h:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 24
    .line 25
    iget-object v3, p2, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    const/4 v4, 0x1

    .line 32
    xor-int/2addr v3, v4

    .line 33
    invoke-virtual {p0, v1, v3}, Ll/ptg;->b(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    iget-object v1, p0, Ll/ptg;->d:Landroid/widget/LinearLayout;

    .line 37
    .line 38
    invoke-virtual {p0, v1, v2}, Ll/ptg;->b(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    iget-object v1, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {p3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    check-cast v1, Ljava/lang/Boolean;

    .line 48
    .line 49
    iget-object v3, p0, Ll/ptg;->h:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 50
    .line 51
    if-eqz v1, :cond_0

    .line 52
    .line 53
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-eqz v1, :cond_0

    .line 58
    .line 59
    move v2, v4

    .line 60
    :cond_0
    invoke-virtual {v3, v2}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->L(Z)Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    new-instance v2, Ll/jtg;

    .line 65
    .line 66
    invoke-direct {v2, p0, p3, p2}, Ll/jtg;-><init>(Ll/ltg;Ljava/util/HashMap;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->Q(Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer$e;)Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 70
    .line 71
    .line 72
    move-result-object p3

    .line 73
    iget-object v1, p2, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 74
    .line 75
    invoke-virtual {p3, v1}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->M(Ljava/lang/CharSequence;)Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 76
    .line 77
    .line 78
    iget-object p3, p0, Ll/ptg;->j:Landroid/widget/FrameLayout;

    .line 79
    .line 80
    invoke-virtual {p0, p3, v4}, Ll/ptg;->b(Landroid/view/View;Z)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0, p2}, Ll/ltg;->f(Lcom/p1/mobile/putong/feed/data/Moment;)Lcom/p1/mobile/putong/data/Picture;

    .line 84
    .line 85
    .line 86
    move-result-object p3

    .line 87
    if-eqz p3, :cond_1

    .line 88
    .line 89
    invoke-virtual {p0}, Ll/ltg;->h()V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0, p2}, Ll/ltg;->l(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 93
    .line 94
    .line 95
    iget-object v1, p0, Ll/ptg;->x:Ljava/lang/String;

    .line 96
    .line 97
    const-string v2, "from_discover_dating"

    .line 98
    .line 99
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0}, Ll/ltg;->n()V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p0, p2, v0, p1, p3}, Ll/ltg;->m(Lcom/p1/mobile/putong/feed/data/Moment;IILcom/p1/mobile/putong/data/Picture;)V

    .line 106
    .line 107
    .line 108
    iget-object p0, p0, Ll/ptg;->p:Lv/VImage;

    .line 109
    .line 110
    invoke-static {p2, p0}, Ll/rtg;->f(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V

    .line 111
    .line 112
    .line 113
    :cond_1
    return-void
.end method

.method public final f(Lcom/p1/mobile/putong/feed/data/Moment;)Lcom/p1/mobile/putong/data/Picture;
    .locals 1

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Live;->snapshot:Lcom/p1/mobile/putong/data/Media;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez p0, :cond_1

    .line 7
    .line 8
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->liveRoom:Lcom/p1/mobile/putong/data/Room;

    .line 9
    .line 10
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->liveRoom:Lcom/p1/mobile/putong/data/Room;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Room;->cover:Lcom/p1/mobile/putong/data/RoomCover;

    .line 19
    .line 20
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-eqz p0, :cond_0

    .line 25
    .line 26
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->liveRoom:Lcom/p1/mobile/putong/data/Room;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Room;->cover:Lcom/p1/mobile/putong/data/RoomCover;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/data/RoomCover;->media:Lcom/p1/mobile/putong/data/Picture;

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    move-object p0, v0

    .line 34
    :cond_1
    :goto_0
    instance-of p1, p0, Lcom/p1/mobile/putong/data/Picture;

    .line 35
    .line 36
    if-eqz p1, :cond_2

    .line 37
    .line 38
    check-cast p0, Lcom/p1/mobile/putong/data/Picture;

    .line 39
    .line 40
    return-object p0

    .line 41
    :cond_2
    return-object v0
.end method

.method public final g(Lcom/p1/mobile/putong/feed/data/Moment;)Z
    .locals 1

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Live;->specialLabels:Ljava/util/List;

    .line 4
    .line 5
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const/4 v0, 0x0

    .line 10
    if-nez p0, :cond_0

    .line 11
    .line 12
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Live;->specialLabels:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Lcom/p1/mobile/putong/data/LiveSpecialLabel;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/data/LiveSpecialLabel;->value:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    if-nez p0, :cond_0

    .line 29
    .line 30
    const/4 p0, 0x1

    .line 31
    return p0

    .line 32
    :cond_0
    return v0
.end method

.method public final h()V
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget-object v2, p0, Ll/ptg;->j:Landroid/widget/FrameLayout;

    .line 4
    .line 5
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-ge v1, v2, :cond_2

    .line 10
    .line 11
    iget-object v2, p0, Ll/ptg;->j:Landroid/widget/FrameLayout;

    .line 12
    .line 13
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    instance-of v2, v2, Lv/VRelative;

    .line 18
    .line 19
    if-eqz v2, :cond_1

    .line 20
    .line 21
    iget-object v2, p0, Ll/ptg;->j:Landroid/widget/FrameLayout;

    .line 22
    .line 23
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    check-cast v2, Lv/VRelative;

    .line 28
    .line 29
    invoke-virtual {p0, v2, v0}, Ll/ptg;->b(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    instance-of v4, v3, Lv/VDraweeView;

    .line 37
    .line 38
    if-eqz v4, :cond_0

    .line 39
    .line 40
    move-object v4, v3

    .line 41
    check-cast v4, Lv/VDraweeView;

    .line 42
    .line 43
    sget-object v5, Ll/uqb0;->G:Ll/fsb0;

    .line 44
    .line 45
    invoke-virtual {v5, v4}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 46
    .line 47
    .line 48
    const/4 v5, 0x0

    .line 49
    invoke-virtual {v4, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v3, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v4, v5}, Lv/VDraweeView;->setZoomAnimationKey(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    :cond_0
    const/4 v3, 0x1

    .line 59
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-virtual {p0, v2, v0}, Ll/ptg;->b(Landroid/view/View;Z)V

    .line 64
    .line 65
    .line 66
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_2
    return-void
.end method

.method public final i(Lcom/p1/mobile/putong/feed/data/Moment;)Z
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->multiCallInfo:Lcom/p1/mobile/putong/feed/data/LiveMultiCallInfo;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/data/LiveMultiCallInfo;->onGoing:Z

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public final synthetic j(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/ptg;->r:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iget-object v1, p0, Ll/ptg;->x:Ljava/lang/String;

    .line 4
    .line 5
    iget v3, p0, Ll/ptg;->z:I

    .line 6
    .line 7
    iget-boolean v4, p0, Ll/ptg;->y:Z

    .line 8
    .line 9
    iget-object v5, p0, Ll/ptg;->A:Ll/n570;

    .line 10
    .line 11
    move-object v2, p1

    .line 12
    invoke-static/range {v0 .. v5}, Ll/rtg;->b(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;IZLl/n570;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic k(Ljava/util/HashMap;Lcom/p1/mobile/putong/feed/data/Moment;Z)V
    .locals 1

    .line 1
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p1, p2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/ptg;->s:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterImageView;

    .line 11
    .line 12
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->k0(Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final l(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ptg;->n:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ltg;->g(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Live;->specialLabels:Ljava/util/List;

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Lcom/p1/mobile/putong/data/LiveSpecialLabel;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/data/LiveSpecialLabel;->value:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/Moment;->isLiveDataChange()Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_2

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Ll/ltg;->i(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-eqz p0, :cond_1

    .line 37
    .line 38
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->e3:I

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->c3:I

    .line 42
    .line 43
    :goto_0
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(I)V

    .line 44
    .line 45
    .line 46
    :cond_2
    return-void
.end method

.method public final m(Lcom/p1/mobile/putong/feed/data/Moment;IILcom/p1/mobile/putong/data/Picture;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/ptg;->j:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Lv/VRelative;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    const/4 v3, 0x2

    .line 15
    if-ge v2, v3, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    const/4 v4, 0x1

    .line 23
    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v5

    .line 27
    invoke-static {v5, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    instance-of v1, v2, Lv/VDraweeView;

    .line 31
    .line 32
    if-nez v1, :cond_1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    check-cast v2, Lv/VDraweeView;

    .line 36
    .line 37
    invoke-static {v0, v4}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0, p4}, Ll/ptg;->a(Lcom/p1/mobile/putong/data/Picture;)Lcom/p1/mobile/putong/data/Dimension;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    .line 45
    .line 46
    iget v5, v1, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 47
    .line 48
    iget v1, v1, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 49
    .line 50
    invoke-direct {v4, v5, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 54
    .line 55
    .line 56
    invoke-static {}, Ll/ksg;->y()I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    int-to-float v0, v0

    .line 61
    invoke-static {v0}, Lcom/facebook/drawee/generic/RoundingParams;->c(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    sget-object v1, Lcom/facebook/drawee/generic/RoundingParams$RoundingMethod;->BITMAP_ONLY:Lcom/facebook/drawee/generic/RoundingParams$RoundingMethod;

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/generic/RoundingParams;->w(Lcom/facebook/drawee/generic/RoundingParams$RoundingMethod;)Lcom/facebook/drawee/generic/RoundingParams;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {v2}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    check-cast v1, Ll/wlj;

    .line 76
    .line 77
    invoke-virtual {v1, v0}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 78
    .line 79
    .line 80
    new-instance v0, Ll/ktg;

    .line 81
    .line 82
    invoke-direct {v0, p0, p1}, Ll/ktg;-><init>(Ll/ltg;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 86
    .line 87
    .line 88
    iget-object p0, p4, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 89
    .line 90
    const-string p1, "raw"

    .line 91
    .line 92
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 93
    .line 94
    .line 95
    move-result p0

    .line 96
    if-nez p0, :cond_2

    .line 97
    .line 98
    iget-object p0, p4, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 99
    .line 100
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 101
    .line 102
    .line 103
    move-result p0

    .line 104
    if-nez p0, :cond_2

    .line 105
    .line 106
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 107
    .line 108
    int-to-float p1, p2

    .line 109
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 110
    .line 111
    .line 112
    move-result p1

    .line 113
    mul-int/2addr p3, v3

    .line 114
    add-int/2addr p1, p3

    .line 115
    invoke-virtual {p4, p1}, Lcom/p1/mobile/putong/data/Picture;->calculatedWidth(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    invoke-virtual {p0, v2, p1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 120
    .line 121
    .line 122
    iget-object p0, p4, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 123
    .line 124
    invoke-static {p0}, Lcom/p1/mobile/putong/data/Media;->URL_TO_CACHEKEY(Ljava/lang/String;)Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    invoke-virtual {v2, p0}, Lv/VDraweeView;->setZoomAnimationKey(Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    :cond_2
    :goto_0
    return-void
.end method

.method public final n()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ptg;->l:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {p0, v0, v1}, Ll/ptg;->b(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/ptg;->o:Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;

    .line 8
    .line 9
    const/4 v0, -0x1

    .line 10
    const/4 v2, 0x0

    .line 11
    const-string v3, "feed_live_room_icon.svga"

    .line 12
    .line 13
    invoke-virtual {p0, v3, v0, v2, v1}, Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;->loadAnimWithListener(Ljava/lang/String;ILcom/tantanapp/media/ttmediaeffect/anim/AnimListener;Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
