.class public Ll/v6o0;
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

.method public static a(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getVoiceMaskModeAddition()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;->getColor()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->color:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getVoiceMaskModeAddition()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;->getGender()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->gender:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getAvatar()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatar:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getUserId()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->userId:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getUserId()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->originUserId:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getName()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->name:Ljava/lang/String;

    .line 48
    .line 49
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 50
    .line 51
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;->frameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 52
    .line 53
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getAvatarConfig()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->getFrameConfig()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->getStaticUrl()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->staticUrl:Ljava/lang/String;

    .line 66
    .line 67
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 68
    .line 69
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;->frameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 70
    .line 71
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getAvatarConfig()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->getFrameConfig()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->getDynamicUrl()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->dynamicUrl:Ljava/lang/String;

    .line 84
    .line 85
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 86
    .line 87
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;->frameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 88
    .line 89
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getAvatarConfig()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->getFrameConfig()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->getMediumDynamicUrl()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->mediumDynamicUrl:Ljava/lang/String;

    .line 102
    .line 103
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 104
    .line 105
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;->frameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 106
    .line 107
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getAvatarConfig()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->getFrameConfig()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->getSmallDynamicUrl()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->smallDynamicUrl:Ljava/lang/String;

    .line 120
    .line 121
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getAvatarResourceType()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarResourceType:Ljava/lang/String;

    .line 126
    .line 127
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getUserNameGradientColorsList()Ljava/util/List;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 132
    .line 133
    .line 134
    move-result v1

    .line 135
    if-nez v1, :cond_0

    .line 136
    .line 137
    new-instance v1, Ljava/util/ArrayList;

    .line 138
    .line 139
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getUserNameGradientColorsList()Ljava/util/List;

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 144
    .line 145
    .line 146
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->userNameGradientColors:Ljava/util/List;

    .line 147
    .line 148
    :cond_0
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 149
    .line 150
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;->frameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 151
    .line 152
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getAvatarConfig()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 153
    .line 154
    .line 155
    move-result-object v2

    .line 156
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->getFrameConfig()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 157
    .line 158
    .line 159
    move-result-object v2

    .line 160
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->getFunnyUrl()Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v2

    .line 164
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->funnyUrl:Ljava/lang/String;

    .line 165
    .line 166
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 167
    .line 168
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;->frameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 169
    .line 170
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getAvatarConfig()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 171
    .line 172
    .line 173
    move-result-object v2

    .line 174
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->getFrameConfig()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 175
    .line 176
    .line 177
    move-result-object v2

    .line 178
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->getEndMill()J

    .line 179
    .line 180
    .line 181
    move-result-wide v2

    .line 182
    iput-wide v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->endMill:J

    .line 183
    .line 184
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 185
    .line 186
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;->frameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 187
    .line 188
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getAvatarConfig()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 189
    .line 190
    .line 191
    move-result-object v2

    .line 192
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->getFrameConfig()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 193
    .line 194
    .line 195
    move-result-object v2

    .line 196
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->getTotalSec()J

    .line 197
    .line 198
    .line 199
    move-result-wide v2

    .line 200
    long-to-int v2, v2

    .line 201
    iput v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->totalSec:I

    .line 202
    .line 203
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 204
    .line 205
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;->frameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 206
    .line 207
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getAvatarConfig()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 208
    .line 209
    .line 210
    move-result-object v2

    .line 211
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->getFrameConfig()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 212
    .line 213
    .line 214
    move-result-object v2

    .line 215
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->getRemainingSec()J

    .line 216
    .line 217
    .line 218
    move-result-wide v2

    .line 219
    long-to-int v2, v2

    .line 220
    iput v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->remainingSec:I

    .line 221
    .line 222
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 223
    .line 224
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;->frameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 225
    .line 226
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getAvatarConfig()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 227
    .line 228
    .line 229
    move-result-object p0

    .line 230
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->getFrameConfig()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 231
    .line 232
    .line 233
    move-result-object p0

    .line 234
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->getChangeVoiceNo()J

    .line 235
    .line 236
    .line 237
    move-result-wide v2

    .line 238
    long-to-int p0, v2

    .line 239
    iput p0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->changeVoiceNo:I

    .line 240
    .line 241
    return-object v0
.end method
