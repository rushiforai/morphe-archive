.class public Ll/erm0;
.super Ll/qct;
.source "SourceFile"

# interfaces
.implements Ll/c6m;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/jqm0;",
        ">;",
        "Ll/c6m;"
    }
.end annotation


# instance fields
.field public i:Ll/kcg0;


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic J3(Ll/erm0;Ll/vgd0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/erm0;->i4(Ll/vgd0;)V

    return-void
.end method

.method public static synthetic K3(Ll/erm0;ILl/ugd0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/erm0;->q4(ILl/ugd0;)V

    return-void
.end method

.method public static synthetic L3(Ll/erm0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/erm0;->l4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic M3(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic N3(Ll/erm0;Landroid/net/NetworkInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/erm0;->j4(Landroid/net/NetworkInfo;)V

    return-void
.end method

.method public static synthetic O3(Ll/erm0;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/erm0;->k4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;)V

    return-void
.end method

.method public static synthetic P3(Ll/erm0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/erm0;->v4()V

    return-void
.end method

.method public static synthetic R3(Ll/erm0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/erm0;->s4()V

    return-void
.end method

.method public static synthetic S3(Ll/erm0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/erm0;->t4()V

    return-void
.end method

.method public static synthetic T3(Ll/erm0;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/erm0;->m4(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic U3(Landroid/net/NetworkInfo;)Ljava/lang/Boolean;
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

.method public static synthetic V3(Ll/erm0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/erm0;->u4()V

    return-void
.end method

.method public static synthetic W3(Ll/erm0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/erm0;->r4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic X3(Ll/erm0;Ll/y20;Ll/pf60;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/erm0;->o4(Ll/y20;Ll/pf60;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Y3(Ll/erm0;Ll/vgd0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/erm0;->h4(Ll/vgd0;)V

    return-void
.end method

.method public static synthetic Z3(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic a4(Ll/erm0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/erm0;->p4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic b4(Ll/erm0;ZLcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ll/ugd0;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/erm0;->n4(ZLcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ll/ugd0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method private d4(ZLcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ll/jqm0;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/vp20;->o()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    sget-object p2, Ll/zrv;->a:Ll/wrv;

    .line 12
    .line 13
    invoke-virtual {p2}, Ll/wrv;->D0()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Ll/jqm0;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/oo2;->o0()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    check-cast v1, Ll/jqm0;

    .line 32
    .line 33
    invoke-virtual {v1}, Ll/jqm0;->b4()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->focusUserId:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    check-cast v2, Ll/jqm0;

    .line 44
    .line 45
    invoke-virtual {v2}, Ll/vp20;->x()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-static {p1, p2, v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/voice/api/VoiceRoomApiProvider;->getInRoom(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    new-instance p2, Ll/uqm0;

    .line 54
    .line 55
    invoke-direct {p2, p0}, Ll/uqm0;-><init>(Ll/erm0;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p1, p2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0
.end method

.method private f4(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ll/ugd0;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/erm0;->c4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic h4(Ll/vgd0;)V
    .locals 2

    .line 1
    iget-object v0, p1, Ll/vgd0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 2
    .line 3
    iget-boolean v1, p1, Ll/vgd0;->c:Z

    .line 4
    .line 5
    iget-object p1, p1, Ll/vgd0;->a:Ll/y20;

    .line 6
    .line 7
    invoke-virtual {p0, v0, v1, p1}, Ll/erm0;->e4(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;ZLl/y20;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic i4(Ll/vgd0;)V
    .locals 0

    .line 1
    iget-object p1, p1, Ll/vgd0;->a:Ll/y20;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ll/erm0;->f4(Ll/y20;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic j4(Landroid/net/NetworkInfo;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ll/jqm0;

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
    check-cast p1, Ll/jqm0;

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
    invoke-virtual {p0, p1, v0}, Ll/erm0;->g4(Ljava/lang/String;I)V

    .line 29
    .line 30
    .line 31
    goto :goto_0

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
    check-cast p1, Ll/jqm0;

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
    invoke-virtual {p0, p1, v0}, Ll/erm0;->g4(Ljava/lang/String;I)V

    .line 50
    .line 51
    .line 52
    :cond_1
    :goto_0
    invoke-virtual {p0}, Ll/erm0;->c4()V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method private synthetic k4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;)V
    .locals 2

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
    if-nez v1, :cond_1

    .line 13
    .line 14
    const-string v1, "recover"

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->liveId:Ljava/lang/String;

    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    invoke-virtual {p0, p1, v0}, Ll/erm0;->g4(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->liveId:Ljava/lang/String;

    .line 31
    .line 32
    const/4 v0, 0x2

    .line 33
    invoke-virtual {p0, p1, v0}, Ll/erm0;->g4(Ljava/lang/String;I)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomZoneEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomZoneEvent;

    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomZoneEvent;->refreshAllButton()Ll/v3f$c;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method private synthetic u4()V
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

.method private synthetic v4()V
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

.method private x4(Ljava/lang/String;Ljava/lang/String;Ll/x20;)V
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


# virtual methods
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
    new-instance v1, Ll/kqm0;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/kqm0;-><init>(Ll/erm0;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

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
    new-instance v1, Ll/vqm0;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/vqm0;-><init>(Ll/erm0;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

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
    new-instance v1, Ll/wqm0;

    .line 82
    .line 83
    invoke-direct {v1}, Ll/wqm0;-><init>()V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    new-instance v1, Ll/xqm0;

    .line 91
    .line 92
    invoke-direct {v1, p0}, Ll/xqm0;-><init>(Ll/erm0;)V

    .line 93
    .line 94
    .line 95
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

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
    check-cast v0, Ll/jqm0;

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
    new-instance v1, Ll/yqm0;

    .line 115
    .line 116
    invoke-direct {v1, p0}, Ll/yqm0;-><init>(Ll/erm0;)V

    .line 117
    .line 118
    .line 119
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

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
    iput-object v0, p0, Ll/erm0;->i:Ll/kcg0;

    .line 128
    .line 129
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    check-cast v0, Ll/jqm0;

    .line 134
    .line 135
    invoke-virtual {v0}, Ll/jqm0;->W3()Lrx/subjects/b;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    new-instance v1, Ll/zqm0;

    .line 144
    .line 145
    invoke-direct {v1, p0}, Ll/zqm0;-><init>(Ll/erm0;)V

    .line 146
    .line 147
    .line 148
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 153
    .line 154
    .line 155
    return-void
.end method

.method public final c4()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/jqm0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/vp20;->o()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 12
    .line 13
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    check-cast v2, Ll/jqm0;

    .line 22
    .line 23
    invoke-virtual {v2}, Ll/oo2;->o0()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    check-cast v3, Ll/jqm0;

    .line 32
    .line 33
    invoke-virtual {v3}, Ll/jqm0;->b4()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->focusUserId:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    check-cast v4, Ll/jqm0;

    .line 44
    .line 45
    invoke-virtual {v4}, Ll/vp20;->x()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    invoke-static {v0, v1, v2, v3, v4}, Lcom/p1/mobile/putong/live/livingroom/voice/api/VoiceRoomApiProvider;->getInRoom(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    new-instance v1, Ll/rqm0;

    .line 58
    .line 59
    invoke-direct {v1}, Ll/rqm0;-><init>()V

    .line 60
    .line 61
    .line 62
    new-instance v2, Ll/sqm0;

    .line 63
    .line 64
    invoke-direct {v2, p0}, Ll/sqm0;-><init>(Ll/erm0;)V

    .line 65
    .line 66
    .line 67
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public e4(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;ZLl/y20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;",
            "Z",
            "Ll/y20<",
            "Ll/ugd0;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/erm0;->y4()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Ll/jqm0;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ll/jqm0;->Z3(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Lrx/c;

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
    new-instance v1, Ll/crm0;

    .line 19
    .line 20
    invoke-direct {v1, p0, p2, p1}, Ll/crm0;-><init>(Ll/erm0;ZLcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    new-instance p2, Ll/drm0;

    .line 28
    .line 29
    invoke-direct {p2, p0, p3}, Ll/drm0;-><init>(Ll/erm0;Ll/y20;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1, p2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    new-instance p2, Ll/lqm0;

    .line 37
    .line 38
    invoke-direct {p2}, Ll/lqm0;-><init>()V

    .line 39
    .line 40
    .line 41
    new-instance p3, Ll/mqm0;

    .line 42
    .line 43
    invoke-direct {p3, p0}, Ll/mqm0;-><init>(Ll/erm0;)V

    .line 44
    .line 45
    .line 46
    invoke-static {p2, p3}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public g4(Ljava/lang/String;I)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/erm0;->y4()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/voice/api/VoiceRoomApiProvider;->getLiveInfo(Ljava/lang/String;)Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    new-instance v0, Ll/arm0;

    .line 13
    .line 14
    invoke-direct {v0, p0, p2}, Ll/arm0;-><init>(Ll/erm0;I)V

    .line 15
    .line 16
    .line 17
    new-instance p2, Ll/brm0;

    .line 18
    .line 19
    invoke-direct {p2, p0}, Ll/brm0;-><init>(Ll/erm0;)V

    .line 20
    .line 21
    .line 22
    invoke-static {v0, p2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final synthetic l4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/jqm0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/jqm0;->W3()Lrx/subjects/b;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic m4(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/jqm0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/rwn0;->O2()Ll/szn0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/szn0;->e()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    iget-wide v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->memberCount:D

    .line 18
    .line 19
    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    .line 20
    .line 21
    add-double/2addr v0, v2

    .line 22
    iput-wide v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->memberCount:D

    .line 23
    .line 24
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 25
    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRoomTagInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;

    .line 27
    .line 28
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->voiceRoomTagInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;

    .line 29
    .line 30
    :cond_0
    return-object p1
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/erm0;->i:Ll/kcg0;

    .line 5
    .line 6
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic n4(ZLcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ll/ugd0;)Lrx/c;
    .locals 6

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
    invoke-virtual {v0, p3}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p3, Ll/mr2;->b:Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;

    .line 15
    .line 16
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 17
    .line 18
    iget-object v1, p3, Ll/mr2;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 19
    .line 20
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    iget-object v2, v2, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceVirtualLiveEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceVirtualLiveEvent;

    .line 27
    .line 28
    invoke-virtual {v2}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceVirtualLiveEvent;->preLoadRoomBg()Ll/v3f$d;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    new-instance v3, Ll/cfp0;

    .line 33
    .line 34
    iget-object v4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->bgPicType:Ljava/lang/String;

    .line 35
    .line 36
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->backgroundUrl:Ljava/lang/String;

    .line 37
    .line 38
    iget-object v5, p3, Ll/mr2;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 39
    .line 40
    iget-object v5, v5, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 41
    .line 42
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->template:Ljava/lang/String;

    .line 43
    .line 44
    invoke-direct {v3, v4, v0, v5, v1}, Ll/cfp0;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v2, v3}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    invoke-static {p3}, Ll/itv;->O(Ll/ugd0;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object p3

    .line 54
    invoke-direct {p0, p1, p2}, Ll/erm0;->d4(ZLcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    new-instance p1, Ll/tqm0;

    .line 59
    .line 60
    invoke-direct {p1}, Ll/tqm0;-><init>()V

    .line 61
    .line 62
    .line 63
    invoke-static {p3, p0, p1}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    return-object p0
.end method

.method public final synthetic o4(Ll/y20;Ll/pf60;)Ll/uxj0;
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
    move-result-object v1

    .line 9
    check-cast v1, Ll/jqm0;

    .line 10
    .line 11
    invoke-virtual {v1}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    check-cast v2, Ll/jqm0;

    .line 20
    .line 21
    invoke-virtual {v2}, Ll/rwn0;->O2()Ll/szn0;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-virtual {v2}, Ll/szn0;->e()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    check-cast v3, Ll/jqm0;

    .line 34
    .line 35
    invoke-virtual {v3}, Ll/rwn0;->O2()Ll/szn0;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    invoke-virtual {v3}, Ll/szn0;->c()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    check-cast v4, Ll/jqm0;

    .line 48
    .line 49
    invoke-virtual {v4}, Ll/oo2;->u0()Lcom/p1/mobile/putong/data/Followship;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 54
    .line 55
    .line 56
    move-result-object v5

    .line 57
    check-cast v5, Ll/jqm0;

    .line 58
    .line 59
    invoke-virtual {v5}, Ll/oo2;->J0()Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;

    .line 60
    .line 61
    .line 62
    move-result-object v5

    .line 63
    invoke-direct/range {v0 .. v5}, Ll/ugd0;-><init>(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Lcom/p1/mobile/putong/data/Followship;Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)V

    .line 64
    .line 65
    .line 66
    invoke-interface {p1, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 67
    .line 68
    .line 69
    :cond_0
    sget-object p1, Ll/lej0;->INSTANCE:Ll/lej0;

    .line 70
    .line 71
    const-string v0, "enter_voice_room"

    .line 72
    .line 73
    const-string v1, "onGetEnterRoomInfo \u4fee\u6539\u72b6\u6001\u4e3aliving"

    .line 74
    .line 75
    invoke-virtual {p1, v0, v1}, Ll/lej0;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    check-cast p1, Ll/jqm0;

    .line 83
    .line 84
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    check-cast p0, Ll/jqm0;

    .line 89
    .line 90
    invoke-virtual {p0}, Ll/rwn0;->O2()Ll/szn0;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-virtual {p0}, Ll/szn0;->c()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    invoke-virtual {p1, p0}, Ll/oo2;->V(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 99
    .line 100
    .line 101
    sget-object p0, Ll/htd0;->f:Ll/htd0;

    .line 102
    .line 103
    invoke-static {p0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    check-cast p0, Ll/civ;

    .line 108
    .line 109
    iget-object p1, p2, Ll/pf60;->b:Ljava/lang/Object;

    .line 110
    .line 111
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    .line 112
    .line 113
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 114
    .line 115
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->intlConfig:Lcom/p1/mobile/putong/live/base/data/BLiveIntlConfig;

    .line 116
    .line 117
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlConfig;->switchStar:Z

    .line 118
    .line 119
    invoke-virtual {p0, p1}, Ll/civ;->C(Z)V

    .line 120
    .line 121
    .line 122
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 123
    .line 124
    return-object p0
.end method

.method public final synthetic p4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/jqm0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/jqm0;->W3()Lrx/subjects/b;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic q4(ILl/ugd0;)V
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
    check-cast p2, Ll/jqm0;

    .line 19
    .line 20
    invoke-virtual {p2}, Ll/rwn0;->O2()Ll/szn0;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    invoke-virtual {p2}, Ll/szn0;->c()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

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
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->RoomMysteryEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$RoomMysteryEventGroup;

    .line 40
    .line 41
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$RoomMysteryEventGroup;->clearRoomFakeId()Ll/v3f$c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0}, Ll/v3f$c;->p()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    check-cast p0, Ll/jqm0;

    .line 53
    .line 54
    invoke-virtual {p0, p2, p1}, Ll/oo2;->W(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;I)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public final synthetic r4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/jqm0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/jqm0;->W3()Lrx/subjects/b;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic s4()V
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

.method public final synthetic t4()V
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

.method public w4(Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    instance-of v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 5
    .line 6
    if-eqz v0, :cond_b

    .line 7
    .line 8
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 9
    .line 10
    iget v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 11
    .line 12
    const v1, 0xc746

    .line 13
    .line 14
    .line 15
    if-ne v0, v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    check-cast p1, Ll/jqm0;

    .line 22
    .line 23
    invoke-virtual {p1}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-static {p0, p1}, Ll/ydn0;->f(Ll/i6t;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 28
    .line 29
    .line 30
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 31
    .line 32
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->w:I

    .line 33
    .line 34
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 39
    .line 40
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->o2:I

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    new-instance v1, Ll/nqm0;

    .line 47
    .line 48
    invoke-direct {v1, p0}, Ll/nqm0;-><init>(Ll/erm0;)V

    .line 49
    .line 50
    .line 51
    invoke-direct {p0, p1, v0, v1}, Ll/erm0;->x4(Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_0
    const v1, 0xa02b

    .line 56
    .line 57
    .line 58
    const v2, 0xc73b

    .line 59
    .line 60
    .line 61
    if-eq v0, v1, :cond_9

    .line 62
    .line 63
    if-ne v0, v2, :cond_1

    .line 64
    .line 65
    goto/16 :goto_1

    .line 66
    .line 67
    :cond_1
    const v1, 0xa044

    .line 68
    .line 69
    .line 70
    if-ne v0, v1, :cond_2

    .line 71
    .line 72
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 77
    .line 78
    .line 79
    sget-object p0, Ll/zrv;->a:Ll/wrv;

    .line 80
    .line 81
    const/4 p1, 0x3

    .line 82
    invoke-virtual {p0, p1}, Ll/wrv;->o0(I)V

    .line 83
    .line 84
    .line 85
    return-void

    .line 86
    :cond_2
    const v1, 0xc74c

    .line 87
    .line 88
    .line 89
    if-ne v0, v1, :cond_3

    .line 90
    .line 91
    iget-object p1, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 92
    .line 93
    invoke-static {p1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 101
    .line 102
    .line 103
    return-void

    .line 104
    :cond_3
    const v1, 0xc742

    .line 105
    .line 106
    .line 107
    if-ne v0, v1, :cond_6

    .line 108
    .line 109
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    check-cast p1, Ll/jqm0;

    .line 114
    .line 115
    invoke-virtual {p1}, Ll/oo2;->M0()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    const-string v0, "chatAssistantFixAnchor"

    .line 120
    .line 121
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 122
    .line 123
    .line 124
    move-result p1

    .line 125
    if-nez p1, :cond_5

    .line 126
    .line 127
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    check-cast p1, Ll/jqm0;

    .line 132
    .line 133
    invoke-virtual {p1}, Ll/oo2;->M0()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    const-string v0, "chatAssistantFixAnchorShowPackage"

    .line 138
    .line 139
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 140
    .line 141
    .line 142
    move-result p1

    .line 143
    if-eqz p1, :cond_4

    .line 144
    .line 145
    goto :goto_0

    .line 146
    :cond_4
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 147
    .line 148
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Gj:I

    .line 149
    .line 150
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 155
    .line 156
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->o2:I

    .line 157
    .line 158
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    new-instance v1, Ll/pqm0;

    .line 163
    .line 164
    invoke-direct {v1, p0}, Ll/pqm0;-><init>(Ll/erm0;)V

    .line 165
    .line 166
    .line 167
    invoke-direct {p0, p1, v0, v1}, Ll/erm0;->x4(Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 168
    .line 169
    .line 170
    return-void

    .line 171
    :cond_5
    :goto_0
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Hj:I

    .line 172
    .line 173
    invoke-static {p1}, Ll/r1j0;->f(I)V

    .line 174
    .line 175
    .line 176
    sget-object p1, Ll/zrv;->a:Ll/wrv;

    .line 177
    .line 178
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 179
    .line 180
    invoke-virtual {p1, v0}, Ll/wrv;->x0(Lcom/p1/mobile/android/app/Act;)V

    .line 181
    .line 182
    .line 183
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 184
    .line 185
    .line 186
    move-result-object p0

    .line 187
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 188
    .line 189
    .line 190
    return-void

    .line 191
    :cond_6
    const v1, 0xc743

    .line 192
    .line 193
    .line 194
    if-ne v0, v1, :cond_7

    .line 195
    .line 196
    iget-object p1, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 197
    .line 198
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 199
    .line 200
    .line 201
    move-result v0

    .line 202
    if-nez v0, :cond_8

    .line 203
    .line 204
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 205
    .line 206
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->o2:I

    .line 207
    .line 208
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v0

    .line 212
    new-instance v1, Ll/qqm0;

    .line 213
    .line 214
    invoke-direct {v1, p0}, Ll/qqm0;-><init>(Ll/erm0;)V

    .line 215
    .line 216
    .line 217
    invoke-direct {p0, p1, v0, v1}, Ll/erm0;->x4(Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 218
    .line 219
    .line 220
    return-void

    .line 221
    :cond_7
    const v1, 0xc748

    .line 222
    .line 223
    .line 224
    if-ne v0, v1, :cond_8

    .line 225
    .line 226
    iget-object p1, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 227
    .line 228
    invoke-static {p1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 229
    .line 230
    .line 231
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 232
    .line 233
    .line 234
    move-result-object p0

    .line 235
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 236
    .line 237
    .line 238
    :cond_8
    return-void

    .line 239
    :cond_9
    :goto_1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 240
    .line 241
    .line 242
    move-result-object v1

    .line 243
    check-cast v1, Ll/jqm0;

    .line 244
    .line 245
    invoke-virtual {v1}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 246
    .line 247
    .line 248
    move-result-object v1

    .line 249
    invoke-static {p0, v1}, Ll/ydn0;->f(Ll/i6t;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 250
    .line 251
    .line 252
    if-ne v0, v2, :cond_a

    .line 253
    .line 254
    iget-object p1, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 255
    .line 256
    goto :goto_2

    .line 257
    :cond_a
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 258
    .line 259
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Sj:I

    .line 260
    .line 261
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 262
    .line 263
    .line 264
    move-result-object p1

    .line 265
    :goto_2
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 266
    .line 267
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->o2:I

    .line 268
    .line 269
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 270
    .line 271
    .line 272
    move-result-object v0

    .line 273
    new-instance v1, Ll/oqm0;

    .line 274
    .line 275
    invoke-direct {v1, p0}, Ll/oqm0;-><init>(Ll/erm0;)V

    .line 276
    .line 277
    .line 278
    invoke-direct {p0, p1, v0, v1}, Ll/erm0;->x4(Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 279
    .line 280
    .line 281
    return-void

    .line 282
    :cond_b
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->E9:I

    .line 283
    .line 284
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 285
    .line 286
    .line 287
    return-void
.end method

.method public y4()V
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
