.class public Ll/f7t;
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

.method public static A(Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, p1, v0}, Ll/f7t;->f(Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;)V

    .line 7
    .line 8
    .line 9
    invoke-static {p0, p1, v0}, Ll/f7t;->g(Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p0, p1, v0}, Ll/f7t;->i(Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;)V

    .line 13
    .line 14
    .line 15
    invoke-static {p0, p1, v0}, Ll/f7t;->h(Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;)V

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method public static B(Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;Ljava/lang/String;)I
    .locals 2

    .line 1
    const/4 v0, -0x1

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;->format:Ljava/util/List;

    .line 6
    .line 7
    new-instance v1, Ll/c7t;

    .line 8
    .line 9
    invoke-direct {v1, p1}, Ll/c7t;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;

    .line 17
    .line 18
    if-eqz p0, :cond_1

    .line 19
    .line 20
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->index:I

    .line 21
    .line 22
    if-lez p0, :cond_1

    .line 23
    .line 24
    add-int/lit8 p0, p0, -0x1

    .line 25
    .line 26
    return p0

    .line 27
    :cond_1
    return v0
.end method

.method public static synthetic a(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$DynamicEffectExtend;)Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffectExtend;
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffectExtend;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffectExtend;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$DynamicEffectExtend;->getKey()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffectExtend;->key:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$DynamicEffectExtend;->getValueList()Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffectExtend;->value:Ljava/util/List;

    .line 16
    .line 17
    return-object v0
.end method

.method public static synthetic b(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;Lcom/p1/mobile/putong/live/base/data/BLiveAtUserInfo;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$AtUserInfo;->newBuilder()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$AtUserInfo$Builder;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAtUserInfo;->userId:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$AtUserInfo$Builder;->setUserId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$AtUserInfo$Builder;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAtUserInfo;->userName:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$AtUserInfo$Builder;->setUserName(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$AtUserInfo$Builder;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    check-cast p1, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$AtUserInfo;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;->addAtUserInfos(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$AtUserInfo;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static synthetic c(Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveUserMedal;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;->newBuilder()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal$Builder;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMedal;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal$Builder;->setId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal$Builder;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMedal;->fanbaseGrade:I

    .line 12
    .line 13
    int-to-long v1, v1

    .line 14
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal$Builder;->setFanbaseGrade(J)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal$Builder;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMedal;->familyGrade:I

    .line 19
    .line 20
    int-to-long v1, v1

    .line 21
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal$Builder;->setFamilyGrade(J)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal$Builder;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMedal;->familyText:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal$Builder;->setFamilyText(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal$Builder;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMedal;->voiceFanbaseColor:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal$Builder;->setVoiceFanbaseColor(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal$Builder;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMedal;->voiceFanbaseGrade:I

    .line 38
    .line 39
    int-to-long v1, v1

    .line 40
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal$Builder;->setVoiceFanbaseGrade(J)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal$Builder;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMedal;->voiceFanbaseText:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal$Builder;->setVoiceFanbaseText(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal$Builder;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMedal;->familyLight:Z

    .line 51
    .line 52
    invoke-virtual {v0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal$Builder;->setFamilyLight(Z)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal$Builder;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    check-cast p1, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;

    .line 61
    .line 62
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public static synthetic d(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->type:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "button"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->type:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static f(Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;)V
    .locals 1

    .line 1
    const-string v0, "atUserId"

    .line 2
    .line 3
    invoke-static {p1, v0}, Ll/f7t;->B(Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 v0, -0x1

    .line 8
    if-eq p1, v0, :cond_0

    .line 9
    .line 10
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveAtUserInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveAtUserInfo;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;->getFields(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAtUserInfo;->userId:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v0, p2, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->atUserInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAtUserInfo;

    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public static g(Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;)V
    .locals 1

    .line 1
    const-string v0, "buttonUserId"

    .line 2
    .line 3
    invoke-static {p1, v0}, Ll/f7t;->B(Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 v0, -0x1

    .line 8
    if-eq p1, v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;->getFieldsCount()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-le v0, p1, :cond_0

    .line 15
    .line 16
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveAtUserInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveAtUserInfo;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;->getFields(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAtUserInfo;->userId:Ljava/lang/String;

    .line 25
    .line 26
    iput-object v0, p2, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->buttonUserInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAtUserInfo;

    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public static h(Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;)V
    .locals 1

    .line 1
    const-string v0, "buttonSchema"

    .line 2
    .line 3
    invoke-static {p1, v0}, Ll/f7t;->B(Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 v0, -0x1

    .line 8
    if-eq p1, v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;->getFields(I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    iput-object p0, p2, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->buttonSchema:Ljava/lang/String;

    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public static i(Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;)V
    .locals 1

    .line 1
    const-string v0, "profileUserId"

    .line 2
    .line 3
    invoke-static {p1, v0}, Ll/f7t;->B(Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 v0, -0x1

    .line 8
    if-eq p1, v0, :cond_0

    .line 9
    .line 10
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveAtUserInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveAtUserInfo;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;->getFields(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAtUserInfo;->userId:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v0, p2, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->atUserInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAtUserInfo;

    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public static j(Lcom/p1/mobile/putong/live/base/data/BLiveChatShadingConfig;Z)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;->newBuilder()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig$Builder;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    :try_start_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatShadingConfig;->backgroundColorConfig:Lcom/p1/mobile/putong/live/base/data/BLiveChatShadingContentConfig;

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :catch_0
    move-exception p0

    .line 11
    goto :goto_2

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatShadingConfig;->borderColorConfig:Lcom/p1/mobile/putong/live/base/data/BLiveChatShadingContentConfig;

    .line 13
    .line 14
    :goto_0
    const/4 p1, 0x0

    .line 15
    :goto_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatShadingContentConfig;->colors:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-ge p1, v1, :cond_1

    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatShadingContentConfig;->colors:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig$Builder;->addColors(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig$Builder;

    .line 32
    .line 33
    .line 34
    add-int/lit8 p1, p1, 0x1

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_1
    iget p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatShadingContentConfig;->gradientDirection:I

    .line 38
    .line 39
    int-to-long v1, p1

    .line 40
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig$Builder;->setGradientDirection(J)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig$Builder;

    .line 41
    .line 42
    .line 43
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatShadingContentConfig;->transparency:I

    .line 44
    .line 45
    int-to-long p0, p0

    .line 46
    invoke-virtual {v0, p0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig$Builder;->setTransparency(J)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig$Builder;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 47
    .line 48
    .line 49
    goto :goto_3

    .line 50
    :goto_2
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 51
    .line 52
    .line 53
    :goto_3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;

    .line 58
    .line 59
    return-object p0
.end method

.method public static k(Lcom/p1/mobile/putong/live/base/data/BLiveChatShadingConfig;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;->newBuilder()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig$Builder;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveChatShadingConfig;->hasChatShadingConfig()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-static {p0, v1}, Ll/f7t;->j(Lcom/p1/mobile/putong/live/base/data/BLiveChatShadingConfig;Z)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig$Builder;->setBackgroundColorConfig(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig$Builder;

    .line 17
    .line 18
    .line 19
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveChatShadingConfig;->hasBorderConfig()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-static {p0, v1}, Ll/f7t;->j(Lcom/p1/mobile/putong/live/base/data/BLiveChatShadingConfig;Z)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig$Builder;->setBorderColorConfig(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig$Builder;

    .line 31
    .line 32
    .line 33
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveChatShadingConfig;->hasCornerConfig()Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_2

    .line 38
    .line 39
    invoke-static {p0}, Ll/f7t;->l(Lcom/p1/mobile/putong/live/base/data/BLiveChatShadingConfig;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveCornerConfig;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {v0, p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig$Builder;->setCornerConfig(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveCornerConfig;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig$Builder;

    .line 44
    .line 45
    .line 46
    :cond_2
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;

    .line 51
    .line 52
    return-object p0
.end method

.method public static l(Lcom/p1/mobile/putong/live/base/data/BLiveChatShadingConfig;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveCornerConfig;
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveCornerConfig;->newBuilder()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveCornerConfig$Builder;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatShadingConfig;->cornerConfig:Lcom/p1/mobile/putong/live/base/data/BLiveChatShadingCornerConfig;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveChatShadingCornerConfig;->pictureUrl:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveCornerConfig$Builder;->setPictureUrl(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveCornerConfig$Builder;

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatShadingConfig;->cornerConfig:Lcom/p1/mobile/putong/live/base/data/BLiveChatShadingCornerConfig;

    .line 13
    .line 14
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatShadingCornerConfig;->position:I

    .line 15
    .line 16
    int-to-long v1, p0

    .line 17
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveCornerConfig$Builder;->setPosition(J)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveCornerConfig$Builder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveCornerConfig;

    .line 25
    .line 26
    return-object p0
.end method

.method public static m(Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->medal:Lcom/p1/mobile/putong/live/base/data/BLiveMessageUserMedal;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMessageUserMedal;->singleRoomMedals:Ljava/util/List;

    .line 4
    .line 5
    invoke-static {v0}, Ll/f7t;->z(Ljava/util/List;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->medal:Lcom/p1/mobile/putong/live/base/data/BLiveMessageUserMedal;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveMessageUserMedal;->multiRoomMedals:Ljava/util/List;

    .line 12
    .line 13
    invoke-static {v1}, Ll/f7t;->z(Ljava/util/List;)Ljava/util/List;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->newBuilder()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage$Builder;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->medal:Lcom/p1/mobile/putong/live/base/data/BLiveMessageUserMedal;

    .line 22
    .line 23
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveMessageUserMedal;->version:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v2, v3}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage$Builder;->setVersion(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage$Builder;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->medal:Lcom/p1/mobile/putong/live/base/data/BLiveMessageUserMedal;

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveMessageUserMedal;->getAllId()Ljava/util/List;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {v2, p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage$Builder;->addAllIds(Ljava/lang/Iterable;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage$Builder;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0, v0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage$Builder;->addAllSingleRoomMedals(Ljava/lang/Iterable;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage$Builder;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0, v1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage$Builder;->addAllMultiRoomMedals(Ljava/lang/Iterable;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage$Builder;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    .line 52
    .line 53
    return-object p0
.end method

.method public static n(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSingTogether;
    .locals 5
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSingTogether;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSingTogether;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->getId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSingTogether;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->getCurrentSing()Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->getCurrentSing()Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-static {v1}, Ll/f7t;->p(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSing;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSingTogether;->currentSing:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSing;

    .line 26
    .line 27
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->getNextSing()Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    if-eqz v1, :cond_1

    .line 32
    .line 33
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSing;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSing;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->getNextSing()Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->getCountDownSeconds()I

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    iput v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSing;->countDownSeconds:I

    .line 46
    .line 47
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->getRemainSeconds()I

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    int-to-long v3, v3

    .line 52
    iput-wide v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSing;->remainSeconds:J

    .line 53
    .line 54
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->getAccompany()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    iput-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSing;->accompany:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->getMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    invoke-static {v3}, Ll/f3t;->c(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    iput-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSing;->mask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 69
    .line 70
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->getUserId()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    iput-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSing;->userId:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$NextSing;->getTitle()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSing;->title:Ljava/lang/String;

    .line 81
    .line 82
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSingTogether;->nextSing:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSing;

    .line 83
    .line 84
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->getStatus()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-static {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSingTogehterState;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSingTogehterState;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSingTogether;->status:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSingTogehterState;

    .line 93
    .line 94
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$VoiceSing;->getToast()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSingTogether;->toast:Ljava/lang/String;

    .line 99
    .line 100
    return-object v0
.end method

.method public static o(Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg;)Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg;->getUserLiveRight()Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->getAttribute()Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->hasCallEffectConfig()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    return-object p0

    .line 17
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg;->getUserLiveRight()Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->getAttribute()Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->getCallEffectConfig()Lcom/p1/mobile/longlink/msg/liveright/liveRight$CallEffectConfig;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$CallEffectConfig;->getDefaultIcon()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;->defaultIcon:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$CallEffectConfig;->getMuteIcon()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;->muteIcon:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$CallEffectConfig;->getVerticalBg()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;->verticalBg:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$CallEffectConfig;->getHorizontalBg()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;->horizontalBg:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$CallEffectConfig;->getVerticalVoicingUrl()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;->verticalVoicingUrl:Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$CallEffectConfig;->getHorizontalVoicingUrl()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;->horizontalVoicingUrl:Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$CallEffectConfig;->getCircleVoicingUrl()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;->circleVoicingUrl:Ljava/lang/String;

    .line 74
    .line 75
    return-object v0
.end method

.method public static p(Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSing;
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSing;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSing;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->getUserId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSing;->userId:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->getMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-static {v1}, Ll/v6o0;->a(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSing;->mask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->getAccompany()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSing;->accompany:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->getOrderId()J

    .line 28
    .line 29
    .line 30
    move-result-wide v1

    .line 31
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSing;->orderId:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->getTitle()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSing;->title:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->getProgressMilliseconds()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSing;->progressMilliseconds:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->getCover()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSing;->cover:Ljava/lang/String;

    .line 58
    .line 59
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->getLyricType()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSing;->lyricType:Ljava/lang/String;

    .line 64
    .line 65
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->getLyricUrl()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSing;->lyricUrl:Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/intlvoicesing/voiceSingTogether$CurrentSing;->getSongCode()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSing;->songCode:Ljava/lang/String;

    .line 76
    .line 77
    return-object v0
.end method

.method public static q(Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg;)Ll/x8p0;
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg;->getUserLiveRight()Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->getUserId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->getAttribute()Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-virtual {v3}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->getAvatarConfig()Lcom/p1/mobile/longlink/msg/liveright/liveRight$AvatarConfig;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    invoke-virtual {v3}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AvatarConfig;->getFrameConfig()Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    invoke-virtual {v3}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;->getStaticUrl()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    iput-object v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->staticUrl:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->getAttribute()Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    invoke-virtual {v3}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->getAvatarConfig()Lcom/p1/mobile/longlink/msg/liveright/liveRight$AvatarConfig;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    invoke-virtual {v3}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AvatarConfig;->getFrameConfig()Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    invoke-virtual {v3}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$PictureConfig;->getDynamicUrl()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    iput-object v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->dynamicUrl:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg;->getAction()Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    sget-object v4, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;->unequip:Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg$AcquireUserLiveRightAction;

    .line 54
    .line 55
    if-ne v3, v4, :cond_0

    .line 56
    .line 57
    const/4 v3, 0x1

    .line 58
    goto :goto_0

    .line 59
    :cond_0
    const/4 v3, 0x0

    .line 60
    :goto_0
    new-instance v4, Ll/x8p0;

    .line 61
    .line 62
    invoke-direct {v4, v3, v1, v2}, Ll/x8p0;-><init>(ILjava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;)V

    .line 63
    .line 64
    .line 65
    invoke-static {p0}, Ll/f7t;->o(Lcom/p1/mobile/longlink/msg/liveright/liveRight$AcquireUserLiveRightMsg;)Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {v4, p0}, Ll/x8p0;->b(Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->getRightType()Lcom/p1/mobile/longlink/msg/liveright/liveRight$Type;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {p0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    iput-object p0, v4, Ll/x8p0;->e:Ljava/lang/String;

    .line 81
    .line 82
    return-object v4
.end method

.method public static r(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;
    .locals 9

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->getGiftItemBrief()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->getUserName()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    iput-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->userName:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->getUserUrl()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    iput-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->fpUrl:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->getId()J

    .line 23
    .line 24
    .line 25
    move-result-wide v2

    .line 26
    long-to-int v2, v2

    .line 27
    iput v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->id:I

    .line 28
    .line 29
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->getCombos()J

    .line 30
    .line 31
    .line 32
    move-result-wide v2

    .line 33
    long-to-int v2, v2

    .line 34
    iput v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->combos:I

    .line 35
    .line 36
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->getGiftNum()J

    .line 37
    .line 38
    .line 39
    move-result-wide v2

    .line 40
    long-to-int v2, v2

    .line 41
    iput v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->num:I

    .line 42
    .line 43
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->getComboId()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    iput-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->comboId:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->getStickFacePositionType()J

    .line 50
    .line 51
    .line 52
    move-result-wide v2

    .line 53
    long-to-int v2, v2

    .line 54
    iput v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->stickFacePositionType:I

    .line 55
    .line 56
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->getGiftSource()J

    .line 57
    .line 58
    .line 59
    move-result-wide v2

    .line 60
    long-to-int v2, v2

    .line 61
    iput v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->giftSource:I

    .line 62
    .line 63
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->getLuckyPrizeGiftInfoItemId()J

    .line 64
    .line 65
    .line 66
    move-result-wide v2

    .line 67
    long-to-int v2, v2

    .line 68
    iput v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->luckyPrizeGiftInfoGiftItemId:I

    .line 69
    .line 70
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->getLotteryGiftId()J

    .line 71
    .line 72
    .line 73
    move-result-wide v2

    .line 74
    long-to-int v2, v2

    .line 75
    iput v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->lotteryGiftId:I

    .line 76
    .line 77
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->hasMultiCall()Z

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    if-eqz v2, :cond_0

    .line 82
    .line 83
    const-string v2, "extra_type_multi_call"

    .line 84
    .line 85
    iput-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->briefType:Ljava/lang/String;

    .line 86
    .line 87
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->getMultiCall()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    invoke-virtual {v3}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;->getCallId()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    iput-object v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;->callId:Ljava/lang/String;

    .line 100
    .line 101
    iget-object v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;->receiveGiftRole:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCallGiftRole;

    .line 102
    .line 103
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->getMultiCall()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 104
    .line 105
    .line 106
    move-result-object v4

    .line 107
    invoke-virtual {v4}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;->getReceiveGiftRole()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall$ReceiveGiftRole;

    .line 108
    .line 109
    .line 110
    move-result-object v4

    .line 111
    invoke-virtual {v4}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall$ReceiveGiftRole;->getPosition()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v4

    .line 115
    iput-object v4, v3, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCallGiftRole;->position:Ljava/lang/String;

    .line 116
    .line 117
    iget-object v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;->receiveGiftRole:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCallGiftRole;

    .line 118
    .line 119
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->getMultiCall()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;

    .line 120
    .line 121
    .line 122
    move-result-object v4

    .line 123
    invoke-virtual {v4}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall;->getReceiveGiftRole()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall$ReceiveGiftRole;

    .line 124
    .line 125
    .line 126
    move-result-object v4

    .line 127
    invoke-virtual {v4}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftMultiCall$ReceiveGiftRole;->getName()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v4

    .line 131
    iput-object v4, v3, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCallGiftRole;->name:Ljava/lang/String;

    .line 132
    .line 133
    iput-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->multiCall:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 134
    .line 135
    goto :goto_1

    .line 136
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->getAnchorUserName()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v2

    .line 140
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 141
    .line 142
    .line 143
    move-result v2

    .line 144
    if-eqz v2, :cond_1

    .line 145
    .line 146
    const-string v2, "extra_type_normal"

    .line 147
    .line 148
    goto :goto_0

    .line 149
    :cond_1
    const-string v2, "extra_type_lian_mai"

    .line 150
    .line 151
    :goto_0
    iput-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->briefType:Ljava/lang/String;

    .line 152
    .line 153
    :goto_1
    new-instance v2, Ll/ine0;

    .line 154
    .line 155
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->getUserId()Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object v3

    .line 159
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->getAnchorId()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v4

    .line 163
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->getAnchorUserName()Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object v5

    .line 167
    invoke-direct {v2, v3, v4, v5, p1}, Ll/ine0;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    iput-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->sendGiftExtraInfo:Ll/ine0;

    .line 171
    .line 172
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->getExtraInfo()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->getDrawInfo()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;

    .line 177
    .line 178
    .line 179
    move-result-object v2

    .line 180
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;->getCoordinatesList()Ljava/util/List;

    .line 181
    .line 182
    .line 183
    move-result-object v3

    .line 184
    invoke-static {v3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 185
    .line 186
    .line 187
    move-result v4

    .line 188
    if-nez v4, :cond_3

    .line 189
    .line 190
    new-instance v4, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 191
    .line 192
    invoke-direct {v4}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;-><init>()V

    .line 193
    .line 194
    .line 195
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;->getWidth()F

    .line 196
    .line 197
    .line 198
    move-result v5

    .line 199
    float-to-int v5, v5

    .line 200
    int-to-float v5, v5

    .line 201
    iput v5, v4, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->width:F

    .line 202
    .line 203
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;->getLength()F

    .line 204
    .line 205
    .line 206
    move-result v2

    .line 207
    float-to-int v2, v2

    .line 208
    int-to-float v2, v2

    .line 209
    iput v2, v4, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->length:F

    .line 210
    .line 211
    new-instance v2, Ljava/util/ArrayList;

    .line 212
    .line 213
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 214
    .line 215
    .line 216
    iput-object v2, v4, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->coordinates:Ljava/util/List;

    .line 217
    .line 218
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 219
    .line 220
    .line 221
    move-result-object v2

    .line 222
    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 223
    .line 224
    .line 225
    move-result v3

    .line 226
    if-eqz v3, :cond_2

    .line 227
    .line 228
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 229
    .line 230
    .line 231
    move-result-object v3

    .line 232
    check-cast v3, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCoordinate;

    .line 233
    .line 234
    new-instance v5, Lcom/p1/mobile/putong/live/base/data/BLivePosition;

    .line 235
    .line 236
    invoke-direct {v5}, Lcom/p1/mobile/putong/live/base/data/BLivePosition;-><init>()V

    .line 237
    .line 238
    .line 239
    invoke-virtual {v3}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCoordinate;->getX()F

    .line 240
    .line 241
    .line 242
    move-result v6

    .line 243
    float-to-int v6, v6

    .line 244
    int-to-float v6, v6

    .line 245
    iput v6, v5, Lcom/p1/mobile/putong/live/base/data/BLivePosition;->x:F

    .line 246
    .line 247
    invoke-virtual {v3}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCoordinate;->getY()F

    .line 248
    .line 249
    .line 250
    move-result v3

    .line 251
    float-to-int v3, v3

    .line 252
    int-to-float v3, v3

    .line 253
    iput v3, v5, Lcom/p1/mobile/putong/live/base/data/BLivePosition;->y:F

    .line 254
    .line 255
    iget-object v3, v4, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->coordinates:Ljava/util/List;

    .line 256
    .line 257
    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 258
    .line 259
    .line 260
    goto :goto_2

    .line 261
    :cond_2
    iput-object v4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->drawParam:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 262
    .line 263
    :cond_3
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->getMaskMode()Z

    .line 264
    .line 265
    .line 266
    move-result v2

    .line 267
    iput-boolean v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->hasVoiceMode:Z

    .line 268
    .line 269
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->getUserMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 270
    .line 271
    .line 272
    move-result-object v2

    .line 273
    invoke-static {v2}, Ll/f3t;->b(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 274
    .line 275
    .line 276
    move-result-object v2

    .line 277
    iput-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->liveUserMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 278
    .line 279
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->getExtraInfo()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    .line 280
    .line 281
    .line 282
    move-result-object v2

    .line 283
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->getVideoEffectExtrasList()Ljava/util/List;

    .line 284
    .line 285
    .line 286
    move-result-object v2

    .line 287
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 288
    .line 289
    .line 290
    move-result v2

    .line 291
    if-eqz v2, :cond_4

    .line 292
    .line 293
    new-instance v2, Ljava/util/ArrayList;

    .line 294
    .line 295
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 296
    .line 297
    .line 298
    goto :goto_3

    .line 299
    :cond_4
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->getExtraInfo()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;

    .line 300
    .line 301
    .line 302
    move-result-object v2

    .line 303
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->getVideoEffectExtrasList()Ljava/util/List;

    .line 304
    .line 305
    .line 306
    move-result-object v2

    .line 307
    :goto_3
    new-instance v3, Ljava/util/ArrayList;

    .line 308
    .line 309
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 310
    .line 311
    .line 312
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 313
    .line 314
    .line 315
    move-result-object v2

    .line 316
    :goto_4
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 317
    .line 318
    .line 319
    move-result v4

    .line 320
    if-eqz v4, :cond_5

    .line 321
    .line 322
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 323
    .line 324
    .line 325
    move-result-object v4

    .line 326
    check-cast v4, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$VideoEffectExtra;

    .line 327
    .line 328
    new-instance v5, Lcom/p1/mobile/putong/live/base/data/BLiveSpecialEffectResources;

    .line 329
    .line 330
    invoke-virtual {v4}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$VideoEffectExtra;->getId()Ljava/lang/String;

    .line 331
    .line 332
    .line 333
    move-result-object v6

    .line 334
    invoke-virtual {v4}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$VideoEffectExtra;->getType()J

    .line 335
    .line 336
    .line 337
    move-result-wide v7

    .line 338
    long-to-int v7, v7

    .line 339
    invoke-virtual {v4}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$VideoEffectExtra;->getValue()Ljava/lang/String;

    .line 340
    .line 341
    .line 342
    move-result-object v4

    .line 343
    invoke-direct {v5, v6, v7, v4}, Lcom/p1/mobile/putong/live/base/data/BLiveSpecialEffectResources;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 344
    .line 345
    .line 346
    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 347
    .line 348
    .line 349
    goto :goto_4

    .line 350
    :cond_5
    iput-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->videoEffectExtras:Ljava/util/List;

    .line 351
    .line 352
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->getEffectExt()Ljava/lang/String;

    .line 353
    .line 354
    .line 355
    move-result-object v2

    .line 356
    iput-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->effectExt:Ljava/lang/String;

    .line 357
    .line 358
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->getIsGear()Z

    .line 359
    .line 360
    .line 361
    move-result v2

    .line 362
    iput-boolean v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isGear:Z

    .line 363
    .line 364
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->getThreshold()J

    .line 365
    .line 366
    .line 367
    move-result-wide v2

    .line 368
    iput-wide v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->threshold:J

    .line 369
    .line 370
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->getStep()J

    .line 371
    .line 372
    .line 373
    move-result-wide v2

    .line 374
    iput-wide v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->step:J

    .line 375
    .line 376
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->getIsNamed()Z

    .line 377
    .line 378
    .line 379
    move-result v2

    .line 380
    iput-boolean v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isNamed:Z

    .line 381
    .line 382
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->getTray()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;

    .line 383
    .line 384
    .line 385
    move-result-object v2

    .line 386
    if-eqz v2, :cond_6

    .line 387
    .line 388
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBriefTray;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBriefTray;

    .line 389
    .line 390
    .line 391
    move-result-object v2

    .line 392
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->getTray()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;

    .line 393
    .line 394
    .line 395
    move-result-object v3

    .line 396
    invoke-virtual {v3}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;->getBackground()Ljava/lang/String;

    .line 397
    .line 398
    .line 399
    move-result-object v3

    .line 400
    iput-object v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBriefTray;->background:Ljava/lang/String;

    .line 401
    .line 402
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->getTray()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;

    .line 403
    .line 404
    .line 405
    move-result-object v1

    .line 406
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBriefTray;->getSvg()Ljava/lang/String;

    .line 407
    .line 408
    .line 409
    move-result-object v1

    .line 410
    iput-object v1, v2, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBriefTray;->svg:Ljava/lang/String;

    .line 411
    .line 412
    iput-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->tray:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBriefTray;

    .line 413
    .line 414
    :cond_6
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->getVideoChat()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftVideoChatInfo;

    .line 415
    .line 416
    .line 417
    move-result-object v1

    .line 418
    if-eqz v1, :cond_7

    .line 419
    .line 420
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->getVideoChat()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftVideoChatInfo;

    .line 421
    .line 422
    .line 423
    move-result-object v1

    .line 424
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftVideoChatInfo;->getChatId()Ljava/lang/String;

    .line 425
    .line 426
    .line 427
    move-result-object v1

    .line 428
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->videoChatId:Ljava/lang/String;

    .line 429
    .line 430
    :cond_7
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->getGiftItemBrief()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    .line 431
    .line 432
    .line 433
    move-result-object v1

    .line 434
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->getAvatarTag()Ljava/lang/String;

    .line 435
    .line 436
    .line 437
    move-result-object v1

    .line 438
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->avatarTag:Ljava/lang/String;

    .line 439
    .line 440
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftReceivedMsg;->getGiftItemBrief()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;

    .line 441
    .line 442
    .line 443
    move-result-object p0

    .line 444
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$GiftItemBrief;->getGiftBottomTag()Ljava/lang/String;

    .line 445
    .line 446
    .line 447
    move-result-object p0

    .line 448
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->giftBottomTag:Ljava/lang/String;

    .line 449
    .line 450
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->hasPreviewMask()Z

    .line 451
    .line 452
    .line 453
    move-result p0

    .line 454
    if-eqz p0, :cond_8

    .line 455
    .line 456
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->getPreviewMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 457
    .line 458
    .line 459
    move-result-object p0

    .line 460
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite;->isInitialized()Z

    .line 461
    .line 462
    .line 463
    move-result p0

    .line 464
    if-eqz p0, :cond_8

    .line 465
    .line 466
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->getPreviewMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 467
    .line 468
    .line 469
    move-result-object p0

    .line 470
    invoke-static {p0}, Ll/f3t;->b(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 471
    .line 472
    .line 473
    move-result-object p0

    .line 474
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->previewUserMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 475
    .line 476
    :cond_8
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->hasSenderShowMask()Z

    .line 477
    .line 478
    .line 479
    move-result p0

    .line 480
    if-eqz p0, :cond_9

    .line 481
    .line 482
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->getSenderShowMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 483
    .line 484
    .line 485
    move-result-object p0

    .line 486
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite;->isInitialized()Z

    .line 487
    .line 488
    .line 489
    move-result p0

    .line 490
    if-eqz p0, :cond_9

    .line 491
    .line 492
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->getSenderShowMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 493
    .line 494
    .line 495
    move-result-object p0

    .line 496
    invoke-static {p0}, Ll/f3t;->b(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 497
    .line 498
    .line 499
    move-result-object p0

    .line 500
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->senderShowMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 501
    .line 502
    :cond_9
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->hasReceiverShowMask()Z

    .line 503
    .line 504
    .line 505
    move-result p0

    .line 506
    if-eqz p0, :cond_a

    .line 507
    .line 508
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->getReceiverShowMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 509
    .line 510
    .line 511
    move-result-object p0

    .line 512
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite;->isInitialized()Z

    .line 513
    .line 514
    .line 515
    move-result p0

    .line 516
    if-eqz p0, :cond_a

    .line 517
    .line 518
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfo;->getReceiverShowMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 519
    .line 520
    .line 521
    move-result-object p0

    .line 522
    invoke-static {p0}, Ll/f3t;->b(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 523
    .line 524
    .line 525
    move-result-object p0

    .line 526
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->receiverShowMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 527
    .line 528
    :cond_a
    return-object v0
.end method

.method public static s(Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;)Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;
    .locals 8

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getRoomId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->roomId:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getUserId()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->uid:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getUserName()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userName:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getUserNameColor()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userNameColor:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getUserNameGradientColorsList()Ljava/util/List;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userNameGradientColors:Ljava/util/List;

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getUserImage()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userImage:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getHierarchys()Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$Hierarchys;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$Hierarchys;->getWealthHierarchy()Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$Hierarchy;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$Hierarchy;->getGrade()J

    .line 50
    .line 51
    .line 52
    move-result-wide v1

    .line 53
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userGrade:J

    .line 54
    .line 55
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getHierarchys()Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$Hierarchys;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$Hierarchys;->getWealthHierarchy()Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$Hierarchy;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$Hierarchy;->getIcon()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userGradeIcon:Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getText()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getInternalText()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    invoke-static {v1, v2}, Ll/f7t;->w(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->contentText:Ljava/lang/String;

    .line 82
    .line 83
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getTextColor()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->contentTextColor:Ljava/lang/String;

    .line 88
    .line 89
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getBackgroundUrl()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->bgUrl:Ljava/lang/String;

    .line 94
    .line 95
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getFloatingUrl()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->floatBgUrl:Ljava/lang/String;

    .line 100
    .line 101
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getResourceId()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->resourceId:Ljava/lang/String;

    .line 106
    .line 107
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getShowDuration()J

    .line 108
    .line 109
    .line 110
    move-result-wide v1

    .line 111
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->showDuration:J

    .line 112
    .line 113
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getIsWealthHierarchy()Z

    .line 114
    .line 115
    .line 116
    move-result v1

    .line 117
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->isWealthHierarchy:Z

    .line 118
    .line 119
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getBackgroundGradientsList()Ljava/util/List;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->backgroundGradients:Ljava/util/List;

    .line 124
    .line 125
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getBackgroundGradientDirectionValue()I

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->backgroundGradientDirection:I

    .line 130
    .line 131
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getAvatarGradientsList()Ljava/util/List;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->avatarGradients:Ljava/util/List;

    .line 136
    .line 137
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getAvatarGradientDirectionValue()I

    .line 138
    .line 139
    .line 140
    move-result v1

    .line 141
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->avatarGradientDirection:I

    .line 142
    .line 143
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getEffectId()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v1

    .line 147
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->enterRoomEffectId:Ljava/lang/String;

    .line 148
    .line 149
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getEffectId()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->effectId:Ljava/lang/String;

    .line 154
    .line 155
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getBackgroundUrlEndMargin()J

    .line 156
    .line 157
    .line 158
    move-result-wide v1

    .line 159
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->backgroundUrlEndMargin:J

    .line 160
    .line 161
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getFixedBackgroundUrl()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->fixedBackgroundUrl:Ljava/lang/String;

    .line 166
    .line 167
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getAnimationSizeType()J

    .line 168
    .line 169
    .line 170
    move-result-wide v1

    .line 171
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->animationSizeType:J

    .line 172
    .line 173
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getEnterVersion()J

    .line 174
    .line 175
    .line 176
    move-result-wide v1

    .line 177
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->enterVersion:J

    .line 178
    .line 179
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getNewFloatingUrl()Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object v1

    .line 183
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->newFloatingUrl:Ljava/lang/String;

    .line 184
    .line 185
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getNewResourceId()Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object v1

    .line 189
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->newResourceId:Ljava/lang/String;

    .line 190
    .line 191
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getVideoEffectExtrasList()Ljava/util/List;

    .line 192
    .line 193
    .line 194
    move-result-object v1

    .line 195
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 196
    .line 197
    .line 198
    move-result v1

    .line 199
    if-eqz v1, :cond_0

    .line 200
    .line 201
    new-instance v1, Ljava/util/ArrayList;

    .line 202
    .line 203
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 204
    .line 205
    .line 206
    goto :goto_0

    .line 207
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getVideoEffectExtrasList()Ljava/util/List;

    .line 208
    .line 209
    .line 210
    move-result-object v1

    .line 211
    :goto_0
    new-instance v2, Ljava/util/ArrayList;

    .line 212
    .line 213
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 214
    .line 215
    .line 216
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 217
    .line 218
    .line 219
    move-result-object v1

    .line 220
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 221
    .line 222
    .line 223
    move-result v3

    .line 224
    if-eqz v3, :cond_1

    .line 225
    .line 226
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 227
    .line 228
    .line 229
    move-result-object v3

    .line 230
    check-cast v3, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$VideoEffectExtra;

    .line 231
    .line 232
    new-instance v4, Lcom/p1/mobile/putong/live/base/data/BLiveSpecialEffectResources;

    .line 233
    .line 234
    invoke-virtual {v3}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$VideoEffectExtra;->getId()Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object v5

    .line 238
    invoke-virtual {v3}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$VideoEffectExtra;->getType()J

    .line 239
    .line 240
    .line 241
    move-result-wide v6

    .line 242
    long-to-int v6, v6

    .line 243
    invoke-virtual {v3}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$VideoEffectExtra;->getValue()Ljava/lang/String;

    .line 244
    .line 245
    .line 246
    move-result-object v3

    .line 247
    invoke-direct {v4, v5, v6, v3}, Lcom/p1/mobile/putong/live/base/data/BLiveSpecialEffectResources;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 248
    .line 249
    .line 250
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 251
    .line 252
    .line 253
    goto :goto_1

    .line 254
    :cond_1
    iput-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->videoEffectExtras:Ljava/util/List;

    .line 255
    .line 256
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/enterroomeffect/LongLinkEnterRoomMessage$UserEnterRoomEffect;->getDynamicEffectExtendsList()Ljava/util/List;

    .line 257
    .line 258
    .line 259
    move-result-object p0

    .line 260
    new-instance v1, Ll/d7t;

    .line 261
    .line 262
    invoke-direct {v1}, Ll/d7t;-><init>()V

    .line 263
    .line 264
    .line 265
    invoke-static {p0, v1}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 266
    .line 267
    .line 268
    move-result-object p0

    .line 269
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->dynamicEffectExtends:Ljava/util/List;

    .line 270
    .line 271
    return-object v0
.end method

.method public static t(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;)Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;
    .locals 6
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->getOperationType()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->type:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->getPopupType()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice$OperationPopupType;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v2}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-static {v2}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationPopupType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveOperationPopupType;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->popupType:Lcom/p1/mobile/putong/live/base/data/BLiveOperationPopupType;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->getTextDrawer()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-eqz v2, :cond_0

    .line 38
    .line 39
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawer;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawer;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->getTextDrawer()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    invoke-virtual {v3}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;->getIconUrl()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    iput-object v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawer;->iconUrl:Ljava/lang/String;

    .line 52
    .line 53
    iget-object v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawer;->content:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawerContent;

    .line 54
    .line 55
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->getTextDrawer()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;

    .line 56
    .line 57
    .line 58
    move-result-object v4

    .line 59
    invoke-virtual {v4}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;->getContent()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    invoke-virtual {v4}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->getTemplateFieldsList()Ljava/util/List;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    iput-object v4, v3, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawerContent;->templateFields:Ljava/util/List;

    .line 68
    .line 69
    iget-object v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawer;->content:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawerContent;

    .line 70
    .line 71
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->getTextDrawer()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    invoke-virtual {v4}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;->getContent()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;

    .line 76
    .line 77
    .line 78
    move-result-object v4

    .line 79
    invoke-virtual {v4}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->getTemplateId()J

    .line 80
    .line 81
    .line 82
    move-result-wide v4

    .line 83
    long-to-int v4, v4

    .line 84
    iput v4, v3, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawerContent;->templateId:I

    .line 85
    .line 86
    iget-object v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawer;->content:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawerContent;

    .line 87
    .line 88
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawerContent;->hierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveOperationHierarchy;

    .line 89
    .line 90
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->getTextDrawer()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;

    .line 91
    .line 92
    .line 93
    move-result-object v4

    .line 94
    invoke-virtual {v4}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;->getContent()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;

    .line 95
    .line 96
    .line 97
    move-result-object v4

    .line 98
    invoke-virtual {v4}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawerContent;->getHierarchy()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationHierarchy;

    .line 99
    .line 100
    .line 101
    move-result-object v4

    .line 102
    invoke-virtual {v4}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationHierarchy;->getUserHierarchy()J

    .line 103
    .line 104
    .line 105
    move-result-wide v4

    .line 106
    long-to-int v4, v4

    .line 107
    iput v4, v3, Lcom/p1/mobile/putong/live/base/data/BLiveOperationHierarchy;->userHierarchy:I

    .line 108
    .line 109
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationTextDrawerConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveOperationTextDrawerConfig;

    .line 110
    .line 111
    .line 112
    move-result-object v3

    .line 113
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->getTextDrawer()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;

    .line 114
    .line 115
    .line 116
    move-result-object v4

    .line 117
    invoke-virtual {v4}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;->getShading()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$Shading;

    .line 118
    .line 119
    .line 120
    move-result-object v4

    .line 121
    invoke-virtual {v4}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$Shading;->getStartColor()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v4

    .line 125
    iput-object v4, v3, Lcom/p1/mobile/putong/live/base/data/BLiveOperationTextDrawerConfig;->startColor:Ljava/lang/String;

    .line 126
    .line 127
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->getTextDrawer()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;

    .line 128
    .line 129
    .line 130
    move-result-object v4

    .line 131
    invoke-virtual {v4}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;->getShading()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$Shading;

    .line 132
    .line 133
    .line 134
    move-result-object v4

    .line 135
    invoke-virtual {v4}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$Shading;->getEndColor()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v4

    .line 139
    iput-object v4, v3, Lcom/p1/mobile/putong/live/base/data/BLiveOperationTextDrawerConfig;->endColor:Ljava/lang/String;

    .line 140
    .line 141
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->getTextDrawer()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;

    .line 142
    .line 143
    .line 144
    move-result-object v4

    .line 145
    invoke-virtual {v4}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;->getShading()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$Shading;

    .line 146
    .line 147
    .line 148
    move-result-object v4

    .line 149
    invoke-virtual {v4}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$Shading;->getImageUrl()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v4

    .line 153
    iput-object v4, v3, Lcom/p1/mobile/putong/live/base/data/BLiveOperationTextDrawerConfig;->imageUrl:Ljava/lang/String;

    .line 154
    .line 155
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->getTextDrawer()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;

    .line 156
    .line 157
    .line 158
    move-result-object v4

    .line 159
    invoke-virtual {v4}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;->getShading()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$Shading;

    .line 160
    .line 161
    .line 162
    move-result-object v4

    .line 163
    invoke-virtual {v4}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$Shading;->getTransparency()J

    .line 164
    .line 165
    .line 166
    move-result-wide v4

    .line 167
    long-to-int v4, v4

    .line 168
    iput v4, v3, Lcom/p1/mobile/putong/live/base/data/BLiveOperationTextDrawerConfig;->transparency:I

    .line 169
    .line 170
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->getTextDrawer()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;

    .line 171
    .line 172
    .line 173
    move-result-object v4

    .line 174
    invoke-virtual {v4}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;->getShading()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$Shading;

    .line 175
    .line 176
    .line 177
    move-result-object v4

    .line 178
    invoke-virtual {v4}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$Shading;->getShadingType()Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v4

    .line 182
    invoke-static {v4}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationLoadingType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveOperationLoadingType;

    .line 183
    .line 184
    .line 185
    move-result-object v4

    .line 186
    iput-object v4, v3, Lcom/p1/mobile/putong/live/base/data/BLiveOperationTextDrawerConfig;->loadingType:Lcom/p1/mobile/putong/live/base/data/BLiveOperationLoadingType;

    .line 187
    .line 188
    iput-object v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawer;->shading:Lcom/p1/mobile/putong/live/base/data/BLiveOperationTextDrawerConfig;

    .line 189
    .line 190
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->getTextDrawer()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;

    .line 191
    .line 192
    .line 193
    move-result-object v3

    .line 194
    invoke-virtual {v3}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;->getJumpScheme()Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v3

    .line 198
    iput-object v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawer;->jumpScheme:Ljava/lang/String;

    .line 199
    .line 200
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->getTextDrawer()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;

    .line 201
    .line 202
    .line 203
    move-result-object v3

    .line 204
    invoke-virtual {v3}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$TextDrawer;->getActionAfterClick()Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object v3

    .line 208
    invoke-static {v3}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationActionAfterClick;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveOperationActionAfterClick;

    .line 209
    .line 210
    .line 211
    move-result-object v3

    .line 212
    iput-object v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawer;->actionAfterClick:Lcom/p1/mobile/putong/live/base/data/BLiveOperationActionAfterClick;

    .line 213
    .line 214
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->textDrawer:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpTextDrawer;

    .line 215
    .line 216
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->getH5PopUp()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5PopUp;

    .line 217
    .line 218
    .line 219
    move-result-object v2

    .line 220
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 221
    .line 222
    .line 223
    move-result v2

    .line 224
    if-eqz v2, :cond_1

    .line 225
    .line 226
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;

    .line 227
    .line 228
    .line 229
    move-result-object v2

    .line 230
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->getH5PopUp()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5PopUp;

    .line 231
    .line 232
    .line 233
    move-result-object v3

    .line 234
    invoke-virtual {v3}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5PopUp;->getJumpScheme()Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object v3

    .line 238
    iput-object v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;->jumpScheme:Ljava/lang/String;

    .line 239
    .line 240
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->h5PopUp:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;

    .line 241
    .line 242
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->getDrawer()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    .line 243
    .line 244
    .line 245
    move-result-object v2

    .line 246
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 247
    .line 248
    .line 249
    move-result v2

    .line 250
    if-eqz v2, :cond_3

    .line 251
    .line 252
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;

    .line 253
    .line 254
    .line 255
    move-result-object v2

    .line 256
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->getDrawer()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    .line 257
    .line 258
    .line 259
    move-result-object v3

    .line 260
    invoke-virtual {v3}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->getH5Url()Ljava/lang/String;

    .line 261
    .line 262
    .line 263
    move-result-object v3

    .line 264
    iput-object v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;->h5Url:Ljava/lang/String;

    .line 265
    .line 266
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->getDrawer()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    .line 267
    .line 268
    .line 269
    move-result-object v3

    .line 270
    invoke-virtual {v3}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->getHeight()D

    .line 271
    .line 272
    .line 273
    move-result-wide v3

    .line 274
    double-to-float v3, v3

    .line 275
    iput v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;->height:F

    .line 276
    .line 277
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->getDrawer()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    .line 278
    .line 279
    .line 280
    move-result-object v3

    .line 281
    invoke-virtual {v3}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->getWidth()D

    .line 282
    .line 283
    .line 284
    move-result-wide v3

    .line 285
    double-to-float v3, v3

    .line 286
    iput v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;->width:F

    .line 287
    .line 288
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->getDrawer()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    .line 289
    .line 290
    .line 291
    move-result-object v3

    .line 292
    invoke-virtual {v3}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->getCloseButtonUrl()Ljava/lang/String;

    .line 293
    .line 294
    .line 295
    move-result-object v3

    .line 296
    iput-object v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;->closeButtonUrl:Ljava/lang/String;

    .line 297
    .line 298
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->getDrawer()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    .line 299
    .line 300
    .line 301
    move-result-object v3

    .line 302
    invoke-virtual {v3}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->getFadingSeconds()J

    .line 303
    .line 304
    .line 305
    move-result-wide v3

    .line 306
    long-to-int v3, v3

    .line 307
    iput v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;->fadingSeconds:I

    .line 308
    .line 309
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->getDrawer()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    .line 310
    .line 311
    .line 312
    move-result-object v3

    .line 313
    invoke-virtual {v3}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->getLoading()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5DrawerLoading;

    .line 314
    .line 315
    .line 316
    move-result-object v3

    .line 317
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 318
    .line 319
    .line 320
    move-result v3

    .line 321
    if-eqz v3, :cond_2

    .line 322
    .line 323
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationTextDrawerConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveOperationTextDrawerConfig;

    .line 324
    .line 325
    .line 326
    move-result-object v3

    .line 327
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->getDrawer()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    .line 328
    .line 329
    .line 330
    move-result-object v4

    .line 331
    invoke-virtual {v4}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->getLoading()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5DrawerLoading;

    .line 332
    .line 333
    .line 334
    move-result-object v4

    .line 335
    invoke-virtual {v4}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5DrawerLoading;->getStartColor()Ljava/lang/String;

    .line 336
    .line 337
    .line 338
    move-result-object v4

    .line 339
    iput-object v4, v3, Lcom/p1/mobile/putong/live/base/data/BLiveOperationTextDrawerConfig;->startColor:Ljava/lang/String;

    .line 340
    .line 341
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->getDrawer()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    .line 342
    .line 343
    .line 344
    move-result-object v4

    .line 345
    invoke-virtual {v4}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->getLoading()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5DrawerLoading;

    .line 346
    .line 347
    .line 348
    move-result-object v4

    .line 349
    invoke-virtual {v4}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5DrawerLoading;->getEndColor()Ljava/lang/String;

    .line 350
    .line 351
    .line 352
    move-result-object v4

    .line 353
    iput-object v4, v3, Lcom/p1/mobile/putong/live/base/data/BLiveOperationTextDrawerConfig;->endColor:Ljava/lang/String;

    .line 354
    .line 355
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->getDrawer()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    .line 356
    .line 357
    .line 358
    move-result-object v4

    .line 359
    invoke-virtual {v4}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->getLoading()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5DrawerLoading;

    .line 360
    .line 361
    .line 362
    move-result-object v4

    .line 363
    invoke-virtual {v4}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5DrawerLoading;->getTransparency()J

    .line 364
    .line 365
    .line 366
    move-result-wide v4

    .line 367
    long-to-int v4, v4

    .line 368
    iput v4, v3, Lcom/p1/mobile/putong/live/base/data/BLiveOperationTextDrawerConfig;->transparency:I

    .line 369
    .line 370
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->getDrawer()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    .line 371
    .line 372
    .line 373
    move-result-object v4

    .line 374
    invoke-virtual {v4}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->getLoading()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5DrawerLoading;

    .line 375
    .line 376
    .line 377
    move-result-object v4

    .line 378
    invoke-virtual {v4}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5DrawerLoading;->getImageUrl()Ljava/lang/String;

    .line 379
    .line 380
    .line 381
    move-result-object v4

    .line 382
    iput-object v4, v3, Lcom/p1/mobile/putong/live/base/data/BLiveOperationTextDrawerConfig;->imageUrl:Ljava/lang/String;

    .line 383
    .line 384
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$OperationPopupNotice;->getDrawer()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;

    .line 385
    .line 386
    .line 387
    move-result-object p0

    .line 388
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5Drawer;->getLoading()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5DrawerLoading;

    .line 389
    .line 390
    .line 391
    move-result-object p0

    .line 392
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$H5DrawerLoading;->getLoadingType()Ljava/lang/String;

    .line 393
    .line 394
    .line 395
    move-result-object p0

    .line 396
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationLoadingType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveOperationLoadingType;

    .line 397
    .line 398
    .line 399
    move-result-object p0

    .line 400
    iput-object p0, v3, Lcom/p1/mobile/putong/live/base/data/BLiveOperationTextDrawerConfig;->loadingType:Lcom/p1/mobile/putong/live/base/data/BLiveOperationLoadingType;

    .line 401
    .line 402
    iput-object v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;->loading:Lcom/p1/mobile/putong/live/base/data/BLiveOperationTextDrawerConfig;

    .line 403
    .line 404
    :cond_2
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;->h5Drawer:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;

    .line 405
    .line 406
    :cond_3
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->popup:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUp;

    .line 407
    .line 408
    return-object v0
.end method

.method public static u(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserHierarchyGrade;)Lcom/p1/mobile/putong/live/base/data/BLiveUserUpgrade;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserUpgrade;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveUserUpgrade;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserHierarchyGrade;->getUserId()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserUpgrade;->uid:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserHierarchyGrade;->getUserName()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserUpgrade;->userName:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserHierarchyGrade;->getUserImageUrl()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserUpgrade;->avatarUrl:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserHierarchyGrade;->getGrade()J

    .line 25
    .line 26
    .line 27
    move-result-wide v1

    .line 28
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserUpgrade;->grade:J

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserHierarchyGrade;->getSuperGrade()J

    .line 31
    .line 32
    .line 33
    move-result-wide v1

    .line 34
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserUpgrade;->superGrade:J

    .line 35
    .line 36
    return-object v0
.end method

.method public static v(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;->getExtInfo()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->getUserMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;->getUserId()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;->getUsername()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->getUserMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-static {v3}, Ll/v6o0;->a(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-direct {v1, v2, p0, v3}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->getMaskMode()Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    iput-boolean p0, v1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;->isMaskMode:Z

    .line 39
    .line 40
    return-object v1

    .line 41
    :cond_0
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;->getUserId()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;->getUsername()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->getImageUrl()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-direct {v1, v2, p0, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    return-object v1

    .line 59
    :cond_1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;

    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;->getUserId()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;->getUsername()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-direct {v0, v1, p0}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    return-object v0
.end method

.method public static w(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    invoke-static {p1}, Ll/cpj;->D(Ljava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static x(Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;)Ljava/lang/String;
    .locals 2

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;->format:Ljava/util/List;

    .line 7
    .line 8
    new-instance v1, Ll/a7t;

    .line 9
    .line 10
    invoke-direct {v1}, Ll/a7t;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-static {p0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;

    .line 18
    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateItem;->scene:Ljava/lang/String;

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_1
    return-object v0
.end method

.method public static y(Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;Z)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;
    .locals 6

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;->newBuilder()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage$Builder;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->roomId:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage$Builder;->setRoomId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage$Builder;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->seq:I

    .line 12
    .line 13
    int-to-long v1, v1

    .line 14
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage$Builder;->setSeq(J)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage$Builder;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->userId:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage$Builder;->setUserId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage$Builder;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->username:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage$Builder;->setUsername(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage$Builder;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->value:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage$Builder;->setValue(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage$Builder;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->preSeq:I

    .line 37
    .line 38
    int-to-long v1, v1

    .line 39
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage$Builder;->setPreSeq(J)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage$Builder;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->createdTime:J

    .line 44
    .line 45
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage$Builder;->setCreatedTime(J)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage$Builder;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->preTimestamp:J

    .line 50
    .line 51
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage$Builder;->setPreTimestamp(J)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage$Builder;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->type:Ljava/lang/String;

    .line 56
    .line 57
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage$Builder;->setTypeValue(I)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage$Builder;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->userIdentity:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage$Builder;->setUserIdentity(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage$Builder;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$SharedVoiceLiveInfo;->newBuilder()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$SharedVoiceLiveInfo$Builder;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->sharedVoiceLiveInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSharedVoiceLiveInfo;

    .line 76
    .line 77
    iget v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveSharedVoiceLiveInfo;->audienceCount:I

    .line 78
    .line 79
    invoke-virtual {v1, v2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$SharedVoiceLiveInfo$Builder;->setAudienceCount(I)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$SharedVoiceLiveInfo$Builder;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->sharedVoiceLiveInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSharedVoiceLiveInfo;

    .line 84
    .line 85
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveSharedVoiceLiveInfo;->description:Ljava/lang/String;

    .line 86
    .line 87
    invoke-virtual {v1, v2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$SharedVoiceLiveInfo$Builder;->setDescription(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$SharedVoiceLiveInfo$Builder;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->sharedVoiceLiveInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSharedVoiceLiveInfo;

    .line 92
    .line 93
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveSharedVoiceLiveInfo;->liveId:Ljava/lang/String;

    .line 94
    .line 95
    invoke-virtual {v1, v2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$SharedVoiceLiveInfo$Builder;->setLiveId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$SharedVoiceLiveInfo$Builder;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->sharedVoiceLiveInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSharedVoiceLiveInfo;

    .line 100
    .line 101
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveSharedVoiceLiveInfo;->roomId:Ljava/lang/String;

    .line 102
    .line 103
    invoke-virtual {v1, v2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$SharedVoiceLiveInfo$Builder;->setRoomId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$SharedVoiceLiveInfo$Builder;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->sharedVoiceLiveInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSharedVoiceLiveInfo;

    .line 108
    .line 109
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveSharedVoiceLiveInfo;->anchorId:Ljava/lang/String;

    .line 110
    .line 111
    invoke-virtual {v1, v2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$SharedVoiceLiveInfo$Builder;->setAnchorId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$SharedVoiceLiveInfo$Builder;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->sharedVoiceLiveInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSharedVoiceLiveInfo;

    .line 116
    .line 117
    iget v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveSharedVoiceLiveInfo;->voiceCallCount:I

    .line 118
    .line 119
    invoke-virtual {v1, v2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$SharedVoiceLiveInfo$Builder;->setVoiceCallCount(I)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$SharedVoiceLiveInfo$Builder;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage$Builder;->setSharedVoiceLiveInfo(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$SharedVoiceLiveInfo$Builder;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage$Builder;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$GiftMessage;->newBuilder()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$GiftMessage$Builder;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->gift:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;

    .line 132
    .line 133
    iget-wide v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;->id:J

    .line 134
    .line 135
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$GiftMessage$Builder;->setId(J)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$GiftMessage$Builder;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->gift:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;

    .line 140
    .line 141
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;->url:Ljava/lang/String;

    .line 142
    .line 143
    invoke-virtual {v1, v2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$GiftMessage$Builder;->setUrl(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$GiftMessage$Builder;

    .line 144
    .line 145
    .line 146
    move-result-object v1

    .line 147
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->gift:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;

    .line 148
    .line 149
    iget v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;->type:I

    .line 150
    .line 151
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object v2

    .line 155
    invoke-virtual {v1, v2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$GiftMessage$Builder;->setType(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$GiftMessage$Builder;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->gift:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;

    .line 160
    .line 161
    iget v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;->count:I

    .line 162
    .line 163
    invoke-virtual {v1, v2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$GiftMessage$Builder;->setCount(I)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$GiftMessage$Builder;

    .line 164
    .line 165
    .line 166
    move-result-object v1

    .line 167
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->gift:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;

    .line 168
    .line 169
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMessage;->name:Ljava/lang/String;

    .line 170
    .line 171
    invoke-virtual {v1, v2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$GiftMessage$Builder;->setName(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$GiftMessage$Builder;

    .line 172
    .line 173
    .line 174
    move-result-object v1

    .line 175
    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage$Builder;->setGift(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$GiftMessage$Builder;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage$Builder;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->h5:Ljava/lang/String;

    .line 180
    .line 181
    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage$Builder;->setH5(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage$Builder;

    .line 182
    .line 183
    .line 184
    move-result-object v0

    .line 185
    invoke-static {}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;->newBuilder()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;

    .line 186
    .line 187
    .line 188
    move-result-object v1

    .line 189
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->template:Lcom/p1/mobile/putong/live/base/data/BLiveTemplateData;

    .line 190
    .line 191
    iget v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateData;->id:I

    .line 192
    .line 193
    invoke-virtual {v1, v2}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;->setId(I)Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;

    .line 194
    .line 195
    .line 196
    move-result-object v1

    .line 197
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->template:Lcom/p1/mobile/putong/live/base/data/BLiveTemplateData;

    .line 198
    .line 199
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveTemplateData;->fields:Ljava/util/List;

    .line 200
    .line 201
    invoke-virtual {v1, v2}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;->addAllFields(Ljava/lang/Iterable;)Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;

    .line 202
    .line 203
    .line 204
    move-result-object v1

    .line 205
    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage$Builder;->setTemplate(Lcom/p1/mobile/longlink/msg/template/Template$TemplateData$Builder;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage$Builder;

    .line 206
    .line 207
    .line 208
    move-result-object v0

    .line 209
    invoke-static {p0}, Ll/f7t;->m(Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    .line 210
    .line 211
    .line 212
    move-result-object v1

    .line 213
    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage$Builder;->setMedal(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage$Builder;

    .line 214
    .line 215
    .line 216
    move-result-object v0

    .line 217
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$HierarchyMessage;->newBuilder()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$HierarchyMessage$Builder;

    .line 218
    .line 219
    .line 220
    move-result-object v1

    .line 221
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->hierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 222
    .line 223
    iget-wide v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->grade:J

    .line 224
    .line 225
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$HierarchyMessage$Builder;->setGrade(J)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$HierarchyMessage$Builder;

    .line 226
    .line 227
    .line 228
    move-result-object v1

    .line 229
    invoke-virtual {v1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 230
    .line 231
    .line 232
    move-result-object v1

    .line 233
    check-cast v1, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$HierarchyMessage;

    .line 234
    .line 235
    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage$Builder;->setHierarchy(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$HierarchyMessage;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage$Builder;

    .line 236
    .line 237
    .line 238
    move-result-object v0

    .line 239
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->chatShadingConfig:Lcom/p1/mobile/putong/live/base/data/BLiveChatShadingConfig;

    .line 240
    .line 241
    invoke-static {v1}, Ll/f7t;->k(Lcom/p1/mobile/putong/live/base/data/BLiveChatShadingConfig;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;

    .line 242
    .line 243
    .line 244
    move-result-object v1

    .line 245
    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage$Builder;->setChatShadingConfig(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage$Builder;

    .line 246
    .line 247
    .line 248
    move-result-object v0

    .line 249
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->starlightHierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveStarlightHierarchy;

    .line 250
    .line 251
    if-eqz v1, :cond_0

    .line 252
    .line 253
    iget-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveStarlightHierarchy;->imageUrl:Ljava/lang/String;

    .line 254
    .line 255
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 256
    .line 257
    .line 258
    move-result v2

    .line 259
    if-nez v2, :cond_0

    .line 260
    .line 261
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$HierarchyMessage;->newBuilder()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$HierarchyMessage$Builder;

    .line 262
    .line 263
    .line 264
    move-result-object v2

    .line 265
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveStarlightHierarchy;->imageUrl:Ljava/lang/String;

    .line 266
    .line 267
    invoke-virtual {v2, v3}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$HierarchyMessage$Builder;->setImageUrl(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$HierarchyMessage$Builder;

    .line 268
    .line 269
    .line 270
    move-result-object v2

    .line 271
    iget-wide v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveStarlightHierarchy;->grade:J

    .line 272
    .line 273
    invoke-virtual {v2, v3, v4}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$HierarchyMessage$Builder;->setGrade(J)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$HierarchyMessage$Builder;

    .line 274
    .line 275
    .line 276
    move-result-object v1

    .line 277
    invoke-virtual {v1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 278
    .line 279
    .line 280
    move-result-object v1

    .line 281
    check-cast v1, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$HierarchyMessage;

    .line 282
    .line 283
    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage$Builder;->setStarlightHierarchy(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$HierarchyMessage;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage$Builder;

    .line 284
    .line 285
    .line 286
    :cond_0
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;->newBuilder()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;

    .line 287
    .line 288
    .line 289
    move-result-object v1

    .line 290
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->extInfo:Lcom/p1/mobile/putong/live/base/data/BLiveChatExtInfo;

    .line 291
    .line 292
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveChatExtInfo;->imageUrl:Ljava/lang/String;

    .line 293
    .line 294
    invoke-virtual {v1, v2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;->setImageUrl(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;

    .line 295
    .line 296
    .line 297
    move-result-object v1

    .line 298
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->extInfo:Lcom/p1/mobile/putong/live/base/data/BLiveChatExtInfo;

    .line 299
    .line 300
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveChatExtInfo;->senderCityID:Ljava/lang/String;

    .line 301
    .line 302
    invoke-virtual {v1, v2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;->setSenderCityID(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;

    .line 303
    .line 304
    .line 305
    move-result-object v1

    .line 306
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->extInfo:Lcom/p1/mobile/putong/live/base/data/BLiveChatExtInfo;

    .line 307
    .line 308
    iget-boolean v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveChatExtInfo;->colorfulMode:Z

    .line 309
    .line 310
    invoke-virtual {v1, v2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;->setColorfulMode(Z)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;

    .line 311
    .line 312
    .line 313
    move-result-object v1

    .line 314
    invoke-virtual {v1, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;->setMaskMode(Z)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;

    .line 315
    .line 316
    .line 317
    move-result-object p1

    .line 318
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->extInfo:Lcom/p1/mobile/putong/live/base/data/BLiveChatExtInfo;

    .line 319
    .line 320
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveChatExtInfo;->userMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 321
    .line 322
    invoke-static {}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->newBuilder()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;

    .line 323
    .line 324
    .line 325
    move-result-object v2

    .line 326
    invoke-static {}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;->newBuilder()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition$Builder;

    .line 327
    .line 328
    .line 329
    move-result-object v3

    .line 330
    iget-object v4, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->color:Ljava/lang/String;

    .line 331
    .line 332
    invoke-virtual {v3, v4}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition$Builder;->setColor(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition$Builder;

    .line 333
    .line 334
    .line 335
    move-result-object v3

    .line 336
    iget-object v4, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->gender:Ljava/lang/String;

    .line 337
    .line 338
    invoke-virtual {v3, v4}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition$Builder;->setGender(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition$Builder;

    .line 339
    .line 340
    .line 341
    move-result-object v3

    .line 342
    invoke-virtual {v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 343
    .line 344
    .line 345
    move-result-object v3

    .line 346
    check-cast v3, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;

    .line 347
    .line 348
    invoke-virtual {v2, v3}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;->setVoiceMaskModeAddition(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;

    .line 349
    .line 350
    .line 351
    move-result-object v2

    .line 352
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatar:Ljava/lang/String;

    .line 353
    .line 354
    invoke-virtual {v2, v3}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;->setAvatar(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;

    .line 355
    .line 356
    .line 357
    move-result-object v2

    .line 358
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->userId:Ljava/lang/String;

    .line 359
    .line 360
    invoke-virtual {v2, v3}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;->setUserId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;

    .line 361
    .line 362
    .line 363
    move-result-object v2

    .line 364
    invoke-static {}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->newBuilder()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig$Builder;

    .line 365
    .line 366
    .line 367
    move-result-object v3

    .line 368
    invoke-static {}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;->newBuilder()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig$Builder;

    .line 369
    .line 370
    .line 371
    move-result-object v4

    .line 372
    iget-object v5, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 373
    .line 374
    iget-object v5, v5, Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;->frameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 375
    .line 376
    iget-object v5, v5, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->staticUrl:Ljava/lang/String;

    .line 377
    .line 378
    invoke-virtual {v4, v5}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig$Builder;->setStaticUrl(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig$Builder;

    .line 379
    .line 380
    .line 381
    move-result-object v4

    .line 382
    iget-object v5, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 383
    .line 384
    iget-object v5, v5, Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;->frameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 385
    .line 386
    iget-object v5, v5, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->dynamicUrl:Ljava/lang/String;

    .line 387
    .line 388
    invoke-virtual {v4, v5}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig$Builder;->setDynamicUrl(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig$Builder;

    .line 389
    .line 390
    .line 391
    move-result-object v4

    .line 392
    iget-object v5, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 393
    .line 394
    iget-object v5, v5, Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;->frameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 395
    .line 396
    iget-object v5, v5, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->mediumDynamicUrl:Ljava/lang/String;

    .line 397
    .line 398
    invoke-virtual {v4, v5}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig$Builder;->setMediumDynamicUrl(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig$Builder;

    .line 399
    .line 400
    .line 401
    move-result-object v4

    .line 402
    iget-object v5, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 403
    .line 404
    iget-object v5, v5, Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;->frameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 405
    .line 406
    iget-object v5, v5, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->smallDynamicUrl:Ljava/lang/String;

    .line 407
    .line 408
    invoke-virtual {v4, v5}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig$Builder;->setSmallDynamicUrl(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig$Builder;

    .line 409
    .line 410
    .line 411
    move-result-object v4

    .line 412
    invoke-virtual {v4}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 413
    .line 414
    .line 415
    move-result-object v4

    .line 416
    check-cast v4, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 417
    .line 418
    invoke-virtual {v3, v4}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig$Builder;->setFrameConfig(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig$Builder;

    .line 419
    .line 420
    .line 421
    move-result-object v3

    .line 422
    invoke-virtual {v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 423
    .line 424
    .line 425
    move-result-object v3

    .line 426
    check-cast v3, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 427
    .line 428
    invoke-virtual {v2, v3}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;->setAvatarConfig(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;

    .line 429
    .line 430
    .line 431
    move-result-object v2

    .line 432
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->userNameGradientColors:Ljava/util/List;

    .line 433
    .line 434
    invoke-static {v3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 435
    .line 436
    .line 437
    move-result v3

    .line 438
    if-nez v3, :cond_1

    .line 439
    .line 440
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->userNameGradientColors:Ljava/util/List;

    .line 441
    .line 442
    invoke-virtual {v2, v1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;->addAllUserNameGradientColors(Ljava/lang/Iterable;)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;

    .line 443
    .line 444
    .line 445
    :cond_1
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 446
    .line 447
    .line 448
    move-result-object v1

    .line 449
    check-cast v1, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 450
    .line 451
    invoke-virtual {p1, v1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;->setUserMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;

    .line 452
    .line 453
    .line 454
    move-result-object v1

    .line 455
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->extInfo:Lcom/p1/mobile/putong/live/base/data/BLiveChatExtInfo;

    .line 456
    .line 457
    iget-boolean v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveChatExtInfo;->groupControl:Z

    .line 458
    .line 459
    invoke-virtual {v1, v2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;->setGroupControl(Z)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;

    .line 460
    .line 461
    .line 462
    move-result-object v1

    .line 463
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->extInfo:Lcom/p1/mobile/putong/live/base/data/BLiveChatExtInfo;

    .line 464
    .line 465
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveChatExtInfo;->groupType:Ljava/lang/String;

    .line 466
    .line 467
    invoke-virtual {v1, v2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;->setGroupType(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;

    .line 468
    .line 469
    .line 470
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->extInfo:Lcom/p1/mobile/putong/live/base/data/BLiveChatExtInfo;

    .line 471
    .line 472
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveChatExtInfo;->atUserInfos:Ljava/util/List;

    .line 473
    .line 474
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 475
    .line 476
    .line 477
    move-result v1

    .line 478
    if-nez v1, :cond_2

    .line 479
    .line 480
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->extInfo:Lcom/p1/mobile/putong/live/base/data/BLiveChatExtInfo;

    .line 481
    .line 482
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatExtInfo;->atUserInfos:Ljava/util/List;

    .line 483
    .line 484
    new-instance v1, Ll/b7t;

    .line 485
    .line 486
    invoke-direct {v1, p1}, Ll/b7t;-><init>(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo$Builder;)V

    .line 487
    .line 488
    .line 489
    invoke-static {p0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 490
    .line 491
    .line 492
    :cond_2
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 493
    .line 494
    .line 495
    move-result-object p0

    .line 496
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;

    .line 497
    .line 498
    invoke-virtual {v0, p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage$Builder;->setExtInfo(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessageExtInfo;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage$Builder;

    .line 499
    .line 500
    .line 501
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 502
    .line 503
    .line 504
    move-result-object p0

    .line 505
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;

    .line 506
    .line 507
    return-object p0
.end method

.method public static z(Ljava/util/List;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUserMedal;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/e7t;

    .line 7
    .line 8
    invoke-direct {v1, v0}, Ll/e7t;-><init>(Ljava/util/List;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method
