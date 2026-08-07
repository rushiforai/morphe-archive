.class public Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;
.super Lv/VFrame;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/android/app/Act;

.field public b:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

.field public c:Lv/VRecyclerView;

.field public d:Ll/mf5;

.field public e:Ll/pf60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pf60<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicCategorie;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;>;"
        }
    .end annotation
.end field

.field public f:Ll/x20;

.field public g:Ljava/lang/String;

.field public h:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/qth;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Ll/qth;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;->h:Ll/y20;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 12
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    new-instance p1, Ll/qth;

    invoke-direct {p1, p0}, Ll/qth;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;->h:Ll/y20;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 14
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 15
    new-instance p1, Ll/qth;

    invoke-direct {p1, p0}, Ll/qth;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;->h:Ll/y20;

    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;->B(Ljava/util/ArrayList;)V

    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/TopicMoment;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;->L(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    return-void
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/feed/data/TopicMoment;Lcom/p1/mobile/putong/feed/data/TopicMoment;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

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

.method public static bridge synthetic v(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;->g:Ljava/lang/String;

    return-object p0
.end method


# virtual methods
.method public final synthetic B(Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;->b:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->S1(Ljava/util/ArrayList;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C(Ljava/lang/String;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;->g:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;->d:Ll/mf5;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/mf5;->Q(Ljava/lang/String;Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public E()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;->d:Ll/mf5;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public F(Ll/pf60;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicCategorie;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;->e:Ll/pf60;

    .line 2
    .line 3
    return-void
.end method

.method public G()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;->b:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;->e:Ll/pf60;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->T1(Ll/pf60;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;->a:Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;->e:Ll/pf60;

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-object v0, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast v0, Ljava/util/List;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;->b:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 23
    .line 24
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->e:Ljava/util/ArrayList;

    .line 25
    .line 26
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-nez v1, :cond_2

    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;->b:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 33
    .line 34
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->e:Ljava/util/ArrayList;

    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    if-eqz v2, :cond_2

    .line 45
    .line 46
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    check-cast v2, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 51
    .line 52
    new-instance v3, Ll/rth;

    .line 53
    .line 54
    invoke-direct {v3, v2}, Ll/rth;-><init>(Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    .line 55
    .line 56
    .line 57
    invoke-static {v0, v3}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    if-nez v3, :cond_1

    .line 62
    .line 63
    const/4 v3, 0x1

    .line 64
    iput-boolean v3, v2, Lcom/p1/mobile/putong/feed/data/TopicMoment;->selected:Z

    .line 65
    .line 66
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_2
    new-instance v0, Ll/a0h$a;

    .line 71
    .line 72
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;->a:Lcom/p1/mobile/android/app/Act;

    .line 73
    .line 74
    invoke-direct {v0, v1}, Ll/a0h$a;-><init>(Landroid/content/Context;)V

    .line 75
    .line 76
    .line 77
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;->a:Lcom/p1/mobile/android/app/Act;

    .line 78
    .line 79
    invoke-static {v1}, Ll/bnl0;->x0(Landroid/content/Context;)I

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    invoke-static {}, Ll/bnl0;->F0()I

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    sub-int/2addr v1, v2

    .line 88
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;->a:Lcom/p1/mobile/android/app/Act;

    .line 89
    .line 90
    invoke-static {v2}, Ll/bnl0;->I(Landroid/content/Context;)I

    .line 91
    .line 92
    .line 93
    move-result v2

    .line 94
    sub-int/2addr v1, v2

    .line 95
    invoke-virtual {v0, v1}, Ll/a0h$a;->d(I)Ll/a0h$a;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;->e:Ll/pf60;

    .line 100
    .line 101
    invoke-virtual {v0, v1}, Ll/a0h$a;->e(Ljava/lang/Object;)Ll/a0h$a;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    const-string v1, "TWO_LINKAGE_TYPE"

    .line 106
    .line 107
    invoke-virtual {v0, v1}, Ll/a0h$a;->f(Ljava/lang/String;)Ll/a0h$a;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;->h:Ll/y20;

    .line 112
    .line 113
    invoke-virtual {v0, p0}, Ll/a0h$a;->c(Ll/y20;)Ll/a0h$a;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    invoke-virtual {p0}, Ll/a0h$a;->b()Landroid/app/Dialog;

    .line 118
    .line 119
    .line 120
    return-void
.end method

.method public K()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;->f:Ll/x20;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;->f:Ll/x20;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/x20;->call()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    const-string v0, "e_pick_topic"

    .line 16
    .line 17
    const-string v1, "p_moment_post"

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;->G()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final L(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/TopicMoment;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;->d:Ll/mf5;

    .line 2
    .line 3
    invoke-virtual {v0, p2}, Ll/mf5;->L(Lcom/p1/mobile/putong/feed/data/TopicMoment;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, "p_moment_post"

    .line 8
    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;->f:Ll/x20;

    .line 12
    .line 13
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;->f:Ll/x20;

    .line 20
    .line 21
    invoke-interface {p0}, Ll/x20;->call()V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    const-string p1, "e_pick_topic"

    .line 26
    .line 27
    invoke-static {p1, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;->G()V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    invoke-static {}, Ll/cmg;->p0()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_3

    .line 39
    .line 40
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-eqz p1, :cond_2

    .line 49
    .line 50
    const/4 p1, 0x1

    .line 51
    goto :goto_0

    .line 52
    :cond_2
    const/4 p1, 0x2

    .line 53
    :goto_0
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    const-string v2, "topic_attribute"

    .line 58
    .line 59
    invoke-static {v2, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-virtual {v0, p2, v1, p1}, Ll/er60;->b(Lcom/p1/mobile/putong/feed/data/TopicMoment;Ljava/lang/String;Ll/pf60;)V

    .line 64
    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_3
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-virtual {p1, p2, v1}, Ll/er60;->a(Lcom/p1/mobile/putong/feed/data/TopicMoment;Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    :goto_1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;->b:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 75
    .line 76
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->S0(Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public getTopicList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;->d:Ll/mf5;

    .line 2
    .line 3
    iget-object p0, p0, Ll/mf5;->d:Ljava/util/List;

    .line 4
    .line 5
    return-object p0
.end method

.method public setAddTopicClickHooker(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;->f:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public final w()V
    .locals 3

    .line 1
    const/high16 v0, 0x40800000    # 4.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;->c:Lv/VRecyclerView;

    .line 8
    .line 9
    new-instance v2, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView$a;

    .line 10
    .line 11
    invoke-direct {v2, p0, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView$a;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;I)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 15
    .line 16
    .line 17
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;->a:Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 22
    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->setOrientation(I)V

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;->c:Lv/VRecyclerView;

    .line 29
    .line 30
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 31
    .line 32
    .line 33
    new-instance v0, Ll/mf5;

    .line 34
    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;->a:Lcom/p1/mobile/android/app/Act;

    .line 36
    .line 37
    invoke-direct {v0, v1}, Ll/mf5;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;->d:Ll/mf5;

    .line 41
    .line 42
    new-instance v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView$b;

    .line 43
    .line 44
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView$b;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v1}, Ll/kic0;->E(Ll/h80;)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;->c:Lv/VRecyclerView;

    .line 51
    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;->d:Ll/mf5;

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;->d:Ll/mf5;

    .line 58
    .line 59
    new-instance v1, Ll/sth;

    .line 60
    .line 61
    invoke-direct {v1, p0}, Ll/sth;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, v1}, Ll/mf5;->R(Ll/z20;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public z(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;->b:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 4
    .line 5
    new-instance p2, Lv/VRecyclerView;

    .line 6
    .line 7
    invoke-direct {p2, p1}, Lv/VRecyclerView;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;->c:Lv/VRecyclerView;

    .line 11
    .line 12
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 13
    .line 14
    const/4 p2, -0x1

    .line 15
    const/4 v0, -0x2

    .line 16
    invoke-direct {p1, p2, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 17
    .line 18
    .line 19
    const/16 p2, 0x10

    .line 20
    .line 21
    iput p2, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 22
    .line 23
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;->c:Lv/VRecyclerView;

    .line 24
    .line 25
    invoke-virtual {p2, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;->c:Lv/VRecyclerView;

    .line 29
    .line 30
    const/high16 p2, 0x41900000    # 18.0f

    .line 31
    .line 32
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    sget v0, Ll/qa00;->m:I

    .line 37
    .line 38
    const/4 v1, 0x0

    .line 39
    invoke-virtual {p1, p2, v1, v0, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;->c:Lv/VRecyclerView;

    .line 43
    .line 44
    invoke-virtual {p1, v1}, Landroidx/recyclerview/widget/RecyclerView;->setClipToPadding(Z)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;->c:Lv/VRecyclerView;

    .line 48
    .line 49
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;->w()V

    .line 53
    .line 54
    .line 55
    return-void
.end method
