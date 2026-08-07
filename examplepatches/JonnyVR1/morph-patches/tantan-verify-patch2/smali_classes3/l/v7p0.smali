.class public Ll/v7p0;
.super Ll/atm0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/rwn0;",
        ">",
        "Ll/atm0<",
        "Ll/e6p0<",
        "TD;>;TD;>;"
    }
.end annotation


# static fields
.field public static final o:I

.field public static final p:I


# instance fields
.field public final k:Ll/xak0;

.field public l:Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;

.field public m:Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

.field public n:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/16 v0, 0xf

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->f(I)I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    sput v1, Ll/v7p0;->o:I

    .line 8
    .line 9
    invoke-static {v0}, Ll/qa00;->f(I)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    sput v0, Ll/v7p0;->p:I

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>(Ll/dum;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TD;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/atm0;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/xak0;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/xak0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/v7p0;->k:Ll/xak0;

    .line 10
    .line 11
    new-instance v0, Ll/e6p0;

    .line 12
    .line 13
    iget-object p1, p1, Ll/dum;->a:Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    invoke-direct {v0, p1, p0}, Ll/e6p0;-><init>(Lcom/p1/mobile/android/app/Act;Ll/v7p0;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ll/l6t;->C(Ll/iam;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private A4(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string v0, "voiceUserCard"

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {v0, p1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 13
    .line 14
    check-cast p1, Ll/e6p0;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/v7p0;->B4()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->isShowShadow()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    const/4 v1, 0x0

    .line 25
    invoke-virtual {p1, v0, v1, v1}, Ll/e6p0;->L0(ZLl/vak0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, v1}, Ll/atm0;->j4(Ll/vak0;)V

    .line 29
    .line 30
    .line 31
    invoke-direct {p0}, Ll/v7p0;->Y4()V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method private synthetic N4(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/v7p0;->z4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private Y4()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/v7p0;->B4()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/v7p0;->B4()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->isFromJs()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/xzs;->K2()Ll/t8s;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->WEBVIEW:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Ll/t8s;->m(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;)Z

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public static synthetic l4(Ll/v7p0;Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerUpdate;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/v7p0;->P4(Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerUpdate;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic m4(Ll/v7p0;ZLl/vak0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/v7p0;->J4(ZLl/vak0;)V

    return-void
.end method

.method public static synthetic n4(Ll/v7p0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInvite;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/v7p0;->H4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInvite;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic o4(Ll/v7p0;Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/v7p0;->L4(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;)V

    return-void
.end method

.method public static synthetic p4(Ljava/lang/Throwable;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic q4(Ll/v7p0;Ll/hrk0$a;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/v7p0;->O4(Ll/hrk0$a;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic r4(Ll/v7p0;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInvite;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/v7p0;->I4(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInvite;)V

    return-void
.end method

.method public static synthetic s4(Ll/v7p0;Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerUpdate;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/v7p0;->Q4(Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerUpdate;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic t4(Ll/v7p0;Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;Ll/uxj0;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/v7p0;->K4(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;Ll/uxj0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic u4(Ljava/lang/Throwable;)Ll/vak0;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public static synthetic v4(Ll/v7p0;Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerUpdate;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/v7p0;->R4(Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerUpdate;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic w4(Ll/v7p0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/v7p0;->A4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic x4(Ll/v7p0;Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;Ll/vak0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/v7p0;->M4(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;Ll/vak0;)V

    return-void
.end method

.method public static synthetic y4(Ll/v7p0;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/v7p0;->N4(Ll/vxj0;)V

    return-void
.end method


# virtual methods
.method public B4()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/v7p0;->l:Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;->userCardData:Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-object v0

    .line 10
    :cond_0
    iget-object p0, p0, Ll/v7p0;->m:Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 11
    .line 12
    return-object p0
.end method

.method public C4()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "voiceLive"

    .line 2
    .line 3
    return-object p0
.end method

.method public D4()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "voiceroom-"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/v7p0;->B4()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->getSource()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public E4(Ll/hrk0$a;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/rwn0;->P2()Ll/hrk0;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0}, Ll/v7p0;->B4()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->userId()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p1, v0}, Ll/hrk0;->l(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    iget-object v0, p0, Ll/v7p0;->n:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    iput-object p1, p0, Ll/v7p0;->n:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    check-cast p1, Ll/rwn0;

    .line 40
    .line 41
    invoke-virtual {p1}, Ll/rwn0;->p()Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-nez p1, :cond_0

    .line 46
    .line 47
    iget-object p1, p0, Ll/v7p0;->m:Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 48
    .line 49
    if-eqz p1, :cond_0

    .line 50
    .line 51
    const-string v0, "callUser"

    .line 52
    .line 53
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->setTo(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    :cond_0
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 57
    .line 58
    check-cast p1, Ll/e6p0;

    .line 59
    .line 60
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->isShowing()Z

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    if-eqz p1, :cond_3

    .line 65
    .line 66
    iget-object p1, p0, Ll/v7p0;->m:Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 67
    .line 68
    if-eqz p1, :cond_3

    .line 69
    .line 70
    const/4 v0, 0x1

    .line 71
    invoke-virtual {p0, p1, v0}, Ll/v7p0;->X4(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;Z)V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    check-cast v0, Ll/rwn0;

    .line 80
    .line 81
    invoke-virtual {v0}, Ll/rwn0;->p()Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-nez v0, :cond_2

    .line 86
    .line 87
    iget-object v0, p0, Ll/v7p0;->m:Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 88
    .line 89
    if-eqz v0, :cond_2

    .line 90
    .line 91
    const-string v1, "audience"

    .line 92
    .line 93
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->setTo(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    :cond_2
    iget-object v0, p0, Ll/v7p0;->n:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 97
    .line 98
    if-eqz v0, :cond_3

    .line 99
    .line 100
    if-nez p1, :cond_3

    .line 101
    .line 102
    const/4 p1, 0x0

    .line 103
    iput-object p1, p0, Ll/v7p0;->n:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 104
    .line 105
    invoke-virtual {p0}, Ll/v7p0;->z4()V

    .line 106
    .line 107
    .line 108
    :cond_3
    return-void
.end method

.method public F4(Ljava/lang/String;)Z
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
    invoke-virtual {p0, p1}, Ll/oo2;->S0(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public G4(Lcom/p1/mobile/putong/data/User;)V
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
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ll/rwn0;

    .line 18
    .line 19
    invoke-virtual {v1}, Ll/vp20;->k()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-static {v0, v1}, Ll/xak0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Ll/rwn0;

    .line 31
    .line 32
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 37
    .line 38
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/api/VCallApiProvider;->callInvite(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    new-instance v1, Ll/k7p0;

    .line 47
    .line 48
    invoke-direct {v1, p0}, Ll/k7p0;-><init>(Ll/v7p0;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    new-instance v1, Ll/l7p0;

    .line 56
    .line 57
    invoke-direct {v1, p0, p1}, Ll/l7p0;-><init>(Ll/v7p0;Lcom/p1/mobile/putong/data/User;)V

    .line 58
    .line 59
    .line 60
    new-instance p0, Ll/r5k;

    .line 61
    .line 62
    invoke-direct {p0}, Ll/r5k;-><init>()V

    .line 63
    .line 64
    .line 65
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public final synthetic H4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInvite;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/e6p0;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->isShowing()Z

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

.method public final synthetic I4(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInvite;)V
    .locals 1

    .line 1
    iget-object p2, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->vg:I

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 6
    .line 7
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p2, v0, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-static {p1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 19
    .line 20
    check-cast p0, Ll/e6p0;

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/e6p0;->e0()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final synthetic J4(ZLl/vak0;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/v7p0;->h4()Ll/vak0;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    invoke-direct {p0, p1}, Ll/v7p0;->A4(Ljava/lang/Throwable;)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object p2, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 13
    .line 14
    check-cast p2, Ll/e6p0;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/v7p0;->B4()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->isShowShadow()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    invoke-virtual {p0}, Ll/v7p0;->h4()Ll/vak0;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iget-object v2, p0, Ll/v7p0;->n:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 29
    .line 30
    invoke-virtual {p2, v0, v1, v2}, Ll/e6p0;->L0(ZLl/vak0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Ll/v7p0;->h4()Ll/vak0;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    invoke-virtual {p0, p2}, Ll/atm0;->j4(Ll/vak0;)V

    .line 38
    .line 39
    .line 40
    if-nez p1, :cond_1

    .line 41
    .line 42
    invoke-direct {p0}, Ll/v7p0;->Y4()V

    .line 43
    .line 44
    .line 45
    :cond_1
    invoke-virtual {p0}, Ll/v7p0;->P3()V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final synthetic K4(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;Ll/uxj0;)Lrx/c;
    .locals 9

    .line 1
    new-instance v0, Ll/gbk0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/gbk0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->userId()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    check-cast p2, Ll/rwn0;

    .line 15
    .line 16
    invoke-virtual {p2}, Ll/vp20;->k()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->getFromIdentity()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->getTo()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v4

    .line 28
    invoke-virtual {p0}, Ll/v7p0;->C4()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v5

    .line 32
    invoke-virtual {p0}, Ll/v7p0;->D4()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v6

    .line 36
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    check-cast p1, Ll/rwn0;

    .line 41
    .line 42
    invoke-virtual {p1}, Ll/vp20;->o()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v7

    .line 46
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    check-cast p0, Ll/rwn0;

    .line 51
    .line 52
    invoke-virtual {p0}, Ll/rwn0;->W0()Z

    .line 53
    .line 54
    .line 55
    move-result v8

    .line 56
    invoke-virtual/range {v0 .. v8}, Ll/gbk0;->p(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    return-object p0
.end method

.method public final synthetic L4(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;)V
    .locals 7

    .line 1
    iput-object p1, p0, Ll/v7p0;->m:Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/rwn0;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->userId()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Ll/hrk0;->l(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iput-object v0, p0, Ll/v7p0;->n:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 22
    .line 23
    iget-object v1, p0, Ll/v7p0;->k:Ll/xak0;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Ll/rwn0;

    .line 30
    .line 31
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Ll/rwn0;

    .line 40
    .line 41
    invoke-virtual {v0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 46
    .line 47
    iget-object v4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v5

    .line 53
    const-string v2, "p_audio_profile"

    .line 54
    .line 55
    move-object v6, p1

    .line 56
    invoke-virtual/range {v1 .. v6}, Ll/xak0;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public final synthetic M4(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;Ll/vak0;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;

    .line 2
    .line 3
    invoke-direct {v0, p2, p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;-><init>(Ll/vak0;Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/v7p0;->l:Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;

    .line 7
    .line 8
    return-void
.end method

.method public final synthetic O4(Ll/hrk0$a;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/e6p0;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->isShowing()Z

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

.method public P3()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/l6t;->b:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/v7p0;->l:Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/z8p0;->c(Ljava/util/Collection;Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;)V

    .line 10
    .line 11
    .line 12
    invoke-super {p0}, Ll/y8s;->P3()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic P4(Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerUpdate;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/e6p0;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->isShowing()Z

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

.method public final synthetic Q4(Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerUpdate;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v7p0;->m:Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public R3()V
    .locals 3
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    new-instance v0, Ll/e7p0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 4
    .line 5
    iget-object v2, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast v2, Ll/e6p0;

    .line 8
    .line 9
    iget-object v2, v2, Ll/e6p0;->q:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardMedalAndNameView;

    .line 10
    .line 11
    invoke-direct {v0, v1, v2}, Ll/e7p0;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardMedalAndNameView;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 15
    .line 16
    .line 17
    new-instance v0, Ll/y6p0;

    .line 18
    .line 19
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 20
    .line 21
    iget-object v2, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 22
    .line 23
    check-cast v2, Ll/e6p0;

    .line 24
    .line 25
    iget-object v2, v2, Ll/e6p0;->G:Lv/VImage;

    .line 26
    .line 27
    invoke-direct {v0, v1, v2}, Ll/y6p0;-><init>(Ll/dum;Lv/VImage;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 31
    .line 32
    .line 33
    new-instance v0, Ll/j8p0;

    .line 34
    .line 35
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 36
    .line 37
    invoke-direct {v0, v1}, Ll/j8p0;-><init>(Ll/dum;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 48
    .line 49
    if-eqz v0, :cond_0

    .line 50
    .line 51
    new-instance v0, Ll/i6p0;

    .line 52
    .line 53
    iget-object v2, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 54
    .line 55
    check-cast v2, Ll/e6p0;

    .line 56
    .line 57
    iget-object v2, v2, Ll/e6p0;->F:Lv/VText;

    .line 58
    .line 59
    invoke-direct {v0, v1, v2}, Ll/i6p0;-><init>(Ll/dum;Lv/VText;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_0
    new-instance v0, Ll/p6p0;

    .line 67
    .line 68
    iget-object v2, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 69
    .line 70
    check-cast v2, Ll/e6p0;

    .line 71
    .line 72
    iget-object v2, v2, Ll/e6p0;->F:Lv/VText;

    .line 73
    .line 74
    invoke-direct {v0, v1, v2}, Ll/p6p0;-><init>(Ll/dum;Lv/VText;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public final synthetic R4(Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerUpdate;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v7p0;->m:Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 2
    .line 3
    return-object p0
.end method

.method public S4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ljava/lang/String;)V
    .locals 1

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
    invoke-static {p2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    if-nez p2, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/v7p0;->B4()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->userId()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-virtual {p0, p2}, Ll/v7p0;->F4(Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    if-eqz p2, :cond_0

    .line 26
    .line 27
    const-string p2, "voice-manager"

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const-string p2, ""

    .line 31
    .line 32
    :goto_0
    invoke-static {p0, p1, p2}, Ll/ydn0;->g(Ll/i6t;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Ll/v7p0;->z4()V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public T4(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/v7p0;->z4()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->MemberEvent:Lcom/tantan/live/eventbus/LiveEventBus$MemberEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$MemberEvent;->dismiss()Ll/v3f$c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/v3f$c;->p()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ll/xzs;->K2()Ll/t8s;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->CALL_ANCHOR_CHECK_DIALOG:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ll/t8s;->m(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;)Z

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->chatInputClick()Ll/v3f$d;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    new-instance v1, Ll/vv4;

    .line 37
    .line 38
    const/4 v2, 0x1

    .line 39
    invoke-direct {v1, v2, p1}, Ll/vv4;-><init>(ZLjava/lang/String;)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Ll/v7p0;->l:Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;

    .line 43
    .line 44
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;->userCardData:Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 45
    .line 46
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->userId()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {v1, p1}, Ll/vv4;->a(Ljava/lang/String;)Ll/vv4;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    const-string v1, "3"

    .line 55
    .line 56
    invoke-virtual {p1, v1}, Ll/vv4;->b(Ljava/lang/String;)Ll/vv4;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-virtual {v0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->HourLeaderBoardEvent:Lcom/tantan/live/eventbus/LiveEventBus$HourLeaderBoardEvent;

    .line 68
    .line 69
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$HourLeaderBoardEvent;->show()Ll/v3f$d;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 74
    .line 75
    invoke-virtual {p1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->KnightGuardEvent:Lcom/tantan/live/eventbus/LiveEventBus$KnightGuardEvent;

    .line 83
    .line 84
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$KnightGuardEvent;->closeDialog()Ll/v3f$d;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    new-instance p1, Ll/y1r;

    .line 89
    .line 90
    const/16 v0, 0xed8

    .line 91
    .line 92
    invoke-direct {p1, v0}, Ll/y1r;-><init>(I)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {p1, v2}, Ll/y1r;->f(Z)Ll/y1r;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 100
    .line 101
    .line 102
    return-void
.end method

.method public U4(Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/atm0;->f4()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0}, Ll/v7p0;->h4()Ll/vak0;

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
    check-cast v2, Ll/rwn0;

    .line 20
    .line 21
    invoke-virtual {v2}, Ll/rwn0;->W0()Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    if-eqz v3, :cond_0

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    check-cast p0, Ll/rwn0;

    .line 36
    .line 37
    invoke-virtual {p0}, Ll/vp20;->o()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    goto :goto_0

    .line 42
    :cond_0
    const/4 p0, 0x0

    .line 43
    :goto_0
    const-string v3, "voicelive"

    .line 44
    .line 45
    invoke-static {v3, p0}, Ll/g7k0;->d(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-static {v0, v1, p1, v2, p0}, Ll/g7k0;->c(Landroid/content/Context;Ll/vak0;Ljava/lang/String;ZLjava/lang/String;)V

    .line 50
    .line 51
    .line 52
    :cond_1
    return-void
.end method

.method public V4(Ll/nsv;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/v7p0;->z4()V

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
    iget-object v1, p1, Ll/nsv;->a:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    iget-object v3, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v2, v3}, Ll/hrk0;->m(Ljava/lang/String;)Ll/nsv;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {v0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ll/hrk0;->l(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    if-nez v0, :cond_0

    .line 35
    .line 36
    invoke-static {p0, p1}, Ll/ydn0;->d(Ll/i6t;Ll/nsv;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    if-eqz v2, :cond_1

    .line 41
    .line 42
    invoke-static {p0, v0, v2}, Ll/ydn0;->h(Ll/i6t;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ll/nsv;)V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void
.end method

.method public W4(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/v7p0;->X4(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public X4(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;Z)V
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
    invoke-virtual {v0}, Ll/oo2;->m2()Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/s7p0;

    .line 12
    .line 13
    invoke-direct {v1}, Ll/s7p0;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lrx/c;->onErrorReturn(Ll/qcj;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/t7p0;

    .line 21
    .line 22
    invoke-direct {v1, p0, p1}, Ll/t7p0;-><init>(Ll/v7p0;Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/u7p0;

    .line 34
    .line 35
    invoke-direct {v1}, Ll/u7p0;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1}, Lrx/c;->onErrorReturn(Ll/qcj;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    new-instance v1, Ll/g7p0;

    .line 43
    .line 44
    invoke-direct {v1, p0, p1}, Ll/g7p0;-><init>(Ll/v7p0;Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v1}, Lrx/c;->doOnSubscribe(Ll/x20;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    new-instance v1, Ll/h7p0;

    .line 52
    .line 53
    invoke-direct {v1, p0, p1}, Ll/h7p0;-><init>(Ll/v7p0;Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {p1, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    new-instance v0, Ll/i7p0;

    .line 69
    .line 70
    invoke-direct {v0, p0, p2}, Ll/i7p0;-><init>(Ll/v7p0;Z)V

    .line 71
    .line 72
    .line 73
    new-instance p2, Ll/j7p0;

    .line 74
    .line 75
    invoke-direct {p2, p0}, Ll/j7p0;-><init>(Ll/v7p0;)V

    .line 76
    .line 77
    .line 78
    invoke-static {v0, p2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public c4()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "voiceLiveRoom"

    .line 2
    .line 3
    return-object p0
.end method

.method public h4()Ll/vak0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v7p0;->l:Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;->profileData:Ll/vak0;

    .line 4
    .line 5
    return-object p0
.end method

.method public i4()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/atm0;->i4()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p0, Ll/e6p0;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/e6p0;->D0()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->OpenUserCardDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;->show()Ll/v3f$d;

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
    new-instance v1, Ll/f7p0;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/f7p0;-><init>(Ll/v7p0;)V

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
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->OpenUserCardDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;->dismiss()Ll/v3f$c;

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
    new-instance v1, Ll/m7p0;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/m7p0;-><init>(Ll/v7p0;)V

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
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    check-cast v0, Ll/rwn0;

    .line 73
    .line 74
    invoke-virtual {v0}, Ll/rwn0;->Q2()Lrx/c;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    new-instance v1, Ll/n7p0;

    .line 83
    .line 84
    invoke-direct {v1, p0}, Ll/n7p0;-><init>(Ll/v7p0;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    new-instance v1, Ll/o7p0;

    .line 92
    .line 93
    invoke-direct {v1, p0}, Ll/o7p0;-><init>(Ll/v7p0;)V

    .line 94
    .line 95
    .line 96
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 101
    .line 102
    .line 103
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    check-cast v0, Ll/rwn0;

    .line 108
    .line 109
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    iget-object v0, v0, Ll/aj1;->c0:Lrx/subjects/b;

    .line 114
    .line 115
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    new-instance v1, Ll/p7p0;

    .line 120
    .line 121
    invoke-direct {v1, p0}, Ll/p7p0;-><init>(Ll/v7p0;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    new-instance v1, Ll/q7p0;

    .line 129
    .line 130
    invoke-direct {v1, p0}, Ll/q7p0;-><init>(Ll/v7p0;)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    new-instance v1, Ll/r7p0;

    .line 138
    .line 139
    invoke-direct {v1, p0}, Ll/r7p0;-><init>(Ll/v7p0;)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    new-instance v1, Ll/f7p0;

    .line 147
    .line 148
    invoke-direct {v1, p0}, Ll/f7p0;-><init>(Ll/v7p0;)V

    .line 149
    .line 150
    .line 151
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 156
    .line 157
    .line 158
    return-void
.end method

.method public z4()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/v7p0;->k:Ll/xak0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/xak0;->b()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    check-cast p0, Ll/e6p0;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method
