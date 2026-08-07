.class public Ll/d9i;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/e9i;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:I

.field public c:Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicMomentFragment;

.field public d:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

.field public e:Ljava/lang/String;

.field public f:Lcom/p1/mobile/putong/feed/data/TopicMoment;

.field public g:Ljava/lang/String;

.field public h:Lcom/p1/mobile/putong/feed/data/Moment;

.field public i:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;>;"
        }
    .end annotation
.end field

.field public j:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public k:Z


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/d9i;->i:Lrx/subjects/a;

    .line 9
    .line 10
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Ll/d9i;->j:Lrx/subjects/a;

    .line 15
    .line 16
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicMomentFragment;

    .line 17
    .line 18
    iput-object p1, p0, Ll/d9i;->c:Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicMomentFragment;

    .line 19
    .line 20
    return-void
.end method

.method public static synthetic e0(Ll/d9i;Lcom/p1/mobile/putong/feed/data/TopicMoment;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d9i;->p0(Lcom/p1/mobile/putong/feed/data/TopicMoment;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic f0(Ll/d9i;Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/d9i;->o0(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public g0(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->topics:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->topics:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-lez v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/d9i;->m0()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->topics:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_1

    .line 34
    .line 35
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    check-cast v1, Lcom/p1/mobile/putong/data/TopicMomentIdBox;

    .line 40
    .line 41
    iget-object v1, v1, Lcom/p1/mobile/putong/data/TopicMomentIdBox;->id:Ljava/lang/String;

    .line 42
    .line 43
    iget-object v2, p0, Ll/d9i;->e:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-eqz v1, :cond_0

    .line 50
    .line 51
    invoke-virtual {p0}, Ll/d9i;->i0()Ll/v670;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v1, p1}, Ll/v670;->Q0(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 56
    .line 57
    .line 58
    iget-boolean v1, p0, Ll/d9i;->k:Z

    .line 59
    .line 60
    if-nez v1, :cond_0

    .line 61
    .line 62
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 63
    .line 64
    const-string v2, "fake_id_"

    .line 65
    .line 66
    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-nez v1, :cond_0

    .line 71
    .line 72
    invoke-virtual {p0}, Ll/d9i;->i0()Ll/v670;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-virtual {v1}, Ll/v670;->F1()V

    .line 77
    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_1
    return-void
.end method

.method public h0()Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/d9i;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/d9i;->c:Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicMomentFragment;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicMomentFragment;->Q4()Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Ll/d9i;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 12
    .line 13
    :cond_0
    iget-object p0, p0, Ll/d9i;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 14
    .line 15
    return-object p0
.end method

.method public i0()Ll/v670;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/d9i;->h0()Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->A:Ll/v670;

    .line 6
    .line 7
    return-object p0
.end method

.method public final j0()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/d9i;->m0()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p0, "recommend"

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const-string p0, "latest"

    .line 11
    .line 12
    return-object p0
.end method

.method public k0()Ll/n570;
    .locals 2

    .line 1
    new-instance v0, Ll/p7j0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/d9i;->c:Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicMomentFragment;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/d9i;->j0()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-direct {v0, v1, p0}, Ll/p7j0;-><init>(Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicMomentFragment;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method public l0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/d9i;->c:Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicMomentFragment;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "topic_id"

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Ll/d9i;->e:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v0, p0, Ll/d9i;->c:Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicMomentFragment;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "from"

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Ll/d9i;->a:Ljava/lang/String;

    .line 28
    .line 29
    iget-object v0, p0, Ll/d9i;->c:Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicMomentFragment;

    .line 30
    .line 31
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v1, "page_type"

    .line 36
    .line 37
    const/4 v2, -0x1

    .line 38
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iput v0, p0, Ll/d9i;->b:I

    .line 43
    .line 44
    iget-object v0, p0, Ll/d9i;->c:Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicMomentFragment;

    .line 45
    .line 46
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    const-string v1, "user_id"

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iput-object v0, p0, Ll/d9i;->g:Ljava/lang/String;

    .line 57
    .line 58
    iget v0, p0, Ll/d9i;->b:I

    .line 59
    .line 60
    const/16 v1, 0x8

    .line 61
    .line 62
    if-ne v0, v1, :cond_0

    .line 63
    .line 64
    const/4 v0, 0x1

    .line 65
    goto :goto_0

    .line 66
    :cond_0
    const/4 v0, 0x0

    .line 67
    :goto_0
    iput-boolean v0, p0, Ll/d9i;->k:Z

    .line 68
    .line 69
    iget-object v0, p0, Ll/d9i;->c:Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicMomentFragment;

    .line 70
    .line 71
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    const-string v1, "single_topic_moment"

    .line 76
    .line 77
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    check-cast v0, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 82
    .line 83
    iput-object v0, p0, Ll/d9i;->h:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 84
    .line 85
    return-void
.end method

.method public final m0()Z
    .locals 2

    .line 1
    const-string v0, "qa_recommend"

    .line 2
    .line 3
    iget-object v1, p0, Ll/d9i;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    const-string v0, "topic_recommend"

    .line 12
    .line 13
    iget-object p0, p0, Ll/d9i;->a:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0

    .line 24
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 25
    return p0
.end method

.method public n0()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/d9i;->f:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string v0, "deleted"

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->status:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public final synthetic o0(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Ll/d9i;->h:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic p0(Lcom/p1/mobile/putong/feed/data/TopicMoment;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Ll/d9i;->e:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public q0()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/d9i;->i:Lrx/subjects/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public r0(Ll/bkj0;)V
    .locals 4
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
    iget-object v0, p0, Ll/d9i;->h:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_3

    .line 9
    .line 10
    iget-object v0, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast v0, Ljava/util/Collection;

    .line 13
    .line 14
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 21
    .line 22
    iget-object v2, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast v2, Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    check-cast v2, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 31
    .line 32
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {v0, v2}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    if-eqz v2, :cond_0

    .line 43
    .line 44
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_0

    .line 49
    .line 50
    const/4 v0, 0x1

    .line 51
    goto :goto_0

    .line 52
    :cond_0
    move v0, v1

    .line 53
    :goto_0
    iget-object v2, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 54
    .line 55
    check-cast v2, Ljava/util/Collection;

    .line 56
    .line 57
    new-instance v3, Ll/b9i;

    .line 58
    .line 59
    invoke-direct {v3, p0}, Ll/b9i;-><init>(Ll/d9i;)V

    .line 60
    .line 61
    .line 62
    invoke-static {v2, v3}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    check-cast v2, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 67
    .line 68
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result v3

    .line 72
    if-eqz v3, :cond_2

    .line 73
    .line 74
    if-nez v0, :cond_2

    .line 75
    .line 76
    iget-object v3, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 77
    .line 78
    check-cast v3, Ljava/util/List;

    .line 79
    .line 80
    invoke-interface {v3, v2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_1
    move v0, v1

    .line 85
    :cond_2
    :goto_1
    if-nez v0, :cond_3

    .line 86
    .line 87
    iget-object v0, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 88
    .line 89
    check-cast v0, Ljava/util/List;

    .line 90
    .line 91
    iget-object v2, p0, Ll/d9i;->h:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 92
    .line 93
    invoke-interface {v0, v1, v2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 94
    .line 95
    .line 96
    :cond_3
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 97
    .line 98
    check-cast v0, Ll/e9i;

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Ll/e9i;->k(Z)V

    .line 101
    .line 102
    .line 103
    iget-object v0, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 104
    .line 105
    check-cast v0, Ljava/util/Collection;

    .line 106
    .line 107
    new-instance v1, Ll/c9i;

    .line 108
    .line 109
    invoke-direct {v1, p0}, Ll/c9i;-><init>(Ll/d9i;)V

    .line 110
    .line 111
    .line 112
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    check-cast v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 117
    .line 118
    iput-object v0, p0, Ll/d9i;->f:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 119
    .line 120
    iget-object v0, p0, Ll/d9i;->i:Lrx/subjects/a;

    .line 121
    .line 122
    iget-object v1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 123
    .line 124
    check-cast v1, Ljava/util/List;

    .line 125
    .line 126
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {p0}, Ll/d9i;->n0()Z

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    if-eqz v0, :cond_4

    .line 134
    .line 135
    invoke-virtual {p0}, Ll/d9i;->i0()Ll/v670;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    invoke-static {}, Lcom/p1/mobile/putong/data/Links;->new_()Lcom/p1/mobile/putong/data/Links;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    new-instance v0, Ljava/util/ArrayList;

    .line 144
    .line 145
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 146
    .line 147
    .line 148
    invoke-static {p1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    invoke-virtual {p0, p1}, Ll/v670;->L1(Ll/pf60;)V

    .line 153
    .line 154
    .line 155
    return-void

    .line 156
    :cond_4
    invoke-virtual {p0}, Ll/d9i;->i0()Ll/v670;

    .line 157
    .line 158
    .line 159
    move-result-object p0

    .line 160
    new-instance v0, Ll/pf60;

    .line 161
    .line 162
    iget-object v1, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 163
    .line 164
    check-cast v1, Lcom/p1/mobile/putong/data/Links;

    .line 165
    .line 166
    iget-object p1, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 167
    .line 168
    check-cast p1, Ljava/util/List;

    .line 169
    .line 170
    invoke-direct {v0, v1, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 171
    .line 172
    .line 173
    invoke-virtual {p0, v0}, Ll/v670;->L1(Ll/pf60;)V

    .line 174
    .line 175
    .line 176
    return-void
.end method
