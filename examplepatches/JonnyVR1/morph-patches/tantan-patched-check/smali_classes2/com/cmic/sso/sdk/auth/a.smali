.class public Lcom/cmic/sso/sdk/auth/a;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static c:Lcom/cmic/sso/sdk/auth/a;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "StaticFieldLeak"
        }
    .end annotation
.end field


# instance fields
.field private final a:Lcom/cmic/sso/sdk/c/c/a;

.field private final b:Landroid/content/Context;

.field private final d:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/Object;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/cmic/sso/sdk/auth/a;->d:Ljava/lang/Object;

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Lcom/cmic/sso/sdk/auth/a;->b:Landroid/content/Context;

    .line 16
    .line 17
    invoke-static {}, Lcom/cmic/sso/sdk/c/c/a;->a()Lcom/cmic/sso/sdk/c/c/a;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iput-object p1, p0, Lcom/cmic/sso/sdk/auth/a;->a:Lcom/cmic/sso/sdk/c/c/a;

    .line 22
    .line 23
    return-void
.end method

.method public static a(Landroid/content/Context;)Lcom/cmic/sso/sdk/auth/a;
    .locals 2

    .line 285
    sget-object v0, Lcom/cmic/sso/sdk/auth/a;->c:Lcom/cmic/sso/sdk/auth/a;

    if-nez v0, :cond_1

    .line 286
    const-class v0, Lcom/cmic/sso/sdk/auth/a;

    monitor-enter v0

    .line 287
    :try_start_0
    sget-object v1, Lcom/cmic/sso/sdk/auth/a;->c:Lcom/cmic/sso/sdk/auth/a;

    if-nez v1, :cond_0

    .line 288
    new-instance v1, Lcom/cmic/sso/sdk/auth/a;

    invoke-direct {v1, p0}, Lcom/cmic/sso/sdk/auth/a;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/cmic/sso/sdk/auth/a;->c:Lcom/cmic/sso/sdk/auth/a;

    goto :goto_0

    :catchall_0
    move-exception p0

    goto :goto_1

    .line 289
    :cond_0
    :goto_0
    monitor-exit v0

    goto :goto_2

    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    .line 290
    :cond_1
    :goto_2
    sget-object p0, Lcom/cmic/sso/sdk/auth/a;->c:Lcom/cmic/sso/sdk/auth/a;

    return-object p0
.end method

.method private a(Lcom/cmic/sso/sdk/a;Lcom/cmic/sso/sdk/auth/b;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 20

    .line 1
    move-object/from16 v1, p1

    .line 2
    .line 3
    move-object/from16 v2, p2

    .line 4
    .line 5
    move-object/from16 v3, p3

    .line 6
    .line 7
    move-object/from16 v4, p4

    .line 8
    .line 9
    move-object/from16 v0, p5

    .line 10
    .line 11
    const-string v5, "openId"

    .line 12
    .line 13
    const-string v6, "phonescrip"

    .line 14
    .line 15
    const-string v7, "securityphone"

    .line 16
    .line 17
    const-string v8, "103000"

    .line 18
    .line 19
    invoke-virtual {v8, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v8

    .line 23
    const-string v9, "true"

    .line 24
    .line 25
    const/4 v10, 0x3

    .line 26
    const-string v11, "logintype"

    .line 27
    .line 28
    if-eqz v8, :cond_6

    .line 29
    .line 30
    const-string v8, "resultdata"

    .line 31
    .line 32
    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v8

    .line 36
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result v12

    .line 40
    if-eqz v12, :cond_0

    .line 41
    .line 42
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    goto :goto_0

    .line 47
    :cond_0
    sget-object v0, Lcom/cmic/sso/sdk/b$a;->a:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {v1, v0}, Lcom/cmic/sso/sdk/a;->a(Ljava/lang/String;)[B

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    sget-object v12, Lcom/cmic/sso/sdk/b$a;->b:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {v1, v12}, Lcom/cmic/sso/sdk/a;->a(Ljava/lang/String;)[B

    .line 56
    .line 57
    .line 58
    move-result-object v12

    .line 59
    invoke-static {v0, v8, v12}, Lcom/cmic/sso/sdk/e/a;->b([BLjava/lang/String;[B)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    :goto_0
    const/4 v8, 0x0

    .line 64
    :try_start_0
    new-instance v12, Lorg/json/JSONObject;

    .line 65
    .line 66
    invoke-direct {v12, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_3

    .line 67
    .line 68
    .line 69
    :try_start_1
    invoke-virtual {v12, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v13
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_2

    .line 73
    :try_start_2
    invoke-virtual {v12, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v14
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_1

    .line 77
    :try_start_3
    invoke-virtual {v12, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v8

    .line 81
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-eqz v0, :cond_1

    .line 86
    .line 87
    const-string v0, "pcid"

    .line 88
    .line 89
    invoke-virtual {v12, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    move-object v8, v0

    .line 94
    goto :goto_1

    .line 95
    :catch_0
    move-exception v0

    .line 96
    move-object/from16 v19, v12

    .line 97
    .line 98
    move-object v12, v8

    .line 99
    move-object/from16 v8, v19

    .line 100
    .line 101
    goto :goto_4

    .line 102
    :cond_1
    :goto_1
    invoke-static {v7, v14}, Lcom/cmic/sso/sdk/e/k;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_0

    .line 103
    .line 104
    .line 105
    :goto_2
    move-object v0, v14

    .line 106
    move-object v14, v13

    .line 107
    goto :goto_5

    .line 108
    :catch_1
    move-exception v0

    .line 109
    move-object v14, v8

    .line 110
    :goto_3
    move-object v8, v12

    .line 111
    move-object v12, v14

    .line 112
    goto :goto_4

    .line 113
    :catch_2
    move-exception v0

    .line 114
    move-object v13, v8

    .line 115
    move-object v14, v13

    .line 116
    goto :goto_3

    .line 117
    :catch_3
    move-exception v0

    .line 118
    move-object v12, v8

    .line 119
    move-object v13, v12

    .line 120
    move-object v14, v13

    .line 121
    :goto_4
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 122
    .line 123
    .line 124
    move-object v0, v12

    .line 125
    move-object v12, v8

    .line 126
    move-object v8, v0

    .line 127
    goto :goto_2

    .line 128
    :goto_5
    new-instance v13, Ljava/lang/StringBuilder;

    .line 129
    .line 130
    const-string v15, "securityPhone  = "

    .line 131
    .line 132
    invoke-direct {v13, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v13

    .line 142
    const-string v15, "AuthnBusiness"

    .line 143
    .line 144
    invoke-static {v15, v13}, Lcom/cmic/sso/sdk/e/c;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    invoke-virtual {v1, v5, v8}, Lcom/cmic/sso/sdk/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {v1, v6, v14}, Lcom/cmic/sso/sdk/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {v1, v7, v0}, Lcom/cmic/sso/sdk/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    if-eqz v12, :cond_5

    .line 157
    .line 158
    const-string v5, "isRisk"

    .line 159
    .line 160
    const/4 v6, 0x0

    .line 161
    invoke-virtual {v1, v5, v6}, Lcom/cmic/sso/sdk/a;->b(Ljava/lang/String;Z)Z

    .line 162
    .line 163
    .line 164
    move-result v7

    .line 165
    if-nez v7, :cond_2

    .line 166
    .line 167
    move-object/from16 v7, p0

    .line 168
    .line 169
    iget-object v13, v7, Lcom/cmic/sso/sdk/auth/a;->b:Landroid/content/Context;

    .line 170
    .line 171
    const-string v8, "scripExpiresIn"

    .line 172
    .line 173
    const-string v15, "0"

    .line 174
    .line 175
    invoke-virtual {v12, v8, v15}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v8

    .line 179
    invoke-static {v8}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 180
    .line 181
    .line 182
    move-result-wide v15

    .line 183
    const-string v8, "scripKey"

    .line 184
    .line 185
    const-string v6, ""

    .line 186
    .line 187
    invoke-virtual {v1, v8, v6}, Lcom/cmic/sso/sdk/a;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object v17

    .line 191
    const-string v8, "scripType"

    .line 192
    .line 193
    invoke-virtual {v1, v8, v6}, Lcom/cmic/sso/sdk/a;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v18

    .line 197
    invoke-static/range {v13 .. v18}, Lcom/cmic/sso/sdk/e/h;->a(Landroid/content/Context;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;)V

    .line 198
    .line 199
    .line 200
    goto :goto_6

    .line 201
    :cond_2
    move-object/from16 v7, p0

    .line 202
    .line 203
    :goto_6
    invoke-virtual {v1, v11}, Lcom/cmic/sso/sdk/a;->c(Ljava/lang/String;)I

    .line 204
    .line 205
    .line 206
    move-result v6

    .line 207
    if-ne v6, v10, :cond_3

    .line 208
    .line 209
    invoke-static {v0}, Lcom/cmic/sso/sdk/auth/c;->a(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 210
    .line 211
    .line 212
    move-result-object v0

    .line 213
    invoke-interface {v2, v3, v9, v1, v0}, Lcom/cmic/sso/sdk/auth/b;->a(Ljava/lang/String;Ljava/lang/String;Lcom/cmic/sso/sdk/a;Lorg/json/JSONObject;)V

    .line 214
    .line 215
    .line 216
    goto :goto_7

    .line 217
    :cond_3
    const/4 v0, 0x0

    .line 218
    invoke-virtual {v1, v5, v0}, Lcom/cmic/sso/sdk/a;->b(Ljava/lang/String;Z)Z

    .line 219
    .line 220
    .line 221
    move-result v6

    .line 222
    if-eqz v6, :cond_4

    .line 223
    .line 224
    invoke-virtual {v1, v5, v0}, Lcom/cmic/sso/sdk/a;->a(Ljava/lang/String;Z)V

    .line 225
    .line 226
    .line 227
    const-string v0, "isGotScrip"

    .line 228
    .line 229
    const/4 v3, 0x1

    .line 230
    invoke-virtual {v1, v0, v3}, Lcom/cmic/sso/sdk/a;->a(Ljava/lang/String;Z)V

    .line 231
    .line 232
    .line 233
    invoke-direct/range {p0 .. p2}, Lcom/cmic/sso/sdk/auth/a;->b(Lcom/cmic/sso/sdk/a;Lcom/cmic/sso/sdk/auth/b;)V

    .line 234
    .line 235
    .line 236
    goto :goto_7

    .line 237
    :cond_4
    invoke-interface {v2, v3, v4, v1, v12}, Lcom/cmic/sso/sdk/auth/b;->a(Ljava/lang/String;Ljava/lang/String;Lcom/cmic/sso/sdk/a;Lorg/json/JSONObject;)V

    .line 238
    .line 239
    .line 240
    :goto_7
    return-void

    .line 241
    :cond_5
    const-string v0, "\u8fd4\u56de103000\uff0c\u4f46\u662f\u6570\u636e\u89e3\u6790\u51fa\u9519"

    .line 242
    .line 243
    invoke-static {v15, v0}, Lcom/cmic/sso/sdk/e/c;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 244
    .line 245
    .line 246
    const v0, 0x18f4f

    .line 247
    .line 248
    .line 249
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 250
    .line 251
    .line 252
    move-result-object v3

    .line 253
    const-string v4, "\u6570\u636e\u89e3\u6790\u5f02\u5e38"

    .line 254
    .line 255
    invoke-static {v3, v4}, Lcom/cmic/sso/sdk/auth/c;->a(Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    .line 256
    .line 257
    .line 258
    move-result-object v3

    .line 259
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 260
    .line 261
    .line 262
    move-result-object v0

    .line 263
    invoke-interface {v2, v0, v4, v1, v3}, Lcom/cmic/sso/sdk/auth/b;->a(Ljava/lang/String;Ljava/lang/String;Lcom/cmic/sso/sdk/a;Lorg/json/JSONObject;)V

    .line 264
    .line 265
    .line 266
    return-void

    .line 267
    :cond_6
    invoke-virtual {v1, v11}, Lcom/cmic/sso/sdk/a;->c(Ljava/lang/String;)I

    .line 268
    .line 269
    .line 270
    move-result v5

    .line 271
    if-ne v5, v10, :cond_7

    .line 272
    .line 273
    invoke-static/range {p3 .. p4}, Lcom/cmic/sso/sdk/auth/c;->b(Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    .line 274
    .line 275
    .line 276
    move-result-object v0

    .line 277
    invoke-interface {v2, v3, v9, v1, v0}, Lcom/cmic/sso/sdk/auth/b;->a(Ljava/lang/String;Ljava/lang/String;Lcom/cmic/sso/sdk/a;Lorg/json/JSONObject;)V

    .line 278
    .line 279
    .line 280
    return-void

    .line 281
    :cond_7
    invoke-interface {v2, v3, v4, v1, v0}, Lcom/cmic/sso/sdk/auth/b;->a(Ljava/lang/String;Ljava/lang/String;Lcom/cmic/sso/sdk/a;Lorg/json/JSONObject;)V

    .line 282
    .line 283
    .line 284
    return-void
.end method

.method public static synthetic a(Lcom/cmic/sso/sdk/auth/a;Lcom/cmic/sso/sdk/a;Lcom/cmic/sso/sdk/auth/b;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 0

    .line 318
    invoke-direct/range {p0 .. p5}, Lcom/cmic/sso/sdk/auth/a;->a(Lcom/cmic/sso/sdk/a;Lcom/cmic/sso/sdk/auth/b;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V

    return-void
.end method

.method private a(Lcom/cmic/sso/sdk/a;)Z
    .locals 7

    .line 303
    const-string v0, "isCachePhoneScrip = "

    const-string v1, "\u89e3\u5bc6phoneScript "

    iget-object v2, p0, Lcom/cmic/sso/sdk/auth/a;->d:Ljava/lang/Object;

    monitor-enter v2

    .line 304
    :try_start_0
    invoke-static {p1}, Lcom/cmic/sso/sdk/e/h;->a(Lcom/cmic/sso/sdk/a;)Z

    move-result v3

    const/4 v4, 0x1

    if-eqz v3, :cond_1

    .line 305
    const-string v5, "securityphone"

    const-string v6, ""

    invoke-static {v5, v6}, Lcom/cmic/sso/sdk/e/k;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 306
    const-string v6, "securityphone"

    invoke-virtual {p1, v6, v5}, Lcom/cmic/sso/sdk/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 307
    const-string v5, "logintype"

    invoke-virtual {p1, v5}, Lcom/cmic/sso/sdk/a;->c(Ljava/lang/String;)I

    move-result v5

    const/4 v6, 0x3

    if-eq v6, v5, :cond_1

    .line 308
    iget-object p0, p0, Lcom/cmic/sso/sdk/auth/a;->b:Landroid/content/Context;

    invoke-static {p0}, Lcom/cmic/sso/sdk/e/h;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    .line 309
    const-string v5, "AuthnBusiness"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    xor-int/2addr v1, v4

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v5, v1}, Lcom/cmic/sso/sdk/e/c;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 310
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    const/4 v5, 0x0

    if-nez v1, :cond_0

    .line 311
    const-string v1, "phonescrip"

    invoke-virtual {p1, v1, p0}, Lcom/cmic/sso/sdk/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :catchall_0
    move-exception p0

    goto :goto_1

    :cond_0
    move v3, v5

    .line 312
    :goto_0
    invoke-static {v4, v5}, Lcom/cmic/sso/sdk/e/h;->a(ZZ)V

    .line 313
    :cond_1
    const-string p0, "isCacheScrip"

    invoke-virtual {p1, p0, v3}, Lcom/cmic/sso/sdk/a;->a(Ljava/lang/String;Z)V

    .line 314
    const-string p0, "AuthnBusiness"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/cmic/sso/sdk/e/c;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 315
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 316
    const-string p0, "networktype"

    invoke-virtual {p1, p0}, Lcom/cmic/sso/sdk/a;->c(Ljava/lang/String;)I

    move-result p0

    const/4 p1, 0x2

    if-ne p0, p1, :cond_2

    return v3

    :cond_2
    return v4

    .line 317
    :goto_1
    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method private b(Lcom/cmic/sso/sdk/a;)V
    .locals 2

    .line 107
    iget-object v0, p0, Lcom/cmic/sso/sdk/auth/a;->b:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    .line 108
    iget-object p0, p0, Lcom/cmic/sso/sdk/auth/a;->b:Landroid/content/Context;

    invoke-static {p0, v0}, Lcom/cmic/sso/sdk/e/l;->a(Landroid/content/Context;Ljava/lang/String;)[B

    move-result-object p0

    .line 109
    invoke-static {p0}, Lcom/cmic/sso/sdk/e/d;->a([B)Ljava/lang/String;

    move-result-object p0

    .line 110
    const-string v1, "apppackage"

    invoke-virtual {p1, v1, v0}, Lcom/cmic/sso/sdk/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 111
    const-string v0, "appsign"

    invoke-virtual {p1, v0, p0}, Lcom/cmic/sso/sdk/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private b(Lcom/cmic/sso/sdk/a;Lcom/cmic/sso/sdk/auth/b;)V
    .locals 5

    .line 1
    const-string v0, "getScripAndToken start"

    .line 2
    .line 3
    const-string v1, "AuthnBusiness"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/cmic/sso/sdk/e/c;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-string v0, "isGotScrip"

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-virtual {p1, v0, v2}, Lcom/cmic/sso/sdk/a;->b(Ljava/lang/String;Z)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    new-instance v3, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string v4, "isGotScrip = "

    .line 18
    .line 19
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    invoke-static {v1, v3}, Lcom/cmic/sso/sdk/e/c;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    if-nez v0, :cond_2

    .line 33
    .line 34
    invoke-direct {p0, p1}, Lcom/cmic/sso/sdk/auth/a;->b(Lcom/cmic/sso/sdk/a;)V

    .line 35
    .line 36
    .line 37
    const-string v0, "isCacheScrip"

    .line 38
    .line 39
    invoke-virtual {p1, v0, v2}, Lcom/cmic/sso/sdk/a;->b(Ljava/lang/String;Z)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    const/4 v1, 0x1

    .line 44
    const-string v2, "logintype"

    .line 45
    .line 46
    if-nez v0, :cond_0

    .line 47
    .line 48
    invoke-direct {p0, p1}, Lcom/cmic/sso/sdk/auth/a;->c(Lcom/cmic/sso/sdk/a;)V

    .line 49
    .line 50
    .line 51
    const-string v0, "networktype"

    .line 52
    .line 53
    invoke-virtual {p1, v0}, Lcom/cmic/sso/sdk/a;->c(Ljava/lang/String;)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    const/4 v3, 0x3

    .line 58
    if-ne v0, v3, :cond_0

    .line 59
    .line 60
    invoke-virtual {p1, v2}, Lcom/cmic/sso/sdk/a;->c(Ljava/lang/String;)I

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-eq v0, v3, :cond_0

    .line 65
    .line 66
    const-string v0, "isRisk"

    .line 67
    .line 68
    invoke-virtual {p1, v0, v1}, Lcom/cmic/sso/sdk/a;->a(Ljava/lang/String;Z)V

    .line 69
    .line 70
    .line 71
    :cond_0
    invoke-virtual {p1, v2}, Lcom/cmic/sso/sdk/a;->c(Ljava/lang/String;)I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    const-string v3, "userCapaid"

    .line 76
    .line 77
    if-ne v0, v1, :cond_1

    .line 78
    .line 79
    const-string v0, "200"

    .line 80
    .line 81
    invoke-virtual {p1, v3, v0}, Lcom/cmic/sso/sdk/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_1
    invoke-virtual {p1, v2}, Lcom/cmic/sso/sdk/a;->c(Ljava/lang/String;)I

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    if-nez v0, :cond_2

    .line 90
    .line 91
    const-string v0, "50"

    .line 92
    .line 93
    invoke-virtual {p1, v3, v0}, Lcom/cmic/sso/sdk/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/cmic/sso/sdk/auth/a;->a:Lcom/cmic/sso/sdk/c/c/a;

    .line 97
    .line 98
    new-instance v1, Lcom/cmic/sso/sdk/auth/a$1;

    .line 99
    .line 100
    invoke-direct {v1, p0, p1, p2}, Lcom/cmic/sso/sdk/auth/a$1;-><init>(Lcom/cmic/sso/sdk/auth/a;Lcom/cmic/sso/sdk/a;Lcom/cmic/sso/sdk/auth/b;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v0, p1, v1}, Lcom/cmic/sso/sdk/c/c/a;->a(Lcom/cmic/sso/sdk/a;Lcom/cmic/sso/sdk/c/c/d;)V

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method private c(Lcom/cmic/sso/sdk/a;)V
    .locals 3

    .line 1
    const/4 p0, 0x0

    .line 2
    new-array v0, p0, [B

    .line 3
    .line 4
    const-string v1, "use2048PublicKey"

    .line 5
    .line 6
    invoke-virtual {p1, v1, p0}, Lcom/cmic/sso/sdk/a;->b(Ljava/lang/String;Z)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const-string v2, "AuthnBusiness"

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    const-string p0, "\u4f7f\u75282048\u516c\u94a5\u5bf9\u5e94\u7684\u5bf9\u79f0\u79d8\u94a5\u751f\u6210\u65b9\u5f0f"

    .line 15
    .line 16
    invoke-static {v2, p0}, Lcom/cmic/sso/sdk/e/c;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-static {}, Lcom/cmic/sso/sdk/e/a;->a()[B

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const-string v1, "\u4f7f\u75281024\u516c\u94a5\u5bf9\u5e94\u7684\u5bf9\u79f0\u79d8\u94a5\u751f\u6210\u65b9\u5f0f"

    .line 25
    .line 26
    invoke-static {v2, v1}, Lcom/cmic/sso/sdk/e/c;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    :try_start_0
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    const/16 v2, 0x10

    .line 38
    .line 39
    invoke-virtual {v1, p0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    const-string v1, "utf-8"

    .line 44
    .line 45
    invoke-virtual {p0, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 46
    .line 47
    .line 48
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 49
    goto :goto_0

    .line 50
    :catch_0
    move-exception p0

    .line 51
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 52
    .line 53
    .line 54
    :goto_0
    invoke-static {}, Lcom/cmic/sso/sdk/e/a;->a()[B

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    sget-object v1, Lcom/cmic/sso/sdk/b$a;->a:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {p1, v1, v0}, Lcom/cmic/sso/sdk/a;->a(Ljava/lang/String;[B)V

    .line 61
    .line 62
    .line 63
    sget-object v0, Lcom/cmic/sso/sdk/b$a;->b:Ljava/lang/String;

    .line 64
    .line 65
    invoke-virtual {p1, v0, p0}, Lcom/cmic/sso/sdk/a;->a(Ljava/lang/String;[B)V

    .line 66
    .line 67
    .line 68
    const-string p0, "authType"

    .line 69
    .line 70
    const-string v0, "3"

    .line 71
    .line 72
    invoke-virtual {p1, p0, v0}, Lcom/cmic/sso/sdk/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method


# virtual methods
.method public a(Lcom/cmic/sso/sdk/a;Lcom/cmic/sso/sdk/auth/b;)V
    .locals 3

    .line 291
    const-string v0, "traceId"

    invoke-virtual {p1, v0}, Lcom/cmic/sso/sdk/a;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/cmic/sso/sdk/e/e;->a(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 292
    :cond_0
    const-string v0, "AuthnBusiness"

    const-string v1, "LoginCheck method start"

    invoke-static {v0, v1}, Lcom/cmic/sso/sdk/e/c;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 293
    invoke-direct {p0, p1}, Lcom/cmic/sso/sdk/auth/a;->a(Lcom/cmic/sso/sdk/a;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 294
    invoke-static {v0, v1}, Lcom/cmic/sso/sdk/e/c;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 295
    const-string v0, "logintype"

    invoke-virtual {p1, v0}, Lcom/cmic/sso/sdk/a;->c(Ljava/lang/String;)I

    move-result v0

    .line 296
    const-string v1, "isCacheScrip"

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2}, Lcom/cmic/sso/sdk/a;->b(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 297
    const-string v1, "securityphone"

    const-string v2, ""

    invoke-virtual {p1, v1, v2}, Lcom/cmic/sso/sdk/a;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x3

    if-ne v0, v2, :cond_1

    .line 298
    invoke-static {v1}, Lcom/cmic/sso/sdk/auth/c;->a(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    .line 299
    const-string v0, "103000"

    const-string v1, "true"

    invoke-interface {p2, v0, v1, p1, p0}, Lcom/cmic/sso/sdk/auth/b;->a(Ljava/lang/String;Ljava/lang/String;Lcom/cmic/sso/sdk/a;Lorg/json/JSONObject;)V

    return-void

    .line 300
    :cond_1
    invoke-direct {p0, p1, p2}, Lcom/cmic/sso/sdk/auth/a;->b(Lcom/cmic/sso/sdk/a;Lcom/cmic/sso/sdk/auth/b;)V

    return-void

    .line 301
    :cond_2
    invoke-direct {p0, p1, p2}, Lcom/cmic/sso/sdk/auth/a;->b(Lcom/cmic/sso/sdk/a;Lcom/cmic/sso/sdk/auth/b;)V

    return-void

    .line 302
    :cond_3
    const-string p0, "\u65e0\u6570\u636e\u7f51\u7edc"

    const/4 v0, 0x0

    const-string v1, "102103"

    invoke-interface {p2, v1, p0, p1, v0}, Lcom/cmic/sso/sdk/auth/b;->a(Ljava/lang/String;Ljava/lang/String;Lcom/cmic/sso/sdk/a;Lorg/json/JSONObject;)V

    return-void
.end method
