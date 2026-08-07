.class public Ll/f3t;
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

.method public static a(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;
    .locals 2
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getAvatar()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatar:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getName()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->name:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getVoiceMaskModeAddition()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;->getColor()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->color:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getVoiceMaskModeAddition()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;->getGender()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->gender:Ljava/lang/String;

    .line 32
    .line 33
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;->frameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getAvatarConfig()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->getFrameConfig()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->getStaticUrl()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->staticUrl:Ljava/lang/String;

    .line 50
    .line 51
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;->frameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 54
    .line 55
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getAvatarConfig()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->getFrameConfig()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->getDynamicUrl()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->dynamicUrl:Ljava/lang/String;

    .line 68
    .line 69
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 70
    .line 71
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;->frameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 72
    .line 73
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getAvatarConfig()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->getFrameConfig()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->getSmallDynamicUrl()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->smallDynamicUrl:Ljava/lang/String;

    .line 86
    .line 87
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 88
    .line 89
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;->frameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 90
    .line 91
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getAvatarConfig()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->getFrameConfig()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->getMediumDynamicUrl()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->mediumDynamicUrl:Ljava/lang/String;

    .line 104
    .line 105
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 106
    .line 107
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;->frameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 108
    .line 109
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getAvatarConfig()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->getFrameConfig()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->getFunnyUrl()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->funnyUrl:Ljava/lang/String;

    .line 122
    .line 123
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getAvatarResourceType()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarResourceType:Ljava/lang/String;

    .line 128
    .line 129
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getUserNameGradientColorsList()Ljava/util/List;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    if-nez v0, :cond_0

    .line 138
    .line 139
    new-instance v0, Ljava/util/ArrayList;

    .line 140
    .line 141
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getUserNameGradientColorsList()Ljava/util/List;

    .line 142
    .line 143
    .line 144
    move-result-object p0

    .line 145
    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 146
    .line 147
    .line 148
    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->userNameGradientColors:Ljava/util/List;

    .line 149
    .line 150
    :cond_0
    return-object p1
.end method

.method public static b(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p0, v0}, Ll/f3t;->a(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static c(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getUserId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->userId:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getName()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->name:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {p0, v0}, Ll/f3t;->a(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public static d(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;
    .locals 3
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_2

    .line 3
    .line 4
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 5
    .line 6
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->masks:Ljava/util/List;

    .line 7
    .line 8
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->masks:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_2

    .line 28
    .line 29
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 34
    .line 35
    iget-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->userId:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-eqz v2, :cond_1

    .line 42
    .line 43
    return-object v1

    .line 44
    :cond_2
    :goto_0
    return-object v0
.end method

.method public static e(Ll/nsv;)Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;
    .locals 2
    .param p0    # Ll/nsv;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    invoke-static {p0}, Ll/e3t;->a(Ll/nsv;)Ll/e3t;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Ll/e3t;->e()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    invoke-static {p0}, Ll/e3t;->a(Ll/nsv;)Ll/e3t;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    iget-object p0, p0, Ll/e3t;->a:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_1
    invoke-static {p0}, Ll/l6o0;->c(Ll/nsv;)Ll/l6o0;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v1}, Ll/l6o0;->d()Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_2

    .line 31
    .line 32
    invoke-static {p0}, Ll/l6o0;->c(Ll/nsv;)Ll/l6o0;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    iget-object p0, p0, Ll/l6o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 37
    .line 38
    return-object p0

    .line 39
    :cond_2
    return-object v0
.end method

.method public static f(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;Ljava/lang/String;)Ll/nsv;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;",
            "Ljava/lang/String;",
            ")",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1}, Ll/f3t;->g(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p0, p1}, Ll/f3t;->d(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-static {v0}, Ll/nsv;->f(Ljava/lang/Object;)Ll/nsv;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1, p0}, Ll/nsv;->e(Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)Ll/nsv;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    invoke-static {v0}, Ll/nsv;->f(Ljava/lang/Object;)Ll/nsv;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public static g(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;
    .locals 2
    .param p0    # Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->users:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    iget-object v1, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    return-object v0

    .line 30
    :cond_1
    const/4 p0, 0x0

    .line 31
    return-object p0
.end method

.method public static h(Ll/nsv;)Ll/nsv;
    .locals 3
    .param p0    # Ll/nsv;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nsv<",
            "Ll/h64;",
            ">;)",
            "Ll/nsv<",
            "Ll/h64;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Ll/l6o0;->c(Ll/nsv;)Ll/l6o0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/l6o0;->d()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {p0}, Ll/l6o0;->c(Ll/nsv;)Ll/l6o0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v0, v0, Ll/l6o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 16
    .line 17
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 18
    .line 19
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;->frameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->checkNeedChangeVoice()Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-eqz v2, :cond_0

    .line 26
    .line 27
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->funnyUrl:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-nez v1, :cond_0

    .line 34
    .line 35
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 36
    .line 37
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;->frameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 38
    .line 39
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    iget-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->funnyUrl:Ljava/lang/String;

    .line 44
    .line 45
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->staticUrl:Ljava/lang/String;

    .line 46
    .line 47
    const-string v2, ""

    .line 48
    .line 49
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->dynamicUrl:Ljava/lang/String;

    .line 50
    .line 51
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->smallDynamicUrl:Ljava/lang/String;

    .line 52
    .line 53
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->mediumDynamicUrl:Ljava/lang/String;

    .line 54
    .line 55
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 56
    .line 57
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;->frameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 58
    .line 59
    invoke-virtual {v1}, Lcom/google/protobuf/nano/MessageNano;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    :cond_0
    return-object p0
.end method
