.class public Ll/n8i;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/x8i;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:I

.field public c:Lcom/p1/mobile/putong/feed/newui/topic/FeedTopicAggregationBaseFrag;

.field public d:Ljava/lang/String;

.field public e:Lcom/p1/mobile/putong/feed/data/TopicMoment;

.field public f:Ljava/lang/String;

.field public g:Lcom/p1/mobile/putong/feed/data/Moment;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/topic/FeedTopicAggregationBaseFrag;

    .line 5
    .line 6
    iput-object p1, p0, Ll/n8i;->c:Lcom/p1/mobile/putong/feed/newui/topic/FeedTopicAggregationBaseFrag;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic e0(Ll/n8i;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/n8i;->q0(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic f0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic g0(Ll/n8i;Lcom/p1/mobile/putong/feed/data/TopicMoment;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/n8i;->s0(Lcom/p1/mobile/putong/feed/data/TopicMoment;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic h0(Ll/n8i;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/n8i;->p0(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic i0(Ll/n8i;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/n8i;->r0()V

    return-void
.end method

.method public static synthetic j0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic k0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method private synthetic r0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/x8i;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/x8i;->s()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/g8i;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/g8i;-><init>()V

    .line 7
    .line 8
    .line 9
    new-instance v1, Ll/h8i;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/h8i;-><init>(Ll/n8i;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0, v1}, Ll/ar2;->creates(Ll/y20;Ll/x20;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public l0(Lrx/c;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Ll/k8i;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/k8i;-><init>(Ll/n8i;)V

    .line 8
    .line 9
    .line 10
    new-instance p0, Ll/l8i;

    .line 11
    .line 12
    invoke-direct {p0}, Ll/l8i;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public m0(Lrx/c;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Ll/i8i;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/i8i;-><init>(Ll/n8i;)V

    .line 8
    .line 9
    .line 10
    new-instance p0, Ll/j8i;

    .line 11
    .line 12
    invoke-direct {p0}, Ll/j8i;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public n0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/n8i;->c:Lcom/p1/mobile/putong/feed/newui/topic/FeedTopicAggregationBaseFrag;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Ll/n8i;->c:Lcom/p1/mobile/putong/feed/newui/topic/FeedTopicAggregationBaseFrag;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const-string v1, "topic_id"

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iput-object v0, p0, Ll/n8i;->d:Ljava/lang/String;

    .line 23
    .line 24
    iget-object v0, p0, Ll/n8i;->c:Lcom/p1/mobile/putong/feed/newui/topic/FeedTopicAggregationBaseFrag;

    .line 25
    .line 26
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const-string v1, "from"

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iput-object v0, p0, Ll/n8i;->a:Ljava/lang/String;

    .line 37
    .line 38
    iget-object v0, p0, Ll/n8i;->c:Lcom/p1/mobile/putong/feed/newui/topic/FeedTopicAggregationBaseFrag;

    .line 39
    .line 40
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    const-string v1, "page_type"

    .line 45
    .line 46
    const/4 v2, -0x1

    .line 47
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    iput v0, p0, Ll/n8i;->b:I

    .line 52
    .line 53
    iget-object v0, p0, Ll/n8i;->c:Lcom/p1/mobile/putong/feed/newui/topic/FeedTopicAggregationBaseFrag;

    .line 54
    .line 55
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    const-string v1, "user_id"

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    iput-object v0, p0, Ll/n8i;->f:Ljava/lang/String;

    .line 66
    .line 67
    iget-object v0, p0, Ll/n8i;->c:Lcom/p1/mobile/putong/feed/newui/topic/FeedTopicAggregationBaseFrag;

    .line 68
    .line 69
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    const-string v1, "single_topic_moment"

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 80
    .line 81
    invoke-virtual {v1, v0}, Ll/jka;->w7(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    iput-object v0, p0, Ll/n8i;->g:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 86
    .line 87
    return-void
.end method

.method public o0()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/n8i;->e:Lcom/p1/mobile/putong/feed/data/TopicMoment;

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
    if-nez p0, :cond_0

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

.method public final synthetic p0(Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/n8i;->t0(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic q0(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/x8i;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0, p1}, Ll/x8i;->W(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic s0(Lcom/p1/mobile/putong/feed/data/TopicMoment;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Ll/n8i;->d:Ljava/lang/String;

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

.method public t0(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/m8i;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/m8i;-><init>(Ll/n8i;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 11
    .line 12
    iput-object p1, p0, Ll/n8i;->e:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 13
    .line 14
    if-nez p1, :cond_1

    .line 15
    .line 16
    iget-object p1, p0, Ll/n8i;->c:Lcom/p1/mobile/putong/feed/newui/topic/FeedTopicAggregationBaseFrag;

    .line 17
    .line 18
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    iget-object p0, p0, Ll/n8i;->c:Lcom/p1/mobile/putong/feed/newui/topic/FeedTopicAggregationBaseFrag;

    .line 29
    .line 30
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void

    .line 38
    :cond_1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 39
    .line 40
    check-cast v0, Ll/x8i;

    .line 41
    .line 42
    invoke-virtual {v0, p1}, Ll/x8i;->V(Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 46
    .line 47
    check-cast p0, Ll/x8i;

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/x8i;->T()V

    .line 50
    .line 51
    .line 52
    return-void
.end method
