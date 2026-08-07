.class public Ll/z8j0;
.super Ll/r4h;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/r4h<",
        "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
        ">;"
    }
.end annotation


# instance fields
.field public f:Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/selecteditem/FeedPostSelectedTopicsView;

.field public g:Z

.field public h:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/selecteditem/FeedPostSelectedTopicsView;Z)V
    .locals 0
    .param p1    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;",
            "Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/selecteditem/FeedPostSelectedTopicsView;",
            "Z)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/r4h;-><init>(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/z8j0;->f:Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/selecteditem/FeedPostSelectedTopicsView;

    .line 5
    .line 6
    iput-boolean p3, p0, Ll/z8j0;->g:Z

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic B(Ll/z8j0;ILcom/p1/mobile/putong/feed/data/TopicMoment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/z8j0;->E(ILcom/p1/mobile/putong/feed/data/TopicMoment;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public C(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/TopicMoment;II)V
    .locals 0

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/GroupTopicListCombineItemView;

    .line 5
    .line 6
    const/4 p4, 0x1

    .line 7
    if-ne p3, p4, :cond_1

    .line 8
    .line 9
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/GroupTopicListCombineItemView;->R(Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    .line 10
    .line 11
    .line 12
    iget-boolean p4, p2, Lcom/p1/mobile/putong/feed/data/TopicMoment;->selected:Z

    .line 13
    .line 14
    invoke-virtual {p1, p4}, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/GroupTopicListCombineItemView;->setViewSelectedNoDelete(Z)V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_1
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/GroupTopicListCombineItemView;->R(Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1, p4}, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/GroupTopicListCombineItemView;->setViewSelected(Z)V

    .line 22
    .line 23
    .line 24
    :goto_0
    invoke-virtual {p0, p1, p2, p3}, Ll/z8j0;->D(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/TopicMoment;I)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final D(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/TopicMoment;I)V
    .locals 1

    .line 1
    new-instance v0, Ll/y8j0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p3, p2}, Ll/y8j0;-><init>(Ll/z8j0;ILcom/p1/mobile/putong/feed/data/TopicMoment;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic E(ILcom/p1/mobile/putong/feed/data/TopicMoment;Landroid/view/View;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput-boolean p1, p2, Lcom/p1/mobile/putong/feed/data/TopicMoment;->selected:Z

    .line 5
    .line 6
    iget-object p0, p0, Ll/z8j0;->f:Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/selecteditem/FeedPostSelectedTopicsView;

    .line 7
    .line 8
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/selecteditem/FeedPostSelectedTopicsView;->g(Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object p1, p0, Ll/z8j0;->h:Ll/y20;

    .line 13
    .line 14
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    iget-object p0, p0, Ll/z8j0;->h:Ll/y20;

    .line 21
    .line 22
    invoke-interface {p0, p2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    :cond_1
    return-void
.end method

.method public F(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1}, Ll/r4h;->z(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public getItemViewType(I)I
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/z8j0;->g:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x1

    .line 8
    return p0
.end method

.method public bridge synthetic j(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/z8j0;->C(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/TopicMoment;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public m(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 0

    .line 1
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/GroupTopicListCombineItemView;

    .line 2
    .line 3
    iget-object p0, p0, Ll/z8j0;->f:Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/selecteditem/FeedPostSelectedTopicsView;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/GroupTopicListCombineItemView;-><init>(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/GroupTopicListCombineItemView;->S()V

    .line 13
    .line 14
    .line 15
    return-object p1
.end method
