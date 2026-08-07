.class public Ll/b8h;
.super Ll/n570;
.source "SourceFile"


# instance fields
.field public d:Ll/jv00;

.field public e:Ljava/lang/String;

.field public f:Lcom/p1/mobile/putong/feed/data/Moment;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/n570;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/b8h;->e:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic C(Ll/b8h;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/b8h;->P(Ll/pf60;)V

    return-void
.end method

.method public static synthetic D(Ll/b8h;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/b8h;->T(Ll/pf60;)V

    return-void
.end method

.method public static synthetic E(Ll/b8h;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/b8h;->U(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic F(Ll/b8h;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/b8h;->R(Ll/pf60;)V

    return-void
.end method

.method public static synthetic G(Ll/b8h;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/b8h;->S(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic H(Ll/b8h;Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/b8h;->O(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic I(Ll/b8h;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/b8h;->N(Lcom/p1/mobile/putong/feed/data/Moment;)V

    return-void
.end method

.method public static synthetic J(Ll/b8h;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/b8h;->Q(Ll/pf60;)V

    return-void
.end method

.method private synthetic P(Ll/pf60;)V
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

.method private synthetic R(Ll/pf60;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/b8h;->f:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/b8h;->L(Ll/pf60;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ll/n570;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->c5(Ll/pf60;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private synthetic S(Ljava/lang/Throwable;)V
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

.method private synthetic T(Ll/pf60;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/b8h;->f:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/b8h;->L(Ll/pf60;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast v0, Ljava/util/List;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    iget-object v2, p0, Ll/b8h;->f:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 18
    .line 19
    invoke-interface {v0, v1, v2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object p0, p0, Ll/n570;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->d5(Ll/pf60;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method private synthetic U(Ljava/lang/Throwable;)V
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
    iget-object v2, p0, Ll/b8h;->d:Ll/jv00;

    .line 6
    .line 7
    const-string v3, "recommend"

    .line 8
    .line 9
    iget-object v4, p0, Ll/b8h;->e:Ljava/lang/String;

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
    new-instance v1, Ll/y7h;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/y7h;-><init>(Ll/b8h;)V

    .line 22
    .line 23
    .line 24
    new-instance v2, Ll/z7h;

    .line 25
    .line 26
    invoke-direct {v2, p0}, Ll/z7h;-><init>(Ll/b8h;)V

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

.method public K()V
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
    new-instance v1, Ll/u7h;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/u7h;-><init>(Ll/b8h;)V

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

.method public L(Ll/pf60;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/Links;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/util/Collection;

    .line 4
    .line 5
    new-instance v1, Ll/a8h;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/a8h;-><init>(Ll/b8h;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v0, Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 19
    .line 20
    .line 21
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 22
    .line 23
    check-cast p1, Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {p1, p0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public M()V
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
    new-instance v1, Ll/v7h;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/v7h;-><init>(Ll/b8h;)V

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

.method public final synthetic N(Lcom/p1/mobile/putong/feed/data/Moment;)V
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

.method public final synthetic O(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Ll/b8h;->f:Lcom/p1/mobile/putong/feed/data/Moment;

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
    xor-int/lit8 p0, p0, 0x1

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic Q(Ll/pf60;)V
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

.method public V()V
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
    new-instance v1, Ll/t7h;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/t7h;-><init>(Ll/b8h;)V

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

.method public W(Ljava/lang/String;)V
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
    iput-object p1, p0, Ll/b8h;->f:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 8
    .line 9
    return-void
.end method

.method public o()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/n570;->o()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/b8h;->K()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/b8h;->M()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/b8h;->V()V

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
    iget-object v2, p0, Ll/b8h;->d:Ll/jv00;

    .line 6
    .line 7
    iget-object v3, p0, Ll/b8h;->e:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->Q4()Lcom/p1/mobile/putong/data/Links;

    .line 10
    .line 11
    .line 12
    move-result-object v4

    .line 13
    const-string v5, "recommend"

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
    new-instance v1, Ll/w7h;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/w7h;-><init>(Ll/b8h;)V

    .line 26
    .line 27
    .line 28
    new-instance v2, Ll/x7h;

    .line 29
    .line 30
    invoke-direct {v2, p0}, Ll/x7h;-><init>(Ll/b8h;)V

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
