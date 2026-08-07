.class public Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedVoteContainer;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;

.field public b:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;

.field public c:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;

.field public d:Ljava/lang/String;

.field public e:Lcom/p1/mobile/putong/feed/data/TopicMoment;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 7
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method


# virtual methods
.method public final a()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method public b(Lcom/p1/mobile/putong/feed/data/TopicMoment;ZLjava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->options:Ljava/util/List;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedVoteContainer;->a()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    instance-of v0, v0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicAggregationActivity;

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    const-string v0, "p_topic_recommend"

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    const/4 v0, 0x0

    .line 18
    :goto_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-nez v1, :cond_2

    .line 23
    .line 24
    const-string v1, "topic_id"

    .line 25
    .line 26
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 27
    .line 28
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    filled-new-array {v1}, [Ll/pf60;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    const-string v2, "e_qa_optional"

    .line 37
    .line 38
    invoke-static {v2, v0, v1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 39
    .line 40
    .line 41
    :cond_2
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedVoteContainer;->e:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 42
    .line 43
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedVoteContainer;->d:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {}, Ll/cmg;->m0()Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_5

    .line 50
    .line 51
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->options:Ljava/util/List;

    .line 52
    .line 53
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    const/4 v1, 0x2

    .line 58
    if-ne v0, v1, :cond_5

    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedVoteContainer;->a:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;

    .line 61
    .line 62
    if-eqz v0, :cond_3

    .line 63
    .line 64
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedVoteContainer;->c:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;

    .line 65
    .line 66
    goto :goto_3

    .line 67
    :cond_3
    if-eqz p2, :cond_4

    .line 68
    .line 69
    new-instance p2, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionInFeedVoteView;

    .line 70
    .line 71
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-direct {p2, v0, p3}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionInFeedVoteView;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_4
    new-instance p2, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;

    .line 80
    .line 81
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-direct {p2, v0, p3}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    :goto_1
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedVoteContainer;->a:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;

    .line 89
    .line 90
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedVoteContainer;->c:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;

    .line 91
    .line 92
    goto :goto_3

    .line 93
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedVoteContainer;->b:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;

    .line 94
    .line 95
    if-eqz v0, :cond_6

    .line 96
    .line 97
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedVoteContainer;->c:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;

    .line 98
    .line 99
    goto :goto_3

    .line 100
    :cond_6
    if-eqz p2, :cond_7

    .line 101
    .line 102
    new-instance p2, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionInFeedVoteView;

    .line 103
    .line 104
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-direct {p2, v0, p3}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionInFeedVoteView;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    goto :goto_2

    .line 112
    :cond_7
    new-instance p2, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;

    .line 113
    .line 114
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    invoke-direct {p2, v0, p3}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    :goto_2
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedVoteContainer;->b:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;

    .line 122
    .line 123
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedVoteContainer;->c:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;

    .line 124
    .line 125
    :goto_3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 126
    .line 127
    .line 128
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedVoteContainer;->c:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;

    .line 129
    .line 130
    invoke-virtual {p2}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->getView()Landroid/view/View;

    .line 131
    .line 132
    .line 133
    move-result-object p2

    .line 134
    invoke-virtual {p0, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 135
    .line 136
    .line 137
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedVoteContainer;->c:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;

    .line 138
    .line 139
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->O(Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    .line 140
    .line 141
    .line 142
    return-void
.end method

.method public getItemAnimTime()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedVoteContainer;->c:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->getAnimTime()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public getShowVoteListView()Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedVoteContainer;->c:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;

    .line 2
    .line 3
    return-object p0
.end method
