.class public Lcom/cmic/sso/sdk/a/b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cmic/sso/sdk/a/b$a;
    }
.end annotation


# static fields
.field private static c:Lcom/cmic/sso/sdk/a/b;


# instance fields
.field private a:Lcom/cmic/sso/sdk/a/a;

.field private final b:Lcom/cmic/sso/sdk/a/a;

.field private volatile d:Z

.field private e:Lcom/cmic/sso/sdk/a/b$a;


# direct methods
.method private constructor <init>(Z)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/cmic/sso/sdk/a/b;->d:Z

    .line 6
    .line 7
    new-instance v0, Lcom/cmic/sso/sdk/a/a$a;

    .line 8
    .line 9
    invoke-direct {v0}, Lcom/cmic/sso/sdk/a/a$a;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/cmic/sso/sdk/a/a$a;->a()Lcom/cmic/sso/sdk/a/a;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Lcom/cmic/sso/sdk/a/b;->b:Lcom/cmic/sso/sdk/a/a;

    .line 17
    .line 18
    if-nez p1, :cond_0

    .line 19
    .line 20
    invoke-direct {p0}, Lcom/cmic/sso/sdk/a/b;->d()Lcom/cmic/sso/sdk/a/a;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iput-object p1, p0, Lcom/cmic/sso/sdk/a/b;->a:Lcom/cmic/sso/sdk/a/a;

    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    iput-object v0, p0, Lcom/cmic/sso/sdk/a/b;->a:Lcom/cmic/sso/sdk/a/a;

    .line 28
    .line 29
    return-void
.end method

.method public static synthetic a(Lcom/cmic/sso/sdk/a/b;)Lcom/cmic/sso/sdk/a/a;
    .locals 0

    .line 290
    invoke-direct {p0}, Lcom/cmic/sso/sdk/a/b;->d()Lcom/cmic/sso/sdk/a/a;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic a(Lcom/cmic/sso/sdk/a/b;Lcom/cmic/sso/sdk/a/a;)Lcom/cmic/sso/sdk/a/a;
    .locals 0

    .line 278
    iput-object p1, p0, Lcom/cmic/sso/sdk/a/b;->a:Lcom/cmic/sso/sdk/a/a;

    return-object p1
.end method

.method public static a(Z)Lcom/cmic/sso/sdk/a/b;
    .locals 2

    .line 283
    sget-object v0, Lcom/cmic/sso/sdk/a/b;->c:Lcom/cmic/sso/sdk/a/b;

    if-nez v0, :cond_1

    .line 284
    const-class v0, Lcom/cmic/sso/sdk/a/b;

    monitor-enter v0

    .line 285
    :try_start_0
    sget-object v1, Lcom/cmic/sso/sdk/a/b;->c:Lcom/cmic/sso/sdk/a/b;

    if-nez v1, :cond_0

    .line 286
    new-instance v1, Lcom/cmic/sso/sdk/a/b;

    invoke-direct {v1, p0}, Lcom/cmic/sso/sdk/a/b;-><init>(Z)V

    sput-object v1, Lcom/cmic/sso/sdk/a/b;->c:Lcom/cmic/sso/sdk/a/b;

    goto :goto_0

    :catchall_0
    move-exception p0

    goto :goto_1

    .line 287
    :cond_0
    :goto_0
    monitor-exit v0

    goto :goto_2

    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    .line 288
    :cond_1
    :goto_2
    sget-object p0, Lcom/cmic/sso/sdk/a/b;->c:Lcom/cmic/sso/sdk/a/b;

    return-object p0
.end method

.method private a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 291
    const-string p0, "&"

    invoke-virtual {p1, p0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    .line 292
    array-length p1, p0

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p1, :cond_1

    aget-object v1, p0, v0

    .line 293
    invoke-virtual {v1, p2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 294
    :cond_1
    const-string v1, ""

    .line 295
    :goto_1
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_2

    .line 296
    const-string p0, "="

    invoke-virtual {v1, p0}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result p0

    add-int/lit8 p0, p0, 0x1

    invoke-virtual {v1, p0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_2
    return-object v1
.end method

.method public static synthetic a(Lcom/cmic/sso/sdk/a/b;Lcom/cmic/sso/sdk/a;)V
    .locals 0

    .line 279
    invoke-direct {p0, p1}, Lcom/cmic/sso/sdk/a/b;->b(Lcom/cmic/sso/sdk/a;)V

    return-void
.end method

.method public static synthetic a(Lcom/cmic/sso/sdk/a/b;Lorg/json/JSONObject;)V
    .locals 0

    .line 280
    invoke-direct {p0, p1}, Lcom/cmic/sso/sdk/a/b;->a(Lorg/json/JSONObject;)V

    return-void
.end method

.method private a(Lorg/json/JSONObject;)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    const-string v2, "UmcConfigHandle"

    .line 6
    .line 7
    const-string v3, "LOGS_CONTROL"

    .line 8
    .line 9
    const-string v4, "M009"

    .line 10
    .line 11
    const-string v5, "M008"

    .line 12
    .line 13
    const-string v6, "M007"

    .line 14
    .line 15
    const-string v7, "CHANGE_HOST"

    .line 16
    .line 17
    const-string v8, "Configlist"

    .line 18
    .line 19
    const-string v9, "client_valid"

    .line 20
    .line 21
    const-string v10, "0"

    .line 22
    .line 23
    const-string v11, "sso_config_xf"

    .line 24
    .line 25
    invoke-static {v11}, Lcom/cmic/sso/sdk/e/k;->b(Ljava/lang/String;)Lcom/cmic/sso/sdk/e/k$a;

    .line 26
    .line 27
    .line 28
    move-result-object v11

    .line 29
    :try_start_0
    invoke-virtual {v1, v9}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result v12

    .line 33
    if-eqz v12, :cond_0

    .line 34
    .line 35
    invoke-virtual {v1, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v12

    .line 39
    invoke-static {v12}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    move-result v12

    .line 43
    int-to-long v12, v12

    .line 44
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 45
    .line 46
    .line 47
    move-result-wide v14

    .line 48
    const-wide/32 v16, 0x36ee80

    .line 49
    .line 50
    .line 51
    mul-long v12, v12, v16

    .line 52
    .line 53
    add-long/2addr v14, v12

    .line 54
    invoke-virtual {v11, v9, v14, v15}, Lcom/cmic/sso/sdk/e/k$a;->a(Ljava/lang/String;J)V

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :catch_0
    move-exception v0

    .line 59
    goto/16 :goto_3

    .line 60
    .line 61
    :cond_0
    :goto_0
    invoke-virtual {v1, v8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 62
    .line 63
    .line 64
    move-result v9

    .line 65
    if-eqz v9, :cond_6

    .line 66
    .line 67
    invoke-virtual {v1, v8}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-virtual {v1, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 72
    .line 73
    .line 74
    move-result v8
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 75
    const-string v9, "config_host"

    .line 76
    .line 77
    const-string v12, "https_get_phone_scrip_host"

    .line 78
    .line 79
    const-string v13, "logHost"

    .line 80
    .line 81
    if-eqz v8, :cond_3

    .line 82
    .line 83
    :try_start_1
    invoke-virtual {v1, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v7

    .line 87
    invoke-virtual {v7, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 88
    .line 89
    .line 90
    move-result v8

    .line 91
    if-eqz v8, :cond_1

    .line 92
    .line 93
    invoke-direct {v0, v7, v6}, Lcom/cmic/sso/sdk/a/b;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v6

    .line 97
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 98
    .line 99
    .line 100
    move-result v8

    .line 101
    if-nez v8, :cond_1

    .line 102
    .line 103
    invoke-virtual {v11, v13, v6}, Lcom/cmic/sso/sdk/e/k$a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    :cond_1
    invoke-virtual {v7, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 107
    .line 108
    .line 109
    move-result v6

    .line 110
    if-eqz v6, :cond_2

    .line 111
    .line 112
    invoke-direct {v0, v7, v5}, Lcom/cmic/sso/sdk/a/b;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v5

    .line 116
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 117
    .line 118
    .line 119
    move-result v6

    .line 120
    if-nez v6, :cond_2

    .line 121
    .line 122
    invoke-virtual {v11, v12, v5}, Lcom/cmic/sso/sdk/e/k$a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    :cond_2
    invoke-virtual {v7, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 126
    .line 127
    .line 128
    move-result v5

    .line 129
    if-eqz v5, :cond_4

    .line 130
    .line 131
    invoke-direct {v0, v7, v4}, Lcom/cmic/sso/sdk/a/b;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v4

    .line 135
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 136
    .line 137
    .line 138
    move-result v5

    .line 139
    if-nez v5, :cond_4

    .line 140
    .line 141
    invoke-virtual {v11, v9, v4}, Lcom/cmic/sso/sdk/e/k$a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    goto :goto_1

    .line 145
    :cond_3
    invoke-virtual {v11, v13}, Lcom/cmic/sso/sdk/e/k$a;->a(Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    invoke-virtual {v11, v12}, Lcom/cmic/sso/sdk/e/k$a;->a(Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    invoke-virtual {v11, v9}, Lcom/cmic/sso/sdk/e/k$a;->a(Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    :cond_4
    :goto_1
    const-string v4, "CLOSE_FRIEND_WAPKS"

    .line 155
    .line 156
    invoke-direct {v0, v1, v4, v10, v11}, Lcom/cmic/sso/sdk/a/b;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Lcom/cmic/sso/sdk/e/k$a;)V

    .line 157
    .line 158
    .line 159
    const-string v4, "CLOSE_LOGS_VERSION"

    .line 160
    .line 161
    invoke-direct {v0, v1, v4, v10, v11}, Lcom/cmic/sso/sdk/a/b;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Lcom/cmic/sso/sdk/e/k$a;)V

    .line 162
    .line 163
    .line 164
    const-string v4, "CLOSE_IPV4_LIST"

    .line 165
    .line 166
    invoke-direct {v0, v1, v4, v10, v11}, Lcom/cmic/sso/sdk/a/b;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Lcom/cmic/sso/sdk/e/k$a;)V

    .line 167
    .line 168
    .line 169
    const-string v4, "CLOSE_IPV6_LIST"

    .line 170
    .line 171
    invoke-direct {v0, v1, v4, v10, v11}, Lcom/cmic/sso/sdk/a/b;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Lcom/cmic/sso/sdk/e/k$a;)V

    .line 172
    .line 173
    .line 174
    const-string v4, "CLOSE_M008_SDKVERSION_LIST"

    .line 175
    .line 176
    invoke-direct {v0, v1, v4, v10, v11}, Lcom/cmic/sso/sdk/a/b;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Lcom/cmic/sso/sdk/e/k$a;)V

    .line 177
    .line 178
    .line 179
    const-string v4, "CLOSE_M008_APPID_LIST"

    .line 180
    .line 181
    invoke-direct {v0, v1, v4, v10, v11}, Lcom/cmic/sso/sdk/a/b;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Lcom/cmic/sso/sdk/e/k$a;)V

    .line 182
    .line 183
    .line 184
    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 185
    .line 186
    .line 187
    move-result v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 188
    const-string v4, "pauseTime"

    .line 189
    .line 190
    const-string v5, "maxFailedLogTimes"

    .line 191
    .line 192
    if-eqz v0, :cond_5

    .line 193
    .line 194
    :try_start_2
    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    const-string v1, "h"

    .line 199
    .line 200
    const-string v3, ""

    .line 201
    .line 202
    invoke-virtual {v0, v1, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object v0

    .line 206
    const-string v1, "&"

    .line 207
    .line 208
    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v0

    .line 212
    array-length v1, v0

    .line 213
    const/4 v3, 0x2

    .line 214
    if-ne v1, v3, :cond_6

    .line 215
    .line 216
    const/4 v1, 0x0

    .line 217
    aget-object v3, v0, v1

    .line 218
    .line 219
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 220
    .line 221
    .line 222
    move-result v3

    .line 223
    if-nez v3, :cond_6

    .line 224
    .line 225
    const/4 v3, 0x1

    .line 226
    aget-object v6, v0, v3

    .line 227
    .line 228
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 229
    .line 230
    .line 231
    move-result v6
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 232
    if-nez v6, :cond_6

    .line 233
    .line 234
    :try_start_3
    aget-object v1, v0, v1

    .line 235
    .line 236
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 237
    .line 238
    .line 239
    move-result v1

    .line 240
    aget-object v0, v0, v3

    .line 241
    .line 242
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 243
    .line 244
    .line 245
    move-result v0

    .line 246
    invoke-virtual {v11, v5, v1}, Lcom/cmic/sso/sdk/e/k$a;->a(Ljava/lang/String;I)V

    .line 247
    .line 248
    .line 249
    invoke-virtual {v11, v4, v0}, Lcom/cmic/sso/sdk/e/k$a;->a(Ljava/lang/String;I)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 250
    .line 251
    .line 252
    goto :goto_2

    .line 253
    :catch_1
    :try_start_4
    const-string v0, "\u89e3\u6790\u65e5\u5fd7\u4e0a\u62a5\u9650\u5236\u65f6\u95f4\u6b21\u6570\u5f02\u5e38"

    .line 254
    .line 255
    invoke-static {v2, v0}, Lcom/cmic/sso/sdk/e/c;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 256
    .line 257
    .line 258
    goto :goto_2

    .line 259
    :cond_5
    invoke-virtual {v11, v5}, Lcom/cmic/sso/sdk/e/k$a;->a(Ljava/lang/String;)V

    .line 260
    .line 261
    .line 262
    invoke-virtual {v11, v4}, Lcom/cmic/sso/sdk/e/k$a;->a(Ljava/lang/String;)V

    .line 263
    .line 264
    .line 265
    :cond_6
    :goto_2
    invoke-virtual {v11}, Lcom/cmic/sso/sdk/e/k$a;->b()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 266
    .line 267
    .line 268
    goto :goto_4

    .line 269
    :goto_3
    const-string v1, "\u914d\u7f6e\u9879\u5f02\u5e38\uff0c\u914d\u7f6e\u5931\u6548"

    .line 270
    .line 271
    invoke-static {v2, v1}, Lcom/cmic/sso/sdk/e/c;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 272
    .line 273
    .line 274
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 275
    .line 276
    .line 277
    :goto_4
    return-void
.end method

.method private a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Lcom/cmic/sso/sdk/e/k$a;)V
    .locals 1

    .line 297
    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_3

    .line 298
    invoke-virtual {p1, p2, p3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 299
    const-string v0, "CLOSE_FRIEND_WAPKS"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 300
    const-string v0, "0"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "1"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1

    goto :goto_0

    .line 301
    :cond_0
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "CU"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "CT"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "CM"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_1

    goto :goto_0

    .line 302
    :cond_1
    invoke-virtual {p1, p2, p3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p4, p2, p0}, Lcom/cmic/sso/sdk/e/k$a;->a(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    :goto_0
    return-void

    .line 303
    :cond_3
    invoke-virtual {p4, p2}, Lcom/cmic/sso/sdk/e/k$a;->a(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic a(Lcom/cmic/sso/sdk/a/b;Z)Z
    .locals 0

    .line 281
    iput-boolean p1, p0, Lcom/cmic/sso/sdk/a/b;->d:Z

    return p1
.end method

.method public static synthetic b(Lcom/cmic/sso/sdk/a/b;)Lcom/cmic/sso/sdk/a/b$a;
    .locals 0

    .line 30
    iget-object p0, p0, Lcom/cmic/sso/sdk/a/b;->e:Lcom/cmic/sso/sdk/a/b$a;

    return-object p0
.end method

.method private b(Lcom/cmic/sso/sdk/a;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/cmic/sso/sdk/a/b;->d:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-string p0, "UmcConfigHandle"

    .line 6
    .line 7
    const-string p1, "\u6b63\u5728\u83b7\u53d6\u914d\u7f6e\u4e2d..."

    .line 8
    .line 9
    invoke-static {p0, p1}, Lcom/cmic/sso/sdk/e/c;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    const/4 v0, 0x1

    .line 14
    iput-boolean v0, p0, Lcom/cmic/sso/sdk/a/b;->d:Z

    .line 15
    .line 16
    invoke-static {}, Lcom/cmic/sso/sdk/c/c/a;->a()Lcom/cmic/sso/sdk/c/c/a;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Lcom/cmic/sso/sdk/a/b$1;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Lcom/cmic/sso/sdk/a/b$1;-><init>(Lcom/cmic/sso/sdk/a/b;)V

    .line 23
    .line 24
    .line 25
    const/4 p0, 0x0

    .line 26
    invoke-virtual {v0, p0, p1, v1}, Lcom/cmic/sso/sdk/c/c/a;->a(ZLcom/cmic/sso/sdk/a;Lcom/cmic/sso/sdk/c/c/d;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public static synthetic c(Lcom/cmic/sso/sdk/a/b;)Lcom/cmic/sso/sdk/a/a;
    .locals 0

    .line 14
    iget-object p0, p0, Lcom/cmic/sso/sdk/a/b;->a:Lcom/cmic/sso/sdk/a/a;

    return-object p0
.end method

.method private d()Lcom/cmic/sso/sdk/a/a;
    .locals 2

    .line 1
    new-instance v0, Lcom/cmic/sso/sdk/a/a$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/cmic/sso/sdk/a/a$a;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/cmic/sso/sdk/a/b;->b:Lcom/cmic/sso/sdk/a/a;

    .line 7
    .line 8
    invoke-virtual {v1}, Lcom/cmic/sso/sdk/a/a;->a()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-static {v1}, Lcom/cmic/sso/sdk/a/d;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Lcom/cmic/sso/sdk/a/a$a;->a(Ljava/lang/String;)Lcom/cmic/sso/sdk/a/a$a;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object v1, p0, Lcom/cmic/sso/sdk/a/b;->b:Lcom/cmic/sso/sdk/a/a;

    .line 21
    .line 22
    invoke-virtual {v1}, Lcom/cmic/sso/sdk/a/a;->c()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-static {v1}, Lcom/cmic/sso/sdk/a/d;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Lcom/cmic/sso/sdk/a/a$a;->c(Ljava/lang/String;)Lcom/cmic/sso/sdk/a/a$a;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iget-object v1, p0, Lcom/cmic/sso/sdk/a/b;->b:Lcom/cmic/sso/sdk/a/a;

    .line 35
    .line 36
    invoke-virtual {v1}, Lcom/cmic/sso/sdk/a/a;->b()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-static {v1}, Lcom/cmic/sso/sdk/a/d;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v0, v1}, Lcom/cmic/sso/sdk/a/a$a;->b(Ljava/lang/String;)Lcom/cmic/sso/sdk/a/a$a;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iget-object v1, p0, Lcom/cmic/sso/sdk/a/b;->b:Lcom/cmic/sso/sdk/a/a;

    .line 49
    .line 50
    invoke-virtual {v1}, Lcom/cmic/sso/sdk/a/a;->d()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-static {v1}, Lcom/cmic/sso/sdk/a/d;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v0, v1}, Lcom/cmic/sso/sdk/a/a$a;->d(Ljava/lang/String;)Lcom/cmic/sso/sdk/a/a$a;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    iget-object v1, p0, Lcom/cmic/sso/sdk/a/b;->b:Lcom/cmic/sso/sdk/a/a;

    .line 63
    .line 64
    invoke-virtual {v1}, Lcom/cmic/sso/sdk/a/a;->h()Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    invoke-static {v1}, Lcom/cmic/sso/sdk/a/d;->a(Z)Z

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    invoke-virtual {v0, v1}, Lcom/cmic/sso/sdk/a/a$a;->d(Z)Lcom/cmic/sso/sdk/a/a$a;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    iget-object v1, p0, Lcom/cmic/sso/sdk/a/b;->b:Lcom/cmic/sso/sdk/a/a;

    .line 77
    .line 78
    invoke-virtual {v1}, Lcom/cmic/sso/sdk/a/a;->i()Z

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    invoke-static {v1}, Lcom/cmic/sso/sdk/a/d;->b(Z)Z

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    invoke-virtual {v0, v1}, Lcom/cmic/sso/sdk/a/a$a;->e(Z)Lcom/cmic/sso/sdk/a/a$a;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    iget-object v1, p0, Lcom/cmic/sso/sdk/a/b;->b:Lcom/cmic/sso/sdk/a/a;

    .line 91
    .line 92
    invoke-virtual {v1}, Lcom/cmic/sso/sdk/a/a;->e()Z

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    invoke-static {v1}, Lcom/cmic/sso/sdk/a/d;->e(Z)Z

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    invoke-virtual {v0, v1}, Lcom/cmic/sso/sdk/a/a$a;->a(Z)Lcom/cmic/sso/sdk/a/a$a;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    iget-object v1, p0, Lcom/cmic/sso/sdk/a/b;->b:Lcom/cmic/sso/sdk/a/a;

    .line 105
    .line 106
    invoke-virtual {v1}, Lcom/cmic/sso/sdk/a/a;->f()Z

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    invoke-static {v1}, Lcom/cmic/sso/sdk/a/d;->d(Z)Z

    .line 111
    .line 112
    .line 113
    move-result v1

    .line 114
    invoke-virtual {v0, v1}, Lcom/cmic/sso/sdk/a/a$a;->b(Z)Lcom/cmic/sso/sdk/a/a$a;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    iget-object v1, p0, Lcom/cmic/sso/sdk/a/b;->b:Lcom/cmic/sso/sdk/a/a;

    .line 119
    .line 120
    invoke-virtual {v1}, Lcom/cmic/sso/sdk/a/a;->g()Z

    .line 121
    .line 122
    .line 123
    move-result v1

    .line 124
    invoke-static {v1}, Lcom/cmic/sso/sdk/a/d;->c(Z)Z

    .line 125
    .line 126
    .line 127
    move-result v1

    .line 128
    invoke-virtual {v0, v1}, Lcom/cmic/sso/sdk/a/a$a;->c(Z)Lcom/cmic/sso/sdk/a/a$a;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    iget-object v1, p0, Lcom/cmic/sso/sdk/a/b;->b:Lcom/cmic/sso/sdk/a/a;

    .line 133
    .line 134
    invoke-virtual {v1}, Lcom/cmic/sso/sdk/a/a;->j()Z

    .line 135
    .line 136
    .line 137
    move-result v1

    .line 138
    invoke-static {v1}, Lcom/cmic/sso/sdk/a/d;->f(Z)Z

    .line 139
    .line 140
    .line 141
    move-result v1

    .line 142
    invoke-virtual {v0, v1}, Lcom/cmic/sso/sdk/a/a$a;->f(Z)Lcom/cmic/sso/sdk/a/a$a;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    iget-object v1, p0, Lcom/cmic/sso/sdk/a/b;->b:Lcom/cmic/sso/sdk/a/a;

    .line 147
    .line 148
    invoke-virtual {v1}, Lcom/cmic/sso/sdk/a/a;->k()I

    .line 149
    .line 150
    .line 151
    move-result v1

    .line 152
    invoke-static {v1}, Lcom/cmic/sso/sdk/a/d;->a(I)I

    .line 153
    .line 154
    .line 155
    move-result v1

    .line 156
    invoke-virtual {v0, v1}, Lcom/cmic/sso/sdk/a/a$a;->a(I)Lcom/cmic/sso/sdk/a/a$a;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    iget-object p0, p0, Lcom/cmic/sso/sdk/a/b;->b:Lcom/cmic/sso/sdk/a/a;

    .line 161
    .line 162
    invoke-virtual {p0}, Lcom/cmic/sso/sdk/a/a;->l()I

    .line 163
    .line 164
    .line 165
    move-result p0

    .line 166
    invoke-static {p0}, Lcom/cmic/sso/sdk/a/d;->b(I)I

    .line 167
    .line 168
    .line 169
    move-result p0

    .line 170
    invoke-virtual {v0, p0}, Lcom/cmic/sso/sdk/a/a$a;->b(I)Lcom/cmic/sso/sdk/a/a$a;

    .line 171
    .line 172
    .line 173
    move-result-object p0

    .line 174
    invoke-virtual {p0}, Lcom/cmic/sso/sdk/a/a$a;->a()Lcom/cmic/sso/sdk/a/a;

    .line 175
    .line 176
    .line 177
    move-result-object p0

    .line 178
    return-object p0
.end method


# virtual methods
.method public a()Lcom/cmic/sso/sdk/a/a;
    .locals 0

    .line 289
    iget-object p0, p0, Lcom/cmic/sso/sdk/a/b;->b:Lcom/cmic/sso/sdk/a/a;

    return-object p0
.end method

.method public a(Lcom/cmic/sso/sdk/a/b$a;)V
    .locals 0

    .line 282
    iput-object p1, p0, Lcom/cmic/sso/sdk/a/b;->e:Lcom/cmic/sso/sdk/a/b$a;

    return-void
.end method

.method public a(Lcom/cmic/sso/sdk/a;)V
    .locals 1

    .line 304
    invoke-static {}, Lcom/cmic/sso/sdk/a/d;->a()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 305
    new-instance v0, Lcom/cmic/sso/sdk/a/b$2;

    invoke-direct {v0, p0, p1}, Lcom/cmic/sso/sdk/a/b$2;-><init>(Lcom/cmic/sso/sdk/a/b;Lcom/cmic/sso/sdk/a;)V

    invoke-static {v0}, Lcom/cmic/sso/sdk/e/n;->a(Lcom/cmic/sso/sdk/e/n$a;)V

    :cond_0
    return-void
.end method

.method public b()Lcom/cmic/sso/sdk/a/a;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/cmic/sso/sdk/a/b;->a:Lcom/cmic/sso/sdk/a/a;

    return-object p0
.end method

.method public c()V
    .locals 0

    .line 1
    const-string p0, "sso_config_xf"

    .line 2
    .line 3
    invoke-static {p0}, Lcom/cmic/sso/sdk/e/k;->b(Ljava/lang/String;)Lcom/cmic/sso/sdk/e/k$a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/cmic/sso/sdk/e/k$a;->c()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/cmic/sso/sdk/e/k$a;->b()V

    .line 11
    .line 12
    .line 13
    return-void
.end method
