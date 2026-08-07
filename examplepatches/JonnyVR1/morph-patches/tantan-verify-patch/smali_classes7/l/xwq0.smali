.class public Ll/xwq0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/xwq0$d;,
        Ll/xwq0$c;
    }
.end annotation


# static fields
.field protected static a:Landroid/content/Context;

.field private static a:Ll/xwq0$c;

.field private static a:Ll/xwq0;

.field protected static a:Z

.field protected static final b:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ll/swq0;",
            ">;"
        }
    .end annotation
.end field

.field private static c:Ljava/lang/String;

.field private static d:Ljava/lang/String;


# instance fields
.field private a:J

.field private a:Ljava/lang/String;

.field protected final a:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ll/twq0;",
            ">;"
        }
    .end annotation
.end field

.field private a:Ll/vwq0;

.field protected a:Ll/xwq0$d;

.field private final b:J

.field private b:Ljava/lang/String;

.field private c:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/xwq0;->b:Ljava/util/Map;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    sput-boolean v0, Ll/xwq0;->a:Z

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ll/vwq0;Ll/xwq0$d;Ljava/lang/String;)V
    .locals 7

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    .line 64
    invoke-direct/range {v0 .. v6}, Ll/xwq0;-><init>(Landroid/content/Context;Ll/vwq0;Ll/xwq0$d;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ll/vwq0;Ll/xwq0$d;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/xwq0;->a:Ljava/util/Map;

    .line 10
    .line 11
    const-string v0, "0"

    .line 12
    .line 13
    iput-object v0, p0, Ll/xwq0;->a:Ljava/lang/String;

    .line 14
    .line 15
    const-wide/16 v0, 0x0

    .line 16
    .line 17
    iput-wide v0, p0, Ll/xwq0;->a:J

    .line 18
    .line 19
    const-wide/16 v2, 0xf

    .line 20
    .line 21
    iput-wide v2, p0, Ll/xwq0;->b:J

    .line 22
    .line 23
    iput-wide v0, p0, Ll/xwq0;->c:J

    .line 24
    .line 25
    const-string v0, "isp_prov_city_country_ip"

    .line 26
    .line 27
    iput-object v0, p0, Ll/xwq0;->b:Ljava/lang/String;

    .line 28
    .line 29
    iput-object p3, p0, Ll/xwq0;->a:Ll/xwq0$d;

    .line 30
    .line 31
    if-nez p2, :cond_0

    .line 32
    .line 33
    new-instance p2, Ll/xwq0$a;

    .line 34
    .line 35
    invoke-direct {p2, p0}, Ll/xwq0$a;-><init>(Ll/xwq0;)V

    .line 36
    .line 37
    .line 38
    iput-object p2, p0, Ll/xwq0;->a:Ll/vwq0;

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    iput-object p2, p0, Ll/xwq0;->a:Ll/vwq0;

    .line 42
    .line 43
    :goto_0
    iput-object p4, p0, Ll/xwq0;->a:Ljava/lang/String;

    .line 44
    .line 45
    if-eqz p5, :cond_1

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_1
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p5

    .line 52
    :goto_1
    sput-object p5, Ll/xwq0;->c:Ljava/lang/String;

    .line 53
    .line 54
    if-eqz p6, :cond_2

    .line 55
    .line 56
    goto :goto_2

    .line 57
    :cond_2
    invoke-direct {p0}, Ll/xwq0;->g()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p6

    .line 61
    :goto_2
    sput-object p6, Ll/xwq0;->d:Ljava/lang/String;

    .line 62
    .line 63
    return-void
.end method

.method public static a()Ljava/lang/String;
    .locals 4

    .line 628
    sget-object v0, Ll/xwq0;->a:Landroid/content/Context;

    const-string v1, "unknown"

    if-nez v0, :cond_0

    return-object v1

    .line 629
    :cond_0
    :try_start_0
    invoke-static {}, Ll/mtq0;->p()Ll/ntq0;

    move-result-object v0

    if-nez v0, :cond_1

    return-object v1

    .line 630
    :cond_1
    invoke-virtual {v0}, Ll/ntq0;->a()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_2

    .line 631
    const-string v0, "WIFI-UNKNOWN"

    return-object v0

    .line 632
    :cond_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ll/ntq0;->e()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "-"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ll/ntq0;->h()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v0

    :catchall_0
    return-object v1
.end method

.method public static a(Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    .line 719
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    .line 720
    const-string v1, "UTF-8"

    invoke-virtual {p0, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v1

    const/4 v2, 0x0

    .line 721
    :goto_0
    array-length v3, v1

    if-ge v2, v3, :cond_1

    .line 722
    aget-byte v3, v1, v2

    and-int/lit16 v4, v3, 0xf0

    const/16 v5, 0xf0

    if-eq v4, v5, :cond_0

    shr-int/lit8 v5, v3, 0x4

    add-int/2addr v5, v0

    and-int/lit8 v5, v5, 0xf

    int-to-byte v5, v5

    and-int/lit8 v3, v3, 0xf

    xor-int/2addr v3, v5

    or-int/2addr v3, v4

    int-to-byte v3, v3

    .line 723
    aput-byte v3, v1, v2

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 724
    :cond_1
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([B)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    return-object p0
.end method

.method private a(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 20
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/ArrayList<",
            "Ll/swq0;",
            ">;"
        }
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v2, p1

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/xwq0;->e()V

    .line 6
    .line 7
    .line 8
    iget-object v3, v1, Ll/xwq0;->a:Ljava/util/Map;

    .line 9
    .line 10
    monitor-enter v3

    .line 11
    :try_start_0
    invoke-virtual {v1}, Ll/xwq0;->a()Z

    .line 12
    .line 13
    .line 14
    iget-object v0, v1, Ll/xwq0;->a:Ljava/util/Map;

    .line 15
    .line 16
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 25
    .line 26
    .line 27
    move-result v4

    .line 28
    if-eqz v4, :cond_1

    .line 29
    .line 30
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v4

    .line 34
    check-cast v4, Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v5

    .line 40
    if-nez v5, :cond_0

    .line 41
    .line 42
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :catchall_0
    move-exception v0

    .line 47
    goto/16 :goto_11

    .line 48
    .line 49
    :cond_1
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 50
    sget-object v4, Ll/xwq0;->b:Ljava/util/Map;

    .line 51
    .line 52
    monitor-enter v4

    .line 53
    :try_start_1
    invoke-interface {v4}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-interface {v0}, Ljava/util/Collection;->toArray()[Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    array-length v3, v0

    .line 62
    const/4 v6, 0x0

    .line 63
    :goto_1
    if-ge v6, v3, :cond_3

    .line 64
    .line 65
    aget-object v7, v0, v6

    .line 66
    .line 67
    check-cast v7, Ll/swq0;

    .line 68
    .line 69
    invoke-virtual {v7}, Ll/swq0;->u()Z

    .line 70
    .line 71
    .line 72
    move-result v8

    .line 73
    if-nez v8, :cond_2

    .line 74
    .line 75
    sget-object v8, Ll/xwq0;->b:Ljava/util/Map;

    .line 76
    .line 77
    iget-object v7, v7, Ll/swq0;->d:Ljava/lang/String;

    .line 78
    .line 79
    invoke-interface {v8, v7}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    goto :goto_2

    .line 83
    :catchall_1
    move-exception v0

    .line 84
    goto/16 :goto_10

    .line 85
    .line 86
    :cond_2
    :goto_2
    add-int/lit8 v6, v6, 0x1

    .line 87
    .line 88
    goto :goto_1

    .line 89
    :cond_3
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 90
    invoke-virtual {v1}, Ll/xwq0;->b()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    if-nez v0, :cond_4

    .line 99
    .line 100
    invoke-virtual {v1}, Ll/xwq0;->b()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    :cond_4
    new-instance v3, Ljava/util/ArrayList;

    .line 108
    .line 109
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    invoke-direct {v3, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 114
    .line 115
    .line 116
    const/4 v0, 0x0

    .line 117
    :goto_3
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 118
    .line 119
    .line 120
    move-result v4

    .line 121
    if-ge v0, v4, :cond_5

    .line 122
    .line 123
    const/4 v4, 0x0

    .line 124
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 125
    .line 126
    .line 127
    add-int/lit8 v0, v0, 0x1

    .line 128
    .line 129
    goto :goto_3

    .line 130
    :cond_5
    :try_start_2
    sget-object v0, Ll/xwq0;->a:Landroid/content/Context;

    .line 131
    .line 132
    invoke-static {v0}, Ll/mtq0;->x(Landroid/content/Context;)Z

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    if-eqz v0, :cond_6

    .line 137
    .line 138
    const-string v0, "wifi"

    .line 139
    .line 140
    goto :goto_4

    .line 141
    :catch_0
    move-exception v0

    .line 142
    goto/16 :goto_e

    .line 143
    .line 144
    :cond_6
    const-string v0, "wap"

    .line 145
    .line 146
    :goto_4
    iget-object v4, v1, Ll/xwq0;->a:Ljava/lang/String;

    .line 147
    .line 148
    const/4 v6, 0x1

    .line 149
    invoke-virtual {v1, v2, v0, v4, v6}, Ll/xwq0;->a(Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v4

    .line 153
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 154
    .line 155
    .line 156
    move-result v6

    .line 157
    if-nez v6, :cond_13

    .line 158
    .line 159
    new-instance v6, Lorg/json/JSONObject;

    .line 160
    .line 161
    invoke-direct {v6, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    invoke-static {v4}, Ll/ouq0;->w(Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    const-string v4, "OK"

    .line 168
    .line 169
    const-string v7, "S"

    .line 170
    .line 171
    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object v7

    .line 175
    invoke-virtual {v4, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 176
    .line 177
    .line 178
    move-result v4

    .line 179
    if-eqz v4, :cond_13

    .line 180
    .line 181
    const-string v4, "R"

    .line 182
    .line 183
    invoke-virtual {v6, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 184
    .line 185
    .line 186
    move-result-object v4

    .line 187
    const-string v6, "province"

    .line 188
    .line 189
    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object v6

    .line 193
    const-string v7, "city"

    .line 194
    .line 195
    invoke-virtual {v4, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object v7

    .line 199
    const-string v8, "isp"

    .line 200
    .line 201
    invoke-virtual {v4, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object v8

    .line 205
    const-string v9, "ip"

    .line 206
    .line 207
    invoke-virtual {v4, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 208
    .line 209
    .line 210
    move-result-object v9

    .line 211
    const-string v10, "country"

    .line 212
    .line 213
    invoke-virtual {v4, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object v10

    .line 217
    invoke-virtual {v4, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 218
    .line 219
    .line 220
    move-result-object v0

    .line 221
    new-instance v11, Ljava/lang/StringBuilder;

    .line 222
    .line 223
    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    .line 224
    .line 225
    .line 226
    const-string v12, "get bucket: net="

    .line 227
    .line 228
    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 229
    .line 230
    .line 231
    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 232
    .line 233
    .line 234
    const-string v12, ", hosts="

    .line 235
    .line 236
    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 237
    .line 238
    .line 239
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 240
    .line 241
    .line 242
    move-result-object v12

    .line 243
    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 244
    .line 245
    .line 246
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object v11

    .line 250
    invoke-static {v11}, Ll/ouq0;->z(Ljava/lang/String;)V

    .line 251
    .line 252
    .line 253
    const/4 v11, 0x0

    .line 254
    :goto_5
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 255
    .line 256
    .line 257
    move-result v12

    .line 258
    if-ge v11, v12, :cond_d

    .line 259
    .line 260
    invoke-virtual {v2, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 261
    .line 262
    .line 263
    move-result-object v12

    .line 264
    check-cast v12, Ljava/lang/String;

    .line 265
    .line 266
    invoke-virtual {v0, v12}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 267
    .line 268
    .line 269
    move-result-object v15

    .line 270
    if-nez v15, :cond_7

    .line 271
    .line 272
    new-instance v13, Ljava/lang/StringBuilder;

    .line 273
    .line 274
    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    .line 275
    .line 276
    .line 277
    const-string v14, "no bucket found for "

    .line 278
    .line 279
    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 280
    .line 281
    .line 282
    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 283
    .line 284
    .line 285
    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 286
    .line 287
    .line 288
    move-result-object v12

    .line 289
    invoke-static {v12}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 290
    .line 291
    .line 292
    move-object/from16 v19, v0

    .line 293
    .line 294
    goto/16 :goto_8

    .line 295
    .line 296
    :cond_7
    new-instance v5, Ll/swq0;

    .line 297
    .line 298
    invoke-direct {v5, v12}, Ll/swq0;-><init>(Ljava/lang/String;)V

    .line 299
    .line 300
    .line 301
    const/4 v12, 0x0

    .line 302
    const-wide/16 v16, 0x3e8

    .line 303
    .line 304
    :goto_6
    invoke-virtual {v15}, Lorg/json/JSONArray;->length()I

    .line 305
    .line 306
    .line 307
    move-result v13

    .line 308
    if-ge v12, v13, :cond_9

    .line 309
    .line 310
    invoke-virtual {v15, v12}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    .line 311
    .line 312
    .line 313
    move-result-object v13

    .line 314
    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 315
    .line 316
    .line 317
    move-result v14

    .line 318
    if-nez v14, :cond_8

    .line 319
    .line 320
    new-instance v14, Ll/axq0;

    .line 321
    .line 322
    invoke-virtual {v15}, Lorg/json/JSONArray;->length()I

    .line 323
    .line 324
    .line 325
    move-result v18

    .line 326
    move-object/from16 v19, v0

    .line 327
    .line 328
    sub-int v0, v18, v12

    .line 329
    .line 330
    invoke-direct {v14, v13, v0}, Ll/axq0;-><init>(Ljava/lang/String;I)V

    .line 331
    .line 332
    .line 333
    invoke-virtual {v5, v14}, Ll/swq0;->n(Ll/axq0;)V

    .line 334
    .line 335
    .line 336
    goto :goto_7

    .line 337
    :cond_8
    move-object/from16 v19, v0

    .line 338
    .line 339
    :goto_7
    add-int/lit8 v12, v12, 0x1

    .line 340
    .line 341
    move-object/from16 v0, v19

    .line 342
    .line 343
    goto :goto_6

    .line 344
    :cond_9
    move-object/from16 v19, v0

    .line 345
    .line 346
    invoke-virtual {v3, v11, v5}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 347
    .line 348
    .line 349
    iput-object v10, v5, Ll/swq0;->i:Ljava/lang/String;

    .line 350
    .line 351
    iput-object v6, v5, Ll/swq0;->e:Ljava/lang/String;

    .line 352
    .line 353
    iput-object v8, v5, Ll/swq0;->g:Ljava/lang/String;

    .line 354
    .line 355
    iput-object v9, v5, Ll/swq0;->h:Ljava/lang/String;

    .line 356
    .line 357
    iput-object v7, v5, Ll/swq0;->f:Ljava/lang/String;

    .line 358
    .line 359
    const-string v0, "stat-percent"

    .line 360
    .line 361
    invoke-virtual {v4, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 362
    .line 363
    .line 364
    move-result v0

    .line 365
    if-eqz v0, :cond_a

    .line 366
    .line 367
    const-string v0, "stat-percent"

    .line 368
    .line 369
    invoke-virtual {v4, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 370
    .line 371
    .line 372
    move-result-wide v12

    .line 373
    invoke-virtual {v5, v12, v13}, Ll/swq0;->g(D)V

    .line 374
    .line 375
    .line 376
    :cond_a
    const-string v0, "stat-domain"

    .line 377
    .line 378
    invoke-virtual {v4, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 379
    .line 380
    .line 381
    move-result v0

    .line 382
    if-eqz v0, :cond_b

    .line 383
    .line 384
    const-string v0, "stat-domain"

    .line 385
    .line 386
    invoke-virtual {v4, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 387
    .line 388
    .line 389
    move-result-object v0

    .line 390
    invoke-virtual {v5, v0}, Ll/swq0;->r(Ljava/lang/String;)V

    .line 391
    .line 392
    .line 393
    :cond_b
    const-string v0, "ttl"

    .line 394
    .line 395
    invoke-virtual {v4, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 396
    .line 397
    .line 398
    move-result v0

    .line 399
    if-eqz v0, :cond_c

    .line 400
    .line 401
    const-string v0, "ttl"

    .line 402
    .line 403
    invoke-virtual {v4, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 404
    .line 405
    .line 406
    move-result v0

    .line 407
    int-to-long v12, v0

    .line 408
    mul-long v12, v12, v16

    .line 409
    .line 410
    invoke-virtual {v5, v12, v13}, Ll/swq0;->h(J)V

    .line 411
    .line 412
    .line 413
    :cond_c
    invoke-virtual {v5}, Ll/swq0;->a()Ljava/lang/String;

    .line 414
    .line 415
    .line 416
    move-result-object v0

    .line 417
    invoke-virtual {v1, v0}, Ll/xwq0;->a(Ljava/lang/String;)V

    .line 418
    .line 419
    .line 420
    :goto_8
    add-int/lit8 v11, v11, 0x1

    .line 421
    .line 422
    move-object/from16 v0, v19

    .line 423
    .line 424
    goto/16 :goto_5

    .line 425
    .line 426
    :cond_d
    const-wide/16 v16, 0x3e8

    .line 427
    .line 428
    const-string v0, "reserved"

    .line 429
    .line 430
    invoke-virtual {v4, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 431
    .line 432
    .line 433
    move-result-object v0

    .line 434
    if-eqz v0, :cond_13

    .line 435
    .line 436
    const-string v5, "reserved-ttl"

    .line 437
    .line 438
    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 439
    .line 440
    .line 441
    move-result v5

    .line 442
    if-eqz v5, :cond_e

    .line 443
    .line 444
    const-string v5, "reserved-ttl"

    .line 445
    .line 446
    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 447
    .line 448
    .line 449
    move-result v4

    .line 450
    int-to-long v4, v4

    .line 451
    mul-long v4, v4, v16

    .line 452
    .line 453
    goto :goto_9

    .line 454
    :cond_e
    const-wide/32 v4, 0x240c8400

    .line 455
    .line 456
    .line 457
    :goto_9
    invoke-virtual {v0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    .line 458
    .line 459
    .line 460
    move-result-object v6

    .line 461
    :goto_a
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    .line 462
    .line 463
    .line 464
    move-result v7

    .line 465
    if-eqz v7, :cond_13

    .line 466
    .line 467
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 468
    .line 469
    .line 470
    move-result-object v7

    .line 471
    check-cast v7, Ljava/lang/String;

    .line 472
    .line 473
    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 474
    .line 475
    .line 476
    move-result-object v8

    .line 477
    if-nez v8, :cond_f

    .line 478
    .line 479
    new-instance v8, Ljava/lang/StringBuilder;

    .line 480
    .line 481
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 482
    .line 483
    .line 484
    const-string v9, "no bucket found for "

    .line 485
    .line 486
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 487
    .line 488
    .line 489
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 490
    .line 491
    .line 492
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 493
    .line 494
    .line 495
    move-result-object v7

    .line 496
    invoke-static {v7}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 497
    .line 498
    .line 499
    goto :goto_a

    .line 500
    :cond_f
    new-instance v9, Ll/swq0;

    .line 501
    .line 502
    invoke-direct {v9, v7}, Ll/swq0;-><init>(Ljava/lang/String;)V

    .line 503
    .line 504
    .line 505
    invoke-virtual {v9, v4, v5}, Ll/swq0;->h(J)V

    .line 506
    .line 507
    .line 508
    const/4 v10, 0x0

    .line 509
    :goto_b
    invoke-virtual {v8}, Lorg/json/JSONArray;->length()I

    .line 510
    .line 511
    .line 512
    move-result v11

    .line 513
    if-ge v10, v11, :cond_11

    .line 514
    .line 515
    invoke-virtual {v8, v10}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    .line 516
    .line 517
    .line 518
    move-result-object v11

    .line 519
    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 520
    .line 521
    .line 522
    move-result v12

    .line 523
    if-nez v12, :cond_10

    .line 524
    .line 525
    new-instance v12, Ll/axq0;

    .line 526
    .line 527
    invoke-virtual {v8}, Lorg/json/JSONArray;->length()I

    .line 528
    .line 529
    .line 530
    move-result v13

    .line 531
    sub-int/2addr v13, v10

    .line 532
    invoke-direct {v12, v11, v13}, Ll/axq0;-><init>(Ljava/lang/String;I)V

    .line 533
    .line 534
    .line 535
    invoke-virtual {v9, v12}, Ll/swq0;->n(Ll/axq0;)V

    .line 536
    .line 537
    .line 538
    :cond_10
    add-int/lit8 v10, v10, 0x1

    .line 539
    .line 540
    goto :goto_b

    .line 541
    :cond_11
    sget-object v8, Ll/xwq0;->b:Ljava/util/Map;

    .line 542
    .line 543
    monitor-enter v8
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 544
    :try_start_3
    iget-object v10, v1, Ll/xwq0;->a:Ll/vwq0;

    .line 545
    .line 546
    invoke-interface {v10, v7}, Ll/vwq0;->a(Ljava/lang/String;)Z

    .line 547
    .line 548
    .line 549
    move-result v10

    .line 550
    if-eqz v10, :cond_12

    .line 551
    .line 552
    invoke-interface {v8, v7, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 553
    .line 554
    .line 555
    goto :goto_c

    .line 556
    :catchall_2
    move-exception v0

    .line 557
    goto :goto_d

    .line 558
    :cond_12
    :goto_c
    monitor-exit v8

    .line 559
    goto :goto_a

    .line 560
    :goto_d
    monitor-exit v8
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 561
    :try_start_4
    throw v0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 562
    :goto_e
    new-instance v4, Ljava/lang/StringBuilder;

    .line 563
    .line 564
    const-string v5, "failed to get bucket "

    .line 565
    .line 566
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 567
    .line 568
    .line 569
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 570
    .line 571
    .line 572
    move-result-object v0

    .line 573
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 574
    .line 575
    .line 576
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 577
    .line 578
    .line 579
    move-result-object v0

    .line 580
    invoke-static {v0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 581
    .line 582
    .line 583
    :cond_13
    const/4 v5, 0x0

    .line 584
    :goto_f
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 585
    .line 586
    .line 587
    move-result v0

    .line 588
    if-ge v5, v0, :cond_15

    .line 589
    .line 590
    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 591
    .line 592
    .line 593
    move-result-object v0

    .line 594
    check-cast v0, Ll/swq0;

    .line 595
    .line 596
    if-eqz v0, :cond_14

    .line 597
    .line 598
    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 599
    .line 600
    .line 601
    move-result-object v4

    .line 602
    check-cast v4, Ljava/lang/String;

    .line 603
    .line 604
    invoke-virtual {v1, v4, v0}, Ll/xwq0;->a(Ljava/lang/String;Ll/swq0;)V

    .line 605
    .line 606
    .line 607
    :cond_14
    add-int/lit8 v5, v5, 0x1

    .line 608
    .line 609
    goto :goto_f

    .line 610
    :cond_15
    invoke-virtual {v1}, Ll/xwq0;->c()V

    .line 611
    .line 612
    .line 613
    return-object v3

    .line 614
    :goto_10
    :try_start_5
    monitor-exit v4
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 615
    throw v0

    .line 616
    :goto_11
    :try_start_6
    monitor-exit v3
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 617
    throw v0
.end method

.method public static declared-synchronized a()Ll/xwq0;
    .locals 3

    const-class v0, Ll/xwq0;

    monitor-enter v0

    .line 647
    :try_start_0
    sget-object v1, Ll/xwq0;->a:Ll/xwq0;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_0

    .line 648
    monitor-exit v0

    return-object v1

    .line 649
    :cond_0
    :try_start_1
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "the host manager is not initialized yet."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    :catchall_0
    move-exception v1

    .line 650
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public static declared-synchronized a(Landroid/content/Context;Ll/vwq0;Ll/xwq0$d;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 9

    const-class v1, Ll/xwq0;

    monitor-enter v1

    .line 621
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    sput-object v0, Ll/xwq0;->a:Landroid/content/Context;

    if-nez v0, :cond_0

    .line 622
    sput-object p0, Ll/xwq0;->a:Landroid/content/Context;

    goto :goto_0

    :catchall_0
    move-exception v0

    move-object p0, v0

    goto :goto_2

    .line 623
    :cond_0
    :goto_0
    sget-object v0, Ll/xwq0;->a:Ll/xwq0;

    if-nez v0, :cond_2

    .line 624
    sget-object v0, Ll/xwq0;->a:Ll/xwq0$c;

    if-nez v0, :cond_1

    .line 625
    new-instance v2, Ll/xwq0;

    move-object v3, p0

    move-object v4, p1

    move-object v5, p2

    move-object v6, p3

    move-object v7, p4

    move-object v8, p5

    invoke-direct/range {v2 .. v8}, Ll/xwq0;-><init>(Landroid/content/Context;Ll/vwq0;Ll/xwq0$d;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sput-object v2, Ll/xwq0;->a:Ll/xwq0;

    goto :goto_1

    :cond_1
    move-object v3, p0

    move-object v4, p1

    move-object v5, p2

    move-object v6, p3

    .line 626
    invoke-interface {v0, v3, v4, v5, v6}, Ll/xwq0$c;->a(Landroid/content/Context;Ll/vwq0;Ll/xwq0$d;Ljava/lang/String;)Ll/xwq0;

    move-result-object p0

    sput-object p0, Ll/xwq0;->a:Ll/xwq0;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 627
    :cond_2
    :goto_1
    monitor-exit v1

    return-void

    :goto_2
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public static a(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 709
    sget-object v0, Ll/xwq0;->b:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ll/swq0;

    .line 710
    monitor-enter v0

    if-nez v1, :cond_0

    .line 711
    :try_start_0
    new-instance v1, Ll/swq0;

    invoke-direct {v1, p0}, Ll/swq0;-><init>(Ljava/lang/String;)V

    const-wide/32 v2, 0x240c8400

    .line 712
    invoke-virtual {v1, v2, v3}, Ll/swq0;->h(J)V

    .line 713
    invoke-virtual {v1, p1}, Ll/swq0;->i(Ljava/lang/String;)V

    .line 714
    invoke-interface {v0, p0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :catchall_0
    move-exception p0

    goto :goto_1

    .line 715
    :cond_0
    invoke-virtual {v1, p1}, Ll/swq0;->i(Ljava/lang/String;)V

    .line 716
    :goto_0
    monitor-exit v0

    return-void

    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public static declared-synchronized a(Ll/xwq0$c;)V
    .locals 1

    const-class v0, Ll/xwq0;

    monitor-enter v0

    .line 618
    :try_start_0
    sput-object p0, Ll/xwq0;->a:Ll/xwq0$c;

    const/4 p0, 0x0

    .line 619
    sput-object p0, Ll/xwq0;->a:Ll/xwq0;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 620
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method private a()[B
    .locals 1

    .line 717
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v0, Ll/xwq0;->a:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "_key_salt"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 718
    invoke-static {p0}, Ll/zuq0;->c(Ljava/lang/String;)[B

    move-result-object p0

    return-object p0
.end method

.method private f()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "host_fallbacks"

    .line 2
    .line 3
    return-object p0
.end method

.method private g()Ljava/lang/String;
    .locals 2

    .line 1
    :try_start_0
    sget-object p0, Ll/xwq0;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget-object v0, Ll/xwq0;->a:Landroid/content/Context;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/16 v1, 0x4000

    .line 14
    .line 15
    invoke-virtual {p0, v0, v1}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    return-object p0

    .line 24
    :catch_0
    :cond_0
    const-string p0, "0"

    .line 25
    .line 26
    return-object p0
.end method


# virtual methods
.method public a(Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 651
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 652
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 653
    new-instance v2, Ll/jtq0;

    const-string v3, "type"

    invoke-direct {v2, v3, p2}, Ll/jtq0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 654
    const-string v2, "wap"

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_0

    .line 655
    new-instance p2, Ll/jtq0;

    const-string v2, "conpt"

    sget-object v3, Ll/xwq0;->a:Landroid/content/Context;

    invoke-static {v3}, Ll/mtq0;->e(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ll/xwq0;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p2, v2, v3}, Ll/jtq0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    if-eqz p4, :cond_1

    .line 656
    new-instance p2, Ll/jtq0;

    const-string p4, "reserved"

    const-string v2, "1"

    invoke-direct {p2, p4, v2}, Ll/jtq0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 657
    :cond_1
    new-instance p2, Ll/jtq0;

    const-string p4, "uuid"

    invoke-direct {p2, p4, p3}, Ll/jtq0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 658
    new-instance p2, Ll/jtq0;

    const-string p3, "list"

    const-string p4, ","

    invoke-static {p1, p4}, Ll/bvq0;->d(Ljava/util/Collection;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p3, p1}, Ll/jtq0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 659
    new-instance p1, Ll/jtq0;

    const-string p2, "countrycode"

    sget-object p3, Ll/xwq0;->a:Landroid/content/Context;

    invoke-static {p3}, Lcom/xiaomi/push/service/b;->a(Landroid/content/Context;)Lcom/xiaomi/push/service/b;

    move-result-object p3

    invoke-virtual {p3}, Lcom/xiaomi/push/service/b;->b()Ljava/lang/String;

    move-result-object p3

    invoke-direct {p1, p2, p3}, Ll/jtq0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 660
    new-instance p1, Ll/jtq0;

    const-string p2, "push_sdk_vc"

    const p3, 0xc6dd

    invoke-static {p3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p3

    invoke-direct {p1, p2, p3}, Ll/jtq0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 661
    invoke-virtual {p0}, Ll/xwq0;->b()Ljava/lang/String;

    move-result-object p1

    .line 662
    invoke-virtual {p0, p1}, Ll/xwq0;->c(Ljava/lang/String;)Ll/swq0;

    move-result-object p2

    .line 663
    sget-object p3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string p4, "https://%1$s/gslb/?ver=5.0"

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object v2

    invoke-static {p3, p4, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p3

    if-nez p2, :cond_3

    .line 664
    invoke-virtual {v0, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 665
    sget-object p4, Ll/xwq0;->b:Ljava/util/Map;

    monitor-enter p4

    .line 666
    :try_start_0
    invoke-interface {p4, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ll/swq0;

    if-eqz p1, :cond_2

    const/4 p2, 0x1

    .line 667
    invoke-virtual {p1, p2}, Ll/swq0;->d(Z)Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    .line 668
    sget-object p3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "https://%1$s/gslb/?ver=5.0"

    filled-new-array {p2}, [Ljava/lang/Object;

    move-result-object p2

    invoke-static {p3, v2, p2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :catchall_0
    move-exception p0

    goto :goto_1

    .line 669
    :cond_2
    monitor-exit p4

    goto :goto_2

    :goto_1
    monitor-exit p4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    .line 670
    :cond_3
    invoke-virtual {p2, p3}, Ll/swq0;->c(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    .line 671
    :goto_2
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const/4 p2, 0x0

    move-object p3, p2

    :goto_3
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p4

    if-eqz p4, :cond_6

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/String;

    .line 672
    invoke-static {p3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p3

    invoke-virtual {p3}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p3

    .line 673
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p4

    :goto_4
    invoke-interface {p4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {p4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ll/ltq0;

    .line 674
    invoke-interface {v0}, Ll/ltq0;->a()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0}, Ll/ltq0;->b()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v2, v0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    goto :goto_4

    .line 675
    :cond_4
    :try_start_1
    iget-object p4, p0, Ll/xwq0;->a:Ll/xwq0$d;

    if-nez p4, :cond_5

    .line 676
    sget-object p4, Ll/xwq0;->a:Landroid/content/Context;

    new-instance v0, Ljava/net/URL;

    .line 677
    invoke-virtual {p3}, Landroid/net/Uri$Builder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-direct {v0, p3}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-static {p4, v0}, Ll/mtq0;->f(Landroid/content/Context;Ljava/net/URL;)Ljava/lang/String;

    move-result-object p0

    goto :goto_5

    :catch_0
    move-exception p3

    goto :goto_3

    .line 678
    :cond_5
    invoke-virtual {p3}, Landroid/net/Uri$Builder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-interface {p4, p3}, Ll/xwq0$d;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    :goto_5
    return-object p0

    :cond_6
    if-nez p3, :cond_7

    return-object p2

    .line 679
    :cond_7
    new-instance p0, Ljava/lang/StringBuilder;

    const-string p1, "network exception: "

    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 680
    throw p3
.end method

.method public a(Ljava/lang/String;)Ll/swq0;
    .locals 1

    .line 633
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 634
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 635
    invoke-virtual {v0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x1

    .line 636
    invoke-virtual {p0, p1, v0}, Ll/xwq0;->a(Ljava/lang/String;Z)Ll/swq0;

    move-result-object p0

    return-object p0

    .line 637
    :cond_0
    const-string p0, "the url is empty"

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public a(Ljava/lang/String;Z)Ll/swq0;
    .locals 3

    .line 638
    const-string v0, ", fetchRemoteIfNeed="

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const-string v2, "-->getFallbacksByHost(): host="

    filled-new-array {v2, p1, v0, v1}, [Ljava/lang/Object;

    move-result-object v0

    const-string v1, "HostManager"

    invoke-static {v1, v0}, Ll/ouq0;->y(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 639
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_3

    .line 640
    iget-object v0, p0, Ll/xwq0;->a:Ll/vwq0;

    invoke-interface {v0, p1}, Ll/vwq0;->a(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    return-object v1

    .line 641
    :cond_0
    invoke-virtual {p0, p1}, Ll/xwq0;->c(Ljava/lang/String;)Ll/swq0;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 642
    invoke-virtual {v0}, Ll/swq0;->u()Z

    move-result v1

    if-eqz v1, :cond_1

    return-object v0

    :cond_1
    if-eqz p2, :cond_2

    .line 643
    sget-object p2, Ll/xwq0;->a:Landroid/content/Context;

    invoke-static {p2}, Ll/mtq0;->t(Landroid/content/Context;)Z

    move-result p2

    if-eqz p2, :cond_2

    .line 644
    invoke-virtual {p0, p1}, Ll/xwq0;->e(Ljava/lang/String;)Ll/swq0;

    move-result-object p2

    if-eqz p2, :cond_2

    return-object p2

    .line 645
    :cond_2
    new-instance p2, Ll/xwq0$b;

    invoke-direct {p2, p0, p1, v0}, Ll/xwq0$b;-><init>(Ll/xwq0;Ljava/lang/String;Ll/swq0;)V

    return-object p2

    .line 646
    :cond_3
    const-string p0, "the host is empty"

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    return-object v1
.end method

.method public a()Lorg/json/JSONObject;
    .locals 4

    .line 726
    iget-object v0, p0, Ll/xwq0;->a:Ljava/util/Map;

    monitor-enter v0

    .line 727
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 728
    const-string v2, "ver"

    const/4 v3, 0x2

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 729
    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    .line 730
    iget-object p0, p0, Ll/xwq0;->a:Ljava/util/Map;

    invoke-interface {p0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ll/twq0;

    .line 731
    invoke-virtual {v3}, Ll/twq0;->e()Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_0

    :catchall_0
    move-exception p0

    goto :goto_2

    .line 732
    :cond_0
    const-string p0, "data"

    invoke-virtual {v1, p0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 733
    new-instance p0, Lorg/json/JSONArray;

    invoke-direct {p0}, Lorg/json/JSONArray;-><init>()V

    .line 734
    sget-object v2, Ll/xwq0;->b:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ll/swq0;

    .line 735
    invoke-virtual {v3}, Ll/swq0;->f()Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_1

    .line 736
    :cond_1
    const-string v2, "reserved"

    invoke-virtual {v1, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 737
    monitor-exit v0

    return-object v1

    .line 738
    :goto_2
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public a()V
    .locals 1

    .line 681
    iget-object v0, p0, Ll/xwq0;->a:Ljava/util/Map;

    monitor-enter v0

    .line 682
    :try_start_0
    iget-object p0, p0, Ll/xwq0;->a:Ljava/util/Map;

    invoke-interface {p0}, Ljava/util/Map;->clear()V

    .line 683
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public a(Ljava/lang/String;)V
    .locals 0

    .line 725
    iput-object p1, p0, Ll/xwq0;->b:Ljava/lang/String;

    return-void
.end method

.method public a(Ljava/lang/String;Ll/swq0;)V
    .locals 2

    .line 684
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    if-eqz p2, :cond_2

    .line 685
    iget-object v0, p0, Ll/xwq0;->a:Ll/vwq0;

    invoke-interface {v0, p1}, Ll/vwq0;->a(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 686
    iget-object v0, p0, Ll/xwq0;->a:Ljava/util/Map;

    monitor-enter v0

    .line 687
    :try_start_0
    invoke-virtual {p0}, Ll/xwq0;->a()Z

    .line 688
    iget-object v1, p0, Ll/xwq0;->a:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 689
    iget-object p0, p0, Ll/xwq0;->a:Ljava/util/Map;

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ll/twq0;

    .line 690
    invoke-virtual {p0, p2}, Ll/twq0;->f(Ll/swq0;)V

    goto :goto_0

    :catchall_0
    move-exception p0

    goto :goto_1

    .line 691
    :cond_0
    new-instance v1, Ll/twq0;

    invoke-direct {v1, p1}, Ll/twq0;-><init>(Ljava/lang/String;)V

    .line 692
    invoke-virtual {v1, p2}, Ll/twq0;->f(Ll/swq0;)V

    .line 693
    iget-object p0, p0, Ll/xwq0;->a:Ljava/util/Map;

    invoke-interface {p0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 694
    :goto_0
    monitor-exit v0

    return-void

    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :cond_1
    return-void

    .line 695
    :cond_2
    const-string p0, "the argument is invalid "

    const-string v0, ", "

    invoke-static {p0, p1, v0, p2}, Ll/wwq0;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public a()Z
    .locals 5

    .line 696
    const-string v0, "load bucket failure: "

    iget-object v1, p0, Ll/xwq0;->a:Ljava/util/Map;

    monitor-enter v1

    .line 697
    :try_start_0
    sget-boolean v2, Ll/xwq0;->a:Z

    const/4 v3, 0x1

    if-nez v2, :cond_1

    .line 698
    sput-boolean v3, Ll/xwq0;->a:Z

    .line 699
    iget-object v2, p0, Ll/xwq0;->a:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 700
    :try_start_1
    invoke-virtual {p0}, Ll/xwq0;->d()Ljava/lang/String;

    move-result-object v2

    .line 701
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 702
    invoke-virtual {p0, v2}, Ll/xwq0;->b(Ljava/lang/String;)V

    .line 703
    const-string p0, "loading the new hosts succeed"

    invoke-static {p0}, Ll/ouq0;->w(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 704
    :try_start_2
    monitor-exit v1

    return v3

    :catchall_0
    move-exception p0

    goto :goto_0

    :catchall_1
    move-exception p0

    .line 705
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 706
    :cond_0
    monitor-exit v1

    const/4 p0, 0x0

    return p0

    .line 707
    :cond_1
    monitor-exit v1

    return v3

    .line 708
    :goto_0
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p0
.end method

.method public b()Ljava/lang/String;
    .locals 0

    .line 155
    const-string p0, "resolver.msg.xiaomi.net"

    return-object p0
.end method

.method public b(Ljava/lang/String;)Ll/swq0;
    .locals 1

    const/4 v0, 0x1

    .line 169
    invoke-virtual {p0, p1, v0}, Ll/xwq0;->a(Ljava/lang/String;Z)Ll/swq0;

    move-result-object p0

    return-object p0
.end method

.method public b()V
    .locals 5

    .line 156
    iget-object v0, p0, Ll/xwq0;->a:Ljava/util/Map;

    monitor-enter v0

    .line 157
    :try_start_0
    invoke-virtual {p0}, Ll/xwq0;->a()Z

    .line 158
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Ll/xwq0;->a:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 159
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    :goto_0
    if-ltz v2, :cond_1

    .line 160
    iget-object v3, p0, Ll/xwq0;->a:Ljava/util/Map;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ll/twq0;

    if-eqz v3, :cond_0

    .line 161
    invoke-virtual {v3}, Ll/twq0;->c()Ll/swq0;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 162
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_1

    :catchall_0
    move-exception p0

    goto :goto_3

    :cond_0
    :goto_1
    add-int/lit8 v2, v2, -0x1

    goto :goto_0

    .line 163
    :cond_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 164
    invoke-direct {p0, v1}, Ll/xwq0;->a(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v0

    const/4 v2, 0x0

    .line 165
    :goto_2
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v2, v3, :cond_3

    .line 166
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 167
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ll/swq0;

    invoke-virtual {p0, v3, v4}, Ll/xwq0;->a(Ljava/lang/String;Ll/swq0;)V

    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    :cond_3
    return-void

    .line 168
    :goto_3
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public b(Ljava/lang/String;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/xwq0;->a:Ljava/util/Map;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/xwq0;->a:Ljava/util/Map;

    .line 5
    .line 6
    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 7
    .line 8
    .line 9
    new-instance v1, Lorg/json/JSONObject;

    .line 10
    .line 11
    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const-string p1, "ver"

    .line 15
    .line 16
    invoke-virtual {v1, p1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    const/4 v2, 0x2

    .line 21
    if-ne p1, v2, :cond_3

    .line 22
    .line 23
    const-string p1, "data"

    .line 24
    .line 25
    invoke-virtual {v1, p1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const/4 v2, 0x0

    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    move v3, v2

    .line 33
    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    if-ge v3, v4, :cond_0

    .line 38
    .line 39
    new-instance v4, Ll/twq0;

    .line 40
    .line 41
    invoke-direct {v4}, Ll/twq0;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    .line 45
    .line 46
    .line 47
    move-result-object v5

    .line 48
    invoke-virtual {v4, v5}, Ll/twq0;->d(Lorg/json/JSONObject;)Ll/twq0;

    .line 49
    .line 50
    .line 51
    move-result-object v4

    .line 52
    iget-object v5, p0, Ll/xwq0;->a:Ljava/util/Map;

    .line 53
    .line 54
    invoke-virtual {v4}, Ll/twq0;->a()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v6

    .line 58
    invoke-interface {v5, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    add-int/lit8 v3, v3, 0x1

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :catchall_0
    move-exception p0

    .line 65
    goto :goto_3

    .line 66
    :cond_0
    const-string p0, "reserved"

    .line 67
    .line 68
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    if-eqz p0, :cond_2

    .line 73
    .line 74
    :goto_1
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    if-ge v2, p1, :cond_2

    .line 79
    .line 80
    invoke-virtual {p0, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    const-string v1, "host"

    .line 85
    .line 86
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 91
    .line 92
    .line 93
    move-result v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 94
    if-nez v3, :cond_1

    .line 95
    .line 96
    :try_start_1
    new-instance v3, Ll/swq0;

    .line 97
    .line 98
    invoke-direct {v3, v1}, Ll/swq0;-><init>(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v3, p1}, Ll/swq0;->e(Lorg/json/JSONObject;)Ll/swq0;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    sget-object v1, Ll/xwq0;->b:Ljava/util/Map;

    .line 106
    .line 107
    iget-object v3, p1, Ll/swq0;->d:Ljava/lang/String;

    .line 108
    .line 109
    invoke-interface {v1, v3, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    new-instance v1, Ljava/lang/StringBuilder;

    .line 113
    .line 114
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 115
    .line 116
    .line 117
    const-string v3, "load local reserved host for "

    .line 118
    .line 119
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    iget-object p1, p1, Ll/swq0;->d:Ljava/lang/String;

    .line 123
    .line 124
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    invoke-static {p1}, Ll/ouq0;->m(Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 132
    .line 133
    .line 134
    goto :goto_2

    .line 135
    :catch_0
    :try_start_2
    const-string p1, "parse reserved host fail."

    .line 136
    .line 137
    invoke-static {p1}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    :cond_1
    :goto_2
    add-int/lit8 v2, v2, 0x1

    .line 141
    .line 142
    goto :goto_1

    .line 143
    :cond_2
    monitor-exit v0

    .line 144
    return-void

    .line 145
    :cond_3
    new-instance p0, Lorg/json/JSONException;

    .line 146
    .line 147
    const-string p1, "Bad version"

    .line 148
    .line 149
    invoke-direct {p0, p1}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    .line 150
    .line 151
    .line 152
    throw p0

    .line 153
    :goto_3
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 154
    throw p0
.end method

.method public c()Ljava/lang/String;
    .locals 4

    .line 133
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 134
    iget-object v1, p0, Ll/xwq0;->a:Ljava/util/Map;

    monitor-enter v1

    .line 135
    :try_start_0
    iget-object p0, p0, Ll/xwq0;->a:Ljava/util/Map;

    .line 136
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 137
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 138
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    const-string v3, ":\n"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ll/twq0;

    invoke-virtual {v2}, Ll/twq0;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    const-string v2, "\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :catchall_0
    move-exception p0

    goto :goto_1

    .line 142
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 143
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 144
    :goto_1
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public c(Ljava/lang/String;)Ll/swq0;
    .locals 1

    .line 145
    iget-object v0, p0, Ll/xwq0;->a:Ljava/util/Map;

    monitor-enter v0

    .line 146
    :try_start_0
    invoke-virtual {p0}, Ll/xwq0;->a()Z

    .line 147
    iget-object p0, p0, Ll/xwq0;->a:Ljava/util/Map;

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ll/twq0;

    .line 148
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p0, :cond_0

    .line 149
    invoke-virtual {p0}, Ll/twq0;->c()Ll/swq0;

    move-result-object p0

    if-eqz p0, :cond_0

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0

    :catchall_0
    move-exception p0

    .line 150
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public c()V
    .locals 7

    .line 1
    const-string v0, "persist bucket failure: "

    .line 2
    .line 3
    const-string v1, "persist host fallbacks = "

    .line 4
    .line 5
    iget-object v2, p0, Ll/xwq0;->a:Ljava/util/Map;

    .line 6
    .line 7
    monitor-enter v2

    .line 8
    const/4 v3, 0x0

    .line 9
    :try_start_0
    invoke-virtual {p0}, Ll/xwq0;->a()Lorg/json/JSONObject;

    .line 10
    .line 11
    .line 12
    move-result-object v4

    .line 13
    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v4

    .line 17
    new-instance v5, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    invoke-direct {v5, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-static {v1}, Ll/ouq0;->w(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-nez v1, :cond_0

    .line 37
    .line 38
    sget-object v1, Ll/xwq0;->a:Landroid/content/Context;

    .line 39
    .line 40
    invoke-direct {p0}, Ll/xwq0;->f()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v5

    .line 44
    const/4 v6, 0x0

    .line 45
    invoke-virtual {v1, v5, v6}, Landroid/content/Context;->openFileOutput(Ljava/lang/String;I)Ljava/io/FileOutputStream;

    .line 46
    .line 47
    .line 48
    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 49
    :try_start_1
    new-instance v5, Ljava/io/BufferedOutputStream;

    .line 50
    .line 51
    invoke-direct {v5, v1}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 52
    .line 53
    .line 54
    :try_start_2
    invoke-direct {p0}, Ll/xwq0;->a()[B

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    sget-object v3, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    .line 59
    .line 60
    invoke-virtual {v4, v3}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    invoke-static {p0, v3}, Ll/g3r0;->c([B[B)[B

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {v5, p0}, Ljava/io/OutputStream;->write([B)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v5}, Ljava/io/BufferedOutputStream;->flush()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 72
    .line 73
    .line 74
    move-object v3, v5

    .line 75
    goto :goto_0

    .line 76
    :catchall_0
    move-exception p0

    .line 77
    move-object v3, v5

    .line 78
    goto :goto_3

    .line 79
    :catch_0
    move-exception p0

    .line 80
    move-object v3, v5

    .line 81
    goto :goto_1

    .line 82
    :catchall_1
    move-exception p0

    .line 83
    goto :goto_3

    .line 84
    :catch_1
    move-exception p0

    .line 85
    goto :goto_1

    .line 86
    :catchall_2
    move-exception p0

    .line 87
    move-object v1, v3

    .line 88
    goto :goto_3

    .line 89
    :catch_2
    move-exception p0

    .line 90
    move-object v1, v3

    .line 91
    goto :goto_1

    .line 92
    :cond_0
    move-object v1, v3

    .line 93
    :goto_0
    :try_start_3
    invoke-static {v3}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 94
    .line 95
    .line 96
    invoke-static {v1}, Ll/j6r0;->b(Ljava/io/Closeable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    .line 97
    .line 98
    .line 99
    goto :goto_2

    .line 100
    :catchall_3
    move-exception p0

    .line 101
    goto :goto_4

    .line 102
    :goto_1
    :try_start_4
    new-instance v4, Ljava/lang/StringBuilder;

    .line 103
    .line 104
    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 119
    .line 120
    .line 121
    goto :goto_0

    .line 122
    :goto_2
    :try_start_5
    monitor-exit v2

    .line 123
    return-void

    .line 124
    :goto_3
    invoke-static {v3}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 125
    .line 126
    .line 127
    invoke-static {v1}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 128
    .line 129
    .line 130
    throw p0

    .line 131
    :goto_4
    monitor-exit v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 132
    throw p0
.end method

.method public d()Ljava/lang/String;
    .locals 7

    .line 1
    const-string v0, "load host exception "

    .line 2
    .line 3
    const-string v1, "load host fallbacks = "

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    :try_start_0
    new-instance v3, Ljava/io/File;

    .line 7
    .line 8
    sget-object v4, Ll/xwq0;->a:Landroid/content/Context;

    .line 9
    .line 10
    invoke-virtual {v4}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 11
    .line 12
    .line 13
    move-result-object v4

    .line 14
    invoke-direct {p0}, Ll/xwq0;->f()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v5

    .line 18
    invoke-direct {v3, v4, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v3}, Ljava/io/File;->isFile()Z

    .line 22
    .line 23
    .line 24
    move-result v4

    .line 25
    if-eqz v4, :cond_0

    .line 26
    .line 27
    new-instance v4, Ljava/io/FileInputStream;

    .line 28
    .line 29
    invoke-direct {v4, v3}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 30
    .line 31
    .line 32
    :try_start_1
    new-instance v3, Ljava/io/BufferedInputStream;

    .line 33
    .line 34
    invoke-direct {v3, v4}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 35
    .line 36
    .line 37
    :try_start_2
    invoke-static {v3}, Ll/j6r0;->g(Ljava/io/InputStream;)[B

    .line 38
    .line 39
    .line 40
    move-result-object v5

    .line 41
    new-instance v6, Ljava/lang/String;

    .line 42
    .line 43
    invoke-direct {p0}, Ll/xwq0;->a()[B

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-static {p0, v5}, Ll/g3r0;->b([B[B)[B

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    sget-object v5, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    .line 52
    .line 53
    invoke-direct {v6, p0, v5}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v1, v6}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-static {p0}, Ll/ouq0;->w(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 61
    .line 62
    .line 63
    invoke-static {v3}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 64
    .line 65
    .line 66
    invoke-static {v4}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 67
    .line 68
    .line 69
    return-object v6

    .line 70
    :catchall_0
    move-exception p0

    .line 71
    goto :goto_0

    .line 72
    :catchall_1
    move-exception p0

    .line 73
    move-object v3, v2

    .line 74
    goto :goto_0

    .line 75
    :catchall_2
    move-exception p0

    .line 76
    move-object v3, v2

    .line 77
    move-object v4, v3

    .line 78
    goto :goto_0

    .line 79
    :cond_0
    invoke-static {v2}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 80
    .line 81
    .line 82
    invoke-static {v2}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 83
    .line 84
    .line 85
    goto :goto_1

    .line 86
    :goto_0
    :try_start_3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 87
    .line 88
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    .line 103
    .line 104
    .line 105
    invoke-static {v3}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 106
    .line 107
    .line 108
    invoke-static {v4}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 109
    .line 110
    .line 111
    :goto_1
    return-object v2

    .line 112
    :catchall_3
    move-exception p0

    .line 113
    invoke-static {v3}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 114
    .line 115
    .line 116
    invoke-static {v4}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 117
    .line 118
    .line 119
    throw p0
.end method

.method public d(Ljava/lang/String;)Ll/swq0;
    .locals 0

    .line 120
    sget-object p0, Ll/xwq0;->b:Ljava/util/Map;

    monitor-enter p0

    .line 121
    :try_start_0
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ll/swq0;

    .line 122
    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public d()V
    .locals 4

    .line 123
    const-string v0, "Old host fallbacks file "

    const-string v1, "Delete old host fallbacks file "

    .line 124
    invoke-virtual {p0}, Ll/xwq0;->e()Ljava/lang/String;

    move-result-object p0

    .line 125
    :try_start_0
    new-instance v2, Ljava/io/File;

    sget-object v3, Ll/xwq0;->a:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v3

    invoke-direct {v2, v3, p0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 126
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 127
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    move-result v0

    .line 128
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v0, :cond_0

    const-string v0, " successful."

    goto :goto_0

    :catch_0
    move-exception v0

    goto :goto_1

    :cond_0
    const-string v0, " failed."

    :goto_0
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ll/ouq0;->m(Ljava/lang/String;)V

    return-void

    .line 129
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " does not exist."

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ll/ouq0;->w(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    .line 130
    :goto_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " error: "

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    return-void
.end method

.method public e()Ljava/lang/String;
    .locals 1

    .line 83
    const-string p0, "com.xiaomi.xmsf"

    sget-object v0, Ll/xwq0;->c:Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    .line 84
    sget-object p0, Ll/xwq0;->c:Ljava/lang/String;

    return-object p0

    .line 85
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v0, Ll/xwq0;->c:Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ":pushservice"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public e(Ljava/lang/String;)Ll/swq0;
    .locals 6

    .line 86
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Ll/xwq0;->c:J

    sub-long/2addr v0, v2

    iget-wide v2, p0, Ll/xwq0;->a:J

    const-wide/32 v4, 0xea60

    mul-long/2addr v2, v4

    cmp-long v0, v0, v2

    if-lez v0, :cond_1

    .line 87
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Ll/xwq0;->c:J

    .line 88
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 89
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 90
    invoke-direct {p0, v0}, Ll/xwq0;->a(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ll/swq0;

    if-eqz p1, :cond_0

    const-wide/16 v0, 0x0

    .line 91
    iput-wide v0, p0, Ll/xwq0;->a:J

    return-object p1

    .line 92
    :cond_0
    iget-wide v0, p0, Ll/xwq0;->a:J

    const-wide/16 v2, 0xf

    cmp-long p1, v0, v2

    if-gez p1, :cond_1

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    .line 93
    iput-wide v0, p0, Ll/xwq0;->a:J

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method public e()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/xwq0;->a:Ljava/util/Map;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/xwq0;->a:Ljava/util/Map;

    .line 5
    .line 6
    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-eqz v2, :cond_0

    .line 19
    .line 20
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    check-cast v2, Ll/twq0;

    .line 25
    .line 26
    const/4 v3, 0x1

    .line 27
    invoke-virtual {v2, v3}, Ll/twq0;->g(Z)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :catchall_0
    move-exception p0

    .line 32
    goto :goto_2

    .line 33
    :cond_0
    :goto_1
    iget-object v1, p0, Ll/xwq0;->a:Ljava/util/Map;

    .line 34
    .line 35
    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    if-eqz v2, :cond_2

    .line 48
    .line 49
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    check-cast v2, Ljava/lang/String;

    .line 54
    .line 55
    iget-object v3, p0, Ll/xwq0;->a:Ljava/util/Map;

    .line 56
    .line 57
    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    check-cast v3, Ll/twq0;

    .line 62
    .line 63
    invoke-virtual {v3}, Ll/twq0;->b()Ljava/util/ArrayList;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    if-eqz v3, :cond_1

    .line 72
    .line 73
    iget-object v1, p0, Ll/xwq0;->a:Ljava/util/Map;

    .line 74
    .line 75
    invoke-interface {v1, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_2
    monitor-exit v0

    .line 80
    return-void

    .line 81
    :goto_2
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 82
    throw p0
.end method
