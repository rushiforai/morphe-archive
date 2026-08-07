.class public Lcom/alibaba/fastjson/parser/deserializer/StackTraceElementDeserializer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;


# static fields
.field public static final instance:Lcom/alibaba/fastjson/parser/deserializer/StackTraceElementDeserializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/alibaba/fastjson/parser/deserializer/StackTraceElementDeserializer;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/alibaba/fastjson/parser/deserializer/StackTraceElementDeserializer;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/alibaba/fastjson/parser/deserializer/StackTraceElementDeserializer;->instance:Lcom/alibaba/fastjson/parser/deserializer/StackTraceElementDeserializer;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public deserialze(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/alibaba/fastjson/parser/DefaultJSONParser;",
            "Ljava/lang/reflect/Type;",
            "Ljava/lang/Object;",
            ")TT;"
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    const/4 p3, 0x0

    .line 8
    const/16 v0, 0x8

    .line 9
    .line 10
    if-ne p2, v0, :cond_0

    .line 11
    .line 12
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 13
    .line 14
    .line 15
    return-object p3

    .line 16
    :cond_0
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    const/16 v1, 0xc

    .line 21
    .line 22
    const/16 v2, 0x10

    .line 23
    .line 24
    if-eq p2, v1, :cond_2

    .line 25
    .line 26
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    if-ne p2, v2, :cond_1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    invoke-static {p0}, Lcom/alibaba/fastjson/parser/JSONToken;->name(I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    const-string p1, "syntax error: "

    .line 42
    .line 43
    invoke-static {p1, p0}, Ll/wkq;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    return-object p3

    .line 47
    :cond_2
    :goto_0
    const/4 p2, 0x0

    .line 48
    move v5, p2

    .line 49
    move-object v1, p3

    .line 50
    move-object v3, v1

    .line 51
    move-object v4, v3

    .line 52
    :cond_3
    :goto_1
    invoke-virtual {p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->getSymbolTable()Lcom/alibaba/fastjson/parser/SymbolTable;

    .line 53
    .line 54
    .line 55
    move-result-object v6

    .line 56
    invoke-interface {p0, v6}, Lcom/alibaba/fastjson/parser/JSONLexer;->scanSymbol(Lcom/alibaba/fastjson/parser/SymbolTable;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v6

    .line 60
    const/16 v7, 0xd

    .line 61
    .line 62
    if-nez v6, :cond_5

    .line 63
    .line 64
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 65
    .line 66
    .line 67
    move-result v8

    .line 68
    if-ne v8, v7, :cond_4

    .line 69
    .line 70
    invoke-interface {p0, v2}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 71
    .line 72
    .line 73
    goto/16 :goto_3

    .line 74
    .line 75
    :cond_4
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 76
    .line 77
    .line 78
    move-result v8

    .line 79
    if-ne v8, v2, :cond_5

    .line 80
    .line 81
    sget-object v8, Lcom/alibaba/fastjson/parser/Feature;->AllowArbitraryCommas:Lcom/alibaba/fastjson/parser/Feature;

    .line 82
    .line 83
    invoke-interface {p0, v8}, Lcom/alibaba/fastjson/parser/JSONLexer;->isEnabled(Lcom/alibaba/fastjson/parser/Feature;)Z

    .line 84
    .line 85
    .line 86
    move-result v8

    .line 87
    if-eqz v8, :cond_5

    .line 88
    .line 89
    goto :goto_1

    .line 90
    :cond_5
    const/4 v8, 0x4

    .line 91
    invoke-interface {p0, v8}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextTokenWithColon(I)V

    .line 92
    .line 93
    .line 94
    const-string v9, "className"

    .line 95
    .line 96
    invoke-virtual {v9, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    move-result v9

    .line 100
    const-string v10, "syntax error"

    .line 101
    .line 102
    if-eqz v9, :cond_8

    .line 103
    .line 104
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    if-ne v1, v0, :cond_6

    .line 109
    .line 110
    move-object v1, p3

    .line 111
    goto/16 :goto_2

    .line 112
    .line 113
    :cond_6
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 114
    .line 115
    .line 116
    move-result v1

    .line 117
    if-ne v1, v8, :cond_7

    .line 118
    .line 119
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->stringVal()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    goto/16 :goto_2

    .line 124
    .line 125
    :cond_7
    invoke-static {v10}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    return-object p3

    .line 129
    :cond_8
    const-string v9, "methodName"

    .line 130
    .line 131
    invoke-virtual {v9, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    move-result v9

    .line 135
    if-eqz v9, :cond_b

    .line 136
    .line 137
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 138
    .line 139
    .line 140
    move-result v3

    .line 141
    if-ne v3, v0, :cond_9

    .line 142
    .line 143
    move-object v3, p3

    .line 144
    goto/16 :goto_2

    .line 145
    .line 146
    :cond_9
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 147
    .line 148
    .line 149
    move-result v3

    .line 150
    if-ne v3, v8, :cond_a

    .line 151
    .line 152
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->stringVal()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v3

    .line 156
    goto/16 :goto_2

    .line 157
    .line 158
    :cond_a
    invoke-static {v10}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    return-object p3

    .line 162
    :cond_b
    const-string v9, "fileName"

    .line 163
    .line 164
    invoke-virtual {v9, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 165
    .line 166
    .line 167
    move-result v9

    .line 168
    if-eqz v9, :cond_e

    .line 169
    .line 170
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 171
    .line 172
    .line 173
    move-result v4

    .line 174
    if-ne v4, v0, :cond_c

    .line 175
    .line 176
    move-object v4, p3

    .line 177
    goto/16 :goto_2

    .line 178
    .line 179
    :cond_c
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 180
    .line 181
    .line 182
    move-result v4

    .line 183
    if-ne v4, v8, :cond_d

    .line 184
    .line 185
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->stringVal()Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object v4

    .line 189
    goto/16 :goto_2

    .line 190
    .line 191
    :cond_d
    invoke-static {v10}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 192
    .line 193
    .line 194
    return-object p3

    .line 195
    :cond_e
    const-string v9, "lineNumber"

    .line 196
    .line 197
    invoke-virtual {v9, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 198
    .line 199
    .line 200
    move-result v9

    .line 201
    if-eqz v9, :cond_11

    .line 202
    .line 203
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 204
    .line 205
    .line 206
    move-result v5

    .line 207
    if-ne v5, v0, :cond_f

    .line 208
    .line 209
    move v5, p2

    .line 210
    goto/16 :goto_2

    .line 211
    .line 212
    :cond_f
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 213
    .line 214
    .line 215
    move-result v5

    .line 216
    const/4 v6, 0x2

    .line 217
    if-ne v5, v6, :cond_10

    .line 218
    .line 219
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->intValue()I

    .line 220
    .line 221
    .line 222
    move-result v5

    .line 223
    goto/16 :goto_2

    .line 224
    .line 225
    :cond_10
    invoke-static {v10}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 226
    .line 227
    .line 228
    return-object p3

    .line 229
    :cond_11
    const-string v9, "nativeMethod"

    .line 230
    .line 231
    invoke-virtual {v9, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 232
    .line 233
    .line 234
    move-result v9

    .line 235
    if-eqz v9, :cond_15

    .line 236
    .line 237
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 238
    .line 239
    .line 240
    move-result v6

    .line 241
    if-ne v6, v0, :cond_12

    .line 242
    .line 243
    invoke-interface {p0, v2}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 244
    .line 245
    .line 246
    goto/16 :goto_2

    .line 247
    .line 248
    :cond_12
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 249
    .line 250
    .line 251
    move-result v6

    .line 252
    const/4 v8, 0x6

    .line 253
    if-ne v6, v8, :cond_13

    .line 254
    .line 255
    invoke-interface {p0, v2}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 256
    .line 257
    .line 258
    goto/16 :goto_2

    .line 259
    .line 260
    :cond_13
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 261
    .line 262
    .line 263
    move-result v6

    .line 264
    const/4 v8, 0x7

    .line 265
    if-ne v6, v8, :cond_14

    .line 266
    .line 267
    invoke-interface {p0, v2}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 268
    .line 269
    .line 270
    goto/16 :goto_2

    .line 271
    .line 272
    :cond_14
    invoke-static {v10}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 273
    .line 274
    .line 275
    return-object p3

    .line 276
    :cond_15
    sget-object v9, Lcom/alibaba/fastjson/JSON;->DEFAULT_TYPE_KEY:Ljava/lang/String;

    .line 277
    .line 278
    const-string v11, "syntax error : "

    .line 279
    .line 280
    if-ne v6, v9, :cond_19

    .line 281
    .line 282
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 283
    .line 284
    .line 285
    move-result v6

    .line 286
    if-ne v6, v8, :cond_17

    .line 287
    .line 288
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->stringVal()Ljava/lang/String;

    .line 289
    .line 290
    .line 291
    move-result-object v6

    .line 292
    const-string v8, "java.lang.StackTraceElement"

    .line 293
    .line 294
    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 295
    .line 296
    .line 297
    move-result v8

    .line 298
    if-eqz v8, :cond_16

    .line 299
    .line 300
    goto :goto_2

    .line 301
    :cond_16
    invoke-virtual {v11, v6}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 302
    .line 303
    .line 304
    move-result-object p0

    .line 305
    invoke-static {p0}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 306
    .line 307
    .line 308
    return-object p3

    .line 309
    :cond_17
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 310
    .line 311
    .line 312
    move-result v6

    .line 313
    if-ne v6, v0, :cond_18

    .line 314
    .line 315
    goto :goto_2

    .line 316
    :cond_18
    invoke-static {v10}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 317
    .line 318
    .line 319
    return-object p3

    .line 320
    :cond_19
    const-string v9, "moduleName"

    .line 321
    .line 322
    invoke-virtual {v9, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 323
    .line 324
    .line 325
    move-result v9

    .line 326
    if-eqz v9, :cond_1c

    .line 327
    .line 328
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 329
    .line 330
    .line 331
    move-result v6

    .line 332
    if-ne v6, v0, :cond_1a

    .line 333
    .line 334
    goto :goto_2

    .line 335
    :cond_1a
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 336
    .line 337
    .line 338
    move-result v6

    .line 339
    if-ne v6, v8, :cond_1b

    .line 340
    .line 341
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->stringVal()Ljava/lang/String;

    .line 342
    .line 343
    .line 344
    goto :goto_2

    .line 345
    :cond_1b
    invoke-static {v10}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 346
    .line 347
    .line 348
    return-object p3

    .line 349
    :cond_1c
    const-string v9, "moduleVersion"

    .line 350
    .line 351
    invoke-virtual {v9, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 352
    .line 353
    .line 354
    move-result v9

    .line 355
    if-eqz v9, :cond_1f

    .line 356
    .line 357
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 358
    .line 359
    .line 360
    move-result v6

    .line 361
    if-ne v6, v0, :cond_1d

    .line 362
    .line 363
    goto :goto_2

    .line 364
    :cond_1d
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 365
    .line 366
    .line 367
    move-result v6

    .line 368
    if-ne v6, v8, :cond_1e

    .line 369
    .line 370
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->stringVal()Ljava/lang/String;

    .line 371
    .line 372
    .line 373
    goto :goto_2

    .line 374
    :cond_1e
    invoke-static {v10}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 375
    .line 376
    .line 377
    return-object p3

    .line 378
    :cond_1f
    const-string v9, "classLoaderName"

    .line 379
    .line 380
    invoke-virtual {v9, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 381
    .line 382
    .line 383
    move-result v9

    .line 384
    if-eqz v9, :cond_22

    .line 385
    .line 386
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 387
    .line 388
    .line 389
    move-result v6

    .line 390
    if-ne v6, v0, :cond_20

    .line 391
    .line 392
    goto :goto_2

    .line 393
    :cond_20
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 394
    .line 395
    .line 396
    move-result v6

    .line 397
    if-ne v6, v8, :cond_21

    .line 398
    .line 399
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->stringVal()Ljava/lang/String;

    .line 400
    .line 401
    .line 402
    :goto_2
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 403
    .line 404
    .line 405
    move-result v6

    .line 406
    if-ne v6, v7, :cond_3

    .line 407
    .line 408
    invoke-interface {p0, v2}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 409
    .line 410
    .line 411
    :goto_3
    new-instance p0, Ljava/lang/StackTraceElement;

    .line 412
    .line 413
    invoke-direct {p0, v1, v3, v4, v5}, Ljava/lang/StackTraceElement;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 414
    .line 415
    .line 416
    return-object p0

    .line 417
    :cond_21
    invoke-static {v10}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 418
    .line 419
    .line 420
    return-object p3

    .line 421
    :cond_22
    invoke-static {v11, v6}, Ll/rkq;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 422
    .line 423
    .line 424
    return-object p3
.end method

.method public getFastMatchToken()I
    .locals 0

    const/16 p0, 0xc

    return p0
.end method
