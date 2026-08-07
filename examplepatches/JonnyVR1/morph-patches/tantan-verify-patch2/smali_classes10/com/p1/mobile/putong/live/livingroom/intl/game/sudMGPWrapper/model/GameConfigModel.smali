.class public Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$GameUi;,
        Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$LobbyAnimation;,
        Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$GameOverTip;,
        Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$WorstTeammateTip;,
        Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$Mask;,
        Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$RoundOverGoodBtn;,
        Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$RoundOverPoopBtn;,
        Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$BulletScreensBtn;,
        Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$GamePlayers;,
        Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$Logo;,
        Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$UmoIcon;,
        Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$GameMvp;,
        Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$GameOpening;,
        Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$NFTAvatar;,
        Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$GameSelectedTips;,
        Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$GameCountdownTime;,
        Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$GameTableImage;,
        Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$GameManagedImage;,
        Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$GameSettingSelectPnl;,
        Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$BlockChangeSeat;,
        Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$GameBg;,
        Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$GameSettleAgainBtn;,
        Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$GameSettleCloseBtn;,
        Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$GameHelpBtn;,
        Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$GameSttingBtn;,
        Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$GameShareBtn;,
        Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$GameStartBtn;,
        Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$GameCancelReadyBtn;,
        Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$GameReadyBtn;,
        Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$GameCancelJoinBtn;,
        Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$GameJoinBtn;,
        Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$GameLobbyGameSetting;,
        Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$GameLobbyRule;,
        Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$GameLobbyPlayerKickoutIcon;,
        Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$GameLobbyPlayerCaptainIcon;,
        Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$GameLobbyPlayers;,
        Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$GameLobbyHelpBtn;,
        Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$GameLobbySettingBtn;,
        Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$GameLevel;,
        Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$GameVersion;,
        Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$GamePing;,
        Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$GameSettle;
    }
.end annotation


# instance fields
.field public gameCPU:I

.field public gameMode:I

.field public gameSoundControl:I

.field public gameSoundVolume:I

.field public ui:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$GameUi;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel;->gameMode:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel;->gameCPU:I

    .line 9
    .line 10
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel;->gameSoundControl:I

    .line 11
    .line 12
    const/16 v0, 0x64

    .line 13
    .line 14
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel;->gameSoundVolume:I

    .line 15
    .line 16
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$GameUi;

    .line 17
    .line 18
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$GameUi;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel;->ui:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel$GameUi;

    .line 22
    .line 23
    return-void
.end method
