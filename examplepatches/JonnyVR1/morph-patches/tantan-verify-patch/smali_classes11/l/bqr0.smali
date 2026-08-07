.class public final Ll/bqr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/xor0;


# static fields
.field public static final d:Ljava/util/regex/Pattern;

.field public static final e:Ljava/util/regex/Pattern;


# instance fields
.field public final a:Ljava/lang/StringBuilder;

.field public final b:Ljava/util/ArrayList;

.field public final c:Ll/bgw0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "\\s*((?:(\\d+):)?(\\d+):(\\d+)(?:,(\\d+))?)\\s*-->\\s*((?:(\\d+):)?(\\d+):(\\d+)(?:,(\\d+))?)\\s*"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Ll/bqr0;->d:Ljava/util/regex/Pattern;

    .line 8
    .line 9
    const-string v0, "\\{\\\\.*?\\}"

    .line 10
    .line 11
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Ll/bqr0;->e:Ljava/util/regex/Pattern;

    .line 16
    .line 17
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/bqr0;->a:Ljava/lang/StringBuilder;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/bqr0;->b:Ljava/util/ArrayList;

    .line 17
    .line 18
    new-instance v0, Ll/bgw0;

    .line 19
    .line 20
    invoke-direct {v0}, Ll/bgw0;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/bqr0;->c:Ll/bgw0;

    .line 24
    .line 25
    return-void
.end method

.method public static b(I)F
    .locals 1
    .annotation build Landroidx/annotation/VisibleForTesting;
        otherwise = 0x2
    .end annotation

    .line 1
    if-eqz p0, :cond_2

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p0, v0, :cond_1

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    if-ne p0, v0, :cond_0

    .line 8
    .line 9
    const p0, 0x3f6b851f    # 0.92f

    .line 10
    .line 11
    .line 12
    return p0

    .line 13
    :cond_0
    invoke-static {}, Ll/fig0;->a()V

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    return p0

    .line 18
    :cond_1
    const/high16 p0, 0x3f000000    # 0.5f

    .line 19
    .line 20
    return p0

    .line 21
    :cond_2
    const p0, 0x3da3d70a    # 0.08f

    .line 22
    .line 23
    .line 24
    return p0
.end method

.method public static c(Ljava/util/regex/Matcher;I)J
    .locals 6

    .line 1
    add-int/lit8 v0, p1, 0x1

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    const-wide/32 v2, 0x36ee80

    .line 14
    .line 15
    .line 16
    mul-long/2addr v0, v2

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const-wide/16 v0, 0x0

    .line 19
    .line 20
    :goto_0
    add-int/lit8 v2, p1, 0x2

    .line 21
    .line 22
    invoke-virtual {p0, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 27
    .line 28
    .line 29
    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 30
    .line 31
    .line 32
    move-result-wide v2

    .line 33
    const-wide/32 v4, 0xea60

    .line 34
    .line 35
    .line 36
    mul-long/2addr v2, v4

    .line 37
    add-long/2addr v0, v2

    .line 38
    add-int/lit8 v2, p1, 0x3

    .line 39
    .line 40
    invoke-virtual {p0, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 45
    .line 46
    .line 47
    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 48
    .line 49
    .line 50
    move-result-wide v2

    .line 51
    const-wide/16 v4, 0x3e8

    .line 52
    .line 53
    mul-long/2addr v2, v4

    .line 54
    add-long/2addr v0, v2

    .line 55
    add-int/lit8 p1, p1, 0x4

    .line 56
    .line 57
    invoke-virtual {p0, p1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    if-eqz p0, :cond_1

    .line 62
    .line 63
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 64
    .line 65
    .line 66
    move-result-wide p0

    .line 67
    add-long/2addr v0, p0

    .line 68
    :cond_1
    mul-long/2addr v0, v4

    .line 69
    return-wide v0
.end method


# virtual methods
.method public final a([BIILl/wor0;Ll/hkv0;)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p2

    .line 4
    .line 5
    const-string v2, "SubripParser"

    .line 6
    .line 7
    add-int v3, v1, p3

    .line 8
    .line 9
    iget-object v4, v0, Ll/bqr0;->c:Ll/bgw0;

    .line 10
    .line 11
    move-object/from16 v5, p1

    .line 12
    .line 13
    invoke-virtual {v4, v5, v3}, Ll/bgw0;->i([BI)V

    .line 14
    .line 15
    .line 16
    iget-object v3, v0, Ll/bqr0;->c:Ll/bgw0;

    .line 17
    .line 18
    invoke-virtual {v3, v1}, Ll/bgw0;->k(I)V

    .line 19
    .line 20
    .line 21
    iget-object v1, v0, Ll/bqr0;->c:Ll/bgw0;

    .line 22
    .line 23
    invoke-virtual {v1}, Ll/bgw0;->b()Ljava/nio/charset/Charset;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    if-nez v1, :cond_0

    .line 28
    .line 29
    sget-object v1, Ll/cow0;->c:Ljava/nio/charset/Charset;

    .line 30
    .line 31
    :cond_0
    :goto_0
    iget-object v3, v0, Ll/bqr0;->c:Ll/bgw0;

    .line 32
    .line 33
    invoke-virtual {v3, v1}, Ll/bgw0;->N(Ljava/nio/charset/Charset;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    if-eqz v3, :cond_c

    .line 38
    .line 39
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    .line 40
    .line 41
    .line 42
    move-result v4

    .line 43
    if-eqz v4, :cond_b

    .line 44
    .line 45
    :try_start_0
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 46
    .line 47
    .line 48
    iget-object v3, v0, Ll/bqr0;->c:Ll/bgw0;

    .line 49
    .line 50
    invoke-virtual {v3, v1}, Ll/bgw0;->N(Ljava/nio/charset/Charset;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    if-nez v3, :cond_1

    .line 55
    .line 56
    const-string v0, "Unexpected end"

    .line 57
    .line 58
    invoke-static {v2, v0}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_1
    sget-object v4, Ll/bqr0;->d:Ljava/util/regex/Pattern;

    .line 63
    .line 64
    invoke-virtual {v4, v3}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 65
    .line 66
    .line 67
    move-result-object v4

    .line 68
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->matches()Z

    .line 69
    .line 70
    .line 71
    move-result v5

    .line 72
    if-eqz v5, :cond_a

    .line 73
    .line 74
    const/4 v3, 0x1

    .line 75
    invoke-static {v4, v3}, Ll/bqr0;->c(Ljava/util/regex/Matcher;I)J

    .line 76
    .line 77
    .line 78
    move-result-wide v7

    .line 79
    const/4 v5, 0x6

    .line 80
    invoke-static {v4, v5}, Ll/bqr0;->c(Ljava/util/regex/Matcher;I)J

    .line 81
    .line 82
    .line 83
    move-result-wide v4

    .line 84
    iget-object v6, v0, Ll/bqr0;->a:Ljava/lang/StringBuilder;

    .line 85
    .line 86
    const/4 v9, 0x0

    .line 87
    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 88
    .line 89
    .line 90
    iget-object v6, v0, Ll/bqr0;->b:Ljava/util/ArrayList;

    .line 91
    .line 92
    invoke-virtual {v6}, Ljava/util/ArrayList;->clear()V

    .line 93
    .line 94
    .line 95
    iget-object v6, v0, Ll/bqr0;->c:Ll/bgw0;

    .line 96
    .line 97
    invoke-virtual {v6, v1}, Ll/bgw0;->N(Ljava/nio/charset/Charset;)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v6

    .line 101
    :goto_1
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 102
    .line 103
    .line 104
    move-result v10

    .line 105
    iget-object v11, v0, Ll/bqr0;->a:Ljava/lang/StringBuilder;

    .line 106
    .line 107
    if-nez v10, :cond_4

    .line 108
    .line 109
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->length()I

    .line 110
    .line 111
    .line 112
    move-result v10

    .line 113
    if-lez v10, :cond_2

    .line 114
    .line 115
    iget-object v10, v0, Ll/bqr0;->a:Ljava/lang/StringBuilder;

    .line 116
    .line 117
    const-string v11, "<br>"

    .line 118
    .line 119
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    :cond_2
    iget-object v10, v0, Ll/bqr0;->a:Ljava/lang/StringBuilder;

    .line 123
    .line 124
    iget-object v11, v0, Ll/bqr0;->b:Ljava/util/ArrayList;

    .line 125
    .line 126
    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v6

    .line 130
    new-instance v12, Ljava/lang/StringBuilder;

    .line 131
    .line 132
    invoke-direct {v12, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    sget-object v13, Ll/bqr0;->e:Ljava/util/regex/Pattern;

    .line 136
    .line 137
    invoke-virtual {v13, v6}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 138
    .line 139
    .line 140
    move-result-object v6

    .line 141
    move v13, v9

    .line 142
    :goto_2
    invoke-virtual {v6}, Ljava/util/regex/Matcher;->find()Z

    .line 143
    .line 144
    .line 145
    move-result v14

    .line 146
    if-eqz v14, :cond_3

    .line 147
    .line 148
    invoke-virtual {v6}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v14

    .line 152
    invoke-virtual {v11, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 153
    .line 154
    .line 155
    invoke-virtual {v6}, Ljava/util/regex/Matcher;->start()I

    .line 156
    .line 157
    .line 158
    move-result v15

    .line 159
    sub-int/2addr v15, v13

    .line 160
    invoke-virtual {v14}, Ljava/lang/String;->length()I

    .line 161
    .line 162
    .line 163
    move-result v14

    .line 164
    add-int v3, v15, v14

    .line 165
    .line 166
    const-string v9, ""

    .line 167
    .line 168
    invoke-virtual {v12, v15, v3, v9}, Ljava/lang/StringBuilder;->replace(IILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 169
    .line 170
    .line 171
    add-int/2addr v13, v14

    .line 172
    const/4 v3, 0x1

    .line 173
    const/4 v9, 0x0

    .line 174
    goto :goto_2

    .line 175
    :cond_3
    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v3

    .line 179
    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 180
    .line 181
    .line 182
    iget-object v3, v0, Ll/bqr0;->c:Ll/bgw0;

    .line 183
    .line 184
    invoke-virtual {v3, v1}, Ll/bgw0;->N(Ljava/nio/charset/Charset;)Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object v6

    .line 188
    const/4 v3, 0x1

    .line 189
    const/4 v9, 0x0

    .line 190
    goto :goto_1

    .line 191
    :cond_4
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object v3

    .line 195
    invoke-static {v3}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    .line 196
    .line 197
    .line 198
    move-result-object v3

    .line 199
    const/4 v6, 0x0

    .line 200
    :goto_3
    iget-object v9, v0, Ll/bqr0;->b:Ljava/util/ArrayList;

    .line 201
    .line 202
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    .line 203
    .line 204
    .line 205
    move-result v9

    .line 206
    if-ge v6, v9, :cond_6

    .line 207
    .line 208
    iget-object v9, v0, Ll/bqr0;->b:Ljava/util/ArrayList;

    .line 209
    .line 210
    invoke-virtual {v9, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 211
    .line 212
    .line 213
    move-result-object v9

    .line 214
    check-cast v9, Ljava/lang/String;

    .line 215
    .line 216
    const-string v10, "\\{\\\\an[1-9]\\}"

    .line 217
    .line 218
    invoke-virtual {v9, v10}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    .line 219
    .line 220
    .line 221
    move-result v10

    .line 222
    if-eqz v10, :cond_5

    .line 223
    .line 224
    :goto_4
    move-wide v10, v4

    .line 225
    goto :goto_5

    .line 226
    :cond_5
    add-int/lit8 v6, v6, 0x1

    .line 227
    .line 228
    goto :goto_3

    .line 229
    :cond_6
    const/4 v9, 0x0

    .line 230
    goto :goto_4

    .line 231
    :goto_5
    new-instance v5, Ll/qor0;

    .line 232
    .line 233
    new-instance v4, Ll/j2v0;

    .line 234
    .line 235
    invoke-direct {v4}, Ll/j2v0;-><init>()V

    .line 236
    .line 237
    .line 238
    invoke-virtual {v4, v3}, Ll/j2v0;->l(Ljava/lang/CharSequence;)Ll/j2v0;

    .line 239
    .line 240
    .line 241
    if-nez v9, :cond_7

    .line 242
    .line 243
    invoke-virtual {v4}, Ll/j2v0;->p()Ll/u4v0;

    .line 244
    .line 245
    .line 246
    move-result-object v3

    .line 247
    goto/16 :goto_10

    .line 248
    .line 249
    :cond_7
    invoke-virtual {v9}, Ljava/lang/String;->hashCode()I

    .line 250
    .line 251
    .line 252
    move-result v3

    .line 253
    const/4 v6, 0x2

    .line 254
    const-string v12, "{\\an1}"

    .line 255
    .line 256
    const-string v13, "{\\an3}"

    .line 257
    .line 258
    const-string v14, "{\\an7}"

    .line 259
    .line 260
    const-string v15, "{\\an9}"

    .line 261
    .line 262
    sparse-switch v3, :sswitch_data_0

    .line 263
    .line 264
    .line 265
    :cond_8
    const/4 v3, 0x1

    .line 266
    goto :goto_9

    .line 267
    :sswitch_0
    invoke-virtual {v9, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 268
    .line 269
    .line 270
    move-result v3

    .line 271
    if-eqz v3, :cond_8

    .line 272
    .line 273
    goto :goto_7

    .line 274
    :sswitch_1
    invoke-virtual {v9, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 275
    .line 276
    .line 277
    move-result v3

    .line 278
    if-eqz v3, :cond_8

    .line 279
    .line 280
    :goto_6
    const/4 v3, 0x0

    .line 281
    goto :goto_8

    .line 282
    :sswitch_2
    const-string v3, "{\\an6}"

    .line 283
    .line 284
    invoke-virtual {v9, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 285
    .line 286
    .line 287
    move-result v3

    .line 288
    if-eqz v3, :cond_8

    .line 289
    .line 290
    goto :goto_7

    .line 291
    :sswitch_3
    const-string v3, "{\\an4}"

    .line 292
    .line 293
    invoke-virtual {v9, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 294
    .line 295
    .line 296
    move-result v3

    .line 297
    if-eqz v3, :cond_8

    .line 298
    .line 299
    goto :goto_6

    .line 300
    :sswitch_4
    invoke-virtual {v9, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 301
    .line 302
    .line 303
    move-result v3

    .line 304
    if-eqz v3, :cond_8

    .line 305
    .line 306
    :goto_7
    invoke-virtual {v4, v6}, Ll/j2v0;->i(I)Ll/j2v0;

    .line 307
    .line 308
    .line 309
    goto :goto_a

    .line 310
    :sswitch_5
    invoke-virtual {v9, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 311
    .line 312
    .line 313
    move-result v3

    .line 314
    if-eqz v3, :cond_8

    .line 315
    .line 316
    goto :goto_6

    .line 317
    :goto_8
    invoke-virtual {v4, v3}, Ll/j2v0;->i(I)Ll/j2v0;

    .line 318
    .line 319
    .line 320
    goto :goto_a

    .line 321
    :goto_9
    invoke-virtual {v4, v3}, Ll/j2v0;->i(I)Ll/j2v0;

    .line 322
    .line 323
    .line 324
    :goto_a
    invoke-virtual {v9}, Ljava/lang/String;->hashCode()I

    .line 325
    .line 326
    .line 327
    move-result v3

    .line 328
    sparse-switch v3, :sswitch_data_1

    .line 329
    .line 330
    .line 331
    :cond_9
    const/4 v3, 0x1

    .line 332
    goto :goto_e

    .line 333
    :sswitch_6
    invoke-virtual {v9, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 334
    .line 335
    .line 336
    move-result v3

    .line 337
    if-eqz v3, :cond_9

    .line 338
    .line 339
    :goto_b
    const/4 v3, 0x0

    .line 340
    goto :goto_c

    .line 341
    :sswitch_7
    const-string v3, "{\\an8}"

    .line 342
    .line 343
    invoke-virtual {v9, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 344
    .line 345
    .line 346
    move-result v3

    .line 347
    if-eqz v3, :cond_9

    .line 348
    .line 349
    goto :goto_b

    .line 350
    :sswitch_8
    invoke-virtual {v9, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 351
    .line 352
    .line 353
    move-result v3

    .line 354
    if-eqz v3, :cond_9

    .line 355
    .line 356
    goto :goto_b

    .line 357
    :goto_c
    invoke-virtual {v4, v3}, Ll/j2v0;->f(I)Ll/j2v0;

    .line 358
    .line 359
    .line 360
    goto :goto_f

    .line 361
    :sswitch_9
    invoke-virtual {v9, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 362
    .line 363
    .line 364
    move-result v3

    .line 365
    if-eqz v3, :cond_9

    .line 366
    .line 367
    goto :goto_d

    .line 368
    :sswitch_a
    const-string v3, "{\\an2}"

    .line 369
    .line 370
    invoke-virtual {v9, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 371
    .line 372
    .line 373
    move-result v3

    .line 374
    if-eqz v3, :cond_9

    .line 375
    .line 376
    goto :goto_d

    .line 377
    :sswitch_b
    invoke-virtual {v9, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 378
    .line 379
    .line 380
    move-result v3

    .line 381
    if-eqz v3, :cond_9

    .line 382
    .line 383
    :goto_d
    invoke-virtual {v4, v6}, Ll/j2v0;->f(I)Ll/j2v0;

    .line 384
    .line 385
    .line 386
    goto :goto_f

    .line 387
    :goto_e
    invoke-virtual {v4, v3}, Ll/j2v0;->f(I)Ll/j2v0;

    .line 388
    .line 389
    .line 390
    :goto_f
    invoke-virtual {v4}, Ll/j2v0;->b()I

    .line 391
    .line 392
    .line 393
    move-result v3

    .line 394
    invoke-static {v3}, Ll/bqr0;->b(I)F

    .line 395
    .line 396
    .line 397
    move-result v3

    .line 398
    invoke-virtual {v4, v3}, Ll/j2v0;->h(F)Ll/j2v0;

    .line 399
    .line 400
    .line 401
    invoke-virtual {v4}, Ll/j2v0;->a()I

    .line 402
    .line 403
    .line 404
    move-result v3

    .line 405
    invoke-static {v3}, Ll/bqr0;->b(I)F

    .line 406
    .line 407
    .line 408
    move-result v3

    .line 409
    const/4 v6, 0x0

    .line 410
    invoke-virtual {v4, v3, v6}, Ll/j2v0;->e(FI)Ll/j2v0;

    .line 411
    .line 412
    .line 413
    invoke-virtual {v4}, Ll/j2v0;->p()Ll/u4v0;

    .line 414
    .line 415
    .line 416
    move-result-object v3

    .line 417
    :goto_10
    sub-long v9, v10, v7

    .line 418
    .line 419
    invoke-static {v3}, Lcom/google/android/gms/internal/ads/zzgaa;->zzm(Ljava/lang/Object;)Lcom/google/android/gms/internal/ads/zzgaa;

    .line 420
    .line 421
    .line 422
    move-result-object v6

    .line 423
    invoke-direct/range {v5 .. v10}, Ll/qor0;-><init>(Ljava/util/List;JJ)V

    .line 424
    .line 425
    .line 426
    move-object/from16 v4, p5

    .line 427
    .line 428
    invoke-interface {v4, v5}, Ll/hkv0;->zza(Ljava/lang/Object;)V

    .line 429
    .line 430
    .line 431
    goto/16 :goto_0

    .line 432
    .line 433
    :cond_a
    move-object/from16 v4, p5

    .line 434
    .line 435
    const-string v5, "Skipping invalid timing: "

    .line 436
    .line 437
    invoke-virtual {v5, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 438
    .line 439
    .line 440
    move-result-object v3

    .line 441
    invoke-static {v2, v3}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 442
    .line 443
    .line 444
    goto/16 :goto_0

    .line 445
    .line 446
    :catch_0
    move-object/from16 v4, p5

    .line 447
    .line 448
    const-string v5, "Skipping invalid index: "

    .line 449
    .line 450
    invoke-virtual {v5, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 451
    .line 452
    .line 453
    move-result-object v3

    .line 454
    invoke-static {v2, v3}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 455
    .line 456
    .line 457
    goto/16 :goto_0

    .line 458
    .line 459
    :cond_b
    move-object/from16 v4, p5

    .line 460
    .line 461
    goto/16 :goto_0

    .line 462
    .line 463
    :cond_c
    return-void

    .line 464
    nop

    .line 465
    :sswitch_data_0
    .sparse-switch
        -0x28ddbde6 -> :sswitch_5
        -0x28ddbda8 -> :sswitch_4
        -0x28ddbd89 -> :sswitch_3
        -0x28ddbd4b -> :sswitch_2
        -0x28ddbd2c -> :sswitch_1
        -0x28ddbcee -> :sswitch_0
    .end sparse-switch

    .line 466
    .line 467
    .line 468
    .line 469
    .line 470
    .line 471
    .line 472
    .line 473
    .line 474
    .line 475
    .line 476
    .line 477
    .line 478
    .line 479
    .line 480
    .line 481
    .line 482
    .line 483
    .line 484
    .line 485
    .line 486
    .line 487
    .line 488
    .line 489
    .line 490
    .line 491
    :sswitch_data_1
    .sparse-switch
        -0x28ddbde6 -> :sswitch_b
        -0x28ddbdc7 -> :sswitch_a
        -0x28ddbda8 -> :sswitch_9
        -0x28ddbd2c -> :sswitch_8
        -0x28ddbd0d -> :sswitch_7
        -0x28ddbcee -> :sswitch_6
    .end sparse-switch
.end method
