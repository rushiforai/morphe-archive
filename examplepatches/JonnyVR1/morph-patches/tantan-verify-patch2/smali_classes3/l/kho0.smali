.class public Ll/kho0;
.super Ll/qct;
.source "SourceFile"

# interfaces
.implements Ll/c6m;
.implements Ll/pwl;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/jqm0;",
        ">;",
        "Ll/c6m;",
        "Ll/pwl;"
    }
.end annotation


# instance fields
.field public i:Ll/kcg0;

.field public final j:Ll/uxh0;

.field public k:Ll/eas;


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/kho0$a;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Ll/kho0$a;-><init>(Ll/kho0;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/kho0;->k:Ll/eas;

    .line 10
    .line 11
    new-instance p1, Ll/uxh0;

    .line 12
    .line 13
    invoke-direct {p1}, Ll/uxh0;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Ll/kho0;->j:Ll/uxh0;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->updatePlayer()Ll/v3f$d;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Lrx/c;

    .line 33
    .line 34
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    new-instance v1, Ll/gho0;

    .line 38
    .line 39
    invoke-direct {v1, p1}, Ll/gho0;-><init>(Ll/uxh0;)V

    .line 40
    .line 41
    .line 42
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {v0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    iput-object p1, p0, Ll/kho0;->i:Ll/kcg0;

    .line 51
    .line 52
    return-void
.end method

.method public static synthetic J3(Ll/kho0;Ll/jsv;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kho0;->R3(Ll/jsv;)V

    return-void
.end method

.method public static synthetic K3(Ll/kho0;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/kho0;->P3(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    return-void
.end method

.method public static synthetic L3(Ll/kho0;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kho0;->S3(Ljava/lang/Long;)V

    return-void
.end method

.method public static bridge synthetic M3(Ll/kho0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/kho0;->U3()V

    return-void
.end method

.method private O3()V
    .locals 3

    .line 1
    new-instance v0, Ll/z310;

    .line 2
    .line 3
    const/16 v1, 0x1130

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
    invoke-interface {v0}, Ll/h0m;->a()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;->MOTION_VOICE_AUDIENCE:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->c1(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Ll/jqm0;

    .line 34
    .line 35
    const/16 v1, 0xa

    .line 36
    .line 37
    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 38
    .line 39
    invoke-virtual {v0, v1, v2}, Ll/oo2;->h2(ILjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p0, v0}, Ll/i6t;->H3(Lrx/c;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    new-instance v1, Ll/iho0;

    .line 48
    .line 49
    invoke-direct {v1, p0}, Ll/iho0;-><init>(Ll/kho0;)V

    .line 50
    .line 51
    .line 52
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_1
    :goto_0
    const-string p0, "[voice][call]"

    .line 61
    .line 62
    const-string v0, "rtc has started, needn\'t pull video stream"

    .line 63
    .line 64
    invoke-static {p0, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method private P3(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V
    .locals 6

    .line 1
    new-instance v0, Ll/wod0;

    .line 2
    .line 3
    const v1, 0x9c41

    .line 4
    .line 5
    .line 6
    invoke-direct {v0, v1}, Ll/wod0;-><init>(I)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ljava/lang/Boolean;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    const-string p0, "[voice][call]"

    .line 22
    .line 23
    const-string p1, "join rtc ,can`t play cdn voice stream "

    .line 24
    .line 25
    invoke-static {p0, p1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    iget-object v0, p0, Ll/kho0;->j:Ll/uxh0;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Ll/jqm0;

    .line 36
    .line 37
    invoke-virtual {v1}, Ll/vp20;->x()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    check-cast v1, Ll/jqm0;

    .line 46
    .line 47
    invoke-virtual {v1}, Ll/oo2;->o0()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v5

    .line 51
    const/4 v2, 0x0

    .line 52
    move-object v3, p0

    .line 53
    move-object v1, p1

    .line 54
    invoke-virtual/range {v0 .. v5}, Ll/uxh0;->o(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Landroid/widget/FrameLayout;Ll/pwl;Ljava/lang/String;Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    new-instance p1, Ljava/lang/StringBuilder;

    .line 59
    .line 60
    const-string v0, "voice player result:"

    .line 61
    .line 62
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    const-string p1, "[live]voicePlayer"

    .line 73
    .line 74
    invoke-static {p1, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method private T3()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Ll/jqm0;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 19
    .line 20
    iget-boolean v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->useCurrentPullStream:Z

    .line 21
    .line 22
    if-nez v1, :cond_0

    .line 23
    .line 24
    iget-object v1, p0, Ll/kho0;->j:Ll/uxh0;

    .line 25
    .line 26
    invoke-virtual {v1}, Ll/uxh0;->k()Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    const-string p0, "[live]voicePlayer"

    .line 33
    .line 34
    const-string v0, "useCurrentPull : false, isStartPlay:true"

    .line 35
    .line 36
    invoke-static {p0, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    invoke-direct {p0, v0}, Ll/kho0;->P3(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method private U3()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/kho0;->j:Ll/uxh0;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, v0}, Ll/uxh0;->u(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public D0()V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/wg80;->e(Ll/i6t;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final N3(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/lti;->f()Z

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
    iget-object p0, p0, Ll/kho0;->j:Ll/uxh0;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/uxh0;->e(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public O()V
    .locals 0

    .line 1
    return-void
.end method

.method public O0(Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->callVolumeChanged()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final R3(Ll/jsv;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/jsv;->a()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x2

    .line 6
    if-eq p1, v0, :cond_1

    .line 7
    .line 8
    const/4 v0, 0x4

    .line 9
    if-eq p1, v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    const-string p1, "[live]voicePlayer"

    .line 13
    .line 14
    const-string v0, "stop player when live end"

    .line 15
    .line 16
    invoke-static {p1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-direct {p0}, Ll/kho0;->U3()V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    invoke-direct {p0}, Ll/kho0;->T3()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final synthetic S3(Ljava/lang/Long;)V
    .locals 1

    .line 1
    const-string p1, "[live]voicePlayer"

    .line 2
    .line 3
    const-string v0, "audience retryConnect"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Ll/jqm0;

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/vp20;->k()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-static {p1}, Ll/itv;->L(Ljava/lang/String;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    new-instance v0, Ll/jho0;

    .line 27
    .line 28
    invoke-direct {v0, p0}, Ll/jho0;-><init>(Ll/kho0;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v0}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    const-string v0, "voice"

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/kho0;->N3(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ll/jqm0;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/vp20;->l()Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Ll/hho0;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/hho0;-><init>(Ll/kho0;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    new-instance v0, Ll/w1f;

    .line 36
    .line 37
    const/16 v1, 0x708

    .line 38
    .line 39
    invoke-direct {v0, v1}, Ll/w1f;-><init>(I)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Ll/wsl;

    .line 47
    .line 48
    iget-object p0, p0, Ll/kho0;->k:Ll/eas;

    .line 49
    .line 50
    invoke-interface {v0, p0}, Ll/wsl;->b(Ll/w6m;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public f2()V
    .locals 0

    .line 1
    return-void
.end method

.method public l0(I)V
    .locals 0

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
    invoke-virtual {p1}, Ll/vp20;->r()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-direct {p0}, Ll/kho0;->O3()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public m1()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/kho0;->i:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/kho0;->j:Ll/uxh0;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/uxh0;->f()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public n()V
    .locals 2

    .line 1
    const-string v0, "[live]voicePlayer"

    .line 2
    .line 3
    const-string v1, "stop player when detach"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/kho0;->j:Ll/uxh0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/uxh0;->v()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/kho0;->j:Ll/uxh0;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/uxh0;->x()V

    .line 16
    .line 17
    .line 18
    invoke-super {p0}, Ll/i6t;->n()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public p1(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public q0()V
    .locals 1

    .line 1
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 2
    .line 3
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->K9:I

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 v0, 0x1

    .line 10
    invoke-static {p0, v0}, Ll/o1j0;->A(Ljava/lang/String;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public s1(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public u1()V
    .locals 0

    .line 1
    return-void
.end method
