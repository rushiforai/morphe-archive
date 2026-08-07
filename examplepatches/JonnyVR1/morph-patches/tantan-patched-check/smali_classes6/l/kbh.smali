.class public Ll/kbh;
.super Ll/n570;
.source "SourceFile"


# static fields
.field public static g:Z

.field public static h:Z

.field public static i:Z


# instance fields
.field public d:Ll/jv00;

.field public e:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

.field public f:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->R4()Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0, v0}, Ll/n570;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;)V

    .line 6
    .line 7
    .line 8
    iput-object p1, p0, Ll/kbh;->e:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 9
    .line 10
    new-instance p1, Ll/qn00;

    .line 11
    .line 12
    const/16 v0, 0x9

    .line 13
    .line 14
    invoke-direct {p1, v0}, Ll/qn00;-><init>(I)V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Ll/n570;->b:Ll/qn00;

    .line 18
    .line 19
    new-instance p1, Ll/kbh$a;

    .line 20
    .line 21
    invoke-direct {p1, p0}, Ll/kbh$a;-><init>(Ll/kbh;)V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Ll/kbh;->d:Ll/jv00;

    .line 25
    .line 26
    return-void
.end method

.method public static synthetic C(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic D(Ll/kbh;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kbh;->X(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic E(Ll/kbh;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kbh;->T(Ll/pf60;)V

    return-void
.end method

.method public static synthetic F(Ll/kbh;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kbh;->R(Ll/pf60;)V

    return-void
.end method

.method public static synthetic G(Ll/kbh;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kbh;->U(Ll/pf60;)V

    return-void
.end method

.method public static synthetic H(Ll/kbh;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kbh;->Q(Lcom/p1/mobile/putong/feed/data/Moment;)V

    return-void
.end method

.method public static synthetic I(Ll/kbh;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/kbh;->P(Lcom/p1/mobile/putong/feed/data/Moment;)V

    return-void
.end method

.method public static synthetic J(Ll/kbh;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kbh;->S(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic K(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic L(Ll/kbh;JLl/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/kbh;->W(JLl/pf60;)V

    return-void
.end method

.method public static synthetic M(Ll/kbh;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kbh;->V(Ll/uxj0;)V

    return-void
.end method

.method private synthetic P(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n570;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->M4(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public A()V
    .locals 5

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-object v2, p0, Ll/n570;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 6
    .line 7
    sget-object v3, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 8
    .line 9
    iget-object v4, p0, Ll/kbh;->d:Ll/jv00;

    .line 10
    .line 11
    invoke-virtual {v3, v4}, Ll/jka;->Kb(Ll/jv00;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    new-instance v3, Ll/zah;

    .line 20
    .line 21
    invoke-direct {v3, p0, v0, v1}, Ll/zah;-><init>(Ll/kbh;J)V

    .line 22
    .line 23
    .line 24
    new-instance v0, Ll/bbh;

    .line 25
    .line 26
    invoke-direct {v0, p0}, Ll/bbh;-><init>(Ll/kbh;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v3, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 37
    .line 38
    const-string v0, "like"

    .line 39
    .line 40
    invoke-virtual {p0, v0}, Ll/jka;->mc(Ljava/lang/String;)Lrx/c;

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public N()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/n570;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 4
    .line 5
    iget-object v1, v1, Ll/jka;->n0:Lrx/subjects/b;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/jbh;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/jbh;-><init>(Ll/kbh;)V

    .line 22
    .line 23
    .line 24
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public O()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/n570;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 4
    .line 5
    iget-object v1, v1, Ll/jka;->p0:Lrx/subjects/b;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/ibh;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/ibh;-><init>(Ll/kbh;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic Q(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n570;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->P4(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic R(Ll/pf60;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/n570;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->B3(Ll/pf60;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic S(Ljava/util/List;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kbh;->e:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 2
    .line 3
    const-string p1, "p_like"

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->k5(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic T(Ll/pf60;)V
    .locals 1

    .line 1
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/n570;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 12
    .line 13
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast p1, Ljava/lang/String;

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->Y4(Ljava/lang/String;Z)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public final synthetic U(Ll/pf60;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n570;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->c5(Ll/pf60;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic V(Ll/uxj0;)V
    .locals 1

    .line 1
    iget-boolean p1, p0, Ll/kbh;->f:Z

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->pq()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eq p1, v0, :cond_0

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-interface {p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->pq()Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    iput-boolean p1, p0, Ll/kbh;->f:Z

    .line 22
    .line 23
    iget-object p0, p0, Ll/n570;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->a5()V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public final synthetic W(JLl/pf60;)V
    .locals 2

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sub-long/2addr v0, p1

    .line 6
    const-string p1, "like"

    .line 7
    .line 8
    invoke-static {p1, v0, v1}, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil;->b0(Ljava/lang/String;J)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/n570;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 12
    .line 13
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->d5(Ll/pf60;)V

    .line 14
    .line 15
    .line 16
    sget-boolean p0, Ll/kbh;->i:Z

    .line 17
    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/jka;->oc()Lrx/c;

    .line 23
    .line 24
    .line 25
    const/4 p0, 0x0

    .line 26
    sput-boolean p0, Ll/kbh;->i:Z

    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public final synthetic X(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n570;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->Z4()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public Y()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/n570;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 4
    .line 5
    iget-object v1, v1, Ll/jka;->P0:Lrx/subjects/b;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/hbh;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/hbh;-><init>(Ll/kbh;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public Z()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/n570;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-interface {v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->wb()Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/abh;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/abh;-><init>(Ll/kbh;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public n(Lcom/p1/mobile/putong/data/Links;)Z
    .locals 1

    .line 1
    invoke-static {}, Ll/cch;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    invoke-super {p0, p1}, Ll/n570;->n(Lcom/p1/mobile/putong/data/Links;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public o()V
    .locals 4

    .line 1
    invoke-super {p0}, Ll/n570;->o()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/kbh;->N()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/kbh;->O()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/kbh;->Y()V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Ll/cmg;->I()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->pq()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    iput-boolean v0, p0, Ll/kbh;->f:Z

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/kbh;->Z()V

    .line 30
    .line 31
    .line 32
    :cond_0
    iget-object v0, p0, Ll/n570;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 33
    .line 34
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 35
    .line 36
    iget-object v1, v1, Ll/jka;->S0:Lrx/subjects/b;

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    new-instance v1, Ll/cbh;

    .line 43
    .line 44
    invoke-direct {v1, p0}, Ll/cbh;-><init>(Ll/kbh;)V

    .line 45
    .line 46
    .line 47
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Ll/n570;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 55
    .line 56
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 57
    .line 58
    const-string v2, "p_like"

    .line 59
    .line 60
    const-string v3, ""

    .line 61
    .line 62
    invoke-virtual {v1, v2, v3}, Ll/jka;->d7(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    new-instance v1, Ll/dbh;

    .line 71
    .line 72
    invoke-direct {v1, p0}, Ll/dbh;-><init>(Ll/kbh;)V

    .line 73
    .line 74
    .line 75
    new-instance p0, Ll/ebh;

    .line 76
    .line 77
    invoke-direct {p0}, Ll/ebh;-><init>()V

    .line 78
    .line 79
    .line 80
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public z()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/n570;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->Q4()Lcom/p1/mobile/putong/data/Links;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    iget-object v3, p0, Ll/kbh;->d:Ll/jv00;

    .line 10
    .line 11
    invoke-virtual {v1, v2, v3}, Ll/jka;->Jb(Lcom/p1/mobile/putong/data/Links;Ll/jv00;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/fbh;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/fbh;-><init>(Ll/kbh;)V

    .line 22
    .line 23
    .line 24
    new-instance p0, Ll/gbh;

    .line 25
    .line 26
    invoke-direct {p0}, Ll/gbh;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

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
