.class public Lcom/p1/mobile/putong/feed/js/bridge/FeedBridgeImplementation;
.super Ll/lf2;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/lf2;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/feed/js/bridge/FeedBridgeImplementation;Ll/aqq;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/js/bridge/FeedBridgeImplementation;->k(Ll/aqq;Ll/pf60;)V

    return-void
.end method

.method public static synthetic d(Ll/aqq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 11

    .line 1
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 2
    .line 3
    iget-object v1, v0, Ll/sre0;->d:Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/aqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    const/4 v10, 0x0

    .line 10
    move-object v3, p1

    .line 11
    move-object v4, p2

    .line 12
    move-object v5, p3

    .line 13
    move-object v6, p4

    .line 14
    move-object/from16 v7, p5

    .line 15
    .line 16
    move-object/from16 v8, p6

    .line 17
    .line 18
    move-object/from16 v9, p7

    .line 19
    .line 20
    invoke-interface/range {v1 .. v10}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->cg(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic e(Ll/aqq;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/aqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {p0}, Ll/aqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    const-string v3, "moment"

    .line 14
    .line 15
    invoke-static {v3}, Lcom/p1/mobile/putong/data/NavigationIntent;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/NavigationIntent;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    invoke-interface {v1, v2, v3}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->toNewMainAct(Landroid/content/Context;Lcom/p1/mobile/putong/data/NavigationIntent;)Landroid/content/Intent;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ll/aqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const/4 v0, 0x0

    .line 31
    const-string v1, "from_h5_moment_level"

    .line 32
    .line 33
    invoke-static {p0, v0, v1}, Ll/cn40;->O(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public static synthetic f(Ll/aqq;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/aqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {p0}, Ll/aqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    const-string v3, "moment"

    .line 14
    .line 15
    invoke-static {v3}, Lcom/p1/mobile/putong/data/NavigationIntent;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/NavigationIntent;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    invoke-interface {v1, v2, v3}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->toNewMainAct(Landroid/content/Context;Lcom/p1/mobile/putong/data/NavigationIntent;)Landroid/content/Intent;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ll/aqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const/4 v0, 0x0

    .line 31
    const-string v1, "from_h5_moment_level_open_camera"

    .line 32
    .line 33
    invoke-static {p0, v0, v1}, Ll/cn40;->O(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public static synthetic g(Ll/aqq;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/cmg;->A()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/aqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;->u2(Lcom/p1/mobile/android/app/Act;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {p0}, Ll/aqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectStatusAct;->E2(Lcom/p1/mobile/android/app/Act;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static synthetic h(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic i(Ll/aqq;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/aqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {p0}, Ll/aqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    const-string v3, "profile"

    .line 14
    .line 15
    invoke-static {v3}, Lcom/p1/mobile/putong/data/NavigationIntent;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/NavigationIntent;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    invoke-interface {v1, v2, v3}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->toNewMainAct(Landroid/content/Context;Lcom/p1/mobile/putong/data/NavigationIntent;)Landroid/content/Intent;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ll/aqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Ll/bsg;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/bsg;-><init>(Ll/aqq;)V

    .line 33
    .line 34
    .line 35
    const-wide/16 v2, 0x12c

    .line 36
    .line 37
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public static jumpToPostMomentAct(Ll/aqq;)V
    .locals 1
    .annotation runtime Ll/lkq;
        key = "jumpToPostMomentAct"
    .end annotation

    .line 1
    new-instance v0, Ll/yrg;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/yrg;-><init>(Ll/aqq;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static jumpToPostMomentActAndToTakeVideo(Ll/aqq;)V
    .locals 1
    .annotation runtime Ll/lkq;
        key = "jumpToPostMomentActAndToTakeVideo"
    .end annotation

    .line 1
    new-instance v0, Ll/vrg;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/vrg;-><init>(Ll/aqq;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static jumpToStatusPostPage(Ll/aqq;)V
    .locals 1
    .annotation runtime Ll/lkq;
        key = "jumpToStatusPostPage"
    .end annotation

    .line 1
    new-instance v0, Ll/asg;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/asg;-><init>(Ll/aqq;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final j(Ll/aqq;Lcom/p1/mobile/putong/feed/data/TopicMoment;)V
    .locals 3
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p2}, Lcom/p1/mobile/putong/feed/data/TopicMoment;->isTopicVoteType()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const-string v0, "fromh5_topic_vote_aggregation"

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/aqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p1}, Ll/aqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iget-object v1, p2, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 18
    .line 19
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/TopicMoment;->owner:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 20
    .line 21
    iget-object p2, p2, Lcom/p1/mobile/putong/data/IdBoxed;->id:Ljava/lang/String;

    .line 22
    .line 23
    const-string v2, "-1"

    .line 24
    .line 25
    invoke-static {p1, v1, p2, v2, v0}, Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationAct;->Z1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    invoke-virtual {p2}, Lcom/p1/mobile/putong/feed/data/TopicMoment;->isQATopicType()Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-eqz p0, :cond_1

    .line 38
    .line 39
    invoke-virtual {p1}, Ll/aqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p1}, Ll/aqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 48
    .line 49
    invoke-static {p1, p2, v0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicAggregationActivity;->X1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_1
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p0, p2}, Ll/er60;->E(Lcom/p1/mobile/putong/feed/data/TopicMoment;)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {p1}, Ll/aqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {p1}, Ll/aqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 74
    .line 75
    const-string v1, "from_h5_topic_aggregation"

    .line 76
    .line 77
    const/4 v2, 0x1

    .line 78
    invoke-static {p1, p2, v1, v2, p0}, Lcom/p1/mobile/putong/feed/newui/topic/topicaggregation/TopicAggregationAct;->X1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Landroid/content/Intent;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public jumpToPostFromShare(Ll/aqq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ll/lkq;
        key = "jumpToPostFromShare"
    .end annotation

    .line 1
    new-instance p0, Ll/zrg;

    .line 2
    .line 3
    invoke-direct/range {p0 .. p8}, Ll/zrg;-><init>(Ll/aqq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public jumpToQATopicAggregationAct(Ll/aqq;Ljava/lang/String;)V
    .locals 0
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ll/lkq;
        key = "jumpToQATopicAggregationAct"
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/js/bridge/FeedBridgeImplementation;->l(Ll/aqq;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public jumpToTopicAggregationAct(Ll/aqq;Ljava/lang/String;)V
    .locals 0
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ll/lkq;
        key = "jumpToTopicAggregationAct"
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/js/bridge/FeedBridgeImplementation;->l(Ll/aqq;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public jumpToTopicVoteAggregationAct(Ll/aqq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ll/lkq;
        key = "jumpToTopicVoteAggregationAct"
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/js/bridge/FeedBridgeImplementation;->l(Ll/aqq;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic k(Ll/aqq;Ll/pf60;)V
    .locals 1

    .line 1
    iget-object v0, p2, Ll/pf60;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/util/Collection;

    .line 4
    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object p2, p2, Ll/pf60;->b:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast p2, Ljava/util/List;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    check-cast p2, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 21
    .line 22
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/js/bridge/FeedBridgeImplementation;->j(Ll/aqq;Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public final l(Ll/aqq;Ljava/lang/String;)V
    .locals 2
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ll/aqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->f:Ll/oka;

    .line 6
    .line 7
    invoke-virtual {v1, p2}, Ll/oka;->x0(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-virtual {v0, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    new-instance v0, Ll/wrg;

    .line 16
    .line 17
    invoke-direct {v0, p0, p1}, Ll/wrg;-><init>(Lcom/p1/mobile/putong/feed/js/bridge/FeedBridgeImplementation;Ll/aqq;)V

    .line 18
    .line 19
    .line 20
    new-instance p0, Ll/xrg;

    .line 21
    .line 22
    invoke-direct {p0}, Ll/xrg;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    return-void
.end method
