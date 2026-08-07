.class public final Lcom/appsflyer/internal/AFi1cSDK;
.super Lcom/appsflyer/internal/AFi1hSDK;
.source "SourceFile"


# instance fields
.field private final AFAdRevenueData:Lcom/appsflyer/internal/AFd1fSDK;

.field private final getCurrencyIso4217Code:Lcom/appsflyer/internal/AFi1fSDK;


# direct methods
.method public constructor <init>(Ljava/lang/Runnable;Lcom/appsflyer/internal/AFd1fSDK;Lcom/appsflyer/internal/AFi1fSDK;)V
    .locals 3

    .line 1
    const-string v0, "huawei"

    .line 2
    .line 3
    invoke-interface {p2}, Lcom/appsflyer/internal/AFd1fSDK;->getMediationNetwork()Lcom/appsflyer/internal/AFd1pSDK;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const-string v2, "store"

    .line 8
    .line 9
    invoke-direct {p0, v2, v0, v1, p1}, Lcom/appsflyer/internal/AFi1hSDK;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/appsflyer/internal/AFd1pSDK;Ljava/lang/Runnable;)V

    .line 10
    .line 11
    .line 12
    iput-object p2, p0, Lcom/appsflyer/internal/AFi1cSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFd1fSDK;

    .line 13
    .line 14
    iput-object p3, p0, Lcom/appsflyer/internal/AFi1cSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFi1fSDK;

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic a(Lcom/appsflyer/internal/AFi1cSDK;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/appsflyer/internal/AFi1cSDK;->getRevenue(Landroid/content/Context;)V

    return-void
.end method

.method private getMediationNetwork(Landroid/content/Context;)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFi1hSDK;->getMonetizationNetwork()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    sget-object p0, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    .line 9
    .line 10
    sget-object p1, Lcom/appsflyer/internal/AFg1cSDK;->toString:Lcom/appsflyer/internal/AFg1cSDK;

    .line 11
    .line 12
    const-string v0, "Huawei referrer collection disallowed by counter."

    .line 13
    .line 14
    invoke-virtual {p0, p1, v0}, Lcom/appsflyer/internal/AFh1ySDK;->d(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return v1

    .line 18
    :cond_0
    iget-object v0, p0, Lcom/appsflyer/internal/AFi1cSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFi1fSDK;

    .line 19
    .line 20
    invoke-interface {v0, p1}, Lcom/appsflyer/internal/AFi1fSDK;->getMediationNetwork(Landroid/content/Context;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_1

    .line 25
    .line 26
    sget-object p0, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    .line 27
    .line 28
    sget-object p1, Lcom/appsflyer/internal/AFg1cSDK;->toString:Lcom/appsflyer/internal/AFg1cSDK;

    .line 29
    .line 30
    const-string v0, "Huawei referrer collection disallowed by missing content provider."

    .line 31
    .line 32
    invoke-virtual {p0, p1, v0}, Lcom/appsflyer/internal/AFh1ySDK;->d(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return v1

    .line 36
    :cond_1
    iget-object p0, p0, Lcom/appsflyer/internal/AFi1cSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFi1fSDK;

    .line 37
    .line 38
    invoke-interface {p0, p1}, Lcom/appsflyer/internal/AFi1fSDK;->getRevenue(Landroid/content/Context;)Z

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    if-nez p0, :cond_2

    .line 43
    .line 44
    sget-object p0, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    .line 45
    .line 46
    sget-object p1, Lcom/appsflyer/internal/AFg1cSDK;->toString:Lcom/appsflyer/internal/AFg1cSDK;

    .line 47
    .line 48
    const-string v0, "Huawei referrer collection disallowed by invalid content provider."

    .line 49
    .line 50
    invoke-virtual {p0, p1, v0}, Lcom/appsflyer/internal/AFh1ySDK;->d(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    return v1

    .line 54
    :cond_2
    const/4 p0, 0x1

    .line 55
    return p0
.end method

.method private synthetic getRevenue(Landroid/content/Context;)V
    .locals 10

    .line 1
    const-string v1, "FEATURE_NOT_SUPPORTED"

    .line 2
    .line 3
    const-string v2, "response"

    .line 4
    .line 5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 6
    .line 7
    .line 8
    move-result-wide v3

    .line 9
    iput-wide v3, p0, Lcom/appsflyer/internal/AFj1zSDK;->component4:J

    .line 10
    .line 11
    sget-object v0, Lcom/appsflyer/internal/AFj1zSDK$AFa1zSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFj1zSDK$AFa1zSDK;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/appsflyer/internal/AFj1zSDK;->component3:Lcom/appsflyer/internal/AFj1zSDK$AFa1zSDK;

    .line 14
    .line 15
    new-instance v0, Lcom/appsflyer/internal/AFj1zSDK$4;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Lcom/appsflyer/internal/AFj1zSDK$4;-><init>(Lcom/appsflyer/internal/AFj1zSDK;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ljava/util/Observable;->addObserver(Ljava/util/Observer;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v3, "com.huawei.appmarket.commondata"

    .line 28
    .line 29
    const/16 v4, 0x80

    .line 30
    .line 31
    invoke-virtual {v0, v3, v4}, Landroid/content/pm/PackageManager;->resolveContentProvider(Ljava/lang/String;I)Landroid/content/pm/ProviderInfo;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iget-object v0, v0, Landroid/content/pm/PackageItemInfo;->packageName:Ljava/lang/String;

    .line 36
    .line 37
    iget-object v3, p0, Lcom/appsflyer/internal/AFj1zSDK;->getMediationNetwork:Ljava/util/Map;

    .line 38
    .line 39
    invoke-static {p1, v0}, Lcom/appsflyer/internal/AFb1vSDK;->getRevenue(Landroid/content/Context;Ljava/lang/String;)J

    .line 40
    .line 41
    .line 42
    move-result-wide v4

    .line 43
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    const-string v5, "api_ver"

    .line 48
    .line 49
    invoke-interface {v3, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    iget-object v3, p0, Lcom/appsflyer/internal/AFj1zSDK;->getMediationNetwork:Ljava/util/Map;

    .line 53
    .line 54
    const-string v4, "api_ver_name"

    .line 55
    .line 56
    invoke-static {p1, v0}, Lcom/appsflyer/internal/AFb1vSDK;->getMonetizationNetwork(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-interface {v3, v4, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    const/4 v3, 0x0

    .line 64
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 65
    .line 66
    .line 67
    move-result-object v4

    .line 68
    const-string v0, "content://com.huawei.appmarket.commondata/item/5"

    .line 69
    .line 70
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 71
    .line 72
    .line 73
    move-result-object v5

    .line 74
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    filled-new-array {p1}, [Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v8

    .line 82
    const/4 v9, 0x0

    .line 83
    const/4 v6, 0x0

    .line 84
    const/4 v7, 0x0

    .line 85
    invoke-virtual/range {v4 .. v9}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 86
    .line 87
    .line 88
    move-result-object v3

    .line 89
    if-eqz v3, :cond_2

    .line 90
    .line 91
    invoke-interface {v3}, Landroid/database/Cursor;->moveToFirst()Z

    .line 92
    .line 93
    .line 94
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 95
    iget-object v0, p0, Lcom/appsflyer/internal/AFj1zSDK;->getMediationNetwork:Ljava/util/Map;

    .line 96
    .line 97
    if-eqz p1, :cond_1

    .line 98
    .line 99
    :try_start_1
    const-string p1, "OK"

    .line 100
    .line 101
    invoke-interface {v0, v2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    iget-object p1, p0, Lcom/appsflyer/internal/AFj1zSDK;->getMediationNetwork:Ljava/util/Map;

    .line 105
    .line 106
    const-string v0, "referrer"

    .line 107
    .line 108
    const/4 v4, 0x0

    .line 109
    invoke-interface {v3, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v4

    .line 113
    invoke-interface {p1, v0, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    iget-object p1, p0, Lcom/appsflyer/internal/AFj1zSDK;->getMediationNetwork:Ljava/util/Map;

    .line 117
    .line 118
    const-string v0, "click_ts"

    .line 119
    .line 120
    const/4 v4, 0x1

    .line 121
    invoke-interface {v3, v4}, Landroid/database/Cursor;->getLong(I)J

    .line 122
    .line 123
    .line 124
    move-result-wide v4

    .line 125
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 126
    .line 127
    .line 128
    move-result-object v4

    .line 129
    invoke-interface {p1, v0, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    iget-object p1, p0, Lcom/appsflyer/internal/AFj1zSDK;->getMediationNetwork:Ljava/util/Map;

    .line 133
    .line 134
    const-string v0, "install_end_ts"

    .line 135
    .line 136
    const/4 v4, 0x2

    .line 137
    invoke-interface {v3, v4}, Landroid/database/Cursor;->getLong(I)J

    .line 138
    .line 139
    .line 140
    move-result-wide v4

    .line 141
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 142
    .line 143
    .line 144
    move-result-object v4

    .line 145
    invoke-interface {p1, v0, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    invoke-interface {v3}, Landroid/database/Cursor;->getColumnCount()I

    .line 149
    .line 150
    .line 151
    move-result p1

    .line 152
    const/4 v0, 0x3

    .line 153
    if-le p1, v0, :cond_3

    .line 154
    .line 155
    iget-object p1, p0, Lcom/appsflyer/internal/AFj1zSDK;->getMediationNetwork:Ljava/util/Map;

    .line 156
    .line 157
    const-string v4, "install_begin_ts"

    .line 158
    .line 159
    invoke-interface {v3, v0}, Landroid/database/Cursor;->getLong(I)J

    .line 160
    .line 161
    .line 162
    move-result-wide v5

    .line 163
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    invoke-interface {p1, v4, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 168
    .line 169
    .line 170
    new-instance p1, Ljava/util/HashMap;

    .line 171
    .line 172
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 173
    .line 174
    .line 175
    const/4 v0, 0x4

    .line 176
    invoke-interface {v3, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    if-eqz v0, :cond_0

    .line 181
    .line 182
    const-string v4, "track_id"

    .line 183
    .line 184
    invoke-virtual {p1, v4, v0}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 185
    .line 186
    .line 187
    goto :goto_0

    .line 188
    :catchall_0
    move-exception v0

    .line 189
    move-object p1, v0

    .line 190
    move-object v7, p1

    .line 191
    goto :goto_3

    .line 192
    :cond_0
    :goto_0
    const-string v0, "referrer_ex"

    .line 193
    .line 194
    const/4 v4, 0x5

    .line 195
    invoke-interface {v3, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object v4

    .line 199
    invoke-virtual {p1, v0, v4}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 200
    .line 201
    .line 202
    iget-object v0, p0, Lcom/appsflyer/internal/AFj1zSDK;->getMediationNetwork:Ljava/util/Map;

    .line 203
    .line 204
    const-string v4, "huawei_custom"

    .line 205
    .line 206
    invoke-interface {v0, v4, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 207
    .line 208
    .line 209
    goto :goto_1

    .line 210
    :cond_1
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 211
    .line 212
    .line 213
    goto :goto_1

    .line 214
    :cond_2
    iget-object p1, p0, Lcom/appsflyer/internal/AFj1zSDK;->getMediationNetwork:Ljava/util/Map;

    .line 215
    .line 216
    const-string v0, "SERVICE_UNAVAILABLE"

    .line 217
    .line 218
    invoke-interface {p1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 219
    .line 220
    .line 221
    :cond_3
    :goto_1
    if-eqz v3, :cond_5

    .line 222
    .line 223
    :goto_2
    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    .line 224
    .line 225
    .line 226
    goto :goto_6

    .line 227
    :goto_3
    :try_start_2
    iget-object p1, p0, Lcom/appsflyer/internal/AFj1zSDK;->getMediationNetwork:Ljava/util/Map;

    .line 228
    .line 229
    invoke-interface {p1, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 230
    .line 231
    .line 232
    sget-object v4, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    .line 233
    .line 234
    sget-object v5, Lcom/appsflyer/internal/AFg1cSDK;->toString:Lcom/appsflyer/internal/AFg1cSDK;

    .line 235
    .line 236
    invoke-virtual {v7}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 237
    .line 238
    .line 239
    move-result-object p1

    .line 240
    if-eqz p1, :cond_4

    .line 241
    .line 242
    invoke-virtual {v7}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 243
    .line 244
    .line 245
    move-result-object p1

    .line 246
    :goto_4
    move-object v6, p1

    .line 247
    goto :goto_5

    .line 248
    :catchall_1
    move-exception v0

    .line 249
    move-object p0, v0

    .line 250
    goto :goto_7

    .line 251
    :cond_4
    const-string p1, ""

    .line 252
    .line 253
    goto :goto_4

    .line 254
    :goto_5
    const/4 v8, 0x0

    .line 255
    const/4 v9, 0x1

    .line 256
    invoke-virtual/range {v4 .. v9}, Lcom/appsflyer/internal/AFh1ySDK;->e(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;Ljava/lang/Throwable;ZZ)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 257
    .line 258
    .line 259
    if-eqz v3, :cond_5

    .line 260
    .line 261
    goto :goto_2

    .line 262
    :cond_5
    :goto_6
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFj1zSDK;->AFAdRevenueData()V

    .line 263
    .line 264
    .line 265
    return-void

    .line 266
    :goto_7
    if-eqz v3, :cond_6

    .line 267
    .line 268
    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    .line 269
    .line 270
    .line 271
    :cond_6
    throw p0
.end method


# virtual methods
.method public final getMonetizationNetwork(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lcom/appsflyer/internal/AFi1cSDK;->getMediationNetwork(Landroid/content/Context;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/appsflyer/internal/AFi1cSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFd1fSDK;

    .line 9
    .line 10
    invoke-interface {v0}, Lcom/appsflyer/internal/AFd1fSDK;->AFAdRevenueData()Ljava/util/concurrent/ExecutorService;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Lcom/appsflyer/internal/a0;

    .line 15
    .line 16
    invoke-direct {v1, p0, p1}, Lcom/appsflyer/internal/a0;-><init>(Lcom/appsflyer/internal/AFi1cSDK;Landroid/content/Context;)V

    .line 17
    .line 18
    .line 19
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
