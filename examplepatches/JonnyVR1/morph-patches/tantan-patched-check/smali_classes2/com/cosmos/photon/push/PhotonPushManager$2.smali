.class Lcom/cosmos/photon/push/PhotonPushManager$2;
.super Lcom/cosmos/photon/push/thirdparty/PushBridge;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cosmos/photon/push/PhotonPushManager;->init(Landroid/app/Application;Ljava/lang/String;Lcom/cosmos/photon/push/PushMessageReceiver;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cosmos/photon/push/PhotonPushManager;

.field final synthetic val$commandCallback:Lcom/cosmos/photon/push/PushMessageReceiver;


# direct methods
.method public constructor <init>(Lcom/cosmos/photon/push/PhotonPushManager;Lcom/cosmos/photon/push/PushMessageReceiver;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cosmos/photon/push/PhotonPushManager$2;->this$0:Lcom/cosmos/photon/push/PhotonPushManager;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/cosmos/photon/push/PhotonPushManager$2;->val$commandCallback:Lcom/cosmos/photon/push/PushMessageReceiver;

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/cosmos/photon/push/thirdparty/PushBridge;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public getRegisteredToken()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cosmos/photon/push/PhotonPushManager$2;->this$0:Lcom/cosmos/photon/push/PhotonPushManager;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/cosmos/photon/push/PhotonPushManager;->access$300(Lcom/cosmos/photon/push/PhotonPushManager;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public onGetTokenResult(ZLjava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cosmos/photon/push/PhotonPushManager$2;->val$commandCallback:Lcom/cosmos/photon/push/PushMessageReceiver;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/cosmos/photon/push/PushMessageReceiver;->onGetTokenResult(ZLjava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public declared-synchronized onPushRegisterResult(IILjava/lang/String;)V
    .locals 3

    .line 1
    const-string v0, "QiangGe_666_888_999"

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/cosmos/photon/push/PhotonPushManager$2;->this$0:Lcom/cosmos/photon/push/PhotonPushManager;

    .line 5
    .line 6
    invoke-static {v1, p3}, Lcom/cosmos/photon/push/PhotonPushManager;->access$302(Lcom/cosmos/photon/push/PhotonPushManager;Ljava/lang/String;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    invoke-static {}, Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;->getPushSdk()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x7

    .line 14
    if-ne v1, v2, :cond_0

    .line 15
    .line 16
    iget-object v1, p0, Lcom/cosmos/photon/push/PhotonPushManager$2;->this$0:Lcom/cosmos/photon/push/PhotonPushManager;

    .line 17
    .line 18
    new-instance v2, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/cosmos/photon/push/PhotonPushManager$2;->this$0:Lcom/cosmos/photon/push/PhotonPushManager;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/cosmos/photon/push/PhotonPushManager;->access$300(Lcom/cosmos/photon/push/PhotonPushManager;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-static {v1, v0}, Lcom/cosmos/photon/push/PhotonPushManager;->access$302(Lcom/cosmos/photon/push/PhotonPushManager;Ljava/lang/String;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :catchall_0
    move-exception p1

    .line 41
    goto :goto_1

    .line 42
    :cond_0
    :goto_0
    const-string v0, "MoPush-ThirdNotify"

    .line 43
    .line 44
    const-string v1, "code:%d  token: %s"

    .line 45
    .line 46
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    filled-new-array {v2, p3}, [Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-static {v0, v1, v2}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/cosmos/photon/push/PhotonPushManager$2;->val$commandCallback:Lcom/cosmos/photon/push/PushMessageReceiver;

    .line 58
    .line 59
    if-eqz v0, :cond_1

    .line 60
    .line 61
    invoke-virtual {v0, p1, p2, p3}, Lcom/cosmos/photon/push/PushMessageReceiver;->onThirdPushRegisterResult(IILjava/lang/String;)V

    .line 62
    .line 63
    .line 64
    :cond_1
    iget-object p1, p0, Lcom/cosmos/photon/push/PhotonPushManager$2;->this$0:Lcom/cosmos/photon/push/PhotonPushManager;

    .line 65
    .line 66
    invoke-static {p1}, Lcom/cosmos/photon/push/PhotonPushManager;->access$400(Lcom/cosmos/photon/push/PhotonPushManager;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 67
    .line 68
    .line 69
    monitor-exit p0

    .line 70
    return-void

    .line 71
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 72
    throw p1
.end method

.method public onReceiveAssistThirdNotification(ILcom/cosmos/photon/push/thirdparty/NotificationWrapper;)V
    .locals 2

    .line 1
    invoke-static {p2}, Lcom/cosmos/photon/push/notification/MoNotify;->create(Lcom/cosmos/photon/push/thirdparty/NotificationWrapper;)Lcom/cosmos/photon/push/notification/MoNotify;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/cosmos/photon/push/DataProcessor;->getPushSource(Lcom/cosmos/photon/push/notification/MoNotify;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    new-instance p2, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 10
    .line 11
    invoke-direct {p2}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p2, p1}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->pushSource(Ljava/lang/String;)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    iget-wide v0, p0, Lcom/cosmos/photon/push/notification/MoNotify;->time:J

    .line 19
    .line 20
    invoke-virtual {p2, v0, v1}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->time(J)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    iget-object v0, p0, Lcom/cosmos/photon/push/notification/MoNotify;->data:Ljava/util/HashMap;

    .line 25
    .line 26
    invoke-virtual {p2, v0}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->data(Ljava/util/Map;)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    sget v0, Lcom/cosmos/photon/push/statistic/EventLogBody;->TYPE_ARRIVED:I

    .line 31
    .line 32
    invoke-virtual {p2, v0}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->type(I)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    iget v0, p0, Lcom/cosmos/photon/push/notification/MoNotify;->logType:I

    .line 37
    .line 38
    invoke-virtual {p2, v0}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->uploadType(I)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    invoke-virtual {p2}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->build()Lcom/cosmos/photon/push/statistic/EventLogBody;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    invoke-static {p2}, Lcom/cosmos/photon/push/statistic/PushEventStatistic;->logPushEventInfo(Lcom/cosmos/photon/push/statistic/EventLogBody;)V

    .line 47
    .line 48
    .line 49
    sget-object p2, Lcom/cosmos/photon/push/PhotonPushManager;->messageReceiver:Lcom/cosmos/photon/push/PushMessageReceiver;

    .line 50
    .line 51
    invoke-virtual {p2, p0}, Lcom/cosmos/photon/push/PushMessageReceiver;->onNotificationShow(Lcom/cosmos/photon/push/notification/MoNotify;)Z

    .line 52
    .line 53
    .line 54
    move-result p2

    .line 55
    if-nez p2, :cond_0

    .line 56
    .line 57
    invoke-static {p0}, Lcom/cosmos/photon/push/DataProcessor;->onPushArrivedInner(Lcom/cosmos/photon/push/notification/MoNotify;)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_0
    new-instance p2, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 62
    .line 63
    invoke-direct {p2}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;-><init>()V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p2, p1}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->pushSource(Ljava/lang/String;)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    iget-wide v0, p0, Lcom/cosmos/photon/push/notification/MoNotify;->time:J

    .line 71
    .line 72
    invoke-virtual {p1, v0, v1}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->time(J)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    iget-object v0, p0, Lcom/cosmos/photon/push/notification/MoNotify;->data:Ljava/util/HashMap;

    .line 77
    .line 78
    invoke-virtual {p1, v0}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->data(Ljava/util/Map;)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    iget p0, p0, Lcom/cosmos/photon/push/notification/MoNotify;->logType:I

    .line 83
    .line 84
    invoke-virtual {p1, p0}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->uploadType(I)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    sget p1, Lcom/cosmos/photon/push/statistic/EventLogBody;->TYPE_ARRIVED_NOT_SHOWN:I

    .line 89
    .line 90
    invoke-virtual {p0, p1}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->type(I)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    const/4 p1, 0x7

    .line 95
    invoke-virtual {p0, p1}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->reason(I)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {p2}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->build()Lcom/cosmos/photon/push/statistic/EventLogBody;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-static {p0}, Lcom/cosmos/photon/push/statistic/PushEventStatistic;->logPushEventInfo(Lcom/cosmos/photon/push/statistic/EventLogBody;)V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public onReceiveAssistThirdToken(ILjava/lang/String;)V
    .locals 4

    .line 1
    const-string v0, "MoPush-ThirdNotify"

    .line 2
    .line 3
    const-string v1, "onReceiveAssistThirdToken assistTokenType:%d  token: %s"

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    filled-new-array {v2, p2}, [Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-static {v0, v1, v2}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/cosmos/photon/push/PhotonPushManager$2;->this$0:Lcom/cosmos/photon/push/PhotonPushManager;

    .line 17
    .line 18
    monitor-enter v0

    .line 19
    :try_start_0
    iget-object v1, p0, Lcom/cosmos/photon/push/PhotonPushManager$2;->this$0:Lcom/cosmos/photon/push/PhotonPushManager;

    .line 20
    .line 21
    invoke-static {v1}, Lcom/cosmos/photon/push/PhotonPushManager;->access$500(Lcom/cosmos/photon/push/PhotonPushManager;)Ljava/util/Map;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    check-cast v1, Lcom/cosmos/photon/push/PhotonPushManager$AssistPushCache;

    .line 34
    .line 35
    if-nez v1, :cond_0

    .line 36
    .line 37
    new-instance v1, Lcom/cosmos/photon/push/PhotonPushManager$AssistPushCache;

    .line 38
    .line 39
    iget-object v2, p0, Lcom/cosmos/photon/push/PhotonPushManager$2;->this$0:Lcom/cosmos/photon/push/PhotonPushManager;

    .line 40
    .line 41
    invoke-direct {v1, v2}, Lcom/cosmos/photon/push/PhotonPushManager$AssistPushCache;-><init>(Lcom/cosmos/photon/push/PhotonPushManager;)V

    .line 42
    .line 43
    .line 44
    iget-object v2, p0, Lcom/cosmos/photon/push/PhotonPushManager$2;->this$0:Lcom/cosmos/photon/push/PhotonPushManager;

    .line 45
    .line 46
    invoke-static {v2}, Lcom/cosmos/photon/push/PhotonPushManager;->access$500(Lcom/cosmos/photon/push/PhotonPushManager;)Ljava/util/Map;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :catchall_0
    move-exception p0

    .line 59
    goto :goto_1

    .line 60
    :cond_0
    :goto_0
    iget-object v2, p0, Lcom/cosmos/photon/push/PhotonPushManager$2;->this$0:Lcom/cosmos/photon/push/PhotonPushManager;

    .line 61
    .line 62
    invoke-static {v2}, Lcom/cosmos/photon/push/PhotonPushManager;->access$600(Lcom/cosmos/photon/push/PhotonPushManager;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    iput-object v2, v1, Lcom/cosmos/photon/push/PhotonPushManager$AssistPushCache;->selfToken:Ljava/lang/String;

    .line 67
    .line 68
    iput-object p2, v1, Lcom/cosmos/photon/push/PhotonPushManager$AssistPushCache;->assistThirdToken:Ljava/lang/String;

    .line 69
    .line 70
    iget-object p0, p0, Lcom/cosmos/photon/push/PhotonPushManager$2;->this$0:Lcom/cosmos/photon/push/PhotonPushManager;

    .line 71
    .line 72
    invoke-static {p0, p1, v1}, Lcom/cosmos/photon/push/PhotonPushManager;->access$700(Lcom/cosmos/photon/push/PhotonPushManager;ILcom/cosmos/photon/push/PhotonPushManager$AssistPushCache;)V

    .line 73
    .line 74
    .line 75
    monitor-exit v0

    .line 76
    return-void

    .line 77
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 78
    throw p0
.end method

.method public onReceivePassThroughMessage(ILjava/lang/String;)V
    .locals 2

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    :try_start_0
    new-instance p0, Lorg/json/JSONObject;

    .line 5
    .line 6
    invoke-direct {p0, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    new-instance p2, Lcom/cosmos/photon/push/msg/MoMessage;

    .line 10
    .line 11
    invoke-direct {p2}, Lcom/cosmos/photon/push/msg/MoMessage;-><init>()V

    .line 12
    .line 13
    .line 14
    const-string v0, "id"

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p2, Lcom/cosmos/photon/push/msg/MoMessage;->id:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {}, Lcom/cosmos/photon/push/util/AppContext;->getPackageName()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p2, Lcom/cosmos/photon/push/msg/MoMessage;->toPkg:Ljava/lang/String;

    .line 27
    .line 28
    const-string v0, "time"

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    .line 31
    .line 32
    .line 33
    move-result-wide v0

    .line 34
    iput-wide v0, p2, Lcom/cosmos/photon/push/msg/MoMessage;->time:J

    .line 35
    .line 36
    const-string v0, "type"

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iput v0, p2, Lcom/cosmos/photon/push/msg/MoMessage;->type:I

    .line 43
    .line 44
    const-string v0, "text"

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    iput-object p0, p2, Lcom/cosmos/photon/push/msg/MoMessage;->text:Ljava/lang/String;

    .line 51
    .line 52
    const-string p0, "MOMOIM_PUSH"

    .line 53
    .line 54
    const-string v0, "onReceivePassThroughMessage [%d] <--:%s"

    .line 55
    .line 56
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-virtual {p2}, Lcom/cosmos/photon/push/msg/MoMessage;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    filled-new-array {p1, v1}, [Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-static {p0, v0, p1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 69
    .line 70
    .line 71
    invoke-static {p2}, Lcom/cosmos/photon/push/DataProcessor;->onMsgArrivedInner(Lcom/cosmos/photon/push/msg/MoMessage;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :catch_0
    move-exception p0

    .line 76
    const-string p1, "MoPush-Notify"

    .line 77
    .line 78
    invoke-static {p1, p0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public onUnRegisterResult(II)V
    .locals 0

    .line 1
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p0, p0, Lcom/cosmos/photon/push/PhotonPushManager$2;->this$0:Lcom/cosmos/photon/push/PhotonPushManager;

    .line 6
    .line 7
    invoke-static {p0}, Lcom/cosmos/photon/push/PhotonPushManager;->access$300(Lcom/cosmos/photon/push/PhotonPushManager;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    filled-new-array {p1, p0}, [Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string p1, "MoPush-ThirdNotify"

    .line 16
    .line 17
    const-string p2, "code:%d  token: %s"

    .line 18
    .line 19
    invoke-static {p1, p2, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
