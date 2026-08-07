.class public Ll/hny;
.super Ll/djy;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/rwn0;",
        "VM:",
        "Ll/any;",
        ">",
        "Ll/djy<",
        "TD;TVM;>;"
    }
.end annotation


# instance fields
.field public j:Z


# direct methods
.method public constructor <init>(Ll/dum;Ll/any;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TD;>;TVM;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/djy;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ll/hny;->j:Z

    .line 6
    .line 7
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic X3(Ll/hny;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hny;->h4(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic Y3(Ll/hny;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hny;->g4(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic Z3(Ll/hny;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSettle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hny;->f4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSettle;)V

    return-void
.end method

.method public static synthetic a4(Ll/hny;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSettle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hny;->c4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSettle;)V

    return-void
.end method

.method public static synthetic b4(Ll/hny;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSettle;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLivePush;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/hny;->e4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSettle;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLivePush;)V

    return-void
.end method

.method private synthetic f4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSettle;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSettle;->userId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/djy;->W3(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic h4(Ljava/util/List;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/any;

    .line 4
    .line 5
    iget-object v0, v0, Ll/any;->a:Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/settlein/MemberSettleInPageView;

    .line 6
    .line 7
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/membermanager/settlein/MemberSettleInPageView;->l0(Z)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 15
    .line 16
    check-cast p0, Ll/any;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ll/any;->e(Ljava/util/List;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private i4()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/vp20;->o()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->V5(Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/fny;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/fny;-><init>(Ll/hny;)V

    .line 22
    .line 23
    .line 24
    new-instance p0, Ll/z2e0;

    .line 25
    .line 26
    invoke-direct {p0}, Ll/z2e0;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

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


# virtual methods
.method public P3()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/y8s;->P3()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/hny;->init()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public S3()Ll/sjy;
    .locals 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance v0, Ll/sjy;

    .line 2
    .line 3
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 4
    .line 5
    check-cast p0, Ll/any;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/any;->c()Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/4 v1, 0x1

    .line 12
    const-string v2, "\u5df2\u5165\u9a7b"

    .line 13
    .line 14
    invoke-direct {v0, v2, p0, v1}, Ll/sjy;-><init>(Ljava/lang/String;Landroid/view/View;I)V

    .line 15
    .line 16
    .line 17
    return-object v0
.end method

.method public T3()I
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public V3()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/hny;->i4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final c4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSettle;)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/rwn0;->p()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Ll/rwn0;

    .line 16
    .line 17
    invoke-virtual {v1}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    check-cast v2, Ll/rwn0;

    .line 28
    .line 29
    invoke-virtual {v2}, Ll/vp20;->k()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    const-string v3, "management_host"

    .line 34
    .line 35
    const-string v4, "p_audio_management_panel"

    .line 36
    .line 37
    invoke-static {v4, v0, v1, v2, v3}, Ll/eky;->e(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 41
    .line 42
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSettle;->userId:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    check-cast v2, Ll/rwn0;

    .line 53
    .line 54
    invoke-virtual {v2}, Ll/vp20;->k()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-static {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->P3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    new-instance v1, Ll/gny;

    .line 67
    .line 68
    invoke-direct {v1, p0, p1}, Ll/gny;-><init>(Ll/hny;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSettle;)V

    .line 69
    .line 70
    .line 71
    new-instance p0, Ll/z2e0;

    .line 72
    .line 73
    invoke-direct {p0}, Ll/z2e0;-><init>()V

    .line 74
    .line 75
    .line 76
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public d4()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/hny;->j:Z

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic e4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSettle;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLivePush;)V
    .locals 1

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLivePush;->message:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-boolean p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLivePush;->sendPush:Z

    .line 7
    .line 8
    if-eqz p2, :cond_0

    .line 9
    .line 10
    const/4 p2, 0x1

    .line 11
    iput-boolean p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSettle;->isSelected:Z

    .line 12
    .line 13
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 14
    .line 15
    check-cast p0, Ll/any;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ll/any;->f(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSettle;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public final synthetic g4(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/hny;->i4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public init()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/any;

    .line 4
    .line 5
    new-instance v1, Ll/cny;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/cny;-><init>(Ll/hny;)V

    .line 8
    .line 9
    .line 10
    new-instance v2, Ll/dny;

    .line 11
    .line 12
    invoke-direct {v2, p0}, Ll/dny;-><init>(Ll/hny;)V

    .line 13
    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    invoke-virtual {v0, p0, v1, v2, v3}, Ll/any;->d(Ll/hny;Ll/y20;Ll/y20;Ll/y20;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->MemberManagerEvent:Lcom/tantan/live/eventbus/LiveEventBus$MemberManagerEvent;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$MemberManagerEvent;->refreshListData()Ll/v3f$d;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Lrx/c;

    .line 34
    .line 35
    invoke-virtual {p0, v0}, Ll/y8s;->N3(Lrx/c;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    new-instance v1, Ll/eny;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ll/eny;-><init>(Ll/hny;)V

    .line 42
    .line 43
    .line 44
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 49
    .line 50
    .line 51
    invoke-direct {p0}, Ll/hny;->i4()V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public j4(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/hny;->j:Z

    .line 2
    .line 3
    return-void
.end method
