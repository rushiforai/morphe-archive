.class public Ll/kym0;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/rwn0;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Ll/kcg0;

.field public final j:Ll/ztk0;


# direct methods
.method public constructor <init>(Ll/dum;Ll/ztk0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/kym0;->j:Ll/ztk0;

    .line 5
    .line 6
    return-void
.end method

.method private A4()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/oxm0;

    .line 10
    .line 11
    invoke-direct {v1}, Ll/oxm0;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/pxm0;

    .line 19
    .line 20
    invoke-direct {v1}, Ll/pxm0;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/qxm0;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/qxm0;-><init>(Ll/kym0;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v1, Ll/rxm0;

    .line 41
    .line 42
    invoke-direct {v1, p0}, Ll/rxm0;-><init>(Ll/kym0;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    new-instance v1, Ll/sxm0;

    .line 50
    .line 51
    invoke-direct {v1, p0}, Ll/sxm0;-><init>(Ll/kym0;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    new-instance v1, Ll/txm0;

    .line 59
    .line 60
    invoke-direct {v1, p0}, Ll/txm0;-><init>(Ll/kym0;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    new-instance v1, Ll/uxm0;

    .line 68
    .line 69
    invoke-direct {v1, p0}, Ll/uxm0;-><init>(Ll/kym0;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    new-instance v1, Ll/wxm0;

    .line 77
    .line 78
    invoke-direct {v1, p0}, Ll/wxm0;-><init>(Ll/kym0;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    new-instance v1, Ll/xxm0;

    .line 86
    .line 87
    invoke-direct {v1, p0}, Ll/xxm0;-><init>(Ll/kym0;)V

    .line 88
    .line 89
    .line 90
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    iput-object v0, p0, Ll/kym0;->i:Ll/kcg0;

    .line 99
    .line 100
    return-void
.end method

.method private B4(Z)V
    .locals 1

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
    invoke-virtual {v0}, Ll/rwn0;->k3()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-direct {p0}, Ll/kym0;->i4()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    new-instance p1, Ll/yxm0;

    .line 21
    .line 22
    invoke-direct {p1, p0}, Ll/yxm0;-><init>(Ll/kym0;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, p1}, Ll/kym0;->h4(Ll/y20;)V

    .line 26
    .line 27
    .line 28
    iget-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 29
    .line 30
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/api/VCallApiProvider;->deputyGoBack(Ljava/lang/String;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iget-object p0, p0, Ll/kym0;->j:Ll/ztk0;

    .line 39
    .line 40
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    new-instance v0, Ll/cuk0;

    .line 44
    .line 45
    invoke-direct {v0, p0}, Ll/cuk0;-><init>(Ll/ztk0;)V

    .line 46
    .line 47
    .line 48
    new-instance p0, Ll/zxm0;

    .line 49
    .line 50
    invoke-direct {p0}, Ll/zxm0;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-static {v0, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_1
    iget-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 62
    .line 63
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/api/VCallApiProvider;->deputyGoAway(Ljava/lang/String;)Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    iget-object p0, p0, Ll/kym0;->j:Ll/ztk0;

    .line 72
    .line 73
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    new-instance v0, Ll/cuk0;

    .line 77
    .line 78
    invoke-direct {v0, p0}, Ll/cuk0;-><init>(Ll/ztk0;)V

    .line 79
    .line 80
    .line 81
    new-instance p0, Ll/aym0;

    .line 82
    .line 83
    invoke-direct {p0}, Ll/aym0;-><init>()V

    .line 84
    .line 85
    .line 86
    invoke-static {v0, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public static synthetic J3(Ll/kym0;Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kym0;->p4(Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic K3(Ll/kym0;Landroid/net/NetworkInfo;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kym0;->r4(Landroid/net/NetworkInfo;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic L3(Ll/kym0;Ll/ado0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kym0;->x4(Ll/ado0;)V

    return-void
.end method

.method public static synthetic M3(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/android/app/c;->a:Z

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic N3(Ll/kym0;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceStreamBizTypeMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kym0;->E4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceStreamBizTypeMessage;)V

    return-void
.end method

.method public static synthetic O3(Ll/kym0;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/kym0;->B4(Z)V

    return-void
.end method

.method public static synthetic P3(Ll/x8p0;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "callEffect"

    .line 2
    .line 3
    iget-object p0, p0, Ll/x8p0;->e:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

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

.method public static synthetic R3(Ll/kym0;Ll/x34;)Ll/q54;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kym0;->k4(Ll/x34;)Ll/q54;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic S3(Ll/kym0;Ll/bzm0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kym0;->D4(Ll/bzm0;)V

    return-void
.end method

.method public static synthetic T3(Ll/kym0;Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerUpdate;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kym0;->v4(Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerUpdate;)V

    return-void
.end method

.method public static synthetic U3(Ll/kym0;Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kym0;->n4(Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic V3(Ll/kym0;Ll/ado0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kym0;->z4(Ll/ado0;)V

    return-void
.end method

.method public static synthetic W3(Ll/kym0;Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kym0;->m4(Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic X3(Ll/kym0;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kym0;->u4(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic Y3(Ll/kym0;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kym0;->C4(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic Z3(Ll/kym0;Ll/x8p0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kym0;->w4(Ll/x8p0;)V

    return-void
.end method

.method public static synthetic a4(Landroid/net/NetworkInfo;)Ljava/lang/Boolean;
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

.method public static synthetic b4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic c4(Ll/kym0;Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kym0;->t4(Ljava/lang/Long;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic d4(Ll/kym0;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/kym0;->s4(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic e4(Ll/kym0;Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kym0;->q4(Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic f4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic g4(Ll/kym0;Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kym0;->o4(Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method private i4()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method private synthetic s4(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/kym0;->y4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final C4(Ljava/lang/Boolean;)V
    .locals 1

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
    invoke-virtual {v0}, Ll/rwn0;->i3()Z

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
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Ll/rwn0;

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {v0}, Ll/guk0;->h(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Ll/rwn0;

    .line 36
    .line 37
    invoke-virtual {v0}, Ll/rwn0;->k3()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    :goto_0
    return-void

    .line 44
    :cond_2
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-eqz p1, :cond_4

    .line 49
    .line 50
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    check-cast p1, Ll/rwn0;

    .line 55
    .line 56
    invoke-virtual {p1}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByAnchor:Z

    .line 61
    .line 62
    if-nez p1, :cond_4

    .line 63
    .line 64
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    check-cast p1, Ll/rwn0;

    .line 69
    .line 70
    invoke-virtual {p1}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByUser:Z

    .line 75
    .line 76
    if-eqz p1, :cond_3

    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_3
    const/4 p1, 0x0

    .line 80
    goto :goto_2

    .line 81
    :cond_4
    :goto_1
    const/4 p1, 0x1

    .line 82
    :goto_2
    invoke-static {p1, p0}, Ll/bbo0;->a(ZLl/i6t;)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public final D4(Ll/bzm0;)V
    .locals 3

    .line 1
    iget-object v0, p1, Ll/bzm0;->a:Ljava/lang/String;

    .line 2
    .line 3
    iget-boolean v1, p1, Ll/bzm0;->f:Z

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-nez v2, :cond_1

    .line 10
    .line 11
    const-string v2, "voice-manager"

    .line 12
    .line 13
    iget-object p1, p1, Ll/bzm0;->g:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 p1, 0x0

    .line 23
    goto :goto_1

    .line 24
    :cond_1
    :goto_0
    const/4 p1, 0x1

    .line 25
    :goto_1
    invoke-static {v0, v1, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/api/VCallApiProvider;->setMuteDeputy(Ljava/lang/String;ZZ)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iget-object p0, p0, Ll/kym0;->j:Ll/ztk0;

    .line 34
    .line 35
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    new-instance v0, Ll/cuk0;

    .line 39
    .line 40
    invoke-direct {v0, p0}, Ll/cuk0;-><init>(Ll/ztk0;)V

    .line 41
    .line 42
    .line 43
    new-instance p0, Ll/r5k;

    .line 44
    .line 45
    invoke-direct {p0}, Ll/r5k;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-static {v0, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public final E4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceStreamBizTypeMessage;)V
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "updateStreamBizType:"

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceStreamBizTypeMessage;->getBizType()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-string p1, "[voice][call]"

    .line 20
    .line 21
    invoke-static {p1, p0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public T()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/kym0;->A4()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public h4(Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ll/ado0;",
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
    check-cast v0, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/rwn0;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    invoke-virtual {p0}, Ll/kym0;->j4()Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    new-instance v0, Ll/r5k;

    .line 39
    .line 40
    invoke-direct {v0}, Ll/r5k;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-static {p1, v0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 48
    .line 49
    .line 50
    :cond_1
    :goto_0
    return-void
.end method

.method public final j4()Lrx/c;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/ado0;",
            ">;"
        }
    .end annotation

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
    invoke-virtual {v0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->isIncomerArea()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 v0, 0x0

    .line 22
    :goto_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Ll/rwn0;

    .line 27
    .line 28
    invoke-virtual {v1}, Ll/vp20;->o()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    check-cast v2, Ll/rwn0;

    .line 37
    .line 38
    invoke-virtual {v2}, Ll/rwn0;->W0()Z

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    check-cast v3, Ll/rwn0;

    .line 47
    .line 48
    invoke-virtual {v3}, Ll/vp20;->k()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    check-cast p0, Ll/rwn0;

    .line 57
    .line 58
    invoke-virtual {p0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->callNumbers:I

    .line 63
    .line 64
    invoke-static {v1, v2, v3, v0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/call/api/VCallApiProvider;->getRoomMembers(Ljava/lang/String;ZLjava/lang/String;ZI)Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    return-object p0
.end method

.method public final k4(Ll/x34;)Ll/q54;
    .locals 3

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
    invoke-virtual {v0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p1, Ll/x34;->c:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/hrk0;->l(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Ll/rwn0;

    .line 22
    .line 23
    invoke-virtual {v1}, Ll/rwn0;->P2()Ll/hrk0;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    iget-object p1, p1, Ll/x34;->c:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v1, p1}, Ll/hrk0;->n(Ljava/lang/String;)Ll/h64;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    iget-object v1, p1, Ll/h64;->a:Ljava/lang/String;

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
    invoke-virtual {p0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {v1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    if-eqz p0, :cond_0

    .line 56
    .line 57
    const-string p0, "gift-audience-none-voiceLiveMain"

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_0
    const-string p0, "gift-audience-none-voiceLiveVice"

    .line 61
    .line 62
    :goto_0
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 63
    .line 64
    iget v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 65
    .line 66
    invoke-static {v1, p0, v2}, Ll/p54;->b(Ljava/lang/String;Ljava/lang/String;I)Ll/p54;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    new-instance v1, Ll/q54;

    .line 71
    .line 72
    invoke-static {p1, p0}, Ll/coj;->c(Ll/h64;Ll/p54;)Ll/coj;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-static {v0}, Ll/guk0;->c(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-direct {v1, p0, p1}, Ll/q54;-><init>(Ll/coj;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    return-object v1

    .line 84
    :cond_1
    const/4 p0, 0x0

    .line 85
    return-object p0
.end method

.method public l4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/guk0;->h(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByAnchor:Z

    .line 8
    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByUser:Z

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p1, 0x0

    .line 17
    goto :goto_1

    .line 18
    :cond_1
    :goto_0
    const/4 p1, 0x1

    .line 19
    :goto_1
    invoke-static {p1, p0}, Ll/bbo0;->a(ZLl/i6t;)V

    .line 20
    .line 21
    .line 22
    :cond_2
    return-void
.end method

.method public final synthetic m4(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/kym0;->i4()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->state:Ljava/lang/String;

    .line 6
    .line 7
    const-string p1, "hung-up"

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    xor-int/lit8 p0, p0, 0x1

    .line 14
    .line 15
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/kym0;->i:Ll/kcg0;

    .line 5
    .line 6
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic n4(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public final synthetic o4(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/rwn0;->e3()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    xor-int/lit8 p0, p0, 0x1

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic p4(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/rwn0;->d3()Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final synthetic q4(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/kym0;->i4()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    xor-int/lit8 p0, p0, 0x1

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic r4(Landroid/net/NetworkInfo;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/kym0;->j4()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public t()V
    .locals 4

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->m()Lrx/c;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    move-result-object v0

    const/4 v2, 0x1

    .line 3
    invoke-virtual {v0, v2}, Lrx/c;->skip(I)Lrx/c;

    move-result-object v0

    new-instance v2, Ll/kxm0;

    invoke-direct {v2}, Ll/kxm0;-><init>()V

    .line 4
    invoke-virtual {v0, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    move-result-object v0

    new-instance v2, Ll/fym0;

    invoke-direct {v2, p0}, Ll/fym0;-><init>(Ll/kym0;)V

    .line 5
    invoke-virtual {v0, v2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    move-result-object v0

    new-instance v2, Ll/gym0;

    invoke-direct {v2, p0}, Ll/gym0;-><init>(Ll/kym0;)V

    new-instance v3, Ll/r5k;

    invoke-direct {v3}, Ll/r5k;-><init>()V

    .line 6
    invoke-static {v2, v3}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    move-result-object v2

    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 7
    new-instance v0, Ll/hym0;

    invoke-direct {v0, p0}, Ll/hym0;-><init>(Ll/kym0;)V

    const-class v2, Ll/x34;

    invoke-virtual {p0, v2, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 8
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    move-result-object v0

    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;

    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;->callMuteEvent()Ll/v3f$d;

    move-result-object v0

    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lrx/c;

    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    move-result-object v0

    new-instance v2, Ll/iym0;

    invoke-direct {v2, p0}, Ll/iym0;-><init>(Ll/kym0;)V

    .line 9
    invoke-static {v2}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    move-result-object v2

    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 10
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    move-result-object v0

    check-cast v0, Ll/rwn0;

    invoke-virtual {v0}, Ll/rwn0;->Z2()Lrx/c;

    move-result-object v0

    invoke-virtual {p0, v0, v1}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    move-result-object v0

    new-instance v2, Ll/jym0;

    invoke-direct {v2, p0}, Ll/jym0;-><init>(Ll/kym0;)V

    invoke-static {v2}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    move-result-object v2

    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 11
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    move-result-object v0

    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;

    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;->updateDeputyEvent()Ll/v3f$c;

    move-result-object v0

    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lrx/c;

    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    move-result-object v0

    new-instance v2, Ll/lxm0;

    invoke-direct {v2, p0}, Ll/lxm0;-><init>(Ll/kym0;)V

    .line 12
    invoke-static {v2}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    move-result-object v2

    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    const/4 v0, 0x3

    .line 13
    invoke-static {v0}, Ll/wft;->b(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 14
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    move-result-object v0

    invoke-virtual {v0}, Ll/vwt;->e6()I

    move-result v0

    .line 15
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    move-result-object v2

    check-cast v2, Ll/rwn0;

    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 16
    invoke-virtual {v2, v0, v3}, Ll/oo2;->h2(ILjava/util/concurrent/TimeUnit;)Lrx/c;

    move-result-object v0

    new-instance v2, Ll/mxm0;

    invoke-direct {v2, p0}, Ll/mxm0;-><init>(Ll/kym0;)V

    .line 17
    invoke-virtual {v0, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    move-result-object v0

    .line 18
    invoke-virtual {p0, v0}, Ll/i6t;->H3(Lrx/c;)Lrx/c;

    move-result-object v0

    new-instance v2, Ll/nxm0;

    invoke-direct {v2, p0}, Ll/nxm0;-><init>(Ll/kym0;)V

    .line 19
    invoke-static {v2}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    move-result-object v2

    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 20
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    move-result-object v0

    check-cast v0, Ll/rwn0;

    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    move-result-object v0

    iget-object v0, v0, Ll/aj1;->c0:Lrx/subjects/b;

    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    move-result-object v0

    new-instance v2, Ll/vxm0;

    invoke-direct {v2, p0}, Ll/vxm0;-><init>(Ll/kym0;)V

    .line 21
    invoke-static {v2}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    move-result-object v2

    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 22
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    move-result-object v0

    check-cast v0, Ll/rwn0;

    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    move-result-object v0

    invoke-virtual {v0}, Ll/aj1;->p1()Lrx/c;

    move-result-object v0

    invoke-virtual {p0, v0, v1}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    move-result-object v0

    new-instance v1, Ll/cym0;

    invoke-direct {v1, p0}, Ll/cym0;-><init>(Ll/kym0;)V

    .line 23
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    move-result-object v0

    check-cast v0, Ll/rwn0;

    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    move-result-object v0

    iget-object v0, v0, Ll/aj1;->S:Lrx/subjects/b;

    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    move-result-object v0

    new-instance v1, Ll/dym0;

    invoke-direct {v1}, Ll/dym0;-><init>()V

    .line 25
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    move-result-object v0

    new-instance v1, Ll/eym0;

    invoke-direct {v1, p0}, Ll/eym0;-><init>(Ll/kym0;)V

    .line 26
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    move-result-object p0

    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    return-void
.end method

.method public final synthetic t4(Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/rwn0;->g3()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    xor-int/lit8 p0, p0, 0x1

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic u4(Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/kym0;->y4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic v4(Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerUpdate;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/kym0;->y4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final w4(Ll/x8p0;)V
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
    invoke-virtual {v0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p1, Ll/x8p0;->c:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/hrk0;->l(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/x8p0;->a()Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iput-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->callEffect:Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    check-cast p0, Ll/rwn0;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0, v0}, Ll/hrk0;->C(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public final x4(Ll/ado0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/kym0;->j:Ll/ztk0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/ztk0;->l4(Ll/ado0;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/kym0;->j:Ll/ztk0;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ll/rwn0;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p1, p0}, Ll/ztk0;->e4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final y4()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/kym0;->j4()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p0, p0, Ll/kym0;->j:Ll/ztk0;

    .line 10
    .line 11
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    new-instance v1, Ll/bym0;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/bym0;-><init>(Ll/ztk0;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final z4(Ll/ado0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/kym0;->j:Ll/ztk0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/ztk0;->l4(Ll/ado0;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/kym0;->j:Ll/ztk0;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ll/rwn0;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p1, p0}, Ll/ztk0;->o4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
