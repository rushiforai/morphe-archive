.class public Ll/d1w;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Landroid/content/Context;

.field public static b:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static declared-synchronized a(Lcom/tantanapp/android/injecter/facade/Postcard;)V
    .locals 10

    .line 1
    const-string v0, "Init provider failed! "

    .line 2
    .line 3
    const-string v1, "Injecter::Fatal exception when loading group meta. ["

    .line 4
    .line 5
    const-string v2, "Injecter::There is no route match the path ["

    .line 6
    .line 7
    const-class v3, Ll/d1w;

    .line 8
    .line 9
    monitor-enter v3

    .line 10
    if-eqz p0, :cond_7

    .line 11
    .line 12
    :try_start_0
    sget-object v4, Ll/bpp0;->b:Ljava/util/Map;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->getPath()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v5

    .line 18
    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v4

    .line 22
    check-cast v4, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;

    .line 23
    .line 24
    const/4 v5, 0x0

    .line 25
    if-nez v4, :cond_3

    .line 26
    .line 27
    sget-object v0, Ll/bpp0;->a:Ljava/util/Map;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->getGroup()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Ljava/lang/Class;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 38
    .line 39
    if-eqz v0, :cond_2

    .line 40
    .line 41
    :try_start_1
    invoke-static {}, Ll/mum;->b()Z

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    if-eqz v2, :cond_0

    .line 46
    .line 47
    sget-object v2, Ll/mum;->c:Lcom/tantanapp/android/injecter/facade/template/ILogger;

    .line 48
    .line 49
    const-string v4, "Injecter::"

    .line 50
    .line 51
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 52
    .line 53
    .line 54
    move-result-object v6

    .line 55
    const-string v7, "The group [%s] starts loading, trigger by [%s]"

    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->getGroup()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v8

    .line 61
    invoke-virtual {p0}, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->getPath()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v9

    .line 65
    filled-new-array {v8, v9}, [Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v8

    .line 69
    invoke-static {v6, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v6

    .line 73
    invoke-interface {v2, v4, v6}, Lcom/tantanapp/android/injecter/facade/template/ILogger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    goto :goto_0

    .line 77
    :catchall_0
    move-exception p0

    .line 78
    goto/16 :goto_4

    .line 79
    .line 80
    :catch_0
    move-exception p0

    .line 81
    goto :goto_1

    .line 82
    :cond_0
    :goto_0
    invoke-virtual {v0, v5}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {v0, v5}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    check-cast v0, Lcom/tantanapp/android/injecter/facade/template/IRouteGroup;

    .line 91
    .line 92
    sget-object v2, Ll/bpp0;->b:Ljava/util/Map;

    .line 93
    .line 94
    invoke-interface {v0, v2}, Lcom/tantanapp/android/injecter/facade/template/IRouteGroup;->loadInto(Ljava/util/Map;)V

    .line 95
    .line 96
    .line 97
    sget-object v0, Ll/bpp0;->a:Ljava/util/Map;

    .line 98
    .line 99
    invoke-virtual {p0}, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->getGroup()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    invoke-interface {v0, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    invoke-static {}, Ll/mum;->b()Z

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    if-eqz v0, :cond_1

    .line 111
    .line 112
    sget-object v0, Ll/mum;->c:Lcom/tantanapp/android/injecter/facade/template/ILogger;

    .line 113
    .line 114
    const-string v2, "Injecter::"

    .line 115
    .line 116
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 117
    .line 118
    .line 119
    move-result-object v4

    .line 120
    const-string v5, "The group [%s] has already been loaded, trigger by [%s]"

    .line 121
    .line 122
    invoke-virtual {p0}, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->getGroup()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v6

    .line 126
    invoke-virtual {p0}, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->getPath()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v7

    .line 130
    filled-new-array {v6, v7}, [Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    move-result-object v6

    .line 134
    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v4

    .line 138
    invoke-interface {v0, v2, v4}, Lcom/tantanapp/android/injecter/facade/template/ILogger;->debug(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 139
    .line 140
    .line 141
    :cond_1
    :try_start_2
    invoke-static {p0}, Ll/d1w;->a(Lcom/tantanapp/android/injecter/facade/Postcard;)V

    .line 142
    .line 143
    .line 144
    goto/16 :goto_3

    .line 145
    .line 146
    :goto_1
    new-instance v0, Lcom/tantanapp/android/injecter/exception/HandlerException;

    .line 147
    .line 148
    new-instance v2, Ljava/lang/StringBuilder;

    .line 149
    .line 150
    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    const-string v1, "]"

    .line 161
    .line 162
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 163
    .line 164
    .line 165
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object v1

    .line 169
    invoke-direct {v0, v1, p0}, Lcom/tantanapp/android/injecter/exception/HandlerException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 170
    .line 171
    .line 172
    throw v0

    .line 173
    :cond_2
    new-instance v0, Lcom/tantanapp/android/injecter/exception/NoRouteFoundException;

    .line 174
    .line 175
    new-instance v1, Ljava/lang/StringBuilder;

    .line 176
    .line 177
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 178
    .line 179
    .line 180
    invoke-virtual {p0}, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->getPath()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object v2

    .line 184
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    const-string v2, "], in group ["

    .line 188
    .line 189
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 190
    .line 191
    .line 192
    invoke-virtual {p0}, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->getGroup()Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object p0

    .line 196
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 197
    .line 198
    .line 199
    const-string p0, "]"

    .line 200
    .line 201
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 202
    .line 203
    .line 204
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object p0

    .line 208
    invoke-direct {v0, p0}, Lcom/tantanapp/android/injecter/exception/NoRouteFoundException;-><init>(Ljava/lang/String;)V

    .line 209
    .line 210
    .line 211
    throw v0

    .line 212
    :cond_3
    invoke-virtual {v4}, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->getDestination()Ljava/lang/Class;

    .line 213
    .line 214
    .line 215
    move-result-object v1

    .line 216
    invoke-virtual {p0, v1}, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->setDestination(Ljava/lang/Class;)Lcom/tantanapp/android/injecter/facade/model/RouteMeta;

    .line 217
    .line 218
    .line 219
    invoke-virtual {v4}, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->getType()Lcom/tantanapp/android/injecter/facade/enums/RouteType;

    .line 220
    .line 221
    .line 222
    move-result-object v1

    .line 223
    invoke-virtual {p0, v1}, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->setType(Lcom/tantanapp/android/injecter/facade/enums/RouteType;)Lcom/tantanapp/android/injecter/facade/model/RouteMeta;

    .line 224
    .line 225
    .line 226
    invoke-virtual {v4}, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->getPriority()I

    .line 227
    .line 228
    .line 229
    move-result v1

    .line 230
    invoke-virtual {p0, v1}, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->setPriority(I)Lcom/tantanapp/android/injecter/facade/model/RouteMeta;

    .line 231
    .line 232
    .line 233
    invoke-virtual {v4}, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->getExtra()I

    .line 234
    .line 235
    .line 236
    move-result v1

    .line 237
    invoke-virtual {p0, v1}, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->setExtra(I)Lcom/tantanapp/android/injecter/facade/model/RouteMeta;

    .line 238
    .line 239
    .line 240
    invoke-virtual {p0}, Lcom/tantanapp/android/injecter/facade/Postcard;->getUri()Landroid/net/Uri;

    .line 241
    .line 242
    .line 243
    move-result-object v1

    .line 244
    if-eqz v1, :cond_4

    .line 245
    .line 246
    const-string v2, "NTeRQWvye18AkPd6G"

    .line 247
    .line 248
    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 249
    .line 250
    .line 251
    move-result-object v1

    .line 252
    invoke-virtual {p0, v2, v1}, Lcom/tantanapp/android/injecter/facade/Postcard;->withString(Ljava/lang/String;Ljava/lang/String;)Lcom/tantanapp/android/injecter/facade/Postcard;

    .line 253
    .line 254
    .line 255
    :cond_4
    sget-object v1, Ll/d1w$a;->a:[I

    .line 256
    .line 257
    invoke-virtual {v4}, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->getType()Lcom/tantanapp/android/injecter/facade/enums/RouteType;

    .line 258
    .line 259
    .line 260
    move-result-object v2

    .line 261
    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    .line 262
    .line 263
    .line 264
    move-result v2

    .line 265
    aget v1, v1, v2

    .line 266
    .line 267
    const/4 v2, 0x1

    .line 268
    if-eq v1, v2, :cond_5

    .line 269
    .line 270
    goto :goto_3

    .line 271
    :cond_5
    invoke-virtual {v4}, Lcom/tantanapp/android/injecter/facade/model/RouteMeta;->getDestination()Ljava/lang/Class;

    .line 272
    .line 273
    .line 274
    move-result-object v1

    .line 275
    sget-object v2, Ll/bpp0;->c:Ljava/util/Map;

    .line 276
    .line 277
    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 278
    .line 279
    .line 280
    move-result-object v2

    .line 281
    check-cast v2, Lcom/tantanapp/android/injecter/facade/template/IProvider;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 282
    .line 283
    if-nez v2, :cond_6

    .line 284
    .line 285
    :try_start_3
    invoke-virtual {v1, v5}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    .line 286
    .line 287
    .line 288
    move-result-object v2

    .line 289
    invoke-virtual {v2, v5}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    .line 290
    .line 291
    .line 292
    move-result-object v2

    .line 293
    check-cast v2, Lcom/tantanapp/android/injecter/facade/template/IProvider;

    .line 294
    .line 295
    sget-object v4, Ll/d1w;->a:Landroid/content/Context;

    .line 296
    .line 297
    invoke-interface {v2, v4}, Lcom/tantanapp/android/injecter/facade/template/IProvider;->init(Landroid/content/Context;)V

    .line 298
    .line 299
    .line 300
    sget-object v4, Ll/bpp0;->c:Ljava/util/Map;

    .line 301
    .line 302
    invoke-interface {v4, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 303
    .line 304
    .line 305
    goto :goto_2

    .line 306
    :catch_1
    move-exception p0

    .line 307
    :try_start_4
    new-instance v1, Lcom/tantanapp/android/injecter/exception/HandlerException;

    .line 308
    .line 309
    new-instance v2, Ljava/lang/StringBuilder;

    .line 310
    .line 311
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 312
    .line 313
    .line 314
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 315
    .line 316
    .line 317
    move-result-object v0

    .line 318
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 319
    .line 320
    .line 321
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 322
    .line 323
    .line 324
    move-result-object v0

    .line 325
    invoke-direct {v1, v0, p0}, Lcom/tantanapp/android/injecter/exception/HandlerException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 326
    .line 327
    .line 328
    throw v1

    .line 329
    :cond_6
    :goto_2
    invoke-virtual {p0, v2}, Lcom/tantanapp/android/injecter/facade/Postcard;->setProvider(Lcom/tantanapp/android/injecter/facade/template/IProvider;)Lcom/tantanapp/android/injecter/facade/Postcard;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 330
    .line 331
    .line 332
    :goto_3
    monitor-exit v3

    .line 333
    return-void

    .line 334
    :cond_7
    :try_start_5
    new-instance p0, Ljava/lang/RuntimeException;

    .line 335
    .line 336
    const-string v0, "Injecter::No postcard!"

    .line 337
    .line 338
    invoke-direct {p0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 339
    .line 340
    .line 341
    throw p0

    .line 342
    :goto_4
    monitor-exit v3
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 343
    throw p0
.end method

.method public static declared-synchronized b(Landroid/content/Context;Ljava/lang/String;)V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/tantanapp/android/injecter/exception/HandlerException;
        }
    .end annotation

    .line 1
    const-string v0, "init with classes: "

    .line 2
    .line 3
    const-string v1, "init with classes: "

    .line 4
    .line 5
    const-string v2, "init with classes: "

    .line 6
    .line 7
    const-string v3, "init with classes: "

    .line 8
    .line 9
    const-string v4, "init with classes: "

    .line 10
    .line 11
    const-string v5, "com.tantanapp.android.injecter.routes.Injecter$$Intermediate$$"

    .line 12
    .line 13
    const-class v6, Ll/d1w;

    .line 14
    .line 15
    monitor-enter v6

    .line 16
    :try_start_0
    new-instance v7, Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-static {p1}, Ll/jsi0;->b(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v8
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    if-nez v8, :cond_0

    .line 26
    .line 27
    :try_start_1
    new-instance v8, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    invoke-direct {v8, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    const-string v5, "list"

    .line 44
    .line 45
    invoke-virtual {p1, v5}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 46
    .line 47
    .line 48
    move-result-object v5

    .line 49
    invoke-virtual {v5, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    check-cast p1, Ljava/util/ArrayList;
    :try_end_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/NoSuchFieldException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 54
    .line 55
    :try_start_2
    sget-object v0, Ll/mum;->c:Lcom/tantanapp/android/injecter/facade/template/ILogger;

    .line 56
    .line 57
    const-string v1, "Injecter::"

    .line 58
    .line 59
    new-instance v2, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-interface {v0, v1, v2}, Lcom/tantanapp/android/injecter/facade/template/ILogger;->info(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 72
    .line 73
    .line 74
    move-object v7, p1

    .line 75
    goto :goto_3

    .line 76
    :catchall_0
    move-exception p0

    .line 77
    goto :goto_4

    .line 78
    :catchall_1
    move-exception p0

    .line 79
    goto :goto_2

    .line 80
    :catch_0
    :try_start_3
    sget-object p1, Ll/mum;->c:Lcom/tantanapp/android/injecter/facade/template/ILogger;

    .line 81
    .line 82
    const-string v1, "Injecter::"

    .line 83
    .line 84
    const-string v2, "Intermediate field is not accessible!"

    .line 85
    .line 86
    invoke-interface {p1, v1, v2}, Lcom/tantanapp/android/injecter/facade/template/ILogger;->error(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 87
    .line 88
    .line 89
    :try_start_4
    sget-object p1, Ll/mum;->c:Lcom/tantanapp/android/injecter/facade/template/ILogger;

    .line 90
    .line 91
    const-string v0, "Injecter::"

    .line 92
    .line 93
    new-instance v1, Ljava/lang/StringBuilder;

    .line 94
    .line 95
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    goto :goto_1

    .line 102
    :goto_0
    invoke-interface {p1, v0, v1}, Lcom/tantanapp/android/injecter/facade/template/ILogger;->info(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 103
    .line 104
    .line 105
    goto :goto_3

    .line 106
    :catch_1
    :try_start_5
    sget-object p1, Ll/mum;->c:Lcom/tantanapp/android/injecter/facade/template/ILogger;

    .line 107
    .line 108
    const-string v1, "Injecter::"

    .line 109
    .line 110
    const-string v3, "No intermediate field was found!"

    .line 111
    .line 112
    invoke-interface {p1, v1, v3}, Lcom/tantanapp/android/injecter/facade/template/ILogger;->error(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 113
    .line 114
    .line 115
    :try_start_6
    sget-object p1, Ll/mum;->c:Lcom/tantanapp/android/injecter/facade/template/ILogger;

    .line 116
    .line 117
    const-string v0, "Injecter::"

    .line 118
    .line 119
    new-instance v1, Ljava/lang/StringBuilder;

    .line 120
    .line 121
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    :goto_1
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 131
    goto :goto_0

    .line 132
    :catch_2
    :try_start_7
    sget-object p1, Ll/mum;->c:Lcom/tantanapp/android/injecter/facade/template/ILogger;

    .line 133
    .line 134
    const-string v2, "Injecter::"

    .line 135
    .line 136
    const-string v3, "No intermediate class was found!"

    .line 137
    .line 138
    invoke-interface {p1, v2, v3}, Lcom/tantanapp/android/injecter/facade/template/ILogger;->error(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 139
    .line 140
    .line 141
    :try_start_8
    sget-object p1, Ll/mum;->c:Lcom/tantanapp/android/injecter/facade/template/ILogger;

    .line 142
    .line 143
    const-string v0, "Injecter::"

    .line 144
    .line 145
    new-instance v2, Ljava/lang/StringBuilder;

    .line 146
    .line 147
    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    goto :goto_0

    .line 158
    :goto_2
    sget-object p1, Ll/mum;->c:Lcom/tantanapp/android/injecter/facade/template/ILogger;

    .line 159
    .line 160
    const-string v1, "Injecter::"

    .line 161
    .line 162
    new-instance v2, Ljava/lang/StringBuilder;

    .line 163
    .line 164
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    invoke-interface {p1, v1, v0}, Lcom/tantanapp/android/injecter/facade/template/ILogger;->info(Ljava/lang/String;Ljava/lang/String;)V

    .line 175
    .line 176
    .line 177
    throw p0

    .line 178
    :cond_0
    :goto_3
    invoke-static {p0, v7}, Ll/d1w;->c(Landroid/content/Context;Ljava/util/List;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 179
    .line 180
    .line 181
    monitor-exit v6

    .line 182
    return-void

    .line 183
    :goto_4
    :try_start_9
    monitor-exit v6
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 184
    throw p0
.end method

.method public static declared-synchronized c(Landroid/content/Context;Ljava/util/List;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/tantanapp/android/injecter/exception/HandlerException;
        }
    .end annotation

    .line 1
    const-string v0, "Find router map finished, map size = "

    .line 2
    .line 3
    const-class v1, Ll/d1w;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    :try_start_0
    sput-object p0, Ll/d1w;->a:Landroid/content/Context;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    .line 8
    :try_start_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 9
    .line 10
    .line 11
    move-result-wide v2

    .line 12
    invoke-static {p1}, Ll/d1w;->d(Ljava/util/List;)V

    .line 13
    .line 14
    .line 15
    sget-boolean p1, Ll/d1w;->b:Z

    .line 16
    .line 17
    const/4 v4, 0x0

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    sget-object p0, Ll/mum;->c:Lcom/tantanapp/android/injecter/facade/template/ILogger;

    .line 21
    .line 22
    const-string p1, "Injecter::"

    .line 23
    .line 24
    const-string v0, "Load router map by arouter-auto-register plugin."

    .line 25
    .line 26
    invoke-interface {p0, p1, v0}, Lcom/tantanapp/android/injecter/facade/template/ILogger;->info(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    goto/16 :goto_3

    .line 30
    .line 31
    :catchall_0
    move-exception p0

    .line 32
    goto/16 :goto_5

    .line 33
    .line 34
    :catch_0
    move-exception p0

    .line 35
    goto/16 :goto_4

    .line 36
    .line 37
    :cond_0
    invoke-static {}, Ll/mum;->b()Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-nez p1, :cond_2

    .line 42
    .line 43
    invoke-static {p0}, Ll/wc60;->b(Landroid/content/Context;)Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-eqz p1, :cond_1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    sget-object p1, Ll/mum;->c:Lcom/tantanapp/android/injecter/facade/template/ILogger;

    .line 51
    .line 52
    const-string v5, "Injecter::"

    .line 53
    .line 54
    const-string v6, "Load router map from cache."

    .line 55
    .line 56
    invoke-interface {p1, v5, v6}, Lcom/tantanapp/android/injecter/facade/template/ILogger;->info(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    new-instance p1, Ljava/util/HashSet;

    .line 60
    .line 61
    const-string v5, "SP_INJECTER_CACHE"

    .line 62
    .line 63
    invoke-virtual {p0, v5, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    const-string v5, "INJECTER_MAP"

    .line 68
    .line 69
    new-instance v6, Ljava/util/HashSet;

    .line 70
    .line 71
    invoke-direct {v6}, Ljava/util/HashSet;-><init>()V

    .line 72
    .line 73
    .line 74
    invoke-interface {p0, v5, v6}, Landroid/content/SharedPreferences;->getStringSet(Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-direct {p1, p0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 79
    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_2
    :goto_0
    sget-object p1, Ll/mum;->c:Lcom/tantanapp/android/injecter/facade/template/ILogger;

    .line 83
    .line 84
    const-string v5, "Injecter::"

    .line 85
    .line 86
    const-string v6, "Run with debug mode or new install, rebuild router map."

    .line 87
    .line 88
    invoke-interface {p1, v5, v6}, Lcom/tantanapp/android/injecter/facade/template/ILogger;->info(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    sget-object p1, Ll/d1w;->a:Landroid/content/Context;

    .line 92
    .line 93
    const-string v5, "com.tantanapp.android.injecter.routes"

    .line 94
    .line 95
    invoke-static {p1, v5}, Ll/j85;->a(Landroid/content/Context;Ljava/lang/String;)Ljava/util/Set;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    invoke-interface {p1}, Ljava/util/Set;->isEmpty()Z

    .line 100
    .line 101
    .line 102
    move-result v5

    .line 103
    if-nez v5, :cond_3

    .line 104
    .line 105
    const-string v5, "SP_INJECTER_CACHE"

    .line 106
    .line 107
    invoke-virtual {p0, v5, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 108
    .line 109
    .line 110
    move-result-object v5

    .line 111
    invoke-interface {v5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 112
    .line 113
    .line 114
    move-result-object v5

    .line 115
    const-string v6, "INJECTER_MAP"

    .line 116
    .line 117
    invoke-interface {v5, v6, p1}, Landroid/content/SharedPreferences$Editor;->putStringSet(Ljava/lang/String;Ljava/util/Set;)Landroid/content/SharedPreferences$Editor;

    .line 118
    .line 119
    .line 120
    move-result-object v5

    .line 121
    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 122
    .line 123
    .line 124
    :cond_3
    invoke-static {p0}, Ll/wc60;->c(Landroid/content/Context;)V

    .line 125
    .line 126
    .line 127
    :goto_1
    sget-object p0, Ll/mum;->c:Lcom/tantanapp/android/injecter/facade/template/ILogger;

    .line 128
    .line 129
    const-string v5, "Injecter::"

    .line 130
    .line 131
    new-instance v6, Ljava/lang/StringBuilder;

    .line 132
    .line 133
    invoke-direct {v6, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    invoke-interface {p1}, Ljava/util/Set;->size()I

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    const-string v0, ", cost "

    .line 144
    .line 145
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 149
    .line 150
    .line 151
    move-result-wide v7

    .line 152
    sub-long/2addr v7, v2

    .line 153
    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    const-string v0, " ms."

    .line 157
    .line 158
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    invoke-interface {p0, v5, v0}, Lcom/tantanapp/android/injecter/facade/template/ILogger;->info(Ljava/lang/String;Ljava/lang/String;)V

    .line 166
    .line 167
    .line 168
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 169
    .line 170
    .line 171
    move-result-wide v2

    .line 172
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 173
    .line 174
    .line 175
    move-result-object p0

    .line 176
    :cond_4
    :goto_2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 177
    .line 178
    .line 179
    move-result p1

    .line 180
    if-eqz p1, :cond_6

    .line 181
    .line 182
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 183
    .line 184
    .line 185
    move-result-object p1

    .line 186
    check-cast p1, Ljava/lang/String;

    .line 187
    .line 188
    const-string v0, "com.tantanapp.android.injecter.routes.Injecter$$Root"

    .line 189
    .line 190
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 191
    .line 192
    .line 193
    move-result v0

    .line 194
    const/4 v5, 0x0

    .line 195
    if-eqz v0, :cond_5

    .line 196
    .line 197
    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 198
    .line 199
    .line 200
    move-result-object p1

    .line 201
    invoke-virtual {p1, v5}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    .line 202
    .line 203
    .line 204
    move-result-object p1

    .line 205
    invoke-virtual {p1, v5}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    .line 206
    .line 207
    .line 208
    move-result-object p1

    .line 209
    check-cast p1, Lcom/tantanapp/android/injecter/facade/template/IRouteRoot;

    .line 210
    .line 211
    sget-object v0, Ll/bpp0;->a:Ljava/util/Map;

    .line 212
    .line 213
    invoke-interface {p1, v0}, Lcom/tantanapp/android/injecter/facade/template/IRouteRoot;->loadInto(Ljava/util/Map;)V

    .line 214
    .line 215
    .line 216
    goto :goto_2

    .line 217
    :cond_5
    const-string v0, "com.tantanapp.android.injecter.routes.Injecter$$Providers"

    .line 218
    .line 219
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 220
    .line 221
    .line 222
    move-result v0

    .line 223
    if-eqz v0, :cond_4

    .line 224
    .line 225
    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 226
    .line 227
    .line 228
    move-result-object p1

    .line 229
    invoke-virtual {p1, v5}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    .line 230
    .line 231
    .line 232
    move-result-object p1

    .line 233
    invoke-virtual {p1, v5}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    .line 234
    .line 235
    .line 236
    move-result-object p1

    .line 237
    check-cast p1, Lcom/tantanapp/android/injecter/facade/template/IProviderGroup;

    .line 238
    .line 239
    sget-object v0, Ll/bpp0;->d:Ljava/util/Map;

    .line 240
    .line 241
    invoke-interface {p1, v0}, Lcom/tantanapp/android/injecter/facade/template/IProviderGroup;->loadInto(Ljava/util/Map;)V

    .line 242
    .line 243
    .line 244
    goto :goto_2

    .line 245
    :cond_6
    :goto_3
    sget-object p0, Ll/mum;->c:Lcom/tantanapp/android/injecter/facade/template/ILogger;

    .line 246
    .line 247
    const-string p1, "Injecter::"

    .line 248
    .line 249
    new-instance v0, Ljava/lang/StringBuilder;

    .line 250
    .line 251
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 252
    .line 253
    .line 254
    const-string v5, "Load root element finished, cost "

    .line 255
    .line 256
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 257
    .line 258
    .line 259
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 260
    .line 261
    .line 262
    move-result-wide v5

    .line 263
    sub-long/2addr v5, v2

    .line 264
    invoke-virtual {v0, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 265
    .line 266
    .line 267
    const-string v2, " ms."

    .line 268
    .line 269
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 270
    .line 271
    .line 272
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 273
    .line 274
    .line 275
    move-result-object v0

    .line 276
    invoke-interface {p0, p1, v0}, Lcom/tantanapp/android/injecter/facade/template/ILogger;->info(Ljava/lang/String;Ljava/lang/String;)V

    .line 277
    .line 278
    .line 279
    sget-object p0, Ll/bpp0;->a:Ljava/util/Map;

    .line 280
    .line 281
    invoke-interface {p0}, Ljava/util/Map;->size()I

    .line 282
    .line 283
    .line 284
    move-result p0

    .line 285
    if-nez p0, :cond_7

    .line 286
    .line 287
    sget-object p0, Ll/mum;->c:Lcom/tantanapp/android/injecter/facade/template/ILogger;

    .line 288
    .line 289
    const-string p1, "Injecter::"

    .line 290
    .line 291
    const-string v0, "No mapping files were found, check your configuration please!"

    .line 292
    .line 293
    invoke-interface {p0, p1, v0}, Lcom/tantanapp/android/injecter/facade/template/ILogger;->error(Ljava/lang/String;Ljava/lang/String;)V

    .line 294
    .line 295
    .line 296
    :cond_7
    invoke-static {}, Ll/mum;->b()Z

    .line 297
    .line 298
    .line 299
    move-result p0

    .line 300
    if-eqz p0, :cond_8

    .line 301
    .line 302
    sget-object p0, Ll/mum;->c:Lcom/tantanapp/android/injecter/facade/template/ILogger;

    .line 303
    .line 304
    const-string p1, "Injecter::"

    .line 305
    .line 306
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 307
    .line 308
    .line 309
    move-result-object v0

    .line 310
    const-string v2, "LogisticsCenter has already been loaded, GroupIndex[%d], InterceptorIndex[%d], ProviderIndex[%d]"

    .line 311
    .line 312
    sget-object v3, Ll/bpp0;->a:Ljava/util/Map;

    .line 313
    .line 314
    invoke-interface {v3}, Ljava/util/Map;->size()I

    .line 315
    .line 316
    .line 317
    move-result v3

    .line 318
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 319
    .line 320
    .line 321
    move-result-object v3

    .line 322
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 323
    .line 324
    .line 325
    move-result-object v4

    .line 326
    sget-object v5, Ll/bpp0;->d:Ljava/util/Map;

    .line 327
    .line 328
    invoke-interface {v5}, Ljava/util/Map;->size()I

    .line 329
    .line 330
    .line 331
    move-result v5

    .line 332
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 333
    .line 334
    .line 335
    move-result-object v5

    .line 336
    filled-new-array {v3, v4, v5}, [Ljava/lang/Object;

    .line 337
    .line 338
    .line 339
    move-result-object v3

    .line 340
    invoke-static {v0, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 341
    .line 342
    .line 343
    move-result-object v0

    .line 344
    invoke-interface {p0, p1, v0}, Lcom/tantanapp/android/injecter/facade/template/ILogger;->debug(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 345
    .line 346
    .line 347
    :cond_8
    monitor-exit v1

    .line 348
    return-void

    .line 349
    :goto_4
    :try_start_2
    new-instance p1, Lcom/tantanapp/android/injecter/exception/HandlerException;

    .line 350
    .line 351
    new-instance v0, Ljava/lang/StringBuilder;

    .line 352
    .line 353
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 354
    .line 355
    .line 356
    const-string v2, "Injecter::Injecter init logistics center exception! ["

    .line 357
    .line 358
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 359
    .line 360
    .line 361
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 362
    .line 363
    .line 364
    move-result-object v2

    .line 365
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 366
    .line 367
    .line 368
    const-string v2, "]"

    .line 369
    .line 370
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 371
    .line 372
    .line 373
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 374
    .line 375
    .line 376
    move-result-object v0

    .line 377
    invoke-direct {p1, v0, p0}, Lcom/tantanapp/android/injecter/exception/HandlerException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 378
    .line 379
    .line 380
    throw p1

    .line 381
    :goto_5
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 382
    throw p0
.end method

.method public static d(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    sput-boolean v0, Ll/d1w;->b:Z

    .line 3
    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v0}, Ll/d1w;->f(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    return-void
.end method

.method public static e()V
    .locals 1

    .line 1
    sget-boolean v0, Ll/d1w;->b:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sput-boolean v0, Ll/d1w;->b:Z

    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static f(Ljava/lang/String;)V
    .locals 4

    .line 1
    const-string v0, "Injecter::"

    .line 2
    .line 3
    const-string v1, "register failed, class name: "

    .line 4
    .line 5
    invoke-static {p0}, Ll/jsi0;->b(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-nez v2, :cond_2

    .line 10
    .line 11
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    const/4 v3, 0x0

    .line 16
    invoke-virtual {v2, v3}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {v2, v3}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    instance-of v3, v2, Lcom/tantanapp/android/injecter/facade/template/IRouteRoot;

    .line 25
    .line 26
    if-eqz v3, :cond_0

    .line 27
    .line 28
    check-cast v2, Lcom/tantanapp/android/injecter/facade/template/IRouteRoot;

    .line 29
    .line 30
    invoke-static {v2}, Ll/d1w;->h(Lcom/tantanapp/android/injecter/facade/template/IRouteRoot;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    instance-of v3, v2, Lcom/tantanapp/android/injecter/facade/template/IProviderGroup;

    .line 35
    .line 36
    if-eqz v3, :cond_1

    .line 37
    .line 38
    check-cast v2, Lcom/tantanapp/android/injecter/facade/template/IProviderGroup;

    .line 39
    .line 40
    invoke-static {v2}, Ll/d1w;->g(Lcom/tantanapp/android/injecter/facade/template/IProviderGroup;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_1
    sget-object v2, Ll/mum;->c:Lcom/tantanapp/android/injecter/facade/template/ILogger;

    .line 45
    .line 46
    new-instance v3, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string v1, " should implements one of IRouteRoot/IProviderGroup/IInterceptorGroup."

    .line 55
    .line 56
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-interface {v2, v0, v1}, Lcom/tantanapp/android/injecter/facade/template/ILogger;->info(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :catch_0
    sget-object v1, Ll/mum;->c:Lcom/tantanapp/android/injecter/facade/template/ILogger;

    .line 68
    .line 69
    new-instance v2, Ljava/lang/StringBuilder;

    .line 70
    .line 71
    const-string v3, "register class error:"

    .line 72
    .line 73
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-interface {v1, v0, p0}, Lcom/tantanapp/android/injecter/facade/template/ILogger;->error(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    :cond_2
    return-void
.end method

.method public static g(Lcom/tantanapp/android/injecter/facade/template/IProviderGroup;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/d1w;->e()V

    .line 2
    .line 3
    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    sget-object v0, Ll/bpp0;->d:Ljava/util/Map;

    .line 7
    .line 8
    invoke-interface {p0, v0}, Lcom/tantanapp/android/injecter/facade/template/IProviderGroup;->loadInto(Ljava/util/Map;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public static h(Lcom/tantanapp/android/injecter/facade/template/IRouteRoot;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/d1w;->e()V

    .line 2
    .line 3
    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    sget-object v0, Ll/bpp0;->a:Ljava/util/Map;

    .line 7
    .line 8
    invoke-interface {p0, v0}, Lcom/tantanapp/android/injecter/facade/template/IRouteRoot;->loadInto(Ljava/util/Map;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method
