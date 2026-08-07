.class public Lcom/p1/mobile/putong/feed/newui/group/aggregation/header/FeedGroupAggregationHeaderView;
.super Lv/VFrame;
.source "SourceFile"


# instance fields
.field public a:Lv/VLinear;

.field public b:Lv/VDraweeView;

.field public c:Landroid/widget/TextView;

.field public d:Landroid/widget/TextView;

.field public e:Lv/VImage;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/group/aggregation/header/FeedGroupAggregationHeaderView;->s(Landroid/content/Context;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 9
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/group/aggregation/header/FeedGroupAggregationHeaderView;->s(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 11
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/group/aggregation/header/FeedGroupAggregationHeaderView;->s(Landroid/content/Context;)V

    return-void
.end method

.method private s(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1, p0}, Lcom/p1/mobile/putong/feed/newui/group/aggregation/header/FeedGroupAggregationHeaderView;->p(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public p(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/d6h;->b(Lcom/p1/mobile/putong/feed/newui/group/aggregation/header/FeedGroupAggregationHeaderView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public u(Lcom/p1/mobile/putong/feed/data/TopicMoment;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/group/aggregation/header/FeedGroupAggregationHeaderView;->d:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/TopicMoment;->isTopicAnonymousType()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/TopicMoment;->isEnterGroup()Z

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    if-eqz p2, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/aggregation/header/FeedGroupAggregationHeaderView;->c:Landroid/widget/TextView;

    .line 17
    .line 18
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->name:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->name:Ljava/lang/String;

    .line 25
    .line 26
    const/16 p2, 0xf

    .line 27
    .line 28
    invoke-static {p1, p2}, Ll/h9i;->k(Ljava/lang/String;I)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/aggregation/header/FeedGroupAggregationHeaderView;->c:Landroid/widget/TextView;

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method
