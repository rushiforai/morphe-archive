.class public Ll/l9j0;
.super Ll/kic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/kic0<",
        "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
        ">;"
    }
.end annotation


# static fields
.field public static e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public d:Lcom/p1/mobile/android/app/Act;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/l9j0;->e:Ljava/util/List;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/kic0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/l9j0;->d:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic F(Ll/l9j0;Lcom/p1/mobile/putong/feed/data/TopicMoment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/l9j0;->I(Lcom/p1/mobile/putong/feed/data/TopicMoment;Landroid/view/View;)V

    return-void
.end method

.method private synthetic I(Lcom/p1/mobile/putong/feed/data/TopicMoment;Landroid/view/View;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/TopicMoment;->isTopicLinkType()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    iget-object p2, p0, Ll/l9j0;->d:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/TopicMoment;->getTopicNameWithPrefix()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->landingPage:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {p2, v0, v1}, Ll/orb0;->j(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p2, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/TopicMoment;->isTopicVoteType()Z

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    if-eqz p2, :cond_1

    .line 28
    .line 29
    iget-object p2, p0, Ll/l9j0;->d:Lcom/p1/mobile/android/app/Act;

    .line 30
    .line 31
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 32
    .line 33
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->owner:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 34
    .line 35
    iget-object v1, v1, Lcom/p1/mobile/putong/data/IdBoxed;->id:Ljava/lang/String;

    .line 36
    .line 37
    const-string v2, "-1"

    .line 38
    .line 39
    invoke-static {p2, v0, v1, v2}, Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationAct;->X1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p2, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/TopicMoment;->isQATopicType()Z

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    const-string v0, "from_topic_nearby_header"

    .line 52
    .line 53
    if-eqz p2, :cond_2

    .line 54
    .line 55
    iget-object p2, p0, Ll/l9j0;->d:Lcom/p1/mobile/android/app/Act;

    .line 56
    .line 57
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 58
    .line 59
    invoke-static {p2, v1, v0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicAggregationActivity;->X1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {p2, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 64
    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_2
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    invoke-virtual {p2, p1}, Ll/er60;->E(Lcom/p1/mobile/putong/feed/data/TopicMoment;)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p2

    .line 75
    iget-object v1, p0, Ll/l9j0;->d:Lcom/p1/mobile/android/app/Act;

    .line 76
    .line 77
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 78
    .line 79
    const/4 v3, 0x1

    .line 80
    invoke-static {v1, v2, v0, v3, p2}, Lcom/p1/mobile/putong/feed/newui/topic/topicaggregation/TopicAggregationAct;->X1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Landroid/content/Intent;

    .line 81
    .line 82
    .line 83
    move-result-object p2

    .line 84
    invoke-virtual {v1, p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 85
    .line 86
    .line 87
    :goto_0
    iget-object p0, p0, Ll/l9j0;->d:Lcom/p1/mobile/android/app/Act;

    .line 88
    .line 89
    instance-of p0, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct;

    .line 90
    .line 91
    if-eqz p0, :cond_3

    .line 92
    .line 93
    const-string p0, "topic_id"

    .line 94
    .line 95
    iget-object p2, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 96
    .line 97
    invoke-static {p0, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    iget-object p2, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->owner:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 102
    .line 103
    iget-object p2, p2, Lcom/p1/mobile/putong/data/IdBoxed;->id:Ljava/lang/String;

    .line 104
    .line 105
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    move-result p2

    .line 117
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 118
    .line 119
    .line 120
    move-result-object p2

    .line 121
    const-string v0, "is_create"

    .line 122
    .line 123
    invoke-static {v0, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 124
    .line 125
    .line 126
    move-result-object p2

    .line 127
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-virtual {v0, p1}, Ll/er60;->E(Lcom/p1/mobile/putong/feed/data/TopicMoment;)Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    const-string v0, "topic_type"

    .line 136
    .line 137
    invoke-static {v0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    const-string v0, "topic_source"

    .line 142
    .line 143
    const-string v1, "circle_hot_topic"

    .line 144
    .line 145
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    filled-new-array {p0, p2, p1, v0}, [Ll/pf60;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    const-string p1, "e_topic"

    .line 154
    .line 155
    const-string p2, "p_circle_detail"

    .line 156
    .line 157
    invoke-static {p1, p2, p0}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 158
    .line 159
    .line 160
    return-void

    .line 161
    :cond_3
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    const-string p2, "p_nearby"

    .line 166
    .line 167
    invoke-virtual {p0, p1, p2}, Ll/er60;->a(Lcom/p1/mobile/putong/feed/data/TopicMoment;Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/l9j0;->G(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/TopicMoment;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    sget-object p0, Ll/l9j0;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 0

    .line 1
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicListItemView;

    .line 2
    .line 3
    iget-object p0, p0, Ll/l9j0;->d:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicListItemView;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    new-instance p0, Landroid/widget/LinearLayout$LayoutParams;

    .line 9
    .line 10
    const/4 p2, -0x2

    .line 11
    invoke-direct {p0, p2, p2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicListItemView;->setContentLayoutParams(Landroid/widget/LinearLayout$LayoutParams;)V

    .line 15
    .line 16
    .line 17
    return-object p1
.end method

.method public G(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/TopicMoment;II)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicListItemView;

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicListItemView;->S(Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    .line 4
    .line 5
    .line 6
    new-instance p3, Ll/k9j0;

    .line 7
    .line 8
    invoke-direct {p3, p0, p2}, Ll/k9j0;-><init>(Ll/l9j0;Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p1, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public H(I)Lcom/p1/mobile/putong/feed/data/TopicMoment;
    .locals 0

    .line 1
    sget-object p0, Ll/l9j0;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 8
    .line 9
    return-object p0
.end method

.method public J(Ljava/util/List;)V
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
    sput-object p1, Ll/l9j0;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/l9j0;->H(I)Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
