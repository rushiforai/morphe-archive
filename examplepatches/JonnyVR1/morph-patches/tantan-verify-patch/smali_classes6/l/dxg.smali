.class public Ll/dxg;
.super Ll/y9h;
.source "SourceFile"


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/y9h;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/dxg;->B(Lcom/p1/mobile/android/app/Act;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic u(Ljava/lang/String;)Ll/x1d0;
    .locals 1

    .line 1
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public static synthetic v(Lcom/p1/mobile/putong/data/Envelope;)Ll/pf60;
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ll/jka;->sd(Lcom/p1/mobile/putong/data/Envelope;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Envelope;->counters:Lcom/p1/mobile/putong/data/Counter;

    .line 7
    .line 8
    invoke-static {v0}, Ll/mrb0;->R(Lcom/p1/mobile/putong/data/Counter;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Ll/pf60;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Envelope;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 14
    .line 15
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Pagination;->links:Lcom/p1/mobile/putong/data/Links;

    .line 16
    .line 17
    const-class v2, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 18
    .line 19
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->activities:Ljava/util/List;

    .line 26
    .line 27
    invoke-direct {v0, v1, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    return-object v0
.end method

.method public static synthetic w(Ll/dxg;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dxg;->y(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic x(Ljava/lang/String;)Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/ti20;

    .line 2
    .line 3
    new-instance v1, Ll/bxg;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/bxg;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget p0, Ll/xi5;->MESSAGE_IN_MOMENTS:I

    .line 9
    .line 10
    invoke-direct {v0, v1, p0}, Ll/ti20;-><init>(Ll/pcj;I)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Ll/xi5;->w()Lrx/c$d;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {v0, p0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    new-instance v0, Ll/cxg;

    .line 22
    .line 23
    invoke-direct {v0}, Ll/cxg;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method


# virtual methods
.method public A()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/Links;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentActivity;",
            ">;>;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "limit=20"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/y9h;->m()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Ll/nog;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "photo/album/comments/poll"

    .line 24
    .line 25
    invoke-virtual {p0, v0, v1}, Ll/dxg;->z(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public B(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object v0, v0, Ll/jka;->R0:Lrx/subjects/b;

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    new-instance v0, Ll/zwg;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/zwg;-><init>(Ll/dxg;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public k()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/Links;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentActivity;",
            ">;>;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/dxg;->A()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic y(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/a7;->b()Ll/l6c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, Ll/y9h;->b:Ljava/util/List;

    .line 6
    .line 7
    iget-object p0, p0, Ll/y9h;->c:Lcom/p1/mobile/putong/data/Links;

    .line 8
    .line 9
    invoke-interface {p1, v0, p0}, Ll/l6c;->z0(Ljava/lang/Object;Lcom/p1/mobile/putong/data/Links;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public z(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/Links;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentActivity;",
            ">;>;>;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    new-instance v0, Ll/axg;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/axg;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    invoke-virtual {p0, p2, p1, v0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method
