.class public Ll/xct;
.super Ll/q4;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/q4<",
        "Ll/mu40;",
        "Lcom/p1/mobile/putong/live/base/data/BLive;",
        "Ll/fw40;",
        "Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;",
        ">;"
    }
.end annotation


# instance fields
.field public final i:Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveBaseFrag;

.field public final j:Ljava/lang/String;

.field public k:Ll/mu40;

.field public l:Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;

.field public m:Ll/kcg0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveBaseFrag;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V
    .locals 4

    .line 1
    new-instance v0, Ll/fw40;

    .line 2
    .line 3
    new-instance v1, Ll/mu40;

    .line 4
    .line 5
    new-instance v2, Ll/ew40;

    .line 6
    .line 7
    invoke-direct {v2}, Ll/ew40;-><init>()V

    .line 8
    .line 9
    .line 10
    new-instance v3, Ll/ajt;

    .line 11
    .line 12
    invoke-direct {v3, p2}, Ll/ajt;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-direct {v1, v2, v3}, Ll/mu40;-><init>(Ll/ew40;Ll/ajt;)V

    .line 16
    .line 17
    .line 18
    new-instance v2, Lcom/tantan/live/eventbus/LiveEventBus;

    .line 19
    .line 20
    invoke-direct {v2}, Lcom/tantan/live/eventbus/LiveEventBus;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-direct {v0, p1, v1, v2}, Ll/fw40;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveBaseFrag;Ll/mu40;Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 24
    .line 25
    .line 26
    invoke-direct {p0, v0}, Ll/q4;-><init>(Ll/dum;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongFrag;->H2()Landroid/view/LayoutInflater;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    sget v1, Ll/yec0;->j5:I

    .line 34
    .line 35
    const/4 v2, 0x0

    .line 36
    const/4 v3, 0x0

    .line 37
    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;

    .line 42
    .line 43
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 44
    .line 45
    invoke-virtual {v1, p0, v0}, Ll/dum;->a(Ll/njt;Landroid/view/ViewGroup;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, v0}, Ll/l6t;->C(Ll/iam;)V

    .line 49
    .line 50
    .line 51
    iput-object p1, p0, Ll/xct;->i:Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveBaseFrag;

    .line 52
    .line 53
    iget-object p1, p0, Ll/xzs;->e:Ll/dum;

    .line 54
    .line 55
    iget-object p1, p1, Ll/dum;->h:Ll/oo2;

    .line 56
    .line 57
    check-cast p1, Ll/mu40;

    .line 58
    .line 59
    iput-object p1, p0, Ll/xct;->k:Ll/mu40;

    .line 60
    .line 61
    iput-object p2, p0, Ll/xct;->j:Ljava/lang/String;

    .line 62
    .line 63
    iput-object p3, p0, Ll/xct;->l:Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;

    .line 64
    .line 65
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    check-cast p0, Ll/mu40;

    .line 70
    .line 71
    invoke-virtual {p0, p2}, Ll/mu40;->S2(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public static synthetic R3(Ljava/lang/Integer;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-lez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static synthetic S3(Ll/xct;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xct;->a4(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic T3(Ll/xct;Lcom/p1/mobile/putong/live/base/data/BLiveSettings;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xct;->b4(Lcom/p1/mobile/putong/live/base/data/BLiveSettings;)V

    return-void
.end method

.method public static synthetic U3(Ll/xct;Ll/jsv;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xct;->c4(Ll/jsv;)V

    return-void
.end method

.method public static synthetic V3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method private Z3()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xct;->k:Ll/mu40;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/vp20;->m()Ll/jsv;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ll/jsv;->g()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method


# virtual methods
.method public N3()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Landroid/view/View;

    .line 4
    .line 5
    return-object p0
.end method

.method public O3(IILandroid/content/Intent;)V
    .locals 1

    .line 1
    const/16 v0, 0x64

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    const/4 p1, -0x1

    .line 6
    if-ne p2, p1, :cond_0

    .line 7
    .line 8
    const-string p1, "room_tag"

    .line 9
    .line 10
    invoke-virtual {p3, p1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;

    .line 15
    .line 16
    iget-object p0, p0, Ll/xct;->k:Ll/mu40;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ll/oo2;->i(Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public P3()V
    .locals 3

    .line 1
    invoke-static {}, Ll/lwr;->d()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Ll/pvn$a;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/pvn$a;-><init>()V

    .line 14
    .line 15
    .line 16
    const-string v1, "live"

    .line 17
    .line 18
    invoke-static {v1, v0}, Ll/pvn;->c(Ljava/lang/String;Ll/ga1;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    invoke-static {}, Ll/zrv;->r()V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/xct;->k:Ll/mu40;

    .line 25
    .line 26
    invoke-virtual {v0}, Ll/oo2;->c2()V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/xct;->k:Ll/mu40;

    .line 30
    .line 31
    invoke-virtual {v0}, Ll/oo2;->P1()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Ll/njt;->K3()Ll/dum;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Ll/fw40;

    .line 39
    .line 40
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 41
    .line 42
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;

    .line 43
    .line 44
    iget-object v2, p0, Ll/xct;->l:Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;

    .line 45
    .line 46
    invoke-static {p0, v0, v1, v2}, Ll/m6t;->a(Ll/xct;Ll/fw40;Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Ll/njt;->L3()V

    .line 50
    .line 51
    .line 52
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {v0}, Ll/mof0;->k()Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    new-instance v1, Ll/sct;

    .line 65
    .line 66
    invoke-direct {v1, p0}, Ll/sct;-><init>(Ll/xct;)V

    .line 67
    .line 68
    .line 69
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Ll/xct;->k:Ll/mu40;

    .line 77
    .line 78
    invoke-virtual {v0}, Ll/vp20;->y()Lrx/c;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    new-instance v1, Ll/tct;

    .line 87
    .line 88
    invoke-direct {v1, p0}, Ll/tct;-><init>(Ll/xct;)V

    .line 89
    .line 90
    .line 91
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 96
    .line 97
    .line 98
    invoke-virtual {p0}, Ll/xct;->W3()V

    .line 99
    .line 100
    .line 101
    iget-object p0, p0, Ll/xct;->k:Ll/mu40;

    .line 102
    .line 103
    sget-object v0, Ll/yct;->b:Ll/yct;

    .line 104
    .line 105
    invoke-virtual {p0, v0}, Ll/mu40;->h(Ll/jsv;)V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method public W3()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/xct;->m:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 7
    .line 8
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/base/live/LiveView;->getGiftWidthObs()Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/uct;

    .line 23
    .line 24
    invoke-direct {v1}, Ll/uct;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    new-instance v1, Ll/vct;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Ll/vct;-><init>(Ll/xct;)V

    .line 38
    .line 39
    .line 40
    new-instance v2, Ll/wct;

    .line 41
    .line 42
    invoke-direct {v2}, Ll/wct;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iput-object v0, p0, Ll/xct;->m:Ll/kcg0;

    .line 54
    .line 55
    return-void
.end method

.method public X3()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePusherEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;->closeLive()Ll/v3f$c;

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

.method public final Y3()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xct;->k:Ll/mu40;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/vp20;->m()Ll/jsv;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ll/jsv;->d()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public final synthetic a4(Ljava/lang/Integer;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->changeInputSize()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v0, Landroid/util/Size;

    .line 12
    .line 13
    invoke-static {}, Ll/bnl0;->y0()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    sub-int/2addr v1, p1

    .line 22
    sget p1, Ll/qa00;->E:I

    .line 23
    .line 24
    sub-int/2addr v1, p1

    .line 25
    const/4 p1, 0x0

    .line 26
    invoke-direct {v0, v1, p1}, Landroid/util/Size;-><init>(II)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final synthetic b4(Lcom/p1/mobile/putong/live/base/data/BLiveSettings;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xct;->k:Ll/mu40;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/oo2;->T0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic c4(Ll/jsv;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/njt;->M3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public n()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xzs;->e:Ll/dum;

    .line 2
    .line 3
    iget-object v0, v0, Ll/dum;->j:Ll/x6t;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/l6t;->destroy()V

    .line 6
    .line 7
    .line 8
    invoke-super {p0}, Ll/i6t;->n()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/xct;->m:Ll/kcg0;

    .line 12
    .line 13
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/xct;->k:Ll/mu40;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Ll/oo2;->g2(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Ll/l6t;->s2()V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Ll/xct;->k:Ll/mu40;

    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    invoke-virtual {p0, v0}, Ll/oo2;->c0(Z)V

    .line 32
    .line 33
    .line 34
    invoke-static {}, Ll/lwr;->b()V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public o()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xct;->Y3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-direct {p0}, Ll/xct;->Z3()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->ObsPreviewEvent:Lcom/tantan/live/eventbus/LiveEventBus$ObsPreviewEvent;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$ObsPreviewEvent;->onBackPressed()Ll/v3f$c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 25
    .line 26
    .line 27
    const/4 p0, 0x0

    .line 28
    return p0

    .line 29
    :cond_1
    :goto_0
    invoke-virtual {p0}, Ll/xct;->X3()V

    .line 30
    .line 31
    .line 32
    const/4 p0, 0x1

    .line 33
    return p0
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/xct;->k:Ll/mu40;

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    invoke-virtual {p0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {p0, v0, v1}, Ll/oo2;->e2(ZLcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
