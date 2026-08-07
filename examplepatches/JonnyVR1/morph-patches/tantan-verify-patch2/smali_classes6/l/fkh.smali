.class public Ll/fkh;
.super Ll/n570;
.source "SourceFile"


# instance fields
.field public d:Ll/jv00;

.field public e:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/n570;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/fkh;->e:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic C(Ll/fkh;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fkh;->O(Ll/pf60;)V

    return-void
.end method

.method public static synthetic D(Ll/fkh;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fkh;->Q(Ll/pf60;)V

    return-void
.end method

.method public static synthetic E(Ll/fkh;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fkh;->P(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic F(Ll/fkh;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fkh;->R(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic G(Ll/fkh;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fkh;->M(Ll/pf60;)V

    return-void
.end method

.method public static synthetic H(Ll/fkh;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/fkh;->L(Lcom/p1/mobile/putong/feed/data/Moment;)V

    return-void
.end method

.method public static synthetic I(Ll/fkh;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fkh;->N(Ll/pf60;)V

    return-void
.end method

.method private synthetic L(Lcom/p1/mobile/putong/feed/data/Moment;)V
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


# virtual methods
.method public A()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/n570;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 4
    .line 5
    iget-object v2, p0, Ll/fkh;->d:Ll/jv00;

    .line 6
    .line 7
    const-string v3, "latest"

    .line 8
    .line 9
    iget-object v4, p0, Ll/fkh;->e:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v1, v2, v3, v4}, Ll/jka;->k8(Ll/jv00;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

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
    new-instance v1, Ll/bkh;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/bkh;-><init>(Ll/fkh;)V

    .line 22
    .line 23
    .line 24
    new-instance v2, Ll/ckh;

    .line 25
    .line 26
    invoke-direct {v2, p0}, Ll/ckh;-><init>(Ll/fkh;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

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

.method public J()V
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
    new-instance v1, Ll/akh;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/akh;-><init>(Ll/fkh;)V

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

.method public K()V
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
    new-instance v1, Ll/ekh;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/ekh;-><init>(Ll/fkh;)V

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

.method public final synthetic M(Ll/pf60;)V
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

.method public final synthetic N(Ll/pf60;)V
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
    const/4 v0, 0x0

    .line 18
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->Y4(Ljava/lang/String;Z)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public final synthetic O(Ll/pf60;)V
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

.method public final synthetic P(Ljava/lang/Throwable;)V
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

.method public final synthetic Q(Ll/pf60;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n570;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->d5(Ll/pf60;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic R(Ljava/lang/Throwable;)V
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

.method public S()V
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
    new-instance v1, Ll/dkh;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/dkh;-><init>(Ll/fkh;)V

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
    .locals 0

    .line 1
    invoke-super {p0}, Ll/n570;->o()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/fkh;->J()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/fkh;->K()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/fkh;->S()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public z()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/n570;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 4
    .line 5
    iget-object v2, p0, Ll/fkh;->d:Ll/jv00;

    .line 6
    .line 7
    iget-object v3, p0, Ll/fkh;->e:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->Q4()Lcom/p1/mobile/putong/data/Links;

    .line 10
    .line 11
    .line 12
    move-result-object v4

    .line 13
    const-string v5, "latest"

    .line 14
    .line 15
    invoke-virtual {v1, v2, v5, v3, v4}, Ll/jka;->j8(Ll/jv00;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Links;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Ll/yjh;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/yjh;-><init>(Ll/fkh;)V

    .line 26
    .line 27
    .line 28
    new-instance v2, Ll/zjh;

    .line 29
    .line 30
    invoke-direct {v2, p0}, Ll/zjh;-><init>(Ll/fkh;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    return-void
.end method
