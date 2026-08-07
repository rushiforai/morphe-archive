.class public Lorg/eclipse/jetty/util/URIUtil;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;


# static fields
.field public static final HTTP:Ljava/lang/String; = "http"

.field public static final HTTPS:Ljava/lang/String; = "https"

.field public static final HTTPS_COLON:Ljava/lang/String; = "https:"

.field public static final HTTP_COLON:Ljava/lang/String; = "http:"

.field public static final SLASH:Ljava/lang/String; = "/"

.field public static final __CHARSET:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-string v0, "org.eclipse.jetty.util.URI.charset"

    .line 2
    .line 3
    const-string v1, "UTF-8"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sput-object v0, Lorg/eclipse/jetty/util/URIUtil;->__CHARSET:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static addPaths(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    .line 1
    if-eqz p0, :cond_9

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_2

    .line 10
    :cond_0
    if-eqz p1, :cond_8

    .line 11
    .line 12
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_1
    const/16 v0, 0x3b

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-gez v0, :cond_2

    .line 26
    .line 27
    const/16 v0, 0x3f

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    :cond_2
    if-nez v0, :cond_3

    .line 34
    .line 35
    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0

    .line 40
    :cond_3
    if-gez v0, :cond_4

    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    :cond_4
    new-instance v1, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    add-int/2addr v2, v3

    .line 57
    add-int/lit8 v2, v2, 0x2

    .line 58
    .line 59
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    add-int/lit8 p0, v0, -0x1

    .line 66
    .line 67
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->charAt(I)C

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    const-string v3, "/"

    .line 72
    .line 73
    const/16 v4, 0x2f

    .line 74
    .line 75
    if-ne v2, v4, :cond_6

    .line 76
    .line 77
    invoke-virtual {p1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    if-eqz v2, :cond_5

    .line 82
    .line 83
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v1, p0, p1}, Ljava/lang/StringBuilder;->insert(ILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_5
    invoke-virtual {v1, v0, p1}, Ljava/lang/StringBuilder;->insert(ILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_6
    invoke-virtual {p1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 95
    .line 96
    .line 97
    move-result p0

    .line 98
    if-eqz p0, :cond_7

    .line 99
    .line 100
    invoke-virtual {v1, v0, p1}, Ljava/lang/StringBuilder;->insert(ILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_7
    invoke-virtual {v1, v0, v4}, Ljava/lang/StringBuilder;->insert(IC)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    add-int/lit8 v0, v0, 0x1

    .line 108
    .line 109
    invoke-virtual {v1, v0, p1}, Ljava/lang/StringBuilder;->insert(ILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    :goto_0
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    :cond_8
    :goto_1
    return-object p0

    .line 117
    :cond_9
    :goto_2
    if-eqz p0, :cond_a

    .line 118
    .line 119
    if-nez p1, :cond_a

    .line 120
    .line 121
    return-object p0

    .line 122
    :cond_a
    return-object p1
.end method

.method public static canonicalPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 14

    .line 1
    if-eqz p0, :cond_1d

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_f

    .line 10
    .line 11
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/16 v1, 0x2f

    .line 16
    .line 17
    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->lastIndexOf(II)I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    :goto_0
    const/4 v3, 0x3

    .line 22
    const/4 v4, 0x2

    .line 23
    const/16 v5, 0x2e

    .line 24
    .line 25
    if-lez v0, :cond_4

    .line 26
    .line 27
    sub-int v6, v0, v2

    .line 28
    .line 29
    if-eq v6, v4, :cond_2

    .line 30
    .line 31
    if-eq v6, v3, :cond_1

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_1
    add-int/lit8 v6, v2, 0x1

    .line 35
    .line 36
    invoke-virtual {p0, v6}, Ljava/lang/String;->charAt(I)C

    .line 37
    .line 38
    .line 39
    move-result v6

    .line 40
    if-ne v6, v5, :cond_3

    .line 41
    .line 42
    add-int/lit8 v6, v2, 0x2

    .line 43
    .line 44
    invoke-virtual {p0, v6}, Ljava/lang/String;->charAt(I)C

    .line 45
    .line 46
    .line 47
    move-result v6

    .line 48
    if-eq v6, v5, :cond_4

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_2
    add-int/lit8 v6, v2, 0x1

    .line 52
    .line 53
    invoke-virtual {p0, v6}, Ljava/lang/String;->charAt(I)C

    .line 54
    .line 55
    .line 56
    move-result v6

    .line 57
    if-eq v6, v5, :cond_4

    .line 58
    .line 59
    :cond_3
    :goto_1
    add-int/lit8 v0, v2, -0x1

    .line 60
    .line 61
    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->lastIndexOf(II)I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    move v13, v2

    .line 66
    move v2, v0

    .line 67
    move v0, v13

    .line 68
    goto :goto_0

    .line 69
    :cond_4
    if-lt v2, v0, :cond_5

    .line 70
    .line 71
    return-object p0

    .line 72
    :cond_5
    new-instance v6, Ljava/lang/StringBuilder;

    .line 73
    .line 74
    invoke-direct {v6, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    const/4 p0, 0x0

    .line 78
    const/4 v7, -0x1

    .line 79
    move v8, p0

    .line 80
    move v9, v7

    .line 81
    move v10, v9

    .line 82
    :goto_2
    if-lez v0, :cond_1a

    .line 83
    .line 84
    sub-int v11, v0, v2

    .line 85
    .line 86
    if-eq v11, v4, :cond_d

    .line 87
    .line 88
    if-eq v11, v3, :cond_7

    .line 89
    .line 90
    if-lez v8, :cond_17

    .line 91
    .line 92
    add-int/lit8 v8, v8, -0x1

    .line 93
    .line 94
    if-nez v8, :cond_17

    .line 95
    .line 96
    if-ltz v2, :cond_6

    .line 97
    .line 98
    move v10, v2

    .line 99
    goto :goto_3

    .line 100
    :cond_6
    move v10, p0

    .line 101
    :goto_3
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->length()I

    .line 102
    .line 103
    .line 104
    move-result v11

    .line 105
    if-ne v9, v11, :cond_17

    .line 106
    .line 107
    add-int/lit8 v11, v9, -0x1

    .line 108
    .line 109
    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->charAt(I)C

    .line 110
    .line 111
    .line 112
    move-result v11

    .line 113
    if-ne v11, v5, :cond_17

    .line 114
    .line 115
    :goto_4
    add-int/lit8 v10, v10, 0x1

    .line 116
    .line 117
    goto/16 :goto_c

    .line 118
    .line 119
    :cond_7
    add-int/lit8 v11, v2, 0x1

    .line 120
    .line 121
    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->charAt(I)C

    .line 122
    .line 123
    .line 124
    move-result v11

    .line 125
    if-ne v11, v5, :cond_b

    .line 126
    .line 127
    add-int/lit8 v11, v2, 0x2

    .line 128
    .line 129
    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->charAt(I)C

    .line 130
    .line 131
    .line 132
    move-result v11

    .line 133
    if-eq v11, v5, :cond_8

    .line 134
    .line 135
    goto :goto_6

    .line 136
    :cond_8
    if-gez v9, :cond_9

    .line 137
    .line 138
    move v9, v0

    .line 139
    :cond_9
    add-int/lit8 v8, v8, 0x1

    .line 140
    .line 141
    add-int/lit8 v0, v2, -0x1

    .line 142
    .line 143
    :goto_5
    if-ltz v0, :cond_a

    .line 144
    .line 145
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->charAt(I)C

    .line 146
    .line 147
    .line 148
    move-result v10

    .line 149
    if-eq v10, v1, :cond_a

    .line 150
    .line 151
    add-int/lit8 v0, v0, -0x1

    .line 152
    .line 153
    goto :goto_5

    .line 154
    :cond_a
    move v10, v2

    .line 155
    move v2, v0

    .line 156
    move v0, v10

    .line 157
    goto :goto_2

    .line 158
    :cond_b
    :goto_6
    if-lez v8, :cond_17

    .line 159
    .line 160
    add-int/lit8 v8, v8, -0x1

    .line 161
    .line 162
    if-nez v8, :cond_17

    .line 163
    .line 164
    if-ltz v2, :cond_c

    .line 165
    .line 166
    move v10, v2

    .line 167
    goto :goto_7

    .line 168
    :cond_c
    move v10, p0

    .line 169
    :goto_7
    if-lez v10, :cond_17

    .line 170
    .line 171
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->length()I

    .line 172
    .line 173
    .line 174
    move-result v11

    .line 175
    if-ne v9, v11, :cond_17

    .line 176
    .line 177
    add-int/lit8 v11, v9, -0x1

    .line 178
    .line 179
    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->charAt(I)C

    .line 180
    .line 181
    .line 182
    move-result v11

    .line 183
    if-ne v11, v5, :cond_17

    .line 184
    .line 185
    goto :goto_4

    .line 186
    :cond_d
    add-int/lit8 v11, v2, 0x1

    .line 187
    .line 188
    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->charAt(I)C

    .line 189
    .line 190
    .line 191
    move-result v12

    .line 192
    if-eq v12, v5, :cond_f

    .line 193
    .line 194
    if-lez v8, :cond_17

    .line 195
    .line 196
    add-int/lit8 v8, v8, -0x1

    .line 197
    .line 198
    if-nez v8, :cond_17

    .line 199
    .line 200
    if-ltz v2, :cond_e

    .line 201
    .line 202
    move v10, v2

    .line 203
    goto :goto_8

    .line 204
    :cond_e
    move v10, p0

    .line 205
    :goto_8
    if-lez v10, :cond_17

    .line 206
    .line 207
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->length()I

    .line 208
    .line 209
    .line 210
    move-result v11

    .line 211
    if-ne v9, v11, :cond_17

    .line 212
    .line 213
    add-int/lit8 v11, v9, -0x1

    .line 214
    .line 215
    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->charAt(I)C

    .line 216
    .line 217
    .line 218
    move-result v11

    .line 219
    if-ne v11, v5, :cond_17

    .line 220
    .line 221
    goto :goto_4

    .line 222
    :cond_f
    if-gez v2, :cond_10

    .line 223
    .line 224
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->length()I

    .line 225
    .line 226
    .line 227
    move-result v12

    .line 228
    if-le v12, v4, :cond_10

    .line 229
    .line 230
    const/4 v12, 0x1

    .line 231
    invoke-virtual {v6, v12}, Ljava/lang/StringBuilder;->charAt(I)C

    .line 232
    .line 233
    .line 234
    move-result v12

    .line 235
    if-ne v12, v1, :cond_10

    .line 236
    .line 237
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->charAt(I)C

    .line 238
    .line 239
    .line 240
    move-result v12

    .line 241
    if-ne v12, v1, :cond_10

    .line 242
    .line 243
    goto :goto_c

    .line 244
    :cond_10
    if-gez v9, :cond_11

    .line 245
    .line 246
    move v9, v0

    .line 247
    :cond_11
    if-ltz v2, :cond_15

    .line 248
    .line 249
    if-nez v2, :cond_12

    .line 250
    .line 251
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->charAt(I)C

    .line 252
    .line 253
    .line 254
    move-result v10

    .line 255
    if-ne v10, v1, :cond_12

    .line 256
    .line 257
    goto :goto_b

    .line 258
    :cond_12
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->length()I

    .line 259
    .line 260
    .line 261
    move-result v10

    .line 262
    if-ne v0, v10, :cond_13

    .line 263
    .line 264
    move v10, v11

    .line 265
    goto :goto_9

    .line 266
    :cond_13
    move v10, v2

    .line 267
    :goto_9
    add-int/lit8 v0, v2, -0x1

    .line 268
    .line 269
    :goto_a
    if-ltz v0, :cond_14

    .line 270
    .line 271
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->charAt(I)C

    .line 272
    .line 273
    .line 274
    move-result v11

    .line 275
    if-eq v11, v1, :cond_14

    .line 276
    .line 277
    add-int/lit8 v0, v0, -0x1

    .line 278
    .line 279
    goto :goto_a

    .line 280
    :cond_14
    move v13, v2

    .line 281
    move v2, v0

    .line 282
    move v0, v13

    .line 283
    goto/16 :goto_2

    .line 284
    .line 285
    :cond_15
    :goto_b
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->length()I

    .line 286
    .line 287
    .line 288
    move-result v10

    .line 289
    if-ge v9, v10, :cond_16

    .line 290
    .line 291
    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->charAt(I)C

    .line 292
    .line 293
    .line 294
    move-result v10

    .line 295
    if-ne v10, v1, :cond_16

    .line 296
    .line 297
    add-int/lit8 v9, v9, 0x1

    .line 298
    .line 299
    :cond_16
    move v10, v11

    .line 300
    :cond_17
    :goto_c
    if-gtz v8, :cond_19

    .line 301
    .line 302
    if-ltz v10, :cond_19

    .line 303
    .line 304
    if-lt v9, v10, :cond_19

    .line 305
    .line 306
    invoke-virtual {v6, v10, v9}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    .line 307
    .line 308
    .line 309
    if-lez v8, :cond_18

    .line 310
    .line 311
    move v9, v0

    .line 312
    move v10, v7

    .line 313
    goto :goto_d

    .line 314
    :cond_18
    move v9, v7

    .line 315
    move v10, v9

    .line 316
    :cond_19
    :goto_d
    add-int/lit8 v0, v2, -0x1

    .line 317
    .line 318
    :goto_e
    if-ltz v0, :cond_14

    .line 319
    .line 320
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->charAt(I)C

    .line 321
    .line 322
    .line 323
    move-result v11

    .line 324
    if-eq v11, v1, :cond_14

    .line 325
    .line 326
    add-int/lit8 v0, v0, -0x1

    .line 327
    .line 328
    goto :goto_e

    .line 329
    :cond_1a
    if-lez v8, :cond_1b

    .line 330
    .line 331
    const/4 p0, 0x0

    .line 332
    return-object p0

    .line 333
    :cond_1b
    if-ltz v9, :cond_1c

    .line 334
    .line 335
    invoke-virtual {v6, v10, v9}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    .line 336
    .line 337
    .line 338
    :cond_1c
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 339
    .line 340
    .line 341
    move-result-object p0

    .line 342
    :cond_1d
    :goto_f
    return-object p0
.end method

.method public static compactPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 9

    .line 1
    if-eqz p0, :cond_a

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_6

    .line 10
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/4 v1, 0x0

    .line 15
    move v2, v1

    .line 16
    move v3, v2

    .line 17
    :goto_0
    const/4 v4, 0x2

    .line 18
    const/16 v5, 0x3f

    .line 19
    .line 20
    const/16 v6, 0x2f

    .line 21
    .line 22
    if-ge v2, v0, :cond_3

    .line 23
    .line 24
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    .line 25
    .line 26
    .line 27
    move-result v7

    .line 28
    if-eq v7, v6, :cond_1

    .line 29
    .line 30
    if-eq v7, v5, :cond_4

    .line 31
    .line 32
    move v3, v1

    .line 33
    goto :goto_1

    .line 34
    :cond_1
    add-int/lit8 v3, v3, 0x1

    .line 35
    .line 36
    if-ne v3, v4, :cond_2

    .line 37
    .line 38
    goto :goto_2

    .line 39
    :cond_2
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_3
    :goto_2
    if-ge v3, v4, :cond_5

    .line 43
    .line 44
    :cond_4
    return-object p0

    .line 45
    :cond_5
    new-instance v4, Ljava/lang/StringBuffer;

    .line 46
    .line 47
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 48
    .line 49
    .line 50
    move-result v7

    .line 51
    invoke-direct {v4, v7}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v4, p0, v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuffer;

    .line 55
    .line 56
    .line 57
    :goto_3
    if-ge v2, v0, :cond_9

    .line 58
    .line 59
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    .line 60
    .line 61
    .line 62
    move-result v7

    .line 63
    if-eq v7, v6, :cond_7

    .line 64
    .line 65
    if-eq v7, v5, :cond_6

    .line 66
    .line 67
    invoke-virtual {v4, v7}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 68
    .line 69
    .line 70
    move v3, v1

    .line 71
    goto :goto_4

    .line 72
    :cond_6
    invoke-virtual {v4, p0, v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuffer;

    .line 73
    .line 74
    .line 75
    goto :goto_5

    .line 76
    :cond_7
    add-int/lit8 v8, v3, 0x1

    .line 77
    .line 78
    if-nez v3, :cond_8

    .line 79
    .line 80
    invoke-virtual {v4, v7}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 81
    .line 82
    .line 83
    :cond_8
    move v3, v8

    .line 84
    :goto_4
    add-int/lit8 v2, v2, 0x1

    .line 85
    .line 86
    goto :goto_3

    .line 87
    :cond_9
    :goto_5
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    :cond_a
    :goto_6
    return-object p0
.end method

.method public static decodePath(Ljava/lang/String;)Ljava/lang/String;
    .locals 11

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    move-object v3, v0

    .line 11
    move v4, v2

    .line 12
    move v5, v4

    .line 13
    move v6, v5

    .line 14
    :goto_0
    if-ge v4, v1, :cond_6

    .line 15
    .line 16
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    .line 17
    .line 18
    .line 19
    move-result v7

    .line 20
    const/16 v8, 0x25

    .line 21
    .line 22
    if-ne v7, v8, :cond_2

    .line 23
    .line 24
    add-int/lit8 v8, v4, 0x2

    .line 25
    .line 26
    if-ge v8, v1, :cond_2

    .line 27
    .line 28
    if-nez v0, :cond_1

    .line 29
    .line 30
    new-array v0, v1, [C

    .line 31
    .line 32
    new-array v3, v1, [B

    .line 33
    .line 34
    invoke-virtual {p0, v2, v4, v0, v2}, Ljava/lang/String;->getChars(II[CI)V

    .line 35
    .line 36
    .line 37
    :cond_1
    add-int/lit8 v7, v5, 0x1

    .line 38
    .line 39
    add-int/lit8 v4, v4, 0x1

    .line 40
    .line 41
    const/16 v9, 0x10

    .line 42
    .line 43
    const/4 v10, 0x2

    .line 44
    invoke-static {p0, v4, v10, v9}, Lorg/eclipse/jetty/util/TypeUtil;->parseInt(Ljava/lang/String;III)I

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    and-int/lit16 v4, v4, 0xff

    .line 49
    .line 50
    int-to-byte v4, v4

    .line 51
    aput-byte v4, v3, v5

    .line 52
    .line 53
    move v5, v7

    .line 54
    move v4, v8

    .line 55
    goto :goto_2

    .line 56
    :cond_2
    const/16 v8, 0x3b

    .line 57
    .line 58
    if-ne v7, v8, :cond_3

    .line 59
    .line 60
    if-nez v0, :cond_6

    .line 61
    .line 62
    new-array v0, v1, [C

    .line 63
    .line 64
    invoke-virtual {p0, v2, v4, v0, v2}, Ljava/lang/String;->getChars(II[CI)V

    .line 65
    .line 66
    .line 67
    goto :goto_3

    .line 68
    :cond_3
    if-nez v3, :cond_4

    .line 69
    .line 70
    add-int/lit8 v6, v6, 0x1

    .line 71
    .line 72
    goto :goto_2

    .line 73
    :cond_4
    if-lez v5, :cond_5

    .line 74
    .line 75
    :try_start_0
    new-instance v8, Ljava/lang/String;

    .line 76
    .line 77
    sget-object v9, Lorg/eclipse/jetty/util/URIUtil;->__CHARSET:Ljava/lang/String;

    .line 78
    .line 79
    invoke-direct {v8, v3, v2, v5, v9}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 80
    .line 81
    .line 82
    goto :goto_1

    .line 83
    :catch_0
    new-instance v8, Ljava/lang/String;

    .line 84
    .line 85
    invoke-direct {v8, v3, v2, v5}, Ljava/lang/String;-><init>([BII)V

    .line 86
    .line 87
    .line 88
    :goto_1
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    .line 89
    .line 90
    .line 91
    move-result v5

    .line 92
    invoke-virtual {v8, v2, v5, v0, v6}, Ljava/lang/String;->getChars(II[CI)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    .line 96
    .line 97
    .line 98
    move-result v5

    .line 99
    add-int/2addr v6, v5

    .line 100
    move v5, v2

    .line 101
    :cond_5
    add-int/lit8 v8, v6, 0x1

    .line 102
    .line 103
    aput-char v7, v0, v6

    .line 104
    .line 105
    move v6, v8

    .line 106
    :goto_2
    add-int/lit8 v4, v4, 0x1

    .line 107
    .line 108
    goto :goto_0

    .line 109
    :cond_6
    move v4, v6

    .line 110
    :goto_3
    if-nez v0, :cond_7

    .line 111
    .line 112
    return-object p0

    .line 113
    :cond_7
    if-lez v5, :cond_8

    .line 114
    .line 115
    :try_start_1
    new-instance p0, Ljava/lang/String;

    .line 116
    .line 117
    sget-object v1, Lorg/eclipse/jetty/util/URIUtil;->__CHARSET:Ljava/lang/String;

    .line 118
    .line 119
    invoke-direct {p0, v3, v2, v5, v1}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_1

    .line 120
    .line 121
    .line 122
    goto :goto_4

    .line 123
    :catch_1
    new-instance p0, Ljava/lang/String;

    .line 124
    .line 125
    invoke-direct {p0, v3, v2, v5}, Ljava/lang/String;-><init>([BII)V

    .line 126
    .line 127
    .line 128
    :goto_4
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 129
    .line 130
    .line 131
    move-result v1

    .line 132
    invoke-virtual {p0, v2, v1, v0, v4}, Ljava/lang/String;->getChars(II[CI)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 136
    .line 137
    .line 138
    move-result p0

    .line 139
    add-int/2addr v4, p0

    .line 140
    :cond_8
    new-instance p0, Ljava/lang/String;

    .line 141
    .line 142
    invoke-direct {p0, v0, v2, v4}, Ljava/lang/String;-><init>([CII)V

    .line 143
    .line 144
    .line 145
    return-object p0
.end method

.method public static decodePath([BII)Ljava/lang/String;
    .locals 7

    const/4 v0, 0x0

    const/4 v1, 0x0

    move v2, v1

    move v3, v2

    :goto_0
    if-ge v2, p2, :cond_4

    add-int v4, v2, p1

    .line 146
    aget-byte v5, p0, v4

    const/16 v6, 0x25

    if-ne v5, v6, :cond_0

    add-int/lit8 v6, v2, 0x2

    if-ge v6, p2, :cond_0

    add-int/lit8 v4, v4, 0x1

    const/16 v2, 0x10

    const/4 v5, 0x2

    .line 147
    invoke-static {p0, v4, v5, v2}, Lorg/eclipse/jetty/util/TypeUtil;->parseInt([BIII)I

    move-result v2

    and-int/lit16 v2, v2, 0xff

    int-to-byte v5, v2

    move v2, v6

    goto :goto_1

    :cond_0
    const/16 v4, 0x3b

    if-ne v5, v4, :cond_1

    move p2, v2

    goto :goto_4

    :cond_1
    if-nez v0, :cond_2

    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    :cond_2
    :goto_1
    if-nez v0, :cond_3

    .line 148
    new-array v0, p2, [B

    move v4, v1

    :goto_2
    if-ge v4, v3, :cond_3

    add-int v6, v4, p1

    .line 149
    aget-byte v6, p0, v6

    aput-byte v6, v0, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    :cond_3
    add-int/lit8 v4, v3, 0x1

    .line 150
    aput-byte v5, v0, v3

    move v3, v4

    :goto_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_4
    :goto_4
    if-nez v0, :cond_5

    .line 151
    sget-object v0, Lorg/eclipse/jetty/util/URIUtil;->__CHARSET:Ljava/lang/String;

    invoke-static {p0, p1, p2, v0}, Lorg/eclipse/jetty/util/StringUtil;->toString([BIILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 152
    :cond_5
    sget-object p0, Lorg/eclipse/jetty/util/URIUtil;->__CHARSET:Ljava/lang/String;

    invoke-static {v0, v1, v3, p0}, Lorg/eclipse/jetty/util/StringUtil;->toString([BIILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static encodePath(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    if-eqz p0, :cond_2

    .line 301
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 302
    invoke-static {v0, p0}, Lorg/eclipse/jetty/util/URIUtil;->encodePath(Ljava/lang/StringBuilder;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    if-nez v0, :cond_1

    return-object p0

    .line 303
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :cond_2
    :goto_0
    return-object p0
.end method

.method public static encodePath(Ljava/lang/StringBuilder;Ljava/lang/String;)Ljava/lang/StringBuilder;
    .locals 16

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    const/16 v1, 0x3f

    .line 4
    .line 5
    const/16 v2, 0x3e

    .line 6
    .line 7
    const/16 v3, 0x3c

    .line 8
    .line 9
    const/16 v4, 0x3b

    .line 10
    .line 11
    const/16 v5, 0x23

    .line 12
    .line 13
    const/16 v6, 0x22

    .line 14
    .line 15
    const/16 v7, 0x27

    .line 16
    .line 17
    const/16 v8, 0x20

    .line 18
    .line 19
    const/4 v9, 0x0

    .line 20
    const/16 v10, 0x25

    .line 21
    .line 22
    const/4 v11, 0x0

    .line 23
    if-nez p0, :cond_4

    .line 24
    .line 25
    move v12, v9

    .line 26
    :goto_0
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 27
    .line 28
    .line 29
    move-result v13

    .line 30
    if-ge v12, v13, :cond_2

    .line 31
    .line 32
    invoke-virtual {v0, v12}, Ljava/lang/String;->charAt(I)C

    .line 33
    .line 34
    .line 35
    move-result v13

    .line 36
    if-eq v13, v8, :cond_1

    .line 37
    .line 38
    if-eq v13, v10, :cond_1

    .line 39
    .line 40
    if-eq v13, v7, :cond_1

    .line 41
    .line 42
    if-eq v13, v6, :cond_1

    .line 43
    .line 44
    if-eq v13, v5, :cond_1

    .line 45
    .line 46
    if-eq v13, v4, :cond_1

    .line 47
    .line 48
    if-eq v13, v3, :cond_1

    .line 49
    .line 50
    if-eq v13, v2, :cond_1

    .line 51
    .line 52
    if-eq v13, v1, :cond_1

    .line 53
    .line 54
    const/16 v14, 0x7f

    .line 55
    .line 56
    if-le v13, v14, :cond_0

    .line 57
    .line 58
    :try_start_0
    sget-object v12, Lorg/eclipse/jetty/util/URIUtil;->__CHARSET:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v0, v12}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 61
    .line 62
    .line 63
    move-result-object v12
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 64
    new-instance v13, Ljava/lang/StringBuilder;

    .line 65
    .line 66
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 67
    .line 68
    .line 69
    move-result v14

    .line 70
    mul-int/lit8 v14, v14, 0x2

    .line 71
    .line 72
    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 73
    .line 74
    .line 75
    move-object v15, v13

    .line 76
    move-object v13, v12

    .line 77
    move-object v12, v15

    .line 78
    goto :goto_2

    .line 79
    :catch_0
    move-exception v0

    .line 80
    invoke-static {v0}, Ll/xpg0;->a(Ljava/lang/Throwable;)V

    .line 81
    .line 82
    .line 83
    return-object v11

    .line 84
    :cond_0
    add-int/lit8 v12, v12, 0x1

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_1
    new-instance v12, Ljava/lang/StringBuilder;

    .line 88
    .line 89
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 90
    .line 91
    .line 92
    move-result v13

    .line 93
    mul-int/lit8 v13, v13, 0x2

    .line 94
    .line 95
    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 96
    .line 97
    .line 98
    :goto_1
    move-object v13, v11

    .line 99
    goto :goto_2

    .line 100
    :cond_2
    move-object/from16 v12, p0

    .line 101
    .line 102
    goto :goto_1

    .line 103
    :goto_2
    if-nez v12, :cond_3

    .line 104
    .line 105
    return-object v11

    .line 106
    :cond_3
    move-object v11, v13

    .line 107
    goto :goto_3

    .line 108
    :cond_4
    move-object/from16 v12, p0

    .line 109
    .line 110
    :goto_3
    monitor-enter v12

    .line 111
    if-eqz v11, :cond_f

    .line 112
    .line 113
    :goto_4
    :try_start_1
    array-length v0, v11

    .line 114
    if-ge v9, v0, :cond_19

    .line 115
    .line 116
    aget-byte v0, v11, v9

    .line 117
    .line 118
    if-eq v0, v8, :cond_e

    .line 119
    .line 120
    if-eq v0, v10, :cond_d

    .line 121
    .line 122
    if-eq v0, v7, :cond_c

    .line 123
    .line 124
    if-eq v0, v6, :cond_b

    .line 125
    .line 126
    if-eq v0, v5, :cond_a

    .line 127
    .line 128
    if-eq v0, v4, :cond_9

    .line 129
    .line 130
    if-eq v0, v3, :cond_8

    .line 131
    .line 132
    if-eq v0, v2, :cond_7

    .line 133
    .line 134
    if-eq v0, v1, :cond_6

    .line 135
    .line 136
    if-gez v0, :cond_5

    .line 137
    .line 138
    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    invoke-static {v0, v12}, Lorg/eclipse/jetty/util/TypeUtil;->toHex(BLjava/lang/Appendable;)V

    .line 142
    .line 143
    .line 144
    goto :goto_5

    .line 145
    :catchall_0
    move-exception v0

    .line 146
    goto/16 :goto_8

    .line 147
    .line 148
    :cond_5
    int-to-char v0, v0

    .line 149
    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    goto :goto_5

    .line 153
    :cond_6
    const-string v0, "%3F"

    .line 154
    .line 155
    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    goto :goto_5

    .line 159
    :cond_7
    const-string v0, "%3E"

    .line 160
    .line 161
    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 162
    .line 163
    .line 164
    goto :goto_5

    .line 165
    :cond_8
    const-string v0, "%3C"

    .line 166
    .line 167
    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    goto :goto_5

    .line 171
    :cond_9
    const-string v0, "%3B"

    .line 172
    .line 173
    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    goto :goto_5

    .line 177
    :cond_a
    const-string v0, "%23"

    .line 178
    .line 179
    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 180
    .line 181
    .line 182
    goto :goto_5

    .line 183
    :cond_b
    const-string v0, "%22"

    .line 184
    .line 185
    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    goto :goto_5

    .line 189
    :cond_c
    const-string v0, "%27"

    .line 190
    .line 191
    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 192
    .line 193
    .line 194
    goto :goto_5

    .line 195
    :cond_d
    const-string v0, "%25"

    .line 196
    .line 197
    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 198
    .line 199
    .line 200
    goto :goto_5

    .line 201
    :cond_e
    const-string v0, "%20"

    .line 202
    .line 203
    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 204
    .line 205
    .line 206
    :goto_5
    add-int/lit8 v9, v9, 0x1

    .line 207
    .line 208
    goto :goto_4

    .line 209
    :cond_f
    :goto_6
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 210
    .line 211
    .line 212
    move-result v11

    .line 213
    if-ge v9, v11, :cond_19

    .line 214
    .line 215
    invoke-virtual {v0, v9}, Ljava/lang/String;->charAt(I)C

    .line 216
    .line 217
    .line 218
    move-result v11

    .line 219
    if-eq v11, v8, :cond_18

    .line 220
    .line 221
    if-eq v11, v10, :cond_17

    .line 222
    .line 223
    if-eq v11, v7, :cond_16

    .line 224
    .line 225
    if-eq v11, v6, :cond_15

    .line 226
    .line 227
    if-eq v11, v5, :cond_14

    .line 228
    .line 229
    if-eq v11, v4, :cond_13

    .line 230
    .line 231
    if-eq v11, v3, :cond_12

    .line 232
    .line 233
    if-eq v11, v2, :cond_11

    .line 234
    .line 235
    if-eq v11, v1, :cond_10

    .line 236
    .line 237
    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 238
    .line 239
    .line 240
    goto :goto_7

    .line 241
    :cond_10
    const-string v11, "%3F"

    .line 242
    .line 243
    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 244
    .line 245
    .line 246
    goto :goto_7

    .line 247
    :cond_11
    const-string v11, "%3E"

    .line 248
    .line 249
    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 250
    .line 251
    .line 252
    goto :goto_7

    .line 253
    :cond_12
    const-string v11, "%3C"

    .line 254
    .line 255
    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 256
    .line 257
    .line 258
    goto :goto_7

    .line 259
    :cond_13
    const-string v11, "%3B"

    .line 260
    .line 261
    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 262
    .line 263
    .line 264
    goto :goto_7

    .line 265
    :cond_14
    const-string v11, "%23"

    .line 266
    .line 267
    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 268
    .line 269
    .line 270
    goto :goto_7

    .line 271
    :cond_15
    const-string v11, "%22"

    .line 272
    .line 273
    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 274
    .line 275
    .line 276
    goto :goto_7

    .line 277
    :cond_16
    const-string v11, "%27"

    .line 278
    .line 279
    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 280
    .line 281
    .line 282
    goto :goto_7

    .line 283
    :cond_17
    const-string v11, "%25"

    .line 284
    .line 285
    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 286
    .line 287
    .line 288
    goto :goto_7

    .line 289
    :cond_18
    const-string v11, "%20"

    .line 290
    .line 291
    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 292
    .line 293
    .line 294
    :goto_7
    add-int/lit8 v9, v9, 0x1

    .line 295
    .line 296
    goto :goto_6

    .line 297
    :cond_19
    monitor-exit v12

    .line 298
    return-object v12

    .line 299
    :goto_8
    monitor-exit v12
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 300
    throw v0
.end method

.method public static encodeString(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    const/16 v1, 0x25

    .line 3
    .line 4
    if-nez p0, :cond_3

    .line 5
    .line 6
    move v2, v0

    .line 7
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    if-ge v2, v3, :cond_2

    .line 12
    .line 13
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    if-eq v3, v1, :cond_1

    .line 18
    .line 19
    invoke-virtual {p2, v3}, Ljava/lang/String;->indexOf(I)I

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    if-ltz v3, :cond_0

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    :goto_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    shl-int/lit8 v2, v2, 0x1

    .line 36
    .line 37
    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 38
    .line 39
    .line 40
    :cond_2
    if-nez p0, :cond_3

    .line 41
    .line 42
    const/4 p0, 0x0

    .line 43
    return-object p0

    .line 44
    :cond_3
    monitor-enter p0

    .line 45
    :goto_2
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    if-ge v0, v2, :cond_6

    .line 50
    .line 51
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-eq v2, v1, :cond_5

    .line 56
    .line 57
    invoke-virtual {p2, v2}, Ljava/lang/String;->indexOf(I)I

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    if-ltz v3, :cond_4

    .line 62
    .line 63
    goto :goto_3

    .line 64
    :cond_4
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    goto :goto_4

    .line 68
    :catchall_0
    move-exception p1

    .line 69
    goto :goto_5

    .line 70
    :cond_5
    :goto_3
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    and-int/lit16 v2, v2, 0xff

    .line 74
    .line 75
    int-to-byte v2, v2

    .line 76
    const/16 v3, 0x10

    .line 77
    .line 78
    invoke-static {p0, v2, v3}, Lorg/eclipse/jetty/util/StringUtil;->append(Ljava/lang/StringBuilder;BI)V

    .line 79
    .line 80
    .line 81
    :goto_4
    add-int/lit8 v0, v0, 0x1

    .line 82
    .line 83
    goto :goto_2

    .line 84
    :cond_6
    monitor-exit p0

    .line 85
    return-object p0

    .line 86
    :goto_5
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 87
    throw p1
.end method

.method public static hasScheme(Ljava/lang/String;)Z
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 4
    .line 5
    .line 6
    move-result v2

    .line 7
    if-ge v1, v2, :cond_5

    .line 8
    .line 9
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    const/16 v3, 0x3a

    .line 14
    .line 15
    if-ne v2, v3, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/16 v3, 0x61

    .line 20
    .line 21
    if-lt v2, v3, :cond_1

    .line 22
    .line 23
    const/16 v3, 0x7a

    .line 24
    .line 25
    if-le v2, v3, :cond_4

    .line 26
    .line 27
    :cond_1
    const/16 v3, 0x41

    .line 28
    .line 29
    if-lt v2, v3, :cond_2

    .line 30
    .line 31
    const/16 v3, 0x5a

    .line 32
    .line 33
    if-le v2, v3, :cond_4

    .line 34
    .line 35
    :cond_2
    if-lez v1, :cond_5

    .line 36
    .line 37
    const/16 v3, 0x30

    .line 38
    .line 39
    if-lt v2, v3, :cond_3

    .line 40
    .line 41
    const/16 v3, 0x39

    .line 42
    .line 43
    if-le v2, v3, :cond_4

    .line 44
    .line 45
    :cond_3
    const/16 v3, 0x2e

    .line 46
    .line 47
    if-eq v2, v3, :cond_4

    .line 48
    .line 49
    const/16 v3, 0x2b

    .line 50
    .line 51
    if-eq v2, v3, :cond_4

    .line 52
    .line 53
    const/16 v3, 0x2d

    .line 54
    .line 55
    if-eq v2, v3, :cond_4

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_4
    add-int/lit8 v1, v1, 0x1

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_5
    :goto_1
    return v0
.end method

.method public static parentPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_1

    .line 3
    .line 4
    const-string v1, "/"

    .line 5
    .line 6
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    add-int/lit8 v1, v1, -0x2

    .line 18
    .line 19
    const/16 v2, 0x2f

    .line 20
    .line 21
    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->lastIndexOf(II)I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-ltz v1, :cond_1

    .line 26
    .line 27
    add-int/lit8 v1, v1, 0x1

    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0

    .line 35
    :cond_1
    :goto_0
    return-object v0
.end method
