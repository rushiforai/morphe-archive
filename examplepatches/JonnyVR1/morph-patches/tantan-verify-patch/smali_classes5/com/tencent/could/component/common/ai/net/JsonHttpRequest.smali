.class public Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/could/component/common/ai/net/IHttpRequest;


# instance fields
.field public volatile a:Lcom/tencent/could/component/common/ai/net/CallBackListener;

.field public b:Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;

.field public c:Z

.field public d:Z

.field public e:Z

.field public f:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->c:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->d:Z

    .line 8
    .line 9
    iput-boolean v0, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->e:Z

    .line 10
    .line 11
    iput v0, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->f:I

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final a(Ljava/net/HttpURLConnection;Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Ljava/net/URLConnection;->getOutputStream()Ljava/io/OutputStream;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance p1, Ljava/io/BufferedOutputStream;

    .line 6
    .line 7
    invoke-direct {p1, p0}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p2}, Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;->getRequestData()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {p2}, Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;->getRequestData()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    :goto_0
    invoke-virtual {p2}, Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;->isGzip()Z

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    if-eqz p2, :cond_1

    .line 27
    .line 28
    invoke-static {v0}, Lcom/tencent/could/component/common/ai/utils/GZipUtils;->compress(Ljava/lang/String;)[B

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    goto :goto_1

    .line 33
    :cond_1
    const-string p2, "UTF-8"

    .line 34
    .line 35
    invoke-virtual {v0, p2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    :goto_1
    const-string v0, "JsonHttpRequest"

    .line 40
    .line 41
    if-eqz p2, :cond_2

    .line 42
    .line 43
    invoke-static {}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->getInstance()Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    new-instance v2, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    const-string v3, "start write bytes size: "

    .line 50
    .line 51
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    array-length v3, p2

    .line 55
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-virtual {v1, v0, v2}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->logDebug(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    :cond_2
    invoke-virtual {p1, p2}, Ljava/io/OutputStream;->write([B)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1}, Ljava/io/BufferedOutputStream;->flush()V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1}, Ljava/io/OutputStream;->close()V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0}, Ljava/io/OutputStream;->close()V

    .line 75
    .line 76
    .line 77
    invoke-static {}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->getInstance()Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    const-string p1, "end write bytes!"

    .line 82
    .line 83
    invoke-virtual {p0, v0, p1}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->logDebug(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public cleanExecute()V
    .locals 2

    .line 1
    const-class v0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->a:Lcom/tencent/could/component/common/ai/net/CallBackListener;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    iget-object v1, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->a:Lcom/tencent/could/component/common/ai/net/CallBackListener;

    .line 9
    .line 10
    invoke-interface {v1}, Lcom/tencent/could/component/common/ai/net/CallBackListener;->cleanListener()V

    .line 11
    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    iput-object v1, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->a:Lcom/tencent/could/component/common/ai/net/CallBackListener;

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :catchall_0
    move-exception p0

    .line 18
    goto :goto_1

    .line 19
    :cond_0
    :goto_0
    monitor-exit v0

    .line 20
    return-void

    .line 21
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    throw p0
.end method

.method public execute()V
    .locals 13

    .line 1
    const-string v0, "verify host url is: "

    .line 2
    .line 3
    const-string v1, "connect url: "

    .line 4
    .line 5
    const-string v2, "use backup ip urls, index: "

    .line 6
    .line 7
    invoke-static {}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->getInstance()Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    const-string v4, "start newExecuteHttpConnect!"

    .line 12
    .line 13
    const-string v5, "JsonHttpRequest"

    .line 14
    .line 15
    invoke-virtual {v3, v5, v4}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->logDebug(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object v3, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->a:Lcom/tencent/could/component/common/ai/net/CallBackListener;

    .line 19
    .line 20
    if-nez v3, :cond_0

    .line 21
    .line 22
    invoke-static {}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->getInstance()Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const-string v0, "callBackListener is null!"

    .line 27
    .line 28
    invoke-virtual {p0, v5, v0}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->logError(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    const/4 v3, 0x0

    .line 33
    :try_start_0
    iget-object v4, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->b:Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;

    .line 34
    .line 35
    invoke-virtual {v4}, Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;->getUrl()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    iget-boolean v6, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->c:Z

    .line 40
    .line 41
    const/4 v7, 0x1

    .line 42
    const/4 v8, 0x0

    .line 43
    if-eqz v6, :cond_1

    .line 44
    .line 45
    iget-object v6, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->b:Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;

    .line 46
    .line 47
    invoke-virtual {v6}, Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;->getDeputyUrl()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v6

    .line 51
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result v6

    .line 55
    if-nez v6, :cond_1

    .line 56
    .line 57
    invoke-static {}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->getInstance()Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;

    .line 58
    .line 59
    .line 60
    move-result-object v4

    .line 61
    const-string v6, "use DeputyUrl"

    .line 62
    .line 63
    invoke-virtual {v4, v5, v6}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->logError(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    iget-object v4, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->b:Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;

    .line 67
    .line 68
    invoke-virtual {v4}, Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;->getDeputyUrl()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v4

    .line 72
    move v6, v7

    .line 73
    goto :goto_0

    .line 74
    :catchall_0
    move-exception p0

    .line 75
    goto/16 :goto_7

    .line 76
    .line 77
    :catch_0
    move-exception p0

    .line 78
    goto/16 :goto_6

    .line 79
    .line 80
    :cond_1
    move v6, v8

    .line 81
    :goto_0
    iget-boolean v9, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->d:Z

    .line 82
    .line 83
    if-eqz v9, :cond_2

    .line 84
    .line 85
    iget-object v9, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->b:Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;

    .line 86
    .line 87
    invoke-virtual {v9}, Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;->getBackUpIpStringUrl()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v9

    .line 91
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 92
    .line 93
    .line 94
    move-result v9

    .line 95
    if-nez v9, :cond_2

    .line 96
    .line 97
    invoke-static {}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->getInstance()Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;

    .line 98
    .line 99
    .line 100
    move-result-object v4

    .line 101
    const-string v9, "use backUpIpStringUrl"

    .line 102
    .line 103
    invoke-virtual {v4, v5, v9}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->logError(Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    iget-object v4, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->b:Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;

    .line 107
    .line 108
    invoke-virtual {v4}, Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;->getBackUpIpStringUrl()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v4

    .line 112
    move v9, v7

    .line 113
    goto :goto_1

    .line 114
    :cond_2
    move v9, v8

    .line 115
    :goto_1
    iget-boolean v10, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->e:Z

    .line 116
    .line 117
    if-eqz v10, :cond_3

    .line 118
    .line 119
    iget-object v10, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->b:Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;

    .line 120
    .line 121
    invoke-virtual {v10}, Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;->getBackUpIpStringUrls()[Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v10

    .line 125
    if-eqz v10, :cond_3

    .line 126
    .line 127
    iget-object v10, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->b:Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;

    .line 128
    .line 129
    invoke-virtual {v10}, Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;->getBackUpIpStringUrls()[Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v10

    .line 133
    iget v11, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->f:I

    .line 134
    .line 135
    array-length v12, v10

    .line 136
    if-ge v11, v12, :cond_3

    .line 137
    .line 138
    aget-object v11, v10, v11

    .line 139
    .line 140
    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 141
    .line 142
    .line 143
    move-result v11

    .line 144
    if-nez v11, :cond_3

    .line 145
    .line 146
    invoke-static {}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->getInstance()Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;

    .line 147
    .line 148
    .line 149
    move-result-object v4

    .line 150
    new-instance v11, Ljava/lang/StringBuilder;

    .line 151
    .line 152
    invoke-direct {v11, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    iget v2, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->f:I

    .line 156
    .line 157
    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v2

    .line 164
    invoke-virtual {v4, v5, v2}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->logError(Ljava/lang/String;Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    iget v2, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->f:I

    .line 168
    .line 169
    aget-object v4, v10, v2

    .line 170
    .line 171
    move v2, v7

    .line 172
    goto :goto_2

    .line 173
    :cond_3
    move v2, v8

    .line 174
    :goto_2
    invoke-static {}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->getInstance()Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;

    .line 175
    .line 176
    .line 177
    move-result-object v10

    .line 178
    new-instance v11, Ljava/lang/StringBuilder;

    .line 179
    .line 180
    invoke-direct {v11, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 181
    .line 182
    .line 183
    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 184
    .line 185
    .line 186
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object v1

    .line 190
    invoke-virtual {v10, v5, v1}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->logDebug(Ljava/lang/String;Ljava/lang/String;)V

    .line 191
    .line 192
    .line 193
    new-instance v1, Ljava/net/URL;

    .line 194
    .line 195
    invoke-direct {v1, v4}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 196
    .line 197
    .line 198
    const-string v10, "https"

    .line 199
    .line 200
    invoke-virtual {v4, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 201
    .line 202
    .line 203
    move-result v10

    .line 204
    if-eqz v10, :cond_7

    .line 205
    .line 206
    invoke-virtual {v1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    .line 207
    .line 208
    .line 209
    move-result-object v1

    .line 210
    check-cast v1, Ljavax/net/ssl/HttpsURLConnection;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 211
    .line 212
    :try_start_1
    iget-object v3, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->b:Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;

    .line 213
    .line 214
    invoke-virtual {v3}, Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;->getHttpsVerifyHost()Ljava/lang/String;

    .line 215
    .line 216
    .line 217
    move-result-object v3

    .line 218
    if-nez v9, :cond_5

    .line 219
    .line 220
    if-nez v2, :cond_5

    .line 221
    .line 222
    if-nez v6, :cond_5

    .line 223
    .line 224
    iget-object v2, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->b:Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;

    .line 225
    .line 226
    invoke-virtual {v2}, Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;->getDeputyUrl()Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    move-result-object v2

    .line 230
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 231
    .line 232
    .line 233
    move-result v2

    .line 234
    if-nez v2, :cond_4

    .line 235
    .line 236
    new-instance v2, Ljava/net/URL;

    .line 237
    .line 238
    iget-object v3, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->b:Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;

    .line 239
    .line 240
    invoke-virtual {v3}, Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;->getDeputyUrl()Ljava/lang/String;

    .line 241
    .line 242
    .line 243
    move-result-object v3

    .line 244
    invoke-direct {v2, v3}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 245
    .line 246
    .line 247
    invoke-virtual {v2}, Ljava/net/URL;->getHost()Ljava/lang/String;

    .line 248
    .line 249
    .line 250
    move-result-object v3

    .line 251
    invoke-static {}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->getInstance()Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;

    .line 252
    .line 253
    .line 254
    move-result-object v2

    .line 255
    new-instance v6, Ljava/lang/StringBuilder;

    .line 256
    .line 257
    invoke-direct {v6, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 258
    .line 259
    .line 260
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 261
    .line 262
    .line 263
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 264
    .line 265
    .line 266
    move-result-object v0

    .line 267
    invoke-virtual {v2, v5, v0}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->logDebug(Ljava/lang/String;Ljava/lang/String;)V

    .line 268
    .line 269
    .line 270
    goto :goto_3

    .line 271
    :catchall_1
    move-exception p0

    .line 272
    move-object v3, v1

    .line 273
    goto/16 :goto_7

    .line 274
    .line 275
    :catch_1
    move-exception p0

    .line 276
    move-object v3, v1

    .line 277
    goto/16 :goto_6

    .line 278
    .line 279
    :cond_4
    invoke-static {}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->getInstance()Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;

    .line 280
    .line 281
    .line 282
    move-result-object v0

    .line 283
    const-string v2, "deputy url is empty."

    .line 284
    .line 285
    invoke-virtual {v0, v5, v2}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->logDebug(Ljava/lang/String;Ljava/lang/String;)V

    .line 286
    .line 287
    .line 288
    :cond_5
    :goto_3
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 289
    .line 290
    .line 291
    move-result v0

    .line 292
    if-nez v0, :cond_6

    .line 293
    .line 294
    const-string v0, "Host"

    .line 295
    .line 296
    invoke-virtual {v1, v0, v3}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 297
    .line 298
    .line 299
    new-instance v0, Lcom/tencent/could/component/common/ai/net/TxcSniSocketFactory;

    .line 300
    .line 301
    invoke-direct {v0, v1}, Lcom/tencent/could/component/common/ai/net/TxcSniSocketFactory;-><init>(Ljavax/net/ssl/HttpsURLConnection;)V

    .line 302
    .line 303
    .line 304
    invoke-virtual {v1, v0}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    .line 305
    .line 306
    .line 307
    new-instance v0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest$1;

    .line 308
    .line 309
    invoke-direct {v0, p0, v3, v4}, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest$1;-><init>(Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;Ljava/lang/String;Ljava/lang/String;)V

    .line 310
    .line 311
    .line 312
    invoke-virtual {v1, v0}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 313
    .line 314
    .line 315
    :cond_6
    move-object v3, v1

    .line 316
    goto :goto_4

    .line 317
    :cond_7
    :try_start_2
    invoke-virtual {v1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    .line 318
    .line 319
    .line 320
    move-result-object v0

    .line 321
    check-cast v0, Ljava/net/HttpURLConnection;

    .line 322
    .line 323
    move-object v3, v0

    .line 324
    :goto_4
    iget-object v0, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->b:Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;

    .line 325
    .line 326
    invoke-virtual {v0}, Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;->getTimeOutTimes()I

    .line 327
    .line 328
    .line 329
    move-result v0

    .line 330
    invoke-virtual {v3, v0}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    .line 331
    .line 332
    .line 333
    iget-object v0, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->b:Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;

    .line 334
    .line 335
    invoke-virtual {v0}, Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;->getTimeOutTimes()I

    .line 336
    .line 337
    .line 338
    move-result v0

    .line 339
    invoke-virtual {v3, v0}, Ljava/net/URLConnection;->setReadTimeout(I)V

    .line 340
    .line 341
    .line 342
    invoke-virtual {v3, v8}, Ljava/net/URLConnection;->setUseCaches(Z)V

    .line 343
    .line 344
    .line 345
    invoke-virtual {v3, v8}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    .line 346
    .line 347
    .line 348
    invoke-virtual {v3, v7}, Ljava/net/URLConnection;->setDoInput(Z)V

    .line 349
    .line 350
    .line 351
    invoke-virtual {v3, v7}, Ljava/net/URLConnection;->setDoOutput(Z)V

    .line 352
    .line 353
    .line 354
    const-string v0, "Content-Type"

    .line 355
    .line 356
    const-string v1, "application/json;charset=UTF-8"

    .line 357
    .line 358
    invoke-virtual {v3, v0, v1}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 359
    .line 360
    .line 361
    iget-object v0, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->b:Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;

    .line 362
    .line 363
    invoke-virtual {v0}, Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;->getRequestHeaders()Ljava/util/HashMap;

    .line 364
    .line 365
    .line 366
    move-result-object v0

    .line 367
    if-eqz v0, :cond_8

    .line 368
    .line 369
    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 370
    .line 371
    .line 372
    move-result-object v0

    .line 373
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 374
    .line 375
    .line 376
    move-result-object v0

    .line 377
    :goto_5
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 378
    .line 379
    .line 380
    move-result v1

    .line 381
    if-eqz v1, :cond_8

    .line 382
    .line 383
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 384
    .line 385
    .line 386
    move-result-object v1

    .line 387
    check-cast v1, Ljava/util/Map$Entry;

    .line 388
    .line 389
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 390
    .line 391
    .line 392
    move-result-object v2

    .line 393
    check-cast v2, Ljava/lang/String;

    .line 394
    .line 395
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 396
    .line 397
    .line 398
    move-result-object v1

    .line 399
    check-cast v1, Ljava/lang/String;

    .line 400
    .line 401
    invoke-virtual {v3, v2, v1}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 402
    .line 403
    .line 404
    goto :goto_5

    .line 405
    :cond_8
    iget-object v0, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->b:Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;

    .line 406
    .line 407
    invoke-virtual {v0}, Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;->isGzip()Z

    .line 408
    .line 409
    .line 410
    move-result v0
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 411
    const-string v1, "gzip"

    .line 412
    .line 413
    if-eqz v0, :cond_9

    .line 414
    .line 415
    :try_start_3
    const-string v0, "Accept-Encoding"

    .line 416
    .line 417
    invoke-virtual {v3, v0, v1}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 418
    .line 419
    .line 420
    const-string v0, "Content-Encoding"

    .line 421
    .line 422
    invoke-virtual {v3, v0, v1}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 423
    .line 424
    .line 425
    :cond_9
    iget-object v0, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->b:Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;

    .line 426
    .line 427
    invoke-virtual {v0}, Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;->getHttpMethod()Lcom/tencent/could/component/common/ai/net/HttpMethod;

    .line 428
    .line 429
    .line 430
    move-result-object v0

    .line 431
    sget-object v2, Lcom/tencent/could/component/common/ai/net/HttpMethod;->POST:Lcom/tencent/could/component/common/ai/net/HttpMethod;

    .line 432
    .line 433
    if-ne v0, v2, :cond_a

    .line 434
    .line 435
    const-string v0, "POST"

    .line 436
    .line 437
    invoke-virtual {v3, v0}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 438
    .line 439
    .line 440
    :cond_a
    iget-object v0, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->b:Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;

    .line 441
    .line 442
    invoke-virtual {v0}, Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;->getHttpMethod()Lcom/tencent/could/component/common/ai/net/HttpMethod;

    .line 443
    .line 444
    .line 445
    move-result-object v0

    .line 446
    sget-object v4, Lcom/tencent/could/component/common/ai/net/HttpMethod;->GET:Lcom/tencent/could/component/common/ai/net/HttpMethod;

    .line 447
    .line 448
    if-ne v0, v4, :cond_b

    .line 449
    .line 450
    const-string v0, "GET"

    .line 451
    .line 452
    invoke-virtual {v3, v0}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 453
    .line 454
    .line 455
    :cond_b
    invoke-static {}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->getInstance()Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;

    .line 456
    .line 457
    .line 458
    move-result-object v0

    .line 459
    const-string v4, "do connect!"

    .line 460
    .line 461
    invoke-virtual {v0, v5, v4}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->logDebug(Ljava/lang/String;Ljava/lang/String;)V

    .line 462
    .line 463
    .line 464
    invoke-virtual {v3}, Ljava/net/URLConnection;->connect()V

    .line 465
    .line 466
    .line 467
    iget-object v0, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->b:Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;

    .line 468
    .line 469
    invoke-virtual {v0}, Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;->getHttpMethod()Lcom/tencent/could/component/common/ai/net/HttpMethod;

    .line 470
    .line 471
    .line 472
    move-result-object v0

    .line 473
    if-ne v0, v2, :cond_c

    .line 474
    .line 475
    invoke-static {}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->getInstance()Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;

    .line 476
    .line 477
    .line 478
    move-result-object v0

    .line 479
    const-string v2, "sendPostDateWithCheckGzip!"

    .line 480
    .line 481
    invoke-virtual {v0, v5, v2}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->logDebug(Ljava/lang/String;Ljava/lang/String;)V

    .line 482
    .line 483
    .line 484
    iget-object v0, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->b:Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;

    .line 485
    .line 486
    invoke-virtual {p0, v3, v0}, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->a(Ljava/net/HttpURLConnection;Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;)V

    .line 487
    .line 488
    .line 489
    :cond_c
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->getResponseCode()I

    .line 490
    .line 491
    .line 492
    move-result v0

    .line 493
    const/16 v2, 0xc8

    .line 494
    .line 495
    if-ne v0, v2, :cond_e

    .line 496
    .line 497
    invoke-static {}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->getInstance()Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;

    .line 498
    .line 499
    .line 500
    move-result-object v0

    .line 501
    const-string v2, "get ResponseCode! ok"

    .line 502
    .line 503
    invoke-virtual {v0, v5, v2}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->logDebug(Ljava/lang/String;Ljava/lang/String;)V

    .line 504
    .line 505
    .line 506
    invoke-virtual {v3}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    .line 507
    .line 508
    .line 509
    move-result-object v0

    .line 510
    invoke-static {}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->getInstance()Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;

    .line 511
    .line 512
    .line 513
    move-result-object v2

    .line 514
    const-string v4, "get net InputStream"

    .line 515
    .line 516
    invoke-virtual {v2, v5, v4}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->logDebug(Ljava/lang/String;Ljava/lang/String;)V

    .line 517
    .line 518
    .line 519
    iget-object v2, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->a:Lcom/tencent/could/component/common/ai/net/CallBackListener;

    .line 520
    .line 521
    if-eqz v2, :cond_d

    .line 522
    .line 523
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->a:Lcom/tencent/could/component/common/ai/net/CallBackListener;

    .line 524
    .line 525
    invoke-virtual {v3}, Ljava/net/URLConnection;->getContentEncoding()Ljava/lang/String;

    .line 526
    .line 527
    .line 528
    move-result-object v2

    .line 529
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 530
    .line 531
    .line 532
    move-result v1

    .line 533
    invoke-interface {p0, v0, v1}, Lcom/tencent/could/component/common/ai/net/CallBackListener;->onSuccess(Ljava/io/InputStream;Z)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 534
    .line 535
    .line 536
    :cond_d
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 537
    .line 538
    .line 539
    return-void

    .line 540
    :cond_e
    :try_start_4
    new-instance p0, Ljava/lang/RuntimeException;

    .line 541
    .line 542
    new-instance v0, Ljava/lang/StringBuilder;

    .line 543
    .line 544
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 545
    .line 546
    .line 547
    const-string v1, "network error, responseCode:"

    .line 548
    .line 549
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 550
    .line 551
    .line 552
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->getResponseCode()I

    .line 553
    .line 554
    .line 555
    move-result v1

    .line 556
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 557
    .line 558
    .line 559
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 560
    .line 561
    .line 562
    move-result-object v0

    .line 563
    invoke-direct {p0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 564
    .line 565
    .line 566
    throw p0
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 567
    :goto_6
    :try_start_5
    new-instance v0, Ljava/lang/RuntimeException;

    .line 568
    .line 569
    new-instance v1, Ljava/lang/StringBuilder;

    .line 570
    .line 571
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 572
    .line 573
    .line 574
    const-string v2, "network error IOException e : "

    .line 575
    .line 576
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 577
    .line 578
    .line 579
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 580
    .line 581
    .line 582
    move-result-object p0

    .line 583
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 584
    .line 585
    .line 586
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 587
    .line 588
    .line 589
    move-result-object p0

    .line 590
    invoke-direct {v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 591
    .line 592
    .line 593
    throw v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 594
    :goto_7
    if-eqz v3, :cond_f

    .line 595
    .line 596
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 597
    .line 598
    .line 599
    :cond_f
    throw p0
.end method

.method public getCallBackListener()Lcom/tencent/could/component/common/ai/net/CallBackListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->a:Lcom/tencent/could/component/common/ai/net/CallBackListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public getNetWorkParam()Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->b:Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;

    .line 2
    .line 3
    return-object p0
.end method

.method public setListener(Lcom/tencent/could/component/common/ai/net/CallBackListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->a:Lcom/tencent/could/component/common/ai/net/CallBackListener;

    .line 2
    .line 3
    return-void
.end method

.method public setNeedIpBackUrl(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->d:Z

    .line 2
    .line 3
    return-void
.end method

.method public setNeedIpBackUrls(ZI)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->e:Z

    .line 2
    .line 3
    iput p2, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->f:I

    .line 4
    .line 5
    return-void
.end method

.method public setNeedUseDeputy(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->c:Z

    .line 2
    .line 3
    return-void
.end method

.method public setNetWorkParam(Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->b:Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;

    .line 2
    .line 3
    return-void
.end method
