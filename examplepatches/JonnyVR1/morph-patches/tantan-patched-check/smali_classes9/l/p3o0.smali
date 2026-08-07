.class public Ll/p3o0;
.super Ll/mq2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/mq2<",
        "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;",
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
.method public A(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;Ljava/lang/String;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public B(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;
    .locals 10

    .line 1
    invoke-virtual {p0, p2}, Ll/p3o0;->z(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;

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
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->getTempdata()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 11
    .line 12
    .line 13
    move-result-object p3

    .line 14
    invoke-virtual {p3}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;->getId()I

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->getTempdata()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;

    .line 19
    .line 20
    .line 21
    move-result-object v6

    .line 22
    const/4 v8, 0x0

    .line 23
    sget v9, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->VOICE_CHAT_MIC_EMOJI_CATEGORY:I

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    const/4 v5, 0x0

    .line 27
    move-object v0, p0

    .line 28
    move-object v2, p1

    .line 29
    invoke-virtual/range {v0 .. v9}, Ll/mq2;->m(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;Ljava/lang/String;ILcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;Ljava/lang/String;Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$SharedVoiceLiveInfo;I)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public b()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "voicelive.tricks.emojiPlayMsg"

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic q(Lcom/google/protobuf/q;Ljava/lang/String;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/p3o0;->A(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;Ljava/lang/String;)Z

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
    check-cast p2, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/p3o0;->B(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final z(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;
    .locals 3

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->getUserMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

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
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->getUserMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

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
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->getUserMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

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
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->getEmojiType()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;->emojiType:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->getResultList()Ljava/util/List;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;->emojiResult:Ljava/util/List;

    .line 41
    .line 42
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->getMid()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;->mid:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->getUserMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    if-eqz v0, :cond_0

    .line 53
    .line 54
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->getUserMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getVoiceMaskModeAddition()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    if-eqz v0, :cond_0

    .line 63
    .line 64
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessage;->getUserMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getVoiceMaskModeAddition()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;->getColor()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    if-nez p1, :cond_0

    .line 81
    .line 82
    const/4 p1, 0x1

    .line 83
    goto :goto_0

    .line 84
    :cond_0
    const/4 p1, 0x0

    .line 85
    :goto_0
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;->isMaskMode:Z

    .line 86
    .line 87
    return-object p0
.end method
