.class public Ll/s36;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/oo2;",
        "Ll/f36;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/f36;

    .line 5
    .line 6
    invoke-direct {p1}, Ll/f36;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic J3(Ll/s36;Ll/nsv;)Ll/d3q;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/s36;->U3(Ll/nsv;)Ll/d3q;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic K3(Ll/s36;Ll/d36;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/s36;->T3(Ll/d36;)V

    return-void
.end method

.method public static synthetic L3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic M3(Ll/s36;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/s36;->W3(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic N3(Ll/s36;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ll/d36;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/s36;->S3(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ll/d36;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic O3(Ll/s36;Ll/qh80;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/s36;->V3(Ll/qh80;)V

    return-void
.end method

.method private P3()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/f36;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/f36;->d()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final R3(Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/oo2;->W0()Z

    .line 6
    .line 7
    .line 8
    move-result v5

    .line 9
    move-object v1, p1

    .line 10
    move-object v2, p2

    .line 11
    move v3, p3

    .line 12
    move v4, p4

    .line 13
    move-object v6, p5

    .line 14
    invoke-static/range {v1 .. v6}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->w5(Ljava/lang/String;Ljava/lang/String;IIZLjava/lang/String;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    new-instance p2, Ll/n36;

    .line 23
    .line 24
    invoke-direct {p2, p0}, Ll/n36;-><init>(Ll/s36;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1, p2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    new-instance p2, Ll/o36;

    .line 32
    .line 33
    invoke-direct {p2, p0}, Ll/o36;-><init>(Ll/s36;)V

    .line 34
    .line 35
    .line 36
    new-instance p0, Ll/p36;

    .line 37
    .line 38
    invoke-direct {p0}, Ll/p36;-><init>()V

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

.method public final synthetic S3(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ll/d36;
    .locals 1

    .line 1
    new-instance v0, Ll/d36$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/d36$a;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ll/d36$a;->d(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ll/d36$a;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Ll/oo2;->W0()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    invoke-virtual {p1, p0}, Ll/d36$a;->e(Z)Ll/d36$a;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Ll/d36$a;->c()Ll/d36;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public final synthetic T3(Ll/d36;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/s36;->Y3(Ll/d36;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic U3(Ll/nsv;)Ll/d3q;
    .locals 1

    .line 1
    new-instance v0, Ll/j36;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/j36;-><init>(Ll/nsv;)V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ll/r36;

    .line 7
    .line 8
    invoke-direct {p1, p0}, Ll/r36;-><init>(Ll/s36;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ll/j36;->P(Ll/y20;)Ll/j36;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic V3(Ll/qh80;)V
    .locals 2

    .line 1
    iget-object v0, p1, Ll/qh80;->b:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p1, Ll/qh80;->a:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p1, p1, Ll/qh80;->d:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0, v0, v1, p1}, Ll/s36;->Z3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic W3(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/s36;->P3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public X3(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/oo2;->A0()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "voice-live"

    .line 10
    .line 11
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {p0, v0, p1}, Ll/ydn0;->k(Ll/i6t;Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 32
    .line 33
    const/16 v1, 0x1132

    .line 34
    .line 35
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;-><init>(I)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->userId(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    const-string v2, "contribution"

    .line 43
    .line 44
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setSource(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-virtual {v2}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 57
    .line 58
    invoke-static {p0, v2, p1, v1}, Ll/csq;->a(Ll/i6t;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setFromIdentity(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    invoke-virtual {v2}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 75
    .line 76
    invoke-static {p0, v2, p1, v1}, Ll/csq;->d(Ll/i6t;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setTo(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    const-string v0, "call"

    .line 85
    .line 86
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setScene(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->build()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->OpenUserCardDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;

    .line 99
    .line 100
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;->show()Ll/v3f$d;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method public final Y3(Ll/d36;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/d36;->e()Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Ll/q36;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/q36;-><init>(Ll/s36;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p1, v0}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 15
    .line 16
    check-cast p0, Ll/f36;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ll/f36;->f(Ljava/util/ArrayList;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final Z3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    .line 1
    const/4 v3, 0x0

    .line 2
    const/16 v4, 0x14

    .line 3
    .line 4
    move-object v0, p0

    .line 5
    move-object v1, p1

    .line 6
    move-object v2, p2

    .line 7
    move-object v5, p3

    .line 8
    invoke-virtual/range {v0 .. v5}, Ll/s36;->R3(Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, v0, Ll/cyr;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast p0, Ll/f36;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/f36;->i()V

    .line 16
    .line 17
    .line 18
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
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->PlugPubEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlugPubEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$PlugPubEvent;->openContributeDialog()Ll/v3f$d;

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
    new-instance v1, Ll/l36;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/l36;-><init>(Ll/s36;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->PlugPubEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlugPubEvent;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$PlugPubEvent;->dismissContributeDialog()Ll/v3f$d;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lrx/c;

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v1, Ll/m36;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/m36;-><init>(Ll/s36;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 66
    .line 67
    .line 68
    return-void
.end method
