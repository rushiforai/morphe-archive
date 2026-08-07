.class public Ll/zub0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/VoteOptions;",
            ">;"
        }
    .end annotation
.end field

.field public c:I

.field public d:Lcom/p1/mobile/putong/feed/data/TopicMoment;

.field public e:Lcom/p1/mobile/android/app/Act;

.field public f:Ll/x20;

.field public g:Ll/x20;

.field public h:Z

.field public i:Ljava/lang/String;

.field public j:Ll/th0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;Lcom/p1/mobile/android/app/Act;ZLjava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView<",
            "Landroid/view/View;",
            ">;",
            "Lcom/p1/mobile/android/app/Act;",
            "Z",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Ll/zub0;->c:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-object v0, p0, Ll/zub0;->j:Ll/th0;

    .line 9
    .line 10
    iput-object p1, p0, Ll/zub0;->a:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;

    .line 11
    .line 12
    iput-object p2, p0, Ll/zub0;->e:Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    iput-boolean p3, p0, Ll/zub0;->h:Z

    .line 15
    .line 16
    iput-object p4, p0, Ll/zub0;->i:Ljava/lang/String;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic a(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/i4h;->g(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Ll/zub0;IILl/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/zub0;->r(IILl/uxj0;)V

    return-void
.end method

.method public static synthetic c(Ll/zub0;Ljava/util/List;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/zub0;->p(Ljava/util/List;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/zub0;Ljava/util/List;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/zub0;->o(Ljava/util/List;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ll/zub0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zub0;->q(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Ll/zub0;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zub0;->s(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic g(Ll/zub0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zub0;->n(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic h(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/i4h;->g(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i(Ll/zub0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zub0;->m(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final A(ZZ)V
    .locals 11

    .line 1
    iget-object v0, p0, Ll/zub0;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Ll/zub0;->a:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->getQaTopicVoteViewList()Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    if-eqz v3, :cond_0

    .line 22
    .line 23
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    check-cast v3, Landroid/view/View;

    .line 28
    .line 29
    const/16 v4, 0x8

    .line 30
    .line 31
    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const/4 v2, 0x0

    .line 36
    move v7, v2

    .line 37
    :goto_1
    if-ge v7, v0, :cond_2

    .line 38
    .line 39
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-ne v2, v7, :cond_1

    .line 44
    .line 45
    goto :goto_2

    .line 46
    :cond_1
    invoke-interface {v1, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    check-cast v2, Landroid/view/View;

    .line 51
    .line 52
    const/4 v3, 0x1

    .line 53
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 54
    .line 55
    .line 56
    iget-object v2, p0, Ll/zub0;->a:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;

    .line 57
    .line 58
    new-instance v3, Ll/l1i;

    .line 59
    .line 60
    iget-object v4, p0, Ll/zub0;->b:Ljava/util/List;

    .line 61
    .line 62
    invoke-interface {v4, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v4

    .line 66
    check-cast v4, Lcom/p1/mobile/putong/feed/data/VoteOptions;

    .line 67
    .line 68
    iget v5, v4, Lcom/p1/mobile/putong/feed/data/VoteOptions;->counter:I

    .line 69
    .line 70
    iget-object v4, p0, Ll/zub0;->d:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 71
    .line 72
    iget v6, v4, Lcom/p1/mobile/putong/feed/data/TopicMoment;->voteCounter:I

    .line 73
    .line 74
    iget v8, p0, Ll/zub0;->c:I

    .line 75
    .line 76
    iget-object v4, p0, Ll/zub0;->b:Ljava/util/List;

    .line 77
    .line 78
    invoke-interface {v4, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v4

    .line 82
    check-cast v4, Lcom/p1/mobile/putong/feed/data/VoteOptions;

    .line 83
    .line 84
    iget-object v9, v4, Lcom/p1/mobile/putong/feed/data/VoteOptions;->values:Ljava/lang/String;

    .line 85
    .line 86
    move v4, p1

    .line 87
    move v10, p2

    .line 88
    invoke-direct/range {v3 .. v10}, Ll/l1i;-><init>(ZIIIILjava/lang/String;Z)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->z(Ll/l1i;)V

    .line 92
    .line 93
    .line 94
    add-int/lit8 v7, v7, 0x1

    .line 95
    .line 96
    goto :goto_1

    .line 97
    :cond_2
    :goto_2
    return-void
.end method

.method public final j()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zub0;->e:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public final k()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/zub0;->j()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    invoke-static {}, Ll/cmg;->m0()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-static {}, Ll/cmg;->n0()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    new-instance v0, Ll/th0$a;

    .line 22
    .line 23
    iget-object v1, p0, Ll/zub0;->e:Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    invoke-direct {v0, v1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 26
    .line 27
    .line 28
    const-string v1, "\u786e\u8ba4\u53d6\u6d88\u6295\u7968\u5417\uff1f"

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    const-string v2, "\u786e\u5b9a"

    .line 35
    .line 36
    invoke-virtual {v1, v2}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    const-string v2, "\u53d6\u6d88"

    .line 41
    .line 42
    invoke-virtual {v1, v2}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    new-instance v2, Ll/tub0;

    .line 47
    .line 48
    invoke-direct {v2, p0}, Ll/tub0;-><init>(Ll/zub0;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1, v2}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    new-instance v2, Ll/uub0;

    .line 56
    .line 57
    invoke-direct {v2, p0}, Ll/uub0;-><init>(Ll/zub0;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v1, v2}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0}, Ll/th0$a;->a()Ll/th0;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    iput-object v0, p0, Ll/zub0;->j:Ll/th0;

    .line 68
    .line 69
    invoke-virtual {v0}, Ll/th0;->g()V

    .line 70
    .line 71
    .line 72
    :cond_2
    :goto_0
    return-void
.end method

.method public final l()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zub0;->a:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->getVoteViewContainerList()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/qub0;

    .line 8
    .line 9
    invoke-direct {v1, p0, v0}, Ll/qub0;-><init>(Ll/zub0;Ljava/util/List;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/zub0;->a:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->getVoteListContainer()Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/rub0;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/rub0;-><init>(Ll/zub0;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final synthetic m(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/zub0;->j:Ll/th0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/th0;->c()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/zub0;->x()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic n(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zub0;->j:Ll/th0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/th0;->c()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic o(Ljava/util/List;Landroid/view/View;)V
    .locals 4

    .line 1
    iget v0, p0, Ll/zub0;->c:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-ne v0, v1, :cond_2

    .line 5
    .line 6
    iget-object v0, p0, Ll/zub0;->i:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-static {v0, v1}, Ll/ksg;->K(Ljava/lang/String;Z)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0}, Ll/zub0;->j()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    instance-of v1, v1, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicAggregationActivity;

    .line 18
    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    sget v0, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;->u:I

    .line 22
    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    const-string v0, "p_topic_recommend"

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const-string v0, "p_topic_latest"

    .line 29
    .line 30
    :cond_1
    :goto_0
    iget-object v1, p0, Ll/zub0;->d:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 31
    .line 32
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 33
    .line 34
    const-string v2, "topic_id"

    .line 35
    .line 36
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    iget-object v2, p0, Ll/zub0;->b:Ljava/util/List;

    .line 41
    .line 42
    invoke-interface {p1, p2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    check-cast v2, Lcom/p1/mobile/putong/feed/data/VoteOptions;

    .line 51
    .line 52
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/VoteOptions;->values:Ljava/lang/String;

    .line 53
    .line 54
    const-string v3, "select_item"

    .line 55
    .line 56
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    filled-new-array {v1, v2}, [Ll/pf60;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    const-string v2, "e_qa_optional"

    .line 65
    .line 66
    invoke-static {v2, v0, v1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 67
    .line 68
    .line 69
    invoke-interface {p1, p2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    invoke-virtual {p0, p1}, Ll/zub0;->u(I)V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_2
    iget-boolean p1, p0, Ll/zub0;->h:Z

    .line 78
    .line 79
    if-eqz p1, :cond_3

    .line 80
    .line 81
    invoke-virtual {p0}, Ll/zub0;->k()V

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :cond_3
    iget-object p1, p0, Ll/zub0;->d:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 86
    .line 87
    invoke-virtual {p0}, Ll/zub0;->j()Lcom/p1/mobile/android/app/Act;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-static {p1, p0}, Ll/ksg;->t0(Lcom/p1/mobile/putong/feed/data/TopicMoment;Landroid/content/Context;)V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public final synthetic p(Ljava/util/List;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ll/sub0;

    .line 8
    .line 9
    invoke-direct {v0, p0, p1}, Ll/sub0;-><init>(Ll/zub0;Ljava/util/List;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public final synthetic q(Landroid/view/View;)V
    .locals 1

    .line 1
    iget p1, p0, Ll/zub0;->c:I

    .line 2
    .line 3
    const/4 v0, -0x1

    .line 4
    if-eq p1, v0, :cond_1

    .line 5
    .line 6
    iget-boolean p1, p0, Ll/zub0;->h:Z

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/zub0;->k()V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object p1, p0, Ll/zub0;->d:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/zub0;->j()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-static {p1, p0}, Ll/ksg;->t0(Lcom/p1/mobile/putong/feed/data/TopicMoment;Landroid/content/Context;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    return-void
.end method

.method public final synthetic r(IILl/uxj0;)V
    .locals 2

    .line 1
    iput p1, p0, Ll/zub0;->c:I

    .line 2
    .line 3
    iget-object p3, p0, Ll/zub0;->d:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 4
    .line 5
    iget p3, p3, Lcom/p1/mobile/putong/feed/data/TopicMoment;->voteCounter:I

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    if-ne p2, p3, :cond_0

    .line 9
    .line 10
    iget-object p2, p0, Ll/zub0;->b:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {p2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    check-cast p2, Lcom/p1/mobile/putong/feed/data/VoteOptions;

    .line 17
    .line 18
    iput-boolean v0, p2, Lcom/p1/mobile/putong/feed/data/VoteOptions;->haveliked:Z

    .line 19
    .line 20
    iget-object p2, p0, Ll/zub0;->b:Ljava/util/List;

    .line 21
    .line 22
    iget p3, p0, Ll/zub0;->c:I

    .line 23
    .line 24
    invoke-interface {p2, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    check-cast p2, Lcom/p1/mobile/putong/feed/data/VoteOptions;

    .line 29
    .line 30
    iget p3, p2, Lcom/p1/mobile/putong/feed/data/VoteOptions;->counter:I

    .line 31
    .line 32
    add-int/2addr p3, v0

    .line 33
    iput p3, p2, Lcom/p1/mobile/putong/feed/data/VoteOptions;->counter:I

    .line 34
    .line 35
    iget-object p2, p0, Ll/zub0;->d:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 36
    .line 37
    iget p3, p2, Lcom/p1/mobile/putong/feed/data/TopicMoment;->voteCounter:I

    .line 38
    .line 39
    add-int/2addr p3, v0

    .line 40
    iput p3, p2, Lcom/p1/mobile/putong/feed/data/TopicMoment;->voteCounter:I

    .line 41
    .line 42
    sget-object p3, Lcom/p1/mobile/putong/feed/FeedModule;->h:Ll/cu9;

    .line 43
    .line 44
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 45
    .line 46
    iget-object v1, p0, Ll/zub0;->b:Ljava/util/List;

    .line 47
    .line 48
    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    check-cast p1, Lcom/p1/mobile/putong/feed/data/VoteOptions;

    .line 53
    .line 54
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/VoteOptions;->id:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {p3, p2, p1}, Ll/cu9;->C0(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    :cond_0
    const/4 p1, 0x0

    .line 60
    invoke-virtual {p0, v0, p1}, Ll/zub0;->A(ZZ)V

    .line 61
    .line 62
    .line 63
    iget-object p1, p0, Ll/zub0;->f:Ll/x20;

    .line 64
    .line 65
    if-eqz p1, :cond_1

    .line 66
    .line 67
    invoke-interface {p1}, Ll/x20;->call()V

    .line 68
    .line 69
    .line 70
    :cond_1
    invoke-virtual {p0, v0}, Ll/zub0;->t(Z)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public final synthetic s(Ll/uxj0;)V
    .locals 4

    .line 1
    iget p1, p0, Ll/zub0;->c:I

    .line 2
    .line 3
    iget-object v0, p0, Ll/zub0;->b:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/p1/mobile/putong/feed/data/VoteOptions;

    .line 10
    .line 11
    iget v1, v0, Lcom/p1/mobile/putong/feed/data/VoteOptions;->counter:I

    .line 12
    .line 13
    const/4 v2, 0x1

    .line 14
    sub-int/2addr v1, v2

    .line 15
    iput v1, v0, Lcom/p1/mobile/putong/feed/data/VoteOptions;->counter:I

    .line 16
    .line 17
    iget-object v0, p0, Ll/zub0;->b:Ljava/util/List;

    .line 18
    .line 19
    iget v1, p0, Ll/zub0;->c:I

    .line 20
    .line 21
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/p1/mobile/putong/feed/data/VoteOptions;

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    iput-boolean v1, v0, Lcom/p1/mobile/putong/feed/data/VoteOptions;->haveliked:Z

    .line 29
    .line 30
    iget-object v0, p0, Ll/zub0;->d:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 31
    .line 32
    iget v3, v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->voteCounter:I

    .line 33
    .line 34
    sub-int/2addr v3, v2

    .line 35
    iput v3, v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->voteCounter:I

    .line 36
    .line 37
    const/4 v0, -0x1

    .line 38
    iput v0, p0, Ll/zub0;->c:I

    .line 39
    .line 40
    invoke-virtual {p0, v2, v2}, Ll/zub0;->A(ZZ)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0, v1}, Ll/zub0;->t(Z)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/zub0;->i:Ljava/lang/String;

    .line 47
    .line 48
    invoke-static {v0, v1}, Ll/ksg;->K(Ljava/lang/String;Z)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {p0}, Ll/zub0;->j()Lcom/p1/mobile/android/app/Act;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    instance-of v1, v1, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicAggregationActivity;

    .line 57
    .line 58
    if-eqz v1, :cond_1

    .line 59
    .line 60
    sget v0, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;->u:I

    .line 61
    .line 62
    if-nez v0, :cond_0

    .line 63
    .line 64
    const-string v0, "p_topic_recommend"

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_0
    const-string v0, "p_topic_latest"

    .line 68
    .line 69
    :cond_1
    :goto_0
    iget-object v1, p0, Ll/zub0;->d:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 70
    .line 71
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 72
    .line 73
    const-string v2, "topic_id"

    .line 74
    .line 75
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    iget-object v2, p0, Ll/zub0;->b:Ljava/util/List;

    .line 80
    .line 81
    invoke-interface {v2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    check-cast p1, Lcom/p1/mobile/putong/feed/data/VoteOptions;

    .line 86
    .line 87
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/VoteOptions;->values:Ljava/lang/String;

    .line 88
    .line 89
    const-string v2, "select_item"

    .line 90
    .line 91
    invoke-static {v2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    filled-new-array {v1, p1}, [Ll/pf60;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    const-string v1, "e_qa_optional_cancel"

    .line 100
    .line 101
    invoke-static {v1, v0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 102
    .line 103
    .line 104
    iget-object p0, p0, Ll/zub0;->g:Ll/x20;

    .line 105
    .line 106
    if-eqz p0, :cond_2

    .line 107
    .line 108
    invoke-interface {p0}, Ll/x20;->call()V

    .line 109
    .line 110
    .line 111
    :cond_2
    return-void
.end method

.method public final t(Z)V
    .locals 3

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/zub0;->d:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 7
    .line 8
    iget-object v2, v1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 9
    .line 10
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    const-string p1, "666666"

    .line 16
    .line 17
    iget-object p0, p0, Ll/zub0;->d:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 18
    .line 19
    invoke-interface {v0, p1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/jka;->P7()Lrx/subjects/b;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final u(I)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Ll/zub0;->j()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 v0, -0x1

    .line 9
    if-ne p1, v0, :cond_1

    .line 10
    .line 11
    :goto_0
    return-void

    .line 12
    :cond_1
    iget-object v0, p0, Ll/zub0;->d:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 13
    .line 14
    iget v0, v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->voteCounter:I

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/zub0;->j()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    sget-object v2, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 21
    .line 22
    iget-object v3, p0, Ll/zub0;->d:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 23
    .line 24
    iget-object v4, v3, Lcom/p1/mobile/putong/feed/data/TopicMoment;->owner:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 25
    .line 26
    iget-object v4, v4, Lcom/p1/mobile/putong/data/IdBoxed;->id:Ljava/lang/String;

    .line 27
    .line 28
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v5, p0, Ll/zub0;->b:Ljava/util/List;

    .line 31
    .line 32
    invoke-interface {v5, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v5

    .line 36
    check-cast v5, Lcom/p1/mobile/putong/feed/data/VoteOptions;

    .line 37
    .line 38
    iget-object v5, v5, Lcom/p1/mobile/putong/feed/data/VoteOptions;->id:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v2, v4, v3, v5, p1}, Ll/jka;->Dc(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    new-instance v2, Ll/xub0;

    .line 49
    .line 50
    invoke-direct {v2, p0, p1, v0}, Ll/xub0;-><init>(Ll/zub0;II)V

    .line 51
    .line 52
    .line 53
    new-instance p0, Ll/yub0;

    .line 54
    .line 55
    invoke-direct {p0}, Ll/yub0;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-static {v2, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {v1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public final v()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/zub0;->d:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->options:Ljava/util/List;

    .line 7
    .line 8
    iput-object v0, p0, Ll/zub0;->b:Ljava/util/List;

    .line 9
    .line 10
    if-eqz v0, :cond_4

    .line 11
    .line 12
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_4

    .line 17
    .line 18
    iget-object v0, p0, Ll/zub0;->d:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 19
    .line 20
    iget v0, v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->voteCounter:I

    .line 21
    .line 22
    if-gez v0, :cond_1

    .line 23
    .line 24
    goto :goto_1

    .line 25
    :cond_1
    const/4 v0, -0x1

    .line 26
    iput v0, p0, Ll/zub0;->c:I

    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    move v1, v0

    .line 30
    :goto_0
    iget-object v2, p0, Ll/zub0;->b:Ljava/util/List;

    .line 31
    .line 32
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-ge v1, v2, :cond_3

    .line 37
    .line 38
    iget-object v2, p0, Ll/zub0;->b:Ljava/util/List;

    .line 39
    .line 40
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    check-cast v2, Lcom/p1/mobile/putong/feed/data/VoteOptions;

    .line 45
    .line 46
    iget-boolean v2, v2, Lcom/p1/mobile/putong/feed/data/VoteOptions;->haveliked:Z

    .line 47
    .line 48
    if-eqz v2, :cond_2

    .line 49
    .line 50
    iput v1, p0, Ll/zub0;->c:I

    .line 51
    .line 52
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_3
    invoke-virtual {p0, v0, v0}, Ll/zub0;->A(ZZ)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0}, Ll/zub0;->l()V

    .line 59
    .line 60
    .line 61
    :cond_4
    :goto_1
    return-void
.end method

.method public w(Lcom/p1/mobile/putong/feed/data/TopicMoment;)V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    iput v0, p0, Ll/zub0;->c:I

    .line 3
    .line 4
    iput-object p1, p0, Ll/zub0;->d:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/zub0;->v()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final x()V
    .locals 6

    .line 1
    iget v0, p0, Ll/zub0;->c:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    invoke-virtual {p0}, Ll/zub0;->j()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 12
    .line 13
    iget-object v2, p0, Ll/zub0;->d:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 14
    .line 15
    iget-object v3, v2, Lcom/p1/mobile/putong/feed/data/TopicMoment;->owner:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 16
    .line 17
    iget-object v3, v3, Lcom/p1/mobile/putong/data/IdBoxed;->id:Ljava/lang/String;

    .line 18
    .line 19
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 20
    .line 21
    iget-object v4, p0, Ll/zub0;->b:Ljava/util/List;

    .line 22
    .line 23
    iget v5, p0, Ll/zub0;->c:I

    .line 24
    .line 25
    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v4

    .line 29
    check-cast v4, Lcom/p1/mobile/putong/feed/data/VoteOptions;

    .line 30
    .line 31
    iget-object v4, v4, Lcom/p1/mobile/putong/feed/data/VoteOptions;->id:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v1, v3, v2, v4}, Ll/jka;->I6(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v1, Ll/vub0;

    .line 42
    .line 43
    invoke-direct {v1, p0}, Ll/vub0;-><init>(Ll/zub0;)V

    .line 44
    .line 45
    .line 46
    new-instance p0, Ll/wub0;

    .line 47
    .line 48
    invoke-direct {p0}, Ll/wub0;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public y(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zub0;->g:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public z(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zub0;->f:Ll/x20;

    .line 2
    .line 3
    return-void
.end method
