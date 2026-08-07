.class public Ll/o0j;
.super Ll/n570;
.source "SourceFile"


# instance fields
.field public d:Ll/jv00;

.field public e:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;


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
    iput-object p1, p0, Ll/o0j;->e:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 9
    .line 10
    new-instance p1, Ll/qn00;

    .line 11
    .line 12
    const/4 v0, 0x2

    .line 13
    invoke-direct {p1, v0}, Ll/qn00;-><init>(I)V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Ll/n570;->b:Ll/qn00;

    .line 17
    .line 18
    new-instance p1, Ll/o0j$a;

    .line 19
    .line 20
    invoke-direct {p1, p0}, Ll/o0j$a;-><init>(Ll/o0j;)V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Ll/o0j;->d:Ll/jv00;

    .line 24
    .line 25
    return-void
.end method

.method public static synthetic C(Ll/o0j;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/o0j;->Z(Lcom/p1/mobile/putong/feed/data/Moment;)V

    return-void
.end method

.method public static synthetic D(Ll/o0j;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/o0j;->g0(Ll/pf60;)V

    return-void
.end method

.method public static synthetic E(Ll/o0j;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/o0j;->c0(Ll/pf60;)V

    return-void
.end method

.method public static synthetic F(Ll/o0j;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/o0j;->j0(Ll/bkj0;)V

    return-void
.end method

.method public static synthetic G(Ll/o0j;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/o0j;->d0(Ll/pf60;)V

    return-void
.end method

.method public static synthetic H(Ll/o0j;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/o0j;->i0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic I(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic J(Ll/o0j;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/o0j;->a0(Lcom/p1/mobile/putong/feed/data/Moment;)V

    return-void
.end method

.method public static synthetic K(Ll/o0j;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/o0j;->f0(Ll/pf60;)V

    return-void
.end method

.method public static synthetic L(Ll/o0j;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/o0j;->Y(Lcom/p1/mobile/putong/feed/data/Moment;)V

    return-void
.end method

.method public static synthetic M(Ll/o0j;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/o0j;->e0(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic N(Ll/o0j;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/o0j;->k0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic O(Ll/o0j;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/o0j;->X(Lcom/p1/mobile/putong/feed/data/Moment;)V

    return-void
.end method

.method public static synthetic P(Ll/o0j;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/o0j;->b0(Lcom/p1/mobile/putong/feed/data/Moment;)V

    return-void
.end method

.method public static synthetic Q(Ll/o0j;JLl/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/o0j;->h0(JLl/pf60;)V

    return-void
.end method

.method public static synthetic R(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
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
    iget-object v4, p0, Ll/o0j;->d:Ll/jv00;

    .line 10
    .line 11
    invoke-virtual {v3, v4}, Ll/jka;->j7(Ll/jv00;)Lrx/c;

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
    new-instance v3, Ll/i0j;

    .line 20
    .line 21
    invoke-direct {v3, p0, v0, v1}, Ll/i0j;-><init>(Ll/o0j;J)V

    .line 22
    .line 23
    .line 24
    new-instance v0, Ll/j0j;

    .line 25
    .line 26
    invoke-direct {v0, p0}, Ll/j0j;-><init>(Ll/o0j;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v3, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v2, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    invoke-static {}, Ll/cmg;->N()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    const-string v1, "follow"

    .line 41
    .line 42
    if-eqz v0, :cond_0

    .line 43
    .line 44
    iget-object v0, p0, Ll/n570;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 45
    .line 46
    sget-object v2, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 47
    .line 48
    invoke-virtual {v2, v1}, Ll/jka;->mc(Ljava/lang/String;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v1, Ll/k0j;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/k0j;-><init>(Ll/o0j;)V

    .line 59
    .line 60
    .line 61
    new-instance v2, Ll/l0j;

    .line 62
    .line 63
    invoke-direct {v2, p0}, Ll/l0j;-><init>(Ll/o0j;)V

    .line 64
    .line 65
    .line 66
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 75
    .line 76
    invoke-virtual {p0, v1}, Ll/jka;->mc(Ljava/lang/String;)Lrx/c;

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public S()V
    .locals 5

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
    const-wide/16 v1, 0x1f4

    .line 12
    .line 13
    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 14
    .line 15
    invoke-virtual {v0, v1, v2, v3}, Lrx/c;->delay(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    invoke-virtual {v0, v4}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v4, Ll/n0j;

    .line 28
    .line 29
    invoke-direct {v4, p0}, Ll/n0j;-><init>(Ll/o0j;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v4}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    invoke-virtual {v0, v4}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/n570;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 40
    .line 41
    sget-object v4, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 42
    .line 43
    iget-object v4, v4, Ll/jka;->o0:Lrx/subjects/b;

    .line 44
    .line 45
    invoke-virtual {v0, v4}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0, v1, v2, v3}, Lrx/c;->delay(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    new-instance v1, Ll/zzi;

    .line 62
    .line 63
    invoke-direct {v1, p0}, Ll/zzi;-><init>(Ll/o0j;)V

    .line 64
    .line 65
    .line 66
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public T()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/n570;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 4
    .line 5
    iget-object v1, v1, Ll/jka;->q0:Lrx/subjects/b;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-wide/16 v1, 0x1f4

    .line 12
    .line 13
    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 14
    .line 15
    invoke-virtual {v0, v1, v2, v3}, Lrx/c;->delay(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/d0j;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/d0j;-><init>(Ll/o0j;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public U()V
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
    new-instance v1, Ll/e0j;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/e0j;-><init>(Ll/o0j;)V

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

.method public V()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/n570;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 4
    .line 5
    iget-object v1, v1, Ll/jka;->r0:Lrx/subjects/b;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/c0j;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/c0j;-><init>(Ll/o0j;)V

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

.method public W()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/n570;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 4
    .line 5
    iget-object v1, v1, Ll/jka;->Q0:Lrx/subjects/b;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/a0j;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/a0j;-><init>(Ll/o0j;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/n570;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 24
    .line 25
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 26
    .line 27
    iget-object v1, v1, Ll/jka;->S0:Lrx/subjects/b;

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/b0j;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/b0j;-><init>(Ll/o0j;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final synthetic X(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/n570;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->M4(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 7
    .line 8
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/GroupIdBox;->id:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-nez p1, :cond_0

    .line 15
    .line 16
    invoke-static {}, Ll/cmg;->N()Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/o0j;->A()V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public final synthetic Y(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/n570;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->M4(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 7
    .line 8
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/GroupIdBox;->id:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-nez p1, :cond_0

    .line 15
    .line 16
    invoke-static {}, Ll/cmg;->N()Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/o0j;->A()V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public final synthetic Z(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/n570;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->M4(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 7
    .line 8
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/GroupIdBox;->id:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-nez p1, :cond_0

    .line 15
    .line 16
    invoke-static {}, Ll/cmg;->N()Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/o0j;->A()V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public final synthetic a0(Lcom/p1/mobile/putong/feed/data/Moment;)V
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

.method public final synthetic b0(Lcom/p1/mobile/putong/feed/data/Moment;)V
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

.method public final synthetic c0(Ll/pf60;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/n570;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->B3(Ll/pf60;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic d0(Ll/pf60;)V
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

.method public final synthetic e0(Ljava/util/List;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o0j;->e:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 2
    .line 3
    const-string p1, "p_follow"

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->k5(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic f0(Ll/pf60;)V
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

.method public final synthetic g0(Ll/pf60;)V
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

.method public final synthetic h0(JLl/pf60;)V
    .locals 3

    .line 1
    iget-object v0, p3, Ll/pf60;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/util/Collection;

    .line 4
    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 12
    .line 13
    iget-object v1, p3, Ll/pf60;->b:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v1, Ljava/util/List;

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 23
    .line 24
    iget-wide v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->createdTime:D

    .line 25
    .line 26
    invoke-virtual {v0, v1, v2}, Ll/jka;->dd(D)V

    .line 27
    .line 28
    .line 29
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 30
    .line 31
    .line 32
    move-result-wide v0

    .line 33
    sub-long/2addr v0, p1

    .line 34
    const-string p1, "follow"

    .line 35
    .line 36
    invoke-static {p1, v0, v1}, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil;->b0(Ljava/lang/String;J)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Ll/n570;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 40
    .line 41
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->d5(Ll/pf60;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final synthetic i0(Ljava/lang/Throwable;)V
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

.method public final synthetic j0(Ll/bkj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n570;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->e5(Ll/bkj0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public k(Lcom/p1/mobile/putong/feed/data/Moment;)Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/Moment;->status()Lcom/p1/mobile/putong/data/LocalStatus;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "failed"

    .line 6
    .line 7
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 14
    .line 15
    const-string v1, "fake_id_"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 24
    .line 25
    iget-wide v1, p1, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 26
    .line 27
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/feed/api/b;->h3(J)Lrx/c;

    .line 28
    .line 29
    .line 30
    :cond_0
    invoke-super {p0, p1}, Ll/n570;->k(Lcom/p1/mobile/putong/feed/data/Moment;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0
.end method

.method public final synthetic k0(Ljava/lang/Throwable;)V
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

.method public l0()V
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
    new-instance v1, Ll/m0j;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/m0j;-><init>(Ll/o0j;)V

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

.method public o()V
    .locals 4

    .line 1
    invoke-super {p0}, Ll/n570;->o()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/o0j;->S()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/o0j;->U()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/o0j;->T()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/o0j;->V()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ll/o0j;->l0()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ll/o0j;->W()V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/n570;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 23
    .line 24
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 25
    .line 26
    const-string v2, "p_follow"

    .line 27
    .line 28
    const-string v3, ""

    .line 29
    .line 30
    invoke-virtual {v1, v2, v3}, Ll/jka;->d7(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    new-instance v1, Ll/yzi;

    .line 39
    .line 40
    invoke-direct {v1, p0}, Ll/yzi;-><init>(Ll/o0j;)V

    .line 41
    .line 42
    .line 43
    new-instance p0, Ll/f0j;

    .line 44
    .line 45
    invoke-direct {p0}, Ll/f0j;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 53
    .line 54
    .line 55
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
    iget-object v3, p0, Ll/o0j;->d:Ll/jv00;

    .line 10
    .line 11
    invoke-virtual {v1, v2, v3}, Ll/jka;->i7(Lcom/p1/mobile/putong/data/Links;Ll/jv00;)Lrx/c;

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
    new-instance v1, Ll/g0j;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/g0j;-><init>(Ll/o0j;)V

    .line 22
    .line 23
    .line 24
    new-instance p0, Ll/h0j;

    .line 25
    .line 26
    invoke-direct {p0}, Ll/h0j;-><init>()V

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
