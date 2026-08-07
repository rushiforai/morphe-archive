.class public Ll/e11;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/oo2;",
        "Ll/y01;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Ll/wyd0;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SV_USE_DUP_ID"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/oo2;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/wyd0;

    .line 5
    .line 6
    const-string v0, "ARTICULATION_SELECT_LIVE_ID"

    .line 7
    .line 8
    const-string v1, ""

    .line 9
    .line 10
    invoke-direct {p1, v0, v1}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Ll/e11;->i:Ll/wyd0;

    .line 14
    .line 15
    new-instance p1, Ll/y01;

    .line 16
    .line 17
    invoke-direct {p1}, Ll/y01;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic J3(Ll/e11;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/e11;->O3(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic K3(Ll/e11;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/e11;->P3(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic L3(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public static synthetic M3(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    const-string p0, "\u6e05\u6670\u5ea6\u5207\u6362\u6210\u529f"

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic P3(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/e11;->S3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public N3()Landroid/view/ViewGroup;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->Q2()Landroid/view/ViewGroup;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic O3(Ljava/util/List;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/y01;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/y01;->n(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public R3(Lcom/p1/mobile/putong/live/base/data/BLiveClarity;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveClarity;->url:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveClarity;->selected:Z

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveClarity;->idx:I

    .line 22
    .line 23
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->y7(Ljava/lang/String;I)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/d11;

    .line 32
    .line 33
    invoke-direct {v1}, Ll/d11;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 52
    .line 53
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveClarity;->url:Ljava/lang/String;

    .line 54
    .line 55
    iput-object p1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->pullFlv:Ljava/lang/String;

    .line 56
    .line 57
    const/4 p1, 0x1

    .line 58
    iput-boolean p1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->useCurrentPullStream:Z

    .line 59
    .line 60
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-virtual {p1, v0}, Ll/vp20;->g(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Ll/e11;->i:Ll/wyd0;

    .line 68
    .line 69
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {p1, v0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 79
    .line 80
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->restartPlay()Ll/v3f$c;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-virtual {p1}, Ll/v3f$c;->p()V

    .line 85
    .line 86
    .line 87
    :cond_0
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 88
    .line 89
    check-cast p0, Ll/y01;

    .line 90
    .line 91
    invoke-virtual {p0}, Ll/y01;->f()V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public S3()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->x4(Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/b11;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/b11;-><init>(Ll/e11;)V

    .line 20
    .line 21
    .line 22
    new-instance p0, Ll/c11;

    .line 23
    .line 24
    invoke-direct {p0}, Ll/c11;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p0, Ll/y01;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/y01;->f()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->ArticulationSelectEvent:Lcom/tantan/live/eventbus/LiveEventBus$ArticulationSelectEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$ArticulationSelectEvent;->showArticulationSelectDialog()Ll/v3f$c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lrx/c;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/a11;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/a11;-><init>(Ll/e11;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

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
