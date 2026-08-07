.class public Ll/dtb0;
.super Ll/n8i;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/n8i;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumFeedFrag;

    .line 5
    .line 6
    iput-object p1, p0, Ll/n8i;->c:Lcom/p1/mobile/putong/feed/newui/topic/FeedTopicAggregationBaseFrag;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic A0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method private D0(Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->Z:Ll/a4j;

    .line 2
    .line 3
    const-string v1, "p_user_passive_show_nearby"

    .line 4
    .line 5
    invoke-virtual {v0, p1, v1}, Ll/a4j;->Q(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/btb0;

    .line 10
    .line 11
    invoke-direct {v1, p0, p1}, Ll/btb0;-><init>(Ll/dtb0;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    new-instance p0, Ll/ctb0;

    .line 15
    .line 16
    invoke-direct {p0}, Ll/ctb0;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method private synthetic G0(Ll/pf60;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/mtb0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/mtb0;->t0(Ll/pf60;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic u0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic x0(Ll/dtb0;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/dtb0;->G0(Ll/pf60;)V

    return-void
.end method

.method public static synthetic y0(Ll/dtb0;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dtb0;->E0(Lcom/p1/mobile/putong/feed/data/Moment;)V

    return-void
.end method

.method public static synthetic z0(Ll/dtb0;Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/dtb0;->F0(Ljava/lang/String;Ljava/lang/Boolean;)V

    return-void
.end method


# virtual methods
.method public C0()V
    .locals 2

    .line 1
    invoke-static {}, Ll/cn40;->G()Lrx/c;

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
    new-instance v1, Ll/atb0;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/atb0;-><init>(Ll/dtb0;)V

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

.method public final synthetic E0(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    move-object v1, v0

    .line 4
    check-cast v1, Ll/mtb0;

    .line 5
    .line 6
    check-cast v0, Ll/x8i;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/x8i;->x()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v1, p1, v0}, Ll/mtb0;->s0(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 16
    .line 17
    invoke-direct {p0, p1}, Ll/dtb0;->D0(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic F0(Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0, p1}, Ll/k3h;->J0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public a0()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/n8i;->a0()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/cn40;->Y()Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Ll/ysb0;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Ll/ysb0;-><init>(Ll/dtb0;)V

    .line 15
    .line 16
    .line 17
    new-instance p0, Ll/zsb0;

    .line 18
    .line 19
    invoke-direct {p0}, Ll/zsb0;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public t0(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1}, Ll/n8i;->t0(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p1, Ll/mtb0;

    .line 7
    .line 8
    iget-object p0, p0, Ll/n8i;->e:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 9
    .line 10
    invoke-virtual {p1, p0}, Ll/mtb0;->u0(Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
