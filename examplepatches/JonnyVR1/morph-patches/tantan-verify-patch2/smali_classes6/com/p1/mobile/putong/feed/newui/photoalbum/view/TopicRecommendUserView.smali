.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserView;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lv/VLinear;

.field public d:Landroid/widget/TextView;

.field public e:Lv/VRecyclerView;

.field public f:Ll/hqc0;

.field public g:Ljava/lang/String;

.field public h:I

.field public i:Ll/h80;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserView$a;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserView$a;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserView;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserView;->i:Ll/h80;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 12
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserView$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserView$a;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserView;->i:Ll/h80;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 14
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 15
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserView$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserView$a;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserView;->i:Ll/h80;

    return-void
.end method

.method public static bridge synthetic P(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserView;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserView;->getPageId()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private getPageId()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Ll/cmg;->s()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserView;->h:I

    .line 8
    .line 9
    const/16 v0, 0xe

    .line 10
    .line 11
    if-ne p0, v0, :cond_0

    .line 12
    .line 13
    const-string p0, "p_discover_dating"

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    const/16 v0, 0xf

    .line 17
    .line 18
    if-ne p0, v0, :cond_1

    .line 19
    .line 20
    const-string p0, "p_discover_discussion"

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_1
    const-string p0, "p_follow"

    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_2
    const-string p0, "p_nearby"

    .line 27
    .line 28
    return-object p0
.end method

.method private r()V
    .locals 5

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserView;->e:Lv/VRecyclerView;

    .line 15
    .line 16
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 17
    .line 18
    .line 19
    new-instance v0, Ll/hqc0;

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
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserView;->h:I

    .line 28
    .line 29
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserView;->g:Ljava/lang/String;

    .line 30
    .line 31
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserView;->i:Ll/h80;

    .line 32
    .line 33
    invoke-direct {v0, v1, v2, v3, v4}, Ll/hqc0;-><init>(Lcom/p1/mobile/android/app/Act;ILjava/lang/String;Ll/h80;)V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserView;->f:Ll/hqc0;

    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserView;->e:Lv/VRecyclerView;

    .line 39
    .line 40
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method


# virtual methods
.method public final Q(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/taj0;->a(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public R(Ll/pf60;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/RecommendUsers;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;>;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "I)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v0, Ljava/util/Collection;

    .line 6
    .line 7
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v0, Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    const/4 v1, 0x2

    .line 22
    if-ge v0, v1, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserView;->c:Lv/VLinear;

    .line 26
    .line 27
    const/4 v1, 0x1

    .line 28
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    iput p4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserView;->h:I

    .line 32
    .line 33
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserView;->g:Ljava/lang/String;

    .line 34
    .line 35
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserView;->d:Landroid/widget/TextView;

    .line 36
    .line 37
    invoke-virtual {p3, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 38
    .line 39
    .line 40
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserView;->r()V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserView;->f:Ll/hqc0;

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Ll/hqc0;->N(Ll/pf60;)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserView;->c:Lv/VLinear;

    .line 50
    .line 51
    const/4 p1, 0x0

    .line 52
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendUserView;->Q(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
