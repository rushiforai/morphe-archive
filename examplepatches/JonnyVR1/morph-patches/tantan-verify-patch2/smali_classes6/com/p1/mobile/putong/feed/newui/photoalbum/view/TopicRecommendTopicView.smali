.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lv/VLinear;

.field public d:Landroid/widget/TextView;

.field public e:Lv/VRecyclerView;

.field public f:Ll/eqc0;

.field public g:Ljava/lang/String;

.field public h:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

.field public i:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;"
        }
    .end annotation
.end field

.field public j:Ll/h80;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/HashSet;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView;->i:Ljava/util/HashSet;

    .line 10
    .line 11
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView$a;

    .line 12
    .line 13
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView$a;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView;)V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView;->j:Ll/h80;

    .line 17
    .line 18
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 19
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 20
    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView;->i:Ljava/util/HashSet;

    .line 21
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView$a;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView;->j:Ll/h80;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 22
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 23
    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView;->i:Ljava/util/HashSet;

    .line 24
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView$a;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView;->j:Ll/h80;

    return-void
.end method

.method public static synthetic P(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/TopicMoment;)Ljava/lang/Boolean;
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

.method public static bridge synthetic Q(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView;)Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView;->h:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    return-object p0
.end method

.method public static bridge synthetic R(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView;)Ljava/util/HashSet;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView;->i:Ljava/util/HashSet;

    return-object p0
.end method

.method public static bridge synthetic S(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView;->getPageId()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private getPageId()Ljava/lang/String;
    .locals 2

    .line 1
    const-string v0, "qa_latest"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView;->g:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    const-string v0, "topic_latest"

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView;->g:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const-string p0, "p_topic_recommend"

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_1
    :goto_0
    const-string p0, "p_topic_latest"

    .line 26
    .line 27
    return-object p0
.end method

.method private r()V
    .locals 4

    .line 1
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->setOrientation(I)V

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView;->e:Lv/VRecyclerView;

    .line 15
    .line 16
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 17
    .line 18
    .line 19
    new-instance v0, Ll/eqc0;

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView;->g:Ljava/lang/String;

    .line 28
    .line 29
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView;->j:Ll/h80;

    .line 30
    .line 31
    invoke-direct {v0, v1, v2, v3}, Ll/eqc0;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/h80;)V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView;->f:Ll/eqc0;

    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView;->e:Lv/VRecyclerView;

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method


# virtual methods
.method public final T(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/kaj0;->a(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public V()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView;->i:Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/HashSet;->clear()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public W(Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;Ll/pf60;Ljava/lang/String;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/feed/data/TopicOperations;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p2, :cond_4

    .line 3
    .line 4
    iget-object v1, p2, Ll/pf60;->a:Ljava/lang/Object;

    .line 5
    .line 6
    if-eqz v1, :cond_4

    .line 7
    .line 8
    check-cast v1, Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 9
    .line 10
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->recommendTopics:Ljava/util/List;

    .line 11
    .line 12
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-nez v1, :cond_4

    .line 17
    .line 18
    iget-object v1, p2, Ll/pf60;->b:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast v1, Ljava/util/Collection;

    .line 21
    .line 22
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    goto :goto_1

    .line 29
    :cond_0
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView;->g:Ljava/lang/String;

    .line 30
    .line 31
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView;->h:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 32
    .line 33
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView;->d:Landroid/widget/TextView;

    .line 34
    .line 35
    iget-object p3, p2, Ll/pf60;->a:Ljava/lang/Object;

    .line 36
    .line 37
    check-cast p3, Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 38
    .line 39
    iget-object p3, p3, Lcom/p1/mobile/putong/feed/data/TopicOperations;->name:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 42
    .line 43
    .line 44
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView;->r()V

    .line 45
    .line 46
    .line 47
    new-instance p1, Ljava/util/ArrayList;

    .line 48
    .line 49
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 50
    .line 51
    .line 52
    iget-object p3, p2, Ll/pf60;->a:Ljava/lang/Object;

    .line 53
    .line 54
    check-cast p3, Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 55
    .line 56
    iget-object p3, p3, Lcom/p1/mobile/putong/feed/data/TopicOperations;->recommendTopics:Ljava/util/List;

    .line 57
    .line 58
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 59
    .line 60
    .line 61
    move-result-object p3

    .line 62
    :cond_1
    :goto_0
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    if-eqz v1, :cond_2

    .line 67
    .line 68
    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    check-cast v1, Ljava/lang/String;

    .line 73
    .line 74
    iget-object v2, p2, Ll/pf60;->b:Ljava/lang/Object;

    .line 75
    .line 76
    check-cast v2, Ljava/util/Collection;

    .line 77
    .line 78
    new-instance v3, Ll/jaj0;

    .line 79
    .line 80
    invoke-direct {v3, v1}, Ll/jaj0;-><init>(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    invoke-static {v2, v3}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    check-cast v1, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 88
    .line 89
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    if-eqz v2, :cond_1

    .line 94
    .line 95
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_2
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 100
    .line 101
    .line 102
    move-result p2

    .line 103
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView;->c:Lv/VLinear;

    .line 104
    .line 105
    if-eqz p2, :cond_3

    .line 106
    .line 107
    invoke-static {p3, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 108
    .line 109
    .line 110
    return-void

    .line 111
    :cond_3
    const/4 p2, 0x1

    .line 112
    invoke-static {p3, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 113
    .line 114
    .line 115
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView;->f:Ll/eqc0;

    .line 116
    .line 117
    invoke-virtual {p0, p1}, Ll/eqc0;->L(Ljava/util/List;)V

    .line 118
    .line 119
    .line 120
    return-void

    .line 121
    :cond_4
    :goto_1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView;->c:Lv/VLinear;

    .line 122
    .line 123
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 124
    .line 125
    .line 126
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView;->T(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
