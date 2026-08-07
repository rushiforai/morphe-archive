.class public Ll/lcl0;
.super Ll/jk2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jk2<",
        "Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatChange;",
        "Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;",
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;",
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

.method public static synthetic B(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;->getUserId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;->userId:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;->getUserName()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;->userName:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;->getRole()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;->role:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChatPlayer;->getAvatar()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iput-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;->avatar:Ljava/lang/String;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->players:Ljava/util/List;

    .line 30
    .line 31
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    return-void
.end method


# virtual methods
.method public final C(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Status;)Ljava/lang/String;
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p0, ""

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public D(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatChange;Ljava/lang/String;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public E(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatChange;)Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;
    .locals 2

    .line 1
    invoke-virtual {p2}, Lcom/google/protobuf/GeneratedMessageLite;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatChange;->getVideoChat()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    new-instance p2, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 9
    .line 10
    invoke-direct {p2}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getAnchorId()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->anchorId:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getLiveId()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->liveId:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getRoomId()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->roomId:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getStatus()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Status;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {p0, v0}, Ll/lcl0;->C(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Status;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    iput-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->status:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getId()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    iput-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->id:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getUserId()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    iput-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->userId:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getCreatedTime()J

    .line 54
    .line 55
    .line 56
    move-result-wide v0

    .line 57
    iput-wide v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->createdTime:J

    .line 58
    .line 59
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getStartedTime()J

    .line 60
    .line 61
    .line 62
    move-result-wide v0

    .line 63
    iput-wide v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->startedTime:J

    .line 64
    .line 65
    new-instance p0, Ljava/util/ArrayList;

    .line 66
    .line 67
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 68
    .line 69
    .line 70
    iput-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->players:Ljava/util/List;

    .line 71
    .line 72
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getPlayersList()Ljava/util/List;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 77
    .line 78
    .line 79
    move-result p0

    .line 80
    if-nez p0, :cond_0

    .line 81
    .line 82
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getPlayersList()Ljava/util/List;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    new-instance v0, Ll/kcl0;

    .line 87
    .line 88
    invoke-direct {v0, p2}, Ll/kcl0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)V

    .line 89
    .line 90
    .line 91
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getTtc()J

    .line 95
    .line 96
    .line 97
    move-result-wide v0

    .line 98
    iput-wide v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->ttc:J

    .line 99
    .line 100
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getGiftId()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    iput-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->giftId:Ljava/lang/String;

    .line 105
    .line 106
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getCalled()Z

    .line 107
    .line 108
    .line 109
    move-result p0

    .line 110
    iput-boolean p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->called:Z

    .line 111
    .line 112
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getEndTipMessage()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    iput-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->endTipMessage:Ljava/lang/String;

    .line 117
    .line 118
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getEndType()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$EndType;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    iput-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->endType:Ljava/lang/String;

    .line 127
    .line 128
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getAnchorCallId()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    iput-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->anchorCallId:Ljava/lang/String;

    .line 133
    .line 134
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getSource()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    iput-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->source:Ljava/lang/String;

    .line 139
    .line 140
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getCategory()Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat$Category;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    iput-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->category:Ljava/lang/String;

    .line 149
    .line 150
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    iput-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->media:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;

    .line 155
    .line 156
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$VideoChat;->getRtcProvider()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;->rtcProvider:Ljava/lang/String;

    .line 161
    .line 162
    return-object p2
.end method

.method public b()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatChange;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatChange;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "live.videoChat.statusChange"

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic q(Lcom/google/protobuf/q;Ljava/lang/String;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatChange;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/lcl0;->D(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatChange;Ljava/lang/String;)Z

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
    check-cast p2, Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatChange;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/lcl0;->E(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatChange;)Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
