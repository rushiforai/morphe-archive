.class public Ll/uhd0;
.super Ll/qct;
.source "SourceFile"

# interfaces
.implements Ll/c6m;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/ou40;",
        ">;",
        "Ll/c6m;"
    }
.end annotation


# static fields
.field public static l:J


# instance fields
.field public final i:Ljava/lang/String;

.field public j:Ll/kcg0;

.field public k:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dum;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Ll/uhd0;->k:Lrx/subjects/b;

    .line 9
    .line 10
    iput-object p2, p0, Ll/uhd0;->i:Ljava/lang/String;

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic J3(Ll/y20;Ll/ugd0;)V
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic K3(Ll/uhd0;Landroid/net/NetworkInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uhd0;->o4(Landroid/net/NetworkInfo;)V

    return-void
.end method

.method public static synthetic L3(Ll/uhd0;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uhd0;->p4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;)V

    return-void
.end method

.method public static synthetic M3(Ll/uhd0;Ll/y20;Ljava/lang/Object;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/uhd0;->w4(Ll/y20;Ljava/lang/Object;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic N3(Ll/uhd0;Ll/vgd0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uhd0;->m4(Ll/vgd0;)V

    return-void
.end method

.method public static synthetic O3(Ll/uhd0;Lrx/Notification;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uhd0;->G4(Lrx/Notification;)V

    return-void
.end method

.method public static synthetic P3(Ll/uhd0;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uhd0;->q4(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method

.method public static synthetic R3(Ll/uhd0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/uhd0;->C4()V

    return-void
.end method

.method public static synthetic S3(Ll/uhd0;Ll/vgd0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uhd0;->n4(Ll/vgd0;)V

    return-void
.end method

.method public static synthetic T3(Landroid/net/NetworkInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->g()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic U3(Ll/uhd0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/uhd0;->B4()V

    return-void
.end method

.method public static synthetic V3(Ll/uhd0;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uhd0;->r4(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method

.method public static synthetic W3(Ll/uhd0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/uhd0;->A4()V

    return-void
.end method

.method public static synthetic X3(Ll/uhd0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uhd0;->z4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic Y3(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic Z3(Ll/uhd0;Ll/ugd0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uhd0;->s4(Ll/ugd0;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic a4(Ll/uhd0;Ll/ugd0;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uhd0;->u4(Ll/ugd0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b4(Ll/uhd0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uhd0;->x4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic c4(Ll/uhd0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uhd0;->t4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic d4(Ll/uhd0;ZLcom/p1/mobile/putong/live/base/data/BLiveAbsData;Lrx/Notification;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/uhd0;->v4(ZLcom/p1/mobile/putong/live/base/data/BLiveAbsData;Lrx/Notification;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic e4(JLjava/util/Map;)V
    .locals 1

    .line 1
    const-string v0, "watch_duration"

    .line 2
    .line 3
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p2, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic f4(Ll/uhd0;ILl/ugd0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/uhd0;->y4(ILl/ugd0;)V

    return-void
.end method

.method public static synthetic g4(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method private k4(Ll/y20;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ll/ugd0;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/ou40;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/vp20;->m()Ll/jsv;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v2, "RoomPresenter initRoomInfo "

    .line 14
    .line 15
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const-string v2, "live_float_window"

    .line 26
    .line 27
    invoke-static {v2, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ll/uhd0;->F4()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    check-cast v1, Ll/ou40;

    .line 38
    .line 39
    sget-object v2, Ll/qfu;->b:Ll/qfu;

    .line 40
    .line 41
    invoke-virtual {v1, v2}, Ll/vp20;->h(Ll/jsv;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    check-cast v1, Ll/ou40;

    .line 49
    .line 50
    invoke-virtual {v1, v0}, Ll/vp20;->h(Ll/jsv;)V

    .line 51
    .line 52
    .line 53
    if-eqz p1, :cond_0

    .line 54
    .line 55
    new-instance v2, Ll/ugd0;

    .line 56
    .line 57
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    check-cast v0, Ll/ou40;

    .line 62
    .line 63
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    check-cast v0, Ll/ou40;

    .line 72
    .line 73
    invoke-virtual {v0}, Ll/dw40;->A2()Ll/ew40;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {v0}, Ll/ew40;->e()Lcom/p1/mobile/putong/live/base/data/BLiveRoom;

    .line 78
    .line 79
    .line 80
    move-result-object v4

    .line 81
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    check-cast v0, Ll/ou40;

    .line 86
    .line 87
    invoke-virtual {v0}, Ll/dw40;->A2()Ll/ew40;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {v0}, Ll/ew40;->c()Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 92
    .line 93
    .line 94
    move-result-object v5

    .line 95
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    check-cast v0, Ll/ou40;

    .line 100
    .line 101
    invoke-virtual {v0}, Ll/oo2;->u0()Lcom/p1/mobile/putong/data/Followship;

    .line 102
    .line 103
    .line 104
    move-result-object v6

    .line 105
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    check-cast v0, Ll/ou40;

    .line 110
    .line 111
    invoke-virtual {v0}, Ll/oo2;->J0()Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;

    .line 112
    .line 113
    .line 114
    move-result-object v7

    .line 115
    invoke-direct/range {v2 .. v7}, Ll/ugd0;-><init>(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Lcom/p1/mobile/putong/data/Followship;Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    check-cast v0, Ll/ou40;

    .line 123
    .line 124
    invoke-virtual {v0, v2}, Ll/ou40;->M2(Ll/ugd0;)Lrx/c;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    new-instance v1, Ll/chd0;

    .line 133
    .line 134
    invoke-direct {v1, p0}, Ll/chd0;-><init>(Ll/uhd0;)V

    .line 135
    .line 136
    .line 137
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 142
    .line 143
    .line 144
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    check-cast p0, Ll/ou40;

    .line 149
    .line 150
    iget-object p0, p0, Ll/ou40;->I:Ljava/lang/String;

    .line 151
    .line 152
    invoke-virtual {v2, p0}, Ll/ugd0;->c(Ljava/lang/String;)Ll/ugd0;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 157
    .line 158
    .line 159
    :cond_0
    return-void
.end method


# virtual methods
.method public final synthetic A4()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic B4()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic C4()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public D4(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->enterRoomFail()Ll/v3f$c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/v3f$c;->p()V

    .line 12
    .line 13
    .line 14
    instance-of v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 15
    .line 16
    if-eqz v0, :cond_4

    .line 17
    .line 18
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 19
    .line 20
    iget v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 21
    .line 22
    const v1, 0xa04e

    .line 23
    .line 24
    .line 25
    if-ne v0, v1, :cond_0

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 32
    .line 33
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->restorePlayerView()Ll/v3f$c;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p1}, Ll/v3f$c;->p()V

    .line 38
    .line 39
    .line 40
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 41
    .line 42
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->w:I

    .line 43
    .line 44
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 49
    .line 50
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->o2:I

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v1, Ll/dhd0;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/dhd0;-><init>(Ll/uhd0;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0, p1, v0, v1}, Ll/uhd0;->E4(Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_0
    const v1, 0xa02b

    .line 66
    .line 67
    .line 68
    if-ne v0, v1, :cond_1

    .line 69
    .line 70
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 75
    .line 76
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->restorePlayerView()Ll/v3f$c;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-virtual {p1}, Ll/v3f$c;->p()V

    .line 81
    .line 82
    .line 83
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 84
    .line 85
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Sj:I

    .line 86
    .line 87
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 92
    .line 93
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->o2:I

    .line 94
    .line 95
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    new-instance v1, Ll/ehd0;

    .line 100
    .line 101
    invoke-direct {v1, p0}, Ll/ehd0;-><init>(Ll/uhd0;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p0, p1, v0, v1}, Ll/uhd0;->E4(Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 105
    .line 106
    .line 107
    return-void

    .line 108
    :cond_1
    const v1, 0xa044

    .line 109
    .line 110
    .line 111
    if-ne v0, v1, :cond_2

    .line 112
    .line 113
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 118
    .line 119
    .line 120
    sget-object p0, Ll/zrv;->a:Ll/wrv;

    .line 121
    .line 122
    const/4 p1, 0x3

    .line 123
    invoke-virtual {p0, p1}, Ll/wrv;->o0(I)V

    .line 124
    .line 125
    .line 126
    return-void

    .line 127
    :cond_2
    const v1, 0xa21f

    .line 128
    .line 129
    .line 130
    if-ne v0, v1, :cond_3

    .line 131
    .line 132
    iget-object p1, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 133
    .line 134
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 139
    .line 140
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->restorePlayerView()Ll/v3f$c;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    invoke-virtual {v0}, Ll/v3f$c;->p()V

    .line 145
    .line 146
    .line 147
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 148
    .line 149
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->o2:I

    .line 150
    .line 151
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    new-instance v1, Ll/fhd0;

    .line 156
    .line 157
    invoke-direct {v1, p0}, Ll/fhd0;-><init>(Ll/uhd0;)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {p0, p1, v0, v1}, Ll/uhd0;->E4(Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 161
    .line 162
    .line 163
    return-void

    .line 164
    :cond_3
    const v1, 0xa038

    .line 165
    .line 166
    .line 167
    if-ne v0, v1, :cond_4

    .line 168
    .line 169
    iget-object p1, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 170
    .line 171
    invoke-static {p1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 172
    .line 173
    .line 174
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 175
    .line 176
    .line 177
    move-result-object p0

    .line 178
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 179
    .line 180
    .line 181
    return-void

    .line 182
    :cond_4
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->E9:I

    .line 183
    .line 184
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 185
    .line 186
    .line 187
    return-void
.end method

.method public final E4(Ljava/lang/String;Ljava/lang/String;Ll/x20;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object p0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const/4 p1, 0x0

    .line 19
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {p3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    new-instance p1, Ll/bri0;

    .line 27
    .line 28
    invoke-direct {p1, p3}, Ll/bri0;-><init>(Ll/x20;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/android/app/Dialog$e;->n0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public F4()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->getShowingDialog()Landroid/app/Dialog;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->getShowingDialog()Landroid/app/Dialog;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Landroid/app/Dialog;->dismiss()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public final G4(Lrx/Notification;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Notification<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/vwt;->S6()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Lrx/Notification;->f()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ll/uhd0;->h4(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    new-instance v0, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    const-string v1, "updateFakeId:"

    .line 24
    .line 25
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v1, "[live]"

    .line 36
    .line 37
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-nez v0, :cond_0

    .line 45
    .line 46
    const-string v0, "0"

    .line 47
    .line 48
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-nez v0, :cond_0

    .line 53
    .line 54
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->RoomMysteryEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$RoomMysteryEventGroup;

    .line 59
    .line 60
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$RoomMysteryEventGroup;->setRoomFakeId()Ll/v3f$d;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    :cond_0
    return-void
.end method

.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->RoomInfoEvent:Lcom/tantan/live/eventbus/LiveEventBus$RoomInfoEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$RoomInfoEvent;->initRoomInfo()Ll/v3f$d;

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
    new-instance v1, Ll/wgd0;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/wgd0;-><init>(Ll/uhd0;)V

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
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->RoomInfoEvent:Lcom/tantan/live/eventbus/LiveEventBus$RoomInfoEvent;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$RoomInfoEvent;->initSmallWindowRoomInfo()Ll/v3f$d;

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
    new-instance v1, Ll/hhd0;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/hhd0;-><init>(Ll/uhd0;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 66
    .line 67
    .line 68
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->m()Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    const/4 v1, 0x1

    .line 77
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    new-instance v1, Ll/mhd0;

    .line 82
    .line 83
    invoke-direct {v1}, Ll/mhd0;-><init>()V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    new-instance v1, Ll/nhd0;

    .line 91
    .line 92
    invoke-direct {v1, p0}, Ll/nhd0;-><init>(Ll/uhd0;)V

    .line 93
    .line 94
    .line 95
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    check-cast v0, Ll/ou40;

    .line 107
    .line 108
    iget-object v1, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 109
    .line 110
    invoke-virtual {v0, v1}, Ll/oo2;->o1(Lcom/p1/mobile/android/app/Act;)Lrx/c;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    new-instance v1, Ll/ohd0;

    .line 115
    .line 116
    invoke-direct {v1, p0}, Ll/ohd0;-><init>(Ll/uhd0;)V

    .line 117
    .line 118
    .line 119
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    iput-object v0, p0, Ll/uhd0;->j:Ll/kcg0;

    .line 128
    .line 129
    iget-object v0, p0, Ll/uhd0;->k:Lrx/subjects/b;

    .line 130
    .line 131
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    new-instance v1, Ll/phd0;

    .line 136
    .line 137
    invoke-direct {v1, p0}, Ll/phd0;-><init>(Ll/uhd0;)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 141
    .line 142
    .line 143
    return-void
.end method

.method public final h4(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 18
    .line 19
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-nez p0, :cond_0

    .line 24
    .line 25
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_0

    .line 36
    .line 37
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 38
    .line 39
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-eqz p1, :cond_0

    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->fakeId:Ljava/lang/String;

    .line 48
    .line 49
    return-object p0

    .line 50
    :cond_0
    const-string p0, "0"

    .line 51
    .line 52
    return-object p0
.end method

.method public final i4(ZLcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Lrx/c;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_0

    .line 3
    .line 4
    iget-object p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->recommendInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;->extInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRecommendExtInfo;

    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Ll/ou40;

    .line 17
    .line 18
    invoke-virtual {p1}, Ll/oo2;->o0()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-static {p1}, Ll/tnt$a;->a(Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    iget-object p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->recommendInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;

    .line 29
    .line 30
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;->extInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRecommendExtInfo;

    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveRecommendExtInfo;->toJsonAsQueryString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    move-object v4, p1

    .line 37
    goto :goto_0

    .line 38
    :cond_0
    move-object v4, v0

    .line 39
    :goto_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    check-cast p1, Ll/ou40;

    .line 44
    .line 45
    invoke-virtual {p1}, Ll/vp20;->o()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    sget-object p1, Ll/zrv;->a:Ll/wrv;

    .line 50
    .line 51
    invoke-virtual {p1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    check-cast p1, Ll/ou40;

    .line 60
    .line 61
    invoke-virtual {p1}, Ll/oo2;->o0()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    iget-object p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->recommendInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;

    .line 66
    .line 67
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    if-eqz p1, :cond_1

    .line 72
    .line 73
    iget-object p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->recommendInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;

    .line 74
    .line 75
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;->category:Ljava/lang/String;

    .line 76
    .line 77
    :cond_1
    move-object v5, v0

    .line 78
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    check-cast p1, Ll/ou40;

    .line 83
    .line 84
    invoke-virtual {p1}, Ll/vp20;->x()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v6

    .line 88
    invoke-static/range {v1 .. v6}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->Z4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    new-instance p2, Ll/jhd0;

    .line 93
    .line 94
    invoke-direct {p2, p0}, Ll/jhd0;-><init>(Ll/uhd0;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p1, p2}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    new-instance p2, Ll/khd0;

    .line 102
    .line 103
    invoke-direct {p2, p0}, Ll/khd0;-><init>(Ll/uhd0;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {p1, p2}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    new-instance p1, Ll/lhd0;

    .line 111
    .line 112
    invoke-direct {p1}, Ll/lhd0;-><init>()V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    return-object p0
.end method

.method public final j4(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;ZLl/y20;Ll/y20;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;",
            "Z",
            "Ll/y20<",
            "Ll/ugd0;",
            ">;",
            "Ll/y20<",
            "Ll/ugd0;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/uhd0;->F4()V

    .line 2
    .line 3
    .line 4
    sget-wide v0, Ll/z91;->b:J

    .line 5
    .line 6
    const-wide/16 v2, 0x0

    .line 7
    .line 8
    cmp-long v0, v0, v2

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-static {}, Ll/pzi0;->o()J

    .line 13
    .line 14
    .line 15
    move-result-wide v0

    .line 16
    sget-wide v4, Ll/z91;->b:J

    .line 17
    .line 18
    sub-long/2addr v0, v4

    .line 19
    new-instance v4, Ll/qhd0;

    .line 20
    .line 21
    invoke-direct {v4, v0, v1}, Ll/qhd0;-><init>(J)V

    .line 22
    .line 23
    .line 24
    const-string v0, "audience_start_live"

    .line 25
    .line 26
    invoke-static {p0, v0, v4}, Ll/fgt;->b(Ll/i6t;Ljava/lang/String;Ll/y20;)V

    .line 27
    .line 28
    .line 29
    sput-wide v2, Ll/z91;->b:J

    .line 30
    .line 31
    :cond_0
    invoke-static {}, Ll/pzi0;->o()J

    .line 32
    .line 33
    .line 34
    move-result-wide v0

    .line 35
    sput-wide v0, Ll/uhd0;->l:J

    .line 36
    .line 37
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Ll/ou40;

    .line 42
    .line 43
    invoke-virtual {v0, p1}, Ll/ou40;->I2(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    new-instance v1, Ll/rhd0;

    .line 52
    .line 53
    invoke-direct {v1, p0}, Ll/rhd0;-><init>(Ll/uhd0;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    new-instance v1, Ll/shd0;

    .line 61
    .line 62
    invoke-direct {v1, p3}, Ll/shd0;-><init>(Ll/y20;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 66
    .line 67
    .line 68
    move-result-object p3

    .line 69
    new-instance v0, Ll/thd0;

    .line 70
    .line 71
    invoke-direct {v0, p0}, Ll/thd0;-><init>(Ll/uhd0;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p3, v0}, Lrx/c;->doOnError(Ll/y20;)Lrx/c;

    .line 75
    .line 76
    .line 77
    move-result-object p3

    .line 78
    new-instance v0, Ll/xgd0;

    .line 79
    .line 80
    invoke-direct {v0, p0}, Ll/xgd0;-><init>(Ll/uhd0;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p3, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 84
    .line 85
    .line 86
    move-result-object p3

    .line 87
    new-instance v0, Ll/ygd0;

    .line 88
    .line 89
    invoke-direct {v0, p0, p2, p1}, Ll/ygd0;-><init>(Ll/uhd0;ZLcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p3, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    new-instance p2, Ll/zgd0;

    .line 97
    .line 98
    invoke-direct {p2, p0, p4}, Ll/zgd0;-><init>(Ll/uhd0;Ll/y20;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {p1, p2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    new-instance p2, Ll/ahd0;

    .line 106
    .line 107
    invoke-direct {p2}, Ll/ahd0;-><init>()V

    .line 108
    .line 109
    .line 110
    new-instance p3, Ll/bhd0;

    .line 111
    .line 112
    invoke-direct {p3, p0}, Ll/bhd0;-><init>(Ll/uhd0;)V

    .line 113
    .line 114
    .line 115
    invoke-static {p2, p3}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 120
    .line 121
    .line 122
    return-void
.end method

.method public l4(Ljava/lang/String;I)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/uhd0;->F4()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->showLoading()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->h5(Ljava/lang/String;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    new-instance v0, Ll/ghd0;

    .line 28
    .line 29
    invoke-direct {v0, p0, p2}, Ll/ghd0;-><init>(Ll/uhd0;I)V

    .line 30
    .line 31
    .line 32
    new-instance p2, Ll/ihd0;

    .line 33
    .line 34
    invoke-direct {p2, p0}, Ll/ihd0;-><init>(Ll/uhd0;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v0, p2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final synthetic m4(Ll/vgd0;)V
    .locals 3

    .line 1
    iget-object v0, p1, Ll/vgd0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 2
    .line 3
    iget-boolean v1, p1, Ll/vgd0;->c:Z

    .line 4
    .line 5
    iget-object v2, p1, Ll/vgd0;->d:Ll/y20;

    .line 6
    .line 7
    iget-object p1, p1, Ll/vgd0;->a:Ll/y20;

    .line 8
    .line 9
    invoke-virtual {p0, v0, v1, v2, p1}, Ll/uhd0;->j4(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;ZLl/y20;Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/uhd0;->j:Ll/kcg0;

    .line 5
    .line 6
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic n4(Ll/vgd0;)V
    .locals 0

    .line 1
    iget-object p1, p1, Ll/vgd0;->a:Ll/y20;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ll/uhd0;->k4(Ll/y20;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic o4(Landroid/net/NetworkInfo;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ll/ou40;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/vp20;->m()Ll/jsv;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Ll/jsv;->c()Z

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
    move-result-object p1

    .line 21
    check-cast p1, Ll/ou40;

    .line 22
    .line 23
    invoke-virtual {p1}, Ll/vp20;->k()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    const/4 v0, 0x2

    .line 28
    invoke-virtual {p0, p1, v0}, Ll/uhd0;->l4(Ljava/lang/String;I)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    invoke-virtual {p1}, Ll/jsv;->g()Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-eqz p1, :cond_1

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    check-cast p1, Ll/ou40;

    .line 43
    .line 44
    invoke-virtual {p1}, Ll/vp20;->k()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    const/4 v0, 0x1

    .line 49
    invoke-virtual {p0, p1, v0}, Ll/uhd0;->l4(Ljava/lang/String;I)V

    .line 50
    .line 51
    .line 52
    :cond_1
    return-void
.end method

.method public final synthetic p4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;)V
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->type:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    const-string v1, "start"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    const/4 v2, 0x2

    .line 13
    if-nez v1, :cond_1

    .line 14
    .line 15
    const-string v1, "recover"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->liveId:Ljava/lang/String;

    .line 25
    .line 26
    const/4 v1, 0x1

    .line 27
    invoke-virtual {p0, v0, v1}, Ll/uhd0;->l4(Ljava/lang/String;I)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->liveId:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {p0, v0, v2}, Ll/uhd0;->l4(Ljava/lang/String;I)V

    .line 34
    .line 35
    .line 36
    :goto_0
    invoke-static {v2}, Ll/wft;->b(I)Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    if-nez p0, :cond_2

    .line 41
    .line 42
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    const-string p1, "[live]"

    .line 47
    .line 48
    const-string v0, "[passivity_exit]"

    .line 49
    .line 50
    filled-new-array {p1, v0}, [Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-static {p0, p1}, Ll/nsh0;->k(Ljava/lang/String;[Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    :cond_2
    return-void
.end method

.method public final synthetic q4(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 11

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/ou40;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/dw40;->A2()Ll/ew40;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/ew40;->c()Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 18
    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->showSideBarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveSideBarConfig;

    .line 22
    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSideBarConfig;->sideBarState:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-nez v1, :cond_0

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    check-cast v1, Ll/ou40;

    .line 38
    .line 39
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 40
    .line 41
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveData;->showSideBarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveSideBarConfig;

    .line 42
    .line 43
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveSideBarConfig;->sideBarState:Ljava/lang/String;

    .line 44
    .line 45
    iput-object v2, v1, Ll/ou40;->I:Ljava/lang/String;

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    check-cast v1, Ll/ou40;

    .line 53
    .line 54
    const-string v2, "default"

    .line 55
    .line 56
    iput-object v2, v1, Ll/ou40;->I:Ljava/lang/String;

    .line 57
    .line 58
    :goto_0
    sget-object v1, Ll/htd0;->f:Ll/htd0;

    .line 59
    .line 60
    invoke-static {v1}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    check-cast v1, Ll/civ;

    .line 65
    .line 66
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 67
    .line 68
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->intlConfig:Lcom/p1/mobile/putong/live/base/data/BLiveIntlConfig;

    .line 69
    .line 70
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlConfig;->switchStar:Z

    .line 71
    .line 72
    invoke-virtual {v1, p1}, Ll/civ;->C(Z)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    new-instance v1, Ll/pf60;

    .line 80
    .line 81
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    check-cast v2, Ll/ou40;

    .line 86
    .line 87
    invoke-virtual {v2}, Ll/oo2;->I0()Ll/ajt$a;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    invoke-virtual {v2}, Ll/ajt$a;->c()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    const-string v3, "enter_rec_category"

    .line 96
    .line 97
    invoke-direct {v1, v3, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 98
    .line 99
    .line 100
    new-instance v2, Ll/pf60;

    .line 101
    .line 102
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 103
    .line 104
    .line 105
    move-result-object v3

    .line 106
    check-cast v3, Ll/ou40;

    .line 107
    .line 108
    invoke-virtual {v3}, Ll/oo2;->D0()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v3

    .line 112
    const-string v4, "live_enter_source"

    .line 113
    .line 114
    invoke-direct {v2, v4, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 115
    .line 116
    .line 117
    new-instance v3, Ll/pf60;

    .line 118
    .line 119
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 120
    .line 121
    .line 122
    move-result-object v4

    .line 123
    check-cast v4, Ll/ou40;

    .line 124
    .line 125
    invoke-virtual {v4}, Ll/oo2;->o0()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v4

    .line 129
    const-string v5, "live_inter_source"

    .line 130
    .line 131
    invoke-direct {v3, v5, v4}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 132
    .line 133
    .line 134
    new-instance v4, Ll/pf60;

    .line 135
    .line 136
    iget-object v5, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 137
    .line 138
    iget-object v5, v5, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 139
    .line 140
    const-string v6, "anchorId"

    .line 141
    .line 142
    invoke-direct {v4, v6, v5}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 143
    .line 144
    .line 145
    new-instance v5, Ll/pf60;

    .line 146
    .line 147
    const-string v6, "liveId"

    .line 148
    .line 149
    iget-object v7, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 150
    .line 151
    invoke-direct {v5, v6, v7}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 152
    .line 153
    .line 154
    new-instance v6, Ll/pf60;

    .line 155
    .line 156
    iget-object v7, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->state:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 157
    .line 158
    const-string v8, "onlive"

    .line 159
    .line 160
    invoke-static {v7, v8}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 161
    .line 162
    .line 163
    move-result v7

    .line 164
    if-nez v7, :cond_2

    .line 165
    .line 166
    iget-object v7, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->state:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 167
    .line 168
    const-string v8, "suspended"

    .line 169
    .line 170
    invoke-static {v7, v8}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 171
    .line 172
    .line 173
    move-result v7

    .line 174
    if-eqz v7, :cond_1

    .line 175
    .line 176
    goto :goto_1

    .line 177
    :cond_1
    const-string v7, "off"

    .line 178
    .line 179
    goto :goto_2

    .line 180
    :cond_2
    :goto_1
    const-string v7, "on"

    .line 181
    .line 182
    :goto_2
    const-string v8, "live_status"

    .line 183
    .line 184
    invoke-direct {v6, v8, v7}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 185
    .line 186
    .line 187
    new-instance v7, Ll/pf60;

    .line 188
    .line 189
    const-string v8, "page_id"

    .line 190
    .line 191
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object v9

    .line 195
    invoke-direct {v7, v8, v9}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 196
    .line 197
    .line 198
    new-instance v8, Ll/pf60;

    .line 199
    .line 200
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 201
    .line 202
    .line 203
    move-result-object p0

    .line 204
    check-cast p0, Ll/ou40;

    .line 205
    .line 206
    invoke-virtual {p0}, Ll/oo2;->I0()Ll/ajt$a;

    .line 207
    .line 208
    .line 209
    move-result-object p0

    .line 210
    invoke-virtual {p0}, Ll/ajt$a;->f()J

    .line 211
    .line 212
    .line 213
    move-result-wide v9

    .line 214
    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 215
    .line 216
    .line 217
    move-result-object p0

    .line 218
    const-string v9, "trace_id"

    .line 219
    .line 220
    invoke-direct {v8, v9, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 221
    .line 222
    .line 223
    new-instance v9, Ll/pf60;

    .line 224
    .line 225
    iget-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 226
    .line 227
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 228
    .line 229
    const-string v0, "roomId"

    .line 230
    .line 231
    invoke-direct {v9, v0, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 232
    .line 233
    .line 234
    filled-new-array/range {v1 .. v9}, [Ll/pf60;

    .line 235
    .line 236
    .line 237
    move-result-object p0

    .line 238
    const-string v0, "e_live_enter"

    .line 239
    .line 240
    invoke-static {v0, p1, p0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 241
    .line 242
    .line 243
    return-void
.end method

.method public final synthetic r4(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/ou40;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/dw40;->A2()Ll/ew40;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/ew40;->c()Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    iget-wide v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->memberCount:D

    .line 18
    .line 19
    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    .line 20
    .line 21
    add-double/2addr v0, v2

    .line 22
    iput-wide v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->memberCount:D

    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public final synthetic s4(Ll/ugd0;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/uhd0;->i:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "live"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p1, Ll/mr2;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 12
    .line 13
    invoke-static {v0}, Ll/u9t;->a(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLive;->new_()Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object p1, p1, Ll/mr2;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 24
    .line 25
    invoke-static {p1}, Ll/u9t;->b(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iput-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 30
    .line 31
    const-string p1, "officialShow"

    .line 32
    .line 33
    iput-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 34
    .line 35
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 36
    .line 37
    invoke-direct {p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->o(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p0}, Ll/i6t;->n3()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->u(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;->CHANGE_SOURCE_NO_BACK:Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;

    .line 53
    .line 54
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->n(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->m()Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->FragProxyEvent:Lcom/tantan/live/eventbus/LiveEventBus$FragProxyEvent;

    .line 67
    .line 68
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$FragProxyEvent;->jumpRoom()Ll/v3f$d;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 73
    .line 74
    .line 75
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 76
    .line 77
    return-object p0

    .line 78
    :cond_0
    iget-object v0, p0, Ll/uhd0;->i:Ljava/lang/String;

    .line 79
    .line 80
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-eqz v0, :cond_1

    .line 85
    .line 86
    iget-object v0, p1, Ll/mr2;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 87
    .line 88
    invoke-static {v0}, Ll/u9t;->d(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-eqz v0, :cond_1

    .line 93
    .line 94
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 95
    .line 96
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;-><init>()V

    .line 97
    .line 98
    .line 99
    iget-object p1, p1, Ll/mr2;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 100
    .line 101
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->o(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    invoke-virtual {p0}, Ll/i6t;->n3()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->u(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;->CHANGE_SOURCE_NO_BACK:Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;

    .line 114
    .line 115
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->n(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->m()Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->FragProxyEvent:Lcom/tantan/live/eventbus/LiveEventBus$FragProxyEvent;

    .line 128
    .line 129
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$FragProxyEvent;->jumpRoom()Ll/v3f$d;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 134
    .line 135
    .line 136
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 137
    .line 138
    return-object p0

    .line 139
    :cond_1
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 140
    .line 141
    return-object p0
.end method

.method public final synthetic t4(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->showErrorText()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 12
    .line 13
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->H9:I

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->showLoading()Ll/v3f$d;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final synthetic u4(Ll/ugd0;)Lrx/c;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->FragProxyEvent:Lcom/tantan/live/eventbus/LiveEventBus$FragProxyEvent;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$FragProxyEvent;->changeRoomData()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Ll/ou40;

    .line 19
    .line 20
    invoke-virtual {v0, p1}, Ll/ou40;->M2(Ll/ugd0;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public final synthetic v4(ZLcom/p1/mobile/putong/live/base/data/BLiveAbsData;Lrx/Notification;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p3}, Ll/uhd0;->G4(Lrx/Notification;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1, p2}, Ll/uhd0;->i4(ZLcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public final synthetic w4(Ll/y20;Ljava/lang/Object;)Ll/uxj0;
    .locals 6

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    new-instance v0, Ll/ugd0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    check-cast p2, Ll/ou40;

    .line 10
    .line 11
    invoke-virtual {p2}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    check-cast p2, Ll/ou40;

    .line 20
    .line 21
    invoke-virtual {p2}, Ll/dw40;->A2()Ll/ew40;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    invoke-virtual {p2}, Ll/ew40;->e()Lcom/p1/mobile/putong/live/base/data/BLiveRoom;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    check-cast p2, Ll/ou40;

    .line 34
    .line 35
    invoke-virtual {p2}, Ll/dw40;->A2()Ll/ew40;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    invoke-virtual {p2}, Ll/ew40;->c()Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    check-cast p2, Ll/ou40;

    .line 48
    .line 49
    invoke-virtual {p2}, Ll/oo2;->u0()Lcom/p1/mobile/putong/data/Followship;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    check-cast p2, Ll/ou40;

    .line 58
    .line 59
    invoke-virtual {p2}, Ll/oo2;->J0()Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;

    .line 60
    .line 61
    .line 62
    move-result-object v5

    .line 63
    invoke-direct/range {v0 .. v5}, Ll/ugd0;-><init>(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Lcom/p1/mobile/putong/data/Followship;Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    check-cast p2, Ll/ou40;

    .line 71
    .line 72
    iget-object p2, p2, Ll/ou40;->I:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {v0, p2}, Ll/ugd0;->c(Ljava/lang/String;)Ll/ugd0;

    .line 75
    .line 76
    .line 77
    move-result-object p2

    .line 78
    invoke-interface {p1, p2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 79
    .line 80
    .line 81
    sget-object p1, Ll/lej0;->INSTANCE:Ll/lej0;

    .line 82
    .line 83
    const-string p2, "enter_live_room"

    .line 84
    .line 85
    const-string v0, "onGetEnterRoomInfo \u4fee\u6539\u72b6\u6001\u4e3aliving"

    .line 86
    .line 87
    invoke-virtual {p1, p2, v0}, Ll/lej0;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    check-cast p1, Ll/ou40;

    .line 95
    .line 96
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    check-cast p0, Ll/ou40;

    .line 101
    .line 102
    invoke-virtual {p0}, Ll/dw40;->A2()Ll/ew40;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-virtual {p0}, Ll/ew40;->c()Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    invoke-virtual {p1, p0}, Ll/oo2;->V(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 111
    .line 112
    .line 113
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 114
    .line 115
    return-object p0
.end method

.method public final synthetic x4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uhd0;->k:Lrx/subjects/b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic y4(ILl/ugd0;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->FragProxyEvent:Lcom/tantan/live/eventbus/LiveEventBus$FragProxyEvent;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$FragProxyEvent;->changeRoomData()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0, p2}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    check-cast p2, Ll/ou40;

    .line 19
    .line 20
    invoke-virtual {p2}, Ll/dw40;->A2()Ll/ew40;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    invoke-virtual {p2}, Ll/ew40;->c()Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    iget-wide v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->memberCount:D

    .line 29
    .line 30
    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    .line 31
    .line 32
    add-double/2addr v0, v2

    .line 33
    iput-wide v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->memberCount:D

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    check-cast p0, Ll/ou40;

    .line 40
    .line 41
    invoke-virtual {p0, p2, p1}, Ll/oo2;->W(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;I)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final synthetic z4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uhd0;->k:Lrx/subjects/b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
