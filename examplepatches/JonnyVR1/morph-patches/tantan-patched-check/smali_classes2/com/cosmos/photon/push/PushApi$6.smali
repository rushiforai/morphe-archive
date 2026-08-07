.class Lcom/cosmos/photon/push/PushApi$6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cosmos/photon/push/PushApi;->regVendor(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic val$appId:Ljava/lang/String;

.field final synthetic val$token:Ljava/lang/String;

.field final synthetic val$vendorToken:Ljava/lang/String;

.field final synthetic val$vendorType:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cosmos/photon/push/PushApi$6;->val$token:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/cosmos/photon/push/PushApi$6;->val$appId:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/cosmos/photon/push/PushApi$6;->val$vendorType:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/cosmos/photon/push/PushApi$6;->val$vendorToken:Ljava/lang/String;

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
    .locals 6

    .line 1
    const/4 v0, 0x4

    .line 2
    :try_start_0
    iget-object v1, p0, Lcom/cosmos/photon/push/PushApi$6;->val$token:Ljava/lang/String;

    .line 3
    .line 4
    iget-object v2, p0, Lcom/cosmos/photon/push/PushApi$6;->val$appId:Ljava/lang/String;

    .line 5
    .line 6
    iget-object v3, p0, Lcom/cosmos/photon/push/PushApi$6;->val$vendorType:Ljava/lang/String;

    .line 7
    .line 8
    iget-object v4, p0, Lcom/cosmos/photon/push/PushApi$6;->val$vendorToken:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v1, v2, v3, v4}, Lcom/cosmos/photon/push/ApiCacheUtil;->isRegVendorExpired(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-static {}, Lcom/cosmos/photon/push/LastRegistKeeper;->getInstance()Lcom/cosmos/photon/push/LastRegistKeeper;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iget-object v2, p0, Lcom/cosmos/photon/push/PushApi$6;->val$token:Ljava/lang/String;

    .line 22
    .line 23
    iget-object v3, p0, Lcom/cosmos/photon/push/PushApi$6;->val$appId:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v4, p0, Lcom/cosmos/photon/push/PushApi$6;->val$vendorType:Ljava/lang/String;

    .line 26
    .line 27
    iget-object v5, p0, Lcom/cosmos/photon/push/PushApi$6;->val$vendorToken:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/cosmos/photon/push/LastRegistKeeper;->keepRegistVendorToken(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    new-instance v1, Ljava/util/HashMap;

    .line 33
    .line 34
    const/4 v2, 0x3

    .line 35
    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    .line 36
    .line 37
    .line 38
    const-string v2, "token"

    .line 39
    .line 40
    iget-object v3, p0, Lcom/cosmos/photon/push/PushApi$6;->val$token:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    const-string v2, "app_id"

    .line 46
    .line 47
    iget-object v3, p0, Lcom/cosmos/photon/push/PushApi$6;->val$appId:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    const-string v2, "vendor_token"

    .line 53
    .line 54
    iget-object v3, p0, Lcom/cosmos/photon/push/PushApi$6;->val$vendorToken:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    const-string v2, "vendor_type"

    .line 60
    .line 61
    iget-object v3, p0, Lcom/cosmos/photon/push/PushApi$6;->val$vendorType:Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    const-string v2, "regvendor"

    .line 67
    .line 68
    invoke-static {v2, v1}, Lcom/cosmos/photon/push/PushApi;->access$000(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    new-instance v2, Lorg/json/JSONObject;

    .line 73
    .line 74
    invoke-direct {v2, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    iget-object v1, p0, Lcom/cosmos/photon/push/PushApi$6;->val$token:Ljava/lang/String;

    .line 78
    .line 79
    iget-object v3, p0, Lcom/cosmos/photon/push/PushApi$6;->val$appId:Ljava/lang/String;

    .line 80
    .line 81
    iget-object v4, p0, Lcom/cosmos/photon/push/PushApi$6;->val$vendorType:Ljava/lang/String;

    .line 82
    .line 83
    iget-object p0, p0, Lcom/cosmos/photon/push/PushApi$6;->val$vendorToken:Ljava/lang/String;

    .line 84
    .line 85
    invoke-static {v1, v3, v4, p0}, Lcom/cosmos/photon/push/ApiCacheUtil;->saveRegVendorCurrentTimeMillis(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    invoke-static {}, Lcom/cosmos/photon/push/PhotonPushManager;->getInstance()Lcom/cosmos/photon/push/PhotonPushManager;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    const-string v1, "ec"

    .line 93
    .line 94
    invoke-virtual {v2, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    const-string v3, "em"

    .line 99
    .line 100
    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    invoke-virtual {p0, v0, v1, v2}, Lcom/cosmos/photon/push/PhotonPushManager;->onCommand(IILjava/lang/String;)V

    .line 105
    .line 106
    .line 107
    invoke-static {}, Lcom/cosmos/photon/push/LastRegistKeeper;->getInstance()Lcom/cosmos/photon/push/LastRegistKeeper;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    invoke-virtual {p0}, Lcom/cosmos/photon/push/LastRegistKeeper;->clearRegistTokenRequest()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 112
    .line 113
    .line 114
    return-void

    .line 115
    :catch_0
    move-exception p0

    .line 116
    const-string v1, "MoPush-API"

    .line 117
    .line 118
    invoke-static {v1, p0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 119
    .line 120
    .line 121
    invoke-static {}, Lcom/cosmos/photon/push/PhotonPushManager;->getInstance()Lcom/cosmos/photon/push/PhotonPushManager;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    new-instance v2, Ljava/lang/StringBuilder;

    .line 126
    .line 127
    const-string v3, "\u5f02\u5e38\uff1a"

    .line 128
    .line 129
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    const/4 v2, -0x1

    .line 144
    invoke-virtual {v1, v0, v2, p0}, Lcom/cosmos/photon/push/PhotonPushManager;->onCommand(IILjava/lang/String;)V

    .line 145
    .line 146
    .line 147
    return-void
.end method
