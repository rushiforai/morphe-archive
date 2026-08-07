.class public final Ll/gvn0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

.field public final b:I

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public final e:Ll/nsv;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/nsv<",
            "Ll/h64;",
            ">;"
        }
    .end annotation
.end field

.field public final f:Z

.field public final g:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p2, p0, Ll/gvn0;->b:I

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getInviteId()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    iput-object p2, p0, Ll/gvn0;->c:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getId()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    iput-object p2, p0, Ll/gvn0;->d:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ll/gvn0;->c(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    iput-object p2, p0, Ll/gvn0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Ll/gvn0;->d(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;)Ll/nsv;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    iput-object p2, p0, Ll/gvn0;->e:Ll/nsv;

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getFromManager()Z

    .line 31
    .line 32
    .line 33
    move-result p2

    .line 34
    iput-boolean p2, p0, Ll/gvn0;->f:Z

    .line 35
    .line 36
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getManagerUserName()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iput-object p1, p0, Ll/gvn0;->g:Ljava/lang/String;

    .line 41
    .line 42
    return-void
.end method


# virtual methods
.method public a(Z)Z
    .locals 3

    .line 1
    iget p0, p0, Ll/gvn0;->b:I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const/4 v1, 0x6

    .line 5
    const/4 v2, 0x1

    .line 6
    if-eqz p1, :cond_2

    .line 7
    .line 8
    if-eq p0, v2, :cond_1

    .line 9
    .line 10
    if-ne p0, v1, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    return v0

    .line 14
    :cond_1
    :goto_0
    return v2

    .line 15
    :cond_2
    const/4 p1, 0x3

    .line 16
    if-eq p0, p1, :cond_4

    .line 17
    .line 18
    if-eq p0, v2, :cond_4

    .line 19
    .line 20
    if-ne p0, v1, :cond_3

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_3
    return v0

    .line 24
    :cond_4
    :goto_1
    return v2
.end method

.method public final b(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;)Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->hasCallEffect()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getCallEffect()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallEffectConfig;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallEffectConfig;->getDefaultIcon()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;->defaultIcon:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallEffectConfig;->getMuteIcon()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;->muteIcon:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallEffectConfig;->getVerticalBg()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;->verticalBg:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallEffectConfig;->getHorizontalBg()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;->horizontalBg:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallEffectConfig;->getVerticalVoicingUrl()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;->verticalVoicingUrl:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallEffectConfig;->getHorizontalVoicingUrl()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;->horizontalVoicingUrl:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$CallEffectConfig;->getCircleVoicingUrl()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;->circleVoicingUrl:Ljava/lang/String;

    .line 58
    .line 59
    return-object p1
.end method

.method public final c(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;
    .locals 5

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getId()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getVoiceLiveId()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->voiceLiveId:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getState()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->state:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getSource()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->source:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getUserSendRewardPoint()J

    .line 35
    .line 36
    .line 37
    move-result-wide v1

    .line 38
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userSendRewardPoint:J

    .line 39
    .line 40
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getUserRecvRewardPoint()J

    .line 41
    .line 42
    .line 43
    move-result-wide v1

    .line 44
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userRecvRewardPoint:J

    .line 45
    .line 46
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getIntendPosition()I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->intendPosition:I

    .line 51
    .line 52
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getPosition()I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 57
    .line 58
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getMutedByAnchor()Z

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByAnchor:Z

    .line 63
    .line 64
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getMutedByUser()Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByUser:Z

    .line 69
    .line 70
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getUserId()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getAnchorUserId()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->anchor:Ljava/lang/String;

    .line 81
    .line 82
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getInviteId()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->inviteId:Ljava/lang/String;

    .line 87
    .line 88
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getUserName()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userName:Ljava/lang/String;

    .line 93
    .line 94
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getIsAway()Z

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->isAway:Z

    .line 99
    .line 100
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getAnchorUserName()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->anchorUserName:Ljava/lang/String;

    .line 105
    .line 106
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getHangupReason()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->hangupReason:Ljava/lang/String;

    .line 111
    .line 112
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getUserProfile()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    if-eqz v1, :cond_1

    .line 117
    .line 118
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getUserProfile()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;->getPictureUrl()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userPicture:Ljava/lang/String;

    .line 127
    .line 128
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getAnchorUserProfile()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    if-eqz v1, :cond_2

    .line 133
    .line 134
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getAnchorUserProfile()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;->getPictureUrl()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v1

    .line 142
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->anchorPicture:Ljava/lang/String;

    .line 143
    .line 144
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getHangupReason()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->hangupReason:Ljava/lang/String;

    .line 149
    .line 150
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getRole()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v1

    .line 154
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->role:Ljava/lang/String;

    .line 155
    .line 156
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getAwayReason()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$AwayReason;

    .line 157
    .line 158
    .line 159
    move-result-object v1

    .line 160
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 161
    .line 162
    .line 163
    move-result v1

    .line 164
    const/4 v2, 0x1

    .line 165
    if-ne v1, v2, :cond_3

    .line 166
    .line 167
    sget-object v1, Ll/ptk0;->d:Ljava/lang/String;

    .line 168
    .line 169
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->awayReason:Ljava/lang/String;

    .line 170
    .line 171
    goto :goto_0

    .line 172
    :cond_3
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getAwayReason()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$AwayReason;

    .line 173
    .line 174
    .line 175
    move-result-object v1

    .line 176
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 177
    .line 178
    .line 179
    move-result v1

    .line 180
    const/4 v2, 0x2

    .line 181
    if-ne v1, v2, :cond_4

    .line 182
    .line 183
    sget-object v1, Ll/ptk0;->e:Ljava/lang/String;

    .line 184
    .line 185
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->awayReason:Ljava/lang/String;

    .line 186
    .line 187
    :cond_4
    :goto_0
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getStartTime()J

    .line 188
    .line 189
    .line 190
    move-result-wide v1

    .line 191
    const-wide/16 v3, 0x0

    .line 192
    .line 193
    cmp-long v1, v1, v3

    .line 194
    .line 195
    if-lez v1, :cond_5

    .line 196
    .line 197
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getStartTime()J

    .line 198
    .line 199
    .line 200
    move-result-wide v1

    .line 201
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object v1

    .line 205
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->startTime:Ljava/lang/String;

    .line 206
    .line 207
    :cond_5
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getBossModeInfo()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$BossModeInfo;

    .line 208
    .line 209
    .line 210
    move-result-object v1

    .line 211
    if-eqz v1, :cond_6

    .line 212
    .line 213
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getBossModeInfo()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$BossModeInfo;

    .line 214
    .line 215
    .line 216
    move-result-object v1

    .line 217
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$BossModeInfo;->getPopularity()J

    .line 218
    .line 219
    .line 220
    move-result-wide v1

    .line 221
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->popularity:J

    .line 222
    .line 223
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getBossModeInfo()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$BossModeInfo;

    .line 224
    .line 225
    .line 226
    move-result-object v1

    .line 227
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$BossModeInfo;->getContribution()J

    .line 228
    .line 229
    .line 230
    move-result-wide v1

    .line 231
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->contribution:J

    .line 232
    .line 233
    :cond_6
    invoke-virtual {p0, p1}, Ll/gvn0;->b(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;)Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;

    .line 234
    .line 235
    .line 236
    move-result-object p0

    .line 237
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->callEffect:Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;

    .line 238
    .line 239
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getUserNameGradientColorsCount()I

    .line 240
    .line 241
    .line 242
    move-result p0

    .line 243
    if-lez p0, :cond_7

    .line 244
    .line 245
    new-instance p0, Ljava/util/ArrayList;

    .line 246
    .line 247
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getUserNameGradientColorsList()Ljava/util/List;

    .line 248
    .line 249
    .line 250
    move-result-object p1

    .line 251
    invoke-direct {p0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 252
    .line 253
    .line 254
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userNameGradientColors:Ljava/util/List;

    .line 255
    .line 256
    :cond_7
    return-object v0
.end method

.method public final d(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;)Ll/nsv;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;",
            ")",
            "Ll/nsv<",
            "Ll/h64;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/h64;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getUserId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getUserName()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getUserProfile()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    invoke-virtual {v3}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;->getPictureUrl()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    invoke-direct {v0, v1, v2, v3}, Ll/h64;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getUserProfile()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;->getUserMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getVoiceMaskModeAddition()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    invoke-virtual {v3}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;->getColor()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    iput-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->color:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getVoiceMaskModeAddition()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    invoke-virtual {v3}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;->getGender()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    iput-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->gender:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getUserId()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    iput-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->userId:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getAvatar()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    iput-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatar:Ljava/lang/String;

    .line 65
    .line 66
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 67
    .line 68
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getAvatarConfig()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 69
    .line 70
    .line 71
    move-result-object v4

    .line 72
    invoke-virtual {v4}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->getFrameConfig()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 73
    .line 74
    .line 75
    move-result-object v4

    .line 76
    invoke-virtual {p0, v4}, Ll/gvn0;->n(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;)Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    iput-object p0, v3, Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;->frameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 81
    .line 82
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getUserNameGradientColorsCount()I

    .line 83
    .line 84
    .line 85
    move-result p0

    .line 86
    if-lez p0, :cond_0

    .line 87
    .line 88
    new-instance p0, Ljava/util/ArrayList;

    .line 89
    .line 90
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getUserNameGradientColorsList()Ljava/util/List;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    invoke-direct {p0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 95
    .line 96
    .line 97
    iput-object p0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->userNameGradientColors:Ljava/util/List;

    .line 98
    .line 99
    :cond_0
    invoke-static {v0}, Ll/nsv;->f(Ljava/lang/Object;)Ll/nsv;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    iget-object v0, v0, Ll/h64;->a:Ljava/lang/String;

    .line 104
    .line 105
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceCall;->getUserProfile()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;->getMaskMode()Z

    .line 110
    .line 111
    .line 112
    move-result p1

    .line 113
    invoke-virtual {p0, v0, v1, p1}, Ll/nsv;->c(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;Z)Ll/nsv;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    return-object p0
.end method

.method public e()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gvn0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gvn0;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public g()Ll/nsv;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/nsv<",
            "Ll/h64;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/gvn0;->e:Ll/nsv;

    .line 2
    .line 3
    return-object p0
.end method

.method public h()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gvn0;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public i()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gvn0;->g:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public j()I
    .locals 0

    .line 1
    iget p0, p0, Ll/gvn0;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public k(I)Z
    .locals 0

    .line 1
    iget p0, p0, Ll/gvn0;->b:I

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

.method public l()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/gvn0;->f:Z

    .line 2
    .line 3
    return p0
.end method

.method public m()Z
    .locals 1

    .line 1
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Ll/gvn0;->e:Ll/nsv;

    .line 8
    .line 9
    iget-object p0, p0, Ll/nsv;->a:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast p0, Ll/h64;

    .line 12
    .line 13
    iget-object p0, p0, Ll/h64;->a:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0
.end method

.method public final n(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;)Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->getStaticUrl()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->staticUrl:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->getDynamicUrl()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->dynamicUrl:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->getSmallDynamicUrl()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->smallDynamicUrl:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->getMediumDynamicUrl()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->mediumDynamicUrl:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->getTotalSec()J

    .line 30
    .line 31
    .line 32
    move-result-wide v0

    .line 33
    long-to-int v0, v0

    .line 34
    iput v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->totalSec:I

    .line 35
    .line 36
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->getRemainingSec()J

    .line 37
    .line 38
    .line 39
    move-result-wide v0

    .line 40
    long-to-int v0, v0

    .line 41
    iput v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->remainingSec:I

    .line 42
    .line 43
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->getChangeVoiceNo()J

    .line 44
    .line 45
    .line 46
    move-result-wide v0

    .line 47
    long-to-int v0, v0

    .line 48
    iput v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->changeVoiceNo:I

    .line 49
    .line 50
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->getEndMill()J

    .line 51
    .line 52
    .line 53
    move-result-wide v0

    .line 54
    iput-wide v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->endMill:J

    .line 55
    .line 56
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->getFunnyUrl()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->funnyUrl:Ljava/lang/String;

    .line 61
    .line 62
    return-object p0
.end method
