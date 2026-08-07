.class public Ll/k0m0;
.super Ll/i6t;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a$a;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/rwn0;",
        "Lcom/p1/mobile/putong/live/livingroom/virtual/game/VirtualGamePanelViewModel;",
        ">;",
        "Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a$a;"
    }
.end annotation


# instance fields
.field public i:Ll/whn0;

.field public j:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGame;

.field public k:Z

.field public l:I


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/rwn0;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/k0m0;->k:Z

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput v0, p0, Ll/k0m0;->l:I

    .line 9
    .line 10
    new-instance v0, Ll/whn0;

    .line 11
    .line 12
    iget-object p1, p1, Ll/dum;->a:Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    invoke-direct {v0, p1}, Ll/whn0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/k0m0;->i:Ll/whn0;

    .line 18
    .line 19
    return-void
.end method

.method public static synthetic J3(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic K3(Ll/k0m0;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/k0m0;->j4(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic L3(Ll/y20;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    const-string p1, "intl_sud_sdk"

    .line 5
    .line 6
    const-string v0, "load  sud sdk failed"

    .line 7
    .line 8
    invoke-static {p1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic M3(Ll/k0m0;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/k0m0;->m4(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic N3(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic O3(Ll/y20;Lcom/tantanapp/sharedlibrary/loader/LoadEvent;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;->c()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public static synthetic P3(Ll/k0m0;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveGameTypeMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/k0m0;->o4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveGameTypeMessage;)V

    return-void
.end method

.method public static synthetic R3(Ll/k0m0;Ll/vjj;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/k0m0;->i4(Ll/vjj;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic S3(Ll/k0m0;Ll/hrk0$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/k0m0;->p4(Ll/hrk0$a;)V

    return-void
.end method

.method public static synthetic T3(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic U3(Ll/k0m0;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveTemplateMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/k0m0;->n4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveTemplateMessage;)V

    return-void
.end method

.method public static synthetic V3(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveTemplateMessage;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "game"

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveTemplateMessage;->getTemplate()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

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

.method public static synthetic W3(Ll/k0m0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCanJoinGame;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/k0m0;->l4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCanJoinGame;)V

    return-void
.end method

.method public static synthetic X3(Ll/k0m0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/k0m0;->h4()V

    return-void
.end method

.method public static synthetic Y3(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic Z3(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic a4(Ll/k0m0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/k0m0;->k4()V

    return-void
.end method

.method public static synthetic b4(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic c4(Ll/k0m0;Ll/nfn0;)Lkotlin/Pair;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/k0m0;->f4(Ll/nfn0;)Lkotlin/Pair;

    move-result-object p0

    return-object p0
.end method

.method private d4(Ll/y20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/elt;->v()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/elt;->w()Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance v0, Ll/j0m0;

    .line 16
    .line 17
    invoke-direct {v0, p1}, Ll/j0m0;-><init>(Ll/y20;)V

    .line 18
    .line 19
    .line 20
    new-instance v1, Ll/rzl0;

    .line 21
    .line 22
    invoke-direct {v1, p1}, Ll/rzl0;-><init>(Ll/y20;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 34
    .line 35
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method private f4(Ll/nfn0;)Lkotlin/Pair;
    .locals 0
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
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/game/VirtualGamePanelViewModel;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/game/VirtualGamePanelViewModel;->d:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/VirtualVoiceMembersView;

    .line 6
    .line 7
    iget-object p1, p1, Ll/nfn0;->d:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/VirtualVoiceMembersView;->u(Ljava/lang/String;)Lkotlin/Pair;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method private synthetic j4(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/k0m0;->i:Ll/whn0;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->x()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 12
    .line 13
    if-ne p1, v0, :cond_1

    .line 14
    .line 15
    iget-object p0, p0, Ll/k0m0;->i:Ll/whn0;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->z()V

    .line 18
    .line 19
    .line 20
    :cond_1
    return-void
.end method

.method private synthetic m4(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-direct {p0}, Ll/k0m0;->s4()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/k0m0;->r4()V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->F9:I

    .line 15
    .line 16
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private s4()V
    .locals 5

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameViewInfoModel$GameViewRectModel;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameViewInfoModel$GameViewRectModel;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    iput v1, v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameViewInfoModel$GameViewRectModel;->left:I

    .line 8
    .line 9
    const/high16 v2, 0x43170000    # 151.0f

    .line 10
    .line 11
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-static {v3}, Ll/bnl0;->G0(Z)I

    .line 17
    .line 18
    .line 19
    move-result v4

    .line 20
    add-int/2addr v2, v4

    .line 21
    iput v2, v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameViewInfoModel$GameViewRectModel;->top:I

    .line 22
    .line 23
    iput v1, v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameViewInfoModel$GameViewRectModel;->right:I

    .line 24
    .line 25
    const/high16 v2, 0x43480000    # 200.0f

    .line 26
    .line 27
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    iput v2, v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameViewInfoModel$GameViewRectModel;->bottom:I

    .line 32
    .line 33
    iget-object p0, p0, Ll/k0m0;->i:Ll/whn0;

    .line 34
    .line 35
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a;->k:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameViewInfoModel$GameViewRectModel;

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a;->G()Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel;->ui:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$GameUi;

    .line 42
    .line 43
    iget-object v2, v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$GameUi;->ping:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$GamePing;

    .line 44
    .line 45
    iput-boolean v1, v2, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$GamePing;->hide:Z

    .line 46
    .line 47
    iget-object v2, v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$GameUi;->join_btn:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$GameJoinBtn;

    .line 48
    .line 49
    iput-boolean v3, v2, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$GameJoinBtn;->custom:Z

    .line 50
    .line 51
    iget-object v2, v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$GameUi;->lobby_players:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$GameLobbyPlayers;

    .line 52
    .line 53
    iput-boolean v3, v2, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$GameLobbyPlayers;->custom:Z

    .line 54
    .line 55
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$GameUi;->game_bg:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$GameBg;

    .line 56
    .line 57
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$GameBg;->hide:Z

    .line 58
    .line 59
    invoke-static {}, Ll/i9n;->d()Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel;->gameCPU:I

    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel;->ui:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$GameUi;

    .line 66
    .line 67
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$GameUi;->lobby_game_setting:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$GameLobbyGameSetting;

    .line 68
    .line 69
    iput-boolean v3, v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$GameLobbyGameSetting;->hide:Z

    .line 70
    .line 71
    iput v3, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel;->gameSoundControl:I

    .line 72
    .line 73
    invoke-static {}, Ltech/sud/mgp/core/SudMGP;->getCfg()Ltech/sud/gip/core/ISudCfg;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-interface {p0, v1}, Ltech/sud/gip/core/ISudCfg;->setShowLoadingGameBg(Z)V

    .line 78
    .line 79
    .line 80
    return-void
.end method


# virtual methods
.method public J0()V
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
    invoke-virtual {v0}, Ll/hrk0;->r()Ll/ado0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 16
    .line 17
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Ll/ado0;->C(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/k0m0;->h4()V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    new-instance v0, Ll/bzm0;

    .line 32
    .line 33
    invoke-direct {v0}, Ll/bzm0;-><init>()V

    .line 34
    .line 35
    .line 36
    new-instance v1, Ll/uzl0;

    .line 37
    .line 38
    invoke-direct {v1, p0}, Ll/uzl0;-><init>(Ll/k0m0;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v1}, Ll/bzm0;->a(Ll/x20;)Ll/bzm0;

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;->callApplyEvent()Ll/v3f$d;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public Q0(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameSound;)V
    .locals 5

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a$a;->Q0(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameSound;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/k210;

    .line 5
    .line 6
    const/16 v1, 0x1b64

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ll/k210;-><init>(I)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ll/uzl;

    .line 16
    .line 17
    if-eqz v0, :cond_3

    .line 18
    .line 19
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameSound;->url:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameSound;->times:Ljava/lang/String;

    .line 29
    .line 30
    const-string v2, "0"

    .line 31
    .line 32
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    iget-boolean v2, p1, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameSound;->isPlay:Z

    .line 37
    .line 38
    if-eqz v2, :cond_2

    .line 39
    .line 40
    const/4 v2, 0x1

    .line 41
    if-eqz v1, :cond_1

    .line 42
    .line 43
    iget-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameSound;->url:Ljava/lang/String;

    .line 44
    .line 45
    invoke-interface {v0, p0, v2}, Ll/uzl;->E(Ljava/lang/String;Z)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_1
    iget v3, p0, Ll/k0m0;->l:I

    .line 50
    .line 51
    rem-int/lit8 v4, v3, 0x14

    .line 52
    .line 53
    add-int/2addr v3, v2

    .line 54
    iput v3, p0, Ll/k0m0;->l:I

    .line 55
    .line 56
    iget-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameSound;->url:Ljava/lang/String;

    .line 57
    .line 58
    const/4 p1, 0x0

    .line 59
    invoke-interface {v0, v4, p0, v1, p1}, Ll/uzl;->u(ILjava/lang/String;ZZ)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameSound;->url:Ljava/lang/String;

    .line 64
    .line 65
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    invoke-interface {v0, p0}, Ll/uzl;->stopEffect(I)V

    .line 70
    .line 71
    .line 72
    invoke-interface {v0}, Ll/uzl;->stopSurroundMusic()V

    .line 73
    .line 74
    .line 75
    :cond_3
    :goto_0
    return-void
.end method

.method public R0(Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPlayerIn;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Join userId:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, ",in"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    iget-boolean v1, p2, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPlayerIn;->isIn:Z

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "virtual_game"

    .line 26
    .line 27
    invoke-static {v1, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 31
    .line 32
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    iget-boolean v0, p2, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPlayerIn;->isIn:Z

    .line 43
    .line 44
    if-eqz v0, :cond_0

    .line 45
    .line 46
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    check-cast p1, Ll/rwn0;

    .line 51
    .line 52
    invoke-virtual {p1}, Ll/vp20;->k()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-static {p1}, Ll/kzl0;->h(Ljava/lang/String;)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    new-instance p1, Ll/vzl0;

    .line 65
    .line 66
    invoke-direct {p1}, Ll/vzl0;-><init>()V

    .line 67
    .line 68
    .line 69
    invoke-static {p1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    check-cast v0, Ll/rwn0;

    .line 82
    .line 83
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    new-instance v1, Ljava/lang/StringBuilder;

    .line 88
    .line 89
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 90
    .line 91
    .line 92
    iget p2, p2, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPlayerIn;->reason:I

    .line 93
    .line 94
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    const-string p2, ""

    .line 98
    .line 99
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p2

    .line 106
    invoke-static {v0, p1, p2}, Ll/kzl0;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    new-instance p1, Ll/wzl0;

    .line 115
    .line 116
    invoke-direct {p1}, Ll/wzl0;-><init>()V

    .line 117
    .line 118
    .line 119
    invoke-static {p1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 124
    .line 125
    .line 126
    :cond_1
    return-void
.end method

.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/elt;->C()V

    .line 5
    .line 6
    .line 7
    new-instance v0, Ll/qzl0;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/qzl0;-><init>(Ll/k0m0;)V

    .line 10
    .line 11
    .line 12
    const-class v1, Ll/vjj;

    .line 13
    .line 14
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ll/i6t;->lifecycle()Lrx/c;

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
    new-instance v1, Ll/b0m0;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/b0m0;-><init>(Ll/k0m0;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public T0(Ljava/lang/String;Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Ready userId:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, ",isReady"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "virtual_game"

    .line 24
    .line 25
    invoke-static {v1, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 29
    .line 30
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    if-eqz p2, :cond_0

    .line 41
    .line 42
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    check-cast p1, Ll/rwn0;

    .line 47
    .line 48
    invoke-virtual {p1}, Ll/vp20;->k()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-static {p1}, Ll/kzl0;->j(Ljava/lang/String;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    new-instance p1, Ll/xzl0;

    .line 61
    .line 62
    invoke-direct {p1}, Ll/xzl0;-><init>()V

    .line 63
    .line 64
    .line 65
    invoke-static {p1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_0
    iget-object p2, p0, Ll/k0m0;->i:Ll/whn0;

    .line 74
    .line 75
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->n()Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;

    .line 76
    .line 77
    .line 78
    move-result-object p2

    .line 79
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;->playerIsReady(Ljava/lang/String;)Z

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    if-eqz p1, :cond_1

    .line 84
    .line 85
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    check-cast p1, Ll/rwn0;

    .line 90
    .line 91
    invoke-virtual {p1}, Ll/vp20;->k()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    invoke-static {p1}, Ll/kzl0;->d(Ljava/lang/String;)Lrx/c;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    new-instance p1, Ll/yzl0;

    .line 104
    .line 105
    invoke-direct {p1}, Ll/yzl0;-><init>()V

    .line 106
    .line 107
    .line 108
    invoke-static {p1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 113
    .line 114
    .line 115
    :cond_1
    return-void
.end method

.method public Z(Landroid/view/View;)V
    .locals 2

    .line 1
    const-string v0, "virtual_game"

    .line 2
    .line 3
    const-string v1, "onAddGameView"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/virtual/game/VirtualGamePanelViewModel;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/game/VirtualGamePanelViewModel;->Q()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ll/xzs;->Q2()Landroid/view/ViewGroup;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->f:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 22
    .line 23
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ll/xzs;->Q2()Landroid/view/ViewGroup;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->f:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 33
    .line 34
    sget v0, Ll/bnl0;->e:I

    .line 35
    .line 36
    invoke-virtual {p0, p1, v0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final e4()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/k0m0;->i:Ll/whn0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->n()Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;->getPlayerPlayingMap()Ljava/util/HashMap;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    const-string v2, "virtual_game"

    .line 20
    .line 21
    if-nez v1, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/k0m0;->g4()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_7

    .line 38
    .line 39
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    check-cast v1, Ljava/lang/String;

    .line 44
    .line 45
    iget-object v3, p0, Ll/k0m0;->i:Ll/whn0;

    .line 46
    .line 47
    invoke-virtual {v3}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->n()Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    invoke-virtual {v3, v1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;->playerIsPlaying(Ljava/lang/String;)Z

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 56
    .line 57
    .line 58
    move-result-object v4

    .line 59
    check-cast v4, Ll/rwn0;

    .line 60
    .line 61
    invoke-virtual {v4}, Ll/rwn0;->P2()Ll/hrk0;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    invoke-virtual {v4, v1}, Ll/hrk0;->l(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    invoke-static {v4}, Ll/guk0;->h(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 70
    .line 71
    .line 72
    move-result v4

    .line 73
    if-nez v4, :cond_0

    .line 74
    .line 75
    if-eqz v3, :cond_0

    .line 76
    .line 77
    sget-object v3, Ll/zrv;->a:Ll/wrv;

    .line 78
    .line 79
    invoke-virtual {v3}, Ll/wrv;->D0()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v3

    .line 83
    invoke-static {v3, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    if-eqz v1, :cond_0

    .line 88
    .line 89
    iget-object v1, p0, Ll/k0m0;->i:Ll/whn0;

    .line 90
    .line 91
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a;->K()V

    .line 92
    .line 93
    .line 94
    const-string v1, "playing notifySelfEnd"

    .line 95
    .line 96
    invoke-static {v2, v1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_1
    iget-object v0, p0, Ll/k0m0;->i:Ll/whn0;

    .line 101
    .line 102
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->n()Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;->getCaptainUserId()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 111
    .line 112
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    if-eqz v1, :cond_7

    .line 121
    .line 122
    iget-object v1, p0, Ll/k0m0;->i:Ll/whn0;

    .line 123
    .line 124
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->n()Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;->getPlayerInSet()Ljava/util/HashSet;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    if-nez v1, :cond_2

    .line 133
    .line 134
    goto :goto_2

    .line 135
    :cond_2
    iget-object v3, p0, Ll/k0m0;->i:Ll/whn0;

    .line 136
    .line 137
    invoke-virtual {v3}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->n()Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;

    .line 138
    .line 139
    .line 140
    move-result-object v3

    .line 141
    invoke-virtual {v3}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;->getPlayerReadySet()Ljava/util/HashSet;

    .line 142
    .line 143
    .line 144
    move-result-object v3

    .line 145
    invoke-virtual {v1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    :cond_3
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 150
    .line 151
    .line 152
    move-result v4

    .line 153
    if-eqz v4, :cond_7

    .line 154
    .line 155
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 156
    .line 157
    .line 158
    move-result-object v4

    .line 159
    check-cast v4, Ljava/lang/String;

    .line 160
    .line 161
    iget-object v5, p0, Ll/k0m0;->i:Ll/whn0;

    .line 162
    .line 163
    invoke-virtual {v5}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->n()Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;

    .line 164
    .line 165
    .line 166
    move-result-object v5

    .line 167
    invoke-virtual {v5, v4}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;->playerIsPlaying(Ljava/lang/String;)Z

    .line 168
    .line 169
    .line 170
    move-result v5

    .line 171
    if-eqz v5, :cond_4

    .line 172
    .line 173
    goto :goto_1

    .line 174
    :cond_4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 175
    .line 176
    .line 177
    move-result-object v5

    .line 178
    check-cast v5, Ll/rwn0;

    .line 179
    .line 180
    invoke-virtual {v5}, Ll/rwn0;->P2()Ll/hrk0;

    .line 181
    .line 182
    .line 183
    move-result-object v5

    .line 184
    invoke-virtual {v5, v4}, Ll/hrk0;->l(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 185
    .line 186
    .line 187
    move-result-object v5

    .line 188
    invoke-static {v5}, Ll/guk0;->h(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 189
    .line 190
    .line 191
    move-result v5

    .line 192
    if-nez v5, :cond_3

    .line 193
    .line 194
    invoke-static {v4, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 195
    .line 196
    .line 197
    move-result v5

    .line 198
    if-nez v5, :cond_5

    .line 199
    .line 200
    iget-object v5, p0, Ll/k0m0;->i:Ll/whn0;

    .line 201
    .line 202
    invoke-virtual {v5, v4}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a;->H(Ljava/lang/String;)V

    .line 203
    .line 204
    .line 205
    const-string v4, "kickoutPerson"

    .line 206
    .line 207
    invoke-static {v2, v4}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 208
    .line 209
    .line 210
    goto :goto_1

    .line 211
    :cond_5
    if-eqz v3, :cond_6

    .line 212
    .line 213
    invoke-virtual {v3, v4}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 214
    .line 215
    .line 216
    move-result v4

    .line 217
    if-eqz v4, :cond_6

    .line 218
    .line 219
    iget-object v4, p0, Ll/k0m0;->i:Ll/whn0;

    .line 220
    .line 221
    invoke-virtual {v4}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a;->L()V

    .line 222
    .line 223
    .line 224
    const-string v4, "notifyUserCancelPrepare"

    .line 225
    .line 226
    invoke-static {v2, v4}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 227
    .line 228
    .line 229
    :cond_6
    iget-object v4, p0, Ll/k0m0;->i:Ll/whn0;

    .line 230
    .line 231
    invoke-virtual {v4}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a;->N()V

    .line 232
    .line 233
    .line 234
    const-string v4, "notifyUserQuitGame"

    .line 235
    .line 236
    invoke-static {v2, v4}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 237
    .line 238
    .line 239
    goto :goto_1

    .line 240
    :cond_7
    :goto_2
    return-void
.end method

.method public g4()Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/k0m0;->i:Ll/whn0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->n()Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;->getPlayerPlayingMap()Ljava/util/HashMap;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-nez v1, :cond_1

    .line 20
    .line 21
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_1

    .line 30
    .line 31
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Ljava/lang/String;

    .line 36
    .line 37
    iget-object v2, p0, Ll/k0m0;->i:Ll/whn0;

    .line 38
    .line 39
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->n()Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;->playerIsPlaying(Ljava/lang/String;)Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_0

    .line 48
    .line 49
    const/4 p0, 0x1

    .line 50
    return p0

    .line 51
    :cond_1
    const/4 p0, 0x0

    .line 52
    return p0
.end method

.method public final h4()V
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
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Ll/kzl0;->e(Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/zzl0;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/zzl0;-><init>(Ll/k0m0;)V

    .line 22
    .line 23
    .line 24
    new-instance p0, Ll/z2e0;

    .line 25
    .line 26
    invoke-direct {p0}, Ll/z2e0;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final synthetic i4(Ll/vjj;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k0m0;->j:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGame;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, ""

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGame;->backgroundImage:Ljava/lang/String;

    .line 9
    .line 10
    return-object p0
.end method

.method public final synthetic k4()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/k0m0;->i:Ll/whn0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a;->J()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/k0m0;->i:Ll/whn0;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a;->M()V

    .line 9
    .line 10
    .line 11
    iget-boolean v0, p0, Ll/k0m0;->k:Z

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const-string v0, "\u52a0\u5165\u6210\u529f"

    .line 16
    .line 17
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    const/4 v0, 0x1

    .line 21
    iput-boolean v0, p0, Ll/k0m0;->k:Z

    .line 22
    .line 23
    return-void
.end method

.method public final synthetic l4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCanJoinGame;)V
    .locals 3

    .line 1
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCanJoinGame;->can:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    new-instance v0, Ll/a0m0;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/a0m0;-><init>(Ll/k0m0;)V

    .line 12
    .line 13
    .line 14
    const-wide/16 v1, 0x3e8

    .line 15
    .line 16
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCanJoinGame;->msg:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public n()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

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
    invoke-virtual {v0}, Ll/oo2;->H0()Ll/c0m;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-interface {v0}, Ll/c0m;->a()Ll/uzl;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-interface {v0}, Ll/uzl;->stopSurroundMusic()V

    .line 21
    .line 22
    .line 23
    :cond_0
    const/4 v0, 0x0

    .line 24
    iput v0, p0, Ll/k0m0;->l:I

    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    iput-object v0, p0, Ll/k0m0;->j:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGame;

    .line 28
    .line 29
    iget-object v1, p0, Ll/k0m0;->i:Ll/whn0;

    .line 30
    .line 31
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->w()V

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Ll/k0m0;->i:Ll/whn0;

    .line 35
    .line 36
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a;->O(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a$a;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Ll/xzs;->Q2()Landroid/view/ViewGroup;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;

    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->f:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 46
    .line 47
    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public n0()V
    .locals 0

    .line 1
    return-void
.end method

.method public n1(Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPlayerPlaying;)V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Playing userId:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, ",isPlaying"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    iget-boolean v1, p2, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPlayerPlaying;->isPlaying:Z

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "virtual_game"

    .line 26
    .line 27
    invoke-static {v1, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p2, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPlayerPlaying;->gameRoundId:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-eqz v1, :cond_0

    .line 37
    .line 38
    iget-object v1, p0, Ll/k0m0;->j:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGame;

    .line 39
    .line 40
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGame;->providerRoundId:Ljava/lang/String;

    .line 41
    .line 42
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-nez v1, :cond_0

    .line 47
    .line 48
    iget-object v0, p0, Ll/k0m0;->j:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGame;

    .line 49
    .line 50
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGame;->providerRoundId:Ljava/lang/String;

    .line 51
    .line 52
    :cond_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    if-eqz v1, :cond_1

    .line 57
    .line 58
    return-void

    .line 59
    :cond_1
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 60
    .line 61
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-eqz p1, :cond_5

    .line 70
    .line 71
    iget-boolean p1, p2, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPlayerPlaying;->isPlaying:Z

    .line 72
    .line 73
    if-eqz p1, :cond_4

    .line 74
    .line 75
    new-instance p1, Ljava/util/ArrayList;

    .line 76
    .line 77
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 78
    .line 79
    .line 80
    iget-object p2, p0, Ll/k0m0;->i:Ll/whn0;

    .line 81
    .line 82
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->n()Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;

    .line 83
    .line 84
    .line 85
    move-result-object p2

    .line 86
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;->getPlayerPlayingMap()Ljava/util/HashMap;

    .line 87
    .line 88
    .line 89
    move-result-object p2

    .line 90
    invoke-virtual {p2}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 91
    .line 92
    .line 93
    move-result-object p2

    .line 94
    iget-object v1, p0, Ll/k0m0;->i:Ll/whn0;

    .line 95
    .line 96
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->n()Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;->getCaptainUserId()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 105
    .line 106
    .line 107
    move-result v2

    .line 108
    if-nez v2, :cond_3

    .line 109
    .line 110
    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 111
    .line 112
    .line 113
    move-result-object p2

    .line 114
    :cond_2
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 115
    .line 116
    .line 117
    move-result v2

    .line 118
    if-eqz v2, :cond_3

    .line 119
    .line 120
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object v2

    .line 124
    check-cast v2, Ljava/lang/String;

    .line 125
    .line 126
    iget-object v3, p0, Ll/k0m0;->i:Ll/whn0;

    .line 127
    .line 128
    invoke-virtual {v3}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->n()Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;

    .line 129
    .line 130
    .line 131
    move-result-object v3

    .line 132
    invoke-virtual {v3, v2}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;->playerIsPlaying(Ljava/lang/String;)Z

    .line 133
    .line 134
    .line 135
    move-result v3

    .line 136
    if-eqz v3, :cond_2

    .line 137
    .line 138
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    goto :goto_0

    .line 142
    :cond_3
    iget-object p2, p0, Ll/k0m0;->j:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGame;

    .line 143
    .line 144
    iput-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGame;->providerRoundId:Ljava/lang/String;

    .line 145
    .line 146
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 147
    .line 148
    .line 149
    move-result-object p2

    .line 150
    check-cast p2, Ll/rwn0;

    .line 151
    .line 152
    invoke-virtual {p2}, Ll/vp20;->k()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object p2

    .line 156
    iget-object v2, p0, Ll/k0m0;->j:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGame;

    .line 157
    .line 158
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGame;->type:Ljava/lang/String;

    .line 159
    .line 160
    invoke-static {p2, v0, p1, v2, v1}, Ll/kzl0;->l(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 161
    .line 162
    .line 163
    move-result-object p1

    .line 164
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    new-instance p2, Ll/szl0;

    .line 169
    .line 170
    invoke-direct {p2}, Ll/szl0;-><init>()V

    .line 171
    .line 172
    .line 173
    invoke-static {p2}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 174
    .line 175
    .line 176
    move-result-object p2

    .line 177
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 178
    .line 179
    .line 180
    goto :goto_1

    .line 181
    :cond_4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 182
    .line 183
    .line 184
    move-result-object p1

    .line 185
    check-cast p1, Ll/rwn0;

    .line 186
    .line 187
    invoke-virtual {p1}, Ll/vp20;->k()Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object p1

    .line 191
    iget-object v0, p2, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPlayerPlaying;->gameRoundId:Ljava/lang/String;

    .line 192
    .line 193
    new-instance v1, Ljava/lang/StringBuilder;

    .line 194
    .line 195
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 196
    .line 197
    .line 198
    iget p2, p2, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPlayerPlaying;->reason:I

    .line 199
    .line 200
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 201
    .line 202
    .line 203
    const-string p2, ""

    .line 204
    .line 205
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object p2

    .line 212
    invoke-static {p1, v0, p2}, Ll/kzl0;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 213
    .line 214
    .line 215
    move-result-object p1

    .line 216
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 217
    .line 218
    .line 219
    move-result-object p1

    .line 220
    new-instance p2, Ll/tzl0;

    .line 221
    .line 222
    invoke-direct {p2}, Ll/tzl0;-><init>()V

    .line 223
    .line 224
    .line 225
    invoke-static {p2}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 226
    .line 227
    .line 228
    move-result-object p2

    .line 229
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 230
    .line 231
    .line 232
    :cond_5
    :goto_1
    invoke-virtual {p0}, Ll/k0m0;->e4()V

    .line 233
    .line 234
    .line 235
    return-void
.end method

.method public final synthetic n4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveTemplateMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/k0m0;->r4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic o4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceLiveGameTypeMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/k0m0;->r4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onGameDestroyed()V
    .locals 0

    .line 1
    return-void
.end method

.method public onGameStarted()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/16 v1, 0x13

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ll/rwn0;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/rwn0;->N2()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/k0m0;->J0()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Ll/rwn0;

    .line 32
    .line 33
    const/4 v1, 0x0

    .line 34
    invoke-virtual {v0, v1}, Ll/rwn0;->I3(Z)V

    .line 35
    .line 36
    .line 37
    iput-boolean v1, p0, Ll/k0m0;->k:Z

    .line 38
    .line 39
    :cond_0
    return-void
.end method

.method public final synthetic p4(Ll/hrk0$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/k0m0;->e4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public q4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGame;)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->GameEvent:Lcom/tantan/live/eventbus/LiveEventBus$GameEvent;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$GameEvent;->loadGame()Ll/v3f$c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/v3f$c;->p()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/k0m0;->j:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGame;

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    iget-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGame;->agoraGameId:J

    .line 21
    .line 22
    iget-wide v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGame;->agoraGameId:J

    .line 23
    .line 24
    cmp-long v1, v1, v3

    .line 25
    .line 26
    if-nez v1, :cond_0

    .line 27
    .line 28
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGame;->providerRoundId:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGame;->providerRoundId:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_0

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    iput-object p1, p0, Ll/k0m0;->j:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGame;

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceVirtualLiveEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceVirtualLiveEvent;

    .line 46
    .line 47
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceVirtualLiveEvent;->changeRoomBg()Ll/v3f$d;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    const-string v1, ""

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    if-eqz p1, :cond_1

    .line 57
    .line 58
    iget-object v0, p0, Ll/k0m0;->i:Ll/whn0;

    .line 59
    .line 60
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    check-cast p0, Ll/rwn0;

    .line 65
    .line 66
    invoke-virtual {p0}, Ll/vp20;->o()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGame;->agoraGameId:J

    .line 71
    .line 72
    invoke-virtual {v0, p0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->D(Ljava/lang/String;J)V

    .line 73
    .line 74
    .line 75
    :cond_1
    :goto_0
    return-void
.end method

.method public r4()V
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
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Ll/kzl0;->g(Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/i0m0;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/i0m0;-><init>(Ll/k0m0;)V

    .line 22
    .line 23
    .line 24
    new-instance p0, Ll/z2e0;

    .line 25
    .line 26
    invoke-direct {p0}, Ll/z2e0;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public t()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/pzl0;

    .line 5
    .line 6
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 7
    .line 8
    iget-object v2, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/virtual/game/VirtualGamePanelViewModel;

    .line 11
    .line 12
    iget-object v2, v2, Lcom/p1/mobile/putong/live/livingroom/virtual/game/VirtualGamePanelViewModel;->d:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/VirtualVoiceMembersView;

    .line 13
    .line 14
    invoke-direct {v0, v1, v2}, Ll/pzl0;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/VirtualVoiceMembersView;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 21
    .line 22
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/virtual/game/VirtualGamePanelViewModel;

    .line 23
    .line 24
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 25
    .line 26
    iget-object v1, v1, Ll/dum;->f:Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveBaseFrag;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/virtual/game/VirtualGamePanelViewModel;->setSwallowTarget(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveBaseFrag;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/k0m0;->i:Ll/whn0;

    .line 32
    .line 33
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a;->O(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a$a;)V

    .line 34
    .line 35
    .line 36
    new-instance v0, Ll/c0m0;

    .line 37
    .line 38
    invoke-direct {v0, p0}, Ll/c0m0;-><init>(Ll/k0m0;)V

    .line 39
    .line 40
    .line 41
    invoke-direct {p0, v0}, Ll/k0m0;->d4(Ll/y20;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    check-cast v0, Ll/rwn0;

    .line 49
    .line 50
    iget-object v0, v0, Ll/oo2;->z:Ll/p1w;

    .line 51
    .line 52
    invoke-virtual {v0}, Ll/p1w;->r()Ll/aj1;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {v0}, Ll/aj1;->W0()Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    const/4 v1, 0x0

    .line 61
    invoke-virtual {p0, v0, v1}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    new-instance v2, Ll/d0m0;

    .line 66
    .line 67
    invoke-direct {v2}, Ll/d0m0;-><init>()V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    new-instance v2, Ll/e0m0;

    .line 75
    .line 76
    invoke-direct {v2, p0}, Ll/e0m0;-><init>(Ll/k0m0;)V

    .line 77
    .line 78
    .line 79
    invoke-static {v2}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    check-cast v0, Ll/rwn0;

    .line 91
    .line 92
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-virtual {v0}, Ll/aj1;->J()Lrx/c;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-virtual {p0, v0, v1}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    new-instance v1, Ll/f0m0;

    .line 105
    .line 106
    invoke-direct {v1, p0}, Ll/f0m0;-><init>(Ll/k0m0;)V

    .line 107
    .line 108
    .line 109
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 114
    .line 115
    .line 116
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    check-cast v0, Ll/rwn0;

    .line 121
    .line 122
    invoke-virtual {v0}, Ll/rwn0;->Q2()Lrx/c;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    new-instance v1, Ll/g0m0;

    .line 131
    .line 132
    invoke-direct {v1, p0}, Ll/g0m0;-><init>(Ll/k0m0;)V

    .line 133
    .line 134
    .line 135
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 140
    .line 141
    .line 142
    new-instance v0, Ll/h0m0;

    .line 143
    .line 144
    invoke-direct {v0, p0}, Ll/h0m0;-><init>(Ll/k0m0;)V

    .line 145
    .line 146
    .line 147
    const-class v1, Ll/nfn0;

    .line 148
    .line 149
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 150
    .line 151
    .line 152
    return-void
.end method

.method public t0()V
    .locals 2

    .line 1
    const-string v0, "virtual_game"

    .line 2
    .line 3
    const-string v1, "onRemoveGameView"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/xzs;->Q2()Landroid/view/ViewGroup;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->f:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public x0(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameSoundState;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a$a;->x0(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameSoundState;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/k210;

    .line 5
    .line 6
    const/16 v1, 0x1b64

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ll/k210;-><init>(I)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ll/uzl;

    .line 16
    .line 17
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameSoundState;->state:Z

    .line 18
    .line 19
    if-nez p1, :cond_2

    .line 20
    .line 21
    if-eqz v0, :cond_2

    .line 22
    .line 23
    iget p1, p0, Ll/k0m0;->l:I

    .line 24
    .line 25
    const/16 v1, 0x14

    .line 26
    .line 27
    if-gt p1, v1, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    rem-int/lit8 v1, p1, 0x14

    .line 31
    .line 32
    :goto_0
    const/4 p1, 0x0

    .line 33
    move v2, p1

    .line 34
    :goto_1
    if-ge v2, v1, :cond_1

    .line 35
    .line 36
    invoke-interface {v0, v2}, Ll/uzl;->stopEffect(I)V

    .line 37
    .line 38
    .line 39
    add-int/lit8 v2, v2, 0x1

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_1
    iput p1, p0, Ll/k0m0;->l:I

    .line 43
    .line 44
    :cond_2
    return-void
.end method
