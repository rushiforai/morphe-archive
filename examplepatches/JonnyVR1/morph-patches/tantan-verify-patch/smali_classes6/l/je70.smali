.class public Ll/je70;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/hf70;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

.field public b:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;

.field public e:I

.field public f:Ljava/lang/String;

.field public g:I

.field public h:Z

.field public i:Z

.field public j:Ll/n570;

.field public k:Z

.field public l:J


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "-1"

    .line 5
    .line 6
    iput-object v0, p0, Ll/je70;->f:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Ll/je70;->i:Z

    .line 10
    .line 11
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 12
    .line 13
    iput-object p1, p0, Ll/je70;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 14
    .line 15
    return-void
.end method

.method private synthetic L0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/hf70;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/hf70;->O()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic N0(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iput-boolean p1, p0, Ll/je70;->k:Z

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic e0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic f0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic g0(Ljava/util/List;)Ljava/util/ArrayList;
    .locals 1

    .line 1
    new-instance v0, Ll/zd70;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/zd70;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/feed/data/TopicMoment;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    const-string v0, "deleted"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->status:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const-string v0, "offline"

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->status:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public static synthetic i0(Ll/je70;Ljava/util/List;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/je70;->O0(Ljava/util/List;Ljava/util/List;)V

    return-void
.end method

.method public static synthetic j0(Ll/je70;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/je70;->I0(Lcom/p1/mobile/putong/feed/data/Moment;)V

    return-void
.end method

.method public static synthetic k0(Ll/je70;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/je70;->J0(Ljava/util/ArrayList;)V

    return-void
.end method

.method public static synthetic l0(Ll/je70;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/je70;->L0()V

    return-void
.end method

.method public static synthetic m0(Ll/pf60;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Ljava/util/List;

    .line 4
    .line 5
    return-object p0
.end method

.method public static synthetic n0(Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;Lcom/p1/mobile/putong/feed/data/FeedUserLiveLabel;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/FeedUserLiveLabel;->userId:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

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

.method public static synthetic o0(Ll/je70;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/je70;->N0(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic p0(Ll/pf60;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 9
    .line 10
    return-object p0
.end method

.method private s0()Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/je70;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/je70;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->R4()Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Ll/je70;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 12
    .line 13
    :cond_0
    iget-object p0, p0, Ll/je70;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 14
    .line 15
    return-object p0
.end method

.method private t0()Ll/v670;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/je70;->s0()Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

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

.method private u0()Ll/ld70;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/je70;->s0()Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->z:Ll/y670;

    .line 6
    .line 7
    check-cast p0, Ll/ld70;

    .line 8
    .line 9
    return-object p0
.end method


# virtual methods
.method public A0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/je70;->E0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/je70;->H0()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    return-void

    .line 15
    :cond_1
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/jka;->c8()Lrx/subjects/a;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/ge70;

    .line 22
    .line 23
    invoke-direct {v1}, Ll/ge70;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Ll/he70;

    .line 31
    .line 32
    invoke-direct {v1}, Ll/he70;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    new-instance v1, Ll/ie70;

    .line 40
    .line 41
    invoke-direct {v1}, Ll/ie70;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v1, Ll/yd70;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/yd70;-><init>(Ll/je70;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public C0()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public D0()Z
    .locals 1

    .line 1
    iget p0, p0, Ll/je70;->g:I

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/16 v0, 0xc

    .line 6
    .line 7
    if-ne p0, v0, :cond_1

    .line 8
    .line 9
    :cond_0
    invoke-static {}, Ll/cmg;->y0()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_1
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public E0()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public F0()Z
    .locals 1

    .line 1
    iget v0, p0, Ll/je70;->g:I

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/je70;->q0()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-ne v0, p0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ll/cmg;->l0()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 16
    .line 17
    iget-object p0, p0, Ll/jka;->H1:Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 18
    .line 19
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method public G0()Z
    .locals 3

    .line 1
    invoke-static {}, Ll/cmg;->s()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget p0, p0, Ll/je70;->g:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    const/4 v2, 0x1

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    const/16 v0, 0xe

    .line 12
    .line 13
    if-ne p0, v0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Ll/skh;->a()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    return v2

    .line 22
    :cond_0
    return v1

    .line 23
    :cond_1
    if-ne p0, v2, :cond_2

    .line 24
    .line 25
    invoke-static {}, Ll/skh;->a()Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_2

    .line 30
    .line 31
    return v2

    .line 32
    :cond_2
    return v1
.end method

.method public H0()Z
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {}, Ll/cmg;->s()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    return v1

    .line 17
    :cond_0
    if-eqz p0, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 20
    .line 21
    .line 22
    :cond_1
    return v1
.end method

.method public final synthetic I0(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/hf70;

    .line 4
    .line 5
    const-string v0, "p_moment_post"

    .line 6
    .line 7
    invoke-virtual {p0, p1, v0}, Ll/hf70;->E0(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic J0(Ljava/util/ArrayList;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    const/4 v1, 0x0

    .line 11
    const/4 v2, 0x5

    .line 12
    if-le p1, v2, :cond_0

    .line 13
    .line 14
    invoke-interface {v0, v1, v2}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    :cond_0
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 19
    .line 20
    check-cast p1, Ll/hf70;

    .line 21
    .line 22
    invoke-virtual {p1, v0}, Ll/hf70;->J0(Ljava/util/List;)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 26
    .line 27
    check-cast p0, Ll/hf70;

    .line 28
    .line 29
    invoke-virtual {p0, v1}, Ll/hf70;->B0(I)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final synthetic O0(Ljava/util/List;Ljava/util/List;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/hf70;

    .line 4
    .line 5
    iget-object v0, v0, Ll/hf70;->n:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->m:Ll/vg60;

    .line 8
    .line 9
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    const/4 v2, 0x0

    .line 20
    if-eqz v1, :cond_2

    .line 21
    .line 22
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;

    .line 27
    .line 28
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 29
    .line 30
    if-nez v3, :cond_0

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    new-instance v3, Ll/fe70;

    .line 34
    .line 35
    invoke-direct {v3, v1}, Ll/fe70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;)V

    .line 36
    .line 37
    .line 38
    invoke-static {p2, v3}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    check-cast v3, Lcom/p1/mobile/putong/feed/data/FeedUserLiveLabel;

    .line 43
    .line 44
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 49
    .line 50
    if-eqz v4, :cond_1

    .line 51
    .line 52
    iget-object v2, v3, Lcom/p1/mobile/putong/feed/data/FeedUserLiveLabel;->liveState:Ljava/lang/String;

    .line 53
    .line 54
    iput-object v2, v1, Lcom/p1/mobile/putong/feed/data/Moment;->liveState:Ljava/lang/String;

    .line 55
    .line 56
    iget-object v2, v1, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 57
    .line 58
    iget-object v4, v3, Lcom/p1/mobile/putong/feed/data/FeedUserLiveLabel;->liveId:Ljava/lang/String;

    .line 59
    .line 60
    iput-object v4, v2, Lcom/p1/mobile/putong/data/Live;->id:Ljava/lang/String;

    .line 61
    .line 62
    iget-object v2, v3, Lcom/p1/mobile/putong/feed/data/FeedUserLiveLabel;->iconTitle:Ljava/lang/String;

    .line 63
    .line 64
    iput-object v2, v1, Lcom/p1/mobile/putong/feed/data/Moment;->iconTitle:Ljava/lang/String;

    .line 65
    .line 66
    iget-object v2, v3, Lcom/p1/mobile/putong/feed/data/FeedUserLiveLabel;->multiCallInfo:Lcom/p1/mobile/putong/feed/data/LiveMultiCallInfo;

    .line 67
    .line 68
    iput-object v2, v1, Lcom/p1/mobile/putong/feed/data/Moment;->multiCallInfo:Lcom/p1/mobile/putong/feed/data/LiveMultiCallInfo;

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_1
    iput-object v2, v1, Lcom/p1/mobile/putong/feed/data/Moment;->liveState:Ljava/lang/String;

    .line 72
    .line 73
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 74
    .line 75
    iput-object v2, v3, Lcom/p1/mobile/putong/data/Live;->id:Ljava/lang/String;

    .line 76
    .line 77
    iput-object v2, v1, Lcom/p1/mobile/putong/feed/data/Moment;->iconTitle:Ljava/lang/String;

    .line 78
    .line 79
    iput-object v2, v1, Lcom/p1/mobile/putong/feed/data/Moment;->multiCallInfo:Lcom/p1/mobile/putong/feed/data/LiveMultiCallInfo;

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_2
    invoke-direct {p0}, Ll/je70;->u0()Ll/ld70;

    .line 83
    .line 84
    .line 85
    move-result-object p2

    .line 86
    const/4 v0, 0x0

    .line 87
    iget p0, p0, Ll/je70;->e:I

    .line 88
    .line 89
    invoke-virtual {p2, p1, v0, v2, p0}, Ll/y670;->E(Ljava/util/List;ZLcom/p1/mobile/putong/data/User;I)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public P0()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->pickMediasWithInstaPicker()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public Q0(I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/je70;->t0()Ll/v670;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/v670;->b1()Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    invoke-direct {p0}, Ll/je70;->u0()Ll/ld70;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p1}, Ll/y670;->B()Z

    .line 22
    .line 23
    .line 24
    invoke-direct {p0}, Ll/je70;->t0()Ll/v670;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    iget-object p1, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 29
    .line 30
    check-cast p1, Ljava/lang/Integer;

    .line 31
    .line 32
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    iget-object v0, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 37
    .line 38
    check-cast v0, Ljava/lang/Integer;

    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    invoke-virtual {p0, p1, v0}, Ll/v670;->I1(II)V

    .line 45
    .line 46
    .line 47
    :cond_0
    return-void
.end method

.method public R0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    new-array v0, v0, [Lcom/p1/mobile/putong/data/Media;

    .line 7
    .line 8
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-static {p0, v0, v1}, Ll/cn40;->i0(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public S0()V
    .locals 5

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Ll/je70;->l:J

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    const-wide/32 v2, 0xea60

    .line 9
    .line 10
    .line 11
    cmp-long v0, v0, v2

    .line 12
    .line 13
    if-gez v0, :cond_0

    .line 14
    .line 15
    goto/16 :goto_0

    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 18
    .line 19
    if-eqz v0, :cond_5

    .line 20
    .line 21
    move-object v1, v0

    .line 22
    check-cast v1, Ll/hf70;

    .line 23
    .line 24
    iget-object v1, v1, Ll/hf70;->n:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 25
    .line 26
    if-eqz v1, :cond_5

    .line 27
    .line 28
    check-cast v0, Ll/hf70;

    .line 29
    .line 30
    iget-object v0, v0, Ll/hf70;->n:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->m:Ll/vg60;

    .line 33
    .line 34
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 35
    .line 36
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    invoke-static {}, Ll/pzi0;->o()J

    .line 44
    .line 45
    .line 46
    move-result-wide v0

    .line 47
    iput-wide v0, p0, Ll/je70;->l:J

    .line 48
    .line 49
    new-instance v0, Ljava/util/HashSet;

    .line 50
    .line 51
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 52
    .line 53
    .line 54
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 55
    .line 56
    check-cast v1, Ll/hf70;

    .line 57
    .line 58
    iget-object v1, v1, Ll/hf70;->n:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 59
    .line 60
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->m:Ll/vg60;

    .line 61
    .line 62
    iget-object v1, v1, Ll/vg60;->a:Ljava/util/List;

    .line 63
    .line 64
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    :cond_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 69
    .line 70
    .line 71
    move-result v3

    .line 72
    if-eqz v3, :cond_4

    .line 73
    .line 74
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    check-cast v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;

    .line 79
    .line 80
    iget-object v4, v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 81
    .line 82
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    move-result v4

    .line 86
    if-eqz v4, :cond_3

    .line 87
    .line 88
    iget-object v4, v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 89
    .line 90
    iget-object v4, v4, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 91
    .line 92
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 93
    .line 94
    .line 95
    move-result v4

    .line 96
    if-nez v4, :cond_3

    .line 97
    .line 98
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 99
    .line 100
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 101
    .line 102
    invoke-virtual {v0, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    :cond_3
    invoke-virtual {v0}, Ljava/util/HashSet;->size()I

    .line 106
    .line 107
    .line 108
    move-result v3

    .line 109
    const/16 v4, 0x28

    .line 110
    .line 111
    if-le v3, v4, :cond_2

    .line 112
    .line 113
    :cond_4
    sget-object v2, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 114
    .line 115
    invoke-virtual {p0}, Ll/je70;->r0()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v3

    .line 119
    invoke-virtual {v2, v3, v0}, Ll/jka;->e7(Ljava/lang/String;Ljava/util/HashSet;)Lrx/c;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 128
    .line 129
    .line 130
    move-result-object v2

    .line 131
    invoke-virtual {v0, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    new-instance v2, Ll/ce70;

    .line 136
    .line 137
    invoke-direct {v2, p0, v1}, Ll/ce70;-><init>(Ll/je70;Ljava/util/List;)V

    .line 138
    .line 139
    .line 140
    new-instance p0, Ll/de70;

    .line 141
    .line 142
    invoke-direct {p0}, Ll/de70;-><init>()V

    .line 143
    .line 144
    .line 145
    invoke-static {v2, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 150
    .line 151
    .line 152
    :cond_5
    :goto_0
    return-void
.end method

.method public U0()Z
    .locals 4

    .line 1
    invoke-static {}, Ll/cmg;->s()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget p0, p0, Ll/je70;->g:I

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    const/4 v2, 0x0

    .line 9
    const/4 v3, 0x4

    .line 10
    if-eqz v0, :cond_2

    .line 11
    .line 12
    const/16 v0, 0xe

    .line 13
    .line 14
    if-eq p0, v0, :cond_1

    .line 15
    .line 16
    if-ne p0, v3, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    return v2

    .line 20
    :cond_1
    :goto_0
    return v1

    .line 21
    :cond_2
    if-eqz p0, :cond_4

    .line 22
    .line 23
    if-ne p0, v3, :cond_3

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_3
    return v2

    .line 27
    :cond_4
    :goto_1
    return v1
.end method

.method public V0()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/je70;->u0()Ll/ld70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/ld70;->Q()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->i5:I

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->setTitle(I)V

    .line 15
    .line 16
    .line 17
    invoke-direct {p0}, Ll/je70;->t0()Ll/v670;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    sget-object v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->I:Lcom/p1/mobile/putong/data/Links;

    .line 22
    .line 23
    iput-object v1, v0, Ll/v670;->k:Lcom/p1/mobile/putong/data/Links;

    .line 24
    .line 25
    invoke-direct {p0}, Ll/je70;->t0()Ll/v670;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v0, v0, Ll/v670;->j:Ljava/util/List;

    .line 30
    .line 31
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 32
    .line 33
    .line 34
    sget-object v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->H:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 37
    .line 38
    .line 39
    invoke-direct {p0}, Ll/je70;->t0()Ll/v670;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    const/4 v1, 0x0

    .line 44
    invoke-virtual {p0, v0, v1}, Ll/v670;->P1(Ljava/util/List;Z)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public a0()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/xd70;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/xd70;-><init>()V

    .line 7
    .line 8
    .line 9
    new-instance v1, Ll/ae70;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/ae70;-><init>(Ll/je70;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0, v1}, Ll/ar2;->creates(Ll/y20;Ll/x20;)V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Ll/cmg;->K()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object v0, p0, Ll/je70;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 24
    .line 25
    sget-object v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->p1:Lrx/subjects/a;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/be70;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/be70;-><init>(Ll/je70;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public q0()I
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/je70;->k:Z

    .line 2
    .line 3
    const/16 v1, 0xc

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Ll/je70;->k:Z

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    invoke-static {}, Ll/pu20;->k()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {}, Ll/pu20;->i()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    return v1

    .line 26
    :cond_1
    invoke-static {}, Ll/pu20;->q()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-eqz p0, :cond_2

    .line 35
    .line 36
    const/16 p0, 0xe

    .line 37
    .line 38
    return p0

    .line 39
    :cond_2
    const/16 p0, 0xf

    .line 40
    .line 41
    return p0
.end method

.method public r0()Ljava/lang/String;
    .locals 2

    .line 1
    const-string v0, "from_nearby_focus"

    .line 2
    .line 3
    iget-object v1, p0, Ll/je70;->d:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const-string p0, "momentFollow"

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    const-string v0, "from_like"

    .line 15
    .line 16
    iget-object v1, p0, Ll/je70;->d:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    const-string p0, "momentLike"

    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_1
    const-string v0, "from_nearby_falls_feed"

    .line 28
    .line 29
    iget-object v1, p0, Ll/je70;->d:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    const-string v1, "momentNearby"

    .line 36
    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    return-object v1

    .line 40
    :cond_2
    const-string v0, "from_nearby_online"

    .line 41
    .line 42
    iget-object p0, p0, Ll/je70;->d:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    if-eqz p0, :cond_3

    .line 49
    .line 50
    const-string p0, "momentNearbyOnline"

    .line 51
    .line 52
    return-object p0

    .line 53
    :cond_3
    return-object v1
.end method

.method public x0()V
    .locals 2

    .line 1
    invoke-static {}, Ll/cn40;->F()Lrx/c;

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
    new-instance v1, Ll/ee70;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/ee70;-><init>(Ll/je70;)V

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

.method public y0()Ll/n570;
    .locals 3

    .line 1
    const-string v0, "from_nearby_focus"

    .line 2
    .line 3
    iget-object v1, p0, Ll/je70;->d:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    new-instance v0, Ll/o0j;

    .line 13
    .line 14
    iget-object v2, p0, Ll/je70;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 15
    .line 16
    invoke-direct {v0, v2}, Ll/o0j;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/je70;->j:Ll/n570;

    .line 20
    .line 21
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 22
    .line 23
    check-cast v0, Ll/hf70;

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ll/hf70;->K0(Z)V

    .line 26
    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :cond_0
    const-string v0, "from_nearby_falls_feed"

    .line 31
    .line 32
    iget-object v2, p0, Ll/je70;->d:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    new-instance v0, Ll/bg20;

    .line 41
    .line 42
    iget-object v2, p0, Ll/je70;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 43
    .line 44
    invoke-direct {v0, v2}, Ll/bg20;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;)V

    .line 45
    .line 46
    .line 47
    iput-object v0, p0, Ll/je70;->j:Ll/n570;

    .line 48
    .line 49
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 50
    .line 51
    check-cast v0, Ll/hf70;

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Ll/hf70;->K0(Z)V

    .line 54
    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :cond_1
    const-string v0, "recommend_only_video"

    .line 59
    .line 60
    iget-object v2, p0, Ll/je70;->d:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-eqz v0, :cond_2

    .line 67
    .line 68
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 69
    .line 70
    check-cast v0, Ll/hf70;

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Ll/hf70;->K0(Z)V

    .line 73
    .line 74
    .line 75
    goto/16 :goto_0

    .line 76
    .line 77
    :cond_2
    const-string v0, "recommend_multiple"

    .line 78
    .line 79
    iget-object v2, p0, Ll/je70;->d:Ljava/lang/String;

    .line 80
    .line 81
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-eqz v0, :cond_3

    .line 86
    .line 87
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 88
    .line 89
    check-cast v0, Ll/hf70;

    .line 90
    .line 91
    invoke-virtual {v0, v1}, Ll/hf70;->K0(Z)V

    .line 92
    .line 93
    .line 94
    goto/16 :goto_0

    .line 95
    .line 96
    :cond_3
    const-string v0, "original_moments"

    .line 97
    .line 98
    iget-object v2, p0, Ll/je70;->d:Ljava/lang/String;

    .line 99
    .line 100
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    if-eqz v0, :cond_4

    .line 105
    .line 106
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 107
    .line 108
    check-cast v0, Ll/hf70;

    .line 109
    .line 110
    const/4 v1, 0x1

    .line 111
    invoke-virtual {v0, v1}, Ll/hf70;->K0(Z)V

    .line 112
    .line 113
    .line 114
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 115
    .line 116
    check-cast v0, Ll/hf70;

    .line 117
    .line 118
    invoke-virtual {v0}, Ll/hf70;->f0()V

    .line 119
    .line 120
    .line 121
    goto/16 :goto_0

    .line 122
    .line 123
    :cond_4
    const-string v0, "from_nearby_online"

    .line 124
    .line 125
    iget-object v2, p0, Ll/je70;->d:Ljava/lang/String;

    .line 126
    .line 127
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    if-eqz v0, :cond_5

    .line 132
    .line 133
    new-instance v0, Ll/a9h;

    .line 134
    .line 135
    iget-object v2, p0, Ll/je70;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 136
    .line 137
    invoke-direct {v0, v2}, Ll/a9h;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;)V

    .line 138
    .line 139
    .line 140
    iput-object v0, p0, Ll/je70;->j:Ll/n570;

    .line 141
    .line 142
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 143
    .line 144
    check-cast v0, Ll/hf70;

    .line 145
    .line 146
    invoke-virtual {v0, v1}, Ll/hf70;->K0(Z)V

    .line 147
    .line 148
    .line 149
    goto/16 :goto_0

    .line 150
    .line 151
    :cond_5
    const-string v0, "from_like"

    .line 152
    .line 153
    iget-object v2, p0, Ll/je70;->d:Ljava/lang/String;

    .line 154
    .line 155
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    move-result v0

    .line 159
    if-eqz v0, :cond_6

    .line 160
    .line 161
    new-instance v0, Ll/kbh;

    .line 162
    .line 163
    iget-object v2, p0, Ll/je70;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 164
    .line 165
    invoke-direct {v0, v2}, Ll/kbh;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;)V

    .line 166
    .line 167
    .line 168
    iput-object v0, p0, Ll/je70;->j:Ll/n570;

    .line 169
    .line 170
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 171
    .line 172
    check-cast v0, Ll/hf70;

    .line 173
    .line 174
    invoke-virtual {v0, v1}, Ll/hf70;->K0(Z)V

    .line 175
    .line 176
    .line 177
    goto/16 :goto_0

    .line 178
    .line 179
    :cond_6
    const-string v0, "from_discover_dating"

    .line 180
    .line 181
    iget-object v2, p0, Ll/je70;->d:Ljava/lang/String;

    .line 182
    .line 183
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 184
    .line 185
    .line 186
    move-result v0

    .line 187
    if-eqz v0, :cond_7

    .line 188
    .line 189
    new-instance v0, Ll/ibj;

    .line 190
    .line 191
    iget-object v2, p0, Ll/je70;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 192
    .line 193
    invoke-direct {v0, v2}, Ll/ibj;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;)V

    .line 194
    .line 195
    .line 196
    iput-object v0, p0, Ll/je70;->j:Ll/n570;

    .line 197
    .line 198
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 199
    .line 200
    check-cast v0, Ll/hf70;

    .line 201
    .line 202
    invoke-virtual {v0, v1}, Ll/hf70;->K0(Z)V

    .line 203
    .line 204
    .line 205
    goto :goto_0

    .line 206
    :cond_7
    const-string v0, "from_discover_discussion"

    .line 207
    .line 208
    iget-object v2, p0, Ll/je70;->d:Ljava/lang/String;

    .line 209
    .line 210
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 211
    .line 212
    .line 213
    move-result v0

    .line 214
    if-eqz v0, :cond_8

    .line 215
    .line 216
    new-instance v0, Ll/t0h;

    .line 217
    .line 218
    iget-object v2, p0, Ll/je70;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 219
    .line 220
    invoke-direct {v0, v2}, Ll/t0h;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;)V

    .line 221
    .line 222
    .line 223
    iput-object v0, p0, Ll/je70;->j:Ll/n570;

    .line 224
    .line 225
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 226
    .line 227
    check-cast v0, Ll/hf70;

    .line 228
    .line 229
    invoke-virtual {v0, v1}, Ll/hf70;->K0(Z)V

    .line 230
    .line 231
    .line 232
    goto :goto_0

    .line 233
    :cond_8
    const-string v0, "from_activity_tab_one"

    .line 234
    .line 235
    iget-object v2, p0, Ll/je70;->d:Ljava/lang/String;

    .line 236
    .line 237
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 238
    .line 239
    .line 240
    move-result v0

    .line 241
    if-eqz v0, :cond_9

    .line 242
    .line 243
    new-instance v0, Ll/t50;

    .line 244
    .line 245
    iget-object v2, p0, Ll/je70;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 246
    .line 247
    invoke-direct {v0, v2}, Ll/t50;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;)V

    .line 248
    .line 249
    .line 250
    iput-object v0, p0, Ll/je70;->j:Ll/n570;

    .line 251
    .line 252
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 253
    .line 254
    check-cast v0, Ll/hf70;

    .line 255
    .line 256
    invoke-virtual {v0, v1}, Ll/hf70;->K0(Z)V

    .line 257
    .line 258
    .line 259
    goto :goto_0

    .line 260
    :cond_9
    const-string v0, "from_activity_tab_two"

    .line 261
    .line 262
    iget-object v2, p0, Ll/je70;->d:Ljava/lang/String;

    .line 263
    .line 264
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 265
    .line 266
    .line 267
    move-result v0

    .line 268
    if-eqz v0, :cond_a

    .line 269
    .line 270
    new-instance v0, Ll/o60;

    .line 271
    .line 272
    iget-object v2, p0, Ll/je70;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 273
    .line 274
    invoke-direct {v0, v2}, Ll/o60;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;)V

    .line 275
    .line 276
    .line 277
    iput-object v0, p0, Ll/je70;->j:Ll/n570;

    .line 278
    .line 279
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 280
    .line 281
    check-cast v0, Ll/hf70;

    .line 282
    .line 283
    invoke-virtual {v0, v1}, Ll/hf70;->K0(Z)V

    .line 284
    .line 285
    .line 286
    goto :goto_0

    .line 287
    :cond_a
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 288
    .line 289
    check-cast v0, Ll/hf70;

    .line 290
    .line 291
    invoke-virtual {v0, v1}, Ll/hf70;->K0(Z)V

    .line 292
    .line 293
    .line 294
    :goto_0
    iget-object p0, p0, Ll/je70;->j:Ll/n570;

    .line 295
    .line 296
    return-object p0
.end method

.method public z0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/je70;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "from"

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Ll/je70;->d:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v0, p0, Ll/je70;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "user_id"

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Ll/je70;->c:Ljava/lang/String;

    .line 28
    .line 29
    iget-object v0, p0, Ll/je70;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 30
    .line 31
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v1, "selected_item_position"

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    iput v0, p0, Ll/je70;->e:I

    .line 42
    .line 43
    iget-object v0, p0, Ll/je70;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 44
    .line 45
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    const-string v1, "target_moment_id"

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iput-object v0, p0, Ll/je70;->f:Ljava/lang/String;

    .line 56
    .line 57
    iget-object v0, p0, Ll/je70;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 58
    .line 59
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    const-string v1, "page_type"

    .line 64
    .line 65
    const/4 v2, -0x1

    .line 66
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    iput v0, p0, Ll/je70;->g:I

    .line 71
    .line 72
    iget-object v0, p0, Ll/je70;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 73
    .line 74
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    const-string v1, "is_auto_refresh"

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    iput-boolean v0, p0, Ll/je70;->h:Z

    .line 85
    .line 86
    return-void
.end method
