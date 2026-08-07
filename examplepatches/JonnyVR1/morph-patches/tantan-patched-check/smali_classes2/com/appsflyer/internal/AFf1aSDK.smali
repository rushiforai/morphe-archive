.class public final Lcom/appsflyer/internal/AFf1aSDK;
.super Lcom/appsflyer/internal/AFf1wSDK;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/appsflyer/internal/AFf1wSDK<",
        "Lcom/appsflyer/internal/AFg1zSDK;",
        ">;"
    }
.end annotation


# instance fields
.field public areAllFieldsValid:Lcom/appsflyer/internal/AFg1zSDK;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final component1:Lcom/appsflyer/internal/AFg1ySDK;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private final component2:Lcom/appsflyer/internal/AFd1pSDK;

.field private final component3:Lcom/appsflyer/internal/AFg1xSDK;

.field public component4:Lcom/appsflyer/internal/AFh1dSDK;

.field private final copy:Lcom/appsflyer/internal/AFe1sSDK;

.field private final copydefault:Ljava/lang/String;

.field private final equals:Lcom/appsflyer/internal/AFg1vSDK;

.field private final hashCode:Lcom/appsflyer/internal/AFg1rSDK;

.field private final toString:Lcom/appsflyer/internal/AFg1tSDK;


# direct methods
.method public constructor <init>(Lcom/appsflyer/internal/AFg1xSDK;Lcom/appsflyer/internal/AFd1pSDK;Lcom/appsflyer/internal/AFg1rSDK;Lcom/appsflyer/internal/AFg1tSDK;Lcom/appsflyer/internal/AFe1sSDK;Lcom/appsflyer/internal/AFg1vSDK;Ljava/lang/String;Lcom/appsflyer/internal/AFg1ySDK;)V
    .locals 3
    .param p1    # Lcom/appsflyer/internal/AFg1xSDK;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/appsflyer/internal/AFd1pSDK;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Lcom/appsflyer/internal/AFg1rSDK;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Lcom/appsflyer/internal/AFg1tSDK;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p5    # Lcom/appsflyer/internal/AFe1sSDK;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p6    # Lcom/appsflyer/internal/AFg1vSDK;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p7    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p8    # Lcom/appsflyer/internal/AFg1ySDK;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    sget-object v0, Lcom/appsflyer/internal/AFf1zSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFf1zSDK;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    new-array v1, v1, [Lcom/appsflyer/internal/AFf1zSDK;

    .line 5
    .line 6
    const-string v2, "UpdateRemoteConfiguration"

    .line 7
    .line 8
    invoke-direct {p0, v0, v1, v2}, Lcom/appsflyer/internal/AFf1wSDK;-><init>(Lcom/appsflyer/internal/AFf1zSDK;[Lcom/appsflyer/internal/AFf1zSDK;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Lcom/appsflyer/internal/AFf1aSDK;->areAllFieldsValid:Lcom/appsflyer/internal/AFg1zSDK;

    .line 13
    .line 14
    iput-object p1, p0, Lcom/appsflyer/internal/AFf1aSDK;->component3:Lcom/appsflyer/internal/AFg1xSDK;

    .line 15
    .line 16
    iput-object p2, p0, Lcom/appsflyer/internal/AFf1aSDK;->component2:Lcom/appsflyer/internal/AFd1pSDK;

    .line 17
    .line 18
    iput-object p3, p0, Lcom/appsflyer/internal/AFf1aSDK;->hashCode:Lcom/appsflyer/internal/AFg1rSDK;

    .line 19
    .line 20
    iput-object p4, p0, Lcom/appsflyer/internal/AFf1aSDK;->toString:Lcom/appsflyer/internal/AFg1tSDK;

    .line 21
    .line 22
    iput-object p5, p0, Lcom/appsflyer/internal/AFf1aSDK;->copy:Lcom/appsflyer/internal/AFe1sSDK;

    .line 23
    .line 24
    iput-object p6, p0, Lcom/appsflyer/internal/AFf1aSDK;->equals:Lcom/appsflyer/internal/AFg1vSDK;

    .line 25
    .line 26
    iput-object p7, p0, Lcom/appsflyer/internal/AFf1aSDK;->copydefault:Ljava/lang/String;

    .line 27
    .line 28
    iput-object p8, p0, Lcom/appsflyer/internal/AFf1aSDK;->component1:Lcom/appsflyer/internal/AFg1ySDK;

    .line 29
    .line 30
    return-void
.end method

.method private component1()Lcom/appsflyer/internal/AFg1zSDK;
    .locals 19
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/io/InterruptedIOException;
        }
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    const-string v0, " seconds"

    .line 4
    .line 5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 6
    .line 7
    .line 8
    move-result-wide v3

    .line 9
    iget-object v2, v1, Lcom/appsflyer/internal/AFf1aSDK;->copydefault:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v5, v1, Lcom/appsflyer/internal/AFf1aSDK;->hashCode:Lcom/appsflyer/internal/AFg1rSDK;

    .line 12
    .line 13
    iget-object v5, v5, Lcom/appsflyer/internal/AFg1rSDK;->component1:Ljava/lang/String;

    .line 14
    .line 15
    const-string v6, "Dev key is not set, SDK is not started."

    .line 16
    .line 17
    const/4 v8, 0x0

    .line 18
    if-eqz v5, :cond_2

    .line 19
    .line 20
    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v7

    .line 24
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    .line 25
    .line 26
    .line 27
    move-result v7

    .line 28
    if-nez v7, :cond_0

    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_0
    if-nez v2, :cond_1

    .line 32
    .line 33
    sget-object v2, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    .line 34
    .line 35
    sget-object v5, Lcom/appsflyer/internal/AFg1cSDK;->component4:Lcom/appsflyer/internal/AFg1cSDK;

    .line 36
    .line 37
    const-string v7, "Can\'t create CDN token, domain or version is not provided."

    .line 38
    .line 39
    invoke-virtual {v2, v5, v7}, Lcom/appsflyer/internal/AFh1ySDK;->w(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    :goto_0
    move-object v2, v8

    .line 43
    goto :goto_2

    .line 44
    :cond_1
    iget-object v7, v1, Lcom/appsflyer/internal/AFf1aSDK;->component2:Lcom/appsflyer/internal/AFd1pSDK;

    .line 45
    .line 46
    iget-object v7, v7, Lcom/appsflyer/internal/AFd1pSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFd1kSDK;

    .line 47
    .line 48
    iget-object v7, v7, Lcom/appsflyer/internal/AFd1kSDK;->getCurrencyIso4217Code:Landroid/content/Context;

    .line 49
    .line 50
    invoke-virtual {v7}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v7

    .line 54
    const-string v9, "appsflyersdk.com"

    .line 55
    .line 56
    filled-new-array {v9, v2, v7}, [Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    const-string v7, "\u2063"

    .line 61
    .line 62
    invoke-static {v7, v2}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-static {v2, v5}, Lcom/appsflyer/internal/AFb1iSDK;->getMediationNetwork(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    goto :goto_2

    .line 71
    :cond_2
    :goto_1
    sget-object v2, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    .line 72
    .line 73
    sget-object v5, Lcom/appsflyer/internal/AFg1cSDK;->component4:Lcom/appsflyer/internal/AFg1cSDK;

    .line 74
    .line 75
    invoke-virtual {v2, v5, v6}, Lcom/appsflyer/internal/AFh1ySDK;->w(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    goto :goto_0

    .line 79
    :goto_2
    if-nez v2, :cond_3

    .line 80
    .line 81
    sget-object v0, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    .line 82
    .line 83
    sget-object v1, Lcom/appsflyer/internal/AFg1cSDK;->component4:Lcom/appsflyer/internal/AFg1cSDK;

    .line 84
    .line 85
    const-string v2, "can\'t create CDN token, skipping fetch config"

    .line 86
    .line 87
    invoke-virtual {v0, v1, v2}, Lcom/appsflyer/internal/AFh1ySDK;->v(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    sget-object v0, Lcom/appsflyer/internal/AFg1zSDK;->getRevenue:Lcom/appsflyer/internal/AFg1zSDK;

    .line 91
    .line 92
    return-object v0

    .line 93
    :cond_3
    :try_start_0
    iget-object v5, v1, Lcom/appsflyer/internal/AFf1aSDK;->equals:Lcom/appsflyer/internal/AFg1vSDK;

    .line 94
    .line 95
    invoke-virtual {v5}, Lcom/appsflyer/internal/AFg1vSDK;->getMediationNetwork()Z

    .line 96
    .line 97
    .line 98
    move-result v5

    .line 99
    if-eqz v5, :cond_9

    .line 100
    .line 101
    sget-object v9, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    .line 102
    .line 103
    sget-object v10, Lcom/appsflyer/internal/AFg1cSDK;->component4:Lcom/appsflyer/internal/AFg1cSDK;

    .line 104
    .line 105
    const-string v5, "Cached config is expired, updating..."

    .line 106
    .line 107
    invoke-virtual {v9, v10, v5}, Lcom/appsflyer/internal/AFh1ySDK;->i(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    iget-object v5, v1, Lcom/appsflyer/internal/AFf1aSDK;->equals:Lcom/appsflyer/internal/AFg1vSDK;

    .line 111
    .line 112
    invoke-virtual {v5}, Lcom/appsflyer/internal/AFg1vSDK;->getMonetizationNetwork()Z

    .line 113
    .line 114
    .line 115
    move-result v5

    .line 116
    iget-object v7, v1, Lcom/appsflyer/internal/AFf1aSDK;->equals:Lcom/appsflyer/internal/AFg1vSDK;

    .line 117
    .line 118
    invoke-virtual {v7}, Lcom/appsflyer/internal/AFg1vSDK;->AFAdRevenueData()Z

    .line 119
    .line 120
    .line 121
    move-result v7

    .line 122
    iget-object v11, v1, Lcom/appsflyer/internal/AFf1aSDK;->copy:Lcom/appsflyer/internal/AFe1sSDK;

    .line 123
    .line 124
    const/16 v12, 0x5dc

    .line 125
    .line 126
    invoke-virtual {v11, v5, v7, v2, v12}, Lcom/appsflyer/internal/AFe1sSDK;->getMonetizationNetwork(ZZLjava/lang/String;I)Lcom/appsflyer/internal/AFe1rSDK;

    .line 127
    .line 128
    .line 129
    move-result-object v5

    .line 130
    invoke-virtual {v5}, Lcom/appsflyer/internal/AFe1rSDK;->getRevenue()Lcom/appsflyer/internal/AFe1kSDK;

    .line 131
    .line 132
    .line 133
    move-result-object v7

    .line 134
    invoke-virtual {v7}, Lcom/appsflyer/internal/AFe1kSDK;->isSuccessful()Z

    .line 135
    .line 136
    .line 137
    move-result v5

    .line 138
    if-eqz v5, :cond_8

    .line 139
    .line 140
    invoke-virtual {v7}, Lcom/appsflyer/internal/AFe1kSDK;->getBody()Ljava/lang/Object;

    .line 141
    .line 142
    .line 143
    move-result-object v5

    .line 144
    check-cast v5, Lcom/appsflyer/internal/AFh1aSDK;

    .line 145
    .line 146
    const-string v11, "x-amz-meta-af-auth-v1"

    .line 147
    .line 148
    invoke-virtual {v7, v11}, Lcom/appsflyer/internal/AFe1kSDK;->getCurrencyIso4217Code(Ljava/lang/String;)Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v11

    .line 152
    const-string v12, "X-Af-Date"

    .line 153
    .line 154
    invoke-virtual {v7, v12}, Lcom/appsflyer/internal/AFe1kSDK;->getCurrencyIso4217Code(Ljava/lang/String;)Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object v12

    .line 158
    const-string v13, "CF-Cache-Status"

    .line 159
    .line 160
    invoke-virtual {v7, v13}, Lcom/appsflyer/internal/AFe1kSDK;->getCurrencyIso4217Code(Ljava/lang/String;)Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v13

    .line 164
    iget-object v14, v1, Lcom/appsflyer/internal/AFf1aSDK;->hashCode:Lcom/appsflyer/internal/AFg1rSDK;

    .line 165
    .line 166
    iget-object v14, v14, Lcom/appsflyer/internal/AFg1rSDK;->component1:Ljava/lang/String;

    .line 167
    .line 168
    new-instance v15, Lcom/appsflyer/internal/AFg1uSDK;

    .line 169
    .line 170
    invoke-direct {v15}, Lcom/appsflyer/internal/AFg1uSDK;-><init>()V

    .line 171
    .line 172
    .line 173
    invoke-virtual {v15, v12}, Lcom/appsflyer/internal/AFg1uSDK;->getRevenue(Ljava/lang/String;)Z

    .line 174
    .line 175
    .line 176
    move-result v12

    .line 177
    if-eqz v14, :cond_7

    .line 178
    .line 179
    invoke-virtual {v14}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object v15

    .line 183
    invoke-virtual {v15}, Ljava/lang/String;->length()I

    .line 184
    .line 185
    .line 186
    move-result v15

    .line 187
    if-nez v15, :cond_4

    .line 188
    .line 189
    goto/16 :goto_6

    .line 190
    .line 191
    :cond_4
    iget-object v6, v1, Lcom/appsflyer/internal/AFf1aSDK;->component3:Lcom/appsflyer/internal/AFg1xSDK;

    .line 192
    .line 193
    invoke-virtual {v6, v5, v11, v2, v14}, Lcom/appsflyer/internal/AFg1xSDK;->getMonetizationNetwork(Lcom/appsflyer/internal/AFh1aSDK;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/appsflyer/internal/AFi1vSDK;

    .line 194
    .line 195
    .line 196
    move-result-object v6

    .line 197
    invoke-virtual {v6}, Lcom/appsflyer/internal/AFi1vSDK;->AFAdRevenueData()Z

    .line 198
    .line 199
    .line 200
    move-result v11

    .line 201
    if-eqz v11, :cond_6

    .line 202
    .line 203
    if-nez v12, :cond_5

    .line 204
    .line 205
    iget-object v11, v5, Lcom/appsflyer/internal/AFh1aSDK;->getMonetizationNetwork:Lcom/appsflyer/internal/AFh1bSDK;

    .line 206
    .line 207
    if-eqz v11, :cond_5

    .line 208
    .line 209
    iput-object v8, v11, Lcom/appsflyer/internal/AFh1bSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFi1zSDK;

    .line 210
    .line 211
    goto :goto_5

    .line 212
    :catchall_0
    move-exception v0

    .line 213
    :goto_3
    move-object v8, v0

    .line 214
    goto/16 :goto_7

    .line 215
    .line 216
    :catch_0
    move-exception v0

    .line 217
    :goto_4
    move-object v8, v0

    .line 218
    goto/16 :goto_8

    .line 219
    .line 220
    :cond_5
    :goto_5
    iget-object v11, v1, Lcom/appsflyer/internal/AFf1aSDK;->equals:Lcom/appsflyer/internal/AFg1vSDK;

    .line 221
    .line 222
    invoke-virtual {v11}, Lcom/appsflyer/internal/AFg1vSDK;->getCurrencyIso4217Code()J

    .line 223
    .line 224
    .line 225
    move-result-wide v11

    .line 226
    new-instance v14, Ljava/lang/StringBuilder;

    .line 227
    .line 228
    const-string v15, "using max-age fallback: "

    .line 229
    .line 230
    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 231
    .line 232
    .line 233
    invoke-virtual {v14, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 234
    .line 235
    .line 236
    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 237
    .line 238
    .line 239
    invoke-virtual {v14}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 240
    .line 241
    .line 242
    move-result-object v14

    .line 243
    invoke-virtual {v9, v10, v14}, Lcom/appsflyer/internal/AFh1ySDK;->v(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;)V

    .line 244
    .line 245
    .line 246
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 247
    .line 248
    .line 249
    move-result-wide v14

    .line 250
    iget-object v8, v1, Lcom/appsflyer/internal/AFf1aSDK;->toString:Lcom/appsflyer/internal/AFg1tSDK;

    .line 251
    .line 252
    iget-object v1, v5, Lcom/appsflyer/internal/AFh1aSDK;->AFAdRevenueData:Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 253
    .line 254
    move-object/from16 v16, v2

    .line 255
    .line 256
    :try_start_1
    invoke-static {}, Ljava/nio/charset/Charset;->defaultCharset()Ljava/nio/charset/Charset;

    .line 257
    .line 258
    .line 259
    move-result-object v2

    .line 260
    invoke-virtual {v1, v2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 261
    .line 262
    .line 263
    move-result-object v1

    .line 264
    const/4 v2, 0x2

    .line 265
    invoke-static {v1, v2}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    .line 266
    .line 267
    .line 268
    move-result-object v1

    .line 269
    iget-object v2, v8, Lcom/appsflyer/internal/AFg1tSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFd1rSDK;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 270
    .line 271
    move-wide/from16 v17, v3

    .line 272
    .line 273
    :try_start_2
    const-string v3, "af_remote_config"

    .line 274
    .line 275
    invoke-interface {v2, v3, v1}, Lcom/appsflyer/internal/AFd1rSDK;->getRevenue(Ljava/lang/String;Ljava/lang/String;)V

    .line 276
    .line 277
    .line 278
    iget-object v1, v8, Lcom/appsflyer/internal/AFg1tSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFh1aSDK;

    .line 279
    .line 280
    iput-object v1, v8, Lcom/appsflyer/internal/AFg1tSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFh1aSDK;

    .line 281
    .line 282
    iget-object v1, v8, Lcom/appsflyer/internal/AFg1tSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFd1rSDK;

    .line 283
    .line 284
    const-string v2, "af_rc_timestamp"

    .line 285
    .line 286
    invoke-interface {v1, v2, v14, v15}, Lcom/appsflyer/internal/AFd1rSDK;->getRevenue(Ljava/lang/String;J)V

    .line 287
    .line 288
    .line 289
    iget-object v1, v8, Lcom/appsflyer/internal/AFg1tSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFd1rSDK;

    .line 290
    .line 291
    const-string v2, "af_rc_max_age"

    .line 292
    .line 293
    invoke-interface {v1, v2, v11, v12}, Lcom/appsflyer/internal/AFd1rSDK;->getRevenue(Ljava/lang/String;J)V

    .line 294
    .line 295
    .line 296
    iput-object v5, v8, Lcom/appsflyer/internal/AFg1tSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFh1aSDK;

    .line 297
    .line 298
    iput-wide v14, v8, Lcom/appsflyer/internal/AFg1tSDK;->getMonetizationNetwork:J

    .line 299
    .line 300
    iput-wide v11, v8, Lcom/appsflyer/internal/AFg1tSDK;->getRevenue:J

    .line 301
    .line 302
    new-instance v1, Ljava/lang/StringBuilder;

    .line 303
    .line 304
    const-string v2, "Config successfully updated, timeToLive: "

    .line 305
    .line 306
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 307
    .line 308
    .line 309
    invoke-virtual {v1, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 310
    .line 311
    .line 312
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 313
    .line 314
    .line 315
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 316
    .line 317
    .line 318
    move-result-object v0

    .line 319
    invoke-virtual {v9, v10, v0}, Lcom/appsflyer/internal/AFh1ySDK;->d(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;)V

    .line 320
    .line 321
    .line 322
    iget-object v5, v6, Lcom/appsflyer/internal/AFi1vSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFi1uSDK;
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 323
    .line 324
    move-object/from16 v1, p0

    .line 325
    .line 326
    move-object v6, v13

    .line 327
    move-object/from16 v2, v16

    .line 328
    .line 329
    move-wide/from16 v3, v17

    .line 330
    .line 331
    :try_start_3
    invoke-direct/range {v1 .. v7}, Lcom/appsflyer/internal/AFf1aSDK;->getMonetizationNetwork(Ljava/lang/String;JLcom/appsflyer/internal/AFi1uSDK;Ljava/lang/String;Lcom/appsflyer/internal/AFe1kSDK;)V

    .line 332
    .line 333
    .line 334
    sget-object v0, Lcom/appsflyer/internal/AFg1zSDK;->getMonetizationNetwork:Lcom/appsflyer/internal/AFg1zSDK;

    .line 335
    .line 336
    return-object v0

    .line 337
    :catchall_1
    move-exception v0

    .line 338
    move-object/from16 v2, v16

    .line 339
    .line 340
    move-wide/from16 v3, v17

    .line 341
    .line 342
    goto/16 :goto_3

    .line 343
    .line 344
    :catch_1
    move-exception v0

    .line 345
    move-object/from16 v2, v16

    .line 346
    .line 347
    move-wide/from16 v3, v17

    .line 348
    .line 349
    goto/16 :goto_4

    .line 350
    .line 351
    :catchall_2
    move-exception v0

    .line 352
    move-object/from16 v2, v16

    .line 353
    .line 354
    goto/16 :goto_3

    .line 355
    .line 356
    :catch_2
    move-exception v0

    .line 357
    move-object/from16 v2, v16

    .line 358
    .line 359
    goto/16 :goto_4

    .line 360
    .line 361
    :cond_6
    move-object v0, v13

    .line 362
    iget-object v5, v6, Lcom/appsflyer/internal/AFi1vSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFi1uSDK;

    .line 363
    .line 364
    move-object/from16 v1, p0

    .line 365
    .line 366
    move-object v6, v0

    .line 367
    invoke-direct/range {v1 .. v7}, Lcom/appsflyer/internal/AFf1aSDK;->getMonetizationNetwork(Ljava/lang/String;JLcom/appsflyer/internal/AFi1uSDK;Ljava/lang/String;Lcom/appsflyer/internal/AFe1kSDK;)V

    .line 368
    .line 369
    .line 370
    const-string v0, "fetched config is not valid (MITM?) refuse to use it."

    .line 371
    .line 372
    invoke-virtual {v9, v10, v0}, Lcom/appsflyer/internal/AFh1ySDK;->w(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;)V

    .line 373
    .line 374
    .line 375
    sget-object v0, Lcom/appsflyer/internal/AFg1zSDK;->getRevenue:Lcom/appsflyer/internal/AFg1zSDK;

    .line 376
    .line 377
    return-object v0

    .line 378
    :cond_7
    :goto_6
    invoke-virtual {v9, v10, v6}, Lcom/appsflyer/internal/AFh1ySDK;->w(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;)V

    .line 379
    .line 380
    .line 381
    sget-object v0, Lcom/appsflyer/internal/AFg1zSDK;->getRevenue:Lcom/appsflyer/internal/AFg1zSDK;

    .line 382
    .line 383
    return-object v0

    .line 384
    :cond_8
    const/4 v5, 0x0

    .line 385
    const/4 v6, 0x0

    .line 386
    move-object/from16 v1, p0

    .line 387
    .line 388
    invoke-direct/range {v1 .. v7}, Lcom/appsflyer/internal/AFf1aSDK;->getMonetizationNetwork(Ljava/lang/String;JLcom/appsflyer/internal/AFi1uSDK;Ljava/lang/String;Lcom/appsflyer/internal/AFe1kSDK;)V

    .line 389
    .line 390
    .line 391
    new-instance v0, Ljava/lang/StringBuilder;

    .line 392
    .line 393
    const-string v1, "failed to fetch remote config from CDN with status code: "

    .line 394
    .line 395
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 396
    .line 397
    .line 398
    invoke-virtual {v7}, Lcom/appsflyer/internal/AFe1kSDK;->getStatusCode()I

    .line 399
    .line 400
    .line 401
    move-result v1

    .line 402
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 403
    .line 404
    .line 405
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 406
    .line 407
    .line 408
    move-result-object v0

    .line 409
    invoke-virtual {v9, v10, v0}, Lcom/appsflyer/internal/AFh1ySDK;->w(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;)V

    .line 410
    .line 411
    .line 412
    sget-object v0, Lcom/appsflyer/internal/AFg1zSDK;->getRevenue:Lcom/appsflyer/internal/AFg1zSDK;

    .line 413
    .line 414
    return-object v0

    .line 415
    :cond_9
    sget-object v0, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    .line 416
    .line 417
    sget-object v1, Lcom/appsflyer/internal/AFg1cSDK;->component4:Lcom/appsflyer/internal/AFg1cSDK;

    .line 418
    .line 419
    const-string v5, "active config is valid, skipping fetch"

    .line 420
    .line 421
    invoke-virtual {v0, v1, v5}, Lcom/appsflyer/internal/AFh1ySDK;->d(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;)V

    .line 422
    .line 423
    .line 424
    sget-object v0, Lcom/appsflyer/internal/AFg1zSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFg1zSDK;
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 425
    .line 426
    return-object v0

    .line 427
    :goto_7
    sget-object v5, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    .line 428
    .line 429
    sget-object v6, Lcom/appsflyer/internal/AFg1cSDK;->component4:Lcom/appsflyer/internal/AFg1cSDK;

    .line 430
    .line 431
    new-instance v0, Ljava/lang/StringBuilder;

    .line 432
    .line 433
    const-string v1, "failed to update remote config: "

    .line 434
    .line 435
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 436
    .line 437
    .line 438
    invoke-virtual {v8}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 439
    .line 440
    .line 441
    move-result-object v1

    .line 442
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 443
    .line 444
    .line 445
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 446
    .line 447
    .line 448
    move-result-object v7

    .line 449
    const/4 v10, 0x0

    .line 450
    const/4 v11, 0x0

    .line 451
    const/4 v9, 0x1

    .line 452
    invoke-virtual/range {v5 .. v11}, Lcom/appsflyer/internal/AFh1ySDK;->e(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;Ljava/lang/Throwable;ZZZ)V

    .line 453
    .line 454
    .line 455
    const/4 v7, 0x0

    .line 456
    move-object v9, v8

    .line 457
    const/4 v8, 0x0

    .line 458
    const/4 v5, 0x0

    .line 459
    const/4 v6, 0x0

    .line 460
    move-object/from16 v1, p0

    .line 461
    .line 462
    invoke-direct/range {v1 .. v9}, Lcom/appsflyer/internal/AFf1aSDK;->getCurrencyIso4217Code(Ljava/lang/String;JLcom/appsflyer/internal/AFe1kSDK;Lcom/appsflyer/internal/AFh1aSDK;Lcom/appsflyer/internal/AFi1uSDK;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 463
    .line 464
    .line 465
    move-object v8, v9

    .line 466
    invoke-virtual {v8}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 467
    .line 468
    .line 469
    move-result-object v0

    .line 470
    instance-of v0, v0, Ljava/lang/InterruptedException;

    .line 471
    .line 472
    if-nez v0, :cond_a

    .line 473
    .line 474
    sget-object v0, Lcom/appsflyer/internal/AFg1zSDK;->getRevenue:Lcom/appsflyer/internal/AFg1zSDK;

    .line 475
    .line 476
    return-object v0

    .line 477
    :cond_a
    invoke-virtual {v8}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 478
    .line 479
    .line 480
    move-result-object v0

    .line 481
    check-cast v0, Ljava/lang/InterruptedException;

    .line 482
    .line 483
    throw v0

    .line 484
    :goto_8
    sget-object v5, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    .line 485
    .line 486
    sget-object v6, Lcom/appsflyer/internal/AFg1cSDK;->component4:Lcom/appsflyer/internal/AFg1cSDK;

    .line 487
    .line 488
    new-instance v0, Ljava/lang/StringBuilder;

    .line 489
    .line 490
    const-string v1, "failed to fetch remote config: "

    .line 491
    .line 492
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 493
    .line 494
    .line 495
    invoke-virtual {v8}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 496
    .line 497
    .line 498
    move-result-object v1

    .line 499
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 500
    .line 501
    .line 502
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 503
    .line 504
    .line 505
    move-result-object v7

    .line 506
    const/4 v10, 0x0

    .line 507
    const/4 v11, 0x0

    .line 508
    const/4 v9, 0x1

    .line 509
    invoke-virtual/range {v5 .. v11}, Lcom/appsflyer/internal/AFh1ySDK;->e(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;Ljava/lang/Throwable;ZZZ)V

    .line 510
    .line 511
    .line 512
    instance-of v0, v8, Lcom/appsflyer/internal/components/network/http/exceptions/ParsingException;

    .line 513
    .line 514
    if-eqz v0, :cond_b

    .line 515
    .line 516
    move-object v0, v8

    .line 517
    check-cast v0, Lcom/appsflyer/internal/components/network/http/exceptions/ParsingException;

    .line 518
    .line 519
    invoke-virtual {v0}, Lcom/appsflyer/internal/components/network/http/exceptions/ParsingException;->getRawResponse()Lcom/appsflyer/internal/AFe1kSDK;

    .line 520
    .line 521
    .line 522
    move-result-object v0

    .line 523
    move-object v5, v0

    .line 524
    goto :goto_9

    .line 525
    :cond_b
    const/4 v5, 0x0

    .line 526
    :goto_9
    const/4 v7, 0x0

    .line 527
    move-object v9, v8

    .line 528
    const/4 v8, 0x0

    .line 529
    const/4 v6, 0x0

    .line 530
    move-object/from16 v1, p0

    .line 531
    .line 532
    invoke-direct/range {v1 .. v9}, Lcom/appsflyer/internal/AFf1aSDK;->getCurrencyIso4217Code(Ljava/lang/String;JLcom/appsflyer/internal/AFe1kSDK;Lcom/appsflyer/internal/AFh1aSDK;Lcom/appsflyer/internal/AFi1uSDK;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 533
    .line 534
    .line 535
    move-object v8, v9

    .line 536
    invoke-virtual {v8}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 537
    .line 538
    .line 539
    move-result-object v0

    .line 540
    instance-of v0, v0, Ljava/io/InterruptedIOException;

    .line 541
    .line 542
    if-nez v0, :cond_c

    .line 543
    .line 544
    sget-object v0, Lcom/appsflyer/internal/AFg1zSDK;->getRevenue:Lcom/appsflyer/internal/AFg1zSDK;

    .line 545
    .line 546
    return-object v0

    .line 547
    :cond_c
    invoke-virtual {v8}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 548
    .line 549
    .line 550
    move-result-object v0

    .line 551
    check-cast v0, Ljava/io/InterruptedIOException;

    .line 552
    .line 553
    throw v0
.end method

.method private getCurrencyIso4217Code(Ljava/lang/String;JLcom/appsflyer/internal/AFe1kSDK;Lcom/appsflyer/internal/AFh1aSDK;Lcom/appsflyer/internal/AFi1uSDK;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 16
    .param p4    # Lcom/appsflyer/internal/AFe1kSDK;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p7    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p8    # Ljava/lang/Throwable;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "J",
            "Lcom/appsflyer/internal/AFe1kSDK<",
            "*>;",
            "Lcom/appsflyer/internal/AFh1aSDK;",
            "Lcom/appsflyer/internal/AFi1uSDK;",
            "Ljava/lang/String;",
            "Ljava/lang/Throwable;",
            ")V"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p4

    .line 2
    .line 3
    move-object/from16 v1, p5

    .line 4
    .line 5
    move-object/from16 v2, p8

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v3, v0, Lcom/appsflyer/internal/AFe1kSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFe1oSDK;

    .line 10
    .line 11
    iget-wide v3, v3, Lcom/appsflyer/internal/AFe1oSDK;->AFAdRevenueData:J

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/appsflyer/internal/AFe1kSDK;->getStatusCode()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    :goto_0
    move v12, v0

    .line 18
    goto :goto_1

    .line 19
    :cond_0
    const-wide/16 v3, 0x0

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    goto :goto_0

    .line 23
    :goto_1
    instance-of v0, v2, Lcom/appsflyer/internal/components/network/http/exceptions/HttpException;

    .line 24
    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    invoke-virtual {v2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v2, Lcom/appsflyer/internal/components/network/http/exceptions/HttpException;

    .line 32
    .line 33
    invoke-virtual {v2}, Lcom/appsflyer/internal/components/network/http/exceptions/HttpException;->getMetrics()Lcom/appsflyer/internal/AFe1oSDK;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    iget-wide v3, v2, Lcom/appsflyer/internal/AFe1oSDK;->AFAdRevenueData:J

    .line 38
    .line 39
    move-object v15, v0

    .line 40
    :goto_2
    move-wide v8, v3

    .line 41
    goto :goto_3

    .line 42
    :cond_1
    move-object v15, v2

    .line 43
    goto :goto_2

    .line 44
    :goto_3
    if-eqz v1, :cond_2

    .line 45
    .line 46
    iget-object v0, v1, Lcom/appsflyer/internal/AFh1aSDK;->getMediationNetwork:Ljava/lang/String;

    .line 47
    .line 48
    :goto_4
    move-object v6, v0

    .line 49
    goto :goto_5

    .line 50
    :cond_2
    const/4 v0, 0x0

    .line 51
    goto :goto_4

    .line 52
    :goto_5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 53
    .line 54
    .line 55
    move-result-wide v0

    .line 56
    sub-long v10, v0, p2

    .line 57
    .line 58
    new-instance v5, Lcom/appsflyer/internal/AFh1dSDK;

    .line 59
    .line 60
    move-object/from16 v7, p1

    .line 61
    .line 62
    move-object/from16 v13, p6

    .line 63
    .line 64
    move-object/from16 v14, p7

    .line 65
    .line 66
    invoke-direct/range {v5 .. v15}, Lcom/appsflyer/internal/AFh1dSDK;-><init>(Ljava/lang/String;Ljava/lang/String;JJILcom/appsflyer/internal/AFi1uSDK;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 67
    .line 68
    .line 69
    move-object/from16 v0, p0

    .line 70
    .line 71
    iput-object v5, v0, Lcom/appsflyer/internal/AFf1aSDK;->component4:Lcom/appsflyer/internal/AFh1dSDK;

    .line 72
    .line 73
    return-void
.end method

.method private getMonetizationNetwork(Ljava/lang/String;JLcom/appsflyer/internal/AFi1uSDK;Ljava/lang/String;Lcom/appsflyer/internal/AFe1kSDK;)V
    .locals 11
    .param p5    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p6    # Lcom/appsflyer/internal/AFe1kSDK;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "J",
            "Lcom/appsflyer/internal/AFi1uSDK;",
            "Ljava/lang/String;",
            "Lcom/appsflyer/internal/AFe1kSDK<",
            "Lcom/appsflyer/internal/AFh1aSDK;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x0

    if-eqz p6, :cond_0

    .line 48
    invoke-virtual/range {p6 .. p6}, Lcom/appsflyer/internal/AFe1kSDK;->getBody()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/appsflyer/internal/AFh1aSDK;

    move-object v7, v1

    goto :goto_0

    :cond_0
    move-object v7, v0

    :goto_0
    if-eqz p5, :cond_1

    move-object/from16 v9, p5

    goto :goto_1

    :cond_1
    move-object v9, v0

    :goto_1
    const/4 v10, 0x0

    move-object v2, p0

    move-object v3, p1

    move-wide v4, p2

    move-object v8, p4

    move-object/from16 v6, p6

    .line 49
    invoke-direct/range {v2 .. v10}, Lcom/appsflyer/internal/AFf1aSDK;->getCurrencyIso4217Code(Ljava/lang/String;JLcom/appsflyer/internal/AFe1kSDK;Lcom/appsflyer/internal/AFh1aSDK;Lcom/appsflyer/internal/AFi1uSDK;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method


# virtual methods
.method public final AFAdRevenueData()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public final getMonetizationNetwork()Lcom/appsflyer/internal/AFe1dSDK;
    .locals 8
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    :try_start_0
    invoke-direct {p0}, Lcom/appsflyer/internal/AFf1aSDK;->component1()Lcom/appsflyer/internal/AFg1zSDK;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/appsflyer/internal/AFf1aSDK;->areAllFieldsValid:Lcom/appsflyer/internal/AFg1zSDK;
    :try_end_0
    .catch Ljava/net/SocketTimeoutException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/InterruptedIOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    sget-object p0, Lcom/appsflyer/internal/AFg1zSDK;->getRevenue:Lcom/appsflyer/internal/AFg1zSDK;

    .line 8
    .line 9
    if-ne v0, p0, :cond_0

    .line 10
    .line 11
    sget-object p0, Lcom/appsflyer/internal/AFe1dSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFe1dSDK;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    sget-object p0, Lcom/appsflyer/internal/AFe1dSDK;->getMonetizationNetwork:Lcom/appsflyer/internal/AFe1dSDK;

    .line 15
    .line 16
    return-object p0

    .line 17
    :catch_0
    move-exception v0

    .line 18
    :goto_0
    move-object v4, v0

    .line 19
    goto :goto_1

    .line 20
    :catch_1
    move-exception v0

    .line 21
    goto :goto_0

    .line 22
    :goto_1
    sget-object v1, Lcom/appsflyer/AFLogger;->INSTANCE:Lcom/appsflyer/AFLogger;

    .line 23
    .line 24
    sget-object v2, Lcom/appsflyer/internal/AFg1cSDK;->component4:Lcom/appsflyer/internal/AFg1cSDK;

    .line 25
    .line 26
    const/4 v6, 0x0

    .line 27
    const/4 v7, 0x0

    .line 28
    const-string v3, "RC update config failed"

    .line 29
    .line 30
    const/4 v5, 0x0

    .line 31
    invoke-virtual/range {v1 .. v7}, Lcom/appsflyer/internal/AFh1ySDK;->e(Lcom/appsflyer/internal/AFg1cSDK;Ljava/lang/String;Ljava/lang/Throwable;ZZZ)V

    .line 32
    .line 33
    .line 34
    sget-object v0, Lcom/appsflyer/internal/AFg1zSDK;->getRevenue:Lcom/appsflyer/internal/AFg1zSDK;

    .line 35
    .line 36
    iput-object v0, p0, Lcom/appsflyer/internal/AFf1aSDK;->areAllFieldsValid:Lcom/appsflyer/internal/AFg1zSDK;

    .line 37
    .line 38
    sget-object p0, Lcom/appsflyer/internal/AFe1dSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFe1dSDK;

    .line 39
    .line 40
    return-object p0

    .line 41
    :catch_2
    sget-object v0, Lcom/appsflyer/internal/AFg1zSDK;->getRevenue:Lcom/appsflyer/internal/AFg1zSDK;

    .line 42
    .line 43
    iput-object v0, p0, Lcom/appsflyer/internal/AFf1aSDK;->areAllFieldsValid:Lcom/appsflyer/internal/AFg1zSDK;

    .line 44
    .line 45
    sget-object p0, Lcom/appsflyer/internal/AFe1dSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFe1dSDK;

    .line 46
    .line 47
    return-object p0
.end method

.method public final getRevenue()J
    .locals 2

    const-wide/16 v0, 0x5dc

    return-wide v0
.end method
