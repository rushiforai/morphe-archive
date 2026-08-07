.class public Ll/x7g;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/cm0;

.field public b:Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;

.field public c:Ljava/lang/String;

.field public d:Ll/oo2;


# direct methods
.method public constructor <init>(Ll/oo2;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/x7g;->a:Ll/cm0;

    .line 6
    .line 7
    iput-object v0, p0, Ll/x7g;->b:Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;

    .line 8
    .line 9
    iput-object v0, p0, Ll/x7g;->c:Ljava/lang/String;

    .line 10
    .line 11
    iput-object p1, p0, Ll/x7g;->d:Ll/oo2;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic a(Ll/x7g;Ljava/lang/String;Ll/cm0;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/x7g;->L(Ljava/lang/String;Ll/cm0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b(Ll/x7g;Ljava/lang/String;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/x7g;->O(Ljava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c(Ll/x7g;Ljava/lang/String;Ll/cm0;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/x7g;->K(Ljava/lang/String;Ll/cm0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic d(Ll/x7g;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/x7g;->P()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic e(Ljava/lang/String;Ll/cm0;)Lrx/c;
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->o4(Ljava/lang/String;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ll/n7g;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Ll/n7g;-><init>(Ll/cm0;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ll/v5g;
    .locals 2

    .line 1
    new-instance v0, Ll/v5g;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbases:Ljava/util/List;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseRelations:Ljava/util/List;

    .line 8
    .line 9
    invoke-direct {v0, v1, p0}, Ll/v5g;-><init>(Ljava/util/List;Ljava/util/List;)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method public static synthetic g(Ljava/lang/Throwable;)Ll/cm0;
    .locals 0

    .line 1
    invoke-static {}, Ll/cm0;->a()Ll/cm0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic h(Ll/x7g;Ljava/lang/String;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/x7g;->F(Ljava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic i(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic j(Ll/x7g;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/x7g;->I()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic k(Ll/x7g;Ll/v5g;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/x7g;->J(Ll/v5g;)V

    return-void
.end method

.method public static synthetic l(Ll/cm0;Lcom/p1/mobile/putong/live/base/data/BFansBaseRecall;)Ll/yhg;
    .locals 1

    .line 1
    new-instance v0, Ll/yhg;

    .line 2
    .line 3
    invoke-direct {v0, p1, p0}, Ll/yhg;-><init>(Lcom/p1/mobile/putong/live/base/data/BFansBaseRecall;Ll/cm0;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static synthetic m(Ll/cm0;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ll/mag;
    .locals 1

    .line 1
    new-instance v0, Ll/mag;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/mag;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Ll/mag;->e(Ll/cm0;)V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method

.method public static synthetic n(Ll/x7g;Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/x7g;->G(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic o(Ll/x7g;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/x7g;->E(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic p(Ll/x7g;Ljava/lang/String;Ll/cm0;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/x7g;->Q(Ljava/lang/String;Ll/cm0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic q(Ll/x7g;Ll/v5g;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/x7g;->M(Ll/v5g;)V

    return-void
.end method

.method public static synthetic r(Ll/x7g;Ljava/lang/String;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/x7g;->R(Ljava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic s(Ll/pcj;Ll/v5g;)Lrx/c;
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/pcj;->call()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lrx/c;

    .line 6
    .line 7
    return-object p0
.end method

.method public static synthetic t(Ll/cm0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic u(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic v(Ll/x7g;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;Ll/cm0;)Ll/v9g;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/x7g;->N(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;Ll/cm0;)Ll/v9g;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic w(Ll/x7g;Ll/cm0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/x7g;->H(Ll/cm0;)V

    return-void
.end method


# virtual methods
.method public A()Ll/cm0;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/x7g;->a:Ll/cm0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/cm0;->b()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Ll/x7g;->d:Ll/oo2;

    .line 12
    .line 13
    iget-boolean v0, v0, Ll/oo2;->D:Z

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/x7g;->X()V

    .line 18
    .line 19
    .line 20
    :cond_1
    iget-object p0, p0, Ll/x7g;->a:Ll/cm0;

    .line 21
    .line 22
    return-object p0
.end method

.method public final B()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/v5g;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/x7g;->c:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->t4(Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/a7g;

    .line 8
    .line 9
    invoke-direct {v1}, Ll/a7g;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ll/b7g;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/b7g;-><init>(Ll/x7g;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public C(Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/mag;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/x7g;->z()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/g7g;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Ll/g7g;-><init>(Ll/x7g;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public D(ZLl/ner;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p3, p0, Ll/x7g;->c:Ljava/lang/String;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Ll/x7g;->d:Ll/oo2;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/oo2;->r0()Ll/v5g;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Ll/v5g;->b()Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Ll/x7g;->b:Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;

    .line 16
    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/x7g;->X()V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-virtual {p0}, Ll/x7g;->B()Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-interface {p2, p1}, Ll/ner;->duringCreated(Lrx/c;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    new-instance p2, Ll/v7g;

    .line 32
    .line 33
    invoke-direct {p2, p0}, Ll/v7g;-><init>(Ll/x7g;)V

    .line 34
    .line 35
    .line 36
    new-instance p0, Ll/w7g;

    .line 37
    .line 38
    invoke-direct {p0}, Ll/w7g;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-static {p2, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final synthetic E(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/x7g;->d:Ll/oo2;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/oo2;->r0()Ll/v5g;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 8
    .line 9
    iget-object v0, v0, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 10
    .line 11
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ll/v5g;->c(Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 20
    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseMedals:Ljava/util/List;

    .line 22
    .line 23
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const/4 p0, 0x0

    .line 34
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method

.method public final synthetic F(Ljava/lang/String;)Lrx/c;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/x7g;->b:Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->z4(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    new-instance v0, Ll/l7g;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/l7g;-><init>(Ll/x7g;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public final synthetic G(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x7g;->b:Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->M7(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final synthetic H(Ll/cm0;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/cm0;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object p1, p0, Ll/x7g;->a:Ll/cm0;

    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public final synthetic I()Lrx/c;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/x7g;->b:Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->N4(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/r7g;

    .line 10
    .line 11
    invoke-direct {v1}, Ll/r7g;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/s7g;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/s7g;-><init>(Ll/x7g;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    new-instance v0, Ll/t7g;

    .line 28
    .line 29
    invoke-direct {v0}, Ll/t7g;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, v0}, Lrx/c;->onErrorReturn(Ll/qcj;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method

.method public final synthetic J(Ll/v5g;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/v5g;->b()Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Ll/x7g;->b:Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;

    .line 6
    .line 7
    return-void
.end method

.method public final synthetic K(Ljava/lang/String;Ll/cm0;)Lrx/c;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x7g;->b:Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->e5(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance p1, Ll/o7g;

    .line 10
    .line 11
    invoke-direct {p1, p2}, Ll/o7g;-><init>(Ll/cm0;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public final synthetic L(Ljava/lang/String;Ll/cm0;)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/i7g;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/i7g;-><init>(Ll/x7g;Ljava/lang/String;Ll/cm0;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/x7g;->W(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final synthetic M(Ll/v5g;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/x7g;->X()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic N(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;Ll/cm0;)Ll/v9g;
    .locals 2

    .line 1
    new-instance v0, Ll/v9g;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/v9g;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/a8g;

    .line 7
    .line 8
    iget-object p0, p0, Ll/x7g;->b:Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;->id:Ljava/lang/String;

    .line 11
    .line 12
    invoke-direct {v1, p1, p0}, Ll/a8g;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ll/v9g;->d(Ll/a8g;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p2}, Ll/v9g;->c(Ll/cm0;)V

    .line 19
    .line 20
    .line 21
    return-object v0
.end method

.method public final synthetic O(Ljava/lang/String;)Lrx/c;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/x7g;->b:Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->J4(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0}, Ll/x7g;->z()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/c7g;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/c7g;-><init>(Ll/x7g;)V

    .line 16
    .line 17
    .line 18
    invoke-static {p1, v0, v1}, Lrx/c;->zip(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public final synthetic P()Lrx/c;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/x7g;->b:Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;->id:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p0, p0, Ll/x7g;->d:Ll/oo2;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/oo2;->A0()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->M4(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance v0, Ll/e7g;

    .line 16
    .line 17
    invoke-direct {v0}, Ll/e7g;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public final synthetic Q(Ljava/lang/String;Ll/cm0;)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/k7g;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2}, Ll/k7g;-><init>(Ljava/lang/String;Ll/cm0;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/x7g;->W(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final synthetic R(Ljava/lang/String;)Lrx/c;
    .locals 2

    .line 1
    invoke-static {}, Ll/eb20;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseNotifyParams;

    .line 17
    .line 18
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseNotifyParams;-><init>()V

    .line 19
    .line 20
    .line 21
    const-string v1, "fanbase_medal_expire"

    .line 22
    .line 23
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseNotifyParams;->type:Ljava/lang/String;

    .line 24
    .line 25
    iget-object p0, p0, Ll/x7g;->b:Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;->id:Ljava/lang/String;

    .line 28
    .line 29
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseNotifyParams;->fanbaseId:Ljava/lang/String;

    .line 30
    .line 31
    iput-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseNotifyParams;->userId:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseNotifyParams;->toJson()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->u6(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0
.end method

.method public S()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/v9g;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/u7g;

    .line 10
    .line 11
    invoke-direct {v1, p0, v0}, Ll/u7g;-><init>(Ll/x7g;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v1}, Ll/x7g;->W(Ll/pcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public T()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/aeg;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/z6g;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/z6g;-><init>(Ll/x7g;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/x7g;->W(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public U()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/yhg;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Ll/x7g;->z()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    new-instance v2, Ll/f7g;

    .line 14
    .line 15
    invoke-direct {v2, p0, v0}, Ll/f7g;-><init>(Ll/x7g;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, v2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public V(Ljava/lang/String;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/d7g;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/d7g;-><init>(Ll/x7g;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/x7g;->W(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final W(Ll/pcj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/pcj<",
            "Lrx/c<",
            "TT;>;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/x7g;->b:Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {p1}, Ll/pcj;->call()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lrx/c;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-virtual {p0}, Ll/x7g;->B()Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    new-instance v0, Ll/q7g;

    .line 17
    .line 18
    invoke-direct {v0, p1}, Ll/q7g;-><init>(Ll/pcj;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public final X()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/x7g;->z()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ll/j7g;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/j7g;-><init>()V

    .line 8
    .line 9
    .line 10
    new-instance v1, Ll/p7g;

    .line 11
    .line 12
    invoke-direct {v1}, Ll/p7g;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public Y()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/x7g;->b:Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;

    .line 3
    .line 4
    iput-object v0, p0, Ll/x7g;->c:Ljava/lang/String;

    .line 5
    .line 6
    iput-object v0, p0, Ll/x7g;->a:Ll/cm0;

    .line 7
    .line 8
    return-void
.end method

.method public x(Ljava/lang/String;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/h7g;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/h7g;-><init>(Ll/x7g;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/x7g;->W(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public y(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/m7g;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/m7g;-><init>(Ll/x7g;Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/x7g;->W(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public z()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/cm0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/x7g;->a:Ll/cm0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/cm0;->b()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/x7g;->a:Ll/cm0;

    .line 12
    .line 13
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    iget-object v0, p0, Ll/x7g;->c:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_2

    .line 25
    .line 26
    const-string v0, "null"

    .line 27
    .line 28
    iget-object v1, p0, Ll/x7g;->c:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    new-instance v0, Ll/y6g;

    .line 38
    .line 39
    invoke-direct {v0, p0}, Ll/y6g;-><init>(Ll/x7g;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0, v0}, Ll/x7g;->W(Ll/pcj;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0

    .line 47
    :cond_2
    :goto_0
    invoke-static {}, Ll/cm0;->a()Ll/cm0;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    return-object p0
.end method
