.class public Lcom/tencent/liteav/basic/license/LicenceCheck;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/liteav/basic/license/LicenceCheck$a;
    }
.end annotation


# static fields
.field private static d:Lcom/tencent/liteav/basic/license/LicenceCheck;


# instance fields
.field private a:Landroid/content/Context;

.field private b:Ljava/lang/String;

.field private c:Ljava/lang/String;

.field private e:Lcom/tencent/liteav/basic/license/LicenceCheck$a;

.field private f:Lcom/tencent/liteav/basic/license/LicenceCheck$a;


# direct methods
.method private constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "YTFaceSDK.licence"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/tencent/liteav/basic/license/LicenceCheck;->b:Ljava/lang/String;

    .line 7
    .line 8
    const-string v0, "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAq4teqkW/TUruU89ElNVd\nKrpSL+HCITruyb6BS9mW6M4mqmxDhazDmQgMKNfsA0d2kxFucCsXTyesFNajaisk\nrAzVJpNGO75bQFap4jYzJYskIuas6fgIS7zSmGXgRcp6i0ZBH3pkVCXcgfLfsVCO\n+sN01jFhFgOC0LY2f1pJ+3jqktAlMIxy8Q9t7XwwL5/n8/Sledp7TwuRdnl2OPl3\nycCTRkXtOIoRNB9vgd9XooTKiEdCXC7W9ryvtwCiAB82vEfHWXXgzhsPC13URuFy\n1JqbWJtTCCcfsCVxuBplhVJAQ7JsF5SMntdJDkp7rJLhprgsaim2CRjcVseNmw97\nbwIDAQAB"

    .line 9
    .line 10
    iput-object v0, p0, Lcom/tencent/liteav/basic/license/LicenceCheck;->c:Ljava/lang/String;

    .line 11
    .line 12
    new-instance v0, Lcom/tencent/liteav/basic/license/LicenceCheck$a;

    .line 13
    .line 14
    const-string v1, "TXUgcSDK.licence"

    .line 15
    .line 16
    invoke-direct {v0, p0, v1}, Lcom/tencent/liteav/basic/license/LicenceCheck$a;-><init>(Lcom/tencent/liteav/basic/license/LicenceCheck;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/tencent/liteav/basic/license/LicenceCheck;->e:Lcom/tencent/liteav/basic/license/LicenceCheck$a;

    .line 20
    .line 21
    new-instance v0, Lcom/tencent/liteav/basic/license/LicenceCheck$a;

    .line 22
    .line 23
    const-string v1, "TXLiveSDK.licence"

    .line 24
    .line 25
    invoke-direct {v0, p0, v1}, Lcom/tencent/liteav/basic/license/LicenceCheck$a;-><init>(Lcom/tencent/liteav/basic/license/LicenceCheck;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Lcom/tencent/liteav/basic/license/LicenceCheck;->f:Lcom/tencent/liteav/basic/license/LicenceCheck$a;

    .line 29
    .line 30
    return-void
.end method

.method private a(Lcom/tencent/liteav/basic/license/LicenceCheck$a;Landroid/content/Context;)I
    .locals 2

    .line 375
    iget-boolean v0, p1, Lcom/tencent/liteav/basic/license/LicenceCheck$a;->g:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 376
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/basic/license/LicenceCheck;->a:Landroid/content/Context;

    if-nez v0, :cond_1

    .line 377
    iput-object p2, p0, Lcom/tencent/liteav/basic/license/LicenceCheck;->a:Landroid/content/Context;

    .line 378
    :cond_1
    invoke-direct {p0, p1}, Lcom/tencent/liteav/basic/license/LicenceCheck;->d(Lcom/tencent/liteav/basic/license/LicenceCheck$a;)I

    move-result p2

    const/4 v0, 0x1

    if-nez p2, :cond_2

    .line 379
    iput-boolean v0, p1, Lcom/tencent/liteav/basic/license/LicenceCheck$a;->g:Z

    return v1

    .line 380
    :cond_2
    invoke-direct {p0, p1}, Lcom/tencent/liteav/basic/license/LicenceCheck;->c(Lcom/tencent/liteav/basic/license/LicenceCheck$a;)I

    move-result p0

    if-nez p0, :cond_3

    .line 381
    iput-boolean v0, p1, Lcom/tencent/liteav/basic/license/LicenceCheck$a;->g:Z

    return v1

    :cond_3
    return p0
.end method

.method private a(Lcom/tencent/liteav/basic/license/LicenceCheck$a;Lcom/tencent/liteav/basic/license/f;Landroid/content/Context;)I
    .locals 0

    .line 372
    invoke-direct {p0, p1, p3}, Lcom/tencent/liteav/basic/license/LicenceCheck;->a(Lcom/tencent/liteav/basic/license/LicenceCheck$a;Landroid/content/Context;)I

    move-result p3

    if-eqz p3, :cond_0

    .line 373
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/basic/license/LicenceCheck;->a(Lcom/tencent/liteav/basic/license/LicenceCheck$a;)V

    :cond_0
    if-eqz p2, :cond_1

    .line 374
    iget-object p0, p1, Lcom/tencent/liteav/basic/license/LicenceCheck$a;->i:Ljava/lang/String;

    iput-object p0, p2, Lcom/tencent/liteav/basic/license/f;->a:Ljava/lang/String;

    :cond_1
    return p3
.end method

.method private a(Lcom/tencent/liteav/basic/license/LicenceCheck$a;Ljava/lang/String;Ljava/lang/String;)I
    .locals 11

    .line 1
    const-string v0, "LicenceCheck"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :try_start_0
    iget-object v2, p0, Lcom/tencent/liteav/basic/license/LicenceCheck;->c:Ljava/lang/String;

    .line 5
    .line 6
    invoke-virtual {p0, v2}, Lcom/tencent/liteav/basic/license/LicenceCheck;->a(Ljava/lang/String;)Ljava/security/PublicKey;

    .line 7
    .line 8
    .line 9
    move-result-object v2

    .line 10
    invoke-static {p2, v1}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    invoke-static {p3, v1}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    .line 15
    .line 16
    .line 17
    move-result-object p3

    .line 18
    invoke-static {v3, p3, v2}, Lcom/tencent/liteav/basic/license/LicenceCheck;->a([B[BLjava/security/PublicKey;)Z

    .line 19
    .line 20
    .line 21
    move-result p3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    goto :goto_0

    .line 23
    :catch_0
    move-exception p3

    .line 24
    invoke-virtual {p3}, Ljava/lang/Throwable;->printStackTrace()V

    .line 25
    .line 26
    .line 27
    new-instance v2, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    const-string v3, "verifyLicence, exception is : "

    .line 30
    .line 31
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p3

    .line 41
    invoke-static {v0, p3}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    move p3, v1

    .line 45
    :goto_0
    if-nez p3, :cond_0

    .line 46
    .line 47
    const/4 p1, -0x2

    .line 48
    invoke-direct {p0, p1}, Lcom/tencent/liteav/basic/license/LicenceCheck;->a(I)V

    .line 49
    .line 50
    .line 51
    const-string p0, "verifyLicence, signature not pass!"

    .line 52
    .line 53
    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    return p1

    .line 57
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/tencent/liteav/basic/license/LicenceCheck;->c(Lcom/tencent/liteav/basic/license/LicenceCheck$a;Ljava/lang/String;)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 62
    .line 63
    .line 64
    move-result p3

    .line 65
    if-eqz p3, :cond_1

    .line 66
    .line 67
    const/4 p1, -0x3

    .line 68
    invoke-direct {p0, p1}, Lcom/tencent/liteav/basic/license/LicenceCheck;->a(I)V

    .line 69
    .line 70
    .line 71
    const-string p0, "verifyLicence, decodeValue is empty!"

    .line 72
    .line 73
    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    return p1

    .line 77
    :cond_1
    iput-object p2, p1, Lcom/tencent/liteav/basic/license/LicenceCheck$a;->i:Ljava/lang/String;

    .line 78
    .line 79
    const/4 p3, -0x1

    .line 80
    :try_start_1
    new-instance v2, Lorg/json/JSONObject;

    .line 81
    .line 82
    invoke-direct {v2, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    const-string p2, "pituLicense"

    .line 86
    .line 87
    invoke-virtual {v2, p2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p2

    .line 91
    const-string v3, "appData"

    .line 92
    .line 93
    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    if-nez v2, :cond_2

    .line 98
    .line 99
    const-string p1, "verifyLicence, appDataArray is null!"

    .line 100
    .line 101
    invoke-static {v0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    invoke-direct {p0, p3}, Lcom/tencent/liteav/basic/license/LicenceCheck;->a(I)V

    .line 105
    .line 106
    .line 107
    return p3

    .line 108
    :catch_1
    move-exception p1

    .line 109
    goto/16 :goto_4

    .line 110
    .line 111
    :cond_2
    move v3, v1

    .line 112
    move v4, v3

    .line 113
    move v5, v4

    .line 114
    move v6, v5

    .line 115
    :goto_1
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    .line 116
    .line 117
    .line 118
    move-result v7

    .line 119
    if-ge v3, v7, :cond_6

    .line 120
    .line 121
    invoke-virtual {v2, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    .line 122
    .line 123
    .line 124
    move-result-object v7

    .line 125
    const-string v8, "packageName"

    .line 126
    .line 127
    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v8

    .line 131
    new-instance v9, Ljava/lang/StringBuilder;

    .line 132
    .line 133
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 134
    .line 135
    .line 136
    const-string v10, "verifyLicence, packageName:"

    .line 137
    .line 138
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v9

    .line 148
    invoke-static {v0, v9}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    iget-object v9, p0, Lcom/tencent/liteav/basic/license/LicenceCheck;->a:Landroid/content/Context;

    .line 152
    .line 153
    invoke-virtual {v9}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v9

    .line 157
    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 158
    .line 159
    .line 160
    move-result v8

    .line 161
    if-nez v8, :cond_3

    .line 162
    .line 163
    const-string v7, "verifyLicence, packageName not match!"

    .line 164
    .line 165
    invoke-static {v0, v7}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 166
    .line 167
    .line 168
    goto :goto_2

    .line 169
    :cond_3
    const-string v4, "endDate"

    .line 170
    .line 171
    invoke-virtual {v7, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object v4

    .line 175
    invoke-direct {p0, v4}, Lcom/tencent/liteav/basic/license/LicenceCheck;->d(Ljava/lang/String;)Z

    .line 176
    .line 177
    .line 178
    move-result v4

    .line 179
    const/4 v8, 0x1

    .line 180
    if-eqz v4, :cond_4

    .line 181
    .line 182
    move v4, v8

    .line 183
    goto :goto_2

    .line 184
    :cond_4
    invoke-direct {p0, p1, v7, p2}, Lcom/tencent/liteav/basic/license/LicenceCheck;->a(Lcom/tencent/liteav/basic/license/LicenceCheck$a;Lorg/json/JSONObject;Ljava/lang/String;)Z

    .line 185
    .line 186
    .line 187
    move-result v6

    .line 188
    if-nez v6, :cond_5

    .line 189
    .line 190
    move v4, v8

    .line 191
    move v5, v4

    .line 192
    :goto_2
    add-int/lit8 v3, v3, 0x1

    .line 193
    .line 194
    goto :goto_1

    .line 195
    :cond_5
    move v4, v8

    .line 196
    move v5, v4

    .line 197
    move v6, v5

    .line 198
    :cond_6
    if-nez v4, :cond_7

    .line 199
    .line 200
    const/4 p1, -0x4

    .line 201
    invoke-direct {p0, p1}, Lcom/tencent/liteav/basic/license/LicenceCheck;->a(I)V

    .line 202
    .line 203
    .line 204
    return p1

    .line 205
    :cond_7
    if-nez v5, :cond_8

    .line 206
    .line 207
    const/4 p1, -0x5

    .line 208
    invoke-direct {p0, p1}, Lcom/tencent/liteav/basic/license/LicenceCheck;->a(I)V

    .line 209
    .line 210
    .line 211
    return p1

    .line 212
    :cond_8
    if-nez v6, :cond_9

    .line 213
    .line 214
    const/16 p1, -0xb

    .line 215
    .line 216
    invoke-direct {p0, p1}, Lcom/tencent/liteav/basic/license/LicenceCheck;->a(I)V

    .line 217
    .line 218
    .line 219
    return p1

    .line 220
    :cond_9
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 221
    .line 222
    .line 223
    move-result p1
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 224
    if-nez p1, :cond_b

    .line 225
    .line 226
    :try_start_2
    invoke-static {p2, v1}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    .line 227
    .line 228
    .line 229
    move-result-object p1

    .line 230
    iget-object p2, p0, Lcom/tencent/liteav/basic/license/LicenceCheck;->a:Landroid/content/Context;

    .line 231
    .line 232
    const/4 v2, 0x0

    .line 233
    invoke-virtual {p2, v2}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    .line 234
    .line 235
    .line 236
    move-result-object p2

    .line 237
    if-nez p2, :cond_a

    .line 238
    .line 239
    const/16 p0, -0xa

    .line 240
    .line 241
    return p0

    .line 242
    :cond_a
    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 243
    .line 244
    .line 245
    move-result-object p2

    .line 246
    new-instance v2, Ljava/io/File;

    .line 247
    .line 248
    new-instance v3, Ljava/lang/StringBuilder;

    .line 249
    .line 250
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 251
    .line 252
    .line 253
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 254
    .line 255
    .line 256
    sget-object p2, Ljava/io/File;->separator:Ljava/lang/String;

    .line 257
    .line 258
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 259
    .line 260
    .line 261
    iget-object p2, p0, Lcom/tencent/liteav/basic/license/LicenceCheck;->b:Ljava/lang/String;

    .line 262
    .line 263
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 264
    .line 265
    .line 266
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 267
    .line 268
    .line 269
    move-result-object p2

    .line 270
    invoke-direct {v2, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 271
    .line 272
    .line 273
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 274
    .line 275
    .line 276
    move-result-object p2

    .line 277
    invoke-static {p2, p1}, Lcom/tencent/liteav/basic/util/c;->a(Ljava/lang/String;[B)V

    .line 278
    .line 279
    .line 280
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 281
    .line 282
    .line 283
    move-result-object p1

    .line 284
    invoke-static {p1}, Lcom/tencent/liteav/basic/util/TXCCommonUtil;->setPituLicencePath(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 285
    .line 286
    .line 287
    goto :goto_3

    .line 288
    :catch_2
    move-exception p1

    .line 289
    :try_start_3
    new-instance p2, Ljava/lang/StringBuilder;

    .line 290
    .line 291
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 292
    .line 293
    .line 294
    const-string v2, "decode pitu license error:"

    .line 295
    .line 296
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 297
    .line 298
    .line 299
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 300
    .line 301
    .line 302
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 303
    .line 304
    .line 305
    move-result-object p1

    .line 306
    invoke-static {v0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 307
    .line 308
    .line 309
    :cond_b
    :goto_3
    iget-object p1, p0, Lcom/tencent/liteav/basic/license/LicenceCheck;->a:Landroid/content/Context;

    .line 310
    .line 311
    sget p2, Lcom/tencent/liteav/basic/datareport/a;->aI:I

    .line 312
    .line 313
    invoke-static {p1, p2}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txReportDAU(Landroid/content/Context;I)V
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_1

    .line 314
    .line 315
    .line 316
    return v1

    .line 317
    :goto_4
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 318
    .line 319
    .line 320
    new-instance p2, Ljava/lang/StringBuilder;

    .line 321
    .line 322
    const-string v1, "verifyLicence, json format error ! exception = "

    .line 323
    .line 324
    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 325
    .line 326
    .line 327
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 328
    .line 329
    .line 330
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 331
    .line 332
    .line 333
    move-result-object p1

    .line 334
    invoke-static {v0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 335
    .line 336
    .line 337
    invoke-direct {p0, p3}, Lcom/tencent/liteav/basic/license/LicenceCheck;->a(I)V

    .line 338
    .line 339
    .line 340
    return p3
.end method

.method public static a()Lcom/tencent/liteav/basic/license/LicenceCheck;
    .locals 1

    .line 342
    sget-object v0, Lcom/tencent/liteav/basic/license/LicenceCheck;->d:Lcom/tencent/liteav/basic/license/LicenceCheck;

    if-nez v0, :cond_0

    .line 343
    new-instance v0, Lcom/tencent/liteav/basic/license/LicenceCheck;

    invoke-direct {v0}, Lcom/tencent/liteav/basic/license/LicenceCheck;-><init>()V

    sput-object v0, Lcom/tencent/liteav/basic/license/LicenceCheck;->d:Lcom/tencent/liteav/basic/license/LicenceCheck;

    .line 344
    :cond_0
    sget-object v0, Lcom/tencent/liteav/basic/license/LicenceCheck;->d:Lcom/tencent/liteav/basic/license/LicenceCheck;

    return-object v0
.end method

.method private static a(Landroid/content/Context;)Ljava/lang/String;
    .locals 3

    .line 402
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v0

    .line 403
    const-string v1, "activity"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/ActivityManager;

    .line 404
    invoke-virtual {p0}, Landroid/app/ActivityManager;->getRunningAppProcesses()Ljava/util/List;

    move-result-object p0

    .line 405
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/ActivityManager$RunningAppProcessInfo;

    .line 406
    iget v2, v1, Landroid/app/ActivityManager$RunningAppProcessInfo;->pid:I

    if-ne v2, v0, :cond_0

    .line 407
    iget-object p0, v1, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    return-object p0

    .line 408
    :cond_1
    const-string p0, ""

    return-object p0
.end method

.method public static synthetic a(Lcom/tencent/liteav/basic/license/LicenceCheck;Lcom/tencent/liteav/basic/license/LicenceCheck$a;)Ljava/lang/String;
    .locals 0

    .line 390
    invoke-direct {p0, p1}, Lcom/tencent/liteav/basic/license/LicenceCheck;->h(Lcom/tencent/liteav/basic/license/LicenceCheck$a;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private a(I)V
    .locals 2

    .line 401
    iget-object p0, p0, Lcom/tencent/liteav/basic/license/LicenceCheck;->a:Landroid/content/Context;

    sget v0, Lcom/tencent/liteav/basic/datareport/a;->aJ:I

    const-string v1, ""

    invoke-static {p0, v0, p1, v1}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txReportDAU(Landroid/content/Context;IILjava/lang/String;)V

    return-void
.end method

.method private a(Lcom/tencent/liteav/basic/license/LicenceCheck$a;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    if-eqz p2, :cond_0

    .line 346
    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/tencent/liteav/basic/license/LicenceCheck;->a:Landroid/content/Context;

    .line 347
    invoke-static {p2}, Lcom/tencent/liteav/basic/util/TXCCommonUtil;->setAppContext(Landroid/content/Context;)V

    .line 348
    :cond_0
    iput-object p4, p1, Lcom/tencent/liteav/basic/license/LicenceCheck$a;->d:Ljava/lang/String;

    .line 349
    iput-object p3, p1, Lcom/tencent/liteav/basic/license/LicenceCheck$a;->e:Ljava/lang/String;

    .line 350
    iget-object p2, p0, Lcom/tencent/liteav/basic/license/LicenceCheck;->a:Landroid/content/Context;

    if-eqz p2, :cond_3

    invoke-direct {p0}, Lcom/tencent/liteav/basic/license/LicenceCheck;->c()Z

    move-result p2

    if-eqz p2, :cond_3

    .line 351
    iget-object p2, p0, Lcom/tencent/liteav/basic/license/LicenceCheck;->a:Landroid/content/Context;

    const/4 p3, 0x0

    invoke-virtual {p2, p3}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object p2

    if-eqz p2, :cond_1

    .line 352
    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p2

    iput-object p2, p1, Lcom/tencent/liteav/basic/license/LicenceCheck$a;->c:Ljava/lang/String;

    .line 353
    :cond_1
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object p3, p1, Lcom/tencent/liteav/basic/license/LicenceCheck$a;->c:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object p3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p3, p1, Lcom/tencent/liteav/basic/license/LicenceCheck$a;->a:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p0, p2}, Lcom/tencent/liteav/basic/license/LicenceCheck;->b(Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_2

    .line 354
    const-string p2, "LicenceCheck"

    const-string p3, "setLicense, sdcard file not exist, to download"

    invoke-static {p2, p3}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 355
    const-string p2, ""

    invoke-direct {p0, p1, p2}, Lcom/tencent/liteav/basic/license/LicenceCheck;->b(Lcom/tencent/liteav/basic/license/LicenceCheck$a;Ljava/lang/String;)V

    .line 356
    :cond_2
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/basic/license/LicenceCheck;->a(Lcom/tencent/liteav/basic/license/LicenceCheck$a;)V

    :cond_3
    return-void
.end method

.method public static synthetic a(Lcom/tencent/liteav/basic/license/LicenceCheck;Lcom/tencent/liteav/basic/license/LicenceCheck$a;Ljava/lang/String;)V
    .locals 0

    .line 341
    invoke-direct {p0, p1, p2}, Lcom/tencent/liteav/basic/license/LicenceCheck;->b(Lcom/tencent/liteav/basic/license/LicenceCheck$a;Ljava/lang/String;)V

    return-void
.end method

.method private a(Lcom/tencent/liteav/basic/license/LicenceCheck$a;Lorg/json/JSONObject;Ljava/lang/String;)Z
    .locals 4

    .line 391
    const-string v0, "feature"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result p2

    .line 392
    iget-object v0, p0, Lcom/tencent/liteav/basic/license/LicenceCheck;->f:Lcom/tencent/liteav/basic/license/LicenceCheck$a;

    const-string v1, "LicenceCheck"

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ne p1, v0, :cond_1

    shr-int/lit8 p0, p2, 0x4

    and-int/lit8 p0, p0, 0xf

    if-lt p0, v2, :cond_0

    .line 393
    iput p0, p1, Lcom/tencent/liteav/basic/license/LicenceCheck$a;->h:I

    goto :goto_0

    :cond_0
    move v2, v3

    .line 394
    :goto_0
    new-instance p0, Ljava/lang/StringBuilder;

    const-string p2, "live parseVersionType, mLicenceVersionType = "

    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget p1, p1, Lcom/tencent/liteav/basic/license/LicenceCheck$a;->h:I

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    return v2

    .line 395
    :cond_1
    iget-object p0, p0, Lcom/tencent/liteav/basic/license/LicenceCheck;->e:Lcom/tencent/liteav/basic/license/LicenceCheck$a;

    if-ne p1, p0, :cond_6

    and-int/lit8 p0, p2, 0xf

    if-gt p0, v2, :cond_5

    if-eq p0, v2, :cond_3

    if-nez p2, :cond_2

    goto :goto_1

    :cond_2
    move v2, v3

    goto :goto_2

    .line 396
    :cond_3
    :goto_1
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_4

    const/4 p0, 0x5

    .line 397
    iput p0, p1, Lcom/tencent/liteav/basic/license/LicenceCheck$a;->h:I

    goto :goto_2

    :cond_4
    const/4 p0, 0x3

    .line 398
    iput p0, p1, Lcom/tencent/liteav/basic/license/LicenceCheck$a;->h:I

    goto :goto_2

    .line 399
    :cond_5
    iput p0, p1, Lcom/tencent/liteav/basic/license/LicenceCheck$a;->h:I

    .line 400
    :goto_2
    new-instance p0, Ljava/lang/StringBuilder;

    const-string p2, "ugc parseVersionType, mLicenceVersionType = "

    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget p1, p1, Lcom/tencent/liteav/basic/license/LicenceCheck$a;->h:I

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    return v2

    :cond_6
    return v3
.end method

.method public static a([B[BLjava/security/PublicKey;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/InvalidKeyException;,
            Ljava/security/SignatureException;
        }
    .end annotation

    .line 409
    const-string v0, "SHA256WithRSA"

    invoke-static {v0}, Ljava/security/Signature;->getInstance(Ljava/lang/String;)Ljava/security/Signature;

    move-result-object v0

    .line 410
    invoke-virtual {v0, p2}, Ljava/security/Signature;->initVerify(Ljava/security/PublicKey;)V

    .line 411
    invoke-virtual {v0, p0}, Ljava/security/Signature;->update([B)V

    .line 412
    invoke-virtual {v0, p1}, Ljava/security/Signature;->verify([B)Z

    move-result p0

    return p0
.end method

.method public static synthetic b(Lcom/tencent/liteav/basic/license/LicenceCheck;Lcom/tencent/liteav/basic/license/LicenceCheck$a;Ljava/lang/String;)I
    .locals 0

    .line 47
    invoke-direct {p0, p1, p2}, Lcom/tencent/liteav/basic/license/LicenceCheck;->d(Lcom/tencent/liteav/basic/license/LicenceCheck$a;Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method private b(Lcom/tencent/liteav/basic/license/LicenceCheck$a;)Ljava/lang/String;
    .locals 3

    .line 44
    iget-object p0, p0, Lcom/tencent/liteav/basic/license/LicenceCheck;->a:Landroid/content/Context;

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    .line 45
    :cond_0
    const-string v1, "LicenceCheck.lastModified"

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 46
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object p1, p1, Lcom/tencent/liteav/basic/license/LicenceCheck$a;->a:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ".lastModified"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, p1, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private b(Lcom/tencent/liteav/basic/license/LicenceCheck$a;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/basic/license/LicenceCheck;->a:Landroid/content/Context;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-string v0, "LicenceCheck.lastModified"

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    new-instance v0, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 20
    .line 21
    .line 22
    iget-object p1, p1, Lcom/tencent/liteav/basic/license/LicenceCheck$a;->a:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string p1, ".lastModified"

    .line 28
    .line 29
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 37
    .line 38
    .line 39
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public static synthetic b(Lcom/tencent/liteav/basic/license/LicenceCheck;Lcom/tencent/liteav/basic/license/LicenceCheck$a;)V
    .locals 0

    .line 43
    invoke-direct {p0, p1}, Lcom/tencent/liteav/basic/license/LicenceCheck;->f(Lcom/tencent/liteav/basic/license/LicenceCheck$a;)V

    return-void
.end method

.method private b(Ljava/lang/String;)Z
    .locals 0

    .line 48
    invoke-static {p1}, Lcom/tencent/liteav/basic/util/c;->a(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method private c(Lcom/tencent/liteav/basic/license/LicenceCheck$a;)I
    .locals 4

    .line 1
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "mounted"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/16 v1, -0xa

    .line 12
    .line 13
    const-string v2, "LicenceCheck"

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    const-string p0, "checkSdcardLicence, sdcard not mounted yet!"

    .line 18
    .line 19
    invoke-static {v2, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return v1

    .line 23
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/basic/license/LicenceCheck;->a:Landroid/content/Context;

    .line 24
    .line 25
    const/4 v3, 0x0

    .line 26
    invoke-virtual {v0, v3}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    if-nez v0, :cond_1

    .line 31
    .line 32
    const-string p0, "checkSdcardLicence, mContext.getExternalFilesDir is null!"

    .line 33
    .line 34
    invoke-static {v2, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return v1

    .line 38
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    sget-object v0, Ljava/io/File;->separator:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    iget-object v0, p1, Lcom/tencent/liteav/basic/license/LicenceCheck$a;->a:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-direct {p0, v0}, Lcom/tencent/liteav/basic/license/LicenceCheck;->b(Ljava/lang/String;)Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    if-nez v1, :cond_2

    .line 69
    .line 70
    const/4 p0, -0x7

    .line 71
    return p0

    .line 72
    :cond_2
    invoke-static {v0}, Lcom/tencent/liteav/basic/util/c;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    if-eqz v1, :cond_3

    .line 81
    .line 82
    const-string p0, "checkSdcardLicence, licenceSdcardStr is empty"

    .line 83
    .line 84
    invoke-static {v2, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    const/4 p0, -0x8

    .line 88
    return p0

    .line 89
    :cond_3
    invoke-virtual {p0, p1, v0}, Lcom/tencent/liteav/basic/license/LicenceCheck;->a(Lcom/tencent/liteav/basic/license/LicenceCheck$a;Ljava/lang/String;)I

    .line 90
    .line 91
    .line 92
    move-result p0

    .line 93
    return p0
.end method

.method private static c(Ljava/lang/String;)J
    .locals 2

    .line 98
    :try_start_0
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy-MM-dd"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 99
    invoke-virtual {v0, p0}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/Date;->getTime()J

    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-wide v0

    :catch_0
    move-exception p0

    .line 100
    const-string v0, "LicenceCheck"

    const-string v1, "time str to millsecond failed."

    invoke-static {v0, v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method private c(Lcom/tencent/liteav/basic/license/LicenceCheck$a;Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    .line 101
    const-string v0, "decodeLicence : "

    iget-object v1, p1, Lcom/tencent/liteav/basic/license/LicenceCheck$a;->d:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    const-string v2, "LicenceCheck"

    if-eqz v1, :cond_0

    .line 102
    const-string p0, "decodeLicence, mKey is empty!!!"

    invoke-static {v2, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    const-string p0, ""

    return-object p0

    .line 104
    :cond_0
    iget-object p1, p1, Lcom/tencent/liteav/basic/license/LicenceCheck$a;->d:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object p1

    .line 105
    new-instance v1, Ljavax/crypto/spec/SecretKeySpec;

    const-string v3, "AES"

    invoke-direct {v1, p1, v3}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 106
    invoke-direct {p0, p1}, Lcom/tencent/liteav/basic/license/LicenceCheck;->nativeIvParameterSpec([B)[B

    move-result-object p0

    .line 107
    new-instance p1, Ljavax/crypto/spec/IvParameterSpec;

    invoke-direct {p1, p0}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    const/4 p0, 0x0

    .line 108
    invoke-static {p2, p0}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object p0

    .line 109
    :try_start_0
    const-string p2, "AES/CBC/PKCS5Padding"

    invoke-static {p2}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object p2

    const/4 v3, 0x2

    .line 110
    invoke-virtual {p2, v3, v1, p1}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 111
    invoke-virtual {p2, p0}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object p0

    .line 112
    new-instance p1, Ljava/lang/String;

    const-string p2, "UTF-8"

    invoke-direct {p1, p0, p2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 113
    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v2, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p0

    .line 114
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    const/4 p0, 0x0

    return-object p0
.end method

.method private c()Z
    .locals 3

    .line 94
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v0

    const-string v1, "mounted"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    const-string v2, "LicenceCheck"

    if-nez v0, :cond_0

    .line 95
    const-string p0, "checkSdcardLicence, sdcard not mounted yet!"

    invoke-static {v2, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    .line 96
    :cond_0
    iget-object p0, p0, Lcom/tencent/liteav/basic/license/LicenceCheck;->a:Landroid/content/Context;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object p0

    if-nez p0, :cond_1

    .line 97
    const-string p0, "checkSdcardLicence, mContext.getExternalFilesDir is null!"

    invoke-static {v2, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_1
    const/4 p0, 0x1

    return p0
.end method

.method private d(Lcom/tencent/liteav/basic/license/LicenceCheck$a;)I
    .locals 2

    .line 91
    invoke-direct {p0, p1}, Lcom/tencent/liteav/basic/license/LicenceCheck;->e(Lcom/tencent/liteav/basic/license/LicenceCheck$a;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p0, -0x6

    return p0

    .line 92
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/basic/license/LicenceCheck;->a:Landroid/content/Context;

    iget-object v1, p1, Lcom/tencent/liteav/basic/license/LicenceCheck$a;->a:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/util/c;->b(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 93
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 94
    const-string p0, "LicenceCheck"

    const-string p1, "checkAssetLicence, licenceSdcardStr is empty"

    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, -0x8

    return p0

    .line 95
    :cond_1
    invoke-virtual {p0, p1, v0}, Lcom/tencent/liteav/basic/license/LicenceCheck;->a(Lcom/tencent/liteav/basic/license/LicenceCheck$a;Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method private d(Lcom/tencent/liteav/basic/license/LicenceCheck$a;Ljava/lang/String;)I
    .locals 7

    .line 1
    const-string v0, "LicenceCheck"

    .line 2
    .line 3
    const-string v1, "signature:"

    .line 4
    .line 5
    const-string v2, "encryptedLicense:"

    .line 6
    .line 7
    const-string v3, "appid:"

    .line 8
    .line 9
    :try_start_0
    new-instance v4, Lorg/json/JSONObject;

    .line 10
    .line 11
    invoke-direct {v4, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const-string p2, "appId"

    .line 15
    .line 16
    invoke-virtual {v4, p2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    const-string v5, "encryptedLicense"

    .line 21
    .line 22
    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v5

    .line 26
    const-string v6, "signature"

    .line 27
    .line 28
    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    new-instance v6, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    invoke-direct {v6, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    invoke-static {v0, p2}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    new-instance p2, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    invoke-direct {p2, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    invoke-static {v0, p2}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    new-instance p2, Ljava/lang/StringBuilder;

    .line 63
    .line 64
    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p2

    .line 74
    invoke-static {v0, p2}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 75
    .line 76
    .line 77
    invoke-direct {p0, p1, v5, v4}, Lcom/tencent/liteav/basic/license/LicenceCheck;->a(Lcom/tencent/liteav/basic/license/LicenceCheck$a;Ljava/lang/String;Ljava/lang/String;)I

    .line 78
    .line 79
    .line 80
    move-result p0

    .line 81
    return p0

    .line 82
    :catch_0
    move-exception p1

    .line 83
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 84
    .line 85
    .line 86
    const/4 p1, -0x1

    .line 87
    invoke-direct {p0, p1}, Lcom/tencent/liteav/basic/license/LicenceCheck;->a(I)V

    .line 88
    .line 89
    .line 90
    return p1
.end method

.method private d(Ljava/lang/String;)Z
    .locals 5

    .line 96
    invoke-static {p1}, Lcom/tencent/liteav/basic/license/LicenceCheck;->c(Ljava/lang/String;)J

    move-result-wide p0

    const-wide/16 v0, 0x0

    cmp-long v0, p0, v0

    const/4 v1, 0x1

    .line 97
    const-string v2, "LicenceCheck"

    if-gez v0, :cond_0

    .line 98
    const-string p0, "checkEndDate, end date millis < 0!"

    invoke-static {v2, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    .line 99
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    cmp-long p0, p0, v3

    if-gez p0, :cond_1

    .line 100
    const-string p0, "checkEndDate, end date expire!"

    invoke-static {v2, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method private e(Lcom/tencent/liteav/basic/license/LicenceCheck$a;Ljava/lang/String;)I
    .locals 3

    .line 1
    invoke-direct {p0, p2}, Lcom/tencent/liteav/basic/license/LicenceCheck;->e(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const-string v1, "LicenceCheck"

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const-string p0, "verifyOldLicence, decryptStr is empty"

    .line 14
    .line 15
    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/4 p0, -0x3

    .line 19
    return p0

    .line 20
    :cond_0
    iput-object p2, p1, Lcom/tencent/liteav/basic/license/LicenceCheck$a;->i:Ljava/lang/String;

    .line 21
    .line 22
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 23
    .line 24
    invoke-direct {v0, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    const-string p2, "packagename"

    .line 28
    .line 29
    invoke-virtual {v0, p2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    iget-object v2, p0, Lcom/tencent/liteav/basic/license/LicenceCheck;->a:Landroid/content/Context;

    .line 34
    .line 35
    invoke-static {v2}, Lcom/tencent/liteav/basic/license/LicenceCheck;->a(Landroid/content/Context;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    if-nez p2, :cond_1

    .line 44
    .line 45
    const-string p1, "packagename not match!"

    .line 46
    .line 47
    invoke-static {v1, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    const/4 p1, -0x4

    .line 51
    invoke-direct {p0, p1}, Lcom/tencent/liteav/basic/license/LicenceCheck;->a(I)V

    .line 52
    .line 53
    .line 54
    return p1

    .line 55
    :catch_0
    move-exception p1

    .line 56
    goto :goto_0

    .line 57
    :cond_1
    const-string p2, "enddate"

    .line 58
    .line 59
    invoke-virtual {v0, p2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    invoke-direct {p0, p2}, Lcom/tencent/liteav/basic/license/LicenceCheck;->d(Ljava/lang/String;)Z

    .line 64
    .line 65
    .line 66
    move-result p2
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 67
    if-eqz p2, :cond_2

    .line 68
    .line 69
    const/4 p0, -0x5

    .line 70
    return p0

    .line 71
    :cond_2
    const/4 p2, 0x5

    .line 72
    iput p2, p1, Lcom/tencent/liteav/basic/license/LicenceCheck$a;->h:I

    .line 73
    .line 74
    iget-object p0, p0, Lcom/tencent/liteav/basic/license/LicenceCheck;->a:Landroid/content/Context;

    .line 75
    .line 76
    sget p1, Lcom/tencent/liteav/basic/datareport/a;->aI:I

    .line 77
    .line 78
    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/datareport/TXCDRApi;->txReportDAU(Landroid/content/Context;I)V

    .line 79
    .line 80
    .line 81
    const/4 p0, 0x0

    .line 82
    return p0

    .line 83
    :goto_0
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 84
    .line 85
    .line 86
    const-string p1, "verifyOldLicence, json format error !"

    .line 87
    .line 88
    invoke-static {v1, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    const/4 p1, -0x1

    .line 92
    invoke-direct {p0, p1}, Lcom/tencent/liteav/basic/license/LicenceCheck;->a(I)V

    .line 93
    .line 94
    .line 95
    return p1
.end method

.method private e(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 97
    :try_start_0
    const-string p0, "MIICdQIBADANBgkqhkiG9w0BAQEFAASCAl8wggJbAgEAAoGBAKfMXaF6wx9lev2U\nIzkk6ydI2sdaSQAD2ZvDBLq+5Fm6nGwSSWawl03D4vHcWIUa3wnz6f19/y8wzrj4\nnTfcEnT94SPdB6GhGsqPwbwRp9MHAqd/2gWZxSb005il2yiOZafk6X4NGKCn2tGd\nyNaCF+m9rLykuLdZHB0Z53ivgseNAgMBAAECgYAvXI2pAH+Goxwd6uwuOu9svTGT\nRzaHnI6VWmxBUZQeh3+TOW4iYAG03291GN6bY0RFCOWouSGH7lzK9NFbbPCAQ/hx\ncO48PqioHoq7K8sqzd3XaYBv39HrRnM8JvZsqv0PLJwX/LGm2y/MRaKAC6bcHtse\npgh+NNmUxXNRcTMRAQJBANezmenBcR8HTcY5YaEk3SQRzOo+QhIXuuD4T/FESpVJ\nmVQGxJjLsEBua1j38WG2QuepE5JiVbkQ0jQSvhUiZK0CQQDHJa+vWu6l72lQAvIx\nwmRISorvLb/tnu5bH0Ele42oX+w4p/tm03awdVjhVANnpDjYS2H6EzrF/pfis7k9\nV2phAkB4E4gz47bYYhV+qsTZkw70HGCpab0YG1OyFylRkwW983nCl/3rXUChrZZe\nsbATCAZYtfuqOsmju2R5DpH4a+wFAkBmHlcWbmSNxlSUaM5U4b+WqlLQDv+qE6Na\nKo63b8HWI0n4S3tI4QqttZ7b/L66OKXFk/Ir0AyFVuX/o/VLFTZBAkAdSTEkGwE5\nGQmhxu95sKxmdlUY6Q0Gwwpi06C1BPBrj2VkGXpBP0twhPVAq/3xVjjb+2KXVTUW\nIpRLc06M4vhv"

    const/4 v0, 0x0

    invoke-static {p0, v0}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object p0

    .line 98
    invoke-static {p1, v0}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object p1

    .line 99
    invoke-static {p1, p0}, Lcom/tencent/liteav/basic/license/h;->b([B[B)[B

    move-result-object p0

    .line 100
    new-instance p1, Ljava/lang/String;

    invoke-direct {p1, p0}, Ljava/lang/String;-><init>([B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p0

    .line 101
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 102
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "decryptLicenceStr, exception is : "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "LicenceCheck"

    invoke-static {p1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method private e(Lcom/tencent/liteav/basic/license/LicenceCheck$a;)Z
    .locals 0

    .line 96
    iget-object p0, p0, Lcom/tencent/liteav/basic/license/LicenceCheck;->a:Landroid/content/Context;

    iget-object p1, p1, Lcom/tencent/liteav/basic/license/LicenceCheck$a;->a:Ljava/lang/String;

    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/util/c;->a(Landroid/content/Context;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method private f(Lcom/tencent/liteav/basic/license/LicenceCheck$a;)V
    .locals 5

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/basic/license/LicenceCheck;->a:Landroid/content/Context;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    const-string v0, "LicenceCheck"

    .line 9
    .line 10
    if-nez p0, :cond_0

    .line 11
    .line 12
    const-string p0, "saveTempLocal sdcardDir is null"

    .line 13
    .line 14
    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    sget-object p0, Ljava/io/File;->separator:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    iget-object v2, p1, Lcom/tencent/liteav/basic/license/LicenceCheck$a;->a:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    new-instance v2, Ljava/io/File;

    .line 45
    .line 46
    invoke-direct {v2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-eqz v1, :cond_1

    .line 54
    .line 55
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    new-instance v3, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    const-string v4, "delete dst file:"

    .line 62
    .line 63
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    :cond_1
    new-instance v1, Ljava/io/File;

    .line 77
    .line 78
    new-instance v3, Ljava/lang/StringBuilder;

    .line 79
    .line 80
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 81
    .line 82
    .line 83
    iget-object v4, p1, Lcom/tencent/liteav/basic/license/LicenceCheck$a;->c:Ljava/lang/String;

    .line 84
    .line 85
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    iget-object p0, p1, Lcom/tencent/liteav/basic/license/LicenceCheck$a;->b:Ljava/lang/String;

    .line 92
    .line 93
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    .line 104
    .line 105
    .line 106
    move-result p0

    .line 107
    if-eqz p0, :cond_2

    .line 108
    .line 109
    invoke-virtual {v1, v2}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 110
    .line 111
    .line 112
    move-result p0

    .line 113
    new-instance v1, Ljava/lang/StringBuilder;

    .line 114
    .line 115
    const-string v2, "rename file:"

    .line 116
    .line 117
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    :cond_2
    const/4 p0, 0x1

    .line 131
    iput-boolean p0, p1, Lcom/tencent/liteav/basic/license/LicenceCheck$a;->g:Z

    .line 132
    .line 133
    return-void
.end method

.method private g(Lcom/tencent/liteav/basic/license/LicenceCheck$a;)I
    .locals 0

    .line 1
    iget p0, p1, Lcom/tencent/liteav/basic/license/LicenceCheck$a;->h:I

    .line 2
    .line 3
    return p0
.end method

.method private h(Lcom/tencent/liteav/basic/license/LicenceCheck$a;)Ljava/lang/String;
    .locals 2

    .line 1
    new-instance p0, Ljava/io/File;

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    iget-object v1, p1, Lcom/tencent/liteav/basic/license/LicenceCheck$a;->c:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object p1, p1, Lcom/tencent/liteav/basic/license/LicenceCheck$a;->b:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-direct {p0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-static {p0}, Lcom/tencent/liteav/basic/util/c;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method

.method private native nativeIvParameterSpec([B)[B
.end method


# virtual methods
.method public a(Lcom/tencent/liteav/basic/license/LicenceCheck$a;Ljava/lang/String;)I
    .locals 1

    .line 382
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 383
    invoke-direct {p0, p1, p2}, Lcom/tencent/liteav/basic/license/LicenceCheck;->d(Lcom/tencent/liteav/basic/license/LicenceCheck$a;Ljava/lang/String;)I

    move-result p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    .line 384
    :catch_0
    iget-object v0, p0, Lcom/tencent/liteav/basic/license/LicenceCheck;->f:Lcom/tencent/liteav/basic/license/LicenceCheck$a;

    if-ne p1, v0, :cond_0

    const/4 p0, -0x1

    return p0

    .line 385
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/tencent/liteav/basic/license/LicenceCheck;->e(Lcom/tencent/liteav/basic/license/LicenceCheck$a;Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method public a(Lcom/tencent/liteav/basic/license/f;Landroid/content/Context;)I
    .locals 1

    .line 371
    iget-object v0, p0, Lcom/tencent/liteav/basic/license/LicenceCheck;->f:Lcom/tencent/liteav/basic/license/LicenceCheck$a;

    invoke-direct {p0, v0, p1, p2}, Lcom/tencent/liteav/basic/license/LicenceCheck;->a(Lcom/tencent/liteav/basic/license/LicenceCheck$a;Lcom/tencent/liteav/basic/license/f;Landroid/content/Context;)I

    move-result p0

    return p0
.end method

.method public a(Ljava/lang/String;)Ljava/security/PublicKey;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/4 p0, 0x0

    .line 386
    invoke-static {p1, p0}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object p0

    .line 387
    new-instance p1, Ljava/security/spec/X509EncodedKeySpec;

    invoke-direct {p1, p0}, Ljava/security/spec/X509EncodedKeySpec;-><init>([B)V

    .line 388
    const-string p0, "RSA"

    invoke-static {p0}, Ljava/security/KeyFactory;->getInstance(Ljava/lang/String;)Ljava/security/KeyFactory;

    move-result-object p0

    .line 389
    invoke-virtual {p0, p1}, Ljava/security/KeyFactory;->generatePublic(Ljava/security/spec/KeySpec;)Ljava/security/PublicKey;

    move-result-object p0

    return-object p0
.end method

.method public a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 345
    iget-object v0, p0, Lcom/tencent/liteav/basic/license/LicenceCheck;->f:Lcom/tencent/liteav/basic/license/LicenceCheck$a;

    invoke-direct {p0, v0, p1, p2, p3}, Lcom/tencent/liteav/basic/license/LicenceCheck;->a(Lcom/tencent/liteav/basic/license/LicenceCheck$a;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public a(Lcom/tencent/liteav/basic/license/LicenceCheck$a;)V
    .locals 10

    .line 357
    iget-object v0, p1, Lcom/tencent/liteav/basic/license/LicenceCheck$a;->e:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const-string v1, "LicenceCheck"

    if-eqz v0, :cond_0

    .line 358
    const-string p0, "downloadLicense, mUrl is empty, ignore!"

    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 359
    :cond_0
    iget-boolean v0, p1, Lcom/tencent/liteav/basic/license/LicenceCheck$a;->f:Z

    if-eqz v0, :cond_1

    .line 360
    const-string p0, "downloadLicense, in downloading, ignore"

    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 361
    :cond_1
    new-instance v7, Lcom/tencent/liteav/basic/license/LicenceCheck$1;

    invoke-direct {v7, p0, p1}, Lcom/tencent/liteav/basic/license/LicenceCheck$1;-><init>(Lcom/tencent/liteav/basic/license/LicenceCheck;Lcom/tencent/liteav/basic/license/LicenceCheck$a;)V

    .line 362
    iget-object v0, p0, Lcom/tencent/liteav/basic/license/LicenceCheck;->a:Landroid/content/Context;

    if-nez v0, :cond_2

    .line 363
    const-string p0, "context is NULL !!! Please set context in method:setLicense(Context context, String url, String key)"

    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_2
    const/4 v2, 0x0

    .line 364
    invoke-virtual {v0, v2}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    if-nez v0, :cond_3

    .line 365
    const-string p0, "Please check permission WRITE_EXTERNAL_STORAGE permission has been set !!!"

    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 366
    :cond_3
    invoke-direct {p0, p1}, Lcom/tencent/liteav/basic/license/LicenceCheck;->b(Lcom/tencent/liteav/basic/license/LicenceCheck$a;)Ljava/lang/String;

    move-result-object v9

    .line 367
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Lcom/tencent/liteav/basic/license/LicenceCheck$a;->c:Ljava/lang/String;

    .line 368
    new-instance v0, Ljava/lang/Thread;

    new-instance v2, Lcom/tencent/liteav/basic/license/c;

    iget-object v3, p0, Lcom/tencent/liteav/basic/license/LicenceCheck;->a:Landroid/content/Context;

    iget-object v4, p1, Lcom/tencent/liteav/basic/license/LicenceCheck$a;->e:Ljava/lang/String;

    iget-object v5, p1, Lcom/tencent/liteav/basic/license/LicenceCheck$a;->c:Ljava/lang/String;

    iget-object v6, p1, Lcom/tencent/liteav/basic/license/LicenceCheck$a;->b:Ljava/lang/String;

    const/4 v8, 0x0

    invoke-direct/range {v2 .. v9}, Lcom/tencent/liteav/basic/license/c;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/tencent/liteav/basic/license/b;ZLjava/lang/String;)V

    invoke-direct {v0, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 369
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    const/4 p0, 0x1

    .line 370
    iput-boolean p0, p1, Lcom/tencent/liteav/basic/license/LicenceCheck$a;->f:Z

    return-void
.end method

.method public b()I
    .locals 1

    .line 49
    iget-object v0, p0, Lcom/tencent/liteav/basic/license/LicenceCheck;->f:Lcom/tencent/liteav/basic/license/LicenceCheck$a;

    invoke-direct {p0, v0}, Lcom/tencent/liteav/basic/license/LicenceCheck;->g(Lcom/tencent/liteav/basic/license/LicenceCheck$a;)I

    move-result p0

    return p0
.end method
