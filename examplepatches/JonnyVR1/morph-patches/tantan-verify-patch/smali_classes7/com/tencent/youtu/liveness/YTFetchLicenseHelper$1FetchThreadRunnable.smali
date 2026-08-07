.class public Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$1FetchThreadRunnable;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/youtu/liveness/YTFetchLicenseHelper;->fetchLicenseOnline(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/tencent/youtu/liveness/YTDeviceInfo;)Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$FetchLicenseResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "FetchThreadRunnable"
.end annotation


# instance fields
.field public a:Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$FetchLicenseResult;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Ljava/lang/String;

.field public final synthetic g:Ljava/lang/String;

.field public final synthetic h:Ljava/lang/String;

.field public final synthetic i:Lcom/tencent/youtu/liveness/YTFetchLicenseHelper;


# direct methods
.method public constructor <init>(Lcom/tencent/youtu/liveness/YTFetchLicenseHelper;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$1FetchThreadRunnable;->i:Lcom/tencent/youtu/liveness/YTFetchLicenseHelper;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$1FetchThreadRunnable;->b:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$1FetchThreadRunnable;->c:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$1FetchThreadRunnable;->d:Ljava/lang/String;

    .line 8
    .line 9
    iput-object p5, p0, Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$1FetchThreadRunnable;->e:Ljava/lang/String;

    .line 10
    .line 11
    iput-object p6, p0, Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$1FetchThreadRunnable;->f:Ljava/lang/String;

    .line 12
    .line 13
    iput-object p7, p0, Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$1FetchThreadRunnable;->g:Ljava/lang/String;

    .line 14
    .line 15
    iput-object p8, p0, Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$1FetchThreadRunnable;->h:Ljava/lang/String;

    .line 16
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    .line 19
    .line 20
    new-instance p2, Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$FetchLicenseResult;

    .line 21
    .line 22
    invoke-direct {p2, p1}, Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$FetchLicenseResult;-><init>(Lcom/tencent/youtu/liveness/YTFetchLicenseHelper;)V

    .line 23
    .line 24
    .line 25
    iput-object p2, p0, Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$1FetchThreadRunnable;->a:Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$FetchLicenseResult;

    .line 26
    .line 27
    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .line 1
    const-string v0, "error_code"

    .line 2
    .line 3
    const-string v1, "HmacSHA256"

    .line 4
    .line 5
    const-string v2, "connection status: "

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 9
    .line 10
    .line 11
    move-result-wide v4

    .line 12
    const-wide/16 v6, 0x3e8

    .line 13
    .line 14
    div-long/2addr v4, v6

    .line 15
    new-instance v6, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    iget-object v7, p0, Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$1FetchThreadRunnable;->b:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v7, "-"

    .line 26
    .line 27
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v6, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v6

    .line 37
    invoke-static {v1}, Ljavax/crypto/Mac;->getInstance(Ljava/lang/String;)Ljavax/crypto/Mac;

    .line 38
    .line 39
    .line 40
    move-result-object v7

    .line 41
    new-instance v8, Ljavax/crypto/spec/SecretKeySpec;

    .line 42
    .line 43
    iget-object v9, p0, Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$1FetchThreadRunnable;->c:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {v9}, Ljava/lang/String;->getBytes()[B

    .line 46
    .line 47
    .line 48
    move-result-object v9

    .line 49
    invoke-direct {v8, v9, v1}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v7, v8}, Ljavax/crypto/Mac;->init(Ljava/security/Key;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v6}, Ljava/lang/String;->getBytes()[B

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v7, v1}, Ljavax/crypto/Mac;->doFinal([B)[B

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    const/4 v6, 0x2

    .line 64
    invoke-static {v1, v6}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    new-instance v6, Lorg/json/JSONObject;

    .line 69
    .line 70
    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V
    :try_end_0
    .catch Ljava/net/SocketTimeoutException; {:try_start_0 .. :try_end_0} :catch_15
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_14
    .catch Ljava/net/ProtocolException; {:try_start_0 .. :try_end_0} :catch_13
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_12
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_11
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_10
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_f
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 71
    .line 72
    .line 73
    const-string v7, "app_id"

    .line 74
    .line 75
    :try_start_1
    iget-object v8, p0, Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$1FetchThreadRunnable;->b:Ljava/lang/String;

    .line 76
    .line 77
    invoke-virtual {v6, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 78
    .line 79
    .line 80
    const-string v7, "auth_string"

    .line 81
    .line 82
    invoke-virtual {v6, v7, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Ljava/net/SocketTimeoutException; {:try_start_1 .. :try_end_1} :catch_15
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_1} :catch_14
    .catch Ljava/net/ProtocolException; {:try_start_1 .. :try_end_1} :catch_13
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_12
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_11
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_1 .. :try_end_1} :catch_10
    .catch Ljava/security/InvalidKeyException; {:try_start_1 .. :try_end_1} :catch_f
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 83
    .line 84
    .line 85
    const-string v1, "machine_type"

    .line 86
    .line 87
    :try_start_2
    iget-object v7, p0, Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$1FetchThreadRunnable;->d:Ljava/lang/String;

    .line 88
    .line 89
    invoke-virtual {v6, v1, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_2
    .catch Ljava/net/SocketTimeoutException; {:try_start_2 .. :try_end_2} :catch_15
    .catch Ljava/net/MalformedURLException; {:try_start_2 .. :try_end_2} :catch_14
    .catch Ljava/net/ProtocolException; {:try_start_2 .. :try_end_2} :catch_13
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_12
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_11
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_2 .. :try_end_2} :catch_10
    .catch Ljava/security/InvalidKeyException; {:try_start_2 .. :try_end_2} :catch_f
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 90
    .line 91
    .line 92
    const-string v1, "machine_id"

    .line 93
    .line 94
    :try_start_3
    iget-object v7, p0, Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$1FetchThreadRunnable;->e:Ljava/lang/String;

    .line 95
    .line 96
    invoke-virtual {v6, v1, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_3
    .catch Ljava/net/SocketTimeoutException; {:try_start_3 .. :try_end_3} :catch_15
    .catch Ljava/net/MalformedURLException; {:try_start_3 .. :try_end_3} :catch_14
    .catch Ljava/net/ProtocolException; {:try_start_3 .. :try_end_3} :catch_13
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_12
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_11
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_3 .. :try_end_3} :catch_10
    .catch Ljava/security/InvalidKeyException; {:try_start_3 .. :try_end_3} :catch_f
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 97
    .line 98
    .line 99
    const-string v1, "machine_info"

    .line 100
    .line 101
    :try_start_4
    iget-object v7, p0, Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$1FetchThreadRunnable;->f:Ljava/lang/String;

    .line 102
    .line 103
    invoke-virtual {v6, v1, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_4
    .catch Ljava/net/SocketTimeoutException; {:try_start_4 .. :try_end_4} :catch_15
    .catch Ljava/net/MalformedURLException; {:try_start_4 .. :try_end_4} :catch_14
    .catch Ljava/net/ProtocolException; {:try_start_4 .. :try_end_4} :catch_13
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_12
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_11
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_4 .. :try_end_4} :catch_10
    .catch Ljava/security/InvalidKeyException; {:try_start_4 .. :try_end_4} :catch_f
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 104
    .line 105
    .line 106
    const-string v1, "package_name"

    .line 107
    .line 108
    :try_start_5
    iget-object v7, p0, Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$1FetchThreadRunnable;->g:Ljava/lang/String;

    .line 109
    .line 110
    invoke-virtual {v6, v1, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 111
    .line 112
    .line 113
    const-string v1, "time_stamp"

    .line 114
    .line 115
    invoke-virtual {v6, v1, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 116
    .line 117
    .line 118
    invoke-virtual {v6}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    new-instance v4, Ljava/net/URL;

    .line 123
    .line 124
    iget-object v5, p0, Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$1FetchThreadRunnable;->h:Ljava/lang/String;

    .line 125
    .line 126
    invoke-direct {v4, v5}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v4}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    .line 130
    .line 131
    .line 132
    move-result-object v4

    .line 133
    check-cast v4, Ljavax/net/ssl/HttpsURLConnection;
    :try_end_5
    .catch Ljava/net/SocketTimeoutException; {:try_start_5 .. :try_end_5} :catch_15
    .catch Ljava/net/MalformedURLException; {:try_start_5 .. :try_end_5} :catch_14
    .catch Ljava/net/ProtocolException; {:try_start_5 .. :try_end_5} :catch_13
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_12
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_11
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_5 .. :try_end_5} :catch_10
    .catch Ljava/security/InvalidKeyException; {:try_start_5 .. :try_end_5} :catch_f
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 134
    .line 135
    :try_start_6
    const-string v5, "POST"

    .line 136
    .line 137
    invoke-virtual {v4, v5}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    const/4 v5, 0x1

    .line 141
    invoke-virtual {v4, v5}, Ljava/net/URLConnection;->setDoInput(Z)V

    .line 142
    .line 143
    .line 144
    invoke-virtual {v4, v5}, Ljava/net/URLConnection;->setDoOutput(Z)V

    .line 145
    .line 146
    .line 147
    const/4 v5, 0x0

    .line 148
    invoke-virtual {v4, v5}, Ljava/net/URLConnection;->setUseCaches(Z)V

    .line 149
    .line 150
    .line 151
    invoke-virtual {v4, v5}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    .line 152
    .line 153
    .line 154
    const-string v5, "Content-type"

    .line 155
    .line 156
    const-string v6, "application/json"

    .line 157
    .line 158
    invoke-virtual {v4, v5, v6}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    const/16 v5, 0x1388

    .line 162
    .line 163
    invoke-virtual {v4, v5}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    .line 164
    .line 165
    .line 166
    invoke-virtual {v4, v5}, Ljava/net/URLConnection;->setReadTimeout(I)V

    .line 167
    .line 168
    .line 169
    invoke-virtual {v4}, Ljava/net/URLConnection;->connect()V

    .line 170
    .line 171
    .line 172
    new-instance v5, Ljava/io/DataOutputStream;

    .line 173
    .line 174
    invoke-virtual {v4}, Ljava/net/URLConnection;->getOutputStream()Ljava/io/OutputStream;

    .line 175
    .line 176
    .line 177
    move-result-object v6

    .line 178
    invoke-direct {v5, v6}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 179
    .line 180
    .line 181
    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    .line 182
    .line 183
    .line 184
    move-result-object v1

    .line 185
    invoke-virtual {v5, v1}, Ljava/io/OutputStream;->write([B)V

    .line 186
    .line 187
    .line 188
    invoke-virtual {v5}, Ljava/io/DataOutputStream;->flush()V

    .line 189
    .line 190
    .line 191
    invoke-virtual {v5}, Ljava/io/OutputStream;->close()V

    .line 192
    .line 193
    .line 194
    iget-object v1, p0, Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$1FetchThreadRunnable;->a:Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$FetchLicenseResult;

    .line 195
    .line 196
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getResponseCode()I

    .line 197
    .line 198
    .line 199
    move-result v5

    .line 200
    iput v5, v1, Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$FetchLicenseResult;->http_status:I

    .line 201
    .line 202
    iget-object v1, p0, Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$1FetchThreadRunnable;->a:Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$FetchLicenseResult;

    .line 203
    .line 204
    iget v1, v1, Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$FetchLicenseResult;->http_status:I

    .line 205
    .line 206
    const/16 v5, 0xc8

    .line 207
    .line 208
    if-ne v1, v5, :cond_2

    .line 209
    .line 210
    invoke-virtual {v4}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    .line 211
    .line 212
    .line 213
    move-result-object v1

    .line 214
    new-instance v2, Ljava/io/BufferedReader;

    .line 215
    .line 216
    new-instance v5, Ljava/io/InputStreamReader;

    .line 217
    .line 218
    invoke-direct {v5, v1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 219
    .line 220
    .line 221
    invoke-direct {v2, v5}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_6
    .catch Ljava/net/SocketTimeoutException; {:try_start_6 .. :try_end_6} :catch_d
    .catch Ljava/net/MalformedURLException; {:try_start_6 .. :try_end_6} :catch_c
    .catch Ljava/net/ProtocolException; {:try_start_6 .. :try_end_6} :catch_b
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_a
    .catch Lorg/json/JSONException; {:try_start_6 .. :try_end_6} :catch_9
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_6 .. :try_end_6} :catch_8
    .catch Ljava/security/InvalidKeyException; {:try_start_6 .. :try_end_6} :catch_7
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 222
    .line 223
    .line 224
    :try_start_7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 225
    .line 226
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 227
    .line 228
    .line 229
    :goto_0
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 230
    .line 231
    .line 232
    move-result-object v3

    .line 233
    if-eqz v3, :cond_0

    .line 234
    .line 235
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 236
    .line 237
    .line 238
    goto :goto_0

    .line 239
    :catchall_0
    move-exception p0

    .line 240
    move-object v3, v2

    .line 241
    goto/16 :goto_18

    .line 242
    .line 243
    :catch_0
    move-exception p0

    .line 244
    goto :goto_1

    .line 245
    :catch_1
    move-exception p0

    .line 246
    goto :goto_2

    .line 247
    :catch_2
    move-exception p0

    .line 248
    goto :goto_3

    .line 249
    :catch_3
    move-exception p0

    .line 250
    goto :goto_4

    .line 251
    :catch_4
    move-exception p0

    .line 252
    goto :goto_5

    .line 253
    :catch_5
    move-exception p0

    .line 254
    goto :goto_6

    .line 255
    :catch_6
    move-exception p0

    .line 256
    goto :goto_7

    .line 257
    :cond_0
    new-instance v3, Lorg/json/JSONObject;

    .line 258
    .line 259
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 260
    .line 261
    .line 262
    move-result-object v1

    .line 263
    invoke-direct {v3, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 264
    .line 265
    .line 266
    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 267
    .line 268
    .line 269
    move-result v1

    .line 270
    if-eqz v1, :cond_1

    .line 271
    .line 272
    iget-object v1, p0, Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$1FetchThreadRunnable;->a:Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$FetchLicenseResult;

    .line 273
    .line 274
    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 275
    .line 276
    .line 277
    move-result v0

    .line 278
    iput v0, v1, Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$FetchLicenseResult;->error_code:I

    .line 279
    .line 280
    iget-object v0, p0, Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$1FetchThreadRunnable;->a:Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$FetchLicenseResult;

    .line 281
    .line 282
    const-string v1, "error_msg"

    .line 283
    .line 284
    invoke-virtual {v3, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 285
    .line 286
    .line 287
    move-result-object v1

    .line 288
    iput-object v1, v0, Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$FetchLicenseResult;->error_msg:Ljava/lang/String;

    .line 289
    .line 290
    iget-object v0, p0, Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$1FetchThreadRunnable;->a:Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$FetchLicenseResult;

    .line 291
    .line 292
    iget v1, v0, Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$FetchLicenseResult;->error_code:I

    .line 293
    .line 294
    if-nez v1, :cond_1

    .line 295
    .line 296
    const-string v1, "license"

    .line 297
    .line 298
    invoke-virtual {v3, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 299
    .line 300
    .line 301
    move-result-object v1

    .line 302
    iput-object v1, v0, Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$FetchLicenseResult;->license:Ljava/lang/String;

    .line 303
    .line 304
    iget-object v0, p0, Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$1FetchThreadRunnable;->a:Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$FetchLicenseResult;

    .line 305
    .line 306
    const-string v1, "bind_type"

    .line 307
    .line 308
    invoke-virtual {v3, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 309
    .line 310
    .line 311
    move-result-object v1

    .line 312
    iput-object v1, v0, Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$FetchLicenseResult;->bind_type:Ljava/lang/String;

    .line 313
    .line 314
    iget-object p0, p0, Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$1FetchThreadRunnable;->a:Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$FetchLicenseResult;

    .line 315
    .line 316
    const-string v0, "auth_type"

    .line 317
    .line 318
    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 319
    .line 320
    .line 321
    move-result-object v0

    .line 322
    iput-object v0, p0, Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$FetchLicenseResult;->auth_type:Ljava/lang/String;
    :try_end_7
    .catch Ljava/net/SocketTimeoutException; {:try_start_7 .. :try_end_7} :catch_6
    .catch Ljava/net/MalformedURLException; {:try_start_7 .. :try_end_7} :catch_5
    .catch Ljava/net/ProtocolException; {:try_start_7 .. :try_end_7} :catch_4
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_3
    .catch Lorg/json/JSONException; {:try_start_7 .. :try_end_7} :catch_2
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_7 .. :try_end_7} :catch_1
    .catch Ljava/security/InvalidKeyException; {:try_start_7 .. :try_end_7} :catch_0
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 323
    .line 324
    :cond_1
    move-object v3, v2

    .line 325
    goto :goto_8

    .line 326
    :goto_1
    move-object v3, v2

    .line 327
    goto/16 :goto_9

    .line 328
    .line 329
    :goto_2
    move-object v3, v2

    .line 330
    goto/16 :goto_b

    .line 331
    .line 332
    :goto_3
    move-object v3, v2

    .line 333
    goto/16 :goto_d

    .line 334
    .line 335
    :goto_4
    move-object v3, v2

    .line 336
    goto/16 :goto_f

    .line 337
    .line 338
    :goto_5
    move-object v3, v2

    .line 339
    goto/16 :goto_11

    .line 340
    .line 341
    :goto_6
    move-object v3, v2

    .line 342
    goto/16 :goto_13

    .line 343
    .line 344
    :goto_7
    move-object v3, v2

    .line 345
    goto/16 :goto_15

    .line 346
    .line 347
    :catchall_1
    move-exception p0

    .line 348
    goto/16 :goto_18

    .line 349
    .line 350
    :catch_7
    move-exception p0

    .line 351
    goto :goto_9

    .line 352
    :catch_8
    move-exception p0

    .line 353
    goto/16 :goto_b

    .line 354
    .line 355
    :catch_9
    move-exception p0

    .line 356
    goto/16 :goto_d

    .line 357
    .line 358
    :catch_a
    move-exception p0

    .line 359
    goto/16 :goto_f

    .line 360
    .line 361
    :catch_b
    move-exception p0

    .line 362
    goto/16 :goto_11

    .line 363
    .line 364
    :catch_c
    move-exception p0

    .line 365
    goto/16 :goto_13

    .line 366
    .line 367
    :catch_d
    move-exception p0

    .line 368
    goto/16 :goto_15

    .line 369
    .line 370
    :cond_2
    const-string v0, "YTCommon_FetchLicense"

    .line 371
    .line 372
    :try_start_8
    new-instance v1, Ljava/lang/StringBuilder;

    .line 373
    .line 374
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 375
    .line 376
    .line 377
    iget-object p0, p0, Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$1FetchThreadRunnable;->a:Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$FetchLicenseResult;

    .line 378
    .line 379
    iget p0, p0, Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$FetchLicenseResult;->http_status:I

    .line 380
    .line 381
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 382
    .line 383
    .line 384
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 385
    .line 386
    .line 387
    move-result-object p0

    .line 388
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_8
    .catch Ljava/net/SocketTimeoutException; {:try_start_8 .. :try_end_8} :catch_d
    .catch Ljava/net/MalformedURLException; {:try_start_8 .. :try_end_8} :catch_c
    .catch Ljava/net/ProtocolException; {:try_start_8 .. :try_end_8} :catch_b
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_a
    .catch Lorg/json/JSONException; {:try_start_8 .. :try_end_8} :catch_9
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_8 .. :try_end_8} :catch_8
    .catch Ljava/security/InvalidKeyException; {:try_start_8 .. :try_end_8} :catch_7
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 389
    .line 390
    .line 391
    :goto_8
    if-eqz v3, :cond_a

    .line 392
    .line 393
    :try_start_9
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_e

    .line 394
    .line 395
    .line 396
    goto/16 :goto_17

    .line 397
    .line 398
    :catch_e
    move-exception p0

    .line 399
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 400
    .line 401
    .line 402
    goto/16 :goto_17

    .line 403
    .line 404
    :catchall_2
    move-exception p0

    .line 405
    move-object v4, v3

    .line 406
    goto/16 :goto_18

    .line 407
    .line 408
    :catch_f
    move-exception p0

    .line 409
    move-object v4, v3

    .line 410
    goto :goto_9

    .line 411
    :catch_10
    move-exception p0

    .line 412
    move-object v4, v3

    .line 413
    goto :goto_b

    .line 414
    :catch_11
    move-exception p0

    .line 415
    move-object v4, v3

    .line 416
    goto :goto_d

    .line 417
    :catch_12
    move-exception p0

    .line 418
    move-object v4, v3

    .line 419
    goto :goto_f

    .line 420
    :catch_13
    move-exception p0

    .line 421
    move-object v4, v3

    .line 422
    goto :goto_11

    .line 423
    :catch_14
    move-exception p0

    .line 424
    move-object v4, v3

    .line 425
    goto :goto_13

    .line 426
    :catch_15
    move-exception p0

    .line 427
    move-object v4, v3

    .line 428
    goto/16 :goto_15

    .line 429
    .line 430
    :goto_9
    :try_start_a
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    .line 431
    .line 432
    .line 433
    if-eqz v3, :cond_3

    .line 434
    .line 435
    :try_start_b
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_16

    .line 436
    .line 437
    .line 438
    goto :goto_a

    .line 439
    :catch_16
    move-exception p0

    .line 440
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 441
    .line 442
    .line 443
    :cond_3
    :goto_a
    if-eqz v4, :cond_b

    .line 444
    .line 445
    goto/16 :goto_17

    .line 446
    .line 447
    :goto_b
    :try_start_c
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_1

    .line 448
    .line 449
    .line 450
    if-eqz v3, :cond_4

    .line 451
    .line 452
    :try_start_d
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_17

    .line 453
    .line 454
    .line 455
    goto :goto_c

    .line 456
    :catch_17
    move-exception p0

    .line 457
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 458
    .line 459
    .line 460
    :cond_4
    :goto_c
    if-eqz v4, :cond_b

    .line 461
    .line 462
    goto :goto_17

    .line 463
    :goto_d
    :try_start_e
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_1

    .line 464
    .line 465
    .line 466
    if-eqz v3, :cond_5

    .line 467
    .line 468
    :try_start_f
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V
    :try_end_f
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_f} :catch_18

    .line 469
    .line 470
    .line 471
    goto :goto_e

    .line 472
    :catch_18
    move-exception p0

    .line 473
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 474
    .line 475
    .line 476
    :cond_5
    :goto_e
    if-eqz v4, :cond_b

    .line 477
    .line 478
    goto :goto_17

    .line 479
    :goto_f
    :try_start_10
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_1

    .line 480
    .line 481
    .line 482
    if-eqz v3, :cond_6

    .line 483
    .line 484
    :try_start_11
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V
    :try_end_11
    .catch Ljava/io/IOException; {:try_start_11 .. :try_end_11} :catch_19

    .line 485
    .line 486
    .line 487
    goto :goto_10

    .line 488
    :catch_19
    move-exception p0

    .line 489
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 490
    .line 491
    .line 492
    :cond_6
    :goto_10
    if-eqz v4, :cond_b

    .line 493
    .line 494
    goto :goto_17

    .line 495
    :goto_11
    :try_start_12
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_1

    .line 496
    .line 497
    .line 498
    if-eqz v3, :cond_7

    .line 499
    .line 500
    :try_start_13
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V
    :try_end_13
    .catch Ljava/io/IOException; {:try_start_13 .. :try_end_13} :catch_1a

    .line 501
    .line 502
    .line 503
    goto :goto_12

    .line 504
    :catch_1a
    move-exception p0

    .line 505
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 506
    .line 507
    .line 508
    :cond_7
    :goto_12
    if-eqz v4, :cond_b

    .line 509
    .line 510
    goto :goto_17

    .line 511
    :goto_13
    :try_start_14
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_1

    .line 512
    .line 513
    .line 514
    if-eqz v3, :cond_8

    .line 515
    .line 516
    :try_start_15
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V
    :try_end_15
    .catch Ljava/io/IOException; {:try_start_15 .. :try_end_15} :catch_1b

    .line 517
    .line 518
    .line 519
    goto :goto_14

    .line 520
    :catch_1b
    move-exception p0

    .line 521
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 522
    .line 523
    .line 524
    :cond_8
    :goto_14
    if-eqz v4, :cond_b

    .line 525
    .line 526
    goto :goto_17

    .line 527
    :goto_15
    :try_start_16
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_1

    .line 528
    .line 529
    .line 530
    if-eqz v3, :cond_9

    .line 531
    .line 532
    :try_start_17
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V
    :try_end_17
    .catch Ljava/io/IOException; {:try_start_17 .. :try_end_17} :catch_1c

    .line 533
    .line 534
    .line 535
    goto :goto_16

    .line 536
    :catch_1c
    move-exception p0

    .line 537
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 538
    .line 539
    .line 540
    :cond_9
    :goto_16
    if-eqz v4, :cond_b

    .line 541
    .line 542
    :cond_a
    :goto_17
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 543
    .line 544
    .line 545
    :cond_b
    return-void

    .line 546
    :goto_18
    if-eqz v3, :cond_c

    .line 547
    .line 548
    :try_start_18
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V
    :try_end_18
    .catch Ljava/io/IOException; {:try_start_18 .. :try_end_18} :catch_1d

    .line 549
    .line 550
    .line 551
    goto :goto_19

    .line 552
    :catch_1d
    move-exception v0

    .line 553
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 554
    .line 555
    .line 556
    :cond_c
    :goto_19
    if-eqz v4, :cond_d

    .line 557
    .line 558
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 559
    .line 560
    .line 561
    :cond_d
    throw p0
.end method
