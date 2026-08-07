.class Lcom/cosmos/photon/push/PushApi$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cosmos/photon/push/PushApi;->register(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic val$alias:Ljava/lang/String;

.field final synthetic val$appId:Ljava/lang/String;

.field final synthetic val$deviceId:Ljava/lang/String;

.field final synthetic val$sn:Ljava/lang/String;

.field final synthetic val$tryReferee:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cosmos/photon/push/PushApi$2;->val$deviceId:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/cosmos/photon/push/PushApi$2;->val$appId:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/cosmos/photon/push/PushApi$2;->val$alias:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/cosmos/photon/push/PushApi$2;->val$sn:Ljava/lang/String;

    .line 8
    .line 9
    iput-boolean p5, p0, Lcom/cosmos/photon/push/PushApi$2;->val$tryReferee:Z

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .line 1
    const-string v1, "MoPush-API"

    .line 2
    .line 3
    const/4 v2, -0x1

    .line 4
    const/4 v3, 0x0

    .line 5
    :try_start_0
    invoke-static {}, Lcom/cosmos/photon/push/LastRegistKeeper;->getInstance()Lcom/cosmos/photon/push/LastRegistKeeper;

    .line 6
    .line 7
    .line 8
    move-result-object v4

    .line 9
    iget-object v5, p0, Lcom/cosmos/photon/push/PushApi$2;->val$deviceId:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v6, p0, Lcom/cosmos/photon/push/PushApi$2;->val$appId:Ljava/lang/String;

    .line 12
    .line 13
    iget-object v7, p0, Lcom/cosmos/photon/push/PushApi$2;->val$alias:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v8, p0, Lcom/cosmos/photon/push/PushApi$2;->val$sn:Ljava/lang/String;

    .line 16
    .line 17
    iget-boolean v9, p0, Lcom/cosmos/photon/push/PushApi$2;->val$tryReferee:Z

    .line 18
    .line 19
    invoke-virtual/range {v4 .. v9}, Lcom/cosmos/photon/push/LastRegistKeeper;->keepRegistSelfToken(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 20
    .line 21
    .line 22
    invoke-static {}, Lcom/cosmos/photon/push/uniqueid/UniqueIdManager;->getInstance()Lcom/cosmos/photon/push/uniqueid/UniqueIdManager;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {}, Lcom/cosmos/photon/push/util/AppContext;->getContext()Landroid/content/Context;

    .line 27
    .line 28
    .line 29
    move-result-object v4

    .line 30
    iget-object v5, p0, Lcom/cosmos/photon/push/PushApi$2;->val$deviceId:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v0, v4, v5}, Lcom/cosmos/photon/push/uniqueid/UniqueIdManager;->init(Landroid/content/Context;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/cosmos/photon/push/PushApi$2;->val$deviceId:Ljava/lang/String;

    .line 36
    .line 37
    iget-object v4, p0, Lcom/cosmos/photon/push/PushApi$2;->val$appId:Ljava/lang/String;

    .line 38
    .line 39
    iget-object v5, p0, Lcom/cosmos/photon/push/PushApi$2;->val$alias:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {v0, v4, v5}, Lcom/cosmos/photon/push/ApiCacheUtil;->isRegisterExpired(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_1

    .line 46
    .line 47
    const-string v0, "prefs register"

    .line 48
    .line 49
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/cosmos/photon/push/PushApi$2;->val$deviceId:Ljava/lang/String;

    .line 53
    .line 54
    iget-object v4, p0, Lcom/cosmos/photon/push/PushApi$2;->val$appId:Ljava/lang/String;

    .line 55
    .line 56
    iget-object v5, p0, Lcom/cosmos/photon/push/PushApi$2;->val$alias:Ljava/lang/String;

    .line 57
    .line 58
    invoke-static {v0, v4, v5}, Lcom/cosmos/photon/push/ApiCacheUtil;->getRegisterData(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 63
    .line 64
    .line 65
    move-result v4

    .line 66
    if-nez v4, :cond_0

    .line 67
    .line 68
    new-instance v4, Lorg/json/JSONObject;

    .line 69
    .line 70
    invoke-direct {v4, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :catch_0
    move-exception v0

    .line 75
    move-object p0, v0

    .line 76
    goto/16 :goto_3

    .line 77
    .line 78
    :cond_0
    move-object v4, v3

    .line 79
    goto :goto_0

    .line 80
    :cond_1
    move-object v0, v3

    .line 81
    move-object v4, v0

    .line 82
    :goto_0
    const-string v5, "ec"

    .line 83
    .line 84
    if-nez v4, :cond_5

    .line 85
    .line 86
    :try_start_1
    new-instance v0, Ljava/util/HashMap;

    .line 87
    .line 88
    const/4 v4, 0x3

    .line 89
    invoke-direct {v0, v4}, Ljava/util/HashMap;-><init>(I)V

    .line 90
    .line 91
    .line 92
    const-string v4, "device_id"

    .line 93
    .line 94
    iget-object v6, p0, Lcom/cosmos/photon/push/PushApi$2;->val$deviceId:Ljava/lang/String;

    .line 95
    .line 96
    invoke-virtual {v0, v4, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    const-string v4, "app_id"

    .line 100
    .line 101
    iget-object v6, p0, Lcom/cosmos/photon/push/PushApi$2;->val$appId:Ljava/lang/String;

    .line 102
    .line 103
    invoke-virtual {v0, v4, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    iget-object v4, p0, Lcom/cosmos/photon/push/PushApi$2;->val$alias:Ljava/lang/String;

    .line 107
    .line 108
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 109
    .line 110
    .line 111
    move-result v4

    .line 112
    if-nez v4, :cond_2

    .line 113
    .line 114
    const-string v4, "alias"

    .line 115
    .line 116
    iget-object v6, p0, Lcom/cosmos/photon/push/PushApi$2;->val$alias:Ljava/lang/String;

    .line 117
    .line 118
    invoke-virtual {v0, v4, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    :cond_2
    const-string v4, "keystore_sha1"

    .line 122
    .line 123
    invoke-static {}, Lcom/cosmos/photon/push/util/AppContext;->getAppSHA1()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v6

    .line 127
    invoke-virtual {v0, v4, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    iget-object v4, p0, Lcom/cosmos/photon/push/PushApi$2;->val$sn:Ljava/lang/String;

    .line 131
    .line 132
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 133
    .line 134
    .line 135
    move-result v4

    .line 136
    if-nez v4, :cond_3

    .line 137
    .line 138
    const-string v4, "sn"

    .line 139
    .line 140
    iget-object v6, p0, Lcom/cosmos/photon/push/PushApi$2;->val$sn:Ljava/lang/String;

    .line 141
    .line 142
    invoke-virtual {v0, v4, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    :cond_3
    iget-object v4, p0, Lcom/cosmos/photon/push/PushApi$2;->val$alias:Ljava/lang/String;

    .line 146
    .line 147
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 148
    .line 149
    .line 150
    move-result v4

    .line 151
    if-eqz v4, :cond_4

    .line 152
    .line 153
    const-string v4, "reg"

    .line 154
    .line 155
    goto :goto_1

    .line 156
    :cond_4
    const-string v4, "regwithalias"

    .line 157
    .line 158
    :goto_1
    invoke-static {v4, v0}, Lcom/cosmos/photon/push/PushApi;->access$000(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    new-instance v4, Lorg/json/JSONObject;

    .line 163
    .line 164
    invoke-direct {v4, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    invoke-virtual {v4, v5, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 168
    .line 169
    .line 170
    move-result v6

    .line 171
    if-nez v6, :cond_5

    .line 172
    .line 173
    iget-object v6, p0, Lcom/cosmos/photon/push/PushApi$2;->val$deviceId:Ljava/lang/String;

    .line 174
    .line 175
    iget-object v7, p0, Lcom/cosmos/photon/push/PushApi$2;->val$appId:Ljava/lang/String;

    .line 176
    .line 177
    iget-object v8, p0, Lcom/cosmos/photon/push/PushApi$2;->val$alias:Ljava/lang/String;

    .line 178
    .line 179
    invoke-static {v6, v7, v8}, Lcom/cosmos/photon/push/ApiCacheUtil;->saveRegisterCurrentTimeMillis(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 180
    .line 181
    .line 182
    iget-object v6, p0, Lcom/cosmos/photon/push/PushApi$2;->val$deviceId:Ljava/lang/String;

    .line 183
    .line 184
    iget-object v7, p0, Lcom/cosmos/photon/push/PushApi$2;->val$appId:Ljava/lang/String;

    .line 185
    .line 186
    iget-object v8, p0, Lcom/cosmos/photon/push/PushApi$2;->val$alias:Ljava/lang/String;

    .line 187
    .line 188
    invoke-static {v6, v7, v8, v0}, Lcom/cosmos/photon/push/ApiCacheUtil;->saveRegisterData(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 189
    .line 190
    .line 191
    :cond_5
    invoke-virtual {v4, v5, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 192
    .line 193
    .line 194
    move-result v5

    .line 195
    if-nez v5, :cond_7

    .line 196
    .line 197
    iget-object v6, p0, Lcom/cosmos/photon/push/PushApi$2;->val$alias:Ljava/lang/String;

    .line 198
    .line 199
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 200
    .line 201
    .line 202
    move-result v6

    .line 203
    if-nez v6, :cond_6

    .line 204
    .line 205
    iget-object v6, p0, Lcom/cosmos/photon/push/PushApi$2;->val$alias:Ljava/lang/String;

    .line 206
    .line 207
    invoke-static {v6}, Lcom/cosmos/photon/push/ChannelBridge;->setAlias(Ljava/lang/String;)V

    .line 208
    .line 209
    .line 210
    :cond_6
    const-string v6, "data"

    .line 211
    .line 212
    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 213
    .line 214
    .line 215
    move-result-object v6

    .line 216
    const-string v7, "token"

    .line 217
    .line 218
    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 219
    .line 220
    .line 221
    move-result-object v7

    .line 222
    const-string v8, "push_config"

    .line 223
    .line 224
    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 225
    .line 226
    .line 227
    move-result-object v6

    .line 228
    invoke-static {v6}, Lcom/cosmos/photon/push/PushPreferenceUtils;->updateConfig(Lorg/json/JSONObject;)V

    .line 229
    .line 230
    .line 231
    goto :goto_2

    .line 232
    :cond_7
    move-object v7, v3

    .line 233
    :goto_2
    const-string v6, "register result : %s"

    .line 234
    .line 235
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 236
    .line 237
    .line 238
    move-result-object v0

    .line 239
    invoke-static {v1, v6, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 240
    .line 241
    .line 242
    invoke-static {}, Lcom/cosmos/photon/push/PhotonPushManager;->getInstance()Lcom/cosmos/photon/push/PhotonPushManager;

    .line 243
    .line 244
    .line 245
    move-result-object v0

    .line 246
    const-string v6, "em"

    .line 247
    .line 248
    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 249
    .line 250
    .line 251
    move-result-object v4

    .line 252
    iget-object p0, p0, Lcom/cosmos/photon/push/PushApi$2;->val$alias:Ljava/lang/String;

    .line 253
    .line 254
    invoke-virtual {v0, v5, v7, v4, p0}, Lcom/cosmos/photon/push/PhotonPushManager;->onSelfTokenRegistered(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 255
    .line 256
    .line 257
    invoke-static {}, Lcom/cosmos/photon/push/LastRegistKeeper;->getInstance()Lcom/cosmos/photon/push/LastRegistKeeper;

    .line 258
    .line 259
    .line 260
    move-result-object p0

    .line 261
    invoke-virtual {p0}, Lcom/cosmos/photon/push/LastRegistKeeper;->clearRegistSelfRequest()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 262
    .line 263
    .line 264
    return-void

    .line 265
    :goto_3
    invoke-static {v1, p0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 266
    .line 267
    .line 268
    invoke-static {}, Lcom/cosmos/photon/push/PhotonPushManager;->getInstance()Lcom/cosmos/photon/push/PhotonPushManager;

    .line 269
    .line 270
    .line 271
    move-result-object v0

    .line 272
    new-instance v1, Ljava/lang/StringBuilder;

    .line 273
    .line 274
    const-string v4, "\u5f02\u5e38\uff1a"

    .line 275
    .line 276
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 277
    .line 278
    .line 279
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 280
    .line 281
    .line 282
    move-result-object p0

    .line 283
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 284
    .line 285
    .line 286
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 287
    .line 288
    .line 289
    move-result-object p0

    .line 290
    invoke-virtual {v0, v2, v3, p0, v3}, Lcom/cosmos/photon/push/PhotonPushManager;->onSelfTokenRegistered(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 291
    .line 292
    .line 293
    return-void
.end method
