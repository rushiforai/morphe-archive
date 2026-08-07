.class public Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator$OnNotifyStateChangeListener;
    }
.end annotation


# instance fields
.field private iSudFSTAPP:Ltech/sud/gip/core/ISudFSTAPP;

.field private onNotifyStateChangeListener:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator$OnNotifyStateChangeListener;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public destroyMG()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;->iSudFSTAPP:Ltech/sud/gip/core/ISudFSTAPP;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ltech/sud/gip/core/ISudFSTAPP;->destroyMG()Z

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;->iSudFSTAPP:Ltech/sud/gip/core/ISudFSTAPP;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public notifyAPPCommonGameAddAIPlayers(Ljava/util/List;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$AIPlayers;",
            ">;I)V"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonGameAddAIPlayers;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonGameAddAIPlayers;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p1, v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonGameAddAIPlayers;->aiPlayers:Ljava/util/List;

    .line 7
    .line 8
    iput p2, v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonGameAddAIPlayers;->isReady:I

    .line 9
    .line 10
    const-string p1, "app_common_game_add_ai_players"

    .line 11
    .line 12
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;->notifyStateChange(Ljava/lang/String;Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public notifyAPPCommonGameReconnect()V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonGameReconnect;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonGameReconnect;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "app_common_game_reconnect"

    .line 7
    .line 8
    invoke-virtual {p0, v1, v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;->notifyStateChange(Ljava/lang/String;Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public notifyAPPCommonGameScore(J)V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonGameScore;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonGameScore;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-wide p1, v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonGameScore;->score:J

    .line 7
    .line 8
    const-string p1, "app_common_game_score"

    .line 9
    .line 10
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;->notifyStateChange(Ljava/lang/String;Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public notifyAPPCommonGameSettingSelectInfo(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$Ludo;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonGameSettingSelectInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonGameSettingSelectInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p1, v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonGameSettingSelectInfo;->ludo:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$Ludo;

    .line 7
    .line 8
    const-string p1, "app_common_game_setting_select_info"

    .line 9
    .line 10
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;->notifyStateChange(Ljava/lang/String;Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public notifyAPPCommonGameSoundVolume(I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonGameSoundVolume;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonGameSoundVolume;-><init>()V

    .line 4
    .line 5
    .line 6
    iput p1, v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonGameSoundVolume;->volume:I

    .line 7
    .line 8
    const-string p1, "app_common_game_sound_volume"

    .line 9
    .line 10
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;->notifyStateChange(Ljava/lang/String;Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public notifyAPPCommonOpenBgMusic(Z)V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonOpenBgMusic;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonOpenBgMusic;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-boolean p1, v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonOpenBgMusic;->isOpen:Z

    .line 7
    .line 8
    const-string p1, "app_common_open_bg_music"

    .line 9
    .line 10
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;->notifyStateChange(Ljava/lang/String;Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public notifyAPPCommonOpenSound(Z)V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonOpenSound;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonOpenSound;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-boolean p1, v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonOpenSound;->isOpen:Z

    .line 7
    .line 8
    const-string p1, "app_common_open_sound"

    .line 9
    .line 10
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;->notifyStateChange(Ljava/lang/String;Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public notifyAPPCommonOpenVibrate(Z)V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonOpenVibrate;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonOpenVibrate;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-boolean p1, v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonOpenVibrate;->isOpen:Z

    .line 7
    .line 8
    const-string p1, "app_common_open_vibrate"

    .line 9
    .line 10
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;->notifyStateChange(Ljava/lang/String;Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public notifyAPPCommonSelfCaptain(Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonSelfCaptain;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonSelfCaptain;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p1, v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonSelfCaptain;->curCaptainUID:Ljava/lang/String;

    .line 7
    .line 8
    const-string p1, "app_common_self_captain"

    .line 9
    .line 10
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;->notifyStateChange(Ljava/lang/String;Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public notifyAPPCommonSelfEnd()V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonSelfEnd;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonSelfEnd;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "app_common_self_end"

    .line 7
    .line 8
    invoke-virtual {p0, v1, v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;->notifyStateChange(Ljava/lang/String;Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public notifyAPPCommonSelfIn(ZIZI)V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonSelfIn;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonSelfIn;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-boolean p1, v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonSelfIn;->isIn:Z

    .line 7
    .line 8
    iput p2, v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonSelfIn;->seatIndex:I

    .line 9
    .line 10
    iput-boolean p3, v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonSelfIn;->isSeatRandom:Z

    .line 11
    .line 12
    iput p4, v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonSelfIn;->teamId:I

    .line 13
    .line 14
    const-string p1, "app_common_self_in"

    .line 15
    .line 16
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;->notifyStateChange(Ljava/lang/String;Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public notifyAPPCommonSelfKick(Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonSelfKick;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonSelfKick;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p1, v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonSelfKick;->kickedUID:Ljava/lang/String;

    .line 7
    .line 8
    const-string p1, "app_common_self_kick"

    .line 9
    .line 10
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;->notifyStateChange(Ljava/lang/String;Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public notifyAPPCommonSelfMicrophone(ZZ)V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonSelfMicrophone;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonSelfMicrophone;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-boolean p1, v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonSelfMicrophone;->isOn:Z

    .line 7
    .line 8
    iput-boolean p2, v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonSelfMicrophone;->isDisabled:Z

    .line 9
    .line 10
    const-string p1, "app_common_self_microphone"

    .line 11
    .line 12
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;->notifyStateChange(Ljava/lang/String;Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public notifyAPPCommonSelfPlaying(ZLjava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonSelfPlaying;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonSelfPlaying;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-boolean p1, v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonSelfPlaying;->isPlaying:Z

    .line 7
    .line 8
    iput-object p2, v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonSelfPlaying;->reportGameInfoExtras:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p3, v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonSelfPlaying;->reportGameInfoKey:Ljava/lang/String;

    .line 11
    .line 12
    const-string p1, "app_common_self_playing"

    .line 13
    .line 14
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;->notifyStateChange(Ljava/lang/String;Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public notifyAPPCommonSelfReady(Z)V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonSelfReady;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonSelfReady;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-boolean p1, v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonSelfReady;->isReady:Z

    .line 7
    .line 8
    const-string p1, "app_common_self_ready"

    .line 9
    .line 10
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;->notifyStateChange(Ljava/lang/String;Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public notifyAPPCommonSelfTextHitState(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonSelfTextHitState;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonSelfTextHitState;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-boolean p1, v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonSelfTextHitState;->isHit:Z

    .line 7
    .line 8
    iput-object p2, v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonSelfTextHitState;->keyWord:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p3, v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonSelfTextHitState;->text:Ljava/lang/String;

    .line 11
    .line 12
    iput-object p4, v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonSelfTextHitState;->wordType:Ljava/lang/String;

    .line 13
    .line 14
    iput-object p5, v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonSelfTextHitState;->keyWordList:Ljava/util/List;

    .line 15
    .line 16
    iput-object p6, v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$APPCommonSelfTextHitState;->numberList:Ljava/util/List;

    .line 17
    .line 18
    const-string p1, "app_common_self_text_hit"

    .line 19
    .line 20
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;->notifyStateChange(Ljava/lang/String;Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public notifyAppCommonGameDiscoAction(ILjava/lang/Integer;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$AppCommonGameDiscoAction;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$AppCommonGameDiscoAction;-><init>()V

    .line 4
    .line 5
    .line 6
    iput p1, v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$AppCommonGameDiscoAction;->actionId:I

    .line 7
    .line 8
    iput-object p2, v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$AppCommonGameDiscoAction;->cooldown:Ljava/lang/Integer;

    .line 9
    .line 10
    iput-object p3, v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$AppCommonGameDiscoAction;->isTop:Ljava/lang/Boolean;

    .line 11
    .line 12
    iput-object p4, v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$AppCommonGameDiscoAction;->field1:Ljava/lang/String;

    .line 13
    .line 14
    iput-object p5, v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPAPPState$AppCommonGameDiscoAction;->field2:Ljava/lang/String;

    .line 15
    .line 16
    const-string p1, "app_common_game_disco_action"

    .line 17
    .line 18
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;->notifyStateChange(Ljava/lang/String;Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public notifyStateChange(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1

    .line 17
    invoke-static {p2}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;->notifyStateChange(Ljava/lang/String;Ljava/lang/String;Ltech/sud/gip/core/ISudListenerNotifyStateChange;)V

    return-void
.end method

.method public notifyStateChange(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 16
    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;->notifyStateChange(Ljava/lang/String;Ljava/lang/String;Ltech/sud/gip/core/ISudListenerNotifyStateChange;)V

    return-void
.end method

.method public notifyStateChange(Ljava/lang/String;Ljava/lang/String;Ltech/sud/gip/core/ISudListenerNotifyStateChange;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;->iSudFSTAPP:Ltech/sud/gip/core/ISudFSTAPP;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1, p2, p3}, Ltech/sud/gip/core/ISudFSTAPP;->notifyStateChange(Ljava/lang/String;Ljava/lang/String;Ltech/sud/gip/core/ISudListenerNotifyStateChange;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;->onNotifyStateChangeListener:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator$OnNotifyStateChangeListener;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-interface {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator$OnNotifyStateChangeListener;->onNotifyStateChange(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public pauseMG()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;->iSudFSTAPP:Ltech/sud/gip/core/ISudFSTAPP;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ltech/sud/gip/core/ISudFSTAPP;->pauseMG()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public playMG()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;->iSudFSTAPP:Ltech/sud/gip/core/ISudFSTAPP;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ltech/sud/gip/core/ISudFSTAPP;->playMG()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public pushAudio(Ljava/nio/ByteBuffer;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;->iSudFSTAPP:Ltech/sud/gip/core/ISudFSTAPP;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Ltech/sud/gip/core/ISudFSTAPP;->pushAudio(Ljava/nio/ByteBuffer;I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public reloadMG()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;->iSudFSTAPP:Ltech/sud/gip/core/ISudFSTAPP;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ltech/sud/gip/core/ISudFSTAPP;->reloadMG()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setISudFSTAPP(Ltech/sud/gip/core/ISudFSTAPP;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;->iSudFSTAPP:Ltech/sud/gip/core/ISudFSTAPP;

    .line 2
    .line 3
    return-void
.end method

.method public setOnNotifyStateChangeListener(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator$OnNotifyStateChangeListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;->onNotifyStateChangeListener:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator$OnNotifyStateChangeListener;

    .line 2
    .line 3
    return-void
.end method

.method public startMG()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;->iSudFSTAPP:Ltech/sud/gip/core/ISudFSTAPP;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ltech/sud/gip/core/ISudFSTAPP;->startMG()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public stopMG()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;->iSudFSTAPP:Ltech/sud/gip/core/ISudFSTAPP;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ltech/sud/gip/core/ISudFSTAPP;->stopMG()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public updateCode(Ljava/lang/String;Ltech/sud/gip/core/ISudListenerNotifyStateChange;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;->iSudFSTAPP:Ltech/sud/gip/core/ISudFSTAPP;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Ltech/sud/gip/core/ISudFSTAPP;->updateCode(Ljava/lang/String;Ltech/sud/gip/core/ISudListenerNotifyStateChange;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
