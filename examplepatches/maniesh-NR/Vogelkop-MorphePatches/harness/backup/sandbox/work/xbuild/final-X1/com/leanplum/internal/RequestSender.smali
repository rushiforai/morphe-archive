.class public Lcom/leanplum/internal/RequestSender;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static INSTANCE:Lcom/leanplum/internal/RequestSender;


# instance fields
.field private final batchFactory:Lcom/leanplum/internal/RequestBatchFactory;

.field private final eventCallbackManager:Lcom/leanplum/internal/LeanplumEventCallbackManager;

.field private final localErrors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field

.field private final uuidHelper:Lcom/leanplum/internal/RequestUuidHelper;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/leanplum/internal/RequestSender;

    invoke-direct {v0}, Lcom/leanplum/internal/RequestSender;-><init>()V

    sput-object v0, Lcom/leanplum/internal/RequestSender;->INSTANCE:Lcom/leanplum/internal/RequestSender;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/leanplum/internal/LeanplumEventCallbackManager;

    invoke-direct {v0}, Lcom/leanplum/internal/LeanplumEventCallbackManager;-><init>()V

    iput-object v0, p0, Lcom/leanplum/internal/RequestSender;->eventCallbackManager:Lcom/leanplum/internal/LeanplumEventCallbackManager;

    new-instance v0, Lcom/leanplum/internal/RequestBatchFactory;

    invoke-direct {v0}, Lcom/leanplum/internal/RequestBatchFactory;-><init>()V

    iput-object v0, p0, Lcom/leanplum/internal/RequestSender;->batchFactory:Lcom/leanplum/internal/RequestBatchFactory;

    new-instance v0, Lcom/leanplum/internal/RequestUuidHelper;

    invoke-direct {v0}, Lcom/leanplum/internal/RequestUuidHelper;-><init>()V

    iput-object v0, p0, Lcom/leanplum/internal/RequestSender;->uuidHelper:Lcom/leanplum/internal/RequestUuidHelper;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/leanplum/internal/RequestSender;->localErrors:Ljava/util/List;

    return-void
.end method

.method public static synthetic access$000(Lcom/leanplum/internal/RequestSender;Lcom/leanplum/internal/Request;)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/leanplum/internal/RequestSender;->sendSync(Lcom/leanplum/internal/Request;)V

    return-void
.end method

.method private addLocalError(Lcom/leanplum/internal/Request;)V
    .registers 2

    invoke-static {p1}, Lcom/leanplum/internal/RequestSender;->createArgsDictionary(Lcom/leanplum/internal/Request;)Ljava/util/Map;

    move-result-object p1

    iget-object p0, p0, Lcom/leanplum/internal/RequestSender;->localErrors:Ljava/util/List;

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public static createArgsDictionary(Lcom/leanplum/internal/Request;)Ljava/util/Map;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/leanplum/internal/Request;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {}, Lcom/leanplum/internal/APIConfig;->getInstance()Lcom/leanplum/internal/APIConfig;

    move-result-object v1

    invoke-virtual {v1}, Lcom/leanplum/internal/APIConfig;->deviceId()Ljava/lang/String;

    move-result-object v1

    const-string v2, "deviceId"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Lcom/leanplum/internal/APIConfig;->getInstance()Lcom/leanplum/internal/APIConfig;

    move-result-object v1

    invoke-virtual {v1}, Lcom/leanplum/internal/APIConfig;->userId()Ljava/lang/String;

    move-result-object v1

    const-string v2, "userId"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "action"

    invoke-virtual {p0}, Lcom/leanplum/internal/Request;->getApiAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "sdkVersion"

    sget-object v2, Lcom/leanplum/internal/Constants;->LEANPLUM_VERSION:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-boolean v1, Lcom/leanplum/internal/Constants;->isDevelopmentModeEnabled:Z

    invoke-static {v1}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v1

    const-string v2, "devMode"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    long-to-double v1, v1

    const-wide v3, 0x408f400000000000L    # 1000.0

    div-double/2addr v1, v3

    invoke-static {v1, v2}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object v1

    const-string v2, "time"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "reqId"

    invoke-virtual {p0}, Lcom/leanplum/internal/Request;->getRequestId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Lcom/leanplum/internal/APIConfig;->getInstance()Lcom/leanplum/internal/APIConfig;

    move-result-object v1

    invoke-virtual {v1}, Lcom/leanplum/internal/APIConfig;->token()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_6b

    const-string v2, "token"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_6b
    invoke-virtual {p0}, Lcom/leanplum/internal/Request;->getParams()Ljava/util/Map;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    return-object v0
.end method

.method private createNextBatch()Lcom/leanplum/internal/RequestBatch;
    .registers 3

    iget-object v0, p0, Lcom/leanplum/internal/RequestSender;->localErrors:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iget-object v1, p0, Lcom/leanplum/internal/RequestSender;->batchFactory:Lcom/leanplum/internal/RequestBatchFactory;

    if-lez v0, :cond_11

    iget-object p0, p0, Lcom/leanplum/internal/RequestSender;->localErrors:Ljava/util/List;

    invoke-virtual {v1, p0}, Lcom/leanplum/internal/RequestBatchFactory;->createErrorBatch(Ljava/util/List;)Lcom/leanplum/internal/RequestBatch;

    move-result-object p0

    return-object p0

    :cond_11
    invoke-virtual {v1}, Lcom/leanplum/internal/RequestBatchFactory;->createNextBatch()Lcom/leanplum/internal/RequestBatch;

    move-result-object p0

    return-object p0
.end method

.method public static getInstance()Lcom/leanplum/internal/RequestSender;
    .registers 1

    sget-object v0, Lcom/leanplum/internal/RequestSender;->INSTANCE:Lcom/leanplum/internal/RequestSender;

    return-object v0
.end method

.method private handleDatabaseError(Lcom/leanplum/internal/Request;)Z
    .registers 4

    invoke-static {}, Lcom/leanplum/internal/LeanplumEventDataManager;->sharedInstance()Lcom/leanplum/internal/LeanplumEventDataManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/leanplum/internal/LeanplumEventDataManager;->hasDatabaseError()Z

    move-result v0

    if-eqz v0, :cond_1b

    const-string v0, "log"

    invoke-virtual {p1}, Lcom/leanplum/internal/Request;->getApiAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_19

    invoke-direct {p0, p1}, Lcom/leanplum/internal/RequestSender;->addLocalError(Lcom/leanplum/internal/Request;)V

    :cond_19
    const/4 p0, 0x1

    return p0

    :cond_1b
    const/4 p0, 0x0

    return p0
.end method

.method private invokeCallbacksWithError(Ljava/lang/Exception;)V
    .registers 2
    .param p1    # Ljava/lang/Exception;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    iget-object p0, p0, Lcom/leanplum/internal/RequestSender;->eventCallbackManager:Lcom/leanplum/internal/LeanplumEventCallbackManager;

    invoke-virtual {p0, p1}, Lcom/leanplum/internal/LeanplumEventCallbackManager;->invokeAllCallbacksWithError(Ljava/lang/Exception;)V

    return-void
.end method

.method private saveRequest(Lcom/leanplum/internal/Request;)V
    .registers 4

    invoke-direct {p0, p1}, Lcom/leanplum/internal/RequestSender;->handleDatabaseError(Lcom/leanplum/internal/Request;)Z

    move-result v0

    if-nez v0, :cond_2b

    invoke-static {p1}, Lcom/leanplum/internal/RequestSender;->createArgsDictionary(Lcom/leanplum/internal/Request;)Ljava/util/Map;

    move-result-object v0

    :try_start_a
    iget-object v1, p0, Lcom/leanplum/internal/RequestSender;->uuidHelper:Lcom/leanplum/internal/RequestUuidHelper;

    invoke-virtual {v1, v0}, Lcom/leanplum/internal/RequestUuidHelper;->attachUuid(Ljava/util/Map;)Z

    move-result v1

    if-eqz v1, :cond_2b

    invoke-static {}, Lcom/leanplum/internal/LeanplumEventDataManager;->sharedInstance()Lcom/leanplum/internal/LeanplumEventDataManager;

    move-result-object v1

    invoke-static {v0}, Lcom/leanplum/internal/JsonConverter;->toJson(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/leanplum/internal/LeanplumEventDataManager;->insertEvent(Ljava/lang/String;)V

    iget-object v0, p1, Lcom/leanplum/internal/Request;->response:Lcom/leanplum/internal/Request$ResponseCallback;

    if-nez v0, :cond_2c

    iget-object v0, p1, Lcom/leanplum/internal/Request;->error:Lcom/leanplum/internal/Request$ErrorCallback;

    if-eqz v0, :cond_2b

    invoke-static {}, Lcom/leanplum/internal/Util;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_2c

    :cond_2b
    return-void

    :cond_2c
    iget-object p0, p0, Lcom/leanplum/internal/RequestSender;->eventCallbackManager:Lcom/leanplum/internal/LeanplumEventCallbackManager;

    iget-object v0, p1, Lcom/leanplum/internal/Request;->response:Lcom/leanplum/internal/Request$ResponseCallback;

    iget-object v1, p1, Lcom/leanplum/internal/Request;->error:Lcom/leanplum/internal/Request$ErrorCallback;

    invoke-virtual {p0, p1, v0, v1}, Lcom/leanplum/internal/LeanplumEventCallbackManager;->addCallbacks(Lcom/leanplum/internal/Request;Lcom/leanplum/internal/Request$ResponseCallback;Lcom/leanplum/internal/Request$ErrorCallback;)V
    :try_end_35
    .catchall {:try_start_a .. :try_end_35} :catchall_36

    return-void

    :catchall_36
    move-exception p0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return-void
.end method

.method private sendSync(Lcom/leanplum/internal/Request;)V
    .registers 4
    .param p1    # Lcom/leanplum/internal/Request;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    sget-boolean v0, Lcom/leanplum/internal/Constants;->isTestMode:Z

    if-nez v0, :cond_20

    invoke-direct {p0, p1}, Lcom/leanplum/internal/RequestSender;->saveRequest(Lcom/leanplum/internal/Request;)V

    sget-boolean v0, Lcom/leanplum/internal/Constants;->isDevelopmentModeEnabled:Z

    if-nez v0, :cond_17

    sget-object v0, Lcom/leanplum/internal/Request$RequestType;->IMMEDIATE:Lcom/leanplum/internal/Request$RequestType;

    invoke-virtual {p1}, Lcom/leanplum/internal/Request;->getType()Lcom/leanplum/internal/Request$RequestType;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_20

    :cond_17
    :try_start_17
    invoke-direct {p0, p1}, Lcom/leanplum/internal/RequestSender;->validateConfig(Lcom/leanplum/internal/Request;)Z

    move-result p1

    if-eqz p1, :cond_20

    invoke-virtual {p0}, Lcom/leanplum/internal/RequestSender;->sendRequests()V
    :try_end_20
    .catchall {:try_start_17 .. :try_end_20} :catchall_21

    :cond_20
    return-void

    :catchall_21
    move-exception p0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static setInstance(Lcom/leanplum/internal/RequestSender;)V
    .registers 1

    sput-object p0, Lcom/leanplum/internal/RequestSender;->INSTANCE:Lcom/leanplum/internal/RequestSender;

    return-void
.end method

.method private validateConfig(Lcom/leanplum/internal/Request;)Z
    .registers 4
    .param p1    # Lcom/leanplum/internal/Request;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    invoke-static {}, Lcom/leanplum/internal/APIConfig;->getInstance()Lcom/leanplum/internal/APIConfig;

    move-result-object p0

    invoke-virtual {p0}, Lcom/leanplum/internal/APIConfig;->appId()Ljava/lang/String;

    move-result-object p0

    const/4 v0, 0x0

    if-nez p0, :cond_13

    const-string p0, "Cannot send request. appId is not set."

    new-array p1, v0, [Ljava/lang/Object;

    invoke-static {p0, p1}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return v0

    :cond_13
    invoke-static {}, Lcom/leanplum/internal/APIConfig;->getInstance()Lcom/leanplum/internal/APIConfig;

    move-result-object p0

    invoke-virtual {p0}, Lcom/leanplum/internal/APIConfig;->accessKey()Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_25

    const-string p0, "Cannot send request. accessKey is not set."

    new-array p1, v0, [Ljava/lang/Object;

    invoke-static {p0, p1}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return v0

    :cond_25
    invoke-static {}, Lcom/leanplum/internal/Util;->isConnected()Z

    move-result p0

    if-nez p0, :cond_41

    const-string p0, "Device is offline, will try sending requests again later."

    new-array v1, v0, [Ljava/lang/Object;

    invoke-static {p0, v1}, Lcom/leanplum/internal/Log;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object p0, p1, Lcom/leanplum/internal/Request;->error:Lcom/leanplum/internal/Request$ErrorCallback;

    if-eqz p0, :cond_40

    new-instance p1, Ljava/lang/Exception;

    const-string v1, "Leanplum: device is offline"

    invoke-direct {p1, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    invoke-interface {p0, p1}, Lcom/leanplum/internal/Request$ErrorCallback;->error(Ljava/lang/Exception;)V

    :cond_40
    return v0

    :cond_41
    const/4 p0, 0x1

    return p0
.end method


# virtual methods
.method public invokeCallbacks(Lorg/json/JSONObject;)V
    .registers 2
    .param p1    # Lorg/json/JSONObject;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    iget-object p0, p0, Lcom/leanplum/internal/RequestSender;->eventCallbackManager:Lcom/leanplum/internal/LeanplumEventCallbackManager;

    invoke-virtual {p0, p1}, Lcom/leanplum/internal/LeanplumEventCallbackManager;->invokeCallbacks(Lorg/json/JSONObject;)V

    return-void
.end method

.method public send(Lcom/leanplum/internal/Request;)V
    .registers 4
    .param p1    # Lcom/leanplum/internal/Request;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    invoke-static {}, Lcom/leanplum/internal/OperationQueue;->sharedInstance()Lcom/leanplum/internal/OperationQueue;

    move-result-object v0

    new-instance v1, Lcom/leanplum/internal/RequestSender$1;

    invoke-direct {v1, p0, p1}, Lcom/leanplum/internal/RequestSender$1;-><init>(Lcom/leanplum/internal/RequestSender;Lcom/leanplum/internal/Request;)V

    invoke-virtual {v0, v1}, Lcom/leanplum/internal/OperationQueue;->addOperation(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public sendRequests()V
    .registers 15

    const-string v1, "\n"

    const-string v2, "Error parsing JSON response: "

    const-string v3, "Unable to send request: "

    const-string v0, "HTTP error "

    invoke-static {}, Lcom/leanplum/Leanplum;->countAggregator()Lcom/leanplum/internal/CountAggregator;

    move-result-object v4

    invoke-virtual {v4}, Lcom/leanplum/internal/CountAggregator;->sendAllCounts()V

    invoke-direct {p0}, Lcom/leanplum/internal/RequestSender;->createNextBatch()Lcom/leanplum/internal/RequestBatch;

    move-result-object v4

    invoke-virtual {v4}, Lcom/leanplum/internal/RequestBatch;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_14f

    new-instance v9, Ljava/util/HashMap;

    invoke-direct {v9}, Ljava/util/HashMap;-><init>()V

    invoke-static {}, Lcom/leanplum/internal/APIConfig;->getInstance()Lcom/leanplum/internal/APIConfig;

    move-result-object v5

    invoke-virtual {v5, v9}, Lcom/leanplum/internal/APIConfig;->attachApiKeys(Ljava/util/Map;)Z

    move-result v5

    if-eqz v5, :cond_14f

    const-string v5, "data"

    invoke-virtual {v4}, Lcom/leanplum/internal/RequestBatch;->getJson()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v9, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v5, "sdkVersion"

    sget-object v6, Lcom/leanplum/internal/Constants;->LEANPLUM_VERSION:Ljava/lang/String;

    invoke-virtual {v9, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v5, "action"

    const-string v6, "multi"

    invoke-virtual {v9, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v5, Ljava/util/Date;

    invoke-direct {v5}, Ljava/util/Date;-><init>()V

    invoke-virtual {v5}, Ljava/util/Date;->getTime()J

    move-result-wide v5

    long-to-double v5, v5

    const-wide v7, 0x408f400000000000L    # 1000.0

    div-double/2addr v5, v7

    invoke-static {v5, v6}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object v5

    const-string v6, "time"

    invoke-virtual {v9, v6, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v5, 0x0

    const/4 v13, 0x0

    :try_start_5a
    new-instance v6, Lcom/leanplum/internal/http/NetworkOperation;

    sget-object v7, Lcom/leanplum/internal/Constants;->API_HOST_NAME:Ljava/lang/String;

    sget-object v8, Lcom/leanplum/internal/Constants;->API_SERVLET:Ljava/lang/String;

    const-string v10, "POST"

    sget-boolean v11, Lcom/leanplum/internal/Constants;->API_SSL:Z

    sget v12, Lcom/leanplum/internal/Constants;->NETWORK_TIMEOUT_SECONDS:I

    invoke-direct/range {v6 .. v12}, Lcom/leanplum/internal/http/NetworkOperation;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;ZI)V
    :try_end_69
    .catch Lorg/json/JSONException; {:try_start_5a .. :try_end_69} :catch_114
    .catch Ljava/lang/Exception; {:try_start_5a .. :try_end_69} :catch_ee
    .catchall {:try_start_5a .. :try_end_69} :catchall_142

    :try_start_69
    invoke-virtual {v6}, Lcom/leanplum/internal/http/LeanplumHttpConnection;->getJsonResponse()Lorg/json/JSONObject;

    move-result-object v7

    invoke-virtual {v6}, Lcom/leanplum/internal/http/LeanplumHttpConnection;->getResponseCode()I

    move-result v8

    const/16 v9, 0xc8

    if-lt v8, v9, :cond_90

    const/16 v9, 0x12b

    if-gt v8, v9, :cond_90

    invoke-virtual {p0, v7}, Lcom/leanplum/internal/RequestSender;->invokeCallbacks(Lorg/json/JSONObject;)V

    iget-object v0, p0, Lcom/leanplum/internal/RequestSender;->localErrors:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    iget-object v0, p0, Lcom/leanplum/internal/RequestSender;->batchFactory:Lcom/leanplum/internal/RequestBatchFactory;

    invoke-virtual {v0, v4}, Lcom/leanplum/internal/RequestBatchFactory;->deleteFinishedBatch(Lcom/leanplum/internal/RequestBatch;)V

    invoke-virtual {v4}, Lcom/leanplum/internal/RequestBatch;->isFull()Z

    move-result v0

    if-eqz v0, :cond_df

    invoke-virtual {p0}, Lcom/leanplum/internal/RequestSender;->sendRequests()V

    goto :goto_df

    :cond_90
    new-instance v9, Ljava/lang/Exception;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v9, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    if-eqz v7, :cond_bf

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " "

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_bf
    new-array v7, v5, [Ljava/lang/Object;

    invoke-static {v0, v7}, Lcom/leanplum/internal/Log;->i(Ljava/lang/String;[Ljava/lang/Object;)V

    const/4 v0, -0x1

    if-eq v8, v0, :cond_dc

    const/16 v0, 0x198

    if-eq v8, v0, :cond_dc

    const/16 v0, 0x1ad

    if-eq v8, v0, :cond_dc

    const/16 v0, 0x1f4

    if-lt v8, v0, :cond_d7

    const/16 v0, 0x257

    if-le v8, v0, :cond_dc

    :cond_d7
    iget-object v0, p0, Lcom/leanplum/internal/RequestSender;->batchFactory:Lcom/leanplum/internal/RequestBatchFactory;

    invoke-virtual {v0, v4}, Lcom/leanplum/internal/RequestBatchFactory;->deleteFinishedBatch(Lcom/leanplum/internal/RequestBatch;)V

    :cond_dc
    invoke-direct {p0, v9}, Lcom/leanplum/internal/RequestSender;->invokeCallbacksWithError(Ljava/lang/Exception;)V
    :try_end_df
    .catch Lorg/json/JSONException; {:try_start_69 .. :try_end_df} :catch_eb
    .catch Ljava/lang/Exception; {:try_start_69 .. :try_end_df} :catch_e8
    .catchall {:try_start_69 .. :try_end_df} :catchall_e4

    :cond_df
    :goto_df
    :try_start_df
    invoke-virtual {v6}, Lcom/leanplum/internal/http/LeanplumHttpConnection;->disconnect()V
    :try_end_e2
    .catchall {:try_start_df .. :try_end_e2} :catchall_14a

    goto/16 :goto_14f

    :catchall_e4
    move-exception v0

    move-object p0, v0

    move-object v13, v6

    goto :goto_144

    :catch_e8
    move-exception v0

    move-object v13, v6

    goto :goto_ef

    :catch_eb
    move-exception v0

    move-object v13, v6

    goto :goto_115

    :catch_ee
    move-exception v0

    :goto_ef
    :try_start_ef
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v0}, Lcom/leanplum/internal/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-array v2, v5, [Ljava/lang/Object;

    invoke-static {v1, v2}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-direct {p0, v0}, Lcom/leanplum/internal/RequestSender;->invokeCallbacksWithError(Ljava/lang/Exception;)V

    if-eqz v13, :cond_14f

    goto :goto_13e

    :catch_114
    move-exception v0

    :goto_115
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v0}, Lcom/leanplum/internal/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-array v2, v5, [Ljava/lang/Object;

    invoke-static {v1, v2}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/leanplum/internal/RequestSender;->batchFactory:Lcom/leanplum/internal/RequestBatchFactory;

    invoke-virtual {v1, v4}, Lcom/leanplum/internal/RequestBatchFactory;->deleteFinishedBatch(Lcom/leanplum/internal/RequestBatch;)V

    invoke-direct {p0, v0}, Lcom/leanplum/internal/RequestSender;->invokeCallbacksWithError(Ljava/lang/Exception;)V
    :try_end_13c
    .catchall {:try_start_ef .. :try_end_13c} :catchall_142

    if-eqz v13, :cond_14f

    :goto_13e
    :try_start_13e
    invoke-virtual {v13}, Lcom/leanplum/internal/http/LeanplumHttpConnection;->disconnect()V

    goto :goto_14f

    :catchall_142
    move-exception v0

    move-object p0, v0

    :goto_144
    if-eqz v13, :cond_149

    invoke-virtual {v13}, Lcom/leanplum/internal/http/LeanplumHttpConnection;->disconnect()V

    :cond_149
    throw p0
    :try_end_14a
    .catchall {:try_start_13e .. :try_end_14a} :catchall_14a

    :catchall_14a
    move-exception v0

    move-object p0, v0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    :cond_14f
    :goto_14f
    return-void
.end method
