.class public final Lcom/tencent/cloud/ai/network/okhttp3/internal/http/c;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lcom/tencent/cloud/ai/network/okio/ByteString;

.field public static final b:Lcom/tencent/cloud/ai/network/okio/ByteString;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "\"\\"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okio/ByteString;->encodeUtf8(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/c;->a:Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 8
    .line 9
    const-string v0, "\t ,="

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okio/ByteString;->encodeUtf8(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/c;->b:Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 16
    .line 17
    return-void
.end method

.method public static a(Lcom/tencent/cloud/ai/network/okio/e;B)I
    .locals 3

    const/4 v0, 0x0

    .line 345
    :goto_0
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/e;->g()Z

    move-result v1

    if-nez v1, :cond_0

    const-wide/16 v1, 0x0

    invoke-virtual {p0, v1, v2}, Lcom/tencent/cloud/ai/network/okio/e;->h(J)B

    move-result v1

    if-ne v1, p1, :cond_0

    add-int/lit8 v0, v0, 0x1

    .line 346
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/e;->readByte()B

    goto :goto_0

    :cond_0
    return v0
.end method

.method public static a(Ljava/lang/String;I)I
    .locals 2

    .line 358
    :try_start_0
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide p0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    const-wide/32 v0, 0x7fffffff

    cmp-long v0, p0, v0

    if-lez v0, :cond_0

    const p0, 0x7fffffff

    return p0

    :cond_0
    const-wide/16 v0, 0x0

    cmp-long v0, p0, v0

    if-gez v0, :cond_1

    const/4 p0, 0x0

    return p0

    :cond_1
    long-to-int p0, p0

    return p0

    :catch_0
    return p1
.end method

.method public static a(Ljava/lang/String;ILjava/lang/String;)I
    .locals 2

    .line 356
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-ge p1, v0, :cond_1

    .line 357
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    return p1
.end method

.method public static a(Lcom/tencent/cloud/ai/network/okhttp3/Response;)J
    .locals 2

    .line 342
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->headers()Lcom/tencent/cloud/ai/network/okhttp3/o;

    move-result-object p0

    const-string v0, "Content-Length"

    .line 343
    invoke-virtual {p0, v0}, Lcom/tencent/cloud/ai/network/okhttp3/o;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_0

    goto :goto_0

    .line 344
    :cond_0
    :try_start_0
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return-wide v0

    :catch_0
    :goto_0
    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method public static a(Lcom/tencent/cloud/ai/network/okio/e;)Ljava/lang/String;
    .locals 5

    const/4 v0, 0x0

    .line 347
    :try_start_0
    sget-object v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/c;->b:Lcom/tencent/cloud/ai/network/okio/ByteString;

    invoke-virtual {p0, v1}, Lcom/tencent/cloud/ai/network/okio/e;->a(Lcom/tencent/cloud/ai/network/okio/ByteString;)J

    move-result-wide v1

    const-wide/16 v3, -0x1

    cmp-long v3, v1, v3

    if-nez v3, :cond_0

    .line 348
    iget-wide v1, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    :cond_0
    const-wide/16 v3, 0x0

    cmp-long v3, v1, v3

    if-eqz v3, :cond_1

    .line 349
    sget-object v3, Lcom/tencent/cloud/ai/network/okio/y;->a:Ljava/nio/charset/Charset;

    invoke-virtual {p0, v1, v2, v3}, Lcom/tencent/cloud/ai/network/okio/e;->a(JLjava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :cond_1
    return-object v0

    .line 350
    :catch_0
    invoke-static {}, Ll/aqg0;->a()V

    return-object v0
.end method

.method public static a(Lcom/tencent/cloud/ai/network/okhttp3/o;Ljava/lang/String;)Ljava/util/List;
    .locals 20
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tencent/cloud/ai/network/okhttp3/o;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/tencent/cloud/ai/network/okhttp3/f;",
            ">;"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    new-instance v1, Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 6
    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    :goto_0
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okhttp3/o;->b()I

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    if-ge v2, v3, :cond_13

    .line 14
    .line 15
    invoke-virtual {v0, v2}, Lcom/tencent/cloud/ai/network/okhttp3/o;->a(I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    move-object/from16 v4, p1

    .line 20
    .line 21
    invoke-virtual {v4, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    if-eqz v3, :cond_12

    .line 26
    .line 27
    new-instance v3, Lcom/tencent/cloud/ai/network/okio/e;

    .line 28
    .line 29
    invoke-direct {v3}, Lcom/tencent/cloud/ai/network/okio/e;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v2}, Lcom/tencent/cloud/ai/network/okhttp3/o;->b(I)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v5

    .line 36
    invoke-virtual {v3, v5}, Lcom/tencent/cloud/ai/network/okio/e;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okio/e;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    const/4 v5, 0x0

    .line 41
    :goto_1
    move-object v6, v5

    .line 42
    :goto_2
    if-nez v6, :cond_0

    .line 43
    .line 44
    invoke-static {v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/c;->b(Lcom/tencent/cloud/ai/network/okio/e;)Z

    .line 45
    .line 46
    .line 47
    invoke-static {v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/c;->a(Lcom/tencent/cloud/ai/network/okio/e;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v6

    .line 51
    if-nez v6, :cond_0

    .line 52
    .line 53
    goto/16 :goto_8

    .line 54
    .line 55
    :cond_0
    invoke-static {v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/c;->b(Lcom/tencent/cloud/ai/network/okio/e;)Z

    .line 56
    .line 57
    .line 58
    move-result v7

    .line 59
    invoke-static {v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/c;->a(Lcom/tencent/cloud/ai/network/okio/e;)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v8

    .line 63
    if-nez v8, :cond_2

    .line 64
    .line 65
    invoke-virtual {v3}, Lcom/tencent/cloud/ai/network/okio/e;->g()Z

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    if-nez v3, :cond_1

    .line 70
    .line 71
    goto/16 :goto_8

    .line 72
    .line 73
    :cond_1
    new-instance v3, Lcom/tencent/cloud/ai/network/okhttp3/f;

    .line 74
    .line 75
    sget-object v5, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 76
    .line 77
    invoke-direct {v3, v6, v5}, Lcom/tencent/cloud/ai/network/okhttp3/f;-><init>(Ljava/lang/String;Ljava/util/Map;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    goto/16 :goto_8

    .line 84
    .line 85
    :cond_2
    const/16 v9, 0x3d

    .line 86
    .line 87
    invoke-static {v3, v9}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/c;->a(Lcom/tencent/cloud/ai/network/okio/e;B)I

    .line 88
    .line 89
    .line 90
    move-result v10

    .line 91
    invoke-static {v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/c;->b(Lcom/tencent/cloud/ai/network/okio/e;)Z

    .line 92
    .line 93
    .line 94
    move-result v11

    .line 95
    if-nez v7, :cond_4

    .line 96
    .line 97
    if-nez v11, :cond_3

    .line 98
    .line 99
    invoke-virtual {v3}, Lcom/tencent/cloud/ai/network/okio/e;->g()Z

    .line 100
    .line 101
    .line 102
    move-result v7

    .line 103
    if-eqz v7, :cond_4

    .line 104
    .line 105
    :cond_3
    new-instance v7, Lcom/tencent/cloud/ai/network/okhttp3/f;

    .line 106
    .line 107
    new-array v10, v10, [C

    .line 108
    .line 109
    invoke-static {v10, v9}, Ljava/util/Arrays;->fill([CC)V

    .line 110
    .line 111
    .line 112
    new-instance v9, Ljava/lang/String;

    .line 113
    .line 114
    invoke-direct {v9, v10}, Ljava/lang/String;-><init>([C)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v8, v9}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v8

    .line 121
    invoke-static {v5, v8}, Ljava/util/Collections;->singletonMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    .line 122
    .line 123
    .line 124
    move-result-object v8

    .line 125
    invoke-direct {v7, v6, v8}, Lcom/tencent/cloud/ai/network/okhttp3/f;-><init>(Ljava/lang/String;Ljava/util/Map;)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {v1, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 129
    .line 130
    .line 131
    goto :goto_1

    .line 132
    :cond_4
    new-instance v7, Ljava/util/LinkedHashMap;

    .line 133
    .line 134
    invoke-direct {v7}, Ljava/util/LinkedHashMap;-><init>()V

    .line 135
    .line 136
    .line 137
    invoke-static {v3, v9}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/c;->a(Lcom/tencent/cloud/ai/network/okio/e;B)I

    .line 138
    .line 139
    .line 140
    move-result v11

    .line 141
    add-int/2addr v10, v11

    .line 142
    :goto_3
    if-nez v8, :cond_6

    .line 143
    .line 144
    invoke-static {v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/c;->a(Lcom/tencent/cloud/ai/network/okio/e;)Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v8

    .line 148
    invoke-static {v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/c;->b(Lcom/tencent/cloud/ai/network/okio/e;)Z

    .line 149
    .line 150
    .line 151
    move-result v10

    .line 152
    if-eqz v10, :cond_5

    .line 153
    .line 154
    goto :goto_4

    .line 155
    :cond_5
    invoke-static {v3, v9}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/c;->a(Lcom/tencent/cloud/ai/network/okio/e;B)I

    .line 156
    .line 157
    .line 158
    move-result v10

    .line 159
    :cond_6
    if-nez v10, :cond_7

    .line 160
    .line 161
    :goto_4
    new-instance v9, Lcom/tencent/cloud/ai/network/okhttp3/f;

    .line 162
    .line 163
    invoke-direct {v9, v6, v7}, Lcom/tencent/cloud/ai/network/okhttp3/f;-><init>(Ljava/lang/String;Ljava/util/Map;)V

    .line 164
    .line 165
    .line 166
    invoke-virtual {v1, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 167
    .line 168
    .line 169
    move-object v6, v8

    .line 170
    goto/16 :goto_2

    .line 171
    .line 172
    :cond_7
    const/4 v11, 0x1

    .line 173
    if-le v10, v11, :cond_8

    .line 174
    .line 175
    goto/16 :goto_8

    .line 176
    .line 177
    :cond_8
    invoke-static {v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/c;->b(Lcom/tencent/cloud/ai/network/okio/e;)Z

    .line 178
    .line 179
    .line 180
    move-result v11

    .line 181
    if-eqz v11, :cond_9

    .line 182
    .line 183
    goto/16 :goto_8

    .line 184
    .line 185
    :cond_9
    invoke-virtual {v3}, Lcom/tencent/cloud/ai/network/okio/e;->g()Z

    .line 186
    .line 187
    .line 188
    move-result v11

    .line 189
    if-nez v11, :cond_e

    .line 190
    .line 191
    const-wide/16 v11, 0x0

    .line 192
    .line 193
    invoke-virtual {v3, v11, v12}, Lcom/tencent/cloud/ai/network/okio/e;->h(J)B

    .line 194
    .line 195
    .line 196
    move-result v11

    .line 197
    const/16 v12, 0x22

    .line 198
    .line 199
    if-ne v11, v12, :cond_e

    .line 200
    .line 201
    invoke-virtual {v3}, Lcom/tencent/cloud/ai/network/okio/e;->readByte()B

    .line 202
    .line 203
    .line 204
    move-result v11

    .line 205
    if-ne v11, v12, :cond_d

    .line 206
    .line 207
    new-instance v11, Lcom/tencent/cloud/ai/network/okio/e;

    .line 208
    .line 209
    invoke-direct {v11}, Lcom/tencent/cloud/ai/network/okio/e;-><init>()V

    .line 210
    .line 211
    .line 212
    :goto_5
    sget-object v13, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/c;->a:Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 213
    .line 214
    invoke-virtual {v3, v13}, Lcom/tencent/cloud/ai/network/okio/e;->a(Lcom/tencent/cloud/ai/network/okio/ByteString;)J

    .line 215
    .line 216
    .line 217
    move-result-wide v13

    .line 218
    const-wide/16 v15, -0x1

    .line 219
    .line 220
    cmp-long v15, v13, v15

    .line 221
    .line 222
    if-nez v15, :cond_a

    .line 223
    .line 224
    move-object/from16 v16, v5

    .line 225
    .line 226
    move-object v15, v6

    .line 227
    move/from16 v17, v10

    .line 228
    .line 229
    goto :goto_6

    .line 230
    :cond_a
    invoke-virtual {v3, v13, v14}, Lcom/tencent/cloud/ai/network/okio/e;->h(J)B

    .line 231
    .line 232
    .line 233
    move-result v15

    .line 234
    if-ne v15, v12, :cond_b

    .line 235
    .line 236
    invoke-virtual {v11, v3, v13, v14}, Lcom/tencent/cloud/ai/network/okio/e;->write(Lcom/tencent/cloud/ai/network/okio/e;J)V

    .line 237
    .line 238
    .line 239
    invoke-virtual {v3}, Lcom/tencent/cloud/ai/network/okio/e;->readByte()B

    .line 240
    .line 241
    .line 242
    invoke-virtual {v11}, Lcom/tencent/cloud/ai/network/okio/e;->n()Ljava/lang/String;

    .line 243
    .line 244
    .line 245
    move-result-object v11

    .line 246
    move-object/from16 v16, v5

    .line 247
    .line 248
    move-object v15, v6

    .line 249
    move/from16 v17, v10

    .line 250
    .line 251
    goto :goto_7

    .line 252
    :cond_b
    move-object/from16 v16, v5

    .line 253
    .line 254
    move-object v15, v6

    .line 255
    iget-wide v5, v3, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 256
    .line 257
    move/from16 v17, v10

    .line 258
    .line 259
    const-wide/16 v9, 0x1

    .line 260
    .line 261
    add-long v18, v13, v9

    .line 262
    .line 263
    cmp-long v5, v5, v18

    .line 264
    .line 265
    if-nez v5, :cond_c

    .line 266
    .line 267
    :goto_6
    move-object/from16 v11, v16

    .line 268
    .line 269
    goto :goto_7

    .line 270
    :cond_c
    invoke-virtual {v11, v3, v13, v14}, Lcom/tencent/cloud/ai/network/okio/e;->write(Lcom/tencent/cloud/ai/network/okio/e;J)V

    .line 271
    .line 272
    .line 273
    invoke-virtual {v3}, Lcom/tencent/cloud/ai/network/okio/e;->readByte()B

    .line 274
    .line 275
    .line 276
    invoke-virtual {v11, v3, v9, v10}, Lcom/tencent/cloud/ai/network/okio/e;->write(Lcom/tencent/cloud/ai/network/okio/e;J)V

    .line 277
    .line 278
    .line 279
    move-object v6, v15

    .line 280
    move-object/from16 v5, v16

    .line 281
    .line 282
    move/from16 v10, v17

    .line 283
    .line 284
    const/16 v9, 0x3d

    .line 285
    .line 286
    goto :goto_5

    .line 287
    :cond_d
    move-object/from16 v16, v5

    .line 288
    .line 289
    invoke-static {}, Ll/fig0;->a()V

    .line 290
    .line 291
    .line 292
    return-object v16

    .line 293
    :cond_e
    move-object/from16 v16, v5

    .line 294
    .line 295
    move-object v15, v6

    .line 296
    move/from16 v17, v10

    .line 297
    .line 298
    invoke-static {v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/c;->a(Lcom/tencent/cloud/ai/network/okio/e;)Ljava/lang/String;

    .line 299
    .line 300
    .line 301
    move-result-object v11

    .line 302
    :goto_7
    if-nez v11, :cond_f

    .line 303
    .line 304
    goto :goto_8

    .line 305
    :cond_f
    invoke-virtual {v7, v8, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 306
    .line 307
    .line 308
    move-result-object v5

    .line 309
    check-cast v5, Ljava/lang/String;

    .line 310
    .line 311
    if-eqz v5, :cond_10

    .line 312
    .line 313
    goto :goto_8

    .line 314
    :cond_10
    invoke-static {v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/c;->b(Lcom/tencent/cloud/ai/network/okio/e;)Z

    .line 315
    .line 316
    .line 317
    move-result v5

    .line 318
    if-nez v5, :cond_11

    .line 319
    .line 320
    invoke-virtual {v3}, Lcom/tencent/cloud/ai/network/okio/e;->g()Z

    .line 321
    .line 322
    .line 323
    move-result v5

    .line 324
    if-nez v5, :cond_11

    .line 325
    .line 326
    goto :goto_8

    .line 327
    :cond_11
    move-object v6, v15

    .line 328
    move-object/from16 v5, v16

    .line 329
    .line 330
    move-object v8, v5

    .line 331
    move/from16 v10, v17

    .line 332
    .line 333
    const/16 v9, 0x3d

    .line 334
    .line 335
    goto/16 :goto_3

    .line 336
    .line 337
    :cond_12
    :goto_8
    add-int/lit8 v2, v2, 0x1

    .line 338
    .line 339
    goto/16 :goto_0

    .line 340
    .line 341
    :cond_13
    return-object v1
.end method

.method public static a(Lcom/tencent/cloud/ai/network/okhttp3/l;Lcom/tencent/cloud/ai/network/okhttp3/p;Lcom/tencent/cloud/ai/network/okhttp3/o;)V
    .locals 1

    .line 351
    sget-object v0, Lcom/tencent/cloud/ai/network/okhttp3/l;->a:Lcom/tencent/cloud/ai/network/okhttp3/l;

    if-ne p0, v0, :cond_0

    goto :goto_0

    .line 352
    :cond_0
    invoke-static {p1, p2}, Lcom/tencent/cloud/ai/network/okhttp3/k;->a(Lcom/tencent/cloud/ai/network/okhttp3/p;Lcom/tencent/cloud/ai/network/okhttp3/o;)Ljava/util/List;

    move-result-object p1

    .line 353
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_1

    :goto_0
    return-void

    .line 354
    :cond_1
    check-cast p0, Lcom/tencent/cloud/ai/network/okhttp3/l$a;

    .line 355
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public static b(Lcom/tencent/cloud/ai/network/okhttp3/Response;)Z
    .locals 8

    .line 1
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->request()Lcom/tencent/cloud/ai/network/okhttp3/Request;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->method()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "HEAD"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    return v1

    .line 19
    :cond_0
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->code()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    const/16 v2, 0x64

    .line 24
    .line 25
    const/4 v3, 0x1

    .line 26
    if-lt v0, v2, :cond_1

    .line 27
    .line 28
    const/16 v2, 0xc8

    .line 29
    .line 30
    if-lt v0, v2, :cond_2

    .line 31
    .line 32
    :cond_1
    const/16 v2, 0xcc

    .line 33
    .line 34
    if-eq v0, v2, :cond_2

    .line 35
    .line 36
    const/16 v2, 0x130

    .line 37
    .line 38
    if-eq v0, v2, :cond_2

    .line 39
    .line 40
    return v3

    .line 41
    :cond_2
    invoke-static {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/c;->a(Lcom/tencent/cloud/ai/network/okhttp3/Response;)J

    .line 42
    .line 43
    .line 44
    move-result-wide v4

    .line 45
    const-wide/16 v6, -0x1

    .line 46
    .line 47
    cmp-long v0, v4, v6

    .line 48
    .line 49
    if-nez v0, :cond_4

    .line 50
    .line 51
    const-string v0, "Transfer-Encoding"

    .line 52
    .line 53
    invoke-virtual {p0, v0}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->header(Ljava/lang/String;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    const-string v0, "chunked"

    .line 58
    .line 59
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    if-eqz p0, :cond_3

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_3
    return v1

    .line 67
    :cond_4
    :goto_0
    return v3
.end method

.method public static b(Lcom/tencent/cloud/ai/network/okio/e;)Z
    .locals 3

    const/4 v0, 0x0

    .line 68
    :goto_0
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/e;->g()Z

    move-result v1

    if-nez v1, :cond_2

    const-wide/16 v1, 0x0

    .line 69
    invoke-virtual {p0, v1, v2}, Lcom/tencent/cloud/ai/network/okio/e;->h(J)B

    move-result v1

    const/16 v2, 0x2c

    if-ne v1, v2, :cond_0

    .line 70
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/e;->readByte()B

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/16 v2, 0x20

    if-eq v1, v2, :cond_1

    const/16 v2, 0x9

    if-ne v1, v2, :cond_2

    .line 71
    :cond_1
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/e;->readByte()B

    goto :goto_0

    :cond_2
    return v0
.end method
