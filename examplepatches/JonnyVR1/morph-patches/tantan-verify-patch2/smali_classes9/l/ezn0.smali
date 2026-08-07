.class public Ll/ezn0;
.super Ll/jk2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jk2<",
        "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;",
        "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/wbg0;Ll/zod;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/wbg0<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;",
            ">;",
            "Ll/zod;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ll/jk2;-><init>(Ll/wbg0;Ll/zod;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static B(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->getAnchorId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->anchorId:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->getRank()J

    .line 12
    .line 13
    .line 14
    move-result-wide v1

    .line 15
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->rank:J

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->getAnchorName()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->anchorName:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->getAmount()J

    .line 24
    .line 25
    .line 26
    move-result-wide v1

    .line 27
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->amount:J

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->getAnchorImage()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->anchorImage:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->getRoomId()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->roomId:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->getLiveId()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->liveId:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->getGap()J

    .line 48
    .line 49
    .line 50
    move-result-wide v1

    .line 51
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->gap:J

    .line 52
    .line 53
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->getMsgType()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingMsgType;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-static {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRankingMsgType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRankingMsgType;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->msgType:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRankingMsgType;

    .line 66
    .line 67
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->getType()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankingType;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-virtual {p1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRankingType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRankingType;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    iput-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->type:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRankingType;

    .line 80
    .line 81
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->getUserLiveState()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveStateEnum;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    sget-object v1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveStateEnum;->onlive:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveStateEnum;

    .line 86
    .line 87
    if-ne p1, v1, :cond_0

    .line 88
    .line 89
    const-string p0, "onlive"

    .line 90
    .line 91
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveState;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->liveState:Ljava/lang/String;

    .line 100
    .line 101
    return-object v0

    .line 102
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->getUserLiveState()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveStateEnum;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    sget-object v1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveStateEnum;->stopped:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveStateEnum;

    .line 107
    .line 108
    if-ne p1, v1, :cond_1

    .line 109
    .line 110
    const-string p0, "stopped"

    .line 111
    .line 112
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveState;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->liveState:Ljava/lang/String;

    .line 121
    .line 122
    return-object v0

    .line 123
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->getUserLiveState()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveStateEnum;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    sget-object v1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveStateEnum;->suspended:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveStateEnum;

    .line 128
    .line 129
    if-ne p1, v1, :cond_2

    .line 130
    .line 131
    const-string p0, "suspended"

    .line 132
    .line 133
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveState;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->liveState:Ljava/lang/String;

    .line 142
    .line 143
    return-object v0

    .line 144
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->getUserLiveState()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveStateEnum;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    sget-object p1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveStateEnum;->UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveStateEnum;

    .line 149
    .line 150
    if-ne p0, p1, :cond_3

    .line 151
    .line 152
    const-string p0, "unknown_"

    .line 153
    .line 154
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveState;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;->liveState:Ljava/lang/String;

    .line 163
    .line 164
    :cond_3
    return-object v0
.end method

.method public static C(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->getRankings(I)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    invoke-static {v0, p0}, Ll/ezn0;->B(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method


# virtual methods
.method public D(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;Ljava/lang/String;)Z
    .locals 1

    .line 1
    const/4 p2, 0x0

    .line 2
    invoke-virtual {p1, p2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->getRankings(I)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;->getRankingsCount()I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-lez p1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRanking;->getRoomId()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    const-string v0, "no_care"

    .line 17
    .line 18
    invoke-virtual {p0, p1, v0, v0}, Ll/mq2;->r(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    const/4 p0, 0x1

    .line 25
    return p0

    .line 26
    :cond_0
    return p2
.end method

.method public E(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;
    .locals 0

    .line 1
    invoke-static {p2}, Ll/ezn0;->C(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public b()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "voiceLive.leaderboard.enterEffect"

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic q(Lcom/google/protobuf/q;Ljava/lang/String;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/ezn0;->D(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public bridge synthetic z(Ljava/lang/String;Lcom/google/protobuf/q;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/ezn0;->E(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$VoiceLiveRankings;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLeaderBoardItem;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
