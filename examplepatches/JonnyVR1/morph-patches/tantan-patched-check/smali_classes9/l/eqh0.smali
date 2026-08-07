.class public Ll/eqh0;
.super Ll/mq2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/mq2<",
        "Lcom/p1/mobile/longlink/msg/liveroom/voiceTemplateMsg$VoiceTemplateMsg;",
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
.method public A(Lcom/p1/mobile/longlink/msg/liveroom/voiceTemplateMsg$VoiceTemplateMsg;Ljava/lang/String;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public B(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/liveroom/voiceTemplateMsg$VoiceTemplateMsg;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;
    .locals 8

    .line 1
    invoke-virtual {p0, p2}, Ll/eqh0;->z(Lcom/p1/mobile/longlink/msg/liveroom/voiceTemplateMsg$VoiceTemplateMsg;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v4

    .line 5
    iget-object p3, p0, Ll/mq2;->c:Ll/zod;

    .line 6
    .line 7
    invoke-virtual {p3}, Ll/zod;->d()Ll/m500;

    .line 8
    .line 9
    .line 10
    move-result-object p3

    .line 11
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/voiceTemplateMsg$VoiceTemplateMsg;->getTemplateData()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;->getId()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-virtual {p3, v0}, Ll/m500;->f(I)Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;

    .line 20
    .line 21
    .line 22
    move-result-object p3

    .line 23
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/voiceTemplateMsg$VoiceTemplateMsg;->getTemplateData()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {v0, p3}, Ll/f7t;->A(Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;

    .line 28
    .line 29
    .line 30
    move-result-object v7

    .line 31
    invoke-static {p3}, Ll/f7t;->x(Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p3

    .line 35
    iput-object p3, v7, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->buttonScene:Ljava/lang/String;

    .line 36
    .line 37
    const/4 p3, 0x1

    .line 38
    iput-boolean p3, v7, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->isSystemReplaceMessage:Z

    .line 39
    .line 40
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/voiceTemplateMsg$VoiceTemplateMsg;->getTemplateData()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 41
    .line 42
    .line 43
    move-result-object p3

    .line 44
    invoke-virtual {p3}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;->getId()I

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    const/4 v5, 0x0

    .line 49
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/voiceTemplateMsg$VoiceTemplateMsg;->getTemplateData()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 50
    .line 51
    .line 52
    move-result-object v6

    .line 53
    const/4 v1, 0x0

    .line 54
    move-object v0, p0

    .line 55
    move-object v2, p1

    .line 56
    invoke-virtual/range {v0 .. v7}, Ll/mq2;->l(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;Ljava/lang/String;ILcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;Ljava/lang/String;Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    return-object p0
.end method

.method public b()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "Lcom/p1/mobile/longlink/msg/liveroom/voiceTemplateMsg$VoiceTemplateMsg;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceTemplateMsg$VoiceTemplateMsg;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "voiceLive.template.msg"

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic q(Lcom/google/protobuf/q;Ljava/lang/String;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/voiceTemplateMsg$VoiceTemplateMsg;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/eqh0;->A(Lcom/p1/mobile/longlink/msg/liveroom/voiceTemplateMsg$VoiceTemplateMsg;Ljava/lang/String;)Z

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
    check-cast p2, Lcom/p1/mobile/longlink/msg/liveroom/voiceTemplateMsg$VoiceTemplateMsg;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/eqh0;->B(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/liveroom/voiceTemplateMsg$VoiceTemplateMsg;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final z(Lcom/p1/mobile/longlink/msg/liveroom/voiceTemplateMsg$VoiceTemplateMsg;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;
    .locals 3

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/voiceTemplateMsg$VoiceTemplateMsg;->getSenderMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getUserId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/voiceTemplateMsg$VoiceTemplateMsg;->getSenderMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getName()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/voiceTemplateMsg$VoiceTemplateMsg;->getSenderMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-static {v2}, Ll/v6o0;->a(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-direct {p0, v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/voiceTemplateMsg$VoiceTemplateMsg;->getSenderMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/voiceTemplateMsg$VoiceTemplateMsg;->getSenderMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getVoiceMaskModeAddition()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    if-eqz v0, :cond_0

    .line 45
    .line 46
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/voiceTemplateMsg$VoiceTemplateMsg;->getSenderMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getVoiceMaskModeAddition()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;->getColor()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    if-nez p1, :cond_0

    .line 63
    .line 64
    const/4 p1, 0x1

    .line 65
    goto :goto_0

    .line 66
    :cond_0
    const/4 p1, 0x0

    .line 67
    :goto_0
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;->isMaskMode:Z

    .line 68
    .line 69
    return-object p0
.end method
