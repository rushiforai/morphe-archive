.class Lcom/momo/xeengine/L/SDKLicenseManager$LicenseRequestTask;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/xeengine/L/SDKLicenseManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "LicenseRequestTask"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/momo/xeengine/L/SDKLicenseManager;


# direct methods
.method private constructor <init>(Lcom/momo/xeengine/L/SDKLicenseManager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/L/SDKLicenseManager$LicenseRequestTask;->this$0:Lcom/momo/xeengine/L/SDKLicenseManager;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lcom/momo/xeengine/L/SDKLicenseManager;Lcom/momo/xeengine/L/SDKLicenseManager$1;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/momo/xeengine/L/SDKLicenseManager$LicenseRequestTask;-><init>(Lcom/momo/xeengine/L/SDKLicenseManager;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    .line 3
    .line 4
    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 5
    .line 6
    .line 7
    const-string v2, "secParam"

    .line 8
    .line 9
    new-instance v3, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    iget-object v4, p0, Lcom/momo/xeengine/L/SDKLicenseManager$LicenseRequestTask;->this$0:Lcom/momo/xeengine/L/SDKLicenseManager;

    .line 15
    .line 16
    invoke-static {v4}, Lcom/momo/xeengine/L/SDKLicenseManager;->access$300(Lcom/momo/xeengine/L/SDKLicenseManager;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v4

    .line 20
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const/16 v4, 0x5f

    .line 24
    .line 25
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object v4, p0, Lcom/momo/xeengine/L/SDKLicenseManager$LicenseRequestTask;->this$0:Lcom/momo/xeengine/L/SDKLicenseManager;

    .line 29
    .line 30
    invoke-static {v4}, Lcom/momo/xeengine/L/SDKLicenseManager;->access$400(Lcom/momo/xeengine/L/SDKLicenseManager;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v4

    .line 34
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    const-string v4, "K3sRVijq0qar6xWICc9PPA=="

    .line 42
    .line 43
    invoke-static {v3, v4}, Lcom/momo/xeengine/L/AESUtil;->encrypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 48
    .line 49
    .line 50
    const-string v2, "appId"

    .line 51
    .line 52
    iget-object v3, p0, Lcom/momo/xeengine/L/SDKLicenseManager$LicenseRequestTask;->this$0:Lcom/momo/xeengine/L/SDKLicenseManager;

    .line 53
    .line 54
    invoke-static {v3}, Lcom/momo/xeengine/L/SDKLicenseManager;->access$300(Lcom/momo/xeengine/L/SDKLicenseManager;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    const-string v2, "UTF-8"

    .line 66
    .line 67
    invoke-virtual {v1, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    new-instance v2, Ljava/net/URL;

    .line 72
    .line 73
    const-string v3, "https://melon-gateway-os.immomo.com/cosmos_middleware/gift/getResource"

    .line 74
    .line 75
    invoke-direct {v2, v3}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v2}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    check-cast v2, Ljava/net/HttpURLConnection;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 83
    .line 84
    :try_start_1
    const-string v0, "POST"

    .line 85
    .line 86
    invoke-virtual {v2, v0}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    const/16 v0, 0x1388

    .line 90
    .line 91
    invoke-virtual {v2, v0}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v2, v0}, Ljava/net/URLConnection;->setReadTimeout(I)V

    .line 95
    .line 96
    .line 97
    const/4 v0, 0x1

    .line 98
    invoke-virtual {v2, v0}, Ljava/net/URLConnection;->setDoOutput(Z)V

    .line 99
    .line 100
    .line 101
    const-string v3, "Content-Type"

    .line 102
    .line 103
    const-string v4, "application/json; charset=UTF-8"

    .line 104
    .line 105
    invoke-virtual {v2, v3, v4}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v2}, Ljava/net/URLConnection;->getOutputStream()Ljava/io/OutputStream;

    .line 109
    .line 110
    .line 111
    move-result-object v3

    .line 112
    invoke-virtual {v3, v1}, Ljava/io/OutputStream;->write([B)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getResponseCode()I

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    const/16 v3, 0xc8

    .line 120
    .line 121
    if-gt v3, v1, :cond_2

    .line 122
    .line 123
    const/16 v3, 0x12c

    .line 124
    .line 125
    if-ge v1, v3, :cond_2

    .line 126
    .line 127
    invoke-virtual {v2}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    new-instance v3, Ljava/io/BufferedReader;

    .line 132
    .line 133
    new-instance v4, Ljava/io/InputStreamReader;

    .line 134
    .line 135
    invoke-direct {v4, v1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 136
    .line 137
    .line 138
    invoke-direct {v3, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 139
    .line 140
    .line 141
    new-instance v4, Ljava/lang/StringBuilder;

    .line 142
    .line 143
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 144
    .line 145
    .line 146
    :goto_0
    invoke-virtual {v3}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v5

    .line 150
    if-eqz v5, :cond_0

    .line 151
    .line 152
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    goto :goto_0

    .line 156
    :catchall_0
    move-exception p0

    .line 157
    move-object v0, v2

    .line 158
    goto :goto_2

    .line 159
    :catch_0
    move-object v0, v2

    .line 160
    goto :goto_3

    .line 161
    :cond_0
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V

    .line 162
    .line 163
    .line 164
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 165
    .line 166
    .line 167
    new-instance v1, Lorg/json/JSONObject;

    .line 168
    .line 169
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v3

    .line 173
    invoke-direct {v1, v3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 174
    .line 175
    .line 176
    invoke-static {v1}, Lcom/momo/xeengine/L/ConfigResponse;->fromJson(Lorg/json/JSONObject;)Lcom/momo/xeengine/L/ConfigResponse;

    .line 177
    .line 178
    .line 179
    move-result-object v1

    .line 180
    invoke-virtual {v1}, Lcom/momo/xeengine/L/ConfigResponse;->getEc()I

    .line 181
    .line 182
    .line 183
    move-result v3

    .line 184
    if-nez v3, :cond_2

    .line 185
    .line 186
    invoke-virtual {v1}, Lcom/momo/xeengine/L/ConfigResponse;->getData()Lcom/momo/xeengine/L/ConfigResponse$Config;

    .line 187
    .line 188
    .line 189
    move-result-object v3

    .line 190
    if-eqz v3, :cond_2

    .line 191
    .line 192
    invoke-virtual {v1}, Lcom/momo/xeengine/L/ConfigResponse;->getData()Lcom/momo/xeengine/L/ConfigResponse$Config;

    .line 193
    .line 194
    .line 195
    move-result-object v1

    .line 196
    invoke-virtual {v1}, Lcom/momo/xeengine/L/ConfigResponse$Config;->getExpireTime()J

    .line 197
    .line 198
    .line 199
    move-result-wide v3

    .line 200
    iget-object p0, p0, Lcom/momo/xeengine/L/SDKLicenseManager$LicenseRequestTask;->this$0:Lcom/momo/xeengine/L/SDKLicenseManager;

    .line 201
    .line 202
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 203
    .line 204
    .line 205
    move-result-wide v5

    .line 206
    cmp-long v1, v5, v3

    .line 207
    .line 208
    if-gez v1, :cond_1

    .line 209
    .line 210
    goto :goto_1

    .line 211
    :cond_1
    const/4 v0, 0x0

    .line 212
    :goto_1
    invoke-static {p0, v0}, Lcom/momo/xeengine/L/SDKLicenseManager;->access$500(Lcom/momo/xeengine/L/SDKLicenseManager;Z)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 213
    .line 214
    .line 215
    :cond_2
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 216
    .line 217
    .line 218
    return-void

    .line 219
    :catchall_1
    move-exception p0

    .line 220
    :goto_2
    if-eqz v0, :cond_3

    .line 221
    .line 222
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 223
    .line 224
    .line 225
    :cond_3
    throw p0

    .line 226
    :catch_1
    :goto_3
    if-eqz v0, :cond_4

    .line 227
    .line 228
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 229
    .line 230
    .line 231
    :cond_4
    return-void
.end method
