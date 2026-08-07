.class Lcom/tencent/open/b/h$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/open/b/h;->d()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/open/b/h;


# direct methods
.method public constructor <init>(Lcom/tencent/open/b/h;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/open/b/h$3;->a:Lcom/tencent/open/b/h;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 30

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    const-string v2, "openSDK_LOG.ReportManager"

    .line 4
    .line 5
    const-string v0, "-->doReportVia, params: "

    .line 6
    .line 7
    :try_start_0
    iget-object v3, v1, Lcom/tencent/open/b/h$3;->a:Lcom/tencent/open/b/h;

    .line 8
    .line 9
    invoke-virtual {v3}, Lcom/tencent/open/b/h;->c()Ljava/util/Map;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    if-nez v3, :cond_0

    .line 14
    .line 15
    goto/16 :goto_10

    .line 16
    .line 17
    :cond_0
    new-instance v4, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {v2, v0}, Lcom/tencent/open/log/SLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-static {}, Lcom/tencent/open/b/f;->a()I

    .line 37
    .line 38
    .line 39
    move-result v4

    .line 40
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 41
    .line 42
    .line 43
    move-result-wide v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 44
    const/4 v0, 0x0

    .line 45
    const/4 v8, 0x0

    .line 46
    :cond_1
    const/4 v9, 0x1

    .line 47
    add-int/lit8 v10, v0, 0x1

    .line 48
    .line 49
    :try_start_1
    invoke-static {}, Lcom/tencent/open/a/f;->a()Lcom/tencent/open/a/f;

    .line 50
    .line 51
    .line 52
    move-result-object v13

    .line 53
    const-string v14, "https://appsupport.qq.com/cgi-bin/appstage/mstats_batch_report"

    .line 54
    .line 55
    invoke-virtual {v13, v14, v3}, Lcom/tencent/open/a/f;->b(Ljava/lang/String;Ljava/util/Map;)Lcom/tencent/open/a/g;

    .line 56
    .line 57
    .line 58
    move-result-object v13

    .line 59
    invoke-interface {v13}, Lcom/tencent/open/a/g;->d()I

    .line 60
    .line 61
    .line 62
    move-result v14

    .line 63
    new-instance v15, Ljava/lang/StringBuilder;

    .line 64
    .line 65
    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    .line 66
    .line 67
    .line 68
    const-string v0, "-->reportVia: statusCode "

    .line 69
    .line 70
    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v15, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-static {v2, v0}, Lcom/tencent/open/log/SLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    invoke-interface {v13}, Lcom/tencent/open/a/g;->a()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-static {v0}, Lcom/tencent/open/utils/n;->d(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-interface {v13}, Lcom/tencent/open/a/g;->c()I

    .line 92
    .line 93
    .line 94
    move-result v14

    .line 95
    int-to-long v14, v14

    .line 96
    invoke-interface {v13}, Lcom/tencent/open/a/g;->b()I

    .line 97
    .line 98
    .line 99
    move-result v7
    :try_end_1
    .catch Ljava/net/SocketTimeoutException; {:try_start_1 .. :try_end_1} :catch_8
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_7
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_6
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 100
    move/from16 v16, v10

    .line 101
    .line 102
    int-to-long v9, v7

    .line 103
    :try_start_2
    invoke-interface {v13}, Lcom/tencent/open/a/g;->d()I

    .line 104
    .line 105
    .line 106
    move-result v7
    :try_end_2
    .catch Ljava/net/SocketTimeoutException; {:try_start_2 .. :try_end_2} :catch_5
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_4
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 107
    const-wide/16 v17, 0x0

    .line 108
    .line 109
    const/16 v11, 0xc8

    .line 110
    .line 111
    if-eq v7, v11, :cond_2

    .line 112
    .line 113
    :try_start_3
    invoke-interface {v13}, Lcom/tencent/open/a/g;->d()I

    .line 114
    .line 115
    .line 116
    move-result v8
    :try_end_3
    .catch Ljava/net/SocketTimeoutException; {:try_start_3 .. :try_end_3} :catch_b
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_a
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_9
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 117
    move-wide/from16 v21, v5

    .line 118
    .line 119
    move/from16 v27, v8

    .line 120
    .line 121
    move-wide/from16 v25, v9

    .line 122
    .line 123
    move-wide/from16 v23, v14

    .line 124
    .line 125
    :goto_0
    const/4 v7, 0x0

    .line 126
    goto/16 :goto_d

    .line 127
    .line 128
    :catchall_0
    move-exception v0

    .line 129
    goto/16 :goto_f

    .line 130
    .line 131
    :catch_0
    move-exception v0

    .line 132
    goto :goto_8

    .line 133
    :cond_2
    :try_start_4
    const-string v7, "ret"

    .line 134
    .line 135
    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 136
    .line 137
    .line 138
    move-result v0
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/net/SocketTimeoutException; {:try_start_4 .. :try_end_4} :catch_b
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_9
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 139
    goto :goto_1

    .line 140
    :catch_1
    const/4 v0, -0x4

    .line 141
    :goto_1
    if-eqz v0, :cond_4

    .line 142
    .line 143
    cmp-long v0, v9, v17

    .line 144
    .line 145
    if-eqz v0, :cond_3

    .line 146
    .line 147
    goto :goto_2

    .line 148
    :cond_3
    move-wide/from16 v17, v9

    .line 149
    .line 150
    move-wide v11, v14

    .line 151
    move/from16 v0, v16

    .line 152
    .line 153
    goto :goto_c

    .line 154
    :cond_4
    :goto_2
    move-wide/from16 v21, v5

    .line 155
    .line 156
    move/from16 v27, v8

    .line 157
    .line 158
    move-wide/from16 v25, v9

    .line 159
    .line 160
    move-wide/from16 v23, v14

    .line 161
    .line 162
    const/4 v7, 0x1

    .line 163
    goto :goto_d

    .line 164
    :catch_2
    const-wide/16 v17, 0x0

    .line 165
    .line 166
    goto :goto_6

    .line 167
    :catch_3
    move-exception v0

    .line 168
    :goto_3
    const-wide/16 v17, 0x0

    .line 169
    .line 170
    goto :goto_8

    .line 171
    :catch_4
    :goto_4
    const-wide/16 v17, 0x0

    .line 172
    .line 173
    goto :goto_a

    .line 174
    :catch_5
    :goto_5
    const-wide/16 v17, 0x0

    .line 175
    .line 176
    goto :goto_b

    .line 177
    :catch_6
    move-exception v0

    .line 178
    move/from16 v16, v10

    .line 179
    .line 180
    goto :goto_3

    .line 181
    :catch_7
    move/from16 v16, v10

    .line 182
    .line 183
    goto :goto_4

    .line 184
    :catch_8
    move/from16 v16, v10

    .line 185
    .line 186
    goto :goto_5

    .line 187
    :catch_9
    :goto_6
    const/4 v8, -0x6

    .line 188
    move v0, v4

    .line 189
    :goto_7
    move-wide/from16 v11, v17

    .line 190
    .line 191
    goto :goto_c

    .line 192
    :goto_8
    :try_start_5
    invoke-static {v0}, Lcom/tencent/open/utils/HttpUtils;->getErrorCodeFromException(Ljava/io/IOException;)I

    .line 193
    .line 194
    .line 195
    move-result v8

    .line 196
    :goto_9
    move/from16 v0, v16

    .line 197
    .line 198
    goto :goto_7

    .line 199
    :catch_a
    :goto_a
    move/from16 v0, v16

    .line 200
    .line 201
    move-wide/from16 v11, v17

    .line 202
    .line 203
    const/4 v8, -0x4

    .line 204
    goto :goto_c

    .line 205
    :catch_b
    :goto_b
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 206
    .line 207
    .line 208
    move-result-wide v5

    .line 209
    const/4 v8, -0x8

    .line 210
    goto :goto_9

    .line 211
    :goto_c
    if-lt v0, v4, :cond_1

    .line 212
    .line 213
    move-wide/from16 v21, v5

    .line 214
    .line 215
    move/from16 v27, v8

    .line 216
    .line 217
    move-wide/from16 v23, v11

    .line 218
    .line 219
    move-wide/from16 v25, v17

    .line 220
    .line 221
    goto :goto_0

    .line 222
    :goto_d
    iget-object v0, v1, Lcom/tencent/open/b/h$3;->a:Lcom/tencent/open/b/h;

    .line 223
    .line 224
    const-string v20, "mapp_apptrace_sdk"

    .line 225
    .line 226
    const/16 v28, 0x0

    .line 227
    .line 228
    const/16 v29, 0x0

    .line 229
    .line 230
    move-object/from16 v19, v0

    .line 231
    .line 232
    invoke-virtual/range {v19 .. v29}, Lcom/tencent/open/b/h;->a(Ljava/lang/String;JJJILjava/lang/String;Z)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 233
    .line 234
    .line 235
    move/from16 v8, v27

    .line 236
    .line 237
    const-string v0, "report_via"

    .line 238
    .line 239
    if-eqz v7, :cond_5

    .line 240
    .line 241
    :try_start_6
    invoke-static {v0}, Lcom/tencent/open/b/g;->a(Ljava/lang/String;)V

    .line 242
    .line 243
    .line 244
    goto :goto_e

    .line 245
    :cond_5
    iget-object v3, v1, Lcom/tencent/open/b/h$3;->a:Lcom/tencent/open/b/h;

    .line 246
    .line 247
    iget-object v3, v3, Lcom/tencent/open/b/h;->d:Ljava/util/List;

    .line 248
    .line 249
    invoke-static {v0, v3}, Lcom/tencent/open/b/g;->a(Ljava/lang/String;Ljava/util/List;)V

    .line 250
    .line 251
    .line 252
    :goto_e
    iget-object v0, v1, Lcom/tencent/open/b/h$3;->a:Lcom/tencent/open/b/h;

    .line 253
    .line 254
    iget-object v0, v0, Lcom/tencent/open/b/h;->d:Ljava/util/List;

    .line 255
    .line 256
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 257
    .line 258
    .line 259
    new-instance v0, Ljava/lang/StringBuilder;

    .line 260
    .line 261
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 262
    .line 263
    .line 264
    const-string v1, "-->doReportVia, uploadSuccess: "

    .line 265
    .line 266
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 267
    .line 268
    .line 269
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 270
    .line 271
    .line 272
    const-string v1, " resultCode: "

    .line 273
    .line 274
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 275
    .line 276
    .line 277
    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 278
    .line 279
    .line 280
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 281
    .line 282
    .line 283
    move-result-object v0

    .line 284
    invoke-static {v2, v0}, Lcom/tencent/open/log/SLog;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 285
    .line 286
    .line 287
    goto :goto_10

    .line 288
    :goto_f
    const-string v1, "-->doReportVia, exception in serial executor."

    .line 289
    .line 290
    invoke-static {v2, v1, v0}, Lcom/tencent/open/log/SLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 291
    .line 292
    .line 293
    :goto_10
    return-void
.end method
