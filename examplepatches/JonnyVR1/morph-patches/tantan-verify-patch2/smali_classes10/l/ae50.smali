.class public Ll/ae50;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/mc50;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Z

.field public j:I

.field public k:Ll/kcg0;


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x4

    .line 5
    iput p1, p0, Ll/ae50;->j:I

    .line 6
    .line 7
    return-void
.end method

.method private D4(Ll/v9s;)V
    .locals 1

    .line 1
    iget p1, p0, Ll/ae50;->j:I

    .line 2
    .line 3
    const/4 v0, 0x5

    .line 4
    if-ne p1, v0, :cond_0

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    iput v0, p0, Ll/ae50;->j:I

    .line 8
    .line 9
    return-void
.end method

.method private I4(Ljava/lang/Throwable;Z)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    const p2, 0xa028

    .line 4
    .line 5
    .line 6
    invoke-static {p2, p1}, Ll/yvr;->b(ILjava/lang/Throwable;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePusherEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;->notifyRecoverLiveStopped()Ll/v3f$c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public static synthetic J3(Ll/ae50;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ae50;->n4(Ll/vxj0;)V

    return-void
.end method

.method private J4(Ljava/lang/String;Ljava/lang/String;ILl/x20;)V
    .locals 0

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const/4 p1, 0x0

    .line 21
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {p4}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    new-instance p1, Ll/bri0;

    .line 29
    .line 30
    invoke-direct {p1, p4}, Ll/bri0;-><init>(Ll/x20;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/android/app/Dialog$e;->n0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public static synthetic K3(Lcom/p1/mobile/putong/live/base/data/BLive;Lrx/Notification;)Lrx/c;
    .locals 1

    .line 1
    invoke-virtual {p1}, Lrx/Notification;->j()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object p1, Ll/zrv;->a:Ll/wrv;

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/wrv;->V()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {p1}, Lrx/Notification;->f()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 19
    .line 20
    :goto_0
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method private K4(Lcom/p1/mobile/putong/live/base/data/BLive;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLive;",
            ")",
            "Lrx/c<",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/live/base/data/BLive;",
            ">;>;"
        }
    .end annotation

    .line 1
    sget-object p0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->s7(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Lrx/c;->materialize()Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const/4 v0, 0x1

    .line 18
    invoke-virtual {p0, v0}, Lrx/c;->take(I)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    new-instance v0, Ll/kd50;

    .line 23
    .line 24
    invoke-direct {v0, p1}, Ll/kd50;-><init>(Lcom/p1/mobile/putong/live/base/data/BLive;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0
.end method

.method public static synthetic L3(Ll/ae50;Lcom/p1/mobile/putong/live/base/data/BLive;)Lrx/c;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ae50;->K4(Lcom/p1/mobile/putong/live/base/data/BLive;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method private L4()V
    .locals 3

    .line 1
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->u4(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/pd50;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/pd50;-><init>(Ll/ae50;)V

    .line 18
    .line 19
    .line 20
    new-instance v2, Ll/qd50;

    .line 21
    .line 22
    invoke-direct {v2, p0}, Ll/qd50;-><init>(Ll/ae50;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public static synthetic M3(Ll/ae50;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ae50;->A4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic N3(Ll/ae50;ZLcom/p1/mobile/putong/live/base/data/BLive;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ae50;->B4(ZLcom/p1/mobile/putong/live/base/data/BLive;)V

    return-void
.end method

.method public static synthetic O3(Ll/ae50;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ae50;->s4()V

    return-void
.end method

.method public static synthetic P3(Ll/ae50;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ae50;->C4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic R3(Ll/ae50;ZLjava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ae50;->x4(ZLjava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic S3(Ll/ae50;Lcom/p1/mobile/putong/live/base/data/BLive;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ae50;->q4(Lcom/p1/mobile/putong/live/base/data/BLive;)V

    return-void
.end method

.method public static synthetic T3(Ll/x20;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0}, Ll/x20;->call()V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static synthetic U3(Ll/ae50;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ae50;->r4()V

    return-void
.end method

.method public static synthetic V3(Ll/ae50;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ae50;->w4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic W3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic X3(Ll/ae50;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ae50;->o4(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic Y3(Ll/ae50;Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ae50;->u4(Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;)V

    return-void
.end method

.method public static synthetic Z3(Ll/ae50;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ae50;->v4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic a4(Ll/ae50;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ae50;->z4(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method

.method public static synthetic b4()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic c4(Ll/ae50;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ae50;->m4(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic d4(Ll/ae50;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ae50;->k4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;)V

    return-void
.end method

.method public static synthetic e4(Ll/ae50;Ljava/lang/String;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ae50;->y4(Ljava/lang/String;Ll/pf60;)V

    return-void
.end method

.method public static synthetic f4(Ll/ae50;Ll/jsv;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ae50;->p4(Ll/jsv;)V

    return-void
.end method

.method public static synthetic g4(Ll/ae50;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ae50;->t4()V

    return-void
.end method

.method private h4(ZLjava/lang/String;Z)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ll/mc50;

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/vp20;->m()Ll/jsv;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1}, Ll/jsv;->c()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-nez p1, :cond_2

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Ll/mc50;

    .line 24
    .line 25
    sget-object p1, Ll/v9s;->e:Ll/v9s;

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ll/vp20;->h(Ll/jsv;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    new-instance p1, Ll/z310;

    .line 32
    .line 33
    const/16 v0, 0xa28

    .line 34
    .line 35
    invoke-direct {p1, v0}, Ll/z310;-><init>(I)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0, p1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    check-cast p1, Ll/h0m;

    .line 43
    .line 44
    if-eqz p1, :cond_1

    .line 45
    .line 46
    invoke-interface {p1}, Ll/h0m;->b()V

    .line 47
    .line 48
    .line 49
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    check-cast p1, Ll/mc50;

    .line 54
    .line 55
    invoke-virtual {p1}, Ll/vp20;->m()Ll/jsv;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {p1}, Ll/jsv;->c()Z

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    if-nez p1, :cond_2

    .line 64
    .line 65
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    check-cast p0, Ll/mc50;

    .line 70
    .line 71
    new-instance p1, Ll/v9s;

    .line 72
    .line 73
    invoke-direct {p1, p2, p3}, Ll/v9s;-><init>(Ljava/lang/String;Z)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0, p1}, Ll/vp20;->h(Ll/jsv;)V

    .line 77
    .line 78
    .line 79
    :cond_2
    return-void
.end method

.method private i4(ILcom/p1/mobile/android/app/c;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne p2, v0, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    if-ne p1, v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Ll/mc50;

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/vp20;->k()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    const-string p2, "manual"

    .line 20
    .line 21
    invoke-virtual {p0, v1, p1, p2}, Ll/ae50;->N4(ZLjava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->k:Lcom/p1/mobile/android/app/c;

    .line 26
    .line 27
    if-ne p2, v0, :cond_1

    .line 28
    .line 29
    const/4 p2, 0x4

    .line 30
    if-ne p1, p2, :cond_1

    .line 31
    .line 32
    invoke-virtual {p0, v1}, Ll/ae50;->Q4(Z)V

    .line 33
    .line 34
    .line 35
    :cond_1
    return-void
.end method

.method private k4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;)V
    .locals 5

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->type:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/4 v2, 0x0

    .line 11
    const/4 v3, 0x1

    .line 12
    const/4 v4, -0x1

    .line 13
    sparse-switch v1, :sswitch_data_0

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :sswitch_0
    const-string v1, "delete_manager"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 v4, 0x6

    .line 27
    goto :goto_0

    .line 28
    :sswitch_1
    const-string v1, "forbidden_multidevice"

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    const/4 v4, 0x5

    .line 38
    goto :goto_0

    .line 39
    :sswitch_2
    const-string v1, "force_stop"

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_2

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    const/4 v4, 0x4

    .line 49
    goto :goto_0

    .line 50
    :sswitch_3
    const-string v1, "stop"

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-nez v0, :cond_3

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_3
    const/4 v4, 0x3

    .line 60
    goto :goto_0

    .line 61
    :sswitch_4
    const-string v1, "re_request_room_gift_list"

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-nez v0, :cond_4

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_4
    const/4 v4, 0x2

    .line 71
    goto :goto_0

    .line 72
    :sswitch_5
    const-string v1, "system"

    .line 73
    .line 74
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-nez v0, :cond_5

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_5
    move v4, v3

    .line 82
    goto :goto_0

    .line 83
    :sswitch_6
    const-string v1, "add_manager"

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    if-nez v0, :cond_6

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_6
    move v4, v2

    .line 93
    :goto_0
    packed-switch v4, :pswitch_data_0

    .line 94
    .line 95
    .line 96
    goto/16 :goto_1

    .line 97
    .line 98
    :pswitch_0
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->isAnchor:Z

    .line 99
    .line 100
    if-nez p1, :cond_7

    .line 101
    .line 102
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    check-cast p1, Ll/mc50;

    .line 107
    .line 108
    invoke-virtual {p1}, Ll/vp20;->k()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    invoke-static {p1, v2}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->L7(Ljava/lang/String;Z)Lrx/c;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    new-instance v0, Ll/zd50;

    .line 121
    .line 122
    invoke-direct {v0, p0}, Ll/zd50;-><init>(Ll/ae50;)V

    .line 123
    .line 124
    .line 125
    new-instance p0, Ll/dd50;

    .line 126
    .line 127
    invoke-direct {p0}, Ll/dd50;-><init>()V

    .line 128
    .line 129
    .line 130
    invoke-static {v0, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 135
    .line 136
    .line 137
    return-void

    .line 138
    :cond_7
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->T5:I

    .line 143
    .line 144
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    invoke-direct {p0, v3, p1, v2}, Ll/ae50;->h4(ZLjava/lang/String;Z)V

    .line 149
    .line 150
    .line 151
    return-void

    .line 152
    :pswitch_1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->content:Ljava/lang/String;

    .line 153
    .line 154
    invoke-direct {p0, v3, p1, v3}, Ll/ae50;->h4(ZLjava/lang/String;Z)V

    .line 155
    .line 156
    .line 157
    return-void

    .line 158
    :pswitch_2
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 159
    .line 160
    .line 161
    move-result-object p1

    .line 162
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->f6:I

    .line 163
    .line 164
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    invoke-direct {p0, v3, p1, v3}, Ll/ae50;->h4(ZLjava/lang/String;Z)V

    .line 169
    .line 170
    .line 171
    return-void

    .line 172
    :pswitch_3
    invoke-static {v2}, Ll/muj;->w(Z)V

    .line 173
    .line 174
    .line 175
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 176
    .line 177
    .line 178
    move-result-object p1

    .line 179
    if-eqz p1, :cond_8

    .line 180
    .line 181
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 182
    .line 183
    .line 184
    move-result-object p1

    .line 185
    check-cast p1, Ll/mc50;

    .line 186
    .line 187
    invoke-virtual {p1}, Ll/mc50;->S2()Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;

    .line 188
    .line 189
    .line 190
    move-result-object p1

    .line 191
    if-eqz p1, :cond_8

    .line 192
    .line 193
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 194
    .line 195
    .line 196
    move-result-object p1

    .line 197
    check-cast p1, Ll/mc50;

    .line 198
    .line 199
    new-instance v0, Ll/uxj$a;

    .line 200
    .line 201
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 202
    .line 203
    .line 204
    move-result-object v1

    .line 205
    check-cast v1, Ll/mc50;

    .line 206
    .line 207
    invoke-virtual {v1}, Ll/vp20;->o()Ljava/lang/String;

    .line 208
    .line 209
    .line 210
    move-result-object v1

    .line 211
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 212
    .line 213
    .line 214
    move-result-object v2

    .line 215
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 216
    .line 217
    .line 218
    move-result-object p0

    .line 219
    check-cast p0, Ll/mc50;

    .line 220
    .line 221
    invoke-virtual {p0}, Ll/oo2;->j0()Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object p0

    .line 225
    invoke-static {v2, p0}, Ll/mc50;->R2(Ll/oo2;Ljava/lang/String;)Ljava/lang/String;

    .line 226
    .line 227
    .line 228
    move-result-object p0

    .line 229
    const-string v2, "live"

    .line 230
    .line 231
    invoke-direct {v0, v1, p0, v2}, Ll/uxj$a;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 232
    .line 233
    .line 234
    invoke-virtual {v0}, Ll/uxj$a;->f()Ll/uxj;

    .line 235
    .line 236
    .line 237
    move-result-object p0

    .line 238
    const/4 v0, 0x0

    .line 239
    invoke-virtual {p1, p0, v0}, Ll/oo2;->A1(Ll/uxj;Ll/y20;)V

    .line 240
    .line 241
    .line 242
    :cond_8
    :goto_1
    return-void

    .line 243
    :pswitch_4
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->content:Ljava/lang/String;

    .line 244
    .line 245
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 246
    .line 247
    .line 248
    move-result-object v1

    .line 249
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->y5:I

    .line 250
    .line 251
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 252
    .line 253
    .line 254
    move-result-object v1

    .line 255
    iget p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->templateId:I

    .line 256
    .line 257
    new-instance v2, Ll/yd50;

    .line 258
    .line 259
    invoke-direct {v2}, Ll/yd50;-><init>()V

    .line 260
    .line 261
    .line 262
    invoke-direct {p0, v0, v1, p1, v2}, Ll/ae50;->J4(Ljava/lang/String;Ljava/lang/String;ILl/x20;)V

    .line 263
    .line 264
    .line 265
    return-void

    .line 266
    :pswitch_5
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 267
    .line 268
    .line 269
    move-result-object p1

    .line 270
    check-cast p1, Ll/mc50;

    .line 271
    .line 272
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 273
    .line 274
    .line 275
    move-result-object p0

    .line 276
    check-cast p0, Ll/mc50;

    .line 277
    .line 278
    invoke-virtual {p0}, Ll/vp20;->o()Ljava/lang/String;

    .line 279
    .line 280
    .line 281
    move-result-object p0

    .line 282
    invoke-virtual {p1, p0}, Ll/dw40;->K1(Ljava/lang/String;)V

    .line 283
    .line 284
    .line 285
    return-void

    .line 286
    nop

    .line 287
    :sswitch_data_0
    .sparse-switch
        -0x7f9401f1 -> :sswitch_6
        -0x34e38dd1 -> :sswitch_5
        -0x33a7a8db -> :sswitch_4
        0x360802 -> :sswitch_3
        0x80850d6 -> :sswitch_2
        0x169d3189 -> :sswitch_1
        0x40206119 -> :sswitch_0
    .end sparse-switch

    .line 288
    .line 289
    .line 290
    .line 291
    .line 292
    .line 293
    .line 294
    .line 295
    .line 296
    .line 297
    .line 298
    .line 299
    .line 300
    .line 301
    .line 302
    .line 303
    .line 304
    .line 305
    .line 306
    .line 307
    .line 308
    .line 309
    .line 310
    .line 311
    .line 312
    .line 313
    .line 314
    .line 315
    .line 316
    .line 317
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_5
    .end packed-switch
.end method

.method private l4()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/mc50;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/vp20;->m()Ll/jsv;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/jsv;->g()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method private synthetic m4(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ae50;->H4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic n4(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ae50;->j4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final synthetic A4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic B4(ZLcom/p1/mobile/putong/live/base/data/BLive;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/mc50;

    .line 6
    .line 7
    invoke-virtual {v0, p2}, Ll/vp20;->g(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    check-cast p2, Ll/mc50;

    .line 15
    .line 16
    sget-object v0, Ll/qcu;->b:Ll/qcu;

    .line 17
    .line 18
    invoke-virtual {p2, v0}, Ll/vp20;->h(Ll/jsv;)V

    .line 19
    .line 20
    .line 21
    new-instance p2, Ll/z310;

    .line 22
    .line 23
    const/16 v0, 0xa28

    .line 24
    .line 25
    invoke-direct {p2, v0}, Ll/z310;-><init>(I)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, p2}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    check-cast p2, Ll/h0m;

    .line 33
    .line 34
    if-eqz p2, :cond_0

    .line 35
    .line 36
    invoke-interface {p2}, Ll/h0m;->b()V

    .line 37
    .line 38
    .line 39
    :cond_0
    const/4 p2, 0x2

    .line 40
    iput p2, p0, Ll/ae50;->j:I

    .line 41
    .line 42
    if-eqz p1, :cond_1

    .line 43
    .line 44
    invoke-virtual {p0}, Ll/xzs;->H2()Lcom/p1/mobile/android/app/Frag;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-direct {p0, p2, p1}, Ll/ae50;->i4(ILcom/p1/mobile/android/app/c;)V

    .line 53
    .line 54
    .line 55
    :cond_1
    return-void
.end method

.method public final synthetic C4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const/4 p1, -0x2

    .line 2
    iput p1, p0, Ll/ae50;->j:I

    .line 3
    .line 4
    return-void
.end method

.method public E4(Ljava/lang/Throwable;Z)V
    .locals 3

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 2
    .line 3
    if-eqz v0, :cond_c

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 6
    .line 7
    iget v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 8
    .line 9
    const v1, 0xa030

    .line 10
    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    if-eq v0, v1, :cond_a

    .line 14
    .line 15
    const v1, 0xa03c

    .line 16
    .line 17
    .line 18
    if-ne v0, v1, :cond_0

    .line 19
    .line 20
    goto/16 :goto_2

    .line 21
    .line 22
    :cond_0
    const p1, 0xa028

    .line 23
    .line 24
    .line 25
    if-eq v0, p1, :cond_9

    .line 26
    .line 27
    const p1, 0xa02a

    .line 28
    .line 29
    .line 30
    if-ne v0, p1, :cond_1

    .line 31
    .line 32
    goto/16 :goto_1

    .line 33
    .line 34
    :cond_1
    const p1, 0xa032

    .line 35
    .line 36
    .line 37
    if-ne v0, p1, :cond_2

    .line 38
    .line 39
    invoke-direct {p0}, Ll/ae50;->L4()V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_2
    const p1, 0xa02d

    .line 44
    .line 45
    .line 46
    if-ne v0, p1, :cond_3

    .line 47
    .line 48
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->H2:I

    .line 53
    .line 54
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    goto/16 :goto_3

    .line 59
    .line 60
    :cond_3
    const p1, 0xa036

    .line 61
    .line 62
    .line 63
    if-eq v0, p1, :cond_8

    .line 64
    .line 65
    const p1, 0xa039

    .line 66
    .line 67
    .line 68
    if-eq v0, p1, :cond_8

    .line 69
    .line 70
    const p1, 0xa03a

    .line 71
    .line 72
    .line 73
    if-ne v0, p1, :cond_4

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_4
    const p1, 0xa037

    .line 77
    .line 78
    .line 79
    if-ne v0, p1, :cond_5

    .line 80
    .line 81
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->cb:I

    .line 86
    .line 87
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    goto :goto_3

    .line 92
    :cond_5
    const p1, 0xa031

    .line 93
    .line 94
    .line 95
    if-ne v0, p1, :cond_6

    .line 96
    .line 97
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->P:I

    .line 102
    .line 103
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    goto :goto_3

    .line 108
    :cond_6
    const p1, 0xa052

    .line 109
    .line 110
    .line 111
    if-ne v0, p1, :cond_7

    .line 112
    .line 113
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->G2:I

    .line 118
    .line 119
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    new-instance v2, Ll/md50;

    .line 124
    .line 125
    invoke-direct {v2, p0}, Ll/md50;-><init>(Ll/ae50;)V

    .line 126
    .line 127
    .line 128
    goto :goto_3

    .line 129
    :cond_7
    const-string p1, ""

    .line 130
    .line 131
    goto :goto_3

    .line 132
    :cond_8
    :goto_0
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->x:I

    .line 137
    .line 138
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    goto :goto_3

    .line 143
    :cond_9
    :goto_1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->f6:I

    .line 148
    .line 149
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    invoke-direct {p0}, Ll/ae50;->l4()Z

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    if-eqz v0, :cond_b

    .line 158
    .line 159
    new-instance v2, Ll/ld50;

    .line 160
    .line 161
    invoke-direct {v2, p0}, Ll/ld50;-><init>(Ll/ae50;)V

    .line 162
    .line 163
    .line 164
    goto :goto_3

    .line 165
    :cond_a
    :goto_2
    iget-object p1, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 166
    .line 167
    :cond_b
    :goto_3
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 168
    .line 169
    .line 170
    move-result v0

    .line 171
    if-nez v0, :cond_c

    .line 172
    .line 173
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 174
    .line 175
    .line 176
    move-result-object p2

    .line 177
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 178
    .line 179
    .line 180
    move-result-object p2

    .line 181
    invoke-virtual {p2, p1}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 182
    .line 183
    .line 184
    move-result-object p1

    .line 185
    const/4 p2, 0x0

    .line 186
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 187
    .line 188
    .line 189
    move-result-object p1

    .line 190
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 191
    .line 192
    .line 193
    move-result-object p0

    .line 194
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->o2:I

    .line 195
    .line 196
    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object p0

    .line 200
    new-instance p2, Ll/od50;

    .line 201
    .line 202
    invoke-direct {p2, v2}, Ll/od50;-><init>(Ll/x20;)V

    .line 203
    .line 204
    .line 205
    invoke-virtual {p1, p0, p2}, Lcom/p1/mobile/android/app/Dialog$e;->v0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 206
    .line 207
    .line 208
    move-result-object p0

    .line 209
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 210
    .line 211
    .line 212
    return-void

    .line 213
    :cond_c
    if-eqz p2, :cond_d

    .line 214
    .line 215
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->E9:I

    .line 216
    .line 217
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 218
    .line 219
    .line 220
    :cond_d
    return-void
.end method

.method public F4()V
    .locals 6

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/mc50;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/vp20;->m()Ll/jsv;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/jsv;->c()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-boolean v0, p0, Ll/ae50;->i:Z

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    const/4 v0, 0x1

    .line 24
    iput-boolean v0, p0, Ll/ae50;->i:Z

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iget-object v1, v1, Lcom/tantan/live/eventbus/LiveEventBus;->MomoSdkEvent:Lcom/tantan/live/eventbus/LiveEventBus$MomoSdkEvent;

    .line 31
    .line 32
    invoke-virtual {v1}, Lcom/tantan/live/eventbus/LiveEventBus$MomoSdkEvent;->sdkActionEvent()Ll/v3f$d;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    const/4 v2, 0x2

    .line 37
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-virtual {v1, v3}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    invoke-direct {p0}, Ll/ae50;->l4()Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    sget-object v3, Ll/v2t;->b:Ljava/lang/String;

    .line 49
    .line 50
    new-instance v4, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    const-string v5, "onResume:"

    .line 53
    .line 54
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    iget v5, p0, Ll/ae50;->j:I

    .line 58
    .line 59
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    const-string v5, ":"

    .line 63
    .line 64
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v4

    .line 74
    invoke-static {v3, v4}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    iget v3, p0, Ll/ae50;->j:I

    .line 78
    .line 79
    const/4 v4, -0x2

    .line 80
    if-eq v3, v4, :cond_3

    .line 81
    .line 82
    if-eq v3, v2, :cond_3

    .line 83
    .line 84
    if-eqz v1, :cond_2

    .line 85
    .line 86
    goto :goto_1

    .line 87
    :cond_2
    :goto_0
    return-void

    .line 88
    :cond_3
    :goto_1
    const/4 v1, 0x3

    .line 89
    iput v1, p0, Ll/ae50;->j:I

    .line 90
    .line 91
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    check-cast v1, Ll/mc50;

    .line 96
    .line 97
    invoke-virtual {v1}, Ll/vp20;->k()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    const-string v2, "manual"

    .line 102
    .line 103
    invoke-virtual {p0, v0, v1, v2}, Ll/ae50;->N4(ZLjava/lang/String;Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public G4()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/ae50;->i:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, 0x1

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->MomoSdkEvent:Lcom/tantan/live/eventbus/LiveEventBus$MomoSdkEvent;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$MomoSdkEvent;->sdkActionEvent()Ll/v3f$d;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v0, v2}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Ll/mc50;

    .line 37
    .line 38
    invoke-virtual {v0}, Ll/vp20;->m()Ll/jsv;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Ll/jsv;->d()Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-nez v0, :cond_1

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    iget v0, p0, Ll/ae50;->j:I

    .line 50
    .line 51
    const/4 v2, 0x4

    .line 52
    if-eq v0, v2, :cond_3

    .line 53
    .line 54
    const/4 v2, -0x3

    .line 55
    if-ne v0, v2, :cond_2

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_2
    :goto_0
    return-void

    .line 59
    :cond_3
    :goto_1
    invoke-virtual {p0, v1}, Ll/ae50;->Q4(Z)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public H4()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/mc50;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/vp20;->m()Ll/jsv;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/jsv;->c()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    const/4 v0, 0x3

    .line 19
    iput v0, p0, Ll/ae50;->j:I

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Ll/mc50;

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "manual"

    .line 32
    .line 33
    const/4 v2, 0x1

    .line 34
    invoke-virtual {p0, v2, v0, v1}, Ll/ae50;->N4(ZLjava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public M4(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ll/th0$a;

    .line 2
    .line 3
    iget-object v1, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p1, p2}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    new-instance p2, Ll/ed50;

    .line 17
    .line 18
    invoke-direct {p2, p0}, Ll/ed50;-><init>(Ll/ae50;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1, p2}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    sget p2, Ll/n9c0;->d:I

    .line 26
    .line 27
    invoke-virtual {p1, p2}, Ll/th0$a;->p(I)Ll/th0$a;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->z:I

    .line 36
    .line 37
    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p1, p0}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public N4(ZLjava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-static {p2, p3}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->L6(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    sget-object v0, Ll/lej0;->INSTANCE:Ll/lej0;

    .line 6
    .line 7
    const-string v1, "create_live_room"

    .line 8
    .line 9
    const-string v2, "createLive"

    .line 10
    .line 11
    invoke-virtual {v0, v1, v2}, Ll/lej0;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    new-instance v0, Ll/fd50;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Ll/fd50;-><init>(Ll/ae50;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p2, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    invoke-virtual {p0, p2}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    new-instance v0, Ll/gd50;

    .line 28
    .line 29
    invoke-direct {v0, p0, p3}, Ll/gd50;-><init>(Ll/ae50;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    new-instance p3, Ll/hd50;

    .line 33
    .line 34
    invoke-direct {p3, p0, p1}, Ll/hd50;-><init>(Ll/ae50;Z)V

    .line 35
    .line 36
    .line 37
    invoke-static {v0, p3}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final O4(Ljava/lang/String;Ll/pf60;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/live/base/data/BLive;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 p1, 0x4

    .line 2
    iput p1, p0, Ll/ae50;->j:I

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->H2()Lcom/p1/mobile/android/app/Frag;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-direct {p0, p1, v0}, Ll/ae50;->i4(ILcom/p1/mobile/android/app/c;)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p2, Ll/pf60;->b:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 18
    .line 19
    iget-object p2, p2, Ll/pf60;->a:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast p2, Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    check-cast p2, Ll/mc50;

    .line 28
    .line 29
    invoke-virtual {p2, p1}, Ll/vp20;->g(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 30
    .line 31
    .line 32
    sget-object p1, Ll/lej0;->INSTANCE:Ll/lej0;

    .line 33
    .line 34
    const-string p2, "create_live_room"

    .line 35
    .line 36
    const-string v0, "startLiveSuccess"

    .line 37
    .line 38
    invoke-virtual {p1, p2, v0}, Ll/lej0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    check-cast p0, Ll/mc50;

    .line 46
    .line 47
    sget-object p1, Ll/j2t;->c:Ll/j2t;

    .line 48
    .line 49
    invoke-virtual {p0, p1}, Ll/vp20;->h(Ll/jsv;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final P4(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->J6(Ljava/lang/String;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    new-instance v0, Ll/id50;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/id50;-><init>(Ll/ae50;)V

    .line 12
    .line 13
    .line 14
    new-instance v1, Ll/jd50;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/jd50;-><init>(Ll/ae50;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public Q4(Z)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/mc50;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/vp20;->m()Ll/jsv;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/jsv;->c()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    const/4 v0, 0x1

    .line 19
    iput v0, p0, Ll/ae50;->j:I

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Ll/mc50;

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const/4 v1, 0x0

    .line 32
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->L7(Ljava/lang/String;Z)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    new-instance v1, Ll/wd50;

    .line 37
    .line 38
    invoke-direct {v1, p0, p1}, Ll/wd50;-><init>(Ll/ae50;Z)V

    .line 39
    .line 40
    .line 41
    new-instance p1, Ll/xd50;

    .line 42
    .line 43
    invoke-direct {p1, p0}, Ll/xd50;-><init>(Ll/ae50;)V

    .line 44
    .line 45
    .line 46
    invoke-static {v1, p1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 51
    .line 52
    .line 53
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
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePusherEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;->recoverLive()Ll/v3f$c;

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
    new-instance v1, Ll/cd50;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/cd50;-><init>(Ll/ae50;)V

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
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePusherEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;->suspendLive()Ll/v3f$d;

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
    new-instance v1, Ll/nd50;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/nd50;-><init>(Ll/ae50;)V

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
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePusherEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;

    .line 73
    .line 74
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;->closeLive()Ll/v3f$c;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    check-cast v0, Lrx/c;

    .line 83
    .line 84
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    new-instance v1, Ll/sd50;

    .line 89
    .line 90
    invoke-direct {v1, p0}, Ll/sd50;-><init>(Ll/ae50;)V

    .line 91
    .line 92
    .line 93
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 98
    .line 99
    .line 100
    invoke-virtual {p0}, Ll/xzs;->H2()Lcom/p1/mobile/android/app/Frag;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->lifecycle()Lrx/c;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    new-instance v1, Ll/td50;

    .line 109
    .line 110
    invoke-direct {v1, p0}, Ll/td50;-><init>(Ll/ae50;)V

    .line 111
    .line 112
    .line 113
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 118
    .line 119
    .line 120
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    check-cast v0, Ll/mc50;

    .line 125
    .line 126
    invoke-virtual {v0}, Ll/vp20;->l()Lrx/c;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    new-instance v1, Ll/ud50;

    .line 135
    .line 136
    invoke-direct {v1, p0}, Ll/ud50;-><init>(Ll/ae50;)V

    .line 137
    .line 138
    .line 139
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 144
    .line 145
    .line 146
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    check-cast v0, Ll/mc50;

    .line 151
    .line 152
    iget-object v1, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 153
    .line 154
    invoke-virtual {v0, v1}, Ll/oo2;->o1(Lcom/p1/mobile/android/app/Act;)Lrx/c;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    new-instance v1, Ll/vd50;

    .line 159
    .line 160
    invoke-direct {v1, p0}, Ll/vd50;-><init>(Ll/ae50;)V

    .line 161
    .line 162
    .line 163
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 164
    .line 165
    .line 166
    move-result-object v1

    .line 167
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    iput-object v0, p0, Ll/ae50;->k:Ll/kcg0;

    .line 172
    .line 173
    return-void
.end method

.method public j4()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->b:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "\u662f\u5426\u7ed3\u675f\u516c\u6f14"

    .line 12
    .line 13
    invoke-virtual {p0, v1, v0}, Ll/ae50;->M4(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/ae50;->k:Ll/kcg0;

    .line 5
    .line 6
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic o4(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ae50;->F4()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->k:Lcom/p1/mobile/android/app/c;

    .line 10
    .line 11
    if-ne p1, v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/ae50;->G4()V

    .line 14
    .line 15
    .line 16
    :cond_1
    return-void
.end method

.method public final synthetic p4(Ll/jsv;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/jsv;->a()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x4

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    check-cast p1, Ll/v9s;

    .line 9
    .line 10
    invoke-direct {p0, p1}, Ll/ae50;->D4(Ll/v9s;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public final synthetic q4(Lcom/p1/mobile/putong/live/base/data/BLive;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->R5:I

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const/4 v0, 0x0

    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-direct {p0, v1, p1, v0}, Ll/ae50;->h4(ZLjava/lang/String;Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic r4()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    const/4 v2, 0x0

    .line 4
    invoke-direct {p0, v2, v0, v1}, Ll/ae50;->h4(ZLjava/lang/String;Z)V

    .line 5
    .line 6
    .line 7
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

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/vdu;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/vdu;-><init>()V

    .line 7
    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    iput v1, v0, Ll/vdu;->a:I

    .line 11
    .line 12
    const-string v1, "\u5df2\u5f00\u542f\u516c\u6f14\u51c6\u5907\u597d\u624d\u827a\u5427"

    .line 13
    .line 14
    iput-object v1, v0, Ll/vdu;->d:Ljava/lang/String;

    .line 15
    .line 16
    const-string v1, "\u77e5\u9053\u4e86"

    .line 17
    .line 18
    iput-object v1, v0, Ll/vdu;->e:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->LiveTipEvent:Lcom/tantan/live/eventbus/LiveEventBus$LiveTipEvent;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$LiveTipEvent;->showTip()Ll/v3f$d;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
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

.method public final synthetic u4(Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;)V
    .locals 5

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->status:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorStatus;

    .line 2
    .line 3
    const-string v1, "jailed"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->eb:I

    .line 24
    .line 25
    iget-wide v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->availableTime:D

    .line 26
    .line 27
    invoke-static {v3, v4}, Ll/pzi0;->p(D)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {v1, v2, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {v0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    const/4 v0, 0x0

    .line 44
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->o2:I

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    new-instance v1, Ll/rd50;

    .line 59
    .line 60
    invoke-direct {v1, p0}, Ll/rd50;-><init>(Ll/ae50;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->v0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 68
    .line 69
    .line 70
    :cond_0
    return-void
.end method

.method public final synthetic v4(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/ae50;->E4(Ljava/lang/Throwable;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic w4(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ll/mc50;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/mc50;->S2()Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowCurrentAnchorInfo;->programId:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll/ae50;->P4(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-object p0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final synthetic x4(ZLjava/lang/Throwable;)V
    .locals 1

    .line 1
    const/4 v0, -0x3

    .line 2
    iput v0, p0, Ll/ae50;->j:I

    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    invoke-virtual {p0, p2, v0}, Ll/ae50;->E4(Ljava/lang/Throwable;Z)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0, p2, p1}, Ll/ae50;->I4(Ljava/lang/Throwable;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic y4(Ljava/lang/String;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ae50;->O4(Ljava/lang/String;Ll/pf60;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic z4(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->OfficialShowEvent:Lcom/tantan/live/eventbus/LiveEventBus$OfficialShowEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$OfficialShowEvent;->switchOffAnchor()Ll/v3f$c;

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
