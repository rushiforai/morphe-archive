.class public Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionInFeedVoteView;
.super Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;
.source "SourceFile"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 7
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public C(Ll/l1i;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->C(Ll/l1i;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->B(Ll/l1i;)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;->b:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicVoteBgView;

    .line 11
    .line 12
    const-string p1, "#33FE7E1D"

    .line 13
    .line 14
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicVoteBgView;->setColor(I)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public E(Ll/l1i;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->E(Ll/l1i;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->B(Ll/l1i;)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;->b:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicVoteBgView;

    .line 11
    .line 12
    const-string p1, "#ededed"

    .line 13
    .line 14
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicVoteBgView;->setColor(I)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public F(Ll/l1i;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->F(Ll/l1i;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->getQaTopicVoteViewList()Ljava/util/List;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;

    .line 23
    .line 24
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;->c:Landroid/widget/TextView;

    .line 25
    .line 26
    const/16 v0, 0x13

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setGravity(I)V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    return-void
.end method

.method public G(Ll/l1i;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->G(Ll/l1i;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->getQaTopicVoteViewList()Ljava/util/List;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;

    .line 23
    .line 24
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;->c:Landroid/widget/TextView;

    .line 25
    .line 26
    const/16 v2, 0x11

    .line 27
    .line 28
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setGravity(I)V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->B(Ll/l1i;)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;

    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;->a:Landroid/widget/RelativeLayout;

    .line 39
    .line 40
    sget p1, Ll/lbc0;->R5:I

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public K(Landroid/content/Context;)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->K(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/high16 p1, 0x40c00000    # 6.0f

    .line 5
    .line 6
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    invoke-static {p0, v0}, Ll/bnl0;->f0(Landroid/view/View;I)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->getQaTopicVoteViewList()Ljava/util/List;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;

    .line 32
    .line 33
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;->b:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicVoteBgView;

    .line 34
    .line 35
    const/high16 v2, 0x41000000    # 8.0f

    .line 36
    .line 37
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    int-to-float v2, v2

    .line 42
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicVoteBgView;->setRadius(F)V

    .line 43
    .line 44
    .line 45
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;->b:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicVoteBgView;

    .line 46
    .line 47
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    check-cast v1, Landroid/view/View;

    .line 52
    .line 53
    sget v2, Ll/lbc0;->R5:I

    .line 54
    .line 55
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 56
    .line 57
    .line 58
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;->c:Landroid/widget/TextView;

    .line 59
    .line 60
    const/high16 v2, 0x41400000    # 12.0f

    .line 61
    .line 62
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    invoke-static {v1, v3}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 67
    .line 68
    .line 69
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;->d:Lv/VText;

    .line 70
    .line 71
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    check-cast v1, Landroid/view/ViewGroup;

    .line 76
    .line 77
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    invoke-static {v1, v2}, Ll/bnl0;->e0(Landroid/view/View;I)V

    .line 82
    .line 83
    .line 84
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;->b:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicVoteBgView;

    .line 85
    .line 86
    const/4 v2, 0x0

    .line 87
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicVoteBgView;->setWidthOffset(F)V

    .line 88
    .line 89
    .line 90
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;->c:Landroid/widget/TextView;

    .line 91
    .line 92
    const/16 v2, 0x11

    .line 93
    .line 94
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setGravity(I)V

    .line 95
    .line 96
    .line 97
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;->c:Landroid/widget/TextView;

    .line 98
    .line 99
    const/high16 v2, 0x41600000    # 14.0f

    .line 100
    .line 101
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 102
    .line 103
    .line 104
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 109
    .line 110
    .line 111
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;->b:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicVoteBgView;

    .line 112
    .line 113
    const/high16 v2, 0x42380000    # 46.0f

    .line 114
    .line 115
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 116
    .line 117
    .line 118
    move-result v3

    .line 119
    invoke-static {v1, v3}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 120
    .line 121
    .line 122
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;->d:Lv/VText;

    .line 123
    .line 124
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    check-cast v1, Landroid/view/ViewGroup;

    .line 129
    .line 130
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 131
    .line 132
    .line 133
    move-result v3

    .line 134
    invoke-static {v1, v3}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 135
    .line 136
    .line 137
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;->a:Landroid/widget/RelativeLayout;

    .line 138
    .line 139
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    invoke-static {v0, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 144
    .line 145
    .line 146
    goto :goto_0

    .line 147
    :cond_0
    return-void
.end method

.method public getRadius()I
    .locals 0

    .line 1
    const/high16 p0, 0x41000000    # 8.0f

    .line 2
    .line 3
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public u()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method
