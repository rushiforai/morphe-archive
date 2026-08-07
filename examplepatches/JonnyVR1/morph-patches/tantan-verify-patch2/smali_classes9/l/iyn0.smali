.class public Ll/iyn0;
.super Ll/mq2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/mq2<",
        "Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/zod;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/mq2;-><init>(Ll/zod;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public A(Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;Ljava/lang/String;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public B(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;
    .locals 8

    .line 1
    invoke-virtual {p0, p2}, Ll/iyn0;->z(Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v4

    .line 5
    new-instance v7, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;

    .line 6
    .line 7
    invoke-direct {v7}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;->getSource()Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage$Source;

    .line 11
    .line 12
    .line 13
    move-result-object p3

    .line 14
    invoke-virtual {p3}, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage$Source;->getNumber()I

    .line 15
    .line 16
    .line 17
    move-result p3

    .line 18
    iput p3, v7, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->voiceFollowSource:I

    .line 19
    .line 20
    const/4 p3, 0x1

    .line 21
    iput-boolean p3, v7, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->isSystemReplaceMessage:Z

    .line 22
    .line 23
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;->getUserMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 24
    .line 25
    .line 26
    move-result-object p3

    .line 27
    if-eqz p3, :cond_0

    .line 28
    .line 29
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;->getUserMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 30
    .line 31
    .line 32
    move-result-object p3

    .line 33
    invoke-virtual {p3}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getUserId()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p3

    .line 37
    iput-object p3, v7, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->followUserId:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;->getUserMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 40
    .line 41
    .line 42
    move-result-object p3

    .line 43
    invoke-virtual {p3}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getUserId()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p3

    .line 47
    iput-object p3, v7, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->messageUserId:Ljava/lang/String;

    .line 48
    .line 49
    :cond_0
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;->getTemplateData()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 50
    .line 51
    .line 52
    move-result-object p3

    .line 53
    invoke-virtual {p3}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;->getId()I

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    const/4 v5, 0x0

    .line 58
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;->getTemplateData()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 59
    .line 60
    .line 61
    move-result-object v6

    .line 62
    const/4 v1, 0x0

    .line 63
    move-object v0, p0

    .line 64
    move-object v2, p1

    .line 65
    invoke-virtual/range {v0 .. v7}, Ll/mq2;->l(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;Ljava/lang/String;ILcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;Ljava/lang/String;Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    iget-object p1, v0, Ll/mq2;->c:Ll/zod;

    .line 70
    .line 71
    invoke-static {p0, p1}, Ll/afu;->m(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ll/zod;)V

    .line 72
    .line 73
    .line 74
    return-object p0
.end method

.method public b()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "voicelive.followship.guide"

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic q(Lcom/google/protobuf/q;Ljava/lang/String;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/iyn0;->A(Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public bridge synthetic x(Ljava/lang/String;Lcom/google/protobuf/q;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/iyn0;->B(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final z(Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;->getSourceValue()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x3

    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    new-instance p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;->getFollower()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->getId()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;->getFollower()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->getName()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-direct {p0, v0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-object p0

    .line 30
    :cond_0
    new-instance p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;

    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;->getUserMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getUserId()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;->getUserMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getName()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;->getUserMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-static {v2}, Ll/v6o0;->a(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-direct {p0, v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;->getUserMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    if-eqz v0, :cond_1

    .line 64
    .line 65
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;->getUserMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getVoiceMaskModeAddition()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    if-eqz v0, :cond_1

    .line 74
    .line 75
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/voiceFollow$VoiceLiveFollowMessage;->getUserMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getVoiceMaskModeAddition()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;->getColor()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 88
    .line 89
    .line 90
    move-result p1

    .line 91
    if-nez p1, :cond_1

    .line 92
    .line 93
    const/4 p1, 0x1

    .line 94
    goto :goto_0

    .line 95
    :cond_1
    const/4 p1, 0x0

    .line 96
    :goto_0
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;->isMaskMode:Z

    .line 97
    .line 98
    return-object p0
.end method
