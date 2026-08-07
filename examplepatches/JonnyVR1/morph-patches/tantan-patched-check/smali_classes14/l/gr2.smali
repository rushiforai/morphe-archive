.class public abstract Ll/gr2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/v4m;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/v4m<",
        "Lcom/tantanapp/common/network/NetworkTrackInfo;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/net/wifi/WifiManager;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 5
    .line 6
    const-string v1, "wifi"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Landroid/net/wifi/WifiManager;

    .line 13
    .line 14
    iput-object v0, p0, Ll/gr2;->a:Landroid/net/wifi/WifiManager;

    .line 15
    .line 16
    return-void
.end method

.method public static b(Lokhttp3/Protocol;)Ljava/lang/String;
    .locals 2

    .line 1
    if-eqz p0, :cond_2

    .line 2
    .line 3
    sget-object v0, Ll/gr2$a;->a:[I

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    aget v0, v0, v1

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    if-eq v0, v1, :cond_1

    .line 13
    .line 14
    const/4 v1, 0x2

    .line 15
    if-eq v0, v1, :cond_1

    .line 16
    .line 17
    const/4 v1, 0x3

    .line 18
    if-eq v0, v1, :cond_1

    .line 19
    .line 20
    const/4 p0, 0x4

    .line 21
    if-eq v0, p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x5

    .line 24
    if-eq v0, p0, :cond_0

    .line 25
    .line 26
    const-string p0, "unknown"

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_0
    const-string p0, "http/2.0"

    .line 30
    .line 31
    return-object p0

    .line 32
    :cond_1
    invoke-virtual {p0}, Lokhttp3/Protocol;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0

    .line 37
    :cond_2
    const-string p0, "-"

    .line 38
    .line 39
    return-object p0
.end method


# virtual methods
.method public bridge synthetic a(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/tantanapp/common/network/NetworkTrackInfo;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/gr2;->d(Lcom/tantanapp/common/network/NetworkTrackInfo;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final c(Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object p0, Ll/uqb0;->K:Ll/hfj0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/hfj0;->e(Ljava/util/Map;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public d(Lcom/tantanapp/common/network/NetworkTrackInfo;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/tantanapp/common/network/NetworkTrackInfo;->isCancel()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ll/li20;->g()Ll/li20;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0, p1}, Ll/li20;->d(Lcom/tantanapp/common/network/NetworkTrackInfo;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ll/gr2;->e(Lcom/tantanapp/common/network/NetworkTrackInfo;)Ljava/util/HashMap;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p1}, Ll/gr2;->c(Ljava/util/Map;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public e(Lcom/tantanapp/common/network/NetworkTrackInfo;)Ljava/util/HashMap;
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantanapp/common/network/NetworkTrackInfo;",
            ")",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 7
    .line 8
    invoke-interface {v0}, Ll/bn5;->signedIn_()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const-string v1, "uid"

    .line 13
    .line 14
    const-string v2, "-"

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 19
    .line 20
    invoke-interface {v0}, Ll/bn5;->userId()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p0, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    invoke-virtual {p0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    :goto_0
    const-string v0, "os"

    .line 32
    .line 33
    const-string v1, "android"

    .line 34
    .line 35
    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    const-string v0, "os_ver"

    .line 39
    .line 40
    sget-object v1, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    const-string v0, "ver"

    .line 46
    .line 47
    sget-object v1, Ll/uqb0;->s:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    if-eqz v0, :cond_1

    .line 57
    .line 58
    const-string v0, ""

    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_1
    const-string v0, "background"

    .line 62
    .line 63
    :goto_1
    const-string v1, "http_client_state"

    .line 64
    .line 65
    invoke-virtual {p0, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    const-string v0, "net"

    .line 69
    .line 70
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->d()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    const-string v0, "op"

    .line 78
    .line 79
    invoke-virtual {p1}, Lcom/tantanapp/common/network/NetworkTrackInfo;->getRequestMethod()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    const-string v0, "url"

    .line 87
    .line 88
    invoke-virtual {p1}, Lcom/tantanapp/common/network/NetworkTrackInfo;->getRequestUrl()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    invoke-static {}, Ll/li20;->g()Ll/li20;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-virtual {p1}, Lcom/tantanapp/common/network/NetworkTrackInfo;->getRequest()Ll/x1d0;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    invoke-virtual {p1}, Lcom/tantanapp/common/network/NetworkTrackInfo;->getReportType()Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;

    .line 104
    .line 105
    .line 106
    move-result-object v3

    .line 107
    invoke-virtual {v3}, Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;->getTypeStr()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v3

    .line 111
    invoke-virtual {v0, v1, v3}, Ll/li20;->h(Ll/x1d0;Ljava/lang/String;)Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    const-string v1, "type"

    .line 116
    .line 117
    invoke-virtual {p0, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    const-string v0, "code"

    .line 121
    .line 122
    invoke-virtual {p1}, Lcom/tantanapp/common/network/NetworkTrackInfo;->getResponseCode()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    const-string v0, "err"

    .line 130
    .line 131
    invoke-virtual {p1}, Lcom/tantanapp/common/network/NetworkTrackInfo;->getExceptionMessage()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    invoke-virtual {p1}, Lcom/tantanapp/common/network/NetworkTrackInfo;->getThrowable()Ljava/lang/Throwable;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    invoke-static {v0}, Lcom/tantanapp/common/network/NetworkTrackInfo;->getErrCode(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    const-string v1, "err_code"

    .line 147
    .line 148
    invoke-virtual {p0, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    const-string v0, "s_up"

    .line 152
    .line 153
    invoke-virtual {p1}, Lcom/tantanapp/common/network/NetworkTrackInfo;->getRequestSize()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 158
    .line 159
    .line 160
    const-string v0, "s_reqlen"

    .line 161
    .line 162
    invoke-virtual {p1}, Lcom/tantanapp/common/network/NetworkTrackInfo;->getRequestBodySize()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object v1

    .line 166
    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 167
    .line 168
    .line 169
    invoke-virtual {p1}, Lcom/tantanapp/common/network/NetworkTrackInfo;->getRequestTimestamp()J

    .line 170
    .line 171
    .line 172
    move-result-wide v0

    .line 173
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    const-string v1, "request_timestamp"

    .line 178
    .line 179
    invoke-virtual {p0, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 180
    .line 181
    .line 182
    invoke-virtual {p1}, Lcom/tantanapp/common/network/NetworkTrackInfo;->getFinishTime()J

    .line 183
    .line 184
    .line 185
    move-result-wide v0

    .line 186
    invoke-virtual {p1}, Lcom/tantanapp/common/network/NetworkTrackInfo;->getCreateTime()J

    .line 187
    .line 188
    .line 189
    move-result-wide v3

    .line 190
    sub-long/2addr v0, v3

    .line 191
    const-wide/16 v3, 0x0

    .line 192
    .line 193
    invoke-static {v0, v1, v3, v4}, Ljava/lang/Math;->max(JJ)J

    .line 194
    .line 195
    .line 196
    move-result-wide v0

    .line 197
    const-string v5, "t_all"

    .line 198
    .line 199
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    move-result-object v6

    .line 203
    invoke-virtual {p0, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 204
    .line 205
    .line 206
    const-string v5, "rip"

    .line 207
    .line 208
    invoke-virtual {p1}, Lcom/tantanapp/common/network/NetworkTrackInfo;->getConnectIp()Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v6

    .line 212
    invoke-virtual {p0, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 213
    .line 214
    .line 215
    invoke-virtual {p1}, Lcom/tantanapp/common/network/NetworkTrackInfo;->getSecureConnectEndTime()J

    .line 216
    .line 217
    .line 218
    move-result-wide v5

    .line 219
    invoke-virtual {p1}, Lcom/tantanapp/common/network/NetworkTrackInfo;->getSecureConnectStartTime()J

    .line 220
    .line 221
    .line 222
    move-result-wide v7

    .line 223
    sub-long/2addr v5, v7

    .line 224
    invoke-static {v5, v6, v3, v4}, Ljava/lang/Math;->max(JJ)J

    .line 225
    .line 226
    .line 227
    move-result-wide v5

    .line 228
    const-string v7, "t_ssl"

    .line 229
    .line 230
    invoke-static {v5, v6}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 231
    .line 232
    .line 233
    move-result-object v8

    .line 234
    invoke-virtual {p0, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 235
    .line 236
    .line 237
    invoke-virtual {p1}, Lcom/tantanapp/common/network/NetworkTrackInfo;->getConnectEndTime()J

    .line 238
    .line 239
    .line 240
    move-result-wide v7

    .line 241
    invoke-virtual {p1}, Lcom/tantanapp/common/network/NetworkTrackInfo;->getConnectStartTime()J

    .line 242
    .line 243
    .line 244
    move-result-wide v9

    .line 245
    sub-long/2addr v7, v9

    .line 246
    invoke-static {v7, v8, v3, v4}, Ljava/lang/Math;->max(JJ)J

    .line 247
    .line 248
    .line 249
    move-result-wide v7

    .line 250
    invoke-virtual {p1}, Lcom/tantanapp/common/network/NetworkTrackInfo;->getConnectionAcquiredTime()J

    .line 251
    .line 252
    .line 253
    move-result-wide v9

    .line 254
    invoke-virtual {p1}, Lcom/tantanapp/common/network/NetworkTrackInfo;->getCreateTime()J

    .line 255
    .line 256
    .line 257
    move-result-wide v11

    .line 258
    sub-long/2addr v9, v11

    .line 259
    invoke-static {v9, v10, v3, v4}, Ljava/lang/Math;->max(JJ)J

    .line 260
    .line 261
    .line 262
    move-result-wide v9

    .line 263
    sub-long/2addr v7, v5

    .line 264
    invoke-static {v7, v8, v3, v4}, Ljava/lang/Math;->max(JJ)J

    .line 265
    .line 266
    .line 267
    move-result-wide v5

    .line 268
    invoke-static {v5, v6}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 269
    .line 270
    .line 271
    move-result-object v5

    .line 272
    const-string v6, "t_conn"

    .line 273
    .line 274
    invoke-virtual {p0, v6, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 275
    .line 276
    .line 277
    const-string v5, "t_conn_acquired"

    .line 278
    .line 279
    invoke-static {v9, v10}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 280
    .line 281
    .line 282
    move-result-object v6

    .line 283
    invoke-virtual {p0, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 284
    .line 285
    .line 286
    invoke-virtual {p1}, Lcom/tantanapp/common/network/NetworkTrackInfo;->isHttpDns()Z

    .line 287
    .line 288
    .line 289
    move-result v5

    .line 290
    invoke-static {v5}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 291
    .line 292
    .line 293
    move-result-object v5

    .line 294
    const-string v6, "is_httpdns"

    .line 295
    .line 296
    invoke-virtual {p0, v6, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 297
    .line 298
    .line 299
    invoke-virtual {p1}, Lcom/tantanapp/common/network/NetworkTrackInfo;->getDnsEndTime()J

    .line 300
    .line 301
    .line 302
    move-result-wide v5

    .line 303
    invoke-virtual {p1}, Lcom/tantanapp/common/network/NetworkTrackInfo;->getDnsStartTime()J

    .line 304
    .line 305
    .line 306
    move-result-wide v7

    .line 307
    sub-long/2addr v5, v7

    .line 308
    invoke-static {v5, v6, v3, v4}, Ljava/lang/Math;->max(JJ)J

    .line 309
    .line 310
    .line 311
    move-result-wide v5

    .line 312
    invoke-static {v5, v6}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 313
    .line 314
    .line 315
    move-result-object v5

    .line 316
    const-string v6, "t_dns"

    .line 317
    .line 318
    invoke-virtual {p0, v6, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 319
    .line 320
    .line 321
    invoke-virtual {p1}, Lcom/tantanapp/common/network/NetworkTrackInfo;->getResponseHeadersEndTime()J

    .line 322
    .line 323
    .line 324
    move-result-wide v5

    .line 325
    invoke-virtual {p1}, Lcom/tantanapp/common/network/NetworkTrackInfo;->getRequestHeadersEndTime()J

    .line 326
    .line 327
    .line 328
    move-result-wide v7

    .line 329
    sub-long/2addr v5, v7

    .line 330
    invoke-static {v5, v6, v3, v4}, Ljava/lang/Math;->max(JJ)J

    .line 331
    .line 332
    .line 333
    move-result-wide v5

    .line 334
    const-string v7, "t_start"

    .line 335
    .line 336
    invoke-static {v5, v6}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 337
    .line 338
    .line 339
    move-result-object v8

    .line 340
    invoke-virtual {p0, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 341
    .line 342
    .line 343
    invoke-virtual {p1}, Lcom/tantanapp/common/network/NetworkTrackInfo;->getResponse()Ll/i5d0;

    .line 344
    .line 345
    .line 346
    move-result-object v7

    .line 347
    const-string v8, "s_rsplen"

    .line 348
    .line 349
    const-string v9, "s_down"

    .line 350
    .line 351
    const-string v10, "x_id"

    .line 352
    .line 353
    const-string v11, "http_ver"

    .line 354
    .line 355
    if-eqz v7, :cond_3

    .line 356
    .line 357
    invoke-virtual {v7}, Ll/i5d0;->S()Lokhttp3/Protocol;

    .line 358
    .line 359
    .line 360
    move-result-object v12

    .line 361
    invoke-static {v12}, Ll/gr2;->b(Lokhttp3/Protocol;)Ljava/lang/String;

    .line 362
    .line 363
    .line 364
    move-result-object v12

    .line 365
    invoke-virtual {p0, v11, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 366
    .line 367
    .line 368
    const-string v11, "X-B3-Traceid"

    .line 369
    .line 370
    invoke-virtual {v7, v11}, Ll/i5d0;->u(Ljava/lang/String;)Ljava/lang/String;

    .line 371
    .line 372
    .line 373
    move-result-object v11

    .line 374
    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 375
    .line 376
    .line 377
    move-result v12

    .line 378
    if-eqz v12, :cond_2

    .line 379
    .line 380
    move-object v11, v2

    .line 381
    :cond_2
    invoke-virtual {p0, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 382
    .line 383
    .line 384
    invoke-virtual {p1}, Lcom/tantanapp/common/network/NetworkTrackInfo;->getResponseBodyByteCount()J

    .line 385
    .line 386
    .line 387
    move-result-wide v10

    .line 388
    invoke-static {v10, v11}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 389
    .line 390
    .line 391
    move-result-object v10

    .line 392
    invoke-virtual {p0, v9, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 393
    .line 394
    .line 395
    invoke-virtual {p1}, Lcom/tantanapp/common/network/NetworkTrackInfo;->getResponseBodyByteCount()J

    .line 396
    .line 397
    .line 398
    move-result-wide v9

    .line 399
    invoke-virtual {v7}, Ll/i5d0;->F()Ll/e0l;

    .line 400
    .line 401
    .line 402
    move-result-object v7

    .line 403
    invoke-virtual {v7}, Ll/e0l;->a()J

    .line 404
    .line 405
    .line 406
    move-result-wide v11

    .line 407
    sub-long/2addr v9, v11

    .line 408
    invoke-static {v9, v10, v3, v4}, Ljava/lang/Math;->max(JJ)J

    .line 409
    .line 410
    .line 411
    move-result-wide v9

    .line 412
    invoke-static {v9, v10}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 413
    .line 414
    .line 415
    move-result-object v7

    .line 416
    invoke-virtual {p0, v8, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 417
    .line 418
    .line 419
    goto :goto_2

    .line 420
    :cond_3
    invoke-virtual {p0, v11, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 421
    .line 422
    .line 423
    invoke-virtual {p0, v10, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 424
    .line 425
    .line 426
    invoke-virtual {p0, v9, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 427
    .line 428
    .line 429
    invoke-virtual {p0, v8, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 430
    .line 431
    .line 432
    :goto_2
    invoke-virtual {p1}, Lcom/tantanapp/common/network/NetworkTrackInfo;->getTlsVersion()Lokhttp3/TlsVersion;

    .line 433
    .line 434
    .line 435
    move-result-object v7

    .line 436
    const-string v8, "tls_ver"

    .line 437
    .line 438
    if-eqz v7, :cond_4

    .line 439
    .line 440
    invoke-virtual {p1}, Lcom/tantanapp/common/network/NetworkTrackInfo;->getTlsVersion()Lokhttp3/TlsVersion;

    .line 441
    .line 442
    .line 443
    move-result-object v2

    .line 444
    invoke-virtual {v2}, Lokhttp3/TlsVersion;->javaName()Ljava/lang/String;

    .line 445
    .line 446
    .line 447
    move-result-object v2

    .line 448
    invoke-virtual {p0, v8, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 449
    .line 450
    .line 451
    goto :goto_3

    .line 452
    :cond_4
    invoke-virtual {p0, v8, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 453
    .line 454
    .line 455
    :goto_3
    sub-long/2addr v0, v5

    .line 456
    invoke-static {v0, v1, v3, v4}, Ljava/lang/Math;->max(JJ)J

    .line 457
    .line 458
    .line 459
    move-result-wide v0

    .line 460
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 461
    .line 462
    .line 463
    move-result-object v0

    .line 464
    const-string v1, "t_rsp"

    .line 465
    .line 466
    invoke-virtual {p0, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 467
    .line 468
    .line 469
    invoke-virtual {p1}, Lcom/tantanapp/common/network/NetworkTrackInfo;->getResponseBodyEndTime()J

    .line 470
    .line 471
    .line 472
    move-result-wide v0

    .line 473
    invoke-virtual {p1}, Lcom/tantanapp/common/network/NetworkTrackInfo;->getResponseBodyStartTime()J

    .line 474
    .line 475
    .line 476
    move-result-wide v5

    .line 477
    sub-long/2addr v0, v5

    .line 478
    invoke-static {v0, v1, v3, v4}, Ljava/lang/Math;->max(JJ)J

    .line 479
    .line 480
    .line 481
    move-result-wide v0

    .line 482
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 483
    .line 484
    .line 485
    move-result-object p1

    .line 486
    const-string v0, "t_req"

    .line 487
    .line 488
    invoke-virtual {p0, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 489
    .line 490
    .line 491
    invoke-static {}, Lcom/tantanapp/common/network/NetworkTrackInfo;->ifProxyExist()Z

    .line 492
    .line 493
    .line 494
    move-result p1

    .line 495
    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 496
    .line 497
    .line 498
    move-result-object p1

    .line 499
    const-string v0, "is_proxy"

    .line 500
    .line 501
    invoke-virtual {p0, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 502
    .line 503
    .line 504
    return-object p0
.end method
