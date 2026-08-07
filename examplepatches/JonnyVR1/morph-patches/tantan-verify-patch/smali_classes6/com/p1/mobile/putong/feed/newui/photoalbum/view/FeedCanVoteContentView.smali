.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/TextView;

.field public b:Landroid/widget/TextView;

.field public c:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedVoteContainer;

.field public d:Landroid/widget/TextView;

.field public e:Landroid/content/Context;

.field public f:Ljava/lang/String;

.field public g:Lcom/p1/mobile/putong/feed/data/TopicMoment;

.field public h:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public i:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->i:Z

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->k(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
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

    .line 11
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p2, 0x0

    .line 12
    iput-boolean p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->i:Z

    .line 13
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->k(Landroid/content/Context;)V

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

    .line 14
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p2, 0x0

    .line 15
    iput-boolean p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->i:Z

    .line 16
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->k(Landroid/content/Context;)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;Lcom/p1/mobile/putong/feed/data/TopicMoment;Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->p(Lcom/p1/mobile/putong/feed/data/TopicMoment;Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;Ljava/util/Map;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->l(Ljava/util/Map;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->o()V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->q()V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;Lcom/p1/mobile/putong/feed/data/TopicMoment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->m(Lcom/p1/mobile/putong/feed/data/TopicMoment;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;ZIILandroid/content/Intent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->r(ZIILandroid/content/Intent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;Lcom/p1/mobile/putong/feed/data/TopicMoment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->n(Lcom/p1/mobile/putong/feed/data/TopicMoment;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public h(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/ssg;->b(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public i()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->e:Landroid/content/Context;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    return-object p0
.end method

.method public j(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->d:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->h:Ljava/util/HashMap;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->g:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 11
    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    const/4 p1, 0x1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p1, 0x0

    .line 17
    :goto_0
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {v0, p0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final k(Landroid/content/Context;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->e:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->h(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->i()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/jka;->P7()Lrx/subjects/b;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    new-instance v0, Ll/lsg;

    .line 29
    .line 30
    invoke-direct {v0, p0}, Ll/lsg;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final synthetic l(Ljava/util/Map;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->g:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 2
    .line 3
    if-eqz v0, :cond_4

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 12
    .line 13
    const/16 v1, 0x8

    .line 14
    .line 15
    if-eqz v0, :cond_3

    .line 16
    .line 17
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->options:Ljava/util/List;

    .line 18
    .line 19
    if-eqz v2, :cond_3

    .line 20
    .line 21
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->g:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 22
    .line 23
    iput-object v2, v3, Lcom/p1/mobile/putong/feed/data/TopicMoment;->options:Ljava/util/List;

    .line 24
    .line 25
    iget v2, v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->voteCounter:I

    .line 26
    .line 27
    iput v2, v3, Lcom/p1/mobile/putong/feed/data/TopicMoment;->voteCounter:I

    .line 28
    .line 29
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->c:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedVoteContainer;

    .line 30
    .line 31
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->f:Ljava/lang/String;

    .line 32
    .line 33
    const/4 v4, 0x1

    .line 34
    invoke-virtual {v2, v0, v4, v3}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedVoteContainer;->b(Lcom/p1/mobile/putong/feed/data/TopicMoment;ZLjava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->b:Landroid/widget/TextView;

    .line 38
    .line 39
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->g:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 40
    .line 41
    iget v3, v3, Lcom/p1/mobile/putong/feed/data/TopicMoment;->voteCounter:I

    .line 42
    .line 43
    invoke-static {v3}, Ll/q8g0;->u(I)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    const-string v5, "%s\u4eba\u53c2\u4e0e\u4e86\u6295\u7968 "

    .line 52
    .line 53
    invoke-static {v5, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->options:Ljava/util/List;

    .line 61
    .line 62
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    const/4 v2, 0x0

    .line 67
    :cond_0
    move v3, v2

    .line 68
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 69
    .line 70
    .line 71
    move-result v5

    .line 72
    if-eqz v5, :cond_2

    .line 73
    .line 74
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v5

    .line 78
    check-cast v5, Lcom/p1/mobile/putong/feed/data/VoteOptions;

    .line 79
    .line 80
    if-nez v3, :cond_1

    .line 81
    .line 82
    iget-boolean v3, v5, Lcom/p1/mobile/putong/feed/data/VoteOptions;->haveliked:Z

    .line 83
    .line 84
    if-eqz v3, :cond_0

    .line 85
    .line 86
    :cond_1
    move v3, v4

    .line 87
    goto :goto_0

    .line 88
    :cond_2
    if-nez v3, :cond_3

    .line 89
    .line 90
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->j(I)V

    .line 91
    .line 92
    .line 93
    :cond_3
    const-string v0, "666666"

    .line 94
    .line 95
    invoke-interface {p1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    move-result p1

    .line 99
    if-eqz p1, :cond_4

    .line 100
    .line 101
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->j(I)V

    .line 102
    .line 103
    .line 104
    :cond_4
    return-void
.end method

.method public final synthetic m(Lcom/p1/mobile/putong/feed/data/TopicMoment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->i()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p1, p0}, Ll/ksg;->t0(Lcom/p1/mobile/putong/feed/data/TopicMoment;Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic n(Lcom/p1/mobile/putong/feed/data/TopicMoment;Landroid/view/View;)V
    .locals 4

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->f:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "from_album"

    .line 4
    .line 5
    invoke-static {p2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-static {p2, v0}, Ll/ksg;->K(Ljava/lang/String;Z)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->f:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const-string v1, "p_user_moment_interactions_details_view"

    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    move-object p2, v1

    .line 24
    :cond_0
    new-instance v0, Ll/pf60;

    .line 25
    .line 26
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->f:Ljava/lang/String;

    .line 27
    .line 28
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->f:Ljava/lang/String;

    .line 36
    .line 37
    :goto_0
    const-string v2, "posted_source"

    .line 38
    .line 39
    invoke-direct {v0, v2, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    new-instance v1, Ll/pf60;

    .line 43
    .line 44
    const-string v2, "topic_id"

    .line 45
    .line 46
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 47
    .line 48
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    filled-new-array {v0, v1}, [Ll/pf60;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    const-string v1, "e_moment_post"

    .line 56
    .line 57
    invoke-static {v1, p2, v0}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 58
    .line 59
    .line 60
    invoke-static {}, Ll/cmg;->n0()Z

    .line 61
    .line 62
    .line 63
    move-result p2

    .line 64
    const/4 v0, 0x0

    .line 65
    if-eqz p2, :cond_2

    .line 66
    .line 67
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->t(Z)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->i()Lcom/p1/mobile/android/app/Act;

    .line 72
    .line 73
    .line 74
    move-result-object p2

    .line 75
    new-instance v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;

    .line 76
    .line 77
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->i()Lcom/p1/mobile/android/app/Act;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;-><init>(Landroid/content/Context;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->m(Lcom/p1/mobile/putong/feed/data/TopicMoment;)Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->j(Z)Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    const/4 p1, 0x1

    .line 93
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->g(Z)Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    const-string p1, "\u5206\u4eab\u4f60\u7684\u89c2\u70b9\uff0c\u53ef\u4ee5\u83b7\u5f97\u66f4\u5927\u66dd\u5149\u2026"

    .line 98
    .line 99
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->b(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-static {p2, p0}, Ll/cn40;->M(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;)V

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public final synthetic o()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->t(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic p(Lcom/p1/mobile/putong/feed/data/TopicMoment;Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->b:Landroid/widget/TextView;

    .line 2
    .line 3
    iget p1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->voteCounter:I

    .line 4
    .line 5
    invoke-static {p1}, Ll/q8g0;->u(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const-string v1, "%s\u4eba\u53c2\u4e0e\u4e86\u6295\u7968 "

    .line 14
    .line 15
    invoke-static {v1, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->i()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    new-instance v0, Ll/qsg;

    .line 27
    .line 28
    invoke-direct {v0, p0}, Ll/qsg;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p2}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->getAnimTime()I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    int-to-long v1, p0

    .line 36
    invoke-virtual {p1, v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final synthetic q()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->d:Landroid/widget/TextView;

    .line 2
    .line 3
    const/16 v0, 0x8

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic r(ZIILandroid/content/Intent;)Z
    .locals 1

    .line 1
    const/4 p2, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return p2

    .line 5
    :cond_0
    if-eqz p4, :cond_1

    .line 6
    .line 7
    const/16 p1, 0x8

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->j(I)V

    .line 10
    .line 11
    .line 12
    goto :goto_1

    .line 13
    :cond_1
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->j(I)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->h:Ljava/util/HashMap;

    .line 17
    .line 18
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->g:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 19
    .line 20
    iget-object p3, p3, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 21
    .line 22
    sget-object p4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 23
    .line 24
    invoke-virtual {p1, p3, p4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->f:Ljava/lang/String;

    .line 28
    .line 29
    const-string p3, "from_album"

    .line 30
    .line 31
    invoke-static {p1, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result p3

    .line 35
    invoke-static {p1, p3}, Ll/ksg;->K(Ljava/lang/String;Z)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->f:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result p3

    .line 45
    const-string p4, "p_user_moment_interactions_details_view"

    .line 46
    .line 47
    if-eqz p3, :cond_2

    .line 48
    .line 49
    move-object p1, p4

    .line 50
    :cond_2
    new-instance p3, Ll/pf60;

    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->f:Ljava/lang/String;

    .line 53
    .line 54
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-eqz v0, :cond_3

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_3
    iget-object p4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->f:Ljava/lang/String;

    .line 62
    .line 63
    :goto_0
    const-string v0, "posted_source"

    .line 64
    .line 65
    invoke-direct {p3, v0, p4}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 66
    .line 67
    .line 68
    new-instance p4, Ll/pf60;

    .line 69
    .line 70
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->g:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 71
    .line 72
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 73
    .line 74
    const-string v0, "topic_id"

    .line 75
    .line 76
    invoke-direct {p4, v0, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 77
    .line 78
    .line 79
    filled-new-array {p3, p4}, [Ll/pf60;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    const-string p3, "e_moment_post"

    .line 84
    .line 85
    invoke-static {p3, p1, p0}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 86
    .line 87
    .line 88
    :goto_1
    return p2
.end method

.method public s(Lcom/p1/mobile/putong/feed/data/TopicMoment;)V
    .locals 5

    .line 1
    invoke-static {}, Ll/cmg;->n0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ll/msg;

    .line 8
    .line 9
    invoke-direct {v0, p0, p1}, Ll/msg;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->g:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->a:Landroid/widget/TextView;

    .line 18
    .line 19
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->name:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->b:Landroid/widget/TextView;

    .line 25
    .line 26
    iget v1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->voteCounter:I

    .line 27
    .line 28
    invoke-static {v1}, Ll/q8g0;->u(I)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    const-string v2, "%s\u4eba\u53c2\u4e0e\u4e86\u6295\u7968 "

    .line 37
    .line 38
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->c:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedVoteContainer;

    .line 46
    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->f:Ljava/lang/String;

    .line 48
    .line 49
    const/4 v2, 0x1

    .line 50
    invoke-virtual {v0, p1, v2, v1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedVoteContainer;->b(Lcom/p1/mobile/putong/feed/data/TopicMoment;ZLjava/lang/String;)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->h:Ljava/util/HashMap;

    .line 54
    .line 55
    if-nez v0, :cond_1

    .line 56
    .line 57
    new-instance v0, Ljava/util/HashMap;

    .line 58
    .line 59
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 60
    .line 61
    .line 62
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->h:Ljava/util/HashMap;

    .line 63
    .line 64
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->h:Ljava/util/HashMap;

    .line 65
    .line 66
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    check-cast v0, Ljava/lang/Boolean;

    .line 73
    .line 74
    if-eqz v0, :cond_4

    .line 75
    .line 76
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-eqz v0, :cond_4

    .line 81
    .line 82
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->d:Landroid/widget/TextView;

    .line 83
    .line 84
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 85
    .line 86
    .line 87
    invoke-static {}, Ll/cmg;->n0()Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-eqz v0, :cond_5

    .line 92
    .line 93
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->i:Z

    .line 94
    .line 95
    if-nez v0, :cond_5

    .line 96
    .line 97
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->f:Ljava/lang/String;

    .line 98
    .line 99
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-nez v0, :cond_5

    .line 104
    .line 105
    iput-boolean v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->i:Z

    .line 106
    .line 107
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->f:Ljava/lang/String;

    .line 108
    .line 109
    const-string v1, "from_album"

    .line 110
    .line 111
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    invoke-static {v0, v1}, Ll/ksg;->K(Ljava/lang/String;Z)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->f:Ljava/lang/String;

    .line 120
    .line 121
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 122
    .line 123
    .line 124
    move-result v1

    .line 125
    const-string v2, "p_user_moment_interactions_details_view"

    .line 126
    .line 127
    if-eqz v1, :cond_2

    .line 128
    .line 129
    move-object v0, v2

    .line 130
    :cond_2
    new-instance v1, Ll/pf60;

    .line 131
    .line 132
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->f:Ljava/lang/String;

    .line 133
    .line 134
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 135
    .line 136
    .line 137
    move-result v3

    .line 138
    if-eqz v3, :cond_3

    .line 139
    .line 140
    goto :goto_0

    .line 141
    :cond_3
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->f:Ljava/lang/String;

    .line 142
    .line 143
    :goto_0
    const-string v3, "posted_source"

    .line 144
    .line 145
    invoke-direct {v1, v3, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 146
    .line 147
    .line 148
    new-instance v2, Ll/pf60;

    .line 149
    .line 150
    const-string v3, "topic_id"

    .line 151
    .line 152
    iget-object v4, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 153
    .line 154
    invoke-direct {v2, v3, v4}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 155
    .line 156
    .line 157
    filled-new-array {v1, v2}, [Ll/pf60;

    .line 158
    .line 159
    .line 160
    move-result-object v1

    .line 161
    const-string v2, "e_moment_post"

    .line 162
    .line 163
    invoke-static {v2, v0, v1}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 164
    .line 165
    .line 166
    goto :goto_1

    .line 167
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->d:Landroid/widget/TextView;

    .line 168
    .line 169
    const/4 v1, 0x0

    .line 170
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 171
    .line 172
    .line 173
    :cond_5
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->d:Landroid/widget/TextView;

    .line 174
    .line 175
    new-instance v1, Ll/nsg;

    .line 176
    .line 177
    invoke-direct {v1, p0, p1}, Ll/nsg;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    .line 178
    .line 179
    .line 180
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 181
    .line 182
    .line 183
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->c:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedVoteContainer;

    .line 184
    .line 185
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedVoteContainer;->getShowVoteListView()Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;

    .line 186
    .line 187
    .line 188
    move-result-object v0

    .line 189
    if-eqz v0, :cond_6

    .line 190
    .line 191
    new-instance v1, Ll/osg;

    .line 192
    .line 193
    invoke-direct {v1, p0, p1, v0}, Ll/osg;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;Lcom/p1/mobile/putong/feed/data/TopicMoment;Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;)V

    .line 194
    .line 195
    .line 196
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->setVoteSuccess(Ll/x20;)V

    .line 197
    .line 198
    .line 199
    new-instance p1, Ll/psg;

    .line 200
    .line 201
    invoke-direct {p1, p0}, Ll/psg;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;)V

    .line 202
    .line 203
    .line 204
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->setCancelSuccess(Ll/x20;)V

    .line 205
    .line 206
    .line 207
    :cond_6
    return-void
.end method

.method public setFrom(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public t(Z)V
    .locals 3

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->i()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const-class v2, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaInputAct;

    .line 8
    .line 9
    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 10
    .line 11
    .line 12
    const-string v1, "topicMoment"

    .line 13
    .line 14
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->g:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 15
    .line 16
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    const-string v1, "from"

    .line 20
    .line 21
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->f:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->i()Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    new-instance v2, Ll/rsg;

    .line 31
    .line 32
    invoke-direct {v2, p0, p1}, Ll/rsg;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;Z)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1, v0, v2}, Lcom/p1/mobile/android/app/Act;->startActivityForResult(Landroid/content/Intent;Lcom/p1/mobile/android/app/a$a;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method
