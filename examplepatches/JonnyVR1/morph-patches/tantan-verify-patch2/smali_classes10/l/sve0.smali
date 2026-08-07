.class public Ll/sve0;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/rwn0;",
        "Ll/qe3;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/qrm0<",
            "*>;>;"
        }
    .end annotation
.end field

.field public j:Ll/vb3;


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "Ll/rwn0;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/sve0;->i:Ljava/util/List;

    .line 10
    .line 11
    new-instance p1, Ll/qe3;

    .line 12
    .line 13
    invoke-direct {p1}, Ll/qe3;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static synthetic J3(Ll/sve0;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/sve0;->S3(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic K3(Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;->SETTING:Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic L3(Ll/qrm0;Lcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;->id:I

    .line 2
    .line 3
    iget-object p0, p0, Ll/qrm0;->m:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 4
    .line 5
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->category:I

    .line 6
    .line 7
    if-ne p1, p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public static synthetic M3(Ll/sve0;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/sve0;->T3(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic N3(Ll/sve0;Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/sve0;->R3(Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;)V

    return-void
.end method

.method public static synthetic O3(Ll/ic3;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ic3;->I()Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->isGiftSwitch()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method private P3()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/qe3;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/qe3;->e()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic S3(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/sve0;->W3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic T3(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/sve0;->P3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private W3()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->onSettingDialogShow()Ll/v3f$c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/v3f$c;->p()V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 15
    .line 16
    check-cast p0, Ll/qe3;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/qe3;->l()V

    .line 19
    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public final synthetic R3(Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/sve0;->j:Ll/vb3;

    .line 2
    .line 3
    iget-object v0, p0, Ll/sve0;->i:Ljava/util/List;

    .line 4
    .line 5
    invoke-virtual {p0, p1, v0}, Ll/sve0;->V3(Ll/vb3;Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public T()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public U3()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->onSettingDialogDismiss()Ll/v3f$c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public V3(Ll/vb3;Ljava/util/List;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/vb3;",
            "Ljava/util/List<",
            "Ll/qrm0<",
            "*>;>;)V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Ll/sve0;->i:Ljava/util/List;

    .line 2
    .line 3
    iput-object p1, p0, Ll/sve0;->j:Ll/vb3;

    .line 4
    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    const/4 v1, 0x0

    .line 15
    move v2, v1

    .line 16
    move v3, v2

    .line 17
    :cond_0
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    if-eqz v4, :cond_3

    .line 22
    .line 23
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    check-cast v4, Ll/qrm0;

    .line 28
    .line 29
    iget-object v5, p1, Ll/vb3;->d:Ljava/util/List;

    .line 30
    .line 31
    new-instance v6, Ll/qve0;

    .line 32
    .line 33
    invoke-direct {v6, v4}, Ll/qve0;-><init>(Ll/qrm0;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v5, v6}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v5

    .line 40
    check-cast v5, Lcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;

    .line 41
    .line 42
    if-nez v5, :cond_1

    .line 43
    .line 44
    return-void

    .line 45
    :cond_1
    if-nez v3, :cond_2

    .line 46
    .line 47
    invoke-virtual {v4}, Ll/qrm0;->l1()Z

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    :cond_2
    invoke-virtual {v4}, Ll/qrm0;->E()I

    .line 52
    .line 53
    .line 54
    move-result v6

    .line 55
    add-int/2addr v2, v6

    .line 56
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 57
    .line 58
    .line 59
    move-result v6

    .line 60
    invoke-virtual {v4, v6, v5}, Ll/qrm0;->g4(ILcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;)Ll/ic3;

    .line 61
    .line 62
    .line 63
    move-result-object v4

    .line 64
    if-eqz v4, :cond_0

    .line 65
    .line 66
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_3
    new-instance p1, Ll/rve0;

    .line 71
    .line 72
    invoke-direct {p1}, Ll/rve0;-><init>()V

    .line 73
    .line 74
    .line 75
    invoke-static {v0, p1}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    sget-object p2, Ll/htd0;->e:Ll/htd0;

    .line 80
    .line 81
    invoke-static {p2}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object p2

    .line 85
    check-cast p2, Ll/ifv;

    .line 86
    .line 87
    iget-object p2, p2, Ll/ifv;->j:Ll/jxd0;

    .line 88
    .line 89
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-virtual {p2, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 97
    .line 98
    check-cast p1, Ll/qe3;

    .line 99
    .line 100
    invoke-virtual {p1, v0}, Ll/qe3;->k(Ljava/util/List;)V

    .line 101
    .line 102
    .line 103
    if-nez v2, :cond_5

    .line 104
    .line 105
    if-eqz v3, :cond_4

    .line 106
    .line 107
    const/4 v1, -0x1

    .line 108
    :cond_4
    move v2, v1

    .line 109
    :cond_5
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomZoneEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomZoneEvent;

    .line 114
    .line 115
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomZoneEvent;->setSettingButtonRedPoint()Ll/v3f$d;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 124
    .line 125
    .line 126
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
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomZoneEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomZoneEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomZoneEvent;->refreshButton()Ll/v3f$d;

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
    new-instance v1, Ll/mve0;

    .line 25
    .line 26
    invoke-direct {v1}, Ll/mve0;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/nve0;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/nve0;-><init>(Ll/sve0;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomZoneEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomZoneEvent;

    .line 50
    .line 51
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomZoneEvent;->showSettingDialog()Ll/v3f$c;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    check-cast v0, Lrx/c;

    .line 60
    .line 61
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    new-instance v1, Ll/ove0;

    .line 66
    .line 67
    invoke-direct {v1, p0}, Ll/ove0;-><init>(Ll/sve0;)V

    .line 68
    .line 69
    .line 70
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomZoneEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomZoneEvent;

    .line 82
    .line 83
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomZoneEvent;->hideSettingDialog()Ll/v3f$c;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    check-cast v0, Lrx/c;

    .line 92
    .line 93
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    new-instance v1, Ll/pve0;

    .line 98
    .line 99
    invoke-direct {v1, p0}, Ll/pve0;-><init>(Ll/sve0;)V

    .line 100
    .line 101
    .line 102
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 107
    .line 108
    .line 109
    return-void
.end method
