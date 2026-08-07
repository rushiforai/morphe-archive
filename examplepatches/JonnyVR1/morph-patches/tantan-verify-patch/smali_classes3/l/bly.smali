.class public Ll/bly;
.super Ll/djy;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/rwn0;",
        "VM:",
        "Ll/cly;",
        ">",
        "Ll/djy<",
        "TD;TVM;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;Ll/cly;)V
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
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic X3(Ll/bly;Ll/p7o0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bly;->e4(Ll/p7o0;)V

    return-void
.end method

.method public static synthetic Y3(Ll/bly;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInvite;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/bly;->h4(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInvite;)V

    return-void
.end method

.method public static synthetic Z3(Ll/p7o0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/p7o0;->a:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 4
    .line 5
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public static synthetic a4(Ll/bly;Ll/hrk0$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bly;->f4(Ll/hrk0$a;)V

    return-void
.end method

.method public static synthetic b4(Ll/bly;Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerUpdate;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bly;->g4(Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerUpdate;)V

    return-void
.end method

.method private i4()V
    .locals 1

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
    invoke-virtual {v0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Ll/rwn0;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Ll/rwn0;->N1(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method


# virtual methods
.method public O3()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/y8s;->O3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public P3()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/y8s;->P3()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/bly;->init()V

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
    check-cast p0, Ll/cly;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/cly;->b()Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/4 v1, 0x0

    .line 12
    const-string v2, "\u5728\u7ebf"

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
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public U3()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/djy;->U3()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Ll/rwn0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Ll/rwn0;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Ll/rwn0;->D3(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public V3()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/bly;->i4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final c4(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInvite;)V
    .locals 1

    .line 1
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->tf:I

    .line 2
    .line 3
    invoke-static {v0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 11
    .line 12
    check-cast p0, Ll/cly;

    .line 13
    .line 14
    invoke-virtual {p0, p1, p2}, Ll/cly;->d(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInvite;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public d4(Ljava/lang/String;)V
    .locals 4

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
    invoke-static {v0, v1, v2, v3}, Ll/eky;->b(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Ll/rwn0;

    .line 43
    .line 44
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/api/VCallApiProvider;->callInvite(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {p0, v0}, Ll/y8s;->N3(Lrx/c;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v1, Ll/aly;

    .line 57
    .line 58
    invoke-direct {v1, p0, p1}, Ll/aly;-><init>(Ll/bly;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    new-instance p0, Ll/wnt;

    .line 62
    .line 63
    invoke-direct {p0}, Ll/wnt;-><init>()V

    .line 64
    .line 65
    .line 66
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public final synthetic e4(Ll/p7o0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/cly;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/cly;->c(Ll/p7o0;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic f4(Ll/hrk0$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/bly;->V3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic g4(Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerUpdate;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/bly;->V3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic h4(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInvite;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/bly;->c4(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInvite;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public init()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/cly;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/cly;->init()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Ll/rwn0;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/rwn0;->S3()Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, v0}, Ll/y8s;->N3(Lrx/c;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/wky;

    .line 23
    .line 24
    invoke-direct {v1}, Ll/wky;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/xky;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/xky;-><init>(Ll/bly;)V

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
    check-cast v0, Ll/rwn0;

    .line 48
    .line 49
    invoke-virtual {v0}, Ll/rwn0;->Q2()Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {p0, v0}, Ll/y8s;->N3(Lrx/c;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    new-instance v1, Ll/o0n0;

    .line 58
    .line 59
    invoke-direct {v1}, Ll/o0n0;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    new-instance v1, Ll/yky;

    .line 67
    .line 68
    invoke-direct {v1, p0}, Ll/yky;-><init>(Ll/bly;)V

    .line 69
    .line 70
    .line 71
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 76
    .line 77
    .line 78
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    check-cast v0, Ll/rwn0;

    .line 83
    .line 84
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    iget-object v0, v0, Ll/aj1;->c0:Lrx/subjects/b;

    .line 89
    .line 90
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    new-instance v1, Ll/zky;

    .line 95
    .line 96
    invoke-direct {v1, p0}, Ll/zky;-><init>(Ll/bly;)V

    .line 97
    .line 98
    .line 99
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 104
    .line 105
    .line 106
    invoke-direct {p0}, Ll/bly;->i4()V

    .line 107
    .line 108
    .line 109
    return-void
.end method
