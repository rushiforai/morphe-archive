.class public Lorg/eclipse/jetty/server/CookieCutter;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final LOG:Lorg/eclipse/jetty/util/log/Logger;


# instance fields
.field private _cookies:[Ljavax/servlet/http/Cookie;

.field _fields:I

.field private _lastCookies:[Ljavax/servlet/http/Cookie;

.field _lazyFields:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-class v0, Lorg/eclipse/jetty/server/CookieCutter;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/eclipse/jetty/util/log/Log;->getLogger(Ljava/lang/Class;)Lorg/eclipse/jetty/util/log/Logger;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lorg/eclipse/jetty/server/CookieCutter;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 8
    .line 9
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
.method public addCookieField(Ljava/lang/String;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    :goto_0
    return-void

    .line 15
    :cond_1
    iget-object v0, p0, Lorg/eclipse/jetty/server/CookieCutter;->_lazyFields:Ljava/lang/Object;

    .line 16
    .line 17
    invoke-static {v0}, Lorg/eclipse/jetty/util/LazyList;->size(Ljava/lang/Object;)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iget v1, p0, Lorg/eclipse/jetty/server/CookieCutter;->_fields:I

    .line 22
    .line 23
    if-le v0, v1, :cond_3

    .line 24
    .line 25
    iget-object v0, p0, Lorg/eclipse/jetty/server/CookieCutter;->_lazyFields:Ljava/lang/Object;

    .line 26
    .line 27
    invoke-static {v0, v1}, Lorg/eclipse/jetty/util/LazyList;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    iget p1, p0, Lorg/eclipse/jetty/server/CookieCutter;->_fields:I

    .line 38
    .line 39
    add-int/lit8 p1, p1, 0x1

    .line 40
    .line 41
    iput p1, p0, Lorg/eclipse/jetty/server/CookieCutter;->_fields:I

    .line 42
    .line 43
    return-void

    .line 44
    :cond_2
    :goto_1
    iget-object v0, p0, Lorg/eclipse/jetty/server/CookieCutter;->_lazyFields:Ljava/lang/Object;

    .line 45
    .line 46
    invoke-static {v0}, Lorg/eclipse/jetty/util/LazyList;->size(Ljava/lang/Object;)I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    iget v1, p0, Lorg/eclipse/jetty/server/CookieCutter;->_fields:I

    .line 51
    .line 52
    if-le v0, v1, :cond_3

    .line 53
    .line 54
    iget-object v0, p0, Lorg/eclipse/jetty/server/CookieCutter;->_lazyFields:Ljava/lang/Object;

    .line 55
    .line 56
    invoke-static {v0, v1}, Lorg/eclipse/jetty/util/LazyList;->remove(Ljava/lang/Object;I)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iput-object v0, p0, Lorg/eclipse/jetty/server/CookieCutter;->_lazyFields:Ljava/lang/Object;

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_3
    const/4 v0, 0x0

    .line 64
    iput-object v0, p0, Lorg/eclipse/jetty/server/CookieCutter;->_cookies:[Ljavax/servlet/http/Cookie;

    .line 65
    .line 66
    iput-object v0, p0, Lorg/eclipse/jetty/server/CookieCutter;->_lastCookies:[Ljavax/servlet/http/Cookie;

    .line 67
    .line 68
    iget-object v0, p0, Lorg/eclipse/jetty/server/CookieCutter;->_lazyFields:Ljava/lang/Object;

    .line 69
    .line 70
    iget v1, p0, Lorg/eclipse/jetty/server/CookieCutter;->_fields:I

    .line 71
    .line 72
    add-int/lit8 v2, v1, 0x1

    .line 73
    .line 74
    iput v2, p0, Lorg/eclipse/jetty/server/CookieCutter;->_fields:I

    .line 75
    .line 76
    invoke-static {v0, v1, p1}, Lorg/eclipse/jetty/util/LazyList;->add(Ljava/lang/Object;ILjava/lang/Object;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    iput-object p1, p0, Lorg/eclipse/jetty/server/CookieCutter;->_lazyFields:Ljava/lang/Object;

    .line 81
    .line 82
    return-void
.end method

.method public getCookies()[Ljavax/servlet/http/Cookie;
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/server/CookieCutter;->_cookies:[Ljavax/servlet/http/Cookie;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jetty/server/CookieCutter;->_lastCookies:[Ljavax/servlet/http/Cookie;

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    iget-object v0, p0, Lorg/eclipse/jetty/server/CookieCutter;->_lazyFields:Ljava/lang/Object;

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    iget v1, p0, Lorg/eclipse/jetty/server/CookieCutter;->_fields:I

    .line 15
    .line 16
    invoke-static {v0}, Lorg/eclipse/jetty/util/LazyList;->size(Ljava/lang/Object;)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-ne v1, v0, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Lorg/eclipse/jetty/server/CookieCutter;->_lastCookies:[Ljavax/servlet/http/Cookie;

    .line 23
    .line 24
    iput-object v0, p0, Lorg/eclipse/jetty/server/CookieCutter;->_cookies:[Ljavax/servlet/http/Cookie;

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/CookieCutter;->parseFields()V

    .line 28
    .line 29
    .line 30
    :goto_0
    iget-object v0, p0, Lorg/eclipse/jetty/server/CookieCutter;->_cookies:[Ljavax/servlet/http/Cookie;

    .line 31
    .line 32
    iput-object v0, p0, Lorg/eclipse/jetty/server/CookieCutter;->_lastCookies:[Ljavax/servlet/http/Cookie;

    .line 33
    .line 34
    return-object v0
.end method

.method public parseFields()V
    .locals 20

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    const/4 v2, 0x0

    .line 4
    iput-object v2, v1, Lorg/eclipse/jetty/server/CookieCutter;->_lastCookies:[Ljavax/servlet/http/Cookie;

    .line 5
    .line 6
    iput-object v2, v1, Lorg/eclipse/jetty/server/CookieCutter;->_cookies:[Ljavax/servlet/http/Cookie;

    .line 7
    .line 8
    :goto_0
    iget-object v0, v1, Lorg/eclipse/jetty/server/CookieCutter;->_lazyFields:Ljava/lang/Object;

    .line 9
    .line 10
    invoke-static {v0}, Lorg/eclipse/jetty/util/LazyList;->size(Ljava/lang/Object;)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iget v3, v1, Lorg/eclipse/jetty/server/CookieCutter;->_fields:I

    .line 15
    .line 16
    if-le v0, v3, :cond_0

    .line 17
    .line 18
    iget-object v0, v1, Lorg/eclipse/jetty/server/CookieCutter;->_lazyFields:Ljava/lang/Object;

    .line 19
    .line 20
    invoke-static {v0, v3}, Lorg/eclipse/jetty/util/LazyList;->remove(Ljava/lang/Object;I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object v0, v1, Lorg/eclipse/jetty/server/CookieCutter;->_lazyFields:Ljava/lang/Object;

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    move-object v0, v2

    .line 28
    const/4 v4, 0x0

    .line 29
    const/4 v5, 0x0

    .line 30
    :goto_1
    iget v6, v1, Lorg/eclipse/jetty/server/CookieCutter;->_fields:I

    .line 31
    .line 32
    if-ge v4, v6, :cond_1e

    .line 33
    .line 34
    iget-object v6, v1, Lorg/eclipse/jetty/server/CookieCutter;->_lazyFields:Ljava/lang/Object;

    .line 35
    .line 36
    invoke-static {v6, v4}, Lorg/eclipse/jetty/util/LazyList;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v6

    .line 40
    check-cast v6, Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    .line 43
    .line 44
    .line 45
    move-result v7

    .line 46
    add-int/lit8 v8, v7, -0x1

    .line 47
    .line 48
    move-object/from16 v16, v2

    .line 49
    .line 50
    move-object/from16 v17, v16

    .line 51
    .line 52
    move v10, v5

    .line 53
    const/4 v11, 0x0

    .line 54
    const/4 v12, 0x0

    .line 55
    const/4 v13, 0x0

    .line 56
    const/4 v14, -0x1

    .line 57
    const/4 v15, -0x1

    .line 58
    move-object v5, v0

    .line 59
    const/4 v0, 0x0

    .line 60
    :goto_2
    if-ge v11, v7, :cond_1d

    .line 61
    .line 62
    invoke-virtual {v6, v11}, Ljava/lang/String;->charAt(I)C

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    const/16 v9, 0x22

    .line 67
    .line 68
    const-string v18, ""

    .line 69
    .line 70
    const/16 v19, 0x1

    .line 71
    .line 72
    if-eqz v0, :cond_6

    .line 73
    .line 74
    if-eqz v13, :cond_1

    .line 75
    .line 76
    const/4 v13, 0x0

    .line 77
    goto/16 :goto_c

    .line 78
    .line 79
    :cond_1
    if-eq v3, v9, :cond_3

    .line 80
    .line 81
    const/16 v9, 0x5c

    .line 82
    .line 83
    if-eq v3, v9, :cond_2

    .line 84
    .line 85
    goto/16 :goto_c

    .line 86
    .line 87
    :cond_2
    move/from16 v13, v19

    .line 88
    .line 89
    goto/16 :goto_c

    .line 90
    .line 91
    :cond_3
    if-ne v11, v8, :cond_4

    .line 92
    .line 93
    if-eqz v12, :cond_5

    .line 94
    .line 95
    add-int/lit8 v0, v11, 0x1

    .line 96
    .line 97
    invoke-virtual {v6, v14, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v17

    .line 101
    :cond_4
    move v15, v11

    .line 102
    :goto_3
    const/4 v3, 0x0

    .line 103
    goto/16 :goto_8

    .line 104
    .line 105
    :cond_5
    add-int/lit8 v0, v11, 0x1

    .line 106
    .line 107
    invoke-virtual {v6, v14, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v16

    .line 111
    move v15, v11

    .line 112
    move-object/from16 v17, v18

    .line 113
    .line 114
    goto :goto_3

    .line 115
    :cond_6
    const/16 v9, 0x9

    .line 116
    .line 117
    if-eqz v12, :cond_d

    .line 118
    .line 119
    if-eq v3, v9, :cond_1c

    .line 120
    .line 121
    const/16 v9, 0x20

    .line 122
    .line 123
    if-eq v3, v9, :cond_1c

    .line 124
    .line 125
    const/16 v9, 0x22

    .line 126
    .line 127
    if-eq v3, v9, :cond_b

    .line 128
    .line 129
    const/16 v9, 0x3b

    .line 130
    .line 131
    if-eq v3, v9, :cond_9

    .line 132
    .line 133
    if-gez v14, :cond_7

    .line 134
    .line 135
    move v14, v11

    .line 136
    :cond_7
    if-ne v11, v8, :cond_8

    .line 137
    .line 138
    add-int/lit8 v3, v11, 0x1

    .line 139
    .line 140
    invoke-virtual {v6, v14, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v17

    .line 144
    :goto_4
    move v3, v0

    .line 145
    move v15, v11

    .line 146
    goto/16 :goto_8

    .line 147
    .line 148
    :cond_8
    move v15, v11

    .line 149
    goto/16 :goto_c

    .line 150
    .line 151
    :cond_9
    if-ltz v14, :cond_a

    .line 152
    .line 153
    add-int/lit8 v3, v15, 0x1

    .line 154
    .line 155
    invoke-virtual {v6, v14, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object v3

    .line 159
    move-object/from16 v17, v3

    .line 160
    .line 161
    goto :goto_5

    .line 162
    :cond_a
    move-object/from16 v17, v18

    .line 163
    .line 164
    :goto_5
    move v3, v0

    .line 165
    const/4 v12, 0x0

    .line 166
    :goto_6
    const/4 v14, -0x1

    .line 167
    goto/16 :goto_8

    .line 168
    .line 169
    :cond_b
    if-gez v14, :cond_c

    .line 170
    .line 171
    move v14, v11

    .line 172
    move/from16 v0, v19

    .line 173
    .line 174
    :cond_c
    if-ne v11, v8, :cond_8

    .line 175
    .line 176
    add-int/lit8 v3, v11, 0x1

    .line 177
    .line 178
    invoke-virtual {v6, v14, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v17

    .line 182
    goto :goto_4

    .line 183
    :cond_d
    if-eq v3, v9, :cond_1c

    .line 184
    .line 185
    const/16 v9, 0x20

    .line 186
    .line 187
    if-eq v3, v9, :cond_1c

    .line 188
    .line 189
    const/16 v9, 0x22

    .line 190
    .line 191
    if-eq v3, v9, :cond_13

    .line 192
    .line 193
    const/16 v9, 0x3b

    .line 194
    .line 195
    if-eq v3, v9, :cond_11

    .line 196
    .line 197
    const/16 v9, 0x3d

    .line 198
    .line 199
    if-eq v3, v9, :cond_f

    .line 200
    .line 201
    if-gez v14, :cond_e

    .line 202
    .line 203
    move v14, v11

    .line 204
    :cond_e
    if-ne v11, v8, :cond_8

    .line 205
    .line 206
    add-int/lit8 v3, v11, 0x1

    .line 207
    .line 208
    invoke-virtual {v6, v14, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v16

    .line 212
    :goto_7
    move v3, v0

    .line 213
    move v15, v11

    .line 214
    move-object/from16 v17, v18

    .line 215
    .line 216
    goto :goto_8

    .line 217
    :cond_f
    if-ltz v14, :cond_10

    .line 218
    .line 219
    add-int/lit8 v3, v15, 0x1

    .line 220
    .line 221
    invoke-virtual {v6, v14, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object v16

    .line 225
    :cond_10
    move/from16 v12, v19

    .line 226
    .line 227
    const/4 v14, -0x1

    .line 228
    goto/16 :goto_c

    .line 229
    .line 230
    :cond_11
    if-ltz v14, :cond_12

    .line 231
    .line 232
    add-int/lit8 v3, v15, 0x1

    .line 233
    .line 234
    invoke-virtual {v6, v14, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object v16

    .line 238
    move-object/from16 v17, v18

    .line 239
    .line 240
    :cond_12
    move v3, v0

    .line 241
    goto :goto_6

    .line 242
    :cond_13
    if-gez v14, :cond_14

    .line 243
    .line 244
    move v14, v11

    .line 245
    move/from16 v0, v19

    .line 246
    .line 247
    :cond_14
    if-ne v11, v8, :cond_8

    .line 248
    .line 249
    add-int/lit8 v3, v11, 0x1

    .line 250
    .line 251
    invoke-virtual {v6, v14, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 252
    .line 253
    .line 254
    move-result-object v16

    .line 255
    goto :goto_7

    .line 256
    :goto_8
    if-eqz v17, :cond_1b

    .line 257
    .line 258
    if-eqz v16, :cond_1b

    .line 259
    .line 260
    invoke-static/range {v16 .. v16}, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->unquote(Ljava/lang/String;)Ljava/lang/String;

    .line 261
    .line 262
    .line 263
    move-result-object v0

    .line 264
    invoke-static/range {v17 .. v17}, Lorg/eclipse/jetty/util/QuotedStringTokenizer;->unquote(Ljava/lang/String;)Ljava/lang/String;

    .line 265
    .line 266
    .line 267
    move-result-object v9

    .line 268
    move/from16 v18, v3

    .line 269
    .line 270
    :try_start_0
    const-string v3, "$"

    .line 271
    .line 272
    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 273
    .line 274
    .line 275
    move-result v3

    .line 276
    if-eqz v3, :cond_18

    .line 277
    .line 278
    sget-object v3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 279
    .line 280
    invoke-virtual {v0, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 281
    .line 282
    .line 283
    move-result-object v0

    .line 284
    const-string v3, "$path"

    .line 285
    .line 286
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 287
    .line 288
    .line 289
    move-result v3

    .line 290
    if-eqz v3, :cond_15

    .line 291
    .line 292
    if-eqz v2, :cond_1a

    .line 293
    .line 294
    invoke-virtual {v2, v9}, Ljavax/servlet/http/Cookie;->setPath(Ljava/lang/String;)V

    .line 295
    .line 296
    .line 297
    goto :goto_b

    .line 298
    :catch_0
    move-exception v0

    .line 299
    goto :goto_a

    .line 300
    :cond_15
    const-string v3, "$domain"

    .line 301
    .line 302
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 303
    .line 304
    .line 305
    move-result v3

    .line 306
    if-eqz v3, :cond_16

    .line 307
    .line 308
    if-eqz v2, :cond_1a

    .line 309
    .line 310
    invoke-virtual {v2, v9}, Ljavax/servlet/http/Cookie;->setDomain(Ljava/lang/String;)V

    .line 311
    .line 312
    .line 313
    goto :goto_b

    .line 314
    :cond_16
    const-string v3, "$port"

    .line 315
    .line 316
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 317
    .line 318
    .line 319
    move-result v3

    .line 320
    if-eqz v3, :cond_17

    .line 321
    .line 322
    if-eqz v2, :cond_1a

    .line 323
    .line 324
    new-instance v0, Ljava/lang/StringBuilder;

    .line 325
    .line 326
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 327
    .line 328
    .line 329
    const-string v3, "$port="

    .line 330
    .line 331
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 332
    .line 333
    .line 334
    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 335
    .line 336
    .line 337
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 338
    .line 339
    .line 340
    move-result-object v0

    .line 341
    invoke-virtual {v2, v0}, Ljavax/servlet/http/Cookie;->setComment(Ljava/lang/String;)V

    .line 342
    .line 343
    .line 344
    goto :goto_b

    .line 345
    :cond_17
    const-string v3, "$version"

    .line 346
    .line 347
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 348
    .line 349
    .line 350
    move-result v0

    .line 351
    if-eqz v0, :cond_1a

    .line 352
    .line 353
    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 354
    .line 355
    .line 356
    move-result v10

    .line 357
    goto :goto_b

    .line 358
    :cond_18
    new-instance v3, Ljavax/servlet/http/Cookie;

    .line 359
    .line 360
    invoke-direct {v3, v0, v9}, Ljavax/servlet/http/Cookie;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 361
    .line 362
    .line 363
    if-lez v10, :cond_19

    .line 364
    .line 365
    :try_start_1
    invoke-virtual {v3, v10}, Ljavax/servlet/http/Cookie;->setVersion(I)V

    .line 366
    .line 367
    .line 368
    goto :goto_9

    .line 369
    :catch_1
    move-exception v0

    .line 370
    move-object v2, v3

    .line 371
    goto :goto_a

    .line 372
    :cond_19
    :goto_9
    invoke-static {v5, v3}, Lorg/eclipse/jetty/util/LazyList;->add(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 373
    .line 374
    .line 375
    move-result-object v5
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 376
    move-object v2, v3

    .line 377
    goto :goto_b

    .line 378
    :goto_a
    sget-object v3, Lorg/eclipse/jetty/server/CookieCutter;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 379
    .line 380
    invoke-interface {v3, v0}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/Throwable;)V

    .line 381
    .line 382
    .line 383
    :cond_1a
    :goto_b
    move/from16 v0, v18

    .line 384
    .line 385
    const/16 v16, 0x0

    .line 386
    .line 387
    const/16 v17, 0x0

    .line 388
    .line 389
    goto :goto_c

    .line 390
    :cond_1b
    move/from16 v18, v3

    .line 391
    .line 392
    move/from16 v0, v18

    .line 393
    .line 394
    :cond_1c
    :goto_c
    add-int/lit8 v11, v11, 0x1

    .line 395
    .line 396
    goto/16 :goto_2

    .line 397
    .line 398
    :cond_1d
    add-int/lit8 v4, v4, 0x1

    .line 399
    .line 400
    move-object v0, v5

    .line 401
    move v5, v10

    .line 402
    const/4 v2, 0x0

    .line 403
    goto/16 :goto_1

    .line 404
    .line 405
    :cond_1e
    const-class v2, Ljavax/servlet/http/Cookie;

    .line 406
    .line 407
    invoke-static {v0, v2}, Lorg/eclipse/jetty/util/LazyList;->toArray(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    .line 408
    .line 409
    .line 410
    move-result-object v0

    .line 411
    check-cast v0, [Ljavax/servlet/http/Cookie;

    .line 412
    .line 413
    iput-object v0, v1, Lorg/eclipse/jetty/server/CookieCutter;->_cookies:[Ljavax/servlet/http/Cookie;

    .line 414
    .line 415
    iput-object v0, v1, Lorg/eclipse/jetty/server/CookieCutter;->_lastCookies:[Ljavax/servlet/http/Cookie;

    .line 416
    .line 417
    return-void
.end method

.method public reset()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lorg/eclipse/jetty/server/CookieCutter;->_cookies:[Ljavax/servlet/http/Cookie;

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lorg/eclipse/jetty/server/CookieCutter;->_fields:I

    .line 6
    .line 7
    return-void
.end method

.method public setCookies([Ljavax/servlet/http/Cookie;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/server/CookieCutter;->_cookies:[Ljavax/servlet/http/Cookie;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput-object p1, p0, Lorg/eclipse/jetty/server/CookieCutter;->_lastCookies:[Ljavax/servlet/http/Cookie;

    .line 5
    .line 6
    iput-object p1, p0, Lorg/eclipse/jetty/server/CookieCutter;->_lazyFields:Ljava/lang/Object;

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput p1, p0, Lorg/eclipse/jetty/server/CookieCutter;->_fields:I

    .line 10
    .line 11
    return-void
.end method
