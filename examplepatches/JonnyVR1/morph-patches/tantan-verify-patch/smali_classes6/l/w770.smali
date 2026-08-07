.class public Ll/w770;
.super Ll/f770;
.source "SourceFile"


# static fields
.field public static final f0:F


# instance fields
.field public Y:I

.field public Z:Landroid/view/View;

.field public a0:Landroid/view/View;

.field public b0:Lcom/p1/mobile/putong/data/User;

.field public c0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

.field public d0:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveView;

.field public e0:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    invoke-static {}, Ll/bnl0;->y0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    const v1, 0x3f19999a    # 0.6f

    .line 7
    .line 8
    .line 9
    mul-float/2addr v0, v1

    .line 10
    sput v0, Ll/w770;->f0:F

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/f770;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/w770;->Y:I

    .line 6
    .line 7
    iput-boolean v0, p0, Ll/w770;->e0:Z

    .line 8
    .line 9
    return-void
.end method

.method public static L0(Ljava/util/List;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;)Z"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_0

    .line 3
    .line 4
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-lez v1, :cond_0

    .line 9
    .line 10
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->topicType:Ljava/lang/String;

    .line 17
    .line 18
    const-string v1, "topic_group"

    .line 19
    .line 20
    invoke-static {p0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-eqz p0, :cond_0

    .line 25
    .line 26
    const/4 p0, 0x1

    .line 27
    return p0

    .line 28
    :cond_0
    return v0
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object v0, v0, Ll/jka;->p0:Lrx/subjects/b;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->T:Ll/n570;

    .line 15
    .line 16
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 17
    .line 18
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 19
    .line 20
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->R:Z

    .line 21
    .line 22
    invoke-static {v3, p0}, Ll/ksg;->K(Ljava/lang/String;Z)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {v1, v2, p0}, Ll/n570;->B(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    new-instance v0, Ll/u770;

    .line 35
    .line 36
    invoke-direct {v0}, Ll/u770;-><init>()V

    .line 37
    .line 38
    .line 39
    new-instance v1, Ll/v770;

    .line 40
    .line 41
    invoke-direct {v1}, Ll/v770;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->H0:Ll/y20;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 10
    .line 11
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->H0:Ll/y20;

    .line 18
    .line 19
    new-instance v0, Ll/pf60;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 24
    .line 25
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 26
    .line 27
    invoke-direct {v0, p0, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    invoke-interface {p1, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public static synthetic l0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic m0(ZLcom/p1/mobile/putong/data/Followship;)V
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

.method public static synthetic n0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic o0(ZLcom/p1/mobile/putong/data/Followship;)V
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

.method public static synthetic p0(Ll/w770;Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/w770;->R0(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic q0(Ll/w770;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/w770;->M0()Z

    move-result p0

    return p0
.end method

.method public static synthetic r0(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p1, v0}, Ll/ksg;->K(Ljava/lang/String;Z)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    const-string v0, "e_emoji_comment"

    .line 9
    .line 10
    invoke-static {v0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->H0:Ll/y20;

    .line 14
    .line 15
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 22
    .line 23
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->H0:Ll/y20;

    .line 30
    .line 31
    new-instance v0, Ll/pf60;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 36
    .line 37
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 38
    .line 39
    invoke-direct {v0, p0, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    invoke-interface {p1, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    :cond_0
    return-void
.end method

.method public static synthetic s0(Ll/w770;Lcom/p1/mobile/putong/data/FollowshipStatus;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w770;->Q0(Lcom/p1/mobile/putong/data/FollowshipStatus;)V

    return-void
.end method

.method public static synthetic t0(Ll/w770;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/w770;->P0(Ljava/lang/String;Z)V

    return-void
.end method

.method public static synthetic u0(Ll/uxj0;)V
    .locals 0

    .line 1
    const-string p0, "\u64cd\u4f5c\u6210\u529f\uff0c\u5c06\u51cf\u5c11\u6b64\u7c7b\u52a8\u6001\u7684\u63a8\u8350"

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic v0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic w0(Ll/w770;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w770;->S0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic x0(Ll/w770;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/w770;->G0()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public A0(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)Landroid/view/View;
    .locals 4

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->T:Ll/n570;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return-object v1

    .line 7
    :cond_0
    invoke-virtual {v0}, Ll/n570;->p()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    return-object v1

    .line 14
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->T:Ll/n570;

    .line 15
    .line 16
    iget-object v0, v0, Ll/n570;->b:Ll/qn00;

    .line 17
    .line 18
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 19
    .line 20
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v0, v2}, Ll/qn00;->b(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PartialIdList;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    if-eqz v0, :cond_4

    .line 27
    .line 28
    iget-object v2, v0, Lcom/p1/mobile/putong/data/PartialIdList;->expouseIds:Ljava/util/List;

    .line 29
    .line 30
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-eqz v2, :cond_2

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_2
    sget-object v2, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 38
    .line 39
    iget-object v2, v2, Ll/jka;->H0:Ljava/util/Map;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PartialIdList;->expouseIds:Ljava/util/List;

    .line 42
    .line 43
    const/4 v3, 0x0

    .line 44
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    check-cast v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 53
    .line 54
    if-nez v0, :cond_3

    .line 55
    .line 56
    return-object v1

    .line 57
    :cond_3
    new-instance v1, Ll/rrg$a;

    .line 58
    .line 59
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    iget-object p0, p0, Ll/f770;->g:Landroid/widget/LinearLayout;

    .line 64
    .line 65
    invoke-direct {v1, v2, v0, p0}, Ll/rrg$a;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/MomentMessage;Landroid/view/ViewGroup;)V

    .line 66
    .line 67
    .line 68
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->T:Ll/n570;

    .line 69
    .line 70
    invoke-virtual {v1, p0}, Ll/rrg$a;->l(Ll/n570;)Ll/rrg$a;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 75
    .line 76
    invoke-virtual {p0, v0}, Ll/rrg$a;->j(Lcom/p1/mobile/putong/feed/data/Moment;)Ll/rrg$a;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 81
    .line 82
    iget-boolean v1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->R:Z

    .line 83
    .line 84
    invoke-static {v0, v1}, Ll/ksg;->K(Ljava/lang/String;Z)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-virtual {p0, v0}, Ll/rrg$a;->k(Ljava/lang/String;)Ll/rrg$a;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 93
    .line 94
    invoke-virtual {p0, p1}, Ll/rrg$a;->i(Ljava/lang/String;)Ll/rrg$a;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    invoke-virtual {p0}, Ll/rrg$a;->h()Landroid/view/View;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    return-object p0

    .line 103
    :cond_4
    :goto_0
    return-object v1
.end method

.method public B0(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)Landroid/view/View;
    .locals 6

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/data/Moment;->getTopicList()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-eqz v2, :cond_0

    .line 17
    .line 18
    invoke-interface {v1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 24
    .line 25
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/data/GroupIdBox;->id:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    const/4 v3, 0x0

    .line 32
    if-nez v2, :cond_1

    .line 33
    .line 34
    invoke-static {v1}, Ll/w770;->L0(Ljava/util/List;)Z

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    if-nez v2, :cond_1

    .line 39
    .line 40
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 41
    .line 42
    invoke-static {v2}, Ll/ksg;->s(Ljava/lang/String;)Z

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    if-eqz v2, :cond_1

    .line 47
    .line 48
    new-instance v2, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 49
    .line 50
    invoke-direct {v2}, Lcom/p1/mobile/putong/feed/data/TopicMoment;-><init>()V

    .line 51
    .line 52
    .line 53
    const/4 v4, 0x1

    .line 54
    invoke-virtual {v2, v4}, Lcom/p1/mobile/putong/feed/data/TopicMoment;->setEnterGroup(Z)V

    .line 55
    .line 56
    .line 57
    new-instance v4, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    const-string v5, "\u6765\u81ea"

    .line 60
    .line 61
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    iget-object v5, v0, Lcom/p1/mobile/putong/feed/data/GroupIdBox;->name:Ljava/lang/String;

    .line 65
    .line 66
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    const-string v5, "\u5708\u5b50"

    .line 70
    .line 71
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v4

    .line 78
    iput-object v4, v2, Lcom/p1/mobile/putong/feed/data/TopicMoment;->name:Ljava/lang/String;

    .line 79
    .line 80
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/GroupIdBox;->id:Ljava/lang/String;

    .line 81
    .line 82
    iput-object v0, v2, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 83
    .line 84
    const-string v0, "topic_group"

    .line 85
    .line 86
    iput-object v0, v2, Lcom/p1/mobile/putong/feed/data/TopicMoment;->topicType:Ljava/lang/String;

    .line 87
    .line 88
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 89
    .line 90
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 91
    .line 92
    iput-object v0, v2, Lcom/p1/mobile/putong/feed/data/TopicMoment;->momentId:Ljava/lang/String;

    .line 93
    .line 94
    invoke-interface {v1, v3, v2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 95
    .line 96
    .line 97
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 98
    .line 99
    const-string v2, "from_live_square_tab"

    .line 100
    .line 101
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-eqz v0, :cond_2

    .line 106
    .line 107
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 108
    .line 109
    .line 110
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 111
    .line 112
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    if-eqz v0, :cond_3

    .line 117
    .line 118
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 119
    .line 120
    if-eqz v0, :cond_3

    .line 121
    .line 122
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->liveCircleExtInfo:Lcom/p1/mobile/putong/feed/data/LiveCircleExtInfo;

    .line 123
    .line 124
    if-eqz v0, :cond_3

    .line 125
    .line 126
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/LiveCircleExtInfo;->tags:Ljava/util/List;

    .line 127
    .line 128
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 129
    .line 130
    .line 131
    move-result v0

    .line 132
    if-nez v0, :cond_3

    .line 133
    .line 134
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 135
    .line 136
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->liveCircleExtInfo:Lcom/p1/mobile/putong/feed/data/LiveCircleExtInfo;

    .line 137
    .line 138
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/LiveCircleExtInfo;->tags:Ljava/util/List;

    .line 139
    .line 140
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 145
    .line 146
    .line 147
    move-result v2

    .line 148
    if-eqz v2, :cond_3

    .line 149
    .line 150
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    check-cast v2, Lcom/p1/mobile/putong/feed/data/LiveCircleExtTag;

    .line 155
    .line 156
    new-instance v4, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 157
    .line 158
    invoke-direct {v4}, Lcom/p1/mobile/putong/feed/data/TopicMoment;-><init>()V

    .line 159
    .line 160
    .line 161
    invoke-virtual {v4, v3}, Lcom/p1/mobile/putong/feed/data/TopicMoment;->setEnterGroup(Z)V

    .line 162
    .line 163
    .line 164
    iget-object v5, v2, Lcom/p1/mobile/putong/feed/data/LiveCircleExtTag;->tagName:Ljava/lang/String;

    .line 165
    .line 166
    iput-object v5, v4, Lcom/p1/mobile/putong/feed/data/TopicMoment;->name:Ljava/lang/String;

    .line 167
    .line 168
    const-string v5, "live_square"

    .line 169
    .line 170
    iput-object v5, v4, Lcom/p1/mobile/putong/feed/data/TopicMoment;->topicType:Ljava/lang/String;

    .line 171
    .line 172
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/LiveCircleExtTag;->tagUrl:Ljava/lang/String;

    .line 173
    .line 174
    iput-object v2, v4, Lcom/p1/mobile/putong/feed/data/TopicMoment;->icon:Ljava/lang/String;

    .line 175
    .line 176
    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 177
    .line 178
    .line 179
    goto :goto_0

    .line 180
    :cond_3
    new-instance v0, Ll/srg$a;

    .line 181
    .line 182
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 183
    .line 184
    .line 185
    move-result-object v2

    .line 186
    iget-object v3, p0, Ll/f770;->g:Landroid/widget/LinearLayout;

    .line 187
    .line 188
    invoke-direct {v0, v2, v1, v3}, Ll/srg$a;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/util/List;Landroid/view/ViewGroup;)V

    .line 189
    .line 190
    .line 191
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 192
    .line 193
    iget-boolean v2, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->R:Z

    .line 194
    .line 195
    invoke-static {v1, v2}, Ll/ksg;->K(Ljava/lang/String;Z)Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object v1

    .line 199
    invoke-virtual {v0, v1}, Ll/srg$a;->j(Ljava/lang/String;)Ll/srg$a;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 204
    .line 205
    invoke-virtual {v0, v1}, Ll/srg$a;->i(Ljava/lang/String;)Ll/srg$a;

    .line 206
    .line 207
    .line 208
    move-result-object v0

    .line 209
    invoke-virtual {v0}, Ll/srg$a;->h()Landroid/view/View;

    .line 210
    .line 211
    .line 212
    move-result-object v0

    .line 213
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 214
    .line 215
    .line 216
    move-result v1

    .line 217
    if-eqz v1, :cond_5

    .line 218
    .line 219
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 220
    .line 221
    .line 222
    move-result-object v1

    .line 223
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 224
    .line 225
    .line 226
    move-result v1

    .line 227
    if-eqz v1, :cond_5

    .line 228
    .line 229
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 230
    .line 231
    .line 232
    move-result-object v1

    .line 233
    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 234
    .line 235
    invoke-static {}, Ll/cmg;->C0()Z

    .line 236
    .line 237
    .line 238
    move-result v2

    .line 239
    if-eqz v2, :cond_4

    .line 240
    .line 241
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 242
    .line 243
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 244
    .line 245
    .line 246
    move-result v2

    .line 247
    if-eqz v2, :cond_4

    .line 248
    .line 249
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 250
    .line 251
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->mediaRepeatIndexList:Ljava/util/List;

    .line 252
    .line 253
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 254
    .line 255
    .line 256
    move-result p1

    .line 257
    if-nez p1, :cond_4

    .line 258
    .line 259
    iget p1, v1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 260
    .line 261
    const/high16 v1, 0x40800000    # 4.0f

    .line 262
    .line 263
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 264
    .line 265
    .line 266
    move-result v1

    .line 267
    sub-int/2addr p1, v1

    .line 268
    goto :goto_1

    .line 269
    :cond_4
    iget p1, v1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 270
    .line 271
    :goto_1
    invoke-static {v0, p1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 272
    .line 273
    .line 274
    :cond_5
    invoke-virtual {p0}, Ll/w770;->y0()V

    .line 275
    .line 276
    .line 277
    return-object v0
.end method

.method public final C0(Z)V
    .locals 7

    .line 1
    invoke-virtual {p0, p1}, Ll/w770;->N0(Z)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x1

    .line 6
    const/4 v1, 0x0

    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    iget-object p1, p0, Ll/f770;->G:Lv/VLinear;

    .line 10
    .line 11
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    iget-object p1, p0, Ll/f770;->G:Lv/VLinear;

    .line 18
    .line 19
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object p1, p0, Ll/f770;->D:Lv/VLinear;

    .line 23
    .line 24
    iget-object v0, p0, Ll/f770;->G:Lv/VLinear;

    .line 25
    .line 26
    iget-object v2, p0, Ll/f770;->E:Lv/VImage;

    .line 27
    .line 28
    iget-object v3, p0, Ll/f770;->F:Landroid/widget/TextView;

    .line 29
    .line 30
    invoke-static {p1, v0, v2, v3}, Ll/h9i;->b(Landroid/view/View;Landroid/view/View;Lv/VImage;Landroid/widget/TextView;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Ll/w770;->W0()V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Ll/f770;->I:Landroid/widget/TextView;

    .line 37
    .line 38
    iget-object v0, p0, Ll/w770;->c0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->n5:I

    .line 45
    .line 46
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Ll/f770;->H:Lv/VImage;

    .line 54
    .line 55
    sget v0, Ll/lbc0;->g4:I

    .line 56
    .line 57
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Ll/f770;->G:Lv/VLinear;

    .line 61
    .line 62
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    const/high16 v0, 0x42800000    # 64.0f

    .line 67
    .line 68
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    iput v0, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 73
    .line 74
    iget-object v0, p0, Ll/f770;->G:Lv/VLinear;

    .line 75
    .line 76
    invoke-virtual {v0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 77
    .line 78
    .line 79
    goto/16 :goto_3

    .line 80
    .line 81
    :cond_1
    invoke-virtual {p0}, Ll/w770;->O0()Z

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    if-eqz p1, :cond_5

    .line 86
    .line 87
    iget-object p1, p0, Ll/f770;->I:Landroid/widget/TextView;

    .line 88
    .line 89
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    invoke-interface {v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->a()Ll/tq8;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-interface {v1}, Ll/tq8;->I5()Z

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    if-eqz v1, :cond_2

    .line 102
    .line 103
    const-string v1, "\u62a2\u5148\u544a\u767d"

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_2
    iget-object v1, p0, Ll/w770;->c0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 107
    .line 108
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->Q0:I

    .line 113
    .line 114
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    :goto_0
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 119
    .line 120
    .line 121
    iget-object p1, p0, Ll/f770;->H:Lv/VImage;

    .line 122
    .line 123
    sget v1, Ll/lbc0;->i4:I

    .line 124
    .line 125
    invoke-virtual {p1, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 126
    .line 127
    .line 128
    iget-object p1, p0, Ll/f770;->G:Lv/VLinear;

    .line 129
    .line 130
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    invoke-interface {v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->a()Ll/tq8;

    .line 139
    .line 140
    .line 141
    move-result-object v1

    .line 142
    invoke-interface {v1}, Ll/tq8;->I5()Z

    .line 143
    .line 144
    .line 145
    move-result v1

    .line 146
    if-eqz v1, :cond_3

    .line 147
    .line 148
    const/high16 v1, 0x42a60000    # 83.0f

    .line 149
    .line 150
    :goto_1
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 151
    .line 152
    .line 153
    move-result v1

    .line 154
    goto :goto_2

    .line 155
    :cond_3
    const/high16 v1, 0x429c0000    # 78.0f

    .line 156
    .line 157
    goto :goto_1

    .line 158
    :goto_2
    iput v1, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 159
    .line 160
    iget-object v1, p0, Ll/f770;->G:Lv/VLinear;

    .line 161
    .line 162
    invoke-virtual {v1, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 163
    .line 164
    .line 165
    iget-object p1, p0, Ll/f770;->G:Lv/VLinear;

    .line 166
    .line 167
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 168
    .line 169
    .line 170
    move-result p1

    .line 171
    if-nez p1, :cond_4

    .line 172
    .line 173
    iget-object p1, p0, Ll/f770;->G:Lv/VLinear;

    .line 174
    .line 175
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 176
    .line 177
    .line 178
    :cond_4
    iget-object p1, p0, Ll/f770;->D:Lv/VLinear;

    .line 179
    .line 180
    iget-object v1, p0, Ll/f770;->G:Lv/VLinear;

    .line 181
    .line 182
    iget-object v2, p0, Ll/f770;->E:Lv/VImage;

    .line 183
    .line 184
    iget-object v3, p0, Ll/f770;->F:Landroid/widget/TextView;

    .line 185
    .line 186
    invoke-static {p1, v1, v2, v3}, Ll/h9i;->b(Landroid/view/View;Landroid/view/View;Lv/VImage;Landroid/widget/TextView;)V

    .line 187
    .line 188
    .line 189
    invoke-virtual {p0}, Ll/w770;->W0()V

    .line 190
    .line 191
    .line 192
    goto :goto_4

    .line 193
    :cond_5
    iget-object p1, p0, Ll/f770;->G:Lv/VLinear;

    .line 194
    .line 195
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 196
    .line 197
    .line 198
    iget-object p1, p0, Ll/f770;->D:Lv/VLinear;

    .line 199
    .line 200
    iget-object v0, p0, Ll/f770;->E:Lv/VImage;

    .line 201
    .line 202
    iget-object v2, p0, Ll/f770;->F:Landroid/widget/TextView;

    .line 203
    .line 204
    invoke-static {p1, v0, v2}, Ll/h9i;->c(Landroid/view/View;Lv/VImage;Landroid/widget/TextView;)V

    .line 205
    .line 206
    .line 207
    :goto_3
    move v0, v1

    .line 208
    :goto_4
    iget-object v1, p0, Ll/f770;->x:Lv/VRelative;

    .line 209
    .line 210
    iget-object v2, p0, Ll/f770;->D:Lv/VLinear;

    .line 211
    .line 212
    iget-object v3, p0, Ll/f770;->z:Lv/VImage;

    .line 213
    .line 214
    iget-object v4, p0, Ll/f770;->C:Lcom/tantan/library/svga/SVGAnimationView;

    .line 215
    .line 216
    iget-object v5, p0, Ll/f770;->B:Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;

    .line 217
    .line 218
    iget-object p1, p0, Ll/w770;->c0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 219
    .line 220
    iget-object v6, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 221
    .line 222
    invoke-static/range {v1 .. v6}, Ll/h9i;->d(Landroid/view/View;Landroid/view/View;Lv/VImage;Lcom/tantan/library/svga/SVGAnimationView;Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;Ljava/lang/String;)V

    .line 223
    .line 224
    .line 225
    invoke-virtual {p0}, Ll/w770;->T0()Z

    .line 226
    .line 227
    .line 228
    move-result p1

    .line 229
    iget-object v1, p0, Ll/f770;->L:Landroid/widget/ImageView;

    .line 230
    .line 231
    if-eqz p1, :cond_6

    .line 232
    .line 233
    invoke-static {v1}, Ll/h9i;->e(Landroid/widget/ImageView;)V

    .line 234
    .line 235
    .line 236
    goto :goto_5

    .line 237
    :cond_6
    invoke-static {v1}, Ll/h9i;->j(Landroid/widget/ImageView;)V

    .line 238
    .line 239
    .line 240
    :goto_5
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 241
    .line 242
    .line 243
    move-result-object p1

    .line 244
    invoke-interface {p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->a()Ll/tq8;

    .line 245
    .line 246
    .line 247
    move-result-object p1

    .line 248
    invoke-interface {p1}, Ll/tq8;->I5()Z

    .line 249
    .line 250
    .line 251
    move-result p1

    .line 252
    if-eqz p1, :cond_7

    .line 253
    .line 254
    if-eqz v0, :cond_7

    .line 255
    .line 256
    iget-object p0, p0, Ll/f770;->H:Lv/VImage;

    .line 257
    .line 258
    sget p1, Ll/lbc0;->W1:I

    .line 259
    .line 260
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 261
    .line 262
    .line 263
    :cond_7
    return-void
.end method

.method public final D0(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/w770;->c0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 4
    .line 5
    const-string v1, "from_live_square_tab"

    .line 6
    .line 7
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_2

    .line 12
    .line 13
    if-eqz p1, :cond_2

    .line 14
    .line 15
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->liveCircleExtInfo:Lcom/p1/mobile/putong/feed/data/LiveCircleExtInfo;

    .line 16
    .line 17
    if-eqz v0, :cond_2

    .line 18
    .line 19
    iget-object v0, p0, Ll/f770;->G:Lv/VLinear;

    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->liveCircleExtInfo:Lcom/p1/mobile/putong/feed/data/LiveCircleExtInfo;

    .line 26
    .line 27
    iget p1, p1, Lcom/p1/mobile/putong/feed/data/LiveCircleExtInfo;->views:I

    .line 28
    .line 29
    iget-object v0, p0, Ll/f770;->I:Landroid/widget/TextView;

    .line 30
    .line 31
    if-lez p1, :cond_0

    .line 32
    .line 33
    invoke-static {p1}, Ll/q8g0;->h0(I)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    const-string p1, "1"

    .line 42
    .line 43
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 44
    .line 45
    .line 46
    :goto_0
    iget-object p1, p0, Ll/f770;->H:Lv/VImage;

    .line 47
    .line 48
    sget v0, Ll/lbc0;->l4:I

    .line 49
    .line 50
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Ll/f770;->G:Lv/VLinear;

    .line 54
    .line 55
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    const/high16 v0, 0x429c0000    # 78.0f

    .line 60
    .line 61
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    iput v0, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 66
    .line 67
    iget-object v0, p0, Ll/f770;->G:Lv/VLinear;

    .line 68
    .line 69
    invoke-virtual {v0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 70
    .line 71
    .line 72
    iget-object p1, p0, Ll/f770;->G:Lv/VLinear;

    .line 73
    .line 74
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    if-nez p1, :cond_1

    .line 79
    .line 80
    iget-object p1, p0, Ll/f770;->G:Lv/VLinear;

    .line 81
    .line 82
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 83
    .line 84
    .line 85
    :cond_1
    iget-object p1, p0, Ll/f770;->D:Lv/VLinear;

    .line 86
    .line 87
    iget-object v0, p0, Ll/f770;->G:Lv/VLinear;

    .line 88
    .line 89
    iget-object v1, p0, Ll/f770;->E:Lv/VImage;

    .line 90
    .line 91
    iget-object p0, p0, Ll/f770;->F:Landroid/widget/TextView;

    .line 92
    .line 93
    invoke-static {p1, v0, v1, p0}, Ll/h9i;->b(Landroid/view/View;Landroid/view/View;Lv/VImage;Landroid/widget/TextView;)V

    .line 94
    .line 95
    .line 96
    :cond_2
    return-void
.end method

.method public E0(ZZ)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Ll/w770;->I0(Z)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p2}, Ll/w770;->H0(Z)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    iget-object v0, p0, Ll/w770;->c0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 10
    .line 11
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ll/w770;->J0(Lcom/p1/mobile/putong/feed/data/Moment;)[Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {v1, p0}, Ll/ksg;->i(Ljava/lang/String;[Ll/pf60;)[Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {p2, p1, p0}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 24
    .line 25
    .line 26
    return-object p1
.end method

.method public F0(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)V
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    new-instance v1, Ll/q770;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/q770;-><init>(Ll/w770;)V

    .line 6
    .line 7
    .line 8
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v0, v1, v2}, Ll/rzi;->U(Lcom/p1/mobile/putong/feed/data/Moment;Ll/pcj;Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/w770;->G0()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 21
    .line 22
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->R2:I

    .line 27
    .line 28
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_0

    .line 37
    .line 38
    const/4 v0, 0x0

    .line 39
    invoke-virtual {p0, v0}, Ll/w770;->I0(Z)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 44
    .line 45
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 46
    .line 47
    invoke-virtual {p0, p1}, Ll/w770;->J0(Lcom/p1/mobile/putong/feed/data/Moment;)[Ll/pf60;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-static {v1, p0}, Ll/ksg;->i(Ljava/lang/String;[Ll/pf60;)[Ll/pf60;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    const-string p1, "e_follow"

    .line 56
    .line 57
    invoke-static {p1, v0, p0}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 58
    .line 59
    .line 60
    :cond_0
    return-void
.end method

.method public final G0()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/w770;->b0:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Ll/w770;->b0:Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 16
    .line 17
    const-string v1, "following"

    .line 18
    .line 19
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-nez v1, :cond_0

    .line 24
    .line 25
    const-string v1, "matched"

    .line 26
    .line 27
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    :cond_0
    iget-object p0, p0, Ll/w770;->c0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->b:I

    .line 44
    .line 45
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    return-object p0

    .line 50
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 51
    .line 52
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->R2:I

    .line 57
    .line 58
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0
.end method

.method public final H0(Z)Ljava/lang/String;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string p0, "e_follow"

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "e_cancelfollow"

    .line 7
    .line 8
    return-object p0
.end method

.method public final I0(Z)Ljava/lang/String;
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Ll/w770;->c0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 6
    .line 7
    const-string v1, "from_discover_discussion"

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const-string p1, "p_discover_discussion"

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    if-nez p1, :cond_1

    .line 19
    .line 20
    iget-object v0, p0, Ll/w770;->c0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 23
    .line 24
    const-string v1, "from_discover_dating"

    .line 25
    .line 26
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    const-string p1, "p_discover_dating"

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    if-nez p1, :cond_2

    .line 36
    .line 37
    iget-object v0, p0, Ll/w770;->c0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 40
    .line 41
    const-string v1, "from_activity_tab_one"

    .line 42
    .line 43
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_2

    .line 48
    .line 49
    invoke-static {v1}, Ll/pu20;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    goto :goto_0

    .line 54
    :cond_2
    if-nez p1, :cond_3

    .line 55
    .line 56
    iget-object p1, p0, Ll/w770;->c0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 57
    .line 58
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 59
    .line 60
    const-string v0, "from_activity_tab_two"

    .line 61
    .line 62
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    if-eqz p1, :cond_3

    .line 67
    .line 68
    invoke-static {v0}, Ll/pu20;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    goto :goto_0

    .line 73
    :cond_3
    const-string p1, ""

    .line 74
    .line 75
    :goto_0
    iget-object v0, p0, Ll/w770;->c0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 76
    .line 77
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 78
    .line 79
    const-string v1, "from_group_detail_recommend"

    .line 80
    .line 81
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-nez v0, :cond_4

    .line 86
    .line 87
    iget-object v0, p0, Ll/w770;->c0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 88
    .line 89
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 90
    .line 91
    const-string v1, "from_group_detail_new"

    .line 92
    .line 93
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    if-eqz v0, :cond_5

    .line 98
    .line 99
    :cond_4
    const-string p1, "p_circle_detail"

    .line 100
    .line 101
    :cond_5
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-eqz v0, :cond_6

    .line 106
    .line 107
    iget-object v0, p0, Ll/w770;->c0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 108
    .line 109
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    if-eqz v0, :cond_6

    .line 118
    .line 119
    iget-object p0, p0, Ll/w770;->c0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 120
    .line 121
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    return-object p0

    .line 130
    :cond_6
    return-object p1
.end method

.method public final J0(Lcom/p1/mobile/putong/feed/data/Moment;)[Ll/pf60;
    .locals 5

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    new-array p0, v0, [Ll/pf60;

    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_0
    new-instance p0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    new-instance v1, Ll/pf60;

    .line 17
    .line 18
    const-string v2, "owner_id"

    .line 19
    .line 20
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 21
    .line 22
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    new-instance v1, Ll/pf60;

    .line 29
    .line 30
    iget-boolean v2, p1, Lcom/p1/mobile/putong/feed/data/Moment;->isLive:Z

    .line 31
    .line 32
    const-string v3, ""

    .line 33
    .line 34
    if-eqz v2, :cond_1

    .line 35
    .line 36
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 37
    .line 38
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Live;->id:Ljava/lang/String;

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    move-object v2, v3

    .line 42
    :goto_0
    const-string v4, "liveId"

    .line 43
    .line 44
    invoke-direct {v1, v4, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    new-instance v1, Ll/pf60;

    .line 51
    .line 52
    iget-boolean v2, p1, Lcom/p1/mobile/putong/feed/data/Moment;->isLive:Z

    .line 53
    .line 54
    if-nez v2, :cond_2

    .line 55
    .line 56
    iget-object v3, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 57
    .line 58
    :cond_2
    const-string v2, "moment_id"

    .line 59
    .line 60
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    new-instance v1, Ll/pf60;

    .line 67
    .line 68
    iget-boolean v2, p1, Lcom/p1/mobile/putong/feed/data/Moment;->isLive:Z

    .line 69
    .line 70
    if-eqz v2, :cond_3

    .line 71
    .line 72
    const-string v2, "live"

    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_3
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-virtual {v2, p1}, Ll/er60;->y(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    :goto_1
    const-string v3, "moment_type"

    .line 84
    .line 85
    invoke-direct {v1, v3, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 86
    .line 87
    .line 88
    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    new-instance v1, Ll/pf60;

    .line 92
    .line 93
    const-string v2, "receiver_user_id"

    .line 94
    .line 95
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 96
    .line 97
    invoke-direct {v1, v2, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 98
    .line 99
    .line 100
    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    new-array p1, v0, [Ll/pf60;

    .line 104
    .line 105
    invoke-interface {p0, p1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    check-cast p0, [Ll/pf60;

    .line 110
    .line 111
    return-object p0
.end method

.method public final K0(Ljava/lang/String;)Z
    .locals 0

    .line 1
    const-string p0, "topic_recommend"

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_1

    .line 8
    .line 9
    const-string p0, "qa_recommend"

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_1

    .line 16
    .line 17
    const-string p0, "from_group_detail_recommend"

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-nez p0, :cond_1

    .line 24
    .line 25
    const-string p0, "from_group_detail_new"

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const/4 p0, 0x0

    .line 35
    return p0

    .line 36
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 37
    return p0
.end method

.method public final M0()Z
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
    iget-object v1, p0, Ll/w770;->c0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

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
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    const/4 v2, 0x0

    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    iget-boolean v0, v0, Ll/gj70$a;->a:Z

    .line 27
    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    iget-object v0, p0, Ll/w770;->c0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Ll/w770;->K0(Ljava/lang/String;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-nez v0, :cond_1

    .line 39
    .line 40
    iget-object v0, p0, Ll/w770;->c0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 41
    .line 42
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 43
    .line 44
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 45
    .line 46
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-nez v0, :cond_1

    .line 59
    .line 60
    iget-object v0, p0, Ll/w770;->b0:Lcom/p1/mobile/putong/data/User;

    .line 61
    .line 62
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 63
    .line 64
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-eqz v0, :cond_0

    .line 69
    .line 70
    iget-object p0, p0, Ll/w770;->b0:Lcom/p1/mobile/putong/data/User;

    .line 71
    .line 72
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 73
    .line 74
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 75
    .line 76
    const-string v0, "matched"

    .line 77
    .line 78
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    if-eqz p0, :cond_0

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_0
    const/4 p0, 0x1

    .line 86
    return p0

    .line 87
    :cond_1
    :goto_0
    return v2
.end method

.method public N(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/w770;->e0:Z

    .line 2
    .line 3
    return-void
.end method

.method public N0(Z)Z
    .locals 3

    .line 1
    invoke-static {}, Ll/cmg;->s()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_4

    .line 7
    .line 8
    iget-object v0, p0, Ll/w770;->c0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 11
    .line 12
    const-string v2, "from_discover_discussion"

    .line 13
    .line 14
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-static {}, Ll/pu20;->H()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_3

    .line 25
    .line 26
    :cond_0
    iget-object v0, p0, Ll/w770;->c0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 29
    .line 30
    const-string v2, "from_discover_dating"

    .line 31
    .line 32
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    invoke-static {}, Ll/pu20;->E()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_3

    .line 43
    .line 44
    :cond_1
    iget-object v0, p0, Ll/w770;->c0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 45
    .line 46
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 47
    .line 48
    const-string v2, "from_activity_tab_one"

    .line 49
    .line 50
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-eqz v0, :cond_2

    .line 55
    .line 56
    invoke-static {}, Ll/pu20;->E()Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_3

    .line 61
    .line 62
    :cond_2
    iget-object v0, p0, Ll/w770;->c0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 63
    .line 64
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 65
    .line 66
    const-string v2, "from_activity_tab_two"

    .line 67
    .line 68
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-eqz v0, :cond_4

    .line 73
    .line 74
    invoke-static {}, Ll/pu20;->E()Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-nez v0, :cond_4

    .line 79
    .line 80
    :cond_3
    return v1

    .line 81
    :cond_4
    invoke-static {}, Ll/cmg;->s()Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-eqz v0, :cond_5

    .line 86
    .line 87
    if-eqz p1, :cond_5

    .line 88
    .line 89
    sget-object p1, Ll/owi;->c:Ll/jxd0;

    .line 90
    .line 91
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    check-cast p1, Ljava/lang/Boolean;

    .line 96
    .line 97
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    if-eqz p1, :cond_5

    .line 102
    .line 103
    iget-object p1, p0, Ll/w770;->b0:Lcom/p1/mobile/putong/data/User;

    .line 104
    .line 105
    invoke-static {p1}, Ll/ksg;->n0(Lcom/p1/mobile/putong/data/User;)Z

    .line 106
    .line 107
    .line 108
    move-result p1

    .line 109
    if-nez p1, :cond_5

    .line 110
    .line 111
    iget-object p0, p0, Ll/w770;->c0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 112
    .line 113
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 114
    .line 115
    invoke-static {p0}, Ll/pu20;->C(Ljava/lang/String;)Z

    .line 116
    .line 117
    .line 118
    move-result p0

    .line 119
    if-eqz p0, :cond_5

    .line 120
    .line 121
    const/4 p0, 0x1

    .line 122
    return p0

    .line 123
    :cond_5
    return v1
.end method

.method public O0()Z
    .locals 3

    .line 1
    invoke-static {}, Ll/cmg;->s()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_3

    .line 7
    .line 8
    iget-object v0, p0, Ll/w770;->c0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 11
    .line 12
    const-string v2, "from_discover_discussion"

    .line 13
    .line 14
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-static {}, Ll/pu20;->H()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_3

    .line 25
    .line 26
    :cond_0
    iget-object v0, p0, Ll/w770;->c0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 29
    .line 30
    const-string v2, "from_discover_dating"

    .line 31
    .line 32
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    invoke-static {}, Ll/pu20;->E()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_3

    .line 43
    .line 44
    :cond_1
    iget-object v0, p0, Ll/w770;->c0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 45
    .line 46
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 47
    .line 48
    const-string v2, "from_activity_tab_one"

    .line 49
    .line 50
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-eqz v0, :cond_2

    .line 55
    .line 56
    invoke-static {}, Ll/pu20;->E()Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_3

    .line 61
    .line 62
    :cond_2
    iget-object p0, p0, Ll/w770;->c0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 63
    .line 64
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 65
    .line 66
    const-string v0, "from_activity_tab_two"

    .line 67
    .line 68
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    if-eqz p0, :cond_3

    .line 73
    .line 74
    invoke-static {}, Ll/pu20;->E()Z

    .line 75
    .line 76
    .line 77
    :cond_3
    return v1
.end method

.method public final synthetic P0(Ljava/lang/String;Z)V
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
    iget-object p0, p0, Ll/w770;->b0:Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {v0, v1, p0, v2, p1}, Ll/jka;->m7(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    new-instance p1, Ll/l770;

    .line 19
    .line 20
    invoke-direct {p1, p2}, Ll/l770;-><init>(Z)V

    .line 21
    .line 22
    .line 23
    new-instance p2, Ll/m770;

    .line 24
    .line 25
    invoke-direct {p2}, Ll/m770;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-static {p1, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final synthetic Q0(Lcom/p1/mobile/putong/data/FollowshipStatus;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/w770;->U0(Lcom/p1/mobile/putong/data/FollowshipStatus;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic R0(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Landroid/view/View;)V
    .locals 10

    .line 1
    iget-object p2, p0, Ll/w770;->b0:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    const-string p0, "user is null error!"

    .line 6
    .line 7
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 12
    .line 13
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    if-eqz p2, :cond_1

    .line 18
    .line 19
    iget-object p2, p0, Ll/w770;->b0:Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 22
    .line 23
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    const/4 p2, 0x0

    .line 27
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 28
    .line 29
    new-instance v1, Ll/p770;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/p770;-><init>(Ll/w770;)V

    .line 32
    .line 33
    .line 34
    new-instance v2, Ll/q770;

    .line 35
    .line 36
    invoke-direct {v2, p0}, Ll/q770;-><init>(Ll/w770;)V

    .line 37
    .line 38
    .line 39
    new-instance v3, Ll/r770;

    .line 40
    .line 41
    invoke-direct {v3, p0, p2}, Ll/r770;-><init>(Ll/w770;Lcom/p1/mobile/putong/data/FollowshipStatus;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->getController()Ll/n570;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    new-instance v4, Ll/rk00;

    .line 52
    .line 53
    invoke-direct {v4, p2}, Ll/rk00;-><init>(Ll/n570;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->getController()Ll/n570;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    iget-object v5, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 61
    .line 62
    iget-object v5, v5, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {p2, v5}, Ll/n570;->m(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 65
    .line 66
    .line 67
    move-result-object v5

    .line 68
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 69
    .line 70
    .line 71
    move-result-object v6

    .line 72
    iget-object v7, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 73
    .line 74
    new-instance v9, Ll/s770;

    .line 75
    .line 76
    invoke-direct {v9, p1}, Ll/s770;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)V

    .line 77
    .line 78
    .line 79
    const/4 v8, 0x0

    .line 80
    invoke-static/range {v0 .. v9}, Ll/rzi;->S(Lcom/p1/mobile/putong/feed/data/Moment;Ll/pcj;Ll/pcj;Ll/x20;Ll/qcj;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZLl/x20;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0, p1}, Ll/w770;->F0(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public final synthetic S0(Landroid/view/View;)V
    .locals 11

    .line 1
    iget-object p1, p0, Ll/f770;->N:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 v0, 0x1

    .line 8
    const/4 v1, 0x0

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Ll/f770;->P:Lv/VText;

    .line 12
    .line 13
    invoke-virtual {p1}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    const-string v2, "\u901a\u8fc7\u52a8\u6001\u6253\u62db\u547c\uff0c\u66f4\u5bb9\u6613\u5f97\u5230\u56de\u590d"

    .line 22
    .line 23
    invoke-static {p1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    move p1, v0

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    move p1, v1

    .line 32
    :goto_0
    iget-object v2, p0, Ll/f770;->I:Landroid/widget/TextView;

    .line 33
    .line 34
    invoke-virtual {v2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    iget-object v3, p0, Ll/w770;->c0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 43
    .line 44
    invoke-virtual {v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    sget v4, Lcom/p1/mobile/putong/feed/R$string;->Q0:I

    .line 49
    .line 50
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    if-nez v2, :cond_3

    .line 59
    .line 60
    iget-object v2, p0, Ll/f770;->I:Landroid/widget/TextView;

    .line 61
    .line 62
    invoke-virtual {v2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    const-string v3, "\u62a2\u5148\u544a\u767d"

    .line 71
    .line 72
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    if-eqz v2, :cond_1

    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_1
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    iget-object v2, p0, Ll/w770;->c0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 84
    .line 85
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 86
    .line 87
    invoke-virtual {p0, v1}, Ll/w770;->I0(Z)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    invoke-virtual {v0, v2, v3, v1, p1}, Ll/er60;->s(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ZZ)V

    .line 92
    .line 93
    .line 94
    iget-object p1, p0, Ll/w770;->b0:Lcom/p1/mobile/putong/data/User;

    .line 95
    .line 96
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    if-eqz p1, :cond_2

    .line 101
    .line 102
    iget-object p1, p0, Ll/w770;->c0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 103
    .line 104
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    iget-object v0, p0, Ll/w770;->c0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 109
    .line 110
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    iget-object p0, p0, Ll/w770;->b0:Lcom/p1/mobile/putong/data/User;

    .line 115
    .line 116
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 117
    .line 118
    invoke-static {v0, p0, v1, v1}, Ll/orb0;->c(Landroid/content/Context;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 123
    .line 124
    .line 125
    :cond_2
    return-void

    .line 126
    :cond_3
    :goto_1
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 127
    .line 128
    .line 129
    move-result-object v2

    .line 130
    iget-object v3, p0, Ll/w770;->c0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 131
    .line 132
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 133
    .line 134
    invoke-virtual {p0, v1}, Ll/w770;->I0(Z)Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v4

    .line 138
    invoke-virtual {v2, v3, v4, v0, p1}, Ll/er60;->s(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ZZ)V

    .line 139
    .line 140
    .line 141
    sget-object v5, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 142
    .line 143
    iget-object p1, p0, Ll/w770;->c0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 144
    .line 145
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 146
    .line 147
    .line 148
    move-result-object v6

    .line 149
    iget-object v7, p0, Ll/w770;->b0:Lcom/p1/mobile/putong/data/User;

    .line 150
    .line 151
    iget-object p1, p0, Ll/w770;->c0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 152
    .line 153
    iget-object v8, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 154
    .line 155
    invoke-virtual {p0, v1}, Ll/w770;->I0(Z)Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object v9

    .line 159
    iget-object p0, p0, Ll/w770;->c0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 160
    .line 161
    iget-boolean v10, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->S:Z

    .line 162
    .line 163
    invoke-virtual/range {v5 .. v10}, Lcom/p1/mobile/putong/feed/api/b;->f3(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Z)V

    .line 164
    .line 165
    .line 166
    return-void
.end method

.method public T0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w770;->c0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->isLive:Z

    .line 6
    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    return p0
.end method

.method public final U0(Lcom/p1/mobile/putong/data/FollowshipStatus;Z)V
    .locals 7

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    const-string v0, "following"

    .line 8
    .line 9
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    const-string v0, "matched"

    .line 16
    .line 17
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    :cond_0
    const/4 p1, 0x0

    .line 24
    invoke-virtual {p0, p2, p1}, Ll/w770;->E0(ZZ)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iget-object v0, p0, Ll/w770;->c0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 35
    .line 36
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->z:I

    .line 41
    .line 42
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    new-instance v2, Ll/i770;

    .line 47
    .line 48
    invoke-direct {v2, p0, p1, p2}, Ll/i770;-><init>(Ll/w770;Ljava/lang/String;Z)V

    .line 49
    .line 50
    .line 51
    invoke-static {v0, v1, v2}, Ll/k3h;->v0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_1
    const/4 p1, 0x1

    .line 56
    invoke-virtual {p0, p2, p1}, Ll/w770;->E0(ZZ)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v6

    .line 60
    iget-object p1, p0, Ll/w770;->b0:Lcom/p1/mobile/putong/data/User;

    .line 61
    .line 62
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 63
    .line 64
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->moments:Lcom/p1/mobile/putong/data/Moments;

    .line 65
    .line 66
    iget-boolean v0, v0, Lcom/p1/mobile/putong/data/Moments;->hidePublicMoments:Z

    .line 67
    .line 68
    if-eqz v0, :cond_2

    .line 69
    .line 70
    invoke-static {p1}, Lcom/p1/mobile/putong/data/User;->isMatched(Lcom/p1/mobile/putong/data/User;)Z

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    if-nez p1, :cond_2

    .line 75
    .line 76
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->q:I

    .line 77
    .line 78
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 83
    .line 84
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    iget-object v2, p0, Ll/w770;->b0:Lcom/p1/mobile/putong/data/User;

    .line 93
    .line 94
    iget-object p0, p0, Ll/w770;->c0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 95
    .line 96
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 97
    .line 98
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->isLive:Z

    .line 99
    .line 100
    const-string v3, ""

    .line 101
    .line 102
    if-eqz p1, :cond_3

    .line 103
    .line 104
    const-string v4, "liveMomentNearby"

    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_3
    move-object v4, v3

    .line 108
    :goto_0
    if-eqz p1, :cond_4

    .line 109
    .line 110
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 111
    .line 112
    iget-object v3, p0, Lcom/p1/mobile/putong/data/Live;->id:Ljava/lang/String;

    .line 113
    .line 114
    :cond_4
    move-object v5, v3

    .line 115
    const/4 v3, 0x1

    .line 116
    invoke-virtual/range {v0 .. v6}, Ll/jka;->n7(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    new-instance p1, Ll/j770;

    .line 121
    .line 122
    invoke-direct {p1, p2}, Ll/j770;-><init>(Z)V

    .line 123
    .line 124
    .line 125
    new-instance p2, Ll/k770;

    .line 126
    .line 127
    invoke-direct {p2}, Ll/k770;-><init>()V

    .line 128
    .line 129
    .line 130
    invoke-static {p1, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 135
    .line 136
    .line 137
    return-void
.end method

.method public V0(Ljava/lang/String;)Z
    .locals 0

    .line 1
    const-string p0, "from_discover_dating"

    .line 2
    .line 3
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_1

    .line 8
    .line 9
    const-string p0, "from_nearby_focus"

    .line 10
    .line 11
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_1

    .line 16
    .line 17
    const-string p0, "from_like"

    .line 18
    .line 19
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return p0

    .line 28
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 29
    return p0
.end method

.method public W0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/f770;->G:Lv/VLinear;

    .line 2
    .line 3
    new-instance v1, Ll/t770;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/t770;-><init>(Ll/w770;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/ksg;->G0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public bridge synthetic a(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/w770;->d0(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public bridge synthetic b(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/w770;->c0(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public c0(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)Z
    .locals 3

    .line 1
    invoke-super {p0, p1}, Ll/f770;->c0(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Ll/f770;->L:Landroid/widget/ImageView;

    .line 6
    .line 7
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 8
    .line 9
    invoke-static {v2}, Ll/ksg;->V(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-nez v2, :cond_0

    .line 14
    .line 15
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 16
    .line 17
    iget-boolean v2, v2, Lcom/p1/mobile/putong/feed/data/Moment;->isLive:Z

    .line 18
    .line 19
    if-nez v2, :cond_0

    .line 20
    .line 21
    const/4 v2, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 v2, 0x0

    .line 24
    :goto_0
    invoke-virtual {p0, v1, v2}, Ll/f770;->U(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    invoke-static {}, Ll/j4h;->f()Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_2

    .line 32
    .line 33
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 34
    .line 35
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_2

    .line 40
    .line 41
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 42
    .line 43
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-nez v1, :cond_2

    .line 58
    .line 59
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 60
    .line 61
    const-string v2, "from_discover_dating"

    .line 62
    .line 63
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    if-nez v1, :cond_1

    .line 68
    .line 69
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 70
    .line 71
    const-string v2, "from_nearby_falls_feed"

    .line 72
    .line 73
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    if-nez v1, :cond_1

    .line 78
    .line 79
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 80
    .line 81
    const-string v2, "from_album"

    .line 82
    .line 83
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    if-nez v1, :cond_1

    .line 88
    .line 89
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 90
    .line 91
    const-string v2, "from_discover_discussion"

    .line 92
    .line 93
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    if-nez v1, :cond_1

    .line 98
    .line 99
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 100
    .line 101
    const-string v2, "from_nearby_focus"

    .line 102
    .line 103
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 104
    .line 105
    .line 106
    move-result v1

    .line 107
    if-nez v1, :cond_1

    .line 108
    .line 109
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 110
    .line 111
    const-string v2, "from_like"

    .line 112
    .line 113
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 114
    .line 115
    .line 116
    move-result v1

    .line 117
    if-nez v1, :cond_1

    .line 118
    .line 119
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 120
    .line 121
    const-string v2, "from_activity_tab_one"

    .line 122
    .line 123
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 124
    .line 125
    .line 126
    move-result v1

    .line 127
    if-nez v1, :cond_1

    .line 128
    .line 129
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 130
    .line 131
    const-string v2, "from_activity_tab_two"

    .line 132
    .line 133
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 134
    .line 135
    .line 136
    move-result v1

    .line 137
    if-eqz v1, :cond_2

    .line 138
    .line 139
    :cond_1
    iget-object v1, p0, Ll/f770;->L:Landroid/widget/ImageView;

    .line 140
    .line 141
    sget v2, Ll/lbc0;->W4:I

    .line 142
    .line 143
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 144
    .line 145
    .line 146
    :cond_2
    iget-object v1, p0, Ll/f770;->L:Landroid/widget/ImageView;

    .line 147
    .line 148
    new-instance v2, Ll/o770;

    .line 149
    .line 150
    invoke-direct {v2, p0, p1}, Ll/o770;-><init>(Ll/w770;Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 154
    .line 155
    .line 156
    return v0
.end method

.method public d0(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)Z
    .locals 4

    .line 1
    iput-object p1, p0, Ll/w770;->c0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 2
    .line 3
    invoke-super {p0, p1}, Ll/f770;->d0(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Ll/f770;->g:Landroid/widget/LinearLayout;

    .line 8
    .line 9
    invoke-virtual {v1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/w770;->A0(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iput-object v1, p0, Ll/w770;->Z:Landroid/view/View;

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    if-nez v1, :cond_1

    .line 20
    .line 21
    invoke-static {}, Ll/cmg;->n0()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 28
    .line 29
    iget-boolean v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->shareMyVote:Z

    .line 30
    .line 31
    if-nez v1, :cond_1

    .line 32
    .line 33
    :cond_0
    iget-boolean v1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->J0:Z

    .line 34
    .line 35
    if-nez v1, :cond_1

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Ll/w770;->B0(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    iget-object v1, p0, Ll/f770;->g:Landroid/widget/LinearLayout;

    .line 41
    .line 42
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 47
    .line 48
    iget v3, v1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 49
    .line 50
    if-eqz v3, :cond_1

    .line 51
    .line 52
    iput v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 53
    .line 54
    iget-object v3, p0, Ll/f770;->g:Landroid/widget/LinearLayout;

    .line 55
    .line 56
    invoke-virtual {v3, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 57
    .line 58
    .line 59
    :cond_1
    iget-object v1, p0, Ll/w770;->b0:Lcom/p1/mobile/putong/data/User;

    .line 60
    .line 61
    if-eqz v1, :cond_2

    .line 62
    .line 63
    invoke-static {v1}, Ll/ksg;->n0(Lcom/p1/mobile/putong/data/User;)Z

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    if-nez v1, :cond_3

    .line 68
    .line 69
    :cond_2
    invoke-virtual {p0, p1}, Ll/w770;->z0(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)Landroid/view/View;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    iput-object v1, p0, Ll/w770;->a0:Landroid/view/View;

    .line 74
    .line 75
    :cond_3
    iget-object v1, p0, Ll/w770;->a0:Landroid/view/View;

    .line 76
    .line 77
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    if-eqz v1, :cond_4

    .line 82
    .line 83
    iget-object v1, p0, Ll/f770;->g:Landroid/widget/LinearLayout;

    .line 84
    .line 85
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 90
    .line 91
    iget v3, v1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 92
    .line 93
    if-nez v3, :cond_5

    .line 94
    .line 95
    sget v3, Ll/qa00;->g:I

    .line 96
    .line 97
    neg-int v3, v3

    .line 98
    iput v3, v1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 99
    .line 100
    iget-object v3, p0, Ll/f770;->g:Landroid/widget/LinearLayout;

    .line 101
    .line 102
    invoke-virtual {v3, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 103
    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_4
    iget-object v1, p0, Ll/w770;->Z:Landroid/view/View;

    .line 107
    .line 108
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    if-eqz v1, :cond_5

    .line 113
    .line 114
    iget-object v1, p0, Ll/f770;->g:Landroid/widget/LinearLayout;

    .line 115
    .line 116
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 121
    .line 122
    iget v3, v1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 123
    .line 124
    if-nez v3, :cond_5

    .line 125
    .line 126
    sget v3, Ll/qa00;->h:I

    .line 127
    .line 128
    neg-int v3, v3

    .line 129
    iput v3, v1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 130
    .line 131
    iget-object v3, p0, Ll/f770;->g:Landroid/widget/LinearLayout;

    .line 132
    .line 133
    invoke-virtual {v3, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 134
    .line 135
    .line 136
    :cond_5
    :goto_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->getController()Ll/n570;

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 141
    .line 142
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 143
    .line 144
    invoke-virtual {v1, v3}, Ll/n570;->m(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    iput-object v1, p0, Ll/w770;->b0:Lcom/p1/mobile/putong/data/User;

    .line 149
    .line 150
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 151
    .line 152
    .line 153
    move-result v1

    .line 154
    if-eqz v1, :cond_6

    .line 155
    .line 156
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 157
    .line 158
    .line 159
    move-result-object v1

    .line 160
    iget-object v3, p0, Ll/w770;->b0:Lcom/p1/mobile/putong/data/User;

    .line 161
    .line 162
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 163
    .line 164
    invoke-interface {v1, v3}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Zj(Ljava/lang/String;)Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 165
    .line 166
    .line 167
    move-result-object v1

    .line 168
    invoke-static {v1}, Ll/ksg;->U(Lcom/p1/mobile/putong/data/ConversationStatus;)Z

    .line 169
    .line 170
    .line 171
    move-result v1

    .line 172
    if-eqz v1, :cond_6

    .line 173
    .line 174
    const/4 v1, 0x1

    .line 175
    goto :goto_1

    .line 176
    :cond_6
    move v1, v2

    .line 177
    :goto_1
    invoke-virtual {p0, v1}, Ll/w770;->C0(Z)V

    .line 178
    .line 179
    .line 180
    iget-object v1, p0, Ll/f770;->E:Lv/VImage;

    .line 181
    .line 182
    const/4 v3, 0x0

    .line 183
    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setImageTintList(Landroid/content/res/ColorStateList;)V

    .line 184
    .line 185
    .line 186
    iget-object v1, p0, Ll/f770;->z:Lv/VImage;

    .line 187
    .line 188
    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setImageTintList(Landroid/content/res/ColorStateList;)V

    .line 189
    .line 190
    .line 191
    iget-object v1, p0, Ll/f770;->H:Lv/VImage;

    .line 192
    .line 193
    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setImageTintList(Landroid/content/res/ColorStateList;)V

    .line 194
    .line 195
    .line 196
    iget-object v1, p0, Ll/f770;->L:Landroid/widget/ImageView;

    .line 197
    .line 198
    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setImageTintList(Landroid/content/res/ColorStateList;)V

    .line 199
    .line 200
    .line 201
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 202
    .line 203
    invoke-virtual {p0, v1}, Ll/w770;->D0(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 204
    .line 205
    .line 206
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->p0()Z

    .line 207
    .line 208
    .line 209
    move-result v1

    .line 210
    iget-object v3, p0, Ll/f770;->N:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 211
    .line 212
    if-eqz v1, :cond_8

    .line 213
    .line 214
    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 215
    .line 216
    .line 217
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->I:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 218
    .line 219
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 220
    .line 221
    .line 222
    move-result v1

    .line 223
    if-eqz v1, :cond_7

    .line 224
    .line 225
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->I:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 226
    .line 227
    instance-of v2, v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 228
    .line 229
    if-eqz v2, :cond_7

    .line 230
    .line 231
    check-cast v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 232
    .line 233
    iget-object v2, v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;->D:Ljava/util/HashMap;

    .line 234
    .line 235
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 236
    .line 237
    .line 238
    move-result v2

    .line 239
    if-eqz v2, :cond_7

    .line 240
    .line 241
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 242
    .line 243
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 244
    .line 245
    .line 246
    move-result v2

    .line 247
    if-eqz v2, :cond_7

    .line 248
    .line 249
    iget-object v2, v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;->D:Ljava/util/HashMap;

    .line 250
    .line 251
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 252
    .line 253
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 254
    .line 255
    invoke-virtual {v2, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 256
    .line 257
    .line 258
    move-result v2

    .line 259
    if-eqz v2, :cond_7

    .line 260
    .line 261
    iget-object v2, p0, Ll/f770;->N:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 262
    .line 263
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;->D:Ljava/util/HashMap;

    .line 264
    .line 265
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 266
    .line 267
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 268
    .line 269
    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 270
    .line 271
    .line 272
    move-result-object v1

    .line 273
    check-cast v1, Ljava/lang/Boolean;

    .line 274
    .line 275
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 276
    .line 277
    .line 278
    move-result v1

    .line 279
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 280
    .line 281
    .line 282
    :cond_7
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 283
    .line 284
    iget-object v2, p0, Ll/f770;->O:Lv/VDraweeView;

    .line 285
    .line 286
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 287
    .line 288
    .line 289
    move-result-object v3

    .line 290
    invoke-interface {v3}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 291
    .line 292
    .line 293
    move-result-object v3

    .line 294
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 295
    .line 296
    .line 297
    move-result-object v3

    .line 298
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 299
    .line 300
    .line 301
    move-result-object v3

    .line 302
    invoke-virtual {v1, v2, v3}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 303
    .line 304
    .line 305
    iget-object v1, p0, Ll/f770;->P:Lv/VText;

    .line 306
    .line 307
    new-instance v2, Ll/h770;

    .line 308
    .line 309
    invoke-direct {v2, p1}, Ll/h770;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)V

    .line 310
    .line 311
    .line 312
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 313
    .line 314
    .line 315
    iget-object v1, p0, Ll/f770;->Q:Lv/VImage;

    .line 316
    .line 317
    new-instance v2, Ll/n770;

    .line 318
    .line 319
    invoke-direct {v2, p1}, Ll/n770;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)V

    .line 320
    .line 321
    .line 322
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 323
    .line 324
    .line 325
    goto :goto_2

    .line 326
    :cond_8
    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 327
    .line 328
    .line 329
    :goto_2
    invoke-static {}, Ll/cmg;->K()Z

    .line 330
    .line 331
    .line 332
    move-result v1

    .line 333
    if-eqz v1, :cond_a

    .line 334
    .line 335
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 336
    .line 337
    invoke-virtual {p0, v1}, Ll/w770;->V0(Ljava/lang/String;)Z

    .line 338
    .line 339
    .line 340
    move-result v1

    .line 341
    if-eqz v1, :cond_a

    .line 342
    .line 343
    iget-object v1, p0, Ll/f770;->c:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 344
    .line 345
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 346
    .line 347
    iget-boolean v2, v2, Lcom/p1/mobile/putong/feed/data/Moment;->showGreetView:Z

    .line 348
    .line 349
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 350
    .line 351
    .line 352
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 353
    .line 354
    iget-boolean v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->showGreetView:Z

    .line 355
    .line 356
    if-eqz v1, :cond_a

    .line 357
    .line 358
    iget-object v1, p0, Ll/f770;->e:Lv/VText;

    .line 359
    .line 360
    invoke-virtual {v1}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 361
    .line 362
    .line 363
    move-result-object v1

    .line 364
    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 365
    .line 366
    .line 367
    move-result-object v1

    .line 368
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 369
    .line 370
    .line 371
    move-result v1

    .line 372
    if-eqz v1, :cond_9

    .line 373
    .line 374
    iget-object v1, p0, Ll/f770;->e:Lv/VText;

    .line 375
    .line 376
    invoke-static {}, Ll/ksg;->x()Ljava/lang/String;

    .line 377
    .line 378
    .line 379
    move-result-object v2

    .line 380
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 381
    .line 382
    .line 383
    :cond_9
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 384
    .line 385
    iget-object p0, p0, Ll/f770;->d:Lv/VDraweeView;

    .line 386
    .line 387
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 388
    .line 389
    .line 390
    move-result-object v1

    .line 391
    invoke-interface {v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 392
    .line 393
    .line 394
    move-result-object v1

    .line 395
    invoke-static {p1, p0, v1}, Ll/at0;->e(Lcom/p1/mobile/putong/feed/data/Moment;Lv/VDraweeView;Lcom/p1/mobile/putong/data/User;)V

    .line 396
    .line 397
    .line 398
    :cond_a
    return v0
.end method

.method public g0(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/f770;->g0(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public o()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f770;->J:Lv/VText;

    .line 2
    .line 3
    return-object p0
.end method

.method public final y0()V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/w770;->d0:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveView;

    .line 6
    .line 7
    iget-object v1, p0, Ll/f770;->g:Landroid/widget/LinearLayout;

    .line 8
    .line 9
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveView;-><init>(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/w770;->d0:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveView;

    .line 17
    .line 18
    :cond_0
    iget-object v2, p0, Ll/w770;->d0:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveView;

    .line 19
    .line 20
    iget-object v0, p0, Ll/w770;->c0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    iget-object v0, p0, Ll/w770;->c0:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 27
    .line 28
    iget-object v4, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 29
    .line 30
    iget-object v5, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 31
    .line 32
    iget-boolean v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->R:Z

    .line 33
    .line 34
    invoke-static {v5, v0}, Ll/ksg;->K(Ljava/lang/String;Z)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v6

    .line 38
    const/4 v7, 0x0

    .line 39
    sget v8, Ll/qa00;->j:I

    .line 40
    .line 41
    invoke-virtual/range {v2 .. v8}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveView;->P(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Ljava/lang/String;ZI)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Ll/w770;->d0:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveView;

    .line 45
    .line 46
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-lez v0, :cond_1

    .line 51
    .line 52
    iget-object v0, p0, Ll/f770;->g:Landroid/widget/LinearLayout;

    .line 53
    .line 54
    iget-object p0, p0, Ll/w770;->d0:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveView;

    .line 55
    .line 56
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 57
    .line 58
    .line 59
    :cond_1
    return-void
.end method

.method public z0(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)Landroid/view/View;
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->Z1(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    return-object v1

    .line 11
    :cond_0
    invoke-static {}, Ll/nkh;->l()Ll/nkh;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/nkh;->i()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->attitudes:Lcom/p1/mobile/putong/feed/data/Attitudes;

    .line 24
    .line 25
    iget v0, v0, Lcom/p1/mobile/putong/feed/data/Attitudes;->count:I

    .line 26
    .line 27
    if-gtz v0, :cond_1

    .line 28
    .line 29
    return-object v1

    .line 30
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->T:Ll/n570;

    .line 31
    .line 32
    if-nez v0, :cond_2

    .line 33
    .line 34
    return-object v1

    .line 35
    :cond_2
    invoke-virtual {v0}, Ll/n570;->p()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_3

    .line 40
    .line 41
    return-object v1

    .line 42
    :cond_3
    new-instance v0, Ll/qrg$a;

    .line 43
    .line 44
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->act()Lcom/p1/mobile/android/app/Act;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    iget-object p0, p0, Ll/f770;->g:Landroid/widget/LinearLayout;

    .line 49
    .line 50
    invoke-direct {v0, v1, p0}, Ll/qrg$a;-><init>(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;)V

    .line 51
    .line 52
    .line 53
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->T:Ll/n570;

    .line 54
    .line 55
    invoke-virtual {v0, p0}, Ll/qrg$a;->k(Ll/n570;)Ll/qrg$a;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 60
    .line 61
    invoke-virtual {p0, v0}, Ll/qrg$a;->i(Lcom/p1/mobile/putong/feed/data/Moment;)Ll/qrg$a;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->P:Ljava/lang/String;

    .line 66
    .line 67
    iget-boolean p1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->R:Z

    .line 68
    .line 69
    invoke-static {v0, p1}, Ll/ksg;->K(Ljava/lang/String;Z)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-virtual {p0, p1}, Ll/qrg$a;->j(Ljava/lang/String;)Ll/qrg$a;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {p0}, Ll/qrg$a;->g()Landroid/view/View;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    return-object p0
.end method
