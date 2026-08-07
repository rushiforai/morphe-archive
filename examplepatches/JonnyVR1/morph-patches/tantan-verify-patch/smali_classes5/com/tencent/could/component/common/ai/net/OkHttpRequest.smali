.class public Lcom/tencent/could/component/common/ai/net/OkHttpRequest;
.super Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/could/component/common/ai/net/OkHttpRequest$TimeoutInterceptor;
    }
.end annotation


# static fields
.field public static volatile currentConnectTimeout:I = 0x3a98

.field public static volatile currentTimeout:I = 0x7530


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;)Lcom/tencent/cloud/ai/network/okhttp3/Request;
    .locals 3

    .line 1
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->url(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->b:Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;->getRequestHeaders()Ljava/util/HashMap;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p1}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Ljava/util/Map$Entry;

    .line 36
    .line 37
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    check-cast v2, Ljava/lang/String;

    .line 42
    .line 43
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    check-cast v1, Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {v0, v2, v1}, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    goto :goto_0

    .line 54
    :cond_0
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->b:Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;

    .line 55
    .line 56
    invoke-virtual {p0}, Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;->isGzip()Z

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    if-eqz p0, :cond_1

    .line 61
    .line 62
    const-string p0, "Content-Encoding"

    .line 63
    .line 64
    const-string p1, "gzip"

    .line 65
    .line 66
    invoke-virtual {v0, p0, p1}, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;

    .line 67
    .line 68
    .line 69
    const-string p0, "Accept-Encoding"

    .line 70
    .line 71
    invoke-virtual {v0, p0, p1}, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;

    .line 72
    .line 73
    .line 74
    :cond_1
    if-eqz p2, :cond_2

    .line 75
    .line 76
    invoke-virtual {v0, p2}, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->post(Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;)Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;

    .line 77
    .line 78
    .line 79
    :cond_2
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->build()Lcom/tencent/cloud/ai/network/okhttp3/Request;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    return-object p0
.end method

.method public execute()V
    .locals 7

    .line 1
    const-string v0, "responseCode error: "

    .line 2
    .line 3
    const-string v1, "OkHttpRequest execute!"

    .line 4
    .line 5
    const-string v2, "OkHttpRequest"

    .line 6
    .line 7
    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->b:Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;

    .line 11
    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    invoke-static {}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->getInstance()Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string v0, "netWorkParam is null!"

    .line 19
    .line 20
    invoke-virtual {p0, v2, v0}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->logError(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    invoke-virtual {v1}, Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;->getUrl()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iget-boolean v3, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->c:Z

    .line 29
    .line 30
    if-eqz v3, :cond_1

    .line 31
    .line 32
    iget-object v3, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->b:Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;

    .line 33
    .line 34
    invoke-virtual {v3}, Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;->getDeputyUrl()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    if-nez v3, :cond_1

    .line 43
    .line 44
    invoke-static {}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->getInstance()Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    const-string v3, "use DeputyUrl"

    .line 49
    .line 50
    invoke-virtual {v1, v2, v3}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->logError(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    iget-object v1, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->b:Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;

    .line 54
    .line 55
    invoke-virtual {v1}, Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;->getDeputyUrl()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    :cond_1
    iget-object v3, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->b:Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;

    .line 60
    .line 61
    invoke-virtual {v3}, Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;->getHttpMethod()Lcom/tencent/could/component/common/ai/net/HttpMethod;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    sget-object v4, Lcom/tencent/could/component/common/ai/net/HttpMethod;->GET:Lcom/tencent/could/component/common/ai/net/HttpMethod;

    .line 66
    .line 67
    if-ne v4, v3, :cond_2

    .line 68
    .line 69
    const/4 v3, 0x0

    .line 70
    invoke-virtual {p0, v1, v3}, Lcom/tencent/could/component/common/ai/net/OkHttpRequest;->a(Ljava/lang/String;Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;)Lcom/tencent/cloud/ai/network/okhttp3/Request;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    goto :goto_1

    .line 75
    :cond_2
    iget-object v3, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->b:Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;

    .line 76
    .line 77
    invoke-virtual {v3}, Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;->isGzip()Z

    .line 78
    .line 79
    .line 80
    move-result v3

    .line 81
    const-string v4, "application/json"

    .line 82
    .line 83
    if-eqz v3, :cond_3

    .line 84
    .line 85
    invoke-static {v4}, Lcom/tencent/cloud/ai/network/okhttp3/MediaType;->parse(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/MediaType;

    .line 86
    .line 87
    .line 88
    move-result-object v3

    .line 89
    iget-object v4, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->b:Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;

    .line 90
    .line 91
    invoke-virtual {v4}, Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;->getRequestData()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v4

    .line 95
    invoke-static {v4}, Lcom/tencent/could/component/common/ai/utils/GZipUtils;->compress(Ljava/lang/String;)[B

    .line 96
    .line 97
    .line 98
    move-result-object v4

    .line 99
    invoke-static {v3, v4}, Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;->create(Lcom/tencent/cloud/ai/network/okhttp3/MediaType;[B)Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;

    .line 100
    .line 101
    .line 102
    move-result-object v3

    .line 103
    goto :goto_0

    .line 104
    :cond_3
    invoke-static {v4}, Lcom/tencent/cloud/ai/network/okhttp3/MediaType;->parse(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/MediaType;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    iget-object v4, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->b:Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;

    .line 109
    .line 110
    invoke-virtual {v4}, Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;->getRequestData()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v4

    .line 114
    invoke-static {v3, v4}, Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;->create(Lcom/tencent/cloud/ai/network/okhttp3/MediaType;Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;

    .line 115
    .line 116
    .line 117
    move-result-object v3

    .line 118
    :goto_0
    invoke-virtual {p0, v1, v3}, Lcom/tencent/could/component/common/ai/net/OkHttpRequest;->a(Ljava/lang/String;Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;)Lcom/tencent/cloud/ai/network/okhttp3/Request;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    :goto_1
    iget-object v3, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->b:Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;

    .line 123
    .line 124
    invoke-virtual {v3}, Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;->getConnectTimeOut()I

    .line 125
    .line 126
    .line 127
    move-result v3

    .line 128
    sput v3, Lcom/tencent/could/component/common/ai/net/OkHttpRequest;->currentConnectTimeout:I

    .line 129
    .line 130
    iget-object v3, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->b:Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;

    .line 131
    .line 132
    invoke-virtual {v3}, Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;->getTimeOutTimes()I

    .line 133
    .line 134
    .line 135
    move-result v3

    .line 136
    sput v3, Lcom/tencent/could/component/common/ai/net/OkHttpRequest;->currentTimeout:I

    .line 137
    .line 138
    invoke-static {}, Lcom/tencent/cloud/ai/network/helper/AiOkHttpHelper;->getInstance()Lcom/tencent/cloud/ai/network/helper/AiOkHttpHelper;

    .line 139
    .line 140
    .line 141
    move-result-object v3

    .line 142
    invoke-virtual {v3}, Lcom/tencent/cloud/ai/network/helper/AiOkHttpHelper;->getOkHttpClient()Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;

    .line 143
    .line 144
    .line 145
    move-result-object v3

    .line 146
    if-nez v3, :cond_6

    .line 147
    .line 148
    const-string v3, "OkHttpRequest execute! client == null"

    .line 149
    .line 150
    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 151
    .line 152
    .line 153
    const-string v3, "createOkHttpClient"

    .line 154
    .line 155
    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 156
    .line 157
    .line 158
    new-instance v3, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;

    .line 159
    .line 160
    invoke-direct {v3}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;-><init>()V

    .line 161
    .line 162
    .line 163
    iget-object v4, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->b:Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;

    .line 164
    .line 165
    invoke-virtual {v4}, Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;->getConnectTimeOut()I

    .line 166
    .line 167
    .line 168
    move-result v4

    .line 169
    int-to-long v4, v4

    .line 170
    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 171
    .line 172
    invoke-virtual {v3, v4, v5, v6}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->connectTimeout(JLjava/util/concurrent/TimeUnit;)Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;

    .line 173
    .line 174
    .line 175
    iget-object v4, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->b:Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;

    .line 176
    .line 177
    invoke-virtual {v4}, Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;->getTimeOutTimes()I

    .line 178
    .line 179
    .line 180
    move-result v4

    .line 181
    int-to-long v4, v4

    .line 182
    invoke-virtual {v3, v4, v5, v6}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->callTimeout(JLjava/util/concurrent/TimeUnit;)Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;

    .line 183
    .line 184
    .line 185
    iget-object v4, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->b:Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;

    .line 186
    .line 187
    invoke-virtual {v4}, Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;->getTimeOutTimes()I

    .line 188
    .line 189
    .line 190
    move-result v4

    .line 191
    int-to-long v4, v4

    .line 192
    invoke-virtual {v3, v4, v5, v6}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->readTimeout(JLjava/util/concurrent/TimeUnit;)Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;

    .line 193
    .line 194
    .line 195
    iget-object v4, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->b:Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;

    .line 196
    .line 197
    invoke-virtual {v4}, Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;->getTimeOutTimes()I

    .line 198
    .line 199
    .line 200
    move-result v4

    .line 201
    int-to-long v4, v4

    .line 202
    invoke-virtual {v3, v4, v5, v6}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->writeTimeout(JLjava/util/concurrent/TimeUnit;)Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;

    .line 203
    .line 204
    .line 205
    new-instance v4, Lcom/tencent/could/component/common/ai/net/OkHttpRequest$TimeoutInterceptor;

    .line 206
    .line 207
    invoke-direct {v4, p0}, Lcom/tencent/could/component/common/ai/net/OkHttpRequest$TimeoutInterceptor;-><init>(Lcom/tencent/could/component/common/ai/net/OkHttpRequest;)V

    .line 208
    .line 209
    .line 210
    invoke-virtual {v3, v4}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->addInterceptor(Lcom/tencent/cloud/ai/network/okhttp3/Interceptor;)Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;

    .line 211
    .line 212
    .line 213
    iget-object v4, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->b:Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;

    .line 214
    .line 215
    invoke-virtual {v4}, Lcom/tencent/could/component/common/ai/eventreport/entry/NetWorkParam;->getConnectIps()[Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object v4

    .line 219
    if-eqz v4, :cond_5

    .line 220
    .line 221
    array-length v5, v4

    .line 222
    if-nez v5, :cond_4

    .line 223
    .line 224
    goto :goto_2

    .line 225
    :cond_4
    new-instance v5, Lcom/tencent/could/component/common/ai/net/OkHttpRequest$1;

    .line 226
    .line 227
    invoke-direct {v5, p0, v4}, Lcom/tencent/could/component/common/ai/net/OkHttpRequest$1;-><init>(Lcom/tencent/could/component/common/ai/net/OkHttpRequest;[Ljava/lang/String;)V

    .line 228
    .line 229
    .line 230
    invoke-virtual {v3, v5}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->dns(Lcom/tencent/cloud/ai/network/okhttp3/Dns;)Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;

    .line 231
    .line 232
    .line 233
    invoke-virtual {v3}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->build()Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;

    .line 234
    .line 235
    .line 236
    move-result-object v3

    .line 237
    goto :goto_3

    .line 238
    :cond_5
    :goto_2
    invoke-virtual {v3}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->build()Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;

    .line 239
    .line 240
    .line 241
    move-result-object v3

    .line 242
    :goto_3
    invoke-static {}, Lcom/tencent/cloud/ai/network/helper/AiOkHttpHelper;->getInstance()Lcom/tencent/cloud/ai/network/helper/AiOkHttpHelper;

    .line 243
    .line 244
    .line 245
    move-result-object v4

    .line 246
    invoke-virtual {v4, v3}, Lcom/tencent/cloud/ai/network/helper/AiOkHttpHelper;->setOkHttpClient(Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;)V

    .line 247
    .line 248
    .line 249
    :cond_6
    invoke-virtual {v3, v1}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->newCall(Lcom/tencent/cloud/ai/network/okhttp3/Request;)Lcom/tencent/cloud/ai/network/okhttp3/Call;

    .line 250
    .line 251
    .line 252
    move-result-object v1

    .line 253
    :try_start_0
    invoke-interface {v1}, Lcom/tencent/cloud/ai/network/okhttp3/Call;->execute()Lcom/tencent/cloud/ai/network/okhttp3/Response;

    .line 254
    .line 255
    .line 256
    move-result-object v1

    .line 257
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->code()I

    .line 258
    .line 259
    .line 260
    move-result v3

    .line 261
    const/16 v4, 0xc8

    .line 262
    .line 263
    if-ne v3, v4, :cond_a

    .line 264
    .line 265
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->body()Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody;

    .line 266
    .line 267
    .line 268
    move-result-object v0

    .line 269
    if-eqz v0, :cond_9

    .line 270
    .line 271
    iget-object v0, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->a:Lcom/tencent/could/component/common/ai/net/CallBackListener;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 272
    .line 273
    if-eqz v0, :cond_8

    .line 274
    .line 275
    const-string v0, "gzip"

    .line 276
    .line 277
    :try_start_1
    const-string v2, "Content-Encoding"

    .line 278
    .line 279
    invoke-virtual {v1, v2}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->header(Ljava/lang/String;)Ljava/lang/String;

    .line 280
    .line 281
    .line 282
    move-result-object v2

    .line 283
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 284
    .line 285
    .line 286
    move-result v0

    .line 287
    if-eqz v0, :cond_7

    .line 288
    .line 289
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->body()Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody;

    .line 290
    .line 291
    .line 292
    move-result-object v0

    .line 293
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody;->bytes()[B

    .line 294
    .line 295
    .line 296
    move-result-object v0

    .line 297
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->a:Lcom/tencent/could/component/common/ai/net/CallBackListener;

    .line 298
    .line 299
    invoke-static {v0}, Lcom/tencent/could/component/common/ai/utils/GZipUtils;->uncompressToString([B)Ljava/lang/String;

    .line 300
    .line 301
    .line 302
    move-result-object v0

    .line 303
    invoke-interface {p0, v0}, Lcom/tencent/could/component/common/ai/net/CallBackListener;->onSuccess(Ljava/lang/String;)V

    .line 304
    .line 305
    .line 306
    goto :goto_4

    .line 307
    :cond_7
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/net/JsonHttpRequest;->a:Lcom/tencent/could/component/common/ai/net/CallBackListener;

    .line 308
    .line 309
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->body()Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody;

    .line 310
    .line 311
    .line 312
    move-result-object v0

    .line 313
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody;->string()Ljava/lang/String;

    .line 314
    .line 315
    .line 316
    move-result-object v0

    .line 317
    invoke-interface {p0, v0}, Lcom/tencent/could/component/common/ai/net/CallBackListener;->onSuccess(Ljava/lang/String;)V

    .line 318
    .line 319
    .line 320
    goto :goto_4

    .line 321
    :cond_8
    invoke-static {}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->getInstance()Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;

    .line 322
    .line 323
    .line 324
    move-result-object p0

    .line 325
    const-string v0, "callBackListener is null!"

    .line 326
    .line 327
    invoke-virtual {p0, v2, v0}, Lcom/tencent/could/component/common/ai/net/TxNetWorkHelper;->logError(Ljava/lang/String;Ljava/lang/String;)V

    .line 328
    .line 329
    .line 330
    :goto_4
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 331
    .line 332
    .line 333
    return-void

    .line 334
    :cond_9
    const-string p0, "response.body is null!"

    .line 335
    .line 336
    :try_start_2
    new-instance v0, Ljava/lang/RuntimeException;

    .line 337
    .line 338
    invoke-direct {v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 339
    .line 340
    .line 341
    throw v0

    .line 342
    :cond_a
    new-instance p0, Ljava/lang/StringBuilder;

    .line 343
    .line 344
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 345
    .line 346
    .line 347
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 348
    .line 349
    .line 350
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 351
    .line 352
    .line 353
    move-result-object p0

    .line 354
    new-instance v0, Ljava/lang/RuntimeException;

    .line 355
    .line 356
    invoke-direct {v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 357
    .line 358
    .line 359
    throw v0
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 360
    :catch_0
    move-exception p0

    .line 361
    const-string v0, "realExecute error: "

    .line 362
    .line 363
    invoke-virtual {p0}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    .line 364
    .line 365
    .line 366
    move-result-object p0

    .line 367
    invoke-static {v0, p0}, Ll/rdd0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 368
    .line 369
    .line 370
    return-void
.end method
