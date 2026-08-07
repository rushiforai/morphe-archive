.class public Lcom/alibaba/fastjson/parser/deserializer/NumberDeserializer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;


# static fields
.field public static final instance:Lcom/alibaba/fastjson/parser/deserializer/NumberDeserializer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/alibaba/fastjson/parser/deserializer/NumberDeserializer;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/alibaba/fastjson/parser/deserializer/NumberDeserializer;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/alibaba/fastjson/parser/deserializer/NumberDeserializer;->instance:Lcom/alibaba/fastjson/parser/deserializer/NumberDeserializer;

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
    .locals 9
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
    move-result v0

    .line 7
    const/4 v1, 0x2

    .line 8
    const-class v2, Ljava/lang/Byte;

    .line 9
    .line 10
    sget-object v3, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    .line 11
    .line 12
    const-class v4, Ljava/lang/Short;

    .line 13
    .line 14
    sget-object v5, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    .line 15
    .line 16
    sget-object v6, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    .line 17
    .line 18
    const-class v7, Ljava/lang/Double;

    .line 19
    .line 20
    const/16 v8, 0x10

    .line 21
    .line 22
    if-ne v0, v1, :cond_9

    .line 23
    .line 24
    if-eq p2, v6, :cond_8

    .line 25
    .line 26
    if-ne p2, v7, :cond_0

    .line 27
    .line 28
    goto/16 :goto_2

    .line 29
    .line 30
    :cond_0
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->longValue()J

    .line 31
    .line 32
    .line 33
    move-result-wide v0

    .line 34
    invoke-interface {p0, v8}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 35
    .line 36
    .line 37
    const-string p0, "short overflow : "

    .line 38
    .line 39
    if-eq p2, v5, :cond_6

    .line 40
    .line 41
    if-ne p2, v4, :cond_1

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_1
    if-eq p2, v3, :cond_4

    .line 45
    .line 46
    if-ne p2, v2, :cond_2

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_2
    const-wide/32 p0, -0x80000000

    .line 50
    .line 51
    .line 52
    cmp-long p0, v0, p0

    .line 53
    .line 54
    if-ltz p0, :cond_3

    .line 55
    .line 56
    const-wide/32 p0, 0x7fffffff

    .line 57
    .line 58
    .line 59
    cmp-long p0, v0, p0

    .line 60
    .line 61
    if-gtz p0, :cond_3

    .line 62
    .line 63
    long-to-int p0, v0

    .line 64
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    return-object p0

    .line 69
    :cond_3
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    return-object p0

    .line 74
    :cond_4
    :goto_0
    const-wide/16 p1, 0x7f

    .line 75
    .line 76
    cmp-long p1, v0, p1

    .line 77
    .line 78
    if-gtz p1, :cond_5

    .line 79
    .line 80
    const-wide/16 p1, -0x80

    .line 81
    .line 82
    cmp-long p1, v0, p1

    .line 83
    .line 84
    if-ltz p1, :cond_5

    .line 85
    .line 86
    long-to-int p0, v0

    .line 87
    int-to-byte p0, p0

    .line 88
    invoke-static {p0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    return-object p0

    .line 93
    :cond_5
    new-instance p1, Lcom/alibaba/fastjson/JSONException;

    .line 94
    .line 95
    new-instance p2, Ljava/lang/StringBuilder;

    .line 96
    .line 97
    invoke-direct {p2, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {p2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    invoke-direct {p1, p0}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    throw p1

    .line 111
    :cond_6
    :goto_1
    const-wide/16 p1, 0x7fff

    .line 112
    .line 113
    cmp-long p1, v0, p1

    .line 114
    .line 115
    if-gtz p1, :cond_7

    .line 116
    .line 117
    const-wide/16 p1, -0x8000

    .line 118
    .line 119
    cmp-long p1, v0, p1

    .line 120
    .line 121
    if-ltz p1, :cond_7

    .line 122
    .line 123
    long-to-int p0, v0

    .line 124
    int-to-short p0, p0

    .line 125
    invoke-static {p0}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    return-object p0

    .line 130
    :cond_7
    new-instance p1, Lcom/alibaba/fastjson/JSONException;

    .line 131
    .line 132
    new-instance p2, Ljava/lang/StringBuilder;

    .line 133
    .line 134
    invoke-direct {p2, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {p2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    invoke-direct {p1, p0}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    throw p1

    .line 148
    :cond_8
    :goto_2
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->numberString()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    invoke-interface {p0, v8}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 153
    .line 154
    .line 155
    invoke-static {p1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    .line 156
    .line 157
    .line 158
    move-result-wide p0

    .line 159
    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    return-object p0

    .line 164
    :cond_9
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 165
    .line 166
    .line 167
    move-result v0

    .line 168
    const/4 v1, 0x3

    .line 169
    if-ne v0, v1, :cond_10

    .line 170
    .line 171
    if-eq p2, v6, :cond_f

    .line 172
    .line 173
    if-ne p2, v7, :cond_a

    .line 174
    .line 175
    goto :goto_5

    .line 176
    :cond_a
    if-eq p2, v5, :cond_e

    .line 177
    .line 178
    if-ne p2, v4, :cond_b

    .line 179
    .line 180
    goto :goto_4

    .line 181
    :cond_b
    if-eq p2, v3, :cond_d

    .line 182
    .line 183
    if-ne p2, v2, :cond_c

    .line 184
    .line 185
    goto :goto_3

    .line 186
    :cond_c
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->decimalValue()Ljava/math/BigDecimal;

    .line 187
    .line 188
    .line 189
    move-result-object p1

    .line 190
    invoke-interface {p0, v8}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 191
    .line 192
    .line 193
    return-object p1

    .line 194
    :cond_d
    :goto_3
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->decimalValue()Ljava/math/BigDecimal;

    .line 195
    .line 196
    .line 197
    move-result-object p1

    .line 198
    invoke-interface {p0, v8}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 199
    .line 200
    .line 201
    invoke-static {p1}, Lcom/alibaba/fastjson/util/TypeUtils;->byteValue(Ljava/math/BigDecimal;)B

    .line 202
    .line 203
    .line 204
    move-result p0

    .line 205
    invoke-static {p0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 206
    .line 207
    .line 208
    move-result-object p0

    .line 209
    return-object p0

    .line 210
    :cond_e
    :goto_4
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->decimalValue()Ljava/math/BigDecimal;

    .line 211
    .line 212
    .line 213
    move-result-object p1

    .line 214
    invoke-interface {p0, v8}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 215
    .line 216
    .line 217
    invoke-static {p1}, Lcom/alibaba/fastjson/util/TypeUtils;->shortValue(Ljava/math/BigDecimal;)S

    .line 218
    .line 219
    .line 220
    move-result p0

    .line 221
    invoke-static {p0}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    .line 222
    .line 223
    .line 224
    move-result-object p0

    .line 225
    return-object p0

    .line 226
    :cond_f
    :goto_5
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->numberString()Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    move-result-object p1

    .line 230
    invoke-interface {p0, v8}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 231
    .line 232
    .line 233
    invoke-static {p1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    .line 234
    .line 235
    .line 236
    move-result-wide p0

    .line 237
    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 238
    .line 239
    .line 240
    move-result-object p0

    .line 241
    return-object p0

    .line 242
    :cond_10
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    .line 243
    .line 244
    .line 245
    move-result v0

    .line 246
    const/16 v1, 0x12

    .line 247
    .line 248
    const/4 v8, 0x0

    .line 249
    if-ne v0, v1, :cond_13

    .line 250
    .line 251
    const-string v0, "NaN"

    .line 252
    .line 253
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->stringVal()Ljava/lang/String;

    .line 254
    .line 255
    .line 256
    move-result-object v1

    .line 257
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 258
    .line 259
    .line 260
    move-result v0

    .line 261
    if-eqz v0, :cond_13

    .line 262
    .line 263
    invoke-interface {p0}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 264
    .line 265
    .line 266
    if-ne p2, v7, :cond_11

    .line 267
    .line 268
    const-wide/high16 p0, 0x7ff8000000000000L    # Double.NaN

    .line 269
    .line 270
    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 271
    .line 272
    .line 273
    move-result-object p0

    .line 274
    return-object p0

    .line 275
    :cond_11
    const-class p0, Ljava/lang/Float;

    .line 276
    .line 277
    if-ne p2, p0, :cond_12

    .line 278
    .line 279
    const/high16 p0, 0x7fc00000    # Float.NaN

    .line 280
    .line 281
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 282
    .line 283
    .line 284
    move-result-object p0

    .line 285
    return-object p0

    .line 286
    :cond_12
    return-object v8

    .line 287
    :cond_13
    invoke-virtual {p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parse()Ljava/lang/Object;

    .line 288
    .line 289
    .line 290
    move-result-object p0

    .line 291
    if-nez p0, :cond_14

    .line 292
    .line 293
    return-object v8

    .line 294
    :cond_14
    if-eq p2, v6, :cond_1a

    .line 295
    .line 296
    if-ne p2, v7, :cond_15

    .line 297
    .line 298
    goto :goto_8

    .line 299
    :cond_15
    if-eq p2, v5, :cond_19

    .line 300
    .line 301
    if-ne p2, v4, :cond_16

    .line 302
    .line 303
    goto :goto_7

    .line 304
    :cond_16
    if-eq p2, v3, :cond_18

    .line 305
    .line 306
    if-ne p2, v2, :cond_17

    .line 307
    .line 308
    goto :goto_6

    .line 309
    :cond_17
    invoke-static {p0}, Lcom/alibaba/fastjson/util/TypeUtils;->castToBigDecimal(Ljava/lang/Object;)Ljava/math/BigDecimal;

    .line 310
    .line 311
    .line 312
    move-result-object p0

    .line 313
    return-object p0

    .line 314
    :cond_18
    :goto_6
    :try_start_0
    invoke-static {p0}, Lcom/alibaba/fastjson/util/TypeUtils;->castToByte(Ljava/lang/Object;)Ljava/lang/Byte;

    .line 315
    .line 316
    .line 317
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 318
    return-object p0

    .line 319
    :catch_0
    move-exception p0

    .line 320
    const-string p1, "parseByte error, field : "

    .line 321
    .line 322
    invoke-static {p1, p3, p0}, Ll/i1w;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 323
    .line 324
    .line 325
    return-object v8

    .line 326
    :cond_19
    :goto_7
    :try_start_1
    invoke-static {p0}, Lcom/alibaba/fastjson/util/TypeUtils;->castToShort(Ljava/lang/Object;)Ljava/lang/Short;

    .line 327
    .line 328
    .line 329
    move-result-object p0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 330
    return-object p0

    .line 331
    :catch_1
    move-exception p0

    .line 332
    const-string p1, "parseShort error, field : "

    .line 333
    .line 334
    invoke-static {p1, p3, p0}, Ll/i1w;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 335
    .line 336
    .line 337
    return-object v8

    .line 338
    :cond_1a
    :goto_8
    :try_start_2
    invoke-static {p0}, Lcom/alibaba/fastjson/util/TypeUtils;->castToDouble(Ljava/lang/Object;)Ljava/lang/Double;

    .line 339
    .line 340
    .line 341
    move-result-object p0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 342
    return-object p0

    .line 343
    :catch_2
    move-exception p0

    .line 344
    const-string p1, "parseDouble error, field : "

    .line 345
    .line 346
    invoke-static {p1, p3, p0}, Ll/i1w;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 347
    .line 348
    .line 349
    return-object v8
.end method

.method public getFastMatchToken()I
    .locals 0

    const/4 p0, 0x2

    return p0
.end method
