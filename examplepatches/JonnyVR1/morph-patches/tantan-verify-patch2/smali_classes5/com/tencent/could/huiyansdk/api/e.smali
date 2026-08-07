.class public Lcom/tencent/could/huiyansdk/api/e;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a([Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    const-string v0, ""

    const/4 v1, 0x0

    .line 229
    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_6

    .line 230
    aget-object v2, p0, v1

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_4

    if-eq v2, v3, :cond_4

    const/4 v4, 0x2

    if-eq v2, v4, :cond_3

    const/4 v4, 0x3

    if-eq v2, v4, :cond_2

    const/4 v4, 0x4

    if-eq v2, v4, :cond_1

    const/4 v4, 0x5

    if-eq v2, v4, :cond_0

    goto :goto_1

    .line 231
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "silence"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 232
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "shake"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 233
    :cond_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "node"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 234
    :cond_3
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "mouth"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 235
    :cond_4
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "blink"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 236
    :goto_1
    array-length v2, p0

    sub-int/2addr v2, v3

    if-eq v1, v2, :cond_5

    .line 237
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ","

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_5
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0

    :cond_6
    return-object v0
.end method

.method public static a(Lcom/tencent/could/huiyansdk/entity/CompareResult;)V
    .locals 4

    .line 221
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/a$a;->a:Lcom/tencent/could/huiyansdk/manager/a;

    .line 222
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/manager/a;->a()Lcom/tencent/could/huiyansdk/fragments/BaseFragment;

    move-result-object v0

    .line 223
    instance-of v1, v0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    if-eqz v1, :cond_0

    .line 224
    check-cast v0, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    .line 225
    invoke-virtual {v0, p0}, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->a(Ljava/lang/Object;)V

    return-void

    .line 226
    :cond_0
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    const-string v1, "HuiYanSdkImp"

    const-string v2, "current fragment is null!"

    const/4 v3, 0x2

    .line 227
    invoke-virtual {v0, v3, v1, v2}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 228
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/entity/CompareResult;->getErrorCode()I

    move-result v0

    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/entity/CompareResult;->getErrorMsg()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/tencent/could/huiyansdk/utils/CommonUtils;->sendErrorAndExitAuth(ILjava/lang/String;)V

    return-void
.end method

.method public static a(Ljava/lang/String;)V
    .locals 7

    .line 1
    sget-object v0, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iput-boolean v1, v0, Lcom/tencent/could/huiyansdk/api/j;->d:Z

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/api/j;->b()Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-static {p0}, Lcom/tencent/could/huiyansdk/utils/CommonUtils;->checkHaveColorData(Ljava/lang/String;)Lcom/tencent/could/huiyansdk/entity/LiveDataCheckResult;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-virtual {v1}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isUseBackCamera()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    const-string v3, "HuiYanSdkImp"

    .line 19
    .line 20
    const/4 v4, 0x2

    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    invoke-virtual {v2}, Lcom/tencent/could/huiyansdk/entity/LiveDataCheckResult;->isHaveColorData()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    sget-object p0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 30
    .line 31
    const-string v1, "have color data!"

    .line 32
    .line 33
    invoke-virtual {p0, v4, v3, v1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-object p0, v0, Lcom/tencent/could/huiyansdk/api/j;->g:Lcom/tencent/could/huiyansdk/api/b;

    .line 37
    .line 38
    if-eqz p0, :cond_0

    .line 39
    .line 40
    const-string v1, "AuthCheckStage"

    .line 41
    .line 42
    const-string v2, "AuthLocalFail"

    .line 43
    .line 44
    const-string v3, "back camera have color data!"

    .line 45
    .line 46
    invoke-interface {p0, v1, v2, v3}, Lcom/tencent/could/huiyansdk/api/b;->onBuriedPointCallBack(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    :cond_0
    new-instance p0, Lcom/tencent/could/huiyansdk/entity/CompareResult;

    .line 50
    .line 51
    invoke-direct {p0}, Lcom/tencent/could/huiyansdk/entity/CompareResult;-><init>()V

    .line 52
    .line 53
    .line 54
    const/16 v1, 0xe3

    .line 55
    .line 56
    invoke-virtual {p0, v1}, Lcom/tencent/could/huiyansdk/entity/CompareResult;->setErrorCode(I)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/api/j;->a()Landroid/content/Context;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    sget v1, Lcom/tencent/could/huiyansdk/R$string;->txy_use_back_camera_with_reflective:I

    .line 68
    .line 69
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {p0, v0}, Lcom/tencent/could/huiyansdk/entity/CompareResult;->setErrorMsg(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    invoke-static {p0}, Lcom/tencent/could/huiyansdk/api/e;->a(Lcom/tencent/could/huiyansdk/entity/CompareResult;)V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :cond_1
    invoke-virtual {v2}, Lcom/tencent/could/huiyansdk/entity/LiveDataCheckResult;->isNoAction()Z

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    :try_start_0
    sget-object v2, Lcom/tencent/could/huiyansdk/helper/b$a;->a:Lcom/tencent/could/huiyansdk/helper/b;

    .line 85
    .line 86
    const-string v5, "check_eye_open"

    .line 87
    .line 88
    invoke-virtual {v2, v5, v1}, Lcom/tencent/could/huiyansdk/helper/b;->b(Ljava/lang/String;Z)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 89
    .line 90
    .line 91
    goto :goto_0

    .line 92
    :catch_0
    move-exception v1

    .line 93
    sget-object v2, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 94
    .line 95
    new-instance v5, Ljava/lang/StringBuilder;

    .line 96
    .line 97
    const-string v6, "update sdk config error: "

    .line 98
    .line 99
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v1}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    invoke-virtual {v2, v4, v3, v1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    :goto_0
    sget-object v1, Lcom/tencent/could/huiyansdk/helper/b$a;->a:Lcom/tencent/could/huiyansdk/helper/b;

    .line 117
    .line 118
    iget-object v2, v1, Lcom/tencent/could/huiyansdk/helper/b;->a:Lorg/json/JSONObject;

    .line 119
    .line 120
    if-nez v2, :cond_2

    .line 121
    .line 122
    sget-object v2, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 123
    .line 124
    const-string v3, "YouTuSdkHelper"

    .line 125
    .line 126
    const-string v5, "sdk config json is null!"

    .line 127
    .line 128
    invoke-virtual {v2, v4, v3, v5}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    goto :goto_1

    .line 132
    :cond_2
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;

    .line 133
    .line 134
    .line 135
    move-result-object v2

    .line 136
    invoke-virtual {v1}, Lcom/tencent/could/huiyansdk/helper/b;->b()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKKitFrameworkWorkMode;

    .line 137
    .line 138
    .line 139
    move-result-object v3

    .line 140
    iget-object v4, v1, Lcom/tencent/could/huiyansdk/helper/b;->a:Lorg/json/JSONObject;

    .line 141
    .line 142
    invoke-static {v3, v4}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitConfigHelper;->getSDKConfig(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKKitFrameworkWorkMode;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    .line 143
    .line 144
    .line 145
    move-result-object v3

    .line 146
    invoke-virtual {v2, v3}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->updateSDKSetting(Lorg/json/JSONObject;)V

    .line 147
    .line 148
    .line 149
    :goto_1
    sget-object v2, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi$a;->a:Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;

    .line 150
    .line 151
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 152
    .line 153
    .line 154
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 155
    .line 156
    .line 157
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 158
    .line 159
    .line 160
    move-result v3

    .line 161
    const-string v4, ""

    .line 162
    .line 163
    const-string v5, "send error callback, but callback is null!"

    .line 164
    .line 165
    const-string v6, "HuiYanBaseApi"

    .line 166
    .line 167
    if-eqz v3, :cond_4

    .line 168
    .line 169
    iget-object p0, v2, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;->b:Lcom/tencent/could/huiyansdk/base/HuiYanBaseCallBack;

    .line 170
    .line 171
    if-nez p0, :cond_3

    .line 172
    .line 173
    invoke-static {v6, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 174
    .line 175
    .line 176
    goto :goto_2

    .line 177
    :cond_3
    const/16 v1, 0xe2

    .line 178
    .line 179
    invoke-interface {p0, v1, v4}, Lcom/tencent/could/huiyansdk/base/HuiYanBaseCallBack;->onFail(ILjava/lang/String;)V

    .line 180
    .line 181
    .line 182
    goto :goto_2

    .line 183
    :cond_4
    iget-object v3, v1, Lcom/tencent/could/huiyansdk/helper/b;->b:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$IYtSDKKitNetResponseParser;

    .line 184
    .line 185
    if-nez v3, :cond_6

    .line 186
    .line 187
    iget-object p0, v2, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;->b:Lcom/tencent/could/huiyansdk/base/HuiYanBaseCallBack;

    .line 188
    .line 189
    if-nez p0, :cond_5

    .line 190
    .line 191
    invoke-static {v6, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 192
    .line 193
    .line 194
    goto :goto_2

    .line 195
    :cond_5
    const/16 v1, 0xdd

    .line 196
    .line 197
    invoke-interface {p0, v1, v4}, Lcom/tencent/could/huiyansdk/base/HuiYanBaseCallBack;->onFail(ILjava/lang/String;)V

    .line 198
    .line 199
    .line 200
    goto :goto_2

    .line 201
    :cond_6
    new-instance v2, Ljava/util/HashMap;

    .line 202
    .line 203
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 204
    .line 205
    .line 206
    const-string v3, "response"

    .line 207
    .line 208
    invoke-virtual {v2, v3, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 209
    .line 210
    .line 211
    iget-object p0, v1, Lcom/tencent/could/huiyansdk/helper/b;->b:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$IYtSDKKitNetResponseParser;

    .line 212
    .line 213
    const/4 v1, 0x0

    .line 214
    invoke-interface {p0, v2, v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$IYtSDKKitNetResponseParser;->onNetworkResponseEvent(Ljava/util/HashMap;Ljava/lang/Exception;)V

    .line 215
    .line 216
    .line 217
    :goto_2
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/api/j;->e()V

    .line 218
    .line 219
    .line 220
    return-void
.end method
