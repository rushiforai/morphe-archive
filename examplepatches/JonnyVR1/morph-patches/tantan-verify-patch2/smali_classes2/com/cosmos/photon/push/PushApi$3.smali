.class Lcom/cosmos/photon/push/PushApi$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cosmos/photon/push/PushApi;->alias(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic val$alias:Ljava/lang/String;

.field final synthetic val$appId:Ljava/lang/String;

.field final synthetic val$sn:Ljava/lang/String;

.field final synthetic val$token:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cosmos/photon/push/PushApi$3;->val$token:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/cosmos/photon/push/PushApi$3;->val$appId:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/cosmos/photon/push/PushApi$3;->val$alias:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/cosmos/photon/push/PushApi$3;->val$sn:Ljava/lang/String;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 1
    const-string v0, "alias"

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    :try_start_0
    new-instance v2, Ljava/util/HashMap;

    .line 5
    .line 6
    const/4 v3, 0x3

    .line 7
    invoke-direct {v2, v3}, Ljava/util/HashMap;-><init>(I)V

    .line 8
    .line 9
    .line 10
    const-string v3, "token"

    .line 11
    .line 12
    iget-object v4, p0, Lcom/cosmos/photon/push/PushApi$3;->val$token:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    const-string v3, "app_id"

    .line 18
    .line 19
    iget-object v4, p0, Lcom/cosmos/photon/push/PushApi$3;->val$appId:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    iget-object v3, p0, Lcom/cosmos/photon/push/PushApi$3;->val$alias:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v2, v0, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    iget-object v3, p0, Lcom/cosmos/photon/push/PushApi$3;->val$sn:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    if-nez v3, :cond_0

    .line 36
    .line 37
    const-string v3, "sn"

    .line 38
    .line 39
    iget-object v4, p0, Lcom/cosmos/photon/push/PushApi$3;->val$sn:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :catch_0
    move-exception p0

    .line 46
    goto :goto_1

    .line 47
    :cond_0
    :goto_0
    invoke-static {v0, v2}, Lcom/cosmos/photon/push/PushApi;->access$000(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    new-instance v2, Lorg/json/JSONObject;

    .line 52
    .line 53
    invoke-direct {v2, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    invoke-static {}, Lcom/cosmos/photon/push/PhotonPushManager;->getInstance()Lcom/cosmos/photon/push/PhotonPushManager;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    const-string v3, "ec"

    .line 61
    .line 62
    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    const-string v4, "em"

    .line 67
    .line 68
    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    invoke-virtual {v0, v1, v3, v2}, Lcom/cosmos/photon/push/PhotonPushManager;->onCommand(IILjava/lang/String;)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Lcom/cosmos/photon/push/PushApi$3;->val$alias:Ljava/lang/String;

    .line 76
    .line 77
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-nez v0, :cond_1

    .line 82
    .line 83
    iget-object p0, p0, Lcom/cosmos/photon/push/PushApi$3;->val$alias:Ljava/lang/String;

    .line 84
    .line 85
    invoke-static {p0}, Lcom/cosmos/photon/push/ChannelBridge;->setAlias(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 86
    .line 87
    .line 88
    :cond_1
    return-void

    .line 89
    :goto_1
    const-string v0, "MoPush-API"

    .line 90
    .line 91
    invoke-static {v0, p0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 92
    .line 93
    .line 94
    invoke-static {}, Lcom/cosmos/photon/push/PhotonPushManager;->getInstance()Lcom/cosmos/photon/push/PhotonPushManager;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    new-instance v2, Ljava/lang/StringBuilder;

    .line 99
    .line 100
    const-string v3, "\u5f02\u5e38\uff1a"

    .line 101
    .line 102
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    const/4 v2, -0x1

    .line 117
    invoke-virtual {v0, v1, v2, p0}, Lcom/cosmos/photon/push/PhotonPushManager;->onCommand(IILjava/lang/String;)V

    .line 118
    .line 119
    .line 120
    return-void
.end method
