.class public Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;
.super Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;
.source "SourceFile"


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;

.field public e:Z

.field public f:Z

.field public g:Ljava/lang/String;

.field public h:Ljava/lang/String;

.field public i:I

.field public j:Lorg/json/JSONObject;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;->c:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;->d:Ljava/lang/String;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    iput-boolean v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;->e:Z

    .line 12
    .line 13
    iput-boolean v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;->f:Z

    .line 14
    .line 15
    iput-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;->g:Ljava/lang/String;

    .line 16
    .line 17
    iput-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;->h:Ljava/lang/String;

    .line 18
    .line 19
    const/4 v0, 0x2

    .line 20
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;->i:I

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    iput-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;->j:Lorg/json/JSONObject;

    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)Ljava/lang/String;
    .locals 11

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "&"

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    array-length v1, p1

    .line 13
    if-lez v1, :cond_5

    .line 14
    .line 15
    array-length v1, p1

    .line 16
    const/4 v2, 0x0

    .line 17
    const/4 v3, 0x1

    .line 18
    move v4, v2

    .line 19
    move v5, v4

    .line 20
    move v6, v3

    .line 21
    :goto_0
    if-ge v4, v1, :cond_4

    .line 22
    .line 23
    aget-object v7, p1, v4

    .line 24
    .line 25
    const-string v8, "="

    .line 26
    .line 27
    invoke-virtual {v7, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v7

    .line 31
    array-length v9, v7

    .line 32
    if-le v9, v3, :cond_3

    .line 33
    .line 34
    aget-object v9, v7, v2

    .line 35
    .line 36
    const-string v10, "need_action_video"

    .line 37
    .line 38
    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v9

    .line 42
    if-eqz v9, :cond_1

    .line 43
    .line 44
    aget-object v5, v7, v3

    .line 45
    .line 46
    const-string v7, "true"

    .line 47
    .line 48
    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v5

    .line 52
    if-nez v5, :cond_0

    .line 53
    .line 54
    const-string v5, "Background configuration error\uff01 \'need_action_video\' is false,but must has video!!"

    .line 55
    .line 56
    const/4 v7, 0x0

    .line 57
    const-string v8, "NetFetchState"

    .line 58
    .line 59
    invoke-static {v8, v5, v7}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 60
    .line 61
    .line 62
    :cond_0
    move v5, v3

    .line 63
    goto :goto_1

    .line 64
    :cond_1
    if-eqz v6, :cond_2

    .line 65
    .line 66
    aget-object v6, v7, v2

    .line 67
    .line 68
    invoke-virtual {p0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    aget-object v6, v7, v3

    .line 75
    .line 76
    invoke-virtual {p0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    move v6, v2

    .line 80
    goto :goto_1

    .line 81
    :cond_2
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    aget-object v9, v7, v2

    .line 85
    .line 86
    invoke-virtual {p0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    aget-object v7, v7, v3

    .line 93
    .line 94
    invoke-virtual {p0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    :cond_3
    :goto_1
    add-int/lit8 v4, v4, 0x1

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_4
    if-eqz v5, :cond_5

    .line 101
    .line 102
    const-string p1, "&need_action_video=true"

    .line 103
    .line 104
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    :cond_5
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    return-object p0
.end method

.method public enter()V
    .locals 12

    .line 1
    const-string v0, "change_point_num"

    .line 2
    .line 3
    const-string v1, "reflect_param"

    .line 4
    .line 5
    const-string v2, "config"

    .line 6
    .line 7
    invoke-super {p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->enter()V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    new-instance v4, Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState$a;

    .line 15
    .line 16
    invoke-direct {v4, p0}, Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState$a;-><init>(Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v3, v4}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->sendFSMEvent(Ljava/util/HashMap;)V

    .line 20
    .line 21
    .line 22
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    invoke-virtual {v3}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getWorkMode()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKKitFrameworkWorkMode;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    const/4 v4, 0x2

    .line 35
    if-eq v3, v4, :cond_0

    .line 36
    .line 37
    const/4 v4, 0x3

    .line 38
    if-eq v3, v4, :cond_0

    .line 39
    .line 40
    const/4 v4, 0x4

    .line 41
    if-eq v3, v4, :cond_0

    .line 42
    .line 43
    const/4 v4, 0x5

    .line 44
    if-eq v3, v4, :cond_0

    .line 45
    .line 46
    return-void

    .line 47
    :cond_0
    sget-object v3, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->TAG:Ljava/lang/String;

    .line 48
    .line 49
    new-instance v3, Lcom/tencent/youtu/ytagreflectlivecheck/requester/LiveStyleRequester$SeleceData;

    .line 50
    .line 51
    const v4, -0x39e3c000    # -10000.0f

    .line 52
    .line 53
    .line 54
    invoke-direct {v3, v4}, Lcom/tencent/youtu/ytagreflectlivecheck/requester/LiveStyleRequester$SeleceData;-><init>(F)V

    .line 55
    .line 56
    .line 57
    iget-object v4, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->stateData:Ljava/util/HashMap;

    .line 58
    .line 59
    const-string v5, "select_data"

    .line 60
    .line 61
    invoke-virtual {v4, v5, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    iget-object v4, p0, Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;->c:Ljava/lang/String;

    .line 65
    .line 66
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    .line 67
    .line 68
    .line 69
    move-result v4

    .line 70
    const-string v5, "NetFetchState"

    .line 71
    .line 72
    if-nez v4, :cond_1

    .line 73
    .line 74
    iget-boolean v4, p0, Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;->e:Z

    .line 75
    .line 76
    if-nez v4, :cond_2

    .line 77
    .line 78
    :cond_1
    iget-object v4, p0, Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;->b:Ljava/lang/String;

    .line 79
    .line 80
    if-nez v4, :cond_7

    .line 81
    .line 82
    :cond_2
    const-string v3, "Use local data"

    .line 83
    .line 84
    invoke-static {v5, v3}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    iget-object v3, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->stateData:Ljava/util/HashMap;

    .line 88
    .line 89
    iget-object v4, p0, Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;->c:Ljava/lang/String;

    .line 90
    .line 91
    const-string v6, "color_data"

    .line 92
    .line 93
    invoke-virtual {v3, v6, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    iget-object v3, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->stateData:Ljava/util/HashMap;

    .line 97
    .line 98
    iget-object v4, p0, Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;->d:Ljava/lang/String;

    .line 99
    .line 100
    const-string v6, "action_data"

    .line 101
    .line 102
    invoke-virtual {v3, v6, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    new-instance v3, Ljava/lang/StringBuilder;

    .line 106
    .line 107
    const-string v4, "select data:"

    .line 108
    .line 109
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    iget-object v4, p0, Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;->j:Lorg/json/JSONObject;

    .line 113
    .line 114
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v3

    .line 121
    invoke-static {v5, v3}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 122
    .line 123
    .line 124
    iget-object v3, p0, Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;->j:Lorg/json/JSONObject;

    .line 125
    .line 126
    if-eqz v3, :cond_5

    .line 127
    .line 128
    :try_start_0
    invoke-virtual {v3, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 129
    .line 130
    .line 131
    move-result v3

    .line 132
    if-eqz v3, :cond_3

    .line 133
    .line 134
    iget-object v3, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->stateData:Ljava/util/HashMap;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 135
    .line 136
    const-string v4, "control_config"

    .line 137
    .line 138
    :try_start_1
    iget-object v6, p0, Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;->j:Lorg/json/JSONObject;

    .line 139
    .line 140
    invoke-virtual {v6, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v2

    .line 144
    invoke-virtual {v3, v4, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    goto :goto_0

    .line 148
    :catch_0
    move-exception v0

    .line 149
    goto :goto_1

    .line 150
    :cond_3
    :goto_0
    iget-object v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;->j:Lorg/json/JSONObject;

    .line 151
    .line 152
    invoke-virtual {v2, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 153
    .line 154
    .line 155
    move-result v2

    .line 156
    if-eqz v2, :cond_4

    .line 157
    .line 158
    iget-object v2, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->stateData:Ljava/util/HashMap;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 159
    .line 160
    const-string v3, "extra_config"

    .line 161
    .line 162
    :try_start_2
    iget-object v4, p0, Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;->j:Lorg/json/JSONObject;

    .line 163
    .line 164
    invoke-virtual {v4, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object v1

    .line 168
    invoke-virtual {v2, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 169
    .line 170
    .line 171
    :cond_4
    iget-object v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;->j:Lorg/json/JSONObject;

    .line 172
    .line 173
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 174
    .line 175
    .line 176
    move-result v1

    .line 177
    if-eqz v1, :cond_6

    .line 178
    .line 179
    iget-object v1, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->stateData:Ljava/util/HashMap;
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0

    .line 180
    .line 181
    const-string v2, "cp_num"

    .line 182
    .line 183
    :try_start_3
    iget-object v3, p0, Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;->j:Lorg/json/JSONObject;

    .line 184
    .line 185
    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object v0

    .line 189
    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_0

    .line 190
    .line 191
    .line 192
    goto :goto_2

    .line 193
    :goto_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 194
    .line 195
    const-string v2, "Select data parse failed "

    .line 196
    .line 197
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 198
    .line 199
    .line 200
    invoke-virtual {v0}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object v2

    .line 204
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 205
    .line 206
    .line 207
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 208
    .line 209
    .line 210
    move-result-object v1

    .line 211
    invoke-static {v5, v1, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 212
    .line 213
    .line 214
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->getInstance()Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;

    .line 215
    .line 216
    .line 217
    move-result-object v0

    .line 218
    invoke-virtual {v0, v1}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->reportInfo(Ljava/lang/String;)V

    .line 219
    .line 220
    .line 221
    goto :goto_2

    .line 222
    :cond_5
    const/4 v0, 0x0

    .line 223
    const-string v1, "select data is null"

    .line 224
    .line 225
    invoke-static {v5, v1, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 226
    .line 227
    .line 228
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->getInstance()Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;

    .line 229
    .line 230
    .line 231
    move-result-object v0

    .line 232
    invoke-virtual {v0, v1}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->reportInfo(Ljava/lang/String;)V

    .line 233
    .line 234
    .line 235
    :cond_6
    :goto_2
    invoke-virtual {p0}, Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;->moveToNextState()V

    .line 236
    .line 237
    .line 238
    return-void

    .line 239
    :cond_7
    new-instance v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$GetLiveTypeReqData;

    .line 240
    .line 241
    invoke-direct {v0}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$GetLiveTypeReqData;-><init>()V

    .line 242
    .line 243
    .line 244
    new-instance v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;

    .line 245
    .line 246
    invoke-direct {v1}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;-><init>()V

    .line 247
    .line 248
    .line 249
    iput-object v1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$GetLiveTypeReqData;->baseInfo:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;

    .line 250
    .line 251
    iget-object v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;->a:Ljava/lang/String;

    .line 252
    .line 253
    iput-object v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;->appId:Ljava/lang/String;

    .line 254
    .line 255
    const-string v2, "wx_default"

    .line 256
    .line 257
    iput-object v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;->businessId:Ljava/lang/String;

    .line 258
    .line 259
    iget-object v2, v3, Lcom/tencent/youtu/ytagreflectlivecheck/requester/LiveStyleRequester$SeleceData;->android_data:Lcom/tencent/youtu/ytagreflectlivecheck/requester/LiveStyleRequester$LiveStyleAndroidData;

    .line 260
    .line 261
    iget v2, v2, Lcom/tencent/youtu/ytagreflectlivecheck/requester/LiveStyleRequester$LiveStyleAndroidData;->lux:F

    .line 262
    .line 263
    iput v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;->lux:F

    .line 264
    .line 265
    iget-object v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;->g:Ljava/lang/String;

    .line 266
    .line 267
    iput-object v1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$GetLiveTypeReqData;->reflectConfig:Ljava/lang/String;

    .line 268
    .line 269
    iget-object v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;->h:Ljava/lang/String;

    .line 270
    .line 271
    iput-object v1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$GetLiveTypeReqData;->controlConfig:Ljava/lang/String;

    .line 272
    .line 273
    iget v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;->i:I

    .line 274
    .line 275
    iput v1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$GetLiveTypeReqData;->colorNum:I

    .line 276
    .line 277
    invoke-static {v0}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper;->makeGetLiveTypeReq(Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$GetLiveTypeReqData;)Ljava/lang/String;

    .line 278
    .line 279
    .line 280
    move-result-object v9

    .line 281
    new-instance v1, Ljava/lang/StringBuilder;

    .line 282
    .line 283
    const-string v2, "Use online data ---> on get config info: "

    .line 284
    .line 285
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 286
    .line 287
    .line 288
    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 289
    .line 290
    .line 291
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 292
    .line 293
    .line 294
    move-result-object v1

    .line 295
    invoke-static {v5, v1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 296
    .line 297
    .line 298
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 299
    .line 300
    .line 301
    move-result-object v6

    .line 302
    iget-object v8, p0, Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;->b:Ljava/lang/String;

    .line 303
    .line 304
    new-instance v11, Lcom/tencent/youtu/sdkkitframework/liveness/e;

    .line 305
    .line 306
    invoke-direct {v11, p0, v0}, Lcom/tencent/youtu/sdkkitframework/liveness/e;-><init>(Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$GetLiveTypeReqData;)V

    .line 307
    .line 308
    .line 309
    const-string v7, "net_fetch_data"

    .line 310
    .line 311
    const/4 v10, 0x0

    .line 312
    invoke-virtual/range {v6 .. v11}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->sendNetworkRequest(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$IYtSDKKitNetResponseParser;)V

    .line 313
    .line 314
    .line 315
    return-void
.end method

.method public enterFirst()V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    const-string v1, "NetFetchState"

    .line 3
    .line 4
    invoke-virtual {p0, v1, v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->makeStateInfo(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-static {v1, p0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->o(Ljava/lang/String;Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public exit()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->exit()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public loadStateWith(Ljava/lang/String;Lorg/json/JSONObject;Lcom/tencent/youtu/sdkkitframework/common/YtSdkConfig;)V
    .locals 11

    .line 1
    const-string v0, "net_request_timeout_ms"

    .line 2
    .line 3
    const-string v1, "backend_proto_type"

    .line 4
    .line 5
    const-string v2, "select_data"

    .line 6
    .line 7
    const-string v3, "change_point_num"

    .line 8
    .line 9
    const-string v4, "control_config"

    .line 10
    .line 11
    const-string v5, "extra_config"

    .line 12
    .line 13
    const-string v6, "action_default_seq"

    .line 14
    .line 15
    const-string v7, "local_config_flag"

    .line 16
    .line 17
    const-string v8, "color_data"

    .line 18
    .line 19
    const-string v9, "config_api_url"

    .line 20
    .line 21
    invoke-super {p0, p1, p2, p3}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->loadStateWith(Ljava/lang/String;Lorg/json/JSONObject;Lcom/tencent/youtu/sdkkitframework/common/YtSdkConfig;)V

    .line 22
    .line 23
    .line 24
    :try_start_0
    const-string p1, "app_id"

    .line 25
    .line 26
    invoke-virtual {p2, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iput-object p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;->a:Ljava/lang/String;

    .line 31
    .line 32
    if-nez p1, :cond_0

    .line 33
    .line 34
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->getInstance()Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    const-string p3, "yt_param_error"

    .line 39
    .line 40
    const/high16 v10, 0x300000

    .line 41
    .line 42
    invoke-virtual {p1, v10, p3}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->reportError(ILjava/lang/String;)V

    .line 43
    .line 44
    .line 45
    :cond_0
    invoke-virtual {p2, v9}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-eqz p1, :cond_1

    .line 50
    .line 51
    invoke-virtual {p2, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    iput-object p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;->b:Ljava/lang/String;

    .line 56
    .line 57
    :cond_1
    invoke-virtual {p2, v8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    if-eqz p1, :cond_2

    .line 62
    .line 63
    invoke-virtual {p2, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    iput-object p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;->c:Ljava/lang/String;

    .line 68
    .line 69
    :cond_2
    invoke-virtual {p2, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-eqz p1, :cond_3

    .line 74
    .line 75
    invoke-virtual {p2, v7}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    iput-boolean p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;->e:Z

    .line 80
    .line 81
    :cond_3
    invoke-virtual {p2, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    const/4 p3, 0x0

    .line 86
    if-eqz p1, :cond_5

    .line 87
    .line 88
    invoke-virtual {p2, v6}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    move v6, p3

    .line 93
    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    .line 94
    .line 95
    .line 96
    move-result v7

    .line 97
    if-ge v6, v7, :cond_6

    .line 98
    .line 99
    new-instance v7, Ljava/lang/StringBuilder;

    .line 100
    .line 101
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 102
    .line 103
    .line 104
    iget-object v8, p0, Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;->d:Ljava/lang/String;

    .line 105
    .line 106
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {p1, v6}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v8

    .line 113
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v7

    .line 120
    iput-object v7, p0, Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;->d:Ljava/lang/String;

    .line 121
    .line 122
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    .line 123
    .line 124
    .line 125
    move-result v7

    .line 126
    add-int/lit8 v7, v7, -0x1

    .line 127
    .line 128
    if-ge v6, v7, :cond_4

    .line 129
    .line 130
    new-instance v7, Ljava/lang/StringBuilder;

    .line 131
    .line 132
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 133
    .line 134
    .line 135
    iget-object v8, p0, Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;->d:Ljava/lang/String;

    .line 136
    .line 137
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    const-string v8, ","

    .line 141
    .line 142
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v7

    .line 149
    iput-object v7, p0, Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;->d:Ljava/lang/String;

    .line 150
    .line 151
    :cond_4
    add-int/lit8 v6, v6, 0x1

    .line 152
    .line 153
    goto :goto_0

    .line 154
    :cond_5
    const-string p1, "0"

    .line 155
    .line 156
    iput-object p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;->d:Ljava/lang/String;

    .line 157
    .line 158
    :cond_6
    invoke-virtual {p2, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 159
    .line 160
    .line 161
    move-result p1

    .line 162
    if-eqz p1, :cond_7

    .line 163
    .line 164
    invoke-virtual {p2, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    iput-object p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;->g:Ljava/lang/String;

    .line 169
    .line 170
    goto :goto_1

    .line 171
    :cond_7
    const-string p1, " version 2"

    .line 172
    .line 173
    iput-object p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;->g:Ljava/lang/String;

    .line 174
    .line 175
    :goto_1
    invoke-virtual {p2, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 176
    .line 177
    .line 178
    move-result p1

    .line 179
    if-eqz p1, :cond_8

    .line 180
    .line 181
    invoke-virtual {p2, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object p1

    .line 185
    iput-object p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;->h:Ljava/lang/String;

    .line 186
    .line 187
    :cond_8
    invoke-virtual {p2, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 188
    .line 189
    .line 190
    move-result p1

    .line 191
    if-eqz p1, :cond_9

    .line 192
    .line 193
    invoke-virtual {p2, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 194
    .line 195
    .line 196
    move-result p1

    .line 197
    iput p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;->i:I

    .line 198
    .line 199
    :cond_9
    invoke-virtual {p2, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 200
    .line 201
    .line 202
    move-result p1

    .line 203
    if-eqz p1, :cond_a

    .line 204
    .line 205
    invoke-virtual {p2, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 206
    .line 207
    .line 208
    move-result-object p1

    .line 209
    iput-object p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;->j:Lorg/json/JSONObject;

    .line 210
    .line 211
    :cond_a
    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 212
    .line 213
    .line 214
    move-result p1

    .line 215
    if-eqz p1, :cond_b

    .line 216
    .line 217
    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 218
    .line 219
    .line 220
    :cond_b
    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 221
    .line 222
    .line 223
    move-result p1

    .line 224
    if-eqz p1, :cond_c

    .line 225
    .line 226
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;

    .line 227
    .line 228
    .line 229
    move-result-object p1

    .line 230
    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 231
    .line 232
    .line 233
    move-result v0

    .line 234
    invoke-virtual {p1, v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->setNetworkRequestTimeoutMS(I)V

    .line 235
    .line 236
    .line 237
    :cond_c
    const-string p1, "action_local_config_flag"

    .line 238
    .line 239
    invoke-virtual {p2, p1, p3}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    .line 240
    .line 241
    .line 242
    move-result p1

    .line 243
    iput-boolean p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;->f:Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 244
    .line 245
    return-void

    .line 246
    :catch_0
    move-exception p0

    .line 247
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 248
    .line 249
    .line 250
    const-string p1, "NetFetchState"

    .line 251
    .line 252
    const-string p2, "Failed to parse json:"

    .line 253
    .line 254
    invoke-static {p1, p2, p0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 255
    .line 256
    .line 257
    return-void
.end method

.method public moveToNextState()V
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->moveToNextState()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getWorkMode()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKKitFrameworkWorkMode;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/4 v1, 0x2

    .line 17
    if-eq v0, v1, :cond_0

    .line 18
    .line 19
    const/4 v1, 0x3

    .line 20
    if-eq v0, v1, :cond_0

    .line 21
    .line 22
    const/4 v1, 0x4

    .line 23
    if-eq v0, v1, :cond_0

    .line 24
    .line 25
    const/4 v1, 0x5

    .line 26
    if-eq v0, v1, :cond_0

    .line 27
    .line 28
    new-instance v0, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    const-string v1, "msg_param_error current unknown work mode:"

    .line 31
    .line 32
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getWorkMode()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKKitFrameworkWorkMode;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->getInstance()Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    const/high16 v2, 0x400000

    .line 55
    .line 56
    invoke-virtual {v1, v2, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->reportError(ILjava/lang/String;)V

    .line 57
    .line 58
    .line 59
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    new-instance v2, Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState$b;

    .line 64
    .line 65
    invoke-direct {v2, p0, v0}, Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState$b;-><init>(Lcom/tencent/youtu/sdkkitframework/liveness/NetFetchState;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v1, v2}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->sendFSMEvent(Ljava/util/HashMap;)V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_0
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    sget-object v1, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;->SILENT_STATE:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 77
    .line 78
    invoke-static {v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper;->classNameOfState(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    invoke-virtual {v0, v2}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->transitNextRound(Ljava/lang/String;)I

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    const/4 v2, -0x1

    .line 87
    if-ne v0, v2, :cond_1

    .line 88
    .line 89
    invoke-static {v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper;->classNameOfState(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-virtual {p0, v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->sendFSMTransitError(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    :cond_1
    return-void
.end method

.method public reset()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->reset()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public unload()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->unload()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
