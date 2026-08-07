.class public Ll/urk0;
.super Ll/ztk0;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/ztk0;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/uum0;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ll/uum0;-><init>(Ll/dum;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ll/r1n0;

    .line 14
    .line 15
    iput-object v0, p0, Ll/ztk0;->k:Ll/r1n0;

    .line 16
    .line 17
    new-instance v0, Ll/qym0;

    .line 18
    .line 19
    invoke-direct {v0, p1}, Ll/qym0;-><init>(Ll/dum;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic q4(Ll/urk0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSnapShot;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/urk0;->y4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSnapShot;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic r4(Ll/urk0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/urk0;->u4()V

    return-void
.end method

.method public static synthetic s4(Ll/urk0;Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/urk0;->z4(Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V

    return-void
.end method

.method public static synthetic t4(Ll/urk0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/urk0;->v4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    return-void
.end method

.method private w4()V
    .locals 3

    .line 1
    const-string v0, "[voice][call]"

    .line 2
    .line 3
    const-string v1, "receive server code to end live"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

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
    invoke-virtual {v0}, Ll/vp20;->m()Ll/jsv;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Ll/jsv;->c()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    check-cast p0, Ll/rwn0;

    .line 29
    .line 30
    new-instance v0, Ll/v9s;

    .line 31
    .line 32
    const/4 v1, 0x0

    .line 33
    const/4 v2, 0x1

    .line 34
    invoke-direct {v0, v1, v2}, Ll/v9s;-><init>(Ljava/lang/String;Z)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, v0}, Ll/vp20;->h(Ll/jsv;)V

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method


# virtual methods
.method public final A4()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->F9:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->D(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->bc:I

    .line 16
    .line 17
    new-instance v2, Ll/srk0;

    .line 18
    .line 19
    invoke-direct {v2, p0}, Ll/srk0;-><init>(Ll/urk0;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public T3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/guk0;->l(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/ztk0;->X3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-static {p1}, Ll/guk0;->f(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/urk0;->k4()Z

    .line 18
    .line 19
    .line 20
    :cond_1
    return-void
.end method

.method public U3(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const v0, 0xa02a

    .line 2
    .line 3
    .line 4
    invoke-static {p1, v0}, Ll/r35;->a(Ljava/lang/Throwable;I)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-direct {p0}, Ll/urk0;->w4()V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const v0, 0xa4d8

    .line 15
    .line 16
    .line 17
    invoke-static {p1, v0}, Ll/r35;->a(Ljava/lang/Throwable;I)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 24
    .line 25
    iget-object p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    invoke-virtual {p0}, Ll/urk0;->A4()V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public V3()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/urk0;->U3(Ljava/lang/Throwable;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public c4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    new-instance p1, Ljava/lang/Throwable;

    .line 2
    .line 3
    invoke-direct {p1}, Ljava/lang/Throwable;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/urk0;->U3(Ljava/lang/Throwable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public j4(Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V
    .locals 4

    .line 1
    sget-object v0, Ll/lej0;->INSTANCE:Ll/lej0;

    .line 2
    .line 3
    const-string v1, "voice_anchor_call"

    .line 4
    .line 5
    const-string v2, "joinVoice"

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Ll/lej0;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    new-instance v0, Ll/z310;

    .line 11
    .line 12
    const/16 v1, 0x2328

    .line 13
    .line 14
    invoke-direct {v0, v1}, Ll/z310;-><init>(I)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Ll/h0m;

    .line 22
    .line 23
    invoke-interface {v0}, Ll/h0m;->a()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;->MOTION_VOICE_ANCHOR:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->c1(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 39
    .line 40
    sget-object v1, Ll/iit;->Companion:Ll/iit$a;

    .line 41
    .line 42
    invoke-virtual {v1}, Ll/iit$a;->S()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->gj:I

    .line 47
    .line 48
    new-instance v3, Ll/trk0;

    .line 49
    .line 50
    invoke-direct {v3, p0, p1}, Ll/trk0;-><init>(Ll/urk0;Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V

    .line 51
    .line 52
    .line 53
    invoke-static {v0, v1, v2, v3}, Ll/wgt;->q(Lcom/p1/mobile/android/app/Act;IILl/x20;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public k4()Z
    .locals 2

    .line 1
    const-string v0, "[voice][call]"

    .line 2
    .line 3
    const-string v1, "stopMotionPush"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Ll/z310;

    .line 9
    .line 10
    const/16 v1, 0x2328

    .line 11
    .line 12
    invoke-direct {v0, v1}, Ll/z310;-><init>(I)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Ll/h0m;

    .line 20
    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    invoke-interface {p0}, Ll/h0m;->a()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;->MOTION_VOICE_ANCHOR:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->c1(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    invoke-interface {p0}, Ll/h0m;->b()V

    .line 36
    .line 37
    .line 38
    const/4 p0, 0x1

    .line 39
    return p0

    .line 40
    :cond_0
    const/4 p0, 0x0

    .line 41
    return p0
.end method

.method public n()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/ztk0;->n()V

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
    invoke-virtual {v0}, Ll/rwn0;->k3()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/urk0;->k4()Z

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ztk0;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/urk0;->x4()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSnapShot;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Ll/rwn0;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->bossState:Ljava/lang/String;

    .line 21
    .line 22
    const-string v1, "anchor-away"

    .line 23
    .line 24
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    return-void

    .line 32
    :cond_1
    :goto_0
    invoke-virtual {p0}, Ll/urk0;->u4()V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final u4()V
    .locals 5

    .line 1
    sget-object v0, Ll/lej0;->INSTANCE:Ll/lej0;

    .line 2
    .line 3
    const-string v1, "voice_anchor_call"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/lej0;->d(Ljava/lang/String;)V

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
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const/4 v1, 0x0

    .line 19
    const-string v2, "owner"

    .line 20
    .line 21
    const-string v3, ""

    .line 22
    .line 23
    const-string v4, "apply"

    .line 24
    .line 25
    invoke-static {v0, v3, v4, v1, v2}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->newInstance(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/call/api/VCallApiProvider;->applyCallInvite(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    new-instance v1, Ll/qrk0;

    .line 38
    .line 39
    invoke-direct {v1, p0}, Ll/qrk0;-><init>(Ll/urk0;)V

    .line 40
    .line 41
    .line 42
    new-instance v2, Ll/rrk0;

    .line 43
    .line 44
    invoke-direct {v2, p0}, Ll/rrk0;-><init>(Ll/urk0;)V

    .line 45
    .line 46
    .line 47
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public final v4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 3

    .line 1
    sget-object v0, Ll/lej0;->INSTANCE:Ll/lej0;

    .line 2
    .line 3
    const-string v1, "voice_anchor_call"

    .line 4
    .line 5
    const-string v2, "applySuccess"

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Ll/lej0;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p0, p1}, Ll/ydn0;->q(Ll/i6t;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final x4()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSnapShot;
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
    invoke-virtual {v0}, Ll/rwn0;->O2()Ll/szn0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/szn0;->c()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->callInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInfo;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInfo;->onVoiceCalls:Ljava/util/List;

    .line 18
    .line 19
    new-instance v1, Ll/prk0;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/prk0;-><init>(Ll/urk0;)V

    .line 22
    .line 23
    .line 24
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSnapShot;

    .line 29
    .line 30
    return-object p0
.end method

.method public final synthetic y4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSnapShot;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSnapShot;->user:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/rwn0;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public final synthetic z4(Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V
    .locals 14

    .line 1
    new-instance v0, Ll/z310;

    .line 2
    .line 3
    const/16 v1, 0x2774

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/z310;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Ll/h0m;

    .line 13
    .line 14
    new-instance v1, Ll/llm0;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    check-cast v2, Ll/rwn0;

    .line 21
    .line 22
    invoke-virtual {v2}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 27
    .line 28
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->push:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    check-cast v3, Ll/rwn0;

    .line 35
    .line 36
    invoke-virtual {v3}, Ll/vp20;->o()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    check-cast v4, Ll/rwn0;

    .line 45
    .line 46
    invoke-virtual {v4}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 47
    .line 48
    .line 49
    move-result-object v4

    .line 50
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 51
    .line 52
    iget v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;->provider:I

    .line 53
    .line 54
    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 59
    .line 60
    .line 61
    move-result-object v5

    .line 62
    check-cast v5, Ll/rwn0;

    .line 63
    .line 64
    invoke-virtual {v5}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 65
    .line 66
    .line 67
    move-result-object v5

    .line 68
    iget-object v5, v5, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 69
    .line 70
    iget v5, v5, Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;->businessType:I

    .line 71
    .line 72
    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v5

    .line 76
    iget-object v6, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->rtcProvider:Ljava/lang/String;

    .line 77
    .line 78
    iget-object v7, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->appId:Ljava/lang/String;

    .line 79
    .line 80
    iget-object v8, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->channelKey:Ljava/lang/String;

    .line 81
    .line 82
    iget-object v9, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->channel:Ljava/lang/String;

    .line 83
    .line 84
    iget-object v10, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->userSig:Ljava/lang/String;

    .line 85
    .line 86
    iget-object v11, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->reverbAppKey:Ljava/lang/String;

    .line 87
    .line 88
    iget-object v12, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->reverbToken:Ljava/lang/String;

    .line 89
    .line 90
    invoke-virtual {p0}, Ll/ztk0;->R3()Ll/z20;

    .line 91
    .line 92
    .line 93
    move-result-object v13

    .line 94
    invoke-direct/range {v1 .. v13}, Ll/llm0;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/z20;)V

    .line 95
    .line 96
    .line 97
    invoke-interface {v0, v1}, Ll/h0m;->d(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;)I

    .line 98
    .line 99
    .line 100
    return-void
.end method
