.class public abstract Ll/ixm0;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/rwn0;",
        ">",
        "Ll/i6t<",
        "TD;",
        "Ll/sam;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Ll/kcg0;

.field public j:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ll/wao0;",
            ">;"
        }
    .end annotation
.end field

.field public k:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;


# direct methods
.method public constructor <init>(Ll/dum;Ll/sam;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/ixm0;->j:Ljava/util/HashMap;

    .line 6
    .line 7
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 8
    .line 9
    .line 10
    new-instance v0, Ll/jhn0;

    .line 11
    .line 12
    invoke-direct {v0, p1, p2}, Ll/jhn0;-><init>(Ll/dum;Ll/sam;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private G4()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ixm0;->i:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Ll/rwn0;

    .line 11
    .line 12
    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ll/oo2;->i2(Ljava/util/concurrent/TimeUnit;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, v0}, Ll/i6t;->H3(Lrx/c;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/swm0;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/swm0;-><init>(Ll/ixm0;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iput-object v0, p0, Ll/ixm0;->i:Ll/kcg0;

    .line 36
    .line 37
    return-void
.end method

.method private H4(Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)V
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
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->userId:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/hrk0;->m(Ljava/lang/String;)Ll/nsv;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Ll/l6o0;->c(Ll/nsv;)Ll/l6o0;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v1, v0, Ll/l6o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 22
    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    iput-object p1, v0, Ll/l6o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Ll/rwn0;

    .line 39
    .line 40
    invoke-virtual {v0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->userId:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {v0, p1}, Ll/hrk0;->l(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    if-nez p1, :cond_1

    .line 51
    .line 52
    :goto_0
    return-void

    .line 53
    :cond_1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 54
    .line 55
    check-cast v0, Ll/sam;

    .line 56
    .line 57
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    check-cast p0, Ll/rwn0;

    .line 62
    .line 63
    invoke-virtual {p0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-interface {v0, p0, p1}, Ll/sam;->t2(Ll/hrk0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method private I4(Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Ll/rwn0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/hrk0;->p()Ljava/util/List;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/pwm0;

    .line 19
    .line 20
    invoke-direct {v1, p0, p1}, Ll/pwm0;-><init>(Ll/ixm0;Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static synthetic J3(Ll/ixm0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ixm0;->B4()V

    return-void
.end method

.method public static synthetic K3(Ll/ixm0;Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ixm0;->I4(Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;)V

    return-void
.end method

.method public static synthetic L3(Ll/ixm0;Ll/nfn0;)Lkotlin/Pair;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ixm0;->n4(Ll/nfn0;)Lkotlin/Pair;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic M3(Ll/ixm0;Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ixm0;->v4(Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;)V

    return-void
.end method

.method public static synthetic N3(Ll/ixm0;Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ixm0;->H4(Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)V

    return-void
.end method

.method public static synthetic O3(Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 1

    .line 1
    new-instance v0, Ll/ywm0;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/ywm0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallHatInfo;

    .line 11
    .line 12
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->setGrabHatGameInfo(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallHatInfo;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-string p1, "lovePoint"

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->setPointType(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static synthetic P3(Ll/ixm0;J)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ixm0;->h4(J)V

    return-void
.end method

.method public static synthetic R3(Ll/ixm0;Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/ixm0;->x4(Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    return-void
.end method

.method public static synthetic S3(Ll/ixm0;Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightResources;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ixm0;->q4(Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightResources;)V

    return-void
.end method

.method public static synthetic T3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallHatInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallHatInfo;->userId:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

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

.method public static synthetic U3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallHatInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallHatInfo;->userId:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

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

.method public static synthetic V3(Ll/ixm0;ZLcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/ixm0;->u4(ZLcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    return-void
.end method

.method public static synthetic W3(Ll/ixm0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ixm0;->o4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;)V

    return-void
.end method

.method public static synthetic X3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;->userId:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

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

.method public static synthetic Y3(Ll/ixm0;Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ixm0;->r4(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;)V

    return-void
.end method

.method public static synthetic Z3(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->category:I

    .line 2
    .line 3
    sget v0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->VOICE_CHAT_MIC_EMOJI_CATEGORY:I

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

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

.method public static synthetic a4(Ll/ixm0;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ixm0;->y4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V

    return-void
.end method

.method public static synthetic b4(Ll/ixm0;Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ixm0;->p4(Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;)V

    return-void
.end method

.method public static synthetic c4(Ll/hrk0$a;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallHatInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hrk0$a;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallHatInfo;->userId:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic d4(Ll/ixm0;Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$BossUserScore;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ixm0;->w4(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$BossUserScore;)V

    return-void
.end method

.method public static synthetic e4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;->callHatInfo:Ljava/util/List;

    .line 2
    .line 3
    new-instance v0, Ll/xwm0;

    .line 4
    .line 5
    invoke-direct {v0, p2}, Ll/xwm0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallHatInfo;

    .line 13
    .line 14
    invoke-virtual {p2, p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->setGrabHatGameInfo(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallHatInfo;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->setPointType(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private synthetic x4(Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 2

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;->volumes:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Ljava/lang/Float;

    .line 10
    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const v1, 0x3ca3d70a    # 0.02f

    .line 18
    .line 19
    .line 20
    cmpg-float v0, v0, v1

    .line 21
    .line 22
    if-ltz v0, :cond_1

    .line 23
    .line 24
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iget v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->volume:F

    .line 29
    .line 30
    cmpl-float v0, v0, v1

    .line 31
    .line 32
    if-nez v0, :cond_0

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const/4 v0, 0x1

    .line 36
    iput-boolean v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->isSpeak:Z

    .line 37
    .line 38
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    iput p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->volume:F

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_1
    :goto_0
    const/4 p1, 0x0

    .line 46
    iput-boolean p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->isSpeak:Z

    .line 47
    .line 48
    const/4 p1, 0x0

    .line 49
    iput p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->volume:F

    .line 50
    .line 51
    :goto_1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 52
    .line 53
    check-cast p0, Ll/sam;

    .line 54
    .line 55
    invoke-interface {p0, p2}, Ll/sam;->N1(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method


# virtual methods
.method public abstract A4(Ljava/lang/Integer;)V
.end method

.method public final B4()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/sam;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ll/rwn0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {v0, p0}, Ll/sam;->setData(Ll/hrk0;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final C4(Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
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
    invoke-virtual {v0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0, p1}, Ll/hrk0;->l(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 18
    .line 19
    check-cast p0, Ll/sam;

    .line 20
    .line 21
    invoke-interface {p0, p1, p2, p3, p4}, Ll/sam;->W1(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public D4(Ljava/lang/String;Ljava/lang/String;)V
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
    invoke-virtual {v0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0, p1}, Ll/hrk0;->l(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {p1, p2, v0}, Ll/v1n0;->f(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 16
    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 28
    .line 29
    check-cast p0, Ll/sam;

    .line 30
    .line 31
    iget p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 32
    .line 33
    invoke-interface {p0, p1, p2}, Ll/sam;->b1(ILjava/lang/String;)V

    .line 34
    .line 35
    .line 36
    :cond_1
    :goto_0
    return-void
.end method

.method public E4(I)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 4
    .line 5
    check-cast p0, Ll/sam;

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-interface {p0, p1, v0}, Ll/sam;->Q3(IZ)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public final F4(Ljava/lang/String;Ljava/util/List;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;",
            ">;",
            "Ljava/lang/String;",
            ")V"
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
    invoke-virtual {v0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0, p1}, Ll/hrk0;->l(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 18
    .line 19
    check-cast p0, Ll/sam;

    .line 20
    .line 21
    invoke-interface {p0, p1, p2, p3}, Ll/sam;->c1(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ljava/util/List;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
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
    invoke-static {p0}, Ll/ydn0;->m(Ll/i6t;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->CallEvent:Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;->memberVolume()Ll/v3f$d;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lrx/c;

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/nwm0;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/nwm0;-><init>(Ll/ixm0;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    new-instance v0, Ll/pgo0;

    .line 40
    .line 41
    invoke-direct {v0}, Ll/pgo0;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;

    .line 49
    .line 50
    iput-object v0, p0, Ll/ixm0;->k:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;

    .line 51
    .line 52
    return-void
.end method

.method public final f4(Ll/hrk0$a;)V
    .locals 2

    .line 1
    new-instance v0, Ll/x8k;

    .line 2
    .line 3
    const/16 v1, 0x2328

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/x8k;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;

    .line 13
    .line 14
    invoke-static {v0}, Ll/fln0;->c(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;->callHatInfo:Ljava/util/List;

    .line 21
    .line 22
    invoke-virtual {p1}, Ll/hrk0$a;->a()Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    iget-object p0, p1, Ll/hrk0$a;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 29
    .line 30
    new-instance v1, Ll/twm0;

    .line 31
    .line 32
    invoke-direct {v1, p1}, Ll/twm0;-><init>(Ll/hrk0$a;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallHatInfo;

    .line 40
    .line 41
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->setGrabHatGameInfo(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallHatInfo;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    const-string p1, "lovePoint"

    .line 46
    .line 47
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->setPointType(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    check-cast p0, Ll/rwn0;

    .line 56
    .line 57
    invoke-virtual {p0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p0}, Ll/hrk0;->p()Ljava/util/List;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    new-instance p1, Ll/uwm0;

    .line 66
    .line 67
    invoke-direct {p1, v0}, Ll/uwm0;-><init>(Ljava/util/List;)V

    .line 68
    .line 69
    .line 70
    invoke-static {p0, p1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 71
    .line 72
    .line 73
    :cond_1
    return-void
.end method

.method public final g4(Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;)Z
    .locals 3

    .line 1
    invoke-virtual {p0, p1}, Ll/ixm0;->t4(Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    check-cast v1, Ll/rwn0;

    .line 10
    .line 11
    invoke-virtual {v1}, Ll/rwn0;->P2()Ll/hrk0;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Ll/hrk0;->p()Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    new-instance v2, Ll/qwm0;

    .line 20
    .line 21
    invoke-direct {v2, p0, v0, p1}, Ll/qwm0;-><init>(Ll/ixm0;ZLcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;)V

    .line 22
    .line 23
    .line 24
    invoke-static {v1, v2}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 25
    .line 26
    .line 27
    return v0
.end method

.method public final h4(J)V
    .locals 7

    .line 1
    iget-object p1, p0, Ll/ixm0;->j:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    if-eqz p2, :cond_5

    .line 16
    .line 17
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    check-cast p2, Ljava/lang/String;

    .line 22
    .line 23
    iget-object v0, p0, Ll/ixm0;->j:Ljava/util/HashMap;

    .line 24
    .line 25
    invoke-virtual {v0, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Ll/wao0;

    .line 30
    .line 31
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 32
    .line 33
    .line 34
    move-result-wide v1

    .line 35
    invoke-virtual {v0}, Ll/wao0;->a()J

    .line 36
    .line 37
    .line 38
    move-result-wide v3

    .line 39
    sub-long/2addr v1, v3

    .line 40
    invoke-virtual {v0}, Ll/wao0;->c()J

    .line 41
    .line 42
    .line 43
    move-result-wide v3

    .line 44
    const-wide/16 v5, 0x3e8

    .line 45
    .line 46
    mul-long/2addr v3, v5

    .line 47
    cmp-long v1, v1, v3

    .line 48
    .line 49
    if-ltz v1, :cond_0

    .line 50
    .line 51
    invoke-virtual {v0}, Ll/wao0;->b()I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    sget v2, Ll/wao0;->f:I

    .line 56
    .line 57
    if-ne v1, v2, :cond_3

    .line 58
    .line 59
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 60
    .line 61
    .line 62
    move-result-wide v1

    .line 63
    invoke-virtual {v0, v1, v2}, Ll/wao0;->i(J)V

    .line 64
    .line 65
    .line 66
    sget v1, Ll/wao0;->g:I

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Ll/wao0;->j(I)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0}, Ll/wao0;->h()Z

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    if-eqz v1, :cond_2

    .line 76
    .line 77
    invoke-virtual {v0}, Ll/wao0;->f()J

    .line 78
    .line 79
    .line 80
    move-result-wide v1

    .line 81
    const-wide/16 v3, 0x0

    .line 82
    .line 83
    cmp-long v1, v1, v3

    .line 84
    .line 85
    if-gtz v1, :cond_1

    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_1
    invoke-virtual {v0}, Ll/wao0;->d()Ljava/util/List;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    invoke-virtual {v0}, Ll/wao0;->e()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    invoke-virtual {p0, p2, v1, v2}, Ll/ixm0;->F4(Ljava/lang/String;Ljava/util/List;Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    goto :goto_2

    .line 100
    :cond_2
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->remove()V

    .line 101
    .line 102
    .line 103
    invoke-virtual {p0, p2}, Ll/ixm0;->s4(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    goto :goto_2

    .line 107
    :cond_3
    invoke-virtual {v0}, Ll/wao0;->b()I

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    sget v2, Ll/wao0;->g:I

    .line 112
    .line 113
    if-ne v1, v2, :cond_4

    .line 114
    .line 115
    invoke-interface {p1}, Ljava/util/Iterator;->remove()V

    .line 116
    .line 117
    .line 118
    invoke-virtual {p0, p2}, Ll/ixm0;->s4(Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    :cond_4
    :goto_2
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 122
    .line 123
    .line 124
    move-result-object p2

    .line 125
    iget-object p2, p2, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceMicEmojiEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceMicEmojiEvent;

    .line 126
    .line 127
    invoke-virtual {p2}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceMicEmojiEvent;->changeMicEmojiState()Ll/v3f$d;

    .line 128
    .line 129
    .line 130
    move-result-object p2

    .line 131
    invoke-virtual {p2, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 132
    .line 133
    .line 134
    goto :goto_0

    .line 135
    :cond_5
    iget-object p1, p0, Ll/ixm0;->j:Ljava/util/HashMap;

    .line 136
    .line 137
    invoke-virtual {p1}, Ljava/util/HashMap;->isEmpty()Z

    .line 138
    .line 139
    .line 140
    move-result p1

    .line 141
    if-eqz p1, :cond_6

    .line 142
    .line 143
    iget-object p0, p0, Ll/ixm0;->i:Ll/kcg0;

    .line 144
    .line 145
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 146
    .line 147
    .line 148
    :cond_6
    return-void
.end method

.method public i4(Ljava/lang/Integer;)V
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
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-virtual {v0, v1}, Ll/hrk0;->k(I)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ll/ixm0;->A4(Ljava/lang/Integer;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Ll/rwn0;

    .line 30
    .line 31
    invoke-virtual {v1}, Ll/rwn0;->P2()Ll/hrk0;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v1, p1}, Ll/hrk0;->o(Ljava/lang/Integer;)Ll/nsv;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-eqz v1, :cond_1

    .line 44
    .line 45
    invoke-virtual {p0, v0, p1}, Ll/ixm0;->z4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ll/nsv;)V

    .line 46
    .line 47
    .line 48
    :cond_1
    return-void
.end method

.method public j4(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;I)Ljava/lang/String;
    .locals 2

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    if-eqz p2, :cond_4

    .line 4
    .line 5
    iget-boolean v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->enable:Z

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 11
    .line 12
    instance-of p0, p0, Ll/m3p0;

    .line 13
    .line 14
    if-eqz p0, :cond_2

    .line 15
    .line 16
    if-nez p3, :cond_2

    .line 17
    .line 18
    iget-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->leftUserId:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    iget-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->leftBigUrl:Ljava/lang/String;

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_1
    iget-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->rightUserId:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_4

    .line 36
    .line 37
    iget-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->rightBigUrl:Ljava/lang/String;

    .line 38
    .line 39
    return-object p0

    .line 40
    :cond_2
    iget-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->leftUserId:Ljava/lang/String;

    .line 41
    .line 42
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    if-eqz p0, :cond_3

    .line 47
    .line 48
    iget-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->leftUrl:Ljava/lang/String;

    .line 49
    .line 50
    return-object p0

    .line 51
    :cond_3
    iget-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->rightUserId:Ljava/lang/String;

    .line 52
    .line 53
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    if-eqz p0, :cond_4

    .line 58
    .line 59
    iget-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->rightUrl:Ljava/lang/String;

    .line 60
    .line 61
    return-object p0

    .line 62
    :cond_4
    :goto_0
    return-object v0
.end method

.method public k4()Ljava/util/HashMap;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ll/wao0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ixm0;->j:Ljava/util/HashMap;

    .line 2
    .line 3
    return-object p0
.end method

.method public l4(Ljava/lang/String;)Ll/wao0;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ixm0;->j:Ljava/util/HashMap;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/ixm0;->j:Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Ll/wao0;

    .line 18
    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return-object p0
.end method

.method public m4(Ll/hrk0$a;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ixm0;->k:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/ixm0;->g4(Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/ixm0;->f4(Ll/hrk0$a;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget v0, p1, Ll/hrk0$a;->b:I

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    if-ne v0, v1, :cond_1

    .line 16
    .line 17
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 18
    .line 19
    check-cast p1, Ll/sam;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, Ll/rwn0;

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-interface {p1, p0}, Ll/sam;->setData(Ll/hrk0;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    const/4 v1, 0x3

    .line 36
    if-ne v0, v1, :cond_2

    .line 37
    .line 38
    invoke-virtual {p1}, Ll/hrk0$a;->a()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_2

    .line 43
    .line 44
    iget-object p1, p1, Ll/hrk0$a;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 45
    .line 46
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 47
    .line 48
    invoke-virtual {p0, p1}, Ll/ixm0;->E4(I)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_2
    iget v0, p1, Ll/hrk0$a;->b:I

    .line 53
    .line 54
    const/4 v1, 0x2

    .line 55
    if-ne v0, v1, :cond_3

    .line 56
    .line 57
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 58
    .line 59
    check-cast v0, Ll/sam;

    .line 60
    .line 61
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    check-cast p0, Ll/rwn0;

    .line 66
    .line 67
    invoke-virtual {p0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    iget-object p1, p1, Ll/hrk0$a;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 72
    .line 73
    invoke-interface {v0, p0, p1}, Ll/sam;->t2(Ll/hrk0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_3
    const/4 v1, 0x4

    .line 78
    if-ne v0, v1, :cond_4

    .line 79
    .line 80
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 81
    .line 82
    check-cast v0, Ll/sam;

    .line 83
    .line 84
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    check-cast p0, Ll/rwn0;

    .line 89
    .line 90
    invoke-virtual {p0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    iget-object p1, p1, Ll/hrk0$a;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 95
    .line 96
    invoke-interface {v0, p0, p1}, Ll/sam;->t2(Ll/hrk0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 97
    .line 98
    .line 99
    return-void

    .line 100
    :cond_4
    const/4 v1, 0x5

    .line 101
    if-ne v0, v1, :cond_5

    .line 102
    .line 103
    iget-object v0, p1, Ll/hrk0$a;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 104
    .line 105
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->intendPosition:I

    .line 106
    .line 107
    invoke-virtual {p0, v0}, Ll/ixm0;->E4(I)V

    .line 108
    .line 109
    .line 110
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 111
    .line 112
    check-cast v0, Ll/sam;

    .line 113
    .line 114
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    check-cast p0, Ll/rwn0;

    .line 119
    .line 120
    invoke-virtual {p0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    iget-object p1, p1, Ll/hrk0$a;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 125
    .line 126
    invoke-interface {v0, p0, p1}, Ll/sam;->t2(Ll/hrk0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 127
    .line 128
    .line 129
    :cond_5
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/ixm0;->i:Ll/kcg0;

    .line 5
    .line 6
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final n4(Ll/nfn0;)Lkotlin/Pair;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nfn0;",
            ")",
            "Lkotlin/Pair<",
            "[I",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    const/4 v2, 0x2

    .line 7
    new-array v3, v2, [I

    .line 8
    .line 9
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 10
    .line 11
    instance-of v4, p0, Ll/rs2;

    .line 12
    .line 13
    if-eqz v4, :cond_2

    .line 14
    .line 15
    check-cast p0, Ll/rs2;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/rs2;->d()Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    iget p1, p1, Ll/nfn0;->c:I

    .line 22
    .line 23
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;

    .line 28
    .line 29
    if-nez p0, :cond_0

    .line 30
    .line 31
    new-instance p0, Lkotlin/Pair;

    .line 32
    .line 33
    new-array p1, v2, [I

    .line 34
    .line 35
    invoke-direct {p0, p1, v1}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    return-object p0

    .line 39
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;->getAvatarView()Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    if-nez p0, :cond_1

    .line 44
    .line 45
    new-instance p0, Lkotlin/Pair;

    .line 46
    .line 47
    new-array p1, v2, [I

    .line 48
    .line 49
    invoke-direct {p0, p1, v1}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    return-object p0

    .line 53
    :cond_1
    invoke-virtual {p0, v3}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 54
    .line 55
    .line 56
    aget p1, v3, v0

    .line 57
    .line 58
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    div-int/2addr v1, v2

    .line 63
    add-int/2addr p1, v1

    .line 64
    aput p1, v3, v0

    .line 65
    .line 66
    const/4 p1, 0x1

    .line 67
    aget v0, v3, p1

    .line 68
    .line 69
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    div-int/2addr p0, v2

    .line 74
    add-int/2addr v0, p0

    .line 75
    aput v0, v3, p1

    .line 76
    .line 77
    new-instance p0, Lkotlin/Pair;

    .line 78
    .line 79
    const/high16 p1, 0x42480000    # 50.0f

    .line 80
    .line 81
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-direct {p0, v3, p1}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 90
    .line 91
    .line 92
    return-object p0

    .line 93
    :cond_2
    new-instance p0, Lkotlin/Pair;

    .line 94
    .line 95
    new-array p1, v2, [I

    .line 96
    .line 97
    invoke-direct {p0, p1, v1}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 98
    .line 99
    .line 100
    return-object p0
.end method

.method public final o4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;)V
    .locals 3

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-static {p1}, Ll/fln0;->a(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string v0, "lovePoint"

    .line 11
    .line 12
    goto :goto_1

    .line 13
    :cond_1
    :goto_0
    const-string v0, "defaultPoint"

    .line 14
    .line 15
    :goto_1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Ll/rwn0;

    .line 20
    .line 21
    invoke-virtual {v1}, Ll/rwn0;->P2()Ll/hrk0;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v1}, Ll/hrk0;->p()Ljava/util/List;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    new-instance v2, Ll/owm0;

    .line 30
    .line 31
    invoke-direct {v2, p1, v0}, Ll/owm0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v1, v2}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 38
    .line 39
    check-cast p1, Ll/sam;

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    check-cast p0, Ll/rwn0;

    .line 46
    .line 47
    invoke-virtual {p0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-interface {p1, p0}, Ll/sam;->setData(Ll/hrk0;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public final p4(Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ixm0;->k:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/ixm0;->t4(Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/ixm0;->t4(Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

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
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;->updateDeputyEvent()Ll/v3f$c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Ll/v3f$c;->p()V

    .line 26
    .line 27
    .line 28
    :cond_0
    iput-object p1, p0, Ll/ixm0;->k:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Ll/ixm0;->g4(Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;)Z

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 34
    .line 35
    check-cast p1, Ll/sam;

    .line 36
    .line 37
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    check-cast p0, Ll/rwn0;

    .line 42
    .line 43
    invoke-virtual {p0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-interface {p1, p0}, Ll/sam;->setData(Ll/hrk0;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final q4(Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightResources;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightResources;->getUserLiveRightsList()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Ll/vwm0;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/vwm0;-><init>(Ll/ixm0;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p1, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final r4(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ixm0;->k:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/ixm0;->t4(Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore;->getBossUserScoreList()Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    new-instance v0, Ll/rwm0;

    .line 21
    .line 22
    invoke-direct {v0, p0}, Ll/rwm0;-><init>(Ll/ixm0;)V

    .line 23
    .line 24
    .line 25
    invoke-static {p1, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 26
    .line 27
    .line 28
    :cond_1
    :goto_0
    return-void
.end method

.method public final s4(Ljava/lang/String;)V
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
    invoke-virtual {v0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0, p1}, Ll/hrk0;->l(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 18
    .line 19
    check-cast p0, Ll/sam;

    .line 20
    .line 21
    invoke-interface {p0, p1}, Ll/sam;->j2(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public t()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast v0, Ll/sam;

    .line 7
    .line 8
    invoke-interface {v0}, Ll/sam;->t()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ll/rwn0;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/rwn0;->Q2()Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Ll/lwm0;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/lwm0;-><init>(Ll/ixm0;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Ll/rwn0;

    .line 42
    .line 43
    invoke-virtual {v0}, Ll/rwn0;->E3()Lrx/c;

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
    new-instance v1, Ll/axm0;

    .line 52
    .line 53
    invoke-direct {v1, p0}, Ll/axm0;-><init>(Ll/ixm0;)V

    .line 54
    .line 55
    .line 56
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    check-cast v0, Ll/rwn0;

    .line 68
    .line 69
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {v0}, Ll/aj1;->n0()Lrx/c;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    new-instance v1, Ll/bxm0;

    .line 82
    .line 83
    invoke-direct {v1, p0}, Ll/bxm0;-><init>(Ll/ixm0;)V

    .line 84
    .line 85
    .line 86
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 91
    .line 92
    .line 93
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceGrabHatEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceGrabHatEvent;

    .line 98
    .line 99
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceGrabHatEvent;->gameInfo()Ll/v3f$d;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    check-cast v0, Lrx/c;

    .line 108
    .line 109
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    new-instance v1, Ll/cxm0;

    .line 114
    .line 115
    invoke-direct {v1, p0}, Ll/cxm0;-><init>(Ll/ixm0;)V

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
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    check-cast v0, Ll/rwn0;

    .line 130
    .line 131
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    invoke-virtual {v0}, Ll/aj1;->d1()Lrx/c;

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
    new-instance v1, Ll/dxm0;

    .line 144
    .line 145
    invoke-direct {v1}, Ll/dxm0;-><init>()V

    .line 146
    .line 147
    .line 148
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    new-instance v1, Ll/exm0;

    .line 153
    .line 154
    invoke-direct {v1, p0}, Ll/exm0;-><init>(Ll/ixm0;)V

    .line 155
    .line 156
    .line 157
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 158
    .line 159
    .line 160
    move-result-object v1

    .line 161
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 162
    .line 163
    .line 164
    new-instance v0, Ll/fxm0;

    .line 165
    .line 166
    invoke-direct {v0, p0}, Ll/fxm0;-><init>(Ll/ixm0;)V

    .line 167
    .line 168
    .line 169
    const-class v1, Ll/nfn0;

    .line 170
    .line 171
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 172
    .line 173
    .line 174
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    check-cast v0, Ll/rwn0;

    .line 179
    .line 180
    invoke-virtual {v0}, Ll/oo2;->Y()Ll/cxl;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    invoke-virtual {v0}, Ll/cxl;->d()Lrx/c;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    new-instance v1, Ll/gxm0;

    .line 193
    .line 194
    invoke-direct {v1}, Ll/gxm0;-><init>()V

    .line 195
    .line 196
    .line 197
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    const-wide/16 v1, 0x4e20

    .line 202
    .line 203
    invoke-virtual {v0, v1, v2}, Lrx/c;->onBackpressureBuffer(J)Lrx/c;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 208
    .line 209
    .line 210
    move-result-object v1

    .line 211
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 212
    .line 213
    .line 214
    move-result-object v0

    .line 215
    new-instance v1, Ll/hxm0;

    .line 216
    .line 217
    invoke-direct {v1, p0}, Ll/hxm0;-><init>(Ll/ixm0;)V

    .line 218
    .line 219
    .line 220
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 221
    .line 222
    .line 223
    move-result-object v1

    .line 224
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 225
    .line 226
    .line 227
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoicePkEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoicePkEvent;

    .line 232
    .line 233
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoicePkEvent;->onVoicePkChange()Ll/v3f$d;

    .line 234
    .line 235
    .line 236
    move-result-object v0

    .line 237
    new-instance v1, Ll/mwm0;

    .line 238
    .line 239
    invoke-direct {v1, p0}, Ll/mwm0;-><init>(Ll/ixm0;)V

    .line 240
    .line 241
    .line 242
    invoke-virtual {p0, v0, v1}, Ll/i6t;->h3(Ll/v3f$b;Ll/y20;)V

    .line 243
    .line 244
    .line 245
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 246
    .line 247
    .line 248
    move-result-object v0

    .line 249
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceRoomBgEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceRoomBgEvent;

    .line 250
    .line 251
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceRoomBgEvent;->onRoomBgChanged()Ll/v3f$c;

    .line 252
    .line 253
    .line 254
    move-result-object v0

    .line 255
    new-instance v1, Ll/wwm0;

    .line 256
    .line 257
    invoke-direct {v1, p0}, Ll/wwm0;-><init>(Ll/ixm0;)V

    .line 258
    .line 259
    .line 260
    invoke-virtual {p0, v0, v1}, Ll/i6t;->g3(Ll/v3f$b;Ll/x20;)V

    .line 261
    .line 262
    .line 263
    return-void
.end method

.method public final t4(Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;)Z
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->enable:Z

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-wide p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->endMill:J

    .line 8
    .line 9
    const-wide/16 v0, 0x0

    .line 10
    .line 11
    cmp-long p0, p0, v0

    .line 12
    .line 13
    if-lez p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public final synthetic u4(ZLcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkCallInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkCallInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz p1, :cond_1

    .line 6
    .line 7
    const-string p1, "pkPoint"

    .line 8
    .line 9
    iput-object p1, p3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->pointType:Ljava/lang/String;

    .line 10
    .line 11
    iget-object p1, p3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 12
    .line 13
    iput-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkCallInfo;->userId:Ljava/lang/String;

    .line 14
    .line 15
    iget-object p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->onCallPoints:Ljava/util/List;

    .line 16
    .line 17
    new-instance v1, Ll/zwm0;

    .line 18
    .line 19
    invoke-direct {v1, p3}, Ll/zwm0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 20
    .line 21
    .line 22
    invoke-static {p1, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;

    .line 27
    .line 28
    if-eqz p1, :cond_0

    .line 29
    .line 30
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;->point:J

    .line 31
    .line 32
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkCallInfo;->point:J

    .line 33
    .line 34
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;->isNewTopOne:Z

    .line 35
    .line 36
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkCallInfo;->isNewTopOne:Z

    .line 37
    .line 38
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;->isScoreChange:Z

    .line 39
    .line 40
    iput-boolean p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkCallInfo;->isShowAnim:Z

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    const-wide/16 v1, 0x0

    .line 44
    .line 45
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkCallInfo;->point:J

    .line 46
    .line 47
    const/4 p1, 0x0

    .line 48
    iput-boolean p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkCallInfo;->isNewTopOne:Z

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    const-string p1, "defaultPoint"

    .line 52
    .line 53
    iput-object p1, p3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->pointType:Ljava/lang/String;

    .line 54
    .line 55
    :goto_0
    iput-object v0, p3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->pkCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkCallInfo;

    .line 56
    .line 57
    iget-object p1, p3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 58
    .line 59
    iget p3, p3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 60
    .line 61
    invoke-virtual {p0, p1, p2, p3}, Ll/ixm0;->j4(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;I)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkCallInfo;->mvpBg:Ljava/lang/String;

    .line 66
    .line 67
    return-void
.end method

.method public final synthetic v4(Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->getAttribute()Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->getAvatarConfig()Lcom/p1/mobile/longlink/msg/liveright/liveRight$AvatarConfig;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AvatarConfig;->getConnectorImage()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->getUserId()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, p1, v0}, Ll/ixm0;->D4(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic w4(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$BossUserScore;)V
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
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$BossUserScore;->getUserId()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Ll/hrk0;->l(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$BossUserScore;->getPopularity()J

    .line 26
    .line 27
    .line 28
    move-result-wide v1

    .line 29
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->popularity:J

    .line 30
    .line 31
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceNineMicUserScore$VoiceLiveBossUserScore$BossUserScore;->getContribution()J

    .line 32
    .line 33
    .line 34
    move-result-wide v1

    .line 35
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->contribution:J

    .line 36
    .line 37
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 38
    .line 39
    check-cast p1, Ll/sam;

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    check-cast p0, Ll/rwn0;

    .line 46
    .line 47
    invoke-virtual {p0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-interface {p1, p0, v0}, Ll/sam;->t2(Ll/hrk0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 52
    .line 53
    .line 54
    :cond_0
    return-void
.end method

.method public final synthetic y4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V
    .locals 5

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->liveUserInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;->userId:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_3

    .line 12
    .line 13
    iget-object v0, p0, Ll/ixm0;->j:Ljava/util/HashMap;

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    new-instance v0, Ljava/util/HashMap;

    .line 18
    .line 19
    const/16 v1, 0xa

    .line 20
    .line 21
    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Ll/ixm0;->j:Ljava/util/HashMap;

    .line 25
    .line 26
    :cond_0
    iget-object v0, p0, Ll/ixm0;->j:Ljava/util/HashMap;

    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_1

    .line 33
    .line 34
    invoke-direct {p0}, Ll/ixm0;->G4()V

    .line 35
    .line 36
    .line 37
    :cond_1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->liveUserInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;

    .line 38
    .line 39
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;->userId:Ljava/lang/String;

    .line 40
    .line 41
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;->emojiResult:Ljava/util/List;

    .line 42
    .line 43
    iget-object v2, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;->emojiType:Ljava/lang/String;

    .line 44
    .line 45
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;->mid:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {p0, v0}, Ll/ixm0;->l4(Ljava/lang/String;)Ll/wao0;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    if-eqz v3, :cond_2

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    iget-object v4, v4, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceMicEmojiEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceMicEmojiEvent;

    .line 58
    .line 59
    invoke-virtual {v4}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceMicEmojiEvent;->changeMicEmojiState()Ll/v3f$d;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    invoke-virtual {v4, v3}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 64
    .line 65
    .line 66
    :cond_2
    new-instance v3, Ll/wao0;

    .line 67
    .line 68
    sget v4, Ll/wao0;->f:I

    .line 69
    .line 70
    invoke-direct {v3, v1, v2, v4, p1}, Ll/wao0;-><init>(Ljava/util/List;Ljava/lang/String;ILjava/lang/String;)V

    .line 71
    .line 72
    .line 73
    iget-object v4, p0, Ll/ixm0;->j:Ljava/util/HashMap;

    .line 74
    .line 75
    invoke-virtual {v4, v0, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    invoke-virtual {p0, v0, v1, v2, p1}, Ll/ixm0;->C4(Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    :cond_3
    return-void
.end method

.method public abstract z4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ll/nsv;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            "Ll/nsv<",
            "Ll/h64;",
            ">;)V"
        }
    .end annotation
.end method
