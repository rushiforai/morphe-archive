.class public Lcom/p1/mobile/putong/feed/newui/topic/FeedTopicAggregationBaseFrag;
.super Lcom/p1/mobile/putong/app/PutongFrag;
.source "SourceFile"


# instance fields
.field public A:Ll/n8i;

.field public z:Ll/x8i;


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


# virtual methods
.method public J4()Ll/l4g0;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/FeedTopicAggregationBaseFrag;->N4()Ll/x8i;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/x8i;->S()Ll/l4g0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/FeedTopicAggregationBaseFrag;->N4()Ll/x8i;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/x8i;->S()Ll/l4g0;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0

    .line 24
    :cond_0
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->J4()Ll/l4g0;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public M4()V
    .locals 1

    .line 1
    new-instance v0, Ll/x8i;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/x8i;-><init>(Lcom/p1/mobile/putong/feed/newui/topic/FeedTopicAggregationBaseFrag;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/FeedTopicAggregationBaseFrag;->z:Ll/x8i;

    .line 7
    .line 8
    new-instance v0, Ll/n8i;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Ll/n8i;-><init>(Ll/ner;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/FeedTopicAggregationBaseFrag;->A:Ll/n8i;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/FeedTopicAggregationBaseFrag;->z:Ll/x8i;

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Ll/ar2;->C(Ll/iam;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public N4()Ll/x8i;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/FeedTopicAggregationBaseFrag;->z:Ll/x8i;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/FeedTopicAggregationBaseFrag;->M4()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/FeedTopicAggregationBaseFrag;->z:Ll/x8i;

    .line 9
    .line 10
    return-object p0
.end method

.method public f4()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/FeedTopicAggregationBaseFrag;->A:Ll/n8i;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/FeedTopicAggregationBaseFrag;->M4()V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/FeedTopicAggregationBaseFrag;->A:Ll/n8i;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/n8i;->a0()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/FeedTopicAggregationBaseFrag;->z:Ll/x8i;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/x8i;->E(Landroid/os/Bundle;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/FeedTopicAggregationBaseFrag;->z:Ll/x8i;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Ll/x8i;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/FeedTopicAggregationBaseFrag;->z:Ll/x8i;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/x8i;->P()V

    .line 10
    .line 11
    .line 12
    return-object p1
.end method

.method public n4(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/FeedTopicAggregationBaseFrag;->A:Ll/n8i;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/n8i;->n0()V

    .line 4
    .line 5
    .line 6
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->n4(Landroid/os/Bundle;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public o()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onDestroy()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Frag;->onDestroy()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/FeedTopicAggregationBaseFrag;->z:Ll/x8i;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/x8i;->Q()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onResume()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Frag;->onResume()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/FeedTopicAggregationBaseFrag;->z:Ll/x8i;

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    invoke-virtual {p0, v0}, Ll/x8i;->Y(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_topic_recommend"

    .line 2
    .line 3
    return-object p0
.end method

.method public y4()V
    .locals 0

    .line 1
    return-void
.end method
