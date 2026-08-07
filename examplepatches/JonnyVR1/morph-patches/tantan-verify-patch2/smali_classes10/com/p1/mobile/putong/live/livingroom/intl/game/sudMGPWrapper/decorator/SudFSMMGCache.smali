.class public Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private captainUserId:Ljava/lang/String;

.field private isHitBomb:Z

.field private mgCommonGameStateModel:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameState;

.field private final playerInSet:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final playerPlayingMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPlayerPlaying;",
            ">;"
        }
    .end annotation
.end field

.field private final playerReadySet:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;->isHitBomb:Z

    .line 6
    .line 7
    new-instance v0, Ljava/util/HashSet;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;->playerInSet:Ljava/util/HashSet;

    .line 13
    .line 14
    new-instance v0, Ljava/util/HashSet;

    .line 15
    .line 16
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;->playerReadySet:Ljava/util/HashSet;

    .line 20
    .line 21
    new-instance v0, Ljava/util/HashMap;

    .line 22
    .line 23
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;->playerPlayingMap:Ljava/util/HashMap;

    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public destroyMG()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;->captainUserId:Ljava/lang/String;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;->mgCommonGameStateModel:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameState;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;->isHitBomb:Z

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;->playerInSet:Ljava/util/HashSet;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/HashSet;->clear()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;->playerReadySet:Ljava/util/HashSet;

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/util/HashSet;->clear()V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;->playerPlayingMap:Ljava/util/HashMap;

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/util/HashMap;->clear()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public getCaptainUserId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;->captainUserId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getGameState()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;->mgCommonGameStateModel:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameState;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameState;->gameState:I

    .line 6
    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, -0x1

    .line 9
    return p0
.end method

.method public getPlayerInNumber()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;->playerInSet:Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/HashSet;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getPlayerInSet()Ljava/util/HashSet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/HashSet;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;->playerInSet:Ljava/util/HashSet;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public getPlayerPlayingMap()Ljava/util/HashMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPlayerPlaying;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;->playerPlayingMap:Ljava/util/HashMap;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public getPlayerReadySet()Ljava/util/HashSet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/HashSet;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;->playerReadySet:Ljava/util/HashSet;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public isHitBomb()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;->isHitBomb:Z

    .line 2
    .line 3
    return p0
.end method

.method public onGameMGCommonGameState(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameState;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;->mgCommonGameStateModel:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameState;

    .line 2
    .line 3
    return-void
.end method

.method public onGameMGCommonKeyWordToHit(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonKeyWordToHit;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonKeyWordToHit;->wordType:Ljava/lang/String;

    .line 4
    .line 5
    const-string v0, "number"

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;->isHitBomb:Z

    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public onPlayerMGCommonPlayerCaptain(Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPlayerCaptain;)V
    .locals 0

    .line 1
    if-eqz p2, :cond_1

    .line 2
    .line 3
    iget-boolean p2, p2, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPlayerCaptain;->isCaptain:Z

    .line 4
    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;->captainUserId:Ljava/lang/String;

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;->captainUserId:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {p2, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;->captainUserId:Ljava/lang/String;

    .line 20
    .line 21
    :cond_1
    return-void
.end method

.method public onPlayerMGCommonPlayerIn(Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPlayerIn;)V
    .locals 1

    .line 1
    if-eqz p2, :cond_1

    .line 2
    .line 3
    iget-boolean p2, p2, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPlayerIn;->isIn:Z

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;->playerInSet:Ljava/util/HashSet;

    .line 6
    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {v0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;->playerReadySet:Ljava/util/HashSet;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    :cond_1
    return-void
.end method

.method public onPlayerMGCommonPlayerPlaying(Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPlayerPlaying;)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;->playerPlayingMap:Ljava/util/HashMap;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onPlayerMGCommonPlayerReady(Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPlayerReady;)V
    .locals 0

    .line 1
    if-eqz p2, :cond_1

    .line 2
    .line 3
    iget-boolean p2, p2, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPlayerReady;->isReady:Z

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;->playerReadySet:Ljava/util/HashSet;

    .line 6
    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {p0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    :cond_1
    return-void
.end method

.method public playerIsIn(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;->playerInSet:Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public playerIsPlaying(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;->playerPlayingMap:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPlayerPlaying;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPlayerPlaying;->isPlaying:Z

    .line 12
    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public playerIsReady(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;->playerReadySet:Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
