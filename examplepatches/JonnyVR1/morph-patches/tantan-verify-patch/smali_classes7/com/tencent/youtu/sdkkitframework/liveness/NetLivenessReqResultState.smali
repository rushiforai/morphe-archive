.class public Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;
.super Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;
.source "SourceFile"


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:I

.field public e:Lcom/tencent/youtu/sdkkitframework/common/YTImageData;

.field public f:Z

.field public g:I

.field public h:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public i:Lorg/json/JSONObject;

.field public j:I

.field public k:Z

.field public l:Ljava/lang/String;

.field public m:Ljava/lang/String;

.field public n:I

.field public o:Z

.field public p:I


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->b:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    iput-boolean v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->f:Z

    .line 10
    .line 11
    const/16 v2, 0x46

    .line 12
    .line 13
    iput v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->g:I

    .line 14
    .line 15
    new-instance v2, Ljava/util/HashMap;

    .line 16
    .line 17
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->h:Ljava/util/HashMap;

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    iput-object v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->i:Lorg/json/JSONObject;

    .line 24
    .line 25
    iput v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->j:I

    .line 26
    .line 27
    iput-boolean v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->k:Z

    .line 28
    .line 29
    iput-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->l:Ljava/lang/String;

    .line 30
    .line 31
    iput-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->m:Ljava/lang/String;

    .line 32
    .line 33
    const/4 v0, 0x2

    .line 34
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->n:I

    .line 35
    .line 36
    iput-boolean v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->o:Z

    .line 37
    .line 38
    iput v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->p:I

    .line 39
    .line 40
    return-void
.end method

.method public static a(Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;)V
    .locals 4

    .line 448
    iget-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->f:Z

    if-eqz v0, :cond_0

    .line 449
    :try_start_0
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    move-result-object v0

    sget-object v1, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;->SILENT_STATE:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    invoke-static {v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper;->classNameOfState(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getStateByName(Ljava/lang/String;)Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;

    move-result-object v0

    const-string v2, "reset_manual_trigger"

    const/4 v3, 0x0

    .line 450
    invoke-virtual {v0, v2, v3}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->handleStateAction(Ljava/lang/String;Ljava/lang/Object;)V

    .line 451
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    move-result-object v0

    invoke-static {v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper;->classNameOfState(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->transitNextRound(Ljava/lang/String;)I

    move-result v0

    const/4 v2, -0x1

    if-ne v0, v2, :cond_0

    .line 452
    invoke-static {v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper;->classNameOfState(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->sendFSMTransitError(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 453
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "on Check response manual failed "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "NetLivenessReqResultState"

    const-string v2, "on Check response manual failed"

    .line 454
    invoke-static {v1, v2, p0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 455
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->getInstance()Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;

    move-result-object p0

    invoke-virtual {p0, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->reportInfo(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static a(Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;Ljava/util/HashMap;Ljava/lang/Exception;)V
    .locals 18

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v2, p1

    .line 4
    .line 5
    const-string v0, "similarity_float"

    .line 6
    .line 7
    const-string v3, " score "

    .line 8
    .line 9
    const-string v4, "score"

    .line 10
    .line 11
    const-string v5, "rst_succeed"

    .line 12
    .line 13
    const-string v6, "errorcode"

    .line 14
    .line 15
    const-string v7, "rst_failed"

    .line 16
    .line 17
    const-string v8, "error_code"

    .line 18
    .line 19
    const-string v9, "errorcode: "

    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 22
    .line 23
    .line 24
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->getInstance()Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;

    .line 25
    .line 26
    .line 27
    move-result-object v10

    .line 28
    invoke-virtual {v10}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->exitState()V

    .line 29
    .line 30
    .line 31
    const-string v10, "response"

    .line 32
    .line 33
    const-string v11, "NetLivenessReqResultState"

    .line 34
    .line 35
    if-eqz p2, :cond_1

    .line 36
    .line 37
    const-string v0, "failed: error"

    .line 38
    .line 39
    invoke-static {v11, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->getInstance()Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    const v4, 0x200001

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, v4, v3}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->reportError(ILjava/lang/String;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    if-eqz v2, :cond_0

    .line 61
    .line 62
    invoke-virtual {v2, v10}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    if-eqz v3, :cond_0

    .line 67
    .line 68
    invoke-virtual {v2, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    check-cast v0, Ljava/lang/String;

    .line 73
    .line 74
    :cond_0
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    new-instance v3, Lcom/tencent/youtu/sdkkitframework/liveness/g;

    .line 79
    .line 80
    invoke-direct {v3, v1, v0}, Lcom/tencent/youtu/sdkkitframework/liveness/g;-><init>(Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v2, v3}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->sendFSMEvent(Ljava/util/HashMap;)V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_1
    const/4 v13, -0x1

    .line 88
    :try_start_0
    new-instance v14, Lorg/json/JSONObject;

    .line 89
    .line 90
    invoke-virtual {v2, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v15

    .line 94
    check-cast v15, Ljava/lang/String;

    .line 95
    .line 96
    invoke-direct {v14, v15}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v14, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 100
    .line 101
    .line 102
    move-result v15
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_6

    .line 103
    :try_start_1
    invoke-virtual {v14, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 104
    .line 105
    .line 106
    move-result v16
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_5

    .line 107
    if-nez v16, :cond_2

    .line 108
    .line 109
    :try_start_2
    invoke-virtual {v14, v8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 110
    .line 111
    .line 112
    move-result v16

    .line 113
    if-eqz v16, :cond_3

    .line 114
    .line 115
    :cond_2
    const/16 p2, 0x0

    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_3
    const-string v4, "response not right"

    .line 119
    .line 120
    const/4 v6, 0x0

    .line 121
    invoke-static {v11, v4, v6}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0

    .line 122
    .line 123
    .line 124
    move v4, v13

    .line 125
    move v6, v4

    .line 126
    const/16 p2, 0x0

    .line 127
    .line 128
    goto :goto_5

    .line 129
    :catch_0
    move-exception v0

    .line 130
    move v4, v13

    .line 131
    move v12, v4

    .line 132
    const/16 p2, 0x0

    .line 133
    .line 134
    goto/16 :goto_7

    .line 135
    .line 136
    :goto_0
    :try_start_3
    iget v12, v1, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->j:I

    .line 137
    .line 138
    if-nez v12, :cond_4

    .line 139
    .line 140
    invoke-virtual {v14, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 141
    .line 142
    .line 143
    move-result v6

    .line 144
    goto :goto_2

    .line 145
    :catch_1
    move-exception v0

    .line 146
    :goto_1
    move v4, v13

    .line 147
    move v12, v4

    .line 148
    goto/16 :goto_7

    .line 149
    .line 150
    :cond_4
    invoke-virtual {v14, v8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 151
    .line 152
    .line 153
    move-result v12

    .line 154
    if-eqz v12, :cond_5

    .line 155
    .line 156
    invoke-virtual {v14, v8}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 157
    .line 158
    .line 159
    move-result v6

    .line 160
    goto :goto_2

    .line 161
    :cond_5
    invoke-virtual {v14, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 162
    .line 163
    .line 164
    move-result v12

    .line 165
    if-eqz v12, :cond_6

    .line 166
    .line 167
    invoke-virtual {v14, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 168
    .line 169
    .line 170
    move-result v6
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_1

    .line 171
    goto :goto_2

    .line 172
    :cond_6
    move v6, v13

    .line 173
    :goto_2
    if-eqz v15, :cond_7

    .line 174
    .line 175
    :try_start_4
    invoke-virtual {v14, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 176
    .line 177
    .line 178
    move-result v4
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_2

    .line 179
    goto :goto_4

    .line 180
    :catch_2
    move-exception v0

    .line 181
    move v4, v13

    .line 182
    move v12, v4

    .line 183
    :goto_3
    move v13, v6

    .line 184
    goto :goto_7

    .line 185
    :cond_7
    move v4, v13

    .line 186
    :goto_4
    :try_start_5
    new-instance v12, Ljava/lang/StringBuilder;

    .line 187
    .line 188
    invoke-direct {v12, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 189
    .line 190
    .line 191
    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 192
    .line 193
    .line 194
    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 195
    .line 196
    .line 197
    invoke-virtual {v12, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 198
    .line 199
    .line 200
    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object v12

    .line 204
    invoke-static {v11, v12}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 205
    .line 206
    .line 207
    :goto_5
    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 208
    .line 209
    .line 210
    move-result v12

    .line 211
    if-eqz v12, :cond_9

    .line 212
    .line 213
    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 214
    .line 215
    .line 216
    move-result v12
    :try_end_5
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_4

    .line 217
    if-eq v12, v13, :cond_8

    .line 218
    .line 219
    :try_start_6
    iget v0, v1, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->g:I
    :try_end_6
    .catch Lorg/json/JSONException; {:try_start_6 .. :try_end_6} :catch_3

    .line 220
    .line 221
    if-le v12, v0, :cond_8

    .line 222
    .line 223
    move-object v0, v5

    .line 224
    :goto_6
    move v13, v12

    .line 225
    goto :goto_8

    .line 226
    :cond_8
    move-object v0, v7

    .line 227
    goto :goto_6

    .line 228
    :catch_3
    move-exception v0

    .line 229
    goto :goto_3

    .line 230
    :catch_4
    move-exception v0

    .line 231
    move v12, v13

    .line 232
    goto :goto_3

    .line 233
    :cond_9
    move-object v0, v7

    .line 234
    goto :goto_8

    .line 235
    :catch_5
    move-exception v0

    .line 236
    const/16 p2, 0x0

    .line 237
    .line 238
    goto :goto_1

    .line 239
    :catch_6
    move-exception v0

    .line 240
    const/16 p2, 0x0

    .line 241
    .line 242
    move/from16 v15, p2

    .line 243
    .line 244
    goto :goto_1

    .line 245
    :goto_7
    const-string v6, "handleResponseEvent error"

    .line 246
    .line 247
    invoke-static {v11, v6, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 248
    .line 249
    .line 250
    move-object v0, v7

    .line 251
    move v6, v13

    .line 252
    goto :goto_6

    .line 253
    :goto_8
    new-instance v12, Ljava/util/HashMap;

    .line 254
    .line 255
    invoke-direct {v12}, Ljava/util/HashMap;-><init>()V

    .line 256
    .line 257
    .line 258
    new-instance v14, Ljava/lang/StringBuilder;

    .line 259
    .line 260
    invoke-direct {v14, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 261
    .line 262
    .line 263
    invoke-virtual {v14, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 264
    .line 265
    .line 266
    invoke-virtual {v14, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 267
    .line 268
    .line 269
    invoke-virtual {v14, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 270
    .line 271
    .line 272
    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 273
    .line 274
    .line 275
    move-result-object v3

    .line 276
    invoke-static {v11, v3}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 277
    .line 278
    .line 279
    const-string v3, "message"

    .line 280
    .line 281
    const-string v9, "process_action"

    .line 282
    .line 283
    const-string v11, "ui_tips"

    .line 284
    .line 285
    const-string v14, "process_finished"

    .line 286
    .line 287
    move/from16 v16, v13

    .line 288
    .line 289
    const-string v13, "ui_action"

    .line 290
    .line 291
    if-nez v6, :cond_b

    .line 292
    .line 293
    if-eqz v15, :cond_a

    .line 294
    .line 295
    move/from16 v17, v15

    .line 296
    .line 297
    iget v15, v1, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->d:I

    .line 298
    .line 299
    if-lt v4, v15, :cond_c

    .line 300
    .line 301
    :cond_a
    invoke-virtual {v12, v13, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 302
    .line 303
    .line 304
    invoke-virtual {v12, v11, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 305
    .line 306
    .line 307
    const-string v4, "succeed"

    .line 308
    .line 309
    invoke-virtual {v12, v9, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 310
    .line 311
    .line 312
    invoke-static/range {p2 .. p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 313
    .line 314
    .line 315
    move-result-object v4

    .line 316
    invoke-virtual {v12, v8, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 317
    .line 318
    .line 319
    invoke-virtual {v2, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 320
    .line 321
    .line 322
    move-result-object v2

    .line 323
    check-cast v2, Ljava/lang/String;

    .line 324
    .line 325
    move/from16 v4, p2

    .line 326
    .line 327
    invoke-static {v4, v5, v2}, Lcom/tencent/youtu/sdkkitframework/common/CommonUtils;->makeMessageJson(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 328
    .line 329
    .line 330
    move-result-object v2

    .line 331
    invoke-virtual {v12, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 332
    .line 333
    .line 334
    iget-object v1, v1, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->e:Lcom/tencent/youtu/sdkkitframework/common/YTImageData;

    .line 335
    .line 336
    const-string v2, "extra_message"

    .line 337
    .line 338
    invoke-virtual {v12, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 339
    .line 340
    .line 341
    if-lez v16, :cond_e

    .line 342
    .line 343
    const-string v1, "cmp_message"

    .line 344
    .line 345
    invoke-virtual {v12, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 346
    .line 347
    .line 348
    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 349
    .line 350
    .line 351
    move-result-object v0

    .line 352
    const-string v1, "cmp_score"

    .line 353
    .line 354
    invoke-virtual {v12, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 355
    .line 356
    .line 357
    goto :goto_a

    .line 358
    :cond_b
    move/from16 v17, v15

    .line 359
    .line 360
    :cond_c
    const-string v0, "error_reason_code"

    .line 361
    .line 362
    if-eqz v17, :cond_d

    .line 363
    .line 364
    iget v1, v1, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->d:I

    .line 365
    .line 366
    if-ge v4, v1, :cond_d

    .line 367
    .line 368
    const v1, 0x400001

    .line 369
    .line 370
    .line 371
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 372
    .line 373
    .line 374
    move-result-object v1

    .line 375
    invoke-virtual {v12, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 376
    .line 377
    .line 378
    goto :goto_9

    .line 379
    :cond_d
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 380
    .line 381
    .line 382
    move-result-object v1

    .line 383
    invoke-virtual {v12, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 384
    .line 385
    .line 386
    :goto_9
    invoke-virtual {v12, v13, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 387
    .line 388
    .line 389
    invoke-virtual {v12, v11, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 390
    .line 391
    .line 392
    const-string v0, "failed"

    .line 393
    .line 394
    invoke-virtual {v12, v9, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 395
    .line 396
    .line 397
    const/high16 v0, 0x400000

    .line 398
    .line 399
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 400
    .line 401
    .line 402
    move-result-object v0

    .line 403
    invoke-virtual {v12, v8, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 404
    .line 405
    .line 406
    invoke-virtual {v2, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 407
    .line 408
    .line 409
    move-result-object v0

    .line 410
    check-cast v0, Ljava/lang/String;

    .line 411
    .line 412
    invoke-static {v6, v7, v0}, Lcom/tencent/youtu/sdkkitframework/common/CommonUtils;->makeMessageJson(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 413
    .line 414
    .line 415
    move-result-object v0

    .line 416
    invoke-virtual {v12, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 417
    .line 418
    .line 419
    :cond_e
    :goto_a
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->getInstance()Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;

    .line 420
    .line 421
    .line 422
    move-result-object v0

    .line 423
    new-instance v1, Ljava/lang/StringBuilder;

    .line 424
    .line 425
    const-string v2, "errorCode "

    .line 426
    .line 427
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 428
    .line 429
    .line 430
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 431
    .line 432
    .line 433
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 434
    .line 435
    .line 436
    move-result-object v1

    .line 437
    invoke-virtual {v0, v1}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->reportInfo(Ljava/lang/String;)V

    .line 438
    .line 439
    .line 440
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 441
    .line 442
    .line 443
    move-result-object v0

    .line 444
    invoke-virtual {v0, v12}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->sendFSMEvent(Ljava/util/HashMap;)V

    .line 445
    .line 446
    .line 447
    return-void
.end method


# virtual methods
.method public final a([Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    const-string p0, ""

    const/4 v0, 0x0

    .line 464
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_6

    .line 465
    aget-object v1, p1, v0

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_4

    if-eq v1, v2, :cond_4

    const/4 v3, 0x2

    if-eq v1, v3, :cond_3

    const/4 v3, 0x3

    if-eq v1, v3, :cond_2

    const/4 v3, 0x4

    if-eq v1, v3, :cond_1

    const/4 v3, 0x5

    if-eq v1, v3, :cond_0

    goto :goto_1

    .line 466
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "silence"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_1

    .line 467
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "shake"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_1

    .line 468
    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "node"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_1

    .line 469
    :cond_3
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "mouth"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_1

    .line 470
    :cond_4
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "blink"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 471
    :goto_1
    array-length v1, p1

    sub-int/2addr v1, v2

    if-eq v0, v1, :cond_5

    .line 472
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ","

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :cond_5
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_0

    :cond_6
    return-object p0
.end method

.method public final a()V
    .locals 7

    .line 456
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->m:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 457
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->m:Ljava/lang/String;

    const-string v0, "&"

    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    .line 458
    array-length v0, p0

    if-lez v0, :cond_1

    .line 459
    array-length v0, p0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_1

    aget-object v3, p0, v2

    const-string v4, "="

    .line 460
    invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 461
    array-length v4, v3

    const/4 v5, 0x1

    if-le v4, v5, :cond_0

    .line 462
    aget-object v4, v3, v1

    const-string v6, "actref_ux_mode"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 463
    aget-object v3, v3, v5

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public enter()V
    .locals 23

    move-object/from16 v1, p0

    .line 1
    const-string v0, "client_version="

    const-string v2, "videochecksum="

    const-string v3, "cpnum:"

    const-string v4, "extraconfig:"

    invoke-super {v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->enter()V

    .line 2
    iget-object v5, v1, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->isPause:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v5

    const-string v6, "NetLivenessReqResultState"

    if-eqz v5, :cond_0

    .line 3
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    move-result-object v0

    new-instance v2, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState$a;

    invoke-direct {v2, v1}, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState$a;-><init>(Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;)V

    invoke-virtual {v0, v2}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->sendFSMEvent(Ljava/util/HashMap;)V

    const-wide/16 v0, 0x1e

    .line 4
    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "Thread sleep error"

    .line 5
    invoke-static {v6, v1, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 6
    :goto_0
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    move-result-object v0

    sget-object v1, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;->NET_LIVENESS_REQ_RESULT_STATE:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    invoke-static {v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper;->classNameOfState(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->transitNow(Ljava/lang/String;)I

    return-void

    .line 7
    :cond_0
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    move-result-object v5

    new-instance v7, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState$b;

    invoke-direct {v7, v1}, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState$b;-><init>(Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;)V

    invoke-virtual {v5, v7}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->sendFSMEvent(Ljava/util/HashMap;)V

    .line 8
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    move-result-object v5

    invoke-virtual {v5}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getWorkMode()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKKitFrameworkWorkMode;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Enum;->ordinal()I

    move-result v5

    const-string v7, "action_seq"

    const-string v9, "best_frame"

    const-string v10, "frames"

    const-string v11, "make_pack_use_time"

    const/4 v12, 0x2

    if-eq v5, v12, :cond_1a

    const/4 v14, 0x3

    if-eq v5, v14, :cond_1a

    const/4 v14, 0x4

    const-string v15, "cp_num"

    const-string v8, " refcontrol_begin "

    const-string v12, "refcontrol_begin"

    const-string v13, "extra_config"

    move-object/from16 v17, v11

    const-string v11, "reflect_request_object"

    move-object/from16 v18, v0

    const-string v0, ""

    if-eq v5, v14, :cond_f

    const/4 v14, 0x5

    if-eq v5, v14, :cond_1

    goto/16 :goto_13

    .line 9
    :cond_1
    :try_start_1
    invoke-static/range {v17 .. v17}, Lcom/tencent/youtu/sdkkitframework/common/CommonUtils;->benchMarkBegin(Ljava/lang/String;)V

    .line 10
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    move-result-object v5

    sget-object v14, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;->NET_FETCH_STATE:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    invoke-static {v14}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper;->classNameOfState(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v5, v14}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getStateByName(Ljava/lang/String;)Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;

    move-result-object v5

    .line 11
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    move-result-object v14

    sget-object v19, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;->ACTION_STATE:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    move-object/from16 v20, v2

    invoke-static/range {v19 .. v19}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper;->classNameOfState(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v14, v2}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getStateByName(Ljava/lang/String;)Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;

    move-result-object v2

    .line 12
    invoke-virtual {v2, v9}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->getStateDataBy(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;

    iput-object v14, v1, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->e:Lcom/tencent/youtu/sdkkitframework/common/YTImageData;

    move-object/from16 v19, v0

    .line 13
    iget-object v0, v1, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->stateData:Ljava/util/HashMap;

    invoke-virtual {v0, v9, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    move-result-object v0

    sget-object v9, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;->REFLECT_STATE:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    invoke-static {v9}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper;->classNameOfState(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0, v9}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getStateByName(Ljava/lang/String;)Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;

    move-result-object v0

    .line 15
    invoke-virtual {v0, v11}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->getStateDataBy(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ActionReflectReq;

    .line 16
    invoke-virtual {v2, v10}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->getStateDataBy(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v11

    instance-of v11, v11, Ljava/lang/String;

    if-eqz v11, :cond_2

    .line 17
    invoke-virtual {v2, v10}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->getStateDataBy(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v10

    move-object/from16 v16, v10

    const/4 v10, 0x0

    const/4 v14, 0x0

    goto :goto_1

    :catch_1
    move-exception v0

    goto/16 :goto_9

    .line 18
    :cond_2
    invoke-virtual {v2, v10}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->getStateDataBy(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/tencent/youtu/ytposedetect/data/ActionData;

    .line 19
    iget-object v11, v10, Lcom/tencent/youtu/ytposedetect/data/ActionData;->videoMD:Ljava/lang/String;

    .line 20
    iget-object v14, v10, Lcom/tencent/youtu/ytposedetect/data/ActionData;->sdMD:Ljava/lang/String;

    .line 21
    iget-object v10, v10, Lcom/tencent/youtu/ytposedetect/data/ActionData;->video:[B

    if-nez v10, :cond_3

    const-string v10, "action data is null"

    move-object/from16 v21, v11

    const/4 v11, 0x0

    .line 22
    invoke-static {v6, v10, v11}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    move-object/from16 v10, v21

    const/16 v16, 0x0

    goto :goto_1

    :cond_3
    move-object/from16 v21, v11

    .line 23
    new-instance v11, Ljava/lang/String;

    move-object/from16 v22, v14

    const/4 v14, 0x2

    invoke-static {v10, v14}, Landroid/util/Base64;->encode([BI)[B

    move-result-object v10

    invoke-direct {v11, v10}, Ljava/lang/String;-><init>([B)V

    move-object/from16 v16, v11

    move-object/from16 v10, v21

    move-object/from16 v14, v22

    :goto_1
    const-string v11, "control_config"

    .line 24
    invoke-virtual {v5, v11}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->getStateDataBy(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    if-eqz v11, :cond_4

    .line 25
    iput-object v11, v1, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->m:Ljava/lang/String;

    .line 26
    :cond_4
    invoke-virtual {v5, v13}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->getStateDataBy(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    if-eqz v11, :cond_5

    .line 27
    iput-object v11, v1, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->l:Ljava/lang/String;

    .line 28
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->l:Ljava/lang/String;

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v6, v4}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 29
    :cond_5
    invoke-virtual {v0, v12}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->getStateDataBy(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_7

    .line 30
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v11, v1, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->l:Ljava/lang/String;

    if-eqz v11, :cond_6

    goto :goto_2

    :cond_6
    move-object/from16 v11, v19

    :goto_2
    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->l:Ljava/lang/String;

    .line 31
    :cond_7
    invoke-virtual {v5, v15}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->getStateDataBy(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_8

    .line 32
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, v1, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->n:I

    .line 33
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v3, v1, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->n:I

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v6, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 34
    :cond_8
    invoke-virtual {v1}, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->a()V

    .line 35
    invoke-virtual {v2, v7}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->getStateDataBy(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    .line 36
    invoke-virtual {v1, v0}, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->a([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 37
    new-instance v2, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReqData;

    invoke-direct {v2}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReqData;-><init>()V

    .line 38
    new-instance v3, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;

    invoke-direct {v3}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;-><init>()V

    iput-object v3, v2, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReqData;->baseInfo:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;

    .line 39
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;->sessionId:Ljava/lang/String;

    .line 40
    iget-object v3, v2, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReqData;->baseInfo:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;

    iget-object v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->a:Ljava/lang/String;

    iput-object v4, v3, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;->appId:Ljava/lang/String;

    move-object/from16 v4, v19

    .line 41
    iput-object v4, v3, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;->businessId:Ljava/lang/String;

    .line 42
    iget-object v3, v9, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ActionReflectReq;->color_data:Ljava/lang/String;

    iput-object v3, v2, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReqData;->colorData:Ljava/lang/String;

    if-eqz v16, :cond_9

    move-object/from16 v4, v16

    .line 43
    :cond_9
    iput-object v4, v2, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReqData;->actionVideo:Ljava/lang/String;

    .line 44
    iput-object v0, v2, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReqData;->actionStr:Ljava/lang/String;

    .line 45
    new-instance v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ImageInfo;

    iget-object v3, v9, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ActionReflectReq;->eye_image:Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/YTImageInfo;

    iget-object v4, v3, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/YTImageInfo;->image:Ljava/lang/String;

    iget-object v5, v3, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/YTImageInfo;->five_points:Ljava/util/ArrayList;

    iget-object v3, v3, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/YTImageInfo;->checksum:Ljava/lang/String;

    invoke-direct {v0, v4, v5, v3}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ImageInfo;-><init>(Ljava/lang/String;Ljava/util/ArrayList;Ljava/lang/String;)V

    iput-object v0, v2, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReqData;->eyeImage:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ImageInfo;

    .line 46
    new-instance v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ImageInfo;

    iget-object v3, v9, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ActionReflectReq;->mouth_image:Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/YTImageInfo;

    iget-object v4, v3, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/YTImageInfo;->image:Ljava/lang/String;

    iget-object v5, v3, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/YTImageInfo;->five_points:Ljava/util/ArrayList;

    iget-object v3, v3, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/YTImageInfo;->checksum:Ljava/lang/String;

    invoke-direct {v0, v4, v5, v3}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ImageInfo;-><init>(Ljava/lang/String;Ljava/util/ArrayList;Ljava/lang/String;)V

    iput-object v0, v2, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReqData;->mouthImage:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ImageInfo;

    .line 47
    new-instance v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ImageInfo;

    iget-object v3, v9, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ActionReflectReq;->live_image:Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/YTImageInfo;

    iget-object v4, v3, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/YTImageInfo;->image:Ljava/lang/String;

    iget-object v5, v3, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/YTImageInfo;->five_points:Ljava/util/ArrayList;

    iget-object v3, v3, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/YTImageInfo;->checksum:Ljava/lang/String;

    invoke-direct {v0, v4, v5, v3}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ImageInfo;-><init>(Ljava/lang/String;Ljava/util/ArrayList;Ljava/lang/String;)V

    iput-object v0, v2, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReqData;->liveImage:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ImageInfo;

    .line 48
    iget-object v0, v9, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ActionReflectReq;->reflect_data:Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;

    iput-object v0, v2, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReqData;->reflectData:Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;

    .line 49
    iget-object v0, v2, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReqData;->baseInfo:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;

    iget-object v3, v9, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ActionReflectReq;->select_data:Lcom/tencent/youtu/ytagreflectlivecheck/requester/LiveStyleRequester$SeleceData;

    iget-object v3, v3, Lcom/tencent/youtu/ytagreflectlivecheck/requester/LiveStyleRequester$SeleceData;->android_data:Lcom/tencent/youtu/ytagreflectlivecheck/requester/LiveStyleRequester$LiveStyleAndroidData;

    iget v3, v3, Lcom/tencent/youtu/ytagreflectlivecheck/requester/LiveStyleRequester$LiveStyleAndroidData;->lux:F

    iput v3, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;->lux:F

    .line 50
    iget-object v0, v1, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->l:Ljava/lang/String;

    iput-object v0, v2, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReqData;->reflectConfig:Ljava/lang/String;

    .line 51
    iget-object v0, v1, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->m:Ljava/lang/String;

    iput-object v0, v2, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReqData;->controlConfig:Ljava/lang/String;

    .line 52
    iget v0, v1, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->n:I

    iput v0, v2, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReqData;->colorNum:I

    .line 53
    invoke-static {}, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->getVersion()Ljava/lang/String;

    move-result-object v0

    if-eqz v10, :cond_a

    .line 54
    new-instance v3, Ljava/lang/StringBuilder;

    move-object/from16 v4, v20

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "&&client_version="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v2, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReqData;->config:Ljava/lang/String;

    goto :goto_3

    .line 55
    :cond_a
    new-instance v3, Ljava/lang/StringBuilder;

    move-object/from16 v4, v18

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v2, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReqData;->config:Ljava/lang/String;

    .line 56
    :goto_3
    invoke-static {v2, v10, v14}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper;->makeActionReflectLiveReq(Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReqData;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 57
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    move-result-object v0

    new-instance v3, Lcom/tencent/youtu/sdkkitframework/liveness/k;

    invoke-direct {v3, v1, v14, v10}, Lcom/tencent/youtu/sdkkitframework/liveness/k;-><init>(Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v3}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->sendFSMEvent(Ljava/util/HashMap;)V

    .line 58
    iget-object v0, v1, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->i:Lorg/json/JSONObject;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    if-eqz v0, :cond_c

    .line 59
    :try_start_2
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 60
    iget-object v3, v1, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->i:Lorg/json/JSONObject;

    invoke-virtual {v3}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v3

    .line 61
    :goto_4
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_b

    .line 62
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 63
    iget-object v5, v1, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->i:Lorg/json/JSONObject;

    invoke-virtual {v5, v4}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_4

    :catch_2
    move-exception v0

    goto :goto_5

    .line 64
    :cond_b
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_6

    :goto_5
    :try_start_3
    const-string v3, "lipread net request parse json failed "

    .line 65
    invoke-static {v6, v3, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 66
    :cond_c
    :goto_6
    iget-boolean v0, v1, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->o:Z

    if-eqz v0, :cond_e

    .line 67
    new-instance v0, Lcom/tencent/youtu/sdkkitframework/common/EncryptUtil;

    invoke-direct {v0}, Lcom/tencent/youtu/sdkkitframework/common/EncryptUtil;-><init>()V

    .line 68
    iget v3, v1, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->p:I

    if-nez v3, :cond_d

    .line 69
    iget-object v3, v1, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->a:Ljava/lang/String;

    iget-object v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->b:Ljava/lang/String;

    const-string v5, "config"

    invoke-virtual {v0, v2, v3, v4, v5}, Lcom/tencent/youtu/sdkkitframework/common/EncryptUtil;->generateEncReq(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_7
    move-object v2, v0

    goto :goto_8

    :cond_d
    const/4 v4, 0x1

    if-ne v3, v4, :cond_e

    .line 70
    iget-object v3, v1, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->a:Ljava/lang/String;

    iget-object v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->b:Ljava/lang/String;

    invoke-virtual {v0, v2, v3, v4}, Lcom/tencent/youtu/sdkkitframework/common/EncryptUtil;->generateSMReq(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_7

    :cond_e
    :goto_8
    move-object v10, v2

    .line 71
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;->getInstance()Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;

    move-result-object v0

    invoke-static/range {v17 .. v17}, Lcom/tencent/youtu/sdkkitframework/common/CommonUtils;->benchMarkEnd(Ljava/lang/String;)J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;->setPackUseTime(J)V

    .line 72
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    move-result-object v7
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    const-string v8, "net_reporting"

    :try_start_4
    iget-object v9, v1, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->c:Ljava/lang/String;

    new-instance v12, Lcom/tencent/youtu/sdkkitframework/liveness/l;

    invoke-direct {v12, v1}, Lcom/tencent/youtu/sdkkitframework/liveness/l;-><init>(Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;)V

    const/4 v11, 0x0

    invoke-virtual/range {v7 .. v12}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->sendNetworkRequest(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$IYtSDKKitNetResponseParser;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    goto/16 :goto_13

    :goto_9
    const-string v2, "actrefl request failed"

    .line 73
    invoke-static {v6, v2, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 74
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->getInstance()Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "actrefl request failed: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->reportInfo(Ljava/lang/String;)V

    .line 75
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    move-result-object v2

    new-instance v3, Lcom/tencent/youtu/sdkkitframework/liveness/f;

    invoke-direct {v3, v1, v0}, Lcom/tencent/youtu/sdkkitframework/liveness/f;-><init>(Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;Ljava/lang/Exception;)V

    invoke-virtual {v2, v3}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->sendFSMEvent(Ljava/util/HashMap;)V

    goto/16 :goto_13

    :cond_f
    move-object v4, v0

    .line 76
    invoke-static/range {v17 .. v17}, Lcom/tencent/youtu/sdkkitframework/common/CommonUtils;->benchMarkBegin(Ljava/lang/String;)V

    .line 77
    const-string v0, "reflect_request_s1"

    invoke-static {v0}, Lcom/tencent/youtu/sdkkitframework/common/CommonUtils;->benchMarkBegin(Ljava/lang/String;)V

    .line 78
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    move-result-object v2

    sget-object v3, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;->SILENT_STATE:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    invoke-static {v3}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper;->classNameOfState(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getStateByName(Ljava/lang/String;)Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;

    move-result-object v2

    .line 79
    const-string v3, "best_image"

    invoke-virtual {v2, v3}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->getStateDataBy(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;

    iput-object v5, v1, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->e:Lcom/tencent/youtu/sdkkitframework/common/YTImageData;

    .line 80
    iget-object v5, v5, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->imgData:[B

    const/4 v14, 0x2

    .line 81
    invoke-static {v5, v14}, Landroid/util/Base64;->encode([BI)[B

    move-result-object v5

    .line 82
    iget-object v7, v1, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->stateData:Ljava/util/HashMap;

    iget-object v10, v1, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->e:Lcom/tencent/youtu/sdkkitframework/common/YTImageData;

    invoke-virtual {v7, v9, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    move-result-object v7

    sget-object v9, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;->REFLECT_STATE:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    invoke-static {v9}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper;->classNameOfState(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getStateByName(Ljava/lang/String;)Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;

    move-result-object v7

    .line 84
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    move-result-object v9

    sget-object v10, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;->NET_FETCH_STATE:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    invoke-static {v10}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper;->classNameOfState(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getStateByName(Ljava/lang/String;)Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;

    move-result-object v9

    .line 85
    invoke-virtual {v7, v11}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->getStateDataBy(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectLiveReq;

    .line 86
    invoke-virtual {v9, v13}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->getStateDataBy(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    if-eqz v11, :cond_10

    .line 87
    iput-object v11, v1, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->l:Ljava/lang/String;

    .line 88
    :cond_10
    invoke-virtual {v7, v12}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->getStateDataBy(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    if-eqz v7, :cond_12

    .line 89
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v12, v1, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->l:Ljava/lang/String;

    if-eqz v12, :cond_11

    move-object v4, v12

    :cond_11
    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->l:Ljava/lang/String;

    .line 90
    :cond_12
    invoke-virtual {v9, v15}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->getStateDataBy(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    if-eqz v4, :cond_13

    .line 91
    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    iput v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->n:I

    .line 92
    :cond_13
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v10, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectLiveReq;->session_id:Ljava/lang/String;

    .line 93
    new-instance v4, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ReflectLiveReqData;

    invoke-direct {v4}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ReflectLiveReqData;-><init>()V

    .line 94
    new-instance v7, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;

    invoke-direct {v7}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;-><init>()V

    iput-object v7, v4, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ReflectLiveReqData;->baseInfo:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;

    .line 95
    iget-object v8, v1, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->a:Ljava/lang/String;

    iput-object v8, v7, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;->appId:Ljava/lang/String;

    .line 96
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v8

    iput-object v8, v7, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;->sessionId:Ljava/lang/String;

    .line 97
    iget-object v7, v4, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ReflectLiveReqData;->baseInfo:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;

    iget-object v8, v1, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->h:Ljava/util/HashMap;

    const-string v9, "business_id"

    invoke-virtual {v8, v9}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_14

    iget-object v8, v1, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->h:Ljava/util/HashMap;

    invoke-virtual {v8, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    goto :goto_a

    :cond_14
    const/4 v8, 0x0

    :goto_a
    iput-object v8, v7, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;->businessId:Ljava/lang/String;

    .line 98
    iget-object v7, v4, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ReflectLiveReqData;->baseInfo:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;

    iget-object v8, v1, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->h:Ljava/util/HashMap;

    const-string v9, "person_id"

    invoke-virtual {v8, v9}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_15

    iget-object v8, v1, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->h:Ljava/util/HashMap;

    invoke-virtual {v8, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    goto :goto_b

    :cond_15
    const/4 v8, 0x0

    :goto_b
    iput-object v8, v7, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;->personId:Ljava/lang/String;

    .line 99
    iget-object v7, v4, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ReflectLiveReqData;->baseInfo:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;

    iget-object v8, v1, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->h:Ljava/util/HashMap;

    const-string v9, "person_type"

    invoke-virtual {v8, v9}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_16

    iget-object v8, v1, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->h:Ljava/util/HashMap;

    invoke-virtual {v8, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    goto :goto_c

    :cond_16
    const/4 v8, 0x0

    :goto_c
    iput-object v8, v7, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;->personType:Ljava/lang/String;

    .line 100
    iget-object v7, v4, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ReflectLiveReqData;->baseInfo:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;

    iget-object v8, v1, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->h:Ljava/util/HashMap;

    const-string v9, "req_type"

    invoke-virtual {v8, v9}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_17

    iget-object v8, v1, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->h:Ljava/util/HashMap;

    invoke-virtual {v8, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    goto :goto_d

    :cond_17
    const/4 v8, 0x0

    :goto_d
    iput-object v8, v7, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;->reqType:Ljava/lang/String;

    .line 101
    iget-object v7, v4, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ReflectLiveReqData;->baseInfo:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;

    iget-object v8, v1, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->h:Ljava/util/HashMap;

    const-string v9, "live_type"

    invoke-virtual {v8, v9}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v8

    const/4 v11, 0x0

    if-eqz v8, :cond_18

    iget-object v8, v1, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->h:Ljava/util/HashMap;

    invoke-virtual {v8, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    goto :goto_e

    :cond_18
    move v8, v11

    :goto_e
    iput v8, v7, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;->liveType:I

    .line 102
    iget-object v7, v10, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectLiveReq;->color_data:Ljava/lang/String;

    iput-object v7, v4, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ReflectLiveReqData;->colorData:Ljava/lang/String;

    .line 103
    new-instance v7, Ljava/lang/String;

    invoke-direct {v7, v5}, Ljava/lang/String;-><init>([B)V

    iput-object v7, v4, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ReflectLiveReqData;->liveImage:Ljava/lang/String;

    .line 104
    iget-object v5, v10, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectLiveReq;->reflect_data:Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;

    iput-object v5, v4, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ReflectLiveReqData;->reflectData:Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;

    .line 105
    iget-object v5, v1, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->l:Ljava/lang/String;

    iput-object v5, v4, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ReflectLiveReqData;->config:Ljava/lang/String;

    .line 106
    iget v5, v1, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->n:I

    iput v5, v4, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ReflectLiveReqData;->colorNum:I

    .line 107
    iget v5, v1, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->j:I

    const/4 v14, 0x2

    if-ne v5, v14, :cond_19

    .line 108
    invoke-virtual {v2, v3}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->getStateDataBy(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/graphics/YuvImage;

    const-string v5, "best_shape"

    .line 109
    invoke-virtual {v2, v5}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->getStateDataBy(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [F

    .line 110
    new-instance v7, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v7}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 111
    new-instance v8, Landroid/graphics/Rect;

    iget-object v9, v1, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->e:Lcom/tencent/youtu/sdkkitframework/common/YTImageData;

    invoke-virtual {v9}, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->getWidth()I

    move-result v9

    iget-object v10, v1, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->e:Lcom/tencent/youtu/sdkkitframework/common/YTImageData;

    invoke-virtual {v10}, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->getHeight()I

    move-result v10

    invoke-direct {v8, v11, v11, v9, v10}, Landroid/graphics/Rect;-><init>(IIII)V

    const/16 v9, 0x5f

    invoke-virtual {v3, v8, v9, v7}, Landroid/graphics/YuvImage;->compressToJpeg(Landroid/graphics/Rect;ILjava/io/OutputStream;)Z

    .line 112
    invoke-virtual {v7}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    .line 113
    new-instance v7, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ImageInfo;

    const/4 v8, 0x0

    invoke-direct {v7, v3, v5, v8}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ImageInfo;-><init>([B[FLjava/lang/String;)V

    iput-object v7, v4, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ReflectLiveReqData;->bestImage:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ImageInfo;

    const-string v3, "openmouth_image"

    .line 114
    invoke-virtual {v2, v3}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->getStateDataBy(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/graphics/YuvImage;

    const-string v5, "openmouth_shape"

    .line 115
    invoke-virtual {v2, v5}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->getStateDataBy(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [F

    .line 116
    new-instance v7, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v7}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 117
    new-instance v8, Landroid/graphics/Rect;

    invoke-virtual {v3}, Landroid/graphics/YuvImage;->getWidth()I

    move-result v10

    invoke-virtual {v3}, Landroid/graphics/YuvImage;->getHeight()I

    move-result v12

    invoke-direct {v8, v11, v11, v10, v12}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {v3, v8, v9, v7}, Landroid/graphics/YuvImage;->compressToJpeg(Landroid/graphics/Rect;ILjava/io/OutputStream;)Z

    .line 118
    invoke-virtual {v7}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    .line 119
    new-instance v7, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ImageInfo;

    const/4 v8, 0x0

    invoke-direct {v7, v3, v5, v8}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ImageInfo;-><init>([B[FLjava/lang/String;)V

    iput-object v7, v4, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ReflectLiveReqData;->openMouthImage:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ImageInfo;

    const-string v3, "closeeye_image"

    .line 120
    invoke-virtual {v2, v3}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->getStateDataBy(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/graphics/YuvImage;

    const-string v5, "closeeye_shape"

    .line 121
    invoke-virtual {v2, v5}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->getStateDataBy(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [F

    .line 122
    new-instance v5, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v5}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 123
    new-instance v7, Landroid/graphics/Rect;

    invoke-virtual {v3}, Landroid/graphics/YuvImage;->getWidth()I

    move-result v8

    invoke-virtual {v3}, Landroid/graphics/YuvImage;->getHeight()I

    move-result v10

    invoke-direct {v7, v11, v11, v8, v10}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {v3, v7, v9, v5}, Landroid/graphics/YuvImage;->compressToJpeg(Landroid/graphics/Rect;ILjava/io/OutputStream;)Z

    .line 124
    invoke-virtual {v5}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    .line 125
    new-instance v5, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ImageInfo;

    const/4 v8, 0x0

    invoke-direct {v5, v3, v2, v8}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ImageInfo;-><init>([B[FLjava/lang/String;)V

    iput-object v5, v4, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ReflectLiveReqData;->closeEyeImage:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ImageInfo;

    .line 126
    invoke-static {v4}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper;->makePersonLiveReq(Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ReflectLiveReqData;)Ljava/lang/String;

    move-result-object v2

    :goto_f
    move-object v10, v2

    goto :goto_10

    .line 127
    :cond_19
    invoke-static {v4}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper;->makeReflectLiveReq(Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ReflectLiveReqData;)Ljava/lang/String;

    move-result-object v2

    goto :goto_f

    .line 128
    :goto_10
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "begin request...uploadsize "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v6, v2}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 129
    invoke-static {v0}, Lcom/tencent/youtu/sdkkitframework/common/CommonUtils;->benchMarkEnd(Ljava/lang/String;)J

    const-string v0, "reflect_request_s2"

    .line 130
    invoke-static {v0}, Lcom/tencent/youtu/sdkkitframework/common/CommonUtils;->benchMarkBegin(Ljava/lang/String;)V

    .line 131
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;->getInstance()Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;

    move-result-object v0

    invoke-static/range {v17 .. v17}, Lcom/tencent/youtu/sdkkitframework/common/CommonUtils;->benchMarkEnd(Ljava/lang/String;)J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;->setPackUseTime(J)V

    .line 132
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    move-result-object v7

    iget-object v9, v1, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->c:Ljava/lang/String;

    new-instance v12, Lcom/tencent/youtu/sdkkitframework/liveness/j;

    invoke-direct {v12, v1}, Lcom/tencent/youtu/sdkkitframework/liveness/j;-><init>(Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;)V

    const-string v8, "net_reporting"

    const/4 v11, 0x0

    invoke-virtual/range {v7 .. v12}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->sendNetworkRequest(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$IYtSDKKitNetResponseParser;)V

    return-void

    :cond_1a
    move-object/from16 v17, v11

    .line 133
    invoke-static/range {v17 .. v17}, Lcom/tencent/youtu/sdkkitframework/common/CommonUtils;->benchMarkBegin(Ljava/lang/String;)V

    .line 134
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    move-result-object v0

    sget-object v2, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;->ACTION_STATE:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    invoke-static {v2}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper;->classNameOfState(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getStateByName(Ljava/lang/String;)Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;

    move-result-object v0

    if-nez v0, :cond_1b

    .line 135
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->getInstance()Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;

    move-result-object v0

    const-string v1, "action request action state is null"

    invoke-virtual {v0, v1}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->reportInfo(Ljava/lang/String;)V

    const/4 v8, 0x0

    .line 136
    invoke-static {v6, v1, v8}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void

    .line 137
    :cond_1b
    :try_start_5
    invoke-virtual {v0, v9}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->getStateDataBy(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;

    iput-object v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->e:Lcom/tencent/youtu/sdkkitframework/common/YTImageData;

    .line 138
    invoke-virtual {v0, v10}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->getStateDataBy(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    instance-of v2, v2, Ljava/lang/String;

    if-eqz v2, :cond_1c

    .line 139
    invoke-virtual {v0, v10}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->getStateDataBy(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    goto :goto_11

    :catch_3
    move-exception v0

    goto/16 :goto_12

    .line 140
    :cond_1c
    invoke-virtual {v0, v10}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->getStateDataBy(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/tencent/youtu/ytposedetect/data/ActionData;

    .line 141
    new-instance v3, Ljava/lang/String;

    iget-object v2, v2, Lcom/tencent/youtu/ytposedetect/data/ActionData;->video:[B

    const/4 v14, 0x2

    invoke-static {v2, v14}, Landroid/util/Base64;->encode([BI)[B

    move-result-object v2

    invoke-direct {v3, v2}, Ljava/lang/String;-><init>([B)V

    move-object v2, v3

    .line 142
    :goto_11
    invoke-virtual {v0, v7}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->getStateDataBy(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    .line 143
    invoke-virtual {v1, v0}, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->a([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 144
    invoke-virtual {v1}, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->a()V

    .line 145
    new-instance v3, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionLiveReqData;

    invoke-direct {v3}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionLiveReqData;-><init>()V

    .line 146
    new-instance v4, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;

    invoke-direct {v4}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;-><init>()V

    iput-object v4, v3, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionLiveReqData;->baseInfo:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;

    .line 147
    iget-object v5, v1, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->a:Ljava/lang/String;

    iput-object v5, v4, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;->appId:Ljava/lang/String;

    .line 148
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;->sessionId:Ljava/lang/String;

    .line 149
    iget-object v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->e:Lcom/tencent/youtu/sdkkitframework/common/YTImageData;

    iget-object v4, v4, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->imgData:[B

    const/4 v14, 0x2

    .line 150
    invoke-static {v4, v14}, Landroid/util/Base64;->encode([BI)[B

    move-result-object v4

    .line 151
    new-instance v5, Ljava/lang/String;

    invoke-direct {v5, v4}, Ljava/lang/String;-><init>([B)V

    iput-object v5, v3, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionLiveReqData;->bestImage:Ljava/lang/String;

    .line 152
    iput-object v0, v3, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionLiveReqData;->actionStr:Ljava/lang/String;

    .line 153
    iput-object v2, v3, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionLiveReqData;->actionVideo:Ljava/lang/String;

    const/4 v4, 0x1

    .line 154
    iput-boolean v4, v3, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionLiveReqData;->needEyeDetect:Z

    .line 155
    iput-boolean v4, v3, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionLiveReqData;->needMouthDetect:Z

    .line 156
    iget-object v0, v1, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->l:Ljava/lang/String;

    iput-object v0, v3, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionLiveReqData;->reflectConfig:Ljava/lang/String;

    .line 157
    iget-object v0, v1, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->m:Ljava/lang/String;

    iput-object v0, v3, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionLiveReqData;->controlConfig:Ljava/lang/String;

    .line 158
    iget v0, v1, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->n:I

    iput v0, v3, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionLiveReqData;->colorNum:I

    .line 159
    invoke-static {v3}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper;->makeActionLiveReq(Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionLiveReqData;)Ljava/lang/String;

    move-result-object v10

    .line 160
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;->getInstance()Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;

    move-result-object v0

    invoke-static/range {v17 .. v17}, Lcom/tencent/youtu/sdkkitframework/common/CommonUtils;->benchMarkEnd(Ljava/lang/String;)J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;->setPackUseTime(J)V

    .line 161
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    move-result-object v7
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    const-string v8, "net_reporting"

    :try_start_6
    iget-object v9, v1, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->c:Ljava/lang/String;

    new-instance v12, Lcom/tencent/youtu/sdkkitframework/liveness/h;

    invoke-direct {v12, v1}, Lcom/tencent/youtu/sdkkitframework/liveness/h;-><init>(Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;)V

    const/4 v11, 0x0

    invoke-virtual/range {v7 .. v12}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->sendNetworkRequest(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$IYtSDKKitNetResponseParser;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_3

    return-void

    :goto_12
    const-string v2, "action request failed"

    .line 162
    invoke-static {v6, v2, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 163
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->getInstance()Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "action request failed: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->reportInfo(Ljava/lang/String;)V

    .line 164
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    move-result-object v2

    new-instance v3, Lcom/tencent/youtu/sdkkitframework/liveness/i;

    invoke-direct {v3, v1, v0}, Lcom/tencent/youtu/sdkkitframework/liveness/i;-><init>(Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;Ljava/lang/Exception;)V

    invoke-virtual {v2, v3}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->sendFSMEvent(Ljava/util/HashMap;)V

    :goto_13
    return-void
.end method

.method public enterFirst()V
    .locals 0

    return-void
.end method

.method public loadStateWith(Ljava/lang/String;Lorg/json/JSONObject;Lcom/tencent/youtu/sdkkitframework/common/YtSdkConfig;)V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    const-string v2, "resource_online"

    .line 6
    .line 7
    const-string v3, "enhance_encrypt_method"

    .line 8
    .line 9
    const-string v4, "session_id"

    .line 10
    .line 11
    const-string v5, "need_encrypt"

    .line 12
    .line 13
    const-string v6, "backend_proto_type"

    .line 14
    .line 15
    const-string v7, "request_options"

    .line 16
    .line 17
    const-string v8, "manual_trigger"

    .line 18
    .line 19
    const-string v9, "change_point_num"

    .line 20
    .line 21
    const-string v10, "control_config"

    .line 22
    .line 23
    const-string v11, "extra_config"

    .line 24
    .line 25
    const-string v12, "final_liveness_confidence_threshold"

    .line 26
    .line 27
    const-string v13, "similarity_threshold"

    .line 28
    .line 29
    const-string v14, "user_id"

    .line 30
    .line 31
    const-string v15, "secret_id"

    .line 32
    .line 33
    move-object/from16 v16, v2

    .line 34
    .line 35
    const-string v2, "secret_key"

    .line 36
    .line 37
    move-object/from16 v17, v3

    .line 38
    .line 39
    const-string v3, "NetLivenessReqResultState"

    .line 40
    .line 41
    invoke-super/range {p0 .. p3}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->loadStateWith(Ljava/lang/String;Lorg/json/JSONObject;Lcom/tencent/youtu/sdkkitframework/common/YtSdkConfig;)V

    .line 42
    .line 43
    .line 44
    move-object/from16 v18, v4

    .line 45
    .line 46
    :try_start_0
    const-string v4, "app_id"

    .line 47
    .line 48
    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v4

    .line 52
    iput-object v4, v0, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->a:Ljava/lang/String;

    .line 53
    .line 54
    const-string v4, "result_api_url"

    .line 55
    .line 56
    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v4

    .line 60
    iput-object v4, v0, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->c:Ljava/lang/String;

    .line 61
    .line 62
    if-nez v4, :cond_0

    .line 63
    .line 64
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->getInstance()Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    const-string v1, "yt_param_error"

    .line 69
    .line 70
    const/high16 v2, 0x300000

    .line 71
    .line 72
    invoke-virtual {v0, v2, v1}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->reportError(ILjava/lang/String;)V

    .line 73
    .line 74
    .line 75
    const-string v0, "parse url failed"

    .line 76
    .line 77
    const/4 v1, 0x0

    .line 78
    invoke-static {v3, v0, v1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :catch_0
    move-exception v0

    .line 83
    goto/16 :goto_3

    .line 84
    .line 85
    :cond_0
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 86
    .line 87
    .line 88
    move-result v4

    .line 89
    if-eqz v4, :cond_1

    .line 90
    .line 91
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    :cond_1
    invoke-virtual {v1, v15}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 95
    .line 96
    .line 97
    move-result v2

    .line 98
    if-eqz v2, :cond_2

    .line 99
    .line 100
    invoke-virtual {v1, v15}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    :cond_2
    invoke-virtual {v1, v14}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 104
    .line 105
    .line 106
    move-result v2

    .line 107
    if-eqz v2, :cond_3

    .line 108
    .line 109
    invoke-virtual {v1, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    :cond_3
    invoke-virtual {v1, v13}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 113
    .line 114
    .line 115
    move-result v2

    .line 116
    if-eqz v2, :cond_4

    .line 117
    .line 118
    invoke-virtual {v1, v13}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 119
    .line 120
    .line 121
    move-result v2

    .line 122
    iput v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->g:I

    .line 123
    .line 124
    :cond_4
    invoke-virtual {v1, v12}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 125
    .line 126
    .line 127
    move-result v2

    .line 128
    if-eqz v2, :cond_5

    .line 129
    .line 130
    invoke-virtual {v1, v12}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 131
    .line 132
    .line 133
    move-result v2

    .line 134
    iput v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->d:I

    .line 135
    .line 136
    goto :goto_0

    .line 137
    :cond_5
    const/16 v2, 0x55

    .line 138
    .line 139
    iput v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->d:I

    .line 140
    .line 141
    :goto_0
    invoke-virtual {v1, v11}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 142
    .line 143
    .line 144
    move-result v2

    .line 145
    if-eqz v2, :cond_6

    .line 146
    .line 147
    invoke-virtual {v1, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v2

    .line 151
    iput-object v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->l:Ljava/lang/String;

    .line 152
    .line 153
    goto :goto_1

    .line 154
    :cond_6
    const-string v2, " version 2"

    .line 155
    .line 156
    iput-object v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->l:Ljava/lang/String;

    .line 157
    .line 158
    :goto_1
    invoke-virtual {v1, v10}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 159
    .line 160
    .line 161
    move-result v2

    .line 162
    if-eqz v2, :cond_7

    .line 163
    .line 164
    invoke-virtual {v1, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object v2

    .line 168
    iput-object v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->m:Ljava/lang/String;

    .line 169
    .line 170
    :cond_7
    invoke-virtual {v1, v9}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 171
    .line 172
    .line 173
    move-result v2

    .line 174
    if-eqz v2, :cond_8

    .line 175
    .line 176
    invoke-virtual {v1, v9}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 177
    .line 178
    .line 179
    move-result v2

    .line 180
    iput v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->n:I

    .line 181
    .line 182
    :cond_8
    invoke-virtual {v1, v8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 183
    .line 184
    .line 185
    move-result v2

    .line 186
    if-eqz v2, :cond_9

    .line 187
    .line 188
    invoke-virtual {v1, v8}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    .line 189
    .line 190
    .line 191
    move-result v2

    .line 192
    iput-boolean v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->f:Z

    .line 193
    .line 194
    :cond_9
    invoke-virtual {v1, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 195
    .line 196
    .line 197
    move-result v2

    .line 198
    if-eqz v2, :cond_a

    .line 199
    .line 200
    invoke-virtual {v1, v7}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 201
    .line 202
    .line 203
    move-result-object v2

    .line 204
    iput-object v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->i:Lorg/json/JSONObject;

    .line 205
    .line 206
    invoke-virtual {v2}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    .line 207
    .line 208
    .line 209
    move-result-object v2

    .line 210
    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 211
    .line 212
    .line 213
    move-result v4

    .line 214
    if-eqz v4, :cond_a

    .line 215
    .line 216
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 217
    .line 218
    .line 219
    move-result-object v4

    .line 220
    check-cast v4, Ljava/lang/String;

    .line 221
    .line 222
    iget-object v7, v0, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->i:Lorg/json/JSONObject;

    .line 223
    .line 224
    invoke-virtual {v7, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object v7

    .line 228
    iget-object v8, v0, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->h:Ljava/util/HashMap;

    .line 229
    .line 230
    invoke-virtual {v8, v4, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 231
    .line 232
    .line 233
    goto :goto_2

    .line 234
    :cond_a
    invoke-virtual {v1, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 235
    .line 236
    .line 237
    move-result v2

    .line 238
    if-eqz v2, :cond_b

    .line 239
    .line 240
    invoke-virtual {v1, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 241
    .line 242
    .line 243
    move-result v2

    .line 244
    iput v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->j:I

    .line 245
    .line 246
    :cond_b
    invoke-virtual {v1, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 247
    .line 248
    .line 249
    move-result v2

    .line 250
    if-eqz v2, :cond_c

    .line 251
    .line 252
    invoke-virtual {v1, v5}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    .line 253
    .line 254
    .line 255
    move-result v2

    .line 256
    iput-boolean v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->o:Z

    .line 257
    .line 258
    :cond_c
    move-object/from16 v2, v18

    .line 259
    .line 260
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 261
    .line 262
    .line 263
    move-result v4

    .line 264
    if-eqz v4, :cond_d

    .line 265
    .line 266
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 267
    .line 268
    .line 269
    move-result-object v2

    .line 270
    iput-object v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->b:Ljava/lang/String;

    .line 271
    .line 272
    :cond_d
    move-object/from16 v2, v17

    .line 273
    .line 274
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 275
    .line 276
    .line 277
    move-result v4

    .line 278
    if-eqz v4, :cond_e

    .line 279
    .line 280
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 281
    .line 282
    .line 283
    move-result v2

    .line 284
    iput v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->p:I

    .line 285
    .line 286
    :cond_e
    move-object/from16 v2, v16

    .line 287
    .line 288
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 289
    .line 290
    .line 291
    move-result v4

    .line 292
    if-eqz v4, :cond_f

    .line 293
    .line 294
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    .line 295
    .line 296
    .line 297
    move-result v1

    .line 298
    iput-boolean v1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->k:Z

    .line 299
    .line 300
    :cond_f
    iget-boolean v1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->k:Z

    .line 301
    .line 302
    if-nez v1, :cond_10

    .line 303
    .line 304
    iget-boolean v1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->o:Z

    .line 305
    .line 306
    if-eqz v1, :cond_10

    .line 307
    .line 308
    iget v0, v0, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->p:I

    .line 309
    .line 310
    const/4 v1, 0x1

    .line 311
    if-ne v0, v1, :cond_10

    .line 312
    .line 313
    const-string v0, "TencentSM"

    .line 314
    .line 315
    invoke-static {v0}, Lcom/tencent/youtu/sdkkitframework/common/FileUtils;->loadLibrary(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 316
    .line 317
    .line 318
    :cond_10
    return-void

    .line 319
    :goto_3
    const-string v1, "Failed to parse json:"

    .line 320
    .line 321
    invoke-static {v3, v1, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 322
    .line 323
    .line 324
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
