.class public Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private bulletText:Ljava/lang/String;

.field private final callId:Ljava/lang/String;

.field private final callUser:Ll/h64;

.field private final inviteId:Ljava/lang/String;

.field private final liveCall:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

.field private final type:I


# direct methods
.method public constructor <init>(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->type:I

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getInviteId()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->inviteId:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getId()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->callId:Ljava/lang/String;

    .line 17
    .line 18
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->convertMessage(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;)Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->liveCall:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 23
    .line 24
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->convertUser(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;)Ll/h64;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->callUser:Ll/h64;

    .line 29
    .line 30
    return-void
.end method

.method private convertMessage(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;)Lcom/p1/mobile/putong/live/base/data/BLiveCall;
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
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveCall;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getId()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->id:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getLiveId()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->liveId:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getState()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->state:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getSource()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->source:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getUserSendRewardPoint()J

    .line 35
    .line 36
    .line 37
    move-result-wide v0

    .line 38
    iput-wide v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userSendRewardPoint:J

    .line 39
    .line 40
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getUserRecvRewardPoint()J

    .line 41
    .line 42
    .line 43
    move-result-wide v0

    .line 44
    iput-wide v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userRecvRewardPoint:J

    .line 45
    .line 46
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getIntendPosition()I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    iput v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->intendPosition:I

    .line 51
    .line 52
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getPosition()I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    iput v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->position:I

    .line 57
    .line 58
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getMutedByAnchor()Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->mutedByAnchor:Z

    .line 63
    .line 64
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getMutedByUser()Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->mutedByUser:Z

    .line 69
    .line 70
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getOpState()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->opState:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getUserId()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->user:Ljava/lang/String;

    .line 81
    .line 82
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getAnchorUserId()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->anchor:Ljava/lang/String;

    .line 87
    .line 88
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getInviteId()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->inviteId:Ljava/lang/String;

    .line 93
    .line 94
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getUserName()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userName:Ljava/lang/String;

    .line 99
    .line 100
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getIsAway()Z

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->isAway:Z

    .line 105
    .line 106
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getAnchorUserName()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->anchorUserName:Ljava/lang/String;

    .line 111
    .line 112
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getHangupReason()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->hangupReason:Ljava/lang/String;

    .line 117
    .line 118
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getUserProfile()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    if-eqz v0, :cond_1

    .line 123
    .line 124
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getUserProfile()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;->getPictureUrl()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->userPicture:Ljava/lang/String;

    .line 133
    .line 134
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getAnchorUserProfile()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    if-eqz v0, :cond_2

    .line 139
    .line 140
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getAnchorUserProfile()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;->getPictureUrl()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->anchorPicture:Ljava/lang/String;

    .line 149
    .line 150
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getHangupReason()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCall;->hangupReason:Ljava/lang/String;

    .line 155
    .line 156
    return-object p0
.end method

.method private convertUser(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;)Ll/h64;
    .locals 2

    .line 1
    new-instance p0, Ll/h64;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getUserId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getUserName()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Call;->getUserProfile()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;->getPictureUrl()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-direct {p0, v0, v1, p1}, Ll/h64;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-object p0
.end method


# virtual methods
.method public bulletText()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->bulletText:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCall()Lcom/p1/mobile/putong/live/base/data/BLiveCall;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->liveCall:Lcom/p1/mobile/putong/live/base/data/BLiveCall;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCallId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->callId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCallUser()Ll/h64;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->callUser:Ll/h64;

    .line 2
    .line 3
    return-object p0
.end method

.method public getInviteId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->inviteId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getType()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->type:I

    .line 2
    .line 3
    return p0
.end method

.method public is(I)Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->type:I

    .line 2
    .line 3
    if-ne p0, p1, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public setBullet(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveCallMessage;->bulletText:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
