.class public Ll/zmo0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/yvl;


# instance fields
.field public a:Ll/uem0;

.field public b:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Landroid/util/Pair<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation
.end field

.field public c:Ll/c0m;

.field public d:Ll/rwn0;

.field public e:Z

.field public f:Ll/kwr;

.field public g:Ll/pa1;


# direct methods
.method public constructor <init>(Ll/uem0;Ll/rwn0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/zmo0;->b:Lrx/subjects/a;

    .line 9
    .line 10
    iput-object p1, p0, Ll/zmo0;->a:Ll/uem0;

    .line 11
    .line 12
    iput-object p2, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 13
    .line 14
    return-void
.end method

.method private D()Ll/uam;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zmo0;->a:Ll/uem0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/uem0;->g()Ll/uam;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic a(Ll/zmo0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zmo0;->w0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    return-void
.end method

.method public static synthetic b(Ll/zmo0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zmo0;->a0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/VoiceLiveInfoMessage;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/VoiceLiveInfoMessage;->template:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d(Ll/zmo0;Landroid/net/NetworkInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zmo0;->Y(Landroid/net/NetworkInfo;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic e(Ll/gvn0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/gvn0;->e()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/guk0;->j(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

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

.method private e0()V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ll/zmo0;->t0(Z)V

    .line 3
    .line 4
    .line 5
    invoke-direct {p0}, Ll/zmo0;->D()Ll/uam;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 16
    .line 17
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 18
    .line 19
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->sj:I

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-interface {v0, p0, v1}, Ll/uam;->d(Ll/oo2;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-interface {v0}, Ll/uam;->a()V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public static synthetic f(Ll/zmo0;Ll/vxj0;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zmo0;->b0(Ll/vxj0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method private f0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/rwn0;->p()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    iget-object v2, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 8
    .line 9
    invoke-virtual {v2}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v0, v1, v2}, Ll/oo2;->e2(ZLcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/zmo0;->c:Ll/c0m;

    .line 17
    .line 18
    invoke-interface {v0}, Ll/c0m;->d()Ll/h0m;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-interface {v0}, Ll/h0m;->a()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;->MOTION_VOICE_AUDIENCE:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->c1(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    iget-object v0, p0, Ll/zmo0;->c:Ll/c0m;

    .line 35
    .line 36
    invoke-interface {v0}, Ll/c0m;->d()Ll/h0m;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-interface {v0}, Ll/h0m;->a()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;->MOTION_VOICE_ANCHOR:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->c1(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-nez v0, :cond_1

    .line 51
    .line 52
    :cond_0
    invoke-direct {p0}, Ll/zmo0;->p0()V

    .line 53
    .line 54
    .line 55
    :cond_1
    invoke-direct {p0}, Ll/zmo0;->D()Ll/uam;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-eqz v1, :cond_2

    .line 64
    .line 65
    iget-object p0, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 66
    .line 67
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 68
    .line 69
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Mi:I

    .line 70
    .line 71
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-interface {v0, p0, v1}, Ll/uam;->d(Ll/oo2;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    invoke-interface {v0}, Ll/uam;->c()V

    .line 79
    .line 80
    .line 81
    :cond_2
    return-void
.end method

.method public static synthetic g(Ll/zmo0;Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zmo0;->T(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;)V

    return-void
.end method

.method public static synthetic h(Ll/zmo0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zmo0;->d0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic i(Ll/zmo0;Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceChangeRoomBg$VoiceRoomBgPicUpdateMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zmo0;->S(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceChangeRoomBg$VoiceRoomBgPicUpdateMessage;)V

    return-void
.end method

.method public static synthetic j(Lrx/c;)Lrx/c;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic k(Ll/zmo0;ILcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/zmo0;->Q(ILcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;)V

    return-void
.end method

.method public static synthetic l(Ll/zmo0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zmo0;->u0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    return-void
.end method

.method public static synthetic m(Ll/zmo0;Ll/ugd0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zmo0;->x(Ll/ugd0;)V

    return-void
.end method

.method public static synthetic n(Ll/zmo0;Landroid/net/NetworkInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zmo0;->Z(Landroid/net/NetworkInfo;)V

    return-void
.end method

.method public static synthetic o(Ll/zmo0;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveTemplateMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zmo0;->W(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveTemplateMessage;)V

    return-void
.end method

.method public static synthetic p(Ll/zmo0;Ll/jsv;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zmo0;->G(Ll/jsv;)V

    return-void
.end method

.method private p0()V
    .locals 3

    .line 1
    const-string v0, "[live][voiceWindow]"

    .line 2
    .line 3
    const-string v1, "requestRtcTokenEnterRoom:"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Ll/iit;->Companion:Ll/iit$a;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/iit$a;->S()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/4 v1, 0x0

    .line 15
    new-array v1, v1, [Ljava/lang/Object;

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    invoke-static {v0, v2, v1}, Ll/wgt;->p(ILcom/p1/mobile/android/app/Act;[Ljava/lang/Object;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p0, v0}, Ll/zmo0;->L1(Lrx/c;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/mmo0;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/mmo0;-><init>(Ll/zmo0;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    new-instance v1, Ll/nmo0;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Ll/nmo0;-><init>(Ll/zmo0;)V

    .line 38
    .line 39
    .line 40
    new-instance v2, Ll/kmo0;

    .line 41
    .line 42
    invoke-direct {v2, p0}, Ll/kmo0;-><init>(Ll/zmo0;)V

    .line 43
    .line 44
    .line 45
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public static synthetic q(Ll/zmo0;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceSwitchLiveMode$VoiceLiveModeMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zmo0;->V(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceSwitchLiveMode$VoiceLiveModeMessage;)V

    return-void
.end method

.method public static synthetic r(Ll/zmo0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zmo0;->X(Ljava/lang/String;)V

    return-void
.end method

.method private r0()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x1

    .line 8
    const/4 v2, 0x0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-boolean v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByAnchor:Z

    .line 18
    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-boolean v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByUser:Z

    .line 28
    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    :cond_0
    move v0, v1

    .line 32
    goto :goto_0

    .line 33
    :cond_1
    move v0, v2

    .line 34
    :goto_0
    iget-boolean v3, p0, Ll/zmo0;->e:Z

    .line 35
    .line 36
    if-eqz v3, :cond_3

    .line 37
    .line 38
    if-eqz v0, :cond_2

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_2
    move v0, v2

    .line 42
    goto :goto_2

    .line 43
    :cond_3
    :goto_1
    move v0, v1

    .line 44
    :goto_2
    new-instance v3, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    const-string v4, "set local Mute:"

    .line 47
    .line 48
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    const-string v4, "[live][voiceWindow]"

    .line 59
    .line 60
    invoke-static {v4, v3}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    iget-object v3, p0, Ll/zmo0;->c:Ll/c0m;

    .line 64
    .line 65
    if-eqz v0, :cond_4

    .line 66
    .line 67
    invoke-interface {v3}, Ll/c0m;->e()Ll/xzl;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-interface {p0, v1}, Ll/xzl;->i0(Z)V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_4
    invoke-interface {v3}, Ll/c0m;->e()Ll/xzl;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-interface {v0, v2}, Ll/xzl;->n(Z)V

    .line 80
    .line 81
    .line 82
    iget-object p0, p0, Ll/zmo0;->c:Ll/c0m;

    .line 83
    .line 84
    invoke-interface {p0}, Ll/c0m;->e()Ll/xzl;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-interface {p0, v2}, Ll/xzl;->i0(Z)V

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method public static synthetic s(Ll/zmo0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zmo0;->U(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;)V

    return-void
.end method

.method public static synthetic t(Landroid/net/NetworkInfo;)Ljava/lang/Boolean;
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

.method public static synthetic u(Ll/zmo0;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zmo0;->F(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic v(Ll/zmo0;Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/zmo0;->x0(Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V

    return-void
.end method

.method public static synthetic w(Ll/zmo0;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zmo0;->R(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;)V

    return-void
.end method

.method private x0(Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v1, "updateRtcToken :"

    .line 6
    .line 7
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->channelKey:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "[live][voiceWindow]"

    .line 20
    .line 21
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Ll/zmo0;->c:Ll/c0m;

    .line 25
    .line 26
    invoke-interface {p0}, Ll/c0m;->e()Ll/xzl;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->channelKey:Ljava/lang/String;

    .line 31
    .line 32
    invoke-interface {p0, p1}, Ll/xzl;->o(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method private z(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;)V
    .locals 3

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;->playInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->userId:Ljava/lang/String;

    .line 9
    .line 10
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    goto :goto_1

    .line 21
    :cond_1
    :goto_0
    const/4 p1, 0x0

    .line 22
    :goto_1
    if-eqz p1, :cond_2

    .line 23
    .line 24
    iget-object p0, p0, Ll/zmo0;->g:Ll/pa1;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/pa1;->d()V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_2
    iget-object p1, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 31
    .line 32
    invoke-virtual {p1}, Ll/rwn0;->P2()Ll/hrk0;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 37
    .line 38
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {p1, v0}, Ll/hrk0;->m(Ljava/lang/String;)Ll/nsv;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-static {p1}, Ll/l6o0;->c(Ll/nsv;)Ll/l6o0;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    iget-object p1, p1, Ll/l6o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 51
    .line 52
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 53
    .line 54
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;->frameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 55
    .line 56
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->checkNeedChangeVoice()Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_3

    .line 61
    .line 62
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->getFixedRemainingSec()J

    .line 63
    .line 64
    .line 65
    move-result-wide v0

    .line 66
    long-to-int v0, v0

    .line 67
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    iget-object v1, v1, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 72
    .line 73
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    check-cast v1, Landroid/content/Context;

    .line 78
    .line 79
    new-instance v2, Ll/lmo0;

    .line 80
    .line 81
    invoke-direct {v2, p0, v0, p1}, Ll/lmo0;-><init>(Ll/zmo0;ILcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;)V

    .line 82
    .line 83
    .line 84
    const-wide/16 p0, 0x96

    .line 85
    .line 86
    invoke-static {v1, v2, p0, p1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :cond_3
    iget-object p0, p0, Ll/zmo0;->g:Ll/pa1;

    .line 91
    .line 92
    invoke-virtual {p0}, Ll/pa1;->e()V

    .line 93
    .line 94
    .line 95
    return-void
.end method


# virtual methods
.method public A()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/zmo0;->a:Ll/uem0;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, v0, v0}, Ll/uem0;->K0(ZZ)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public B()Ll/rwn0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 2
    .line 3
    return-object p0
.end method

.method public C()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/guk0;->h(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/rwn0;->p()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    :cond_0
    iget-object p0, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/vp20;->m()Ll/jsv;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Ll/jsv;->a()I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    const/4 v0, 0x2

    .line 32
    if-ne p0, v0, :cond_1

    .line 33
    .line 34
    const/4 p0, 0x1

    .line 35
    return p0

    .line 36
    :cond_1
    const/4 p0, 0x0

    .line 37
    return p0
.end method

.method public E()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/vp20;->k()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    const-string p0, ""

    .line 17
    .line 18
    return-object p0
.end method

.method public final F(Ljava/lang/Boolean;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, v0}, Ll/zmo0;->q0(Z)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    const-string v1, "isFront:"

    .line 11
    .line 12
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-boolean v1, p0, Ll/zmo0;->e:Z

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const-string v1, "[live][voiceWindow]"

    .line 25
    .line 26
    invoke-static {v1, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iget-boolean v0, p0, Ll/zmo0;->e:Z

    .line 30
    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    invoke-static {}, Lcom/p1/mobile/putong/live/base/mmsdk/player/a;->b()Lcom/p1/mobile/putong/live/base/mmsdk/player/a;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    sget-object v2, Ll/zrv;->e:Landroid/app/Application;

    .line 38
    .line 39
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/live/base/mmsdk/player/a;->e(Landroid/content/Context;)I

    .line 40
    .line 41
    .line 42
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    const-string v2, "handLiftCycle is front:"

    .line 45
    .line 46
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-static {v1, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Ll/zmo0;->a:Ll/uem0;

    .line 60
    .line 61
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    invoke-virtual {p0, p1}, Ll/uem0;->h(Z)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public final G(Ll/jsv;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "handLiveState:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Ll/jsv;->a()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "[live][voiceWindow]"

    .line 20
    .line 21
    invoke-static {v1, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1}, Ll/jsv;->a()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    const/4 v2, 0x2

    .line 29
    if-eq v0, v2, :cond_1

    .line 30
    .line 31
    const/4 v2, 0x4

    .line 32
    if-eq v0, v2, :cond_0

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    invoke-direct {p0}, Ll/zmo0;->e0()V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    invoke-direct {p0}, Ll/zmo0;->f0()V

    .line 40
    .line 41
    .line 42
    :goto_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    const-string v0, "roomState:"

    .line 45
    .line 46
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p1}, Ll/jsv;->a()I

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-static {v1, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public final H(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;)V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "window photoSticker:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toString()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "voice_effect_gift"

    .line 20
    .line 21
    invoke-static {v1, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 25
    .line 26
    invoke-virtual {v0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->getUserId()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v0, v1}, Ll/hrk0;->m(Ljava/lang/String;)Ll/nsv;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {v0}, Ll/l6o0;->c(Ll/nsv;)Ll/l6o0;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iget-object v1, v0, Ll/l6o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 43
    .line 44
    if-eqz v1, :cond_2

    .line 45
    .line 46
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->hasFrameConfig()Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-eqz v1, :cond_2

    .line 51
    .line 52
    iget-object v1, v0, Ll/l6o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 53
    .line 54
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 55
    .line 56
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;->getFrameConfig()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-static {p1}, Ll/thn0;->Z3(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$PictureConfig;)Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    iput-object p1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;->frameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 65
    .line 66
    iget-object p1, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 67
    .line 68
    invoke-virtual {p1}, Ll/rwn0;->U2()Ll/msn0;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    if-eqz p1, :cond_0

    .line 77
    .line 78
    iget-object p1, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 79
    .line 80
    invoke-virtual {p1}, Ll/rwn0;->U2()Ll/msn0;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    iget-object p1, p1, Ll/msn0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;

    .line 85
    .line 86
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;->playInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 87
    .line 88
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    if-eqz v1, :cond_0

    .line 93
    .line 94
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 95
    .line 96
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;->playInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 101
    .line 102
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->userId:Ljava/lang/String;

    .line 103
    .line 104
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    move-result p1

    .line 108
    if-eqz p1, :cond_0

    .line 109
    .line 110
    iget-object p0, p0, Ll/zmo0;->g:Ll/pa1;

    .line 111
    .line 112
    invoke-virtual {p0}, Ll/pa1;->d()V

    .line 113
    .line 114
    .line 115
    return-void

    .line 116
    :cond_0
    iget-object p1, v0, Ll/l6o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 117
    .line 118
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 119
    .line 120
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;->frameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 121
    .line 122
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->checkNeedChangeVoice()Z

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    iget-object v1, p0, Ll/zmo0;->g:Ll/pa1;

    .line 127
    .line 128
    if-eqz v0, :cond_1

    .line 129
    .line 130
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->getFixedRemainingSec()J

    .line 131
    .line 132
    .line 133
    move-result-wide v2

    .line 134
    long-to-int v0, v2

    .line 135
    invoke-virtual {v1, v0}, Ll/pa1;->i(I)V

    .line 136
    .line 137
    .line 138
    iget-object p0, p0, Ll/zmo0;->g:Ll/pa1;

    .line 139
    .line 140
    invoke-virtual {p0, p1}, Ll/pa1;->b(Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;)V

    .line 141
    .line 142
    .line 143
    return-void

    .line 144
    :cond_1
    invoke-virtual {v1}, Ll/pa1;->e()V

    .line 145
    .line 146
    .line 147
    :cond_2
    return-void
.end method

.method public I()V
    .locals 2

    .line 1
    new-instance v0, Ll/nmo0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/nmo0;-><init>(Ll/zmo0;)V

    .line 4
    .line 5
    .line 6
    const-string v1, ""

    .line 7
    .line 8
    invoke-virtual {p0, v1, v0}, Ll/zmo0;->o0(Ljava/lang/String;Ll/y20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public J(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "call:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/google/protobuf/nano/MessageNano;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "[live][voiceWindow]"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 21
    .line 22
    invoke-virtual {v0, p1}, Ll/rwn0;->J2(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 23
    .line 24
    .line 25
    invoke-static {p1}, Ll/guk0;->h(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    invoke-direct {p0}, Ll/zmo0;->r0()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Ll/zmo0;->v0()V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    invoke-static {p1}, Ll/guk0;->l(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    invoke-direct {p0}, Ll/zmo0;->p0()V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_1
    invoke-static {p1}, Ll/guk0;->f(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-eqz p1, :cond_2

    .line 53
    .line 54
    invoke-virtual {p0}, Ll/zmo0;->v0()V

    .line 55
    .line 56
    .line 57
    :cond_2
    return-void
.end method

.method public K()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/zmo0;->L()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/zmo0;->M()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/zmo0;->c:Ll/c0m;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/zmo0;->A()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    new-instance v1, Ll/pa1;

    .line 16
    .line 17
    invoke-direct {v1, v0}, Ll/pa1;-><init>(Ll/c0m;)V

    .line 18
    .line 19
    .line 20
    iput-object v1, p0, Ll/zmo0;->g:Ll/pa1;

    .line 21
    .line 22
    iget-object v0, p0, Ll/zmo0;->b:Lrx/subjects/a;

    .line 23
    .line 24
    new-instance v1, Landroid/util/Pair;

    .line 25
    .line 26
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 27
    .line 28
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 29
    .line 30
    invoke-direct {v1, v2, v3}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->isAppVisible()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    invoke-virtual {p0, v0}, Ll/zmo0;->q0(Z)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 44
    .line 45
    invoke-virtual {v0}, Ll/rwn0;->U2()Ll/msn0;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    if-eqz v0, :cond_1

    .line 50
    .line 51
    iget-object v0, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 52
    .line 53
    invoke-virtual {v0}, Ll/rwn0;->U2()Ll/msn0;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v0, p0}, Ll/msn0;->X(Ll/yvl;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 61
    .line 62
    invoke-virtual {v0}, Ll/rwn0;->U2()Ll/msn0;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {v0}, Ll/msn0;->Z()V

    .line 67
    .line 68
    .line 69
    :cond_1
    invoke-virtual {p0}, Ll/zmo0;->y()V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public final L()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/oo2;->n1()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Ll/zmo0;->L1(Lrx/c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/xmo0;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/xmo0;-><init>(Ll/zmo0;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Ll/aj1;->x0()Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p0, v0}, Ll/zmo0;->L1(Lrx/c;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    new-instance v1, Ll/ylo0;

    .line 38
    .line 39
    invoke-direct {v1}, Ll/ylo0;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    new-instance v1, Ll/zlo0;

    .line 47
    .line 48
    invoke-direct {v1, p0}, Ll/zlo0;-><init>(Ll/zmo0;)V

    .line 49
    .line 50
    .line 51
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 59
    .line 60
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {v0}, Ll/aj1;->M0()Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {p0, v0}, Ll/zmo0;->L1(Lrx/c;)Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    new-instance v1, Ll/amo0;

    .line 73
    .line 74
    invoke-direct {v1, p0}, Ll/amo0;-><init>(Ll/zmo0;)V

    .line 75
    .line 76
    .line 77
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 85
    .line 86
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-virtual {v0}, Ll/aj1;->y0()Lrx/c;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-virtual {p0, v0}, Ll/zmo0;->L1(Lrx/c;)Lrx/c;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    const-wide/16 v1, 0x64

    .line 99
    .line 100
    invoke-virtual {v0, v1, v2}, Lrx/c;->onBackpressureBuffer(J)Lrx/c;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    new-instance v1, Ll/ppo0;

    .line 105
    .line 106
    invoke-direct {v1}, Ll/ppo0;-><init>()V

    .line 107
    .line 108
    .line 109
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    new-instance v1, Ll/bmo0;

    .line 114
    .line 115
    invoke-direct {v1, p0}, Ll/bmo0;-><init>(Ll/zmo0;)V

    .line 116
    .line 117
    .line 118
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 123
    .line 124
    .line 125
    iget-object v0, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 126
    .line 127
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-virtual {v0}, Ll/aj1;->B0()Lrx/c;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    invoke-virtual {p0, v0}, Ll/zmo0;->L1(Lrx/c;)Lrx/c;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    const-wide/16 v1, 0x32

    .line 140
    .line 141
    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 142
    .line 143
    invoke-virtual {v0, v1, v2, v3}, Lrx/c;->delay(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    new-instance v1, Ll/cmo0;

    .line 156
    .line 157
    invoke-direct {v1, p0}, Ll/cmo0;-><init>(Ll/zmo0;)V

    .line 158
    .line 159
    .line 160
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 161
    .line 162
    .line 163
    move-result-object v1

    .line 164
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 165
    .line 166
    .line 167
    iget-object v0, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 168
    .line 169
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    invoke-virtual {v0}, Ll/aj1;->V0()Lrx/c;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    invoke-virtual {p0, v0}, Ll/zmo0;->L1(Lrx/c;)Lrx/c;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 182
    .line 183
    .line 184
    move-result-object v0

    .line 185
    new-instance v1, Ll/dmo0;

    .line 186
    .line 187
    invoke-direct {v1, p0}, Ll/dmo0;-><init>(Ll/zmo0;)V

    .line 188
    .line 189
    .line 190
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 191
    .line 192
    .line 193
    move-result-object v1

    .line 194
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 195
    .line 196
    .line 197
    iget-object v0, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 198
    .line 199
    iget-object v0, v0, Ll/oo2;->z:Ll/p1w;

    .line 200
    .line 201
    invoke-virtual {v0}, Ll/p1w;->r()Ll/aj1;

    .line 202
    .line 203
    .line 204
    move-result-object v0

    .line 205
    invoke-virtual {v0}, Ll/aj1;->W0()Lrx/c;

    .line 206
    .line 207
    .line 208
    move-result-object v0

    .line 209
    invoke-virtual {p0, v0}, Ll/zmo0;->L1(Lrx/c;)Lrx/c;

    .line 210
    .line 211
    .line 212
    move-result-object v0

    .line 213
    new-instance v1, Ll/emo0;

    .line 214
    .line 215
    invoke-direct {v1, p0}, Ll/emo0;-><init>(Ll/zmo0;)V

    .line 216
    .line 217
    .line 218
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 219
    .line 220
    .line 221
    move-result-object v1

    .line 222
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 223
    .line 224
    .line 225
    iget-object v0, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 226
    .line 227
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    invoke-virtual {v0}, Ll/aj1;->Q0()Lrx/c;

    .line 232
    .line 233
    .line 234
    move-result-object v0

    .line 235
    invoke-virtual {p0, v0}, Ll/zmo0;->L1(Lrx/c;)Lrx/c;

    .line 236
    .line 237
    .line 238
    move-result-object v0

    .line 239
    new-instance v1, Ll/fmo0;

    .line 240
    .line 241
    invoke-direct {v1}, Ll/fmo0;-><init>()V

    .line 242
    .line 243
    .line 244
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 245
    .line 246
    .line 247
    move-result-object v0

    .line 248
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 249
    .line 250
    .line 251
    move-result-object v0

    .line 252
    new-instance v1, Ll/ymo0;

    .line 253
    .line 254
    invoke-direct {v1, p0}, Ll/ymo0;-><init>(Ll/zmo0;)V

    .line 255
    .line 256
    .line 257
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 258
    .line 259
    .line 260
    move-result-object p0

    .line 261
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 262
    .line 263
    .line 264
    return-void
.end method

.method public L1(Lrx/c;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/hmo0;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/hmo0;-><init>(Lrx/c;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/zmo0;->b:Lrx/subjects/a;

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    invoke-static {v0, p0, p1}, Ll/psd0;->D(Ll/pcj;Lrx/c;Z)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final M()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zmo0;->c:Ll/c0m;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/oo2;->H0()Ll/c0m;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Ll/zmo0;->c:Ll/c0m;

    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Ll/zmo0;->c:Ll/c0m;

    .line 14
    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    return-void

    .line 18
    :cond_1
    invoke-interface {v0}, Ll/c0m;->d()Ll/h0m;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-interface {v0}, Ll/h0m;->onResume()V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/zmo0;->c:Ll/c0m;

    .line 26
    .line 27
    invoke-interface {v0}, Ll/c0m;->d()Ll/h0m;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/imo0;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/imo0;-><init>(Ll/zmo0;)V

    .line 34
    .line 35
    .line 36
    invoke-interface {v0, v1}, Ll/h0m;->c(Ll/z20;)V

    .line 37
    .line 38
    .line 39
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->m()Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p0, v0}, Ll/zmo0;->L1(Lrx/c;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    const/4 v1, 0x1

    .line 48
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    new-instance v1, Ll/rmo0;

    .line 53
    .line 54
    invoke-direct {v1}, Ll/rmo0;-><init>()V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    new-instance v1, Ll/smo0;

    .line 62
    .line 63
    invoke-direct {v1, p0}, Ll/smo0;-><init>(Ll/zmo0;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    new-instance v1, Ll/tmo0;

    .line 71
    .line 72
    invoke-direct {v1, p0}, Ll/tmo0;-><init>(Ll/zmo0;)V

    .line 73
    .line 74
    .line 75
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 83
    .line 84
    invoke-virtual {v0}, Ll/vp20;->l()Lrx/c;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-virtual {p0, v0}, Ll/zmo0;->L1(Lrx/c;)Lrx/c;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    new-instance v1, Ll/umo0;

    .line 97
    .line 98
    invoke-direct {v1, p0}, Ll/umo0;-><init>(Ll/zmo0;)V

    .line 99
    .line 100
    .line 101
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 106
    .line 107
    .line 108
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->front()Lrx/c;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-virtual {p0, v0}, Ll/zmo0;->L1(Lrx/c;)Lrx/c;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    new-instance v1, Ll/vmo0;

    .line 117
    .line 118
    invoke-direct {v1, p0}, Ll/vmo0;-><init>(Ll/zmo0;)V

    .line 119
    .line 120
    .line 121
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 126
    .line 127
    .line 128
    return-void
.end method

.method public final N(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/zmo0;->O()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0, p1}, Ll/zmo0;->j0(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final O()Z
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/zmo0;->D()Ll/uam;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public final P(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ll/zmo0;->N(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic Q(ILcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zmo0;->g:Ll/pa1;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/pa1;->i(I)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/zmo0;->g:Ll/pa1;

    .line 7
    .line 8
    invoke-virtual {p0, p2}, Ll/pa1;->b(Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic R(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;)V
    .locals 3

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
    const/4 v2, -0x1

    .line 11
    sparse-switch v1, :sswitch_data_0

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :sswitch_0
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
    const/4 v2, 0x5

    .line 25
    goto :goto_0

    .line 26
    :sswitch_1
    const-string v1, "forbidden_multidevice"

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    const/4 v2, 0x4

    .line 36
    goto :goto_0

    .line 37
    :sswitch_2
    const-string v1, "force_stop"

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_2

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    const/4 v2, 0x3

    .line 47
    goto :goto_0

    .line 48
    :sswitch_3
    const-string v1, "start"

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-nez v0, :cond_3

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_3
    const/4 v2, 0x2

    .line 58
    goto :goto_0

    .line 59
    :sswitch_4
    const-string v1, "stop"

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-nez v0, :cond_4

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_4
    const/4 v2, 0x1

    .line 69
    goto :goto_0

    .line 70
    :sswitch_5
    const-string v1, "boot"

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-nez v0, :cond_5

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_5
    const/4 v2, 0x0

    .line 80
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :pswitch_0
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->isAnchor:Z

    .line 85
    .line 86
    if-eqz p1, :cond_6

    .line 87
    .line 88
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 89
    .line 90
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->T5:I

    .line 91
    .line 92
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    goto :goto_1

    .line 97
    :cond_6
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 98
    .line 99
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->R5:I

    .line 100
    .line 101
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    :goto_1
    invoke-static {p1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p0}, Ll/zmo0;->A()V

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    :pswitch_1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->liveId:Ljava/lang/String;

    .line 113
    .line 114
    invoke-virtual {p0, p1}, Ll/zmo0;->P(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    return-void

    .line 118
    :pswitch_2
    iget-object p0, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 119
    .line 120
    sget-object p1, Ll/v9s;->e:Ll/v9s;

    .line 121
    .line 122
    invoke-virtual {p0, p1}, Ll/vp20;->h(Ll/jsv;)V

    .line 123
    .line 124
    .line 125
    return-void

    .line 126
    :pswitch_3
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 127
    .line 128
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->S5:I

    .line 129
    .line 130
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    invoke-static {p1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {p0}, Ll/zmo0;->A()V

    .line 138
    .line 139
    .line 140
    return-void

    .line 141
    :sswitch_data_0
    .sparse-switch
        0x2e3af2 -> :sswitch_5
        0x360802 -> :sswitch_4
        0x68ac462 -> :sswitch_3
        0x80850d6 -> :sswitch_2
        0x169d3189 -> :sswitch_1
        0x40872d64 -> :sswitch_0
    .end sparse-switch

    .line 142
    .line 143
    .line 144
    .line 145
    .line 146
    .line 147
    .line 148
    .line 149
    .line 150
    .line 151
    .line 152
    .line 153
    .line 154
    .line 155
    .line 156
    .line 157
    .line 158
    .line 159
    .line 160
    .line 161
    .line 162
    .line 163
    .line 164
    .line 165
    .line 166
    .line 167
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public final synthetic S(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceChangeRoomBg$VoiceRoomBgPicUpdateMessage;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceChangeRoomBg$VoiceRoomBgPicUpdateMessage;->getUrl()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/zmo0;->Y1()Ll/rwn0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/rwn0;->X2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/zmo0;->Y1()Ll/rwn0;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Ll/rwn0;->X2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceChangeRoomBg$VoiceRoomBgPicUpdateMessage;->getUrl()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->backgroundUrl:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/zmo0;->Y1()Ll/rwn0;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0}, Ll/rwn0;->X2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceChangeRoomBg$VoiceRoomBgPicUpdateMessage;->getPicType()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->bgPicType:Ljava/lang/String;

    .line 48
    .line 49
    :cond_0
    return-void
.end method

.method public final synthetic T(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zmo0;->H(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceFunnyAvatar$VoiceLivePhotoSticker;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic U(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/zmo0;->z(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic V(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceSwitchLiveMode$VoiceLiveModeMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zmo0;->Y1()Ll/rwn0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceSwitchLiveMode$VoiceLiveModeMessage;->getLiveMode()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 14
    .line 15
    return-void
.end method

.method public final synthetic W(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveTemplateMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zmo0;->Y1()Ll/rwn0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveTemplateMessage;->getTemplate()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->template:Ljava/lang/String;

    .line 14
    .line 15
    return-void
.end method

.method public final synthetic X(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zmo0;->Y1()Ll/rwn0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->template:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public final synthetic Y(Landroid/net/NetworkInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public Y1()Ll/rwn0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic Z(Landroid/net/NetworkInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zmo0;->g0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic a0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/rwn0;->J2(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic b0(Ll/vxj0;)Lrx/c;
    .locals 1

    .line 1
    iget-object p1, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/vp20;->o()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const-string v0, ""

    .line 8
    .line 9
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/call/api/VCallApiProvider;->requestSdkToken(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1}, Ll/zmo0;->L1(Lrx/c;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public c0(Ljava/lang/Integer;Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v1, "onEngineCallback "

    .line 9
    .line 10
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-static {v1}, Ll/at2;->b(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v1, "[live][voiceWindow]"

    .line 29
    .line 30
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    const/4 v0, 0x2

    .line 38
    if-eq p1, v0, :cond_3

    .line 39
    .line 40
    const/4 p2, 0x3

    .line 41
    if-eq p1, p2, :cond_2

    .line 42
    .line 43
    const/4 p2, 0x4

    .line 44
    if-eq p1, p2, :cond_1

    .line 45
    .line 46
    :goto_0
    return-void

    .line 47
    :cond_1
    invoke-virtual {p0}, Ll/zmo0;->I()V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_2
    invoke-virtual {p0}, Ll/zmo0;->l0()V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_3
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    new-instance p2, Ll/omo0;

    .line 60
    .line 61
    invoke-direct {p2, p0}, Ll/omo0;-><init>(Ll/zmo0;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0, p1, p2}, Ll/zmo0;->o0(Ljava/lang/String;Ll/y20;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public final d0(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p0, ""

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    const-string v0, "onErrorHandle :"

    .line 13
    .line 14
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const-string p1, "[live][voiceWindow]"

    .line 25
    .line 26
    invoke-static {p1, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final g0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Ll/zmo0;->j0(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public h0(Ll/gvn0;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/gvn0;->j()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eq v0, v1, :cond_2

    .line 7
    .line 8
    packed-switch v0, :pswitch_data_0

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :pswitch_0
    iget-object v0, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/rwn0;->p()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_2

    .line 19
    .line 20
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 21
    .line 22
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p1}, Ll/gvn0;->g()Ll/nsv;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iget-object v1, v1, Ll/nsv;->a:Ljava/lang/Object;

    .line 31
    .line 32
    check-cast v1, Ll/h64;

    .line 33
    .line 34
    iget-object v1, v1, Ll/h64;->a:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_2

    .line 41
    .line 42
    invoke-virtual {p1}, Ll/gvn0;->l()Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_0

    .line 47
    .line 48
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->ph:I

    .line 49
    .line 50
    invoke-static {v0}, Ll/o1j0;->w(I)V

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_0
    invoke-virtual {p0}, Ll/zmo0;->Y1()Ll/rwn0;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {v0}, Ll/rwn0;->i3()Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_1

    .line 63
    .line 64
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->hf:I

    .line 65
    .line 66
    invoke-static {v0}, Ll/o1j0;->w(I)V

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_1
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->oh:I

    .line 71
    .line 72
    invoke-static {v0}, Ll/o1j0;->w(I)V

    .line 73
    .line 74
    .line 75
    :cond_2
    :goto_0
    :pswitch_1
    invoke-virtual {p1}, Ll/gvn0;->e()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-virtual {p0, p1}, Ll/zmo0;->J(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :pswitch_data_0
    .packed-switch 0x4
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method public i0()V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ll/zmo0;->q0(Z)V

    .line 3
    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/live/base/mmsdk/player/a;->b()Lcom/p1/mobile/putong/live/base/mmsdk/player/a;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    sget-object v2, Ll/zrv;->e:Landroid/app/Application;

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/base/mmsdk/player/a;->e(Landroid/content/Context;)I

    .line 12
    .line 13
    .line 14
    invoke-direct {p0}, Ll/zmo0;->r0()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ll/zmo0;->Y1()Ll/rwn0;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iget-object v1, v1, Ll/rwn0;->I:Lrx/subjects/a;

    .line 22
    .line 23
    invoke-virtual {p0, v1}, Ll/zmo0;->L1(Lrx/c;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v1, v0}, Lrx/c;->skip(I)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    new-instance v1, Ll/wmo0;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Ll/wmo0;-><init>(Ll/zmo0;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public final j0(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-static {p1}, Ll/itv;->v(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p0, p1}, Ll/zmo0;->L1(Lrx/c;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    new-instance v0, Ll/jmo0;

    .line 13
    .line 14
    invoke-direct {v0, p0}, Ll/jmo0;-><init>(Ll/zmo0;)V

    .line 15
    .line 16
    .line 17
    new-instance v1, Ll/kmo0;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/kmo0;-><init>(Ll/zmo0;)V

    .line 20
    .line 21
    .line 22
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Ll/zmo0;->y0()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public k0(ZZ)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "VoiceRoomManager:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "[live][voiceWindow]"

    .line 19
    .line 20
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/zmo0;->b:Lrx/subjects/a;

    .line 24
    .line 25
    invoke-virtual {v0}, Lrx/subjects/a;->onCompleted()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Ll/zmo0;->Y1()Ll/rwn0;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Ll/rwn0;->U2()Ll/msn0;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    if-eqz v0, :cond_0

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/zmo0;->Y1()Ll/rwn0;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Ll/rwn0;->U2()Ll/msn0;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0, p2}, Ll/msn0;->r(Z)V

    .line 47
    .line 48
    .line 49
    :cond_0
    invoke-virtual {p0, p2}, Ll/zmo0;->t0(Z)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Ll/zmo0;->m0()V

    .line 53
    .line 54
    .line 55
    invoke-static {}, Ll/lwr;->a()V

    .line 56
    .line 57
    .line 58
    const/4 v0, 0x0

    .line 59
    iput-object v0, p0, Ll/zmo0;->f:Ll/kwr;

    .line 60
    .line 61
    iget-object v1, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 62
    .line 63
    if-eqz v1, :cond_2

    .line 64
    .line 65
    if-eqz p1, :cond_1

    .line 66
    .line 67
    invoke-virtual {v1}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-virtual {v1, p1}, Ll/oo2;->g2(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 72
    .line 73
    .line 74
    sget-object p1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 75
    .line 76
    invoke-static {p1}, Ll/f5y;->b(Landroid/content/Context;)V

    .line 77
    .line 78
    .line 79
    :cond_1
    if-eqz p2, :cond_2

    .line 80
    .line 81
    iget-object p1, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 82
    .line 83
    invoke-virtual {p1}, Ll/vp20;->o()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    sget-object p2, Ll/zrv;->a:Ll/wrv;

    .line 88
    .line 89
    invoke-virtual {p2}, Ll/wrv;->D0()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p2

    .line 93
    invoke-virtual {p0}, Ll/zmo0;->Y1()Ll/rwn0;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-virtual {v1}, Ll/vp20;->x()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    invoke-static {p1, p2, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/api/VoiceRoomApiProvider;->getOutRoom(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    :cond_2
    iput-object v0, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 105
    .line 106
    iput-object v0, p0, Ll/zmo0;->c:Ll/c0m;

    .line 107
    .line 108
    iget-object p0, p0, Ll/zmo0;->g:Ll/pa1;

    .line 109
    .line 110
    invoke-virtual {p0}, Ll/pa1;->d()V

    .line 111
    .line 112
    .line 113
    return-void
.end method

.method public final l0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const-string v0, "[live][voiceWindow]"

    .line 27
    .line 28
    const-string v1, "reportCallStatus"

    .line 29
    .line 30
    invoke-static {v0, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 34
    .line 35
    invoke-virtual {v0}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 40
    .line 41
    const/4 v1, 0x1

    .line 42
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/api/VCallApiProvider;->reportConnect(Ljava/lang/String;Z)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {p0, v0}, Ll/zmo0;->L1(Lrx/c;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    new-instance v1, Ll/qmo0;

    .line 51
    .line 52
    invoke-direct {v1, p0}, Ll/qmo0;-><init>(Ll/zmo0;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 60
    .line 61
    .line 62
    :cond_1
    :goto_0
    return-void
.end method

.method public final m0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    iget-object v0, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/call/api/VCallApiProvider;->deputyGoAway(Ljava/lang/String;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {p0, v0}, Ll/zmo0;->L1(Lrx/c;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    new-instance v1, Ll/xlo0;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ll/xlo0;-><init>(Ll/zmo0;)V

    .line 42
    .line 43
    .line 44
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 49
    .line 50
    .line 51
    :cond_0
    return-void
.end method

.method public n0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Ll/zmo0;->y()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Ll/guk0;->h(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iget-object p0, p0, Ll/zmo0;->f:Ll/kwr;

    .line 20
    .line 21
    invoke-static {v0, p0}, Ll/lwr;->c(ZLl/ga1;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public o0(Ljava/lang/String;Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/vp20;->o()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

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
    iget-object v0, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/vp20;->o()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/api/VCallApiProvider;->requestSdkToken(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p0, p1}, Ll/zmo0;->L1(Lrx/c;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-static {p2}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final q0(Z)V
    .locals 1

    .line 1
    iput-boolean p1, p0, Ll/zmo0;->e:Z

    .line 2
    .line 3
    new-instance p0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v0, "setFront:"

    .line 6
    .line 7
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string p1, "[live][voiceWindow]"

    .line 18
    .line 19
    invoke-static {p1, p0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public s0(Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    const-string v2, "startCallEngineMotion"

    .line 6
    .line 7
    const-string v3, "[live][voiceWindow]"

    .line 8
    .line 9
    invoke-static {v3, v2}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v2, v0, Ll/zmo0;->c:Ll/c0m;

    .line 13
    .line 14
    invoke-interface {v2}, Ll/c0m;->d()Ll/h0m;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-interface {v2}, Ll/h0m;->a()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    if-eqz v2, :cond_0

    .line 23
    .line 24
    new-instance v4, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    const-string v5, "motion"

    .line 27
    .line 28
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->Z0()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;

    .line 32
    .line 33
    .line 34
    move-result-object v5

    .line 35
    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v5

    .line 39
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    invoke-static {v3, v4}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    :cond_0
    if-eqz v2, :cond_3

    .line 50
    .line 51
    sget-object v4, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;->MOTION_VOICE_AUDIENCE:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;

    .line 52
    .line 53
    invoke-virtual {v2, v4}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->c1(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;)Z

    .line 54
    .line 55
    .line 56
    move-result v4

    .line 57
    if-nez v4, :cond_1

    .line 58
    .line 59
    sget-object v4, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;->MOTION_VOICE_ANCHOR:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;

    .line 60
    .line 61
    invoke-virtual {v2, v4}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->c1(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;)Z

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    if-eqz v2, :cond_3

    .line 66
    .line 67
    :cond_1
    iget-object v1, v0, Ll/zmo0;->d:Ll/rwn0;

    .line 68
    .line 69
    invoke-virtual {v1}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-static {v1}, Ll/guk0;->l(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    if-eqz v1, :cond_2

    .line 78
    .line 79
    invoke-virtual {v0}, Ll/zmo0;->l0()V

    .line 80
    .line 81
    .line 82
    :cond_2
    const-string v0, "startCallEngineMotion  return"

    .line 83
    .line 84
    invoke-static {v3, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :cond_3
    const-string v2, " start startCallEngineMotion"

    .line 89
    .line 90
    invoke-static {v3, v2}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    iget-object v2, v0, Ll/zmo0;->c:Ll/c0m;

    .line 94
    .line 95
    invoke-interface {v2}, Ll/c0m;->d()Ll/h0m;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    new-instance v3, Ll/at2;

    .line 100
    .line 101
    iget-object v4, v0, Ll/zmo0;->d:Ll/rwn0;

    .line 102
    .line 103
    invoke-virtual {v4}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 104
    .line 105
    .line 106
    move-result-object v4

    .line 107
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 108
    .line 109
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->push:Ljava/lang/String;

    .line 110
    .line 111
    iget-object v5, v0, Ll/zmo0;->d:Ll/rwn0;

    .line 112
    .line 113
    invoke-virtual {v5}, Ll/vp20;->o()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v5

    .line 117
    iget-object v6, v0, Ll/zmo0;->d:Ll/rwn0;

    .line 118
    .line 119
    invoke-virtual {v6}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 120
    .line 121
    .line 122
    move-result-object v6

    .line 123
    iget-object v6, v6, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 124
    .line 125
    iget v6, v6, Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;->provider:I

    .line 126
    .line 127
    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v6

    .line 131
    iget-object v7, v0, Ll/zmo0;->d:Ll/rwn0;

    .line 132
    .line 133
    invoke-virtual {v7}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 134
    .line 135
    .line 136
    move-result-object v7

    .line 137
    iget-object v7, v7, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 138
    .line 139
    iget v7, v7, Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;->businessType:I

    .line 140
    .line 141
    invoke-static {v7}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v7

    .line 145
    iget-object v8, v1, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->rtcProvider:Ljava/lang/String;

    .line 146
    .line 147
    iget-object v9, v1, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->appId:Ljava/lang/String;

    .line 148
    .line 149
    iget-object v10, v1, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->channelKey:Ljava/lang/String;

    .line 150
    .line 151
    iget-object v11, v1, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->channel:Ljava/lang/String;

    .line 152
    .line 153
    iget-object v12, v1, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->userSig:Ljava/lang/String;

    .line 154
    .line 155
    iget-object v13, v1, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->reverbAppKey:Ljava/lang/String;

    .line 156
    .line 157
    iget-object v14, v1, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->reverbToken:Ljava/lang/String;

    .line 158
    .line 159
    iget-object v1, v0, Ll/zmo0;->d:Ll/rwn0;

    .line 160
    .line 161
    invoke-virtual {v1}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    invoke-static {v1}, Ll/guk0;->h(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 166
    .line 167
    .line 168
    move-result v15

    .line 169
    new-instance v1, Ll/imo0;

    .line 170
    .line 171
    invoke-direct {v1, v0}, Ll/imo0;-><init>(Ll/zmo0;)V

    .line 172
    .line 173
    .line 174
    move-object/from16 v16, v1

    .line 175
    .line 176
    invoke-direct/range {v3 .. v16}, Ll/at2;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLl/z20;)V

    .line 177
    .line 178
    .line 179
    invoke-interface {v2, v3}, Ll/h0m;->d(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;)I

    .line 180
    .line 181
    .line 182
    return-void
.end method

.method public t0(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zmo0;->c:Ll/c0m;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v1, "stop push needStopRtc:"

    .line 9
    .line 10
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "[live][voiceWindow]"

    .line 21
    .line 22
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    if-eqz p1, :cond_3

    .line 26
    .line 27
    iget-object p1, p0, Ll/zmo0;->c:Ll/c0m;

    .line 28
    .line 29
    invoke-interface {p1}, Ll/c0m;->d()Ll/h0m;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-interface {p1}, Ll/h0m;->a()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;->MOTION_VOICE_AUDIENCE:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;

    .line 38
    .line 39
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->c1(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;)Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-nez p1, :cond_1

    .line 44
    .line 45
    iget-object p1, p0, Ll/zmo0;->c:Ll/c0m;

    .line 46
    .line 47
    invoke-interface {p1}, Ll/c0m;->d()Ll/h0m;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-interface {p1}, Ll/h0m;->a()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;->MOTION_VOICE_ANCHOR:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;

    .line 56
    .line 57
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->c1(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;)Z

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    if-eqz p1, :cond_3

    .line 62
    .line 63
    :cond_1
    iget-object p1, p0, Ll/zmo0;->c:Ll/c0m;

    .line 64
    .line 65
    invoke-interface {p1}, Ll/c0m;->d()Ll/h0m;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-interface {p1}, Ll/h0m;->a()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;->MOTION_VOICE_ANCHOR:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;

    .line 74
    .line 75
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->c1(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;)Z

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    if-eqz p1, :cond_2

    .line 80
    .line 81
    iget-object p1, p0, Ll/zmo0;->c:Ll/c0m;

    .line 82
    .line 83
    invoke-interface {p1}, Ll/c0m;->a()Ll/uzl;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    invoke-interface {p1}, Ll/uzl;->stopSurroundMusic()V

    .line 88
    .line 89
    .line 90
    :cond_2
    iget-object p0, p0, Ll/zmo0;->c:Ll/c0m;

    .line 91
    .line 92
    invoke-interface {p0}, Ll/c0m;->d()Ll/h0m;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-interface {p0}, Ll/h0m;->b()V

    .line 97
    .line 98
    .line 99
    :cond_3
    :goto_0
    return-void
.end method

.method public final u0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zmo0;->y()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/guk0;->h(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iget-object p0, p0, Ll/zmo0;->f:Ll/kwr;

    .line 9
    .line 10
    invoke-static {p1, p0}, Ll/lwr;->g(ZLl/ga1;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final v0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zmo0;->c:Ll/c0m;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/c0m;->d()Ll/h0m;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ll/h0m;->a()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;->MOTION_VOICE_AUDIENCE:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->c1(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    const-class v1, Ll/frm0;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->T0(Ljava/lang/Class;)Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Ll/frm0;

    .line 28
    .line 29
    iget-object v1, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 30
    .line 31
    invoke-virtual {v1}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-static {v1}, Ll/guk0;->h(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    invoke-virtual {v0, v1}, Ll/zs2;->z1(Z)V

    .line 40
    .line 41
    .line 42
    new-instance v0, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    const-string v1, "updateClientRole:"

    .line 45
    .line 46
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 50
    .line 51
    invoke-virtual {p0}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-static {p0}, Ll/guk0;->h(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    const-string v0, "[live][voiceWindow]"

    .line 67
    .line 68
    invoke-static {v0, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    :cond_0
    return-void
.end method

.method public final w0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 1

    .line 1
    if-nez p1, :cond_1

    .line 2
    .line 3
    iget-object p1, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-static {p1}, Ll/guk0;->f(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    iget-object p1, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 24
    .line 25
    invoke-virtual {p1}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    const-string v0, "hung-up"

    .line 34
    .line 35
    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->state:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Ll/zmo0;->J(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void

    .line 41
    :cond_1
    invoke-virtual {p0, p1}, Ll/zmo0;->J(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final x(Ll/ugd0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/rwn0;->S(Ll/ugd0;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 7
    .line 8
    iget-object v0, p1, Ll/mr2;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ll/oo2;->V(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 11
    .line 12
    .line 13
    new-instance p0, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v0, "refreshWindow:"

    .line 16
    .line 17
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p1, Ll/mr2;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 21
    .line 22
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 23
    .line 24
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->pullFlv:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const-string p1, "[live][voiceWindow]"

    .line 34
    .line 35
    invoke-static {p1, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final y()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zmo0;->f:Ll/kwr;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/kwr;

    .line 6
    .line 7
    new-instance v1, Ll/gmo0;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Ll/gmo0;-><init>(Ll/zmo0;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {v0, v1}, Ll/kwr;-><init>(Ll/x20;)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Ll/zmo0;->f:Ll/kwr;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final y0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zmo0;->d:Ll/rwn0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/call/api/VCallApiProvider;->getSelfCallInfo(Ljava/lang/String;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Ll/zmo0;->L1(Lrx/c;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/pmo0;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/pmo0;-><init>(Ll/zmo0;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void
.end method
