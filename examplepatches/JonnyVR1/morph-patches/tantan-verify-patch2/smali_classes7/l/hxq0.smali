.class public Ll/hxq0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static a:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method private static a(Landroid/content/Context;)I
    .locals 1

    .line 1
    sget v0, Ll/hxq0;->a:I

    .line 2
    .line 3
    if-gtz v0, :cond_0

    .line 4
    .line 5
    invoke-static {p0}, Ll/l4r0;->l(Landroid/content/Context;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    sput p0, Ll/hxq0;->a:I

    .line 10
    .line 11
    :cond_0
    sget p0, Ll/hxq0;->a:I

    .line 12
    .line 13
    return p0
.end method

.method private static b(Z)I
    .locals 0

    .line 1
    return p0
.end method

.method private static c(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .locals 2

    .line 1
    const-string v0, "sp_disconnect_stats"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method private static d(Ljava/lang/String;I)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p0, p1}, Ll/hxq0;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method private static e(Ljava/lang/String;J)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p0, p1}, Ll/hxq0;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method private static f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    :cond_0
    const-string p1, "null"

    .line 10
    .line 11
    :cond_1
    if-eqz p0, :cond_2

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-lez v0, :cond_2

    .line 18
    .line 19
    new-instance v0, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const-string p0, ";"

    .line 25
    .line 26
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
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
    move-result-object p0

    .line 36
    return-object p0

    .line 37
    :cond_2
    return-object p1
.end method

.method private static g(Landroid/content/Context;)Ljava/util/List;
    .locals 20
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "Ll/fxq0;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static/range {p0 .. p0}, Ll/hxq0;->c(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "host"

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-static {v1}, Ll/hxq0;->l(Ljava/lang/String;)[Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    if-eqz v1, :cond_3

    .line 17
    .line 18
    array-length v3, v1

    .line 19
    if-gtz v3, :cond_0

    .line 20
    .line 21
    goto/16 :goto_1

    .line 22
    .line 23
    :cond_0
    const-string v3, "network_state"

    .line 24
    .line 25
    invoke-interface {v0, v3, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    invoke-static {v3}, Ll/hxq0;->l(Ljava/lang/String;)[Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    const-string v4, "reason"

    .line 34
    .line 35
    invoke-interface {v0, v4, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    invoke-static {v4}, Ll/hxq0;->l(Ljava/lang/String;)[Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    const-string v5, "ping_interval"

    .line 44
    .line 45
    invoke-interface {v0, v5, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v5

    .line 49
    invoke-static {v5}, Ll/hxq0;->l(Ljava/lang/String;)[Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v5

    .line 53
    const-string v6, "network_type"

    .line 54
    .line 55
    invoke-interface {v0, v6, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v6

    .line 59
    invoke-static {v6}, Ll/hxq0;->l(Ljava/lang/String;)[Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v6

    .line 63
    const-string v7, "wifi_digest"

    .line 64
    .line 65
    invoke-interface {v0, v7, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v7

    .line 69
    invoke-static {v7}, Ll/hxq0;->l(Ljava/lang/String;)[Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v7

    .line 73
    const-string v8, "connected_network_type"

    .line 74
    .line 75
    invoke-interface {v0, v8, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v8

    .line 79
    invoke-static {v8}, Ll/hxq0;->l(Ljava/lang/String;)[Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v8

    .line 83
    const-string v9, "disconnect_time"

    .line 84
    .line 85
    invoke-interface {v0, v9, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v9

    .line 89
    invoke-static {v9}, Ll/hxq0;->l(Ljava/lang/String;)[Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v9

    .line 93
    const-string v10, "connected_time"

    .line 94
    .line 95
    invoke-interface {v0, v10, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v10

    .line 99
    invoke-static {v10}, Ll/hxq0;->l(Ljava/lang/String;)[Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v10

    .line 103
    const-string v11, "xmsf_vc"

    .line 104
    .line 105
    invoke-interface {v0, v11, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v11

    .line 109
    invoke-static {v11}, Ll/hxq0;->l(Ljava/lang/String;)[Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v11

    .line 113
    const-string v12, "android_vc"

    .line 114
    .line 115
    invoke-interface {v0, v12, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-static {v0}, Ll/hxq0;->l(Ljava/lang/String;)[Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    if-eqz v3, :cond_2

    .line 124
    .line 125
    if-eqz v4, :cond_2

    .line 126
    .line 127
    if-eqz v5, :cond_2

    .line 128
    .line 129
    if-eqz v6, :cond_2

    .line 130
    .line 131
    if-eqz v7, :cond_2

    .line 132
    .line 133
    if-eqz v8, :cond_2

    .line 134
    .line 135
    if-eqz v9, :cond_2

    .line 136
    .line 137
    if-eqz v10, :cond_2

    .line 138
    .line 139
    if-eqz v11, :cond_2

    .line 140
    .line 141
    if-eqz v0, :cond_2

    .line 142
    .line 143
    array-length v12, v1

    .line 144
    array-length v13, v3

    .line 145
    if-ne v12, v13, :cond_2

    .line 146
    .line 147
    array-length v12, v1

    .line 148
    array-length v13, v4

    .line 149
    if-ne v12, v13, :cond_2

    .line 150
    .line 151
    array-length v12, v1

    .line 152
    array-length v13, v5

    .line 153
    if-ne v12, v13, :cond_2

    .line 154
    .line 155
    array-length v12, v1

    .line 156
    array-length v13, v6

    .line 157
    if-ne v12, v13, :cond_2

    .line 158
    .line 159
    array-length v12, v1

    .line 160
    array-length v13, v7

    .line 161
    if-ne v12, v13, :cond_2

    .line 162
    .line 163
    array-length v12, v1

    .line 164
    array-length v13, v8

    .line 165
    if-ne v12, v13, :cond_2

    .line 166
    .line 167
    array-length v12, v1

    .line 168
    array-length v13, v9

    .line 169
    if-ne v12, v13, :cond_2

    .line 170
    .line 171
    array-length v12, v1

    .line 172
    array-length v13, v10

    .line 173
    if-ne v12, v13, :cond_2

    .line 174
    .line 175
    array-length v12, v1

    .line 176
    array-length v13, v11

    .line 177
    if-ne v12, v13, :cond_2

    .line 178
    .line 179
    array-length v12, v1

    .line 180
    array-length v13, v0

    .line 181
    if-ne v12, v13, :cond_2

    .line 182
    .line 183
    new-instance v2, Ljava/util/ArrayList;

    .line 184
    .line 185
    array-length v12, v1

    .line 186
    invoke-direct {v2, v12}, Ljava/util/ArrayList;-><init>(I)V

    .line 187
    .line 188
    .line 189
    const/4 v12, 0x0

    .line 190
    :goto_0
    array-length v13, v1

    .line 191
    if-ge v12, v13, :cond_1

    .line 192
    .line 193
    new-instance v13, Ll/fxq0;

    .line 194
    .line 195
    invoke-direct {v13}, Ll/fxq0;-><init>()V

    .line 196
    .line 197
    .line 198
    const/4 v14, 0x1

    .line 199
    invoke-virtual {v13, v14}, Ll/fxq0;->d(I)V

    .line 200
    .line 201
    .line 202
    aget-object v14, v1, v12

    .line 203
    .line 204
    invoke-virtual {v13, v14}, Ll/fxq0;->f(Ljava/lang/String;)V

    .line 205
    .line 206
    .line 207
    aget-object v14, v3, v12

    .line 208
    .line 209
    const/4 v15, -0x1

    .line 210
    invoke-static {v14, v15}, Ll/w5r0;->a(Ljava/lang/String;I)I

    .line 211
    .line 212
    .line 213
    move-result v14

    .line 214
    invoke-virtual {v13, v14}, Ll/fxq0;->j(I)V

    .line 215
    .line 216
    .line 217
    aget-object v14, v4, v12

    .line 218
    .line 219
    invoke-static {v14, v15}, Ll/w5r0;->a(Ljava/lang/String;I)I

    .line 220
    .line 221
    .line 222
    move-result v14

    .line 223
    invoke-virtual {v13, v14}, Ll/fxq0;->o(I)V

    .line 224
    .line 225
    .line 226
    aget-object v14, v5, v12

    .line 227
    .line 228
    move-object/from16 v16, v0

    .line 229
    .line 230
    move-object/from16 p0, v1

    .line 231
    .line 232
    const-wide/16 v0, -0x1

    .line 233
    .line 234
    move-object/from16 v17, v3

    .line 235
    .line 236
    move-object/from16 v18, v4

    .line 237
    .line 238
    invoke-static {v14, v0, v1}, Ll/w5r0;->b(Ljava/lang/String;J)J

    .line 239
    .line 240
    .line 241
    move-result-wide v3

    .line 242
    invoke-virtual {v13, v3, v4}, Ll/fxq0;->e(J)V

    .line 243
    .line 244
    .line 245
    aget-object v3, v6, v12

    .line 246
    .line 247
    invoke-static {v3, v15}, Ll/w5r0;->a(Ljava/lang/String;I)I

    .line 248
    .line 249
    .line 250
    move-result v3

    .line 251
    invoke-virtual {v13, v3}, Ll/fxq0;->s(I)V

    .line 252
    .line 253
    .line 254
    aget-object v3, v7, v12

    .line 255
    .line 256
    invoke-virtual {v13, v3}, Ll/fxq0;->l(Ljava/lang/String;)V

    .line 257
    .line 258
    .line 259
    aget-object v3, v8, v12

    .line 260
    .line 261
    invoke-static {v3, v15}, Ll/w5r0;->a(Ljava/lang/String;I)I

    .line 262
    .line 263
    .line 264
    move-result v3

    .line 265
    invoke-virtual {v13, v3}, Ll/fxq0;->v(I)V

    .line 266
    .line 267
    .line 268
    aget-object v3, v9, v12

    .line 269
    .line 270
    invoke-static {v3, v0, v1}, Ll/w5r0;->b(Ljava/lang/String;J)J

    .line 271
    .line 272
    .line 273
    move-result-wide v3

    .line 274
    aget-object v14, v10, v12

    .line 275
    .line 276
    invoke-static {v14, v0, v1}, Ll/w5r0;->b(Ljava/lang/String;J)J

    .line 277
    .line 278
    .line 279
    move-result-wide v0

    .line 280
    move-object v14, v5

    .line 281
    move-object/from16 v19, v6

    .line 282
    .line 283
    sub-long v5, v0, v3

    .line 284
    .line 285
    invoke-virtual {v13, v5, v6}, Ll/fxq0;->k(J)V

    .line 286
    .line 287
    .line 288
    invoke-virtual {v13, v3, v4}, Ll/fxq0;->p(J)V

    .line 289
    .line 290
    .line 291
    invoke-virtual {v13, v0, v1}, Ll/fxq0;->t(J)V

    .line 292
    .line 293
    .line 294
    aget-object v0, v11, v12

    .line 295
    .line 296
    invoke-static {v0, v15}, Ll/w5r0;->a(Ljava/lang/String;I)I

    .line 297
    .line 298
    .line 299
    move-result v0

    .line 300
    invoke-virtual {v13, v0}, Ll/fxq0;->x(I)V

    .line 301
    .line 302
    .line 303
    aget-object v0, v16, v12

    .line 304
    .line 305
    invoke-static {v0, v15}, Ll/w5r0;->a(Ljava/lang/String;I)I

    .line 306
    .line 307
    .line 308
    move-result v0

    .line 309
    invoke-virtual {v13, v0}, Ll/fxq0;->z(I)V

    .line 310
    .line 311
    .line 312
    invoke-interface {v2, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 313
    .line 314
    .line 315
    add-int/lit8 v12, v12, 0x1

    .line 316
    .line 317
    move-object/from16 v1, p0

    .line 318
    .line 319
    move-object v5, v14

    .line 320
    move-object/from16 v0, v16

    .line 321
    .line 322
    move-object/from16 v3, v17

    .line 323
    .line 324
    move-object/from16 v4, v18

    .line 325
    .line 326
    move-object/from16 v6, v19

    .line 327
    .line 328
    goto/16 :goto_0

    .line 329
    .line 330
    :cond_1
    return-object v2

    .line 331
    :cond_2
    const-string v0, "DisconnectStatsSP Cached data incorrect,drop."

    .line 332
    .line 333
    invoke-static {v0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 334
    .line 335
    .line 336
    return-object v2

    .line 337
    :cond_3
    :goto_1
    const-string v0, "DisconnectStatsSP Cached hosts data is empty,drop."

    .line 338
    .line 339
    invoke-static {v0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 340
    .line 341
    .line 342
    return-object v2
.end method

.method private static h(Landroid/content/Context;)V
    .locals 2

    .line 1
    const-string v0, "upload"

    .line 2
    .line 3
    invoke-static {v0}, Ll/exq0;->g(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Ll/hxq0;->g(Landroid/content/Context;)Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Ll/gxq0;

    .line 11
    .line 12
    invoke-direct {v1}, Ll/gxq0;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1, p0, v0}, Ll/gxq0;->a(Landroid/content/Context;Ljava/util/List;)V

    .line 16
    .line 17
    .line 18
    invoke-static {p0}, Ll/hxq0;->m(Landroid/content/Context;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static i(Landroid/content/Context;J)V
    .locals 2

    .line 1
    invoke-static {p0}, Ll/tsq0;->f(Landroid/content/Context;)Ll/tsq0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/hxq0$b;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1, p2}, Ll/hxq0$b;-><init>(Landroid/content/Context;J)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/tsq0;->g(Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private static j(Landroid/content/Context;Ljava/lang/String;IJIJILjava/lang/String;I)V
    .locals 23

    .line 1
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 2
    .line 3
    invoke-static/range {p2 .. p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v2

    .line 7
    invoke-static/range {p3 .. p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    invoke-static/range {p5 .. p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object v4

    .line 15
    invoke-static/range {p6 .. p7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 16
    .line 17
    .line 18
    move-result-object v5

    .line 19
    invoke-static/range {p8 .. p8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object v6

    .line 23
    invoke-static/range {p10 .. p10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 24
    .line 25
    .line 26
    move-result-object v8

    .line 27
    move-object/from16 v1, p1

    .line 28
    .line 29
    move-object/from16 v7, p9

    .line 30
    .line 31
    filled-new-array/range {v1 .. v8}, [Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    const-string v1, "recordDisconnectInfo host=%s, netState=%d, currentTimeMillis=%d, reason=%d, pingInterval=%d, netType=%d, wifiDigest=%s, connectedNetType=%d"

    .line 36
    .line 37
    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-static {v0}, Ll/exq0;->g(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-static/range {p0 .. p0}, Ll/hxq0;->c(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    const-string v1, "host"

    .line 49
    .line 50
    const/4 v2, 0x0

    .line 51
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    const-string v4, "network_state"

    .line 56
    .line 57
    invoke-interface {v0, v4, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v5

    .line 61
    const-string v6, "reason"

    .line 62
    .line 63
    invoke-interface {v0, v6, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v7

    .line 67
    const-string v8, "ping_interval"

    .line 68
    .line 69
    invoke-interface {v0, v8, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v9

    .line 73
    const-string v10, "network_type"

    .line 74
    .line 75
    invoke-interface {v0, v10, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v11

    .line 79
    const-string v12, "wifi_digest"

    .line 80
    .line 81
    invoke-interface {v0, v12, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v13

    .line 85
    const-string v14, "connected_network_type"

    .line 86
    .line 87
    invoke-interface {v0, v14, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v15

    .line 91
    move-object/from16 v16, v14

    .line 92
    .line 93
    const-string v14, "disconnect_time"

    .line 94
    .line 95
    move-object/from16 v17, v12

    .line 96
    .line 97
    invoke-interface {v0, v14, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v12

    .line 101
    move-object/from16 v18, v14

    .line 102
    .line 103
    const-string v14, "xmsf_vc"

    .line 104
    .line 105
    move-object/from16 v19, v10

    .line 106
    .line 107
    invoke-interface {v0, v14, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v10

    .line 111
    move-object/from16 v20, v14

    .line 112
    .line 113
    const-string v14, "android_vc"

    .line 114
    .line 115
    invoke-interface {v0, v14, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    move-object/from16 v21, v0

    .line 120
    .line 121
    move-object/from16 v0, p1

    .line 122
    .line 123
    invoke-static {v3, v0}, Ll/hxq0;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    move/from16 v3, p2

    .line 128
    .line 129
    invoke-static {v5, v3}, Ll/hxq0;->d(Ljava/lang/String;I)Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v3

    .line 133
    move/from16 v5, p5

    .line 134
    .line 135
    invoke-static {v7, v5}, Ll/hxq0;->d(Ljava/lang/String;I)Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v5

    .line 139
    move-object/from16 v22, v8

    .line 140
    .line 141
    move-wide/from16 v7, p6

    .line 142
    .line 143
    invoke-static {v9, v7, v8}, Ll/hxq0;->e(Ljava/lang/String;J)Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v7

    .line 147
    move/from16 v8, p8

    .line 148
    .line 149
    invoke-static {v11, v8}, Ll/hxq0;->d(Ljava/lang/String;I)Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v8

    .line 153
    move-object/from16 v9, p9

    .line 154
    .line 155
    invoke-static {v13, v9}, Ll/hxq0;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object v9

    .line 159
    move/from16 v11, p10

    .line 160
    .line 161
    invoke-static {v15, v11}, Ll/hxq0;->d(Ljava/lang/String;I)Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v11

    .line 165
    move-object v15, v14

    .line 166
    move-wide/from16 v13, p3

    .line 167
    .line 168
    invoke-static {v12, v13, v14}, Ll/hxq0;->e(Ljava/lang/String;J)Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v12

    .line 172
    invoke-static/range {p0 .. p0}, Ll/hxq0;->a(Landroid/content/Context;)I

    .line 173
    .line 174
    .line 175
    move-result v13

    .line 176
    invoke-static {v10, v13}, Ll/hxq0;->d(Ljava/lang/String;I)Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object v10

    .line 180
    sget v13, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 181
    .line 182
    invoke-static {v2, v13}, Ll/hxq0;->d(Ljava/lang/String;I)Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v2

    .line 186
    invoke-interface/range {v21 .. v21}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 187
    .line 188
    .line 189
    move-result-object v13

    .line 190
    invoke-interface {v13, v1, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    invoke-interface {v0, v4, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    invoke-interface {v0, v6, v5}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    move-object/from16 v1, v22

    .line 203
    .line 204
    invoke-interface {v0, v1, v7}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    move-object/from16 v1, v19

    .line 209
    .line 210
    invoke-interface {v0, v1, v8}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 211
    .line 212
    .line 213
    move-result-object v0

    .line 214
    move-object/from16 v1, v17

    .line 215
    .line 216
    invoke-interface {v0, v1, v9}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 217
    .line 218
    .line 219
    move-result-object v0

    .line 220
    move-object/from16 v1, v16

    .line 221
    .line 222
    invoke-interface {v0, v1, v11}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 223
    .line 224
    .line 225
    move-result-object v0

    .line 226
    move-object/from16 v1, v18

    .line 227
    .line 228
    invoke-interface {v0, v1, v12}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 229
    .line 230
    .line 231
    move-result-object v0

    .line 232
    move-object/from16 v1, v20

    .line 233
    .line 234
    invoke-interface {v0, v1, v10}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 235
    .line 236
    .line 237
    move-result-object v0

    .line 238
    invoke-interface {v0, v15, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 243
    .line 244
    .line 245
    return-void
.end method

.method public static k(Landroid/content/Context;Ljava/lang/String;ZJIJILjava/lang/String;I)V
    .locals 13

    .line 1
    invoke-static {p0}, Ll/tsq0;->f(Landroid/content/Context;)Ll/tsq0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/hxq0$a;

    .line 6
    .line 7
    move-object v2, p0

    .line 8
    move-object v3, p1

    .line 9
    move v4, p2

    .line 10
    move-wide/from16 v5, p3

    .line 11
    .line 12
    move/from16 v7, p5

    .line 13
    .line 14
    move-wide/from16 v8, p6

    .line 15
    .line 16
    move/from16 v10, p8

    .line 17
    .line 18
    move-object/from16 v11, p9

    .line 19
    .line 20
    move/from16 v12, p10

    .line 21
    .line 22
    invoke-direct/range {v1 .. v12}, Ll/hxq0$a;-><init>(Landroid/content/Context;Ljava/lang/String;ZJIJILjava/lang/String;I)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ll/tsq0;->g(Ljava/lang/Runnable;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method private static l(Ljava/lang/String;)[Ljava/lang/String;
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    const-string v0, ";"

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return-object p0
.end method

.method private static m(Landroid/content/Context;)V
    .locals 4

    .line 1
    const-string v0, "resetAfterUpload"

    .line 2
    .line 3
    invoke-static {v0}, Ll/exq0;->g(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Ll/hxq0;->c(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const-string v0, "host"

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string v0, "network_state"

    .line 22
    .line 23
    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string v0, "reason"

    .line 28
    .line 29
    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const-string v0, "ping_interval"

    .line 34
    .line 35
    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const-string v0, "network_type"

    .line 40
    .line 41
    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    const-string v0, "wifi_digest"

    .line 46
    .line 47
    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    const-string v0, "connected_network_type"

    .line 52
    .line 53
    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    const-string v0, "disconnect_time"

    .line 58
    .line 59
    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    const-string v0, "connected_time"

    .line 64
    .line 65
    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    const-string v0, "last_discnt_time"

    .line 70
    .line 71
    const-wide/16 v2, 0x0

    .line 72
    .line 73
    invoke-interface {p0, v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    const-string v0, "discnt_count"

    .line 78
    .line 79
    const/4 v2, 0x0

    .line 80
    invoke-interface {p0, v0, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    const-string v0, "cnt_count"

    .line 85
    .line 86
    invoke-interface {p0, v0, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    const-string v0, "xmsf_vc"

    .line 91
    .line 92
    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    const-string v0, "android_vc"

    .line 97
    .line 98
    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public static synthetic n(Landroid/content/Context;J)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/hxq0;->p(Landroid/content/Context;J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic o(Landroid/content/Context;Ljava/lang/String;ZJIJILjava/lang/String;I)V
    .locals 0

    .line 1
    invoke-static/range {p0 .. p10}, Ll/hxq0;->q(Landroid/content/Context;Ljava/lang/String;ZJIJILjava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static declared-synchronized p(Landroid/content/Context;J)V
    .locals 10

    .line 1
    const-class v0, Ll/hxq0;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-static {p0}, Ll/hxq0;->c(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    const-string v2, "start_time_for_day"

    .line 9
    .line 10
    const-wide/16 v3, 0x0

    .line 11
    .line 12
    invoke-interface {v1, v2, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    .line 13
    .line 14
    .line 15
    move-result-wide v5

    .line 16
    cmp-long v2, v5, v3

    .line 17
    .line 18
    const/4 v7, 0x0

    .line 19
    if-nez v2, :cond_0

    .line 20
    .line 21
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-string v1, "start_time_for_day"

    .line 26
    .line 27
    invoke-interface {p0, v1, p1, p2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const-string p1, "last_discnt_time"

    .line 32
    .line 33
    invoke-interface {p0, p1, v3, v4}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const-string p1, "discnt_count_in_day"

    .line 38
    .line 39
    invoke-interface {p0, p1, v7}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    const-string p1, "discnt_count"

    .line 44
    .line 45
    invoke-interface {p0, p1, v7}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    const-string p1, "cnt_count"

    .line 50
    .line 51
    invoke-interface {p0, p1, v7}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 56
    .line 57
    .line 58
    monitor-exit v0

    .line 59
    return-void

    .line 60
    :catchall_0
    move-exception p0

    .line 61
    goto :goto_1

    .line 62
    :cond_0
    :try_start_1
    const-string v2, "discnt_count"

    .line 63
    .line 64
    invoke-interface {v1, v2, v7}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    const-string v3, "cnt_count"

    .line 69
    .line 70
    invoke-interface {v1, v3, v7}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 71
    .line 72
    .line 73
    move-result v3

    .line 74
    if-le v2, v3, :cond_1

    .line 75
    .line 76
    add-int/lit8 v3, v3, 0x1

    .line 77
    .line 78
    const-string v4, "connected_time"

    .line 79
    .line 80
    const/4 v8, 0x0

    .line 81
    invoke-interface {v1, v4, v8}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v4

    .line 85
    invoke-static {v4, p1, p2}, Ll/hxq0;->e(Ljava/lang/String;J)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v4

    .line 89
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 90
    .line 91
    .line 92
    move-result-object v8

    .line 93
    const-string v9, "cnt_count"

    .line 94
    .line 95
    invoke-interface {v8, v9, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    const-string v8, "connected_time"

    .line 100
    .line 101
    invoke-interface {v3, v8, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 102
    .line 103
    .line 104
    move-result-object v3

    .line 105
    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 106
    .line 107
    .line 108
    :cond_1
    sub-long v3, p1, v5

    .line 109
    .line 110
    const-wide/32 v5, 0x5265c00

    .line 111
    .line 112
    .line 113
    cmp-long v3, v3, v5

    .line 114
    .line 115
    if-ltz v3, :cond_2

    .line 116
    .line 117
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    const-string v2, "start_time_for_day"

    .line 122
    .line 123
    invoke-interface {v1, v2, p1, p2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    const-string p2, "discnt_count_in_day"

    .line 128
    .line 129
    invoke-interface {p1, p2, v7}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 134
    .line 135
    .line 136
    invoke-static {p0}, Ll/hxq0;->h(Landroid/content/Context;)V

    .line 137
    .line 138
    .line 139
    goto :goto_0

    .line 140
    :cond_2
    const/16 p1, 0xa

    .line 141
    .line 142
    if-lt v2, p1, :cond_3

    .line 143
    .line 144
    invoke-static {p0}, Ll/hxq0;->h(Landroid/content/Context;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 145
    .line 146
    .line 147
    :cond_3
    :goto_0
    monitor-exit v0

    .line 148
    return-void

    .line 149
    :goto_1
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 150
    throw p0
.end method

.method private static declared-synchronized q(Landroid/content/Context;Ljava/lang/String;ZJIJILjava/lang/String;I)V
    .locals 14

    .line 1
    const-class v11, Ll/hxq0;

    .line 2
    .line 3
    monitor-enter v11

    .line 4
    :try_start_0
    invoke-static {p0}, Ll/hxq0;->c(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 5
    .line 6
    .line 7
    move-result-object v12

    .line 8
    const-string v0, "start_time_for_day"

    .line 9
    .line 10
    const-wide/16 v1, 0x0

    .line 11
    .line 12
    invoke-interface {v12, v0, v1, v2}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    .line 13
    .line 14
    .line 15
    move-result-wide v3

    .line 16
    cmp-long v0, v3, v1

    .line 17
    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    const-string p0, "recordDisconnection not initialized"

    .line 21
    .line 22
    invoke-static {p0}, Ll/exq0;->g(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    .line 24
    .line 25
    monitor-exit v11

    .line 26
    return-void

    .line 27
    :catchall_0
    move-exception v0

    .line 28
    move-object p0, v0

    .line 29
    goto/16 :goto_1

    .line 30
    .line 31
    :cond_0
    :try_start_1
    const-string v0, "last_discnt_time"

    .line 32
    .line 33
    invoke-interface {v12, v0, v1, v2}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    .line 34
    .line 35
    .line 36
    move-result-wide v0

    .line 37
    sub-long v0, p3, v0

    .line 38
    .line 39
    const-wide/32 v5, 0xea60

    .line 40
    .line 41
    .line 42
    cmp-long v0, v0, v5

    .line 43
    .line 44
    if-gez v0, :cond_1

    .line 45
    .line 46
    const-string p0, "recordDisconnection anti-shake"

    .line 47
    .line 48
    invoke-static {p0}, Ll/exq0;->g(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 49
    .line 50
    .line 51
    monitor-exit v11

    .line 52
    return-void

    .line 53
    :cond_1
    sub-long v0, p3, v3

    .line 54
    .line 55
    const-wide/32 v2, 0x5265c00

    .line 56
    .line 57
    .line 58
    cmp-long v0, v0, v2

    .line 59
    .line 60
    const/4 v1, 0x0

    .line 61
    if-gez v0, :cond_3

    .line 62
    .line 63
    :try_start_2
    const-string v0, "discnt_count_in_day"

    .line 64
    .line 65
    invoke-interface {v12, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    const/16 v2, 0x64

    .line 70
    .line 71
    if-le v0, v2, :cond_2

    .line 72
    .line 73
    const-string p0, "recordDisconnection count > 100 in 24H cycle,abandon."

    .line 74
    .line 75
    invoke-static {p0}, Ll/exq0;->g(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 76
    .line 77
    .line 78
    monitor-exit v11

    .line 79
    return-void

    .line 80
    :cond_2
    add-int/lit8 v0, v0, 0x1

    .line 81
    .line 82
    :try_start_3
    invoke-interface {v12}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    const-string v3, "discnt_count_in_day"

    .line 87
    .line 88
    invoke-interface {v2, v3, v0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 93
    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_3
    const-string v0, "recordDisconnection with the current time exceeds 24H cycle, go on."

    .line 97
    .line 98
    invoke-static {v0}, Ll/exq0;->g(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    :goto_0
    const-string v0, "discnt_count"

    .line 102
    .line 103
    invoke-interface {v12, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 104
    .line 105
    .line 106
    move-result v13

    .line 107
    const-string v0, "cnt_count"

    .line 108
    .line 109
    invoke-interface {v12, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    if-ne v13, v0, :cond_4

    .line 114
    .line 115
    invoke-static/range {p2 .. p2}, Ll/hxq0;->b(Z)I

    .line 116
    .line 117
    .line 118
    move-result v2

    .line 119
    move-object v0, p0

    .line 120
    move-object v1, p1

    .line 121
    move-wide/from16 v3, p3

    .line 122
    .line 123
    move/from16 v5, p5

    .line 124
    .line 125
    move-wide/from16 v6, p6

    .line 126
    .line 127
    move/from16 v8, p8

    .line 128
    .line 129
    move-object/from16 v9, p9

    .line 130
    .line 131
    move/from16 v10, p10

    .line 132
    .line 133
    invoke-static/range {v0 .. v10}, Ll/hxq0;->j(Landroid/content/Context;Ljava/lang/String;IJIJILjava/lang/String;I)V

    .line 134
    .line 135
    .line 136
    add-int/lit8 v13, v13, 0x1

    .line 137
    .line 138
    invoke-interface {v12}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    const-string p1, "last_discnt_time"

    .line 143
    .line 144
    invoke-interface {p0, p1, v3, v4}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    const-string p1, "discnt_count"

    .line 149
    .line 150
    invoke-interface {p0, p1, v13}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 155
    .line 156
    .line 157
    :cond_4
    const-string p0, "recordDisconnection complete"

    .line 158
    .line 159
    invoke-static {p0}, Ll/exq0;->g(Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 160
    .line 161
    .line 162
    monitor-exit v11

    .line 163
    return-void

    .line 164
    :goto_1
    :try_start_4
    monitor-exit v11
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 165
    throw p0
.end method
