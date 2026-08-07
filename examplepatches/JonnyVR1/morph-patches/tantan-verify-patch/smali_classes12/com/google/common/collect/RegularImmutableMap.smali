.class final Lcom/google/common/collect/RegularImmutableMap;
.super Lcom/google/common/collect/ImmutableMap;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/collect/RegularImmutableMap$KeySet;,
        Lcom/google/common/collect/RegularImmutableMap$KeysOrValuesAsList;,
        Lcom/google/common/collect/RegularImmutableMap$EntrySet;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/ImmutableMap<",
        "TK;TV;>;"
    }
.end annotation


# static fields
.field private static final ABSENT:B = -0x1t

.field private static final BYTE_MASK:I = 0xff

.field private static final BYTE_MAX_SIZE:I = 0x80

.field static final EMPTY:Lcom/google/common/collect/ImmutableMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableMap<",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private static final SHORT_MASK:I = 0xffff

.field private static final SHORT_MAX_SIZE:I = 0x8000

.field private static final serialVersionUID:J


# instance fields
.field final transient alternatingKeysAndValues:[Ljava/lang/Object;

.field private final transient hashTable:Ljava/lang/Object;

.field private final transient size:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/google/common/collect/RegularImmutableMap;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    new-array v2, v1, [Ljava/lang/Object;

    .line 5
    .line 6
    const/4 v3, 0x0

    .line 7
    invoke-direct {v0, v3, v2, v1}, Lcom/google/common/collect/RegularImmutableMap;-><init>(Ljava/lang/Object;[Ljava/lang/Object;I)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/google/common/collect/RegularImmutableMap;->EMPTY:Lcom/google/common/collect/ImmutableMap;

    .line 11
    .line 12
    return-void
.end method

.method private constructor <init>(Ljava/lang/Object;[Ljava/lang/Object;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/common/collect/ImmutableMap;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/common/collect/RegularImmutableMap;->hashTable:Ljava/lang/Object;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/google/common/collect/RegularImmutableMap;->alternatingKeysAndValues:[Ljava/lang/Object;

    .line 7
    .line 8
    iput p3, p0, Lcom/google/common/collect/RegularImmutableMap;->size:I

    .line 9
    .line 10
    return-void
.end method

.method public static create(I[Ljava/lang/Object;)Lcom/google/common/collect/RegularImmutableMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(I[",
            "Ljava/lang/Object;",
            ")",
            "Lcom/google/common/collect/RegularImmutableMap<",
            "TK;TV;>;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 90
    invoke-static {p0, p1, v0}, Lcom/google/common/collect/RegularImmutableMap;->create(I[Ljava/lang/Object;Lcom/google/common/collect/ImmutableMap$b;)Lcom/google/common/collect/RegularImmutableMap;

    move-result-object p0

    return-object p0
.end method

.method public static create(I[Ljava/lang/Object;Lcom/google/common/collect/ImmutableMap$b;)Lcom/google/common/collect/RegularImmutableMap;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(I[",
            "Ljava/lang/Object;",
            "Lcom/google/common/collect/ImmutableMap$b<",
            "TK;TV;>;)",
            "Lcom/google/common/collect/RegularImmutableMap<",
            "TK;TV;>;"
        }
    .end annotation

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    sget-object p0, Lcom/google/common/collect/RegularImmutableMap;->EMPTY:Lcom/google/common/collect/ImmutableMap;

    .line 4
    .line 5
    check-cast p0, Lcom/google/common/collect/RegularImmutableMap;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    const/4 v1, 0x1

    .line 10
    if-ne p0, v1, :cond_1

    .line 11
    .line 12
    aget-object p0, p1, v0

    .line 13
    .line 14
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    aget-object p2, p1, v1

    .line 18
    .line 19
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    invoke-static {p0, p2}, Ll/se5;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    new-instance p0, Lcom/google/common/collect/RegularImmutableMap;

    .line 26
    .line 27
    const/4 p2, 0x0

    .line 28
    invoke-direct {p0, p2, p1, v1}, Lcom/google/common/collect/RegularImmutableMap;-><init>(Ljava/lang/Object;[Ljava/lang/Object;I)V

    .line 29
    .line 30
    .line 31
    return-object p0

    .line 32
    :cond_1
    array-length v2, p1

    .line 33
    shr-int/2addr v2, v1

    .line 34
    invoke-static {p0, v2}, Ll/xn80;->s(II)I

    .line 35
    .line 36
    .line 37
    invoke-static {p0}, Lcom/google/common/collect/ImmutableSet;->chooseTableSize(I)I

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    invoke-static {p1, p0, v2, v0}, Lcom/google/common/collect/RegularImmutableMap;->createHashTable([Ljava/lang/Object;III)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    instance-of v3, v2, [Ljava/lang/Object;

    .line 46
    .line 47
    if-eqz v3, :cond_3

    .line 48
    .line 49
    check-cast v2, [Ljava/lang/Object;

    .line 50
    .line 51
    const/4 p0, 0x2

    .line 52
    aget-object p0, v2, p0

    .line 53
    .line 54
    check-cast p0, Lcom/google/common/collect/ImmutableMap$b$a;

    .line 55
    .line 56
    if-eqz p2, :cond_2

    .line 57
    .line 58
    iput-object p0, p2, Lcom/google/common/collect/ImmutableMap$b;->e:Lcom/google/common/collect/ImmutableMap$b$a;

    .line 59
    .line 60
    aget-object p0, v2, v0

    .line 61
    .line 62
    aget-object p2, v2, v1

    .line 63
    .line 64
    check-cast p2, Ljava/lang/Integer;

    .line 65
    .line 66
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 67
    .line 68
    .line 69
    move-result p2

    .line 70
    mul-int/lit8 v0, p2, 0x2

    .line 71
    .line 72
    invoke-static {p1, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    move-object v2, p0

    .line 77
    move p0, p2

    .line 78
    goto :goto_0

    .line 79
    :cond_2
    invoke-virtual {p0}, Lcom/google/common/collect/ImmutableMap$b$a;->a()Ljava/lang/IllegalArgumentException;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    throw p0

    .line 84
    :cond_3
    :goto_0
    new-instance p2, Lcom/google/common/collect/RegularImmutableMap;

    .line 85
    .line 86
    invoke-direct {p2, v2, p1, p0}, Lcom/google/common/collect/RegularImmutableMap;-><init>(Ljava/lang/Object;[Ljava/lang/Object;I)V

    .line 87
    .line 88
    .line 89
    return-object p2
.end method

.method private static createHashTable([Ljava/lang/Object;III)Ljava/lang/Object;
    .locals 17

    .line 1
    move/from16 v0, p1

    .line 2
    .line 3
    move/from16 v1, p2

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    if-ne v0, v3, :cond_0

    .line 8
    .line 9
    aget-object v0, p0, p3

    .line 10
    .line 11
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    xor-int/lit8 v1, p3, 0x1

    .line 15
    .line 16
    aget-object v1, p0, v1

    .line 17
    .line 18
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    invoke-static {v0, v1}, Ll/se5;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    return-object v2

    .line 25
    :cond_0
    add-int/lit8 v4, v1, -0x1

    .line 26
    .line 27
    const/16 v5, 0x80

    .line 28
    .line 29
    const/4 v6, 0x3

    .line 30
    const/4 v7, -0x1

    .line 31
    const/4 v8, 0x2

    .line 32
    const/4 v9, 0x0

    .line 33
    if-gt v1, v5, :cond_6

    .line 34
    .line 35
    new-array v1, v1, [B

    .line 36
    .line 37
    invoke-static {v1, v7}, Ljava/util/Arrays;->fill([BB)V

    .line 38
    .line 39
    .line 40
    move v5, v9

    .line 41
    move v7, v5

    .line 42
    :goto_0
    if-ge v5, v0, :cond_4

    .line 43
    .line 44
    mul-int/lit8 v10, v5, 0x2

    .line 45
    .line 46
    add-int v10, v10, p3

    .line 47
    .line 48
    mul-int/lit8 v11, v7, 0x2

    .line 49
    .line 50
    add-int v11, v11, p3

    .line 51
    .line 52
    aget-object v12, p0, v10

    .line 53
    .line 54
    invoke-static {v12}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    xor-int/2addr v10, v3

    .line 58
    aget-object v10, p0, v10

    .line 59
    .line 60
    invoke-static {v10}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    invoke-static {v12, v10}, Ll/se5;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v12}, Ljava/lang/Object;->hashCode()I

    .line 67
    .line 68
    .line 69
    move-result v13

    .line 70
    invoke-static {v13}, Ll/bzk;->c(I)I

    .line 71
    .line 72
    .line 73
    move-result v13

    .line 74
    :goto_1
    and-int/2addr v13, v4

    .line 75
    aget-byte v14, v1, v13

    .line 76
    .line 77
    const/16 v15, 0xff

    .line 78
    .line 79
    and-int/2addr v14, v15

    .line 80
    if-ne v14, v15, :cond_2

    .line 81
    .line 82
    int-to-byte v14, v11

    .line 83
    aput-byte v14, v1, v13

    .line 84
    .line 85
    if-ge v7, v5, :cond_1

    .line 86
    .line 87
    aput-object v12, p0, v11

    .line 88
    .line 89
    xor-int/lit8 v11, v11, 0x1

    .line 90
    .line 91
    aput-object v10, p0, v11

    .line 92
    .line 93
    :cond_1
    add-int/lit8 v7, v7, 0x1

    .line 94
    .line 95
    goto :goto_2

    .line 96
    :cond_2
    aget-object v15, p0, v14

    .line 97
    .line 98
    invoke-virtual {v12, v15}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    move-result v15

    .line 102
    if-eqz v15, :cond_3

    .line 103
    .line 104
    new-instance v2, Lcom/google/common/collect/ImmutableMap$b$a;

    .line 105
    .line 106
    xor-int/lit8 v11, v14, 0x1

    .line 107
    .line 108
    aget-object v13, p0, v11

    .line 109
    .line 110
    invoke-static {v13}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    invoke-direct {v2, v12, v10, v13}, Lcom/google/common/collect/ImmutableMap$b$a;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 114
    .line 115
    .line 116
    aput-object v10, p0, v11

    .line 117
    .line 118
    :goto_2
    add-int/lit8 v5, v5, 0x1

    .line 119
    .line 120
    goto :goto_0

    .line 121
    :cond_3
    add-int/lit8 v13, v13, 0x1

    .line 122
    .line 123
    goto :goto_1

    .line 124
    :cond_4
    if-ne v7, v0, :cond_5

    .line 125
    .line 126
    return-object v1

    .line 127
    :cond_5
    new-array v0, v6, [Ljava/lang/Object;

    .line 128
    .line 129
    aput-object v1, v0, v9

    .line 130
    .line 131
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    aput-object v1, v0, v3

    .line 136
    .line 137
    aput-object v2, v0, v8

    .line 138
    .line 139
    return-object v0

    .line 140
    :cond_6
    const v5, 0x8000

    .line 141
    .line 142
    .line 143
    if-gt v1, v5, :cond_c

    .line 144
    .line 145
    new-array v1, v1, [S

    .line 146
    .line 147
    invoke-static {v1, v7}, Ljava/util/Arrays;->fill([SS)V

    .line 148
    .line 149
    .line 150
    move v5, v9

    .line 151
    move v7, v5

    .line 152
    :goto_3
    if-ge v5, v0, :cond_a

    .line 153
    .line 154
    mul-int/lit8 v10, v5, 0x2

    .line 155
    .line 156
    add-int v10, v10, p3

    .line 157
    .line 158
    mul-int/lit8 v11, v7, 0x2

    .line 159
    .line 160
    add-int v11, v11, p3

    .line 161
    .line 162
    aget-object v12, p0, v10

    .line 163
    .line 164
    invoke-static {v12}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 165
    .line 166
    .line 167
    xor-int/2addr v10, v3

    .line 168
    aget-object v10, p0, v10

    .line 169
    .line 170
    invoke-static {v10}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 171
    .line 172
    .line 173
    invoke-static {v12, v10}, Ll/se5;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 174
    .line 175
    .line 176
    invoke-virtual {v12}, Ljava/lang/Object;->hashCode()I

    .line 177
    .line 178
    .line 179
    move-result v13

    .line 180
    invoke-static {v13}, Ll/bzk;->c(I)I

    .line 181
    .line 182
    .line 183
    move-result v13

    .line 184
    :goto_4
    and-int/2addr v13, v4

    .line 185
    aget-short v14, v1, v13

    .line 186
    .line 187
    const v15, 0xffff

    .line 188
    .line 189
    .line 190
    and-int/2addr v14, v15

    .line 191
    if-ne v14, v15, :cond_8

    .line 192
    .line 193
    int-to-short v14, v11

    .line 194
    aput-short v14, v1, v13

    .line 195
    .line 196
    if-ge v7, v5, :cond_7

    .line 197
    .line 198
    aput-object v12, p0, v11

    .line 199
    .line 200
    xor-int/lit8 v11, v11, 0x1

    .line 201
    .line 202
    aput-object v10, p0, v11

    .line 203
    .line 204
    :cond_7
    add-int/lit8 v7, v7, 0x1

    .line 205
    .line 206
    goto :goto_5

    .line 207
    :cond_8
    aget-object v15, p0, v14

    .line 208
    .line 209
    invoke-virtual {v12, v15}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 210
    .line 211
    .line 212
    move-result v15

    .line 213
    if-eqz v15, :cond_9

    .line 214
    .line 215
    new-instance v2, Lcom/google/common/collect/ImmutableMap$b$a;

    .line 216
    .line 217
    xor-int/lit8 v11, v14, 0x1

    .line 218
    .line 219
    aget-object v13, p0, v11

    .line 220
    .line 221
    invoke-static {v13}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 222
    .line 223
    .line 224
    invoke-direct {v2, v12, v10, v13}, Lcom/google/common/collect/ImmutableMap$b$a;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 225
    .line 226
    .line 227
    aput-object v10, p0, v11

    .line 228
    .line 229
    :goto_5
    add-int/lit8 v5, v5, 0x1

    .line 230
    .line 231
    goto :goto_3

    .line 232
    :cond_9
    add-int/lit8 v13, v13, 0x1

    .line 233
    .line 234
    goto :goto_4

    .line 235
    :cond_a
    if-ne v7, v0, :cond_b

    .line 236
    .line 237
    return-object v1

    .line 238
    :cond_b
    new-array v0, v6, [Ljava/lang/Object;

    .line 239
    .line 240
    aput-object v1, v0, v9

    .line 241
    .line 242
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 243
    .line 244
    .line 245
    move-result-object v1

    .line 246
    aput-object v1, v0, v3

    .line 247
    .line 248
    aput-object v2, v0, v8

    .line 249
    .line 250
    return-object v0

    .line 251
    :cond_c
    new-array v1, v1, [I

    .line 252
    .line 253
    invoke-static {v1, v7}, Ljava/util/Arrays;->fill([II)V

    .line 254
    .line 255
    .line 256
    move v5, v9

    .line 257
    move v10, v5

    .line 258
    :goto_6
    if-ge v5, v0, :cond_10

    .line 259
    .line 260
    mul-int/lit8 v11, v5, 0x2

    .line 261
    .line 262
    add-int v11, v11, p3

    .line 263
    .line 264
    mul-int/lit8 v12, v10, 0x2

    .line 265
    .line 266
    add-int v12, v12, p3

    .line 267
    .line 268
    aget-object v13, p0, v11

    .line 269
    .line 270
    invoke-static {v13}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 271
    .line 272
    .line 273
    xor-int/2addr v11, v3

    .line 274
    aget-object v11, p0, v11

    .line 275
    .line 276
    invoke-static {v11}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 277
    .line 278
    .line 279
    invoke-static {v13, v11}, Ll/se5;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 280
    .line 281
    .line 282
    invoke-virtual {v13}, Ljava/lang/Object;->hashCode()I

    .line 283
    .line 284
    .line 285
    move-result v14

    .line 286
    invoke-static {v14}, Ll/bzk;->c(I)I

    .line 287
    .line 288
    .line 289
    move-result v14

    .line 290
    :goto_7
    and-int/2addr v14, v4

    .line 291
    aget v15, v1, v14

    .line 292
    .line 293
    if-ne v15, v7, :cond_e

    .line 294
    .line 295
    aput v12, v1, v14

    .line 296
    .line 297
    if-ge v10, v5, :cond_d

    .line 298
    .line 299
    aput-object v13, p0, v12

    .line 300
    .line 301
    xor-int/lit8 v12, v12, 0x1

    .line 302
    .line 303
    aput-object v11, p0, v12

    .line 304
    .line 305
    :cond_d
    add-int/lit8 v10, v10, 0x1

    .line 306
    .line 307
    move/from16 v16, v3

    .line 308
    .line 309
    goto :goto_8

    .line 310
    :cond_e
    move/from16 v16, v3

    .line 311
    .line 312
    aget-object v3, p0, v15

    .line 313
    .line 314
    invoke-virtual {v13, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 315
    .line 316
    .line 317
    move-result v3

    .line 318
    if-eqz v3, :cond_f

    .line 319
    .line 320
    new-instance v2, Lcom/google/common/collect/ImmutableMap$b$a;

    .line 321
    .line 322
    xor-int/lit8 v3, v15, 0x1

    .line 323
    .line 324
    aget-object v12, p0, v3

    .line 325
    .line 326
    invoke-static {v12}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 327
    .line 328
    .line 329
    invoke-direct {v2, v13, v11, v12}, Lcom/google/common/collect/ImmutableMap$b$a;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 330
    .line 331
    .line 332
    aput-object v11, p0, v3

    .line 333
    .line 334
    :goto_8
    add-int/lit8 v5, v5, 0x1

    .line 335
    .line 336
    move/from16 v3, v16

    .line 337
    .line 338
    goto :goto_6

    .line 339
    :cond_f
    add-int/lit8 v14, v14, 0x1

    .line 340
    .line 341
    move/from16 v3, v16

    .line 342
    .line 343
    goto :goto_7

    .line 344
    :cond_10
    move/from16 v16, v3

    .line 345
    .line 346
    if-ne v10, v0, :cond_11

    .line 347
    .line 348
    return-object v1

    .line 349
    :cond_11
    new-array v0, v6, [Ljava/lang/Object;

    .line 350
    .line 351
    aput-object v1, v0, v9

    .line 352
    .line 353
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 354
    .line 355
    .line 356
    move-result-object v1

    .line 357
    aput-object v1, v0, v16

    .line 358
    .line 359
    aput-object v2, v0, v8

    .line 360
    .line 361
    return-object v0
.end method

.method public static createHashTableOrThrow([Ljava/lang/Object;III)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Lcom/google/common/collect/RegularImmutableMap;->createHashTable([Ljava/lang/Object;III)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of p1, p0, [Ljava/lang/Object;

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    check-cast p0, [Ljava/lang/Object;

    .line 11
    .line 12
    const/4 p1, 0x2

    .line 13
    aget-object p0, p0, p1

    .line 14
    .line 15
    check-cast p0, Lcom/google/common/collect/ImmutableMap$b$a;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/google/common/collect/ImmutableMap$b$a;->a()Ljava/lang/IllegalArgumentException;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    throw p0
.end method

.method public static get(Ljava/lang/Object;[Ljava/lang/Object;IILjava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p4, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    const/4 v1, 0x1

    .line 6
    if-ne p2, v1, :cond_2

    .line 7
    .line 8
    aget-object p0, p1, p3

    .line 9
    .line 10
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    xor-int/lit8 p0, p3, 0x1

    .line 20
    .line 21
    aget-object p0, p1, p0

    .line 22
    .line 23
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_1
    return-object v0

    .line 28
    :cond_2
    if-nez p0, :cond_3

    .line 29
    .line 30
    return-object v0

    .line 31
    :cond_3
    instance-of p2, p0, [B

    .line 32
    .line 33
    if-eqz p2, :cond_6

    .line 34
    .line 35
    move-object p2, p0

    .line 36
    check-cast p2, [B

    .line 37
    .line 38
    array-length p0, p2

    .line 39
    add-int/lit8 p3, p0, -0x1

    .line 40
    .line 41
    invoke-virtual {p4}, Ljava/lang/Object;->hashCode()I

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    invoke-static {p0}, Ll/bzk;->c(I)I

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    :goto_0
    and-int/2addr p0, p3

    .line 50
    aget-byte v2, p2, p0

    .line 51
    .line 52
    const/16 v3, 0xff

    .line 53
    .line 54
    and-int/2addr v2, v3

    .line 55
    if-ne v2, v3, :cond_4

    .line 56
    .line 57
    return-object v0

    .line 58
    :cond_4
    aget-object v3, p1, v2

    .line 59
    .line 60
    invoke-virtual {p4, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result v3

    .line 64
    if-eqz v3, :cond_5

    .line 65
    .line 66
    xor-int/lit8 p0, v2, 0x1

    .line 67
    .line 68
    aget-object p0, p1, p0

    .line 69
    .line 70
    return-object p0

    .line 71
    :cond_5
    add-int/lit8 p0, p0, 0x1

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_6
    instance-of p2, p0, [S

    .line 75
    .line 76
    if-eqz p2, :cond_9

    .line 77
    .line 78
    move-object p2, p0

    .line 79
    check-cast p2, [S

    .line 80
    .line 81
    array-length p0, p2

    .line 82
    add-int/lit8 p3, p0, -0x1

    .line 83
    .line 84
    invoke-virtual {p4}, Ljava/lang/Object;->hashCode()I

    .line 85
    .line 86
    .line 87
    move-result p0

    .line 88
    invoke-static {p0}, Ll/bzk;->c(I)I

    .line 89
    .line 90
    .line 91
    move-result p0

    .line 92
    :goto_1
    and-int/2addr p0, p3

    .line 93
    aget-short v2, p2, p0

    .line 94
    .line 95
    const v3, 0xffff

    .line 96
    .line 97
    .line 98
    and-int/2addr v2, v3

    .line 99
    if-ne v2, v3, :cond_7

    .line 100
    .line 101
    return-object v0

    .line 102
    :cond_7
    aget-object v3, p1, v2

    .line 103
    .line 104
    invoke-virtual {p4, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    move-result v3

    .line 108
    if-eqz v3, :cond_8

    .line 109
    .line 110
    xor-int/lit8 p0, v2, 0x1

    .line 111
    .line 112
    aget-object p0, p1, p0

    .line 113
    .line 114
    return-object p0

    .line 115
    :cond_8
    add-int/lit8 p0, p0, 0x1

    .line 116
    .line 117
    goto :goto_1

    .line 118
    :cond_9
    check-cast p0, [I

    .line 119
    .line 120
    array-length p2, p0

    .line 121
    sub-int/2addr p2, v1

    .line 122
    invoke-virtual {p4}, Ljava/lang/Object;->hashCode()I

    .line 123
    .line 124
    .line 125
    move-result p3

    .line 126
    invoke-static {p3}, Ll/bzk;->c(I)I

    .line 127
    .line 128
    .line 129
    move-result p3

    .line 130
    :goto_2
    and-int/2addr p3, p2

    .line 131
    aget v2, p0, p3

    .line 132
    .line 133
    const/4 v3, -0x1

    .line 134
    if-ne v2, v3, :cond_a

    .line 135
    .line 136
    return-object v0

    .line 137
    :cond_a
    aget-object v3, p1, v2

    .line 138
    .line 139
    invoke-virtual {p4, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    move-result v3

    .line 143
    if-eqz v3, :cond_b

    .line 144
    .line 145
    xor-int/lit8 p0, v2, 0x1

    .line 146
    .line 147
    aget-object p0, p1, p0

    .line 148
    .line 149
    return-object p0

    .line 150
    :cond_b
    add-int/lit8 p3, p3, 0x1

    .line 151
    .line 152
    goto :goto_2
.end method


# virtual methods
.method public createEntrySet()Lcom/google/common/collect/ImmutableSet;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableSet<",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/google/common/collect/RegularImmutableMap$EntrySet;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/google/common/collect/RegularImmutableMap;->alternatingKeysAndValues:[Ljava/lang/Object;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    iget v3, p0, Lcom/google/common/collect/RegularImmutableMap;->size:I

    .line 7
    .line 8
    invoke-direct {v0, p0, v1, v2, v3}, Lcom/google/common/collect/RegularImmutableMap$EntrySet;-><init>(Lcom/google/common/collect/ImmutableMap;[Ljava/lang/Object;II)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public createKeySet()Lcom/google/common/collect/ImmutableSet;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableSet<",
            "TK;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/google/common/collect/RegularImmutableMap$KeysOrValuesAsList;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/google/common/collect/RegularImmutableMap;->alternatingKeysAndValues:[Ljava/lang/Object;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    iget v3, p0, Lcom/google/common/collect/RegularImmutableMap;->size:I

    .line 7
    .line 8
    invoke-direct {v0, v1, v2, v3}, Lcom/google/common/collect/RegularImmutableMap$KeysOrValuesAsList;-><init>([Ljava/lang/Object;II)V

    .line 9
    .line 10
    .line 11
    new-instance v1, Lcom/google/common/collect/RegularImmutableMap$KeySet;

    .line 12
    .line 13
    invoke-direct {v1, p0, v0}, Lcom/google/common/collect/RegularImmutableMap$KeySet;-><init>(Lcom/google/common/collect/ImmutableMap;Lcom/google/common/collect/ImmutableList;)V

    .line 14
    .line 15
    .line 16
    return-object v1
.end method

.method public createValues()Lcom/google/common/collect/ImmutableCollection;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableCollection<",
            "TV;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/google/common/collect/RegularImmutableMap$KeysOrValuesAsList;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/google/common/collect/RegularImmutableMap;->alternatingKeysAndValues:[Ljava/lang/Object;

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    iget p0, p0, Lcom/google/common/collect/RegularImmutableMap;->size:I

    .line 7
    .line 8
    invoke-direct {v0, v1, v2, p0}, Lcom/google/common/collect/RegularImmutableMap$KeysOrValuesAsList;-><init>([Ljava/lang/Object;II)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .line 153
    iget-object v0, p0, Lcom/google/common/collect/RegularImmutableMap;->hashTable:Ljava/lang/Object;

    iget-object v1, p0, Lcom/google/common/collect/RegularImmutableMap;->alternatingKeysAndValues:[Ljava/lang/Object;

    iget p0, p0, Lcom/google/common/collect/RegularImmutableMap;->size:I

    const/4 v2, 0x0

    invoke-static {v0, v1, p0, v2, p1}, Lcom/google/common/collect/RegularImmutableMap;->get(Ljava/lang/Object;[Ljava/lang/Object;IILjava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    :cond_0
    return-object p0
.end method

.method public isPartialView()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public size()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/common/collect/RegularImmutableMap;->size:I

    .line 2
    .line 3
    return p0
.end method
