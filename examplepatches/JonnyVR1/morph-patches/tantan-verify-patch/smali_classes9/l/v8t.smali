.class public Ll/v8t;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/oo2;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


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

.method public static synthetic J3(Ll/v8t;Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/v8t;->T3(Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)V

    return-void
.end method

.method public static synthetic K3(Ll/v8t;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/v8t;->U3(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic L3(Ll/v8t;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/v8t;->R3(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic M3(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;
    .locals 0

    .line 1
    invoke-static {p1, p0}, Ll/f3t;->d(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic N3(Ll/v8t;Ll/db20;)Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/v8t;->S3(Ll/db20;)Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    move-result-object p0

    return-object p0
.end method

.method private synthetic R3(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/v8t;->O3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final O3()V
    .locals 1

    .line 1
    sget-object v0, Ll/htd0;->c:Ll/htd0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/hiv;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/hiv;->e()V

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-object v0, p0, Ll/v8t;->i:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 14
    .line 15
    return-void
.end method

.method public final P3(Ljava/lang/String;)V
    .locals 9

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
    move-result-object v2

    .line 9
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Ll/vp20;->o()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v7

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
    iget-object v8, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 26
    .line 27
    const-string v5, "live"

    .line 28
    .line 29
    const-string v6, "live"

    .line 30
    .line 31
    move-object v3, p1

    .line 32
    move-object v4, p1

    .line 33
    move-object v1, p1

    .line 34
    invoke-static/range {v1 .. v8}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->t7(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    new-instance v0, Ll/t8t;

    .line 43
    .line 44
    invoke-direct {v0, v1}, Ll/t8t;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    new-instance v0, Ll/u8t;

    .line 52
    .line 53
    invoke-direct {v0, p0}, Ll/u8t;-><init>(Ll/v8t;)V

    .line 54
    .line 55
    .line 56
    invoke-static {v0}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public final synthetic S3(Ll/db20;)Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v8t;->i:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 2
    .line 3
    return-object p0
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
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->RoomMysteryEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$RoomMysteryEventGroup;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$RoomMysteryEventGroup;->setRoomFakeId()Ll/v3f$d;

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
    new-instance v1, Ll/q8t;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/q8t;-><init>(Ll/v8t;)V

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
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->RoomMysteryEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$RoomMysteryEventGroup;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$RoomMysteryEventGroup;->clearRoomFakeId()Ll/v3f$c;

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
    new-instance v1, Ll/r8t;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/r8t;-><init>(Ll/v8t;)V

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
    new-instance v0, Ll/s8t;

    .line 69
    .line 70
    invoke-direct {v0, p0}, Ll/s8t;-><init>(Ll/v8t;)V

    .line 71
    .line 72
    .line 73
    const-class v1, Ll/db20;

    .line 74
    .line 75
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public final synthetic T3(Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/v8t;->i:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 2
    .line 3
    return-void
.end method

.method public final U3(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/oo2;->A0()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "voice-live"

    .line 16
    .line 17
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    const-string v1, "setFakeId:"

    .line 27
    .line 28
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const-string v1, "[live]"

    .line 39
    .line 40
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    sget-object v0, Ll/htd0;->c:Ll/htd0;

    .line 44
    .line 45
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    check-cast v0, Ll/hiv;

    .line 50
    .line 51
    invoke-virtual {v0, p1}, Ll/hiv;->J(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0, p1}, Ll/v8t;->P3(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_1
    :goto_0
    invoke-virtual {p0}, Ll/v8t;->O3()V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public n()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/v8t;->i:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 6
    .line 7
    return-void
.end method
