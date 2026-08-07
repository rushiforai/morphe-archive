.class public Lorg/apache/commons/codec/language/Metaphone;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/apache/commons/codec/StringEncoder;


# static fields
.field private static final FRONTV:Ljava/lang/String; = "EIY"

.field private static final VARSON:Ljava/lang/String; = "CSPTG"

.field private static final VOWELS:Ljava/lang/String; = "AEIOU"


# instance fields
.field private maxCodeLen:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x4

    .line 5
    iput v0, p0, Lorg/apache/commons/codec/language/Metaphone;->maxCodeLen:I

    .line 6
    .line 7
    return-void
.end method

.method private isLastChar(II)Z
    .locals 0

    const/4 p0, 0x1

    add-int/2addr p2, p0

    if-ne p2, p1, :cond_0

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private isNextChar(Ljava/lang/StringBuffer;IC)Z
    .locals 2

    .line 1
    const/4 p0, 0x0

    .line 2
    if-ltz p2, :cond_0

    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/StringBuffer;->length()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x1

    .line 9
    sub-int/2addr v0, v1

    .line 10
    if-ge p2, v0, :cond_0

    .line 11
    .line 12
    add-int/2addr p2, v1

    .line 13
    invoke-virtual {p1, p2}, Ljava/lang/StringBuffer;->charAt(I)C

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-ne p1, p3, :cond_0

    .line 18
    .line 19
    return v1

    .line 20
    :cond_0
    return p0
.end method

.method private isPreviousChar(Ljava/lang/StringBuffer;IC)Z
    .locals 1

    .line 1
    const/4 p0, 0x0

    .line 2
    if-lez p2, :cond_0

    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/StringBuffer;->length()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-ge p2, v0, :cond_0

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    sub-int/2addr p2, v0

    .line 12
    invoke-virtual {p1, p2}, Ljava/lang/StringBuffer;->charAt(I)C

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-ne p1, p3, :cond_0

    .line 17
    .line 18
    return v0

    .line 19
    :cond_0
    return p0
.end method

.method private isVowel(Ljava/lang/StringBuffer;I)Z
    .locals 0

    .line 1
    const-string p0, "AEIOU"

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Ljava/lang/StringBuffer;->charAt(I)C

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-virtual {p0, p1}, Ljava/lang/String;->indexOf(I)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-ltz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method private regionMatch(Ljava/lang/StringBuffer;ILjava/lang/String;)Z
    .locals 1

    .line 1
    if-ltz p2, :cond_0

    .line 2
    .line 3
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    add-int/2addr p0, p2

    .line 8
    add-int/lit8 p0, p0, -0x1

    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/lang/StringBuffer;->length()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-ge p0, v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    add-int/2addr p0, p2

    .line 21
    invoke-virtual {p1, p2, p0}, Ljava/lang/StringBuffer;->substring(II)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    return p0

    .line 30
    :cond_0
    const/4 p0, 0x0

    .line 31
    return p0
.end method


# virtual methods
.method public encode(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/codec/EncoderException;
        }
    .end annotation

    .line 1
    instance-of v0, p1, Ljava/lang/String;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lorg/apache/commons/codec/language/Metaphone;->metaphone(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    new-instance p0, Lorg/apache/commons/codec/EncoderException;

    .line 13
    .line 14
    const-string p1, "Parameter supplied to Metaphone encode is not of type java.lang.String"

    .line 15
    .line 16
    invoke-direct {p0, p1}, Lorg/apache/commons/codec/EncoderException;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    throw p0
.end method

.method public encode(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 20
    invoke-virtual {p0, p1}, Lorg/apache/commons/codec/language/Metaphone;->metaphone(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getMaxCodeLen()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/apache/commons/codec/language/Metaphone;->maxCodeLen:I

    .line 2
    .line 3
    return p0
.end method

.method public isMetaphoneEqual(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lorg/apache/commons/codec/language/Metaphone;->metaphone(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p2}, Lorg/apache/commons/codec/language/Metaphone;->metaphone(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public metaphone(Ljava/lang/String;)Ljava/lang/String;
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    if-eqz v1, :cond_24

    .line 6
    .line 7
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-nez v2, :cond_0

    .line 12
    .line 13
    goto/16 :goto_6

    .line 14
    .line 15
    :cond_0
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    const/4 v3, 0x1

    .line 20
    if-ne v2, v3, :cond_1

    .line 21
    .line 22
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 23
    .line 24
    invoke-virtual {v1, v0}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    return-object v0

    .line 29
    :cond_1
    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 30
    .line 31
    invoke-virtual {v1, v2}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v1}, Ljava/lang/String;->toCharArray()[C

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    new-instance v2, Ljava/lang/StringBuffer;

    .line 40
    .line 41
    const/16 v4, 0x28

    .line 42
    .line 43
    invoke-direct {v2, v4}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 44
    .line 45
    .line 46
    new-instance v4, Ljava/lang/StringBuffer;

    .line 47
    .line 48
    const/16 v5, 0xa

    .line 49
    .line 50
    invoke-direct {v4, v5}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 51
    .line 52
    .line 53
    const/4 v5, 0x0

    .line 54
    aget-char v6, v1, v5

    .line 55
    .line 56
    const/16 v7, 0x41

    .line 57
    .line 58
    const/16 v8, 0x47

    .line 59
    .line 60
    const/16 v9, 0x58

    .line 61
    .line 62
    const/16 v10, 0x48

    .line 63
    .line 64
    const/16 v11, 0x53

    .line 65
    .line 66
    const/16 v12, 0x4b

    .line 67
    .line 68
    if-eq v6, v7, :cond_8

    .line 69
    .line 70
    if-eq v6, v8, :cond_6

    .line 71
    .line 72
    if-eq v6, v12, :cond_6

    .line 73
    .line 74
    const/16 v7, 0x50

    .line 75
    .line 76
    if-eq v6, v7, :cond_6

    .line 77
    .line 78
    const/16 v7, 0x57

    .line 79
    .line 80
    if-eq v6, v7, :cond_3

    .line 81
    .line 82
    if-eq v6, v9, :cond_2

    .line 83
    .line 84
    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append([C)Ljava/lang/StringBuffer;

    .line 85
    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_2
    aput-char v11, v1, v5

    .line 89
    .line 90
    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append([C)Ljava/lang/StringBuffer;

    .line 91
    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_3
    aget-char v6, v1, v3

    .line 95
    .line 96
    const/16 v13, 0x52

    .line 97
    .line 98
    if-ne v6, v13, :cond_4

    .line 99
    .line 100
    array-length v6, v1

    .line 101
    sub-int/2addr v6, v3

    .line 102
    invoke-virtual {v2, v1, v3, v6}, Ljava/lang/StringBuffer;->append([CII)Ljava/lang/StringBuffer;

    .line 103
    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_4
    if-ne v6, v10, :cond_5

    .line 107
    .line 108
    array-length v6, v1

    .line 109
    sub-int/2addr v6, v3

    .line 110
    invoke-virtual {v2, v1, v3, v6}, Ljava/lang/StringBuffer;->append([CII)Ljava/lang/StringBuffer;

    .line 111
    .line 112
    .line 113
    invoke-virtual {v2, v5, v7}, Ljava/lang/StringBuffer;->setCharAt(IC)V

    .line 114
    .line 115
    .line 116
    goto :goto_0

    .line 117
    :cond_5
    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append([C)Ljava/lang/StringBuffer;

    .line 118
    .line 119
    .line 120
    goto :goto_0

    .line 121
    :cond_6
    aget-char v6, v1, v3

    .line 122
    .line 123
    const/16 v7, 0x4e

    .line 124
    .line 125
    if-ne v6, v7, :cond_7

    .line 126
    .line 127
    array-length v6, v1

    .line 128
    sub-int/2addr v6, v3

    .line 129
    invoke-virtual {v2, v1, v3, v6}, Ljava/lang/StringBuffer;->append([CII)Ljava/lang/StringBuffer;

    .line 130
    .line 131
    .line 132
    goto :goto_0

    .line 133
    :cond_7
    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append([C)Ljava/lang/StringBuffer;

    .line 134
    .line 135
    .line 136
    goto :goto_0

    .line 137
    :cond_8
    aget-char v6, v1, v3

    .line 138
    .line 139
    const/16 v7, 0x45

    .line 140
    .line 141
    if-ne v6, v7, :cond_9

    .line 142
    .line 143
    array-length v6, v1

    .line 144
    sub-int/2addr v6, v3

    .line 145
    invoke-virtual {v2, v1, v3, v6}, Ljava/lang/StringBuffer;->append([CII)Ljava/lang/StringBuffer;

    .line 146
    .line 147
    .line 148
    goto :goto_0

    .line 149
    :cond_9
    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append([C)Ljava/lang/StringBuffer;

    .line 150
    .line 151
    .line 152
    :goto_0
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->length()I

    .line 153
    .line 154
    .line 155
    move-result v1

    .line 156
    :goto_1
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->length()I

    .line 157
    .line 158
    .line 159
    move-result v6

    .line 160
    invoke-virtual {v0}, Lorg/apache/commons/codec/language/Metaphone;->getMaxCodeLen()I

    .line 161
    .line 162
    .line 163
    move-result v7

    .line 164
    if-ge v6, v7, :cond_23

    .line 165
    .line 166
    if-ge v5, v1, :cond_23

    .line 167
    .line 168
    invoke-virtual {v2, v5}, Ljava/lang/StringBuffer;->charAt(I)C

    .line 169
    .line 170
    .line 171
    move-result v6

    .line 172
    const/16 v7, 0x43

    .line 173
    .line 174
    if-eq v6, v7, :cond_a

    .line 175
    .line 176
    invoke-direct {v0, v2, v5, v6}, Lorg/apache/commons/codec/language/Metaphone;->isPreviousChar(Ljava/lang/StringBuffer;IC)Z

    .line 177
    .line 178
    .line 179
    move-result v13

    .line 180
    if-eqz v13, :cond_a

    .line 181
    .line 182
    add-int/lit8 v5, v5, 0x1

    .line 183
    .line 184
    move/from16 v16, v3

    .line 185
    .line 186
    goto/16 :goto_5

    .line 187
    .line 188
    :cond_a
    const/16 v13, 0x4a

    .line 189
    .line 190
    const/16 v14, 0x54

    .line 191
    .line 192
    const/16 v15, 0x46

    .line 193
    .line 194
    move/from16 v16, v3

    .line 195
    .line 196
    const-string v3, "EIY"

    .line 197
    .line 198
    packed-switch v6, :pswitch_data_0

    .line 199
    .line 200
    .line 201
    goto/16 :goto_4

    .line 202
    .line 203
    :pswitch_0
    invoke-virtual {v4, v11}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 204
    .line 205
    .line 206
    goto/16 :goto_4

    .line 207
    .line 208
    :pswitch_1
    invoke-virtual {v4, v12}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 209
    .line 210
    .line 211
    invoke-virtual {v4, v11}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 212
    .line 213
    .line 214
    goto/16 :goto_4

    .line 215
    .line 216
    :pswitch_2
    invoke-direct {v0, v1, v5}, Lorg/apache/commons/codec/language/Metaphone;->isLastChar(II)Z

    .line 217
    .line 218
    .line 219
    move-result v3

    .line 220
    if-nez v3, :cond_21

    .line 221
    .line 222
    add-int/lit8 v3, v5, 0x1

    .line 223
    .line 224
    invoke-direct {v0, v2, v3}, Lorg/apache/commons/codec/language/Metaphone;->isVowel(Ljava/lang/StringBuffer;I)Z

    .line 225
    .line 226
    .line 227
    move-result v3

    .line 228
    if-eqz v3, :cond_21

    .line 229
    .line 230
    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 231
    .line 232
    .line 233
    goto/16 :goto_4

    .line 234
    .line 235
    :pswitch_3
    invoke-virtual {v4, v15}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 236
    .line 237
    .line 238
    goto/16 :goto_4

    .line 239
    .line 240
    :pswitch_4
    const-string v3, "TIA"

    .line 241
    .line 242
    invoke-direct {v0, v2, v5, v3}, Lorg/apache/commons/codec/language/Metaphone;->regionMatch(Ljava/lang/StringBuffer;ILjava/lang/String;)Z

    .line 243
    .line 244
    .line 245
    move-result v3

    .line 246
    if-nez v3, :cond_e

    .line 247
    .line 248
    const-string v3, "TIO"

    .line 249
    .line 250
    invoke-direct {v0, v2, v5, v3}, Lorg/apache/commons/codec/language/Metaphone;->regionMatch(Ljava/lang/StringBuffer;ILjava/lang/String;)Z

    .line 251
    .line 252
    .line 253
    move-result v3

    .line 254
    if-eqz v3, :cond_b

    .line 255
    .line 256
    goto :goto_2

    .line 257
    :cond_b
    const-string v3, "TCH"

    .line 258
    .line 259
    invoke-direct {v0, v2, v5, v3}, Lorg/apache/commons/codec/language/Metaphone;->regionMatch(Ljava/lang/StringBuffer;ILjava/lang/String;)Z

    .line 260
    .line 261
    .line 262
    move-result v3

    .line 263
    if-eqz v3, :cond_c

    .line 264
    .line 265
    goto/16 :goto_4

    .line 266
    .line 267
    :cond_c
    const-string v3, "TH"

    .line 268
    .line 269
    invoke-direct {v0, v2, v5, v3}, Lorg/apache/commons/codec/language/Metaphone;->regionMatch(Ljava/lang/StringBuffer;ILjava/lang/String;)Z

    .line 270
    .line 271
    .line 272
    move-result v3

    .line 273
    if-eqz v3, :cond_d

    .line 274
    .line 275
    const/16 v3, 0x30

    .line 276
    .line 277
    invoke-virtual {v4, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 278
    .line 279
    .line 280
    goto/16 :goto_4

    .line 281
    .line 282
    :cond_d
    invoke-virtual {v4, v14}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 283
    .line 284
    .line 285
    goto/16 :goto_4

    .line 286
    .line 287
    :cond_e
    :goto_2
    invoke-virtual {v4, v9}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 288
    .line 289
    .line 290
    goto/16 :goto_4

    .line 291
    .line 292
    :pswitch_5
    const-string v3, "SH"

    .line 293
    .line 294
    invoke-direct {v0, v2, v5, v3}, Lorg/apache/commons/codec/language/Metaphone;->regionMatch(Ljava/lang/StringBuffer;ILjava/lang/String;)Z

    .line 295
    .line 296
    .line 297
    move-result v3

    .line 298
    if-nez v3, :cond_10

    .line 299
    .line 300
    const-string v3, "SIO"

    .line 301
    .line 302
    invoke-direct {v0, v2, v5, v3}, Lorg/apache/commons/codec/language/Metaphone;->regionMatch(Ljava/lang/StringBuffer;ILjava/lang/String;)Z

    .line 303
    .line 304
    .line 305
    move-result v3

    .line 306
    if-nez v3, :cond_10

    .line 307
    .line 308
    const-string v3, "SIA"

    .line 309
    .line 310
    invoke-direct {v0, v2, v5, v3}, Lorg/apache/commons/codec/language/Metaphone;->regionMatch(Ljava/lang/StringBuffer;ILjava/lang/String;)Z

    .line 311
    .line 312
    .line 313
    move-result v3

    .line 314
    if-eqz v3, :cond_f

    .line 315
    .line 316
    goto :goto_3

    .line 317
    :cond_f
    invoke-virtual {v4, v11}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 318
    .line 319
    .line 320
    goto/16 :goto_4

    .line 321
    .line 322
    :cond_10
    :goto_3
    invoke-virtual {v4, v9}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 323
    .line 324
    .line 325
    goto/16 :goto_4

    .line 326
    .line 327
    :pswitch_6
    invoke-virtual {v4, v12}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 328
    .line 329
    .line 330
    goto/16 :goto_4

    .line 331
    .line 332
    :pswitch_7
    invoke-direct {v0, v2, v5, v10}, Lorg/apache/commons/codec/language/Metaphone;->isNextChar(Ljava/lang/StringBuffer;IC)Z

    .line 333
    .line 334
    .line 335
    move-result v3

    .line 336
    if-eqz v3, :cond_11

    .line 337
    .line 338
    invoke-virtual {v4, v15}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 339
    .line 340
    .line 341
    goto/16 :goto_4

    .line 342
    .line 343
    :cond_11
    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 344
    .line 345
    .line 346
    goto/16 :goto_4

    .line 347
    .line 348
    :pswitch_8
    if-lez v5, :cond_12

    .line 349
    .line 350
    invoke-direct {v0, v2, v5, v7}, Lorg/apache/commons/codec/language/Metaphone;->isPreviousChar(Ljava/lang/StringBuffer;IC)Z

    .line 351
    .line 352
    .line 353
    move-result v3

    .line 354
    if-nez v3, :cond_21

    .line 355
    .line 356
    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 357
    .line 358
    .line 359
    goto/16 :goto_4

    .line 360
    .line 361
    :cond_12
    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 362
    .line 363
    .line 364
    goto/16 :goto_4

    .line 365
    .line 366
    :pswitch_9
    invoke-direct {v0, v1, v5}, Lorg/apache/commons/codec/language/Metaphone;->isLastChar(II)Z

    .line 367
    .line 368
    .line 369
    move-result v3

    .line 370
    if-eqz v3, :cond_13

    .line 371
    .line 372
    goto/16 :goto_4

    .line 373
    .line 374
    :cond_13
    if-lez v5, :cond_14

    .line 375
    .line 376
    add-int/lit8 v3, v5, -0x1

    .line 377
    .line 378
    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->charAt(I)C

    .line 379
    .line 380
    .line 381
    move-result v3

    .line 382
    const-string v6, "CSPTG"

    .line 383
    .line 384
    invoke-virtual {v6, v3}, Ljava/lang/String;->indexOf(I)I

    .line 385
    .line 386
    .line 387
    move-result v3

    .line 388
    if-ltz v3, :cond_14

    .line 389
    .line 390
    goto/16 :goto_4

    .line 391
    .line 392
    :cond_14
    add-int/lit8 v3, v5, 0x1

    .line 393
    .line 394
    invoke-direct {v0, v2, v3}, Lorg/apache/commons/codec/language/Metaphone;->isVowel(Ljava/lang/StringBuffer;I)Z

    .line 395
    .line 396
    .line 397
    move-result v3

    .line 398
    if-eqz v3, :cond_21

    .line 399
    .line 400
    invoke-virtual {v4, v10}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 401
    .line 402
    .line 403
    goto/16 :goto_4

    .line 404
    .line 405
    :pswitch_a
    add-int/lit8 v6, v5, 0x1

    .line 406
    .line 407
    invoke-direct {v0, v1, v6}, Lorg/apache/commons/codec/language/Metaphone;->isLastChar(II)Z

    .line 408
    .line 409
    .line 410
    move-result v7

    .line 411
    if-eqz v7, :cond_15

    .line 412
    .line 413
    invoke-direct {v0, v2, v5, v10}, Lorg/apache/commons/codec/language/Metaphone;->isNextChar(Ljava/lang/StringBuffer;IC)Z

    .line 414
    .line 415
    .line 416
    move-result v7

    .line 417
    if-eqz v7, :cond_15

    .line 418
    .line 419
    goto/16 :goto_4

    .line 420
    .line 421
    :cond_15
    invoke-direct {v0, v1, v6}, Lorg/apache/commons/codec/language/Metaphone;->isLastChar(II)Z

    .line 422
    .line 423
    .line 424
    move-result v7

    .line 425
    if-nez v7, :cond_16

    .line 426
    .line 427
    invoke-direct {v0, v2, v5, v10}, Lorg/apache/commons/codec/language/Metaphone;->isNextChar(Ljava/lang/StringBuffer;IC)Z

    .line 428
    .line 429
    .line 430
    move-result v7

    .line 431
    if-eqz v7, :cond_16

    .line 432
    .line 433
    add-int/lit8 v7, v5, 0x2

    .line 434
    .line 435
    invoke-direct {v0, v2, v7}, Lorg/apache/commons/codec/language/Metaphone;->isVowel(Ljava/lang/StringBuffer;I)Z

    .line 436
    .line 437
    .line 438
    move-result v7

    .line 439
    if-nez v7, :cond_16

    .line 440
    .line 441
    goto/16 :goto_4

    .line 442
    .line 443
    :cond_16
    if-lez v5, :cond_17

    .line 444
    .line 445
    const-string v7, "GN"

    .line 446
    .line 447
    invoke-direct {v0, v2, v5, v7}, Lorg/apache/commons/codec/language/Metaphone;->regionMatch(Ljava/lang/StringBuffer;ILjava/lang/String;)Z

    .line 448
    .line 449
    .line 450
    move-result v7

    .line 451
    if-nez v7, :cond_21

    .line 452
    .line 453
    const-string v7, "GNED"

    .line 454
    .line 455
    invoke-direct {v0, v2, v5, v7}, Lorg/apache/commons/codec/language/Metaphone;->regionMatch(Ljava/lang/StringBuffer;ILjava/lang/String;)Z

    .line 456
    .line 457
    .line 458
    move-result v7

    .line 459
    if-eqz v7, :cond_17

    .line 460
    .line 461
    goto/16 :goto_4

    .line 462
    .line 463
    :cond_17
    invoke-direct {v0, v2, v5, v8}, Lorg/apache/commons/codec/language/Metaphone;->isPreviousChar(Ljava/lang/StringBuffer;IC)Z

    .line 464
    .line 465
    .line 466
    move-result v7

    .line 467
    invoke-direct {v0, v1, v5}, Lorg/apache/commons/codec/language/Metaphone;->isLastChar(II)Z

    .line 468
    .line 469
    .line 470
    move-result v14

    .line 471
    if-nez v14, :cond_18

    .line 472
    .line 473
    invoke-virtual {v2, v6}, Ljava/lang/StringBuffer;->charAt(I)C

    .line 474
    .line 475
    .line 476
    move-result v6

    .line 477
    invoke-virtual {v3, v6}, Ljava/lang/String;->indexOf(I)I

    .line 478
    .line 479
    .line 480
    move-result v3

    .line 481
    if-ltz v3, :cond_18

    .line 482
    .line 483
    if-nez v7, :cond_18

    .line 484
    .line 485
    invoke-virtual {v4, v13}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 486
    .line 487
    .line 488
    goto/16 :goto_4

    .line 489
    .line 490
    :cond_18
    invoke-virtual {v4, v12}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 491
    .line 492
    .line 493
    goto/16 :goto_4

    .line 494
    .line 495
    :pswitch_b
    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 496
    .line 497
    .line 498
    goto/16 :goto_4

    .line 499
    .line 500
    :pswitch_c
    add-int/lit8 v6, v5, 0x1

    .line 501
    .line 502
    invoke-direct {v0, v1, v6}, Lorg/apache/commons/codec/language/Metaphone;->isLastChar(II)Z

    .line 503
    .line 504
    .line 505
    move-result v6

    .line 506
    if-nez v6, :cond_19

    .line 507
    .line 508
    invoke-direct {v0, v2, v5, v8}, Lorg/apache/commons/codec/language/Metaphone;->isNextChar(Ljava/lang/StringBuffer;IC)Z

    .line 509
    .line 510
    .line 511
    move-result v6

    .line 512
    if-eqz v6, :cond_19

    .line 513
    .line 514
    add-int/lit8 v6, v5, 0x2

    .line 515
    .line 516
    invoke-virtual {v2, v6}, Ljava/lang/StringBuffer;->charAt(I)C

    .line 517
    .line 518
    .line 519
    move-result v7

    .line 520
    invoke-virtual {v3, v7}, Ljava/lang/String;->indexOf(I)I

    .line 521
    .line 522
    .line 523
    move-result v3

    .line 524
    if-ltz v3, :cond_19

    .line 525
    .line 526
    invoke-virtual {v4, v13}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 527
    .line 528
    .line 529
    move v5, v6

    .line 530
    goto/16 :goto_4

    .line 531
    .line 532
    :cond_19
    invoke-virtual {v4, v14}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 533
    .line 534
    .line 535
    goto/16 :goto_4

    .line 536
    .line 537
    :pswitch_d
    invoke-direct {v0, v2, v5, v11}, Lorg/apache/commons/codec/language/Metaphone;->isPreviousChar(Ljava/lang/StringBuffer;IC)Z

    .line 538
    .line 539
    .line 540
    move-result v6

    .line 541
    if-eqz v6, :cond_1a

    .line 542
    .line 543
    invoke-direct {v0, v1, v5}, Lorg/apache/commons/codec/language/Metaphone;->isLastChar(II)Z

    .line 544
    .line 545
    .line 546
    move-result v6

    .line 547
    if-nez v6, :cond_1a

    .line 548
    .line 549
    add-int/lit8 v6, v5, 0x1

    .line 550
    .line 551
    invoke-virtual {v2, v6}, Ljava/lang/StringBuffer;->charAt(I)C

    .line 552
    .line 553
    .line 554
    move-result v6

    .line 555
    invoke-virtual {v3, v6}, Ljava/lang/String;->indexOf(I)I

    .line 556
    .line 557
    .line 558
    move-result v6

    .line 559
    if-ltz v6, :cond_1a

    .line 560
    .line 561
    goto/16 :goto_4

    .line 562
    .line 563
    :cond_1a
    const-string v6, "CIA"

    .line 564
    .line 565
    invoke-direct {v0, v2, v5, v6}, Lorg/apache/commons/codec/language/Metaphone;->regionMatch(Ljava/lang/StringBuffer;ILjava/lang/String;)Z

    .line 566
    .line 567
    .line 568
    move-result v6

    .line 569
    if-eqz v6, :cond_1b

    .line 570
    .line 571
    invoke-virtual {v4, v9}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 572
    .line 573
    .line 574
    goto :goto_4

    .line 575
    :cond_1b
    invoke-direct {v0, v1, v5}, Lorg/apache/commons/codec/language/Metaphone;->isLastChar(II)Z

    .line 576
    .line 577
    .line 578
    move-result v6

    .line 579
    if-nez v6, :cond_1c

    .line 580
    .line 581
    add-int/lit8 v6, v5, 0x1

    .line 582
    .line 583
    invoke-virtual {v2, v6}, Ljava/lang/StringBuffer;->charAt(I)C

    .line 584
    .line 585
    .line 586
    move-result v6

    .line 587
    invoke-virtual {v3, v6}, Ljava/lang/String;->indexOf(I)I

    .line 588
    .line 589
    .line 590
    move-result v3

    .line 591
    if-ltz v3, :cond_1c

    .line 592
    .line 593
    invoke-virtual {v4, v11}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 594
    .line 595
    .line 596
    goto :goto_4

    .line 597
    :cond_1c
    invoke-direct {v0, v2, v5, v11}, Lorg/apache/commons/codec/language/Metaphone;->isPreviousChar(Ljava/lang/StringBuffer;IC)Z

    .line 598
    .line 599
    .line 600
    move-result v3

    .line 601
    if-eqz v3, :cond_1d

    .line 602
    .line 603
    invoke-direct {v0, v2, v5, v10}, Lorg/apache/commons/codec/language/Metaphone;->isNextChar(Ljava/lang/StringBuffer;IC)Z

    .line 604
    .line 605
    .line 606
    move-result v3

    .line 607
    if-eqz v3, :cond_1d

    .line 608
    .line 609
    invoke-virtual {v4, v12}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 610
    .line 611
    .line 612
    goto :goto_4

    .line 613
    :cond_1d
    invoke-direct {v0, v2, v5, v10}, Lorg/apache/commons/codec/language/Metaphone;->isNextChar(Ljava/lang/StringBuffer;IC)Z

    .line 614
    .line 615
    .line 616
    move-result v3

    .line 617
    if-eqz v3, :cond_1f

    .line 618
    .line 619
    if-nez v5, :cond_1e

    .line 620
    .line 621
    const/4 v3, 0x3

    .line 622
    if-lt v1, v3, :cond_1e

    .line 623
    .line 624
    const/4 v3, 0x2

    .line 625
    invoke-direct {v0, v2, v3}, Lorg/apache/commons/codec/language/Metaphone;->isVowel(Ljava/lang/StringBuffer;I)Z

    .line 626
    .line 627
    .line 628
    move-result v3

    .line 629
    if-eqz v3, :cond_1e

    .line 630
    .line 631
    invoke-virtual {v4, v12}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 632
    .line 633
    .line 634
    goto :goto_4

    .line 635
    :cond_1e
    invoke-virtual {v4, v9}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 636
    .line 637
    .line 638
    goto :goto_4

    .line 639
    :cond_1f
    invoke-virtual {v4, v12}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 640
    .line 641
    .line 642
    goto :goto_4

    .line 643
    :pswitch_e
    const/16 v3, 0x4d

    .line 644
    .line 645
    invoke-direct {v0, v2, v5, v3}, Lorg/apache/commons/codec/language/Metaphone;->isPreviousChar(Ljava/lang/StringBuffer;IC)Z

    .line 646
    .line 647
    .line 648
    move-result v3

    .line 649
    if-eqz v3, :cond_20

    .line 650
    .line 651
    invoke-direct {v0, v1, v5}, Lorg/apache/commons/codec/language/Metaphone;->isLastChar(II)Z

    .line 652
    .line 653
    .line 654
    move-result v3

    .line 655
    if-eqz v3, :cond_20

    .line 656
    .line 657
    goto :goto_4

    .line 658
    :cond_20
    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 659
    .line 660
    .line 661
    goto :goto_4

    .line 662
    :pswitch_f
    if-nez v5, :cond_21

    .line 663
    .line 664
    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 665
    .line 666
    .line 667
    :cond_21
    :goto_4
    add-int/lit8 v5, v5, 0x1

    .line 668
    .line 669
    :goto_5
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->length()I

    .line 670
    .line 671
    .line 672
    move-result v3

    .line 673
    invoke-virtual {v0}, Lorg/apache/commons/codec/language/Metaphone;->getMaxCodeLen()I

    .line 674
    .line 675
    .line 676
    move-result v6

    .line 677
    if-le v3, v6, :cond_22

    .line 678
    .line 679
    invoke-virtual {v0}, Lorg/apache/commons/codec/language/Metaphone;->getMaxCodeLen()I

    .line 680
    .line 681
    .line 682
    move-result v3

    .line 683
    invoke-virtual {v4, v3}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 684
    .line 685
    .line 686
    :cond_22
    move/from16 v3, v16

    .line 687
    .line 688
    goto/16 :goto_1

    .line 689
    .line 690
    :cond_23
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 691
    .line 692
    .line 693
    move-result-object v0

    .line 694
    return-object v0

    .line 695
    :cond_24
    :goto_6
    const-string v0, ""

    .line 696
    .line 697
    return-object v0

    .line 698
    nop

    .line 699
    :pswitch_data_0
    .packed-switch 0x41
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_f
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_f
        :pswitch_b
        :pswitch_8
        :pswitch_b
        :pswitch_b
        :pswitch_b
        :pswitch_f
        :pswitch_7
        :pswitch_6
        :pswitch_b
        :pswitch_5
        :pswitch_4
        :pswitch_f
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_2
        :pswitch_0
    .end packed-switch
.end method

.method public setMaxCodeLen(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/apache/commons/codec/language/Metaphone;->maxCodeLen:I

    .line 2
    .line 3
    return-void
.end method
