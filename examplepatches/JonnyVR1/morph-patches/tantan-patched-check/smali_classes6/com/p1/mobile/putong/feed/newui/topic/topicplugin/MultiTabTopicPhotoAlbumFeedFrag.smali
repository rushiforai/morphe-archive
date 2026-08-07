.class public Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/MultiTabTopicPhotoAlbumFeedFrag;
.super Lcom/p1/mobile/putong/feed/newui/topic/FeedTopicAggregationBaseFrag;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/topic/FeedTopicAggregationBaseFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static O4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/MultiTabTopicPhotoAlbumFeedFrag;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/MultiTabTopicPhotoAlbumFeedFrag;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/MultiTabTopicPhotoAlbumFeedFrag;-><init>()V

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
    const-string v2, "user_id"

    .line 12
    .line 13
    invoke-virtual {v1, v2, p0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string p0, "topic_id"

    .line 17
    .line 18
    invoke-virtual {v1, p0, p1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const-string p0, "from"

    .line 22
    .line 23
    invoke-virtual {v1, p0, p2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const-string p0, "page_type"

    .line 27
    .line 28
    invoke-virtual {v1, p0, p3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 29
    .line 30
    .line 31
    const-string p0, "single_topic_moment"

    .line 32
    .line 33
    invoke-virtual {v1, p0, p4}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 37
    .line 38
    .line 39
    return-object v0
.end method


# virtual methods
.method public M4()V
    .locals 1

    .line 1
    new-instance v0, Ll/n8i;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/n8i;-><init>(Ll/ner;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/FeedTopicAggregationBaseFrag;->A:Ll/n8i;

    .line 7
    .line 8
    new-instance v0, Ll/fu10;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Ll/fu10;-><init>(Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/MultiTabTopicPhotoAlbumFeedFrag;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/FeedTopicAggregationBaseFrag;->z:Ll/x8i;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/FeedTopicAggregationBaseFrag;->A:Ll/n8i;

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ll/ar2;->C(Ll/iam;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public y4()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/FeedTopicAggregationBaseFrag;->z:Ll/x8i;

    .line 2
    .line 3
    check-cast p0, Ll/fu10;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/fu10;->d0()V

    .line 6
    .line 7
    .line 8
    return-void
.end method
