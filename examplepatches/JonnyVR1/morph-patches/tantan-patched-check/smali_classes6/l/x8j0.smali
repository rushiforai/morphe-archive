.class public Ll/x8j0;
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
.field public f:Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;


# direct methods
.method public constructor <init>(Ljava/util/List;Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;)V
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
            "Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/r4h;-><init>(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/x8j0;->f:Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic B(Ll/x8j0;Lcom/p1/mobile/putong/feed/data/TopicMoment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/x8j0;->E(Lcom/p1/mobile/putong/feed/data/TopicMoment;Landroid/view/View;)V

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
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/GroupTopicListCombineItemView;->R(Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1, p2}, Ll/x8j0;->D(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final D(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/TopicMoment;)V
    .locals 1

    .line 1
    new-instance v0, Ll/w8j0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p2}, Ll/w8j0;-><init>(Ll/x8j0;Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic E(Lcom/p1/mobile/putong/feed/data/TopicMoment;Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p2, 0x0

    .line 2
    iput-boolean p2, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->selected:Z

    .line 3
    .line 4
    iget-object p0, p0, Ll/x8j0;->f:Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->s(Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    .line 7
    .line 8
    .line 9
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

.method public bridge synthetic j(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/x8j0;->C(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/TopicMoment;II)V

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
    iget-object p0, p0, Ll/x8j0;->f:Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;

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
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/GroupTopicListCombineItemView;->T()V

    .line 13
    .line 14
    .line 15
    return-object p1
.end method
