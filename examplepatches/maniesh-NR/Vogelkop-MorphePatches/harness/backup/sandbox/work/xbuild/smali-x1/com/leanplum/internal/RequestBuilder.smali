.class public Lcom/leanplum/internal/RequestBuilder;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final ACTION_ADVANCE:Ljava/lang/String; = "advance"

.field public static final ACTION_DELETE_INBOX_MESSAGE:Ljava/lang/String; = "deleteNewsfeedMessage"

.field public static final ACTION_DOWNLOAD_FILE:Ljava/lang/String; = "downloadFile"

.field public static final ACTION_GET_INBOX_MESSAGES:Ljava/lang/String; = "getNewsfeedMessages"

.field public static final ACTION_GET_VARS:Ljava/lang/String; = "getVars"

.field public static final ACTION_HEARTBEAT:Ljava/lang/String; = "heartbeat"

.field public static final ACTION_LOG:Ljava/lang/String; = "log"

.field public static final ACTION_MARK_INBOX_MESSAGE_AS_READ:Ljava/lang/String; = "markNewsfeedMessageAsRead"

.field public static final ACTION_MULTI:Ljava/lang/String; = "multi"

.field public static final ACTION_PAUSE_SESSION:Ljava/lang/String; = "pauseSession"

.field public static final ACTION_PAUSE_STATE:Ljava/lang/String; = "pauseState"

.field public static final ACTION_REGISTER_FOR_DEVELOPMENT:Ljava/lang/String; = "registerDevice"

.field public static final ACTION_RESTART:Ljava/lang/String; = "restart"

.field public static final ACTION_RESUME_SESSION:Ljava/lang/String; = "resumeSession"

.field public static final ACTION_RESUME_STATE:Ljava/lang/String; = "resumeState"

.field public static final ACTION_SET_DEVICE_ATTRIBUTES:Ljava/lang/String; = "setDeviceAttributes"

.field public static final ACTION_SET_TRAFFIC_SOURCE_INFO:Ljava/lang/String; = "setTrafficSourceInfo"

.field public static final ACTION_SET_USER_ATTRIBUTES:Ljava/lang/String; = "setUserAttributes"

.field public static final ACTION_SET_VARS:Ljava/lang/String; = "setVars"

.field public static final ACTION_START:Ljava/lang/String; = "start"

.field public static final ACTION_STOP:Ljava/lang/String; = "stop"

.field public static final ACTION_TRACK:Ljava/lang/String; = "track"

.field public static final ACTION_TRACK_GEOFENCE:Ljava/lang/String; = "trackGeofence"

.field public static final ACTION_UPLOAD_FILE:Ljava/lang/String; = "uploadFile"

.field public static final GET:Ljava/lang/String; = "GET"

.field public static final POST:Ljava/lang/String; = "POST"


# instance fields
.field private apiAction:Ljava/lang/String;

.field private httpMethod:Ljava/lang/String;

.field private params:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private type:Lcom/leanplum/internal/Request$RequestType;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lcom/leanplum/internal/Request$RequestType;->DEFAULT:Lcom/leanplum/internal/Request$RequestType;

    iput-object v0, p0, Lcom/leanplum/internal/RequestBuilder;->type:Lcom/leanplum/internal/Request$RequestType;

    iput-object p1, p0, Lcom/leanplum/internal/RequestBuilder;->httpMethod:Ljava/lang/String;

    iput-object p2, p0, Lcom/leanplum/internal/RequestBuilder;->apiAction:Ljava/lang/String;

    return-void
.end method

.method public static withAdvanceAction()Lcom/leanplum/internal/RequestBuilder;
    .registers 3

    new-instance v0, Lcom/leanplum/internal/RequestBuilder;

    const-string v1, "POST"

    const-string v2, "advance"

    invoke-direct {v0, v1, v2}, Lcom/leanplum/internal/RequestBuilder;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static withDeleteInboxMessageAction()Lcom/leanplum/internal/RequestBuilder;
    .registers 3

    new-instance v0, Lcom/leanplum/internal/RequestBuilder;

    const-string v1, "POST"

    const-string v2, "deleteNewsfeedMessage"

    invoke-direct {v0, v1, v2}, Lcom/leanplum/internal/RequestBuilder;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static withDownloadFileAction()Lcom/leanplum/internal/RequestBuilder;
    .registers 3

    new-instance v0, Lcom/leanplum/internal/RequestBuilder;

    const-string v1, "GET"

    const-string v2, "downloadFile"

    invoke-direct {v0, v1, v2}, Lcom/leanplum/internal/RequestBuilder;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static withGetInboxMessagesAction()Lcom/leanplum/internal/RequestBuilder;
    .registers 3

    new-instance v0, Lcom/leanplum/internal/RequestBuilder;

    const-string v1, "POST"

    const-string v2, "getNewsfeedMessages"

    invoke-direct {v0, v1, v2}, Lcom/leanplum/internal/RequestBuilder;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static withGetVarsAction()Lcom/leanplum/internal/RequestBuilder;
    .registers 3

    new-instance v0, Lcom/leanplum/internal/RequestBuilder;

    const-string v1, "POST"

    const-string v2, "getVars"

    invoke-direct {v0, v1, v2}, Lcom/leanplum/internal/RequestBuilder;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static withHeartbeatAction()Lcom/leanplum/internal/RequestBuilder;
    .registers 3

    new-instance v0, Lcom/leanplum/internal/RequestBuilder;

    const-string v1, "POST"

    const-string v2, "heartbeat"

    invoke-direct {v0, v1, v2}, Lcom/leanplum/internal/RequestBuilder;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static withLogAction()Lcom/leanplum/internal/RequestBuilder;
    .registers 3

    new-instance v0, Lcom/leanplum/internal/RequestBuilder;

    const-string v1, "POST"

    const-string v2, "log"

    invoke-direct {v0, v1, v2}, Lcom/leanplum/internal/RequestBuilder;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static withMarkInboxMessageAsReadAction()Lcom/leanplum/internal/RequestBuilder;
    .registers 3

    new-instance v0, Lcom/leanplum/internal/RequestBuilder;

    const-string v1, "POST"

    const-string v2, "markNewsfeedMessageAsRead"

    invoke-direct {v0, v1, v2}, Lcom/leanplum/internal/RequestBuilder;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static withMultiAction()Lcom/leanplum/internal/RequestBuilder;
    .registers 3

    new-instance v0, Lcom/leanplum/internal/RequestBuilder;

    const-string v1, "POST"

    const-string v2, "multi"

    invoke-direct {v0, v1, v2}, Lcom/leanplum/internal/RequestBuilder;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static withPauseSessionAction()Lcom/leanplum/internal/RequestBuilder;
    .registers 3

    new-instance v0, Lcom/leanplum/internal/RequestBuilder;

    const-string v1, "POST"

    const-string v2, "pauseSession"

    invoke-direct {v0, v1, v2}, Lcom/leanplum/internal/RequestBuilder;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static withPauseStateAction()Lcom/leanplum/internal/RequestBuilder;
    .registers 3

    new-instance v0, Lcom/leanplum/internal/RequestBuilder;

    const-string v1, "POST"

    const-string v2, "pauseState"

    invoke-direct {v0, v1, v2}, Lcom/leanplum/internal/RequestBuilder;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static withRegisterForDevelopmentAction()Lcom/leanplum/internal/RequestBuilder;
    .registers 3

    new-instance v0, Lcom/leanplum/internal/RequestBuilder;

    const-string v1, "POST"

    const-string v2, "registerDevice"

    invoke-direct {v0, v1, v2}, Lcom/leanplum/internal/RequestBuilder;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static withRestartAction()Lcom/leanplum/internal/RequestBuilder;
    .registers 3

    new-instance v0, Lcom/leanplum/internal/RequestBuilder;

    const-string v1, "POST"

    const-string v2, "restart"

    invoke-direct {v0, v1, v2}, Lcom/leanplum/internal/RequestBuilder;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static withResumeSessionAction()Lcom/leanplum/internal/RequestBuilder;
    .registers 3

    new-instance v0, Lcom/leanplum/internal/RequestBuilder;

    const-string v1, "POST"

    const-string v2, "resumeSession"

    invoke-direct {v0, v1, v2}, Lcom/leanplum/internal/RequestBuilder;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static withResumeStateAction()Lcom/leanplum/internal/RequestBuilder;
    .registers 3

    new-instance v0, Lcom/leanplum/internal/RequestBuilder;

    const-string v1, "POST"

    const-string v2, "resumeState"

    invoke-direct {v0, v1, v2}, Lcom/leanplum/internal/RequestBuilder;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static withSetDeviceAttributesAction()Lcom/leanplum/internal/RequestBuilder;
    .registers 3

    new-instance v0, Lcom/leanplum/internal/RequestBuilder;

    const-string v1, "POST"

    const-string v2, "setDeviceAttributes"

    invoke-direct {v0, v1, v2}, Lcom/leanplum/internal/RequestBuilder;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static withSetTrafficSourceInfoAction()Lcom/leanplum/internal/RequestBuilder;
    .registers 3

    new-instance v0, Lcom/leanplum/internal/RequestBuilder;

    const-string v1, "POST"

    const-string v2, "setTrafficSourceInfo"

    invoke-direct {v0, v1, v2}, Lcom/leanplum/internal/RequestBuilder;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static withSetUserAttributesAction()Lcom/leanplum/internal/RequestBuilder;
    .registers 3

    new-instance v0, Lcom/leanplum/internal/RequestBuilder;

    const-string v1, "POST"

    const-string v2, "setUserAttributes"

    invoke-direct {v0, v1, v2}, Lcom/leanplum/internal/RequestBuilder;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static withSetVarsAction()Lcom/leanplum/internal/RequestBuilder;
    .registers 3

    new-instance v0, Lcom/leanplum/internal/RequestBuilder;

    const-string v1, "POST"

    const-string v2, "setVars"

    invoke-direct {v0, v1, v2}, Lcom/leanplum/internal/RequestBuilder;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static withStartAction()Lcom/leanplum/internal/RequestBuilder;
    .registers 3

    new-instance v0, Lcom/leanplum/internal/RequestBuilder;

    const-string v1, "POST"

    const-string v2, "start"

    invoke-direct {v0, v1, v2}, Lcom/leanplum/internal/RequestBuilder;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static withStopAction()Lcom/leanplum/internal/RequestBuilder;
    .registers 3

    new-instance v0, Lcom/leanplum/internal/RequestBuilder;

    const-string v1, "POST"

    const-string v2, "stop"

    invoke-direct {v0, v1, v2}, Lcom/leanplum/internal/RequestBuilder;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static withTrackAction()Lcom/leanplum/internal/RequestBuilder;
    .registers 3

    new-instance v0, Lcom/leanplum/internal/RequestBuilder;

    const-string v1, "POST"

    const-string v2, "track"

    invoke-direct {v0, v1, v2}, Lcom/leanplum/internal/RequestBuilder;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static withTrackGeofenceAction()Lcom/leanplum/internal/RequestBuilder;
    .registers 3

    new-instance v0, Lcom/leanplum/internal/RequestBuilder;

    const-string v1, "POST"

    const-string v2, "trackGeofence"

    invoke-direct {v0, v1, v2}, Lcom/leanplum/internal/RequestBuilder;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static withUploadFileAction()Lcom/leanplum/internal/RequestBuilder;
    .registers 3

    new-instance v0, Lcom/leanplum/internal/RequestBuilder;

    const-string v1, "POST"

    const-string v2, "uploadFile"

    invoke-direct {v0, v1, v2}, Lcom/leanplum/internal/RequestBuilder;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public andParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/leanplum/internal/RequestBuilder;
    .registers 4

    iget-object v0, p0, Lcom/leanplum/internal/RequestBuilder;->params:Ljava/util/Map;

    if-nez v0, :cond_b

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/leanplum/internal/RequestBuilder;->params:Ljava/util/Map;

    :cond_b
    iget-object v0, p0, Lcom/leanplum/internal/RequestBuilder;->params:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method

.method public andParams(Ljava/util/Map;)Lcom/leanplum/internal/RequestBuilder;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/leanplum/internal/RequestBuilder;"
        }
    .end annotation

    iget-object v0, p0, Lcom/leanplum/internal/RequestBuilder;->params:Ljava/util/Map;

    if-nez v0, :cond_7

    iput-object p1, p0, Lcom/leanplum/internal/RequestBuilder;->params:Ljava/util/Map;

    return-object p0

    :cond_7
    invoke-interface {v0, p1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    return-object p0
.end method

.method public andType(Lcom/leanplum/internal/Request$RequestType;)Lcom/leanplum/internal/RequestBuilder;
    .registers 2

    iput-object p1, p0, Lcom/leanplum/internal/RequestBuilder;->type:Lcom/leanplum/internal/Request$RequestType;

    return-object p0
.end method

.method public create()Lcom/leanplum/internal/Request;
    .registers 5

    iget-object v0, p0, Lcom/leanplum/internal/RequestBuilder;->apiAction:Ljava/lang/String;

    iget-object v1, p0, Lcom/leanplum/internal/RequestBuilder;->params:Ljava/util/Map;

    filled-new-array {v0, v1}, [Ljava/lang/Object;

    move-result-object v0

    const-string v1, "Will call API method: %s with params: %s"

    invoke-static {v1, v0}, Lcom/leanplum/internal/Log;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-static {}, Lcom/leanplum/internal/RequestFactory;->getInstance()Lcom/leanplum/internal/RequestFactory;

    move-result-object v0

    iget-object v1, p0, Lcom/leanplum/internal/RequestBuilder;->httpMethod:Ljava/lang/String;

    iget-object v2, p0, Lcom/leanplum/internal/RequestBuilder;->apiAction:Ljava/lang/String;

    iget-object v3, p0, Lcom/leanplum/internal/RequestBuilder;->type:Lcom/leanplum/internal/Request$RequestType;

    iget-object p0, p0, Lcom/leanplum/internal/RequestBuilder;->params:Ljava/util/Map;

    invoke-virtual {v0, v1, v2, v3, p0}, Lcom/leanplum/internal/RequestFactory;->createRequest(Ljava/lang/String;Ljava/lang/String;Lcom/leanplum/internal/Request$RequestType;Ljava/util/Map;)Lcom/leanplum/internal/Request;

    move-result-object p0

    return-object p0
.end method

.method public getApiAction()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lcom/leanplum/internal/RequestBuilder;->apiAction:Ljava/lang/String;

    return-object p0
.end method

.method public getHttpMethod()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lcom/leanplum/internal/RequestBuilder;->httpMethod:Ljava/lang/String;

    return-object p0
.end method

.method public getParams()Ljava/util/Map;
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

    iget-object p0, p0, Lcom/leanplum/internal/RequestBuilder;->params:Ljava/util/Map;

    return-object p0
.end method

.method public getType()Lcom/leanplum/internal/Request$RequestType;
    .registers 1

    iget-object p0, p0, Lcom/leanplum/internal/RequestBuilder;->type:Lcom/leanplum/internal/Request$RequestType;

    return-object p0
.end method
