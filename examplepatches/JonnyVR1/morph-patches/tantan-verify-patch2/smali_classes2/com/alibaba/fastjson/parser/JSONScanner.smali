.class public final Lcom/alibaba/fastjson/parser/JSONScanner;
.super Lcom/alibaba/fastjson/parser/JSONLexerBase;
.source "SourceFile"


# instance fields
.field private final len:I

.field private final text:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 29
    sget v0, Lcom/alibaba/fastjson/JSON;->DEFAULT_PARSER_FEATURE:I

    invoke-direct {p0, p1, v0}, Lcom/alibaba/fastjson/parser/JSONScanner;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;-><init>(I)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 5
    .line 6
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->len:I

    .line 11
    .line 12
    const/4 p1, -0x1

    .line 13
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONScanner;->next()C

    .line 16
    .line 17
    .line 18
    iget-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 19
    .line 20
    const p2, 0xfeff

    .line 21
    .line 22
    .line 23
    if-ne p1, p2, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONScanner;->next()C

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public constructor <init>([CI)V
    .locals 1

    .line 30
    sget v0, Lcom/alibaba/fastjson/JSON;->DEFAULT_PARSER_FEATURE:I

    invoke-direct {p0, p1, p2, v0}, Lcom/alibaba/fastjson/parser/JSONScanner;-><init>([CII)V

    return-void
.end method

.method public constructor <init>([CII)V
    .locals 2

    .line 31
    new-instance v0, Ljava/lang/String;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1, p2}, Ljava/lang/String;-><init>([CII)V

    invoke-direct {p0, v0, p3}, Lcom/alibaba/fastjson/parser/JSONScanner;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static charArrayCompare(Ljava/lang/String;I[C)Z
    .locals 5

    .line 1
    array-length v0, p2

    .line 2
    add-int v1, v0, p1

    .line 3
    .line 4
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 5
    .line 6
    .line 7
    move-result v2

    .line 8
    const/4 v3, 0x0

    .line 9
    if-le v1, v2, :cond_0

    .line 10
    .line 11
    return v3

    .line 12
    :cond_0
    move v1, v3

    .line 13
    :goto_0
    if-ge v1, v0, :cond_2

    .line 14
    .line 15
    aget-char v2, p2, v1

    .line 16
    .line 17
    add-int v4, p1, v1

    .line 18
    .line 19
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    .line 20
    .line 21
    .line 22
    move-result v4

    .line 23
    if-eq v2, v4, :cond_1

    .line 24
    .line 25
    return v3

    .line 26
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_2
    const/4 p0, 0x1

    .line 30
    return p0
.end method

.method public static checkDate(CCCCCCII)Z
    .locals 3

    const/4 v0, 0x0

    const/16 v1, 0x30

    if-lt p0, v1, :cond_d

    const/16 v2, 0x39

    if-le p0, v2, :cond_0

    goto :goto_1

    :cond_0
    if-lt p1, v1, :cond_d

    if-le p1, v2, :cond_1

    goto :goto_1

    :cond_1
    if-lt p2, v1, :cond_d

    if-le p2, v2, :cond_2

    goto :goto_1

    :cond_2
    if-lt p3, v1, :cond_d

    if-le p3, v2, :cond_3

    goto :goto_1

    :cond_3
    const/16 p0, 0x32

    const/16 p1, 0x31

    if-ne p4, v1, :cond_5

    if-lt p5, p1, :cond_4

    if-le p5, v2, :cond_6

    :cond_4
    return v0

    :cond_5
    if-ne p4, p1, :cond_d

    if-eq p5, v1, :cond_6

    if-eq p5, p1, :cond_6

    if-eq p5, p0, :cond_6

    return v0

    :cond_6
    if-ne p6, v1, :cond_8

    if-lt p7, p1, :cond_7

    if-le p7, v2, :cond_c

    :cond_7
    return v0

    :cond_8
    if-eq p6, p1, :cond_b

    if-ne p6, p0, :cond_9

    goto :goto_0

    :cond_9
    const/16 p0, 0x33

    if-ne p6, p0, :cond_a

    if-eq p7, v1, :cond_c

    if-eq p7, p1, :cond_c

    :cond_a
    return v0

    :cond_b
    :goto_0
    if-lt p7, v1, :cond_d

    if-le p7, v2, :cond_c

    goto :goto_1

    :cond_c
    const/4 p0, 0x1

    return p0

    :cond_d
    :goto_1
    return v0
.end method

.method private checkTime(CCCCCC)Z
    .locals 3

    const/16 p0, 0x39

    const/4 v0, 0x0

    const/16 v1, 0x30

    if-ne p1, v1, :cond_1

    if-lt p2, v1, :cond_0

    if-le p2, p0, :cond_4

    :cond_0
    return v0

    :cond_1
    const/16 v2, 0x31

    if-ne p1, v2, :cond_3

    if-lt p2, v1, :cond_2

    if-le p2, p0, :cond_4

    :cond_2
    return v0

    :cond_3
    const/16 v2, 0x32

    if-ne p1, v2, :cond_b

    if-lt p2, v1, :cond_b

    const/16 p1, 0x34

    if-le p2, p1, :cond_4

    goto :goto_0

    :cond_4
    const/16 p1, 0x36

    const/16 p2, 0x35

    if-lt p3, v1, :cond_6

    if-gt p3, p2, :cond_6

    if-lt p4, v1, :cond_5

    if-le p4, p0, :cond_7

    :cond_5
    return v0

    :cond_6
    if-ne p3, p1, :cond_b

    if-eq p4, v1, :cond_7

    return v0

    :cond_7
    if-lt p5, v1, :cond_9

    if-gt p5, p2, :cond_9

    if-lt p6, v1, :cond_8

    if-le p6, p0, :cond_a

    :cond_8
    return v0

    :cond_9
    if-ne p5, p1, :cond_b

    if-eq p6, v1, :cond_a

    return v0

    :cond_a
    const/4 p0, 0x1

    return p0

    :cond_b
    :goto_0
    return v0
.end method

.method private scanISO8601DateIfMatch(ZI)Z
    .locals 43

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v9, p2

    .line 4
    .line 5
    const/4 v10, 0x0

    .line 6
    const/16 v11, 0x8

    .line 7
    .line 8
    if-ge v9, v11, :cond_0

    .line 9
    .line 10
    return v10

    .line 11
    :cond_0
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 18
    .line 19
    const/16 v20, 0x1

    .line 20
    .line 21
    add-int/lit8 v2, v2, 0x1

    .line 22
    .line 23
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 24
    .line 25
    .line 26
    move-result v13

    .line 27
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 28
    .line 29
    const/4 v12, 0x2

    .line 30
    add-int/2addr v2, v12

    .line 31
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 32
    .line 33
    .line 34
    move-result v14

    .line 35
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 36
    .line 37
    const/4 v15, 0x3

    .line 38
    add-int/2addr v2, v15

    .line 39
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 40
    .line 41
    .line 42
    move-result v4

    .line 43
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 44
    .line 45
    add-int/lit8 v2, v2, 0x4

    .line 46
    .line 47
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 52
    .line 53
    const/4 v5, 0x5

    .line 54
    add-int/2addr v3, v5

    .line 55
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    iget v6, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 60
    .line 61
    const/16 v16, 0x6

    .line 62
    .line 63
    add-int/lit8 v6, v6, 0x6

    .line 64
    .line 65
    invoke-virtual {v0, v6}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 66
    .line 67
    .line 68
    move-result v6

    .line 69
    iget v7, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 70
    .line 71
    add-int/lit8 v7, v7, 0x7

    .line 72
    .line 73
    invoke-virtual {v0, v7}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 74
    .line 75
    .line 76
    move-result v7

    .line 77
    const/16 v8, 0x2b

    .line 78
    .line 79
    move/from16 v17, v15

    .line 80
    .line 81
    move/from16 v18, v12

    .line 82
    .line 83
    const/16 v12, 0x2f

    .line 84
    .line 85
    move/from16 v21, v10

    .line 86
    .line 87
    const/16 v10, 0xd

    .line 88
    .line 89
    const/16 v5, 0x30

    .line 90
    .line 91
    if-nez p1, :cond_5

    .line 92
    .line 93
    if-le v9, v10, :cond_5

    .line 94
    .line 95
    iget v10, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 96
    .line 97
    add-int/2addr v10, v9

    .line 98
    add-int/lit8 v10, v10, -0x1

    .line 99
    .line 100
    invoke-virtual {v0, v10}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 101
    .line 102
    .line 103
    move-result v10

    .line 104
    iget v15, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 105
    .line 106
    add-int/2addr v15, v9

    .line 107
    add-int/lit8 v15, v15, -0x2

    .line 108
    .line 109
    invoke-virtual {v0, v15}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 110
    .line 111
    .line 112
    move-result v15

    .line 113
    if-ne v1, v12, :cond_5

    .line 114
    .line 115
    const/16 v11, 0x44

    .line 116
    .line 117
    if-ne v13, v11, :cond_5

    .line 118
    .line 119
    const/16 v11, 0x61

    .line 120
    .line 121
    if-ne v14, v11, :cond_5

    .line 122
    .line 123
    const/16 v11, 0x74

    .line 124
    .line 125
    if-ne v4, v11, :cond_5

    .line 126
    .line 127
    const/16 v11, 0x65

    .line 128
    .line 129
    if-ne v2, v11, :cond_5

    .line 130
    .line 131
    const/16 v11, 0x28

    .line 132
    .line 133
    if-ne v3, v11, :cond_5

    .line 134
    .line 135
    if-ne v10, v12, :cond_5

    .line 136
    .line 137
    const/16 v10, 0x29

    .line 138
    .line 139
    if-ne v15, v10, :cond_5

    .line 140
    .line 141
    move/from16 v1, v16

    .line 142
    .line 143
    const/4 v2, -0x1

    .line 144
    :goto_0
    if-ge v1, v9, :cond_2

    .line 145
    .line 146
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 147
    .line 148
    add-int/2addr v3, v1

    .line 149
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 150
    .line 151
    .line 152
    move-result v3

    .line 153
    if-ne v3, v8, :cond_1

    .line 154
    .line 155
    move v2, v1

    .line 156
    goto :goto_1

    .line 157
    :cond_1
    if-lt v3, v5, :cond_2

    .line 158
    .line 159
    const/16 v4, 0x39

    .line 160
    .line 161
    if-le v3, v4, :cond_3

    .line 162
    .line 163
    :cond_2
    const/4 v10, -0x1

    .line 164
    goto :goto_2

    .line 165
    :cond_3
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 166
    .line 167
    goto :goto_0

    .line 168
    :goto_2
    if-ne v2, v10, :cond_4

    .line 169
    .line 170
    return v21

    .line 171
    :cond_4
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 172
    .line 173
    add-int/lit8 v3, v1, 0x6

    .line 174
    .line 175
    add-int/2addr v1, v2

    .line 176
    sub-int/2addr v1, v3

    .line 177
    invoke-virtual {v0, v3, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->subString(II)Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object v1

    .line 181
    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 182
    .line 183
    .line 184
    move-result-wide v1

    .line 185
    iget-object v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->timeZone:Ljava/util/TimeZone;

    .line 186
    .line 187
    iget-object v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->locale:Ljava/util/Locale;

    .line 188
    .line 189
    invoke-static {v3, v4}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;Ljava/util/Locale;)Ljava/util/Calendar;

    .line 190
    .line 191
    .line 192
    move-result-object v3

    .line 193
    iput-object v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->calendar:Ljava/util/Calendar;

    .line 194
    .line 195
    invoke-virtual {v3, v1, v2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 196
    .line 197
    .line 198
    const/4 v11, 0x5

    .line 199
    iput v11, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 200
    .line 201
    return v20

    .line 202
    :cond_5
    const/4 v10, -0x1

    .line 203
    const/4 v11, 0x5

    .line 204
    const/16 v15, 0x10

    .line 205
    .line 206
    const/16 v12, 0x54

    .line 207
    .line 208
    const/16 v10, 0xe

    .line 209
    .line 210
    const/16 v11, 0x2d

    .line 211
    .line 212
    const/16 v30, 0xa

    .line 213
    .line 214
    const/16 v5, 0x8

    .line 215
    .line 216
    if-eq v9, v5, :cond_7

    .line 217
    .line 218
    if-eq v9, v10, :cond_7

    .line 219
    .line 220
    if-ne v9, v15, :cond_6

    .line 221
    .line 222
    iget v5, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 223
    .line 224
    add-int/lit8 v5, v5, 0xa

    .line 225
    .line 226
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 227
    .line 228
    .line 229
    move-result v5

    .line 230
    if-eq v5, v12, :cond_7

    .line 231
    .line 232
    const/16 v8, 0x20

    .line 233
    .line 234
    if-eq v5, v8, :cond_7

    .line 235
    .line 236
    :cond_6
    const/16 v5, 0x11

    .line 237
    .line 238
    goto :goto_4

    .line 239
    :cond_7
    :goto_3
    const/16 v5, 0x5a

    .line 240
    .line 241
    const/4 v10, 0x5

    .line 242
    const/16 v15, 0x30

    .line 243
    .line 244
    const/16 v27, 0x3a

    .line 245
    .line 246
    const/16 v28, 0xb

    .line 247
    .line 248
    goto/16 :goto_1e

    .line 249
    .line 250
    :goto_4
    if-ne v9, v5, :cond_8

    .line 251
    .line 252
    iget v5, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 253
    .line 254
    add-int/lit8 v5, v5, 0x6

    .line 255
    .line 256
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 257
    .line 258
    .line 259
    move-result v5

    .line 260
    if-eq v5, v11, :cond_8

    .line 261
    .line 262
    goto :goto_3

    .line 263
    :cond_8
    const/16 v5, 0x9

    .line 264
    .line 265
    if-ge v9, v5, :cond_9

    .line 266
    .line 267
    return v21

    .line 268
    :cond_9
    iget v8, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 269
    .line 270
    const/16 v22, 0x8

    .line 271
    .line 272
    add-int/lit8 v8, v8, 0x8

    .line 273
    .line 274
    invoke-virtual {v0, v8}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 275
    .line 276
    .line 277
    move-result v8

    .line 278
    move/from16 v29, v5

    .line 279
    .line 280
    iget v5, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 281
    .line 282
    add-int/lit8 v5, v5, 0x9

    .line 283
    .line 284
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 285
    .line 286
    .line 287
    move-result v5

    .line 288
    const/16 v10, 0x2e

    .line 289
    .line 290
    if-ne v2, v11, :cond_a

    .line 291
    .line 292
    if-eq v7, v11, :cond_b

    .line 293
    .line 294
    :cond_a
    const/16 v15, 0x2f

    .line 295
    .line 296
    if-ne v2, v15, :cond_c

    .line 297
    .line 298
    if-ne v7, v15, :cond_c

    .line 299
    .line 300
    :cond_b
    move/from16 v34, v1

    .line 301
    .line 302
    move/from16 v38, v3

    .line 303
    .line 304
    move/from16 v37, v4

    .line 305
    .line 306
    move/from16 v41, v5

    .line 307
    .line 308
    move/from16 v39, v6

    .line 309
    .line 310
    move/from16 v40, v8

    .line 311
    .line 312
    move/from16 v35, v13

    .line 313
    .line 314
    move/from16 v36, v14

    .line 315
    .line 316
    :goto_5
    move/from16 v13, v30

    .line 317
    .line 318
    goto/16 :goto_10

    .line 319
    .line 320
    :cond_c
    if-ne v2, v11, :cond_e

    .line 321
    .line 322
    if-ne v6, v11, :cond_e

    .line 323
    .line 324
    const/16 v15, 0x20

    .line 325
    .line 326
    if-ne v8, v15, :cond_d

    .line 327
    .line 328
    move/from16 v34, v1

    .line 329
    .line 330
    move/from16 v39, v3

    .line 331
    .line 332
    move/from16 v37, v4

    .line 333
    .line 334
    move/from16 v41, v7

    .line 335
    .line 336
    move/from16 v35, v13

    .line 337
    .line 338
    move/from16 v36, v14

    .line 339
    .line 340
    const/16 v13, 0x8

    .line 341
    .line 342
    :goto_6
    const/16 v38, 0x30

    .line 343
    .line 344
    :goto_7
    const/16 v40, 0x30

    .line 345
    .line 346
    goto/16 :goto_10

    .line 347
    .line 348
    :cond_d
    move/from16 v34, v1

    .line 349
    .line 350
    move/from16 v39, v3

    .line 351
    .line 352
    move/from16 v37, v4

    .line 353
    .line 354
    move/from16 v40, v7

    .line 355
    .line 356
    move/from16 v41, v8

    .line 357
    .line 358
    move/from16 v35, v13

    .line 359
    .line 360
    move/from16 v36, v14

    .line 361
    .line 362
    const/16 v13, 0x9

    .line 363
    .line 364
    :goto_8
    const/16 v38, 0x30

    .line 365
    .line 366
    goto/16 :goto_10

    .line 367
    .line 368
    :cond_e
    if-ne v14, v10, :cond_f

    .line 369
    .line 370
    if-eq v3, v10, :cond_10

    .line 371
    .line 372
    :cond_f
    if-ne v14, v11, :cond_11

    .line 373
    .line 374
    if-ne v3, v11, :cond_11

    .line 375
    .line 376
    :cond_10
    move/from16 v40, v1

    .line 377
    .line 378
    move/from16 v39, v2

    .line 379
    .line 380
    move/from16 v38, v4

    .line 381
    .line 382
    move/from16 v37, v5

    .line 383
    .line 384
    move/from16 v34, v6

    .line 385
    .line 386
    move/from16 v35, v7

    .line 387
    .line 388
    move/from16 v36, v8

    .line 389
    .line 390
    move/from16 v41, v13

    .line 391
    .line 392
    goto :goto_5

    .line 393
    :cond_11
    if-ne v8, v12, :cond_12

    .line 394
    .line 395
    move/from16 v34, v1

    .line 396
    .line 397
    move/from16 v38, v2

    .line 398
    .line 399
    move/from16 v39, v3

    .line 400
    .line 401
    move/from16 v37, v4

    .line 402
    .line 403
    move/from16 v40, v6

    .line 404
    .line 405
    move/from16 v41, v7

    .line 406
    .line 407
    move/from16 v35, v13

    .line 408
    .line 409
    move/from16 v36, v14

    .line 410
    .line 411
    const/16 v13, 0x8

    .line 412
    .line 413
    goto/16 :goto_10

    .line 414
    .line 415
    :cond_12
    const/16 v15, 0x5e74

    .line 416
    .line 417
    if-eq v2, v15, :cond_14

    .line 418
    .line 419
    const v15, 0xb144

    .line 420
    .line 421
    .line 422
    if-ne v2, v15, :cond_13

    .line 423
    .line 424
    goto :goto_9

    .line 425
    :cond_13
    return v21

    .line 426
    :cond_14
    :goto_9
    const/16 v2, 0x6708

    .line 427
    .line 428
    if-eq v7, v2, :cond_15

    .line 429
    .line 430
    const v15, 0xc6d4

    .line 431
    .line 432
    .line 433
    if-ne v7, v15, :cond_16

    .line 434
    .line 435
    :cond_15
    const/16 v2, 0x65e5

    .line 436
    .line 437
    const v15, 0xc77c

    .line 438
    .line 439
    .line 440
    goto :goto_d

    .line 441
    :cond_16
    if-eq v6, v2, :cond_17

    .line 442
    .line 443
    if-ne v6, v15, :cond_18

    .line 444
    .line 445
    :cond_17
    const/16 v2, 0x65e5

    .line 446
    .line 447
    goto :goto_a

    .line 448
    :cond_18
    return v21

    .line 449
    :goto_a
    const v15, 0xc77c

    .line 450
    .line 451
    .line 452
    if-eq v8, v2, :cond_1c

    .line 453
    .line 454
    if-ne v8, v15, :cond_19

    .line 455
    .line 456
    goto :goto_c

    .line 457
    :cond_19
    if-eq v5, v2, :cond_1b

    .line 458
    .line 459
    if-ne v5, v15, :cond_1a

    .line 460
    .line 461
    goto :goto_b

    .line 462
    :cond_1a
    return v21

    .line 463
    :cond_1b
    :goto_b
    move/from16 v34, v1

    .line 464
    .line 465
    move/from16 v39, v3

    .line 466
    .line 467
    move/from16 v37, v4

    .line 468
    .line 469
    move/from16 v40, v7

    .line 470
    .line 471
    move/from16 v41, v8

    .line 472
    .line 473
    move/from16 v35, v13

    .line 474
    .line 475
    move/from16 v36, v14

    .line 476
    .line 477
    move/from16 v13, v30

    .line 478
    .line 479
    goto :goto_8

    .line 480
    :cond_1c
    :goto_c
    move/from16 v34, v1

    .line 481
    .line 482
    move/from16 v39, v3

    .line 483
    .line 484
    move/from16 v37, v4

    .line 485
    .line 486
    move/from16 v41, v7

    .line 487
    .line 488
    move/from16 v35, v13

    .line 489
    .line 490
    move/from16 v36, v14

    .line 491
    .line 492
    move/from16 v13, v30

    .line 493
    .line 494
    goto/16 :goto_6

    .line 495
    .line 496
    :goto_d
    if-eq v5, v2, :cond_20

    .line 497
    .line 498
    if-ne v5, v15, :cond_1d

    .line 499
    .line 500
    goto :goto_f

    .line 501
    :cond_1d
    iget v7, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 502
    .line 503
    add-int/lit8 v7, v7, 0xa

    .line 504
    .line 505
    invoke-virtual {v0, v7}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 506
    .line 507
    .line 508
    move-result v7

    .line 509
    if-eq v7, v2, :cond_1f

    .line 510
    .line 511
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 512
    .line 513
    add-int/lit8 v2, v2, 0xa

    .line 514
    .line 515
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 516
    .line 517
    .line 518
    move-result v2

    .line 519
    if-ne v2, v15, :cond_1e

    .line 520
    .line 521
    goto :goto_e

    .line 522
    :cond_1e
    return v21

    .line 523
    :cond_1f
    :goto_e
    move/from16 v34, v1

    .line 524
    .line 525
    move/from16 v38, v3

    .line 526
    .line 527
    move/from16 v37, v4

    .line 528
    .line 529
    move/from16 v41, v5

    .line 530
    .line 531
    move/from16 v39, v6

    .line 532
    .line 533
    move/from16 v40, v8

    .line 534
    .line 535
    move/from16 v35, v13

    .line 536
    .line 537
    move/from16 v36, v14

    .line 538
    .line 539
    const/16 v13, 0xb

    .line 540
    .line 541
    goto :goto_10

    .line 542
    :cond_20
    :goto_f
    move/from16 v34, v1

    .line 543
    .line 544
    move/from16 v38, v3

    .line 545
    .line 546
    move/from16 v37, v4

    .line 547
    .line 548
    move/from16 v39, v6

    .line 549
    .line 550
    move/from16 v41, v8

    .line 551
    .line 552
    move/from16 v35, v13

    .line 553
    .line 554
    move/from16 v36, v14

    .line 555
    .line 556
    move/from16 v13, v30

    .line 557
    .line 558
    goto/16 :goto_7

    .line 559
    .line 560
    :goto_10
    invoke-static/range {v34 .. v41}, Lcom/alibaba/fastjson/parser/JSONScanner;->checkDate(CCCCCCII)Z

    .line 561
    .line 562
    .line 563
    move-result v1

    .line 564
    move/from16 v6, v34

    .line 565
    .line 566
    move/from16 v2, v35

    .line 567
    .line 568
    move/from16 v3, v36

    .line 569
    .line 570
    move/from16 v4, v37

    .line 571
    .line 572
    move/from16 v5, v38

    .line 573
    .line 574
    move/from16 v7, v39

    .line 575
    .line 576
    move/from16 v8, v40

    .line 577
    .line 578
    move/from16 v14, v41

    .line 579
    .line 580
    if-nez v1, :cond_21

    .line 581
    .line 582
    return v21

    .line 583
    :cond_21
    move v1, v6

    .line 584
    move v6, v7

    .line 585
    move v7, v8

    .line 586
    move v8, v14

    .line 587
    const/4 v10, 0x5

    .line 588
    const/16 v14, 0x2b

    .line 589
    .line 590
    const/16 v15, 0x30

    .line 591
    .line 592
    invoke-direct/range {v0 .. v8}, Lcom/alibaba/fastjson/parser/JSONScanner;->setCalendar(CCCCCCCC)V

    .line 593
    .line 594
    .line 595
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 596
    .line 597
    add-int/2addr v1, v13

    .line 598
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 599
    .line 600
    .line 601
    move-result v7

    .line 602
    if-ne v7, v12, :cond_24

    .line 603
    .line 604
    const/16 v1, 0x10

    .line 605
    .line 606
    if-ne v9, v1, :cond_24

    .line 607
    .line 608
    const/16 v5, 0x8

    .line 609
    .line 610
    if-ne v13, v5, :cond_24

    .line 611
    .line 612
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 613
    .line 614
    add-int/lit8 v1, v1, 0xf

    .line 615
    .line 616
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 617
    .line 618
    .line 619
    move-result v1

    .line 620
    const/16 v2, 0x5a

    .line 621
    .line 622
    if-ne v1, v2, :cond_24

    .line 623
    .line 624
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 625
    .line 626
    add-int/2addr v1, v13

    .line 627
    add-int/lit8 v1, v1, 0x1

    .line 628
    .line 629
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 630
    .line 631
    .line 632
    move-result v1

    .line 633
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 634
    .line 635
    add-int/2addr v2, v13

    .line 636
    add-int/lit8 v2, v2, 0x2

    .line 637
    .line 638
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 639
    .line 640
    .line 641
    move-result v2

    .line 642
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 643
    .line 644
    add-int/2addr v3, v13

    .line 645
    add-int/lit8 v3, v3, 0x3

    .line 646
    .line 647
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 648
    .line 649
    .line 650
    move-result v3

    .line 651
    iget v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 652
    .line 653
    add-int/2addr v4, v13

    .line 654
    add-int/lit8 v4, v4, 0x4

    .line 655
    .line 656
    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 657
    .line 658
    .line 659
    move-result v4

    .line 660
    iget v5, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 661
    .line 662
    add-int/2addr v5, v13

    .line 663
    add-int/2addr v5, v10

    .line 664
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 665
    .line 666
    .line 667
    move-result v5

    .line 668
    iget v6, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 669
    .line 670
    add-int/2addr v6, v13

    .line 671
    add-int/lit8 v6, v6, 0x6

    .line 672
    .line 673
    invoke-virtual {v0, v6}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 674
    .line 675
    .line 676
    move-result v6

    .line 677
    invoke-direct/range {v0 .. v6}, Lcom/alibaba/fastjson/parser/JSONScanner;->checkTime(CCCCCC)Z

    .line 678
    .line 679
    .line 680
    move-result v7

    .line 681
    if-nez v7, :cond_22

    .line 682
    .line 683
    return v21

    .line 684
    :cond_22
    move-object/from16 v0, p0

    .line 685
    .line 686
    invoke-virtual/range {v0 .. v6}, Lcom/alibaba/fastjson/parser/JSONScanner;->setTime(CCCCCC)V

    .line 687
    .line 688
    .line 689
    iget-object v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->calendar:Ljava/util/Calendar;

    .line 690
    .line 691
    move/from16 v3, v21

    .line 692
    .line 693
    const/16 v2, 0xe

    .line 694
    .line 695
    invoke-virtual {v1, v2, v3}, Ljava/util/Calendar;->set(II)V

    .line 696
    .line 697
    .line 698
    iget-object v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->calendar:Ljava/util/Calendar;

    .line 699
    .line 700
    invoke-virtual {v1}, Ljava/util/Calendar;->getTimeZone()Ljava/util/TimeZone;

    .line 701
    .line 702
    .line 703
    move-result-object v1

    .line 704
    invoke-virtual {v1}, Ljava/util/TimeZone;->getRawOffset()I

    .line 705
    .line 706
    .line 707
    move-result v1

    .line 708
    if-eqz v1, :cond_23

    .line 709
    .line 710
    invoke-static {v3}, Ljava/util/TimeZone;->getAvailableIDs(I)[Ljava/lang/String;

    .line 711
    .line 712
    .line 713
    move-result-object v1

    .line 714
    array-length v2, v1

    .line 715
    if-lez v2, :cond_23

    .line 716
    .line 717
    aget-object v1, v1, v3

    .line 718
    .line 719
    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    .line 720
    .line 721
    .line 722
    move-result-object v1

    .line 723
    iget-object v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->calendar:Ljava/util/Calendar;

    .line 724
    .line 725
    invoke-virtual {v2, v1}, Ljava/util/Calendar;->setTimeZone(Ljava/util/TimeZone;)V

    .line 726
    .line 727
    .line 728
    :cond_23
    iput v10, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 729
    .line 730
    return v20

    .line 731
    :cond_24
    const/16 v8, 0x1a

    .line 732
    .line 733
    const/16 v1, 0x22

    .line 734
    .line 735
    if-eq v7, v12, :cond_2d

    .line 736
    .line 737
    const/16 v2, 0x20

    .line 738
    .line 739
    if-ne v7, v2, :cond_25

    .line 740
    .line 741
    if-nez p1, :cond_25

    .line 742
    .line 743
    goto/16 :goto_14

    .line 744
    .line 745
    :cond_25
    if-eq v7, v1, :cond_26

    .line 746
    .line 747
    if-eq v7, v8, :cond_26

    .line 748
    .line 749
    const/16 v2, 0x65e5

    .line 750
    .line 751
    if-eq v7, v2, :cond_26

    .line 752
    .line 753
    const v1, 0xc77c

    .line 754
    .line 755
    .line 756
    if-ne v7, v1, :cond_27

    .line 757
    .line 758
    :cond_26
    const/4 v3, 0x0

    .line 759
    goto :goto_13

    .line 760
    :cond_27
    if-eq v7, v14, :cond_29

    .line 761
    .line 762
    if-ne v7, v11, :cond_28

    .line 763
    .line 764
    goto :goto_11

    .line 765
    :cond_28
    const/16 v21, 0x0

    .line 766
    .line 767
    return v21

    .line 768
    :cond_29
    :goto_11
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->len:I

    .line 769
    .line 770
    add-int/lit8 v2, v13, 0x6

    .line 771
    .line 772
    if-ne v1, v2, :cond_2c

    .line 773
    .line 774
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 775
    .line 776
    add-int/2addr v1, v13

    .line 777
    add-int/lit8 v1, v1, 0x3

    .line 778
    .line 779
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 780
    .line 781
    .line 782
    move-result v1

    .line 783
    const/16 v2, 0x3a

    .line 784
    .line 785
    if-ne v1, v2, :cond_2a

    .line 786
    .line 787
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 788
    .line 789
    add-int/2addr v1, v13

    .line 790
    add-int/lit8 v1, v1, 0x4

    .line 791
    .line 792
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 793
    .line 794
    .line 795
    move-result v1

    .line 796
    if-ne v1, v15, :cond_2a

    .line 797
    .line 798
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 799
    .line 800
    add-int/2addr v1, v13

    .line 801
    add-int/2addr v1, v10

    .line 802
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 803
    .line 804
    .line 805
    move-result v1

    .line 806
    if-eq v1, v15, :cond_2b

    .line 807
    .line 808
    :cond_2a
    const/4 v3, 0x0

    .line 809
    goto :goto_12

    .line 810
    :cond_2b
    const/16 v5, 0x30

    .line 811
    .line 812
    const/16 v6, 0x30

    .line 813
    .line 814
    const/16 v1, 0x30

    .line 815
    .line 816
    const/16 v2, 0x30

    .line 817
    .line 818
    const/16 v3, 0x30

    .line 819
    .line 820
    const/16 v4, 0x30

    .line 821
    .line 822
    invoke-virtual/range {v0 .. v6}, Lcom/alibaba/fastjson/parser/JSONScanner;->setTime(CCCCCC)V

    .line 823
    .line 824
    .line 825
    iget-object v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->calendar:Ljava/util/Calendar;

    .line 826
    .line 827
    const/16 v2, 0xe

    .line 828
    .line 829
    const/4 v3, 0x0

    .line 830
    invoke-virtual {v1, v2, v3}, Ljava/util/Calendar;->set(II)V

    .line 831
    .line 832
    .line 833
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 834
    .line 835
    add-int/2addr v1, v13

    .line 836
    add-int/lit8 v1, v1, 0x1

    .line 837
    .line 838
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 839
    .line 840
    .line 841
    move-result v1

    .line 842
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 843
    .line 844
    add-int/2addr v2, v13

    .line 845
    add-int/lit8 v2, v2, 0x2

    .line 846
    .line 847
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 848
    .line 849
    .line 850
    move-result v2

    .line 851
    invoke-virtual {v0, v7, v1, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->setTimeZone(CCC)V

    .line 852
    .line 853
    .line 854
    return v20

    .line 855
    :goto_12
    return v3

    .line 856
    :cond_2c
    const/4 v3, 0x0

    .line 857
    return v3

    .line 858
    :goto_13
    iget-object v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->calendar:Ljava/util/Calendar;

    .line 859
    .line 860
    const/16 v2, 0xb

    .line 861
    .line 862
    invoke-virtual {v1, v2, v3}, Ljava/util/Calendar;->set(II)V

    .line 863
    .line 864
    .line 865
    iget-object v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->calendar:Ljava/util/Calendar;

    .line 866
    .line 867
    const/16 v2, 0xc

    .line 868
    .line 869
    invoke-virtual {v1, v2, v3}, Ljava/util/Calendar;->set(II)V

    .line 870
    .line 871
    .line 872
    iget-object v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->calendar:Ljava/util/Calendar;

    .line 873
    .line 874
    const/16 v2, 0xd

    .line 875
    .line 876
    invoke-virtual {v1, v2, v3}, Ljava/util/Calendar;->set(II)V

    .line 877
    .line 878
    .line 879
    iget-object v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->calendar:Ljava/util/Calendar;

    .line 880
    .line 881
    const/16 v2, 0xe

    .line 882
    .line 883
    invoke-virtual {v1, v2, v3}, Ljava/util/Calendar;->set(II)V

    .line 884
    .line 885
    .line 886
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 887
    .line 888
    add-int/2addr v1, v13

    .line 889
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 890
    .line 891
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 892
    .line 893
    .line 894
    move-result v1

    .line 895
    iput-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 896
    .line 897
    iput v10, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 898
    .line 899
    return v20

    .line 900
    :cond_2d
    :goto_14
    add-int/lit8 v2, v13, 0x9

    .line 901
    .line 902
    if-ge v9, v2, :cond_2e

    .line 903
    .line 904
    const/16 v21, 0x0

    .line 905
    .line 906
    return v21

    .line 907
    :cond_2e
    const/16 v21, 0x0

    .line 908
    .line 909
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 910
    .line 911
    add-int/2addr v2, v13

    .line 912
    add-int/lit8 v2, v2, 0x3

    .line 913
    .line 914
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 915
    .line 916
    .line 917
    move-result v2

    .line 918
    const/16 v3, 0x3a

    .line 919
    .line 920
    if-eq v2, v3, :cond_2f

    .line 921
    .line 922
    return v21

    .line 923
    :cond_2f
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 924
    .line 925
    add-int/2addr v2, v13

    .line 926
    add-int/lit8 v2, v2, 0x6

    .line 927
    .line 928
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 929
    .line 930
    .line 931
    move-result v2

    .line 932
    if-eq v2, v3, :cond_30

    .line 933
    .line 934
    return v21

    .line 935
    :cond_30
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 936
    .line 937
    add-int/2addr v2, v13

    .line 938
    add-int/lit8 v2, v2, 0x1

    .line 939
    .line 940
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 941
    .line 942
    .line 943
    move-result v2

    .line 944
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 945
    .line 946
    add-int/2addr v3, v13

    .line 947
    add-int/lit8 v3, v3, 0x2

    .line 948
    .line 949
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 950
    .line 951
    .line 952
    move-result v3

    .line 953
    iget v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 954
    .line 955
    add-int/2addr v4, v13

    .line 956
    add-int/lit8 v4, v4, 0x4

    .line 957
    .line 958
    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 959
    .line 960
    .line 961
    move-result v4

    .line 962
    iget v5, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 963
    .line 964
    add-int/2addr v5, v13

    .line 965
    add-int/2addr v5, v10

    .line 966
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 967
    .line 968
    .line 969
    move-result v5

    .line 970
    iget v6, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 971
    .line 972
    add-int/2addr v6, v13

    .line 973
    add-int/lit8 v6, v6, 0x7

    .line 974
    .line 975
    invoke-virtual {v0, v6}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 976
    .line 977
    .line 978
    move-result v6

    .line 979
    iget v7, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 980
    .line 981
    add-int/2addr v7, v13

    .line 982
    const/16 v22, 0x8

    .line 983
    .line 984
    add-int/lit8 v7, v7, 0x8

    .line 985
    .line 986
    invoke-virtual {v0, v7}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 987
    .line 988
    .line 989
    move-result v7

    .line 990
    move/from16 v42, v7

    .line 991
    .line 992
    move v7, v1

    .line 993
    move v1, v2

    .line 994
    move v2, v3

    .line 995
    move v3, v4

    .line 996
    move v4, v5

    .line 997
    move v5, v6

    .line 998
    move/from16 v6, v42

    .line 999
    .line 1000
    invoke-direct/range {v0 .. v6}, Lcom/alibaba/fastjson/parser/JSONScanner;->checkTime(CCCCCC)Z

    .line 1001
    .line 1002
    .line 1003
    move-result v12

    .line 1004
    if-nez v12, :cond_31

    .line 1005
    .line 1006
    const/16 v21, 0x0

    .line 1007
    .line 1008
    return v21

    .line 1009
    :cond_31
    move-object/from16 v0, p0

    .line 1010
    .line 1011
    const/16 v21, 0x0

    .line 1012
    .line 1013
    invoke-virtual/range {v0 .. v6}, Lcom/alibaba/fastjson/parser/JSONScanner;->setTime(CCCCCC)V

    .line 1014
    .line 1015
    .line 1016
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1017
    .line 1018
    add-int/2addr v1, v13

    .line 1019
    const/16 v29, 0x9

    .line 1020
    .line 1021
    add-int/lit8 v1, v1, 0x9

    .line 1022
    .line 1023
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 1024
    .line 1025
    .line 1026
    move-result v1

    .line 1027
    const/16 v2, 0x2e

    .line 1028
    .line 1029
    if-ne v1, v2, :cond_36

    .line 1030
    .line 1031
    add-int/lit8 v1, v13, 0xb

    .line 1032
    .line 1033
    if-ge v9, v1, :cond_32

    .line 1034
    .line 1035
    return v21

    .line 1036
    :cond_32
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1037
    .line 1038
    add-int/2addr v2, v13

    .line 1039
    add-int/lit8 v2, v2, 0xa

    .line 1040
    .line 1041
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 1042
    .line 1043
    .line 1044
    move-result v2

    .line 1045
    if-lt v2, v15, :cond_33

    .line 1046
    .line 1047
    const/16 v4, 0x39

    .line 1048
    .line 1049
    if-le v2, v4, :cond_34

    .line 1050
    .line 1051
    :cond_33
    const/16 v21, 0x0

    .line 1052
    .line 1053
    goto :goto_16

    .line 1054
    :cond_34
    sub-int/2addr v2, v15

    .line 1055
    if-le v9, v1, :cond_35

    .line 1056
    .line 1057
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1058
    .line 1059
    add-int/2addr v1, v13

    .line 1060
    const/16 v28, 0xb

    .line 1061
    .line 1062
    add-int/lit8 v1, v1, 0xb

    .line 1063
    .line 1064
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 1065
    .line 1066
    .line 1067
    move-result v1

    .line 1068
    if-lt v1, v15, :cond_35

    .line 1069
    .line 1070
    if-gt v1, v4, :cond_35

    .line 1071
    .line 1072
    mul-int/lit8 v2, v2, 0xa

    .line 1073
    .line 1074
    sub-int/2addr v1, v15

    .line 1075
    add-int/2addr v2, v1

    .line 1076
    move/from16 v1, v18

    .line 1077
    .line 1078
    move v3, v1

    .line 1079
    goto :goto_15

    .line 1080
    :cond_35
    move/from16 v3, v18

    .line 1081
    .line 1082
    move/from16 v1, v20

    .line 1083
    .line 1084
    :goto_15
    if-ne v1, v3, :cond_37

    .line 1085
    .line 1086
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1087
    .line 1088
    add-int/2addr v3, v13

    .line 1089
    const/16 v25, 0xc

    .line 1090
    .line 1091
    add-int/lit8 v3, v3, 0xc

    .line 1092
    .line 1093
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 1094
    .line 1095
    .line 1096
    move-result v3

    .line 1097
    if-lt v3, v15, :cond_37

    .line 1098
    .line 1099
    const/16 v4, 0x39

    .line 1100
    .line 1101
    if-gt v3, v4, :cond_37

    .line 1102
    .line 1103
    mul-int/lit8 v2, v2, 0xa

    .line 1104
    .line 1105
    sub-int/2addr v3, v15

    .line 1106
    add-int v1, v2, v3

    .line 1107
    .line 1108
    move v2, v1

    .line 1109
    move/from16 v1, v17

    .line 1110
    .line 1111
    goto :goto_17

    .line 1112
    :goto_16
    return v21

    .line 1113
    :cond_36
    const/4 v1, -0x1

    .line 1114
    const/4 v2, 0x0

    .line 1115
    :cond_37
    :goto_17
    iget-object v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->calendar:Ljava/util/Calendar;

    .line 1116
    .line 1117
    const/16 v4, 0xe

    .line 1118
    .line 1119
    invoke-virtual {v3, v4, v2}, Ljava/util/Calendar;->set(II)V

    .line 1120
    .line 1121
    .line 1122
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1123
    .line 1124
    add-int/2addr v2, v13

    .line 1125
    add-int/lit8 v2, v2, 0xa

    .line 1126
    .line 1127
    add-int/2addr v2, v1

    .line 1128
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 1129
    .line 1130
    .line 1131
    move-result v2

    .line 1132
    const/16 v3, 0x20

    .line 1133
    .line 1134
    if-ne v2, v3, :cond_38

    .line 1135
    .line 1136
    add-int/lit8 v1, v1, 0x1

    .line 1137
    .line 1138
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1139
    .line 1140
    add-int/2addr v2, v13

    .line 1141
    add-int/lit8 v2, v2, 0xa

    .line 1142
    .line 1143
    add-int/2addr v2, v1

    .line 1144
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 1145
    .line 1146
    .line 1147
    move-result v2

    .line 1148
    :cond_38
    move v6, v1

    .line 1149
    move v1, v2

    .line 1150
    if-eq v1, v14, :cond_3c

    .line 1151
    .line 1152
    if-ne v1, v11, :cond_39

    .line 1153
    .line 1154
    goto :goto_18

    .line 1155
    :cond_39
    const/16 v5, 0x5a

    .line 1156
    .line 1157
    if-ne v1, v5, :cond_3b

    .line 1158
    .line 1159
    iget-object v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->calendar:Ljava/util/Calendar;

    .line 1160
    .line 1161
    invoke-virtual {v1}, Ljava/util/Calendar;->getTimeZone()Ljava/util/TimeZone;

    .line 1162
    .line 1163
    .line 1164
    move-result-object v1

    .line 1165
    invoke-virtual {v1}, Ljava/util/TimeZone;->getRawOffset()I

    .line 1166
    .line 1167
    .line 1168
    move-result v1

    .line 1169
    if-eqz v1, :cond_3a

    .line 1170
    .line 1171
    const/16 v21, 0x0

    .line 1172
    .line 1173
    invoke-static/range {v21 .. v21}, Ljava/util/TimeZone;->getAvailableIDs(I)[Ljava/lang/String;

    .line 1174
    .line 1175
    .line 1176
    move-result-object v1

    .line 1177
    array-length v2, v1

    .line 1178
    if-lez v2, :cond_3a

    .line 1179
    .line 1180
    aget-object v1, v1, v21

    .line 1181
    .line 1182
    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    .line 1183
    .line 1184
    .line 1185
    move-result-object v1

    .line 1186
    iget-object v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->calendar:Ljava/util/Calendar;

    .line 1187
    .line 1188
    invoke-virtual {v2, v1}, Ljava/util/Calendar;->setTimeZone(Ljava/util/TimeZone;)V

    .line 1189
    .line 1190
    .line 1191
    :cond_3a
    move/from16 v15, v20

    .line 1192
    .line 1193
    goto/16 :goto_1c

    .line 1194
    .line 1195
    :cond_3b
    const/4 v15, 0x0

    .line 1196
    goto/16 :goto_1c

    .line 1197
    .line 1198
    :cond_3c
    :goto_18
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1199
    .line 1200
    add-int/2addr v2, v13

    .line 1201
    add-int/lit8 v2, v2, 0xa

    .line 1202
    .line 1203
    add-int/2addr v2, v6

    .line 1204
    add-int/lit8 v2, v2, 0x1

    .line 1205
    .line 1206
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 1207
    .line 1208
    .line 1209
    move-result v2

    .line 1210
    if-lt v2, v15, :cond_3d

    .line 1211
    .line 1212
    const/16 v3, 0x31

    .line 1213
    .line 1214
    if-le v2, v3, :cond_3e

    .line 1215
    .line 1216
    :cond_3d
    const/16 v21, 0x0

    .line 1217
    .line 1218
    goto/16 :goto_1d

    .line 1219
    .line 1220
    :cond_3e
    iget v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1221
    .line 1222
    add-int/2addr v4, v13

    .line 1223
    add-int/lit8 v4, v4, 0xa

    .line 1224
    .line 1225
    add-int/2addr v4, v6

    .line 1226
    const/16 v18, 0x2

    .line 1227
    .line 1228
    add-int/lit8 v4, v4, 0x2

    .line 1229
    .line 1230
    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 1231
    .line 1232
    .line 1233
    move-result v4

    .line 1234
    if-lt v4, v15, :cond_3f

    .line 1235
    .line 1236
    const/16 v5, 0x39

    .line 1237
    .line 1238
    if-le v4, v5, :cond_40

    .line 1239
    .line 1240
    :cond_3f
    const/16 v21, 0x0

    .line 1241
    .line 1242
    goto/16 :goto_1d

    .line 1243
    .line 1244
    :cond_40
    iget v5, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1245
    .line 1246
    add-int/2addr v5, v13

    .line 1247
    add-int/lit8 v5, v5, 0xa

    .line 1248
    .line 1249
    add-int/2addr v5, v6

    .line 1250
    add-int/lit8 v5, v5, 0x3

    .line 1251
    .line 1252
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 1253
    .line 1254
    .line 1255
    move-result v5

    .line 1256
    const/16 v9, 0x34

    .line 1257
    .line 1258
    const/16 v11, 0x33

    .line 1259
    .line 1260
    const/16 v12, 0x35

    .line 1261
    .line 1262
    const/16 v14, 0x3a

    .line 1263
    .line 1264
    if-ne v5, v14, :cond_46

    .line 1265
    .line 1266
    iget v5, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1267
    .line 1268
    add-int/2addr v5, v13

    .line 1269
    add-int/lit8 v5, v5, 0xa

    .line 1270
    .line 1271
    add-int/2addr v5, v6

    .line 1272
    add-int/lit8 v5, v5, 0x4

    .line 1273
    .line 1274
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 1275
    .line 1276
    .line 1277
    move-result v5

    .line 1278
    iget v14, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1279
    .line 1280
    add-int/2addr v14, v13

    .line 1281
    add-int/lit8 v14, v14, 0xa

    .line 1282
    .line 1283
    add-int/2addr v14, v6

    .line 1284
    add-int/2addr v14, v10

    .line 1285
    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 1286
    .line 1287
    .line 1288
    move-result v14

    .line 1289
    if-ne v5, v9, :cond_43

    .line 1290
    .line 1291
    if-ne v14, v12, :cond_43

    .line 1292
    .line 1293
    if-ne v2, v3, :cond_41

    .line 1294
    .line 1295
    const/16 v3, 0x32

    .line 1296
    .line 1297
    if-ne v4, v3, :cond_41

    .line 1298
    .line 1299
    goto :goto_19

    .line 1300
    :cond_41
    if-ne v2, v15, :cond_42

    .line 1301
    .line 1302
    if-eq v4, v12, :cond_45

    .line 1303
    .line 1304
    const/16 v3, 0x38

    .line 1305
    .line 1306
    if-ne v4, v3, :cond_42

    .line 1307
    .line 1308
    goto :goto_19

    .line 1309
    :cond_42
    const/16 v21, 0x0

    .line 1310
    .line 1311
    return v21

    .line 1312
    :cond_43
    const/16 v21, 0x0

    .line 1313
    .line 1314
    if-eq v5, v15, :cond_44

    .line 1315
    .line 1316
    if-eq v5, v11, :cond_44

    .line 1317
    .line 1318
    return v21

    .line 1319
    :cond_44
    if-eq v14, v15, :cond_45

    .line 1320
    .line 1321
    return v21

    .line 1322
    :cond_45
    :goto_19
    move v3, v4

    .line 1323
    move v4, v5

    .line 1324
    move v5, v14

    .line 1325
    move/from16 v15, v16

    .line 1326
    .line 1327
    goto :goto_1b

    .line 1328
    :cond_46
    if-ne v5, v15, :cond_48

    .line 1329
    .line 1330
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1331
    .line 1332
    add-int/2addr v3, v13

    .line 1333
    add-int/lit8 v3, v3, 0xa

    .line 1334
    .line 1335
    add-int/2addr v3, v6

    .line 1336
    add-int/lit8 v3, v3, 0x4

    .line 1337
    .line 1338
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 1339
    .line 1340
    .line 1341
    move-result v5

    .line 1342
    if-eq v5, v15, :cond_47

    .line 1343
    .line 1344
    if-eq v5, v11, :cond_47

    .line 1345
    .line 1346
    const/16 v21, 0x0

    .line 1347
    .line 1348
    return v21

    .line 1349
    :cond_47
    move v3, v4

    .line 1350
    move v4, v5

    .line 1351
    :goto_1a
    move v5, v15

    .line 1352
    move v15, v10

    .line 1353
    goto :goto_1b

    .line 1354
    :cond_48
    if-ne v5, v11, :cond_49

    .line 1355
    .line 1356
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1357
    .line 1358
    add-int/2addr v3, v13

    .line 1359
    add-int/lit8 v3, v3, 0xa

    .line 1360
    .line 1361
    add-int/2addr v3, v6

    .line 1362
    add-int/lit8 v3, v3, 0x4

    .line 1363
    .line 1364
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 1365
    .line 1366
    .line 1367
    move-result v3

    .line 1368
    if-ne v3, v15, :cond_49

    .line 1369
    .line 1370
    move v3, v4

    .line 1371
    move v4, v11

    .line 1372
    goto :goto_1a

    .line 1373
    :cond_49
    if-ne v5, v9, :cond_4a

    .line 1374
    .line 1375
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1376
    .line 1377
    add-int/2addr v3, v13

    .line 1378
    add-int/lit8 v3, v3, 0xa

    .line 1379
    .line 1380
    add-int/2addr v3, v6

    .line 1381
    add-int/lit8 v3, v3, 0x4

    .line 1382
    .line 1383
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 1384
    .line 1385
    .line 1386
    move-result v3

    .line 1387
    if-ne v3, v12, :cond_4a

    .line 1388
    .line 1389
    move v3, v4

    .line 1390
    move v4, v9

    .line 1391
    move v15, v10

    .line 1392
    move v5, v12

    .line 1393
    goto :goto_1b

    .line 1394
    :cond_4a
    move v3, v4

    .line 1395
    move v4, v15

    .line 1396
    move v5, v4

    .line 1397
    move/from16 v15, v17

    .line 1398
    .line 1399
    :goto_1b
    invoke-virtual/range {v0 .. v5}, Lcom/alibaba/fastjson/parser/JSONScanner;->setTimeZone(CCCCC)V

    .line 1400
    .line 1401
    .line 1402
    :goto_1c
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1403
    .line 1404
    add-int/lit8 v13, v13, 0xa

    .line 1405
    .line 1406
    add-int/2addr v13, v6

    .line 1407
    add-int/2addr v13, v15

    .line 1408
    add-int/2addr v1, v13

    .line 1409
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 1410
    .line 1411
    .line 1412
    move-result v1

    .line 1413
    if-eq v1, v8, :cond_4b

    .line 1414
    .line 1415
    if-eq v1, v7, :cond_4b

    .line 1416
    .line 1417
    const/16 v21, 0x0

    .line 1418
    .line 1419
    return v21

    .line 1420
    :cond_4b
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1421
    .line 1422
    add-int/2addr v1, v13

    .line 1423
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1424
    .line 1425
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 1426
    .line 1427
    .line 1428
    move-result v1

    .line 1429
    iput-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 1430
    .line 1431
    iput v10, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 1432
    .line 1433
    return v20

    .line 1434
    :goto_1d
    return v21

    .line 1435
    :goto_1e
    if-eqz p1, :cond_4c

    .line 1436
    .line 1437
    return v21

    .line 1438
    :cond_4c
    iget v8, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1439
    .line 1440
    const/16 v22, 0x8

    .line 1441
    .line 1442
    add-int/lit8 v8, v8, 0x8

    .line 1443
    .line 1444
    invoke-virtual {v0, v8}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 1445
    .line 1446
    .line 1447
    move-result v24

    .line 1448
    if-ne v2, v11, :cond_4d

    .line 1449
    .line 1450
    if-ne v7, v11, :cond_4d

    .line 1451
    .line 1452
    move/from16 v8, v20

    .line 1453
    .line 1454
    goto :goto_1f

    .line 1455
    :cond_4d
    const/4 v8, 0x0

    .line 1456
    :goto_1f
    const/16 v5, 0x10

    .line 1457
    .line 1458
    if-eqz v8, :cond_4e

    .line 1459
    .line 1460
    if-ne v9, v5, :cond_4e

    .line 1461
    .line 1462
    move/from16 v26, v20

    .line 1463
    .line 1464
    goto :goto_20

    .line 1465
    :cond_4e
    const/16 v26, 0x0

    .line 1466
    .line 1467
    :goto_20
    if-eqz v8, :cond_4f

    .line 1468
    .line 1469
    const/16 v8, 0x11

    .line 1470
    .line 1471
    if-ne v9, v8, :cond_4f

    .line 1472
    .line 1473
    move/from16 v31, v20

    .line 1474
    .line 1475
    goto :goto_21

    .line 1476
    :cond_4f
    const/16 v31, 0x0

    .line 1477
    .line 1478
    :goto_21
    if-nez v31, :cond_52

    .line 1479
    .line 1480
    if-eqz v26, :cond_50

    .line 1481
    .line 1482
    goto :goto_24

    .line 1483
    :cond_50
    if-ne v2, v11, :cond_51

    .line 1484
    .line 1485
    if-ne v6, v11, :cond_51

    .line 1486
    .line 1487
    move v2, v12

    .line 1488
    move v12, v1

    .line 1489
    move v1, v2

    .line 1490
    move/from16 v17, v3

    .line 1491
    .line 1492
    move/from16 v33, v5

    .line 1493
    .line 1494
    move/from16 v19, v7

    .line 1495
    .line 1496
    move v2, v15

    .line 1497
    move/from16 v16, v2

    .line 1498
    .line 1499
    move/from16 v18, v16

    .line 1500
    .line 1501
    :goto_22
    const/16 v11, 0x5a

    .line 1502
    .line 1503
    const/16 v29, 0x9

    .line 1504
    .line 1505
    :goto_23
    move v15, v4

    .line 1506
    goto :goto_25

    .line 1507
    :cond_51
    move v11, v12

    .line 1508
    move v12, v1

    .line 1509
    move v1, v11

    .line 1510
    move/from16 v16, v2

    .line 1511
    .line 1512
    move/from16 v17, v3

    .line 1513
    .line 1514
    move/from16 v33, v5

    .line 1515
    .line 1516
    move/from16 v18, v6

    .line 1517
    .line 1518
    move/from16 v19, v7

    .line 1519
    .line 1520
    move v2, v15

    .line 1521
    goto :goto_22

    .line 1522
    :cond_52
    :goto_24
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1523
    .line 1524
    const/16 v29, 0x9

    .line 1525
    .line 1526
    add-int/lit8 v2, v2, 0x9

    .line 1527
    .line 1528
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 1529
    .line 1530
    .line 1531
    move-result v7

    .line 1532
    move v2, v12

    .line 1533
    move v12, v1

    .line 1534
    move v1, v2

    .line 1535
    move/from16 v16, v3

    .line 1536
    .line 1537
    move/from16 v33, v5

    .line 1538
    .line 1539
    move/from16 v17, v6

    .line 1540
    .line 1541
    move/from16 v19, v7

    .line 1542
    .line 1543
    move v2, v15

    .line 1544
    move/from16 v18, v24

    .line 1545
    .line 1546
    const/16 v11, 0x5a

    .line 1547
    .line 1548
    goto :goto_23

    .line 1549
    :goto_25
    invoke-static/range {v12 .. v19}, Lcom/alibaba/fastjson/parser/JSONScanner;->checkDate(CCCCCCII)Z

    .line 1550
    .line 1551
    .line 1552
    move-result v3

    .line 1553
    move/from16 v5, v16

    .line 1554
    .line 1555
    move/from16 v6, v17

    .line 1556
    .line 1557
    move/from16 v7, v18

    .line 1558
    .line 1559
    move/from16 v8, v19

    .line 1560
    .line 1561
    if-nez v3, :cond_53

    .line 1562
    .line 1563
    const/16 v21, 0x0

    .line 1564
    .line 1565
    return v21

    .line 1566
    :cond_53
    move v3, v14

    .line 1567
    move v4, v15

    .line 1568
    move/from16 v14, v27

    .line 1569
    .line 1570
    move v15, v2

    .line 1571
    move v2, v13

    .line 1572
    move v13, v1

    .line 1573
    move v1, v12

    .line 1574
    move/from16 v12, v28

    .line 1575
    .line 1576
    invoke-direct/range {v0 .. v8}, Lcom/alibaba/fastjson/parser/JSONScanner;->setCalendar(CCCCCCCC)V

    .line 1577
    .line 1578
    .line 1579
    const/16 v5, 0x8

    .line 1580
    .line 1581
    if-eq v9, v5, :cond_60

    .line 1582
    .line 1583
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1584
    .line 1585
    add-int/lit8 v1, v1, 0x9

    .line 1586
    .line 1587
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 1588
    .line 1589
    .line 1590
    move-result v1

    .line 1591
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1592
    .line 1593
    add-int/lit8 v2, v2, 0xa

    .line 1594
    .line 1595
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 1596
    .line 1597
    .line 1598
    move-result v2

    .line 1599
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1600
    .line 1601
    add-int/2addr v3, v12

    .line 1602
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 1603
    .line 1604
    .line 1605
    move-result v3

    .line 1606
    iget v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1607
    .line 1608
    const/16 v25, 0xc

    .line 1609
    .line 1610
    add-int/lit8 v4, v4, 0xc

    .line 1611
    .line 1612
    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 1613
    .line 1614
    .line 1615
    move-result v5

    .line 1616
    iget v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1617
    .line 1618
    const/16 v23, 0xd

    .line 1619
    .line 1620
    add-int/lit8 v4, v4, 0xd

    .line 1621
    .line 1622
    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 1623
    .line 1624
    .line 1625
    move-result v4

    .line 1626
    if-eqz v31, :cond_54

    .line 1627
    .line 1628
    if-ne v2, v13, :cond_54

    .line 1629
    .line 1630
    if-ne v4, v14, :cond_54

    .line 1631
    .line 1632
    iget v6, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1633
    .line 1634
    add-int/lit8 v6, v6, 0x10

    .line 1635
    .line 1636
    invoke-virtual {v0, v6}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 1637
    .line 1638
    .line 1639
    move-result v6

    .line 1640
    if-eq v6, v11, :cond_56

    .line 1641
    .line 1642
    :cond_54
    if-eqz v26, :cond_57

    .line 1643
    .line 1644
    const/16 v8, 0x20

    .line 1645
    .line 1646
    if-eq v2, v8, :cond_55

    .line 1647
    .line 1648
    if-ne v2, v13, :cond_57

    .line 1649
    .line 1650
    :cond_55
    if-ne v4, v14, :cond_57

    .line 1651
    .line 1652
    :cond_56
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1653
    .line 1654
    const/16 v32, 0xe

    .line 1655
    .line 1656
    add-int/lit8 v1, v1, 0xe

    .line 1657
    .line 1658
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 1659
    .line 1660
    .line 1661
    move-result v2

    .line 1662
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1663
    .line 1664
    add-int/lit8 v1, v1, 0xf

    .line 1665
    .line 1666
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 1667
    .line 1668
    .line 1669
    move-result v1

    .line 1670
    move v4, v1

    .line 1671
    move v1, v3

    .line 1672
    move v6, v15

    .line 1673
    move v3, v2

    .line 1674
    move v2, v5

    .line 1675
    move v5, v6

    .line 1676
    goto :goto_26

    .line 1677
    :cond_57
    move v6, v4

    .line 1678
    move v4, v3

    .line 1679
    move v3, v2

    .line 1680
    move v2, v1

    .line 1681
    move/from16 v1, v24

    .line 1682
    .line 1683
    :goto_26
    invoke-direct/range {v0 .. v6}, Lcom/alibaba/fastjson/parser/JSONScanner;->checkTime(CCCCCC)Z

    .line 1684
    .line 1685
    .line 1686
    move-result v7

    .line 1687
    move/from16 v42, v3

    .line 1688
    .line 1689
    move v3, v1

    .line 1690
    move v1, v2

    .line 1691
    move/from16 v2, v42

    .line 1692
    .line 1693
    if-nez v7, :cond_58

    .line 1694
    .line 1695
    const/16 v21, 0x0

    .line 1696
    .line 1697
    return v21

    .line 1698
    :cond_58
    const/16 v8, 0x11

    .line 1699
    .line 1700
    if-ne v9, v8, :cond_5f

    .line 1701
    .line 1702
    if-nez v31, :cond_5f

    .line 1703
    .line 1704
    iget v7, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1705
    .line 1706
    const/16 v32, 0xe

    .line 1707
    .line 1708
    add-int/lit8 v7, v7, 0xe

    .line 1709
    .line 1710
    invoke-virtual {v0, v7}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 1711
    .line 1712
    .line 1713
    move-result v7

    .line 1714
    iget v8, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1715
    .line 1716
    add-int/lit8 v8, v8, 0xf

    .line 1717
    .line 1718
    invoke-virtual {v0, v8}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 1719
    .line 1720
    .line 1721
    move-result v8

    .line 1722
    iget v9, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 1723
    .line 1724
    add-int/lit8 v9, v9, 0x10

    .line 1725
    .line 1726
    invoke-virtual {v0, v9}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 1727
    .line 1728
    .line 1729
    move-result v9

    .line 1730
    if-lt v7, v15, :cond_59

    .line 1731
    .line 1732
    const/16 v11, 0x39

    .line 1733
    .line 1734
    if-le v7, v11, :cond_5a

    .line 1735
    .line 1736
    :cond_59
    const/16 v21, 0x0

    .line 1737
    .line 1738
    goto :goto_27

    .line 1739
    :cond_5a
    if-lt v8, v15, :cond_5b

    .line 1740
    .line 1741
    if-le v8, v11, :cond_5c

    .line 1742
    .line 1743
    :cond_5b
    const/16 v21, 0x0

    .line 1744
    .line 1745
    goto :goto_27

    .line 1746
    :cond_5c
    if-lt v9, v15, :cond_5d

    .line 1747
    .line 1748
    if-le v9, v11, :cond_5e

    .line 1749
    .line 1750
    :cond_5d
    const/16 v21, 0x0

    .line 1751
    .line 1752
    goto :goto_27

    .line 1753
    :cond_5e
    sub-int/2addr v7, v15

    .line 1754
    mul-int/lit8 v7, v7, 0x64

    .line 1755
    .line 1756
    sub-int/2addr v8, v15

    .line 1757
    mul-int/lit8 v8, v8, 0xa

    .line 1758
    .line 1759
    add-int/2addr v7, v8

    .line 1760
    sub-int/2addr v9, v15

    .line 1761
    add-int/2addr v7, v9

    .line 1762
    move/from16 v21, v7

    .line 1763
    .line 1764
    goto :goto_28

    .line 1765
    :goto_27
    return v21

    .line 1766
    :cond_5f
    const/16 v21, 0x0

    .line 1767
    .line 1768
    :goto_28
    sub-int/2addr v3, v15

    .line 1769
    mul-int/lit8 v3, v3, 0xa

    .line 1770
    .line 1771
    sub-int/2addr v1, v15

    .line 1772
    add-int/2addr v1, v3

    .line 1773
    add-int/lit8 v3, v2, -0x30

    .line 1774
    .line 1775
    mul-int/lit8 v3, v3, 0xa

    .line 1776
    .line 1777
    sub-int/2addr v4, v15

    .line 1778
    add-int v2, v3, v4

    .line 1779
    .line 1780
    sub-int/2addr v5, v15

    .line 1781
    mul-int/lit8 v5, v5, 0xa

    .line 1782
    .line 1783
    sub-int/2addr v6, v15

    .line 1784
    add-int v3, v5, v6

    .line 1785
    .line 1786
    move/from16 v4, v21

    .line 1787
    .line 1788
    goto :goto_29

    .line 1789
    :cond_60
    const/16 v21, 0x0

    .line 1790
    .line 1791
    move/from16 v1, v21

    .line 1792
    .line 1793
    move v2, v1

    .line 1794
    move v3, v2

    .line 1795
    move v4, v3

    .line 1796
    :goto_29
    iget-object v5, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->calendar:Ljava/util/Calendar;

    .line 1797
    .line 1798
    invoke-virtual {v5, v12, v1}, Ljava/util/Calendar;->set(II)V

    .line 1799
    .line 1800
    .line 1801
    iget-object v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->calendar:Ljava/util/Calendar;

    .line 1802
    .line 1803
    const/16 v5, 0xc

    .line 1804
    .line 1805
    invoke-virtual {v1, v5, v2}, Ljava/util/Calendar;->set(II)V

    .line 1806
    .line 1807
    .line 1808
    iget-object v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->calendar:Ljava/util/Calendar;

    .line 1809
    .line 1810
    const/16 v2, 0xd

    .line 1811
    .line 1812
    invoke-virtual {v1, v2, v3}, Ljava/util/Calendar;->set(II)V

    .line 1813
    .line 1814
    .line 1815
    iget-object v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->calendar:Ljava/util/Calendar;

    .line 1816
    .line 1817
    const/16 v2, 0xe

    .line 1818
    .line 1819
    invoke-virtual {v1, v2, v4}, Ljava/util/Calendar;->set(II)V

    .line 1820
    .line 1821
    .line 1822
    iput v10, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 1823
    .line 1824
    return v20
.end method

.method private setCalendar(CCCCCCCC)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->timeZone:Ljava/util/TimeZone;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->locale:Ljava/util/Locale;

    .line 4
    .line 5
    invoke-static {v0, v1}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;Ljava/util/Locale;)Ljava/util/Calendar;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->calendar:Ljava/util/Calendar;

    .line 10
    .line 11
    add-int/lit8 p1, p1, -0x30

    .line 12
    .line 13
    mul-int/lit16 p1, p1, 0x3e8

    .line 14
    .line 15
    add-int/lit8 p2, p2, -0x30

    .line 16
    .line 17
    mul-int/lit8 p2, p2, 0x64

    .line 18
    .line 19
    add-int/2addr p1, p2

    .line 20
    add-int/lit8 p3, p3, -0x30

    .line 21
    .line 22
    mul-int/lit8 p3, p3, 0xa

    .line 23
    .line 24
    add-int/2addr p1, p3

    .line 25
    add-int/lit8 p4, p4, -0x30

    .line 26
    .line 27
    add-int/2addr p1, p4

    .line 28
    add-int/lit8 p5, p5, -0x30

    .line 29
    .line 30
    mul-int/lit8 p5, p5, 0xa

    .line 31
    .line 32
    add-int/lit8 p6, p6, -0x30

    .line 33
    .line 34
    add-int/2addr p5, p6

    .line 35
    const/4 p2, 0x1

    .line 36
    sub-int/2addr p5, p2

    .line 37
    add-int/lit8 p7, p7, -0x30

    .line 38
    .line 39
    mul-int/lit8 p7, p7, 0xa

    .line 40
    .line 41
    add-int/lit8 p8, p8, -0x30

    .line 42
    .line 43
    add-int/2addr p7, p8

    .line 44
    invoke-virtual {v0, p2, p1}, Ljava/util/Calendar;->set(II)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->calendar:Ljava/util/Calendar;

    .line 48
    .line 49
    const/4 p2, 0x2

    .line 50
    invoke-virtual {p1, p2, p5}, Ljava/util/Calendar;->set(II)V

    .line 51
    .line 52
    .line 53
    iget-object p0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->calendar:Ljava/util/Calendar;

    .line 54
    .line 55
    const/4 p1, 0x5

    .line 56
    invoke-virtual {p0, p1, p7}, Ljava/util/Calendar;->set(II)V

    .line 57
    .line 58
    .line 59
    return-void
.end method


# virtual methods
.method public final addSymbol(IIILcom/alibaba/fastjson/parser/SymbolTable;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p4, p0, p1, p2, p3}, Lcom/alibaba/fastjson/parser/SymbolTable;->addSymbol(Ljava/lang/String;III)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final arrayCopy(I[CII)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 2
    .line 3
    add-int/2addr p4, p1

    .line 4
    invoke-virtual {p0, p1, p4, p2, p3}, Ljava/lang/String;->getChars(II[CI)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public bytesValue()[B
    .locals 10

    .line 1
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 2
    .line 3
    const/16 v1, 0x1a

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-ne v0, v1, :cond_4

    .line 7
    .line 8
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    .line 9
    .line 10
    add-int/lit8 v0, v0, 0x1

    .line 11
    .line 12
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 13
    .line 14
    rem-int/lit8 v3, v1, 0x2

    .line 15
    .line 16
    if-nez v3, :cond_3

    .line 17
    .line 18
    div-int/lit8 v1, v1, 0x2

    .line 19
    .line 20
    new-array v3, v1, [B

    .line 21
    .line 22
    :goto_0
    if-ge v2, v1, :cond_2

    .line 23
    .line 24
    iget-object v4, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 25
    .line 26
    mul-int/lit8 v5, v2, 0x2

    .line 27
    .line 28
    add-int/2addr v5, v0

    .line 29
    invoke-virtual {v4, v5}, Ljava/lang/String;->charAt(I)C

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    iget-object v6, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 34
    .line 35
    add-int/lit8 v5, v5, 0x1

    .line 36
    .line 37
    invoke-virtual {v6, v5}, Ljava/lang/String;->charAt(I)C

    .line 38
    .line 39
    .line 40
    move-result v5

    .line 41
    const/16 v6, 0x37

    .line 42
    .line 43
    const/16 v7, 0x30

    .line 44
    .line 45
    const/16 v8, 0x39

    .line 46
    .line 47
    if-gt v4, v8, :cond_0

    .line 48
    .line 49
    move v9, v7

    .line 50
    goto :goto_1

    .line 51
    :cond_0
    move v9, v6

    .line 52
    :goto_1
    sub-int/2addr v4, v9

    .line 53
    if-gt v5, v8, :cond_1

    .line 54
    .line 55
    move v6, v7

    .line 56
    :cond_1
    sub-int/2addr v5, v6

    .line 57
    shl-int/lit8 v4, v4, 0x4

    .line 58
    .line 59
    or-int/2addr v4, v5

    .line 60
    int-to-byte v4, v4

    .line 61
    aput-byte v4, v3, v2

    .line 62
    .line 63
    add-int/lit8 v2, v2, 0x1

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_2
    return-object v3

    .line 67
    :cond_3
    const-string p0, "illegal state. "

    .line 68
    .line 69
    invoke-static {p0, v1}, Ll/vkq;->a(Ljava/lang/String;I)V

    .line 70
    .line 71
    .line 72
    const/4 p0, 0x0

    .line 73
    return-object p0

    .line 74
    :cond_4
    iget-boolean v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->hasSpecial:Z

    .line 75
    .line 76
    if-nez v0, :cond_5

    .line 77
    .line 78
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 79
    .line 80
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    .line 81
    .line 82
    add-int/lit8 v1, v1, 0x1

    .line 83
    .line 84
    iget p0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 85
    .line 86
    invoke-static {v0, v1, p0}, Lcom/alibaba/fastjson/util/IOUtils;->decodeBase64(Ljava/lang/String;II)[B

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    return-object p0

    .line 91
    :cond_5
    new-instance v0, Ljava/lang/String;

    .line 92
    .line 93
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    .line 94
    .line 95
    iget p0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 96
    .line 97
    invoke-direct {v0, v1, v2, p0}, Ljava/lang/String;-><init>([CII)V

    .line 98
    .line 99
    .line 100
    invoke-static {v0}, Lcom/alibaba/fastjson/util/IOUtils;->decodeBase64(Ljava/lang/String;)[B

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    return-object p0
.end method

.method public final charArrayCompare([C)Z
    .locals 1

    .line 31
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    iget p0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    invoke-static {v0, p0, p1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charArrayCompare(Ljava/lang/String;I[C)Z

    move-result p0

    return p0
.end method

.method public final charAt(I)C
    .locals 1

    .line 1
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->len:I

    .line 2
    .line 3
    if-lt p1, v0, :cond_0

    .line 4
    .line 5
    const/16 p0, 0x1a

    .line 6
    .line 7
    return p0

    .line 8
    :cond_0
    iget-object p0, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method public final copyTo(II[C)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 2
    .line 3
    add-int/2addr p2, p1

    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p0, p1, p2, p3, v0}, Ljava/lang/String;->getChars(II[CI)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final decimalValue()Ljava/math/BigDecimal;
    .locals 6

    .line 1
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    .line 2
    .line 3
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 4
    .line 5
    add-int/2addr v0, v1

    .line 6
    add-int/lit8 v0, v0, -0x1

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 13
    .line 14
    const/16 v2, 0x4c

    .line 15
    .line 16
    if-eq v0, v2, :cond_0

    .line 17
    .line 18
    const/16 v2, 0x53

    .line 19
    .line 20
    if-eq v0, v2, :cond_0

    .line 21
    .line 22
    const/16 v2, 0x42

    .line 23
    .line 24
    if-eq v0, v2, :cond_0

    .line 25
    .line 26
    const/16 v2, 0x46

    .line 27
    .line 28
    if-eq v0, v2, :cond_0

    .line 29
    .line 30
    const/16 v2, 0x44

    .line 31
    .line 32
    if-ne v0, v2, :cond_1

    .line 33
    .line 34
    :cond_0
    add-int/lit8 v1, v1, -0x1

    .line 35
    .line 36
    :cond_1
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    .line 37
    .line 38
    iget-object v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    .line 39
    .line 40
    array-length v3, v2

    .line 41
    const/4 v4, 0x0

    .line 42
    if-ge v1, v3, :cond_2

    .line 43
    .line 44
    iget-object v3, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 45
    .line 46
    add-int v5, v0, v1

    .line 47
    .line 48
    invoke-virtual {v3, v0, v5, v2, v4}, Ljava/lang/String;->getChars(II[CI)V

    .line 49
    .line 50
    .line 51
    new-instance v0, Ljava/math/BigDecimal;

    .line 52
    .line 53
    iget-object p0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    .line 54
    .line 55
    invoke-direct {v0, p0, v4, v1}, Ljava/math/BigDecimal;-><init>([CII)V

    .line 56
    .line 57
    .line 58
    return-object v0

    .line 59
    :cond_2
    new-array v2, v1, [C

    .line 60
    .line 61
    iget-object p0, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 62
    .line 63
    add-int/2addr v1, v0

    .line 64
    invoke-virtual {p0, v0, v1, v2, v4}, Ljava/lang/String;->getChars(II[CI)V

    .line 65
    .line 66
    .line 67
    new-instance p0, Ljava/math/BigDecimal;

    .line 68
    .line 69
    invoke-direct {p0, v2}, Ljava/math/BigDecimal;-><init>([C)V

    .line 70
    .line 71
    .line 72
    return-object p0
.end method

.method public final indexOf(CI)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ljava/lang/String;->indexOf(II)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public info()Ljava/lang/String;
    .locals 8

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    const/4 v2, 0x0

    .line 8
    move v4, v1

    .line 9
    move v5, v4

    .line 10
    move v3, v2

    .line 11
    :goto_0
    iget v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 12
    .line 13
    if-ge v3, v6, :cond_1

    .line 14
    .line 15
    iget-object v6, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v6, v3}, Ljava/lang/String;->charAt(I)C

    .line 18
    .line 19
    .line 20
    move-result v6

    .line 21
    const/16 v7, 0xa

    .line 22
    .line 23
    if-ne v6, v7, :cond_0

    .line 24
    .line 25
    add-int/lit8 v4, v4, 0x1

    .line 26
    .line 27
    move v5, v1

    .line 28
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 29
    .line 30
    add-int/2addr v5, v1

    .line 31
    goto :goto_0

    .line 32
    :cond_1
    const-string v1, "pos "

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    const-string v1, ", line "

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    const-string v1, ", column "

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    iget-object p0, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 65
    .line 66
    const v3, 0xffff

    .line 67
    .line 68
    .line 69
    if-ge v1, v3, :cond_2

    .line 70
    .line 71
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_2
    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    :goto_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    return-object p0
.end method

.method public isEOF()Z
    .locals 4

    .line 1
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 2
    .line 3
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->len:I

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    if-eq v0, v1, :cond_1

    .line 7
    .line 8
    iget-char p0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 9
    .line 10
    const/16 v3, 0x1a

    .line 11
    .line 12
    if-ne p0, v3, :cond_0

    .line 13
    .line 14
    add-int/2addr v0, v2

    .line 15
    if-lt v0, v1, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_1
    :goto_0
    return v2
.end method

.method public matchField2([C)Z
    .locals 4

    .line 1
    :goto_0
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 2
    .line 3
    invoke-static {v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isWhitespace(C)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONScanner;->next()C

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charArrayCompare([C)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, 0x0

    .line 18
    const/4 v2, -0x2

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    iput v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 22
    .line 23
    return v1

    .line 24
    :cond_1
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 25
    .line 26
    array-length p1, p1

    .line 27
    add-int/2addr v0, p1

    .line 28
    iget-object p1, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 29
    .line 30
    add-int/lit8 v3, v0, 0x1

    .line 31
    .line 32
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    :goto_1
    invoke-static {p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isWhitespace(C)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_2

    .line 41
    .line 42
    iget-object p1, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 43
    .line 44
    add-int/lit8 v0, v3, 0x1

    .line 45
    .line 46
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    move v3, v0

    .line 51
    goto :goto_1

    .line 52
    :cond_2
    const/16 v0, 0x3a

    .line 53
    .line 54
    if-ne p1, v0, :cond_3

    .line 55
    .line 56
    iput v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 57
    .line 58
    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 63
    .line 64
    const/4 p0, 0x1

    .line 65
    return p0

    .line 66
    :cond_3
    iput v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 67
    .line 68
    return v1
.end method

.method public newCollectionByType(Ljava/lang/Class;)Ljava/util/Collection;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    new-instance p0, Ljava/util/HashSet;

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/util/HashSet;-><init>()V

    .line 12
    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_0
    const-class p0, Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-virtual {p1, p0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    new-instance p0, Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 26
    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_1
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    check-cast p0, Ljava/util/Collection;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    .line 35
    return-object p0

    .line 36
    :catch_0
    move-exception p0

    .line 37
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-static {p1, p0}, Ll/okq;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 42
    .line 43
    .line 44
    const/4 p0, 0x0

    .line 45
    return-object p0
.end method

.method public final next()C
    .locals 2

    .line 1
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 6
    .line 7
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->len:I

    .line 8
    .line 9
    if-lt v0, v1, :cond_0

    .line 10
    .line 11
    const/16 v0, 0x1a

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    :goto_0
    iput-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 21
    .line 22
    return v0
.end method

.method public final numberString()Ljava/lang/String;
    .locals 3

    .line 1
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    .line 2
    .line 3
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 4
    .line 5
    add-int/2addr v0, v1

    .line 6
    add-int/lit8 v0, v0, -0x1

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 13
    .line 14
    const/16 v2, 0x4c

    .line 15
    .line 16
    if-eq v0, v2, :cond_0

    .line 17
    .line 18
    const/16 v2, 0x53

    .line 19
    .line 20
    if-eq v0, v2, :cond_0

    .line 21
    .line 22
    const/16 v2, 0x42

    .line 23
    .line 24
    if-eq v0, v2, :cond_0

    .line 25
    .line 26
    const/16 v2, 0x46

    .line 27
    .line 28
    if-eq v0, v2, :cond_0

    .line 29
    .line 30
    const/16 v2, 0x44

    .line 31
    .line 32
    if-ne v0, v2, :cond_1

    .line 33
    .line 34
    :cond_0
    add-int/lit8 v1, v1, -0x1

    .line 35
    .line 36
    :cond_1
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    .line 37
    .line 38
    invoke-virtual {p0, v0, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->subString(II)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0
.end method

.method public scanDate(C)Ljava/util/Date;
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 5
    .line 6
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 7
    .line 8
    iget-char v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 9
    .line 10
    add-int/lit8 v4, v2, 0x1

    .line 11
    .line 12
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 13
    .line 14
    .line 15
    move-result v5

    .line 16
    const/16 v6, 0x5d

    .line 17
    .line 18
    const/16 v7, 0x2c

    .line 19
    .line 20
    const/4 v8, 0x0

    .line 21
    const/4 v9, -0x1

    .line 22
    const/4 v10, 0x1

    .line 23
    const/16 v11, 0x22

    .line 24
    .line 25
    if-ne v5, v11, :cond_5

    .line 26
    .line 27
    invoke-virtual {v0, v11, v4}, Lcom/alibaba/fastjson/parser/JSONScanner;->indexOf(CI)I

    .line 28
    .line 29
    .line 30
    move-result v5

    .line 31
    if-eq v5, v9, :cond_4

    .line 32
    .line 33
    sub-int v11, v5, v4

    .line 34
    .line 35
    iput v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 36
    .line 37
    invoke-direct {v0, v1, v11}, Lcom/alibaba/fastjson/parser/JSONScanner;->scanISO8601DateIfMatch(ZI)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_3

    .line 42
    .line 43
    iget-object v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->calendar:Ljava/util/Calendar;

    .line 44
    .line 45
    invoke-virtual {v1}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    add-int/lit8 v4, v5, 0x1

    .line 50
    .line 51
    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 52
    .line 53
    .line 54
    move-result v4

    .line 55
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 56
    .line 57
    :goto_0
    if-eq v4, v7, :cond_2

    .line 58
    .line 59
    if-ne v4, v6, :cond_0

    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_0
    invoke-static {v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isWhitespace(C)Z

    .line 63
    .line 64
    .line 65
    move-result v4

    .line 66
    if-eqz v4, :cond_1

    .line 67
    .line 68
    add-int/lit8 v4, v5, 0x1

    .line 69
    .line 70
    add-int/lit8 v5, v5, 0x2

    .line 71
    .line 72
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 73
    .line 74
    .line 75
    move-result v5

    .line 76
    move/from16 v19, v5

    .line 77
    .line 78
    move v5, v4

    .line 79
    move/from16 v4, v19

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_1
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 83
    .line 84
    iput-char v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 85
    .line 86
    iput v9, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 87
    .line 88
    return-object v8

    .line 89
    :cond_2
    :goto_1
    add-int/2addr v5, v10

    .line 90
    iput v5, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 91
    .line 92
    iput-char v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 93
    .line 94
    move-object/from16 v16, v8

    .line 95
    .line 96
    :goto_2
    move/from16 p1, v10

    .line 97
    .line 98
    goto/16 :goto_6

    .line 99
    .line 100
    :cond_3
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 101
    .line 102
    iput-char v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 103
    .line 104
    iput v9, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 105
    .line 106
    return-object v8

    .line 107
    :cond_4
    const-string v0, "unclosed str"

    .line 108
    .line 109
    invoke-static {v0}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    const/4 v0, 0x0

    .line 113
    return-object v0

    .line 114
    :cond_5
    const/16 v11, 0x2d

    .line 115
    .line 116
    const/16 v12, 0x39

    .line 117
    .line 118
    const/16 v13, 0x30

    .line 119
    .line 120
    if-eq v5, v11, :cond_8

    .line 121
    .line 122
    if-lt v5, v13, :cond_6

    .line 123
    .line 124
    if-gt v5, v12, :cond_6

    .line 125
    .line 126
    goto :goto_3

    .line 127
    :cond_6
    const/16 v1, 0x6e

    .line 128
    .line 129
    if-ne v5, v1, :cond_7

    .line 130
    .line 131
    add-int/lit8 v1, v2, 0x2

    .line 132
    .line 133
    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 134
    .line 135
    .line 136
    move-result v4

    .line 137
    const/16 v5, 0x75

    .line 138
    .line 139
    if-ne v4, v5, :cond_7

    .line 140
    .line 141
    add-int/lit8 v4, v2, 0x3

    .line 142
    .line 143
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 144
    .line 145
    .line 146
    move-result v1

    .line 147
    const/16 v5, 0x6c

    .line 148
    .line 149
    if-ne v1, v5, :cond_7

    .line 150
    .line 151
    add-int/lit8 v1, v2, 0x4

    .line 152
    .line 153
    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 154
    .line 155
    .line 156
    move-result v4

    .line 157
    if-ne v4, v5, :cond_7

    .line 158
    .line 159
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 160
    .line 161
    .line 162
    move-result v4

    .line 163
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 164
    .line 165
    move-object v1, v8

    .line 166
    move-object/from16 v16, v1

    .line 167
    .line 168
    goto :goto_2

    .line 169
    :cond_7
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 170
    .line 171
    iput-char v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 172
    .line 173
    iput v9, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 174
    .line 175
    return-object v8

    .line 176
    :cond_8
    :goto_3
    if-ne v5, v11, :cond_9

    .line 177
    .line 178
    add-int/lit8 v1, v2, 0x2

    .line 179
    .line 180
    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 181
    .line 182
    .line 183
    move-result v5

    .line 184
    move v4, v1

    .line 185
    move v1, v10

    .line 186
    :cond_9
    const-wide/16 v14, 0x0

    .line 187
    .line 188
    if-lt v5, v13, :cond_d

    .line 189
    .line 190
    if-gt v5, v12, :cond_d

    .line 191
    .line 192
    add-int/lit8 v5, v5, -0x30

    .line 193
    .line 194
    move/from16 p1, v10

    .line 195
    .line 196
    int-to-long v10, v5

    .line 197
    :goto_4
    add-int/lit8 v5, v4, 0x1

    .line 198
    .line 199
    move-object/from16 v16, v8

    .line 200
    .line 201
    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 202
    .line 203
    .line 204
    move-result v8

    .line 205
    if-lt v8, v13, :cond_a

    .line 206
    .line 207
    if-gt v8, v12, :cond_a

    .line 208
    .line 209
    const-wide/16 v17, 0xa

    .line 210
    .line 211
    mul-long v10, v10, v17

    .line 212
    .line 213
    add-int/lit8 v8, v8, -0x30

    .line 214
    .line 215
    int-to-long v12, v8

    .line 216
    add-long/2addr v10, v12

    .line 217
    move v4, v5

    .line 218
    move-object/from16 v8, v16

    .line 219
    .line 220
    const/16 v12, 0x39

    .line 221
    .line 222
    const/16 v13, 0x30

    .line 223
    .line 224
    goto :goto_4

    .line 225
    :cond_a
    if-eq v8, v7, :cond_b

    .line 226
    .line 227
    if-ne v8, v6, :cond_c

    .line 228
    .line 229
    :cond_b
    iput v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 230
    .line 231
    :cond_c
    move v4, v8

    .line 232
    goto :goto_5

    .line 233
    :cond_d
    move-object/from16 v16, v8

    .line 234
    .line 235
    move/from16 p1, v10

    .line 236
    .line 237
    move v4, v5

    .line 238
    move-wide v10, v14

    .line 239
    :goto_5
    cmp-long v5, v10, v14

    .line 240
    .line 241
    if-gez v5, :cond_e

    .line 242
    .line 243
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 244
    .line 245
    iput-char v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 246
    .line 247
    iput v9, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 248
    .line 249
    return-object v16

    .line 250
    :cond_e
    if-eqz v1, :cond_f

    .line 251
    .line 252
    neg-long v10, v10

    .line 253
    :cond_f
    new-instance v1, Ljava/util/Date;

    .line 254
    .line 255
    invoke-direct {v1, v10, v11}, Ljava/util/Date;-><init>(J)V

    .line 256
    .line 257
    .line 258
    :goto_6
    iget v5, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 259
    .line 260
    if-ne v4, v7, :cond_10

    .line 261
    .line 262
    add-int/lit8 v5, v5, 0x1

    .line 263
    .line 264
    iput v5, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 265
    .line 266
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 267
    .line 268
    .line 269
    move-result v2

    .line 270
    iput-char v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 271
    .line 272
    const/4 v2, 0x3

    .line 273
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 274
    .line 275
    return-object v1

    .line 276
    :cond_10
    add-int/lit8 v5, v5, 0x1

    .line 277
    .line 278
    iput v5, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 279
    .line 280
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 281
    .line 282
    .line 283
    move-result v4

    .line 284
    if-ne v4, v7, :cond_11

    .line 285
    .line 286
    const/16 v2, 0x10

    .line 287
    .line 288
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 289
    .line 290
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 291
    .line 292
    add-int/lit8 v2, v2, 0x1

    .line 293
    .line 294
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 295
    .line 296
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 297
    .line 298
    .line 299
    move-result v2

    .line 300
    iput-char v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 301
    .line 302
    goto :goto_7

    .line 303
    :cond_11
    if-ne v4, v6, :cond_12

    .line 304
    .line 305
    const/16 v2, 0xf

    .line 306
    .line 307
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 308
    .line 309
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 310
    .line 311
    add-int/lit8 v2, v2, 0x1

    .line 312
    .line 313
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 314
    .line 315
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 316
    .line 317
    .line 318
    move-result v2

    .line 319
    iput-char v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 320
    .line 321
    goto :goto_7

    .line 322
    :cond_12
    const/16 v5, 0x7d

    .line 323
    .line 324
    if-ne v4, v5, :cond_13

    .line 325
    .line 326
    const/16 v2, 0xd

    .line 327
    .line 328
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 329
    .line 330
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 331
    .line 332
    add-int/lit8 v2, v2, 0x1

    .line 333
    .line 334
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 335
    .line 336
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 337
    .line 338
    .line 339
    move-result v2

    .line 340
    iput-char v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 341
    .line 342
    goto :goto_7

    .line 343
    :cond_13
    const/16 v5, 0x1a

    .line 344
    .line 345
    if-ne v4, v5, :cond_14

    .line 346
    .line 347
    iput-char v5, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 348
    .line 349
    const/16 v2, 0x14

    .line 350
    .line 351
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 352
    .line 353
    :goto_7
    const/4 v2, 0x4

    .line 354
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 355
    .line 356
    return-object v1

    .line 357
    :cond_14
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 358
    .line 359
    iput-char v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 360
    .line 361
    iput v9, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 362
    .line 363
    return-object v16
.end method

.method public scanDouble(C)D
    .locals 24

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 5
    .line 6
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 7
    .line 8
    add-int/lit8 v3, v2, 0x1

    .line 9
    .line 10
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 11
    .line 12
    .line 13
    move-result v4

    .line 14
    const/16 v6, 0x22

    .line 15
    .line 16
    if-ne v4, v6, :cond_0

    .line 17
    .line 18
    const/4 v7, 0x1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    move v7, v1

    .line 21
    :goto_0
    if-eqz v7, :cond_1

    .line 22
    .line 23
    add-int/lit8 v2, v2, 0x2

    .line 24
    .line 25
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 26
    .line 27
    .line 28
    move-result v4

    .line 29
    move v3, v2

    .line 30
    :cond_1
    const/16 v2, 0x2d

    .line 31
    .line 32
    if-ne v4, v2, :cond_2

    .line 33
    .line 34
    const/4 v8, 0x1

    .line 35
    goto :goto_1

    .line 36
    :cond_2
    move v8, v1

    .line 37
    :goto_1
    if-eqz v8, :cond_3

    .line 38
    .line 39
    add-int/lit8 v4, v3, 0x1

    .line 40
    .line 41
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    move/from16 v22, v4

    .line 46
    .line 47
    move v4, v3

    .line 48
    move/from16 v3, v22

    .line 49
    .line 50
    :cond_3
    const/4 v12, -0x1

    .line 51
    const/16 v13, 0x30

    .line 52
    .line 53
    if-lt v4, v13, :cond_13

    .line 54
    .line 55
    const/16 v14, 0x39

    .line 56
    .line 57
    if-gt v4, v14, :cond_13

    .line 58
    .line 59
    sub-int/2addr v4, v13

    .line 60
    const-wide/16 v15, 0x0

    .line 61
    .line 62
    int-to-long v10, v4

    .line 63
    :goto_2
    add-int/lit8 v4, v3, 0x1

    .line 64
    .line 65
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    const-wide/16 v18, 0xa

    .line 70
    .line 71
    if-lt v1, v13, :cond_4

    .line 72
    .line 73
    if-gt v1, v14, :cond_4

    .line 74
    .line 75
    mul-long v10, v10, v18

    .line 76
    .line 77
    add-int/lit8 v1, v1, -0x30

    .line 78
    .line 79
    move-wide/from16 v18, v10

    .line 80
    .line 81
    int-to-long v9, v1

    .line 82
    add-long v10, v18, v9

    .line 83
    .line 84
    move v3, v4

    .line 85
    const/4 v1, 0x0

    .line 86
    goto :goto_2

    .line 87
    :cond_4
    const/16 v9, 0x2e

    .line 88
    .line 89
    if-ne v1, v9, :cond_7

    .line 90
    .line 91
    add-int/lit8 v3, v3, 0x2

    .line 92
    .line 93
    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    if-lt v1, v13, :cond_6

    .line 98
    .line 99
    if-gt v1, v14, :cond_6

    .line 100
    .line 101
    mul-long v10, v10, v18

    .line 102
    .line 103
    sub-int/2addr v1, v13

    .line 104
    const/4 v9, 0x1

    .line 105
    int-to-long v5, v1

    .line 106
    add-long/2addr v10, v5

    .line 107
    move-wide/from16 v4, v18

    .line 108
    .line 109
    :goto_3
    add-int/lit8 v1, v3, 0x1

    .line 110
    .line 111
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 112
    .line 113
    .line 114
    move-result v3

    .line 115
    if-lt v3, v13, :cond_5

    .line 116
    .line 117
    if-gt v3, v14, :cond_5

    .line 118
    .line 119
    mul-long v10, v10, v18

    .line 120
    .line 121
    add-int/lit8 v3, v3, -0x30

    .line 122
    .line 123
    move v6, v9

    .line 124
    move-wide/from16 v20, v10

    .line 125
    .line 126
    int-to-long v9, v3

    .line 127
    add-long v10, v20, v9

    .line 128
    .line 129
    mul-long v4, v4, v18

    .line 130
    .line 131
    move v3, v1

    .line 132
    move v9, v6

    .line 133
    goto :goto_3

    .line 134
    :cond_5
    move v6, v9

    .line 135
    move-wide/from16 v22, v4

    .line 136
    .line 137
    move v4, v1

    .line 138
    move v1, v3

    .line 139
    move v3, v6

    .line 140
    move v5, v7

    .line 141
    move-wide v6, v10

    .line 142
    move-wide/from16 v9, v22

    .line 143
    .line 144
    goto :goto_4

    .line 145
    :cond_6
    iput v12, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 146
    .line 147
    return-wide v15

    .line 148
    :cond_7
    const/4 v6, 0x1

    .line 149
    const-wide/16 v18, 0x1

    .line 150
    .line 151
    move v3, v6

    .line 152
    move v5, v7

    .line 153
    move-wide v6, v10

    .line 154
    move-wide/from16 v9, v18

    .line 155
    .line 156
    :goto_4
    const/16 v11, 0x65

    .line 157
    .line 158
    if-eq v1, v11, :cond_9

    .line 159
    .line 160
    const/16 v11, 0x45

    .line 161
    .line 162
    if-ne v1, v11, :cond_8

    .line 163
    .line 164
    goto :goto_5

    .line 165
    :cond_8
    const/16 v17, 0x0

    .line 166
    .line 167
    goto :goto_6

    .line 168
    :cond_9
    :goto_5
    move/from16 v17, v3

    .line 169
    .line 170
    :goto_6
    if-eqz v17, :cond_c

    .line 171
    .line 172
    add-int/lit8 v1, v4, 0x1

    .line 173
    .line 174
    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 175
    .line 176
    .line 177
    move-result v11

    .line 178
    move/from16 v18, v3

    .line 179
    .line 180
    const/16 v3, 0x2b

    .line 181
    .line 182
    if-eq v11, v3, :cond_b

    .line 183
    .line 184
    if-ne v11, v2, :cond_a

    .line 185
    .line 186
    goto :goto_7

    .line 187
    :cond_a
    move v4, v1

    .line 188
    move v1, v11

    .line 189
    goto :goto_8

    .line 190
    :cond_b
    :goto_7
    add-int/lit8 v4, v4, 0x2

    .line 191
    .line 192
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 193
    .line 194
    .line 195
    move-result v1

    .line 196
    :goto_8
    if-lt v1, v13, :cond_d

    .line 197
    .line 198
    if-gt v1, v14, :cond_d

    .line 199
    .line 200
    add-int/lit8 v1, v4, 0x1

    .line 201
    .line 202
    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 203
    .line 204
    .line 205
    move-result v2

    .line 206
    move v4, v1

    .line 207
    move v1, v2

    .line 208
    goto :goto_8

    .line 209
    :cond_c
    move/from16 v18, v3

    .line 210
    .line 211
    :cond_d
    if-eqz v5, :cond_f

    .line 212
    .line 213
    const/16 v2, 0x22

    .line 214
    .line 215
    if-eq v1, v2, :cond_e

    .line 216
    .line 217
    iput v12, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 218
    .line 219
    return-wide v15

    .line 220
    :cond_e
    add-int/lit8 v1, v4, 0x1

    .line 221
    .line 222
    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 223
    .line 224
    .line 225
    move-result v2

    .line 226
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 227
    .line 228
    add-int/lit8 v3, v3, 0x1

    .line 229
    .line 230
    sub-int v4, v1, v3

    .line 231
    .line 232
    add-int/lit8 v4, v4, -0x2

    .line 233
    .line 234
    move/from16 v22, v2

    .line 235
    .line 236
    move v2, v1

    .line 237
    move/from16 v1, v22

    .line 238
    .line 239
    goto :goto_9

    .line 240
    :cond_f
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 241
    .line 242
    sub-int v2, v4, v3

    .line 243
    .line 244
    add-int/lit8 v2, v2, -0x1

    .line 245
    .line 246
    move/from16 v22, v4

    .line 247
    .line 248
    move v4, v2

    .line 249
    move/from16 v2, v22

    .line 250
    .line 251
    :goto_9
    if-nez v17, :cond_11

    .line 252
    .line 253
    const/16 v5, 0x12

    .line 254
    .line 255
    if-ge v4, v5, :cond_11

    .line 256
    .line 257
    long-to-double v3, v6

    .line 258
    long-to-double v5, v9

    .line 259
    div-double/2addr v3, v5

    .line 260
    if-eqz v8, :cond_10

    .line 261
    .line 262
    neg-double v3, v3

    .line 263
    :cond_10
    :goto_a
    move/from16 v5, p1

    .line 264
    .line 265
    goto :goto_b

    .line 266
    :cond_11
    invoke-virtual {v0, v3, v4}, Lcom/alibaba/fastjson/parser/JSONScanner;->subString(II)Ljava/lang/String;

    .line 267
    .line 268
    .line 269
    move-result-object v3

    .line 270
    invoke-static {v3}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    .line 271
    .line 272
    .line 273
    move-result-wide v3

    .line 274
    goto :goto_a

    .line 275
    :goto_b
    if-ne v1, v5, :cond_12

    .line 276
    .line 277
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 278
    .line 279
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 280
    .line 281
    .line 282
    move-result v1

    .line 283
    iput-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 284
    .line 285
    const/4 v1, 0x3

    .line 286
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 287
    .line 288
    const/16 v1, 0x10

    .line 289
    .line 290
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 291
    .line 292
    return-wide v3

    .line 293
    :cond_12
    iput v12, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 294
    .line 295
    return-wide v3

    .line 296
    :cond_13
    move v5, v7

    .line 297
    const-wide/16 v15, 0x0

    .line 298
    .line 299
    const/16 v1, 0x6e

    .line 300
    .line 301
    if-ne v4, v1, :cond_18

    .line 302
    .line 303
    add-int/lit8 v1, v3, 0x1

    .line 304
    .line 305
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 306
    .line 307
    .line 308
    move-result v2

    .line 309
    const/16 v4, 0x75

    .line 310
    .line 311
    if-ne v2, v4, :cond_18

    .line 312
    .line 313
    add-int/lit8 v2, v3, 0x2

    .line 314
    .line 315
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 316
    .line 317
    .line 318
    move-result v1

    .line 319
    const/16 v4, 0x6c

    .line 320
    .line 321
    if-ne v1, v4, :cond_18

    .line 322
    .line 323
    add-int/lit8 v1, v3, 0x3

    .line 324
    .line 325
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 326
    .line 327
    .line 328
    move-result v2

    .line 329
    if-ne v2, v4, :cond_18

    .line 330
    .line 331
    const/4 v2, 0x5

    .line 332
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 333
    .line 334
    add-int/lit8 v4, v3, 0x4

    .line 335
    .line 336
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 337
    .line 338
    .line 339
    move-result v1

    .line 340
    if-eqz v5, :cond_14

    .line 341
    .line 342
    const/16 v5, 0x22

    .line 343
    .line 344
    if-ne v1, v5, :cond_14

    .line 345
    .line 346
    add-int/2addr v3, v2

    .line 347
    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 348
    .line 349
    .line 350
    move-result v1

    .line 351
    move v4, v3

    .line 352
    :cond_14
    :goto_c
    const/16 v3, 0x2c

    .line 353
    .line 354
    if-ne v1, v3, :cond_15

    .line 355
    .line 356
    iput v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 357
    .line 358
    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 359
    .line 360
    .line 361
    move-result v1

    .line 362
    iput-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 363
    .line 364
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 365
    .line 366
    const/16 v3, 0x10

    .line 367
    .line 368
    iput v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 369
    .line 370
    return-wide v15

    .line 371
    :cond_15
    const/16 v3, 0x10

    .line 372
    .line 373
    const/16 v5, 0x5d

    .line 374
    .line 375
    if-ne v1, v5, :cond_16

    .line 376
    .line 377
    iput v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 378
    .line 379
    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 380
    .line 381
    .line 382
    move-result v1

    .line 383
    iput-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 384
    .line 385
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 386
    .line 387
    const/16 v1, 0xf

    .line 388
    .line 389
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 390
    .line 391
    return-wide v15

    .line 392
    :cond_16
    invoke-static {v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isWhitespace(C)Z

    .line 393
    .line 394
    .line 395
    move-result v1

    .line 396
    if-eqz v1, :cond_17

    .line 397
    .line 398
    add-int/lit8 v1, v4, 0x1

    .line 399
    .line 400
    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 401
    .line 402
    .line 403
    move-result v4

    .line 404
    move/from16 v22, v4

    .line 405
    .line 406
    move v4, v1

    .line 407
    move/from16 v1, v22

    .line 408
    .line 409
    goto :goto_c

    .line 410
    :cond_17
    iput v12, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 411
    .line 412
    return-wide v15

    .line 413
    :cond_18
    iput v12, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 414
    .line 415
    return-wide v15
.end method

.method public scanFieldBoolean([C)Z
    .locals 11

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 3
    .line 4
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 5
    .line 6
    iget v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 7
    .line 8
    invoke-static {v1, v2, p1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charArrayCompare(Ljava/lang/String;I[C)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    const/4 p1, -0x2

    .line 15
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 16
    .line 17
    return v0

    .line 18
    :cond_0
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 19
    .line 20
    array-length p1, p1

    .line 21
    add-int/2addr p1, v1

    .line 22
    add-int/lit8 v2, p1, 0x1

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    const/16 v4, 0x22

    .line 29
    .line 30
    const/4 v5, 0x1

    .line 31
    if-ne v3, v4, :cond_1

    .line 32
    .line 33
    move v6, v5

    .line 34
    goto :goto_0

    .line 35
    :cond_1
    move v6, v0

    .line 36
    :goto_0
    if-eqz v6, :cond_2

    .line 37
    .line 38
    add-int/lit8 p1, p1, 0x2

    .line 39
    .line 40
    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    move v2, p1

    .line 45
    :cond_2
    const/16 p1, 0x74

    .line 46
    .line 47
    const/16 v7, 0x65

    .line 48
    .line 49
    const/4 v8, 0x4

    .line 50
    const/4 v9, -0x1

    .line 51
    if-ne v3, p1, :cond_8

    .line 52
    .line 53
    add-int/lit8 p1, v2, 0x1

    .line 54
    .line 55
    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    const/16 v10, 0x72

    .line 60
    .line 61
    if-eq v3, v10, :cond_3

    .line 62
    .line 63
    iput v9, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 64
    .line 65
    return v0

    .line 66
    :cond_3
    add-int/lit8 v3, v2, 0x2

    .line 67
    .line 68
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    const/16 v10, 0x75

    .line 73
    .line 74
    if-eq p1, v10, :cond_4

    .line 75
    .line 76
    iput v9, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 77
    .line 78
    return v0

    .line 79
    :cond_4
    add-int/lit8 p1, v2, 0x3

    .line 80
    .line 81
    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 82
    .line 83
    .line 84
    move-result v3

    .line 85
    if-eq v3, v7, :cond_5

    .line 86
    .line 87
    iput v9, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 88
    .line 89
    return v0

    .line 90
    :cond_5
    if-eqz v6, :cond_7

    .line 91
    .line 92
    add-int/2addr v2, v8

    .line 93
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    if-eq p1, v4, :cond_6

    .line 98
    .line 99
    iput v9, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 100
    .line 101
    return v0

    .line 102
    :cond_6
    move p1, v2

    .line 103
    :cond_7
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 104
    .line 105
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 106
    .line 107
    .line 108
    move-result p1

    .line 109
    :goto_1
    move v2, v5

    .line 110
    goto/16 :goto_3

    .line 111
    .line 112
    :cond_8
    const/16 p1, 0x66

    .line 113
    .line 114
    if-ne v3, p1, :cond_f

    .line 115
    .line 116
    add-int/lit8 p1, v2, 0x1

    .line 117
    .line 118
    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 119
    .line 120
    .line 121
    move-result v3

    .line 122
    const/16 v10, 0x61

    .line 123
    .line 124
    if-eq v3, v10, :cond_9

    .line 125
    .line 126
    iput v9, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 127
    .line 128
    return v0

    .line 129
    :cond_9
    add-int/lit8 v3, v2, 0x2

    .line 130
    .line 131
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 132
    .line 133
    .line 134
    move-result p1

    .line 135
    const/16 v10, 0x6c

    .line 136
    .line 137
    if-eq p1, v10, :cond_a

    .line 138
    .line 139
    iput v9, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 140
    .line 141
    return v0

    .line 142
    :cond_a
    add-int/lit8 p1, v2, 0x3

    .line 143
    .line 144
    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 145
    .line 146
    .line 147
    move-result v3

    .line 148
    const/16 v10, 0x73

    .line 149
    .line 150
    if-eq v3, v10, :cond_b

    .line 151
    .line 152
    iput v9, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 153
    .line 154
    return v0

    .line 155
    :cond_b
    add-int/lit8 v3, v2, 0x4

    .line 156
    .line 157
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 158
    .line 159
    .line 160
    move-result p1

    .line 161
    if-eq p1, v7, :cond_c

    .line 162
    .line 163
    iput v9, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 164
    .line 165
    return v0

    .line 166
    :cond_c
    if-eqz v6, :cond_e

    .line 167
    .line 168
    add-int/lit8 v2, v2, 0x5

    .line 169
    .line 170
    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 171
    .line 172
    .line 173
    move-result p1

    .line 174
    if-eq p1, v4, :cond_d

    .line 175
    .line 176
    iput v9, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 177
    .line 178
    return v0

    .line 179
    :cond_d
    move v3, v2

    .line 180
    :cond_e
    iput v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 181
    .line 182
    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 183
    .line 184
    .line 185
    move-result p1

    .line 186
    :goto_2
    move v2, v0

    .line 187
    goto :goto_3

    .line 188
    :cond_f
    const/16 p1, 0x31

    .line 189
    .line 190
    if-ne v3, p1, :cond_12

    .line 191
    .line 192
    if-eqz v6, :cond_11

    .line 193
    .line 194
    add-int/lit8 p1, v2, 0x1

    .line 195
    .line 196
    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 197
    .line 198
    .line 199
    move-result v2

    .line 200
    if-eq v2, v4, :cond_10

    .line 201
    .line 202
    iput v9, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 203
    .line 204
    return v0

    .line 205
    :cond_10
    move v2, p1

    .line 206
    :cond_11
    iput v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 207
    .line 208
    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 209
    .line 210
    .line 211
    move-result p1

    .line 212
    goto :goto_1

    .line 213
    :cond_12
    const/16 p1, 0x30

    .line 214
    .line 215
    if-ne v3, p1, :cond_1d

    .line 216
    .line 217
    if-eqz v6, :cond_14

    .line 218
    .line 219
    add-int/lit8 p1, v2, 0x1

    .line 220
    .line 221
    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 222
    .line 223
    .line 224
    move-result v2

    .line 225
    if-eq v2, v4, :cond_13

    .line 226
    .line 227
    iput v9, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 228
    .line 229
    return v0

    .line 230
    :cond_13
    move v2, p1

    .line 231
    :cond_14
    iput v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 232
    .line 233
    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 234
    .line 235
    .line 236
    move-result p1

    .line 237
    goto :goto_2

    .line 238
    :goto_3
    const/16 v3, 0x10

    .line 239
    .line 240
    const/16 v4, 0x2c

    .line 241
    .line 242
    if-ne p1, v4, :cond_15

    .line 243
    .line 244
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 245
    .line 246
    add-int/2addr p1, v5

    .line 247
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 248
    .line 249
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 250
    .line 251
    .line 252
    move-result p1

    .line 253
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 254
    .line 255
    const/4 p1, 0x3

    .line 256
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 257
    .line 258
    iput v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 259
    .line 260
    return v2

    .line 261
    :cond_15
    const/16 v6, 0x7d

    .line 262
    .line 263
    if-ne p1, v6, :cond_1b

    .line 264
    .line 265
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 266
    .line 267
    add-int/2addr p1, v5

    .line 268
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 269
    .line 270
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 271
    .line 272
    .line 273
    move-result p1

    .line 274
    :goto_4
    if-ne p1, v4, :cond_16

    .line 275
    .line 276
    iput v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 277
    .line 278
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 279
    .line 280
    add-int/2addr p1, v5

    .line 281
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 282
    .line 283
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 284
    .line 285
    .line 286
    move-result p1

    .line 287
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 288
    .line 289
    goto :goto_5

    .line 290
    :cond_16
    const/16 v1, 0x5d

    .line 291
    .line 292
    if-ne p1, v1, :cond_17

    .line 293
    .line 294
    const/16 p1, 0xf

    .line 295
    .line 296
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 297
    .line 298
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 299
    .line 300
    add-int/2addr p1, v5

    .line 301
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 302
    .line 303
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 304
    .line 305
    .line 306
    move-result p1

    .line 307
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 308
    .line 309
    goto :goto_5

    .line 310
    :cond_17
    if-ne p1, v6, :cond_18

    .line 311
    .line 312
    const/16 p1, 0xd

    .line 313
    .line 314
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 315
    .line 316
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 317
    .line 318
    add-int/2addr p1, v5

    .line 319
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 320
    .line 321
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 322
    .line 323
    .line 324
    move-result p1

    .line 325
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 326
    .line 327
    goto :goto_5

    .line 328
    :cond_18
    const/16 v1, 0x1a

    .line 329
    .line 330
    if-ne p1, v1, :cond_19

    .line 331
    .line 332
    const/16 p1, 0x14

    .line 333
    .line 334
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 335
    .line 336
    :goto_5
    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 337
    .line 338
    return v2

    .line 339
    :cond_19
    invoke-static {p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isWhitespace(C)Z

    .line 340
    .line 341
    .line 342
    move-result p1

    .line 343
    if-eqz p1, :cond_1a

    .line 344
    .line 345
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 346
    .line 347
    add-int/2addr p1, v5

    .line 348
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 349
    .line 350
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 351
    .line 352
    .line 353
    move-result p1

    .line 354
    goto :goto_4

    .line 355
    :cond_1a
    iput v9, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 356
    .line 357
    return v0

    .line 358
    :cond_1b
    invoke-static {p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isWhitespace(C)Z

    .line 359
    .line 360
    .line 361
    move-result p1

    .line 362
    if-eqz p1, :cond_1c

    .line 363
    .line 364
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 365
    .line 366
    add-int/2addr p1, v5

    .line 367
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 368
    .line 369
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 370
    .line 371
    .line 372
    move-result p1

    .line 373
    goto/16 :goto_3

    .line 374
    .line 375
    :cond_1c
    iput v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 376
    .line 377
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 378
    .line 379
    .line 380
    iput v9, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 381
    .line 382
    return v0

    .line 383
    :cond_1d
    iput v9, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 384
    .line 385
    return v0
.end method

.method public scanFieldDate([C)Ljava/util/Date;
    .locals 21

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 7
    .line 8
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 9
    .line 10
    iget-char v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 11
    .line 12
    iget-object v5, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {v5, v3, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charArrayCompare(Ljava/lang/String;I[C)Z

    .line 15
    .line 16
    .line 17
    move-result v5

    .line 18
    const/4 v6, 0x0

    .line 19
    if-nez v5, :cond_0

    .line 20
    .line 21
    const/4 v1, -0x2

    .line 22
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 23
    .line 24
    return-object v6

    .line 25
    :cond_0
    iget v5, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 26
    .line 27
    array-length v1, v1

    .line 28
    add-int/2addr v5, v1

    .line 29
    add-int/lit8 v1, v5, 0x1

    .line 30
    .line 31
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 32
    .line 33
    .line 34
    move-result v7

    .line 35
    const/16 v8, 0x22

    .line 36
    .line 37
    const/16 v9, 0x7d

    .line 38
    .line 39
    const/16 v10, 0x2c

    .line 40
    .line 41
    const/4 v11, -0x1

    .line 42
    const/4 v12, 0x1

    .line 43
    if-ne v7, v8, :cond_6

    .line 44
    .line 45
    invoke-virtual {v0, v8, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->indexOf(CI)I

    .line 46
    .line 47
    .line 48
    move-result v5

    .line 49
    if-eq v5, v11, :cond_5

    .line 50
    .line 51
    sub-int v7, v5, v1

    .line 52
    .line 53
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 54
    .line 55
    invoke-direct {v0, v2, v7}, Lcom/alibaba/fastjson/parser/JSONScanner;->scanISO8601DateIfMatch(ZI)Z

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    if-eqz v1, :cond_4

    .line 60
    .line 61
    iget-object v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->calendar:Ljava/util/Calendar;

    .line 62
    .line 63
    invoke-virtual {v1}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    add-int/lit8 v2, v5, 0x1

    .line 68
    .line 69
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    iput v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 74
    .line 75
    :goto_0
    if-eq v2, v10, :cond_3

    .line 76
    .line 77
    if-ne v2, v9, :cond_1

    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_1
    invoke-static {v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isWhitespace(C)Z

    .line 81
    .line 82
    .line 83
    move-result v2

    .line 84
    if-eqz v2, :cond_2

    .line 85
    .line 86
    add-int/lit8 v2, v5, 0x1

    .line 87
    .line 88
    add-int/lit8 v5, v5, 0x2

    .line 89
    .line 90
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 91
    .line 92
    .line 93
    move-result v5

    .line 94
    move/from16 v20, v5

    .line 95
    .line 96
    move v5, v2

    .line 97
    move/from16 v2, v20

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_2
    iput v11, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 101
    .line 102
    return-object v6

    .line 103
    :cond_3
    :goto_1
    add-int/2addr v5, v12

    .line 104
    iput v5, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 105
    .line 106
    iput-char v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 107
    .line 108
    move-object/from16 v17, v6

    .line 109
    .line 110
    move/from16 p1, v12

    .line 111
    .line 112
    goto/16 :goto_5

    .line 113
    .line 114
    :cond_4
    iput v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 115
    .line 116
    iput v11, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 117
    .line 118
    return-object v6

    .line 119
    :cond_5
    const-string v0, "unclosed str"

    .line 120
    .line 121
    invoke-static {v0}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    const/4 v0, 0x0

    .line 125
    return-object v0

    .line 126
    :cond_6
    const/16 v8, 0x2d

    .line 127
    .line 128
    const/16 v13, 0x39

    .line 129
    .line 130
    const/16 v14, 0x30

    .line 131
    .line 132
    if-eq v7, v8, :cond_8

    .line 133
    .line 134
    if-lt v7, v14, :cond_7

    .line 135
    .line 136
    if-gt v7, v13, :cond_7

    .line 137
    .line 138
    goto :goto_2

    .line 139
    :cond_7
    iput v11, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 140
    .line 141
    return-object v6

    .line 142
    :cond_8
    :goto_2
    if-ne v7, v8, :cond_9

    .line 143
    .line 144
    add-int/lit8 v5, v5, 0x2

    .line 145
    .line 146
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 147
    .line 148
    .line 149
    move-result v7

    .line 150
    move v1, v5

    .line 151
    move v2, v12

    .line 152
    :cond_9
    const-wide/16 v15, 0x0

    .line 153
    .line 154
    if-lt v7, v14, :cond_c

    .line 155
    .line 156
    if-gt v7, v13, :cond_c

    .line 157
    .line 158
    add-int/lit8 v7, v7, -0x30

    .line 159
    .line 160
    int-to-long v7, v7

    .line 161
    :goto_3
    add-int/lit8 v5, v1, 0x1

    .line 162
    .line 163
    move-object/from16 v17, v6

    .line 164
    .line 165
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 166
    .line 167
    .line 168
    move-result v6

    .line 169
    if-lt v6, v14, :cond_a

    .line 170
    .line 171
    if-gt v6, v13, :cond_a

    .line 172
    .line 173
    const-wide/16 v18, 0xa

    .line 174
    .line 175
    mul-long v7, v7, v18

    .line 176
    .line 177
    add-int/lit8 v6, v6, -0x30

    .line 178
    .line 179
    move/from16 p1, v12

    .line 180
    .line 181
    int-to-long v12, v6

    .line 182
    add-long/2addr v7, v12

    .line 183
    move/from16 v12, p1

    .line 184
    .line 185
    move v1, v5

    .line 186
    move-object/from16 v6, v17

    .line 187
    .line 188
    const/16 v13, 0x39

    .line 189
    .line 190
    goto :goto_3

    .line 191
    :cond_a
    move/from16 p1, v12

    .line 192
    .line 193
    if-eq v6, v10, :cond_b

    .line 194
    .line 195
    if-ne v6, v9, :cond_d

    .line 196
    .line 197
    :cond_b
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 198
    .line 199
    goto :goto_4

    .line 200
    :cond_c
    move-object/from16 v17, v6

    .line 201
    .line 202
    move/from16 p1, v12

    .line 203
    .line 204
    move v6, v7

    .line 205
    move-wide v7, v15

    .line 206
    :cond_d
    :goto_4
    cmp-long v1, v7, v15

    .line 207
    .line 208
    if-gez v1, :cond_e

    .line 209
    .line 210
    iput v11, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 211
    .line 212
    return-object v17

    .line 213
    :cond_e
    if-eqz v2, :cond_f

    .line 214
    .line 215
    neg-long v7, v7

    .line 216
    :cond_f
    new-instance v1, Ljava/util/Date;

    .line 217
    .line 218
    invoke-direct {v1, v7, v8}, Ljava/util/Date;-><init>(J)V

    .line 219
    .line 220
    .line 221
    move v2, v6

    .line 222
    :goto_5
    iget v5, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 223
    .line 224
    const/16 v6, 0x10

    .line 225
    .line 226
    if-ne v2, v10, :cond_10

    .line 227
    .line 228
    add-int/lit8 v5, v5, 0x1

    .line 229
    .line 230
    iput v5, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 231
    .line 232
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 233
    .line 234
    .line 235
    move-result v2

    .line 236
    iput-char v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 237
    .line 238
    const/4 v2, 0x3

    .line 239
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 240
    .line 241
    iput v6, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 242
    .line 243
    return-object v1

    .line 244
    :cond_10
    add-int/lit8 v5, v5, 0x1

    .line 245
    .line 246
    iput v5, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 247
    .line 248
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 249
    .line 250
    .line 251
    move-result v2

    .line 252
    if-ne v2, v10, :cond_11

    .line 253
    .line 254
    iput v6, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 255
    .line 256
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 257
    .line 258
    add-int/lit8 v2, v2, 0x1

    .line 259
    .line 260
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 261
    .line 262
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 263
    .line 264
    .line 265
    move-result v2

    .line 266
    iput-char v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 267
    .line 268
    goto :goto_6

    .line 269
    :cond_11
    const/16 v5, 0x5d

    .line 270
    .line 271
    if-ne v2, v5, :cond_12

    .line 272
    .line 273
    const/16 v2, 0xf

    .line 274
    .line 275
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 276
    .line 277
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 278
    .line 279
    add-int/lit8 v2, v2, 0x1

    .line 280
    .line 281
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 282
    .line 283
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 284
    .line 285
    .line 286
    move-result v2

    .line 287
    iput-char v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 288
    .line 289
    goto :goto_6

    .line 290
    :cond_12
    if-ne v2, v9, :cond_13

    .line 291
    .line 292
    const/16 v2, 0xd

    .line 293
    .line 294
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 295
    .line 296
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 297
    .line 298
    add-int/lit8 v2, v2, 0x1

    .line 299
    .line 300
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 301
    .line 302
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 303
    .line 304
    .line 305
    move-result v2

    .line 306
    iput-char v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 307
    .line 308
    goto :goto_6

    .line 309
    :cond_13
    const/16 v5, 0x1a

    .line 310
    .line 311
    if-ne v2, v5, :cond_14

    .line 312
    .line 313
    const/16 v2, 0x14

    .line 314
    .line 315
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 316
    .line 317
    :goto_6
    const/4 v2, 0x4

    .line 318
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 319
    .line 320
    return-object v1

    .line 321
    :cond_14
    iput v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 322
    .line 323
    iput-char v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 324
    .line 325
    iput v11, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 326
    .line 327
    return-object v17
.end method

.method public scanFieldInt([C)I
    .locals 14

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 3
    .line 4
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 5
    .line 6
    iget-char v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 7
    .line 8
    iget-object v3, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v3, v1, p1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charArrayCompare(Ljava/lang/String;I[C)Z

    .line 11
    .line 12
    .line 13
    move-result v3

    .line 14
    if-nez v3, :cond_0

    .line 15
    .line 16
    const/4 p1, -0x2

    .line 17
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 18
    .line 19
    return v0

    .line 20
    :cond_0
    iget v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 21
    .line 22
    array-length p1, p1

    .line 23
    add-int/2addr v3, p1

    .line 24
    add-int/lit8 p1, v3, 0x1

    .line 25
    .line 26
    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 27
    .line 28
    .line 29
    move-result v4

    .line 30
    const/16 v5, 0x22

    .line 31
    .line 32
    const/4 v6, 0x1

    .line 33
    if-ne v4, v5, :cond_1

    .line 34
    .line 35
    move v7, v6

    .line 36
    goto :goto_0

    .line 37
    :cond_1
    move v7, v0

    .line 38
    :goto_0
    if-eqz v7, :cond_2

    .line 39
    .line 40
    add-int/lit8 v3, v3, 0x2

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 43
    .line 44
    .line 45
    move-result v4

    .line 46
    move p1, v3

    .line 47
    :cond_2
    const/16 v3, 0x2d

    .line 48
    .line 49
    if-ne v4, v3, :cond_3

    .line 50
    .line 51
    move v3, v6

    .line 52
    goto :goto_1

    .line 53
    :cond_3
    move v3, v0

    .line 54
    :goto_1
    if-eqz v3, :cond_4

    .line 55
    .line 56
    add-int/lit8 v4, p1, 0x1

    .line 57
    .line 58
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    move v13, v4

    .line 63
    move v4, p1

    .line 64
    move p1, v13

    .line 65
    :cond_4
    const/16 v8, 0x30

    .line 66
    .line 67
    const/4 v9, -0x1

    .line 68
    if-lt v4, v8, :cond_16

    .line 69
    .line 70
    const/16 v10, 0x39

    .line 71
    .line 72
    if-gt v4, v10, :cond_16

    .line 73
    .line 74
    sub-int/2addr v4, v8

    .line 75
    :goto_2
    add-int/lit8 v11, p1, 0x1

    .line 76
    .line 77
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 78
    .line 79
    .line 80
    move-result v12

    .line 81
    if-lt v12, v8, :cond_6

    .line 82
    .line 83
    if-gt v12, v10, :cond_6

    .line 84
    .line 85
    mul-int/lit8 p1, v4, 0xa

    .line 86
    .line 87
    if-ge p1, v4, :cond_5

    .line 88
    .line 89
    iput v9, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 90
    .line 91
    return v0

    .line 92
    :cond_5
    add-int/lit8 v12, v12, -0x30

    .line 93
    .line 94
    add-int v4, p1, v12

    .line 95
    .line 96
    move p1, v11

    .line 97
    goto :goto_2

    .line 98
    :cond_6
    const/16 v8, 0x2e

    .line 99
    .line 100
    if-ne v12, v8, :cond_7

    .line 101
    .line 102
    iput v9, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 103
    .line 104
    return v0

    .line 105
    :cond_7
    if-gez v4, :cond_8

    .line 106
    .line 107
    iput v9, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 108
    .line 109
    return v0

    .line 110
    :cond_8
    if-eqz v7, :cond_a

    .line 111
    .line 112
    if-eq v12, v5, :cond_9

    .line 113
    .line 114
    iput v9, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 115
    .line 116
    return v0

    .line 117
    :cond_9
    add-int/lit8 p1, p1, 0x2

    .line 118
    .line 119
    invoke-virtual {p0, v11}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 120
    .line 121
    .line 122
    move-result v12

    .line 123
    :goto_3
    move v11, p1

    .line 124
    :cond_a
    const/16 p1, 0x7d

    .line 125
    .line 126
    const/16 v5, 0x2c

    .line 127
    .line 128
    if-eq v12, v5, :cond_d

    .line 129
    .line 130
    if-ne v12, p1, :cond_b

    .line 131
    .line 132
    goto :goto_4

    .line 133
    :cond_b
    invoke-static {v12}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isWhitespace(C)Z

    .line 134
    .line 135
    .line 136
    move-result p1

    .line 137
    if-eqz p1, :cond_c

    .line 138
    .line 139
    add-int/lit8 p1, v11, 0x1

    .line 140
    .line 141
    invoke-virtual {p0, v11}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 142
    .line 143
    .line 144
    move-result v12

    .line 145
    goto :goto_3

    .line 146
    :cond_c
    iput v9, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 147
    .line 148
    return v0

    .line 149
    :cond_d
    :goto_4
    add-int/lit8 v7, v11, -0x1

    .line 150
    .line 151
    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 152
    .line 153
    const/16 v7, 0x10

    .line 154
    .line 155
    if-ne v12, v5, :cond_e

    .line 156
    .line 157
    iput v11, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 158
    .line 159
    invoke-virtual {p0, v11}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 160
    .line 161
    .line 162
    move-result p1

    .line 163
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 164
    .line 165
    const/4 p1, 0x3

    .line 166
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 167
    .line 168
    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 169
    .line 170
    if-eqz v3, :cond_15

    .line 171
    .line 172
    neg-int p0, v4

    .line 173
    return p0

    .line 174
    :cond_e
    if-ne v12, p1, :cond_14

    .line 175
    .line 176
    iput v11, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 177
    .line 178
    invoke-virtual {p0, v11}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 179
    .line 180
    .line 181
    move-result v8

    .line 182
    :goto_5
    if-ne v8, v5, :cond_f

    .line 183
    .line 184
    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 185
    .line 186
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 187
    .line 188
    add-int/2addr p1, v6

    .line 189
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 190
    .line 191
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 192
    .line 193
    .line 194
    move-result p1

    .line 195
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 196
    .line 197
    goto :goto_6

    .line 198
    :cond_f
    const/16 v10, 0x5d

    .line 199
    .line 200
    if-ne v8, v10, :cond_10

    .line 201
    .line 202
    const/16 p1, 0xf

    .line 203
    .line 204
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 205
    .line 206
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 207
    .line 208
    add-int/2addr p1, v6

    .line 209
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 210
    .line 211
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 212
    .line 213
    .line 214
    move-result p1

    .line 215
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 216
    .line 217
    goto :goto_6

    .line 218
    :cond_10
    if-ne v8, p1, :cond_11

    .line 219
    .line 220
    const/16 p1, 0xd

    .line 221
    .line 222
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 223
    .line 224
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 225
    .line 226
    add-int/2addr p1, v6

    .line 227
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 228
    .line 229
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 230
    .line 231
    .line 232
    move-result p1

    .line 233
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 234
    .line 235
    goto :goto_6

    .line 236
    :cond_11
    const/16 v10, 0x1a

    .line 237
    .line 238
    if-ne v8, v10, :cond_12

    .line 239
    .line 240
    const/16 p1, 0x14

    .line 241
    .line 242
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 243
    .line 244
    :goto_6
    const/4 p1, 0x4

    .line 245
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 246
    .line 247
    goto :goto_7

    .line 248
    :cond_12
    invoke-static {v8}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isWhitespace(C)Z

    .line 249
    .line 250
    .line 251
    move-result v8

    .line 252
    if-eqz v8, :cond_13

    .line 253
    .line 254
    iget v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 255
    .line 256
    add-int/2addr v8, v6

    .line 257
    iput v8, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 258
    .line 259
    invoke-virtual {p0, v8}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 260
    .line 261
    .line 262
    move-result v8

    .line 263
    goto :goto_5

    .line 264
    :cond_13
    iput v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 265
    .line 266
    iput-char v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 267
    .line 268
    iput v9, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 269
    .line 270
    return v0

    .line 271
    :cond_14
    :goto_7
    if-eqz v3, :cond_15

    .line 272
    .line 273
    neg-int p0, v4

    .line 274
    return p0

    .line 275
    :cond_15
    return v4

    .line 276
    :cond_16
    iput v9, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 277
    .line 278
    return v0
.end method

.method public scanFieldLong([C)J
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 7
    .line 8
    iget v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 9
    .line 10
    iget-char v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 11
    .line 12
    iget-object v5, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {v5, v3, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charArrayCompare(Ljava/lang/String;I[C)Z

    .line 15
    .line 16
    .line 17
    move-result v5

    .line 18
    const-wide/16 v6, 0x0

    .line 19
    .line 20
    if-nez v5, :cond_0

    .line 21
    .line 22
    const/4 v1, -0x2

    .line 23
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 24
    .line 25
    return-wide v6

    .line 26
    :cond_0
    iget v5, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 27
    .line 28
    array-length v1, v1

    .line 29
    add-int/2addr v5, v1

    .line 30
    add-int/lit8 v1, v5, 0x1

    .line 31
    .line 32
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 33
    .line 34
    .line 35
    move-result v8

    .line 36
    const/16 v9, 0x22

    .line 37
    .line 38
    const/4 v10, 0x1

    .line 39
    if-ne v8, v9, :cond_1

    .line 40
    .line 41
    move v11, v10

    .line 42
    goto :goto_0

    .line 43
    :cond_1
    move v11, v2

    .line 44
    :goto_0
    if-eqz v11, :cond_2

    .line 45
    .line 46
    add-int/lit8 v5, v5, 0x2

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 49
    .line 50
    .line 51
    move-result v8

    .line 52
    move v1, v5

    .line 53
    :cond_2
    const/16 v5, 0x2d

    .line 54
    .line 55
    if-ne v8, v5, :cond_3

    .line 56
    .line 57
    add-int/lit8 v2, v1, 0x1

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 60
    .line 61
    .line 62
    move-result v8

    .line 63
    move v1, v2

    .line 64
    move v2, v10

    .line 65
    :cond_3
    const/16 v5, 0x30

    .line 66
    .line 67
    const/4 v12, -0x1

    .line 68
    if-lt v8, v5, :cond_15

    .line 69
    .line 70
    const/16 v13, 0x39

    .line 71
    .line 72
    if-gt v8, v13, :cond_15

    .line 73
    .line 74
    sub-int/2addr v8, v5

    .line 75
    int-to-long v14, v8

    .line 76
    :goto_1
    add-int/lit8 v8, v1, 0x1

    .line 77
    .line 78
    move-wide/from16 v16, v6

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 81
    .line 82
    .line 83
    move-result v6

    .line 84
    if-lt v6, v5, :cond_4

    .line 85
    .line 86
    if-gt v6, v13, :cond_4

    .line 87
    .line 88
    const-wide/16 v18, 0xa

    .line 89
    .line 90
    mul-long v14, v14, v18

    .line 91
    .line 92
    add-int/lit8 v6, v6, -0x30

    .line 93
    .line 94
    int-to-long v6, v6

    .line 95
    add-long/2addr v14, v6

    .line 96
    move v1, v8

    .line 97
    move-wide/from16 v6, v16

    .line 98
    .line 99
    goto :goto_1

    .line 100
    :cond_4
    const/16 v5, 0x2e

    .line 101
    .line 102
    if-ne v6, v5, :cond_5

    .line 103
    .line 104
    iput v12, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 105
    .line 106
    return-wide v16

    .line 107
    :cond_5
    if-eqz v11, :cond_7

    .line 108
    .line 109
    if-eq v6, v9, :cond_6

    .line 110
    .line 111
    iput v12, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 112
    .line 113
    return-wide v16

    .line 114
    :cond_6
    add-int/lit8 v1, v1, 0x2

    .line 115
    .line 116
    invoke-virtual {v0, v8}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 117
    .line 118
    .line 119
    move-result v6

    .line 120
    move v8, v1

    .line 121
    :cond_7
    const/16 v1, 0x7d

    .line 122
    .line 123
    const/16 v5, 0x2c

    .line 124
    .line 125
    if-eq v6, v5, :cond_8

    .line 126
    .line 127
    if-ne v6, v1, :cond_9

    .line 128
    .line 129
    :cond_8
    add-int/lit8 v7, v8, -0x1

    .line 130
    .line 131
    iput v7, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 132
    .line 133
    :cond_9
    cmp-long v7, v14, v16

    .line 134
    .line 135
    if-gez v7, :cond_b

    .line 136
    .line 137
    const-wide/high16 v18, -0x8000000000000000L

    .line 138
    .line 139
    cmp-long v7, v14, v18

    .line 140
    .line 141
    if-nez v7, :cond_a

    .line 142
    .line 143
    if-eqz v2, :cond_a

    .line 144
    .line 145
    goto :goto_2

    .line 146
    :cond_a
    iput v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 147
    .line 148
    iput-char v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 149
    .line 150
    iput v12, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 151
    .line 152
    return-wide v16

    .line 153
    :cond_b
    :goto_2
    const/16 v7, 0x10

    .line 154
    .line 155
    if-ne v6, v5, :cond_c

    .line 156
    .line 157
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 158
    .line 159
    add-int/2addr v1, v10

    .line 160
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 161
    .line 162
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 163
    .line 164
    .line 165
    move-result v1

    .line 166
    iput-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 167
    .line 168
    const/4 v1, 0x3

    .line 169
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 170
    .line 171
    iput v7, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 172
    .line 173
    if-eqz v2, :cond_10

    .line 174
    .line 175
    neg-long v0, v14

    .line 176
    return-wide v0

    .line 177
    :cond_c
    if-ne v6, v1, :cond_13

    .line 178
    .line 179
    iget v6, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 180
    .line 181
    add-int/2addr v6, v10

    .line 182
    iput v6, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 183
    .line 184
    invoke-virtual {v0, v6}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 185
    .line 186
    .line 187
    move-result v6

    .line 188
    :goto_3
    if-ne v6, v5, :cond_d

    .line 189
    .line 190
    iput v7, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 191
    .line 192
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 193
    .line 194
    add-int/2addr v1, v10

    .line 195
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 196
    .line 197
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 198
    .line 199
    .line 200
    move-result v1

    .line 201
    iput-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 202
    .line 203
    goto :goto_4

    .line 204
    :cond_d
    const/16 v8, 0x5d

    .line 205
    .line 206
    if-ne v6, v8, :cond_e

    .line 207
    .line 208
    const/16 v1, 0xf

    .line 209
    .line 210
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 211
    .line 212
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 213
    .line 214
    add-int/2addr v1, v10

    .line 215
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 216
    .line 217
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 218
    .line 219
    .line 220
    move-result v1

    .line 221
    iput-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 222
    .line 223
    goto :goto_4

    .line 224
    :cond_e
    if-ne v6, v1, :cond_f

    .line 225
    .line 226
    const/16 v1, 0xd

    .line 227
    .line 228
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 229
    .line 230
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 231
    .line 232
    add-int/2addr v1, v10

    .line 233
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 234
    .line 235
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 236
    .line 237
    .line 238
    move-result v1

    .line 239
    iput-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 240
    .line 241
    goto :goto_4

    .line 242
    :cond_f
    const/16 v8, 0x1a

    .line 243
    .line 244
    if-ne v6, v8, :cond_11

    .line 245
    .line 246
    const/16 v1, 0x14

    .line 247
    .line 248
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 249
    .line 250
    :goto_4
    const/4 v1, 0x4

    .line 251
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 252
    .line 253
    if-eqz v2, :cond_10

    .line 254
    .line 255
    neg-long v0, v14

    .line 256
    return-wide v0

    .line 257
    :cond_10
    return-wide v14

    .line 258
    :cond_11
    invoke-static {v6}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isWhitespace(C)Z

    .line 259
    .line 260
    .line 261
    move-result v6

    .line 262
    if-eqz v6, :cond_12

    .line 263
    .line 264
    iget v6, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 265
    .line 266
    add-int/2addr v6, v10

    .line 267
    iput v6, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 268
    .line 269
    invoke-virtual {v0, v6}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 270
    .line 271
    .line 272
    move-result v6

    .line 273
    goto :goto_3

    .line 274
    :cond_12
    iput v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 275
    .line 276
    iput-char v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 277
    .line 278
    iput v12, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 279
    .line 280
    return-wide v16

    .line 281
    :cond_13
    invoke-static {v6}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isWhitespace(C)Z

    .line 282
    .line 283
    .line 284
    move-result v6

    .line 285
    if-eqz v6, :cond_14

    .line 286
    .line 287
    iput v8, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 288
    .line 289
    add-int/lit8 v6, v8, 0x1

    .line 290
    .line 291
    invoke-virtual {v0, v8}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 292
    .line 293
    .line 294
    move-result v7

    .line 295
    move v8, v6

    .line 296
    move v6, v7

    .line 297
    goto/16 :goto_2

    .line 298
    .line 299
    :cond_14
    iput v12, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 300
    .line 301
    return-wide v16

    .line 302
    :cond_15
    move-wide/from16 v16, v6

    .line 303
    .line 304
    iput v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 305
    .line 306
    iput-char v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 307
    .line 308
    iput v12, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 309
    .line 310
    return-wide v16
.end method

.method public scanFieldString([C)Ljava/lang/String;
    .locals 10

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 3
    .line 4
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 5
    .line 6
    iget-char v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 7
    .line 8
    :goto_0
    iget-object v3, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 9
    .line 10
    iget v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 11
    .line 12
    invoke-static {v3, v4, p1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charArrayCompare(Ljava/lang/String;I[C)Z

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    if-nez v3, :cond_1

    .line 17
    .line 18
    iget-char v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 19
    .line 20
    invoke-static {v3}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isWhitespace(C)Z

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    if-eqz v3, :cond_0

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONScanner;->next()C

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const/4 p1, -0x2

    .line 31
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->stringDefaultValue()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0

    .line 38
    :cond_1
    iget v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 39
    .line 40
    array-length v4, p1

    .line 41
    add-int/2addr v3, v4

    .line 42
    add-int/lit8 v4, v3, 0x1

    .line 43
    .line 44
    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    const/16 v5, 0x22

    .line 49
    .line 50
    const/4 v6, -0x1

    .line 51
    if-eq v3, v5, :cond_2

    .line 52
    .line 53
    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 54
    .line 55
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->stringDefaultValue()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    return-object p0

    .line 60
    :cond_2
    invoke-virtual {p0, v5, v4}, Lcom/alibaba/fastjson/parser/JSONScanner;->indexOf(CI)I

    .line 61
    .line 62
    .line 63
    move-result v3

    .line 64
    if-eq v3, v6, :cond_e

    .line 65
    .line 66
    sub-int v7, v3, v4

    .line 67
    .line 68
    invoke-virtual {p0, v4, v7}, Lcom/alibaba/fastjson/parser/JSONScanner;->subString(II)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v4

    .line 72
    const/16 v7, 0x5c

    .line 73
    .line 74
    invoke-virtual {v4, v7}, Ljava/lang/String;->indexOf(I)I

    .line 75
    .line 76
    .line 77
    move-result v8

    .line 78
    if-eq v8, v6, :cond_5

    .line 79
    .line 80
    :goto_1
    add-int/lit8 v4, v3, -0x1

    .line 81
    .line 82
    move v8, v0

    .line 83
    :goto_2
    if-ltz v4, :cond_3

    .line 84
    .line 85
    invoke-virtual {p0, v4}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 86
    .line 87
    .line 88
    move-result v9

    .line 89
    if-ne v9, v7, :cond_3

    .line 90
    .line 91
    add-int/lit8 v8, v8, 0x1

    .line 92
    .line 93
    add-int/lit8 v4, v4, -0x1

    .line 94
    .line 95
    goto :goto_2

    .line 96
    :cond_3
    rem-int/lit8 v8, v8, 0x2

    .line 97
    .line 98
    if-nez v8, :cond_4

    .line 99
    .line 100
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 101
    .line 102
    array-length v4, p1

    .line 103
    add-int/2addr v4, v0

    .line 104
    add-int/lit8 v4, v4, 0x1

    .line 105
    .line 106
    sub-int v4, v3, v4

    .line 107
    .line 108
    array-length p1, p1

    .line 109
    add-int/2addr v0, p1

    .line 110
    add-int/lit8 v0, v0, 0x1

    .line 111
    .line 112
    invoke-virtual {p0, v0, v4}, Lcom/alibaba/fastjson/parser/JSONScanner;->sub_chars(II)[C

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    invoke-static {p1, v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->readString([CI)Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v4

    .line 120
    goto :goto_3

    .line 121
    :cond_4
    add-int/lit8 v3, v3, 0x1

    .line 122
    .line 123
    invoke-virtual {p0, v5, v3}, Lcom/alibaba/fastjson/parser/JSONScanner;->indexOf(CI)I

    .line 124
    .line 125
    .line 126
    move-result v3

    .line 127
    goto :goto_1

    .line 128
    :cond_5
    :goto_3
    add-int/lit8 p1, v3, 0x1

    .line 129
    .line 130
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 131
    .line 132
    .line 133
    move-result p1

    .line 134
    :goto_4
    const/16 v0, 0x7d

    .line 135
    .line 136
    const/16 v5, 0x2c

    .line 137
    .line 138
    if-eq p1, v5, :cond_8

    .line 139
    .line 140
    if-ne p1, v0, :cond_6

    .line 141
    .line 142
    goto :goto_5

    .line 143
    :cond_6
    invoke-static {p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isWhitespace(C)Z

    .line 144
    .line 145
    .line 146
    move-result p1

    .line 147
    if-eqz p1, :cond_7

    .line 148
    .line 149
    add-int/lit8 p1, v3, 0x1

    .line 150
    .line 151
    add-int/lit8 v3, v3, 0x2

    .line 152
    .line 153
    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    move v3, p1

    .line 158
    move p1, v0

    .line 159
    goto :goto_4

    .line 160
    :cond_7
    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 161
    .line 162
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->stringDefaultValue()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    return-object p0

    .line 167
    :cond_8
    :goto_5
    add-int/lit8 v7, v3, 0x1

    .line 168
    .line 169
    iput v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 170
    .line 171
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 172
    .line 173
    if-ne p1, v5, :cond_9

    .line 174
    .line 175
    add-int/lit8 v3, v3, 0x2

    .line 176
    .line 177
    iput v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 178
    .line 179
    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 180
    .line 181
    .line 182
    move-result p1

    .line 183
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 184
    .line 185
    const/4 p1, 0x3

    .line 186
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 187
    .line 188
    return-object v4

    .line 189
    :cond_9
    add-int/lit8 v3, v3, 0x2

    .line 190
    .line 191
    iput v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 192
    .line 193
    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 194
    .line 195
    .line 196
    move-result p1

    .line 197
    if-ne p1, v5, :cond_a

    .line 198
    .line 199
    const/16 p1, 0x10

    .line 200
    .line 201
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 202
    .line 203
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 204
    .line 205
    add-int/lit8 p1, p1, 0x1

    .line 206
    .line 207
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 208
    .line 209
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 210
    .line 211
    .line 212
    move-result p1

    .line 213
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 214
    .line 215
    goto :goto_6

    .line 216
    :cond_a
    const/16 v3, 0x5d

    .line 217
    .line 218
    if-ne p1, v3, :cond_b

    .line 219
    .line 220
    const/16 p1, 0xf

    .line 221
    .line 222
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 223
    .line 224
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 225
    .line 226
    add-int/lit8 p1, p1, 0x1

    .line 227
    .line 228
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 229
    .line 230
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 231
    .line 232
    .line 233
    move-result p1

    .line 234
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 235
    .line 236
    goto :goto_6

    .line 237
    :cond_b
    if-ne p1, v0, :cond_c

    .line 238
    .line 239
    const/16 p1, 0xd

    .line 240
    .line 241
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 242
    .line 243
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 244
    .line 245
    add-int/lit8 p1, p1, 0x1

    .line 246
    .line 247
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 248
    .line 249
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 250
    .line 251
    .line 252
    move-result p1

    .line 253
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 254
    .line 255
    goto :goto_6

    .line 256
    :cond_c
    const/16 v0, 0x1a

    .line 257
    .line 258
    if-ne p1, v0, :cond_d

    .line 259
    .line 260
    const/16 p1, 0x14

    .line 261
    .line 262
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 263
    .line 264
    :goto_6
    const/4 p1, 0x4

    .line 265
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 266
    .line 267
    return-object v4

    .line 268
    :cond_d
    iput v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 269
    .line 270
    iput-char v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 271
    .line 272
    iput v6, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 273
    .line 274
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->stringDefaultValue()Ljava/lang/String;

    .line 275
    .line 276
    .line 277
    move-result-object p0

    .line 278
    return-object p0

    .line 279
    :cond_e
    const-string p0, "unclosed str"

    .line 280
    .line 281
    invoke-static {p0}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 282
    .line 283
    .line 284
    const/4 p0, 0x0

    .line 285
    return-object p0
.end method

.method public scanFieldStringArray([CLjava/lang/Class;)Ljava/util/Collection;
    .locals 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([C",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 7
    .line 8
    :goto_0
    iget-char v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 9
    .line 10
    const/16 v4, 0xa

    .line 11
    .line 12
    if-eq v3, v4, :cond_0

    .line 13
    .line 14
    const/16 v4, 0x20

    .line 15
    .line 16
    if-ne v3, v4, :cond_1

    .line 17
    .line 18
    :cond_0
    move-object/from16 v3, p2

    .line 19
    .line 20
    const/16 v6, 0x1a

    .line 21
    .line 22
    const/16 v16, 0x1

    .line 23
    .line 24
    goto/16 :goto_b

    .line 25
    .line 26
    :cond_1
    iget-object v3, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 27
    .line 28
    iget v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 29
    .line 30
    invoke-static {v3, v4, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charArrayCompare(Ljava/lang/String;I[C)Z

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    const/4 v4, 0x0

    .line 35
    if-nez v3, :cond_2

    .line 36
    .line 37
    const/4 v1, -0x2

    .line 38
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 39
    .line 40
    return-object v4

    .line 41
    :cond_2
    move-object/from16 v3, p2

    .line 42
    .line 43
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONScanner;->newCollectionByType(Ljava/lang/Class;)Ljava/util/Collection;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    iget v7, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 48
    .line 49
    iget-char v8, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 50
    .line 51
    array-length v1, v1

    .line 52
    add-int/2addr v1, v7

    .line 53
    add-int/lit8 v9, v1, 0x1

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 56
    .line 57
    .line 58
    move-result v10

    .line 59
    const/16 v11, 0x5b

    .line 60
    .line 61
    const-string v12, "ull"

    .line 62
    .line 63
    const/16 v13, 0x5d

    .line 64
    .line 65
    const/16 v14, 0x2c

    .line 66
    .line 67
    const/4 v15, -0x1

    .line 68
    if-ne v10, v11, :cond_c

    .line 69
    .line 70
    add-int/lit8 v1, v1, 0x2

    .line 71
    .line 72
    invoke-virtual {v0, v9}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 73
    .line 74
    .line 75
    move-result v9

    .line 76
    :goto_1
    const/16 v10, 0x22

    .line 77
    .line 78
    if-ne v9, v10, :cond_7

    .line 79
    .line 80
    invoke-virtual {v0, v10, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->indexOf(CI)I

    .line 81
    .line 82
    .line 83
    move-result v9

    .line 84
    if-eq v9, v15, :cond_6

    .line 85
    .line 86
    sub-int v11, v9, v1

    .line 87
    .line 88
    invoke-virtual {v0, v1, v11}, Lcom/alibaba/fastjson/parser/JSONScanner;->subString(II)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v11

    .line 92
    const/16 v2, 0x5c

    .line 93
    .line 94
    const/16 v16, 0x1

    .line 95
    .line 96
    invoke-virtual {v11, v2}, Ljava/lang/String;->indexOf(I)I

    .line 97
    .line 98
    .line 99
    move-result v6

    .line 100
    if-eq v6, v15, :cond_5

    .line 101
    .line 102
    :goto_2
    add-int/lit8 v6, v9, -0x1

    .line 103
    .line 104
    const/4 v11, 0x0

    .line 105
    :goto_3
    if-ltz v6, :cond_3

    .line 106
    .line 107
    invoke-virtual {v0, v6}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 108
    .line 109
    .line 110
    move-result v5

    .line 111
    if-ne v5, v2, :cond_3

    .line 112
    .line 113
    add-int/lit8 v11, v11, 0x1

    .line 114
    .line 115
    add-int/lit8 v6, v6, -0x1

    .line 116
    .line 117
    goto :goto_3

    .line 118
    :cond_3
    rem-int/lit8 v11, v11, 0x2

    .line 119
    .line 120
    if-nez v11, :cond_4

    .line 121
    .line 122
    sub-int v2, v9, v1

    .line 123
    .line 124
    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->sub_chars(II)[C

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    invoke-static {v1, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->readString([CI)Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v11

    .line 132
    goto :goto_4

    .line 133
    :cond_4
    add-int/lit8 v9, v9, 0x1

    .line 134
    .line 135
    invoke-virtual {v0, v10, v9}, Lcom/alibaba/fastjson/parser/JSONScanner;->indexOf(CI)I

    .line 136
    .line 137
    .line 138
    move-result v9

    .line 139
    goto :goto_2

    .line 140
    :cond_5
    :goto_4
    add-int/lit8 v1, v9, 0x1

    .line 141
    .line 142
    add-int/lit8 v9, v9, 0x2

    .line 143
    .line 144
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 145
    .line 146
    .line 147
    move-result v1

    .line 148
    invoke-interface {v3, v11}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 149
    .line 150
    .line 151
    goto :goto_5

    .line 152
    :cond_6
    const-string v0, "unclosed str"

    .line 153
    .line 154
    invoke-static {v0}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    return-object v4

    .line 158
    :cond_7
    const/16 v16, 0x1

    .line 159
    .line 160
    const/16 v2, 0x6e

    .line 161
    .line 162
    if-ne v9, v2, :cond_a

    .line 163
    .line 164
    iget-object v2, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 165
    .line 166
    invoke-virtual {v2, v12, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    .line 167
    .line 168
    .line 169
    move-result v2

    .line 170
    if-eqz v2, :cond_a

    .line 171
    .line 172
    add-int/lit8 v2, v1, 0x3

    .line 173
    .line 174
    add-int/lit8 v9, v1, 0x4

    .line 175
    .line 176
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 177
    .line 178
    .line 179
    move-result v1

    .line 180
    invoke-interface {v3, v4}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 181
    .line 182
    .line 183
    :goto_5
    if-ne v1, v14, :cond_8

    .line 184
    .line 185
    add-int/lit8 v1, v9, 0x1

    .line 186
    .line 187
    invoke-virtual {v0, v9}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 188
    .line 189
    .line 190
    move-result v9

    .line 191
    const/4 v2, 0x0

    .line 192
    goto :goto_1

    .line 193
    :cond_8
    if-ne v1, v13, :cond_9

    .line 194
    .line 195
    add-int/lit8 v1, v9, 0x1

    .line 196
    .line 197
    invoke-virtual {v0, v9}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 198
    .line 199
    .line 200
    move-result v2

    .line 201
    :goto_6
    invoke-static {v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isWhitespace(C)Z

    .line 202
    .line 203
    .line 204
    move-result v5

    .line 205
    if-eqz v5, :cond_d

    .line 206
    .line 207
    add-int/lit8 v2, v1, 0x1

    .line 208
    .line 209
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 210
    .line 211
    .line 212
    move-result v1

    .line 213
    move/from16 v17, v2

    .line 214
    .line 215
    move v2, v1

    .line 216
    move/from16 v1, v17

    .line 217
    .line 218
    goto :goto_6

    .line 219
    :cond_9
    iput v15, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 220
    .line 221
    return-object v4

    .line 222
    :cond_a
    if-ne v9, v13, :cond_b

    .line 223
    .line 224
    invoke-interface {v3}, Ljava/util/Collection;->size()I

    .line 225
    .line 226
    .line 227
    move-result v2

    .line 228
    if-nez v2, :cond_b

    .line 229
    .line 230
    add-int/lit8 v2, v1, 0x1

    .line 231
    .line 232
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 233
    .line 234
    .line 235
    move-result v1

    .line 236
    move/from16 v17, v2

    .line 237
    .line 238
    move v2, v1

    .line 239
    move/from16 v1, v17

    .line 240
    .line 241
    goto :goto_7

    .line 242
    :cond_b
    iput v15, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 243
    .line 244
    return-object v4

    .line 245
    :cond_c
    const/16 v16, 0x1

    .line 246
    .line 247
    iget-object v2, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 248
    .line 249
    invoke-virtual {v2, v12, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    .line 250
    .line 251
    .line 252
    move-result v2

    .line 253
    if-eqz v2, :cond_16

    .line 254
    .line 255
    add-int/lit8 v2, v1, 0x4

    .line 256
    .line 257
    add-int/lit8 v1, v1, 0x5

    .line 258
    .line 259
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 260
    .line 261
    .line 262
    move-result v2

    .line 263
    move-object v3, v4

    .line 264
    :cond_d
    :goto_7
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 265
    .line 266
    if-ne v2, v14, :cond_e

    .line 267
    .line 268
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 269
    .line 270
    .line 271
    move-result v1

    .line 272
    iput-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 273
    .line 274
    const/4 v1, 0x3

    .line 275
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 276
    .line 277
    return-object v3

    .line 278
    :cond_e
    const/16 v5, 0x7d

    .line 279
    .line 280
    if-ne v2, v5, :cond_15

    .line 281
    .line 282
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 283
    .line 284
    .line 285
    move-result v2

    .line 286
    :goto_8
    if-ne v2, v14, :cond_f

    .line 287
    .line 288
    const/16 v1, 0x10

    .line 289
    .line 290
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 291
    .line 292
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 293
    .line 294
    add-int/lit8 v1, v1, 0x1

    .line 295
    .line 296
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 297
    .line 298
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 299
    .line 300
    .line 301
    move-result v1

    .line 302
    iput-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 303
    .line 304
    goto :goto_9

    .line 305
    :cond_f
    if-ne v2, v13, :cond_10

    .line 306
    .line 307
    const/16 v1, 0xf

    .line 308
    .line 309
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 310
    .line 311
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 312
    .line 313
    add-int/lit8 v1, v1, 0x1

    .line 314
    .line 315
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 316
    .line 317
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 318
    .line 319
    .line 320
    move-result v1

    .line 321
    iput-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 322
    .line 323
    goto :goto_9

    .line 324
    :cond_10
    if-ne v2, v5, :cond_11

    .line 325
    .line 326
    const/16 v1, 0xd

    .line 327
    .line 328
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 329
    .line 330
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 331
    .line 332
    add-int/lit8 v1, v1, 0x1

    .line 333
    .line 334
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 335
    .line 336
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 337
    .line 338
    .line 339
    move-result v1

    .line 340
    iput-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 341
    .line 342
    goto :goto_9

    .line 343
    :cond_11
    const/16 v6, 0x1a

    .line 344
    .line 345
    if-ne v2, v6, :cond_12

    .line 346
    .line 347
    const/16 v1, 0x14

    .line 348
    .line 349
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 350
    .line 351
    iput-char v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 352
    .line 353
    :goto_9
    const/4 v1, 0x4

    .line 354
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 355
    .line 356
    return-object v3

    .line 357
    :cond_12
    const/4 v7, 0x0

    .line 358
    :goto_a
    invoke-static {v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isWhitespace(C)Z

    .line 359
    .line 360
    .line 361
    move-result v8

    .line 362
    if-eqz v8, :cond_13

    .line 363
    .line 364
    add-int/lit8 v2, v1, 0x1

    .line 365
    .line 366
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 367
    .line 368
    .line 369
    move-result v1

    .line 370
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 371
    .line 372
    move v7, v2

    .line 373
    move v2, v1

    .line 374
    move v1, v7

    .line 375
    move/from16 v7, v16

    .line 376
    .line 377
    goto :goto_a

    .line 378
    :cond_13
    if-eqz v7, :cond_14

    .line 379
    .line 380
    goto :goto_8

    .line 381
    :cond_14
    iput v15, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 382
    .line 383
    return-object v4

    .line 384
    :cond_15
    iput-char v8, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 385
    .line 386
    iput v7, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 387
    .line 388
    iput v15, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 389
    .line 390
    return-object v4

    .line 391
    :cond_16
    iput v15, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 392
    .line 393
    return-object v4

    .line 394
    :goto_b
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 395
    .line 396
    add-int/lit8 v2, v2, 0x1

    .line 397
    .line 398
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 399
    .line 400
    iget v4, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->len:I

    .line 401
    .line 402
    if-lt v2, v4, :cond_17

    .line 403
    .line 404
    move v5, v6

    .line 405
    goto :goto_c

    .line 406
    :cond_17
    iget-object v4, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 407
    .line 408
    invoke-virtual {v4, v2}, Ljava/lang/String;->charAt(I)C

    .line 409
    .line 410
    .line 411
    move-result v5

    .line 412
    :goto_c
    iput-char v5, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 413
    .line 414
    const/4 v2, 0x0

    .line 415
    goto/16 :goto_0
.end method

.method public scanFieldStringArray([CILcom/alibaba/fastjson/parser/SymbolTable;)[Ljava/lang/String;
    .locals 8

    .line 416
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 417
    iget-char v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 418
    :goto_0
    iget-char v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    invoke-static {v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isWhitespace(C)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 419
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONScanner;->next()C

    goto :goto_0

    :cond_0
    const/4 v2, -0x1

    const/4 v3, 0x0

    const/4 v4, 0x0

    if-eqz p1, :cond_4

    .line 420
    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 421
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charArrayCompare([C)Z

    move-result v5

    if-nez v5, :cond_1

    const/4 p1, -0x2

    .line 422
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    return-object v3

    .line 423
    :cond_1
    iget v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    array-length p1, p1

    add-int/2addr v5, p1

    .line 424
    iget-object p1, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    add-int/lit8 v6, v5, 0x1

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result p1

    .line 425
    :goto_1
    invoke-static {p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isWhitespace(C)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 426
    iget-object p1, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    add-int/lit8 v5, v6, 0x1

    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result p1

    move v6, v5

    goto :goto_1

    :cond_2
    const/16 v5, 0x3a

    if-ne p1, v5, :cond_3

    .line 427
    iget-object p1, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    add-int/lit8 v5, v6, 0x1

    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result p1

    .line 428
    :goto_2
    invoke-static {p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isWhitespace(C)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 429
    iget-object p1, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    add-int/lit8 v6, v5, 0x1

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result p1

    move v5, v6

    goto :goto_2

    .line 430
    :cond_3
    iput v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    return-object v3

    .line 431
    :cond_4
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v5, p1, 0x1

    .line 432
    iget-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    :cond_5
    const/16 v6, 0x5b

    const/4 v7, 0x4

    if-ne p1, v6, :cond_f

    .line 433
    iput v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 434
    iget-object p1, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result p1

    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-ltz p2, :cond_6

    .line 435
    new-array p1, p2, [Ljava/lang/String;

    goto :goto_3

    :cond_6
    new-array p1, v7, [Ljava/lang/String;

    :goto_3
    move p2, v4

    .line 436
    :goto_4
    iget-char v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    invoke-static {v5}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isWhitespace(C)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 437
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONScanner;->next()C

    goto :goto_4

    .line 438
    :cond_7
    iget-char v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v6, 0x22

    if-eq v5, v6, :cond_8

    .line 439
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 440
    iput-char v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 441
    iput v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    return-object v3

    .line 442
    :cond_8
    invoke-virtual {p0, p3, v6}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanSymbol(Lcom/alibaba/fastjson/parser/SymbolTable;C)Ljava/lang/String;

    move-result-object v5

    .line 443
    array-length v6, p1

    if-ne p2, v6, :cond_9

    .line 444
    array-length v6, p1

    array-length v7, p1

    shr-int/lit8 v7, v7, 0x1

    add-int/2addr v6, v7

    add-int/lit8 v6, v6, 0x1

    .line 445
    new-array v6, v6, [Ljava/lang/String;

    .line 446
    array-length v7, p1

    invoke-static {p1, v4, v6, v4, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move-object p1, v6

    :cond_9
    add-int/lit8 v6, p2, 0x1

    .line 447
    aput-object v5, p1, p2

    .line 448
    :goto_5
    iget-char p2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    invoke-static {p2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isWhitespace(C)Z

    move-result p2

    if-eqz p2, :cond_a

    .line 449
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONScanner;->next()C

    goto :goto_5

    .line 450
    :cond_a
    iget-char p2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v5, 0x2c

    if-ne p2, v5, :cond_b

    .line 451
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONScanner;->next()C

    move p2, v6

    goto :goto_4

    .line 452
    :cond_b
    array-length p2, p1

    if-eq p2, v6, :cond_c

    .line 453
    new-array p2, v6, [Ljava/lang/String;

    .line 454
    invoke-static {p1, v4, p2, v4, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move-object p1, p2

    .line 455
    :cond_c
    :goto_6
    iget-char p2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    invoke-static {p2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isWhitespace(C)Z

    move-result p2

    if-eqz p2, :cond_d

    .line 456
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONScanner;->next()C

    goto :goto_6

    .line 457
    :cond_d
    iget-char p2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 p3, 0x5d

    if-ne p2, p3, :cond_e

    .line 458
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONScanner;->next()C

    return-object p1

    .line 459
    :cond_e
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 460
    iput-char v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 461
    iput v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    return-object v3

    :cond_f
    const/16 p2, 0x6e

    if-ne p1, p2, :cond_10

    .line 462
    iget-object p1, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    iget p2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 p2, p2, 0x1

    const-string p3, "ull"

    invoke-virtual {p1, p3, p2}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    move-result p1

    if-eqz p1, :cond_10

    .line 463
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/2addr p1, v7

    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 464
    iget-object p2, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    invoke-virtual {p2, p1}, Ljava/lang/String;->charAt(I)C

    move-result p1

    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    return-object v3

    .line 465
    :cond_10
    iput v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    return-object v3
.end method

.method public scanFieldSymbol([C)J
    .locals 9

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 3
    .line 4
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 5
    .line 6
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 7
    .line 8
    invoke-static {v0, v1, p1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charArrayCompare(Ljava/lang/String;I[C)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const-wide/16 v1, 0x0

    .line 13
    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    const/4 p1, -0x2

    .line 17
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 18
    .line 19
    return-wide v1

    .line 20
    :cond_0
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 21
    .line 22
    array-length p1, p1

    .line 23
    add-int/2addr v0, p1

    .line 24
    add-int/lit8 p1, v0, 0x1

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    const/16 v3, 0x22

    .line 31
    .line 32
    const/4 v4, -0x1

    .line 33
    if-eq v0, v3, :cond_1

    .line 34
    .line 35
    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 36
    .line 37
    return-wide v1

    .line 38
    :cond_1
    const-wide v5, -0x340d631b7bdddcdbL    # -7.302176725335867E57

    .line 39
    .line 40
    .line 41
    .line 42
    .line 43
    :goto_0
    add-int/lit8 v0, p1, 0x1

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-ne p1, v3, :cond_9

    .line 50
    .line 51
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 52
    .line 53
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 58
    .line 59
    :goto_1
    const/16 v0, 0x2c

    .line 60
    .line 61
    if-ne p1, v0, :cond_2

    .line 62
    .line 63
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 64
    .line 65
    add-int/lit8 p1, p1, 0x1

    .line 66
    .line 67
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 68
    .line 69
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 74
    .line 75
    const/4 p1, 0x3

    .line 76
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 77
    .line 78
    return-wide v5

    .line 79
    :cond_2
    const/16 v3, 0x7d

    .line 80
    .line 81
    if-ne p1, v3, :cond_7

    .line 82
    .line 83
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONScanner;->next()C

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->skipWhitespace()V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->getCurrent()C

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    if-ne p1, v0, :cond_3

    .line 94
    .line 95
    const/16 p1, 0x10

    .line 96
    .line 97
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 98
    .line 99
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 100
    .line 101
    add-int/lit8 p1, p1, 0x1

    .line 102
    .line 103
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 104
    .line 105
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 106
    .line 107
    .line 108
    move-result p1

    .line 109
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 110
    .line 111
    goto :goto_2

    .line 112
    :cond_3
    const/16 v0, 0x5d

    .line 113
    .line 114
    if-ne p1, v0, :cond_4

    .line 115
    .line 116
    const/16 p1, 0xf

    .line 117
    .line 118
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 119
    .line 120
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 121
    .line 122
    add-int/lit8 p1, p1, 0x1

    .line 123
    .line 124
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 125
    .line 126
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 127
    .line 128
    .line 129
    move-result p1

    .line 130
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 131
    .line 132
    goto :goto_2

    .line 133
    :cond_4
    if-ne p1, v3, :cond_5

    .line 134
    .line 135
    const/16 p1, 0xd

    .line 136
    .line 137
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 138
    .line 139
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 140
    .line 141
    add-int/lit8 p1, p1, 0x1

    .line 142
    .line 143
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 144
    .line 145
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 146
    .line 147
    .line 148
    move-result p1

    .line 149
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 150
    .line 151
    goto :goto_2

    .line 152
    :cond_5
    const/16 v0, 0x1a

    .line 153
    .line 154
    if-ne p1, v0, :cond_6

    .line 155
    .line 156
    const/16 p1, 0x14

    .line 157
    .line 158
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 159
    .line 160
    :goto_2
    const/4 p1, 0x4

    .line 161
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 162
    .line 163
    return-wide v5

    .line 164
    :cond_6
    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 165
    .line 166
    return-wide v1

    .line 167
    :cond_7
    invoke-static {p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isWhitespace(C)Z

    .line 168
    .line 169
    .line 170
    move-result p1

    .line 171
    if-eqz p1, :cond_8

    .line 172
    .line 173
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 174
    .line 175
    add-int/lit8 p1, p1, 0x1

    .line 176
    .line 177
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 178
    .line 179
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 180
    .line 181
    .line 182
    move-result p1

    .line 183
    goto :goto_1

    .line 184
    :cond_8
    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 185
    .line 186
    return-wide v1

    .line 187
    :cond_9
    iget v7, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->len:I

    .line 188
    .line 189
    if-le v0, v7, :cond_a

    .line 190
    .line 191
    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 192
    .line 193
    return-wide v1

    .line 194
    :cond_a
    int-to-long v7, p1

    .line 195
    xor-long/2addr v5, v7

    .line 196
    const-wide v7, 0x100000001b3L

    .line 197
    .line 198
    .line 199
    .line 200
    .line 201
    mul-long/2addr v5, v7

    .line 202
    move p1, v0

    .line 203
    goto/16 :goto_0
.end method

.method public scanISO8601DateIfMatch()Z
    .locals 1

    const/4 v0, 0x1

    .line 1827
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONScanner;->scanISO8601DateIfMatch(Z)Z

    move-result p0

    return p0
.end method

.method public scanISO8601DateIfMatch(Z)Z
    .locals 2

    .line 1825
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->len:I

    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    sub-int/2addr v0, v1

    .line 1826
    invoke-direct {p0, p1, v0}, Lcom/alibaba/fastjson/parser/JSONScanner;->scanISO8601DateIfMatch(ZI)Z

    move-result p0

    return p0
.end method

.method public final scanInt(C)I
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 5
    .line 6
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 7
    .line 8
    add-int/lit8 v3, v2, 0x1

    .line 9
    .line 10
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 11
    .line 12
    .line 13
    move-result v4

    .line 14
    :goto_0
    invoke-static {v4}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isWhitespace(C)Z

    .line 15
    .line 16
    .line 17
    move-result v5

    .line 18
    if-eqz v5, :cond_0

    .line 19
    .line 20
    add-int/lit8 v4, v3, 0x1

    .line 21
    .line 22
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    move v15, v4

    .line 27
    move v4, v3

    .line 28
    move v3, v15

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const/16 v5, 0x22

    .line 31
    .line 32
    const/4 v6, 0x1

    .line 33
    if-ne v4, v5, :cond_1

    .line 34
    .line 35
    move v7, v6

    .line 36
    goto :goto_1

    .line 37
    :cond_1
    move v7, v1

    .line 38
    :goto_1
    if-eqz v7, :cond_2

    .line 39
    .line 40
    add-int/lit8 v4, v3, 0x1

    .line 41
    .line 42
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    move v15, v4

    .line 47
    move v4, v3

    .line 48
    move v3, v15

    .line 49
    :cond_2
    const/16 v8, 0x2d

    .line 50
    .line 51
    if-ne v4, v8, :cond_3

    .line 52
    .line 53
    goto :goto_2

    .line 54
    :cond_3
    move v6, v1

    .line 55
    :goto_2
    if-eqz v6, :cond_4

    .line 56
    .line 57
    add-int/lit8 v4, v3, 0x1

    .line 58
    .line 59
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    move v15, v4

    .line 64
    move v4, v3

    .line 65
    move v3, v15

    .line 66
    :cond_4
    const/16 v8, 0x10

    .line 67
    .line 68
    const/16 v9, 0x30

    .line 69
    .line 70
    const/4 v10, -0x1

    .line 71
    if-lt v4, v9, :cond_e

    .line 72
    .line 73
    const/16 v11, 0x39

    .line 74
    .line 75
    if-gt v4, v11, :cond_e

    .line 76
    .line 77
    sub-int/2addr v4, v9

    .line 78
    :goto_3
    add-int/lit8 v12, v3, 0x1

    .line 79
    .line 80
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 81
    .line 82
    .line 83
    move-result v13

    .line 84
    if-lt v13, v9, :cond_6

    .line 85
    .line 86
    if-gt v13, v11, :cond_6

    .line 87
    .line 88
    mul-int/lit8 v14, v4, 0xa

    .line 89
    .line 90
    if-lt v14, v4, :cond_5

    .line 91
    .line 92
    add-int/lit8 v13, v13, -0x30

    .line 93
    .line 94
    add-int v4, v14, v13

    .line 95
    .line 96
    move v3, v12

    .line 97
    goto :goto_3

    .line 98
    :cond_5
    const-string v1, "parseInt error : "

    .line 99
    .line 100
    invoke-virtual {v0, v2, v3}, Lcom/alibaba/fastjson/parser/JSONScanner;->subString(II)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-static {v1, v0}, Ll/wkq;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 105
    .line 106
    .line 107
    const/4 v0, 0x0

    .line 108
    return v0

    .line 109
    :cond_6
    const/16 v2, 0x2e

    .line 110
    .line 111
    if-ne v13, v2, :cond_7

    .line 112
    .line 113
    iput v10, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 114
    .line 115
    return v1

    .line 116
    :cond_7
    if-eqz v7, :cond_9

    .line 117
    .line 118
    if-eq v13, v5, :cond_8

    .line 119
    .line 120
    iput v10, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 121
    .line 122
    return v1

    .line 123
    :cond_8
    add-int/lit8 v3, v3, 0x2

    .line 124
    .line 125
    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 126
    .line 127
    .line 128
    move-result v13

    .line 129
    move v12, v3

    .line 130
    :cond_9
    if-gez v4, :cond_a

    .line 131
    .line 132
    iput v10, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 133
    .line 134
    return v1

    .line 135
    :cond_a
    move/from16 v1, p1

    .line 136
    .line 137
    :goto_4
    if-ne v13, v1, :cond_b

    .line 138
    .line 139
    iput v12, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 140
    .line 141
    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 142
    .line 143
    .line 144
    move-result v1

    .line 145
    iput-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 146
    .line 147
    const/4 v1, 0x3

    .line 148
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 149
    .line 150
    iput v8, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 151
    .line 152
    if-eqz v6, :cond_d

    .line 153
    .line 154
    neg-int v0, v4

    .line 155
    return v0

    .line 156
    :cond_b
    invoke-static {v13}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isWhitespace(C)Z

    .line 157
    .line 158
    .line 159
    move-result v2

    .line 160
    if-eqz v2, :cond_c

    .line 161
    .line 162
    add-int/lit8 v2, v12, 0x1

    .line 163
    .line 164
    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 165
    .line 166
    .line 167
    move-result v13

    .line 168
    move v12, v2

    .line 169
    goto :goto_4

    .line 170
    :cond_c
    iput v10, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 171
    .line 172
    if-eqz v6, :cond_d

    .line 173
    .line 174
    neg-int v0, v4

    .line 175
    return v0

    .line 176
    :cond_d
    return v4

    .line 177
    :cond_e
    const/16 v2, 0x6e

    .line 178
    .line 179
    if-ne v4, v2, :cond_13

    .line 180
    .line 181
    add-int/lit8 v2, v3, 0x1

    .line 182
    .line 183
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 184
    .line 185
    .line 186
    move-result v4

    .line 187
    const/16 v6, 0x75

    .line 188
    .line 189
    if-ne v4, v6, :cond_13

    .line 190
    .line 191
    add-int/lit8 v4, v3, 0x2

    .line 192
    .line 193
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 194
    .line 195
    .line 196
    move-result v2

    .line 197
    const/16 v6, 0x6c

    .line 198
    .line 199
    if-ne v2, v6, :cond_13

    .line 200
    .line 201
    add-int/lit8 v2, v3, 0x3

    .line 202
    .line 203
    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 204
    .line 205
    .line 206
    move-result v4

    .line 207
    if-ne v4, v6, :cond_13

    .line 208
    .line 209
    const/4 v4, 0x5

    .line 210
    iput v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 211
    .line 212
    add-int/lit8 v6, v3, 0x4

    .line 213
    .line 214
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 215
    .line 216
    .line 217
    move-result v2

    .line 218
    if-eqz v7, :cond_f

    .line 219
    .line 220
    if-ne v2, v5, :cond_f

    .line 221
    .line 222
    add-int/2addr v3, v4

    .line 223
    invoke-virtual {v0, v6}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 224
    .line 225
    .line 226
    move-result v2

    .line 227
    move v6, v3

    .line 228
    :cond_f
    :goto_5
    const/16 v3, 0x2c

    .line 229
    .line 230
    if-ne v2, v3, :cond_10

    .line 231
    .line 232
    iput v6, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 233
    .line 234
    invoke-virtual {v0, v6}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 235
    .line 236
    .line 237
    move-result v2

    .line 238
    iput-char v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 239
    .line 240
    iput v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 241
    .line 242
    iput v8, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 243
    .line 244
    return v1

    .line 245
    :cond_10
    const/16 v3, 0x5d

    .line 246
    .line 247
    if-ne v2, v3, :cond_11

    .line 248
    .line 249
    iput v6, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 250
    .line 251
    invoke-virtual {v0, v6}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 252
    .line 253
    .line 254
    move-result v2

    .line 255
    iput-char v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 256
    .line 257
    iput v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 258
    .line 259
    const/16 v2, 0xf

    .line 260
    .line 261
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 262
    .line 263
    return v1

    .line 264
    :cond_11
    invoke-static {v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isWhitespace(C)Z

    .line 265
    .line 266
    .line 267
    move-result v2

    .line 268
    if-eqz v2, :cond_12

    .line 269
    .line 270
    add-int/lit8 v2, v6, 0x1

    .line 271
    .line 272
    invoke-virtual {v0, v6}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 273
    .line 274
    .line 275
    move-result v3

    .line 276
    move v6, v2

    .line 277
    move v2, v3

    .line 278
    goto :goto_5

    .line 279
    :cond_12
    iput v10, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 280
    .line 281
    return v1

    .line 282
    :cond_13
    iput v10, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 283
    .line 284
    return v1
.end method

.method public scanLong(C)J
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 5
    .line 6
    iget v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 7
    .line 8
    add-int/lit8 v3, v2, 0x1

    .line 9
    .line 10
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 11
    .line 12
    .line 13
    move-result v4

    .line 14
    const/4 v5, 0x1

    .line 15
    const/16 v6, 0x22

    .line 16
    .line 17
    if-ne v4, v6, :cond_0

    .line 18
    .line 19
    move v7, v5

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    move v7, v1

    .line 22
    :goto_0
    if-eqz v7, :cond_1

    .line 23
    .line 24
    add-int/lit8 v2, v2, 0x2

    .line 25
    .line 26
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 27
    .line 28
    .line 29
    move-result v4

    .line 30
    move v3, v2

    .line 31
    :cond_1
    const/16 v2, 0x2d

    .line 32
    .line 33
    if-ne v4, v2, :cond_2

    .line 34
    .line 35
    move v1, v5

    .line 36
    :cond_2
    if-eqz v1, :cond_3

    .line 37
    .line 38
    add-int/lit8 v2, v3, 0x1

    .line 39
    .line 40
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 41
    .line 42
    .line 43
    move-result v4

    .line 44
    move v3, v2

    .line 45
    :cond_3
    const/16 v2, 0x10

    .line 46
    .line 47
    const/16 v5, 0x30

    .line 48
    .line 49
    const/4 v8, -0x1

    .line 50
    const-wide/16 v9, 0x0

    .line 51
    .line 52
    if-lt v4, v5, :cond_d

    .line 53
    .line 54
    const/16 v11, 0x39

    .line 55
    .line 56
    if-gt v4, v11, :cond_d

    .line 57
    .line 58
    sub-int/2addr v4, v5

    .line 59
    int-to-long v12, v4

    .line 60
    :goto_1
    add-int/lit8 v4, v3, 0x1

    .line 61
    .line 62
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 63
    .line 64
    .line 65
    move-result v14

    .line 66
    if-lt v14, v5, :cond_4

    .line 67
    .line 68
    if-gt v14, v11, :cond_4

    .line 69
    .line 70
    const-wide/16 v15, 0xa

    .line 71
    .line 72
    mul-long/2addr v12, v15

    .line 73
    add-int/lit8 v14, v14, -0x30

    .line 74
    .line 75
    int-to-long v14, v14

    .line 76
    add-long/2addr v12, v14

    .line 77
    move v3, v4

    .line 78
    goto :goto_1

    .line 79
    :cond_4
    const/16 v5, 0x2e

    .line 80
    .line 81
    if-ne v14, v5, :cond_5

    .line 82
    .line 83
    iput v8, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 84
    .line 85
    return-wide v9

    .line 86
    :cond_5
    if-eqz v7, :cond_7

    .line 87
    .line 88
    if-eq v14, v6, :cond_6

    .line 89
    .line 90
    iput v8, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 91
    .line 92
    return-wide v9

    .line 93
    :cond_6
    add-int/lit8 v3, v3, 0x2

    .line 94
    .line 95
    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 96
    .line 97
    .line 98
    move-result v14

    .line 99
    move v4, v3

    .line 100
    :cond_7
    cmp-long v3, v12, v9

    .line 101
    .line 102
    if-gez v3, :cond_9

    .line 103
    .line 104
    const-wide/high16 v5, -0x8000000000000000L

    .line 105
    .line 106
    cmp-long v3, v12, v5

    .line 107
    .line 108
    if-nez v3, :cond_8

    .line 109
    .line 110
    if-eqz v1, :cond_8

    .line 111
    .line 112
    goto :goto_2

    .line 113
    :cond_8
    iput v8, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 114
    .line 115
    return-wide v9

    .line 116
    :cond_9
    :goto_2
    move/from16 v3, p1

    .line 117
    .line 118
    :goto_3
    if-ne v14, v3, :cond_b

    .line 119
    .line 120
    iput v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 121
    .line 122
    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 123
    .line 124
    .line 125
    move-result v3

    .line 126
    iput-char v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 127
    .line 128
    const/4 v3, 0x3

    .line 129
    iput v3, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 130
    .line 131
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 132
    .line 133
    if-eqz v1, :cond_a

    .line 134
    .line 135
    neg-long v0, v12

    .line 136
    return-wide v0

    .line 137
    :cond_a
    return-wide v12

    .line 138
    :cond_b
    invoke-static {v14}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isWhitespace(C)Z

    .line 139
    .line 140
    .line 141
    move-result v5

    .line 142
    if-eqz v5, :cond_c

    .line 143
    .line 144
    add-int/lit8 v5, v4, 0x1

    .line 145
    .line 146
    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 147
    .line 148
    .line 149
    move-result v14

    .line 150
    move v4, v5

    .line 151
    goto :goto_3

    .line 152
    :cond_c
    iput v8, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 153
    .line 154
    return-wide v12

    .line 155
    :cond_d
    const/16 v1, 0x6e

    .line 156
    .line 157
    if-ne v4, v1, :cond_12

    .line 158
    .line 159
    add-int/lit8 v1, v3, 0x1

    .line 160
    .line 161
    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 162
    .line 163
    .line 164
    move-result v4

    .line 165
    const/16 v5, 0x75

    .line 166
    .line 167
    if-ne v4, v5, :cond_12

    .line 168
    .line 169
    add-int/lit8 v4, v3, 0x2

    .line 170
    .line 171
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 172
    .line 173
    .line 174
    move-result v1

    .line 175
    const/16 v5, 0x6c

    .line 176
    .line 177
    if-ne v1, v5, :cond_12

    .line 178
    .line 179
    add-int/lit8 v1, v3, 0x3

    .line 180
    .line 181
    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 182
    .line 183
    .line 184
    move-result v4

    .line 185
    if-ne v4, v5, :cond_12

    .line 186
    .line 187
    const/4 v4, 0x5

    .line 188
    iput v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 189
    .line 190
    add-int/lit8 v5, v3, 0x4

    .line 191
    .line 192
    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 193
    .line 194
    .line 195
    move-result v1

    .line 196
    if-eqz v7, :cond_e

    .line 197
    .line 198
    if-ne v1, v6, :cond_e

    .line 199
    .line 200
    add-int/2addr v3, v4

    .line 201
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 202
    .line 203
    .line 204
    move-result v1

    .line 205
    move v5, v3

    .line 206
    :cond_e
    :goto_4
    const/16 v3, 0x2c

    .line 207
    .line 208
    if-ne v1, v3, :cond_f

    .line 209
    .line 210
    iput v5, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 211
    .line 212
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 213
    .line 214
    .line 215
    move-result v1

    .line 216
    iput-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 217
    .line 218
    iput v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 219
    .line 220
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 221
    .line 222
    return-wide v9

    .line 223
    :cond_f
    const/16 v3, 0x5d

    .line 224
    .line 225
    if-ne v1, v3, :cond_10

    .line 226
    .line 227
    iput v5, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 228
    .line 229
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 230
    .line 231
    .line 232
    move-result v1

    .line 233
    iput-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 234
    .line 235
    iput v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 236
    .line 237
    const/16 v1, 0xf

    .line 238
    .line 239
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 240
    .line 241
    return-wide v9

    .line 242
    :cond_10
    invoke-static {v1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->isWhitespace(C)Z

    .line 243
    .line 244
    .line 245
    move-result v1

    .line 246
    if-eqz v1, :cond_11

    .line 247
    .line 248
    add-int/lit8 v1, v5, 0x1

    .line 249
    .line 250
    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 251
    .line 252
    .line 253
    move-result v3

    .line 254
    move v5, v1

    .line 255
    move v1, v3

    .line 256
    goto :goto_4

    .line 257
    :cond_11
    iput v8, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 258
    .line 259
    return-wide v9

    .line 260
    :cond_12
    iput v8, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    .line 261
    .line 262
    return-wide v9
.end method

.method public scanTypeName(Lcom/alibaba/fastjson/parser/SymbolTable;)Ljava/lang/String;
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "\"@type\":\""

    .line 4
    .line 5
    iget v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x0

    .line 12
    if-eqz v0, :cond_2

    .line 13
    .line 14
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 15
    .line 16
    iget v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 17
    .line 18
    add-int/lit8 v2, v2, 0x9

    .line 19
    .line 20
    const/16 v3, 0x22

    .line 21
    .line 22
    invoke-virtual {v0, v3, v2}, Ljava/lang/String;->indexOf(II)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    const/4 v2, -0x1

    .line 27
    if-eq v0, v2, :cond_2

    .line 28
    .line 29
    iget v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 30
    .line 31
    add-int/lit8 v2, v2, 0x9

    .line 32
    .line 33
    iput v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 34
    .line 35
    const/4 v3, 0x0

    .line 36
    :goto_0
    if-ge v2, v0, :cond_0

    .line 37
    .line 38
    mul-int/lit8 v3, v3, 0x1f

    .line 39
    .line 40
    iget-object v4, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v4, v2}, Ljava/lang/String;->charAt(I)C

    .line 43
    .line 44
    .line 45
    move-result v4

    .line 46
    add-int/2addr v3, v4

    .line 47
    add-int/lit8 v2, v2, 0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    iget v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 51
    .line 52
    sub-int v4, v0, v2

    .line 53
    .line 54
    invoke-virtual {p0, v2, v4, v3, p1}, Lcom/alibaba/fastjson/parser/JSONScanner;->addSymbol(IIILcom/alibaba/fastjson/parser/SymbolTable;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    iget-object v2, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 59
    .line 60
    add-int/lit8 v3, v0, 0x1

    .line 61
    .line 62
    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    const/16 v3, 0x2c

    .line 67
    .line 68
    if-eq v2, v3, :cond_1

    .line 69
    .line 70
    const/16 v3, 0x5d

    .line 71
    .line 72
    if-eq v2, v3, :cond_1

    .line 73
    .line 74
    return-object v1

    .line 75
    :cond_1
    add-int/lit8 v0, v0, 0x2

    .line 76
    .line 77
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 78
    .line 79
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 80
    .line 81
    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    iput-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 86
    .line 87
    return-object p1

    .line 88
    :cond_2
    return-object v1
.end method

.method public seekArrayToItem(I)Z
    .locals 10

    .line 1
    if-ltz p1, :cond_e

    .line 2
    .line 3
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 4
    .line 5
    const/16 v1, 0x14

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    return v2

    .line 11
    :cond_0
    const/16 v1, 0xe

    .line 12
    .line 13
    if-ne v0, v1, :cond_d

    .line 14
    .line 15
    move v0, v2

    .line 16
    :goto_0
    const/4 v3, 0x1

    .line 17
    if-ge v0, p1, :cond_c

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->skipWhitespace()V

    .line 20
    .line 21
    .line 22
    iget-char v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 23
    .line 24
    const/16 v5, 0x22

    .line 25
    .line 26
    const-string v6, "illegal json."

    .line 27
    .line 28
    const/16 v7, 0x5d

    .line 29
    .line 30
    const/16 v8, 0x2c

    .line 31
    .line 32
    const/16 v9, 0x10

    .line 33
    .line 34
    if-eq v4, v5, :cond_9

    .line 35
    .line 36
    const/16 v5, 0x27

    .line 37
    .line 38
    if-ne v4, v5, :cond_1

    .line 39
    .line 40
    goto :goto_4

    .line 41
    :cond_1
    const/16 v5, 0x7b

    .line 42
    .line 43
    if-ne v4, v5, :cond_2

    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONScanner;->next()C

    .line 46
    .line 47
    .line 48
    const/16 v3, 0xc

    .line 49
    .line 50
    iput v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 51
    .line 52
    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->skipObject(Z)V

    .line 53
    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_2
    const/16 v5, 0x5b

    .line 57
    .line 58
    if-ne v4, v5, :cond_5

    .line 59
    .line 60
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONScanner;->next()C

    .line 61
    .line 62
    .line 63
    iput v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 64
    .line 65
    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->skipArray(Z)V

    .line 66
    .line 67
    .line 68
    :goto_1
    iget v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 69
    .line 70
    if-ne v3, v9, :cond_3

    .line 71
    .line 72
    goto :goto_5

    .line 73
    :cond_3
    const/16 p0, 0xf

    .line 74
    .line 75
    if-ne v3, p0, :cond_4

    .line 76
    .line 77
    return v2

    .line 78
    :cond_4
    invoke-static {}, Ll/l710;->a()V

    .line 79
    .line 80
    .line 81
    :goto_2
    const/4 p0, 0x0

    .line 82
    return p0

    .line 83
    :cond_5
    iget v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 84
    .line 85
    add-int/2addr v4, v3

    .line 86
    :goto_3
    iget-object v5, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 87
    .line 88
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    .line 89
    .line 90
    .line 91
    move-result v5

    .line 92
    if-ge v4, v5, :cond_8

    .line 93
    .line 94
    iget-object v5, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 95
    .line 96
    invoke-virtual {v5, v4}, Ljava/lang/String;->charAt(I)C

    .line 97
    .line 98
    .line 99
    move-result v5

    .line 100
    if-ne v5, v8, :cond_6

    .line 101
    .line 102
    add-int/lit8 v4, v4, 0x1

    .line 103
    .line 104
    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 105
    .line 106
    invoke-virtual {p0, v4}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 107
    .line 108
    .line 109
    move-result v3

    .line 110
    iput-char v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 111
    .line 112
    goto :goto_5

    .line 113
    :cond_6
    if-ne v5, v7, :cond_7

    .line 114
    .line 115
    add-int/2addr v4, v3

    .line 116
    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 117
    .line 118
    invoke-virtual {p0, v4}, Lcom/alibaba/fastjson/parser/JSONScanner;->charAt(I)C

    .line 119
    .line 120
    .line 121
    move-result p1

    .line 122
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 123
    .line 124
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextToken()V

    .line 125
    .line 126
    .line 127
    return v2

    .line 128
    :cond_7
    add-int/lit8 v4, v4, 0x1

    .line 129
    .line 130
    goto :goto_3

    .line 131
    :cond_8
    invoke-static {v6}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    goto :goto_2

    .line 135
    :cond_9
    :goto_4
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONScanner;->skipString()V

    .line 136
    .line 137
    .line 138
    iget-char v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 139
    .line 140
    if-ne v3, v8, :cond_a

    .line 141
    .line 142
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONScanner;->next()C

    .line 143
    .line 144
    .line 145
    :goto_5
    add-int/lit8 v0, v0, 0x1

    .line 146
    .line 147
    goto/16 :goto_0

    .line 148
    .line 149
    :cond_a
    if-ne v3, v7, :cond_b

    .line 150
    .line 151
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONScanner;->next()C

    .line 152
    .line 153
    .line 154
    invoke-virtual {p0, v9}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextToken(I)V

    .line 155
    .line 156
    .line 157
    return v2

    .line 158
    :cond_b
    invoke-static {v6}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    goto :goto_2

    .line 162
    :cond_c
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextToken()V

    .line 163
    .line 164
    .line 165
    return v3

    .line 166
    :cond_d
    invoke-static {}, Ll/l710;->a()V

    .line 167
    .line 168
    .line 169
    goto :goto_2

    .line 170
    :cond_e
    const-string p0, "index must > 0, but "

    .line 171
    .line 172
    invoke-static {p0, p1}, Ll/za50;->a(Ljava/lang/String;I)V

    .line 173
    .line 174
    .line 175
    goto :goto_2
.end method

.method public seekObjectToField(JZ)I
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 4
    .line 5
    const/16 v2, 0x14

    .line 6
    .line 7
    const/4 v3, -0x1

    .line 8
    if-ne v1, v2, :cond_0

    .line 9
    .line 10
    return v3

    .line 11
    :cond_0
    const/16 v2, 0xd

    .line 12
    .line 13
    if-eq v1, v2, :cond_1

    .line 14
    .line 15
    const/16 v4, 0xf

    .line 16
    .line 17
    if-ne v1, v4, :cond_2

    .line 18
    .line 19
    :cond_1
    move/from16 v16, v3

    .line 20
    .line 21
    goto/16 :goto_12

    .line 22
    .line 23
    :cond_2
    const/16 v5, 0x10

    .line 24
    .line 25
    const/16 v6, 0xc

    .line 26
    .line 27
    if-eq v1, v6, :cond_4

    .line 28
    .line 29
    if-ne v1, v5, :cond_3

    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_3
    invoke-static {v1}, Lcom/alibaba/fastjson/parser/JSONToken;->name(I)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-static {v0}, Ll/pr3;->a(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    :goto_0
    const/4 v0, 0x0

    .line 40
    return v0

    .line 41
    :cond_4
    :goto_1
    iget-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 42
    .line 43
    const/16 v7, 0x7d

    .line 44
    .line 45
    if-ne v1, v7, :cond_5

    .line 46
    .line 47
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONScanner;->next()C

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextToken()V

    .line 51
    .line 52
    .line 53
    return v3

    .line 54
    :cond_5
    const/16 v8, 0x1a

    .line 55
    .line 56
    if-ne v1, v8, :cond_6

    .line 57
    .line 58
    return v3

    .line 59
    :cond_6
    const/16 v9, 0x22

    .line 60
    .line 61
    if-eq v1, v9, :cond_7

    .line 62
    .line 63
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->skipWhitespace()V

    .line 64
    .line 65
    .line 66
    :cond_7
    iget-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 67
    .line 68
    if-ne v1, v9, :cond_36

    .line 69
    .line 70
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 71
    .line 72
    const/4 v10, 0x1

    .line 73
    add-int/2addr v1, v10

    .line 74
    const-wide v11, -0x340d631b7bdddcdbL    # -7.302176725335867E57

    .line 75
    .line 76
    .line 77
    .line 78
    .line 79
    :goto_2
    iget-object v13, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 80
    .line 81
    invoke-virtual {v13}, Ljava/lang/String;->length()I

    .line 82
    .line 83
    .line 84
    move-result v13

    .line 85
    if-ge v1, v13, :cond_c

    .line 86
    .line 87
    iget-object v13, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 88
    .line 89
    invoke-virtual {v13, v1}, Ljava/lang/String;->charAt(I)C

    .line 90
    .line 91
    .line 92
    move-result v13

    .line 93
    const/16 v14, 0x5c

    .line 94
    .line 95
    if-ne v13, v14, :cond_9

    .line 96
    .line 97
    add-int/lit8 v1, v1, 0x1

    .line 98
    .line 99
    iget-object v13, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 100
    .line 101
    invoke-virtual {v13}, Ljava/lang/String;->length()I

    .line 102
    .line 103
    .line 104
    move-result v13

    .line 105
    if-eq v1, v13, :cond_8

    .line 106
    .line 107
    iget-object v13, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 108
    .line 109
    invoke-virtual {v13, v1}, Ljava/lang/String;->charAt(I)C

    .line 110
    .line 111
    .line 112
    move-result v13

    .line 113
    goto :goto_3

    .line 114
    :cond_8
    const-string v1, "unclosed str, "

    .line 115
    .line 116
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONScanner;->info()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-static {v1, v0}, Ll/wkq;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 121
    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_9
    :goto_3
    if-ne v13, v9, :cond_b

    .line 125
    .line 126
    add-int/lit8 v1, v1, 0x1

    .line 127
    .line 128
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 129
    .line 130
    iget-object v13, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 131
    .line 132
    invoke-virtual {v13}, Ljava/lang/String;->length()I

    .line 133
    .line 134
    .line 135
    move-result v13

    .line 136
    if-lt v1, v13, :cond_a

    .line 137
    .line 138
    move v1, v8

    .line 139
    goto :goto_4

    .line 140
    :cond_a
    iget-object v1, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 141
    .line 142
    iget v13, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 143
    .line 144
    invoke-virtual {v1, v13}, Ljava/lang/String;->charAt(I)C

    .line 145
    .line 146
    .line 147
    move-result v1

    .line 148
    :goto_4
    iput-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 149
    .line 150
    goto :goto_5

    .line 151
    :cond_b
    int-to-long v13, v13

    .line 152
    xor-long/2addr v11, v13

    .line 153
    const-wide v13, 0x100000001b3L

    .line 154
    .line 155
    .line 156
    .line 157
    .line 158
    mul-long/2addr v11, v13

    .line 159
    add-int/lit8 v1, v1, 0x1

    .line 160
    .line 161
    goto :goto_2

    .line 162
    :cond_c
    :goto_5
    cmp-long v1, v11, p1

    .line 163
    .line 164
    iget-char v11, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 165
    .line 166
    const/4 v12, 0x2

    .line 167
    const/4 v13, 0x0

    .line 168
    const/16 v14, 0x3a

    .line 169
    .line 170
    const/16 v15, 0x39

    .line 171
    .line 172
    move/from16 v16, v3

    .line 173
    .line 174
    const/16 v3, 0x30

    .line 175
    .line 176
    const/16 v8, 0x2c

    .line 177
    .line 178
    if-nez v1, :cond_17

    .line 179
    .line 180
    if-eq v11, v14, :cond_d

    .line 181
    .line 182
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->skipWhitespace()V

    .line 183
    .line 184
    .line 185
    :cond_d
    iget-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 186
    .line 187
    if-ne v1, v14, :cond_16

    .line 188
    .line 189
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 190
    .line 191
    add-int/2addr v1, v10

    .line 192
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 193
    .line 194
    iget-object v6, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 195
    .line 196
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    .line 197
    .line 198
    .line 199
    move-result v6

    .line 200
    if-lt v1, v6, :cond_e

    .line 201
    .line 202
    const/16 v1, 0x1a

    .line 203
    .line 204
    goto :goto_6

    .line 205
    :cond_e
    iget-object v6, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 206
    .line 207
    invoke-virtual {v6, v1}, Ljava/lang/String;->charAt(I)C

    .line 208
    .line 209
    .line 210
    move-result v1

    .line 211
    :goto_6
    iput-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 212
    .line 213
    if-ne v1, v8, :cond_10

    .line 214
    .line 215
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 216
    .line 217
    add-int/2addr v1, v10

    .line 218
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 219
    .line 220
    iget-object v2, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 221
    .line 222
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 223
    .line 224
    .line 225
    move-result v2

    .line 226
    if-lt v1, v2, :cond_f

    .line 227
    .line 228
    const/16 v8, 0x1a

    .line 229
    .line 230
    goto :goto_7

    .line 231
    :cond_f
    iget-object v2, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 232
    .line 233
    invoke-virtual {v2, v1}, Ljava/lang/String;->charAt(I)C

    .line 234
    .line 235
    .line 236
    move-result v8

    .line 237
    :goto_7
    iput-char v8, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 238
    .line 239
    iput v5, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 240
    .line 241
    goto :goto_a

    .line 242
    :cond_10
    const/16 v5, 0x5d

    .line 243
    .line 244
    if-ne v1, v5, :cond_12

    .line 245
    .line 246
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 247
    .line 248
    add-int/2addr v1, v10

    .line 249
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 250
    .line 251
    iget-object v2, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 252
    .line 253
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 254
    .line 255
    .line 256
    move-result v2

    .line 257
    if-lt v1, v2, :cond_11

    .line 258
    .line 259
    const/16 v8, 0x1a

    .line 260
    .line 261
    goto :goto_8

    .line 262
    :cond_11
    iget-object v2, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 263
    .line 264
    invoke-virtual {v2, v1}, Ljava/lang/String;->charAt(I)C

    .line 265
    .line 266
    .line 267
    move-result v8

    .line 268
    :goto_8
    iput-char v8, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 269
    .line 270
    iput v4, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 271
    .line 272
    goto :goto_a

    .line 273
    :cond_12
    if-ne v1, v7, :cond_14

    .line 274
    .line 275
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 276
    .line 277
    add-int/2addr v1, v10

    .line 278
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 279
    .line 280
    iget-object v3, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 281
    .line 282
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    .line 283
    .line 284
    .line 285
    move-result v3

    .line 286
    if-lt v1, v3, :cond_13

    .line 287
    .line 288
    const/16 v8, 0x1a

    .line 289
    .line 290
    goto :goto_9

    .line 291
    :cond_13
    iget-object v3, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 292
    .line 293
    invoke-virtual {v3, v1}, Ljava/lang/String;->charAt(I)C

    .line 294
    .line 295
    .line 296
    move-result v8

    .line 297
    :goto_9
    iput-char v8, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 298
    .line 299
    iput v2, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 300
    .line 301
    goto :goto_a

    .line 302
    :cond_14
    if-lt v1, v3, :cond_15

    .line 303
    .line 304
    if-gt v1, v15, :cond_15

    .line 305
    .line 306
    iput v13, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 307
    .line 308
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 309
    .line 310
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->pos:I

    .line 311
    .line 312
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanNumber()V

    .line 313
    .line 314
    .line 315
    goto :goto_a

    .line 316
    :cond_15
    invoke-virtual {v0, v12}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextToken(I)V

    .line 317
    .line 318
    .line 319
    :cond_16
    :goto_a
    const/4 v0, 0x3

    .line 320
    return v0

    .line 321
    :cond_17
    if-eq v11, v14, :cond_18

    .line 322
    .line 323
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->skipWhitespace()V

    .line 324
    .line 325
    .line 326
    :cond_18
    iget-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 327
    .line 328
    if-ne v1, v14, :cond_35

    .line 329
    .line 330
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 331
    .line 332
    add-int/2addr v1, v10

    .line 333
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 334
    .line 335
    iget-object v11, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 336
    .line 337
    invoke-virtual {v11}, Ljava/lang/String;->length()I

    .line 338
    .line 339
    .line 340
    move-result v11

    .line 341
    if-lt v1, v11, :cond_19

    .line 342
    .line 343
    const/16 v1, 0x1a

    .line 344
    .line 345
    goto :goto_b

    .line 346
    :cond_19
    iget-object v11, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 347
    .line 348
    invoke-virtual {v11, v1}, Ljava/lang/String;->charAt(I)C

    .line 349
    .line 350
    .line 351
    move-result v1

    .line 352
    :goto_b
    iput-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 353
    .line 354
    const/16 v11, 0x5b

    .line 355
    .line 356
    const/16 v14, 0x7b

    .line 357
    .line 358
    const/16 v4, 0x2d

    .line 359
    .line 360
    const/16 v5, 0x2b

    .line 361
    .line 362
    move/from16 v17, v10

    .line 363
    .line 364
    if-eq v1, v9, :cond_1a

    .line 365
    .line 366
    const/16 v10, 0x27

    .line 367
    .line 368
    if-eq v1, v10, :cond_1a

    .line 369
    .line 370
    if-eq v1, v14, :cond_1a

    .line 371
    .line 372
    if-eq v1, v11, :cond_1a

    .line 373
    .line 374
    if-eq v1, v3, :cond_1a

    .line 375
    .line 376
    const/16 v10, 0x31

    .line 377
    .line 378
    if-eq v1, v10, :cond_1a

    .line 379
    .line 380
    const/16 v10, 0x32

    .line 381
    .line 382
    if-eq v1, v10, :cond_1a

    .line 383
    .line 384
    const/16 v10, 0x33

    .line 385
    .line 386
    if-eq v1, v10, :cond_1a

    .line 387
    .line 388
    const/16 v10, 0x34

    .line 389
    .line 390
    if-eq v1, v10, :cond_1a

    .line 391
    .line 392
    const/16 v10, 0x35

    .line 393
    .line 394
    if-eq v1, v10, :cond_1a

    .line 395
    .line 396
    const/16 v10, 0x36

    .line 397
    .line 398
    if-eq v1, v10, :cond_1a

    .line 399
    .line 400
    const/16 v10, 0x37

    .line 401
    .line 402
    if-eq v1, v10, :cond_1a

    .line 403
    .line 404
    const/16 v10, 0x38

    .line 405
    .line 406
    if-eq v1, v10, :cond_1a

    .line 407
    .line 408
    if-eq v1, v15, :cond_1a

    .line 409
    .line 410
    if-eq v1, v5, :cond_1a

    .line 411
    .line 412
    if-eq v1, v4, :cond_1a

    .line 413
    .line 414
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->skipWhitespace()V

    .line 415
    .line 416
    .line 417
    :cond_1a
    iget-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 418
    .line 419
    const/16 v10, 0x65

    .line 420
    .line 421
    if-eq v1, v4, :cond_2c

    .line 422
    .line 423
    if-eq v1, v5, :cond_2c

    .line 424
    .line 425
    if-lt v1, v3, :cond_1b

    .line 426
    .line 427
    if-gt v1, v15, :cond_1b

    .line 428
    .line 429
    goto/16 :goto_d

    .line 430
    .line 431
    :cond_1b
    if-ne v1, v9, :cond_1d

    .line 432
    .line 433
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONScanner;->skipString()V

    .line 434
    .line 435
    .line 436
    iget-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 437
    .line 438
    if-eq v1, v8, :cond_1c

    .line 439
    .line 440
    if-eq v1, v7, :cond_1c

    .line 441
    .line 442
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->skipWhitespace()V

    .line 443
    .line 444
    .line 445
    :cond_1c
    iget-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 446
    .line 447
    if-ne v1, v8, :cond_34

    .line 448
    .line 449
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONScanner;->next()C

    .line 450
    .line 451
    .line 452
    goto/16 :goto_11

    .line 453
    .line 454
    :cond_1d
    const/16 v3, 0x74

    .line 455
    .line 456
    const/16 v4, 0x75

    .line 457
    .line 458
    if-ne v1, v3, :cond_20

    .line 459
    .line 460
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONScanner;->next()C

    .line 461
    .line 462
    .line 463
    iget-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 464
    .line 465
    const/16 v3, 0x72

    .line 466
    .line 467
    if-ne v1, v3, :cond_1e

    .line 468
    .line 469
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONScanner;->next()C

    .line 470
    .line 471
    .line 472
    iget-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 473
    .line 474
    if-ne v1, v4, :cond_1e

    .line 475
    .line 476
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONScanner;->next()C

    .line 477
    .line 478
    .line 479
    iget-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 480
    .line 481
    if-ne v1, v10, :cond_1e

    .line 482
    .line 483
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONScanner;->next()C

    .line 484
    .line 485
    .line 486
    :cond_1e
    iget-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 487
    .line 488
    if-eq v1, v8, :cond_1f

    .line 489
    .line 490
    if-eq v1, v7, :cond_1f

    .line 491
    .line 492
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->skipWhitespace()V

    .line 493
    .line 494
    .line 495
    :cond_1f
    iget-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 496
    .line 497
    if-ne v1, v8, :cond_34

    .line 498
    .line 499
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONScanner;->next()C

    .line 500
    .line 501
    .line 502
    goto/16 :goto_11

    .line 503
    .line 504
    :cond_20
    const/16 v3, 0x6e

    .line 505
    .line 506
    const/16 v5, 0x6c

    .line 507
    .line 508
    if-ne v1, v3, :cond_23

    .line 509
    .line 510
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONScanner;->next()C

    .line 511
    .line 512
    .line 513
    iget-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 514
    .line 515
    if-ne v1, v4, :cond_21

    .line 516
    .line 517
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONScanner;->next()C

    .line 518
    .line 519
    .line 520
    iget-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 521
    .line 522
    if-ne v1, v5, :cond_21

    .line 523
    .line 524
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONScanner;->next()C

    .line 525
    .line 526
    .line 527
    iget-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 528
    .line 529
    if-ne v1, v5, :cond_21

    .line 530
    .line 531
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONScanner;->next()C

    .line 532
    .line 533
    .line 534
    :cond_21
    iget-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 535
    .line 536
    if-eq v1, v8, :cond_22

    .line 537
    .line 538
    if-eq v1, v7, :cond_22

    .line 539
    .line 540
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->skipWhitespace()V

    .line 541
    .line 542
    .line 543
    :cond_22
    iget-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 544
    .line 545
    if-ne v1, v8, :cond_34

    .line 546
    .line 547
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONScanner;->next()C

    .line 548
    .line 549
    .line 550
    goto/16 :goto_11

    .line 551
    .line 552
    :cond_23
    const/16 v3, 0x66

    .line 553
    .line 554
    if-ne v1, v3, :cond_26

    .line 555
    .line 556
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONScanner;->next()C

    .line 557
    .line 558
    .line 559
    iget-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 560
    .line 561
    const/16 v3, 0x61

    .line 562
    .line 563
    if-ne v1, v3, :cond_24

    .line 564
    .line 565
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONScanner;->next()C

    .line 566
    .line 567
    .line 568
    iget-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 569
    .line 570
    if-ne v1, v5, :cond_24

    .line 571
    .line 572
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONScanner;->next()C

    .line 573
    .line 574
    .line 575
    iget-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 576
    .line 577
    const/16 v3, 0x73

    .line 578
    .line 579
    if-ne v1, v3, :cond_24

    .line 580
    .line 581
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONScanner;->next()C

    .line 582
    .line 583
    .line 584
    iget-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 585
    .line 586
    if-ne v1, v10, :cond_24

    .line 587
    .line 588
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONScanner;->next()C

    .line 589
    .line 590
    .line 591
    :cond_24
    iget-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 592
    .line 593
    if-eq v1, v8, :cond_25

    .line 594
    .line 595
    if-eq v1, v7, :cond_25

    .line 596
    .line 597
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->skipWhitespace()V

    .line 598
    .line 599
    .line 600
    :cond_25
    iget-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 601
    .line 602
    if-ne v1, v8, :cond_34

    .line 603
    .line 604
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONScanner;->next()C

    .line 605
    .line 606
    .line 607
    goto/16 :goto_11

    .line 608
    .line 609
    :cond_26
    if-ne v1, v14, :cond_29

    .line 610
    .line 611
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 612
    .line 613
    add-int/lit8 v1, v1, 0x1

    .line 614
    .line 615
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 616
    .line 617
    iget-object v3, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 618
    .line 619
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    .line 620
    .line 621
    .line 622
    move-result v3

    .line 623
    if-lt v1, v3, :cond_27

    .line 624
    .line 625
    const/16 v8, 0x1a

    .line 626
    .line 627
    goto :goto_c

    .line 628
    :cond_27
    iget-object v3, v0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 629
    .line 630
    invoke-virtual {v3, v1}, Ljava/lang/String;->charAt(I)C

    .line 631
    .line 632
    .line 633
    move-result v8

    .line 634
    :goto_c
    iput-char v8, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 635
    .line 636
    if-eqz p3, :cond_28

    .line 637
    .line 638
    iput v6, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 639
    .line 640
    return v17

    .line 641
    :cond_28
    invoke-virtual {v0, v13}, Lcom/alibaba/fastjson/parser/JSONScanner;->skipObject(Z)V

    .line 642
    .line 643
    .line 644
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 645
    .line 646
    if-ne v1, v2, :cond_34

    .line 647
    .line 648
    return v16

    .line 649
    :cond_29
    if-ne v1, v11, :cond_2b

    .line 650
    .line 651
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONScanner;->next()C

    .line 652
    .line 653
    .line 654
    if-eqz p3, :cond_2a

    .line 655
    .line 656
    const/16 v1, 0xe

    .line 657
    .line 658
    iput v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 659
    .line 660
    return v12

    .line 661
    :cond_2a
    invoke-virtual {v0, v13}, Lcom/alibaba/fastjson/parser/JSONScanner;->skipArray(Z)V

    .line 662
    .line 663
    .line 664
    iget v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 665
    .line 666
    if-ne v1, v2, :cond_34

    .line 667
    .line 668
    return v16

    .line 669
    :cond_2b
    invoke-static {}, Ll/l710;->a()V

    .line 670
    .line 671
    .line 672
    goto/16 :goto_0

    .line 673
    .line 674
    :cond_2c
    :goto_d
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONScanner;->next()C

    .line 675
    .line 676
    .line 677
    :goto_e
    iget-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 678
    .line 679
    if-lt v1, v3, :cond_2d

    .line 680
    .line 681
    if-gt v1, v15, :cond_2d

    .line 682
    .line 683
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONScanner;->next()C

    .line 684
    .line 685
    .line 686
    goto :goto_e

    .line 687
    :cond_2d
    const/16 v7, 0x2e

    .line 688
    .line 689
    if-ne v1, v7, :cond_2e

    .line 690
    .line 691
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONScanner;->next()C

    .line 692
    .line 693
    .line 694
    :goto_f
    iget-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 695
    .line 696
    if-lt v1, v3, :cond_2e

    .line 697
    .line 698
    if-gt v1, v15, :cond_2e

    .line 699
    .line 700
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONScanner;->next()C

    .line 701
    .line 702
    .line 703
    goto :goto_f

    .line 704
    :cond_2e
    iget-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 705
    .line 706
    const/16 v7, 0x45

    .line 707
    .line 708
    if-eq v1, v7, :cond_2f

    .line 709
    .line 710
    if-ne v1, v10, :cond_32

    .line 711
    .line 712
    :cond_2f
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONScanner;->next()C

    .line 713
    .line 714
    .line 715
    iget-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 716
    .line 717
    if-eq v1, v4, :cond_30

    .line 718
    .line 719
    if-ne v1, v5, :cond_31

    .line 720
    .line 721
    :cond_30
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONScanner;->next()C

    .line 722
    .line 723
    .line 724
    :cond_31
    :goto_10
    iget-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 725
    .line 726
    if-lt v1, v3, :cond_32

    .line 727
    .line 728
    if-gt v1, v15, :cond_32

    .line 729
    .line 730
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONScanner;->next()C

    .line 731
    .line 732
    .line 733
    goto :goto_10

    .line 734
    :cond_32
    iget-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 735
    .line 736
    if-eq v1, v8, :cond_33

    .line 737
    .line 738
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->skipWhitespace()V

    .line 739
    .line 740
    .line 741
    :cond_33
    iget-char v1, v0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 742
    .line 743
    if-ne v1, v8, :cond_34

    .line 744
    .line 745
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONScanner;->next()C

    .line 746
    .line 747
    .line 748
    :cond_34
    :goto_11
    move/from16 v3, v16

    .line 749
    .line 750
    const/16 v4, 0xf

    .line 751
    .line 752
    const/16 v5, 0x10

    .line 753
    .line 754
    goto/16 :goto_1

    .line 755
    .line 756
    :cond_35
    const-string v1, "illegal json, "

    .line 757
    .line 758
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONScanner;->info()Ljava/lang/String;

    .line 759
    .line 760
    .line 761
    move-result-object v0

    .line 762
    invoke-static {v1, v0}, Ll/wkq;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 763
    .line 764
    .line 765
    goto/16 :goto_0

    .line 766
    .line 767
    :cond_36
    invoke-static {}, Ll/l710;->a()V

    .line 768
    .line 769
    .line 770
    goto/16 :goto_0

    .line 771
    .line 772
    :goto_12
    invoke-virtual {v0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextToken()V

    .line 773
    .line 774
    .line 775
    return v16
.end method

.method public seekObjectToField([J)I
    .locals 14

    .line 776
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    const/16 v1, 0xc

    const/16 v2, 0x10

    const/4 v3, 0x0

    if-eq v0, v1, :cond_1

    if-ne v0, v2, :cond_0

    goto :goto_0

    .line 777
    :cond_0
    invoke-static {}, Ll/l710;->a()V

    return v3

    .line 778
    :cond_1
    :goto_0
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x7d

    const/4 v4, -0x1

    if-ne v0, v1, :cond_2

    .line 779
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONScanner;->next()C

    .line 780
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextToken()V

    .line 781
    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    return v4

    :cond_2
    const/16 v5, 0x1a

    if-ne v0, v5, :cond_3

    .line 782
    iput v4, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    return v4

    :cond_3
    const/16 v6, 0x22

    if-eq v0, v6, :cond_4

    .line 783
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->skipWhitespace()V

    .line 784
    :cond_4
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-ne v0, v6, :cond_29

    .line 785
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v0, v0, 0x1

    const-wide v7, -0x340d631b7bdddcdbL    # -7.302176725335867E57

    :goto_1
    iget-object v9, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    if-ge v0, v9, :cond_9

    .line 786
    iget-object v9, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    invoke-virtual {v9, v0}, Ljava/lang/String;->charAt(I)C

    move-result v9

    const/16 v10, 0x5c

    if-ne v9, v10, :cond_6

    add-int/lit8 v0, v0, 0x1

    .line 787
    iget-object v9, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    if-eq v0, v9, :cond_5

    .line 788
    iget-object v9, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    invoke-virtual {v9, v0}, Ljava/lang/String;->charAt(I)C

    move-result v9

    goto :goto_2

    .line 789
    :cond_5
    const-string p1, "unclosed str, "

    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONScanner;->info()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Ll/wkq;->a(Ljava/lang/String;Ljava/lang/Object;)V

    return v3

    :cond_6
    :goto_2
    if-ne v9, v6, :cond_8

    add-int/lit8 v0, v0, 0x1

    .line 790
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 791
    iget-object v9, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    if-lt v0, v9, :cond_7

    move v0, v5

    goto :goto_3

    :cond_7
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    iget v9, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 792
    invoke-virtual {v0, v9}, Ljava/lang/String;->charAt(I)C

    move-result v0

    :goto_3
    iput-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    goto :goto_4

    :cond_8
    int-to-long v9, v9

    xor-long/2addr v7, v9

    const-wide v9, 0x100000001b3L

    mul-long/2addr v7, v9

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_9
    :goto_4
    move v0, v3

    .line 793
    :goto_5
    array-length v9, p1

    if-ge v0, v9, :cond_b

    .line 794
    aget-wide v9, p1, v0

    cmp-long v9, v7, v9

    if-nez v9, :cond_a

    goto :goto_6

    :cond_a
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    :cond_b
    move v0, v4

    .line 795
    :goto_6
    iget-char v7, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v8, 0x3a

    const/16 v9, 0x2c

    const/16 v10, 0x39

    const/16 v11, 0x30

    if-eq v0, v4, :cond_16

    if-eq v7, v8, :cond_c

    .line 796
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->skipWhitespace()V

    .line 797
    :cond_c
    iget-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-ne p1, v8, :cond_15

    .line 798
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 799
    iget-object v4, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-lt p1, v4, :cond_d

    move p1, v5

    goto :goto_7

    :cond_d
    iget-object v4, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 800
    invoke-virtual {v4, p1}, Ljava/lang/String;->charAt(I)C

    move-result p1

    :goto_7
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-ne p1, v9, :cond_f

    .line 801
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 802
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lt p1, v1, :cond_e

    goto :goto_8

    :cond_e
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 803
    invoke-virtual {v1, p1}, Ljava/lang/String;->charAt(I)C

    move-result v5

    :goto_8
    iput-char v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 804
    iput v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    goto :goto_b

    :cond_f
    const/16 v2, 0x5d

    if-ne p1, v2, :cond_11

    .line 805
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 806
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lt p1, v1, :cond_10

    goto :goto_9

    :cond_10
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 807
    invoke-virtual {v1, p1}, Ljava/lang/String;->charAt(I)C

    move-result v5

    :goto_9
    iput-char v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 p1, 0xf

    .line 808
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    goto :goto_b

    :cond_11
    if-ne p1, v1, :cond_13

    .line 809
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 810
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lt p1, v1, :cond_12

    goto :goto_a

    :cond_12
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 811
    invoke-virtual {v1, p1}, Ljava/lang/String;->charAt(I)C

    move-result v5

    :goto_a
    iput-char v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 p1, 0xd

    .line 812
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    goto :goto_b

    :cond_13
    if-lt p1, v11, :cond_14

    if-gt p1, v10, :cond_14

    .line 813
    iput v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 814
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->pos:I

    .line 815
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->scanNumber()V

    goto :goto_b

    :cond_14
    const/4 p1, 0x2

    .line 816
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextToken(I)V

    :cond_15
    :goto_b
    const/4 p1, 0x3

    .line 817
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->matchStat:I

    return v0

    :cond_16
    if-eq v7, v8, :cond_17

    .line 818
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->skipWhitespace()V

    .line 819
    :cond_17
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-ne v0, v8, :cond_28

    .line 820
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 821
    iget-object v4, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-lt v0, v4, :cond_18

    move v0, v5

    goto :goto_c

    :cond_18
    iget-object v4, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 822
    invoke-virtual {v4, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    :goto_c
    iput-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v4, 0x5b

    const/16 v7, 0x7b

    const/16 v8, 0x2d

    const/16 v12, 0x2b

    if-eq v0, v6, :cond_19

    const/16 v13, 0x27

    if-eq v0, v13, :cond_19

    if-eq v0, v7, :cond_19

    if-eq v0, v4, :cond_19

    if-eq v0, v11, :cond_19

    const/16 v13, 0x31

    if-eq v0, v13, :cond_19

    const/16 v13, 0x32

    if-eq v0, v13, :cond_19

    const/16 v13, 0x33

    if-eq v0, v13, :cond_19

    const/16 v13, 0x34

    if-eq v0, v13, :cond_19

    const/16 v13, 0x35

    if-eq v0, v13, :cond_19

    const/16 v13, 0x36

    if-eq v0, v13, :cond_19

    const/16 v13, 0x37

    if-eq v0, v13, :cond_19

    const/16 v13, 0x38

    if-eq v0, v13, :cond_19

    if-eq v0, v10, :cond_19

    if-eq v0, v12, :cond_19

    if-eq v0, v8, :cond_19

    .line 823
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->skipWhitespace()V

    .line 824
    :cond_19
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-eq v0, v8, :cond_20

    if-eq v0, v12, :cond_20

    if-lt v0, v11, :cond_1a

    if-gt v0, v10, :cond_1a

    goto :goto_e

    :cond_1a
    if-ne v0, v6, :cond_1c

    .line 825
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONScanner;->skipString()V

    .line 826
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-eq v0, v9, :cond_1b

    if-eq v0, v1, :cond_1b

    .line 827
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->skipWhitespace()V

    .line 828
    :cond_1b
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-ne v0, v9, :cond_1

    .line 829
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONScanner;->next()C

    goto/16 :goto_0

    :cond_1c
    if-ne v0, v7, :cond_1e

    .line 830
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 831
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lt v0, v1, :cond_1d

    goto :goto_d

    :cond_1d
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 832
    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v5

    :goto_d
    iput-char v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 833
    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/parser/JSONScanner;->skipObject(Z)V

    goto/16 :goto_0

    :cond_1e
    if-ne v0, v4, :cond_1f

    .line 834
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONScanner;->next()C

    .line 835
    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/parser/JSONScanner;->skipArray(Z)V

    goto/16 :goto_0

    .line 836
    :cond_1f
    invoke-static {}, Ll/l710;->a()V

    return v3

    .line 837
    :cond_20
    :goto_e
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONScanner;->next()C

    .line 838
    :goto_f
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-lt v0, v11, :cond_21

    if-gt v0, v10, :cond_21

    .line 839
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONScanner;->next()C

    goto :goto_f

    :cond_21
    const/16 v1, 0x2e

    if-ne v0, v1, :cond_22

    .line 840
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONScanner;->next()C

    .line 841
    :goto_10
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-lt v0, v11, :cond_22

    if-gt v0, v10, :cond_22

    .line 842
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONScanner;->next()C

    goto :goto_10

    .line 843
    :cond_22
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    const/16 v1, 0x45

    if-eq v0, v1, :cond_23

    const/16 v1, 0x65

    if-ne v0, v1, :cond_26

    .line 844
    :cond_23
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONScanner;->next()C

    .line 845
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-eq v0, v8, :cond_24

    if-ne v0, v12, :cond_25

    .line 846
    :cond_24
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONScanner;->next()C

    .line 847
    :cond_25
    :goto_11
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-lt v0, v11, :cond_26

    if-gt v0, v10, :cond_26

    .line 848
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONScanner;->next()C

    goto :goto_11

    .line 849
    :cond_26
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-eq v0, v9, :cond_27

    .line 850
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->skipWhitespace()V

    .line 851
    :cond_27
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    if-ne v0, v9, :cond_1

    .line 852
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONScanner;->next()C

    goto/16 :goto_0

    .line 853
    :cond_28
    const-string p1, "illegal json, "

    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONScanner;->info()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Ll/wkq;->a(Ljava/lang/String;Ljava/lang/Object;)V

    return v3

    .line 854
    :cond_29
    invoke-static {}, Ll/l710;->a()V

    return v3
.end method

.method public setTime(CCCCCC)V
    .locals 0

    .line 1
    add-int/lit8 p1, p1, -0x30

    .line 2
    .line 3
    mul-int/lit8 p1, p1, 0xa

    .line 4
    .line 5
    add-int/lit8 p2, p2, -0x30

    .line 6
    .line 7
    add-int/2addr p1, p2

    .line 8
    add-int/lit8 p3, p3, -0x30

    .line 9
    .line 10
    mul-int/lit8 p3, p3, 0xa

    .line 11
    .line 12
    add-int/lit8 p4, p4, -0x30

    .line 13
    .line 14
    add-int/2addr p3, p4

    .line 15
    add-int/lit8 p5, p5, -0x30

    .line 16
    .line 17
    mul-int/lit8 p5, p5, 0xa

    .line 18
    .line 19
    add-int/lit8 p6, p6, -0x30

    .line 20
    .line 21
    add-int/2addr p5, p6

    .line 22
    iget-object p2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->calendar:Ljava/util/Calendar;

    .line 23
    .line 24
    const/16 p4, 0xb

    .line 25
    .line 26
    invoke-virtual {p2, p4, p1}, Ljava/util/Calendar;->set(II)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->calendar:Ljava/util/Calendar;

    .line 30
    .line 31
    const/16 p2, 0xc

    .line 32
    .line 33
    invoke-virtual {p1, p2, p3}, Ljava/util/Calendar;->set(II)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->calendar:Ljava/util/Calendar;

    .line 37
    .line 38
    const/16 p1, 0xd

    .line 39
    .line 40
    invoke-virtual {p0, p1, p5}, Ljava/util/Calendar;->set(II)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public setTimeZone(CCC)V
    .locals 6

    const/16 v4, 0x30

    const/16 v5, 0x30

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    .line 61
    invoke-virtual/range {v0 .. v5}, Lcom/alibaba/fastjson/parser/JSONScanner;->setTimeZone(CCCCC)V

    return-void
.end method

.method public setTimeZone(CCCCC)V
    .locals 0

    .line 1
    add-int/lit8 p2, p2, -0x30

    .line 2
    .line 3
    mul-int/lit8 p2, p2, 0xa

    .line 4
    .line 5
    add-int/lit8 p3, p3, -0x30

    .line 6
    .line 7
    add-int/2addr p2, p3

    .line 8
    const p3, 0x36ee80

    .line 9
    .line 10
    .line 11
    mul-int/2addr p2, p3

    .line 12
    add-int/lit8 p4, p4, -0x30

    .line 13
    .line 14
    mul-int/lit8 p4, p4, 0xa

    .line 15
    .line 16
    add-int/lit8 p5, p5, -0x30

    .line 17
    .line 18
    add-int/2addr p4, p5

    .line 19
    const p3, 0xea60

    .line 20
    .line 21
    .line 22
    mul-int/2addr p4, p3

    .line 23
    add-int/2addr p2, p4

    .line 24
    const/16 p3, 0x2d

    .line 25
    .line 26
    if-ne p1, p3, :cond_0

    .line 27
    .line 28
    neg-int p2, p2

    .line 29
    :cond_0
    iget-object p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->calendar:Ljava/util/Calendar;

    .line 30
    .line 31
    invoke-virtual {p1}, Ljava/util/Calendar;->getTimeZone()Ljava/util/TimeZone;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p1}, Ljava/util/TimeZone;->getRawOffset()I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eq p1, p2, :cond_1

    .line 40
    .line 41
    invoke-static {p2}, Ljava/util/TimeZone;->getAvailableIDs(I)[Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    array-length p2, p1

    .line 46
    if-lez p2, :cond_1

    .line 47
    .line 48
    const/4 p2, 0x0

    .line 49
    aget-object p1, p1, p2

    .line 50
    .line 51
    invoke-static {p1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    iget-object p0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->calendar:Ljava/util/Calendar;

    .line 56
    .line 57
    invoke-virtual {p0, p1}, Ljava/util/Calendar;->setTimeZone(Ljava/util/TimeZone;)V

    .line 58
    .line 59
    .line 60
    :cond_1
    return-void
.end method

.method public final skipArray()V
    .locals 1

    const/4 v0, 0x0

    .line 165
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONScanner;->skipArray(Z)V

    return-void
.end method

.method public final skipArray(Z)V
    .locals 6

    .line 1
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    move v2, v1

    .line 5
    :goto_0
    iget-object v3, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    iget-object v4, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 12
    .line 13
    const-string v5, "illegal str, "

    .line 14
    .line 15
    if-ge v0, v3, :cond_a

    .line 16
    .line 17
    invoke-virtual {v4, v0}, Ljava/lang/String;->charAt(I)C

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    const/16 v4, 0x5c

    .line 22
    .line 23
    if-ne v3, v4, :cond_1

    .line 24
    .line 25
    iget v4, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->len:I

    .line 26
    .line 27
    add-int/lit8 v4, v4, -0x1

    .line 28
    .line 29
    if-ge v0, v4, :cond_0

    .line 30
    .line 31
    add-int/lit8 v0, v0, 0x1

    .line 32
    .line 33
    goto/16 :goto_2

    .line 34
    .line 35
    :cond_0
    iput-char v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 36
    .line 37
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONScanner;->info()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-static {v5, p0}, Ll/wkq;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    const/16 v4, 0x22

    .line 48
    .line 49
    if-ne v3, v4, :cond_2

    .line 50
    .line 51
    xor-int/lit8 v1, v1, 0x1

    .line 52
    .line 53
    goto :goto_2

    .line 54
    :cond_2
    const/16 v4, 0x5b

    .line 55
    .line 56
    if-ne v3, v4, :cond_4

    .line 57
    .line 58
    if-eqz v1, :cond_3

    .line 59
    .line 60
    goto :goto_2

    .line 61
    :cond_3
    add-int/lit8 v2, v2, 0x1

    .line 62
    .line 63
    goto :goto_2

    .line 64
    :cond_4
    const/16 v4, 0x7b

    .line 65
    .line 66
    const/16 v5, 0x1a

    .line 67
    .line 68
    if-ne v3, v4, :cond_6

    .line 69
    .line 70
    if-eqz p1, :cond_6

    .line 71
    .line 72
    iget v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 73
    .line 74
    add-int/lit8 v3, v3, 0x1

    .line 75
    .line 76
    iput v3, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 77
    .line 78
    iget-object v4, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 81
    .line 82
    .line 83
    move-result v4

    .line 84
    if-lt v3, v4, :cond_5

    .line 85
    .line 86
    goto :goto_1

    .line 87
    :cond_5
    iget-object v4, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 88
    .line 89
    invoke-virtual {v4, v3}, Ljava/lang/String;->charAt(I)C

    .line 90
    .line 91
    .line 92
    move-result v5

    .line 93
    :goto_1
    iput-char v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 94
    .line 95
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONScanner;->skipObject(Z)V

    .line 96
    .line 97
    .line 98
    goto :goto_2

    .line 99
    :cond_6
    const/16 v4, 0x5d

    .line 100
    .line 101
    if-ne v3, v4, :cond_9

    .line 102
    .line 103
    if-eqz v1, :cond_7

    .line 104
    .line 105
    goto :goto_2

    .line 106
    :cond_7
    add-int/lit8 v2, v2, -0x1

    .line 107
    .line 108
    const/4 v3, -0x1

    .line 109
    if-ne v2, v3, :cond_9

    .line 110
    .line 111
    add-int/lit8 v0, v0, 0x1

    .line 112
    .line 113
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 114
    .line 115
    iget-object p1, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 116
    .line 117
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 118
    .line 119
    .line 120
    move-result p1

    .line 121
    if-ne v0, p1, :cond_8

    .line 122
    .line 123
    iput-char v5, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 124
    .line 125
    const/16 p1, 0x14

    .line 126
    .line 127
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 128
    .line 129
    return-void

    .line 130
    :cond_8
    iget-object p1, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 131
    .line 132
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 133
    .line 134
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    .line 135
    .line 136
    .line 137
    move-result p1

    .line 138
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 139
    .line 140
    const/16 p1, 0x10

    .line 141
    .line 142
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextToken(I)V

    .line 143
    .line 144
    .line 145
    return-void

    .line 146
    :cond_9
    :goto_2
    add-int/lit8 v0, v0, 0x1

    .line 147
    .line 148
    goto/16 :goto_0

    .line 149
    .line 150
    :cond_a
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 151
    .line 152
    .line 153
    move-result p1

    .line 154
    if-eq v0, p1, :cond_b

    .line 155
    .line 156
    return-void

    .line 157
    :cond_b
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONScanner;->info()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object p0

    .line 161
    invoke-static {v5, p0}, Ll/wkq;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 162
    .line 163
    .line 164
    return-void
.end method

.method public final skipObject()V
    .locals 1

    const/4 v0, 0x0

    .line 185
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/parser/JSONScanner;->skipObject(Z)V

    return-void
.end method

.method public final skipObject(Z)V
    .locals 5

    .line 1
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    move v1, v0

    .line 5
    :goto_0
    iget-object v2, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    iget-object v3, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 12
    .line 13
    const-string v4, "illegal str, "

    .line 14
    .line 15
    if-ge p1, v2, :cond_c

    .line 16
    .line 17
    invoke-virtual {v3, p1}, Ljava/lang/String;->charAt(I)C

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    const/16 v3, 0x5c

    .line 22
    .line 23
    if-ne v2, v3, :cond_1

    .line 24
    .line 25
    iget v3, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->len:I

    .line 26
    .line 27
    add-int/lit8 v3, v3, -0x1

    .line 28
    .line 29
    if-ge p1, v3, :cond_0

    .line 30
    .line 31
    add-int/lit8 p1, p1, 0x1

    .line 32
    .line 33
    goto/16 :goto_2

    .line 34
    .line 35
    :cond_0
    iput-char v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 36
    .line 37
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONScanner;->info()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-static {v4, p0}, Ll/wkq;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    const/16 v3, 0x22

    .line 48
    .line 49
    if-ne v2, v3, :cond_2

    .line 50
    .line 51
    xor-int/lit8 v0, v0, 0x1

    .line 52
    .line 53
    goto/16 :goto_2

    .line 54
    .line 55
    :cond_2
    const/16 v3, 0x7b

    .line 56
    .line 57
    if-ne v2, v3, :cond_4

    .line 58
    .line 59
    if-eqz v0, :cond_3

    .line 60
    .line 61
    goto :goto_2

    .line 62
    :cond_3
    add-int/lit8 v1, v1, 0x1

    .line 63
    .line 64
    goto :goto_2

    .line 65
    :cond_4
    const/16 v3, 0x7d

    .line 66
    .line 67
    if-ne v2, v3, :cond_b

    .line 68
    .line 69
    if-eqz v0, :cond_5

    .line 70
    .line 71
    goto :goto_2

    .line 72
    :cond_5
    add-int/lit8 v1, v1, -0x1

    .line 73
    .line 74
    const/4 v2, -0x1

    .line 75
    if-ne v1, v2, :cond_b

    .line 76
    .line 77
    add-int/lit8 p1, p1, 0x1

    .line 78
    .line 79
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 80
    .line 81
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 82
    .line 83
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    const/16 v1, 0x1a

    .line 88
    .line 89
    if-ne p1, v0, :cond_6

    .line 90
    .line 91
    iput-char v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 92
    .line 93
    const/16 p1, 0x14

    .line 94
    .line 95
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 96
    .line 97
    return-void

    .line 98
    :cond_6
    iget-object p1, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 99
    .line 100
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 101
    .line 102
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    .line 103
    .line 104
    .line 105
    move-result p1

    .line 106
    iput-char p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 107
    .line 108
    const/16 v0, 0x2c

    .line 109
    .line 110
    const/16 v2, 0x10

    .line 111
    .line 112
    if-ne p1, v0, :cond_8

    .line 113
    .line 114
    iput v2, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 115
    .line 116
    iget p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 117
    .line 118
    add-int/lit8 p1, p1, 0x1

    .line 119
    .line 120
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 121
    .line 122
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 123
    .line 124
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    if-lt p1, v0, :cond_7

    .line 129
    .line 130
    goto :goto_1

    .line 131
    :cond_7
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 132
    .line 133
    invoke-virtual {v0, p1}, Ljava/lang/String;->charAt(I)C

    .line 134
    .line 135
    .line 136
    move-result v1

    .line 137
    :goto_1
    iput-char v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 138
    .line 139
    return-void

    .line 140
    :cond_8
    if-ne p1, v3, :cond_9

    .line 141
    .line 142
    const/16 p1, 0xd

    .line 143
    .line 144
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 145
    .line 146
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONScanner;->next()C

    .line 147
    .line 148
    .line 149
    return-void

    .line 150
    :cond_9
    const/16 v0, 0x5d

    .line 151
    .line 152
    if-ne p1, v0, :cond_a

    .line 153
    .line 154
    const/16 p1, 0xf

    .line 155
    .line 156
    iput p1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->token:I

    .line 157
    .line 158
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONScanner;->next()C

    .line 159
    .line 160
    .line 161
    return-void

    .line 162
    :cond_a
    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/parser/JSONLexerBase;->nextToken(I)V

    .line 163
    .line 164
    .line 165
    return-void

    .line 166
    :cond_b
    :goto_2
    add-int/lit8 p1, p1, 0x1

    .line 167
    .line 168
    goto/16 :goto_0

    .line 169
    .line 170
    :cond_c
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    .line 171
    .line 172
    .line 173
    move-result v0

    .line 174
    if-eq p1, v0, :cond_d

    .line 175
    .line 176
    return-void

    .line 177
    :cond_d
    invoke-virtual {p0}, Lcom/alibaba/fastjson/parser/JSONScanner;->info()Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object p0

    .line 181
    invoke-static {v4, p0}, Ll/wkq;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 182
    .line 183
    .line 184
    return-void
.end method

.method public final skipString()V
    .locals 4

    .line 1
    iget-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 2
    .line 3
    const/16 v1, 0x22

    .line 4
    .line 5
    if-ne v0, v1, :cond_3

    .line 6
    .line 7
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 8
    .line 9
    :cond_0
    :goto_0
    add-int/lit8 v0, v0, 0x1

    .line 10
    .line 11
    iget-object v2, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-ge v0, v2, :cond_2

    .line 18
    .line 19
    iget-object v2, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v2, v0}, Ljava/lang/String;->charAt(I)C

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    const/16 v3, 0x5c

    .line 26
    .line 27
    if-ne v2, v3, :cond_1

    .line 28
    .line 29
    iget v2, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->len:I

    .line 30
    .line 31
    add-int/lit8 v2, v2, -0x1

    .line 32
    .line 33
    if-ge v0, v2, :cond_0

    .line 34
    .line 35
    add-int/lit8 v0, v0, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    if-ne v2, v1, :cond_0

    .line 39
    .line 40
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 41
    .line 42
    add-int/lit8 v0, v0, 0x1

    .line 43
    .line 44
    iput v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->bp:I

    .line 45
    .line 46
    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    iput-char v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->ch:C

    .line 51
    .line 52
    return-void

    .line 53
    :cond_2
    const-string p0, "unclosed str"

    .line 54
    .line 55
    invoke-static {p0}, Ll/qkq;->a(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_3
    invoke-static {}, Ll/l710;->a()V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public final stringVal()Ljava/lang/String;
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->hasSpecial:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->np:I

    .line 6
    .line 7
    add-int/lit8 v0, v0, 0x1

    .line 8
    .line 9
    iget v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 10
    .line 11
    invoke-virtual {p0, v0, v1}, Lcom/alibaba/fastjson/parser/JSONScanner;->subString(II)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    new-instance v0, Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    iget p0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sp:I

    .line 22
    .line 23
    invoke-direct {v0, v1, v2, p0}, Ljava/lang/String;-><init>([CII)V

    .line 24
    .line 25
    .line 26
    return-object v0
.end method

.method public final subString(II)Ljava/lang/String;
    .locals 4

    .line 1
    sget-boolean v0, Lcom/alibaba/fastjson/util/ASMUtils;->IS_ANDROID:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    .line 6
    .line 7
    array-length v1, v0

    .line 8
    const/4 v2, 0x0

    .line 9
    if-ge p2, v1, :cond_0

    .line 10
    .line 11
    iget-object v1, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 12
    .line 13
    add-int v3, p1, p2

    .line 14
    .line 15
    invoke-virtual {v1, p1, v3, v0, v2}, Ljava/lang/String;->getChars(II[CI)V

    .line 16
    .line 17
    .line 18
    new-instance p1, Ljava/lang/String;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    .line 21
    .line 22
    invoke-direct {p1, p0, v2, p2}, Ljava/lang/String;-><init>([CII)V

    .line 23
    .line 24
    .line 25
    return-object p1

    .line 26
    :cond_0
    new-array v0, p2, [C

    .line 27
    .line 28
    iget-object p0, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 29
    .line 30
    add-int/2addr p2, p1

    .line 31
    invoke-virtual {p0, p1, p2, v0, v2}, Ljava/lang/String;->getChars(II[CI)V

    .line 32
    .line 33
    .line 34
    new-instance p0, Ljava/lang/String;

    .line 35
    .line 36
    invoke-direct {p0, v0}, Ljava/lang/String;-><init>([C)V

    .line 37
    .line 38
    .line 39
    return-object p0

    .line 40
    :cond_1
    iget-object p0, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 41
    .line 42
    add-int/2addr p2, p1

    .line 43
    invoke-virtual {p0, p1, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0
.end method

.method public final sub_chars(II)[C
    .locals 3

    .line 1
    sget-boolean v0, Lcom/alibaba/fastjson/util/ASMUtils;->IS_ANDROID:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    .line 7
    .line 8
    array-length v2, v0

    .line 9
    if-ge p2, v2, :cond_0

    .line 10
    .line 11
    iget-object v2, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 12
    .line 13
    add-int/2addr p2, p1

    .line 14
    invoke-virtual {v2, p1, p2, v0, v1}, Ljava/lang/String;->getChars(II[CI)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/alibaba/fastjson/parser/JSONLexerBase;->sbuf:[C

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_0
    new-array v0, p2, [C

    .line 21
    .line 22
    iget-object p0, p0, Lcom/alibaba/fastjson/parser/JSONScanner;->text:Ljava/lang/String;

    .line 23
    .line 24
    add-int/2addr p2, p1

    .line 25
    invoke-virtual {p0, p1, p2, v0, v1}, Ljava/lang/String;->getChars(II[CI)V

    .line 26
    .line 27
    .line 28
    return-object v0
.end method
