.class public Lcom/alibaba/fastjson/serializer/MiscCodec;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/alibaba/fastjson/serializer/ObjectSerializer;
.implements Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;


# static fields
.field private static FILE_RELATIVE_PATH_SUPPORT:Z

.field public static final instance:Lcom/alibaba/fastjson/serializer/MiscCodec;

.field private static method_paths_get:Ljava/lang/reflect/Method;

.field private static method_paths_get_error:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/alibaba/fastjson/serializer/MiscCodec;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/alibaba/fastjson/serializer/MiscCodec;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/alibaba/fastjson/serializer/MiscCodec;->instance:Lcom/alibaba/fastjson/serializer/MiscCodec;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    sput-boolean v0, Lcom/alibaba/fastjson/serializer/MiscCodec;->method_paths_get_error:Z

    .line 10
    .line 11
    const-string v0, "fastjson.deserializer.fileRelativePathSupport"

    .line 12
    .line 13
    invoke-static {v0}, Lcom/alibaba/fastjson/util/IOUtils;->getStringProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "true"

    .line 18
    .line 19
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    sput-boolean v0, Lcom/alibaba/fastjson/serializer/MiscCodec;->FILE_RELATIVE_PATH_SUPPORT:Z

    .line 24
    .line 25
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

.method private static toString(Lorg/w3c/dom/Node;)Ljava/lang/String;
    .locals 3

    .line 1
    :try_start_0
    invoke-static {}, Ljavax/xml/transform/TransformerFactory;->newInstance()Ljavax/xml/transform/TransformerFactory;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljavax/xml/transform/TransformerFactory;->newTransformer()Ljavax/xml/transform/Transformer;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ljavax/xml/transform/dom/DOMSource;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ljavax/xml/transform/dom/DOMSource;-><init>(Lorg/w3c/dom/Node;)V

    .line 12
    .line 13
    .line 14
    new-instance p0, Ljava/io/StringWriter;

    .line 15
    .line 16
    invoke-direct {p0}, Ljava/io/StringWriter;-><init>()V

    .line 17
    .line 18
    .line 19
    new-instance v2, Ljavax/xml/transform/stream/StreamResult;

    .line 20
    .line 21
    invoke-direct {v2, p0}, Ljavax/xml/transform/stream/StreamResult;-><init>(Ljava/io/Writer;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1, v2}, Ljavax/xml/transform/Transformer;->transform(Ljavax/xml/transform/Source;Ljavax/xml/transform/Result;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0
    :try_end_0
    .catch Ljavax/xml/transform/TransformerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    return-object p0

    .line 32
    :catch_0
    move-exception p0

    .line 33
    const-string v0, "xml node to string error"

    .line 34
    .line 35
    invoke-static {v0, p0}, Ll/okq;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 36
    .line 37
    .line 38
    const/4 p0, 0x0

    .line 39
    return-object p0
.end method


# virtual methods
.method public deserialze(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8
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
    const-string p0, "Path deserialize erorr"

    .line 2
    .line 3
    iget-object p3, p1, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    .line 4
    .line 5
    const-class v0, Ljava/net/InetSocketAddress;

    .line 6
    .line 7
    const/16 v1, 0xd

    .line 8
    .line 9
    const/16 v2, 0x10

    .line 10
    .line 11
    const/4 v3, 0x2

    .line 12
    const-class v4, Ljava/net/InetAddress;

    .line 13
    .line 14
    const/4 v5, 0x0

    .line 15
    const/16 v6, 0x11

    .line 16
    .line 17
    const/4 v7, 0x0

    .line 18
    if-ne p2, v0, :cond_5

    .line 19
    .line 20
    invoke-interface {p3}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    const/16 p2, 0x8

    .line 25
    .line 26
    if-ne p0, p2, :cond_0

    .line 27
    .line 28
    invoke-interface {p3}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 29
    .line 30
    .line 31
    return-object v7

    .line 32
    :cond_0
    const/16 p0, 0xc

    .line 33
    .line 34
    invoke-virtual {p1, p0}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->accept(I)V

    .line 35
    .line 36
    .line 37
    move-object p0, v7

    .line 38
    :goto_0
    invoke-interface {p3}, Lcom/alibaba/fastjson/parser/JSONLexer;->stringVal()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    invoke-interface {p3, v6}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 43
    .line 44
    .line 45
    const-string v0, "address"

    .line 46
    .line 47
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_1

    .line 52
    .line 53
    invoke-virtual {p1, v6}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->accept(I)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p1, v4}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parseObject(Ljava/lang/Class;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    check-cast p0, Ljava/net/InetAddress;

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_1
    const-string v0, "port"

    .line 64
    .line 65
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result p2

    .line 69
    if-eqz p2, :cond_3

    .line 70
    .line 71
    invoke-virtual {p1, v6}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->accept(I)V

    .line 72
    .line 73
    .line 74
    invoke-interface {p3}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 75
    .line 76
    .line 77
    move-result p2

    .line 78
    if-ne p2, v3, :cond_2

    .line 79
    .line 80
    invoke-interface {p3}, Lcom/alibaba/fastjson/parser/JSONLexer;->intValue()I

    .line 81
    .line 82
    .line 83
    move-result p2

    .line 84
    invoke-interface {p3}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 85
    .line 86
    .line 87
    move v5, p2

    .line 88
    goto :goto_1

    .line 89
    :cond_2
    const-string p0, "port is not int"

    .line 90
    .line 91
    invoke-static {p0}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    return-object v7

    .line 95
    :cond_3
    invoke-virtual {p1, v6}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->accept(I)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parse()Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    :goto_1
    invoke-interface {p3}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 102
    .line 103
    .line 104
    move-result p2

    .line 105
    if-ne p2, v2, :cond_4

    .line 106
    .line 107
    invoke-interface {p3}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 108
    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_4
    invoke-virtual {p1, v1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->accept(I)V

    .line 112
    .line 113
    .line 114
    new-instance p1, Ljava/net/InetSocketAddress;

    .line 115
    .line 116
    invoke-direct {p1, p0, v5}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    .line 117
    .line 118
    .line 119
    return-object p1

    .line 120
    :cond_5
    iget v0, p1, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->resolveStatus:I

    .line 121
    .line 122
    if-ne v0, v3, :cond_8

    .line 123
    .line 124
    iput v5, p1, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->resolveStatus:I

    .line 125
    .line 126
    invoke-virtual {p1, v2}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->accept(I)V

    .line 127
    .line 128
    .line 129
    invoke-interface {p3}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    const/4 v2, 0x4

    .line 134
    const-string v3, "syntax error"

    .line 135
    .line 136
    if-ne v0, v2, :cond_7

    .line 137
    .line 138
    const-string v0, "val"

    .line 139
    .line 140
    invoke-interface {p3}, Lcom/alibaba/fastjson/parser/JSONLexer;->stringVal()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v2

    .line 144
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 145
    .line 146
    .line 147
    move-result v0

    .line 148
    if-eqz v0, :cond_6

    .line 149
    .line 150
    invoke-interface {p3}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 151
    .line 152
    .line 153
    invoke-virtual {p1, v6}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->accept(I)V

    .line 154
    .line 155
    .line 156
    invoke-virtual {p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parse()Ljava/lang/Object;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    invoke-virtual {p1, v1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->accept(I)V

    .line 161
    .line 162
    .line 163
    goto :goto_2

    .line 164
    :cond_6
    invoke-static {v3}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    return-object v7

    .line 168
    :cond_7
    invoke-static {v3}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 169
    .line 170
    .line 171
    return-object v7

    .line 172
    :cond_8
    invoke-virtual {p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parse()Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    :goto_2
    const-class v1, Ljava/util/Currency;

    .line 177
    .line 178
    if-nez v0, :cond_9

    .line 179
    .line 180
    move-object v0, v7

    .line 181
    goto :goto_3

    .line 182
    :cond_9
    instance-of v2, v0, Ljava/lang/String;

    .line 183
    .line 184
    if-eqz v2, :cond_21

    .line 185
    .line 186
    check-cast v0, Ljava/lang/String;

    .line 187
    .line 188
    :goto_3
    if-eqz v0, :cond_20

    .line 189
    .line 190
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 191
    .line 192
    .line 193
    move-result v2

    .line 194
    if-nez v2, :cond_a

    .line 195
    .line 196
    goto/16 :goto_9

    .line 197
    .line 198
    :cond_a
    const-class v2, Ljava/util/UUID;

    .line 199
    .line 200
    if-ne p2, v2, :cond_b

    .line 201
    .line 202
    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    .line 203
    .line 204
    .line 205
    move-result-object p0

    .line 206
    return-object p0

    .line 207
    :cond_b
    const-class v2, Ljava/net/URI;

    .line 208
    .line 209
    if-ne p2, v2, :cond_c

    .line 210
    .line 211
    invoke-static {v0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    .line 212
    .line 213
    .line 214
    move-result-object p0

    .line 215
    return-object p0

    .line 216
    :cond_c
    const-class v2, Ljava/net/URL;

    .line 217
    .line 218
    if-ne p2, v2, :cond_d

    .line 219
    .line 220
    :try_start_0
    new-instance p0, Ljava/net/URL;

    .line 221
    .line 222
    invoke-direct {p0, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 223
    .line 224
    .line 225
    return-object p0

    .line 226
    :catch_0
    move-exception p0

    .line 227
    const-string p1, "create url error"

    .line 228
    .line 229
    invoke-static {p1, p0}, Ll/okq;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 230
    .line 231
    .line 232
    return-object v7

    .line 233
    :cond_d
    const-class v2, Ljava/util/regex/Pattern;

    .line 234
    .line 235
    if-ne p2, v2, :cond_e

    .line 236
    .line 237
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 238
    .line 239
    .line 240
    move-result-object p0

    .line 241
    return-object p0

    .line 242
    :cond_e
    const-class v2, Ljava/util/Locale;

    .line 243
    .line 244
    if-ne p2, v2, :cond_f

    .line 245
    .line 246
    invoke-static {v0}, Lcom/alibaba/fastjson/util/TypeUtils;->toLocale(Ljava/lang/String;)Ljava/util/Locale;

    .line 247
    .line 248
    .line 249
    move-result-object p0

    .line 250
    return-object p0

    .line 251
    :cond_f
    const-class v2, Ljava/text/SimpleDateFormat;

    .line 252
    .line 253
    if-ne p2, v2, :cond_10

    .line 254
    .line 255
    new-instance p0, Ljava/text/SimpleDateFormat;

    .line 256
    .line 257
    invoke-interface {p3}, Lcom/alibaba/fastjson/parser/JSONLexer;->getLocale()Ljava/util/Locale;

    .line 258
    .line 259
    .line 260
    move-result-object p1

    .line 261
    invoke-direct {p0, v0, p1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 262
    .line 263
    .line 264
    invoke-interface {p3}, Lcom/alibaba/fastjson/parser/JSONLexer;->getTimeZone()Ljava/util/TimeZone;

    .line 265
    .line 266
    .line 267
    move-result-object p1

    .line 268
    invoke-virtual {p0, p1}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 269
    .line 270
    .line 271
    return-object p0

    .line 272
    :cond_10
    if-eq p2, v4, :cond_1f

    .line 273
    .line 274
    const-class p3, Ljava/net/Inet4Address;

    .line 275
    .line 276
    if-eq p2, p3, :cond_1f

    .line 277
    .line 278
    const-class p3, Ljava/net/Inet6Address;

    .line 279
    .line 280
    if-ne p2, p3, :cond_11

    .line 281
    .line 282
    goto/16 :goto_8

    .line 283
    .line 284
    :cond_11
    const-class p3, Ljava/io/File;

    .line 285
    .line 286
    if-ne p2, p3, :cond_14

    .line 287
    .line 288
    const-string p0, ".."

    .line 289
    .line 290
    invoke-virtual {v0, p0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 291
    .line 292
    .line 293
    move-result p0

    .line 294
    if-ltz p0, :cond_13

    .line 295
    .line 296
    sget-boolean p0, Lcom/alibaba/fastjson/serializer/MiscCodec;->FILE_RELATIVE_PATH_SUPPORT:Z

    .line 297
    .line 298
    if-eqz p0, :cond_12

    .line 299
    .line 300
    goto :goto_4

    .line 301
    :cond_12
    const-string p0, "file relative path not support."

    .line 302
    .line 303
    invoke-static {p0}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 304
    .line 305
    .line 306
    return-object v7

    .line 307
    :cond_13
    :goto_4
    new-instance p0, Ljava/io/File;

    .line 308
    .line 309
    invoke-direct {p0, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 310
    .line 311
    .line 312
    return-object p0

    .line 313
    :cond_14
    const-class p3, Ljava/util/TimeZone;

    .line 314
    .line 315
    if-ne p2, p3, :cond_15

    .line 316
    .line 317
    invoke-static {v0}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    .line 318
    .line 319
    .line 320
    move-result-object p0

    .line 321
    return-object p0

    .line 322
    :cond_15
    instance-of p3, p2, Ljava/lang/reflect/ParameterizedType;

    .line 323
    .line 324
    if-eqz p3, :cond_16

    .line 325
    .line 326
    check-cast p2, Ljava/lang/reflect/ParameterizedType;

    .line 327
    .line 328
    invoke-interface {p2}, Ljava/lang/reflect/ParameterizedType;->getRawType()Ljava/lang/reflect/Type;

    .line 329
    .line 330
    .line 331
    move-result-object p2

    .line 332
    :cond_16
    const-class p3, Ljava/lang/Class;

    .line 333
    .line 334
    if-ne p2, p3, :cond_17

    .line 335
    .line 336
    invoke-virtual {p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->getConfig()Lcom/alibaba/fastjson/parser/ParserConfig;

    .line 337
    .line 338
    .line 339
    move-result-object p0

    .line 340
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/ParserConfig;->getDefaultClassLoader()Ljava/lang/ClassLoader;

    .line 341
    .line 342
    .line 343
    move-result-object p0

    .line 344
    invoke-static {v0, p0, v5}, Lcom/alibaba/fastjson/util/TypeUtils;->loadClass(Ljava/lang/String;Ljava/lang/ClassLoader;Z)Ljava/lang/Class;

    .line 345
    .line 346
    .line 347
    move-result-object p0

    .line 348
    return-object p0

    .line 349
    :cond_17
    const-class p1, Ljava/nio/charset/Charset;

    .line 350
    .line 351
    if-ne p2, p1, :cond_18

    .line 352
    .line 353
    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    .line 354
    .line 355
    .line 356
    move-result-object p0

    .line 357
    return-object p0

    .line 358
    :cond_18
    if-ne p2, v1, :cond_19

    .line 359
    .line 360
    invoke-static {v0}, Ljava/util/Currency;->getInstance(Ljava/lang/String;)Ljava/util/Currency;

    .line 361
    .line 362
    .line 363
    move-result-object p0

    .line 364
    return-object p0

    .line 365
    :cond_19
    const-class p1, Lcom/alibaba/fastjson/JSONPath;

    .line 366
    .line 367
    if-ne p2, p1, :cond_1a

    .line 368
    .line 369
    new-instance p0, Lcom/alibaba/fastjson/JSONPath;

    .line 370
    .line 371
    invoke-direct {p0, v0}, Lcom/alibaba/fastjson/JSONPath;-><init>(Ljava/lang/String;)V

    .line 372
    .line 373
    .line 374
    return-object p0

    .line 375
    :cond_1a
    instance-of p1, p2, Ljava/lang/Class;

    .line 376
    .line 377
    const-string p3, "MiscCodec not support "

    .line 378
    .line 379
    if-eqz p1, :cond_1e

    .line 380
    .line 381
    check-cast p2, Ljava/lang/Class;

    .line 382
    .line 383
    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 384
    .line 385
    .line 386
    move-result-object p1

    .line 387
    const-string p2, "java.nio.file.Path"

    .line 388
    .line 389
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 390
    .line 391
    .line 392
    move-result p2

    .line 393
    if-eqz p2, :cond_1d

    .line 394
    .line 395
    :try_start_1
    sget-object p2, Lcom/alibaba/fastjson/serializer/MiscCodec;->method_paths_get:Ljava/lang/reflect/Method;

    .line 396
    .line 397
    if-nez p2, :cond_1b

    .line 398
    .line 399
    sget-boolean p2, Lcom/alibaba/fastjson/serializer/MiscCodec;->method_paths_get_error:Z

    .line 400
    .line 401
    if-nez p2, :cond_1b

    .line 402
    .line 403
    const-string p2, "java.nio.file.Paths"

    .line 404
    .line 405
    invoke-static {p2}, Lcom/alibaba/fastjson/util/TypeUtils;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    .line 406
    .line 407
    .line 408
    move-result-object p2

    .line 409
    const-string v1, "get"

    .line 410
    .line 411
    const-class v2, Ljava/lang/String;

    .line 412
    .line 413
    const-class v3, [Ljava/lang/String;

    .line 414
    .line 415
    filled-new-array {v2, v3}, [Ljava/lang/Class;

    .line 416
    .line 417
    .line 418
    move-result-object v2

    .line 419
    invoke-virtual {p2, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 420
    .line 421
    .line 422
    move-result-object p2

    .line 423
    sput-object p2, Lcom/alibaba/fastjson/serializer/MiscCodec;->method_paths_get:Ljava/lang/reflect/Method;

    .line 424
    .line 425
    goto :goto_5

    .line 426
    :catch_1
    move-exception p1

    .line 427
    goto :goto_6

    .line 428
    :catch_2
    move-exception p1

    .line 429
    goto :goto_7

    .line 430
    :cond_1b
    :goto_5
    sget-object p2, Lcom/alibaba/fastjson/serializer/MiscCodec;->method_paths_get:Ljava/lang/reflect/Method;

    .line 431
    .line 432
    if-eqz p2, :cond_1c

    .line 433
    .line 434
    new-array v1, v5, [Ljava/lang/String;

    .line 435
    .line 436
    filled-new-array {v0, v1}, [Ljava/lang/Object;

    .line 437
    .line 438
    .line 439
    move-result-object v0

    .line 440
    invoke-virtual {p2, v7, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 441
    .line 442
    .line 443
    move-result-object p0

    .line 444
    return-object p0

    .line 445
    :cond_1c
    new-instance p2, Lcom/alibaba/fastjson/JSONException;

    .line 446
    .line 447
    invoke-direct {p2, p0}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    .line 448
    .line 449
    .line 450
    throw p2
    :try_end_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_1} :catch_1

    .line 451
    :goto_6
    invoke-static {p0, p1}, Ll/okq;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 452
    .line 453
    .line 454
    return-object v7

    .line 455
    :goto_7
    invoke-static {p0, p1}, Ll/okq;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 456
    .line 457
    .line 458
    return-object v7

    .line 459
    :catch_3
    const/4 p0, 0x1

    .line 460
    sput-boolean p0, Lcom/alibaba/fastjson/serializer/MiscCodec;->method_paths_get_error:Z

    .line 461
    .line 462
    :cond_1d
    invoke-virtual {p3, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 463
    .line 464
    .line 465
    move-result-object p0

    .line 466
    invoke-static {p0}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 467
    .line 468
    .line 469
    return-object v7

    .line 470
    :cond_1e
    new-instance p0, Lcom/alibaba/fastjson/JSONException;

    .line 471
    .line 472
    new-instance p1, Ljava/lang/StringBuilder;

    .line 473
    .line 474
    invoke-direct {p1, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 475
    .line 476
    .line 477
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 478
    .line 479
    .line 480
    move-result-object p2

    .line 481
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 482
    .line 483
    .line 484
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 485
    .line 486
    .line 487
    move-result-object p1

    .line 488
    invoke-direct {p0, p1}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    .line 489
    .line 490
    .line 491
    throw p0

    .line 492
    :cond_1f
    :goto_8
    :try_start_2
    invoke-static {v0}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    .line 493
    .line 494
    .line 495
    move-result-object p0
    :try_end_2
    .catch Ljava/net/UnknownHostException; {:try_start_2 .. :try_end_2} :catch_4

    .line 496
    return-object p0

    .line 497
    :catch_4
    move-exception p0

    .line 498
    const-string p1, "deserialize inet adress error"

    .line 499
    .line 500
    invoke-static {p1, p0}, Ll/okq;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 501
    .line 502
    .line 503
    :cond_20
    :goto_9
    return-object v7

    .line 504
    :cond_21
    instance-of p0, v0, Lcom/alibaba/fastjson/JSONObject;

    .line 505
    .line 506
    if-eqz p0, :cond_25

    .line 507
    .line 508
    check-cast v0, Lcom/alibaba/fastjson/JSONObject;

    .line 509
    .line 510
    if-ne p2, v1, :cond_23

    .line 511
    .line 512
    const-string p0, "currency"

    .line 513
    .line 514
    invoke-virtual {v0, p0}, Lcom/alibaba/fastjson/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 515
    .line 516
    .line 517
    move-result-object p0

    .line 518
    if-eqz p0, :cond_22

    .line 519
    .line 520
    invoke-static {p0}, Ljava/util/Currency;->getInstance(Ljava/lang/String;)Ljava/util/Currency;

    .line 521
    .line 522
    .line 523
    move-result-object p0

    .line 524
    return-object p0

    .line 525
    :cond_22
    const-string p0, "currencyCode"

    .line 526
    .line 527
    invoke-virtual {v0, p0}, Lcom/alibaba/fastjson/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 528
    .line 529
    .line 530
    move-result-object p0

    .line 531
    if-eqz p0, :cond_23

    .line 532
    .line 533
    invoke-static {p0}, Ljava/util/Currency;->getInstance(Ljava/lang/String;)Ljava/util/Currency;

    .line 534
    .line 535
    .line 536
    move-result-object p0

    .line 537
    return-object p0

    .line 538
    :cond_23
    const-class p0, Ljava/util/Map$Entry;

    .line 539
    .line 540
    if-ne p2, p0, :cond_24

    .line 541
    .line 542
    invoke-virtual {v0}, Lcom/alibaba/fastjson/JSONObject;->entrySet()Ljava/util/Set;

    .line 543
    .line 544
    .line 545
    move-result-object p0

    .line 546
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 547
    .line 548
    .line 549
    move-result-object p0

    .line 550
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 551
    .line 552
    .line 553
    move-result-object p0

    .line 554
    return-object p0

    .line 555
    :cond_24
    invoke-virtual {v0, p2}, Lcom/alibaba/fastjson/JSON;->toJavaObject(Ljava/lang/reflect/Type;)Ljava/lang/Object;

    .line 556
    .line 557
    .line 558
    move-result-object p0

    .line 559
    return-object p0

    .line 560
    :cond_25
    const-string p0, "expect string"

    .line 561
    .line 562
    invoke-static {p0}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 563
    .line 564
    .line 565
    return-object v7
.end method

.method public getFastMatchToken()I
    .locals 0

    const/4 p0, 0x4

    return p0
.end method

.method public write(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p3, p1, Lcom/alibaba/fastjson/serializer/JSONSerializer;->out:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    invoke-virtual {p3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    move-result-object p5

    .line 13
    const-class v0, Ljava/text/SimpleDateFormat;

    .line 14
    .line 15
    const/16 v1, 0x2c

    .line 16
    .line 17
    const/16 v2, 0x7d

    .line 18
    .line 19
    const/16 v3, 0x7b

    .line 20
    .line 21
    if-ne p5, v0, :cond_1

    .line 22
    .line 23
    move-object p0, p2

    .line 24
    check-cast p0, Ljava/text/SimpleDateFormat;

    .line 25
    .line 26
    invoke-virtual {p0}, Ljava/text/SimpleDateFormat;->toPattern()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    sget-object p5, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteClassName:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 31
    .line 32
    invoke-virtual {p3, p5}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    .line 33
    .line 34
    .line 35
    move-result p5

    .line 36
    if-eqz p5, :cond_10

    .line 37
    .line 38
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 39
    .line 40
    .line 41
    move-result-object p5

    .line 42
    if-eq p5, p4, :cond_10

    .line 43
    .line 44
    invoke-virtual {p3, v3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 45
    .line 46
    .line 47
    sget-object p4, Lcom/alibaba/fastjson/JSON;->DEFAULT_TYPE_KEY:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {p3, p4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldName(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    invoke-virtual {p1, p2}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->write(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    const-string p1, "val"

    .line 64
    .line 65
    invoke-virtual {p3, v1, p1, p0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldValue(CLjava/lang/String;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p3, v2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_1
    const-class p4, Ljava/lang/Class;

    .line 73
    .line 74
    if-ne p5, p4, :cond_2

    .line 75
    .line 76
    check-cast p2, Ljava/lang/Class;

    .line 77
    .line 78
    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    goto/16 :goto_1

    .line 83
    .line 84
    :cond_2
    const-class p4, Ljava/net/InetSocketAddress;

    .line 85
    .line 86
    if-ne p5, p4, :cond_4

    .line 87
    .line 88
    check-cast p2, Ljava/net/InetSocketAddress;

    .line 89
    .line 90
    invoke-virtual {p2}, Ljava/net/InetSocketAddress;->getAddress()Ljava/net/InetAddress;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-virtual {p3, v3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 95
    .line 96
    .line 97
    if-eqz p0, :cond_3

    .line 98
    .line 99
    const-string p4, "address"

    .line 100
    .line 101
    invoke-virtual {p3, p4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldName(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p1, p0}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->write(Ljava/lang/Object;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p3, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 108
    .line 109
    .line 110
    :cond_3
    const-string p0, "port"

    .line 111
    .line 112
    invoke-virtual {p3, p0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldName(Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p2}, Ljava/net/InetSocketAddress;->getPort()I

    .line 116
    .line 117
    .line 118
    move-result p0

    .line 119
    invoke-virtual {p3, p0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeInt(I)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {p3, v2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 123
    .line 124
    .line 125
    return-void

    .line 126
    :cond_4
    instance-of p4, p2, Ljava/io/File;

    .line 127
    .line 128
    if-eqz p4, :cond_5

    .line 129
    .line 130
    check-cast p2, Ljava/io/File;

    .line 131
    .line 132
    invoke-virtual {p2}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    goto/16 :goto_1

    .line 137
    .line 138
    :cond_5
    instance-of p4, p2, Ljava/net/InetAddress;

    .line 139
    .line 140
    if-eqz p4, :cond_6

    .line 141
    .line 142
    check-cast p2, Ljava/net/InetAddress;

    .line 143
    .line 144
    invoke-virtual {p2}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    goto/16 :goto_1

    .line 149
    .line 150
    :cond_6
    instance-of p4, p2, Ljava/util/TimeZone;

    .line 151
    .line 152
    if-eqz p4, :cond_7

    .line 153
    .line 154
    check-cast p2, Ljava/util/TimeZone;

    .line 155
    .line 156
    invoke-virtual {p2}, Ljava/util/TimeZone;->getID()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object p0

    .line 160
    goto/16 :goto_1

    .line 161
    .line 162
    :cond_7
    instance-of p4, p2, Ljava/util/Currency;

    .line 163
    .line 164
    if-eqz p4, :cond_8

    .line 165
    .line 166
    check-cast p2, Ljava/util/Currency;

    .line 167
    .line 168
    invoke-virtual {p2}, Ljava/util/Currency;->getCurrencyCode()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object p0

    .line 172
    goto/16 :goto_1

    .line 173
    .line 174
    :cond_8
    instance-of p4, p2, Lcom/alibaba/fastjson/JSONStreamAware;

    .line 175
    .line 176
    if-eqz p4, :cond_9

    .line 177
    .line 178
    check-cast p2, Lcom/alibaba/fastjson/JSONStreamAware;

    .line 179
    .line 180
    invoke-interface {p2, p3}, Lcom/alibaba/fastjson/JSONStreamAware;->writeJSONString(Ljava/lang/Appendable;)V

    .line 181
    .line 182
    .line 183
    return-void

    .line 184
    :cond_9
    instance-of p4, p2, Ljava/util/Iterator;

    .line 185
    .line 186
    if-eqz p4, :cond_a

    .line 187
    .line 188
    check-cast p2, Ljava/util/Iterator;

    .line 189
    .line 190
    invoke-virtual {p0, p1, p3, p2}, Lcom/alibaba/fastjson/serializer/MiscCodec;->writeIterator(Lcom/alibaba/fastjson/serializer/JSONSerializer;Lcom/alibaba/fastjson/serializer/SerializeWriter;Ljava/util/Iterator;)V

    .line 191
    .line 192
    .line 193
    return-void

    .line 194
    :cond_a
    instance-of p4, p2, Ljava/lang/Iterable;

    .line 195
    .line 196
    if-eqz p4, :cond_b

    .line 197
    .line 198
    check-cast p2, Ljava/lang/Iterable;

    .line 199
    .line 200
    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 201
    .line 202
    .line 203
    move-result-object p2

    .line 204
    invoke-virtual {p0, p1, p3, p2}, Lcom/alibaba/fastjson/serializer/MiscCodec;->writeIterator(Lcom/alibaba/fastjson/serializer/JSONSerializer;Lcom/alibaba/fastjson/serializer/SerializeWriter;Ljava/util/Iterator;)V

    .line 205
    .line 206
    .line 207
    return-void

    .line 208
    :cond_b
    instance-of p0, p2, Ljava/util/Map$Entry;

    .line 209
    .line 210
    if-eqz p0, :cond_e

    .line 211
    .line 212
    check-cast p2, Ljava/util/Map$Entry;

    .line 213
    .line 214
    invoke-interface {p2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 215
    .line 216
    .line 217
    move-result-object p0

    .line 218
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 219
    .line 220
    .line 221
    move-result-object p2

    .line 222
    instance-of p4, p0, Ljava/lang/String;

    .line 223
    .line 224
    if-eqz p4, :cond_d

    .line 225
    .line 226
    check-cast p0, Ljava/lang/String;

    .line 227
    .line 228
    instance-of p4, p2, Ljava/lang/String;

    .line 229
    .line 230
    if-eqz p4, :cond_c

    .line 231
    .line 232
    check-cast p2, Ljava/lang/String;

    .line 233
    .line 234
    invoke-virtual {p3, v3, p0, p2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldValueStringWithDoubleQuoteCheck(CLjava/lang/String;Ljava/lang/String;)V

    .line 235
    .line 236
    .line 237
    goto :goto_0

    .line 238
    :cond_c
    invoke-virtual {p3, v3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 239
    .line 240
    .line 241
    invoke-virtual {p3, p0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldName(Ljava/lang/String;)V

    .line 242
    .line 243
    .line 244
    invoke-virtual {p1, p2}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->write(Ljava/lang/Object;)V

    .line 245
    .line 246
    .line 247
    goto :goto_0

    .line 248
    :cond_d
    invoke-virtual {p3, v3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 249
    .line 250
    .line 251
    invoke-virtual {p1, p0}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->write(Ljava/lang/Object;)V

    .line 252
    .line 253
    .line 254
    const/16 p0, 0x3a

    .line 255
    .line 256
    invoke-virtual {p3, p0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 257
    .line 258
    .line 259
    invoke-virtual {p1, p2}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->write(Ljava/lang/Object;)V

    .line 260
    .line 261
    .line 262
    :goto_0
    invoke-virtual {p3, v2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 263
    .line 264
    .line 265
    return-void

    .line 266
    :cond_e
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 267
    .line 268
    .line 269
    move-result-object p0

    .line 270
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 271
    .line 272
    .line 273
    move-result-object p0

    .line 274
    const-string p1, "net.sf.json.JSONNull"

    .line 275
    .line 276
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 277
    .line 278
    .line 279
    move-result p0

    .line 280
    if-eqz p0, :cond_f

    .line 281
    .line 282
    invoke-virtual {p3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull()V

    .line 283
    .line 284
    .line 285
    return-void

    .line 286
    :cond_f
    instance-of p0, p2, Lorg/w3c/dom/Node;

    .line 287
    .line 288
    if-eqz p0, :cond_11

    .line 289
    .line 290
    check-cast p2, Lorg/w3c/dom/Node;

    .line 291
    .line 292
    invoke-static {p2}, Lcom/alibaba/fastjson/serializer/MiscCodec;->toString(Lorg/w3c/dom/Node;)Ljava/lang/String;

    .line 293
    .line 294
    .line 295
    move-result-object p0

    .line 296
    :cond_10
    :goto_1
    invoke-virtual {p3, p0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeString(Ljava/lang/String;)V

    .line 297
    .line 298
    .line 299
    return-void

    .line 300
    :cond_11
    const-string p0, "not support class : "

    .line 301
    .line 302
    invoke-static {p0, p5}, Ll/rkq;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 303
    .line 304
    .line 305
    return-void
.end method

.method public writeIterator(Lcom/alibaba/fastjson/serializer/JSONSerializer;Lcom/alibaba/fastjson/serializer/SerializeWriter;Ljava/util/Iterator;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/alibaba/fastjson/serializer/JSONSerializer;",
            "Lcom/alibaba/fastjson/serializer/SerializeWriter;",
            "Ljava/util/Iterator<",
            "*>;)V"
        }
    .end annotation

    .line 1
    const/16 p0, 0x5b

    .line 2
    .line 3
    invoke-virtual {p2, p0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    :goto_0
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/16 v0, 0x2c

    .line 16
    .line 17
    invoke-virtual {p2, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 18
    .line 19
    .line 20
    :cond_0
    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p1, v0}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->write(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    add-int/lit8 p0, p0, 0x1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    const/16 p0, 0x5d

    .line 31
    .line 32
    invoke-virtual {p2, p0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 33
    .line 34
    .line 35
    return-void
.end method
