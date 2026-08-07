.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedTopicFlowView;
.super Lv/VFrame;
.source "SourceFile"


# instance fields
.field public a:Ll/oah;

.field public b:Ll/r4h$a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/r4h$a<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;"
        }
    .end annotation
.end field

.field public c:Z

.field public d:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedTopicFlowView;->w(Landroid/content/Context;)V

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
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedTopicFlowView;->w(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 11
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedTopicFlowView;->w(Landroid/content/Context;)V

    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedTopicFlowView;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Landroid/view/View;Lcom/p1/mobile/putong/feed/data/TopicMoment;I)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedTopicFlowView;->z(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Landroid/view/View;Lcom/p1/mobile/putong/feed/data/TopicMoment;I)V

    return-void
.end method

.method private w(Landroid/content/Context;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public B(Lcom/p1/mobile/android/app/Act;Ljava/util/List;Ljava/lang/String;IZLjava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;",
            "Ljava/lang/String;",
            "IZ",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedTopicFlowView;->a:Ll/oah;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedTopicFlowView;->v(Lcom/p1/mobile/android/app/Act;Ljava/util/List;Ljava/lang/String;IZLjava/lang/String;)Lorg/apmem/tools/layouts/FlowLayout;

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

    .line 13
    :cond_0
    invoke-virtual {v0, p2}, Ll/oah;->C(Ljava/util/List;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedTopicFlowView;->a:Ll/oah;

    .line 17
    .line 18
    iget-boolean p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedTopicFlowView;->c:Z

    .line 19
    .line 20
    invoke-virtual {p1, p2}, Ll/oah;->E(Z)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedTopicFlowView;->a:Ll/oah;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/r4h;->notifyDataSetChanged()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public getAdapter()Ll/oah;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedTopicFlowView;->a:Ll/oah;

    .line 2
    .line 3
    return-object p0
.end method

.method public s(Lcom/p1/mobile/putong/feed/data/TopicMoment;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedTopicFlowView;->u(Lcom/p1/mobile/putong/feed/data/TopicMoment;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p1, 0x0

    .line 6
    new-array p1, p1, [Ll/pf60;

    .line 7
    .line 8
    invoke-interface {p0, p1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, [Ll/pf60;

    .line 13
    .line 14
    const-string p1, "e_circle_tag"

    .line 15
    .line 16
    invoke-static {p1, p2, p0}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public setOnItemClick(Ll/r4h$a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/r4h$a<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedTopicFlowView;->b:Ll/r4h$a;

    .line 2
    .line 3
    return-void
.end method

.method public setOnViewRender(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedTopicFlowView;->d:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public setWithCancelIcon(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedTopicFlowView;->c:Z

    .line 2
    .line 3
    return-void
.end method

.method public final u(Lcom/p1/mobile/putong/feed/data/TopicMoment;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ")",
            "Ljava/util/List<",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
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
    const-string v0, "circle_id"

    .line 7
    .line 8
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    const-string v0, "moment_id"

    .line 18
    .line 19
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->momentId:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {v0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    return-object p0
.end method

.method public final v(Lcom/p1/mobile/android/app/Act;Ljava/util/List;Ljava/lang/String;IZLjava/lang/String;)Lorg/apmem/tools/layouts/FlowLayout;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;",
            "Ljava/lang/String;",
            "IZ",
            "Ljava/lang/String;",
            ")",
            "Lorg/apmem/tools/layouts/FlowLayout;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Lorg/apmem/tools/layouts/FlowLayout;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lorg/apmem/tools/layouts/FlowLayout;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/oah;

    .line 7
    .line 8
    move-object v3, p1

    .line 9
    move-object v2, p2

    .line 10
    move v4, p4

    .line 11
    move v5, p5

    .line 12
    move-object v6, p6

    .line 13
    invoke-direct/range {v1 .. v6}, Ll/oah;-><init>(Ljava/util/List;Lcom/p1/mobile/android/app/Act;IZLjava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedTopicFlowView;->a:Ll/oah;

    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedTopicFlowView;->d:Ll/y20;

    .line 19
    .line 20
    invoke-virtual {v1, p1}, Ll/oah;->D(Ll/y20;)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedTopicFlowView;->a:Ll/oah;

    .line 24
    .line 25
    iget-boolean p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedTopicFlowView;->c:Z

    .line 26
    .line 27
    invoke-virtual {p1, p2}, Ll/oah;->E(Z)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedTopicFlowView;->a:Ll/oah;

    .line 31
    .line 32
    invoke-virtual {p1, v0}, Ll/r4h;->t(Lorg/apmem/tools/layouts/FlowLayout;)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedTopicFlowView;->a:Ll/oah;

    .line 36
    .line 37
    new-instance p2, Ll/a9i;

    .line 38
    .line 39
    invoke-direct {p2, p0, p3, v3, v6}, Ll/a9i;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedTopicFlowView;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1, p2}, Ll/r4h;->A(Ll/r4h$a;)V

    .line 43
    .line 44
    .line 45
    return-object v0
.end method

.method public final synthetic z(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Landroid/view/View;Lcom/p1/mobile/putong/feed/data/TopicMoment;I)V
    .locals 2

    .line 1
    iget-object v0, p5, Lcom/p1/mobile/putong/feed/data/TopicMoment;->topicType:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "live_square"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedTopicFlowView;->b:Ll/r4h$a;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedTopicFlowView;->b:Ll/r4h$a;

    .line 21
    .line 22
    invoke-interface {p0, p4, p5, p6}, Ll/r4h$a;->a(Landroid/view/View;Ljava/lang/Object;I)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    invoke-virtual {p5}, Lcom/p1/mobile/putong/feed/data/TopicMoment;->isEnterGroup()Z

    .line 27
    .line 28
    .line 29
    move-result p4

    .line 30
    if-eqz p4, :cond_2

    .line 31
    .line 32
    invoke-virtual {p0, p5, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedTopicFlowView;->s(Lcom/p1/mobile/putong/feed/data/TopicMoment;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    new-instance p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct$a;

    .line 36
    .line 37
    iget-object p1, p5, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 38
    .line 39
    invoke-direct {p0, p2, p1}, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct$a;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct$a;->a()Landroid/content/Intent;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p2, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_2
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p0, p5}, Ll/er60;->E(Lcom/p1/mobile/putong/feed/data/TopicMoment;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    const-string p4, "topic_id"

    .line 59
    .line 60
    iget-object p6, p5, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 61
    .line 62
    invoke-static {p4, p6}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 63
    .line 64
    .line 65
    move-result-object p4

    .line 66
    const-string p6, "topic_type"

    .line 67
    .line 68
    invoke-static {p6, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    filled-new-array {p4, p0}, [Ll/pf60;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-static {p3, p0}, Ll/ksg;->i(Ljava/lang/String;[Ll/pf60;)[Ll/pf60;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    const-string p3, "e_tag"

    .line 81
    .line 82
    invoke-static {p3, p1, p0}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 83
    .line 84
    .line 85
    const-string p0, "from_no_topic_aggregation_list"

    .line 86
    .line 87
    invoke-static {p5, p2, p0}, Ll/ksg;->u0(Lcom/p1/mobile/putong/feed/data/TopicMoment;Landroid/content/Context;Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    return-void
.end method
