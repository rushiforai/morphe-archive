.class public Ll/ibj;
.super Ll/n570;
.source "SourceFile"


# instance fields
.field public d:Ll/jv00;

.field public e:Ll/jv00;

.field public f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/RawFeed;",
            ">;"
        }
    .end annotation
.end field

.field public g:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;)V
    .locals 2

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
    iput-object p1, p0, Ll/ibj;->g:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 9
    .line 10
    new-instance v0, Ll/qn00;

    .line 11
    .line 12
    const/16 v1, 0xa

    .line 13
    .line 14
    invoke-direct {v0, v1}, Ll/qn00;-><init>(I)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/n570;->b:Ll/qn00;

    .line 18
    .line 19
    new-instance v0, Ll/ibj$a;

    .line 20
    .line 21
    invoke-direct {v0, p0}, Ll/ibj$a;-><init>(Ll/ibj;)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Ll/ibj;->d:Ll/jv00;

    .line 25
    .line 26
    new-instance v0, Ll/ibj$b;

    .line 27
    .line 28
    invoke-direct {v0, p0}, Ll/ibj$b;-><init>(Ll/ibj;)V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Ll/ibj;->e:Ll/jv00;

    .line 32
    .line 33
    invoke-static {}, Ll/cmg;->J()Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-eqz p0, :cond_0

    .line 38
    .line 39
    new-instance p0, Ll/mbj;

    .line 40
    .line 41
    invoke-direct {p0, p1}, Ll/mbj;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Ll/mbj;->d()V

    .line 45
    .line 46
    .line 47
    :cond_0
    return-void
.end method

.method public static synthetic C(Ll/ibj;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ibj;->n0(Ll/pf60;)V

    return-void
.end method

.method public static synthetic D(Ll/ibj;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ibj;->m0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic E(Ll/ibj;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ibj;->r0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic F(Ll/ibj;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ibj;->k0(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic G(Ll/ibj;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ibj;->e0(Lcom/p1/mobile/putong/feed/data/Moment;)V

    return-void
.end method

.method public static synthetic H(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic I(Ll/ibj;JLl/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/ibj;->l0(JLl/pf60;)V

    return-void
.end method

.method public static synthetic J(Ll/ibj;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ibj;->g0(Ll/pf60;)V

    return-void
.end method

.method public static synthetic K(Ll/ibj;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ibj;->q0(Ll/bkj0;)V

    return-void
.end method

.method public static synthetic L(Ll/ibj;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ibj;->c0(Ll/bkj0;)V

    return-void
.end method

.method public static synthetic M(Ll/ibj;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ibj;->f0(Lcom/p1/mobile/putong/feed/data/Moment;)V

    return-void
.end method

.method public static synthetic N(Ll/ibj;JILjava/util/List;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/ibj;->i0(JILjava/util/List;Ll/pf60;)V

    return-void
.end method

.method public static synthetic O(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic P(Ll/ibj;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ibj;->d0(Lcom/p1/mobile/putong/feed/data/Moment;)V

    return-void
.end method

.method public static synthetic Q(Ll/ibj;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ibj;->j0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic R(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic S(Ll/ibj;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ibj;->o0(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic T(Ll/ibj;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ibj;->p0(Ll/pf60;)V

    return-void
.end method

.method public static synthetic U(Ll/ibj;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ibj;->h0(Ll/pf60;)V

    return-void
.end method

.method public static synthetic V(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    xor-int/lit8 p0, p0, 0x1

    .line 16
    .line 17
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method private synthetic k0(Ljava/util/List;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ibj;->g:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 2
    .line 3
    const-string p1, "p_discover_dating"

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->k5(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic q0(Ll/bkj0;)V
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

.method private synthetic r0(Ljava/lang/Throwable;)V
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
    .locals 3

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iput-wide v0, p0, Ll/n570;->a:J

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ibj;->s0()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/n570;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 11
    .line 12
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 13
    .line 14
    const-string v2, "dating"

    .line 15
    .line 16
    invoke-virtual {v1, v2}, Ll/jka;->mc(Ljava/lang/String;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/oaj;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/oaj;-><init>(Ll/ibj;)V

    .line 27
    .line 28
    .line 29
    new-instance v2, Ll/zaj;

    .line 30
    .line 31
    invoke-direct {v2, p0}, Ll/zaj;-><init>(Ll/ibj;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
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
    new-instance v1, Ll/ebj;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/ebj;-><init>(Ll/ibj;)V

    .line 22
    .line 23
    .line 24
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/n570;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 32
    .line 33
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 34
    .line 35
    iget-object v1, v1, Ll/jka;->o0:Lrx/subjects/b;

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    new-instance v1, Ll/fbj;

    .line 50
    .line 51
    invoke-direct {v1, p0}, Ll/fbj;-><init>(Ll/ibj;)V

    .line 52
    .line 53
    .line 54
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public X()V
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
    new-instance v1, Ll/hbj;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/hbj;-><init>(Ll/ibj;)V

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

.method public final Y(ILjava/util/List;Ll/pf60;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/Links;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    if-lez p1, :cond_4

    .line 2
    .line 3
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_4

    .line 8
    .line 9
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p1, p0}, Ljava/lang/Math;->min(II)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    new-instance p1, Ljava/util/HashSet;

    .line 18
    .line 19
    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    .line 20
    .line 21
    .line 22
    const/4 v0, 0x3

    .line 23
    invoke-static {p0, v0}, Ljava/lang/Math;->min(II)I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    const/4 v2, 0x0

    .line 28
    move v3, v2

    .line 29
    :goto_0
    if-ge v3, v1, :cond_0

    .line 30
    .line 31
    invoke-interface {p2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    check-cast v4, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 36
    .line 37
    iget-object v4, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {p1, v4}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    add-int/lit8 v3, v3, 0x1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    iget-object v1, p3, Ll/pf60;->b:Ljava/lang/Object;

    .line 46
    .line 47
    check-cast v1, Ljava/util/List;

    .line 48
    .line 49
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    :cond_1
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    if-eqz v3, :cond_2

    .line 58
    .line 59
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    check-cast v3, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 64
    .line 65
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {p1, v3}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    if-eqz v3, :cond_1

    .line 72
    .line 73
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    .line 74
    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_2
    iget-object p1, p3, Ll/pf60;->b:Ljava/lang/Object;

    .line 78
    .line 79
    check-cast p1, Ljava/util/List;

    .line 80
    .line 81
    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    check-cast v1, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 86
    .line 87
    invoke-interface {p1, v2, v1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 88
    .line 89
    .line 90
    const/4 p1, 0x1

    .line 91
    if-le p0, p1, :cond_3

    .line 92
    .line 93
    new-instance v0, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 94
    .line 95
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/Moment;-><init>()V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/data/Moment;->nullCheck()V

    .line 99
    .line 100
    .line 101
    sget-object v1, Lcom/p1/mobile/android/app/App;->i:Ll/vxd0;

    .line 102
    .line 103
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    check-cast v1, Ljava/lang/Integer;

    .line 108
    .line 109
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    invoke-static {v1}, Lcom/tantanapp/common/data/DbObject;->GENERATE_UNIQUE_FAKE_ID(I)Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    iput-object v1, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 118
    .line 119
    new-instance v1, Lcom/p1/mobile/putong/feed/data/FeedSeeMoreFollowingMomentInfo;

    .line 120
    .line 121
    invoke-direct {v1}, Lcom/p1/mobile/putong/feed/data/FeedSeeMoreFollowingMomentInfo;-><init>()V

    .line 122
    .line 123
    .line 124
    iput p1, v1, Lcom/p1/mobile/putong/feed/data/FeedSeeMoreFollowingMomentInfo;->action:I

    .line 125
    .line 126
    iput-object p2, v1, Lcom/p1/mobile/putong/feed/data/FeedSeeMoreFollowingMomentInfo;->followingMoments:Ljava/util/List;

    .line 127
    .line 128
    iput p0, v1, Lcom/p1/mobile/putong/feed/data/FeedSeeMoreFollowingMomentInfo;->unReadfollowingFeeds:I

    .line 129
    .line 130
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/Moment;->mFeedSeeMoreFollowingMomentInfo:Lcom/p1/mobile/putong/feed/data/FeedSeeMoreFollowingMomentInfo;

    .line 131
    .line 132
    iget-object p0, p3, Ll/pf60;->b:Ljava/lang/Object;

    .line 133
    .line 134
    check-cast p0, Ljava/util/List;

    .line 135
    .line 136
    invoke-interface {p0, p1, v0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 137
    .line 138
    .line 139
    return-void

    .line 140
    :cond_3
    new-instance v1, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 141
    .line 142
    invoke-direct {v1}, Lcom/p1/mobile/putong/feed/data/Moment;-><init>()V

    .line 143
    .line 144
    .line 145
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/Moment;->nullCheck()V

    .line 146
    .line 147
    .line 148
    sget-object v2, Lcom/p1/mobile/android/app/App;->i:Ll/vxd0;

    .line 149
    .line 150
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    check-cast v2, Ljava/lang/Integer;

    .line 155
    .line 156
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 157
    .line 158
    .line 159
    move-result v2

    .line 160
    invoke-static {v2}, Lcom/tantanapp/common/data/DbObject;->GENERATE_UNIQUE_FAKE_ID(I)Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v2

    .line 164
    iput-object v2, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 165
    .line 166
    new-instance v2, Lcom/p1/mobile/putong/feed/data/FeedSeeMoreFollowingMomentInfo;

    .line 167
    .line 168
    invoke-direct {v2}, Lcom/p1/mobile/putong/feed/data/FeedSeeMoreFollowingMomentInfo;-><init>()V

    .line 169
    .line 170
    .line 171
    iput v0, v2, Lcom/p1/mobile/putong/feed/data/FeedSeeMoreFollowingMomentInfo;->action:I

    .line 172
    .line 173
    iput-object p2, v2, Lcom/p1/mobile/putong/feed/data/FeedSeeMoreFollowingMomentInfo;->followingMoments:Ljava/util/List;

    .line 174
    .line 175
    iput p0, v2, Lcom/p1/mobile/putong/feed/data/FeedSeeMoreFollowingMomentInfo;->unReadfollowingFeeds:I

    .line 176
    .line 177
    iput-object v2, v1, Lcom/p1/mobile/putong/feed/data/Moment;->mFeedSeeMoreFollowingMomentInfo:Lcom/p1/mobile/putong/feed/data/FeedSeeMoreFollowingMomentInfo;

    .line 178
    .line 179
    iget-object p0, p3, Ll/pf60;->b:Ljava/lang/Object;

    .line 180
    .line 181
    check-cast p0, Ljava/util/List;

    .line 182
    .line 183
    invoke-interface {p0, p1, v1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 184
    .line 185
    .line 186
    :cond_4
    return-void
.end method

.method public Z()V
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
    new-instance v1, Ll/qaj;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/qaj;-><init>(Ll/ibj;)V

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
    new-instance v1, Ll/raj;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/raj;-><init>(Ll/ibj;)V

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

.method public final a0(ILjava/util/List;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/pm80;->b()Ll/pm80;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Ll/pm80;->b:Ll/u8c;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/u8c;->f()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-static {}, Ll/pm80;->b()Ll/pm80;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v0, v0, Ll/pm80;->b:Ll/u8c;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/u8c;->l()Ljava/util/List;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    iget-object v0, p0, Ll/n570;->b:Ll/qn00;

    .line 30
    .line 31
    invoke-static {}, Ll/pm80;->b()Ll/pm80;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    iget-object v1, v1, Ll/pm80;->b:Ll/u8c;

    .line 36
    .line 37
    invoke-virtual {v1}, Ll/u8c;->l()Ljava/util/List;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v0, v1}, Ll/qn00;->i(Ljava/util/List;)V

    .line 42
    .line 43
    .line 44
    :cond_0
    invoke-static {}, Ll/pm80;->b()Ll/pm80;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iget-object v0, v0, Ll/pm80;->b:Ll/u8c;

    .line 49
    .line 50
    invoke-virtual {v0}, Ll/p7;->e()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    check-cast v0, Ll/pf60;

    .line 55
    .line 56
    invoke-virtual {p0, p1, p2, v0}, Ll/ibj;->Y(ILjava/util/List;Ll/pf60;)V

    .line 57
    .line 58
    .line 59
    invoke-static {}, Ll/pm80;->b()Ll/pm80;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    iget-object p1, p1, Ll/pm80;->b:Ll/u8c;

    .line 64
    .line 65
    invoke-virtual {p1}, Ll/p7;->e()Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    check-cast p1, Ll/pf60;

    .line 70
    .line 71
    invoke-virtual {p0, p1}, Ll/ibj;->v0(Ll/pf60;)V

    .line 72
    .line 73
    .line 74
    invoke-static {}, Ll/pm80;->b()Ll/pm80;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    iget-object p0, p0, Ll/pm80;->b:Ll/u8c;

    .line 79
    .line 80
    invoke-virtual {p0}, Ll/p7;->d()V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 85
    .line 86
    .line 87
    move-result-wide v2

    .line 88
    iget-object v0, p0, Ll/n570;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 89
    .line 90
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 91
    .line 92
    iget-object v4, p0, Ll/ibj;->d:Ll/jv00;

    .line 93
    .line 94
    invoke-virtual {v1, v4}, Ll/jka;->p7(Ll/jv00;)Lrx/c;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 99
    .line 100
    .line 101
    move-result-object v6

    .line 102
    new-instance v0, Ll/vaj;

    .line 103
    .line 104
    move-object v1, p0

    .line 105
    move v4, p1

    .line 106
    move-object v5, p2

    .line 107
    invoke-direct/range {v0 .. v5}, Ll/vaj;-><init>(Ll/ibj;JILjava/util/List;)V

    .line 108
    .line 109
    .line 110
    new-instance p0, Ll/waj;

    .line 111
    .line 112
    invoke-direct {p0, v1}, Ll/waj;-><init>(Ll/ibj;)V

    .line 113
    .line 114
    .line 115
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    invoke-virtual {v6, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 120
    .line 121
    .line 122
    return-void
.end method

.method public final b0(Ljava/util/List;)I
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;)I"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 10
    .line 11
    iget-object p0, p0, Ll/jka;->a1:Ll/mxd0;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Ljava/lang/Double;

    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 20
    .line 21
    .line 22
    move-result-wide v1

    .line 23
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_2

    .line 32
    .line 33
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    check-cast p1, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 38
    .line 39
    iget-wide v3, p1, Lcom/p1/mobile/putong/feed/data/Moment;->createdTime:D

    .line 40
    .line 41
    cmpl-double p1, v3, v1

    .line 42
    .line 43
    if-lez p1, :cond_1

    .line 44
    .line 45
    add-int/lit8 v0, v0, 0x1

    .line 46
    .line 47
    const/4 p1, 0x4

    .line 48
    if-lt v0, p1, :cond_1

    .line 49
    .line 50
    :cond_2
    return v0
.end method

.method public final synthetic c0(Ll/bkj0;)V
    .locals 2

    .line 1
    iget-object v0, p1, Ll/bkj0;->a:Ljava/lang/Object;

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
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Ll/ibj;->g:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 12
    .line 13
    iget-boolean v1, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->C:Z

    .line 14
    .line 15
    if-nez v1, :cond_1

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    sget-object v1, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 22
    .line 23
    if-ne v0, v1, :cond_1

    .line 24
    .line 25
    iget-object p0, p0, Ll/ibj;->g:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 26
    .line 27
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->D:Z

    .line 28
    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->z:Ll/hf70;

    .line 33
    .line 34
    iget-object v0, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 35
    .line 36
    check-cast v0, Ljava/util/List;

    .line 37
    .line 38
    const/4 v1, 0x0

    .line 39
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    check-cast v0, Lcom/p1/mobile/putong/feed/data/Group;

    .line 44
    .line 45
    iget-object p1, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 46
    .line 47
    check-cast p1, Ljava/util/List;

    .line 48
    .line 49
    invoke-virtual {p0, v0, p1}, Ll/hf70;->U0(Lcom/p1/mobile/putong/feed/data/Group;Ljava/util/List;)V

    .line 50
    .line 51
    .line 52
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic d0(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/n570;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->M4(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/GroupIdBox;->id:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 17
    .line 18
    iget-boolean v0, v0, Lcom/p1/mobile/putong/feed/data/GroupIdBox;->lastJoined:Z

    .line 19
    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    invoke-static {}, Ll/cmg;->N()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 29
    .line 30
    const-string v1, "fake_id_"

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-nez v0, :cond_0

    .line 37
    .line 38
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 39
    .line 40
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 41
    .line 42
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/GroupIdBox;->id:Ljava/lang/String;

    .line 43
    .line 44
    const/4 v1, 0x6

    .line 45
    const/4 v2, 0x0

    .line 46
    invoke-virtual {v0, p1, v1, v2}, Ll/jka;->D7(Ljava/lang/String;ILjava/lang/String;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    new-instance v0, Ll/xaj;

    .line 51
    .line 52
    invoke-direct {v0, p0}, Ll/xaj;-><init>(Ll/ibj;)V

    .line 53
    .line 54
    .line 55
    new-instance p0, Ll/yaj;

    .line 56
    .line 57
    invoke-direct {p0}, Ll/yaj;-><init>()V

    .line 58
    .line 59
    .line 60
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 65
    .line 66
    .line 67
    :cond_0
    return-void
.end method

.method public final synthetic e0(Lcom/p1/mobile/putong/feed/data/Moment;)V
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

.method public final synthetic f0(Lcom/p1/mobile/putong/feed/data/Moment;)V
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

.method public final synthetic g0(Ll/pf60;)V
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

.method public final synthetic h0(Ll/pf60;)V
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

.method public final synthetic i0(JILjava/util/List;Ll/pf60;)V
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
    const-string p1, "p_discover_dating"

    .line 7
    .line 8
    invoke-static {p1, v0, v1}, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil;->b0(Ljava/lang/String;J)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p3, p4, p5}, Ll/ibj;->Y(ILjava/util/List;Ll/pf60;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p5}, Ll/ibj;->v0(Ll/pf60;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic j0(Ljava/lang/Throwable;)V
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

.method public final synthetic l0(JLl/pf60;)V
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
    const-string p1, "follow"

    .line 7
    .line 8
    invoke-static {p1, v0, v1}, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil;->b0(Ljava/lang/String;J)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p3, Ll/pf60;->b:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast p1, Ljava/util/Collection;

    .line 14
    .line 15
    new-instance p2, Ll/uaj;

    .line 16
    .line 17
    invoke-direct {p2}, Ll/uaj;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-static {p1, p2}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p0, p1}, Ll/ibj;->b0(Ljava/util/List;)I

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    invoke-virtual {p0, p2, p1}, Ll/ibj;->a0(ILjava/util/List;)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p3, Ll/pf60;->b:Ljava/lang/Object;

    .line 32
    .line 33
    check-cast p0, Ljava/util/Collection;

    .line 34
    .line 35
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-nez p0, :cond_0

    .line 40
    .line 41
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 42
    .line 43
    iget-object p1, p3, Ll/pf60;->b:Ljava/lang/Object;

    .line 44
    .line 45
    check-cast p1, Ljava/util/List;

    .line 46
    .line 47
    const/4 p2, 0x0

    .line 48
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    check-cast p1, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 53
    .line 54
    iget-wide p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->createdTime:D

    .line 55
    .line 56
    invoke-virtual {p0, p1, p2}, Ll/jka;->dd(D)V

    .line 57
    .line 58
    .line 59
    :cond_0
    return-void
.end method

.method public final synthetic m0(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const/4 p1, 0x0

    .line 2
    const/4 v0, 0x0

    .line 3
    invoke-virtual {p0, p1, v0}, Ll/ibj;->a0(ILjava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic n0(Ll/pf60;)V
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

.method public o()V
    .locals 4

    .line 1
    invoke-super {p0}, Ll/n570;->o()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ibj;->W()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ibj;->X()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/ibj;->t0()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/ibj;->Z()V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Ll/cmg;->l0()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/ibj;->u0()V

    .line 23
    .line 24
    .line 25
    :cond_0
    iget-object v0, p0, Ll/n570;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 26
    .line 27
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 28
    .line 29
    const-string v2, "p_discover_dating"

    .line 30
    .line 31
    const-string v3, ""

    .line 32
    .line 33
    invoke-virtual {v1, v2, v3}, Ll/jka;->d7(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v1, Ll/cbj;

    .line 42
    .line 43
    invoke-direct {v1, p0}, Ll/cbj;-><init>(Ll/ibj;)V

    .line 44
    .line 45
    .line 46
    new-instance p0, Ll/dbj;

    .line 47
    .line 48
    invoke-direct {p0}, Ll/dbj;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public final synthetic o0(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ibj;->g:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->z:Ll/hf70;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/hf70;->V0(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic p0(Ll/pf60;)V
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

.method public final s0()V
    .locals 4

    .line 1
    invoke-static {}, Ll/mrb0;->k()Lcom/p1/mobile/putong/data/Counter;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Counter;->moments:Lcom/p1/mobile/putong/data/CouterMoments;

    .line 12
    .line 13
    iget v0, v0, Lcom/p1/mobile/putong/data/CouterMoments;->unreadFeeds:I

    .line 14
    .line 15
    if-lez v0, :cond_0

    .line 16
    .line 17
    invoke-static {}, Ll/cmg;->t()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 24
    .line 25
    .line 26
    move-result-wide v0

    .line 27
    sget-object v2, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 28
    .line 29
    iget-object v3, p0, Ll/ibj;->e:Ll/jv00;

    .line 30
    .line 31
    invoke-virtual {v2, v3}, Ll/jka;->k7(Ll/jv00;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    new-instance v3, Ll/saj;

    .line 36
    .line 37
    invoke-direct {v3, p0, v0, v1}, Ll/saj;-><init>(Ll/ibj;J)V

    .line 38
    .line 39
    .line 40
    new-instance v0, Ll/taj;

    .line 41
    .line 42
    invoke-direct {v0, p0}, Ll/taj;-><init>(Ll/ibj;)V

    .line 43
    .line 44
    .line 45
    invoke-static {v3, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {v2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_0
    const/4 v0, 0x0

    .line 54
    const/4 v1, 0x0

    .line 55
    invoke-virtual {p0, v0, v1}, Ll/ibj;->a0(ILjava/util/List;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public t0()V
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
    new-instance v1, Ll/paj;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/paj;-><init>(Ll/ibj;)V

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

.method public u0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/n570;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 4
    .line 5
    iget-object v1, v1, Ll/jka;->B1:Lrx/subjects/b;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/gbj;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/gbj;-><init>(Ll/ibj;)V

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

.method public final v0(Ll/pf60;)V
    .locals 0
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
    iget-object p0, p0, Ll/n570;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->d5(Ll/pf60;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public z()V
    .locals 4

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iput-wide v0, p0, Ll/n570;->a:J

    .line 6
    .line 7
    iget-object v0, p0, Ll/n570;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 8
    .line 9
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->Q4()Lcom/p1/mobile/putong/data/Links;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    iget-object v3, p0, Ll/ibj;->d:Ll/jv00;

    .line 16
    .line 17
    invoke-virtual {v1, v2, v3}, Ll/jka;->o7(Lcom/p1/mobile/putong/data/Links;Ll/jv00;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Ll/abj;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/abj;-><init>(Ll/ibj;)V

    .line 28
    .line 29
    .line 30
    new-instance p0, Ll/bbj;

    .line 31
    .line 32
    invoke-direct {p0}, Ll/bbj;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 40
    .line 41
    .line 42
    return-void
.end method
