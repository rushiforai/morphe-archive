.class public Ll/mi3;
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

.method public static a(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$SystemLiveCommentBackground;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground;
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground;->newBuilder()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground$Builder;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$SystemLiveCommentBackground;->getBottomImgUrl()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground$Builder;->setBottomImgUrl(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground$Builder;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$SystemLiveCommentBackground;->getCoverImgUrl()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v1, v2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground$Builder;->setCoverImgUrl(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground$Builder;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$SystemLiveCommentBackground;->getHeaderImgUrl()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-virtual {v1, v2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground$Builder;->setHeaderImgUrl(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground$Builder;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$SystemLiveCommentBackground;->getMiddleImgUrl()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v1, p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground$Builder;->setMiddleImgUrl(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground$Builder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground;

    .line 41
    .line 42
    return-object p0
.end method

.method public static b(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$TemplateData;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$TemplateData;->newBuilder()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$TemplateData$Builder;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;->getId()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-virtual {v0, p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$TemplateData$Builder;->setId(I)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$TemplateData$Builder;

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$TemplateData;

    .line 17
    .line 18
    return-object p0
.end method

.method public static c(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$SystemLiveCommentsMsg;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;->newBuilder()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg$Builder;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$SystemLiveCommentsMsg;->getAlignment()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Alignment;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Alignment;->getNumber()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-static {v1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$Alignment;->forNumber(I)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$Alignment;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg$Builder;->setAlignment(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$Alignment;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg$Builder;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$SystemLiveCommentsMsg;->getBackground()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$SystemLiveCommentBackground;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-static {v2}, Ll/mi3;->a(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$SystemLiveCommentBackground;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v1, v2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg$Builder;->setBackground(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentBackground;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg$Builder;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$SystemLiveCommentsMsg;->getStartColor()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v1, v2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg$Builder;->setStartColor(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg$Builder;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$SystemLiveCommentsMsg;->getEndColor()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-virtual {v1, v2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg$Builder;->setEndColor(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg$Builder;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$SystemLiveCommentsMsg;->getIconUrl()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-virtual {v1, v2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg$Builder;->setIconUrl(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg$Builder;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$SystemLiveCommentsMsg;->getRoomID()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    invoke-virtual {v1, v2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg$Builder;->setRoomID(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg$Builder;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$SystemLiveCommentsMsg;->getDisplayDuration()J

    .line 66
    .line 67
    .line 68
    move-result-wide v2

    .line 69
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg$Builder;->setDisplayDuration(J)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg$Builder;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$SystemLiveCommentsMsg;->getTemplate()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    invoke-static {v2}, Ll/mi3;->b(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$TemplateData;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$TemplateData;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    invoke-virtual {v1, v2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg$Builder;->setTemplateData(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$TemplateData;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg$Builder;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$SystemLiveCommentsMsg;->getGotoSchema()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    invoke-virtual {v1, v2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg$Builder;->setGotoSchema(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg$Builder;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$SystemLiveCommentsMsg;->getId()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    invoke-virtual {v1, v2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg$Builder;->setId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg$Builder;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$SystemLiveCommentsMsg;->getPriority()J

    .line 102
    .line 103
    .line 104
    move-result-wide v2

    .line 105
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg$Builder;->setPriority(J)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg$Builder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveBullet$SystemVoiceLiveCommentsMsg;

    .line 113
    .line 114
    return-object p0
.end method
