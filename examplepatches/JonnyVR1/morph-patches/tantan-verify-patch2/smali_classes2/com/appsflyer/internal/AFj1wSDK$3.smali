.class final Lcom/appsflyer/internal/AFj1wSDK$3;
.super Lcom/appsflyer/internal/AFc1cSDK;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/appsflyer/internal/AFj1wSDK;->getMonetizationNetwork(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/appsflyer/internal/AFc1cSDK<",
        "Ljava/util/Map<",
        "Ljava/lang/String;",
        "Ljava/lang/Object;",
        ">;>;"
    }
.end annotation


# instance fields
.field private synthetic getCurrencyIso4217Code:Lcom/appsflyer/internal/AFj1wSDK;


# direct methods
.method public varargs constructor <init>(Lcom/appsflyer/internal/AFj1wSDK;Landroid/content/Context;Lcom/appsflyer/internal/AFd1fSDK;Ljava/lang/String;[Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/appsflyer/internal/AFj1wSDK$3;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFj1wSDK;

    .line 2
    .line 3
    invoke-direct {p0, p2, p3, p4, p5}, Lcom/appsflyer/internal/AFc1cSDK;-><init>(Landroid/content/Context;Lcom/appsflyer/internal/AFd1fSDK;Ljava/lang/String;[Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private static D_(Ljava/lang/String;Ljava/util/Map;Landroid/database/Cursor;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Landroid/database/Cursor;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-interface {p2, p0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, -0x1

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    invoke-interface {p2, v0}, Landroid/database/Cursor;->getLong(I)J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    const-wide/16 v2, 0x0

    .line 14
    .line 15
    cmp-long p2, v0, v2

    .line 16
    .line 17
    if-nez p2, :cond_1

    .line 18
    .line 19
    :goto_0
    return-void

    .line 20
    :cond_1
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    invoke-interface {p1, p0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method private static E_(Ljava/lang/String;Ljava/util/Map;Landroid/database/Cursor;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Landroid/database/Cursor;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-interface {p2, p0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, -0x1

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    invoke-interface {p2, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    if-nez p2, :cond_1

    .line 14
    .line 15
    :goto_0
    return-void

    .line 16
    :cond_1
    invoke-interface {p1, p0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private getCurrencyIso4217Code()Ljava/util/Map;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v1, "FEATURE_NOT_SUPPORTED"

    .line 2
    .line 3
    const-string v2, "response"

    .line 4
    .line 5
    const/4 v3, 0x0

    .line 6
    :try_start_0
    iget-object v0, p0, Lcom/appsflyer/internal/AFc1cSDK;->getMediationNetwork:Landroid/content/Context;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 9
    .line 10
    .line 11
    move-result-object v4

    .line 12
    new-instance v0, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    const-string v5, "content://"

    .line 15
    .line 16
    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iget-object v5, p0, Lcom/appsflyer/internal/AFc1cSDK;->AFAdRevenueData:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 29
    .line 30
    .line 31
    move-result-object v5

    .line 32
    const/4 v8, 0x0

    .line 33
    const/4 v9, 0x0

    .line 34
    const/4 v6, 0x0

    .line 35
    const/4 v7, 0x0

    .line 36
    invoke-virtual/range {v4 .. v9}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    if-eqz v3, :cond_2

    .line 41
    .line 42
    invoke-interface {v3}, Landroid/database/Cursor;->moveToFirst()Z

    .line 43
    .line 44
    .line 45
    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 46
    iget-object v4, p0, Lcom/appsflyer/internal/AFj1wSDK$3;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFj1wSDK;

    .line 47
    .line 48
    if-eqz v0, :cond_1

    .line 49
    .line 50
    :try_start_1
    iget-object v0, v4, Lcom/appsflyer/internal/AFj1zSDK;->getMediationNetwork:Ljava/util/Map;

    .line 51
    .line 52
    const-string v4, "OK"

    .line 53
    .line 54
    invoke-interface {v0, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    const-string v0, "referrer"

    .line 58
    .line 59
    iget-object v4, p0, Lcom/appsflyer/internal/AFj1wSDK$3;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFj1wSDK;

    .line 60
    .line 61
    iget-object v4, v4, Lcom/appsflyer/internal/AFj1zSDK;->getMediationNetwork:Ljava/util/Map;

    .line 62
    .line 63
    invoke-static {v0, v4, v3}, Lcom/appsflyer/internal/AFj1wSDK$3;->E_(Ljava/lang/String;Ljava/util/Map;Landroid/database/Cursor;)V

    .line 64
    .line 65
    .line 66
    const-string v0, "click_ts"

    .line 67
    .line 68
    iget-object v4, p0, Lcom/appsflyer/internal/AFj1wSDK$3;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFj1wSDK;

    .line 69
    .line 70
    iget-object v4, v4, Lcom/appsflyer/internal/AFj1zSDK;->getMediationNetwork:Ljava/util/Map;

    .line 71
    .line 72
    invoke-static {v0, v4, v3}, Lcom/appsflyer/internal/AFj1wSDK$3;->D_(Ljava/lang/String;Ljava/util/Map;Landroid/database/Cursor;)V

    .line 73
    .line 74
    .line 75
    const-string v0, "install_begin_ts"

    .line 76
    .line 77
    iget-object v4, p0, Lcom/appsflyer/internal/AFj1wSDK$3;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFj1wSDK;

    .line 78
    .line 79
    iget-object v4, v4, Lcom/appsflyer/internal/AFj1zSDK;->getMediationNetwork:Ljava/util/Map;

    .line 80
    .line 81
    invoke-static {v0, v4, v3}, Lcom/appsflyer/internal/AFj1wSDK$3;->D_(Ljava/lang/String;Ljava/util/Map;Landroid/database/Cursor;)V

    .line 82
    .line 83
    .line 84
    const-string v0, "install_end_ts"

    .line 85
    .line 86
    iget-object v4, p0, Lcom/appsflyer/internal/AFj1wSDK$3;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFj1wSDK;

    .line 87
    .line 88
    iget-object v4, v4, Lcom/appsflyer/internal/AFj1zSDK;->getMediationNetwork:Ljava/util/Map;

    .line 89
    .line 90
    invoke-static {v0, v4, v3}, Lcom/appsflyer/internal/AFj1wSDK$3;->D_(Ljava/lang/String;Ljava/util/Map;Landroid/database/Cursor;)V

    .line 91
    .line 92
    .line 93
    const-string v0, "organic_keywords"

    .line 94
    .line 95
    iget-object v4, p0, Lcom/appsflyer/internal/AFj1wSDK$3;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFj1wSDK;

    .line 96
    .line 97
    iget-object v4, v4, Lcom/appsflyer/internal/AFj1zSDK;->getMediationNetwork:Ljava/util/Map;

    .line 98
    .line 99
    invoke-static {v0, v4, v3}, Lcom/appsflyer/internal/AFj1wSDK$3;->E_(Ljava/lang/String;Ljava/util/Map;Landroid/database/Cursor;)V

    .line 100
    .line 101
    .line 102
    const-string v0, "attr_type"

    .line 103
    .line 104
    iget-object v4, p0, Lcom/appsflyer/internal/AFj1wSDK$3;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFj1wSDK;

    .line 105
    .line 106
    iget-object v4, v4, Lcom/appsflyer/internal/AFj1zSDK;->getMediationNetwork:Ljava/util/Map;

    .line 107
    .line 108
    invoke-static {v0, v4, v3}, Lcom/appsflyer/internal/AFj1wSDK$3;->E_(Ljava/lang/String;Ljava/util/Map;Landroid/database/Cursor;)V

    .line 109
    .line 110
    .line 111
    new-instance v0, Ljava/util/HashMap;

    .line 112
    .line 113
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 114
    .line 115
    .line 116
    const-string v4, "instant"

    .line 117
    .line 118
    invoke-interface {v3, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    .line 119
    .line 120
    .line 121
    move-result v5

    .line 122
    const/4 v6, -0x1

    .line 123
    if-eq v5, v6, :cond_0

    .line 124
    .line 125
    invoke-interface {v3, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v5

    .line 129
    if-eqz v5, :cond_0

    .line 130
    .line 131
    invoke-static {v5}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    .line 132
    .line 133
    .line 134
    move-result v5

    .line 135
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 136
    .line 137
    .line 138
    move-result-object v5

    .line 139
    invoke-interface {v0, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    goto :goto_0

    .line 143
    :catchall_0
    move-exception v0

    .line 144
    move-object p0, v0

    .line 145
    goto/16 :goto_5

    .line 146
    .line 147
    :catch_0
    move-exception v0

    .line 148
    goto :goto_3

    .line 149
    :cond_0
    :goto_0
    const-string v4, "click_server_ts"

    .line 150
    .line 151
    invoke-static {v4, v0, v3}, Lcom/appsflyer/internal/AFj1wSDK$3;->D_(Ljava/lang/String;Ljava/util/Map;Landroid/database/Cursor;)V

    .line 152
    .line 153
    .line 154
    const-string v4, "install_begin_server_ts"

    .line 155
    .line 156
    invoke-static {v4, v0, v3}, Lcom/appsflyer/internal/AFj1wSDK$3;->D_(Ljava/lang/String;Ljava/util/Map;Landroid/database/Cursor;)V

    .line 157
    .line 158
    .line 159
    const-string v4, "install_version"

    .line 160
    .line 161
    invoke-static {v4, v0, v3}, Lcom/appsflyer/internal/AFj1wSDK$3;->E_(Ljava/lang/String;Ljava/util/Map;Landroid/database/Cursor;)V

    .line 162
    .line 163
    .line 164
    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    .line 165
    .line 166
    .line 167
    move-result v4

    .line 168
    if-nez v4, :cond_3

    .line 169
    .line 170
    iget-object v4, p0, Lcom/appsflyer/internal/AFj1wSDK$3;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFj1wSDK;

    .line 171
    .line 172
    iget-object v4, v4, Lcom/appsflyer/internal/AFj1zSDK;->getMediationNetwork:Ljava/util/Map;

    .line 173
    .line 174
    const-string v5, "custom"

    .line 175
    .line 176
    invoke-interface {v4, v5, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 177
    .line 178
    .line 179
    goto :goto_1

    .line 180
    :cond_1
    iget-object v0, v4, Lcom/appsflyer/internal/AFj1zSDK;->getMediationNetwork:Ljava/util/Map;

    .line 181
    .line 182
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 183
    .line 184
    .line 185
    goto :goto_1

    .line 186
    :cond_2
    iget-object v0, p0, Lcom/appsflyer/internal/AFj1wSDK$3;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFj1wSDK;

    .line 187
    .line 188
    iget-object v0, v0, Lcom/appsflyer/internal/AFj1zSDK;->getMediationNetwork:Ljava/util/Map;

    .line 189
    .line 190
    const-string v4, "SERVICE_UNAVAILABLE"

    .line 191
    .line 192
    invoke-interface {v0, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 193
    .line 194
    .line 195
    :cond_3
    :goto_1
    if-eqz v3, :cond_4

    .line 196
    .line 197
    :goto_2
    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    .line 198
    .line 199
    .line 200
    goto :goto_4

    .line 201
    :goto_3
    :try_start_2
    iget-object v4, p0, Lcom/appsflyer/internal/AFj1wSDK$3;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFj1wSDK;

    .line 202
    .line 203
    iget-object v4, v4, Lcom/appsflyer/internal/AFj1zSDK;->getMediationNetwork:Ljava/util/Map;

    .line 204
    .line 205
    invoke-interface {v4, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 206
    .line 207
    .line 208
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v1

    .line 212
    const/4 v2, 0x0

    .line 213
    const/4 v4, 0x1

    .line 214
    invoke-static {v1, v0, v2, v4}, Lcom/appsflyer/AFLogger;->afErrorLog(Ljava/lang/String;Ljava/lang/Throwable;ZZ)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 215
    .line 216
    .line 217
    if-eqz v3, :cond_4

    .line 218
    .line 219
    goto :goto_2

    .line 220
    :cond_4
    :goto_4
    iget-object v0, p0, Lcom/appsflyer/internal/AFc1cSDK;->getMediationNetwork:Landroid/content/Context;

    .line 221
    .line 222
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 223
    .line 224
    .line 225
    move-result-object v0

    .line 226
    iget-object v1, p0, Lcom/appsflyer/internal/AFc1cSDK;->AFAdRevenueData:Ljava/lang/String;

    .line 227
    .line 228
    const/16 v2, 0x80

    .line 229
    .line 230
    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->resolveContentProvider(Ljava/lang/String;I)Landroid/content/pm/ProviderInfo;

    .line 231
    .line 232
    .line 233
    move-result-object v0

    .line 234
    iget-object v0, v0, Landroid/content/pm/PackageItemInfo;->packageName:Ljava/lang/String;

    .line 235
    .line 236
    iget-object v1, p0, Lcom/appsflyer/internal/AFj1wSDK$3;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFj1wSDK;

    .line 237
    .line 238
    iget-object v1, v1, Lcom/appsflyer/internal/AFj1zSDK;->getMediationNetwork:Ljava/util/Map;

    .line 239
    .line 240
    iget-object v2, p0, Lcom/appsflyer/internal/AFc1cSDK;->getMediationNetwork:Landroid/content/Context;

    .line 241
    .line 242
    invoke-static {v2, v0}, Lcom/appsflyer/internal/AFb1vSDK;->getRevenue(Landroid/content/Context;Ljava/lang/String;)J

    .line 243
    .line 244
    .line 245
    move-result-wide v2

    .line 246
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 247
    .line 248
    .line 249
    move-result-object v2

    .line 250
    const-string v3, "api_ver"

    .line 251
    .line 252
    invoke-interface {v1, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 253
    .line 254
    .line 255
    iget-object v1, p0, Lcom/appsflyer/internal/AFj1wSDK$3;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFj1wSDK;

    .line 256
    .line 257
    iget-object v1, v1, Lcom/appsflyer/internal/AFj1zSDK;->getMediationNetwork:Ljava/util/Map;

    .line 258
    .line 259
    iget-object v2, p0, Lcom/appsflyer/internal/AFc1cSDK;->getMediationNetwork:Landroid/content/Context;

    .line 260
    .line 261
    invoke-static {v2, v0}, Lcom/appsflyer/internal/AFb1vSDK;->getMonetizationNetwork(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 262
    .line 263
    .line 264
    move-result-object v0

    .line 265
    const-string v2, "api_ver_name"

    .line 266
    .line 267
    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 268
    .line 269
    .line 270
    iget-object v0, p0, Lcom/appsflyer/internal/AFj1wSDK$3;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFj1wSDK;

    .line 271
    .line 272
    invoke-virtual {v0}, Lcom/appsflyer/internal/AFj1zSDK;->AFAdRevenueData()V

    .line 273
    .line 274
    .line 275
    iget-object p0, p0, Lcom/appsflyer/internal/AFj1wSDK$3;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFj1wSDK;

    .line 276
    .line 277
    iget-object p0, p0, Lcom/appsflyer/internal/AFj1zSDK;->getMediationNetwork:Ljava/util/Map;

    .line 278
    .line 279
    return-object p0

    .line 280
    :goto_5
    if-eqz v3, :cond_5

    .line 281
    .line 282
    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    .line 283
    .line 284
    .line 285
    :cond_5
    throw p0
.end method


# virtual methods
.method public final synthetic getMonetizationNetwork()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/appsflyer/internal/AFj1wSDK$3;->getCurrencyIso4217Code()Ljava/util/Map;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
