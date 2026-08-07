.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# instance fields
.field public A:Lv/VImage;

.field public B:Lv/VImage;

.field public C:Ljava/lang/String;

.field public D:Z

.field public E:I

.field public F:Lcom/p1/mobile/putong/feed/data/SingleTopic;

.field public G:Lcom/p1/mobile/putong/feed/data/TopicMoment;

.field public H:Ljava/lang/String;

.field public I:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;

.field public J:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public a:I

.field public b:I

.field public c:I

.field public d:I

.field public e:I

.field public f:Lv/VRelative;

.field public g:Lv/VImage;

.field public h:Lv/VLinear;

.field public i:Lv/VLinear;

.field public j:Landroid/widget/TextView;

.field public k:Lv/VLinear;

.field public l:Lv/VFrame;

.field public m:Lv/VDraweeView;

.field public n:Lv/VFrame;

.field public o:Lv/VDraweeView;

.field public p:Lv/VFrame;

.field public q:Lv/VDraweeView;

.field public r:Lv/VText;

.field public s:Lv/VImage;

.field public t:Landroid/widget/TextView;

.field public u:Lv/VFrame;

.field public v:Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;

.field public w:Lv/VFrame;

.field public x:Lv/VImage;

.field public y:Lv/VFrame;

.field public z:Lv/VDraweeView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x3

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->a:I

    .line 6
    .line 7
    const/16 v0, 0x50

    .line 8
    .line 9
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->b:I

    .line 10
    .line 11
    const/4 v0, 0x6

    .line 12
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->c:I

    .line 13
    .line 14
    invoke-static {}, Ll/bnl0;->y0()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->b:I

    .line 19
    .line 20
    int-to-float v1, v1

    .line 21
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    sub-int/2addr v0, v1

    .line 26
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->d:I

    .line 27
    .line 28
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->c:I

    .line 29
    .line 30
    int-to-float v1, v1

    .line 31
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    mul-int/lit8 v1, v1, 0x2

    .line 36
    .line 37
    sub-int/2addr v0, v1

    .line 38
    div-int/2addr v0, p1

    .line 39
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->e:I

    .line 40
    .line 41
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 42
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x3

    .line 43
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->a:I

    const/16 p2, 0x50

    .line 44
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->b:I

    const/4 p2, 0x6

    .line 45
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->c:I

    .line 46
    invoke-static {}, Ll/bnl0;->y0()I

    move-result p2

    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->b:I

    int-to-float v0, v0

    invoke-static {v0}, Ll/qa00;->d(F)I

    move-result v0

    sub-int/2addr p2, v0

    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->d:I

    .line 47
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->c:I

    int-to-float v0, v0

    invoke-static {v0}, Ll/qa00;->d(F)I

    move-result v0

    mul-int/lit8 v0, v0, 0x2

    sub-int/2addr p2, v0

    div-int/2addr p2, p1

    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->e:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 48
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x3

    .line 49
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->a:I

    const/16 p2, 0x50

    .line 50
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->b:I

    const/4 p2, 0x6

    .line 51
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->c:I

    .line 52
    invoke-static {}, Ll/bnl0;->y0()I

    move-result p2

    iget p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->b:I

    int-to-float p3, p3

    invoke-static {p3}, Ll/qa00;->d(F)I

    move-result p3

    sub-int/2addr p2, p3

    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->d:I

    .line 53
    iget p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->c:I

    int-to-float p3, p3

    invoke-static {p3}, Ll/qa00;->d(F)I

    move-result p3

    mul-int/lit8 p3, p3, 0x2

    sub-int/2addr p2, p3

    div-int/2addr p2, p1

    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->e:I

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->k(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->j(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->i(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V

    return-void
.end method

.method private getPageId()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Ll/cmg;->s()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->H:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_2

    .line 14
    .line 15
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->E:I

    .line 16
    .line 17
    const/16 v0, 0xe

    .line 18
    .line 19
    if-ne p0, v0, :cond_0

    .line 20
    .line 21
    const-string p0, "p_discover_dating"

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_0
    const/16 v0, 0xf

    .line 25
    .line 26
    if-ne p0, v0, :cond_1

    .line 27
    .line 28
    const-string p0, "p_discover_discussion"

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_1
    const-string p0, "p_follow"

    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->H:Ljava/lang/String;

    .line 35
    .line 36
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_3

    .line 41
    .line 42
    const-string p0, "p_nearby"

    .line 43
    .line 44
    return-object p0

    .line 45
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->H:Ljava/lang/String;

    .line 46
    .line 47
    return-object p0
.end method

.method private getSingleTopicViewTrackingParis()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->F:Lcom/p1/mobile/putong/feed/data/SingleTopic;

    .line 7
    .line 8
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/SingleTopic;->topicId:Ljava/lang/String;

    .line 9
    .line 10
    const-string v2, "topic_id"

    .line 11
    .line 12
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->F:Lcom/p1/mobile/putong/feed/data/SingleTopic;

    .line 20
    .line 21
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/SingleTopic;->momentId:Ljava/lang/String;

    .line 22
    .line 23
    const-string v2, "moment_id"

    .line 24
    .line 25
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->G:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 33
    .line 34
    if-eqz p0, :cond_0

    .line 35
    .line 36
    const-string v1, "topic_type"

    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->topicType:Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {v1, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    :cond_0
    return-object v0
.end method


# virtual methods
.method public final d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/p1i;->a(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final e()Lcom/p1/mobile/android/app/Act;
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

.method public f()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->getSingleTopicViewTrackingParis()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->getPageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 v1, 0x0

    .line 10
    new-array v1, v1, [Ll/pf60;

    .line 11
    .line 12
    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, [Ll/pf60;

    .line 17
    .line 18
    const-string v1, "e_moment_topic"

    .line 19
    .line 20
    invoke-static {v1, p0, v0}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final g(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->I:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->v:Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;

    .line 7
    .line 8
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->u:Lv/VFrame;

    .line 13
    .line 14
    const/4 v2, 0x1

    .line 15
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    invoke-static {p1}, Ll/ksg;->X(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->v:Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;

    .line 25
    .line 26
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->w:Lv/VFrame;

    .line 30
    .line 31
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->y:Lv/VFrame;

    .line 35
    .line 36
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->v:Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;

    .line 40
    .line 41
    invoke-virtual {v0, p1, v1}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->Z0(Lcom/p1/mobile/putong/feed/data/Moment;Z)Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->v:Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;

    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->C:Ljava/lang/String;

    .line 47
    .line 48
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->D:Z

    .line 49
    .line 50
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->e1(Ljava/lang/String;Z)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 55
    .line 56
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-nez v0, :cond_4

    .line 61
    .line 62
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 63
    .line 64
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 69
    .line 70
    instance-of v3, v0, Lcom/p1/mobile/putong/data/Video;

    .line 71
    .line 72
    if-eqz v3, :cond_2

    .line 73
    .line 74
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->v:Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;

    .line 75
    .line 76
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 77
    .line 78
    .line 79
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->w:Lv/VFrame;

    .line 80
    .line 81
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 82
    .line 83
    .line 84
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->y:Lv/VFrame;

    .line 85
    .line 86
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->n(Lcom/p1/mobile/putong/data/Media;)V

    .line 90
    .line 91
    .line 92
    return-void

    .line 93
    :cond_2
    instance-of v0, v0, Lcom/p1/mobile/putong/data/Picture;

    .line 94
    .line 95
    if-eqz v0, :cond_3

    .line 96
    .line 97
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->v:Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;

    .line 98
    .line 99
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->w:Lv/VFrame;

    .line 103
    .line 104
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 105
    .line 106
    .line 107
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->y:Lv/VFrame;

    .line 108
    .line 109
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 110
    .line 111
    .line 112
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 113
    .line 114
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->m(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/util/List;)V

    .line 115
    .line 116
    .line 117
    :cond_3
    return-void

    .line 118
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->u:Lv/VFrame;

    .line 119
    .line 120
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 121
    .line 122
    .line 123
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->v:Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;

    .line 124
    .line 125
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 126
    .line 127
    .line 128
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->w:Lv/VFrame;

    .line 129
    .line 130
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 131
    .line 132
    .line 133
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->y:Lv/VFrame;

    .line 134
    .line 135
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 136
    .line 137
    .line 138
    return-void
.end method

.method public final h(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->I:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->j:Landroid/widget/TextView;

    .line 10
    .line 11
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->G:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 12
    .line 13
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/TopicMoment;->name:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    new-instance v0, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->F:Lcom/p1/mobile/putong/feed/data/SingleTopic;

    .line 24
    .line 25
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/SingleTopic;->userIds:Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    :cond_1
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    if-eqz v3, :cond_2

    .line 36
    .line 37
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    check-cast v3, Ljava/lang/String;

    .line 42
    .line 43
    sget-object v4, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 44
    .line 45
    invoke-virtual {v4, v3}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v4

    .line 53
    if-eqz v4, :cond_1

    .line 54
    .line 55
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_2
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    const/4 v3, 0x3

    .line 64
    const/4 v4, 0x2

    .line 65
    const/4 v5, 0x1

    .line 66
    if-lt v2, v3, :cond_3

    .line 67
    .line 68
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->l:Lv/VFrame;

    .line 69
    .line 70
    invoke-static {v2, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 71
    .line 72
    .line 73
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->n:Lv/VFrame;

    .line 74
    .line 75
    invoke-static {v2, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 76
    .line 77
    .line 78
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->G:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 79
    .line 80
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->m:Lv/VDraweeView;

    .line 81
    .line 82
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v4

    .line 86
    check-cast v4, Lcom/p1/mobile/putong/data/User;

    .line 87
    .line 88
    invoke-static {v2, v3, v4}, Ll/at0;->f(Lcom/p1/mobile/putong/feed/data/TopicMoment;Lv/VDraweeView;Lcom/p1/mobile/putong/data/User;)V

    .line 89
    .line 90
    .line 91
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->G:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 92
    .line 93
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->o:Lv/VDraweeView;

    .line 94
    .line 95
    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v4

    .line 99
    check-cast v4, Lcom/p1/mobile/putong/data/User;

    .line 100
    .line 101
    invoke-static {v2, v3, v4}, Ll/at0;->f(Lcom/p1/mobile/putong/feed/data/TopicMoment;Lv/VDraweeView;Lcom/p1/mobile/putong/data/User;)V

    .line 102
    .line 103
    .line 104
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->G:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 105
    .line 106
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->q:Lv/VDraweeView;

    .line 107
    .line 108
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 113
    .line 114
    invoke-static {v2, v3, v0}, Ll/at0;->f(Lcom/p1/mobile/putong/feed/data/TopicMoment;Lv/VDraweeView;Lcom/p1/mobile/putong/data/User;)V

    .line 115
    .line 116
    .line 117
    goto :goto_1

    .line 118
    :cond_3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 119
    .line 120
    .line 121
    move-result v2

    .line 122
    if-ne v2, v4, :cond_4

    .line 123
    .line 124
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->l:Lv/VFrame;

    .line 125
    .line 126
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 127
    .line 128
    .line 129
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->n:Lv/VFrame;

    .line 130
    .line 131
    invoke-static {v2, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 132
    .line 133
    .line 134
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->G:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 135
    .line 136
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->o:Lv/VDraweeView;

    .line 137
    .line 138
    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 139
    .line 140
    .line 141
    move-result-object v4

    .line 142
    check-cast v4, Lcom/p1/mobile/putong/data/User;

    .line 143
    .line 144
    invoke-static {v2, v3, v4}, Ll/at0;->f(Lcom/p1/mobile/putong/feed/data/TopicMoment;Lv/VDraweeView;Lcom/p1/mobile/putong/data/User;)V

    .line 145
    .line 146
    .line 147
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->G:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 148
    .line 149
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->q:Lv/VDraweeView;

    .line 150
    .line 151
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 156
    .line 157
    invoke-static {v2, v3, v0}, Ll/at0;->f(Lcom/p1/mobile/putong/feed/data/TopicMoment;Lv/VDraweeView;Lcom/p1/mobile/putong/data/User;)V

    .line 158
    .line 159
    .line 160
    goto :goto_1

    .line 161
    :cond_4
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 162
    .line 163
    .line 164
    move-result v2

    .line 165
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->l:Lv/VFrame;

    .line 166
    .line 167
    if-ne v2, v5, :cond_5

    .line 168
    .line 169
    invoke-static {v3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 170
    .line 171
    .line 172
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->n:Lv/VFrame;

    .line 173
    .line 174
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 175
    .line 176
    .line 177
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->p:Lv/VFrame;

    .line 178
    .line 179
    invoke-static {v2, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 180
    .line 181
    .line 182
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->G:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 183
    .line 184
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->q:Lv/VDraweeView;

    .line 185
    .line 186
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 191
    .line 192
    invoke-static {v2, v3, v0}, Ll/at0;->f(Lcom/p1/mobile/putong/feed/data/TopicMoment;Lv/VDraweeView;Lcom/p1/mobile/putong/data/User;)V

    .line 193
    .line 194
    .line 195
    goto :goto_1

    .line 196
    :cond_5
    invoke-static {v3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 197
    .line 198
    .line 199
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->n:Lv/VFrame;

    .line 200
    .line 201
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 202
    .line 203
    .line 204
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->p:Lv/VFrame;

    .line 205
    .line 206
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 207
    .line 208
    .line 209
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->r:Lv/VText;

    .line 210
    .line 211
    new-instance v2, Ljava/lang/StringBuilder;

    .line 212
    .line 213
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 214
    .line 215
    .line 216
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->G:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 217
    .line 218
    iget v3, v3, Lcom/p1/mobile/putong/feed/data/TopicMoment;->userViewCounter:I

    .line 219
    .line 220
    invoke-static {v3}, Ll/q8g0;->u(I)Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object v3

    .line 224
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 225
    .line 226
    .line 227
    const-string v3, "\u4eba\u6b63\u5728\u8bdd\u9898\u4e2d\u8ba8\u8bba"

    .line 228
    .line 229
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 230
    .line 231
    .line 232
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 233
    .line 234
    .line 235
    move-result-object v2

    .line 236
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 237
    .line 238
    .line 239
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->G:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 240
    .line 241
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/data/TopicMoment;->isQATopicType()Z

    .line 242
    .line 243
    .line 244
    move-result v0

    .line 245
    const/16 v2, 0x8

    .line 246
    .line 247
    if-eqz v0, :cond_7

    .line 248
    .line 249
    invoke-static {}, Ll/cmg;->m0()Z

    .line 250
    .line 251
    .line 252
    move-result v0

    .line 253
    if-eqz v0, :cond_7

    .line 254
    .line 255
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->I:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;

    .line 256
    .line 257
    if-nez v0, :cond_6

    .line 258
    .line 259
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;

    .line 260
    .line 261
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->e()Lcom/p1/mobile/android/app/Act;

    .line 262
    .line 263
    .line 264
    move-result-object v1

    .line 265
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;-><init>(Landroid/content/Context;)V

    .line 266
    .line 267
    .line 268
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->I:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;

    .line 269
    .line 270
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->C:Ljava/lang/String;

    .line 271
    .line 272
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->setFrom(Ljava/lang/String;)V

    .line 273
    .line 274
    .line 275
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->I:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;

    .line 276
    .line 277
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->J:Ljava/util/HashMap;

    .line 278
    .line 279
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->h:Ljava/util/HashMap;

    .line 280
    .line 281
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->h:Lv/VLinear;

    .line 282
    .line 283
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 284
    .line 285
    .line 286
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->t:Landroid/widget/TextView;

    .line 287
    .line 288
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 289
    .line 290
    .line 291
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->u:Lv/VFrame;

    .line 292
    .line 293
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 294
    .line 295
    .line 296
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->I:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;

    .line 297
    .line 298
    invoke-static {v0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 299
    .line 300
    .line 301
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->j:Landroid/widget/TextView;

    .line 302
    .line 303
    const-string v1, "\u9080\u8bf7\u4f60\u53c2\u4e0e\u6295\u7968"

    .line 304
    .line 305
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 306
    .line 307
    .line 308
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->r:Lv/VText;

    .line 309
    .line 310
    const-string v1, "\u770b\u770b\u591a\u5c11\u4eba\u4e0e\u4f60\u89c2\u70b9\u4e00\u81f4"

    .line 311
    .line 312
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 313
    .line 314
    .line 315
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->I:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;

    .line 316
    .line 317
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->G:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 318
    .line 319
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedCanVoteContentView;->s(Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    .line 320
    .line 321
    .line 322
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->f:Lv/VRelative;

    .line 323
    .line 324
    const/high16 v1, 0x41600000    # 14.0f

    .line 325
    .line 326
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 327
    .line 328
    .line 329
    move-result v1

    .line 330
    invoke-static {v0, v1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 331
    .line 332
    .line 333
    goto :goto_3

    .line 334
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->t:Landroid/widget/TextView;

    .line 335
    .line 336
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 337
    .line 338
    .line 339
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->u:Lv/VFrame;

    .line 340
    .line 341
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 342
    .line 343
    .line 344
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 345
    .line 346
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 347
    .line 348
    invoke-virtual {v0, v3}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 349
    .line 350
    .line 351
    move-result-object v0

    .line 352
    if-nez v0, :cond_8

    .line 353
    .line 354
    const-string v0, ""

    .line 355
    .line 356
    goto :goto_2

    .line 357
    :cond_8
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 358
    .line 359
    :goto_2
    invoke-static {v0, v2}, Ll/h9i;->k(Ljava/lang/String;I)Ljava/lang/String;

    .line 360
    .line 361
    .line 362
    move-result-object v0

    .line 363
    new-instance v2, Landroid/text/SpannableStringBuilder;

    .line 364
    .line 365
    new-instance v3, Ljava/lang/StringBuilder;

    .line 366
    .line 367
    const-string v4, "@"

    .line 368
    .line 369
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 370
    .line 371
    .line 372
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 373
    .line 374
    .line 375
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 376
    .line 377
    .line 378
    move-result-object v0

    .line 379
    invoke-direct {v2, v0}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 380
    .line 381
    .line 382
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 383
    .line 384
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 385
    .line 386
    .line 387
    move-result v0

    .line 388
    if-nez v0, :cond_9

    .line 389
    .line 390
    const-string v0, ": "

    .line 391
    .line 392
    invoke-virtual {v2, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 393
    .line 394
    .line 395
    :cond_9
    invoke-virtual {v2}, Landroid/text/SpannableStringBuilder;->length()I

    .line 396
    .line 397
    .line 398
    move-result v0

    .line 399
    new-instance v3, Lv/text/CustomTypefaceSpan;

    .line 400
    .line 401
    const-string v4, "sans-serif"

    .line 402
    .line 403
    sget-object v5, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 404
    .line 405
    invoke-direct {v3, v4, v5}, Lv/text/CustomTypefaceSpan;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;)V

    .line 406
    .line 407
    .line 408
    const/16 v4, 0x21

    .line 409
    .line 410
    invoke-virtual {v2, v3, v1, v0, v4}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 411
    .line 412
    .line 413
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 414
    .line 415
    invoke-virtual {v2, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 416
    .line 417
    .line 418
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->t:Landroid/widget/TextView;

    .line 419
    .line 420
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 421
    .line 422
    .line 423
    :goto_3
    new-instance v0, Ll/m1i;

    .line 424
    .line 425
    invoke-direct {v0, p0, p1}, Ll/m1i;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 426
    .line 427
    .line 428
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 429
    .line 430
    .line 431
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->w:Lv/VFrame;

    .line 432
    .line 433
    new-instance v1, Ll/n1i;

    .line 434
    .line 435
    invoke-direct {v1, p0, p1}, Ll/n1i;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 436
    .line 437
    .line 438
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 439
    .line 440
    .line 441
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->v:Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;

    .line 442
    .line 443
    new-instance v1, Ll/o1i;

    .line 444
    .line 445
    invoke-direct {v1, p0, p1}, Ll/o1i;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 446
    .line 447
    .line 448
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 449
    .line 450
    .line 451
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->v:Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;

    .line 452
    .line 453
    const v1, 0x7fffffff

    .line 454
    .line 455
    .line 456
    invoke-virtual {v0, v1}, Landroidx/constraintlayout/widget/ConstraintLayout;->setMaxWidth(I)V

    .line 457
    .line 458
    .line 459
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->g(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 460
    .line 461
    .line 462
    return-void
.end method

.method public final synthetic i(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->o(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic j(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->o(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic k(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->o(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public l(Ljava/lang/String;ZILcom/p1/mobile/putong/feed/data/SingleTopic;Lcom/p1/mobile/putong/feed/data/TopicMoment;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 1

    .line 1
    if-eqz p4, :cond_1

    .line 2
    .line 3
    iget-object v0, p4, Lcom/p1/mobile/putong/feed/data/SingleTopic;->momentId:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p4, Lcom/p1/mobile/putong/feed/data/SingleTopic;->topicId:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p4, Lcom/p1/mobile/putong/feed/data/SingleTopic;->userIds:Ljava/util/List;

    .line 20
    .line 21
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_1

    .line 26
    .line 27
    if-eqz p6, :cond_1

    .line 28
    .line 29
    if-nez p5, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->C:Ljava/lang/String;

    .line 33
    .line 34
    iput-boolean p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->D:Z

    .line 35
    .line 36
    iput p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->E:I

    .line 37
    .line 38
    iput-object p4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->F:Lcom/p1/mobile/putong/feed/data/SingleTopic;

    .line 39
    .line 40
    iput-object p5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->G:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 41
    .line 42
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->f:Lv/VRelative;

    .line 43
    .line 44
    const/4 p2, 0x1

    .line 45
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, p6}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->h(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->f:Lv/VRelative;

    .line 53
    .line 54
    const/4 p1, 0x0

    .line 55
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public final m(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/util/List;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->w:Lv/VFrame;

    .line 4
    .line 5
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    const/4 v3, 0x1

    .line 10
    if-ge v1, v2, :cond_2

    .line 11
    .line 12
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->w:Lv/VFrame;

    .line 13
    .line 14
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    instance-of v2, v2, Lv/VRelative;

    .line 19
    .line 20
    if-eqz v2, :cond_1

    .line 21
    .line 22
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->w:Lv/VFrame;

    .line 23
    .line 24
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    check-cast v2, Lv/VRelative;

    .line 29
    .line 30
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v4

    .line 34
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 35
    .line 36
    .line 37
    instance-of v5, v4, Lv/VDraweeView;

    .line 38
    .line 39
    if-eqz v5, :cond_0

    .line 40
    .line 41
    move-object v5, v4

    .line 42
    check-cast v5, Lv/VDraweeView;

    .line 43
    .line 44
    sget-object v6, Ll/uqb0;->G:Ll/fsb0;

    .line 45
    .line 46
    invoke-virtual {v6, v5}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 47
    .line 48
    .line 49
    const/4 v6, 0x0

    .line 50
    invoke-virtual {v5, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v4, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v5, v6}, Lv/VDraweeView;->setZoomAnimationKey(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    :cond_0
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 64
    .line 65
    .line 66
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->x:Lv/VImage;

    .line 70
    .line 71
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    iget v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->a:I

    .line 76
    .line 77
    if-le v2, v4, :cond_3

    .line 78
    .line 79
    move v2, v3

    .line 80
    goto :goto_1

    .line 81
    :cond_3
    move v2, v0

    .line 82
    :goto_1
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 83
    .line 84
    .line 85
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->a:I

    .line 90
    .line 91
    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    move v2, v0

    .line 96
    :goto_2
    if-ge v2, v1, :cond_9

    .line 97
    .line 98
    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v4

    .line 102
    check-cast v4, Lcom/p1/mobile/putong/data/Media;

    .line 103
    .line 104
    instance-of v5, v4, Lcom/p1/mobile/putong/data/Picture;

    .line 105
    .line 106
    if-eqz v5, :cond_8

    .line 107
    .line 108
    check-cast v4, Lcom/p1/mobile/putong/data/Picture;

    .line 109
    .line 110
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->w:Lv/VFrame;

    .line 111
    .line 112
    invoke-virtual {v5, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 113
    .line 114
    .line 115
    move-result-object v5

    .line 116
    check-cast v5, Lv/VRelative;

    .line 117
    .line 118
    invoke-virtual {v5, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 119
    .line 120
    .line 121
    move-result-object v6

    .line 122
    check-cast v6, Lv/VDraweeView;

    .line 123
    .line 124
    invoke-static {}, Ll/cmg;->C0()Z

    .line 125
    .line 126
    .line 127
    move-result v7

    .line 128
    if-eqz v7, :cond_5

    .line 129
    .line 130
    invoke-virtual {v5, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 131
    .line 132
    .line 133
    move-result-object v7

    .line 134
    iget-object v8, p1, Lcom/p1/mobile/putong/feed/data/Moment;->mediaRepeatIndexList:Ljava/util/List;

    .line 135
    .line 136
    invoke-static {v8}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 137
    .line 138
    .line 139
    move-result v8

    .line 140
    if-nez v8, :cond_4

    .line 141
    .line 142
    iget-object v8, p1, Lcom/p1/mobile/putong/feed/data/Moment;->mediaRepeatIndexList:Ljava/util/List;

    .line 143
    .line 144
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 145
    .line 146
    .line 147
    move-result-object v9

    .line 148
    invoke-interface {v8, v9}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 149
    .line 150
    .line 151
    move-result v8

    .line 152
    if-eqz v8, :cond_4

    .line 153
    .line 154
    move v8, v3

    .line 155
    goto :goto_3

    .line 156
    :cond_4
    move v8, v0

    .line 157
    :goto_3
    invoke-static {v7, v8}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 158
    .line 159
    .line 160
    :cond_5
    invoke-static {v5, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 161
    .line 162
    .line 163
    new-instance v7, Landroid/widget/FrameLayout$LayoutParams;

    .line 164
    .line 165
    iget v8, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->e:I

    .line 166
    .line 167
    invoke-direct {v7, v8, v8}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 168
    .line 169
    .line 170
    invoke-static {}, Ll/ksg;->y()I

    .line 171
    .line 172
    .line 173
    move-result v8

    .line 174
    int-to-float v8, v8

    .line 175
    invoke-static {v8}, Lcom/facebook/drawee/generic/RoundingParams;->c(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 176
    .line 177
    .line 178
    move-result-object v8

    .line 179
    sget-object v9, Lcom/facebook/drawee/generic/RoundingParams$RoundingMethod;->BITMAP_ONLY:Lcom/facebook/drawee/generic/RoundingParams$RoundingMethod;

    .line 180
    .line 181
    invoke-virtual {v8, v9}, Lcom/facebook/drawee/generic/RoundingParams;->w(Lcom/facebook/drawee/generic/RoundingParams$RoundingMethod;)Lcom/facebook/drawee/generic/RoundingParams;

    .line 182
    .line 183
    .line 184
    move-result-object v8

    .line 185
    invoke-virtual {v6}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 186
    .line 187
    .line 188
    move-result-object v9

    .line 189
    check-cast v9, Ll/wlj;

    .line 190
    .line 191
    invoke-virtual {v9, v8}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 192
    .line 193
    .line 194
    invoke-virtual {v5, v7}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 195
    .line 196
    .line 197
    const/4 v5, 0x2

    .line 198
    if-eq v2, v3, :cond_7

    .line 199
    .line 200
    if-eq v2, v5, :cond_6

    .line 201
    .line 202
    goto :goto_4

    .line 203
    :cond_6
    iget v8, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->c:I

    .line 204
    .line 205
    mul-int/2addr v8, v5

    .line 206
    int-to-float v8, v8

    .line 207
    invoke-static {v8}, Ll/qa00;->d(F)I

    .line 208
    .line 209
    .line 210
    move-result v8

    .line 211
    iget v9, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->e:I

    .line 212
    .line 213
    mul-int/2addr v9, v5

    .line 214
    add-int/2addr v8, v9

    .line 215
    invoke-virtual {v7, v8, v0, v0, v0}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 216
    .line 217
    .line 218
    goto :goto_4

    .line 219
    :cond_7
    iget v8, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->c:I

    .line 220
    .line 221
    int-to-float v8, v8

    .line 222
    invoke-static {v8}, Ll/qa00;->d(F)I

    .line 223
    .line 224
    .line 225
    move-result v8

    .line 226
    iget v9, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->e:I

    .line 227
    .line 228
    add-int/2addr v8, v9

    .line 229
    invoke-virtual {v7, v8, v0, v0, v0}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 230
    .line 231
    .line 232
    :goto_4
    iget-object v7, v4, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 233
    .line 234
    const-string v8, "raw"

    .line 235
    .line 236
    invoke-static {v7, v8}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 237
    .line 238
    .line 239
    move-result v7

    .line 240
    if-nez v7, :cond_8

    .line 241
    .line 242
    iget-object v7, v4, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 243
    .line 244
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 245
    .line 246
    .line 247
    move-result v7

    .line 248
    if-nez v7, :cond_8

    .line 249
    .line 250
    sget-object v7, Ll/uqb0;->G:Ll/fsb0;

    .line 251
    .line 252
    iget v8, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->c:I

    .line 253
    .line 254
    int-to-float v8, v8

    .line 255
    invoke-static {v8}, Ll/qa00;->d(F)I

    .line 256
    .line 257
    .line 258
    move-result v8

    .line 259
    iget v9, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->e:I

    .line 260
    .line 261
    mul-int/2addr v9, v5

    .line 262
    add-int/2addr v8, v9

    .line 263
    invoke-virtual {v4, v8}, Lcom/p1/mobile/putong/data/Picture;->calculatedWidth(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 264
    .line 265
    .line 266
    move-result-object v5

    .line 267
    invoke-virtual {v7, v6, v5}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 268
    .line 269
    .line 270
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 271
    .line 272
    invoke-static {v4}, Lcom/p1/mobile/putong/data/Media;->URL_TO_CACHEKEY(Ljava/lang/String;)Ljava/lang/String;

    .line 273
    .line 274
    .line 275
    move-result-object v4

    .line 276
    invoke-virtual {v6, v4}, Lv/VDraweeView;->setZoomAnimationKey(Ljava/lang/String;)V

    .line 277
    .line 278
    .line 279
    :cond_8
    add-int/lit8 v2, v2, 0x1

    .line 280
    .line 281
    goto/16 :goto_2

    .line 282
    .line 283
    :cond_9
    return-void
.end method

.method public final n(Lcom/p1/mobile/putong/data/Media;)V
    .locals 3

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/data/Video;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-static {}, Ll/ksg;->y()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    int-to-float v0, v0

    .line 13
    invoke-static {v0}, Lcom/facebook/drawee/generic/RoundingParams;->c(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget-object v1, Lcom/facebook/drawee/generic/RoundingParams$RoundingMethod;->BITMAP_ONLY:Lcom/facebook/drawee/generic/RoundingParams$RoundingMethod;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/generic/RoundingParams;->w(Lcom/facebook/drawee/generic/RoundingParams$RoundingMethod;)Lcom/facebook/drawee/generic/RoundingParams;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->z:Lv/VDraweeView;

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Ll/wlj;

    .line 30
    .line 31
    invoke-virtual {v1, v0}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->A:Lv/VImage;

    .line 35
    .line 36
    const/4 v1, 0x0

    .line 37
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->B:Lv/VImage;

    .line 41
    .line 42
    sget v1, Ll/lbc0;->B6:I

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 48
    .line 49
    const-string v1, "raw"

    .line 50
    .line 51
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-nez v0, :cond_1

    .line 56
    .line 57
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 58
    .line 59
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-nez v0, :cond_1

    .line 64
    .line 65
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 66
    .line 67
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->z:Lv/VDraweeView;

    .line 68
    .line 69
    const/high16 v2, 0x42bc0000    # 94.0f

    .line 70
    .line 71
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/data/Picture;->calculatedWidth(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 80
    .line 81
    .line 82
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->z:Lv/VDraweeView;

    .line 83
    .line 84
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 85
    .line 86
    invoke-static {p1}, Lcom/p1/mobile/putong/data/Media;->URL_TO_CACHEKEY(Ljava/lang/String;)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-virtual {p0, p1}, Lv/VDraweeView;->setZoomAnimationKey(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    :cond_1
    :goto_0
    return-void
.end method

.method public final o(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 8

    .line 1
    new-instance v0, Ljava/util/Random;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x5

    .line 7
    invoke-virtual {v0, v1}, Ljava/util/Random;->nextInt(I)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    add-int/lit8 v0, v0, 0x1

    .line 12
    .line 13
    invoke-static {}, Ll/pzi0;->o()J

    .line 14
    .line 15
    .line 16
    move-result-wide v1

    .line 17
    mul-int/lit16 v0, v0, 0x3e8

    .line 18
    .line 19
    int-to-long v3, v0

    .line 20
    sub-long/2addr v1, v3

    .line 21
    long-to-double v0, v1

    .line 22
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/feed/data/Moment;->setRecommendTime(D)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->f()V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->G:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/data/TopicMoment;->isTopicVoteType()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->G:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 45
    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 47
    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->owner:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/data/IdBoxed;->id:Ljava/lang/String;

    .line 51
    .line 52
    const-string v2, "-1"

    .line 53
    .line 54
    invoke-static {v0, v1, p0, v2}, Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationAct;->X1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->G:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 63
    .line 64
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/data/TopicMoment;->isQATopicType()Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-eqz v0, :cond_1

    .line 69
    .line 70
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->G:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 79
    .line 80
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 81
    .line 82
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->C:Ljava/lang/String;

    .line 83
    .line 84
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 85
    .line 86
    invoke-static {v1, v2, p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicAggregationActivity;->Y1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    :cond_1
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->G:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Ll/er60;->E(Lcom/p1/mobile/putong/feed/data/TopicMoment;)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v6

    .line 104
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 109
    .line 110
    .line 111
    move-result-object v2

    .line 112
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->G:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 113
    .line 114
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 115
    .line 116
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->C:Ljava/lang/String;

    .line 117
    .line 118
    const/4 v5, 0x1

    .line 119
    iget-object v7, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 120
    .line 121
    invoke-static/range {v2 .. v7}, Lcom/p1/mobile/putong/feed/newui/topic/topicaggregation/TopicAggregationAct;->Y1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 126
    .line 127
    .line 128
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {p0, v0, v1, v0, v0}, Landroid/view/View;->setPadding(IIII)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->d(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setPageId(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->H:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setShowInputMomentMap(Ljava/util/HashMap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSingleTopicView;->J:Ljava/util/HashMap;

    .line 2
    .line 3
    return-void
.end method
