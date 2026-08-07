.class public Ll/mai;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/wai;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;

.field public b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public d:Z

.field public e:Lcom/p1/mobile/putong/feed/data/Moment;

.field public f:Ll/yel0;

.field public g:Ljava/lang/String;

.field public h:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/mai;->b:Ljava/util/List;

    .line 10
    .line 11
    new-instance p1, Ljava/util/HashSet;

    .line 12
    .line 13
    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Ll/mai;->c:Ljava/util/Set;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic e0(Ll/mai;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mai;->m0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic f0(Ll/mai;Landroid/net/NetworkInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mai;->o0(Landroid/net/NetworkInfo;)V

    return-void
.end method

.method public static synthetic g0(Ll/mai;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mai;->n0(Lcom/p1/mobile/putong/feed/data/Moment;)V

    return-void
.end method

.method public static synthetic h0(Ll/mai;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mai;->l0(Ll/pf60;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic C(Ll/iam;)V
    .locals 0

    .line 1
    check-cast p1, Ll/wai;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/mai;->i0(Ll/wai;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public a0()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/mai;->s0()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/mai;->t0()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public i0(Ll/wai;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/ar2;->C(Ll/iam;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 5
    .line 6
    return-void
.end method

.method public j0()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/mai;->b:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public k0(Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/jka;->w7(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, p0, Ll/mai;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 8
    .line 9
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p1, p0, Ll/mai;->c:Ljava/util/Set;

    .line 16
    .line 17
    iget-object v0, p0, Ll/mai;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 20
    .line 21
    invoke-interface {p1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Ll/mai;->b:Ljava/util/List;

    .line 25
    .line 26
    iget-object v0, p0, Ll/mai;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 27
    .line 28
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 32
    .line 33
    check-cast p1, Ll/wai;

    .line 34
    .line 35
    iget-object v0, p0, Ll/mai;->b:Ljava/util/List;

    .line 36
    .line 37
    invoke-virtual {p1, v0}, Ll/wai;->f(Ljava/util/List;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Ll/mai;->a:Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;

    .line 41
    .line 42
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;->e:Ll/qai;

    .line 43
    .line 44
    iget-object p0, p0, Ll/mai;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 45
    .line 46
    const/4 v0, 0x0

    .line 47
    invoke-virtual {p1, p0, v0}, Ll/qai;->l(Lcom/p1/mobile/putong/feed/data/Moment;I)V

    .line 48
    .line 49
    .line 50
    :cond_0
    return-void
.end method

.method public final synthetic l0(Ll/pf60;)V
    .locals 4

    .line 1
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

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
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v0, Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 28
    .line 29
    iget-object v2, p0, Ll/mai;->c:Ljava/util/Set;

    .line 30
    .line 31
    iget-object v3, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 32
    .line 33
    invoke-interface {v2, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-nez v2, :cond_0

    .line 38
    .line 39
    iget-object v2, p0, Ll/mai;->c:Ljava/util/Set;

    .line 40
    .line 41
    iget-object v3, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 42
    .line 43
    invoke-interface {v2, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    iget-object v2, p0, Ll/mai;->b:Ljava/util/List;

    .line 47
    .line 48
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 53
    .line 54
    check-cast v0, Ljava/util/Collection;

    .line 55
    .line 56
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-nez v0, :cond_2

    .line 61
    .line 62
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 63
    .line 64
    check-cast v0, Ll/wai;

    .line 65
    .line 66
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 67
    .line 68
    check-cast p1, Ljava/util/List;

    .line 69
    .line 70
    invoke-virtual {v0, p1}, Ll/wai;->z(Ljava/util/List;)V

    .line 71
    .line 72
    .line 73
    :cond_2
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 74
    .line 75
    check-cast p1, Ll/wai;

    .line 76
    .line 77
    iget-object p0, p0, Ll/mai;->b:Ljava/util/List;

    .line 78
    .line 79
    invoke-virtual {p1, p0}, Ll/wai;->f(Ljava/util/List;)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public final synthetic m0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/api/api/Network;->isConnected(Landroid/content/Context;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    xor-int/lit8 p1, p1, 0x1

    .line 8
    .line 9
    iput-boolean p1, p0, Ll/mai;->d:Z

    .line 10
    .line 11
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast p0, Ll/wai;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/wai;->k()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic n0(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p0, Ll/mai;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/mai;->a:Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;->finish()V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-object v0, p0, Ll/mai;->b:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {v0, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    const/4 v1, -0x1

    .line 26
    if-eq v0, v1, :cond_1

    .line 27
    .line 28
    iget-object v1, p0, Ll/mai;->c:Ljava/util/Set;

    .line 29
    .line 30
    iget-object v2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 31
    .line 32
    invoke-interface {v1, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    iget-object v1, p0, Ll/mai;->b:Ljava/util/List;

    .line 36
    .line 37
    invoke-interface {v1, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 41
    .line 42
    check-cast p0, Ll/wai;

    .line 43
    .line 44
    invoke-virtual {p0}, Ll/wai;->l()Ll/gai;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemRemoved(I)V

    .line 49
    .line 50
    .line 51
    :cond_1
    return-void
.end method

.method public final synthetic o0(Landroid/net/NetworkInfo;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->g()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-boolean p1, p0, Ll/mai;->d:Z

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/mai;->p0()V

    .line 12
    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    iput-boolean p1, p0, Ll/mai;->d:Z

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public p0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/mai;->f:Ll/yel0;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/yel0;->b()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p0, Ll/mai;->f:Ll/yel0;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/yel0;->d()Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/kai;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/kai;-><init>(Ll/mai;)V

    .line 25
    .line 26
    .line 27
    new-instance v2, Ll/lai;

    .line 28
    .line 29
    invoke-direct {v2, p0}, Ll/lai;-><init>(Ll/mai;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    :cond_1
    :goto_0
    return-void
.end method

.method public q0(Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/mai;->a:Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "from"

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Ll/mai;->g:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    const-string v0, "VIDEO_FLOW_MOMENT_ID"

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iput-object p1, p0, Ll/mai;->h:Ljava/lang/String;

    .line 26
    .line 27
    return-void
.end method

.method public r0(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "VIDEOS_LIVE_GROUP"

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    new-instance p1, Ll/rss;

    .line 10
    .line 11
    invoke-direct {p1}, Ll/rss;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Ll/mai;->f:Ll/yel0;

    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-static {}, Ll/cmg;->P()Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    new-instance p1, Ll/oai;

    .line 24
    .line 25
    iget-object v0, p0, Ll/mai;->g:Ljava/lang/String;

    .line 26
    .line 27
    iget-object v1, p0, Ll/mai;->h:Ljava/lang/String;

    .line 28
    .line 29
    invoke-direct {p1, v0, v1}, Ll/oai;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iput-object p1, p0, Ll/mai;->f:Ll/yel0;

    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    new-instance p1, Ll/mbi;

    .line 36
    .line 37
    invoke-direct {p1}, Ll/mbi;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object p1, p0, Ll/mai;->f:Ll/yel0;

    .line 41
    .line 42
    return-void
.end method

.method public final s0()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object v0, v0, Ll/jka;->p0:Lrx/subjects/b;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/iai;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/iai;-><init>(Ll/mai;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final t0()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->m()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/jai;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/jai;-><init>(Ll/mai;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 19
    .line 20
    .line 21
    return-void
.end method
