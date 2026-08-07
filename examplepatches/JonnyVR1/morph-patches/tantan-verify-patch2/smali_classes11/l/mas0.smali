.class public final Ll/mas0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/h8s0;

.field public final b:I

.field public c:Ljava/lang/String;

.field public final d:I


# direct methods
.method public constructor <init>(III)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/mas0;->b:I

    .line 5
    .line 6
    const/16 p1, 0x40

    .line 7
    .line 8
    if-gt p2, p1, :cond_0

    .line 9
    .line 10
    if-gez p2, :cond_1

    .line 11
    .line 12
    :cond_0
    move p2, p1

    .line 13
    :cond_1
    if-gtz p3, :cond_2

    .line 14
    .line 15
    const/4 p1, 0x1

    .line 16
    iput p1, p0, Ll/mas0;->d:I

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_2
    iput p3, p0, Ll/mas0;->d:I

    .line 20
    .line 21
    :goto_0
    new-instance p1, Ll/kas0;

    .line 22
    .line 23
    invoke-direct {p1, p2}, Ll/kas0;-><init>(I)V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, Ll/mas0;->a:Ll/h8s0;

    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public final a(Ljava/util/ArrayList;Ljava/util/ArrayList;)Ljava/lang/String;
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    new-instance v2, Ll/las0;

    .line 6
    .line 7
    invoke-direct {v2, v0}, Ll/las0;-><init>(Ll/mas0;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v1, v2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 11
    .line 12
    .line 13
    new-instance v2, Ljava/util/HashSet;

    .line 14
    .line 15
    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 16
    .line 17
    .line 18
    const/4 v4, 0x0

    .line 19
    :goto_0
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 20
    .line 21
    .line 22
    move-result v5

    .line 23
    if-ge v4, v5, :cond_f

    .line 24
    .line 25
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v5

    .line 29
    check-cast v5, Ll/g8s0;

    .line 30
    .line 31
    invoke-virtual {v5}, Ll/g8s0;->e()I

    .line 32
    .line 33
    .line 34
    move-result v5

    .line 35
    move-object/from16 v6, p1

    .line 36
    .line 37
    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v5

    .line 41
    check-cast v5, Ljava/lang/CharSequence;

    .line 42
    .line 43
    sget-object v7, Ljava/text/Normalizer$Form;->NFKC:Ljava/text/Normalizer$Form;

    .line 44
    .line 45
    invoke-static {v5, v7}, Ljava/text/Normalizer;->normalize(Ljava/lang/CharSequence;Ljava/text/Normalizer$Form;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v5

    .line 49
    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 50
    .line 51
    invoke-virtual {v5, v7}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v5

    .line 55
    const-string v7, "\n"

    .line 56
    .line 57
    invoke-virtual {v5, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v5

    .line 61
    array-length v7, v5

    .line 62
    if-nez v7, :cond_0

    .line 63
    .line 64
    goto/16 :goto_9

    .line 65
    .line 66
    :cond_0
    const/4 v7, 0x0

    .line 67
    :goto_1
    array-length v8, v5

    .line 68
    if-ge v7, v8, :cond_e

    .line 69
    .line 70
    aget-object v8, v5, v7

    .line 71
    .line 72
    const-string v9, "\'"

    .line 73
    .line 74
    invoke-virtual {v8, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 75
    .line 76
    .line 77
    move-result v9

    .line 78
    const/4 v10, 0x1

    .line 79
    if-eqz v9, :cond_7

    .line 80
    .line 81
    new-instance v9, Ljava/lang/StringBuilder;

    .line 82
    .line 83
    invoke-direct {v9, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    move v11, v10

    .line 87
    const/4 v12, 0x0

    .line 88
    :goto_2
    add-int/lit8 v13, v11, 0x2

    .line 89
    .line 90
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->length()I

    .line 91
    .line 92
    .line 93
    move-result v14

    .line 94
    if-gt v13, v14, :cond_5

    .line 95
    .line 96
    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->charAt(I)C

    .line 97
    .line 98
    .line 99
    move-result v14

    .line 100
    const/16 v15, 0x27

    .line 101
    .line 102
    if-ne v14, v15, :cond_4

    .line 103
    .line 104
    add-int/lit8 v12, v11, -0x1

    .line 105
    .line 106
    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->charAt(I)C

    .line 107
    .line 108
    .line 109
    move-result v12

    .line 110
    const/16 v14, 0x20

    .line 111
    .line 112
    if-eq v12, v14, :cond_3

    .line 113
    .line 114
    add-int/lit8 v12, v11, 0x1

    .line 115
    .line 116
    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->charAt(I)C

    .line 117
    .line 118
    .line 119
    move-result v15

    .line 120
    const/16 v3, 0x73

    .line 121
    .line 122
    if-eq v15, v3, :cond_1

    .line 123
    .line 124
    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->charAt(I)C

    .line 125
    .line 126
    .line 127
    move-result v3

    .line 128
    const/16 v12, 0x53

    .line 129
    .line 130
    if-ne v3, v12, :cond_3

    .line 131
    .line 132
    :cond_1
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->length()I

    .line 133
    .line 134
    .line 135
    move-result v3

    .line 136
    if-eq v13, v3, :cond_2

    .line 137
    .line 138
    invoke-virtual {v9, v13}, Ljava/lang/StringBuilder;->charAt(I)C

    .line 139
    .line 140
    .line 141
    move-result v3

    .line 142
    if-ne v3, v14, :cond_3

    .line 143
    .line 144
    :cond_2
    invoke-virtual {v9, v11, v14}, Ljava/lang/StringBuilder;->insert(IC)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    move v11, v13

    .line 148
    goto :goto_3

    .line 149
    :cond_3
    invoke-virtual {v9, v11, v14}, Ljava/lang/StringBuilder;->setCharAt(IC)V

    .line 150
    .line 151
    .line 152
    :goto_3
    move v12, v10

    .line 153
    :cond_4
    add-int/2addr v11, v10

    .line 154
    goto :goto_2

    .line 155
    :cond_5
    if-eqz v12, :cond_6

    .line 156
    .line 157
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v3

    .line 161
    goto :goto_4

    .line 162
    :cond_6
    const/4 v3, 0x0

    .line 163
    :goto_4
    if-eqz v3, :cond_7

    .line 164
    .line 165
    iput-object v3, v0, Ll/mas0;->c:Ljava/lang/String;

    .line 166
    .line 167
    move-object v8, v3

    .line 168
    :cond_7
    invoke-static {v8, v10}, Ll/l8s0;->b(Ljava/lang/String;Z)[Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v3

    .line 172
    array-length v8, v3

    .line 173
    iget v9, v0, Ll/mas0;->d:I

    .line 174
    .line 175
    if-ge v8, v9, :cond_8

    .line 176
    .line 177
    goto :goto_8

    .line 178
    :cond_8
    const/4 v8, 0x0

    .line 179
    :goto_5
    array-length v9, v3

    .line 180
    if-ge v8, v9, :cond_c

    .line 181
    .line 182
    const-string v9, ""

    .line 183
    .line 184
    const/4 v10, 0x0

    .line 185
    :goto_6
    iget v11, v0, Ll/mas0;->d:I

    .line 186
    .line 187
    if-ge v10, v11, :cond_b

    .line 188
    .line 189
    add-int v11, v8, v10

    .line 190
    .line 191
    array-length v12, v3

    .line 192
    if-lt v11, v12, :cond_9

    .line 193
    .line 194
    goto :goto_7

    .line 195
    :cond_9
    if-lez v10, :cond_a

    .line 196
    .line 197
    const-string v12, " "

    .line 198
    .line 199
    invoke-virtual {v9, v12}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    move-result-object v9

    .line 203
    :cond_a
    aget-object v11, v3, v11

    .line 204
    .line 205
    invoke-static {v11}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object v11

    .line 209
    invoke-virtual {v9, v11}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 210
    .line 211
    .line 212
    move-result-object v9

    .line 213
    add-int/lit8 v10, v10, 0x1

    .line 214
    .line 215
    goto :goto_6

    .line 216
    :cond_b
    invoke-virtual {v2, v9}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 217
    .line 218
    .line 219
    invoke-virtual {v2}, Ljava/util/HashSet;->size()I

    .line 220
    .line 221
    .line 222
    move-result v9

    .line 223
    iget v10, v0, Ll/mas0;->b:I

    .line 224
    .line 225
    if-ge v9, v10, :cond_f

    .line 226
    .line 227
    add-int/lit8 v8, v8, 0x1

    .line 228
    .line 229
    goto :goto_5

    .line 230
    :cond_c
    :goto_7
    invoke-virtual {v2}, Ljava/util/HashSet;->size()I

    .line 231
    .line 232
    .line 233
    move-result v3

    .line 234
    iget v8, v0, Ll/mas0;->b:I

    .line 235
    .line 236
    if-lt v3, v8, :cond_d

    .line 237
    .line 238
    goto :goto_a

    .line 239
    :cond_d
    :goto_8
    add-int/lit8 v7, v7, 0x1

    .line 240
    .line 241
    goto/16 :goto_1

    .line 242
    .line 243
    :cond_e
    :goto_9
    add-int/lit8 v4, v4, 0x1

    .line 244
    .line 245
    goto/16 :goto_0

    .line 246
    .line 247
    :cond_f
    :goto_a
    new-instance v1, Ll/j8s0;

    .line 248
    .line 249
    invoke-direct {v1}, Ll/j8s0;-><init>()V

    .line 250
    .line 251
    .line 252
    invoke-virtual {v2}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 253
    .line 254
    .line 255
    move-result-object v2

    .line 256
    :goto_b
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 257
    .line 258
    .line 259
    move-result v3

    .line 260
    if-eqz v3, :cond_10

    .line 261
    .line 262
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 263
    .line 264
    .line 265
    move-result-object v3

    .line 266
    check-cast v3, Ljava/lang/String;

    .line 267
    .line 268
    :try_start_0
    iget-object v4, v0, Ll/mas0;->a:Ll/h8s0;

    .line 269
    .line 270
    invoke-virtual {v4, v3}, Ll/h8s0;->b(Ljava/lang/String;)[B

    .line 271
    .line 272
    .line 273
    move-result-object v3

    .line 274
    iget-object v4, v1, Ll/j8s0;->b:Landroid/util/Base64OutputStream;

    .line 275
    .line 276
    invoke-virtual {v4, v3}, Ljava/io/OutputStream;->write([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 277
    .line 278
    .line 279
    goto :goto_b

    .line 280
    :catch_0
    move-exception v0

    .line 281
    const-string v2, "Error while writing hash to byteStream"

    .line 282
    .line 283
    invoke-static {v2, v0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 284
    .line 285
    .line 286
    :cond_10
    invoke-virtual {v1}, Ll/j8s0;->toString()Ljava/lang/String;

    .line 287
    .line 288
    .line 289
    move-result-object v0

    .line 290
    return-object v0
.end method
