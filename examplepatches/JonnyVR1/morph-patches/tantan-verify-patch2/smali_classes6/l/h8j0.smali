.class public Ll/h8j0;
.super Ll/i6;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6<",
        "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
        ">;"
    }
.end annotation


# instance fields
.field public j:Ll/s8j0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/app/PutongAct;Ll/s8j0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/i6;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/h8j0;->j:Ll/s8j0;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic I(Ll/h8j0;Lcom/p1/mobile/putong/feed/data/TopicMoment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/h8j0;->L(Lcom/p1/mobile/putong/feed/data/TopicMoment;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/h8j0;->J(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/TopicMoment;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    if-eq p2, v0, :cond_0

    .line 3
    .line 4
    invoke-super {p0, p1, p2}, Ll/i6;->D(Landroid/view/ViewGroup;I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0

    .line 9
    :cond_0
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicListItemView;

    .line 10
    .line 11
    iget-object p0, p0, Ll/i6;->g:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicListItemView;-><init>(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    return-object p1
.end method

.method public bridge synthetic F(Landroid/view/View;Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/h8j0;->K(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public J(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/TopicMoment;II)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Ll/i6;->A(Landroid/view/View;Ljava/lang/Object;II)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p4}, Ll/i6;->getItemViewType(I)I

    .line 5
    .line 6
    .line 7
    move-result p3

    .line 8
    const/4 v0, 0x2

    .line 9
    if-eq p3, v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 13
    .line 14
    .line 15
    move-result-object p3

    .line 16
    const-string v0, "p_pick_topic"

    .line 17
    .line 18
    invoke-virtual {p3, p2, v0}, Ll/er60;->c(Lcom/p1/mobile/putong/feed/data/TopicMoment;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicListItemView;

    .line 22
    .line 23
    invoke-virtual {p0, p4}, Ll/i6;->getItem(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 28
    .line 29
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->selected:Z

    .line 30
    .line 31
    if-eqz p0, :cond_1

    .line 32
    .line 33
    const-string p0, "#d46814"

    .line 34
    .line 35
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicListItemView;->setContentTextColor(I)V

    .line 40
    .line 41
    .line 42
    sget p0, Ll/lbc0;->G6:I

    .line 43
    .line 44
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicListItemView;->setContentBackgroundResource(I)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_1
    const-string p0, "#4a4a4a"

    .line 49
    .line 50
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicListItemView;->setContentTextColor(I)V

    .line 55
    .line 56
    .line 57
    sget p0, Ll/lbc0;->F6:I

    .line 58
    .line 59
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicListItemView;->setContentBackgroundResource(I)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public K(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/TopicMoment;)V
    .locals 1

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicListItemView;

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicListItemView;->S(Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p2}, Lcom/p1/mobile/putong/feed/data/TopicMoment;->isTopicAnonymousType()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicListItemView;->setAnonymousTextViewVisible(Z)V

    .line 11
    .line 12
    .line 13
    new-instance v0, Ll/g8j0;

    .line 14
    .line 15
    invoke-direct {v0, p0, p2}, Ll/g8j0;-><init>(Ll/h8j0;Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    .line 16
    .line 17
    .line 18
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic L(Lcom/p1/mobile/putong/feed/data/TopicMoment;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    const-string v0, "p_pick_topic"

    .line 6
    .line 7
    invoke-virtual {p2, p1, v0}, Ll/er60;->a(Lcom/p1/mobile/putong/feed/data/TopicMoment;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/h8j0;->j:Ll/s8j0;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/s8j0;->x0(Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public e(I)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/i6;->G()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/i6;->f:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-lez v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/i6;->f:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    sub-int/2addr v0, p1

    .line 22
    const/16 p1, 0xa

    .line 23
    .line 24
    if-ge v0, p1, :cond_0

    .line 25
    .line 26
    iget-object p0, p0, Ll/h8j0;->j:Ll/s8j0;

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/s8j0;->p0()V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method
