.class public Ll/gav;
.super Ll/jk2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jk2<",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$VoiceKTVGame;",
        "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;",
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;",
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


# virtual methods
.method public final B(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PanelBgInfo;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPanelBgInfo;
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPanelBgInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPanelBgInfo;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PanelBgInfo;->getUrl()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPanelBgInfo;->url:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PanelBgInfo;->getUpdatedTime()J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    iput-wide v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPanelBgInfo;->updatedTime:J

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PanelBgInfo;->getRemainSeconds()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    iput p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPanelBgInfo;->remainSeconds:I

    .line 26
    .line 27
    return-object p0
.end method

.method public final C(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getLyricType()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->lyricType:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getLyricUrl()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->lyricUrl:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-static {v2}, Ll/f3t;->b(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->mask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 30
    .line 31
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getOrderId()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->orderId:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getPrepareRemainSeconds()I

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    int-to-long v2, v2

    .line 42
    iput-wide v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->prepareRemainSeconds:J

    .line 43
    .line 44
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getSongCode()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->songCode:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getSongUrl()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->songUrl:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getStatus()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-static {v2}, Lcom/p1/mobile/putong/live/base/data/BLiveKtvPlayInfoStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveKtvPlayInfoStatus;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->status:Lcom/p1/mobile/putong/live/base/data/BLiveKtvPlayInfoStatus;

    .line 65
    .line 66
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getTitle()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->title:Ljava/lang/String;

    .line 71
    .line 72
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getUserId()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->userId:Ljava/lang/String;

    .line 77
    .line 78
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getCover()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->cover:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getAuthor()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->author:Ljava/lang/String;

    .line 89
    .line 90
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getDurationSecond()I

    .line 91
    .line 92
    .line 93
    move-result v2

    .line 94
    int-to-long v2, v2

    .line 95
    iput-wide v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->durationSecond:J

    .line 96
    .line 97
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->hasQuickGiftInfo()Z

    .line 98
    .line 99
    .line 100
    move-result v2

    .line 101
    if-eqz v2, :cond_1

    .line 102
    .line 103
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getQuickGiftInfo()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$QuickGiftInfo;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-virtual {p0, v0}, Ll/gav;->D(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$QuickGiftInfo;)Lcom/p1/mobile/putong/live/base/data/BLiveQuickGiftInfo;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    :cond_1
    iput-object v0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->quickGiftInfo:Lcom/p1/mobile/putong/live/base/data/BLiveQuickGiftInfo;

    .line 112
    .line 113
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getProvider()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    iput-object p0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->provider:Ljava/lang/String;

    .line 118
    .line 119
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getSchema()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    iput-object p0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->schema:Ljava/lang/String;

    .line 124
    .line 125
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getScore()J

    .line 126
    .line 127
    .line 128
    move-result-wide v2

    .line 129
    iput-wide v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->score:J

    .line 130
    .line 131
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getLevel()I

    .line 132
    .line 133
    .line 134
    move-result p0

    .line 135
    iput p0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->level:I

    .line 136
    .line 137
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getOrderId()Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    iput-object p0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->orderId:Ljava/lang/String;

    .line 142
    .line 143
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getMaxLevel()I

    .line 144
    .line 145
    .line 146
    move-result p0

    .line 147
    iput p0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->maxLevel:I

    .line 148
    .line 149
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getLevelTip()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    iput-object p0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->levelTip:Ljava/lang/String;

    .line 154
    .line 155
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getShowLevel()Z

    .line 156
    .line 157
    .line 158
    move-result p0

    .line 159
    iput-boolean p0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->showLevel:Z

    .line 160
    .line 161
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getBestSingerName()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    iput-object p0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->bestSingerName:Ljava/lang/String;

    .line 166
    .line 167
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getShowBgSvgaUrl()Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object p0

    .line 171
    iput-object p0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->showBgSvgaUrl:Ljava/lang/String;

    .line 172
    .line 173
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getGiftUv()I

    .line 174
    .line 175
    .line 176
    move-result p0

    .line 177
    iput p0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->giftUv:I

    .line 178
    .line 179
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;->getNextLevelGiftUv()I

    .line 180
    .line 181
    .line 182
    move-result p0

    .line 183
    iput p0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->nextLevelGiftUv:I

    .line 184
    .line 185
    return-object v1
.end method

.method public final D(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$QuickGiftInfo;)Lcom/p1/mobile/putong/live/base/data/BLiveQuickGiftInfo;
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveQuickGiftInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveQuickGiftInfo;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$QuickGiftInfo;->getGiftId()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    long-to-int v0, v0

    .line 14
    iput v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveQuickGiftInfo;->giftId:I

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$QuickGiftInfo;->getName()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveQuickGiftInfo;->name:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$QuickGiftInfo;->getUrl()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveQuickGiftInfo;->url:Ljava/lang/String;

    .line 27
    .line 28
    return-object p0
.end method

.method public E(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$VoiceKTVGame;Ljava/lang/String;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public F(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$VoiceKTVGame;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$VoiceKTVGame;->getId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$VoiceKTVGame;->getStatus()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;->status:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$VoiceKTVGame;->hasPlayInfo()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    const/4 v1, 0x0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$VoiceKTVGame;->getPlayInfo()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {p0, v0}, Ll/gav;->C(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    move-object v0, v1

    .line 34
    :goto_0
    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;->playInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 35
    .line 36
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$VoiceKTVGame;->hasNextPlayInfo()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$VoiceKTVGame;->getNextPlayInfo()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {p0, v0}, Ll/gav;->C(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PlayInfo;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    goto :goto_1

    .line 51
    :cond_1
    move-object v0, v1

    .line 52
    :goto_1
    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;->nextPlayInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 53
    .line 54
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$VoiceKTVGame;->getToast()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;->toast:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$VoiceKTVGame;->hasPanelBgInfo()Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-eqz v0, :cond_2

    .line 65
    .line 66
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$VoiceKTVGame;->getPanelBgInfo()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PanelBgInfo;

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    invoke-virtual {p0, p2}, Ll/gav;->B(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$PanelBgInfo;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPanelBgInfo;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    :cond_2
    iput-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;->panelBgInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPanelBgInfo;

    .line 75
    .line 76
    return-object p1
.end method

.method public b()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$VoiceKTVGame;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$VoiceKTVGame;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "voicetrick.ktv"

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic q(Lcom/google/protobuf/q;Ljava/lang/String;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$VoiceKTVGame;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/gav;->E(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$VoiceKTVGame;Ljava/lang/String;)Z

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
    check-cast p2, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$VoiceKTVGame;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/gav;->F(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceKtv$VoiceKTVGame;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
