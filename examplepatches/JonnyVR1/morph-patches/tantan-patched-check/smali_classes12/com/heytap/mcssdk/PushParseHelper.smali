.class public Lcom/heytap/mcssdk/PushParseHelper;
.super Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static parseCommandMessage(Landroid/content/Context;Lcom/heytap/mcssdk/mode/CommandMessage;Lcom/heytap/mcssdk/PushManager;)V
    .locals 8

    .line 1
    if-nez p0, :cond_0

    const-string p0, "context is null , please check param of parseCommandMessage(2)"

    invoke-static {p0}, Lcom/heytap/mcssdk/utils/LogUtil;->e(Ljava/lang/String;)V

    return-void

    :cond_0
    if-nez p1, :cond_1

    const-string p0, "message is null , please check param of parseCommandMessage(2)"

    invoke-static {p0}, Lcom/heytap/mcssdk/utils/LogUtil;->e(Ljava/lang/String;)V

    return-void

    :cond_1
    if-nez p2, :cond_2

    const-string p0, "pushManager is null , please check param of parseCommandMessage(2)"

    invoke-static {p0}, Lcom/heytap/mcssdk/utils/LogUtil;->e(Ljava/lang/String;)V

    return-void

    :cond_2
    invoke-virtual {p2}, Lcom/heytap/mcssdk/PushManager;->getPushCallback()Lcom/heytap/mcssdk/callback/PushCallback;

    move-result-object p0

    if-nez p0, :cond_3

    const-string p0, "pushManager.getPushCallback() is null , please check param of parseCommandMessage(2)"

    invoke-static {p0}, Lcom/heytap/mcssdk/utils/LogUtil;->e(Ljava/lang/String;)V

    return-void

    :cond_3
    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getCommand()I

    move-result p0

    const-string v0, "aliasName"

    const-string v1, "aliasId"

    const-string v2, "alias"

    const-string v3, "tagName"

    const-string v4, "tagId"

    const-string v5, "accountName"

    const-string v6, "accountId"

    const-string v7, "tags"

    packed-switch p0, :pswitch_data_0

    :pswitch_0
    return-void

    :pswitch_1
    invoke-virtual {p2}, Lcom/heytap/mcssdk/PushManager;->getPushCallback()Lcom/heytap/mcssdk/callback/PushCallback;

    move-result-object p0

    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getResponseCode()I

    move-result p2

    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getContent()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/heytap/mcssdk/utils/Utils;->parseInt(Ljava/lang/String;)I

    move-result p1

    invoke-interface {p0, p2, p1}, Lcom/heytap/mcssdk/callback/PushCallback;->onGetNotificationStatus(II)V

    return-void

    :pswitch_2
    invoke-virtual {p2}, Lcom/heytap/mcssdk/PushManager;->getPushCallback()Lcom/heytap/mcssdk/callback/PushCallback;

    move-result-object p0

    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getResponseCode()I

    move-result p2

    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getContent()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/heytap/mcssdk/utils/Utils;->parseInt(Ljava/lang/String;)I

    move-result p1

    invoke-interface {p0, p2, p1}, Lcom/heytap/mcssdk/callback/PushCallback;->onGetPushStatus(II)V

    return-void

    :pswitch_3
    invoke-virtual {p2}, Lcom/heytap/mcssdk/PushManager;->getPushCallback()Lcom/heytap/mcssdk/callback/PushCallback;

    move-result-object p0

    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getResponseCode()I

    move-result p2

    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getContent()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, v7, v6, v5}, Lcom/heytap/mcssdk/mode/CommandMessage;->parseToSubscribeResultList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p0, p2, p1}, Lcom/heytap/mcssdk/callback/PushCallback;->onUnsetUserAccounts(ILjava/util/List;)V

    return-void

    :pswitch_4
    invoke-virtual {p2}, Lcom/heytap/mcssdk/PushManager;->getPushCallback()Lcom/heytap/mcssdk/callback/PushCallback;

    move-result-object p0

    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getResponseCode()I

    move-result p2

    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getContent()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, v7, v6, v5}, Lcom/heytap/mcssdk/mode/CommandMessage;->parseToSubscribeResultList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p0, p2, p1}, Lcom/heytap/mcssdk/callback/PushCallback;->onGetUserAccounts(ILjava/util/List;)V

    return-void

    :pswitch_5
    invoke-virtual {p2}, Lcom/heytap/mcssdk/PushManager;->getPushCallback()Lcom/heytap/mcssdk/callback/PushCallback;

    move-result-object p0

    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getResponseCode()I

    move-result p2

    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getContent()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, v7, v6, v5}, Lcom/heytap/mcssdk/mode/CommandMessage;->parseToSubscribeResultList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p0, p2, p1}, Lcom/heytap/mcssdk/callback/PushCallback;->onSetUserAccounts(ILjava/util/List;)V

    return-void

    :pswitch_6
    invoke-virtual {p2}, Lcom/heytap/mcssdk/PushManager;->getPushCallback()Lcom/heytap/mcssdk/callback/PushCallback;

    move-result-object p0

    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getResponseCode()I

    move-result p2

    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getContent()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, p2, p1}, Lcom/heytap/mcssdk/callback/PushCallback;->onSetPushTime(ILjava/lang/String;)V

    return-void

    :pswitch_7
    invoke-virtual {p2}, Lcom/heytap/mcssdk/PushManager;->getPushCallback()Lcom/heytap/mcssdk/callback/PushCallback;

    move-result-object p0

    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getResponseCode()I

    move-result p2

    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getContent()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, v7, v4, v3}, Lcom/heytap/mcssdk/mode/CommandMessage;->parseToSubscribeResultList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p0, p2, p1}, Lcom/heytap/mcssdk/callback/PushCallback;->onUnsetTags(ILjava/util/List;)V

    return-void

    :pswitch_8
    invoke-virtual {p2}, Lcom/heytap/mcssdk/PushManager;->getPushCallback()Lcom/heytap/mcssdk/callback/PushCallback;

    move-result-object p0

    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getResponseCode()I

    move-result p2

    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getContent()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, v7, v4, v3}, Lcom/heytap/mcssdk/mode/CommandMessage;->parseToSubscribeResultList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p0, p2, p1}, Lcom/heytap/mcssdk/callback/PushCallback;->onGetTags(ILjava/util/List;)V

    return-void

    :pswitch_9
    invoke-virtual {p2}, Lcom/heytap/mcssdk/PushManager;->getPushCallback()Lcom/heytap/mcssdk/callback/PushCallback;

    move-result-object p0

    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getResponseCode()I

    move-result p2

    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getContent()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, v7, v4, v3}, Lcom/heytap/mcssdk/mode/CommandMessage;->parseToSubscribeResultList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p0, p2, p1}, Lcom/heytap/mcssdk/callback/PushCallback;->onSetTags(ILjava/util/List;)V

    return-void

    :pswitch_a
    invoke-virtual {p2}, Lcom/heytap/mcssdk/PushManager;->getPushCallback()Lcom/heytap/mcssdk/callback/PushCallback;

    move-result-object p0

    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getResponseCode()I

    move-result p2

    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getContent()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, v2, v1, v0}, Lcom/heytap/mcssdk/mode/CommandMessage;->parseToSubscribeResultList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p0, p2, p1}, Lcom/heytap/mcssdk/callback/PushCallback;->onUnsetAliases(ILjava/util/List;)V

    return-void

    :pswitch_b
    invoke-virtual {p2}, Lcom/heytap/mcssdk/PushManager;->getPushCallback()Lcom/heytap/mcssdk/callback/PushCallback;

    move-result-object p0

    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getResponseCode()I

    move-result p2

    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getContent()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, v2, v1, v0}, Lcom/heytap/mcssdk/mode/CommandMessage;->parseToSubscribeResultList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p0, p2, p1}, Lcom/heytap/mcssdk/callback/PushCallback;->onGetAliases(ILjava/util/List;)V

    return-void

    :pswitch_c
    invoke-virtual {p2}, Lcom/heytap/mcssdk/PushManager;->getPushCallback()Lcom/heytap/mcssdk/callback/PushCallback;

    move-result-object p0

    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getResponseCode()I

    move-result p2

    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getContent()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, v2, v1, v0}, Lcom/heytap/mcssdk/mode/CommandMessage;->parseToSubscribeResultList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p0, p2, p1}, Lcom/heytap/mcssdk/callback/PushCallback;->onSetAliases(ILjava/util/List;)V

    return-void

    :pswitch_d
    invoke-virtual {p2}, Lcom/heytap/mcssdk/PushManager;->getPushCallback()Lcom/heytap/mcssdk/callback/PushCallback;

    move-result-object p0

    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getResponseCode()I

    move-result p1

    invoke-interface {p0, p1}, Lcom/heytap/mcssdk/callback/PushCallback;->onUnRegister(I)V

    return-void

    :pswitch_e
    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getResponseCode()I

    move-result p0

    if-nez p0, :cond_4

    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getContent()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Lcom/heytap/mcssdk/PushManager;->setRegisterID(Ljava/lang/String;)V

    :cond_4
    invoke-virtual {p2}, Lcom/heytap/mcssdk/PushManager;->getPushCallback()Lcom/heytap/mcssdk/callback/PushCallback;

    move-result-object p0

    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getResponseCode()I

    move-result p2

    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getContent()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, p2, p1}, Lcom/heytap/mcssdk/callback/PushCallback;->onRegister(ILjava/lang/String;)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x3001
        :pswitch_e
        :pswitch_d
        :pswitch_0
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_0
        :pswitch_0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public static parseCommandMessage(Landroid/content/Context;Lcom/heytap/mcssdk/mode/CommandMessage;Lcom/heytap/mcssdk/callback/PushCallback;)V
    .locals 8

    .line 2
    if-nez p0, :cond_0

    const-string p0, "context is null , please check param of parseCommandMessage()"

    invoke-static {p0}, Lcom/heytap/mcssdk/utils/LogUtil;->e(Ljava/lang/String;)V

    return-void

    :cond_0
    if-nez p1, :cond_1

    const-string p0, "message is null , please check param of parseCommandMessage()"

    invoke-static {p0}, Lcom/heytap/mcssdk/utils/LogUtil;->e(Ljava/lang/String;)V

    return-void

    :cond_1
    if-nez p2, :cond_2

    const-string p0, "callback is null , please check param of parseCommandMessage()"

    invoke-static {p0}, Lcom/heytap/mcssdk/utils/LogUtil;->e(Ljava/lang/String;)V

    return-void

    :cond_2
    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getCommand()I

    move-result p0

    const-string v0, "aliasName"

    const-string v1, "aliasId"

    const-string v2, "alias"

    const-string v3, "tagName"

    const-string v4, "tagId"

    const-string v5, "accountName"

    const-string v6, "accountId"

    const-string v7, "tags"

    packed-switch p0, :pswitch_data_0

    :pswitch_0
    return-void

    :pswitch_1
    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getResponseCode()I

    move-result p0

    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getContent()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/heytap/mcssdk/utils/Utils;->parseInt(Ljava/lang/String;)I

    move-result p1

    invoke-interface {p2, p0, p1}, Lcom/heytap/mcssdk/callback/PushCallback;->onGetNotificationStatus(II)V

    return-void

    :pswitch_2
    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getResponseCode()I

    move-result p0

    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getContent()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/heytap/mcssdk/utils/Utils;->parseInt(Ljava/lang/String;)I

    move-result p1

    invoke-interface {p2, p0, p1}, Lcom/heytap/mcssdk/callback/PushCallback;->onGetPushStatus(II)V

    return-void

    :pswitch_3
    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getResponseCode()I

    move-result p0

    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getContent()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, v7, v6, v5}, Lcom/heytap/mcssdk/mode/CommandMessage;->parseToSubscribeResultList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p2, p0, p1}, Lcom/heytap/mcssdk/callback/PushCallback;->onUnsetUserAccounts(ILjava/util/List;)V

    return-void

    :pswitch_4
    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getResponseCode()I

    move-result p0

    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getContent()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, v7, v6, v5}, Lcom/heytap/mcssdk/mode/CommandMessage;->parseToSubscribeResultList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p2, p0, p1}, Lcom/heytap/mcssdk/callback/PushCallback;->onGetUserAccounts(ILjava/util/List;)V

    return-void

    :pswitch_5
    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getResponseCode()I

    move-result p0

    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getContent()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, v7, v6, v5}, Lcom/heytap/mcssdk/mode/CommandMessage;->parseToSubscribeResultList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p2, p0, p1}, Lcom/heytap/mcssdk/callback/PushCallback;->onSetUserAccounts(ILjava/util/List;)V

    return-void

    :pswitch_6
    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getResponseCode()I

    move-result p0

    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getContent()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p2, p0, p1}, Lcom/heytap/mcssdk/callback/PushCallback;->onSetPushTime(ILjava/lang/String;)V

    return-void

    :pswitch_7
    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getResponseCode()I

    move-result p0

    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getContent()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, v7, v4, v3}, Lcom/heytap/mcssdk/mode/CommandMessage;->parseToSubscribeResultList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p2, p0, p1}, Lcom/heytap/mcssdk/callback/PushCallback;->onUnsetTags(ILjava/util/List;)V

    return-void

    :pswitch_8
    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getResponseCode()I

    move-result p0

    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getContent()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, v7, v4, v3}, Lcom/heytap/mcssdk/mode/CommandMessage;->parseToSubscribeResultList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p2, p0, p1}, Lcom/heytap/mcssdk/callback/PushCallback;->onGetTags(ILjava/util/List;)V

    return-void

    :pswitch_9
    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getResponseCode()I

    move-result p0

    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getContent()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, v7, v4, v3}, Lcom/heytap/mcssdk/mode/CommandMessage;->parseToSubscribeResultList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p2, p0, p1}, Lcom/heytap/mcssdk/callback/PushCallback;->onSetTags(ILjava/util/List;)V

    return-void

    :pswitch_a
    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getResponseCode()I

    move-result p0

    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getContent()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, v2, v1, v0}, Lcom/heytap/mcssdk/mode/CommandMessage;->parseToSubscribeResultList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p2, p0, p1}, Lcom/heytap/mcssdk/callback/PushCallback;->onUnsetAliases(ILjava/util/List;)V

    return-void

    :pswitch_b
    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getResponseCode()I

    move-result p0

    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getContent()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, v2, v1, v0}, Lcom/heytap/mcssdk/mode/CommandMessage;->parseToSubscribeResultList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p2, p0, p1}, Lcom/heytap/mcssdk/callback/PushCallback;->onGetAliases(ILjava/util/List;)V

    return-void

    :pswitch_c
    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getResponseCode()I

    move-result p0

    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getContent()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, v2, v1, v0}, Lcom/heytap/mcssdk/mode/CommandMessage;->parseToSubscribeResultList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p2, p0, p1}, Lcom/heytap/mcssdk/callback/PushCallback;->onSetAliases(ILjava/util/List;)V

    return-void

    :pswitch_d
    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getResponseCode()I

    move-result p0

    invoke-interface {p2, p0}, Lcom/heytap/mcssdk/callback/PushCallback;->onUnRegister(I)V

    return-void

    :pswitch_e
    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getResponseCode()I

    move-result p0

    if-nez p0, :cond_3

    invoke-static {}, Lcom/heytap/mcssdk/PushManager;->getInstance()Lcom/heytap/mcssdk/PushManager;

    move-result-object p0

    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getContent()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/heytap/mcssdk/PushManager;->setRegisterID(Ljava/lang/String;)V

    :cond_3
    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getResponseCode()I

    move-result p0

    invoke-virtual {p1}, Lcom/heytap/mcssdk/mode/CommandMessage;->getContent()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p2, p0, p1}, Lcom/heytap/mcssdk/callback/PushCallback;->onRegister(ILjava/lang/String;)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x3001
        :pswitch_e
        :pswitch_d
        :pswitch_0
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_0
        :pswitch_0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public static parseIntent(Landroid/content/Context;Landroid/content/Intent;Lcom/heytap/mcssdk/callback/MessageCallback;)V
    .locals 3

    if-nez p0, :cond_0

    const-string p0, "context is null , please check param of parseIntent()"

    :goto_0
    invoke-static {p0}, Lcom/heytap/mcssdk/utils/LogUtil;->e(Ljava/lang/String;)V

    return-void

    :cond_0
    if-nez p1, :cond_1

    const-string p0, "intent is null , please check param of parseIntent()"

    goto :goto_0

    :cond_1
    if-nez p2, :cond_2

    const-string p0, "callback is null , please check param of parseIntent()"

    goto :goto_0

    :cond_2
    invoke-static {p0, p1}, Lcom/heytap/mcssdk/a/c;->a(Landroid/content/Context;Landroid/content/Intent;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_3
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/heytap/mcssdk/mode/Message;

    if-eqz v0, :cond_3

    invoke-static {}, Lcom/heytap/mcssdk/PushManager;->getInstance()Lcom/heytap/mcssdk/PushManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/heytap/mcssdk/PushManager;->getProcessors()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_4
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/heytap/mcssdk/b/c;

    if-eqz v2, :cond_4

    invoke-interface {v2, p0, v0, p2}, Lcom/heytap/mcssdk/b/c;->a(Landroid/content/Context;Lcom/heytap/mcssdk/mode/Message;Lcom/heytap/mcssdk/callback/MessageCallback;)V

    goto :goto_1

    :cond_5
    return-void
.end method
