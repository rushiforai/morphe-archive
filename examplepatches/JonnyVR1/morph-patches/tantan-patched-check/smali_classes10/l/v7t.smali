.class public Ll/v7t;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/v7t;->a(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;)Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/v7t;->a:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->getToast()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Ll/v7t;->b:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->getType()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage$Type;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iput-object p1, p0, Ll/v7t;->c:Ljava/lang/String;

    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public final a(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;)Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallMessage;->getMultiCall()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;->getId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->id:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;->getOwnerUserId()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->ownerUserId:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;->getOwnerRoomId()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->ownerRoomId:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;->getOwnerLiveId()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->ownerLiveId:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;->getUserId()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->userId:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;->getUserName()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->userName:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;->getUserAvatar()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->userAvatar:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;->getRole()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->role:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;->getRoomId()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->roomId:Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;->getLiveId()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->liveId:Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;->getSource()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->source:Ljava/lang/String;

    .line 74
    .line 75
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;->getCategory()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->category:Ljava/lang/String;

    .line 80
    .line 81
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;->getPosition()I

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    iput v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->position:I

    .line 86
    .line 87
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;->getState()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->state:Ljava/lang/String;

    .line 92
    .line 93
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;->getReceivedRewardPoint()J

    .line 94
    .line 95
    .line 96
    move-result-wide v0

    .line 97
    iput-wide v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->receivedRewardPoint:J

    .line 98
    .line 99
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;->getIsAway()Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->isAway:Z

    .line 104
    .line 105
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;->getMutedByUserIdsList()Ljava/util/List;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->mutedByUserIds:Ljava/util/List;

    .line 110
    .line 111
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;->getOwnerMultiCallOrder()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->ownerMultiCallOrder:Ljava/lang/String;

    .line 116
    .line 117
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;->getShowSeconds()J

    .line 118
    .line 119
    .line 120
    move-result-wide v0

    .line 121
    iput-wide v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->showSeconds:J

    .line 122
    .line 123
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;->getPushRemainCount()J

    .line 124
    .line 125
    .line 126
    move-result-wide v0

    .line 127
    iput-wide v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->pushRemainCount:J

    .line 128
    .line 129
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;->getIsLeadRole()Z

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->isLeadRole:Z

    .line 134
    .line 135
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCall;->getRefreshPushStreamUrl()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->refreshPushStreamUrl:Ljava/lang/String;

    .line 140
    .line 141
    return-object p0
.end method

.method public b()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v7t;->a:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v7t;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v7t;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
