.class public Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationFeedFrag;
.super Lcom/p1/mobile/putong/app/PutongFrag;
.source "SourceFile"


# instance fields
.field public A:Ll/cdj0;

.field public z:Ll/ldj0;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static M4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationFeedFrag;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationFeedFrag;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationFeedFrag;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Landroid/os/Bundle;

    .line 7
    .line 8
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v2, "topic_id"

    .line 12
    .line 13
    invoke-virtual {v1, v2, p0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string p0, "topic_owner"

    .line 17
    .line 18
    invoke-virtual {v1, p0, p1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const-string p0, "moment_id"

    .line 22
    .line 23
    invoke-virtual {v1, p0, p2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const-string p0, "vote_index"

    .line 27
    .line 28
    invoke-virtual {v1, p0, p3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 32
    .line 33
    .line 34
    return-object v0
.end method

.method private N4()V
    .locals 1

    .line 1
    new-instance v0, Ll/ldj0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ldj0;-><init>(Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationFeedFrag;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationFeedFrag;->z:Ll/ldj0;

    .line 7
    .line 8
    new-instance v0, Ll/cdj0;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Ll/cdj0;-><init>(Ll/ner;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationFeedFrag;->A:Ll/cdj0;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationFeedFrag;->z:Ll/ldj0;

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Ll/ar2;->C(Ll/iam;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public O4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationFeedFrag;->z:Ll/ldj0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ldj0;->B(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public P4(Ll/bkj0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bkj0<",
            "Lcom/p1/mobile/putong/data/Links;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationFeedFrag;->A:Ll/cdj0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/cdj0;->x0(Ll/bkj0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public Q4(Ll/pf60;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/Links;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationFeedFrag;->A:Ll/cdj0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/cdj0;->y0(Ll/pf60;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public R4(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationFeedFrag;->z:Ll/ldj0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/ldj0;->I(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationFeedFrag;->z:Ll/ldj0;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/ldj0;->q(Landroid/os/Bundle;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationFeedFrag;->z:Ll/ldj0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/ldj0;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public n4(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->n4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationFeedFrag;->N4()V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationFeedFrag;->A:Ll/cdj0;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/cdj0;->n0()V

    .line 10
    .line 11
    .line 12
    return-void
.end method
