.class Lcom/momo/momortc/MMRtcEngineImpl$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/momortc/MMRtcHttpUtils$MMRtcHttpCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/momortc/MMRtcEngineImpl;->joinChannel(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;J)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/momo/momortc/MMRtcEngineImpl;

.field final synthetic val$appid:Ljava/lang/String;

.field final synthetic val$channelName:Ljava/lang/String;

.field final synthetic val$key:Ljava/lang/String;

.field final synthetic val$secretKey:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/momo/momortc/MMRtcEngineImpl;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/momortc/MMRtcEngineImpl$1;->this$0:Lcom/momo/momortc/MMRtcEngineImpl;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/momo/momortc/MMRtcEngineImpl$1;->val$key:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/momo/momortc/MMRtcEngineImpl$1;->val$appid:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/momo/momortc/MMRtcEngineImpl$1;->val$secretKey:Ljava/lang/String;

    .line 8
    .line 9
    iput-object p5, p0, Lcom/momo/momortc/MMRtcEngineImpl$1;->val$channelName:Ljava/lang/String;

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public onError(ILjava/lang/String;)V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl$1;->this$0:Lcom/momo/momortc/MMRtcEngineImpl;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/momortc/MMRtcEngineImpl;->access$400(Lcom/momo/momortc/MMRtcEngineImpl;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/momo/momortc/MMRtcEngineImpl$1;->this$0:Lcom/momo/momortc/MMRtcEngineImpl;

    .line 8
    .line 9
    const/4 v2, 0x5

    .line 10
    if-ge v0, v2, :cond_0

    .line 11
    .line 12
    invoke-static {v1}, Lcom/momo/momortc/MMRtcEngineImpl;->access$408(Lcom/momo/momortc/MMRtcEngineImpl;)I

    .line 13
    .line 14
    .line 15
    const-wide/16 v0, 0x12c

    .line 16
    .line 17
    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :catch_0
    move-exception v0

    .line 22
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 23
    .line 24
    .line 25
    :goto_0
    invoke-static {}, Lcom/momo/momortc/MMRtcHttpUtils;->getInstance()Lcom/momo/momortc/MMRtcHttpUtils;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl$1;->this$0:Lcom/momo/momortc/MMRtcEngineImpl;

    .line 30
    .line 31
    invoke-static {v0}, Lcom/momo/momortc/MMRtcEngineImpl;->access$500(Lcom/momo/momortc/MMRtcEngineImpl;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    iget-object v3, p0, Lcom/momo/momortc/MMRtcEngineImpl$1;->val$key:Ljava/lang/String;

    .line 36
    .line 37
    iget-object v4, p0, Lcom/momo/momortc/MMRtcEngineImpl$1;->val$appid:Ljava/lang/String;

    .line 38
    .line 39
    iget-object v5, p0, Lcom/momo/momortc/MMRtcEngineImpl$1;->val$secretKey:Ljava/lang/String;

    .line 40
    .line 41
    iget-object v6, p0, Lcom/momo/momortc/MMRtcEngineImpl$1;->val$channelName:Ljava/lang/String;

    .line 42
    .line 43
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl$1;->this$0:Lcom/momo/momortc/MMRtcEngineImpl;

    .line 44
    .line 45
    invoke-static {v0}, Lcom/momo/momortc/MMRtcEngineImpl;->access$600(Lcom/momo/momortc/MMRtcEngineImpl;)Z

    .line 46
    .line 47
    .line 48
    move-result v8

    .line 49
    move-object v7, p0

    .line 50
    invoke-virtual/range {v1 .. v8}, Lcom/momo/momortc/MMRtcHttpUtils;->postSignalDispatchEx(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/momo/momortc/MMRtcHttpUtils$MMRtcHttpCallback;Z)V

    .line 51
    .line 52
    .line 53
    iget-object p0, v7, Lcom/momo/momortc/MMRtcEngineImpl$1;->this$0:Lcom/momo/momortc/MMRtcEngineImpl;

    .line 54
    .line 55
    invoke-static {p0}, Lcom/momo/momortc/MMRtcEngineImpl;->access$300(Lcom/momo/momortc/MMRtcEngineImpl;)Lcom/momo/momortc/IMMRtcEngineEventInterface;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-interface {p0, p1, p2}, Lcom/momo/momortc/IMMRtcEngineEventInterface;->onHttpError(ILjava/lang/String;)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_0
    move-object v7, p0

    .line 64
    invoke-static {v1}, Lcom/momo/momortc/MMRtcEngineImpl;->access$300(Lcom/momo/momortc/MMRtcEngineImpl;)Lcom/momo/momortc/IMMRtcEngineEventInterface;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-interface {p0, p1, p2}, Lcom/momo/momortc/IMMRtcEngineEventInterface;->onHttpError(ILjava/lang/String;)V

    .line 69
    .line 70
    .line 71
    iget-object p0, v7, Lcom/momo/momortc/MMRtcEngineImpl$1;->this$0:Lcom/momo/momortc/MMRtcEngineImpl;

    .line 72
    .line 73
    invoke-static {p0}, Lcom/momo/momortc/MMRtcEngineImpl;->access$300(Lcom/momo/momortc/MMRtcEngineImpl;)Lcom/momo/momortc/IMMRtcEngineEventInterface;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    const/16 p1, 0x1f7

    .line 78
    .line 79
    invoke-interface {p0, p1}, Lcom/momo/momortc/IMMRtcEngineEventInterface;->onError(I)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public onSuccess(ILjava/lang/String;)V
    .locals 7

    .line 1
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p2, "data"

    .line 7
    .line 8
    invoke-virtual {v0, p2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    const-string v0, "result"

    .line 13
    .line 14
    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    new-instance v0, Lorg/json/JSONObject;

    .line 19
    .line 20
    invoke-direct {v0, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const-string p2, "ip"

    .line 24
    .line 25
    invoke-virtual {v0, p2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v4

    .line 29
    const-string p2, "port"

    .line 30
    .line 31
    invoke-virtual {v0, p2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    move-result v5

    .line 35
    const-string p2, "sslPort"

    .line 36
    .line 37
    invoke-virtual {v0, p2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result v6

    .line 41
    iget-object p2, p0, Lcom/momo/momortc/MMRtcEngineImpl$1;->this$0:Lcom/momo/momortc/MMRtcEngineImpl;

    .line 42
    .line 43
    invoke-static {p2}, Lcom/momo/momortc/MMRtcEngineImpl;->access$000(Lcom/momo/momortc/MMRtcEngineImpl;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    monitor-enter p2
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 48
    :try_start_1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcEngineImpl$1;->this$0:Lcom/momo/momortc/MMRtcEngineImpl;

    .line 49
    .line 50
    invoke-static {v0}, Lcom/momo/momortc/MMRtcEngineImpl;->access$100(Lcom/momo/momortc/MMRtcEngineImpl;)J

    .line 51
    .line 52
    .line 53
    move-result-wide v0

    .line 54
    const-wide/16 v2, 0x0

    .line 55
    .line 56
    cmp-long v0, v0, v2

    .line 57
    .line 58
    if-eqz v0, :cond_0

    .line 59
    .line 60
    iget-object v1, p0, Lcom/momo/momortc/MMRtcEngineImpl$1;->this$0:Lcom/momo/momortc/MMRtcEngineImpl;

    .line 61
    .line 62
    invoke-static {v1}, Lcom/momo/momortc/MMRtcEngineImpl;->access$100(Lcom/momo/momortc/MMRtcEngineImpl;)J

    .line 63
    .line 64
    .line 65
    move-result-wide v2

    .line 66
    invoke-static/range {v1 .. v6}, Lcom/momo/momortc/MMRtcEngineImpl;->access$200(Lcom/momo/momortc/MMRtcEngineImpl;JLjava/lang/String;II)I

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :catchall_0
    move-exception v0

    .line 71
    goto :goto_1

    .line 72
    :cond_0
    :goto_0
    monitor-exit p2

    .line 73
    return-void

    .line 74
    :goto_1
    monitor-exit p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 75
    :try_start_2
    throw v0
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0

    .line 76
    :catch_0
    move-exception v0

    .line 77
    move-object p2, v0

    .line 78
    invoke-virtual {p2}, Ljava/lang/Throwable;->printStackTrace()V

    .line 79
    .line 80
    .line 81
    iget-object p2, p0, Lcom/momo/momortc/MMRtcEngineImpl$1;->this$0:Lcom/momo/momortc/MMRtcEngineImpl;

    .line 82
    .line 83
    invoke-static {p2}, Lcom/momo/momortc/MMRtcEngineImpl;->access$300(Lcom/momo/momortc/MMRtcEngineImpl;)Lcom/momo/momortc/IMMRtcEngineEventInterface;

    .line 84
    .line 85
    .line 86
    move-result-object p2

    .line 87
    const-string v0, "json error"

    .line 88
    .line 89
    invoke-interface {p2, p1, v0}, Lcom/momo/momortc/IMMRtcEngineEventInterface;->onHttpError(ILjava/lang/String;)V

    .line 90
    .line 91
    .line 92
    iget-object p0, p0, Lcom/momo/momortc/MMRtcEngineImpl$1;->this$0:Lcom/momo/momortc/MMRtcEngineImpl;

    .line 93
    .line 94
    invoke-static {p0}, Lcom/momo/momortc/MMRtcEngineImpl;->access$300(Lcom/momo/momortc/MMRtcEngineImpl;)Lcom/momo/momortc/IMMRtcEngineEventInterface;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    const/16 p1, 0x257

    .line 99
    .line 100
    invoke-interface {p0, p1}, Lcom/momo/momortc/IMMRtcEngineEventInterface;->onError(I)V

    .line 101
    .line 102
    .line 103
    return-void
.end method
