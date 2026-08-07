.class public Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;,
        Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$LiveMessageType;
    }
.end annotation


# static fields
.field public static DRAGON_INFO_CHAT_CATEGORY:I = 0x7

.field public static MYSTERY_BOX_RECORD:I = 0x8

.field public static NORMAL_CHAT_CATEGORY:I = 0x0

.field public static final NOTIFY_BOTTOM:Ljava/lang/String; = "notify_bottom"

.field public static VOICE_CHAT_CATEGORY:I = 0x1

.field public static VOICE_CHAT_MIC_EMOJI_CATEGORY:I = 0x5

.field public static VOICE_CHAT_VIRTUAL_NOTICE_CATEGORY:I = 0x6


# instance fields
.field public actionType:I

.field public category:I

.field public chatShadeConfig:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;

.field public createTime:J

.field private currentUserId:Ljava/lang/String;

.field private dragonSchema:Ljava/lang/String;

.field private dragonTitle:Ljava/lang/String;

.field public extInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;

.field public h5Url:Ljava/lang/String;

.field public id:Ljava/lang/String;

.field public isErrorMessage:Z

.field public isImportantMsg:Z

.field public isLuFinished:Z

.field public layoutId:Ljava/lang/String;

.field public liveUserInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;

.field public localCreateTime:J

.field public menu:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveTemplateMenu;",
            ">;"
        }
    .end annotation
.end field

.field public messageContent:Ljava/lang/String;

.field private messageType:Ljava/lang/String;

.field private mysteryBoxRecord:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

.field public notificationData:Ll/p9t;

.field private openGradientFlow:Z

.field public preMessageTime:J

.field public preSeq:J

.field public seq:J

.field private sharedVoiceLiveInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSharedVoiceLiveInfo;

.field public source:Ljava/lang/String;

.field public spanList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/text/SpannableStringBuilder;",
            ">;"
        }
    .end annotation
.end field

.field public traceJson:Ljava/lang/String;

.field private userIdentity:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->isErrorMessage:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->openGradientFlow:Z

    .line 8
    .line 9
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->isLuFinished:Z

    .line 10
    .line 11
    const-string v0, "other"

    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->messageType:Ljava/lang/String;

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->isImportantMsg:Z

    .line 17
    .line 18
    return-void
.end method

.method public static create()Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;
    .locals 1

    const/4 v0, 0x0

    .line 72
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->create(Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    move-result-object v0

    return-object v0
.end method

.method public static create(Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;
    .locals 1

    const/4 v0, 0x0

    .line 73
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->create(Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    move-result-object p0

    return-object p0
.end method

.method public static create(Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 7
    .line 8
    .line 9
    move-result-wide v1

    .line 10
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->localCreateTime:J

    .line 11
    .line 12
    if-nez p0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;->action:I

    .line 16
    .line 17
    const/4 v2, 0x2

    .line 18
    if-eq v1, v2, :cond_2

    .line 19
    .line 20
    const/4 p1, 0x3

    .line 21
    if-eq v1, p1, :cond_1

    .line 22
    .line 23
    iput v1, v0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->actionType:I

    .line 24
    .line 25
    return-object v0

    .line 26
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;->menu:Ljava/util/List;

    .line 27
    .line 28
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-nez p1, :cond_4

    .line 33
    .line 34
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;->menu:Ljava/util/List;

    .line 35
    .line 36
    iput-object p1, v0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->menu:Ljava/util/List;

    .line 37
    .line 38
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;->action:I

    .line 39
    .line 40
    iput p0, v0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->actionType:I

    .line 41
    .line 42
    return-object v0

    .line 43
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;->h5:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-nez v1, :cond_3

    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;->h5:Ljava/lang/String;

    .line 52
    .line 53
    iput-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->h5Url:Ljava/lang/String;

    .line 54
    .line 55
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;->action:I

    .line 56
    .line 57
    iput v1, v0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->actionType:I

    .line 58
    .line 59
    :cond_3
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-nez v1, :cond_4

    .line 64
    .line 65
    iput-object p1, v0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->h5Url:Ljava/lang/String;

    .line 66
    .line 67
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;->action:I

    .line 68
    .line 69
    iput p0, v0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->actionType:I

    .line 70
    .line 71
    :cond_4
    :goto_0
    return-object v0
.end method


# virtual methods
.method public getDragonSchema()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->dragonSchema:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDragonTitle()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->dragonTitle:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMessageType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->messageType:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMysteryBoxRecord()Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->mysteryBoxRecord:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVoiceFollowSource()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->extInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->voiceFollowSource:I

    .line 6
    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public hasChatShadeConfig()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->chatShadeConfig:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;->hasBackgroundColorConfig()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->chatShadeConfig:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;->hasBorderColorConfig()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    :cond_0
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_1
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public isDanmuFoldMessage()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->messageType:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "bulletComment"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public isErrorMessage(Z)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->isErrorMessage:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public isGiftMessage()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->messageType:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "gift_message"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public isJoinRedPacketMessage()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->messageType:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "join_red_packet"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public isMatchTargetMessageType(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->messageType:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isNotifyMessage()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->messageType:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "notify_bottom"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public isOpenGradientFlow()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->openGradientFlow:Z

    .line 2
    .line 3
    return p0
.end method

.method public isRedPacketFoldMessage()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->messageType:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "redpacket"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public isShootGameFoldMessage()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->messageType:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "shootGame"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public isUserOwnMessage()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->liveUserInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;->userId:Ljava/lang/String;

    .line 6
    .line 7
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 8
    .line 9
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    invoke-static {}, Ll/eb20;->b()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->liveUserInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;->userId:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {}, Ll/eb20;->a()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-eqz p0, :cond_1

    .line 38
    .line 39
    :cond_0
    const/4 p0, 0x1

    .line 40
    return p0

    .line 41
    :cond_1
    const/4 p0, 0x0

    .line 42
    return p0
.end method

.method public setCategory(I)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->category:I

    .line 2
    .line 3
    return-object p0
.end method

.method public setChatShadeConfig(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->chatShadeConfig:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;

    .line 4
    .line 5
    :cond_0
    return-void
.end method

.method public setCreateTime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->createTime:J

    .line 2
    .line 3
    return-void
.end method

.method public setDragonModuleInfo(Ljava/lang/String;Ljava/lang/String;ILandroid/text/SpannableStringBuilder;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->dragonTitle:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->dragonSchema:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->setCategory(I)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p4}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->setSpan(Landroid/text/SpannableStringBuilder;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setExtInfo(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->extInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;

    .line 2
    .line 3
    return-void
.end method

.method public setId(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->id:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setLayoutId(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->layoutId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setLiveMessageType(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->messageType:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setMessageContent(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->messageContent:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setMysteryBoxRecord(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->mysteryBoxRecord:Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$MysteryBoxRecord;

    .line 2
    .line 3
    sget p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->MYSTERY_BOX_RECORD:I

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->setCategory(I)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setNotificationMessage(Ll/p9t;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    .line 1
    const-string v0, "notify_bottom"

    .line 2
    .line 3
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->messageType:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->notificationData:Ll/p9t;

    .line 6
    .line 7
    return-object p0
.end method

.method public setOpenGradientFlow(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->openGradientFlow:Z

    .line 2
    .line 3
    return-void
.end method

.method public setPreMessageTime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->preMessageTime:J

    .line 2
    .line 3
    return-void
.end method

.method public setPreSeq(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->preSeq:J

    .line 2
    .line 3
    return-void
.end method

.method public setSeq(J)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->seq:J

    .line 2
    .line 3
    return-object p0
.end method

.method public setSharedVoiceLiveInfo(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$SharedVoiceLiveInfo;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveSharedVoiceLiveInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveSharedVoiceLiveInfo;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$SharedVoiceLiveInfo;->getAudienceCount()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSharedVoiceLiveInfo;->audienceCount:I

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$SharedVoiceLiveInfo;->getDescription()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSharedVoiceLiveInfo;->description:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$SharedVoiceLiveInfo;->getLiveId()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSharedVoiceLiveInfo;->liveId:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$SharedVoiceLiveInfo;->getRoomId()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSharedVoiceLiveInfo;->roomId:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$SharedVoiceLiveInfo;->getAnchorId()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSharedVoiceLiveInfo;->anchorId:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$SharedVoiceLiveInfo;->getVoiceCallCount()I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    iput p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSharedVoiceLiveInfo;->voiceCallCount:I

    .line 42
    .line 43
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->sharedVoiceLiveInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSharedVoiceLiveInfo;

    .line 44
    .line 45
    :cond_0
    return-void
.end method

.method public setSpan(Landroid/text/SpannableStringBuilder;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;
    .locals 0

    .line 1
    filled-new-array {p1}, [Landroid/text/SpannableStringBuilder;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->spanList:Ljava/util/List;

    .line 10
    .line 11
    return-object p0
.end method

.method public setSpan(Ljava/util/List;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/text/SpannableStringBuilder;",
            ">;)",
            "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;"
        }
    .end annotation

    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->spanList:Ljava/util/List;

    return-object p0
.end method

.method public setUser(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->liveUserInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public setUserIdentity(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->userIdentity:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
