.class public Ll/won0;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/rwn0;",
        "Ll/fon0;",
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

.field public k:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public l:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/ic3<",
            "*>;>;"
        }
    .end annotation
.end field

.field public final m:Ll/ntm0;


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 1
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
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/won0;->i:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/won0;->k:Ljava/util/List;

    .line 17
    .line 18
    new-instance v0, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/won0;->l:Ljava/util/List;

    .line 24
    .line 25
    new-instance v0, Ll/fon0;

    .line 26
    .line 27
    invoke-direct {v0}, Ll/fon0;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, v0}, Ll/l6t;->C(Ll/iam;)V

    .line 31
    .line 32
    .line 33
    new-instance v0, Ll/ntm0;

    .line 34
    .line 35
    invoke-direct {v0, p1}, Ll/ntm0;-><init>(Ll/dum;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    check-cast p1, Ll/ntm0;

    .line 43
    .line 44
    iput-object p1, p0, Ll/won0;->m:Ll/ntm0;

    .line 45
    .line 46
    return-void
.end method

.method public static synthetic J3(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ll/vb3;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->bottomMenu:Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;

    .line 4
    .line 5
    new-instance v0, Ll/vb3;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/vb3;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public static synthetic K3(Ll/ic3;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    instance-of v0, p0, Ll/dho0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p0

    .line 6
    check-cast v0, Ll/dho0;

    .line 7
    .line 8
    iget-object v0, v0, Ll/dho0;->l:Ll/jc3;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-interface {v0}, Ll/jc3;->l1()Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0

    .line 21
    :cond_0
    instance-of v0, p0, Ll/din0;

    .line 22
    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    check-cast p0, Ll/din0;

    .line 26
    .line 27
    iget-object p0, p0, Ll/din0;->l:Ll/jc3;

    .line 28
    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    invoke-interface {p0}, Ll/jc3;->l1()Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0

    .line 40
    :cond_1
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 41
    .line 42
    return-object p0
.end method

.method public static synthetic L3(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->bottomMenu:Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;

    .line 4
    .line 5
    if-eqz p0, :cond_0

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

.method public static synthetic M3(Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;)Ljava/lang/Boolean;
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

.method public static synthetic N3(Ll/ic3;)Ljava/lang/Boolean;
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

.method public static synthetic O3(Ll/won0;Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/won0;->g4(Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;)V

    return-void
.end method

.method public static synthetic P3(Ll/qrm0;Lcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;)Ljava/lang/Boolean;
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

.method public static synthetic R3(Ll/ic3;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ic3;->r1()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic S3(ILl/qrm0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/qrm0;->Z3()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-ne p1, p0, :cond_0

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

.method public static synthetic T3(Ll/won0;Ll/vb3;Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;[ILjava/util/List;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/won0;->f4(Ll/vb3;Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;[ILjava/util/List;Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic U3(Ll/won0;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/won0;->i4(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic V3(Ll/won0;Ll/vb3;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/won0;->l4(Ll/vb3;)V

    return-void
.end method

.method public static synthetic W3(Ljava/lang/Integer;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->id:I

    .line 6
    .line 7
    if-ne p0, p1, :cond_0

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

.method public static synthetic X3(Ll/won0;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/won0;->h4(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic Y3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic Z3(Ll/vb3;Ljava/util/List;Ll/qrm0;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/vb3;->d:Ljava/util/List;

    .line 2
    .line 3
    new-instance v0, Ll/kon0;

    .line 4
    .line 5
    invoke-direct {v0, p2}, Ll/kon0;-><init>(Ll/qrm0;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;

    .line 13
    .line 14
    if-nez p0, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    invoke-virtual {p2, v0, p0}, Ll/qrm0;->g4(ILcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;)Ll/ic3;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    if-eqz p0, :cond_1

    .line 26
    .line 27
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    :cond_1
    :goto_0
    return-void
.end method

.method private b4(Ll/vb3;Ljava/util/List;Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/vb3;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;",
            "Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;",
            ")",
            "Ljava/util/List<",
            "Ll/qrm0<",
            "*>;>;"
        }
    .end annotation

    .line 1
    new-instance v5, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    filled-new-array {v0}, [I

    .line 8
    .line 9
    .line 10
    move-result-object v4

    .line 11
    new-instance v0, Ll/jon0;

    .line 12
    .line 13
    move-object v1, p0

    .line 14
    move-object v2, p1

    .line 15
    move-object v3, p3

    .line 16
    invoke-direct/range {v0 .. v5}, Ll/jon0;-><init>(Ll/won0;Ll/vb3;Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;[ILjava/util/List;)V

    .line 17
    .line 18
    .line 19
    invoke-static {p2, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 20
    .line 21
    .line 22
    return-object v5
.end method

.method private c4()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/fon0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/fon0;->e()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic g4(Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/won0;->j:Ll/vb3;

    .line 2
    .line 3
    iget-object v0, p0, Ll/won0;->i:Ljava/util/List;

    .line 4
    .line 5
    invoke-virtual {p0, p1, v0}, Ll/won0;->m4(Ll/vb3;Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic h4(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/won0;->n4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic i4(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/won0;->c4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private k4()V
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
    invoke-virtual {v0}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-static {v0}, Ll/guk0;->h(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    const/4 v1, 0x1

    .line 27
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Ll/rwn0;

    .line 32
    .line 33
    invoke-virtual {v0}, Ll/vp20;->o()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    check-cast v3, Ll/rwn0;

    .line 46
    .line 47
    invoke-virtual {v3}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    check-cast v4, Ll/rwn0;

    .line 58
    .line 59
    invoke-virtual {v4}, Ll/oo2;->j0()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    invoke-static {v0, v2, v1, v3, v4}, Lcom/p1/mobile/putong/live/livingroom/voice/api/VoiceRoomApiProvider;->requestBottomButtons(Ljava/lang/String;ZZLjava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    new-instance v1, Ll/qon0;

    .line 68
    .line 69
    invoke-direct {v1}, Ll/qon0;-><init>()V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    new-instance v1, Ll/ron0;

    .line 77
    .line 78
    invoke-direct {v1}, Ll/ron0;-><init>()V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    new-instance v1, Ll/son0;

    .line 90
    .line 91
    invoke-direct {v1, p0}, Ll/son0;-><init>(Ll/won0;)V

    .line 92
    .line 93
    .line 94
    new-instance p0, Ll/ton0;

    .line 95
    .line 96
    invoke-direct {p0}, Ll/ton0;-><init>()V

    .line 97
    .line 98
    .line 99
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method private l4(Ll/vb3;)V
    .locals 2

    .line 1
    iget-boolean v0, p1, Ll/vb3;->j:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p1, Ll/vb3;->e:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButtonDivision;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Ll/won0;->m:Ll/ntm0;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/ntm0;->O3()V

    .line 13
    .line 14
    .line 15
    iget-object v0, p1, Ll/vb3;->e:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButtonDivision;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButtonDivision;->settingZone:Ljava/util/List;

    .line 18
    .line 19
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;->SETTING:Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;

    .line 20
    .line 21
    invoke-direct {p0, p1, v0, v1}, Ll/won0;->b4(Ll/vb3;Ljava/util/List;Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;)Ljava/util/List;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v1, p0, Ll/won0;->m:Ll/ntm0;

    .line 26
    .line 27
    invoke-virtual {v1}, Ll/ntm0;->K3()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, p1, v0}, Ll/won0;->m4(Ll/vb3;Ljava/util/List;)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 34
    .line 35
    check-cast p1, Ll/fon0;

    .line 36
    .line 37
    invoke-virtual {p1}, Ll/fon0;->l()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->BootBubbleEvent:Lcom/tantan/live/eventbus/LiveEventBus$BootBubbleEvent;

    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$BootBubbleEvent;->dismissBubble()Ll/v3f$d;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    const-string p1, "voiceRoomGameCenterBubble"

    .line 51
    .line 52
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    :cond_1
    :goto_0
    return-void
.end method

.method private n4()V
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
    invoke-direct {p0}, Ll/won0;->k4()V

    .line 15
    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public T()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public a4(Ljava/util/List;)I
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/ic3<",
            "*>;>;)I"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    new-instance p0, Ll/lon0;

    .line 9
    .line 10
    invoke-direct {p0}, Ll/lon0;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-static {p1, p0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Ll/ic3;

    .line 18
    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, -0x1

    .line 22
    return p0

    .line 23
    :cond_0
    return v0
.end method

.method public final d4(Ljava/util/List;Ll/qcj;)Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/ic3<",
            "*>;>;",
            "Ll/qcj<",
            "Ll/ic3<",
            "*>;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ll/ic3<",
            "*>;>;>;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/LinkedHashMap;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Ll/ic3;

    .line 21
    .line 22
    invoke-interface {p2, v0}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Ljava/lang/String;

    .line 27
    .line 28
    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    check-cast v2, Ljava/util/List;

    .line 33
    .line 34
    if-nez v2, :cond_0

    .line 35
    .line 36
    new-instance v2, Ljava/util/ArrayList;

    .line 37
    .line 38
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-interface {p0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    :cond_0
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    return-object p0
.end method

.method public e4(I)Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/won0;->i:Ljava/util/List;

    .line 2
    .line 3
    new-instance v0, Ll/uon0;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/uon0;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public final synthetic f4(Ll/vb3;Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;[ILjava/util/List;Ljava/lang/Integer;)V
    .locals 2

    .line 1
    iget-object v0, p1, Ll/vb3;->c:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/mon0;

    .line 4
    .line 5
    invoke-direct {v1, p5}, Ll/mon0;-><init>(Ljava/lang/Integer;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p5

    .line 12
    check-cast p5, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 13
    .line 14
    if-nez p5, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-static {p5}, Ll/ve3;->a(Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/won0;->m:Ll/ntm0;

    .line 21
    .line 22
    iget-object p1, p1, Ll/vb3;->g:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {p0, p5, p2, p1}, Ll/ntm0;->L3(Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;Ljava/lang/String;)Ll/qrm0;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    if-eqz p0, :cond_1

    .line 29
    .line 30
    const/4 p1, 0x0

    .line 31
    aget p2, p3, p1

    .line 32
    .line 33
    add-int/lit8 p2, p2, 0x1

    .line 34
    .line 35
    aput p2, p3, p1

    .line 36
    .line 37
    iput p2, p0, Ll/qrm0;->k:I

    .line 38
    .line 39
    invoke-interface {p4, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    :cond_1
    :goto_0
    return-void
.end method

.method public j4()V
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

.method public m4(Ll/vb3;Ljava/util/List;)V
    .locals 2
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
    iput-object p2, p0, Ll/won0;->i:Ljava/util/List;

    .line 2
    .line 3
    iput-object p1, p0, Ll/won0;->j:Ll/vb3;

    .line 4
    .line 5
    new-instance v0, Ll/fok;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/fok;-><init>()V

    .line 8
    .line 9
    .line 10
    new-instance v1, Ll/von0;

    .line 11
    .line 12
    invoke-direct {v1, p1, v0}, Ll/von0;-><init>(Ll/vb3;Ljava/util/List;)V

    .line 13
    .line 14
    .line 15
    invoke-static {p2, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 16
    .line 17
    .line 18
    new-instance p1, Ll/hon0;

    .line 19
    .line 20
    invoke-direct {p1}, Ll/hon0;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-static {v0, p1}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    sget-object p2, Ll/htd0;->e:Ll/htd0;

    .line 28
    .line 29
    invoke-static {p2}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    check-cast p2, Ll/ifv;

    .line 34
    .line 35
    iget-object p2, p2, Ll/ifv;->j:Ll/jxd0;

    .line 36
    .line 37
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p2, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->BottomZoneEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomZoneEvent;

    .line 49
    .line 50
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$BottomZoneEvent;->setSettingButtonRedPoint()Ll/v3f$d;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p0, v0}, Ll/won0;->a4(Ljava/util/List;)I

    .line 55
    .line 56
    .line 57
    move-result p2

    .line 58
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    invoke-virtual {p1, p2}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 63
    .line 64
    .line 65
    new-instance p1, Ll/ion0;

    .line 66
    .line 67
    invoke-direct {p1}, Ll/ion0;-><init>()V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0, v0, p1}, Ll/won0;->d4(Ljava/util/List;Ll/qcj;)Ljava/util/Map;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 75
    .line 76
    check-cast p0, Ll/fon0;

    .line 77
    .line 78
    invoke-virtual {p0, p1}, Ll/fon0;->k(Ljava/util/Map;)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public n()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/won0;->k:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/won0;->l:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 12
    .line 13
    .line 14
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
    new-instance v1, Ll/gon0;

    .line 25
    .line 26
    invoke-direct {v1}, Ll/gon0;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/non0;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/non0;-><init>(Ll/won0;)V

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
    new-instance v1, Ll/oon0;

    .line 66
    .line 67
    invoke-direct {v1, p0}, Ll/oon0;-><init>(Ll/won0;)V

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
    new-instance v1, Ll/pon0;

    .line 98
    .line 99
    invoke-direct {v1, p0}, Ll/pon0;-><init>(Ll/won0;)V

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
