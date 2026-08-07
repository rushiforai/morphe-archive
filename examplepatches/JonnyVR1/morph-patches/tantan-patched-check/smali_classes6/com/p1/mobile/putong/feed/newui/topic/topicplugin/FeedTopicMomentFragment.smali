.class public Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicMomentFragment;
.super Lcom/p1/mobile/putong/app/PutongFrag;
.source "SourceFile"


# instance fields
.field public A:Ll/d9i;

.field public z:Ll/e9i;


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

.method public static N4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicMomentFragment;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicMomentFragment;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicMomentFragment;-><init>()V

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
    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 32
    .line 33
    .line 34
    return-object v0
.end method

.method public static O4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILcom/p1/mobile/putong/feed/data/Moment;)Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicMomentFragment;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicMomentFragment;->N4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicMomentFragment;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-eqz p2, :cond_0

    .line 14
    .line 15
    const-string p2, "single_topic_moment"

    .line 16
    .line 17
    invoke-virtual {p1, p2, p4}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 21
    .line 22
    .line 23
    return-object p0
.end method


# virtual methods
.method public M4(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicMomentFragment;->A:Ll/d9i;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/d9i;->g0(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public P4()V
    .locals 1

    .line 1
    new-instance v0, Ll/e9i;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/e9i;-><init>(Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicMomentFragment;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicMomentFragment;->z:Ll/e9i;

    .line 7
    .line 8
    new-instance v0, Ll/d9i;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Ll/d9i;-><init>(Ll/ner;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicMomentFragment;->A:Ll/d9i;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicMomentFragment;->z:Ll/e9i;

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Ll/ar2;->C(Ll/iam;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public Q4()Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicMomentFragment;->z:Ll/e9i;

    .line 2
    .line 3
    iget-object p0, p0, Ll/e9i;->e:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 4
    .line 5
    return-object p0
.end method

.method public R4()Ll/d9i;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicMomentFragment;->A:Ll/d9i;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicMomentFragment;->P4()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicMomentFragment;->A:Ll/d9i;

    .line 9
    .line 10
    return-object p0
.end method

.method public S4()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicMomentFragment;->A:Ll/d9i;

    .line 2
    .line 3
    iget-object p0, p0, Ll/d9i;->e:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method

.method public T4()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicMomentFragment;->Q4()Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->Z4()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicMomentFragment;->z:Ll/e9i;

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    invoke-virtual {p0, v0}, Ll/e9i;->k(Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public U4(Ll/bkj0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bkj0<",
            "Lcom/p1/mobile/putong/data/Links;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicMomentFragment;->A:Ll/d9i;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/d9i;->r0(Ll/bkj0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public f4()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicMomentFragment;->A:Ll/d9i;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicMomentFragment;->P4()V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicMomentFragment;->A:Ll/d9i;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/ar2;->a0()V

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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicMomentFragment;->z:Ll/e9i;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/e9i;->i(Landroid/os/Bundle;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicMomentFragment;->z:Ll/e9i;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/e9i;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public n4(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicMomentFragment;->A:Ll/d9i;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/d9i;->l0()V

    .line 4
    .line 5
    .line 6
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->n4(Landroid/os/Bundle;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public y4()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicMomentFragment;->z:Ll/e9i;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/e9i;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
