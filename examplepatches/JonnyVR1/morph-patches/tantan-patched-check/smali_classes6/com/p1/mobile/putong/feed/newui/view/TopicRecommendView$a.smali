.class public Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView$a;
.super Ll/h80;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;
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
.field public final synthetic i:Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView$a;->i:Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/h80;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/feed/data/TopicMoment;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method


# virtual methods
.method public bridge synthetic j(Ljava/lang/Object;I)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView$a;->t(Lcom/p1/mobile/putong/feed/data/TopicMoment;I)V

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
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView$a;->u(Lcom/p1/mobile/putong/feed/data/TopicMoment;IJ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public t(Lcom/p1/mobile/putong/feed/data/TopicMoment;I)V
    .locals 4

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView$a;->i:Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;

    .line 2
    .line 3
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->z(Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;)Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView$b;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView$b;->f:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    const-string v0, ""

    .line 14
    .line 15
    :cond_0
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Lcom/p1/mobile/putong/feed/data/CategoryTopic;

    .line 26
    .line 27
    iget-object v2, v1, Lcom/p1/mobile/putong/feed/data/CategoryTopic;->topicIds:Ljava/util/List;

    .line 28
    .line 29
    new-instance v3, Ll/vaj0;

    .line 30
    .line 31
    invoke-direct {v3, p1}, Ll/vaj0;-><init>(Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v2, v3}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    if-eqz v2, :cond_0

    .line 39
    .line 40
    iget-object v0, v1, Lcom/p1/mobile/putong/feed/data/CategoryTopic;->name:Ljava/lang/String;

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView$a;->i:Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;

    .line 44
    .line 45
    invoke-static {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->R(Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;Lcom/p1/mobile/putong/feed/data/TopicMoment;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public u(Lcom/p1/mobile/putong/feed/data/TopicMoment;IJ)V
    .locals 0

    .line 1
    return-void
.end method
