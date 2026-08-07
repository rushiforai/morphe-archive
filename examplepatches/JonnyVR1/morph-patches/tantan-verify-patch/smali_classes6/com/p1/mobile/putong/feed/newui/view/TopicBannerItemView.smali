.class public Lcom/p1/mobile/putong/feed/newui/view/TopicBannerItemView;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lcom/p1/mobile/putong/feed/newui/view/TopicBannerItemView;

.field public d:Lv/VRecyclerView;

.field public e:Lv/VRecyclerView;

.field public f:Ll/x7j0;

.field public g:Ll/x7j0;

.field public h:Lcom/p1/mobile/android/app/Act;

.field public i:I

.field public j:I

.field public k:Ll/h80;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic P(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/TopicMoment;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

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

.method private r()V
    .locals 5

    .line 1
    new-instance v0, Ll/x7j0;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicBannerItemView;->h:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicBannerItemView;->i:I

    .line 6
    .line 7
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicBannerItemView;->j:I

    .line 8
    .line 9
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicBannerItemView;->k:Ll/h80;

    .line 10
    .line 11
    invoke-direct {v0, v1, v2, v3, v4}, Ll/x7j0;-><init>(Lcom/p1/mobile/android/app/Act;IILl/h80;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicBannerItemView;->f:Ll/x7j0;

    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicBannerItemView;->d:Lv/VRecyclerView;

    .line 17
    .line 18
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 19
    .line 20
    .line 21
    new-instance v0, Ll/x7j0;

    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicBannerItemView;->h:Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicBannerItemView;->i:I

    .line 26
    .line 27
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicBannerItemView;->j:I

    .line 28
    .line 29
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicBannerItemView;->k:Ll/h80;

    .line 30
    .line 31
    invoke-direct {v0, v1, v2, v3, v4}, Ll/x7j0;-><init>(Lcom/p1/mobile/android/app/Act;IILl/h80;)V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicBannerItemView;->g:Ll/x7j0;

    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicBannerItemView;->e:Lv/VRecyclerView;

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method


# virtual methods
.method public final Q(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/v7j0;->a(Lcom/p1/mobile/putong/feed/newui/view/TopicBannerItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final R(Lcom/p1/mobile/putong/feed/data/CategoryTopic;Ljava/util/List;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/feed/data/CategoryTopic;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/CategoryTopic;->topicIds:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Ljava/lang/String;

    .line 29
    .line 30
    new-instance v1, Ll/u7j0;

    .line 31
    .line 32
    invoke-direct {v1, v0}, Ll/u7j0;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-static {p2, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 40
    .line 41
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-eqz v1, :cond_0

    .line 46
    .line 47
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    return-object p0
.end method

.method public S(Lcom/p1/mobile/putong/feed/data/CategoryTopic;Lcom/p1/mobile/putong/feed/data/CategoryTopic;Ljava/util/List;IILl/h80;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/feed/data/CategoryTopic;",
            "Lcom/p1/mobile/putong/feed/data/CategoryTopic;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;II",
            "Ll/h80;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iput-object p6, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicBannerItemView;->k:Ll/h80;

    .line 11
    .line 12
    iput p4, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicBannerItemView;->i:I

    .line 13
    .line 14
    iput p5, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicBannerItemView;->j:I

    .line 15
    .line 16
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/view/TopicBannerItemView;->r()V

    .line 17
    .line 18
    .line 19
    iget-object p4, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicBannerItemView;->f:Ll/x7j0;

    .line 20
    .line 21
    invoke-virtual {p0, p1, p3}, Lcom/p1/mobile/putong/feed/newui/view/TopicBannerItemView;->R(Lcom/p1/mobile/putong/feed/data/CategoryTopic;Ljava/util/List;)Ljava/util/List;

    .line 22
    .line 23
    .line 24
    move-result-object p5

    .line 25
    invoke-virtual {p4, p1, p5}, Ll/x7j0;->M(Lcom/p1/mobile/putong/feed/data/CategoryTopic;Ljava/util/List;)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicBannerItemView;->g:Ll/x7j0;

    .line 29
    .line 30
    invoke-virtual {p0, p2, p3}, Lcom/p1/mobile/putong/feed/newui/view/TopicBannerItemView;->R(Lcom/p1/mobile/putong/feed/data/CategoryTopic;Ljava/util/List;)Ljava/util/List;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p1, p2, p0}, Ll/x7j0;->M(Lcom/p1/mobile/putong/feed/data/CategoryTopic;Ljava/util/List;)V

    .line 35
    .line 36
    .line 37
    :cond_1
    :goto_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/view/TopicBannerItemView;->Q(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicBannerItemView;->h:Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    return-void
.end method
