.class public Ll/quj0;
.super Ljava/lang/Object;
.source "SourceFile"


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

.method public static a(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;)Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;-><init>()V

    .line 4
    .line 5
    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    return-object v0

    .line 9
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->getCurrentPlayersList()Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->getCurrentPlayersList()Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-static {p0, v1}, Ll/quj0;->c(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;Ljava/util/List;)Ljava/util/ArrayList;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->currentPlayers:Ljava/util/List;

    .line 24
    .line 25
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->getRemainSeconds()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->remainSeconds:I

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->getCountDownSeconds()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->countDownSeconds:I

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->getVotesList()Ljava/util/List;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    if-eqz v1, :cond_2

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->getVotesList()Ljava/util/List;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-static {v1}, Ll/quj0;->d(Ljava/util/List;)Ljava/util/ArrayList;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->votes:Ljava/util/List;

    .line 52
    .line 53
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->getVoteResult()Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$VoteResult;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    if-eqz v1, :cond_3

    .line 58
    .line 59
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->getVoteResult()Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$VoteResult;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-static {v1}, Ll/quj0;->e(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$VoteResult;)Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverVoteResult;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->voteResult:Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverVoteResult;

    .line 68
    .line 69
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->getGameResult()Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    if-eqz v1, :cond_4

    .line 74
    .line 75
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->getGameResult()Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-static {v1}, Ll/quj0;->b(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;)Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGameResult;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->gameResult:Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGameResult;

    .line 84
    .line 85
    :cond_4
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->getStatus()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->status:Ljava/lang/String;

    .line 90
    .line 91
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->getId()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->id:Ljava/lang/String;

    .line 96
    .line 97
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->getLiveId()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->liveId:Ljava/lang/String;

    .line 102
    .line 103
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->getToast()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->toast:Ljava/lang/String;

    .line 108
    .line 109
    return-object v0
.end method

.method public static b(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;)Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGameResult;
    .locals 5

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGameResult;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGameResult;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;->getWinnerRole()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGameResult;->winnerRole:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;->getNormalMasksList()Ljava/util/List;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const/4 v2, 0x0

    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    new-instance v1, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .line 23
    .line 24
    move v3, v2

    .line 25
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;->getNormalMasksList()Ljava/util/List;

    .line 26
    .line 27
    .line 28
    move-result-object v4

    .line 29
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    if-ge v3, v4, :cond_0

    .line 34
    .line 35
    invoke-virtual {p0, v3}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;->getNormalMasks(I)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    invoke-static {v4}, Ll/v6o0;->a(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    add-int/lit8 v3, v3, 0x1

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGameResult;->normalMasks:Ljava/util/List;

    .line 50
    .line 51
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;->getNormalWord()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGameResult;->normalWord:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;->getUndercoverMasksList()Ljava/util/List;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    if-eqz v1, :cond_3

    .line 62
    .line 63
    new-instance v1, Ljava/util/ArrayList;

    .line 64
    .line 65
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 66
    .line 67
    .line 68
    :goto_1
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;->getUndercoverMasksList()Ljava/util/List;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 73
    .line 74
    .line 75
    move-result v3

    .line 76
    if-ge v2, v3, :cond_2

    .line 77
    .line 78
    invoke-virtual {p0, v2}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;->getUndercoverMasks(I)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    invoke-static {v3}, Ll/v6o0;->a(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 83
    .line 84
    .line 85
    move-result-object v3

    .line 86
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    add-int/lit8 v2, v2, 0x1

    .line 90
    .line 91
    goto :goto_1

    .line 92
    :cond_2
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGameResult;->undercoverMasks:Ljava/util/List;

    .line 93
    .line 94
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;->getUndercoverWord()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGameResult;->undercoverWord:Ljava/lang/String;

    .line 99
    .line 100
    return-object v0
.end method

.method public static c(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;Ljava/util/List;)Ljava/util/ArrayList;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Player;",
            ">;)",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverCurrentPlayer;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-ge v1, v2, :cond_2

    .line 12
    .line 13
    new-instance v2, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverCurrentPlayer;

    .line 14
    .line 15
    invoke-direct {v2}, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverCurrentPlayer;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    check-cast v3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Player;

    .line 23
    .line 24
    if-eqz v3, :cond_1

    .line 25
    .line 26
    invoke-virtual {v3}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Player;->getUserId()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v4

    .line 30
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    if-eqz v4, :cond_0

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_0
    invoke-virtual {v3}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Player;->getUserId()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    iput-object v4, v2, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverCurrentPlayer;->userId:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v3}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Player;->getNumber()I

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    iput v4, v2, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverCurrentPlayer;->number:I

    .line 48
    .line 49
    invoke-virtual {v3}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Player;->getMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    invoke-static {v4}, Ll/v6o0;->a(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    iput-object v4, v2, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverCurrentPlayer;->mask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 58
    .line 59
    invoke-virtual {v3}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Player;->getRole()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    iput-object v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverCurrentPlayer;->role:Ljava/lang/String;

    .line 64
    .line 65
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover;->getWord()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    iput-object v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverCurrentPlayer;->word:Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    :cond_1
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_2
    return-object v0
.end method

.method public static d(Ljava/util/List;)Ljava/util/ArrayList;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;",
            ">;)",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverVote;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-ge v1, v2, :cond_0

    .line 12
    .line 13
    new-instance v2, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverVote;

    .line 14
    .line 15
    invoke-direct {v2}, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverVote;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    check-cast v3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;

    .line 23
    .line 24
    invoke-virtual {v3}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;->getCandidateMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 25
    .line 26
    .line 27
    move-result-object v4

    .line 28
    invoke-static {v4}, Ll/v6o0;->a(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    iput-object v4, v2, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverVote;->candidateMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 33
    .line 34
    invoke-virtual {v3}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;->getNumber()I

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    iput v4, v2, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverVote;->number:I

    .line 39
    .line 40
    invoke-virtual {v3}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;->getVoterNumbersList()Ljava/util/List;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    iput-object v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverVote;->voterNumbers:Ljava/util/List;

    .line 45
    .line 46
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    add-int/lit8 v1, v1, 0x1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    return-object v0
.end method

.method public static e(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$VoteResult;)Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverVoteResult;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverVoteResult;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverVoteResult;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$VoteResult;->getIsDraw()Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverVoteResult;->isDraw:Z

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$VoteResult;->getResult()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverVoteResult;->resultStr:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$VoteResult;->getOutUserRole()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverVoteResult;->outUserRole:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$VoteResult;->getOutUserMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-static {p0}, Ll/v6o0;->a(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverVoteResult;->outUserMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 33
    .line 34
    return-object v0
.end method
