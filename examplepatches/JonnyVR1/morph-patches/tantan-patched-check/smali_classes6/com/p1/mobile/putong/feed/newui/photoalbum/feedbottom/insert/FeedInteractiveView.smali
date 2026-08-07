.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveView;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;

.field public e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Interactive;",
            ">;"
        }
    .end annotation
.end field


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

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public P(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Ljava/lang/String;ZI)Landroid/view/View;
    .locals 7

    .line 1
    iput-object p4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveView;->c:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {}, Ll/cmg;->x()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    return-object v1

    .line 11
    :cond_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 12
    .line 13
    .line 14
    invoke-static {}, Ll/cmg;->g()Ljava/util/List;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p2}, Lcom/p1/mobile/putong/feed/data/Moment;->getTopicList()Ljava/util/List;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-nez v2, :cond_6

    .line 27
    .line 28
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-eqz v2, :cond_1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    new-instance v2, Ljava/util/ArrayList;

    .line 36
    .line 37
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveView;->e:Ljava/util/List;

    .line 41
    .line 42
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    :cond_2
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    if-eqz v2, :cond_4

    .line 51
    .line 52
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    check-cast v2, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 57
    .line 58
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    :cond_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 63
    .line 64
    .line 65
    move-result v4

    .line 66
    if-eqz v4, :cond_2

    .line 67
    .line 68
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v4

    .line 72
    check-cast v4, Lcom/p1/mobile/putong/feed/data/Interactive;

    .line 73
    .line 74
    iget-object v5, v4, Lcom/p1/mobile/putong/feed/data/Interactive;->topic:Ljava/lang/String;

    .line 75
    .line 76
    iget-object v6, v2, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 77
    .line 78
    invoke-static {v5, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 79
    .line 80
    .line 81
    move-result v5

    .line 82
    if-eqz v5, :cond_3

    .line 83
    .line 84
    iget-object p2, v4, Lcom/p1/mobile/putong/feed/data/Interactive;->topic:Ljava/lang/String;

    .line 85
    .line 86
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveView;->d:Ljava/lang/String;

    .line 87
    .line 88
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveView;->e:Ljava/util/List;

    .line 89
    .line 90
    invoke-interface {p2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    :cond_4
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveView;->e:Ljava/util/List;

    .line 94
    .line 95
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 96
    .line 97
    .line 98
    move-result p2

    .line 99
    if-eqz p2, :cond_5

    .line 100
    .line 101
    return-object v1

    .line 102
    :cond_5
    new-instance p2, Ll/kah;

    .line 103
    .line 104
    invoke-direct {p2}, Ll/kah;-><init>()V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p2, p1}, Ll/kah;->i(Lcom/p1/mobile/android/app/Act;)Ll/kah;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveView;->e:Ljava/util/List;

    .line 112
    .line 113
    invoke-virtual {p1, v0}, Ll/kah;->l(Ljava/util/List;)Ll/kah;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    invoke-virtual {p1, p4}, Ll/kah;->o(Ljava/lang/String;)Ll/kah;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    invoke-virtual {p1, p3}, Ll/kah;->k(Ljava/lang/String;)Ll/kah;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    invoke-static {p5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 126
    .line 127
    .line 128
    move-result-object p3

    .line 129
    invoke-virtual {p1, p3}, Ll/kah;->j(Ljava/lang/Boolean;)Ll/kah;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    invoke-virtual {p1, p6}, Ll/kah;->n(I)Ll/kah;

    .line 134
    .line 135
    .line 136
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveView;->Q(Ll/kah;)Landroid/view/View;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    return-object p0

    .line 141
    :cond_6
    :goto_0
    return-object v1
.end method

.method public Q(Ll/kah;)Landroid/view/View;
    .locals 4

    .line 1
    invoke-virtual {p1}, Ll/kah;->c()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p1}, Ll/kah;->a()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    instance-of v0, v0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicAggregationActivity;

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveFlowView;

    .line 21
    .line 22
    invoke-virtual {p1}, Ll/kah;->a()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveFlowView;-><init>(Landroid/content/Context;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1}, Ll/kah;->f()Ll/y20;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveFlowView;->setOnViewRender(Ll/y20;)V

    .line 34
    .line 35
    .line 36
    const/high16 v1, 0x40000000    # 2.0f

    .line 37
    .line 38
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    invoke-virtual {p1, v1}, Ll/kah;->m(I)Ll/kah;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveFlowView;->u(Ll/kah;)V

    .line 46
    .line 47
    .line 48
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 49
    .line 50
    const/4 v2, -0x2

    .line 51
    invoke-direct {v1, v2, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p1}, Ll/kah;->e()I

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    const/high16 v2, 0x41800000    # 16.0f

    .line 59
    .line 60
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    const/4 v3, 0x0

    .line 65
    invoke-virtual {v1, p1, v3, v2, v3}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 72
    .line 73
    .line 74
    return-object v0

    .line 75
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 76
    return-object p0
.end method

.method public R()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveView;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveView;->c:Ljava/lang/String;

    .line 11
    .line 12
    const-string v1, "topic_id"

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveView;->d:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {v1, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    filled-new-array {p0}, [Ll/pf60;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const-string v1, "e_topic_activity_entry"

    .line 25
    .line 26
    invoke-static {v1, v0, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method
