.class public Ll/aas;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/das;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/base/data/BLive;

.field public b:Lcom/p1/mobile/putong/data/User;

.field public c:Ljava/lang/String;

.field public d:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/aas;->d:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic e0(Ll/aas;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/aas;->m0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic f0(Ll/aas;Lcom/p1/mobile/putong/live/base/data/BLiveSummary;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/aas;->l0(Lcom/p1/mobile/putong/live/base/data/BLiveSummary;)V

    return-void
.end method

.method public static synthetic g0(Ll/aas;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Lcom/p1/mobile/putong/live/base/data/BLiveSummary;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/aas;->k0(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Lcom/p1/mobile/putong/live/base/data/BLiveSummary;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic h0(Ll/aas;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/aas;->i0(Landroid/os/Bundle;)V

    return-void
.end method

.method private i0(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/das;

    .line 4
    .line 5
    iget-object v0, p0, Ll/aas;->d:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    iget-object v1, p0, Ll/aas;->c:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p1, v0, v1}, Ll/das;->e(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Ll/aas;->a:Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 13
    .line 14
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->p5(Ljava/lang/String;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    new-instance v0, Ll/x9s;

    .line 25
    .line 26
    invoke-direct {v0, p0}, Ll/x9s;-><init>(Ll/aas;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    new-instance v0, Ll/y9s;

    .line 34
    .line 35
    invoke-direct {v0, p0}, Ll/y9s;-><init>(Ll/aas;)V

    .line 36
    .line 37
    .line 38
    new-instance v1, Ll/z9s;

    .line 39
    .line 40
    invoke-direct {v1, p0}, Ll/z9s;-><init>(Ll/aas;)V

    .line 41
    .line 42
    .line 43
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method private synthetic k0(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Lcom/p1/mobile/putong/live/base/data/BLiveSummary;
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveSummaries:Ljava/util/List;

    .line 4
    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveSummary;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object p0, p0, Ll/aas;->a:Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 16
    .line 17
    iget-wide v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->rewardPoint:D

    .line 18
    .line 19
    iput-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->rewardPoint:D

    .line 20
    .line 21
    return-object p1

    .line 22
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveSummaries:Ljava/util/List;

    .line 25
    .line 26
    const/4 p1, 0x0

    .line 27
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;

    .line 32
    .line 33
    return-object p0
.end method

.method private synthetic l0(Lcom/p1/mobile/putong/live/base/data/BLiveSummary;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/das;

    .line 4
    .line 5
    iget-object p0, p0, Ll/aas;->b:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    invoke-virtual {v0, p0, p1}, Ll/das;->d(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/live/base/data/BLiveSummary;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic m0(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveSummary;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, Ll/aas;->a:Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 6
    .line 7
    iget-wide v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->rewardPoint:D

    .line 8
    .line 9
    iput-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->rewardPoint:D

    .line 10
    .line 11
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast v0, Ll/das;

    .line 14
    .line 15
    iget-object p0, p0, Ll/aas;->b:Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    invoke-virtual {v0, p0, p1}, Ll/das;->d(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/live/base/data/BLiveSummary;)V

    .line 18
    .line 19
    .line 20
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->H9:I

    .line 21
    .line 22
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 23
    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 1

    .line 1
    new-instance v0, Ll/w9s;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/w9s;-><init>(Ll/aas;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public j0()Ll/l4g0;
    .locals 3

    .line 1
    new-instance v0, Ll/l4g0;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndAct;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "p_anchor_live_end"

    .line 10
    .line 11
    invoke-direct {v0, v2, v1}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Ll/aas;->a:Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 15
    .line 16
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 17
    .line 18
    const-string v2, "liveId"

    .line 19
    .line 20
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iget-object p0, p0, Ll/aas;->b:Lcom/p1/mobile/putong/data/User;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 27
    .line 28
    const-string v2, "anchorId"

    .line 29
    .line 30
    invoke-static {v2, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    filled-new-array {v1, p0}, [Ll/pf60;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {v0, p0}, Ll/l4g0;->p([Ll/pf60;)V

    .line 39
    .line 40
    .line 41
    return-object v0
.end method

.method public n0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/live/base/data/BLive;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/aas;->b:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iput-object p2, p0, Ll/aas;->a:Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 4
    .line 5
    iput-object p3, p0, Ll/aas;->c:Ljava/lang/String;

    .line 6
    .line 7
    return-void
.end method
