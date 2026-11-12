.class public Lcom/leanplum/Leanplum;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final ACTION_KIND_ACTION:I = 0x2

.field public static final ACTION_KIND_MESSAGE:I = 0x1

.field private static final LEANPLUM_NOTIFICATION_CHANNEL:Ljava/lang/String; = "com.leanplum.LeanplumNotificationChannel"

.field private static final LEANPLUM_PUSH_SERVICE:Ljava/lang/String; = "com.leanplum.LeanplumPushService"

.field public static final PURCHASE_EVENT_NAME:Ljava/lang/String; = "Purchase"

.field private static context:Landroid/content/Context;

.field private static countAggregator:Lcom/leanplum/internal/CountAggregator;

.field private static customAppVersion:Ljava/lang/String;

.field private static volatile customCountryCode:Ljava/lang/String;

.field private static customDeviceId:Ljava/lang/String;

.field private static customParams:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private static deviceIdMode:Lcom/leanplum/LeanplumDeviceIdMode;

.field private static featureFlagManager:Lcom/leanplum/internal/FeatureFlagManager;

.field private static final heartbeatLock:Ljava/lang/Object;

.field private static locationCollectionEnabled:Z

.field private static final messageDisplayedHandlers:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/leanplum/callbacks/MessageDisplayedCallback;",
            ">;"
        }
    .end annotation
.end field

.field private static final noDownloadsHandlers:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/leanplum/callbacks/VariablesChangedCallback;",
            ">;"
        }
    .end annotation
.end field

.field private static final onceNoDownloadsHandlers:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/leanplum/callbacks/VariablesChangedCallback;",
            ">;"
        }
    .end annotation
.end field

.field private static volatile pushDeliveryTrackingEnabled:Z

.field private static registerDeviceFinishedHandler:Lcom/leanplum/callbacks/RegisterDeviceFinishedCallback;

.field private static registerDeviceHandler:Lcom/leanplum/callbacks/RegisterDeviceCallback;

.field private static final startHandlers:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/leanplum/callbacks/StartCallback;",
            ">;"
        }
    .end annotation
.end field

.field private static userSpecifiedDeviceId:Z

.field private static final variablesChangedHandlers:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/leanplum/callbacks/VariablesChangedCallback;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/leanplum/Leanplum;->startHandlers:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/leanplum/Leanplum;->variablesChangedHandlers:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/leanplum/Leanplum;->noDownloadsHandlers:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/leanplum/Leanplum;->onceNoDownloadsHandlers:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/leanplum/Leanplum;->messageDisplayedHandlers:Ljava/util/ArrayList;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/leanplum/Leanplum;->heartbeatLock:Ljava/lang/Object;

    sget-object v0, Lcom/leanplum/LeanplumDeviceIdMode;->MD5_MAC_ADDRESS:Lcom/leanplum/LeanplumDeviceIdMode;

    sput-object v0, Lcom/leanplum/Leanplum;->deviceIdMode:Lcom/leanplum/LeanplumDeviceIdMode;

    const/4 v0, 0x0

    sput-object v0, Lcom/leanplum/Leanplum;->customAppVersion:Ljava/lang/String;

    const/4 v0, 0x1

    sput-boolean v0, Lcom/leanplum/Leanplum;->locationCollectionEnabled:Z

    sput-boolean v0, Lcom/leanplum/Leanplum;->pushDeliveryTrackingEnabled:Z

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/leanplum/Leanplum;->customParams:Ljava/util/Map;

    new-instance v0, Lcom/leanplum/internal/CountAggregator;

    invoke-direct {v0}, Lcom/leanplum/internal/CountAggregator;-><init>()V

    sput-object v0, Lcom/leanplum/Leanplum;->countAggregator:Lcom/leanplum/internal/CountAggregator;

    sget-object v0, Lcom/leanplum/internal/FeatureFlagManager;->INSTANCE:Lcom/leanplum/internal/FeatureFlagManager;

    sput-object v0, Lcom/leanplum/Leanplum;->featureFlagManager:Lcom/leanplum/internal/FeatureFlagManager;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static synthetic access$000()V
    .registers 0

    invoke-static {}, Lcom/leanplum/Leanplum;->triggerVariablesChanged()V

    return-void
.end method

.method public static synthetic access$100(Ljava/lang/String;Ljava/util/Map;Z)V
    .registers 3

    invoke-static {p0, p1, p2}, Lcom/leanplum/Leanplum;->startHelper(Ljava/lang/String;Ljava/util/Map;Z)V

    return-void
.end method

.method public static synthetic access$1000(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;)V
    .registers 3

    invoke-static {p0, p1, p2}, Lcom/leanplum/Leanplum;->advanceToInternal(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;)V

    return-void
.end method

.method public static synthetic access$1100()V
    .registers 0

    invoke-static {}, Lcom/leanplum/Leanplum;->pauseStateInternal()V

    return-void
.end method

.method public static synthetic access$1200()V
    .registers 0

    invoke-static {}, Lcom/leanplum/Leanplum;->resumeStateInternal()V

    return-void
.end method

.method public static synthetic access$1300(Lorg/json/JSONObject;)V
    .registers 1

    invoke-static {p0}, Lcom/leanplum/Leanplum;->applyContentInResponse(Lorg/json/JSONObject;)V

    return-void
.end method

.method public static synthetic access$1400(Lorg/json/JSONObject;)V
    .registers 1

    invoke-static {p0}, Lcom/leanplum/Leanplum;->parseVariantDebugInfo(Lorg/json/JSONObject;)V

    return-void
.end method

.method public static synthetic access$200(Lorg/json/JSONObject;)V
    .registers 1

    invoke-static {p0}, Lcom/leanplum/Leanplum;->handleStartResponse(Lorg/json/JSONObject;)V

    return-void
.end method

.method public static synthetic access$300()Lcom/leanplum/callbacks/RegisterDeviceFinishedCallback;
    .registers 1

    sget-object v0, Lcom/leanplum/Leanplum;->registerDeviceFinishedHandler:Lcom/leanplum/callbacks/RegisterDeviceFinishedCallback;

    return-object v0
.end method

.method public static synthetic access$400()Landroid/content/Context;
    .registers 1

    sget-object v0, Lcom/leanplum/Leanplum;->context:Landroid/content/Context;

    return-object v0
.end method

.method public static synthetic access$500()V
    .registers 0

    invoke-static {}, Lcom/leanplum/Leanplum;->pauseInternal()V

    return-void
.end method

.method public static synthetic access$600()V
    .registers 0

    invoke-static {}, Lcom/leanplum/Leanplum;->resumeInternal()V

    return-void
.end method

.method public static synthetic access$700()V
    .registers 0

    invoke-static {}, Lcom/leanplum/Leanplum;->stopInternal()V

    return-void
.end method

.method public static synthetic access$800(Ljava/lang/String;Ljava/util/HashMap;)V
    .registers 2

    invoke-static {p0, p1}, Lcom/leanplum/Leanplum;->setUserAttributesInternal(Ljava/lang/String;Ljava/util/HashMap;)V

    return-void
.end method

.method public static synthetic access$900(Ljava/util/HashMap;)V
    .registers 1

    invoke-static {p0}, Lcom/leanplum/Leanplum;->setTrafficSourceInfoInternal(Ljava/util/HashMap;)V

    return-void
.end method

.method public static addMessageDisplayedHandler(Lcom/leanplum/callbacks/MessageDisplayedCallback;)V
    .registers 2

    if-nez p0, :cond_b

    const-string p0, "addMessageDisplayedHandler - Invalid handler parameter provided."

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {p0, v0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_b
    sget-object v0, Lcom/leanplum/Leanplum;->messageDisplayedHandlers:Ljava/util/ArrayList;

    monitor-enter v0

    :try_start_e
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    monitor-exit v0

    return-void

    :goto_13
    monitor-exit v0
    :try_end_14
    .catchall {:try_start_e .. :try_end_14} :catchall_15

    throw p0

    :catchall_15
    move-exception p0

    goto :goto_13
.end method

.method public static addOnceVariablesChangedAndNoDownloadsPendingHandler(Lcom/leanplum/callbacks/VariablesChangedCallback;)V
    .registers 2

    if-nez p0, :cond_b

    const-string p0, "addOnceVariablesChangedAndNoDownloadsPendingHandler - Invalid handler parameter provided."

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {p0, v0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_b
    invoke-static {}, Lcom/leanplum/internal/VarCache;->hasReceivedDiffs()Z

    move-result v0

    if-eqz v0, :cond_1f

    invoke-static {}, Lcom/leanplum/internal/FileTransferManager;->getInstance()Lcom/leanplum/internal/FileTransferManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/leanplum/internal/FileTransferManager;->numPendingDownloads()I

    move-result v0

    if-nez v0, :cond_1f

    invoke-virtual {p0}, Lcom/leanplum/callbacks/VariablesChangedCallback;->variablesChanged()V

    return-void

    :cond_1f
    sget-object v0, Lcom/leanplum/Leanplum;->onceNoDownloadsHandlers:Ljava/util/ArrayList;

    monitor-enter v0

    :try_start_22
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    monitor-exit v0

    return-void

    :goto_27
    monitor-exit v0
    :try_end_28
    .catchall {:try_start_22 .. :try_end_28} :catchall_29

    throw p0

    :catchall_29
    move-exception p0

    goto :goto_27
.end method

.method public static addStartResponseHandler(Lcom/leanplum/callbacks/StartCallback;)V
    .registers 4

    if-nez p0, :cond_b

    const-string p0, "addStartResponseHandler - Invalid handler parameter provided."

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {p0, v0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_b
    invoke-static {}, Lcom/leanplum/internal/LeanplumInternal;->hasStarted()Z

    move-result v0

    if-eqz v0, :cond_1f

    invoke-static {}, Lcom/leanplum/internal/LeanplumInternal;->isStartSuccessful()Z

    move-result v0

    if-eqz v0, :cond_1b

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/leanplum/callbacks/StartCallback;->setSuccess(Z)V

    :cond_1b
    invoke-virtual {p0}, Lcom/leanplum/callbacks/StartCallback;->run()V

    return-void

    :cond_1f
    sget-object v0, Lcom/leanplum/Leanplum;->startHandlers:Ljava/util/ArrayList;

    monitor-enter v0

    :try_start_22
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_2c

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_2c
    monitor-exit v0

    return-void

    :goto_2e
    monitor-exit v0
    :try_end_2f
    .catchall {:try_start_22 .. :try_end_2f} :catchall_30

    throw p0

    :catchall_30
    move-exception p0

    goto :goto_2e
.end method

.method public static addVariablesChangedAndNoDownloadsPendingHandler(Lcom/leanplum/callbacks/VariablesChangedCallback;)V
    .registers 2

    if-nez p0, :cond_b

    const-string p0, "addVariablesChangedAndNoDownloadsPendingHandler - Invalid handler parameter provided."

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {p0, v0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_b
    sget-object v0, Lcom/leanplum/Leanplum;->noDownloadsHandlers:Ljava/util/ArrayList;

    monitor-enter v0

    :try_start_e
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    monitor-exit v0
    :try_end_12
    .catchall {:try_start_e .. :try_end_12} :catchall_28

    invoke-static {}, Lcom/leanplum/internal/VarCache;->hasReceivedDiffs()Z

    move-result v0

    if-eqz v0, :cond_25

    invoke-static {}, Lcom/leanplum/internal/FileTransferManager;->getInstance()Lcom/leanplum/internal/FileTransferManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/leanplum/internal/FileTransferManager;->numPendingDownloads()I

    move-result v0

    if-nez v0, :cond_25

    invoke-virtual {p0}, Lcom/leanplum/callbacks/VariablesChangedCallback;->variablesChanged()V

    :cond_25
    return-void

    :goto_26
    :try_start_26
    monitor-exit v0
    :try_end_27
    .catchall {:try_start_26 .. :try_end_27} :catchall_28

    throw p0

    :catchall_28
    move-exception p0

    goto :goto_26
.end method

.method public static addVariablesChangedHandler(Lcom/leanplum/callbacks/VariablesChangedCallback;)V
    .registers 2

    if-nez p0, :cond_b

    const-string p0, "addVariablesChangedHandler - Invalid handler parameter provided."

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {p0, v0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_b
    sget-object v0, Lcom/leanplum/Leanplum;->variablesChangedHandlers:Ljava/util/ArrayList;

    monitor-enter v0

    :try_start_e
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    monitor-exit v0
    :try_end_12
    .catchall {:try_start_e .. :try_end_12} :catchall_1e

    invoke-static {}, Lcom/leanplum/internal/VarCache;->hasReceivedDiffs()Z

    move-result v0

    if-eqz v0, :cond_1b

    invoke-virtual {p0}, Lcom/leanplum/callbacks/VariablesChangedCallback;->variablesChanged()V

    :cond_1b
    return-void

    :goto_1c
    :try_start_1c
    monitor-exit v0
    :try_end_1d
    .catchall {:try_start_1c .. :try_end_1d} :catchall_1e

    throw p0

    :catchall_1e
    move-exception p0

    goto :goto_1c
.end method

.method public static advanceTo(Ljava/lang/String;)V
    .registers 3

    .line 78
    const-string v0, ""

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lcom/leanplum/Leanplum;->advanceTo(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public static advanceTo(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3

    const/4 v0, 0x0

    .line 79
    invoke-static {p0, p1, v0}, Lcom/leanplum/Leanplum;->advanceTo(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public static advanceTo(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "*>;)V"
        }
    .end annotation

    const-string v0, "params"

    invoke-static {}, Lcom/leanplum/internal/Constants;->isNoop()Z

    move-result v1

    if-eqz v1, :cond_9

    return-void

    :cond_9
    invoke-static {}, Lcom/leanplum/internal/LeanplumInternal;->hasCalledStart()Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_18

    const-string p0, "You cannot call advanceTo before calling start"

    new-array p1, v2, [Ljava/lang/Object;

    invoke-static {p0, p1}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_18
    :try_start_18
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    const-string v3, "info"

    invoke-virtual {v1, v3, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "state"

    invoke-virtual {v1, p1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz p2, :cond_35

    invoke-static {p2, v0, v2}, Lcom/leanplum/internal/LeanplumInternal;->validateAttributes(Ljava/util/Map;Ljava/lang/String;Z)Ljava/util/Map;

    move-result-object p1

    invoke-static {p1}, Lcom/leanplum/internal/JsonConverter;->toJson(Ljava/util/Map;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v1, v0, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_36

    :cond_35
    const/4 p1, 0x0

    :goto_36
    invoke-static {}, Lcom/leanplum/internal/LeanplumInternal;->issuedStart()Z

    move-result p2

    if-eqz p2, :cond_40

    invoke-static {p0, p1, v1}, Lcom/leanplum/Leanplum;->advanceToInternal(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;)V

    return-void

    :cond_40
    new-instance p2, Lcom/leanplum/Leanplum$14;

    invoke-direct {p2, p0, p1, v1}, Lcom/leanplum/Leanplum$14;-><init>(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;)V

    invoke-static {p2}, Lcom/leanplum/internal/LeanplumInternal;->addStartIssuedHandler(Ljava/lang/Runnable;)V
    :try_end_48
    .catchall {:try_start_18 .. :try_end_48} :catchall_49

    return-void

    :catchall_49
    move-exception p0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static advanceTo(Ljava/lang/String;Ljava/util/Map;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "*>;)V"
        }
    .end annotation

    .line 80
    const-string v0, ""

    invoke-static {p0, v0, p1}, Lcom/leanplum/Leanplum;->advanceTo(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method private static advanceToInternal(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "*>;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    invoke-static {}, Lcom/leanplum/internal/RequestBuilder;->withAdvanceAction()Lcom/leanplum/internal/RequestBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/leanplum/internal/RequestBuilder;->andParams(Ljava/util/Map;)Lcom/leanplum/internal/RequestBuilder;

    move-result-object p2

    invoke-virtual {p2}, Lcom/leanplum/internal/RequestBuilder;->create()Lcom/leanplum/internal/Request;

    move-result-object p2

    invoke-static {}, Lcom/leanplum/internal/RequestSender;->getInstance()Lcom/leanplum/internal/RequestSender;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/leanplum/internal/RequestSender;->send(Lcom/leanplum/internal/Request;)V

    new-instance p2, Lcom/leanplum/ActionContext$ContextualValues;

    invoke-direct {p2}, Lcom/leanplum/ActionContext$ContextualValues;-><init>()V

    iput-object p1, p2, Lcom/leanplum/ActionContext$ContextualValues;->parameters:Ljava/util/Map;

    const/4 p1, 0x3

    const/4 v0, 0x0

    const-string v1, "state"

    invoke-static {v1, p0, p1, v0, p2}, Lcom/leanplum/internal/LeanplumInternal;->maybePerformActions(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Lcom/leanplum/ActionContext$ContextualValues;)V

    return-void
.end method

.method private static applyContentInResponse(Lorg/json/JSONObject;)V
    .registers 11

    const-string v0, "vars"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-static {v1}, Lcom/leanplum/internal/JsonConverter;->mapFromJsonOrDefault(Lorg/json/JSONObject;)Ljava/util/Map;

    move-result-object v2

    const-string v1, "messages"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-static {v1}, Lcom/leanplum/internal/JsonConverter;->mapFromJsonOrDefault(Lorg/json/JSONObject;)Ljava/util/Map;

    move-result-object v3

    const-string v1, "regions"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-static {v1}, Lcom/leanplum/internal/JsonConverter;->mapFromJsonOrDefault(Lorg/json/JSONObject;)Ljava/util/Map;

    move-result-object v4

    const-string v1, "variants"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    invoke-static {v1}, Lcom/leanplum/internal/JsonConverter;->listFromJsonOrDefault(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v5

    const-string v1, "localCaps"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    invoke-static {v1}, Lcom/leanplum/internal/JsonConverter;->listFromJsonOrDefault(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v6

    const-string v1, "variantDebugInfo"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-static {v1}, Lcom/leanplum/internal/JsonConverter;->mapFromJsonOrDefault(Lorg/json/JSONObject;)Ljava/util/Map;

    move-result-object v7

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    if-eqz v0, :cond_48

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_46
    move-object v8, v0

    goto :goto_4a

    :cond_48
    const/4 v0, 0x0

    goto :goto_46

    :goto_4a
    const-string v0, "varsSignature"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-static/range {v2 .. v9}, Lcom/leanplum/internal/VarCache;->applyVariableDiffs(Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Ljava/util/List;Ljava/util/List;Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private static checkAndStartNotificationsModules()V
    .registers 3

    :try_start_0
    const-string v0, "Trying to start LeanplumPushService"

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/leanplum/internal/Log;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    const-class v0, Lcom/leanplum/LeanplumPushService;

    sget-object v1, Lcom/leanplum/LeanplumPushService;->LEANPLUM_SENDER_ID:Ljava/lang/String;

    const-string v1, "onStart"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    invoke-virtual {v0, v2, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_16
    .catchall {:try_start_0 .. :try_end_16} :catchall_16

    :catchall_16
    return-void
.end method

.method public static clearUserContent()V
    .registers 0

    invoke-static {}, Lcom/leanplum/internal/VarCache;->clearUserContent()V

    return-void
.end method

.method public static countAggregator()Lcom/leanplum/internal/CountAggregator;
    .registers 1

    sget-object v0, Lcom/leanplum/Leanplum;->countAggregator:Lcom/leanplum/internal/CountAggregator;

    return-object v0
.end method

.method public static defineAction(Ljava/lang/String;ILcom/leanplum/ActionArgs;)V
    .registers 4

    const/4 v0, 0x0

    .line 58
    invoke-static {p0, p1, p2, v0, v0}, Lcom/leanplum/Leanplum;->defineAction(Ljava/lang/String;ILcom/leanplum/ActionArgs;Ljava/util/Map;Lcom/leanplum/callbacks/ActionCallback;)V

    return-void
.end method

.method public static defineAction(Ljava/lang/String;ILcom/leanplum/ActionArgs;Lcom/leanplum/callbacks/ActionCallback;)V
    .registers 5

    const/4 v0, 0x0

    .line 57
    invoke-static {p0, p1, p2, v0, p3}, Lcom/leanplum/Leanplum;->defineAction(Ljava/lang/String;ILcom/leanplum/ActionArgs;Ljava/util/Map;Lcom/leanplum/callbacks/ActionCallback;)V

    return-void
.end method

.method private static defineAction(Ljava/lang/String;ILcom/leanplum/ActionArgs;Ljava/util/Map;Lcom/leanplum/callbacks/ActionCallback;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Lcom/leanplum/ActionArgs;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/leanplum/callbacks/ActionCallback;",
            ")V"
        }
    .end annotation

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_f

    const-string p0, "defineAction - Empty name parameter provided."

    new-array p1, v1, [Ljava/lang/Object;

    invoke-static {p0, p1}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_f
    if-nez p2, :cond_19

    const-string p0, "defineAction - Invalid args parameter provided."

    new-array p1, v1, [Ljava/lang/Object;

    invoke-static {p0, p1}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_19
    if-nez p3, :cond_20

    :try_start_1b
    new-instance p3, Ljava/util/HashMap;

    invoke-direct {p3}, Ljava/util/HashMap;-><init>()V

    :cond_20
    invoke-static {}, Lcom/leanplum/internal/LeanplumInternal;->getActionHandlers()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p2}, Lcom/leanplum/ActionArgs;->getValue()Ljava/util/List;

    move-result-object p2

    invoke-static {p0, p1, p2, p3}, Lcom/leanplum/internal/VarCache;->registerActionDefinition(Ljava/lang/String;ILjava/util/List;Ljava/util/Map;)V

    if-eqz p4, :cond_33

    invoke-static {p0, p4}, Lcom/leanplum/Leanplum;->onAction(Ljava/lang/String;Lcom/leanplum/callbacks/ActionCallback;)V
    :try_end_33
    .catchall {:try_start_1b .. :try_end_33} :catchall_34

    :cond_33
    return-void

    :catchall_34
    move-exception p0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static disableLocationCollection()V
    .registers 1

    const/4 v0, 0x0

    sput-boolean v0, Lcom/leanplum/Leanplum;->locationCollectionEnabled:Z

    return-void
.end method

.method public static enableTestMode()V
    .registers 1

    const/4 v0, 0x1

    sput-boolean v0, Lcom/leanplum/internal/Constants;->isTestMode:Z

    return-void
.end method

.method public static enableVerboseLoggingInDevelopmentMode()V
    .registers 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, 0x3

    invoke-static {v0}, Lcom/leanplum/Leanplum;->setLogLevel(I)V

    return-void
.end method

.method public static featureFlagManager()Lcom/leanplum/internal/FeatureFlagManager;
    .registers 1

    sget-object v0, Lcom/leanplum/Leanplum;->featureFlagManager:Lcom/leanplum/internal/FeatureFlagManager;

    return-object v0
.end method

.method private static fillCommonParameters(Ljava/util/Map;)Ljava/util/Map;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/leanplum/Leanplum;->context:Landroid/content/Context;

    const-string v1, "registration_id"

    const-string v2, "__leanplum_push__"

    invoke-static {v0, v2, v1}, Lcom/leanplum/utils/SharedPreferencesUtil;->getString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/leanplum/Leanplum;->context:Landroid/content/Context;

    const-string v3, "mipush_registration_id"

    invoke-static {v1, v2, v3}, Lcom/leanplum/utils/SharedPreferencesUtil;->getString(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1d

    const-string v2, "gcmRegistrationId"

    invoke-interface {p0, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1d
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_28

    const-string v0, "miPushRegId"

    invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_28
    invoke-static {}, Lcom/leanplum/internal/Util;->getVersionName()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/leanplum/Leanplum;->customAppVersion:Ljava/lang/String;

    if-eqz v1, :cond_31

    move-object v0, v1

    :cond_31
    if-nez v0, :cond_35

    const-string v0, ""

    :cond_35
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v1

    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/util/TimeZone;->getOffset(J)I

    move-result v2

    div-int/lit16 v2, v2, 0x3e8

    const-string v3, "includeDefaults"

    const-string v4, "false"

    invoke-interface {p0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "versionName"

    invoke-interface {p0, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "deviceName"

    invoke-static {}, Lcom/leanplum/internal/Util;->getDeviceName()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p0, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "deviceModel"

    invoke-static {}, Lcom/leanplum/internal/Util;->getDeviceModel()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p0, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "systemName"

    invoke-static {}, Lcom/leanplum/internal/Util;->getSystemName()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p0, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "systemVersion"

    invoke-static {}, Lcom/leanplum/internal/Util;->getSystemVersion()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p0, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "timezone"

    invoke-virtual {v1}, Ljava/util/TimeZone;->getID()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "timezoneOffsetSeconds"

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "locale"

    invoke-static {}, Lcom/leanplum/internal/Util;->getLocale()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/leanplum/Leanplum;->customCountryCode:Ljava/lang/String;

    const-string v1, "country"

    const-string v2, "(detect)"

    if-eqz v0, :cond_a1

    sget-object v0, Lcom/leanplum/Leanplum;->customCountryCode:Ljava/lang/String;

    invoke-interface {p0, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_a4

    :cond_a1
    invoke-interface {p0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_a4
    const-string v0, "region"

    invoke-interface {p0, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "city"

    invoke-interface {p0, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "location"

    invoke-interface {p0, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-boolean v0, Lcom/leanplum/internal/Constants;->isDevelopmentModeEnabled:Z

    if-eqz v0, :cond_be

    const-string v0, "devMode"

    const-string v1, "true"

    invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_be
    invoke-static {}, Lcom/leanplum/internal/Util;->getDaysSinceInstall()Ljava/lang/Long;

    move-result-object v0

    if-eqz v0, :cond_c9

    const-string v1, "daysSinceInstall"

    invoke-interface {p0, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_c9
    sget-object v0, Lcom/leanplum/Leanplum;->customParams:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_d6

    sget-object v0, Lcom/leanplum/Leanplum;->customParams:Ljava/util/Map;

    invoke-interface {p0, v0}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    :cond_d6
    invoke-static {}, Lcom/leanplum/LeanplumInbox;->getInstance()Lcom/leanplum/LeanplumInbox;

    move-result-object v0

    invoke-virtual {v0}, Lcom/leanplum/LeanplumInbox;->messagesIds()Ljava/util/List;

    move-result-object v0

    const-string v1, "newsfeedMessages"

    invoke-interface {p0, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Lcom/leanplum/internal/LeanplumInternal;->getIsVariantDebugInfoEnabled()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    const-string v1, "includeVariantDebugInfo"

    invoke-interface {p0, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method

.method public static forceContentUpdate()V
    .registers 1

    const/4 v0, 0x0

    .line 70
    invoke-static {v0}, Lcom/leanplum/Leanplum;->forceContentUpdate(Lcom/leanplum/callbacks/VariablesChangedCallback;)V

    return-void
.end method

.method public static forceContentUpdate(Lcom/leanplum/callbacks/VariablesChangedCallback;)V
    .registers 3

    invoke-static {}, Lcom/leanplum/internal/Constants;->isNoop()Z

    move-result v0

    if-eqz v0, :cond_e

    invoke-static {}, Lcom/leanplum/internal/OperationQueue;->sharedInstance()Lcom/leanplum/internal/OperationQueue;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/leanplum/internal/OperationQueue;->addUiOperation(Ljava/lang/Runnable;)V

    return-void

    :cond_e
    :try_start_e
    invoke-static {}, Lcom/leanplum/internal/RequestBuilder;->withGetVarsAction()Lcom/leanplum/internal/RequestBuilder;

    move-result-object v0

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    invoke-static {v1}, Lcom/leanplum/Leanplum;->fillCommonParameters(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/leanplum/internal/RequestBuilder;->andParams(Ljava/util/Map;)Lcom/leanplum/internal/RequestBuilder;

    move-result-object v0

    sget-object v1, Lcom/leanplum/internal/Request$RequestType;->IMMEDIATE:Lcom/leanplum/internal/Request$RequestType;

    invoke-virtual {v0, v1}, Lcom/leanplum/internal/RequestBuilder;->andType(Lcom/leanplum/internal/Request$RequestType;)Lcom/leanplum/internal/RequestBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/leanplum/internal/RequestBuilder;->create()Lcom/leanplum/internal/Request;

    move-result-object v0

    new-instance v1, Lcom/leanplum/Leanplum$17;

    invoke-direct {v1, p0}, Lcom/leanplum/Leanplum$17;-><init>(Lcom/leanplum/callbacks/VariablesChangedCallback;)V

    invoke-virtual {v0, v1}, Lcom/leanplum/internal/Request;->onResponse(Lcom/leanplum/internal/Request$ResponseCallback;)V

    new-instance v1, Lcom/leanplum/Leanplum$18;

    invoke-direct {v1, p0}, Lcom/leanplum/Leanplum$18;-><init>(Lcom/leanplum/callbacks/VariablesChangedCallback;)V

    invoke-virtual {v0, v1}, Lcom/leanplum/internal/Request;->onError(Lcom/leanplum/internal/Request$ErrorCallback;)V

    invoke-static {}, Lcom/leanplum/internal/RequestSender;->getInstance()Lcom/leanplum/internal/RequestSender;

    move-result-object p0

    invoke-virtual {p0, v0}, Lcom/leanplum/internal/RequestSender;->send(Lcom/leanplum/internal/Request;)V
    :try_end_40
    .catchall {:try_start_e .. :try_end_40} :catchall_41

    return-void

    :catchall_41
    move-exception p0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static getContext()Landroid/content/Context;
    .registers 2

    sget-object v0, Lcom/leanplum/Leanplum;->context:Landroid/content/Context;

    if-nez v0, :cond_c

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "Your application context is not set. You should call Leanplum.setApplicationContext(this) or LeanplumActivityHelper.enableLifecycleCallbacks(this) in your application\'s onCreate method, or have your application extend LeanplumApplication."

    invoke-static {v1, v0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_c
    sget-object v0, Lcom/leanplum/Leanplum;->context:Landroid/content/Context;

    return-object v0
.end method

.method public static getDeviceId()Ljava/lang/String;
    .registers 2

    invoke-static {}, Lcom/leanplum/internal/LeanplumInternal;->hasCalledStart()Z

    move-result v0

    if-nez v0, :cond_10

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "Leanplum.start() must be called before calling getDeviceId."

    invoke-static {v1, v0}, Lcom/leanplum/internal/Log;->i(Ljava/lang/String;[Ljava/lang/Object;)V

    const/4 v0, 0x0

    return-object v0

    :cond_10
    invoke-static {}, Lcom/leanplum/internal/APIConfig;->getInstance()Lcom/leanplum/internal/APIConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/leanplum/internal/APIConfig;->deviceId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getInbox()Lcom/leanplum/LeanplumInbox;
    .registers 1

    invoke-static {}, Lcom/leanplum/LeanplumInbox;->getInstance()Lcom/leanplum/LeanplumInbox;

    move-result-object v0

    return-object v0
.end method

.method public static getUserId()Ljava/lang/String;
    .registers 2

    invoke-static {}, Lcom/leanplum/Leanplum;->hasStarted()Z

    move-result v0

    if-eqz v0, :cond_f

    invoke-static {}, Lcom/leanplum/internal/APIConfig;->getInstance()Lcom/leanplum/internal/APIConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/leanplum/internal/APIConfig;->userId()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_f
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "Leanplum.start() must be called before calling getUserId()"

    invoke-static {v1, v0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    const/4 v0, 0x0

    return-object v0
.end method

.method public static getVariantDebugInfo()Ljava/util/Map;
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

    invoke-static {}, Lcom/leanplum/internal/VarCache;->getVariantDebugInfo()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method private static handleStartResponse(Lorg/json/JSONObject;)V
    .registers 13

    const-string v0, "isRegistered"

    invoke-static {p0}, Lcom/leanplum/internal/RequestUtil;->isResponseSuccess(Lorg/json/JSONObject;)Z

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-nez v1, :cond_22

    :try_start_a
    invoke-static {v2}, Lcom/leanplum/internal/LeanplumInternal;->setHasStarted(Z)V

    invoke-static {v3}, Lcom/leanplum/internal/LeanplumInternal;->setStartSuccessful(Z)V

    invoke-static {}, Lcom/leanplum/internal/VarCache;->loadDiffs()V
    :try_end_13
    .catchall {:try_start_a .. :try_end_13} :catchall_14

    goto :goto_18

    :catchall_14
    move-exception p0

    :try_start_15
    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V
    :try_end_18
    .catchall {:try_start_15 .. :try_end_18} :catchall_1d

    :goto_18
    invoke-static {v1}, Lcom/leanplum/Leanplum;->triggerStartResponse(Z)V

    goto/16 :goto_19c

    :catchall_1d
    move-exception p0

    invoke-static {v1}, Lcom/leanplum/Leanplum;->triggerStartResponse(Z)V

    throw p0

    :cond_22
    :try_start_22
    invoke-static {v2}, Lcom/leanplum/internal/LeanplumInternal;->setHasStarted(Z)V

    invoke-static {v2}, Lcom/leanplum/internal/LeanplumInternal;->setStartSuccessful(Z)V

    const-string v4, "vars"

    invoke-virtual {p0, v4}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    if-nez v4, :cond_37

    const-string v4, "No variable values were received from the server. Please contact us to investigate."

    new-array v5, v3, [Ljava/lang/Object;

    invoke-static {v4, v5}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_37
    const-string v4, "messages"

    invoke-virtual {p0, v4}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    if-nez v4, :cond_46

    const-string v4, "No messages received from the server."

    new-array v5, v3, [Ljava/lang/Object;

    invoke-static {v4, v5}, Lcom/leanplum/internal/Log;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_46
    const-string v4, "regions"

    invoke-virtual {p0, v4}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    if-nez v4, :cond_55

    const-string v4, "No regions received from the server."

    new-array v5, v3, [Ljava/lang/Object;

    invoke-static {v4, v5}, Lcom/leanplum/internal/Log;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_55
    const-string v4, "variants"

    invoke-virtual {p0, v4}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    if-nez v4, :cond_64

    const-string v4, "No variants received from the server."

    new-array v5, v3, [Ljava/lang/Object;

    invoke-static {v4, v5}, Lcom/leanplum/internal/Log;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_64
    invoke-static {p0}, Lcom/leanplum/Leanplum;->parseFilenameToURLs(Lorg/json/JSONObject;)Ljava/util/Map;

    move-result-object v4

    invoke-static {v4}, Lcom/leanplum/internal/FileManager;->setFilenameToURLs(Ljava/util/Map;)V

    sget-object v4, Lcom/leanplum/Leanplum;->context:Landroid/content/Context;

    invoke-static {v4}, Lcom/leanplum/utils/BuildUtil;->isNotificationChannelSupported(Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_a7

    const-string v4, "notificationChannels"

    invoke-virtual {p0, v4}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    const-string v5, "notificationChannelGroups"

    invoke-virtual {p0, v5}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v5

    const-string v6, "defaultNotificationChannel"

    invoke-virtual {p0, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6
    :try_end_85
    .catchall {:try_start_22 .. :try_end_85} :catchall_195

    :try_start_85
    const-class v7, Lcom/leanplum/LeanplumNotificationChannel;

    sget v8, Lcom/leanplum/LeanplumNotificationChannel;->a:I

    const-string v8, "configureChannels"

    const-class v9, Landroid/content/Context;

    const-class v10, Lorg/json/JSONArray;

    const-class v11, Ljava/lang/String;

    filled-new-array {v9, v10, v10, v11}, [Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v7

    new-instance v8, Ljava/lang/Object;

    invoke-direct {v8}, Ljava/lang/Object;-><init>()V

    sget-object v9, Lcom/leanplum/Leanplum;->context:Landroid/content/Context;

    filled-new-array {v9, v5, v4, v6}, [Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v7, v8, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_a7
    .catchall {:try_start_85 .. :try_end_a7} :catchall_a7

    :catchall_a7
    :cond_a7
    :try_start_a7
    const-string v4, "token"

    const/4 v5, 0x0

    invoke-virtual {p0, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {}, Lcom/leanplum/internal/APIConfig;->getInstance()Lcom/leanplum/internal/APIConfig;

    move-result-object v5

    invoke-virtual {v5, v4}, Lcom/leanplum/internal/APIConfig;->setToken(Ljava/lang/String;)V

    invoke-static {}, Lcom/leanplum/internal/APIConfig;->getInstance()Lcom/leanplum/internal/APIConfig;

    move-result-object v4

    invoke-virtual {v4}, Lcom/leanplum/internal/APIConfig;->saveToken()V

    invoke-static {p0}, Lcom/leanplum/Leanplum;->applyContentInResponse(Lorg/json/JSONObject;)V

    invoke-static {}, Lcom/leanplum/internal/VarCache;->saveUserAttributes()V

    const-string v4, "syncNewsfeed"

    invoke-virtual {p0, v4, v3}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v4

    if-eqz v4, :cond_d1

    invoke-static {}, Lcom/leanplum/LeanplumInbox;->getInstance()Lcom/leanplum/LeanplumInbox;

    move-result-object v4

    invoke-virtual {v4}, Lcom/leanplum/LeanplumInbox;->downloadMessages()V

    :cond_d1
    const-string v4, "loggingEnabled"

    invoke-virtual {p0, v4, v3}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_db

    sput-boolean v2, Lcom/leanplum/internal/Constants;->loggingEnabled:Z

    :cond_db
    invoke-static {p0}, Lcom/leanplum/Leanplum;->parseSdkCounters(Lorg/json/JSONObject;)Ljava/util/Set;

    move-result-object v2

    sget-object v3, Lcom/leanplum/Leanplum;->countAggregator:Lcom/leanplum/internal/CountAggregator;

    invoke-virtual {v3, v2}, Lcom/leanplum/internal/CountAggregator;->setEnabledCounters(Ljava/util/Set;)V

    invoke-static {p0}, Lcom/leanplum/Leanplum;->parseFeatureFlags(Lorg/json/JSONObject;)Ljava/util/Set;

    move-result-object v2

    sget-object v3, Lcom/leanplum/internal/FeatureFlagManager;->INSTANCE:Lcom/leanplum/internal/FeatureFlagManager;

    invoke-virtual {v3, v2}, Lcom/leanplum/internal/FeatureFlagManager;->setEnabledFeatureFlags(Ljava/util/Set;)V

    invoke-static {p0}, Lcom/leanplum/Leanplum;->parseVariantDebugInfo(Lorg/json/JSONObject;)V

    sget-boolean v2, Lcom/leanplum/internal/Constants;->isDevelopmentModeEnabled:Z

    if-eqz v2, :cond_18e

    invoke-static {}, Lcom/leanplum/LeanplumActivityHelper;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v2

    sget-object v3, Lcom/leanplum/Leanplum;->context:Landroid/content/Context;

    if-eq v2, v3, :cond_107

    invoke-static {}, Lcom/leanplum/LeanplumActivityHelper;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v2

    if-eqz v2, :cond_107

    invoke-static {}, Lcom/leanplum/LeanplumActivityHelper;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v2

    goto :goto_109

    :cond_107
    sget-object v2, Lcom/leanplum/Leanplum;->context:Landroid/content/Context;

    :goto_109
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_124

    sget-object v3, Lcom/leanplum/Leanplum;->registerDeviceHandler:Lcom/leanplum/callbacks/RegisterDeviceCallback;

    if-eqz v3, :cond_124

    new-instance v4, Lcom/leanplum/Leanplum$6;

    invoke-direct {v4}, Lcom/leanplum/Leanplum$6;-><init>()V

    invoke-virtual {v3, v4}, Lcom/leanplum/callbacks/RegisterDeviceCallback;->setResponseHandler(Lcom/leanplum/callbacks/RegisterDeviceCallback$EmailCallback;)V

    invoke-static {}, Lcom/leanplum/internal/OperationQueue;->sharedInstance()Lcom/leanplum/internal/OperationQueue;

    move-result-object v3

    sget-object v4, Lcom/leanplum/Leanplum;->registerDeviceHandler:Lcom/leanplum/callbacks/RegisterDeviceCallback;

    invoke-virtual {v3, v4}, Lcom/leanplum/internal/OperationQueue;->addUiOperation(Ljava/lang/Runnable;)V

    :cond_124
    const-string v3, "isRegisteredFromOtherApp"

    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_138

    invoke-static {}, Lcom/leanplum/internal/OperationQueue;->sharedInstance()Lcom/leanplum/internal/OperationQueue;

    move-result-object v3

    new-instance v4, Lcom/leanplum/Leanplum$7;

    invoke-direct {v4, v2}, Lcom/leanplum/Leanplum$7;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3, v4}, Lcom/leanplum/internal/OperationQueue;->addUiOperation(Ljava/lang/Runnable;)V

    :cond_138
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v0

    const-string v2, "latestVersion"

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v0, :cond_153

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_153

    const-string v3, "Version %s of Leanplum SDK is available. Update your gradle dependencies to use it."

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-static {v3, v2}, Lcom/leanplum/internal/Log;->i(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_153
    const-string v2, "varsFromCode"

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    if-nez v2, :cond_160

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    :cond_160
    const-string v3, "actionDefinitions"

    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    if-nez v3, :cond_16d

    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    :cond_16d
    const-string v4, "fileAttributes"

    invoke-virtual {p0, v4}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    if-nez p0, :cond_17a

    new-instance p0, Lorg/json/JSONObject;

    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    :cond_17a
    invoke-static {v2}, Lcom/leanplum/internal/JsonConverter;->mapFromJson(Lorg/json/JSONObject;)Ljava/util/Map;

    move-result-object v2

    invoke-static {p0}, Lcom/leanplum/internal/JsonConverter;->mapFromJson(Lorg/json/JSONObject;)Ljava/util/Map;

    move-result-object p0

    invoke-static {v3}, Lcom/leanplum/internal/JsonConverter;->mapFromJson(Lorg/json/JSONObject;)Ljava/util/Map;

    move-result-object v3

    invoke-static {v2, p0, v3}, Lcom/leanplum/internal/VarCache;->setDevModeValuesFromServer(Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;)V

    if-eqz v0, :cond_18e

    invoke-static {}, Lcom/leanplum/internal/LeanplumInternal;->onHasStartedAndRegisteredAsDeveloper()V

    :cond_18e
    invoke-static {}, Lcom/leanplum/internal/LeanplumInternal;->moveToForeground()V

    invoke-static {}, Lcom/leanplum/Leanplum;->startRequestTimer()V
    :try_end_194
    .catchall {:try_start_a7 .. :try_end_194} :catchall_195

    goto :goto_199

    :catchall_195
    move-exception p0

    :try_start_196
    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V
    :try_end_199
    .catchall {:try_start_196 .. :try_end_199} :catchall_19d

    :goto_199
    invoke-static {v1}, Lcom/leanplum/Leanplum;->triggerStartResponse(Z)V

    :goto_19c
    return-void

    :catchall_19d
    move-exception p0

    invoke-static {v1}, Lcom/leanplum/Leanplum;->triggerStartResponse(Z)V

    throw p0
.end method

.method public static hasStarted()Z
    .registers 1

    invoke-static {}, Lcom/leanplum/internal/LeanplumInternal;->hasStarted()Z

    move-result v0

    return v0
.end method

.method public static hasStartedAndRegisteredAsDeveloper()Z
    .registers 1

    invoke-static {}, Lcom/leanplum/internal/LeanplumInternal;->hasStartedAndRegisteredAsDeveloper()Z

    move-result v0

    return v0
.end method

.method public static isLocationCollectionEnabled()Z
    .registers 1

    sget-boolean v0, Lcom/leanplum/Leanplum;->locationCollectionEnabled:Z

    return v0
.end method

.method public static isPushDeliveryTrackingEnabled()Z
    .registers 1

    sget-boolean v0, Lcom/leanplum/Leanplum;->pushDeliveryTrackingEnabled:Z

    return v0
.end method

.method public static isResourceSyncingEnabled()Z
    .registers 1

    invoke-static {}, Lcom/leanplum/internal/FileManager;->isResourceSyncingEnabled()Z

    move-result v0

    return v0
.end method

.method public static isScreenTrackingEnabled()Z
    .registers 1

    invoke-static {}, Lcom/leanplum/internal/LeanplumInternal;->getIsScreenTrackingEnabled()Z

    move-result v0

    return v0
.end method

.method public static isTestModeEnabled()Z
    .registers 1

    sget-boolean v0, Lcom/leanplum/internal/Constants;->isTestMode:Z

    return v0
.end method

.method private static loadApiConfigFromResources()V
    .registers 4

    new-instance v0, Lcom/leanplum/internal/ApiConfigLoader;

    invoke-static {}, Lcom/leanplum/Leanplum;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/leanplum/internal/ApiConfigLoader;-><init>(Landroid/content/Context;)V

    new-instance v1, Lpza;

    const/16 v2, 0x1c

    invoke-direct {v1, v2}, Lpza;-><init>(B)V

    new-instance v2, Lpza;

    const/16 v3, 0x1d

    invoke-direct {v2, v3}, Lpza;-><init>(B)V

    invoke-virtual {v0, v1, v2}, Lcom/leanplum/internal/ApiConfigLoader;->loadFromResources(Lcom/leanplum/internal/ApiConfigLoader$KeyListener;Lcom/leanplum/internal/ApiConfigLoader$KeyListener;)V

    return-void
.end method

.method private static messageArchiveDataFromContext(Lcom/leanplum/ActionContext;)Lcom/leanplum/models/MessageArchiveData;
    .registers 5

    invoke-virtual {p0}, Lcom/leanplum/internal/BaseActionContext;->getMessageId()Ljava/lang/String;

    move-result-object v0

    :try_start_4
    invoke-static {p0}, Lcom/leanplum/Leanplum;->messageBodyFromContext(Lcom/leanplum/ActionContext;)Ljava/lang/String;

    move-result-object p0
    :try_end_8
    .catchall {:try_start_4 .. :try_end_8} :catchall_9

    goto :goto_f

    :catchall_9
    move-exception p0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    const-string p0, ""

    :goto_f
    invoke-static {}, Lcom/leanplum/Leanplum;->getUserId()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    new-instance v3, Lcom/leanplum/models/MessageArchiveData;

    invoke-direct {v3, v0, p0, v1, v2}, Lcom/leanplum/models/MessageArchiveData;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;)V

    return-object v3
.end method

.method public static messageBodyFromContext(Lcom/leanplum/ActionContext;)Ljava/lang/String;
    .registers 4

    invoke-virtual {p0}, Lcom/leanplum/internal/BaseActionContext;->getArgs()Ljava/util/Map;

    move-result-object p0

    const-string v0, "Message"

    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    const/4 v0, 0x0

    if-nez p0, :cond_e

    return-object v0

    :cond_e
    instance-of v1, p0, Ljava/lang/String;

    if-eqz v1, :cond_15

    check-cast p0, Ljava/lang/String;

    return-object p0

    :cond_15
    check-cast p0, Ljava/util/HashMap;

    const-string v1, "Text"

    invoke-virtual {p0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_2e

    invoke-virtual {p0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    instance-of v2, v2, Ljava/lang/String;

    if-eqz v2, :cond_2e

    invoke-virtual {p0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0

    :cond_2e
    const-string v1, "Text value"

    invoke-virtual {p0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_45

    invoke-virtual {p0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    instance-of v2, v2, Ljava/lang/String;

    if-eqz v2, :cond_45

    invoke-virtual {p0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0

    :cond_45
    return-object v0
.end method

.method public static messageMetadata()Ljava/util/Map;
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

    invoke-static {}, Lcom/leanplum/internal/VarCache;->messages()Ljava/util/Map;

    move-result-object v0

    if-nez v0, :cond_b

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    :cond_b
    return-object v0
.end method

.method public static varargs objectForKeyPath([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 1

    invoke-static {p0}, Lcom/leanplum/Leanplum;->objectForKeyPathComponents([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static objectForKeyPathComponents([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 1

    :try_start_0
    invoke-static {p0}, Lcom/leanplum/internal/VarCache;->getMergedValueFromComponentArray([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0
    :try_end_4
    .catchall {:try_start_0 .. :try_end_4} :catchall_5

    return-object p0

    :catchall_5
    move-exception p0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public static onAction(Ljava/lang/String;Lcom/leanplum/callbacks/ActionCallback;)V
    .registers 4

    const/4 v0, 0x0

    if-nez p0, :cond_b

    const-string p0, "onAction - Invalid actionName parameter provided."

    new-array p1, v0, [Ljava/lang/Object;

    invoke-static {p0, p1}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_b
    if-nez p1, :cond_15

    const-string p0, "onAction - Invalid handler parameter provided."

    new-array p1, v0, [Ljava/lang/Object;

    invoke-static {p0, p1}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_15
    invoke-static {}, Lcom/leanplum/internal/LeanplumInternal;->getActionHandlers()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-nez v0, :cond_2d

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {}, Lcom/leanplum/internal/LeanplumInternal;->getActionHandlers()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2d
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public static parseFeatureFlags(Lorg/json/JSONObject;)Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            ")",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const-string v0, "enabledFeatureFlags"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    invoke-static {p0}, Lcom/leanplum/Leanplum;->toSet(Lorg/json/JSONArray;)Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method

.method public static parseFilenameToURLs(Lorg/json/JSONObject;)Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const-string v0, "files"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    if-eqz p0, :cond_d

    invoke-static {p0}, Lcom/leanplum/internal/JsonConverter;->mapFromJson(Lorg/json/JSONObject;)Ljava/util/Map;

    move-result-object p0

    return-object p0

    :cond_d
    const/4 p0, 0x0

    return-object p0
.end method

.method public static parseSdkCounters(Lorg/json/JSONObject;)Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            ")",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const-string v0, "enabledSdkCounters"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    invoke-static {p0}, Lcom/leanplum/Leanplum;->toSet(Lorg/json/JSONArray;)Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method

.method private static parseVariantDebugInfo(Lorg/json/JSONObject;)V
    .registers 2

    const-string v0, "variantDebugInfo"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    invoke-static {p0}, Lcom/leanplum/internal/JsonConverter;->mapFromJsonOrDefault(Lorg/json/JSONObject;)Ljava/util/Map;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Map;->size()I

    move-result v0

    if-lez v0, :cond_13

    invoke-static {p0}, Lcom/leanplum/internal/VarCache;->setVariantDebugInfo(Ljava/util/Map;)V

    :cond_13
    return-void
.end method

.method public static pathForResource(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_10

    const/4 p0, 0x0

    new-array p0, p0, [Ljava/lang/Object;

    const-string v0, "pathForResource - Empty filename parameter provided."

    invoke-static {v0, p0}, Lcom/leanplum/internal/Log;->i(Ljava/lang/String;[Ljava/lang/Object;)V

    return-object v1

    :cond_10
    invoke-static {p0, p0}, Lcom/leanplum/Var;->defineFile(Ljava/lang/String;Ljava/lang/String;)Lcom/leanplum/Var;

    move-result-object p0

    if-eqz p0, :cond_1b

    invoke-virtual {p0}, Lcom/leanplum/Var;->fileValue()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1b
    return-object v1
.end method

.method public static pause()V
    .registers 2

    invoke-static {}, Lcom/leanplum/internal/Constants;->isNoop()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    invoke-static {}, Lcom/leanplum/internal/LeanplumInternal;->hasCalledStart()Z

    move-result v0

    if-nez v0, :cond_16

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "You cannot call pause before calling start"

    invoke-static {v1, v0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_16
    invoke-static {}, Lcom/leanplum/internal/LeanplumInternal;->issuedStart()Z

    move-result v0

    if-eqz v0, :cond_20

    invoke-static {}, Lcom/leanplum/Leanplum;->pauseInternal()V

    return-void

    :cond_20
    new-instance v0, Lcom/leanplum/Leanplum$8;

    invoke-direct {v0}, Lcom/leanplum/Leanplum$8;-><init>()V

    invoke-static {v0}, Lcom/leanplum/internal/LeanplumInternal;->addStartIssuedHandler(Ljava/lang/Runnable;)V

    return-void
.end method

.method private static pauseInternal()V
    .registers 2

    invoke-static {}, Lcom/leanplum/internal/RequestBuilder;->withPauseSessionAction()Lcom/leanplum/internal/RequestBuilder;

    move-result-object v0

    sget-object v1, Lcom/leanplum/internal/Request$RequestType;->IMMEDIATE:Lcom/leanplum/internal/Request$RequestType;

    invoke-virtual {v0, v1}, Lcom/leanplum/internal/RequestBuilder;->andType(Lcom/leanplum/internal/Request$RequestType;)Lcom/leanplum/internal/RequestBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/leanplum/internal/RequestBuilder;->create()Lcom/leanplum/internal/Request;

    move-result-object v0

    invoke-static {}, Lcom/leanplum/internal/RequestSender;->getInstance()Lcom/leanplum/internal/RequestSender;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/leanplum/internal/RequestSender;->send(Lcom/leanplum/internal/Request;)V

    invoke-static {}, Lcom/leanplum/Leanplum;->stopRequestTimer()V

    const/4 v0, 0x1

    invoke-static {v0}, Lcom/leanplum/internal/LeanplumInternal;->setIsPaused(Z)V

    return-void
.end method

.method public static pauseState()V
    .registers 2

    invoke-static {}, Lcom/leanplum/internal/Constants;->isNoop()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    invoke-static {}, Lcom/leanplum/internal/LeanplumInternal;->hasCalledStart()Z

    move-result v0

    if-nez v0, :cond_16

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "You cannot call pauseState before calling start"

    invoke-static {v1, v0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_16
    :try_start_16
    invoke-static {}, Lcom/leanplum/internal/LeanplumInternal;->issuedStart()Z

    move-result v0

    if-eqz v0, :cond_20

    invoke-static {}, Lcom/leanplum/Leanplum;->pauseStateInternal()V

    return-void

    :cond_20
    new-instance v0, Lcom/leanplum/Leanplum$15;

    invoke-direct {v0}, Lcom/leanplum/Leanplum$15;-><init>()V

    invoke-static {v0}, Lcom/leanplum/internal/LeanplumInternal;->addStartIssuedHandler(Ljava/lang/Runnable;)V
    :try_end_28
    .catchall {:try_start_16 .. :try_end_28} :catchall_29

    return-void

    :catchall_29
    move-exception v0

    invoke-static {v0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return-void
.end method

.method private static pauseStateInternal()V
    .registers 2

    invoke-static {}, Lcom/leanplum/internal/RequestBuilder;->withPauseStateAction()Lcom/leanplum/internal/RequestBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/leanplum/internal/RequestBuilder;->create()Lcom/leanplum/internal/Request;

    move-result-object v0

    invoke-static {}, Lcom/leanplum/internal/RequestSender;->getInstance()Lcom/leanplum/internal/RequestSender;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/leanplum/internal/RequestSender;->send(Lcom/leanplum/internal/Request;)V

    return-void
.end method

.method public static removeMessageDisplayedHandler(Lcom/leanplum/callbacks/MessageDisplayedCallback;)V
    .registers 2

    if-nez p0, :cond_b

    const-string p0, "removeMessageDisplayedHandler - Invalid handler parameter provided."

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {p0, v0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_b
    sget-object v0, Lcom/leanplum/Leanplum;->messageDisplayedHandlers:Ljava/util/ArrayList;

    monitor-enter v0

    :try_start_e
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    monitor-exit v0

    return-void

    :goto_13
    monitor-exit v0
    :try_end_14
    .catchall {:try_start_e .. :try_end_14} :catchall_15

    throw p0

    :catchall_15
    move-exception p0

    goto :goto_13
.end method

.method public static removeOnceVariablesChangedAndNoDownloadsPendingHandler(Lcom/leanplum/callbacks/VariablesChangedCallback;)V
    .registers 2

    if-nez p0, :cond_b

    const-string p0, "removeOnceVariablesChangedAndNoDownloadsPendingHandler - Invalid handler parameter provided."

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {p0, v0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_b
    sget-object v0, Lcom/leanplum/Leanplum;->onceNoDownloadsHandlers:Ljava/util/ArrayList;

    monitor-enter v0

    :try_start_e
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    monitor-exit v0

    return-void

    :goto_13
    monitor-exit v0
    :try_end_14
    .catchall {:try_start_e .. :try_end_14} :catchall_15

    throw p0

    :catchall_15
    move-exception p0

    goto :goto_13
.end method

.method public static removeStartResponseHandler(Lcom/leanplum/callbacks/StartCallback;)V
    .registers 2

    if-nez p0, :cond_b

    const-string p0, "removeStartResponseHandler - Invalid handler parameter provided."

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {p0, v0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_b
    sget-object v0, Lcom/leanplum/Leanplum;->startHandlers:Ljava/util/ArrayList;

    monitor-enter v0

    :try_start_e
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    monitor-exit v0

    return-void

    :goto_13
    monitor-exit v0
    :try_end_14
    .catchall {:try_start_e .. :try_end_14} :catchall_15

    throw p0

    :catchall_15
    move-exception p0

    goto :goto_13
.end method

.method public static removeVariablesChangedAndNoDownloadsPendingHandler(Lcom/leanplum/callbacks/VariablesChangedCallback;)V
    .registers 2

    if-nez p0, :cond_b

    const-string p0, "removeVariablesChangedAndNoDownloadsPendingHandler - Invalid handler parameter provided."

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {p0, v0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_b
    sget-object v0, Lcom/leanplum/Leanplum;->noDownloadsHandlers:Ljava/util/ArrayList;

    monitor-enter v0

    :try_start_e
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    monitor-exit v0

    return-void

    :goto_13
    monitor-exit v0
    :try_end_14
    .catchall {:try_start_e .. :try_end_14} :catchall_15

    throw p0

    :catchall_15
    move-exception p0

    goto :goto_13
.end method

.method public static removeVariablesChangedHandler(Lcom/leanplum/callbacks/VariablesChangedCallback;)V
    .registers 2

    if-nez p0, :cond_b

    const-string p0, "removeVariablesChangedHandler - Invalid handler parameter provided."

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {p0, v0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_b
    sget-object v0, Lcom/leanplum/Leanplum;->variablesChangedHandlers:Ljava/util/ArrayList;

    monitor-enter v0

    :try_start_e
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    monitor-exit v0

    return-void

    :goto_13
    monitor-exit v0
    :try_end_14
    .catchall {:try_start_e .. :try_end_14} :catchall_15

    throw p0

    :catchall_15
    move-exception p0

    goto :goto_13
.end method

.method public static resume()V
    .registers 2

    invoke-static {}, Lcom/leanplum/internal/Constants;->isNoop()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    invoke-static {}, Lcom/leanplum/internal/LeanplumInternal;->hasCalledStart()Z

    move-result v0

    if-nez v0, :cond_16

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "You cannot call resume before calling start"

    invoke-static {v1, v0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_16
    invoke-static {}, Lcom/leanplum/internal/LeanplumInternal;->issuedStart()Z

    move-result v0

    if-eqz v0, :cond_20

    invoke-static {}, Lcom/leanplum/Leanplum;->resumeInternal()V

    return-void

    :cond_20
    new-instance v0, Lcom/leanplum/Leanplum$9;

    invoke-direct {v0}, Lcom/leanplum/Leanplum$9;-><init>()V

    invoke-static {v0}, Lcom/leanplum/internal/LeanplumInternal;->addStartIssuedHandler(Ljava/lang/Runnable;)V

    return-void
.end method

.method private static resumeInternal()V
    .registers 4

    invoke-static {}, Lcom/leanplum/internal/RequestBuilder;->withResumeSessionAction()Lcom/leanplum/internal/RequestBuilder;

    move-result-object v0

    sget-object v1, Lcom/leanplum/internal/Request$RequestType;->IMMEDIATE:Lcom/leanplum/internal/Request$RequestType;

    invoke-virtual {v0, v1}, Lcom/leanplum/internal/RequestBuilder;->andType(Lcom/leanplum/internal/Request$RequestType;)Lcom/leanplum/internal/RequestBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/leanplum/internal/RequestBuilder;->create()Lcom/leanplum/internal/Request;

    move-result-object v0

    invoke-static {}, Lcom/leanplum/internal/RequestSender;->getInstance()Lcom/leanplum/internal/RequestSender;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/leanplum/internal/RequestSender;->send(Lcom/leanplum/internal/Request;)V

    invoke-static {}, Lcom/leanplum/internal/LeanplumInternal;->hasStartedInBackground()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_20

    invoke-static {v1}, Lcom/leanplum/internal/LeanplumInternal;->setStartedInBackground(Z)V

    goto :goto_27

    :cond_20
    const-string v0, "resume"

    const/4 v2, 0x3

    const/4 v3, 0x0

    invoke-static {v0, v3, v2, v3, v3}, Lcom/leanplum/internal/LeanplumInternal;->maybePerformActions(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Lcom/leanplum/ActionContext$ContextualValues;)V

    :goto_27
    invoke-static {}, Lcom/leanplum/Leanplum;->startRequestTimer()V

    invoke-static {v1}, Lcom/leanplum/internal/LeanplumInternal;->setIsPaused(Z)V

    return-void
.end method

.method public static resumeState()V
    .registers 2

    invoke-static {}, Lcom/leanplum/internal/Constants;->isNoop()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    invoke-static {}, Lcom/leanplum/internal/LeanplumInternal;->hasCalledStart()Z

    move-result v0

    if-nez v0, :cond_16

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "You cannot call resumeState before calling start"

    invoke-static {v1, v0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_16
    :try_start_16
    invoke-static {}, Lcom/leanplum/internal/LeanplumInternal;->issuedStart()Z

    move-result v0

    if-eqz v0, :cond_20

    invoke-static {}, Lcom/leanplum/Leanplum;->resumeStateInternal()V

    return-void

    :cond_20
    new-instance v0, Lcom/leanplum/Leanplum$16;

    invoke-direct {v0}, Lcom/leanplum/Leanplum$16;-><init>()V

    invoke-static {v0}, Lcom/leanplum/internal/LeanplumInternal;->addStartIssuedHandler(Ljava/lang/Runnable;)V
    :try_end_28
    .catchall {:try_start_16 .. :try_end_28} :catchall_29

    return-void

    :catchall_29
    move-exception v0

    invoke-static {v0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return-void
.end method

.method private static resumeStateInternal()V
    .registers 2

    invoke-static {}, Lcom/leanplum/internal/RequestBuilder;->withResumeStateAction()Lcom/leanplum/internal/RequestBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/leanplum/internal/RequestBuilder;->create()Lcom/leanplum/internal/Request;

    move-result-object v0

    invoke-static {}, Lcom/leanplum/internal/RequestSender;->getInstance()Lcom/leanplum/internal/RequestSender;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/leanplum/internal/RequestSender;->send(Lcom/leanplum/internal/Request;)V

    return-void
.end method

.method public static securedVars()Lcom/leanplum/SecuredVars;
    .registers 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    invoke-static {}, Lcom/leanplum/internal/VarCache;->getSecuredVars()Lcom/leanplum/SecuredVars;

    move-result-object v0

    return-object v0
.end method

.method public static setApiConnectionSettings(Ljava/lang/String;Ljava/lang/String;Z)V
    .registers 5

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_f

    const-string p0, "setApiConnectionSettings - Empty hostname parameter provided."

    new-array p1, v1, [Ljava/lang/Object;

    invoke-static {p0, p1}, Lcom/leanplum/internal/Log;->i(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_f
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1d

    const-string p0, "setApiConnectionSettings - Empty servletName parameter provided."

    new-array p1, v1, [Ljava/lang/Object;

    invoke-static {p0, p1}, Lcom/leanplum/internal/Log;->i(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_1d
    sput-object p0, Lcom/leanplum/internal/Constants;->API_HOST_NAME:Ljava/lang/String;

    sput-object p1, Lcom/leanplum/internal/Constants;->API_SERVLET:Ljava/lang/String;

    sput-boolean p2, Lcom/leanplum/internal/Constants;->API_SSL:Z

    return-void
.end method

.method public static setAppIdForDevelopmentMode(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_f

    const-string p0, "setAppIdForDevelopmentMode - Empty appId parameter provided."

    new-array p1, v1, [Ljava/lang/Object;

    invoke-static {p0, p1}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_f
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1d

    const-string p0, "setAppIdForDevelopmentMode - Empty accessKey parameter provided."

    new-array p1, v1, [Ljava/lang/Object;

    invoke-static {p0, p1}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_1d
    const/4 v0, 0x1

    sput-boolean v0, Lcom/leanplum/internal/Constants;->isDevelopmentModeEnabled:Z

    invoke-static {}, Lcom/leanplum/internal/APIConfig;->getInstance()Lcom/leanplum/internal/APIConfig;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/leanplum/internal/APIConfig;->setAppId(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static setAppIdForProductionMode(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_f

    const-string p0, "setAppIdForProductionMode - Empty appId parameter provided."

    new-array p1, v1, [Ljava/lang/Object;

    invoke-static {p0, p1}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_f
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1d

    const-string p0, "setAppIdForProductionMode - Empty accessKey parameter provided."

    new-array p1, v1, [Ljava/lang/Object;

    invoke-static {p0, p1}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_1d
    sput-boolean v1, Lcom/leanplum/internal/Constants;->isDevelopmentModeEnabled:Z

    invoke-static {}, Lcom/leanplum/internal/APIConfig;->getInstance()Lcom/leanplum/internal/APIConfig;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/leanplum/internal/APIConfig;->setAppId(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static setAppVersion(Ljava/lang/String;)V
    .registers 1

    sput-object p0, Lcom/leanplum/Leanplum;->customAppVersion:Ljava/lang/String;

    return-void
.end method

.method public static setApplicationContext(Landroid/content/Context;)V
    .registers 3

    if-nez p0, :cond_a

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "setApplicationContext - Null context parameter provided."

    invoke-static {v1, v0}, Lcom/leanplum/internal/Log;->i(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_a
    sput-object p0, Lcom/leanplum/Leanplum;->context:Landroid/content/Context;

    return-void
.end method

.method public static setClient(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 3

    sput-object p0, Lcom/leanplum/internal/Constants;->CLIENT:Ljava/lang/String;

    sput-object p1, Lcom/leanplum/internal/Constants;->LEANPLUM_VERSION:Ljava/lang/String;

    sput-object p2, Lcom/leanplum/internal/Constants;->defaultDeviceId:Ljava/lang/String;

    return-void
.end method

.method public static setCountry(Ljava/lang/String;)V
    .registers 1

    sput-object p0, Lcom/leanplum/Leanplum;->customCountryCode:Ljava/lang/String;

    return-void
.end method

.method public static setCustomParam(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 3

    sget-object v0, Lcom/leanplum/Leanplum;->customParams:Ljava/util/Map;

    invoke-interface {v0, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public static setDeviceId(Ljava/lang/String;)V
    .registers 3

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "setDeviceId - Empty deviceId parameter provided."

    invoke-static {v1, v0}, Lcom/leanplum/internal/Log;->i(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_e
    sput-object p0, Lcom/leanplum/Leanplum;->customDeviceId:Ljava/lang/String;

    const/4 p0, 0x1

    sput-boolean p0, Lcom/leanplum/Leanplum;->userSpecifiedDeviceId:Z

    return-void
.end method

.method public static setDeviceIdMode(Lcom/leanplum/LeanplumDeviceIdMode;)V
    .registers 2

    if-nez p0, :cond_b

    const/4 p0, 0x0

    new-array p0, p0, [Ljava/lang/Object;

    const-string v0, "setDeviceIdMode - Invalid mode parameter provided."

    invoke-static {v0, p0}, Lcom/leanplum/internal/Log;->i(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_b
    sput-object p0, Lcom/leanplum/Leanplum;->deviceIdMode:Lcom/leanplum/LeanplumDeviceIdMode;

    const/4 p0, 0x1

    sput-boolean p0, Lcom/leanplum/Leanplum;->userSpecifiedDeviceId:Z

    return-void
.end method

.method public static setDeviceLocation(Landroid/location/Location;)V
    .registers 2

    .line 21
    sget-object v0, Lcom/leanplum/LeanplumLocationAccuracyType;->CELL:Lcom/leanplum/LeanplumLocationAccuracyType;

    invoke-static {p0, v0}, Lcom/leanplum/Leanplum;->setDeviceLocation(Landroid/location/Location;Lcom/leanplum/LeanplumLocationAccuracyType;)V

    return-void
.end method

.method public static setDeviceLocation(Landroid/location/Location;Lcom/leanplum/LeanplumLocationAccuracyType;)V
    .registers 4

    sget-boolean v0, Lcom/leanplum/Leanplum;->locationCollectionEnabled:Z

    if-eqz v0, :cond_c

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "Leanplum is automatically collecting device location, so there is no need to call setDeviceLocation. If you prefer to always set location manually, then call disableLocationCollection."

    invoke-static {v1, v0}, Lcom/leanplum/internal/Log;->i(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_c
    new-instance v0, Lcom/leanplum/Leanplum$19;

    invoke-direct {v0}, Lcom/leanplum/Leanplum$19;-><init>()V

    invoke-static {p0, p1, v0}, Lcom/leanplum/internal/LeanplumInternal;->setUserLocationAttribute(Landroid/location/Location;Lcom/leanplum/LeanplumLocationAccuracyType;Lcom/leanplum/internal/LeanplumInternal$locationAttributeRequestsCallback;)V

    return-void
.end method

.method public static setEnableMultipleInAppsWithPriorityZero(Z)V
    .registers 1

    const/4 p0, 0x1

    sput-boolean p0, Lcom/leanplum/internal/Constants;->enableMultipleActionsWithPriorityZero:Z

    return-void
.end method

.method public static setEventsUploadInterval(Lcom/leanplum/EventsUploadInterval;)V
    .registers 2

    if-eqz p0, :cond_9

    invoke-static {}, Lcom/leanplum/internal/RequestSenderTimer;->get()Lcom/leanplum/internal/RequestSenderTimer;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/leanplum/internal/RequestSenderTimer;->setTimerInterval(Lcom/leanplum/EventsUploadInterval;)V

    :cond_9
    return-void
.end method

.method public static setFileUploadingEnabledInDevelopmentMode(Z)V
    .registers 1

    sput-boolean p0, Lcom/leanplum/internal/Constants;->enableFileUploadingInDevelopmentMode:Z

    return-void
.end method

.method public static setIsTestModeEnabled(Z)V
    .registers 1

    sput-boolean p0, Lcom/leanplum/internal/Constants;->isTestMode:Z

    return-void
.end method

.method public static setLogLevel(I)V
    .registers 1

    invoke-static {p0}, Lcom/leanplum/internal/Log;->setLogLevel(I)V

    return-void
.end method

.method public static setNetworkTimeout(II)V
    .registers 3

    const/4 v0, 0x0

    if-gez p0, :cond_b

    const-string p0, "setNetworkTimeout - Invalid seconds parameter provided."

    new-array p1, v0, [Ljava/lang/Object;

    invoke-static {p0, p1}, Lcom/leanplum/internal/Log;->i(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_b
    if-gez p1, :cond_15

    const-string p0, "setNetworkTimeout - Invalid downloadSeconds parameter provided."

    new-array p1, v0, [Ljava/lang/Object;

    invoke-static {p0, p1}, Lcom/leanplum/internal/Log;->i(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_15
    sput p0, Lcom/leanplum/internal/Constants;->NETWORK_TIMEOUT_SECONDS:I

    sput p1, Lcom/leanplum/internal/Constants;->NETWORK_TIMEOUT_SECONDS_FOR_DOWNLOADS:I

    return-void
.end method

.method public static setPushDeliveryTracking(Z)V
    .registers 1

    sput-boolean p0, Lcom/leanplum/Leanplum;->pushDeliveryTrackingEnabled:Z

    return-void
.end method

.method public static setRegistrationId(Lcom/leanplum/PushProviderType;Ljava/lang/String;)V
    .registers 3

    invoke-static {}, Lcom/leanplum/internal/Constants;->isNoop()Z

    move-result v0

    if-nez v0, :cond_14

    sget-object v0, Lcom/leanplum/Leanplum$20;->$SwitchMap$com$leanplum$PushProviderType:[I

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    aget p0, v0, p0

    const/4 v0, 0x1

    if-eq p0, v0, :cond_18

    const/4 v0, 0x2

    if-eq p0, v0, :cond_15

    :cond_14
    return-void

    :cond_15
    const-string p0, "miPushRegId"

    goto :goto_1a

    :cond_18
    const-string p0, "gcmRegistrationId"

    :goto_1a
    new-instance v0, Lcom/leanplum/Leanplum$12;

    invoke-direct {v0, p0, p1}, Lcom/leanplum/Leanplum$12;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/leanplum/internal/LeanplumInternal;->addStartIssuedHandler(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static setSocketConnectionSettings(Ljava/lang/String;I)V
    .registers 4

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_f

    const-string p0, "setSocketConnectionSettings - Empty hostName parameter provided."

    new-array p1, v1, [Ljava/lang/Object;

    invoke-static {p0, p1}, Lcom/leanplum/internal/Log;->i(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_f
    const/4 v0, 0x1

    if-lt p1, v0, :cond_1c

    const v0, 0xffff

    if-gt p1, v0, :cond_1c

    sput-object p0, Lcom/leanplum/internal/Constants;->SOCKET_HOST:Ljava/lang/String;

    sput p1, Lcom/leanplum/internal/Constants;->SOCKET_PORT:I

    return-void

    :cond_1c
    const-string p0, "setSocketConnectionSettings - Invalid port parameter provided."

    new-array p1, v1, [Ljava/lang/Object;

    invoke-static {p0, p1}, Lcom/leanplum/internal/Log;->i(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method public static setTrafficSourceInfo(Ljava/util/Map;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    invoke-static {}, Lcom/leanplum/internal/Constants;->isNoop()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    invoke-static {}, Lcom/leanplum/internal/LeanplumInternal;->hasCalledStart()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_16

    const-string p0, "You cannot call setTrafficSourceInfo before calling start"

    new-array v0, v1, [Ljava/lang/Object;

    invoke-static {p0, v0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_16
    if-eqz p0, :cond_4a

    invoke-interface {p0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_4a

    :try_start_1e
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v2, "info"

    invoke-static {p0, v2, v1}, Lcom/leanplum/internal/LeanplumInternal;->validateAttributes(Ljava/util/Map;Ljava/lang/String;Z)Ljava/util/Map;

    move-result-object p0

    const-string v1, "trafficSource"

    invoke-static {p0}, Lcom/leanplum/internal/JsonConverter;->toJson(Ljava/util/Map;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Lcom/leanplum/internal/LeanplumInternal;->issuedStart()Z

    move-result p0

    if-eqz p0, :cond_3c

    invoke-static {v0}, Lcom/leanplum/Leanplum;->setTrafficSourceInfoInternal(Ljava/util/HashMap;)V

    return-void

    :cond_3c
    new-instance p0, Lcom/leanplum/Leanplum$13;

    invoke-direct {p0, v0}, Lcom/leanplum/Leanplum$13;-><init>(Ljava/util/HashMap;)V

    invoke-static {p0}, Lcom/leanplum/internal/LeanplumInternal;->addStartIssuedHandler(Ljava/lang/Runnable;)V
    :try_end_44
    .catchall {:try_start_1e .. :try_end_44} :catchall_45

    return-void

    :catchall_45
    move-exception p0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return-void

    :cond_4a
    const-string p0, "setTrafficSourceInfo - Invalid info parameter provided (null or empty)."

    new-array v0, v1, [Ljava/lang/Object;

    invoke-static {p0, v0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method private static setTrafficSourceInfoInternal(Ljava/util/HashMap;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    invoke-static {}, Lcom/leanplum/internal/RequestBuilder;->withSetTrafficSourceInfoAction()Lcom/leanplum/internal/RequestBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/leanplum/internal/RequestBuilder;->andParams(Ljava/util/Map;)Lcom/leanplum/internal/RequestBuilder;

    move-result-object p0

    invoke-virtual {p0}, Lcom/leanplum/internal/RequestBuilder;->create()Lcom/leanplum/internal/Request;

    move-result-object p0

    invoke-static {}, Lcom/leanplum/internal/RequestSender;->getInstance()Lcom/leanplum/internal/RequestSender;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/leanplum/internal/RequestSender;->send(Lcom/leanplum/internal/Request;)V

    return-void
.end method

.method public static setUserAttributes(Ljava/lang/String;Ljava/util/Map;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "*>;)V"
        }
    .end annotation

    const-string v0, "userAttributes"

    invoke-static {}, Lcom/leanplum/internal/Constants;->isNoop()Z

    move-result v1

    if-eqz v1, :cond_9

    return-void

    :cond_9
    invoke-static {}, Lcom/leanplum/internal/LeanplumInternal;->hasCalledStart()Z

    move-result v1

    if-nez v1, :cond_18

    const/4 p0, 0x0

    new-array p0, p0, [Ljava/lang/Object;

    const-string p1, "You cannot call setUserAttributes before calling start"

    invoke-static {p1, p0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_18
    :try_start_18
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    if-eqz p0, :cond_24

    const-string v2, "newUserId"

    invoke-virtual {v1, v2, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_24
    if-eqz p1, :cond_39

    const/4 v2, 0x1

    invoke-static {p1, v0, v2}, Lcom/leanplum/internal/LeanplumInternal;->validateAttributes(Ljava/util/Map;Ljava/lang/String;Z)Ljava/util/Map;

    move-result-object p1

    invoke-static {p1}, Lcom/leanplum/internal/JsonConverter;->toJson(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Lcom/leanplum/internal/LeanplumInternal;->getUserAttributeChanges()Ljava/util/Queue;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    :cond_39
    invoke-static {}, Lcom/leanplum/internal/LeanplumInternal;->issuedStart()Z

    move-result p1

    if-eqz p1, :cond_43

    invoke-static {p0, v1}, Lcom/leanplum/Leanplum;->setUserAttributesInternal(Ljava/lang/String;Ljava/util/HashMap;)V

    return-void

    :cond_43
    new-instance p1, Lcom/leanplum/Leanplum$11;

    invoke-direct {p1, p0, v1}, Lcom/leanplum/Leanplum$11;-><init>(Ljava/lang/String;Ljava/util/HashMap;)V

    invoke-static {p1}, Lcom/leanplum/internal/LeanplumInternal;->addStartIssuedHandler(Ljava/lang/Runnable;)V
    :try_end_4b
    .catchall {:try_start_18 .. :try_end_4b} :catchall_4c

    return-void

    :catchall_4c
    move-exception p0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static setUserAttributes(Ljava/util/Map;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    if-eqz p0, :cond_d

    .line 81
    invoke-interface {p0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_d

    const/4 v0, 0x0

    .line 82
    invoke-static {v0, p0}, Lcom/leanplum/Leanplum;->setUserAttributes(Ljava/lang/String;Ljava/util/Map;)V

    return-void

    :cond_d
    const/4 p0, 0x0

    .line 83
    new-array p0, p0, [Ljava/lang/Object;

    const-string v0, "setUserAttributes - Invalid userAttributes parameter provided (null or empty)."

    invoke-static {v0, p0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method private static setUserAttributesInternal(Ljava/lang/String;Ljava/util/HashMap;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    invoke-static {}, Lcom/leanplum/internal/RequestBuilder;->withSetUserAttributesAction()Lcom/leanplum/internal/RequestBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/leanplum/internal/RequestBuilder;->andParams(Ljava/util/Map;)Lcom/leanplum/internal/RequestBuilder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/leanplum/internal/RequestBuilder;->create()Lcom/leanplum/internal/Request;

    move-result-object p1

    invoke-static {}, Lcom/leanplum/internal/RequestSender;->getInstance()Lcom/leanplum/internal/RequestSender;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/leanplum/internal/RequestSender;->send(Lcom/leanplum/internal/Request;)V

    if-eqz p0, :cond_2b

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p1

    if-lez p1, :cond_2b

    invoke-static {}, Lcom/leanplum/internal/APIConfig;->getInstance()Lcom/leanplum/internal/APIConfig;

    move-result-object p1

    invoke-virtual {p1, p0}, Lcom/leanplum/internal/APIConfig;->setUserId(Ljava/lang/String;)V

    invoke-static {}, Lcom/leanplum/internal/LeanplumInternal;->hasStarted()Z

    move-result p0

    if-eqz p0, :cond_2b

    invoke-static {}, Lcom/leanplum/internal/VarCache;->saveDiffs()V

    :cond_2b
    invoke-static {}, Lcom/leanplum/internal/LeanplumInternal;->recordAttributeChanges()V

    return-void
.end method

.method public static setUserId(Ljava/lang/String;)V
    .registers 2

    if-nez p0, :cond_b

    const/4 p0, 0x0

    new-array p0, p0, [Ljava/lang/Object;

    const-string v0, "setUserId - Invalid userId parameter provided."

    invoke-static {v0, p0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_b
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/leanplum/Leanplum;->setUserAttributes(Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public static setVariantDebugInfoEnabled(Z)V
    .registers 1

    invoke-static {p0}, Lcom/leanplum/internal/LeanplumInternal;->setIsVariantDebugInfoEnabled(Z)V

    return-void
.end method

.method public static start(Landroid/content/Context;)V
    .registers 2

    const/4 v0, 0x0

    .line 261
    invoke-static {p0, v0, v0, v0, v0}, Lcom/leanplum/Leanplum;->start(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;Lcom/leanplum/callbacks/StartCallback;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static start(Landroid/content/Context;Lcom/leanplum/callbacks/StartCallback;)V
    .registers 3

    const/4 v0, 0x0

    .line 254
    invoke-static {p0, v0, v0, p1, v0}, Lcom/leanplum/Leanplum;->start(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;Lcom/leanplum/callbacks/StartCallback;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static start(Landroid/content/Context;Ljava/lang/String;)V
    .registers 3

    const/4 v0, 0x0

    .line 256
    invoke-static {p0, p1, v0, v0, v0}, Lcom/leanplum/Leanplum;->start(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;Lcom/leanplum/callbacks/StartCallback;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static start(Landroid/content/Context;Ljava/lang/String;Lcom/leanplum/callbacks/StartCallback;)V
    .registers 4

    const/4 v0, 0x0

    .line 257
    invoke-static {p0, p1, v0, p2, v0}, Lcom/leanplum/Leanplum;->start(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;Lcom/leanplum/callbacks/StartCallback;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static start(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "*>;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 258
    invoke-static {p0, p1, p2, v0, v0}, Lcom/leanplum/Leanplum;->start(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;Lcom/leanplum/callbacks/StartCallback;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static declared-synchronized start(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;Lcom/leanplum/callbacks/StartCallback;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "*>;",
            "Lcom/leanplum/callbacks/StartCallback;",
            ")V"
        }
    .end annotation

    const-class v0, Lcom/leanplum/Leanplum;

    monitor-enter v0

    const/4 v1, 0x0

    .line 259
    :try_start_4
    invoke-static {p0, p1, p2, p3, v1}, Lcom/leanplum/Leanplum;->start(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;Lcom/leanplum/callbacks/StartCallback;Ljava/lang/Boolean;)V
    :try_end_7
    .catchall {:try_start_4 .. :try_end_7} :catchall_b

    .line 260
    monitor-exit v0

    return-void

    :goto_9
    :try_start_9
    monitor-exit v0
    :try_end_a
    .catchall {:try_start_9 .. :try_end_a} :catchall_b

    throw p0

    :catchall_b
    move-exception p0

    goto :goto_9
.end method

.method public static declared-synchronized start(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;Lcom/leanplum/callbacks/StartCallback;Ljava/lang/Boolean;)V
    .registers 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "*>;",
            "Lcom/leanplum/callbacks/StartCallback;",
            "Ljava/lang/Boolean;",
            ")V"
        }
    .end annotation

    const-class v1, Lcom/leanplum/Leanplum;

    monitor-enter v1

    :try_start_3
    invoke-static {}, Lcom/leanplum/internal/APIConfig;->getInstance()Lcom/leanplum/internal/APIConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/leanplum/internal/APIConfig;->appId()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_14

    invoke-static {}, Lcom/leanplum/Leanplum;->loadApiConfigFromResources()V

    :cond_14
    invoke-static {p0}, Lcom/leanplum/LeanplumActivityHelper;->setCurrentActivity(Landroid/content/Context;)V

    const/4 v0, 0x0

    const/4 v2, 0x1

    if-nez p4, :cond_2b

    invoke-static {}, Lcom/leanplum/LeanplumActivityHelper;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v3

    if-eqz v3, :cond_29

    invoke-static {}, Lcom/leanplum/LeanplumActivityHelper;->isActivityPaused()Z

    move-result v3

    if-nez v3, :cond_29

    move v3, v0

    goto :goto_2f

    :cond_29
    move v3, v2

    goto :goto_2f

    :cond_2b
    invoke-virtual/range {p4 .. p4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    :goto_2f
    invoke-static {}, Lcom/leanplum/internal/Constants;->isNoop()Z

    move-result v4

    if-eqz v4, :cond_77

    invoke-static {v2}, Lcom/leanplum/internal/LeanplumInternal;->setHasStarted(Z)V

    invoke-static {v2}, Lcom/leanplum/internal/LeanplumInternal;->setStartSuccessful(Z)V

    invoke-static {v2}, Lcom/leanplum/Leanplum;->triggerStartResponse(Z)V

    invoke-static {}, Lcom/leanplum/Leanplum;->triggerVariablesChanged()V

    invoke-static {}, Lcom/leanplum/Leanplum;->triggerVariablesChangedAndNoDownloadsPending()V

    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    new-instance v10, Ljava/util/HashMap;

    invoke-direct {v10}, Ljava/util/HashMap;-><init>()V

    const-string v11, ""

    const-string v12, ""

    invoke-static/range {v5 .. v12}, Lcom/leanplum/internal/VarCache;->applyVariableDiffs(Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Ljava/util/List;Ljava/util/List;Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/leanplum/LeanplumInbox;->getInstance()Lcom/leanplum/LeanplumInbox;

    move-result-object p0

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {p0, p1, v0, v0}, Lcom/leanplum/LeanplumInbox;->update(Ljava/util/Map;IZ)V
    :try_end_75
    .catchall {:try_start_3 .. :try_end_75} :catchall_f2

    monitor-exit v1

    return-void

    :cond_77
    if-eqz p3, :cond_7c

    :try_start_79
    invoke-static/range {p3 .. p3}, Lcom/leanplum/Leanplum;->addStartResponseHandler(Lcom/leanplum/callbacks/StartCallback;)V

    :cond_7c
    if-eqz p0, :cond_85

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lcom/leanplum/Leanplum;->setApplicationContext(Landroid/content/Context;)V

    :cond_85
    invoke-static {}, Lcom/leanplum/internal/LeanplumInternal;->hasCalledStart()Z

    move-result v4

    if-eqz v4, :cond_9b

    if-nez v3, :cond_99

    invoke-static {}, Lcom/leanplum/internal/LeanplumInternal;->hasStartedInBackground()Z

    move-result p0

    if-eqz p0, :cond_99

    invoke-static {v0}, Lcom/leanplum/internal/LeanplumInternal;->setStartedInBackground(Z)V

    invoke-static {}, Lcom/leanplum/internal/LeanplumInternal;->moveToForeground()V
    :try_end_99
    .catchall {:try_start_79 .. :try_end_99} :catchall_f2

    :cond_99
    monitor-exit v1

    return-void

    :cond_9b
    :try_start_9b
    invoke-static {}, Lcom/leanplum/Leanplum;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lcom/leanplum/messagetemplates/MessageTemplates;->register(Landroid/content/Context;)V

    invoke-static {v3}, Lcom/leanplum/internal/LeanplumInternal;->setStartedInBackground(Z)V

    const-string v4, "userAttributes"

    invoke-static {p2, v4, v2}, Lcom/leanplum/internal/LeanplumInternal;->validateAttributes(Ljava/util/Map;Ljava/lang/String;Z)Ljava/util/Map;

    move-result-object p2

    invoke-static {v2}, Lcom/leanplum/internal/LeanplumInternal;->setCalledStart(Z)V

    if-eqz p2, :cond_b7

    invoke-static {}, Lcom/leanplum/internal/LeanplumInternal;->getUserAttributeChanges()Ljava/util/Queue;

    move-result-object v4

    invoke-interface {v4, p2}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    :cond_b7
    invoke-static {}, Lcom/leanplum/internal/APIConfig;->getInstance()Lcom/leanplum/internal/APIConfig;

    move-result-object v4

    invoke-virtual {v4}, Lcom/leanplum/internal/APIConfig;->loadToken()V

    invoke-static {v2}, Lcom/leanplum/internal/VarCache;->setSilent(Z)V

    invoke-static {}, Lcom/leanplum/internal/VarCache;->loadDiffs()V

    invoke-static {v0}, Lcom/leanplum/internal/VarCache;->setSilent(Z)V

    invoke-static {}, Lcom/leanplum/LeanplumInbox;->getInstance()Lcom/leanplum/LeanplumInbox;

    move-result-object v0

    invoke-virtual {v0}, Lcom/leanplum/LeanplumInbox;->load()V

    new-instance v0, Lcom/leanplum/Leanplum$1;

    invoke-direct {v0}, Lcom/leanplum/Leanplum$1;-><init>()V

    invoke-static {v0}, Lcom/leanplum/internal/VarCache;->onUpdate(Lcom/leanplum/CacheUpdateBlock;)V

    invoke-static {}, Lcom/leanplum/internal/FileTransferManager;->getInstance()Lcom/leanplum/internal/FileTransferManager;

    move-result-object v0

    new-instance v2, Lcom/leanplum/Leanplum$2;

    invoke-direct {v2}, Lcom/leanplum/Leanplum$2;-><init>()V

    invoke-virtual {v0, v2}, Lcom/leanplum/internal/FileTransferManager;->onNoPendingDownloads(Lcom/leanplum/internal/FileTransferManager$NoPendingDownloadsCallback;)V

    invoke-static {}, Lcom/leanplum/internal/OperationQueue;->sharedInstance()Lcom/leanplum/internal/OperationQueue;

    move-result-object v0

    new-instance v2, Lcom/leanplum/Leanplum$3;

    invoke-direct {v2, p1, p2, v3}, Lcom/leanplum/Leanplum$3;-><init>(Ljava/lang/String;Ljava/util/Map;Z)V

    invoke-virtual {v0, v2}, Lcom/leanplum/internal/OperationQueue;->addParallelOperation(Ljava/lang/Runnable;)V

    invoke-static {p0}, Lcom/leanplum/internal/Util;->initExceptionHandling(Landroid/content/Context;)V
    :try_end_f1
    .catchall {:try_start_9b .. :try_end_f1} :catchall_f2

    goto :goto_f7

    :catchall_f2
    move-exception v0

    move-object p0, v0

    :try_start_f4
    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V
    :try_end_f7
    .catchall {:try_start_f4 .. :try_end_f7} :catchall_fb

    :goto_f7
    monitor-exit v1

    return-void

    :goto_f9
    :try_start_f9
    monitor-exit v1
    :try_end_fa
    .catchall {:try_start_f9 .. :try_end_fa} :catchall_fb

    throw p0

    :catchall_fb
    move-exception v0

    move-object p0, v0

    goto :goto_f9
.end method

.method public static start(Landroid/content/Context;Ljava/util/Map;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "*>;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 255
    invoke-static {p0, v0, p1, v0, v0}, Lcom/leanplum/Leanplum;->start(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;Lcom/leanplum/callbacks/StartCallback;Ljava/lang/Boolean;)V

    return-void
.end method

.method private static startHelper(Ljava/lang/String;Ljava/util/Map;Z)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "*>;Z)V"
        }
    .end annotation

    invoke-static {}, Lcom/leanplum/internal/LeanplumEventDataManager;->sharedInstance()Lcom/leanplum/internal/LeanplumEventDataManager;

    invoke-static {}, Lcom/leanplum/Leanplum;->checkAndStartNotificationsModules()V

    invoke-static {}, Lcom/leanplum/internal/APIConfig;->getInstance()Lcom/leanplum/internal/APIConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/leanplum/internal/APIConfig;->deviceId()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-nez v0, :cond_55

    sget-boolean v0, Lcom/leanplum/Leanplum;->userSpecifiedDeviceId:Z

    if-nez v0, :cond_24

    sget-object v0, Lcom/leanplum/internal/Constants;->defaultDeviceId:Ljava/lang/String;

    if-eqz v0, :cond_24

    const-string v0, "Using default deviceID"

    new-array v3, v1, [Ljava/lang/Object;

    invoke-static {v0, v3}, Lcom/leanplum/internal/Log;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    sget-object v0, Lcom/leanplum/internal/Constants;->defaultDeviceId:Ljava/lang/String;

    goto :goto_4e

    :cond_24
    sget-object v0, Lcom/leanplum/Leanplum;->customDeviceId:Ljava/lang/String;

    if-eqz v0, :cond_32

    const-string v0, "Using custom deviceID"

    new-array v3, v1, [Ljava/lang/Object;

    invoke-static {v0, v3}, Lcom/leanplum/internal/Log;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    sget-object v0, Lcom/leanplum/Leanplum;->customDeviceId:Ljava/lang/String;

    goto :goto_4e

    :cond_32
    sget-object v0, Lcom/leanplum/Leanplum;->deviceIdMode:Lcom/leanplum/LeanplumDeviceIdMode;

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const-string v2, "Using deviceID for mode: %s"

    invoke-static {v2, v0}, Lcom/leanplum/internal/Log;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    sget-object v0, Lcom/leanplum/Leanplum;->deviceIdMode:Lcom/leanplum/LeanplumDeviceIdMode;

    invoke-static {v0}, Lcom/leanplum/internal/Util;->getDeviceId(Lcom/leanplum/LeanplumDeviceIdMode;)Lcom/leanplum/internal/Util$DeviceIdInfo;

    move-result-object v0

    iget-object v2, v0, Lcom/leanplum/internal/Util$DeviceIdInfo;->id:Ljava/lang/String;

    iget-boolean v0, v0, Lcom/leanplum/internal/Util$DeviceIdInfo;->limitAdTracking:Z

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    move-object v4, v2

    move-object v2, v0

    move-object v0, v4

    :goto_4e
    invoke-static {}, Lcom/leanplum/internal/APIConfig;->getInstance()Lcom/leanplum/internal/APIConfig;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/leanplum/internal/APIConfig;->setDeviceId(Ljava/lang/String;)V

    :cond_55
    if-nez p0, :cond_70

    invoke-static {}, Lcom/leanplum/internal/APIConfig;->getInstance()Lcom/leanplum/internal/APIConfig;

    move-result-object p0

    invoke-virtual {p0}, Lcom/leanplum/internal/APIConfig;->userId()Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_70

    const-string p0, "setting deviceID as userID"

    new-array v0, v1, [Ljava/lang/Object;

    invoke-static {p0, v0}, Lcom/leanplum/internal/Log;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-static {}, Lcom/leanplum/internal/APIConfig;->getInstance()Lcom/leanplum/internal/APIConfig;

    move-result-object p0

    invoke-virtual {p0}, Lcom/leanplum/internal/APIConfig;->deviceId()Ljava/lang/String;

    move-result-object p0

    :cond_70
    invoke-static {}, Lcom/leanplum/internal/APIConfig;->getInstance()Lcom/leanplum/internal/APIConfig;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/leanplum/internal/APIConfig;->setUserId(Ljava/lang/String;)V

    new-instance p0, Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    if-eqz p2, :cond_85

    const-string v0, "background"

    const-string v1, "true"

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_85
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, v2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_96

    const-string v0, "limitTracking"

    invoke-virtual {v2}, Ljava/lang/Boolean;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_96
    if-eqz p1, :cond_a1

    const-string v0, "userAttributes"

    invoke-static {p1}, Lcom/leanplum/internal/JsonConverter;->toJson(Ljava/util/Map;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_a1
    invoke-static {p0}, Lcom/leanplum/Leanplum;->fillCommonParameters(Ljava/util/Map;)Ljava/util/Map;

    invoke-static {p0}, Lcom/leanplum/internal/Util;->initializePreLeanplumInstall(Ljava/util/Map;)V

    if-eqz p2, :cond_ac

    sget-object p1, Lcom/leanplum/internal/Request$RequestType;->DEFAULT:Lcom/leanplum/internal/Request$RequestType;

    goto :goto_ae

    :cond_ac
    sget-object p1, Lcom/leanplum/internal/Request$RequestType;->IMMEDIATE:Lcom/leanplum/internal/Request$RequestType;

    :goto_ae
    invoke-static {}, Lcom/leanplum/internal/RequestBuilder;->withStartAction()Lcom/leanplum/internal/RequestBuilder;

    move-result-object p2

    invoke-virtual {p2, p0}, Lcom/leanplum/internal/RequestBuilder;->andParams(Ljava/util/Map;)Lcom/leanplum/internal/RequestBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Lcom/leanplum/internal/RequestBuilder;->andType(Lcom/leanplum/internal/Request$RequestType;)Lcom/leanplum/internal/RequestBuilder;

    move-result-object p0

    invoke-virtual {p0}, Lcom/leanplum/internal/RequestBuilder;->create()Lcom/leanplum/internal/Request;

    move-result-object p0

    new-instance p1, Lcom/leanplum/Leanplum$4;

    invoke-direct {p1}, Lcom/leanplum/Leanplum$4;-><init>()V

    invoke-virtual {p0, p1}, Lcom/leanplum/internal/Request;->onResponse(Lcom/leanplum/internal/Request$ResponseCallback;)V

    new-instance p1, Lcom/leanplum/Leanplum$5;

    invoke-direct {p1}, Lcom/leanplum/Leanplum$5;-><init>()V

    invoke-virtual {p0, p1}, Lcom/leanplum/internal/Request;->onError(Lcom/leanplum/internal/Request$ErrorCallback;)V

    invoke-static {}, Lcom/leanplum/internal/RequestSender;->getInstance()Lcom/leanplum/internal/RequestSender;

    move-result-object p1

    invoke-virtual {p1, p0}, Lcom/leanplum/internal/RequestSender;->send(Lcom/leanplum/internal/Request;)V

    invoke-static {}, Lcom/leanplum/internal/LeanplumInternal;->triggerStartIssued()V

    return-void
.end method

.method private static startRequestTimer()V
    .registers 1

    invoke-static {}, Lcom/leanplum/internal/RequestSenderTimer;->get()Lcom/leanplum/internal/RequestSenderTimer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/leanplum/internal/RequestSenderTimer;->start()V

    return-void
.end method

.method public static stop()V
    .registers 2

    invoke-static {}, Lcom/leanplum/internal/Constants;->isNoop()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    invoke-static {}, Lcom/leanplum/internal/LeanplumInternal;->hasCalledStart()Z

    move-result v0

    if-nez v0, :cond_16

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "You cannot call stop before calling start"

    invoke-static {v1, v0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_16
    invoke-static {}, Lcom/leanplum/internal/LeanplumInternal;->issuedStart()Z

    move-result v0

    if-eqz v0, :cond_20

    invoke-static {}, Lcom/leanplum/Leanplum;->stopInternal()V

    return-void

    :cond_20
    new-instance v0, Lcom/leanplum/Leanplum$10;

    invoke-direct {v0}, Lcom/leanplum/Leanplum$10;-><init>()V

    invoke-static {v0}, Lcom/leanplum/internal/LeanplumInternal;->addStartIssuedHandler(Ljava/lang/Runnable;)V

    return-void
.end method

.method private static stopInternal()V
    .registers 2

    invoke-static {}, Lcom/leanplum/internal/RequestBuilder;->withStopAction()Lcom/leanplum/internal/RequestBuilder;

    move-result-object v0

    sget-object v1, Lcom/leanplum/internal/Request$RequestType;->IMMEDIATE:Lcom/leanplum/internal/Request$RequestType;

    invoke-virtual {v0, v1}, Lcom/leanplum/internal/RequestBuilder;->andType(Lcom/leanplum/internal/Request$RequestType;)Lcom/leanplum/internal/RequestBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/leanplum/internal/RequestBuilder;->create()Lcom/leanplum/internal/Request;

    move-result-object v0

    invoke-static {}, Lcom/leanplum/internal/RequestSender;->getInstance()Lcom/leanplum/internal/RequestSender;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/leanplum/internal/RequestSender;->send(Lcom/leanplum/internal/Request;)V

    return-void
.end method

.method private static stopRequestTimer()V
    .registers 1

    invoke-static {}, Lcom/leanplum/internal/RequestSenderTimer;->get()Lcom/leanplum/internal/RequestSenderTimer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/leanplum/internal/RequestSenderTimer;->stop()V

    return-void
.end method

.method public static syncResources()V
    .registers 2

    invoke-static {}, Lcom/leanplum/internal/Constants;->isNoop()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    const/4 v0, 0x0

    const/4 v1, 0x0

    :try_start_9
    invoke-static {v1, v1, v0}, Lcom/leanplum/internal/FileManager;->enableResourceSyncing(Ljava/util/List;Ljava/util/List;Z)V
    :try_end_c
    .catchall {:try_start_9 .. :try_end_c} :catchall_d

    return-void

    :catchall_d
    move-exception v0

    invoke-static {v0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static syncResources(Ljava/util/List;Ljava/util/List;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 18
    :try_start_1
    invoke-static {p0, p1, v0}, Lcom/leanplum/internal/FileManager;->enableResourceSyncing(Ljava/util/List;Ljava/util/List;Z)V
    :try_end_4
    .catchall {:try_start_1 .. :try_end_4} :catchall_5

    return-void

    :catchall_5
    move-exception p0

    .line 19
    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static syncResourcesAsync()V
    .registers 2

    invoke-static {}, Lcom/leanplum/internal/Constants;->isNoop()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    const/4 v0, 0x1

    const/4 v1, 0x0

    :try_start_9
    invoke-static {v1, v1, v0}, Lcom/leanplum/internal/FileManager;->enableResourceSyncing(Ljava/util/List;Ljava/util/List;Z)V
    :try_end_c
    .catchall {:try_start_9 .. :try_end_c} :catchall_d

    return-void

    :catchall_d
    move-exception v0

    invoke-static {v0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static syncResourcesAsync(Ljava/util/List;Ljava/util/List;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x1

    .line 18
    :try_start_1
    invoke-static {p0, p1, v0}, Lcom/leanplum/internal/FileManager;->enableResourceSyncing(Ljava/util/List;Ljava/util/List;Z)V
    :try_end_4
    .catchall {:try_start_1 .. :try_end_4} :catchall_5

    return-void

    :catchall_5
    move-exception p0

    .line 19
    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return-void
.end method

.method private static toSet(Lorg/json/JSONArray;)Ljava/util/Set;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONArray;",
            ")",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    if-eqz p0, :cond_18

    const/4 v1, 0x0

    :goto_8
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v1, v2, :cond_18

    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    :cond_18
    return-object v0
.end method

.method public static track(Ljava/lang/String;)V
    .registers 5

    .line 9
    const-string v0, ""

    const/4 v1, 0x0

    const-wide/16 v2, 0x0

    invoke-static {p0, v2, v3, v0, v1}, Lcom/leanplum/Leanplum;->track(Ljava/lang/String;DLjava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public static track(Ljava/lang/String;D)V
    .registers 5

    .line 10
    const-string v0, ""

    const/4 v1, 0x0

    invoke-static {p0, p1, p2, v0, v1}, Lcom/leanplum/Leanplum;->track(Ljava/lang/String;DLjava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public static track(Ljava/lang/String;DLjava/lang/String;)V
    .registers 5

    const/4 v0, 0x0

    .line 14
    invoke-static {p0, p1, p2, p3, v0}, Lcom/leanplum/Leanplum;->track(Ljava/lang/String;DLjava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public static track(Ljava/lang/String;DLjava/lang/String;Ljava/util/Map;)V
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "D",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "*>;)V"
        }
    .end annotation

    const/4 v5, 0x0

    move-object v0, p0

    move-wide v1, p1

    move-object v3, p3

    move-object v4, p4

    invoke-static/range {v0 .. v5}, Lcom/leanplum/internal/LeanplumInternal;->track(Ljava/lang/String;DLjava/lang/String;Ljava/util/Map;Ljava/util/Map;)V

    return-void
.end method

.method public static track(Ljava/lang/String;DLjava/util/Map;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "D",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "*>;)V"
        }
    .end annotation

    .line 13
    const-string v0, ""

    invoke-static {p0, p1, p2, v0, p3}, Lcom/leanplum/Leanplum;->track(Ljava/lang/String;DLjava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public static track(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5

    const-wide/16 v0, 0x0

    const/4 v2, 0x0

    .line 11
    invoke-static {p0, v0, v1, p1, v2}, Lcom/leanplum/Leanplum;->track(Ljava/lang/String;DLjava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public static track(Ljava/lang/String;Ljava/util/Map;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "*>;)V"
        }
    .end annotation

    const-wide/16 v0, 0x0

    .line 12
    const-string v2, ""

    invoke-static {p0, v0, v1, v2, p1}, Lcom/leanplum/Leanplum;->track(Ljava/lang/String;DLjava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public static trackAllAppScreens()V
    .registers 0

    invoke-static {}, Lcom/leanplum/internal/LeanplumInternal;->enableAutomaticScreenTracking()V

    return-void
.end method

.method public static trackGeofence(Lcom/leanplum/models/GeofenceEventType;Ljava/lang/String;)V
    .registers 9

    invoke-static {}, Lcom/leanplum/Leanplum;->featureFlagManager()Lcom/leanplum/internal/FeatureFlagManager;

    move-result-object v0

    const-string v1, "track_geofence"

    invoke-virtual {v0, v1}, Lcom/leanplum/internal/FeatureFlagManager;->isFeatureFlagEnabled(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_19

    const/4 v5, 0x0

    const/4 v6, 0x0

    const-wide/16 v2, 0x0

    move-object v1, p0

    move-object v4, p1

    invoke-static/range {v1 .. v6}, Lcom/leanplum/internal/LeanplumInternal;->trackGeofence(Lcom/leanplum/models/GeofenceEventType;DLjava/lang/String;Ljava/util/Map;Ljava/util/Map;)V

    :cond_19
    return-void
.end method

.method public static trackGooglePlayPurchase(Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 14

    .line 66
    const-string v0, "Purchase"

    const/4 v7, 0x0

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-static/range {v0 .. v7}, Lcom/leanplum/Leanplum;->trackGooglePlayPurchase(Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public static trackGooglePlayPurchase(Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .registers 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "J",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "*>;)V"
        }
    .end annotation

    .line 65
    const-string v0, "Purchase"

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    move-object v7, p6

    invoke-static/range {v0 .. v7}, Lcom/leanplum/Leanplum;->trackGooglePlayPurchase(Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public static trackGooglePlayPurchase(Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "J",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "*>;)V"
        }
    .end annotation

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "Failed to trackGooglePlayPurchase, event name is null"

    invoke-static {v1, v0}, Lcom/leanplum/internal/Log;->i(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_e
    move-object v0, p5

    new-instance p5, Ljava/util/HashMap;

    invoke-direct {p5}, Ljava/util/HashMap;-><init>()V

    const-string v1, "googlePlayPurchaseData"

    invoke-virtual {p5, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "googlePlayPurchaseDataSignature"

    invoke-virtual {p5, v0, p6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p6, "currencyCode"

    invoke-virtual {p5, p6, p4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-nez p7, :cond_2b

    new-instance p4, Ljava/util/HashMap;

    invoke-direct {p4}, Ljava/util/HashMap;-><init>()V

    goto :goto_30

    :cond_2b
    new-instance p4, Ljava/util/HashMap;

    invoke-direct {p4, p7}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    :goto_30
    const-string p6, "item"

    invoke-interface {p4, p6, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    long-to-double p1, p2

    const-wide p6, 0x412e848000000000L    # 1000000.0

    div-double/2addr p1, p6

    const/4 p3, 0x0

    invoke-static/range {p0 .. p5}, Lcom/leanplum/internal/LeanplumInternal;->track(Ljava/lang/String;DLjava/lang/String;Ljava/util/Map;Ljava/util/Map;)V

    return-void
.end method

.method public static trackLocal(Ljava/lang/String;)V
    .registers 2

    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/leanplum/Leanplum;->trackLocal(Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public static trackLocal(Ljava/lang/String;Ljava/util/Map;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "*>;)V"
        }
    .end annotation

    .line 5
    invoke-static {p0, p1}, Lcom/leanplum/internal/LeanplumInternal;->trackLocal(Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public static trackPurchase(Ljava/lang/String;DLjava/lang/String;Ljava/util/Map;)V
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "D",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "*>;)V"
        }
    .end annotation

    :try_start_0
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_e

    const-string v0, "Failed to trackPurchase, event name is null"

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/leanplum/internal/Log;->i(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_e
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1e

    const-string v0, "currencyCode"

    invoke-virtual {v5, v0, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1e
    const/4 v3, 0x0

    move-object v0, p0

    move-wide v1, p1

    move-object v4, p4

    invoke-static/range {v0 .. v5}, Lcom/leanplum/internal/LeanplumInternal;->track(Ljava/lang/String;DLjava/lang/String;Ljava/util/Map;Ljava/util/Map;)V
    :try_end_25
    .catchall {:try_start_0 .. :try_end_25} :catchall_26

    return-void

    :catchall_26
    move-exception v0

    move-object p0, v0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static triggerMessageDisplayed(Lcom/leanplum/ActionContext;)V
    .registers 6

    sget-object v0, Lcom/leanplum/Leanplum;->messageDisplayedHandlers:Ljava/util/ArrayList;

    monitor-enter v0

    :try_start_3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_8
    if-ge v2, v1, :cond_21

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lcom/leanplum/callbacks/MessageDisplayedCallback;

    invoke-static {p0}, Lcom/leanplum/Leanplum;->messageArchiveDataFromContext(Lcom/leanplum/ActionContext;)Lcom/leanplum/models/MessageArchiveData;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/leanplum/callbacks/MessageDisplayedCallback;->setMessageArchiveData(Lcom/leanplum/models/MessageArchiveData;)V

    invoke-static {}, Lcom/leanplum/internal/OperationQueue;->sharedInstance()Lcom/leanplum/internal/OperationQueue;

    move-result-object v4

    invoke-virtual {v4, v3}, Lcom/leanplum/internal/OperationQueue;->addUiOperation(Ljava/lang/Runnable;)V

    goto :goto_8

    :cond_21
    monitor-exit v0

    return-void

    :goto_23
    monitor-exit v0
    :try_end_24
    .catchall {:try_start_3 .. :try_end_24} :catchall_25

    throw p0

    :catchall_25
    move-exception p0

    goto :goto_23
.end method

.method private static triggerStartResponse(Z)V
    .registers 6

    sget-object v0, Lcom/leanplum/Leanplum;->startHandlers:Ljava/util/ArrayList;

    monitor-enter v0

    :try_start_3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_8
    if-ge v2, v1, :cond_1d

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lcom/leanplum/callbacks/StartCallback;

    invoke-virtual {v3, p0}, Lcom/leanplum/callbacks/StartCallback;->setSuccess(Z)V

    invoke-static {}, Lcom/leanplum/internal/OperationQueue;->sharedInstance()Lcom/leanplum/internal/OperationQueue;

    move-result-object v4

    invoke-virtual {v4, v3}, Lcom/leanplum/internal/OperationQueue;->addUiOperation(Ljava/lang/Runnable;)V

    goto :goto_8

    :cond_1d
    sget-object p0, Lcom/leanplum/Leanplum;->startHandlers:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    monitor-exit v0

    return-void

    :goto_24
    monitor-exit v0
    :try_end_25
    .catchall {:try_start_3 .. :try_end_25} :catchall_26

    throw p0

    :catchall_26
    move-exception p0

    goto :goto_24
.end method

.method private static triggerVariablesChanged()V
    .registers 5

    sget-object v0, Lcom/leanplum/Leanplum;->variablesChangedHandlers:Ljava/util/ArrayList;

    monitor-enter v0

    :try_start_3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_8
    if-ge v2, v1, :cond_1a

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lcom/leanplum/callbacks/VariablesChangedCallback;

    invoke-static {}, Lcom/leanplum/internal/OperationQueue;->sharedInstance()Lcom/leanplum/internal/OperationQueue;

    move-result-object v4

    invoke-virtual {v4, v3}, Lcom/leanplum/internal/OperationQueue;->addUiOperation(Ljava/lang/Runnable;)V

    goto :goto_8

    :cond_1a
    monitor-exit v0

    return-void

    :goto_1c
    monitor-exit v0
    :try_end_1d
    .catchall {:try_start_3 .. :try_end_1d} :catchall_1e

    throw v1

    :catchall_1e
    move-exception v1

    goto :goto_1c
.end method

.method public static triggerVariablesChangedAndNoDownloadsPending()V
    .registers 6

    sget-object v0, Lcom/leanplum/Leanplum;->noDownloadsHandlers:Ljava/util/ArrayList;

    monitor-enter v0

    :try_start_3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    move v3, v2

    :goto_9
    if-ge v3, v1, :cond_1b

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    check-cast v4, Lcom/leanplum/callbacks/VariablesChangedCallback;

    invoke-static {}, Lcom/leanplum/internal/OperationQueue;->sharedInstance()Lcom/leanplum/internal/OperationQueue;

    move-result-object v5

    invoke-virtual {v5, v4}, Lcom/leanplum/internal/OperationQueue;->addUiOperation(Ljava/lang/Runnable;)V

    goto :goto_9

    :cond_1b
    monitor-exit v0
    :try_end_1c
    .catchall {:try_start_3 .. :try_end_1c} :catchall_42

    sget-object v1, Lcom/leanplum/Leanplum;->onceNoDownloadsHandlers:Ljava/util/ArrayList;

    monitor-enter v1

    :try_start_1f
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_23
    if-ge v2, v0, :cond_35

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lcom/leanplum/callbacks/VariablesChangedCallback;

    invoke-static {}, Lcom/leanplum/internal/OperationQueue;->sharedInstance()Lcom/leanplum/internal/OperationQueue;

    move-result-object v4

    invoke-virtual {v4, v3}, Lcom/leanplum/internal/OperationQueue;->addUiOperation(Ljava/lang/Runnable;)V

    goto :goto_23

    :cond_35
    sget-object v0, Lcom/leanplum/Leanplum;->onceNoDownloadsHandlers:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    monitor-exit v1

    return-void

    :goto_3c
    monitor-exit v1
    :try_end_3d
    .catchall {:try_start_1f .. :try_end_3d} :catchall_3e

    throw v0

    :catchall_3e
    move-exception v0

    goto :goto_3c

    :goto_40
    :try_start_40
    monitor-exit v0
    :try_end_41
    .catchall {:try_start_40 .. :try_end_41} :catchall_42

    throw v1

    :catchall_42
    move-exception v1

    goto :goto_40
.end method

.method public static variants()Ljava/util/List;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    invoke-static {}, Lcom/leanplum/internal/VarCache;->variants()Ljava/util/List;

    move-result-object v0

    if-nez v0, :cond_b

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    :cond_b
    return-object v0
.end method
