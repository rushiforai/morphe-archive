.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView$a;
.super Ll/h80;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/h80<",
        "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic i:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView$a;->i:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/h80;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public f(Landroid/view/ViewGroup;Landroid/view/ViewGroup;)V
    .locals 1

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView$a;->i:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView;

    .line 2
    .line 3
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView;->Q(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView;)Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    const-class v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;

    .line 8
    .line 9
    invoke-virtual {p2, v0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->P(Ljava/lang/Class;Landroid/view/View;)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;

    .line 14
    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    new-instance p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView$a$a;

    .line 19
    .line 20
    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView$a$a;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView$a;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1, p2}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public bridge synthetic j(Ljava/lang/Object;I)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView$a;->s(Lcom/p1/mobile/putong/feed/data/TopicMoment;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic l(Ljava/lang/Object;IJ)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView$a;->t(Lcom/p1/mobile/putong/feed/data/TopicMoment;IJ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public s(Lcom/p1/mobile/putong/feed/data/TopicMoment;I)V
    .locals 1

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView$a;->i:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView;

    .line 2
    .line 3
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView;->R(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView;)Ljava/util/HashSet;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-virtual {p2, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView$a;->i:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView;

    .line 14
    .line 15
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView;->S(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    new-instance p2, Ll/pf60;

    .line 20
    .line 21
    const-string v0, "topic_id"

    .line 22
    .line 23
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 24
    .line 25
    invoke-direct {p2, v0, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    filled-new-array {p2}, [Ll/pf60;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    const-string p2, "e_related_topic_suggest"

    .line 33
    .line 34
    invoke-static {p2, p0, p1}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method public t(Lcom/p1/mobile/putong/feed/data/TopicMoment;IJ)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView$a;->i:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView;->R(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicView;)Ljava/util/HashSet;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    return-void
.end method
