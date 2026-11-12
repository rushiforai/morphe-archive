.class public Lcom/leanplum/LeanplumInboxMessage;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private context:Lcom/leanplum/ActionContext;

.field private deliveryTimestamp:Ljava/lang/Long;

.field private expirationTimestamp:Ljava/lang/Long;

.field private imageFileName:Ljava/lang/String;

.field private imageUrl:Ljava/lang/String;

.field private isRead:Z

.field private messageId:Ljava/lang/String;


# direct methods
.method private constructor <init>(Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;ZLcom/leanplum/ActionContext;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/leanplum/LeanplumInboxMessage;->messageId:Ljava/lang/String;

    iput-object p2, p0, Lcom/leanplum/LeanplumInboxMessage;->deliveryTimestamp:Ljava/lang/Long;

    iput-object p3, p0, Lcom/leanplum/LeanplumInboxMessage;->expirationTimestamp:Ljava/lang/Long;

    iput-boolean p4, p0, Lcom/leanplum/LeanplumInboxMessage;->isRead:Z

    iput-object p5, p0, Lcom/leanplum/LeanplumInboxMessage;->context:Lcom/leanplum/ActionContext;

    const-string p1, "Image"

    invoke-virtual {p5, p1}, Lcom/leanplum/ActionContext;->stringNamed(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/leanplum/LeanplumInboxMessage;->imageUrl:Ljava/lang/String;

    if-eqz p1, :cond_1d

    :try_start_17
    invoke-static {p1}, Lcom/leanplum/internal/Util;->sha256(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/leanplum/LeanplumInboxMessage;->imageFileName:Ljava/lang/String;
    :try_end_1d
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_1d} :catch_1d

    :catch_1d
    :cond_1d
    return-void
.end method

.method private actionArgs()Ljava/util/Map;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    iget-object p0, p0, Lcom/leanplum/LeanplumInboxMessage;->context:Lcom/leanplum/ActionContext;

    invoke-virtual {p0}, Lcom/leanplum/internal/BaseActionContext;->getArgs()Ljava/util/Map;

    move-result-object p0

    return-object p0
.end method

.method public static constructMessage(Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;ZLjava/util/Map;)Lcom/leanplum/LeanplumInboxMessage;
    .registers 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            "Ljava/lang/Long;",
            "Z",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/leanplum/LeanplumInboxMessage;"
        }
    .end annotation

    invoke-static {p0}, Lcom/leanplum/LeanplumInboxMessage;->isValidMessageId(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_14

    const-string p1, "Malformed inbox messageId: "

    invoke-static {p1, p0}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    new-array p1, v1, [Ljava/lang/Object;

    invoke-static {p0, p1}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    const/4 p0, 0x0

    return-object p0

    :cond_14
    const-string v0, "##"

    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    new-instance v7, Lcom/leanplum/ActionContext;

    const-string v2, "__name__"

    invoke-interface {p4, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    aget-object v0, v0, v1

    invoke-direct {v7, v2, p4, v0}, Lcom/leanplum/ActionContext;-><init>(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;)V

    invoke-virtual {v7}, Lcom/leanplum/ActionContext;->preventRealtimeUpdating()V

    invoke-virtual {v7}, Lcom/leanplum/ActionContext;->update()V

    new-instance v2, Lcom/leanplum/LeanplumInboxMessage;

    move-object v3, p0

    move-object v4, p1

    move-object v5, p2

    move v6, p3

    invoke-direct/range {v2 .. v7}, Lcom/leanplum/LeanplumInboxMessage;-><init>(Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;ZLcom/leanplum/ActionContext;)V

    return-object v2
.end method

.method public static createFromJsonMap(Ljava/lang/String;Ljava/util/Map;)Lcom/leanplum/LeanplumInboxMessage;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/leanplum/LeanplumInboxMessage;"
        }
    .end annotation

    const-string v0, "messageData"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/leanplum/internal/CollectionUtil;->uncheckedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    const-string v1, "deliveryTimestamp"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lcom/leanplum/internal/CollectionUtil;->uncheckedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    const-string v2, "expirationTimestamp"

    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lcom/leanplum/internal/CollectionUtil;->uncheckedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    const-string v3, "isRead"

    invoke-interface {p1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Lcom/leanplum/internal/CollectionUtil;->uncheckedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    if-eqz p1, :cond_37

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    goto :goto_38

    :cond_37
    const/4 p1, 0x0

    :goto_38
    invoke-static {p0, v1, v2, p1, v0}, Lcom/leanplum/LeanplumInboxMessage;->constructMessage(Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;ZLjava/util/Map;)Lcom/leanplum/LeanplumInboxMessage;

    move-result-object p0

    return-object p0
.end method

.method private static isValidMessageId(Ljava/lang/String;)Z
    .registers 2

    const-string v0, "##"

    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    array-length p0, p0

    const/4 v0, 0x2

    if-ne p0, v0, :cond_c

    const/4 p0, 0x1

    return p0

    :cond_c
    const/4 p0, 0x0

    return p0
.end method

.method private setIsRead(Z)V
    .registers 2

    iput-boolean p1, p0, Lcom/leanplum/LeanplumInboxMessage;->isRead:Z

    return-void
.end method


# virtual methods
.method public downloadImageIfPrefetchingEnabled()Z
    .registers 6

    sget-boolean v0, Lcom/leanplum/LeanplumInbox;->isInboxImagePrefetchingEnabled:Z

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return v1

    :cond_6
    iget-object v0, p0, Lcom/leanplum/LeanplumInboxMessage;->imageUrl:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2e

    sget-object v0, Lcom/leanplum/LeanplumInbox;->downloadedImageUrls:Ljava/util/Set;

    iget-object v2, p0, Lcom/leanplum/LeanplumInboxMessage;->imageUrl:Ljava/lang/String;

    invoke-interface {v0, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2e

    iget-object v0, p0, Lcom/leanplum/LeanplumInboxMessage;->imageFileName:Ljava/lang/String;

    iget-object v2, p0, Lcom/leanplum/LeanplumInboxMessage;->imageUrl:Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-static {v4, v0, v2, v2, v3}, Lcom/leanplum/internal/FileManager;->maybeDownloadFile(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)Lcom/leanplum/internal/FileManager$DownloadFileResult;

    move-result-object v0

    sget-object v2, Lcom/leanplum/LeanplumInbox;->downloadedImageUrls:Ljava/util/Set;

    iget-object p0, p0, Lcom/leanplum/LeanplumInboxMessage;->imageUrl:Ljava/lang/String;

    invoke-interface {v2, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    sget-object p0, Lcom/leanplum/internal/FileManager$DownloadFileResult;->DOWNLOADING:Lcom/leanplum/internal/FileManager$DownloadFileResult;

    if-ne p0, v0, :cond_2e

    return v4

    :cond_2e
    return v1
.end method

.method public getContext()Lcom/leanplum/ActionContext;
    .registers 1

    iget-object p0, p0, Lcom/leanplum/LeanplumInboxMessage;->context:Lcom/leanplum/ActionContext;

    return-object p0
.end method

.method public getData()Lorg/json/JSONObject;
    .registers 2

    :try_start_0
    invoke-virtual {p0}, Lcom/leanplum/LeanplumInboxMessage;->getContext()Lcom/leanplum/ActionContext;

    move-result-object p0

    const-string v0, "Data"

    invoke-virtual {p0, v0}, Lcom/leanplum/ActionContext;->objectNamed(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lcom/leanplum/internal/CollectionUtil;->uncheckedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Map;

    invoke-static {p0}, Lcom/leanplum/internal/JsonConverter;->mapToJsonObject(Ljava/util/Map;)Lorg/json/JSONObject;

    move-result-object p0
    :try_end_14
    .catchall {:try_start_0 .. :try_end_14} :catchall_15

    return-object p0

    :catchall_15
    const/4 p0, 0x0

    new-array p0, p0, [Ljava/lang/Object;

    const-string v0, "Unable to parse JSONObject for Data field of inbox message."

    invoke-static {v0, p0}, Lcom/leanplum/internal/Log;->i(Ljava/lang/String;[Ljava/lang/Object;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public getDeliveryTimestamp()Ljava/util/Date;
    .registers 4

    iget-object v0, p0, Lcom/leanplum/LeanplumInboxMessage;->deliveryTimestamp:Ljava/lang/Long;

    if-nez v0, :cond_6

    const/4 p0, 0x0

    return-object p0

    :cond_6
    new-instance v0, Ljava/util/Date;

    iget-object p0, p0, Lcom/leanplum/LeanplumInboxMessage;->deliveryTimestamp:Ljava/lang/Long;

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    return-object v0
.end method

.method public getExpirationTimestamp()Ljava/util/Date;
    .registers 4

    iget-object v0, p0, Lcom/leanplum/LeanplumInboxMessage;->expirationTimestamp:Ljava/lang/Long;

    if-nez v0, :cond_6

    const/4 p0, 0x0

    return-object p0

    :cond_6
    new-instance v0, Ljava/util/Date;

    iget-object p0, p0, Lcom/leanplum/LeanplumInboxMessage;->expirationTimestamp:Ljava/lang/Long;

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    return-object v0
.end method

.method public getImageFilePath()Ljava/lang/String;
    .registers 2

    iget-object p0, p0, Lcom/leanplum/LeanplumInboxMessage;->imageFileName:Ljava/lang/String;

    invoke-static {p0}, Lcom/leanplum/internal/FileManager;->fileValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/leanplum/internal/FileManager;->fileExistsAtPath(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_16

    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_16
    invoke-static {}, Lcom/leanplum/LeanplumInbox;->getInstance()Lcom/leanplum/LeanplumInbox;

    move-result-object p0

    invoke-virtual {p0}, Lcom/leanplum/LeanplumInbox;->isInboxImagePrefetchingEnabled()Z

    move-result p0

    if-nez p0, :cond_28

    const/4 p0, 0x0

    new-array p0, p0, [Ljava/lang/Object;

    const-string v0, "Inbox Message image path is null because you\'re calling disableImagePrefetching. Consider using imageURL method or remove disableImagePrefetching."

    invoke-static {v0, p0}, Lcom/leanplum/internal/Log;->i(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_28
    const/4 p0, 0x0

    return-object p0
.end method

.method public getImageUrl()Landroid/net/Uri;
    .registers 3

    iget-object v0, p0, Lcom/leanplum/LeanplumInboxMessage;->imageFileName:Ljava/lang/String;

    invoke-static {v0}, Lcom/leanplum/internal/FileManager;->fileValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/leanplum/internal/FileManager;->fileExistsAtPath(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_16

    new-instance p0, Ljava/io/File;

    invoke-direct {p0, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {p0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object p0

    return-object p0

    :cond_16
    iget-object v0, p0, Lcom/leanplum/LeanplumInboxMessage;->imageUrl:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_20

    const/4 p0, 0x0

    return-object p0

    :cond_20
    iget-object p0, p0, Lcom/leanplum/LeanplumInboxMessage;->imageUrl:Ljava/lang/String;

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method public getMessageId()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lcom/leanplum/LeanplumInboxMessage;->messageId:Ljava/lang/String;

    return-object p0
.end method

.method public getSubtitle()Ljava/lang/String;
    .registers 2

    iget-object p0, p0, Lcom/leanplum/LeanplumInboxMessage;->context:Lcom/leanplum/ActionContext;

    const-string v0, "Subtitle"

    invoke-virtual {p0, v0}, Lcom/leanplum/ActionContext;->stringNamed(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getTitle()Ljava/lang/String;
    .registers 2

    iget-object p0, p0, Lcom/leanplum/LeanplumInboxMessage;->context:Lcom/leanplum/ActionContext;

    const-string v0, "Title"

    invoke-virtual {p0, v0}, Lcom/leanplum/ActionContext;->stringNamed(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public isActive()Z
    .registers 5

    iget-object v0, p0, Lcom/leanplum/LeanplumInboxMessage;->expirationTimestamp:Ljava/lang/Long;

    if-nez v0, :cond_6

    const/4 p0, 0x1

    return p0

    :cond_6
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    new-instance v1, Ljava/util/Date;

    iget-object p0, p0, Lcom/leanplum/LeanplumInboxMessage;->expirationTimestamp:Ljava/lang/Long;

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-direct {v1, v2, v3}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v0, v1}, Ljava/util/Date;->before(Ljava/util/Date;)Z

    move-result p0

    return p0
.end method

.method public isRead()Z
    .registers 1

    iget-boolean p0, p0, Lcom/leanplum/LeanplumInboxMessage;->isRead:Z

    return p0
.end method

.method public markAsRead()V
    .registers 3

    :try_start_0
    invoke-static {}, Lcom/leanplum/internal/Constants;->isNoop()Z

    move-result v0

    if-nez v0, :cond_35

    iget-boolean v0, p0, Lcom/leanplum/LeanplumInboxMessage;->isRead:Z

    if-nez v0, :cond_35

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/leanplum/LeanplumInboxMessage;->setIsRead(Z)V

    invoke-static {}, Lcom/leanplum/LeanplumInbox;->getInstance()Lcom/leanplum/LeanplumInbox;

    move-result-object v1

    invoke-virtual {v1}, Lcom/leanplum/LeanplumInbox;->unreadCount()I

    move-result v1

    sub-int/2addr v1, v0

    invoke-static {}, Lcom/leanplum/LeanplumInbox;->getInstance()Lcom/leanplum/LeanplumInbox;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/leanplum/LeanplumInbox;->updateUnreadCount(I)V

    invoke-static {}, Lcom/leanplum/internal/RequestBuilder;->withMarkInboxMessageAsReadAction()Lcom/leanplum/internal/RequestBuilder;

    move-result-object v0

    const-string v1, "newsfeedMessageId"

    iget-object p0, p0, Lcom/leanplum/LeanplumInboxMessage;->messageId:Ljava/lang/String;

    invoke-virtual {v0, v1, p0}, Lcom/leanplum/internal/RequestBuilder;->andParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/leanplum/internal/RequestBuilder;

    move-result-object p0

    invoke-virtual {p0}, Lcom/leanplum/internal/RequestBuilder;->create()Lcom/leanplum/internal/Request;

    move-result-object p0

    invoke-static {}, Lcom/leanplum/internal/RequestSender;->getInstance()Lcom/leanplum/internal/RequestSender;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/leanplum/internal/RequestSender;->send(Lcom/leanplum/internal/Request;)V
    :try_end_35
    .catchall {:try_start_0 .. :try_end_35} :catchall_36

    :cond_35
    return-void

    :catchall_36
    move-exception p0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return-void
.end method

.method public read()V
    .registers 2

    :try_start_0
    invoke-static {}, Lcom/leanplum/internal/Constants;->isNoop()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    invoke-virtual {p0}, Lcom/leanplum/LeanplumInboxMessage;->markAsRead()V

    invoke-virtual {p0}, Lcom/leanplum/LeanplumInboxMessage;->getContext()Lcom/leanplum/ActionContext;

    move-result-object p0

    const-string v0, "Open action"

    invoke-virtual {p0, v0}, Lcom/leanplum/ActionContext;->runTrackedActionNamed(Ljava/lang/String;)V
    :try_end_13
    .catchall {:try_start_0 .. :try_end_13} :catchall_14

    return-void

    :catchall_14
    move-exception p0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return-void
.end method

.method public remove()V
    .registers 2

    :try_start_0
    invoke-static {}, Lcom/leanplum/LeanplumInbox;->getInstance()Lcom/leanplum/LeanplumInbox;

    move-result-object v0

    iget-object p0, p0, Lcom/leanplum/LeanplumInboxMessage;->messageId:Ljava/lang/String;

    invoke-virtual {v0, p0}, Lcom/leanplum/LeanplumInbox;->removeMessage(Ljava/lang/String;)V
    :try_end_9
    .catchall {:try_start_0 .. :try_end_9} :catchall_a

    return-void

    :catchall_a
    move-exception p0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return-void
.end method

.method public toJsonMap()Ljava/util/Map;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "deliveryTimestamp"

    iget-object v2, p0, Lcom/leanplum/LeanplumInboxMessage;->deliveryTimestamp:Ljava/lang/Long;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "expirationTimestamp"

    iget-object v2, p0, Lcom/leanplum/LeanplumInboxMessage;->expirationTimestamp:Ljava/lang/Long;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "messageData"

    invoke-direct {p0}, Lcom/leanplum/LeanplumInboxMessage;->actionArgs()Ljava/util/Map;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/leanplum/LeanplumInboxMessage;->isRead()Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    const-string v1, "isRead"

    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method
