.class final Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->W(Lorg/json/JSONObject;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000\u0008\n\u0000\n\u0002\u0010\u0002\n\u0000\u0010\u0000\u001a\u00020\u0001H\n\u00a2\u0006\u0002\u0008\u0002"
    }
    d2 = {
        "<anonymous>",
        "",
        "run"
    }
    k = 0x3
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# instance fields
.field final synthetic a:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

.field final synthetic b:Lorg/json/JSONObject;


# direct methods
.method public constructor <init>(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;Lorg/json/JSONObject;)V
    .locals 0

    iput-object p1, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$h;->a:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    iput-object p2, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$h;->b:Lorg/json/JSONObject;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 19

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    iget-object v0, v1, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$h;->a:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->x(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;)Ll/hul;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_15

    .line 10
    .line 11
    iget-object v0, v1, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$h;->a:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->r(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;)Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    goto/16 :goto_e

    .line 20
    .line 21
    :cond_0
    iget-object v0, v1, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$h;->b:Lorg/json/JSONObject;

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    const-string v3, "url"

    .line 27
    .line 28
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    goto :goto_0

    .line 33
    :cond_1
    move-object v0, v2

    .line 34
    :goto_0
    iget-object v3, v1, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$h;->b:Lorg/json/JSONObject;

    .line 35
    .line 36
    const-string v4, ""

    .line 37
    .line 38
    if-eqz v3, :cond_2

    .line 39
    .line 40
    const-string v5, "callback"

    .line 41
    .line 42
    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    if-eqz v3, :cond_2

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_2
    move-object v3, v4

    .line 50
    :goto_1
    iget-object v5, v1, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$h;->b:Lorg/json/JSONObject;

    .line 51
    .line 52
    if-eqz v5, :cond_3

    .line 53
    .line 54
    const-string v6, "files"

    .line 55
    .line 56
    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 57
    .line 58
    .line 59
    move-result-object v5

    .line 60
    goto :goto_2

    .line 61
    :cond_3
    move-object v5, v2

    .line 62
    :goto_2
    iget-object v6, v1, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$h;->b:Lorg/json/JSONObject;

    .line 63
    .line 64
    if-eqz v6, :cond_4

    .line 65
    .line 66
    const-string v7, "param"

    .line 67
    .line 68
    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 69
    .line 70
    .line 71
    move-result-object v6

    .line 72
    goto :goto_3

    .line 73
    :cond_4
    move-object v6, v2

    .line 74
    :goto_3
    iget-object v7, v1, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$h;->b:Lorg/json/JSONObject;

    .line 75
    .line 76
    if-eqz v7, :cond_5

    .line 77
    .line 78
    const-string v8, "fileName"

    .line 79
    .line 80
    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v7

    .line 84
    if-eqz v7, :cond_5

    .line 85
    .line 86
    goto :goto_4

    .line 87
    :cond_5
    move-object v7, v4

    .line 88
    :goto_4
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 89
    .line 90
    .line 91
    move-result v8

    .line 92
    const-string v9, "1"

    .line 93
    .line 94
    if-nez v8, :cond_14

    .line 95
    .line 96
    if-eqz v5, :cond_14

    .line 97
    .line 98
    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    .line 99
    .line 100
    .line 101
    move-result v8

    .line 102
    if-gtz v8, :cond_6

    .line 103
    .line 104
    goto/16 :goto_d

    .line 105
    .line 106
    :cond_6
    sget-object v8, Ll/ljw;->INSTANCE:Ll/ljw;

    .line 107
    .line 108
    invoke-virtual {v8, v0}, Ll/ljw;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    .line 113
    .line 114
    .line 115
    move-result v8

    .line 116
    new-instance v10, Ljava/util/ArrayList;

    .line 117
    .line 118
    invoke-direct {v10, v8}, Ljava/util/ArrayList;-><init>(I)V

    .line 119
    .line 120
    .line 121
    const/4 v11, 0x0

    .line 122
    move v12, v11

    .line 123
    :goto_5
    if-ge v12, v8, :cond_b

    .line 124
    .line 125
    invoke-virtual {v5, v12}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v13

    .line 129
    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 130
    .line 131
    .line 132
    move-result v14

    .line 133
    if-eqz v14, :cond_7

    .line 134
    .line 135
    goto :goto_6

    .line 136
    :cond_7
    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 137
    .line 138
    .line 139
    invoke-static {v13}, Ll/wkw;->k(Ljava/lang/String;)Z

    .line 140
    .line 141
    .line 142
    move-result v14

    .line 143
    if-eqz v14, :cond_8

    .line 144
    .line 145
    invoke-static {v13}, Ll/wkw;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v13

    .line 149
    :cond_8
    new-instance v14, Ljava/io/File;

    .line 150
    .line 151
    invoke-direct {v14, v13}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {v14}, Ljava/io/File;->exists()Z

    .line 155
    .line 156
    .line 157
    move-result v13

    .line 158
    if-eqz v13, :cond_a

    .line 159
    .line 160
    invoke-virtual {v14}, Ljava/io/File;->length()J

    .line 161
    .line 162
    .line 163
    move-result-wide v15

    .line 164
    const-wide/16 v17, 0x0

    .line 165
    .line 166
    cmp-long v13, v15, v17

    .line 167
    .line 168
    if-gtz v13, :cond_9

    .line 169
    .line 170
    goto :goto_6

    .line 171
    :cond_9
    invoke-virtual {v10, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    :cond_a
    :goto_6
    add-int/lit8 v12, v12, 0x1

    .line 175
    .line 176
    goto :goto_5

    .line 177
    :cond_b
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    .line 178
    .line 179
    .line 180
    move-result v5

    .line 181
    new-array v8, v5, [Ljava/io/File;

    .line 182
    .line 183
    invoke-virtual {v10, v8}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 184
    .line 185
    .line 186
    move-result-object v8

    .line 187
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 188
    .line 189
    .line 190
    move-object v15, v8

    .line 191
    check-cast v15, [Ljava/io/File;

    .line 192
    .line 193
    new-array v8, v5, [Ljava/lang/String;

    .line 194
    .line 195
    const/4 v10, 0x1

    .line 196
    if-ne v5, v10, :cond_c

    .line 197
    .line 198
    aput-object v7, v8, v11

    .line 199
    .line 200
    goto :goto_8

    .line 201
    :cond_c
    :goto_7
    if-ge v11, v5, :cond_d

    .line 202
    .line 203
    new-instance v10, Ljava/lang/StringBuilder;

    .line 204
    .line 205
    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    .line 206
    .line 207
    .line 208
    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 209
    .line 210
    .line 211
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 212
    .line 213
    .line 214
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 215
    .line 216
    .line 217
    move-result-object v10

    .line 218
    aput-object v10, v8, v11

    .line 219
    .line 220
    add-int/lit8 v11, v11, 0x1

    .line 221
    .line 222
    goto :goto_7

    .line 223
    :cond_d
    :goto_8
    new-instance v14, Ljava/util/HashMap;

    .line 224
    .line 225
    invoke-direct {v14}, Ljava/util/HashMap;-><init>()V

    .line 226
    .line 227
    .line 228
    if-eqz v6, :cond_f

    .line 229
    .line 230
    invoke-virtual {v6}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    .line 231
    .line 232
    .line 233
    move-result-object v5

    .line 234
    :cond_e
    :goto_9
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 235
    .line 236
    .line 237
    move-result v7

    .line 238
    if-eqz v7, :cond_f

    .line 239
    .line 240
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 241
    .line 242
    .line 243
    move-result-object v7

    .line 244
    check-cast v7, Ljava/lang/String;

    .line 245
    .line 246
    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    .line 247
    .line 248
    .line 249
    move-result-object v10

    .line 250
    if-eqz v10, :cond_e

    .line 251
    .line 252
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 253
    .line 254
    .line 255
    invoke-virtual {v10}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 256
    .line 257
    .line 258
    move-result-object v10

    .line 259
    invoke-interface {v14, v7, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 260
    .line 261
    .line 262
    goto :goto_9

    .line 263
    :cond_f
    const-string v5, "uuid"

    .line 264
    .line 265
    invoke-virtual {v14, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 266
    .line 267
    .line 268
    move-result-object v6

    .line 269
    if-eqz v6, :cond_10

    .line 270
    .line 271
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 272
    .line 273
    .line 274
    move-result-object v6

    .line 275
    invoke-virtual {v6}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 276
    .line 277
    .line 278
    move-result-object v6

    .line 279
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 280
    .line 281
    .line 282
    invoke-interface {v14, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 283
    .line 284
    .line 285
    :cond_10
    invoke-static {}, Ll/gkw;->b()Ll/gkw;

    .line 286
    .line 287
    .line 288
    move-result-object v5

    .line 289
    invoke-virtual {v5}, Ll/gkw;->a()Ll/ivl;

    .line 290
    .line 291
    .line 292
    move-result-object v12

    .line 293
    :try_start_0
    sget-object v5, Lcom/hellogroup/mk/business/MKConfigSetter;->Companion:Lcom/hellogroup/mk/business/MKConfigSetter$Companion;

    .line 294
    .line 295
    invoke-virtual {v5}, Lcom/hellogroup/mk/business/MKConfigSetter$Companion;->b()Ll/ojw;

    .line 296
    .line 297
    .line 298
    move-result-object v5

    .line 299
    if-eqz v5, :cond_12

    .line 300
    .line 301
    iget-object v6, v1, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$h;->a:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    .line 302
    .line 303
    invoke-static {v6}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->x(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;)Ll/hul;

    .line 304
    .line 305
    .line 306
    move-result-object v6

    .line 307
    if-eqz v6, :cond_11

    .line 308
    .line 309
    invoke-interface {v6}, Ll/hul;->getOriginURL()Ljava/lang/String;

    .line 310
    .line 311
    .line 312
    move-result-object v6

    .line 313
    goto :goto_a

    .line 314
    :catch_0
    move-exception v0

    .line 315
    goto :goto_c

    .line 316
    :cond_11
    move-object v6, v2

    .line 317
    :goto_a
    invoke-virtual {v5, v0, v6}, Ll/ojw;->d(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 318
    .line 319
    .line 320
    move-result-object v5

    .line 321
    if-eqz v5, :cond_12

    .line 322
    .line 323
    move-object v13, v5

    .line 324
    goto :goto_b

    .line 325
    :cond_12
    move-object v13, v0

    .line 326
    :goto_b
    const/16 v17, 0x0

    .line 327
    .line 328
    move-object/from16 v16, v8

    .line 329
    .line 330
    invoke-interface/range {v12 .. v17}, Ll/ivl;->b(Ljava/lang/String;Ljava/util/Map;[Ljava/io/File;[Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    .line 331
    .line 332
    .line 333
    move-result-object v0

    .line 334
    iget-object v5, v1, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$h;->a:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    .line 335
    .line 336
    const-string v6, "\u6210\u529f"

    .line 337
    .line 338
    const-string v7, "0"

    .line 339
    .line 340
    invoke-virtual {v5, v3, v0, v6, v7}, Ll/qpl;->h(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 341
    .line 342
    .line 343
    return-void

    .line 344
    :goto_c
    const-string v5, "MediaExtraBridge"

    .line 345
    .line 346
    invoke-static {v5, v4, v0}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 347
    .line 348
    .line 349
    iget-object v1, v1, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$h;->a:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    .line 350
    .line 351
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 352
    .line 353
    .line 354
    move-result-object v0

    .line 355
    if-eqz v0, :cond_13

    .line 356
    .line 357
    move-object v4, v0

    .line 358
    :cond_13
    invoke-virtual {v1, v3, v2, v4, v9}, Ll/qpl;->h(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 359
    .line 360
    .line 361
    return-void

    .line 362
    :cond_14
    :goto_d
    iget-object v0, v1, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$h;->a:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    .line 363
    .line 364
    const-string v1, "\u53c2\u6570\u9519\u8bef"

    .line 365
    .line 366
    invoke-virtual {v0, v3, v2, v1, v9}, Ll/qpl;->h(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 367
    .line 368
    .line 369
    :cond_15
    :goto_e
    return-void
.end method
