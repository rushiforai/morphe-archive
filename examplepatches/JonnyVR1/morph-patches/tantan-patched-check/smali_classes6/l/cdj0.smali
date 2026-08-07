.class public Ll/cdj0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/ldj0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/ucj0;

.field public b:Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationFeedFrag;

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;

.field public e:Ljava/lang/String;

.field public f:I

.field public g:Ljava/lang/String;

.field public h:Ljava/lang/String;

.field public i:Lcom/p1/mobile/putong/feed/data/TopicMoment;

.field public j:Lcom/p1/mobile/putong/data/Links;

.field public k:Z

.field public l:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ">;"
        }
    .end annotation
.end field

.field public m:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Ll/cdj0;->f:I

    .line 6
    .line 7
    new-instance v0, Ljava/util/LinkedList;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/cdj0;->l:Ljava/util/List;

    .line 13
    .line 14
    new-instance v0, Ll/vcj0;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Ll/vcj0;-><init>(Ll/cdj0;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/cdj0;->m:Ll/y20;

    .line 20
    .line 21
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationFeedFrag;

    .line 22
    .line 23
    iput-object p1, p0, Ll/cdj0;->b:Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationFeedFrag;

    .line 24
    .line 25
    return-void
.end method

.method public static synthetic e0(Ll/cdj0;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/cdj0;->p0(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic f0(Ll/cdj0;Lcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/cdj0;->t0(Lcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    return-void
.end method

.method public static synthetic g0(Ll/cdj0;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/cdj0;->u0(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic h0(Ll/cdj0;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cdj0;->s0(Lcom/p1/mobile/putong/feed/data/MomentMessage;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic i0(Ll/cdj0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/cdj0;->q0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic j0(Ll/cdj0;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cdj0;->r0(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    return-void
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

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

.method private synthetic q0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/cdj0;->b:Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationFeedFrag;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->s4()V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public A0(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cdj0;->l:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/bdj0;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Ll/bdj0;-><init>(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, -0x1

    .line 13
    if-eq v0, v1, :cond_0

    .line 14
    .line 15
    iget-object v1, p0, Ll/cdj0;->l:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {v1, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 21
    .line 22
    check-cast v0, Ll/ldj0;

    .line 23
    .line 24
    invoke-virtual {v0, p1}, Ll/ldj0;->C(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 28
    .line 29
    check-cast p1, Ll/ldj0;

    .line 30
    .line 31
    iget-object p0, p0, Ll/cdj0;->l:Ljava/util/List;

    .line 32
    .line 33
    invoke-virtual {p1, p0}, Ll/ldj0;->E(Ljava/util/List;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public C0(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/cdj0;->g:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/cdj0;->h:Ljava/lang/String;

    .line 10
    .line 11
    iput-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->parentCommentId:Ljava/lang/String;

    .line 12
    .line 13
    iget-object v0, p0, Ll/cdj0;->g:Ljava/lang/String;

    .line 14
    .line 15
    iput-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->api_only_otherUser:Ljava/lang/String;

    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 18
    .line 19
    check-cast v0, Ll/ldj0;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/ldj0;->K()V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/cdj0;->a:Ll/ucj0;

    .line 25
    .line 26
    invoke-virtual {v0, p1}, Ll/ucj0;->H(Lcom/p1/mobile/putong/feed/data/MomentMessage;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v1, Ll/zcj0;

    .line 35
    .line 36
    invoke-direct {v1, p0, p1}, Ll/zcj0;-><init>(Ll/cdj0;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 37
    .line 38
    .line 39
    new-instance v2, Ll/adj0;

    .line 40
    .line 41
    invoke-direct {v2, p0, p1}, Ll/adj0;-><init>(Ll/cdj0;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 42
    .line 43
    .line 44
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public D0(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    iput-object p1, p0, Ll/cdj0;->g:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, Ll/cdj0;->h:Ljava/lang/String;

    .line 4
    .line 5
    new-instance p2, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/cdj0;->a:Ll/ucj0;

    .line 11
    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Ll/n570;->m(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/cdj0;->b:Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationFeedFrag;

    .line 30
    .line 31
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->a3:I

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Ll/cdj0;->a:Ll/ucj0;

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Ll/n570;->m(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const-string p0, ": "

    .line 52
    .line 53
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    return-object p0
.end method

.method public E0(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/cdj0;->l:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/cdj0;->l:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {p0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public l0()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cdj0;->b:Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationFeedFrag;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->G2:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-boolean v1, p0, Ll/cdj0;->k:Z

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/cdj0;->b:Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationFeedFrag;

    .line 14
    .line 15
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->d4:I

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_0
    invoke-virtual {p0}, Ll/cdj0;->o0()Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    iget-object p0, p0, Ll/cdj0;->b:Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationFeedFrag;

    .line 29
    .line 30
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->F2:I

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0

    .line 37
    :cond_1
    return-object v0
.end method

.method public m0()V
    .locals 2

    .line 1
    new-instance v0, Ll/ucj0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/cdj0;->b:Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationFeedFrag;

    .line 4
    .line 5
    invoke-direct {v0, v1, p0}, Ll/ucj0;-><init>(Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationFeedFrag;Ll/cdj0;)V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Ll/cdj0;->a:Ll/ucj0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/ucj0;->o()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public n0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cdj0;->b:Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationFeedFrag;

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
    iput-object v0, p0, Ll/cdj0;->c:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v0, p0, Ll/cdj0;->b:Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationFeedFrag;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "topic_owner"

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Ll/cdj0;->d:Ljava/lang/String;

    .line 28
    .line 29
    iget-object v0, p0, Ll/cdj0;->b:Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationFeedFrag;

    .line 30
    .line 31
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v1, "moment_id"

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iput-object v0, p0, Ll/cdj0;->e:Ljava/lang/String;

    .line 42
    .line 43
    iget-object v0, p0, Ll/cdj0;->b:Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationFeedFrag;

    .line 44
    .line 45
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    const-string v1, "vote_index"

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    iput v0, p0, Ll/cdj0;->f:I

    .line 56
    .line 57
    return-void
.end method

.method public o0()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/cdj0;->i:Lcom/p1/mobile/putong/feed/data/TopicMoment;

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

.method public final synthetic p0(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p2, p0, Ll/cdj0;->b:Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationFeedFrag;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Frag;->s4()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/cdj0;->A0(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic r0(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/cdj0;->b:Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationFeedFrag;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->U2:I

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Frag;->p4(IZ)Landroid/app/Dialog;

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/cdj0;->a:Ll/ucj0;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ll/ucj0;->G(Lcom/p1/mobile/putong/feed/data/MomentMessage;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/wcj0;

    .line 20
    .line 21
    invoke-direct {v1, p0, p1}, Ll/wcj0;-><init>(Ll/cdj0;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 22
    .line 23
    .line 24
    new-instance p1, Ll/xcj0;

    .line 25
    .line 26
    invoke-direct {p1, p0}, Ll/xcj0;-><init>(Ll/cdj0;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final synthetic s0(Lcom/p1/mobile/putong/feed/data/MomentMessage;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cdj0;->l:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic t0(Lcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p2}, Ll/cdj0;->z0(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isChildComment()Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 11
    .line 12
    check-cast p0, Ll/ldj0;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/ldj0;->F()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final synthetic u0(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cdj0;->l:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/cdj0;->l:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 15
    .line 16
    check-cast p1, Ll/ldj0;

    .line 17
    .line 18
    iget-object p0, p0, Ll/cdj0;->l:Ljava/util/List;

    .line 19
    .line 20
    invoke-virtual {p1, p0}, Ll/ldj0;->E(Ljava/util/List;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    sget-object p0, Lcom/p1/mobile/android/app/App;->d:Lcom/p1/mobile/android/app/App;

    .line 24
    .line 25
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/app/App;->k(Ljava/lang/Throwable;)V

    .line 26
    .line 27
    .line 28
    invoke-static {p2}, Ll/i4h;->e(Ljava/lang/Throwable;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public x0(Ll/bkj0;)V
    .locals 4
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
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/cdj0;->k:Z

    .line 3
    .line 4
    iget-object v1, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 5
    .line 6
    check-cast v1, Lcom/p1/mobile/putong/data/Links;

    .line 7
    .line 8
    iput-object v1, p0, Ll/cdj0;->j:Lcom/p1/mobile/putong/data/Links;

    .line 9
    .line 10
    iget-object v1, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast v1, Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-lez v1, :cond_1

    .line 19
    .line 20
    iget-object v1, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 21
    .line 22
    check-cast v1, Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 29
    .line 30
    iput-object v0, p0, Ll/cdj0;->i:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 31
    .line 32
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 33
    .line 34
    check-cast v1, Ll/ldj0;

    .line 35
    .line 36
    iget-object v2, p0, Ll/cdj0;->a:Ll/ucj0;

    .line 37
    .line 38
    iget v3, p0, Ll/cdj0;->f:I

    .line 39
    .line 40
    invoke-virtual {v1, v2, v0, v3}, Ll/ldj0;->G(Ll/ucj0;Lcom/p1/mobile/putong/feed/data/TopicMoment;I)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ll/cdj0;->i:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 44
    .line 45
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_0

    .line 50
    .line 51
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 52
    .line 53
    check-cast v0, Ll/ldj0;

    .line 54
    .line 55
    iget-object v1, p0, Ll/cdj0;->i:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 56
    .line 57
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/TopicMoment;->getTopicNameWithPrefix()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v0, v1}, Ll/ldj0;->p(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    :cond_0
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 65
    .line 66
    check-cast v0, Ll/ldj0;

    .line 67
    .line 68
    invoke-virtual {p0}, Ll/cdj0;->o0()Z

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    xor-int/lit8 v1, v1, 0x1

    .line 73
    .line 74
    invoke-virtual {v0, v1}, Ll/ldj0;->H(Z)V

    .line 75
    .line 76
    .line 77
    :cond_1
    iget-object v0, p0, Ll/cdj0;->l:Ljava/util/List;

    .line 78
    .line 79
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0}, Ll/cdj0;->o0()Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-nez v0, :cond_2

    .line 87
    .line 88
    iget-object v0, p0, Ll/cdj0;->l:Ljava/util/List;

    .line 89
    .line 90
    iget-object p1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 91
    .line 92
    check-cast p1, Ljava/util/Collection;

    .line 93
    .line 94
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 95
    .line 96
    .line 97
    :cond_2
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 98
    .line 99
    check-cast p1, Ll/ldj0;

    .line 100
    .line 101
    iget-object p0, p0, Ll/cdj0;->l:Ljava/util/List;

    .line 102
    .line 103
    invoke-virtual {p1, p0}, Ll/ldj0;->E(Ljava/util/List;)V

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public y0(Ll/pf60;)V
    .locals 2
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
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/data/Links;

    .line 4
    .line 5
    iput-object v0, p0, Ll/cdj0;->j:Lcom/p1/mobile/putong/data/Links;

    .line 6
    .line 7
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 8
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
    iget-object v0, p0, Ll/cdj0;->l:Ljava/util/List;

    .line 16
    .line 17
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast p1, Ljava/util/Collection;

    .line 20
    .line 21
    new-instance v1, Ll/ycj0;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/ycj0;-><init>(Ll/cdj0;)V

    .line 24
    .line 25
    .line 26
    invoke-static {p1, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 34
    .line 35
    check-cast p1, Ll/ldj0;

    .line 36
    .line 37
    iget-object p0, p0, Ll/cdj0;->l:Ljava/util/List;

    .line 38
    .line 39
    invoke-virtual {p1, p0}, Ll/ldj0;->E(Ljava/util/List;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void
.end method

.method public z0(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isNewComment:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/cdj0;->l:Ljava/util/List;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-interface {v0, v1, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 11
    .line 12
    check-cast p1, Ll/ldj0;

    .line 13
    .line 14
    iget-object p0, p0, Ll/cdj0;->l:Ljava/util/List;

    .line 15
    .line 16
    invoke-virtual {p1, p0}, Ll/ldj0;->E(Ljava/util/List;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
