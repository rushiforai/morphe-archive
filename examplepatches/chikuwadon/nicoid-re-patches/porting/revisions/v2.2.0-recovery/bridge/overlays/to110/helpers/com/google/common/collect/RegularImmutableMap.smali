.class final Lcom/google/common/collect/RegularImmutableMap;
.super Lcom/google/common/collect/ImmutableMap;
.source "RegularImmutableMap.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/collect/RegularImmutableMap$EntrySet;,
        Lcom/google/common/collect/RegularImmutableMap$KeysOrValuesAsList;,
        Lcom/google/common/collect/RegularImmutableMap$KeySet;
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
    .registers 4

    .line 50
    new-instance v0, Lcom/google/common/collect/RegularImmutableMap;

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-direct {v0, v3, v2, v1}, Lcom/google/common/collect/RegularImmutableMap;-><init>(Ljava/lang/Object;[Ljava/lang/Object;I)V

    sput-object v0, Lcom/google/common/collect/RegularImmutableMap;->EMPTY:Lcom/google/common/collect/ImmutableMap;

    return-void
.end method

.method private constructor <init>(Ljava/lang/Object;[Ljava/lang/Object;I)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "hashTable",
            "alternatingKeysAndValues",
            "size"
        }
    .end annotation

    .line 294
    invoke-direct {p0}, Lcom/google/common/collect/ImmutableMap;-><init>()V

    .line 295
    iput-object p1, p0, Lcom/google/common/collect/RegularImmutableMap;->hashTable:Ljava/lang/Object;

    .line 296
    iput-object p2, p0, Lcom/google/common/collect/RegularImmutableMap;->alternatingKeysAndValues:[Ljava/lang/Object;

    .line 297
    iput p3, p0, Lcom/google/common/collect/RegularImmutableMap;->size:I

    return-void
.end method

.method static create(I[Ljava/lang/Object;)Lcom/google/common/collect/RegularImmutableMap;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "n",
            "alternatingKeysAndValues"
        }
    .end annotation

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

    .line 92
    invoke-static {p0, p1, v0}, Lcom/google/common/collect/RegularImmutableMap;->create(I[Ljava/lang/Object;Lcom/google/common/collect/ImmutableMap$Builder;)Lcom/google/common/collect/RegularImmutableMap;

    move-result-object p0

    return-object p0
.end method

.method static create(I[Ljava/lang/Object;Lcom/google/common/collect/ImmutableMap$Builder;)Lcom/google/common/collect/RegularImmutableMap;
    .registers 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "n",
            "alternatingKeysAndValues",
            "builder"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(I[",
            "Ljava/lang/Object;",
            "Lcom/google/common/collect/ImmutableMap$Builder<",
            "TK;TV;>;)",
            "Lcom/google/common/collect/RegularImmutableMap<",
            "TK;TV;>;"
        }
    .end annotation

    if-nez p0, :cond_0

    .line 104
    sget-object p0, Lcom/google/common/collect/RegularImmutableMap;->EMPTY:Lcom/google/common/collect/ImmutableMap;

    check-cast p0, Lcom/google/common/collect/RegularImmutableMap;

    return-object p0

    :cond_0
    const/4 v0, 0x0

    const/4 v1, 0x1

    if-ne p0, v1, :cond_1

    .line 108
    aget-object p0, p1, v0

    .line 109
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    aget-object p2, p1, v1

    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    .line 108
    invoke-static {p0, p2}, Lcom/google/common/collect/CollectPreconditions;->checkEntryNotNull(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 110
    new-instance p0, Lcom/google/common/collect/RegularImmutableMap;

    const/4 p2, 0x0

    invoke-direct {p0, p2, p1, v1}, Lcom/google/common/collect/RegularImmutableMap;-><init>(Ljava/lang/Object;[Ljava/lang/Object;I)V

    return-object p0

    .line 112
    :cond_1
    array-length v2, p1

    shr-int/2addr v2, v1

    invoke-static {p0, v2}, Lcom/google/common/base/Preconditions;->checkPositionIndex(II)I

    .line 113
    invoke-static {p0}, Lcom/google/common/collect/ImmutableSet;->chooseTableSize(I)I

    move-result v2

    .line 119
    invoke-static {p1, p0, v2, v0}, Lcom/google/common/collect/RegularImmutableMap;->createHashTable([Ljava/lang/Object;III)Ljava/lang/Object;

    move-result-object v2

    .line 121
    instance-of v3, v2, [Ljava/lang/Object;

    if-eqz v3, :cond_3

    .line 122
    check-cast v2, [Ljava/lang/Object;

    const/4 p0, 0x2

    .line 123
    aget-object p0, v2, p0

    check-cast p0, Lcom/google/common/collect/ImmutableMap$Builder$DuplicateKey;

    if-eqz p2, :cond_2

    .line 127
    iput-object p0, p2, Lcom/google/common/collect/ImmutableMap$Builder;->duplicateKey:Lcom/google/common/collect/ImmutableMap$Builder$DuplicateKey;

    .line 128
    aget-object p0, v2, v0

    .line 129
    aget-object p2, v2, v1

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    shl-int/lit8 v0, p2, 0x1

    .line 130
    invoke-static {p1, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p1

    move-object v2, p0

    move p0, p2

    goto :goto_0

    .line 125
    :cond_2
    invoke-virtual {p0}, Lcom/google/common/collect/ImmutableMap$Builder$DuplicateKey;->exception()Ljava/lang/IllegalArgumentException;

    move-result-object p0

    throw p0

    .line 134
    :cond_3
    :goto_0
    new-instance p2, Lcom/google/common/collect/RegularImmutableMap;

    invoke-direct {p2, v2, p1, p0}, Lcom/google/common/collect/RegularImmutableMap;-><init>(Ljava/lang/Object;[Ljava/lang/Object;I)V

    return-object p2
.end method

.method private static createHashTable([Ljava/lang/Object;III)Ljava/lang/Object;
    .registers 21
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "alternatingKeysAndValues",
            "n",
            "tableSize",
            "keyOffset"
        }
    .end annotation

    move/from16 v0, p1

    move/from16 v1, p2

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ne v0, v3, :cond_0

    .line 155
    aget-object v0, p0, p3

    .line 156
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    xor-int/lit8 v1, p3, 0x1

    aget-object v1, p0, v1

    .line 157
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 155
    invoke-static {v0, v1}, Lcom/google/common/collect/CollectPreconditions;->checkEntryNotNull(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v2

    :cond_0
    add-int/lit8 v4, v1, -0x1

    const/16 v5, 0x80

    const/4 v6, 0x2

    const/4 v7, 0x3

    const/4 v8, -0x1

    const/4 v9, 0x0

    if-gt v1, v5, :cond_6

    .line 169
    new-array v1, v1, [B

    .line 170
    invoke-static {v1, v8}, Ljava/util/Arrays;->fill([BB)V

    move v5, v9

    move v8, v5

    :goto_0
    if-ge v5, v0, :cond_4

    shl-int/lit8 v10, v5, 0x1

    add-int v10, v10, p3

    shl-int/lit8 v11, v8, 0x1

    add-int v11, v11, p3

    .line 178
    aget-object v12, p0, v10

    invoke-static {v12}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    xor-int/2addr v10, v3

    .line 179
    aget-object v10, p0, v10

    invoke-static {v10}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    .line 180
    invoke-static {v12, v10}, Lcom/google/common/collect/CollectPreconditions;->checkEntryNotNull(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 181
    invoke-virtual {v12}, Ljava/lang/Object;->hashCode()I

    move-result v13

    invoke-static {v13}, Lcom/google/common/collect/Hashing;->smear(I)I

    move-result v13

    :goto_1
    and-int/2addr v13, v4

    .line 183
    aget-byte v14, v1, v13

    const/16 v15, 0xff

    and-int/2addr v14, v15

    if-ne v14, v15, :cond_2

    int-to-byte v14, v11

    .line 185
    aput-byte v14, v1, v13

    if-ge v8, v5, :cond_1

    .line 196
    aput-object v12, p0, v11

    xor-int/lit8 v11, v11, 0x1

    .line 197
    aput-object v10, p0, v11

    :cond_1
    add-int/lit8 v8, v8, 0x1

    goto :goto_2

    .line 187
    :cond_2
    aget-object v15, p0, v14

    invoke-virtual {v12, v15}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_3

    .line 188
    new-instance v2, Lcom/google/common/collect/ImmutableMap$Builder$DuplicateKey;

    xor-int/lit8 v14, v14, 0x1

    aget-object v11, p0, v14

    .line 190
    invoke-static {v11}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    invoke-direct {v2, v12, v10, v11}, Lcom/google/common/collect/ImmutableMap$Builder$DuplicateKey;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 191
    aput-object v10, p0, v14

    :goto_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_3
    add-int/lit8 v13, v13, 0x1

    goto :goto_1

    :cond_4
    if-ne v8, v0, :cond_5

    return-object v1

    .line 201
    :cond_5
    new-array v0, v7, [Ljava/lang/Object;

    aput-object v1, v0, v9

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v3

    aput-object v2, v0, v6

    return-object v0

    :cond_6
    const v5, 0x8000

    if-gt v1, v5, :cond_c

    .line 209
    new-array v1, v1, [S

    .line 210
    invoke-static {v1, v8}, Ljava/util/Arrays;->fill([SS)V

    move v5, v9

    move v8, v5

    :goto_3
    if-ge v5, v0, :cond_a

    shl-int/lit8 v10, v5, 0x1

    add-int v10, v10, p3

    shl-int/lit8 v11, v8, 0x1

    add-int v11, v11, p3

    .line 218
    aget-object v12, p0, v10

    invoke-static {v12}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    xor-int/2addr v10, v3

    .line 219
    aget-object v10, p0, v10

    invoke-static {v10}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    .line 220
    invoke-static {v12, v10}, Lcom/google/common/collect/CollectPreconditions;->checkEntryNotNull(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 221
    invoke-virtual {v12}, Ljava/lang/Object;->hashCode()I

    move-result v13

    invoke-static {v13}, Lcom/google/common/collect/Hashing;->smear(I)I

    move-result v13

    :goto_4
    and-int/2addr v13, v4

    .line 223
    aget-short v14, v1, v13

    const v15, 0xffff

    and-int/2addr v14, v15

    if-ne v14, v15, :cond_8

    int-to-short v14, v11

    .line 225
    aput-short v14, v1, v13

    if-ge v8, v5, :cond_7

    .line 236
    aput-object v12, p0, v11

    xor-int/lit8 v11, v11, 0x1

    .line 237
    aput-object v10, p0, v11

    :cond_7
    add-int/lit8 v8, v8, 0x1

    goto :goto_5

    .line 227
    :cond_8
    aget-object v15, p0, v14

    invoke-virtual {v12, v15}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_9

    .line 228
    new-instance v2, Lcom/google/common/collect/ImmutableMap$Builder$DuplicateKey;

    xor-int/lit8 v14, v14, 0x1

    aget-object v11, p0, v14

    .line 230
    invoke-static {v11}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    invoke-direct {v2, v12, v10, v11}, Lcom/google/common/collect/ImmutableMap$Builder$DuplicateKey;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 231
    aput-object v10, p0, v14

    :goto_5
    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    :cond_9
    add-int/lit8 v13, v13, 0x1

    goto :goto_4

    :cond_a
    if-ne v8, v0, :cond_b

    return-object v1

    .line 241
    :cond_b
    new-array v0, v7, [Ljava/lang/Object;

    aput-object v1, v0, v9

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v3

    aput-object v2, v0, v6

    return-object v0

    .line 246
    :cond_c
    new-array v1, v1, [I

    .line 247
    invoke-static {v1, v8}, Ljava/util/Arrays;->fill([II)V

    move v5, v9

    move v10, v5

    :goto_6
    if-ge v5, v0, :cond_10

    shl-int/lit8 v11, v5, 0x1

    add-int v11, v11, p3

    shl-int/lit8 v12, v10, 0x1

    add-int v12, v12, p3

    .line 255
    aget-object v13, p0, v11

    invoke-static {v13}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    xor-int/2addr v11, v3

    .line 256
    aget-object v11, p0, v11

    invoke-static {v11}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    .line 257
    invoke-static {v13, v11}, Lcom/google/common/collect/CollectPreconditions;->checkEntryNotNull(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 258
    invoke-virtual {v13}, Ljava/lang/Object;->hashCode()I

    move-result v14

    invoke-static {v14}, Lcom/google/common/collect/Hashing;->smear(I)I

    move-result v14

    :goto_7
    and-int/2addr v14, v4

    .line 260
    aget v15, v1, v14

    if-ne v15, v8, :cond_e

    .line 262
    aput v12, v1, v14

    if-ge v10, v5, :cond_d

    .line 273
    aput-object v13, p0, v12

    xor-int/lit8 v12, v12, 0x1

    .line 274
    aput-object v11, p0, v12

    :cond_d
    add-int/lit8 v10, v10, 0x1

    move/from16 v16, v3

    goto :goto_8

    :cond_e
    move/from16 v16, v3

    .line 264
    aget-object v3, p0, v15

    invoke-virtual {v13, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_f

    .line 265
    new-instance v2, Lcom/google/common/collect/ImmutableMap$Builder$DuplicateKey;

    xor-int/lit8 v15, v15, 0x1

    aget-object v3, p0, v15

    .line 267
    invoke-static {v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-direct {v2, v13, v11, v3}, Lcom/google/common/collect/ImmutableMap$Builder$DuplicateKey;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 268
    aput-object v11, p0, v15

    :goto_8
    add-int/lit8 v5, v5, 0x1

    move/from16 v3, v16

    goto :goto_6

    :cond_f
    add-int/lit8 v14, v14, 0x1

    move/from16 v3, v16

    goto :goto_7

    :cond_10
    move/from16 v16, v3

    if-ne v10, v0, :cond_11

    return-object v1

    .line 278
    :cond_11
    new-array v0, v7, [Ljava/lang/Object;

    aput-object v1, v0, v9

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v16

    aput-object v2, v0, v6

    return-object v0
.end method

.method static createHashTableOrThrow([Ljava/lang/Object;III)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "alternatingKeysAndValues",
            "n",
            "tableSize",
            "keyOffset"
        }
    .end annotation

    .line 284
    invoke-static {p0, p1, p2, p3}, Lcom/google/common/collect/RegularImmutableMap;->createHashTable([Ljava/lang/Object;III)Ljava/lang/Object;

    move-result-object p0

    .line 285
    instance-of p1, p0, [Ljava/lang/Object;

    if-nez p1, :cond_0

    return-object p0

    .line 286
    :cond_0
    check-cast p0, [Ljava/lang/Object;

    const/4 p1, 0x2

    .line 287
    aget-object p0, p0, p1

    check-cast p0, Lcom/google/common/collect/ImmutableMap$Builder$DuplicateKey;

    .line 288
    invoke-virtual {p0}, Lcom/google/common/collect/ImmutableMap$Builder$DuplicateKey;->exception()Ljava/lang/IllegalArgumentException;

    move-result-object p0

    throw p0
.end method

.method static get(Ljava/lang/Object;[Ljava/lang/Object;IILjava/lang/Object;)Ljava/lang/Object;
    .registers 9
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "hashTableObject",
            "alternatingKeysAndValues",
            "size",
            "keyOffset",
            "key"
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p4, :cond_0

    return-object v0

    :cond_0
    const/4 v1, 0x1

    if-ne p2, v1, :cond_2

    .line 330
    aget-object p0, p1, p3

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p0, p4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    xor-int/2addr p3, v1

    .line 331
    aget-object p0, p1, p3

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :cond_1
    return-object v0

    :cond_2
    if-nez p0, :cond_3

    return-object v0

    .line 336
    :cond_3
    instance-of p2, p0, [B

    if-eqz p2, :cond_6

    .line 337
    move-object p2, p0

    check-cast p2, [B

    .line 338
    array-length p0, p2

    add-int/lit8 p3, p0, -0x1

    .line 339
    invoke-virtual {p4}, Ljava/lang/Object;->hashCode()I

    move-result p0

    invoke-static {p0}, Lcom/google/common/collect/Hashing;->smear(I)I

    move-result p0

    :goto_0
    and-int/2addr p0, p3

    .line 341
    aget-byte v2, p2, p0

    const/16 v3, 0xff

    and-int/2addr v2, v3

    if-ne v2, v3, :cond_4

    return-object v0

    .line 344
    :cond_4
    aget-object v3, p1, v2

    invoke-virtual {p4, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    xor-int/2addr v2, v1

    .line 345
    aget-object p0, p1, v2

    return-object p0

    :cond_5
    add-int/lit8 p0, p0, 0x1

    goto :goto_0

    .line 348
    :cond_6
    instance-of p2, p0, [S

    if-eqz p2, :cond_9

    .line 349
    move-object p2, p0

    check-cast p2, [S

    .line 350
    array-length p0, p2

    add-int/lit8 p3, p0, -0x1

    .line 351
    invoke-virtual {p4}, Ljava/lang/Object;->hashCode()I

    move-result p0

    invoke-static {p0}, Lcom/google/common/collect/Hashing;->smear(I)I

    move-result p0

    :goto_1
    and-int/2addr p0, p3

    .line 353
    aget-short v2, p2, p0

    const v3, 0xffff

    and-int/2addr v2, v3

    if-ne v2, v3, :cond_7

    return-object v0

    .line 356
    :cond_7
    aget-object v3, p1, v2

    invoke-virtual {p4, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_8

    xor-int/2addr v2, v1

    .line 357
    aget-object p0, p1, v2

    return-object p0

    :cond_8
    add-int/lit8 p0, p0, 0x1

    goto :goto_1

    .line 361
    :cond_9
    check-cast p0, [I

    .line 362
    array-length p2, p0

    sub-int/2addr p2, v1

    .line 363
    invoke-virtual {p4}, Ljava/lang/Object;->hashCode()I

    move-result p3

    invoke-static {p3}, Lcom/google/common/collect/Hashing;->smear(I)I

    move-result p3

    :goto_2
    and-int/2addr p3, p2

    .line 365
    aget v2, p0, p3

    const/4 v3, -0x1

    if-ne v2, v3, :cond_a

    return-object v0

    .line 368
    :cond_a
    aget-object v3, p1, v2

    invoke-virtual {p4, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    xor-int/2addr v2, v1

    .line 369
    aget-object p0, p1, v2

    return-object p0

    :cond_b
    add-int/lit8 p3, p3, 0x1

    goto :goto_2
.end method


# virtual methods
.method public entrySet()Lcom/google/common/collect/ImmutableSet;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableSet<",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;>;"
        }
    .end annotation

    .line 377
    new-instance v0, Lcom/google/common/collect/RegularImmutableMap$EntrySet;

    iget-object v1, p0, Lcom/google/common/collect/RegularImmutableMap;->alternatingKeysAndValues:[Ljava/lang/Object;

    const/4 v2, 0x0

    iget v3, p0, Lcom/google/common/collect/RegularImmutableMap;->size:I

    invoke-direct {v0, p0, v1, v2, v3}, Lcom/google/common/collect/RegularImmutableMap$EntrySet;-><init>(Lcom/google/common/collect/ImmutableMap;[Ljava/lang/Object;II)V

    return-object v0
.end method

.method public bridge synthetic entrySet()Ljava/util/Set;
    .registers 1

    .line 38
    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableMap;->entrySet()Lcom/google/common/collect/ImmutableSet;

    move-result-object p0

    return-object p0
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "key"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .line 308
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

.method isPartialView()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public keySet()Lcom/google/common/collect/ImmutableSet;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableSet<",
            "TK;>;"
        }
    .end annotation

    .line 478
    new-instance v0, Lcom/google/common/collect/RegularImmutableMap$KeysOrValuesAsList;

    iget-object v1, p0, Lcom/google/common/collect/RegularImmutableMap;->alternatingKeysAndValues:[Ljava/lang/Object;

    const/4 v2, 0x0

    iget v3, p0, Lcom/google/common/collect/RegularImmutableMap;->size:I

    invoke-direct {v0, v1, v2, v3}, Lcom/google/common/collect/RegularImmutableMap$KeysOrValuesAsList;-><init>([Ljava/lang/Object;II)V

    .line 480
    new-instance v1, Lcom/google/common/collect/RegularImmutableMap$KeySet;

    invoke-direct {v1, p0, v0}, Lcom/google/common/collect/RegularImmutableMap$KeySet;-><init>(Lcom/google/common/collect/ImmutableMap;Lcom/google/common/collect/ImmutableList;)V

    return-object v1
.end method

.method public bridge synthetic keySet()Ljava/util/Set;
    .registers 1

    .line 38
    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableMap;->keySet()Lcom/google/common/collect/ImmutableSet;

    move-result-object p0

    return-object p0
.end method

.method public size()I
    .registers 1

    .line 302
    iget p0, p0, Lcom/google/common/collect/RegularImmutableMap;->size:I

    return p0
.end method

.method public values()Lcom/google/common/collect/ImmutableCollection;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableCollection<",
            "TV;>;"
        }
    .end annotation

    .line 585
    new-instance v0, Lcom/google/common/collect/RegularImmutableMap$KeysOrValuesAsList;

    iget-object v1, p0, Lcom/google/common/collect/RegularImmutableMap;->alternatingKeysAndValues:[Ljava/lang/Object;

    const/4 v2, 0x1

    iget p0, p0, Lcom/google/common/collect/RegularImmutableMap;->size:I

    invoke-direct {v0, v1, v2, p0}, Lcom/google/common/collect/RegularImmutableMap$KeysOrValuesAsList;-><init>([Ljava/lang/Object;II)V

    return-object v0
.end method

.method public bridge synthetic values()Ljava/util/Collection;
    .registers 1

    .line 38
    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableMap;->values()Lcom/google/common/collect/ImmutableCollection;

    move-result-object p0

    return-object p0
.end method

.method writeReplace()Ljava/lang/Object;
    .registers 1

    .line 599
    invoke-super {p0}, Lcom/google/common/collect/ImmutableMap;->writeReplace()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
