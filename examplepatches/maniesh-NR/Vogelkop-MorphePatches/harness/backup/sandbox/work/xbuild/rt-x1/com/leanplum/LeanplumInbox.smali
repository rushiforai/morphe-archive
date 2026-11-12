.class public Lcom/leanplum/LeanplumInbox;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field static downloadedImageUrls:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static instance:Lcom/leanplum/LeanplumInbox;

.field static isInboxImagePrefetchingEnabled:Z


# instance fields
.field private final changedCallbacks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/leanplum/callbacks/InboxChangedCallback;",
            ">;"
        }
    .end annotation
.end field

.field private volatile didLoad:Z

.field private volatile messages:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/leanplum/LeanplumInboxMessage;",
            ">;"
        }
    .end annotation
.end field

.field private final syncedCallbacks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/leanplum/callbacks/InboxSyncedCallback;",
            ">;"
        }
    .end annotation
.end field

.field private volatile unreadCount:I

.field private final updatingLock:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/leanplum/LeanplumInbox;

    invoke-direct {v0}, Lcom/leanplum/LeanplumInbox;-><init>()V

    sput-object v0, Lcom/leanplum/LeanplumInbox;->instance:Lcom/leanplum/LeanplumInbox;

    const/4 v0, 0x1

    sput-boolean v0, Lcom/leanplum/LeanplumInbox;->isInboxImagePrefetchingEnabled:Z

    return-void
.end method

.method private constructor <init>()V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/leanplum/LeanplumInbox;->didLoad:Z

    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lcom/leanplum/LeanplumInbox;->updatingLock:Ljava/lang/Object;

    iput v0, p0, Lcom/leanplum/LeanplumInbox;->unreadCount:I

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/leanplum/LeanplumInbox;->messages:Ljava/util/Map;

    iput-boolean v0, p0, Lcom/leanplum/LeanplumInbox;->didLoad:Z

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/leanplum/LeanplumInbox;->changedCallbacks:Ljava/util/List;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/leanplum/LeanplumInbox;->syncedCallbacks:Ljava/util/List;

    new-instance p0, Ljava/util/HashSet;

    invoke-direct {p0}, Ljava/util/HashSet;-><init>()V

    sput-object p0, Lcom/leanplum/LeanplumInbox;->downloadedImageUrls:Ljava/util/Set;

    return-void
.end method

.method public static synthetic access$000(Lcom/leanplum/LeanplumInbox;ZLcom/leanplum/callbacks/InboxSyncedCallback;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Lcom/leanplum/LeanplumInbox;->triggerInboxSyncedWithStatus(ZLcom/leanplum/callbacks/InboxSyncedCallback;)V

    return-void
.end method

.method private allMessages(Ljava/util/List;)Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/leanplum/LeanplumInboxMessage;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/leanplum/LeanplumInboxMessage;",
            ">;"
        }
    .end annotation

    if-nez p1, :cond_7

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    :cond_7
    :try_start_7
    invoke-virtual {p0}, Lcom/leanplum/LeanplumInbox;->messagesIds()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_f
    :goto_f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_25

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p0, v1}, Lcom/leanplum/LeanplumInbox;->messageForId(Ljava/lang/String;)Lcom/leanplum/LeanplumInboxMessage;

    move-result-object v1

    if-eqz v1, :cond_f

    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_24
    .catchall {:try_start_7 .. :try_end_24} :catchall_26

    goto :goto_f

    :cond_25
    return-object p1

    :catchall_26
    move-exception p0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return-object p1
.end method

.method public static disableImagePrefetching()V
    .registers 1

    const/4 v0, 0x0

    sput-boolean v0, Lcom/leanplum/LeanplumInbox;->isInboxImagePrefetchingEnabled:Z

    return-void
.end method

.method public static getInstance()Lcom/leanplum/LeanplumInbox;
    .registers 1

    sget-object v0, Lcom/leanplum/LeanplumInbox;->instance:Lcom/leanplum/LeanplumInbox;

    return-object v0
.end method

.method private triggerInboxSyncedWithStatus(ZLcom/leanplum/callbacks/InboxSyncedCallback;)V
    .registers 3
    .param p2    # Lcom/leanplum/callbacks/InboxSyncedCallback;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    if-eqz p2, :cond_c

    .line 38
    invoke-virtual {p0, p2}, Lcom/leanplum/LeanplumInbox;->addSyncedHandler(Lcom/leanplum/callbacks/InboxSyncedCallback;)V

    .line 39
    invoke-virtual {p0, p1}, Lcom/leanplum/LeanplumInbox;->triggerInboxSyncedWithStatus(Z)V

    .line 40
    invoke-virtual {p0, p2}, Lcom/leanplum/LeanplumInbox;->removeSyncedHandler(Lcom/leanplum/callbacks/InboxSyncedCallback;)V

    return-void

    .line 41
    :cond_c
    invoke-virtual {p0, p1}, Lcom/leanplum/LeanplumInbox;->triggerInboxSyncedWithStatus(Z)V

    return-void
.end method

.method private unreadMessages(Ljava/util/List;)Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/leanplum/LeanplumInboxMessage;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/leanplum/LeanplumInboxMessage;",
            ">;"
        }
    .end annotation

    if-nez p1, :cond_7

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    :cond_7
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/leanplum/LeanplumInbox;->allMessages(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_10
    :goto_10
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_26

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/leanplum/LeanplumInboxMessage;

    invoke-virtual {v0}, Lcom/leanplum/LeanplumInboxMessage;->isRead()Z

    move-result v1

    if-nez v1, :cond_10

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_10

    :cond_26
    return-object p1
.end method


# virtual methods
.method public addChangedHandler(Lcom/leanplum/callbacks/InboxChangedCallback;)V
    .registers 4

    iget-object v0, p0, Lcom/leanplum/LeanplumInbox;->changedCallbacks:Ljava/util/List;

    monitor-enter v0

    :try_start_3
    iget-object v1, p0, Lcom/leanplum/LeanplumInbox;->changedCallbacks:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    monitor-exit v0
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_13

    iget-boolean p0, p0, Lcom/leanplum/LeanplumInbox;->didLoad:Z

    if-eqz p0, :cond_10

    invoke-virtual {p1}, Lcom/leanplum/callbacks/InboxChangedCallback;->inboxChanged()V

    :cond_10
    return-void

    :goto_11
    :try_start_11
    monitor-exit v0
    :try_end_12
    .catchall {:try_start_11 .. :try_end_12} :catchall_13

    throw p0

    :catchall_13
    move-exception p0

    goto :goto_11
.end method

.method public addSyncedHandler(Lcom/leanplum/callbacks/InboxSyncedCallback;)V
    .registers 3

    iget-object v0, p0, Lcom/leanplum/LeanplumInbox;->syncedCallbacks:Ljava/util/List;

    monitor-enter v0

    :try_start_3
    iget-object p0, p0, Lcom/leanplum/LeanplumInbox;->syncedCallbacks:Ljava/util/List;

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    monitor-exit v0

    return-void

    :goto_a
    monitor-exit v0
    :try_end_b
    .catchall {:try_start_3 .. :try_end_b} :catchall_c

    throw p0

    :catchall_c
    move-exception p0

    goto :goto_a
.end method

.method public allMessages()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/leanplum/LeanplumInboxMessage;",
            ">;"
        }
    .end annotation

    .line 43
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-direct {p0, v0}, Lcom/leanplum/LeanplumInbox;->allMessages(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public count()I
    .registers 1

    iget-object p0, p0, Lcom/leanplum/LeanplumInbox;->messages:Ljava/util/Map;

    invoke-interface {p0}, Ljava/util/Map;->size()I

    move-result p0

    return p0
.end method

.method public downloadMessages()V
    .registers 2

    const/4 v0, 0x0

    .line 45
    invoke-virtual {p0, v0}, Lcom/leanplum/LeanplumInbox;->downloadMessages(Lcom/leanplum/callbacks/InboxSyncedCallback;)V

    return-void
.end method

.method public downloadMessages(Lcom/leanplum/callbacks/InboxSyncedCallback;)V
    .registers 4
    .param p1    # Lcom/leanplum/callbacks/InboxSyncedCallback;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    invoke-static {}, Lcom/leanplum/internal/Constants;->isNoop()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    invoke-static {}, Lcom/leanplum/internal/RequestBuilder;->withGetInboxMessagesAction()Lcom/leanplum/internal/RequestBuilder;

    move-result-object v0

    sget-object v1, Lcom/leanplum/internal/Request$RequestType;->IMMEDIATE:Lcom/leanplum/internal/Request$RequestType;

    invoke-virtual {v0, v1}, Lcom/leanplum/internal/RequestBuilder;->andType(Lcom/leanplum/internal/Request$RequestType;)Lcom/leanplum/internal/RequestBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/leanplum/internal/RequestBuilder;->create()Lcom/leanplum/internal/Request;

    move-result-object v0

    new-instance v1, Lcom/leanplum/LeanplumInbox$2;

    invoke-direct {v1, p0, p1}, Lcom/leanplum/LeanplumInbox$2;-><init>(Lcom/leanplum/LeanplumInbox;Lcom/leanplum/callbacks/InboxSyncedCallback;)V

    invoke-virtual {v0, v1}, Lcom/leanplum/internal/Request;->onResponse(Lcom/leanplum/internal/Request$ResponseCallback;)V

    new-instance v1, Lcom/leanplum/LeanplumInbox$3;

    invoke-direct {v1, p0, p1}, Lcom/leanplum/LeanplumInbox$3;-><init>(Lcom/leanplum/LeanplumInbox;Lcom/leanplum/callbacks/InboxSyncedCallback;)V

    invoke-virtual {v0, v1}, Lcom/leanplum/internal/Request;->onError(Lcom/leanplum/internal/Request$ErrorCallback;)V

    invoke-static {}, Lcom/leanplum/internal/RequestSender;->getInstance()Lcom/leanplum/internal/RequestSender;

    move-result-object p0

    invoke-virtual {p0, v0}, Lcom/leanplum/internal/RequestSender;->send(Lcom/leanplum/internal/Request;)V

    return-void
.end method

.method public isInboxImagePrefetchingEnabled()Z
    .registers 1

    sget-boolean p0, Lcom/leanplum/LeanplumInbox;->isInboxImagePrefetchingEnabled:Z

    return p0
.end method

.method public load()V
    .registers 8

    invoke-static {}, Lcom/leanplum/internal/Constants;->isNoop()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    invoke-static {}, Lcom/leanplum/Leanplum;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "__leanplum__"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    sget-boolean v1, Lcom/leanplum/internal/Constants;->allowStorageWithoutLegacyToken:Z

    if-nez v1, :cond_29

    invoke-static {}, Lcom/leanplum/internal/APIConfig;->getInstance()Lcom/leanplum/internal/APIConfig;

    move-result-object v1

    invoke-virtual {v1}, Lcom/leanplum/internal/APIConfig;->token()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_29

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {p0, v0, v2, v2}, Lcom/leanplum/LeanplumInbox;->update(Ljava/util/Map;IZ)V

    return-void

    :cond_29
    new-instance v1, Lcom/leanplum/internal/AESCrypt;

    invoke-static {}, Lcom/leanplum/internal/APIConfig;->getInstance()Lcom/leanplum/internal/APIConfig;

    move-result-object v3

    invoke-virtual {v3}, Lcom/leanplum/internal/APIConfig;->appId()Ljava/lang/String;

    move-result-object v3

    invoke-static {}, Lcom/leanplum/internal/APIConfig;->getInstance()Lcom/leanplum/internal/APIConfig;

    move-result-object v4

    invoke-virtual {v4}, Lcom/leanplum/internal/APIConfig;->token()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v3, v4}, Lcom/leanplum/internal/AESCrypt;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "__leanplum_newsfeed"

    const-string v4, "{}"

    invoke-virtual {v1, v0, v3, v4}, Lcom/leanplum/internal/AESCrypt;->decodePreference(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/leanplum/internal/JsonConverter;->fromJson(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v1

    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    if-nez v1, :cond_5e

    const-string v1, "Could not parse newsfeed string: "

    invoke-static {v1, v0}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-array v1, v2, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    move v1, v2

    goto :goto_9b

    :cond_5e
    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    move v1, v2

    :cond_67
    :goto_67
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_9b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    invoke-static {v4}, Lcom/leanplum/internal/CollectionUtil;->uncheckedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map;

    invoke-static {v5, v4}, Lcom/leanplum/LeanplumInboxMessage;->createFromJsonMap(Ljava/lang/String;Ljava/util/Map;)Lcom/leanplum/LeanplumInboxMessage;

    move-result-object v4

    if-eqz v4, :cond_67

    invoke-virtual {v4}, Lcom/leanplum/LeanplumInboxMessage;->isActive()Z

    move-result v6

    if-eqz v6, :cond_67

    invoke-virtual {v3, v5, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v4}, Lcom/leanplum/LeanplumInboxMessage;->isRead()Z

    move-result v4

    if-nez v4, :cond_67

    add-int/lit8 v1, v1, 0x1

    goto :goto_67

    :cond_9b
    :goto_9b
    invoke-virtual {p0, v3, v1, v2}, Lcom/leanplum/LeanplumInbox;->update(Ljava/util/Map;IZ)V

    return-void
.end method

.method public messageForId(Ljava/lang/String;)Lcom/leanplum/LeanplumInboxMessage;
    .registers 2

    iget-object p0, p0, Lcom/leanplum/LeanplumInbox;->messages:Ljava/util/Map;

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/leanplum/LeanplumInboxMessage;

    return-object p0
.end method

.method public messagesIds()Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/leanplum/LeanplumInbox;->messages:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    :try_start_b
    new-instance v1, Lcom/leanplum/LeanplumInbox$1;

    invoke-direct {v1, p0}, Lcom/leanplum/LeanplumInbox$1;-><init>(Lcom/leanplum/LeanplumInbox;)V

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
    :try_end_13
    .catchall {:try_start_b .. :try_end_13} :catchall_14

    return-object v0

    :catchall_14
    move-exception p0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return-object v0
.end method

.method public removeChangedHandler(Lcom/leanplum/callbacks/InboxChangedCallback;)V
    .registers 3

    iget-object v0, p0, Lcom/leanplum/LeanplumInbox;->changedCallbacks:Ljava/util/List;

    monitor-enter v0

    :try_start_3
    iget-object p0, p0, Lcom/leanplum/LeanplumInbox;->changedCallbacks:Ljava/util/List;

    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    monitor-exit v0

    return-void

    :goto_a
    monitor-exit v0
    :try_end_b
    .catchall {:try_start_3 .. :try_end_b} :catchall_c

    throw p0

    :catchall_c
    move-exception p0

    goto :goto_a
.end method

.method public removeMessage(Ljava/lang/String;)V
    .registers 5

    iget v0, p0, Lcom/leanplum/LeanplumInbox;->unreadCount:I

    invoke-virtual {p0, p1}, Lcom/leanplum/LeanplumInbox;->messageForId(Ljava/lang/String;)Lcom/leanplum/LeanplumInboxMessage;

    move-result-object v1

    if-eqz v1, :cond_10

    invoke-virtual {v1}, Lcom/leanplum/LeanplumInboxMessage;->isRead()Z

    move-result v1

    if-nez v1, :cond_10

    add-int/lit8 v0, v0, -0x1

    :cond_10
    iget-object v1, p0, Lcom/leanplum/LeanplumInbox;->messages:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lcom/leanplum/LeanplumInbox;->messages:Ljava/util/Map;

    const/4 v2, 0x1

    invoke-virtual {p0, v1, v0, v2}, Lcom/leanplum/LeanplumInbox;->update(Ljava/util/Map;IZ)V

    invoke-static {}, Lcom/leanplum/internal/Constants;->isNoop()Z

    move-result p0

    if-eqz p0, :cond_22

    return-void

    :cond_22
    invoke-static {}, Lcom/leanplum/internal/RequestBuilder;->withDeleteInboxMessageAction()Lcom/leanplum/internal/RequestBuilder;

    move-result-object p0

    const-string v0, "newsfeedMessageId"

    invoke-virtual {p0, v0, p1}, Lcom/leanplum/internal/RequestBuilder;->andParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/leanplum/internal/RequestBuilder;

    move-result-object p0

    invoke-virtual {p0}, Lcom/leanplum/internal/RequestBuilder;->create()Lcom/leanplum/internal/Request;

    move-result-object p0

    invoke-static {}, Lcom/leanplum/internal/RequestSender;->getInstance()Lcom/leanplum/internal/RequestSender;

    move-result-object p1

    invoke-virtual {p1, p0}, Lcom/leanplum/internal/RequestSender;->send(Lcom/leanplum/internal/Request;)V

    return-void
.end method

.method public removeSyncedHandler(Lcom/leanplum/callbacks/InboxSyncedCallback;)V
    .registers 3

    iget-object v0, p0, Lcom/leanplum/LeanplumInbox;->syncedCallbacks:Ljava/util/List;

    monitor-enter v0

    :try_start_3
    iget-object p0, p0, Lcom/leanplum/LeanplumInbox;->syncedCallbacks:Ljava/util/List;

    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    monitor-exit v0

    return-void

    :goto_a
    monitor-exit v0
    :try_end_b
    .catchall {:try_start_3 .. :try_end_b} :catchall_c

    throw p0

    :catchall_c
    move-exception p0

    goto :goto_a
.end method

.method public save()V
    .registers 5

    invoke-static {}, Lcom/leanplum/internal/Constants;->isNoop()Z

    move-result v0

    if-nez v0, :cond_14

    sget-boolean v0, Lcom/leanplum/internal/Constants;->allowStorageWithoutLegacyToken:Z

    if-nez v0, :cond_15

    invoke-static {}, Lcom/leanplum/internal/APIConfig;->getInstance()Lcom/leanplum/internal/APIConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/leanplum/internal/APIConfig;->token()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_15

    :cond_14
    return-void

    :cond_15
    invoke-static {}, Lcom/leanplum/Leanplum;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "__leanplum__"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iget-object p0, p0, Lcom/leanplum/LeanplumInbox;->messages:Ljava/util/Map;

    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_33
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_53

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/leanplum/LeanplumInboxMessage;

    invoke-virtual {v2}, Lcom/leanplum/LeanplumInboxMessage;->toJsonMap()Ljava/util/Map;

    move-result-object v2

    invoke-virtual {v1, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_33

    :cond_53
    invoke-static {v1}, Lcom/leanplum/internal/JsonConverter;->toJson(Ljava/util/Map;)Ljava/lang/String;

    move-result-object p0

    new-instance v1, Lcom/leanplum/internal/AESCrypt;

    invoke-static {}, Lcom/leanplum/internal/APIConfig;->getInstance()Lcom/leanplum/internal/APIConfig;

    move-result-object v2

    invoke-virtual {v2}, Lcom/leanplum/internal/APIConfig;->appId()Ljava/lang/String;

    move-result-object v2

    invoke-static {}, Lcom/leanplum/internal/APIConfig;->getInstance()Lcom/leanplum/internal/APIConfig;

    move-result-object v3

    invoke-virtual {v3}, Lcom/leanplum/internal/APIConfig;->token()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/leanplum/internal/AESCrypt;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "__leanplum_newsfeed"

    invoke-virtual {v1, p0}, Lcom/leanplum/internal/AESCrypt;->encrypt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, v2, p0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-static {v0}, Lcom/leanplum/utils/SharedPreferencesUtil;->commitChanges(Landroid/content/SharedPreferences$Editor;)V

    return-void
.end method

.method public triggerChanged()V
    .registers 4

    iget-object v0, p0, Lcom/leanplum/LeanplumInbox;->changedCallbacks:Ljava/util/List;

    monitor-enter v0

    :try_start_3
    iget-object p0, p0, Lcom/leanplum/LeanplumInbox;->changedCallbacks:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_9
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1d

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/leanplum/callbacks/InboxChangedCallback;

    invoke-static {}, Lcom/leanplum/internal/OperationQueue;->sharedInstance()Lcom/leanplum/internal/OperationQueue;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/leanplum/internal/OperationQueue;->addUiOperation(Ljava/lang/Runnable;)V

    goto :goto_9

    :cond_1d
    monitor-exit v0

    return-void

    :goto_1f
    monitor-exit v0
    :try_end_20
    .catchall {:try_start_3 .. :try_end_20} :catchall_21

    throw p0

    :catchall_21
    move-exception p0

    goto :goto_1f
.end method

.method public triggerInboxSyncedWithStatus(Z)V
    .registers 5

    iget-object v0, p0, Lcom/leanplum/LeanplumInbox;->changedCallbacks:Ljava/util/List;

    monitor-enter v0

    :try_start_3
    iget-object p0, p0, Lcom/leanplum/LeanplumInbox;->syncedCallbacks:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_9
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_20

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/leanplum/callbacks/InboxSyncedCallback;

    invoke-virtual {v1, p1}, Lcom/leanplum/callbacks/InboxSyncedCallback;->setSuccess(Z)V

    invoke-static {}, Lcom/leanplum/internal/OperationQueue;->sharedInstance()Lcom/leanplum/internal/OperationQueue;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/leanplum/internal/OperationQueue;->addUiOperation(Ljava/lang/Runnable;)V

    goto :goto_9

    :cond_20
    monitor-exit v0

    return-void

    :goto_22
    monitor-exit v0
    :try_end_23
    .catchall {:try_start_3 .. :try_end_23} :catchall_24

    throw p0

    :catchall_24
    move-exception p0

    goto :goto_22
.end method

.method public unreadCount()I
    .registers 1

    iget p0, p0, Lcom/leanplum/LeanplumInbox;->unreadCount:I

    return p0
.end method

.method public unreadMessages()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/leanplum/LeanplumInboxMessage;",
            ">;"
        }
    .end annotation

    .line 39
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-direct {p0, v0}, Lcom/leanplum/LeanplumInbox;->unreadMessages(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public update(Ljava/util/Map;IZ)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/leanplum/LeanplumInboxMessage;",
            ">;IZ)V"
        }
    .end annotation

    :try_start_0
    iget-object v0, p0, Lcom/leanplum/LeanplumInbox;->updatingLock:Ljava/lang/Object;

    monitor-enter v0
    :try_end_3
    .catchall {:try_start_0 .. :try_end_3} :catchall_1a

    :try_start_3
    iput p2, p0, Lcom/leanplum/LeanplumInbox;->unreadCount:I

    if-eqz p1, :cond_9

    iput-object p1, p0, Lcom/leanplum/LeanplumInbox;->messages:Ljava/util/Map;

    :cond_9
    monitor-exit v0
    :try_end_a
    .catchall {:try_start_3 .. :try_end_a} :catchall_18

    const/4 p1, 0x1

    :try_start_b
    iput-boolean p1, p0, Lcom/leanplum/LeanplumInbox;->didLoad:Z

    if-eqz p3, :cond_12

    invoke-virtual {p0}, Lcom/leanplum/LeanplumInbox;->save()V

    :cond_12
    invoke-virtual {p0}, Lcom/leanplum/LeanplumInbox;->triggerChanged()V
    :try_end_15
    .catchall {:try_start_b .. :try_end_15} :catchall_1a

    return-void

    :goto_16
    :try_start_16
    monitor-exit v0
    :try_end_17
    .catchall {:try_start_16 .. :try_end_17} :catchall_18

    :try_start_17
    throw p0
    :try_end_18
    .catchall {:try_start_17 .. :try_end_18} :catchall_1a

    :catchall_18
    move-exception p0

    goto :goto_16

    :catchall_1a
    move-exception p0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return-void
.end method

.method public updateUnreadCount(I)V
    .registers 2

    iput p1, p0, Lcom/leanplum/LeanplumInbox;->unreadCount:I

    invoke-virtual {p0}, Lcom/leanplum/LeanplumInbox;->save()V

    invoke-virtual {p0}, Lcom/leanplum/LeanplumInbox;->triggerChanged()V

    return-void
.end method
