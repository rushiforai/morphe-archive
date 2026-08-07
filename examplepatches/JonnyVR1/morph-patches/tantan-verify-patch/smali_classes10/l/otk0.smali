.class public Ll/otk0;
.super Ll/ztk0;
.source "SourceFile"


# instance fields
.field public o:Ljava/lang/String;

.field public p:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/ztk0;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Ll/otk0;->p:Ljava/lang/String;

    .line 7
    .line 8
    new-instance v0, Ll/kwm0;

    .line 9
    .line 10
    invoke-direct {v0, p1}, Ll/kwm0;-><init>(Ll/dum;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Ll/r1n0;

    .line 18
    .line 19
    iput-object p1, p0, Ll/ztk0;->k:Ll/r1n0;

    .line 20
    .line 21
    return-void
.end method

.method private synthetic E4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/otk0;->k4()Z

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private K4(Ll/jsv;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/jsv;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/jsv;->b()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    :cond_0
    new-instance v0, Ll/bzm0;

    .line 14
    .line 15
    invoke-direct {v0}, Ll/bzm0;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Ll/rwn0;

    .line 23
    .line 24
    invoke-virtual {v1}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iput-object v1, v0, Ll/bzm0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 29
    .line 30
    sget-object v1, Ll/ptk0;->a:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {p0, v0, v1}, Ll/ztk0;->b4(Ll/bzm0;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Ll/rwn0;

    .line 40
    .line 41
    invoke-virtual {v0}, Ll/rwn0;->m3()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_2

    .line 46
    .line 47
    invoke-virtual {p1}, Ll/jsv;->c()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_2

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/otk0;->k4()Z

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_2
    invoke-virtual {p1}, Ll/jsv;->b()Z

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    if-eqz p1, :cond_3

    .line 62
    .line 63
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    check-cast p1, Ll/rwn0;

    .line 68
    .line 69
    invoke-virtual {p1}, Ll/rwn0;->m3()Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-eqz p1, :cond_3

    .line 74
    .line 75
    invoke-virtual {p0}, Ll/otk0;->k4()Z

    .line 76
    .line 77
    .line 78
    :cond_3
    return-void
.end method

.method public static synthetic q4(Ll/otk0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/otk0;->E4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic r4(Ll/otk0;Ll/jsv;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/otk0;->K4(Ll/jsv;)V

    return-void
.end method

.method public static synthetic s4(Ll/otk0;Ll/jsv;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/otk0;->J4(Ll/jsv;)V

    return-void
.end method

.method public static synthetic t4(Ll/otk0;Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/otk0;->G4(Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V

    return-void
.end method

.method public static synthetic u4(Ll/otk0;Ll/wod0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/otk0;->I4(Ll/wod0;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic v4(Ll/otk0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/otk0;->H4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    return-void
.end method

.method public static synthetic w4(Ll/otk0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/otk0;->F4()V

    return-void
.end method


# virtual methods
.method public final A4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/guk0;->l(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Ll/otk0;->o:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll/ztk0;->X3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-object p1, p0, Ll/ztk0;->i:Ll/fuk0;

    .line 20
    .line 21
    iget-object v0, p0, Ll/otk0;->o:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Ll/fuk0;->S3(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    :cond_1
    :goto_0
    invoke-virtual {p0}, Ll/otk0;->M4()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final B4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/guk0;->l(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {p1}, Ll/guk0;->f(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    :cond_0
    invoke-virtual {p0}, Ll/otk0;->k4()Z

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ll/otk0;->L4()V

    .line 17
    .line 18
    .line 19
    :cond_1
    invoke-virtual {p0}, Ll/otk0;->M4()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final C4()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/otk0;->o:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    return p0
.end method

.method public final D4()V
    .locals 2

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
    if-eqz v0, :cond_0

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
    const-string p0, "[voice][call]"

    .line 29
    .line 30
    const-string v0, "rtc has started, skip this step"

    .line 31
    .line 32
    invoke-static {p0, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    invoke-virtual {p0}, Ll/otk0;->L4()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final synthetic F4()V
    .locals 2

    .line 1
    new-instance v0, Ll/itk0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/itk0;-><init>(Ll/otk0;)V

    .line 4
    .line 5
    .line 6
    const-string v1, ""

    .line 7
    .line 8
    invoke-virtual {p0, v1, v0}, Ll/ztk0;->h4(Ljava/lang/String;Ll/y20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic G4(Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V
    .locals 3

    .line 1
    sget-object v0, Ll/lej0;->INSTANCE:Ll/lej0;

    .line 2
    .line 3
    const-string v1, "voice_audience_res_loading"

    .line 4
    .line 5
    const-string v2, "voice audience res check"

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Ll/lej0;->a(Ljava/lang/String;Ljava/lang/String;)V

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
    invoke-virtual {p0, p1}, Ll/otk0;->y4(Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-interface {v0, p0}, Ll/h0m;->d(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;)I

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final synthetic H4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 1

    .line 1
    const-string p1, "[live]voiceEntry"

    .line 2
    .line 3
    const-string v0, "getRoomCallObs --- joinRtc "

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/otk0;->D4()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic I4(Ll/wod0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/otk0;->C4()Z

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

.method public final J4(Ll/jsv;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/jsv;->d()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/otk0;->D4()V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-virtual {p0}, Ll/ztk0;->g4()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final L4()V
    .locals 4

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
    invoke-static {v0}, Ll/guk0;->e(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->c()Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const-string v2, "android.permission.RECORD_AUDIO"

    .line 22
    .line 23
    filled-new-array {v2}, [Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->r([Ljava/lang/String;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    const/4 v2, 0x0

    .line 32
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->w(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    const/4 v3, 0x1

    .line 37
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->u(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->j(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    new-instance v2, Ll/htk0;

    .line 46
    .line 47
    invoke-direct {v2, p0}, Ll/htk0;-><init>(Ll/otk0;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->o(Ll/x20;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    new-instance v2, Ll/otk0$a;

    .line 55
    .line 56
    invoke-direct {v2, p0, v0}, Ll/otk0$a;-><init>(Ll/otk0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->p(Ll/j6e;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    iget-object p0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 64
    .line 65
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->i(Landroid/app/Activity;)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_0
    new-instance v0, Ll/itk0;

    .line 70
    .line 71
    invoke-direct {v0, p0}, Ll/itk0;-><init>(Ll/otk0;)V

    .line 72
    .line 73
    .line 74
    const-string v1, ""

    .line 75
    .line 76
    invoke-virtual {p0, v1, v0}, Ll/ztk0;->h4(Ljava/lang/String;Ll/y20;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public M4()V
    .locals 2

    .line 1
    new-instance v0, Ll/z310;

    .line 2
    .line 3
    const/16 v1, 0x2328

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
    if-nez v0, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-interface {v0}, Ll/h0m;->a()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;->MOTION_VOICE_AUDIENCE:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->c1(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_1

    .line 30
    .line 31
    const-class v1, Ll/frm0;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->T0(Ljava/lang/Class;)Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Ll/frm0;

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    check-cast p0, Ll/rwn0;

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-static {p0}, Ll/guk0;->h(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    invoke-virtual {v0, p0}, Ll/zs2;->z1(Z)V

    .line 54
    .line 55
    .line 56
    :cond_1
    :goto_0
    return-void
.end method

.method public S3()Ljava/lang/String;
    .locals 2

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-super {p0}, Ll/ztk0;->S3()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0

    .line 13
    :cond_0
    invoke-virtual {p0}, Ll/otk0;->z4()Ll/jqm0;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ll/jqm0;->Y3()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Ll/rwn0;

    .line 26
    .line 27
    invoke-virtual {v1}, Ll/vp20;->o()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {p0, v0, v1}, Ll/otk0;->x4(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ztk0;->T()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    instance-of v0, v0, Ll/jqm0;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ll/jqm0;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/jqm0;->c4()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    const-string v0, "[live]voiceEntry"

    .line 25
    .line 26
    const-string v1, "rtc\u8fdb\u623f\u4f18\u5316\uff0c\u7b26\u5408\u6761\u4ef6\uff0c\u5f00\u59cb\u8bf7\u6c42token "

    .line 27
    .line 28
    invoke-static {v0, v1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Ll/jqm0;

    .line 36
    .line 37
    invoke-virtual {v0}, Ll/jqm0;->W3()Lrx/subjects/b;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    new-instance v1, Ll/gtk0;

    .line 46
    .line 47
    invoke-direct {v1, p0}, Ll/gtk0;-><init>(Ll/otk0;)V

    .line 48
    .line 49
    .line 50
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, Ll/otk0;->D4()V

    .line 58
    .line 59
    .line 60
    :cond_0
    return-void
.end method

.method public T3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/otk0;->p:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/otk0;->p:Ljava/lang/String;

    .line 10
    .line 11
    const-string v1, "tencent"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-virtual {p0, p1}, Ll/otk0;->A4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_1
    :goto_0
    invoke-virtual {p0, p1}, Ll/otk0;->B4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public V3()V
    .locals 2

    .line 1
    const-string v0, "[voice][call]"

    .line 2
    .line 3
    const-string v1, "handlePushError"

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
    invoke-virtual {v0}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {p0, v0}, Ll/ydn0;->f(Ll/i6t;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 19
    .line 20
    .line 21
    const-string v0, ""

    .line 22
    .line 23
    iput-object v0, p0, Ll/otk0;->o:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/otk0;->L4()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public W3(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/ztk0;->W3(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    sget-object p1, Ll/zrv;->a:Ll/wrv;

    .line 17
    .line 18
    invoke-virtual {p1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const-string p1, ""

    .line 24
    .line 25
    :goto_0
    iput-object p1, p0, Ll/otk0;->o:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/otk0;->M4()V

    .line 28
    .line 29
    .line 30
    sget-object p0, Ll/lej0;->INSTANCE:Ll/lej0;

    .line 31
    .line 32
    const-string p1, "voice_enter_room_rtc"

    .line 33
    .line 34
    const-string v0, "onLocalJoinChannel"

    .line 35
    .line 36
    invoke-virtual {p0, p1, v0}, Ll/lej0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public c4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 2

    .line 1
    const-string v0, "[voice][call]"

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const-string v1, "hung-up"

    .line 10
    .line 11
    iput-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->state:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/ztk0;->m4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->H1:I

    .line 19
    .line 20
    const-string v1, ""

    .line 21
    .line 22
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {p0, p1, v1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    const-string p0, "upper mic  rtc failed"

    .line 34
    .line 35
    invoke-static {v0, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    const-string p0, "join voice init rtc failed"

    .line 40
    .line 41
    invoke-static {v0, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public j4(Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V
    .locals 4

    .line 1
    sget-object v0, Ll/lej0;->INSTANCE:Ll/lej0;

    .line 2
    .line 3
    const-string v1, "voice_enter_room_rtc"

    .line 4
    .line 5
    const-string v2, "got rtc token"

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Ll/lej0;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->rtcProvider:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, p0, Ll/otk0;->p:Ljava/lang/String;

    .line 13
    .line 14
    new-instance v1, Ll/z310;

    .line 15
    .line 16
    const/16 v2, 0x2328

    .line 17
    .line 18
    invoke-direct {v1, v2}, Ll/z310;-><init>(I)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Ll/h0m;

    .line 26
    .line 27
    invoke-interface {v1}, Ll/h0m;->a()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    if-eqz v1, :cond_0

    .line 32
    .line 33
    sget-object v2, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;->MOTION_VOICE_AUDIENCE:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;

    .line 34
    .line 35
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->c1(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_0

    .line 40
    .line 41
    iget-object p0, p0, Ll/ztk0;->i:Ll/fuk0;

    .line 42
    .line 43
    sget-object p1, Ll/zrv;->a:Ll/wrv;

    .line 44
    .line 45
    invoke-virtual {p1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {p0, p1}, Ll/fuk0;->S3(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_0
    const-string v1, "voice_audience_res_loading"

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ll/lej0;->d(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 59
    .line 60
    sget-object v1, Ll/iit;->Companion:Ll/iit$a;

    .line 61
    .line 62
    invoke-virtual {v1}, Ll/iit$a;->S()I

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->gj:I

    .line 67
    .line 68
    new-instance v3, Ll/ntk0;

    .line 69
    .line 70
    invoke-direct {v3, p0, p1}, Ll/ntk0;-><init>(Ll/otk0;Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V

    .line 71
    .line 72
    .line 73
    invoke-static {v0, v1, v2, v3}, Ll/wgt;->q(Lcom/p1/mobile/android/app/Act;IILl/x20;)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public k4()Z
    .locals 3

    .line 1
    new-instance v0, Ll/z310;

    .line 2
    .line 3
    const/16 v1, 0x2328

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
    if-eqz v0, :cond_0

    .line 15
    .line 16
    const-string v1, "[voice][call]"

    .line 17
    .line 18
    const-string v2, "voice deputy stop motion push"

    .line 19
    .line 20
    invoke-static {v1, v2}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-interface {v0}, Ll/h0m;->b()V

    .line 24
    .line 25
    .line 26
    const-string v0, ""

    .line 27
    .line 28
    iput-object v0, p0, Ll/otk0;->o:Ljava/lang/String;

    .line 29
    .line 30
    const/4 p0, 0x1

    .line 31
    return p0

    .line 32
    :cond_0
    const/4 p0, 0x0

    .line 33
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
    invoke-virtual {p0}, Ll/otk0;->k4()Z

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public o4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/otk0;->M4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ztk0;->t()V

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
    invoke-virtual {v0}, Ll/vp20;->l()Lrx/c;

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
    new-instance v1, Ll/jtk0;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/jtk0;-><init>(Ll/otk0;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Ll/rwn0;

    .line 35
    .line 36
    invoke-virtual {v0}, Ll/rwn0;->u()Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    new-instance v1, Ll/ktk0;

    .line 45
    .line 46
    invoke-direct {v1, p0}, Ll/ktk0;-><init>(Ll/otk0;)V

    .line 47
    .line 48
    .line 49
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    check-cast v0, Ll/rwn0;

    .line 61
    .line 62
    invoke-virtual {v0}, Ll/rwn0;->Z2()Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    const/4 v1, 0x1

    .line 71
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    new-instance v1, Ll/ltk0;

    .line 76
    .line 77
    invoke-direct {v1, p0}, Ll/ltk0;-><init>(Ll/otk0;)V

    .line 78
    .line 79
    .line 80
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0}, Ll/otk0;->C4()Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-nez v0, :cond_0

    .line 92
    .line 93
    const-string v0, "[live]voiceEntry"

    .line 94
    .line 95
    const-string v1, "validState --- joinRtc "

    .line 96
    .line 97
    invoke-static {v0, v1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {p0}, Ll/otk0;->D4()V

    .line 101
    .line 102
    .line 103
    :cond_0
    new-instance v0, Ll/mtk0;

    .line 104
    .line 105
    invoke-direct {v0, p0}, Ll/mtk0;-><init>(Ll/otk0;)V

    .line 106
    .line 107
    .line 108
    const-class v1, Ll/wod0;

    .line 109
    .line 110
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 111
    .line 112
    .line 113
    return-void
.end method

.method public final x4(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    return-object p1

    .line 8
    :cond_0
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-nez p0, :cond_1

    .line 13
    .line 14
    return-object p2

    .line 15
    :cond_1
    const-string p0, ""

    .line 16
    .line 17
    return-object p0
.end method

.method public final y4(Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;
    .locals 17

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p0}, Ll/otk0;->z4()Ll/jqm0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Ll/jqm0;->c4()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    new-instance v2, Ll/grm0;

    .line 14
    .line 15
    invoke-virtual/range {p0 .. p0}, Ll/otk0;->z4()Ll/jqm0;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1}, Ll/jqm0;->X3()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    invoke-virtual/range {p0 .. p0}, Ll/otk0;->z4()Ll/jqm0;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v1}, Ll/jqm0;->Y3()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    invoke-virtual/range {p0 .. p0}, Ll/otk0;->z4()Ll/jqm0;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v1}, Ll/jqm0;->V3()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v5

    .line 39
    invoke-virtual/range {p0 .. p0}, Ll/otk0;->z4()Ll/jqm0;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v1}, Ll/jqm0;->U3()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v6

    .line 47
    iget-object v7, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->rtcProvider:Ljava/lang/String;

    .line 48
    .line 49
    iget-object v8, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->appId:Ljava/lang/String;

    .line 50
    .line 51
    iget-object v9, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->channelKey:Ljava/lang/String;

    .line 52
    .line 53
    iget-object v10, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->channel:Ljava/lang/String;

    .line 54
    .line 55
    iget-object v11, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->userSig:Ljava/lang/String;

    .line 56
    .line 57
    iget-object v12, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->reverbAppKey:Ljava/lang/String;

    .line 58
    .line 59
    iget-object v13, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->reverbToken:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual/range {p0 .. p0}, Ll/xzs;->E2()Ll/oo2;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    check-cast v0, Ll/rwn0;

    .line 66
    .line 67
    invoke-virtual {v0}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-static {v0}, Ll/guk0;->h(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 72
    .line 73
    .line 74
    move-result v14

    .line 75
    invoke-virtual/range {p0 .. p0}, Ll/ztk0;->R3()Ll/z20;

    .line 76
    .line 77
    .line 78
    move-result-object v15

    .line 79
    invoke-direct/range {v2 .. v15}, Ll/grm0;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLl/z20;)V

    .line 80
    .line 81
    .line 82
    return-object v2

    .line 83
    :cond_0
    new-instance v3, Ll/grm0;

    .line 84
    .line 85
    invoke-virtual/range {p0 .. p0}, Ll/xzs;->E2()Ll/oo2;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    check-cast v1, Ll/rwn0;

    .line 90
    .line 91
    invoke-virtual {v1}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 96
    .line 97
    iget-object v4, v1, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->push:Ljava/lang/String;

    .line 98
    .line 99
    invoke-virtual/range {p0 .. p0}, Ll/xzs;->E2()Ll/oo2;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    check-cast v1, Ll/rwn0;

    .line 104
    .line 105
    invoke-virtual {v1}, Ll/vp20;->o()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v5

    .line 109
    invoke-virtual/range {p0 .. p0}, Ll/xzs;->E2()Ll/oo2;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    check-cast v1, Ll/rwn0;

    .line 114
    .line 115
    invoke-virtual {v1}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 120
    .line 121
    iget v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;->provider:I

    .line 122
    .line 123
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v6

    .line 127
    invoke-virtual/range {p0 .. p0}, Ll/xzs;->E2()Ll/oo2;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    check-cast v1, Ll/rwn0;

    .line 132
    .line 133
    invoke-virtual {v1}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 138
    .line 139
    iget v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;->businessType:I

    .line 140
    .line 141
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v7

    .line 145
    iget-object v8, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->rtcProvider:Ljava/lang/String;

    .line 146
    .line 147
    iget-object v9, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->appId:Ljava/lang/String;

    .line 148
    .line 149
    iget-object v10, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->channelKey:Ljava/lang/String;

    .line 150
    .line 151
    iget-object v11, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->channel:Ljava/lang/String;

    .line 152
    .line 153
    iget-object v12, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->userSig:Ljava/lang/String;

    .line 154
    .line 155
    iget-object v13, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->reverbAppKey:Ljava/lang/String;

    .line 156
    .line 157
    iget-object v14, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->reverbToken:Ljava/lang/String;

    .line 158
    .line 159
    invoke-virtual/range {p0 .. p0}, Ll/xzs;->E2()Ll/oo2;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    check-cast v0, Ll/rwn0;

    .line 164
    .line 165
    invoke-virtual {v0}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    invoke-static {v0}, Ll/guk0;->h(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 170
    .line 171
    .line 172
    move-result v15

    .line 173
    invoke-virtual/range {p0 .. p0}, Ll/ztk0;->R3()Ll/z20;

    .line 174
    .line 175
    .line 176
    move-result-object v16

    .line 177
    invoke-direct/range {v3 .. v16}, Ll/grm0;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLl/z20;)V

    .line 178
    .line 179
    .line 180
    return-object v3
.end method

.method public final z4()Ll/jqm0;
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
    return-object p0
.end method
