.class public Ll/kwn;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/mwn;",
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
    iput-object p1, p0, Ll/kwn;->d:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic e0(Ll/kwn;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Lcom/p1/mobile/putong/live/base/data/BLiveSummary;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kwn;->m0(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Lcom/p1/mobile/putong/live/base/data/BLiveSummary;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic f0(Ll/kwn;Lcom/p1/mobile/putong/live/base/data/BLiveSummary;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kwn;->n0(Lcom/p1/mobile/putong/live/base/data/BLiveSummary;)V

    return-void
.end method

.method public static synthetic g0(Ll/kwn;Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kwn;->p0(Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)V

    return-void
.end method

.method public static synthetic h0(Ll/kwn;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/kwn;->k0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic i0(Ll/kwn;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kwn;->o0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic j0(Ll/kwn;Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kwn;->q0(Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)V

    return-void
.end method

.method private k0(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/mwn;

    .line 4
    .line 5
    iget-object v0, p0, Ll/kwn;->d:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    iget-object v1, p0, Ll/kwn;->c:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p1, v0, v1}, Ll/mwn;->j(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Ll/kwn;->a:Lcom/p1/mobile/putong/live/base/data/BLive;

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
    new-instance v0, Ll/fwn;

    .line 25
    .line 26
    invoke-direct {v0, p0}, Ll/fwn;-><init>(Ll/kwn;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    new-instance v0, Ll/gwn;

    .line 34
    .line 35
    invoke-direct {v0, p0}, Ll/gwn;-><init>(Ll/kwn;)V

    .line 36
    .line 37
    .line 38
    new-instance v1, Ll/hwn;

    .line 39
    .line 40
    invoke-direct {v1, p0}, Ll/hwn;-><init>(Ll/kwn;)V

    .line 41
    .line 42
    .line 43
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 48
    .line 49
    .line 50
    sget-object p1, Ll/htd0;->d:Ll/htd0;

    .line 51
    .line 52
    invoke-static {p1}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    check-cast p1, Ll/urv;

    .line 57
    .line 58
    invoke-virtual {p1}, Ll/urv;->b()Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {p1, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    new-instance v0, Ll/iwn;

    .line 75
    .line 76
    invoke-direct {v0, p0}, Ll/iwn;-><init>(Ll/kwn;)V

    .line 77
    .line 78
    .line 79
    invoke-static {v0}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 84
    .line 85
    .line 86
    iget-object p1, p0, Ll/kwn;->a:Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 87
    .line 88
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 89
    .line 90
    if-eqz p1, :cond_0

    .line 91
    .line 92
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 93
    .line 94
    invoke-virtual {p0, p1}, Ll/kwn;->r0(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    :cond_0
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 1

    .line 1
    new-instance v0, Ll/ewn;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ewn;-><init>(Ll/kwn;)V

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

.method public l0()Ll/l4g0;
    .locals 4

    .line 1
    new-instance v0, Ll/l4g0;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/live/livingroom/other/liveend/IntlLiveEndAct;

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
    new-instance v1, Lorg/json/JSONObject;

    .line 15
    .line 16
    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 17
    .line 18
    .line 19
    :try_start_0
    const-string v2, "liveId"

    .line 20
    .line 21
    iget-object v3, p0, Ll/kwn;->a:Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 22
    .line 23
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 26
    .line 27
    .line 28
    const-string v2, "anchorId"

    .line 29
    .line 30
    iget-object p0, p0, Ll/kwn;->b:Lcom/p1/mobile/putong/data/User;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {v1, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :catch_0
    move-exception p0

    .line 39
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 40
    .line 41
    .line 42
    :goto_0
    invoke-virtual {v0, v1}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 43
    .line 44
    .line 45
    return-object v0
.end method

.method public final synthetic m0(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Lcom/p1/mobile/putong/live/base/data/BLiveSummary;
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
    iget-object p0, p0, Ll/kwn;->a:Lcom/p1/mobile/putong/live/base/data/BLive;

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

.method public final synthetic n0(Lcom/p1/mobile/putong/live/base/data/BLiveSummary;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/mwn;

    .line 4
    .line 5
    iget-object p0, p0, Ll/kwn;->b:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    invoke-virtual {v0, p0, p1}, Ll/mwn;->i(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/live/base/data/BLiveSummary;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic o0(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveSummary;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, Ll/kwn;->a:Lcom/p1/mobile/putong/live/base/data/BLive;

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
    check-cast v0, Ll/mwn;

    .line 14
    .line 15
    iget-object p0, p0, Ll/kwn;->b:Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    invoke-virtual {v0, p0, p1}, Ll/mwn;->i(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/live/base/data/BLiveSummary;)V

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

.method public final synthetic p0(Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/mwn;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/mwn;->f(Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic q0(Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/mwn;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/mwn;->f(Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public r0(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->R5(Ljava/lang/String;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    new-instance v0, Ll/jwn;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/jwn;-><init>(Ll/kwn;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

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

.method public s0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/live/base/data/BLive;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/kwn;->b:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iput-object p2, p0, Ll/kwn;->a:Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 4
    .line 5
    iput-object p3, p0, Ll/kwn;->c:Ljava/lang/String;

    .line 6
    .line 7
    return-void
.end method
