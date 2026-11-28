.class final Lcom/google/common/hash/FarmHashFingerprint64;
.super Lcom/google/common/hash/AbstractNonStreamingHashFunction;
.source "FarmHashFingerprint64.java"


# static fields
.field static final FARMHASH_FINGERPRINT_64:Lcom/google/common/hash/HashFunction;

.field private static final K0:J = -0x3c5a37a36834ced9L

.field private static final K1:J = -0x4b6d499041670d8dL

.field private static final K2:J = -0x651e95c4d06fbfb1L


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 42
    new-instance v0, Lcom/google/common/hash/FarmHashFingerprint64;

    invoke-direct {v0}, Lcom/google/common/hash/FarmHashFingerprint64;-><init>()V

    sput-object v0, Lcom/google/common/hash/FarmHashFingerprint64;->FARMHASH_FINGERPRINT_64:Lcom/google/common/hash/HashFunction;

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .line 41
    invoke-direct {p0}, Lcom/google/common/hash/AbstractNonStreamingHashFunction;-><init>()V

    return-void
.end method

.method static fingerprint([BII)J
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "bytes",
            "offset",
            "length"
        }
    .end annotation

    const/16 v0, 0x20

    if-gt p2, v0, :cond_1

    const/16 v0, 0x10

    if-gt p2, v0, :cond_0

    .line 71
    invoke-static {p0, p1, p2}, Lcom/google/common/hash/FarmHashFingerprint64;->hashLength0to16([BII)J

    move-result-wide p0

    return-wide p0

    .line 73
    :cond_0
    invoke-static {p0, p1, p2}, Lcom/google/common/hash/FarmHashFingerprint64;->hashLength17to32([BII)J

    move-result-wide p0

    return-wide p0

    :cond_1
    const/16 v0, 0x40

    if-gt p2, v0, :cond_2

    .line 76
    invoke-static {p0, p1, p2}, Lcom/google/common/hash/FarmHashFingerprint64;->hashLength33To64([BII)J

    move-result-wide p0

    return-wide p0

    .line 78
    :cond_2
    invoke-static {p0, p1, p2}, Lcom/google/common/hash/FarmHashFingerprint64;->hashLength65Plus([BII)J

    move-result-wide p0

    return-wide p0
.end method

.method private static hashLength0to16([BII)J
    .registers 15
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "bytes",
            "offset",
            "length"
        }
    .end annotation

    const-wide v0, -0x651e95c4d06fbfb1L    # -3.35749372464804E-179

    const/16 v2, 0x8

    if-lt p2, v2, :cond_0

    int-to-long v3, p2

    const/4 v5, 0x1

    shl-long/2addr v3, v5

    add-long v9, v3, v0

    .line 120
    invoke-static {p0, p1}, Lcom/google/common/hash/LittleEndianByteArray;->load64([BI)J

    move-result-wide v3

    add-long/2addr v3, v0

    add-int/2addr p1, p2

    sub-int/2addr p1, v2

    .line 121
    invoke-static {p0, p1}, Lcom/google/common/hash/LittleEndianByteArray;->load64([BI)J

    move-result-wide p0

    const/16 p2, 0x25

    .line 122
    invoke-static {p0, p1, p2}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v0

    mul-long/2addr v0, v9

    add-long v5, v0, v3

    const/16 p2, 0x19

    .line 123
    invoke-static {v3, v4, p2}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v0

    add-long/2addr v0, p0

    mul-long v7, v0, v9

    .line 124
    invoke-static/range {v5 .. v10}, Lcom/google/common/hash/FarmHashFingerprint64;->hashLength16(JJJ)J

    move-result-wide p0

    return-wide p0

    :cond_0
    const/4 v3, 0x4

    if-lt p2, v3, :cond_1

    shl-int/lit8 v2, p2, 0x1

    int-to-long v4, v2

    add-long v10, v4, v0

    .line 128
    invoke-static {p0, p1}, Lcom/google/common/hash/LittleEndianByteArray;->load32([BI)I

    move-result v0

    int-to-long v0, v0

    const-wide v4, 0xffffffffL

    and-long/2addr v0, v4

    int-to-long v6, p2

    const/4 v2, 0x3

    shl-long/2addr v0, v2

    add-long/2addr v6, v0

    add-int/2addr p1, p2

    sub-int/2addr p1, v3

    .line 129
    invoke-static {p0, p1}, Lcom/google/common/hash/LittleEndianByteArray;->load32([BI)I

    move-result p0

    int-to-long p0, p0

    and-long v8, p0, v4

    invoke-static/range {v6 .. v11}, Lcom/google/common/hash/FarmHashFingerprint64;->hashLength16(JJJ)J

    move-result-wide p0

    return-wide p0

    :cond_1
    if-lez p2, :cond_2

    .line 132
    aget-byte v3, p0, p1

    shr-int/lit8 v4, p2, 0x1

    add-int/2addr v4, p1

    .line 133
    aget-byte v4, p0, v4

    add-int/lit8 v5, p2, -0x1

    add-int/2addr p1, v5

    .line 134
    aget-byte p0, p0, p1

    and-int/lit16 v3, v3, 0xff

    and-int/lit16 v4, v4, 0xff

    shl-int/2addr v4, v2

    add-int/2addr v3, v4

    and-int/lit16 p0, p0, 0xff

    shl-int/lit8 p0, p0, 0x2

    add-int/2addr p2, p0

    int-to-long p0, v3

    mul-long/2addr p0, v0

    int-to-long v2, p2

    const-wide v4, -0x3c5a37a36834ced9L    # -7.848031385787155E17

    mul-long/2addr v2, v4

    xor-long/2addr p0, v2

    .line 137
    invoke-static {p0, p1}, Lcom/google/common/hash/FarmHashFingerprint64;->shiftMix(J)J

    move-result-wide p0

    mul-long/2addr p0, v0

    return-wide p0

    :cond_2
    return-wide v0
.end method

.method private static hashLength16(JJJ)J
    .registers 9
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "u",
            "v",
            "mul"
        }
    .end annotation

    xor-long/2addr p0, p2

    mul-long/2addr p0, p4

    const/16 v0, 0x2f

    ushr-long v1, p0, v0

    xor-long/2addr p0, v1

    xor-long/2addr p2, p0

    mul-long/2addr p2, p4

    ushr-long p0, p2, v0

    xor-long/2addr p2, p0

    mul-long/2addr p2, p4

    return-wide p2
.end method

.method private static hashLength17to32([BII)J
    .registers 19
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "bytes",
            "offset",
            "length"
        }
    .end annotation

    move-object/from16 v0, p0

    move/from16 v1, p2

    int-to-long v2, v1

    const/4 v4, 0x1

    shl-long/2addr v2, v4

    const-wide v4, -0x651e95c4d06fbfb1L    # -3.35749372464804E-179

    add-long v10, v2, v4

    .line 144
    invoke-static/range {p0 .. p1}, Lcom/google/common/hash/LittleEndianByteArray;->load64([BI)J

    move-result-wide v2

    const-wide v6, -0x4b6d499041670d8dL    # -1.9079014105469082E-55

    mul-long/2addr v2, v6

    add-int/lit8 v6, p1, 0x8

    .line 145
    invoke-static {v0, v6}, Lcom/google/common/hash/LittleEndianByteArray;->load64([BI)J

    move-result-wide v6

    add-int v1, p1, v1

    add-int/lit8 v8, v1, -0x8

    .line 146
    invoke-static {v0, v8}, Lcom/google/common/hash/LittleEndianByteArray;->load64([BI)J

    move-result-wide v8

    mul-long/2addr v8, v10

    add-int/lit8 v1, v1, -0x10

    .line 147
    invoke-static {v0, v1}, Lcom/google/common/hash/LittleEndianByteArray;->load64([BI)J

    move-result-wide v0

    mul-long/2addr v0, v4

    add-long v12, v2, v6

    const/16 v14, 0x2b

    .line 149
    invoke-static {v12, v13, v14}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v12

    const/16 v14, 0x1e

    invoke-static {v8, v9, v14}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v14

    add-long/2addr v12, v14

    add-long/2addr v12, v0

    add-long/2addr v6, v4

    const/16 v0, 0x12

    invoke-static {v6, v7, v0}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v0

    add-long/2addr v2, v0

    add-long/2addr v8, v2

    move-wide v6, v12

    .line 148
    invoke-static/range {v6 .. v11}, Lcom/google/common/hash/FarmHashFingerprint64;->hashLength16(JJJ)J

    move-result-wide v0

    return-wide v0
.end method

.method private static hashLength33To64([BII)J
    .registers 23
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "bytes",
            "offset",
            "length"
        }
    .end annotation

    move-object/from16 v0, p0

    move/from16 v1, p2

    int-to-long v2, v1

    const/4 v4, 0x1

    shl-long/2addr v2, v4

    const-wide v4, -0x651e95c4d06fbfb1L    # -3.35749372464804E-179

    add-long v10, v2, v4

    .line 154
    invoke-static/range {p0 .. p1}, Lcom/google/common/hash/LittleEndianByteArray;->load64([BI)J

    move-result-wide v2

    mul-long/2addr v2, v4

    add-int/lit8 v6, p1, 0x8

    .line 155
    invoke-static {v0, v6}, Lcom/google/common/hash/LittleEndianByteArray;->load64([BI)J

    move-result-wide v6

    add-int v1, p1, v1

    add-int/lit8 v8, v1, -0x8

    .line 156
    invoke-static {v0, v8}, Lcom/google/common/hash/LittleEndianByteArray;->load64([BI)J

    move-result-wide v8

    mul-long/2addr v8, v10

    add-int/lit8 v12, v1, -0x10

    .line 157
    invoke-static {v0, v12}, Lcom/google/common/hash/LittleEndianByteArray;->load64([BI)J

    move-result-wide v12

    mul-long/2addr v12, v4

    add-long v14, v2, v6

    move-wide/from16 v16, v4

    const/16 v4, 0x2b

    .line 158
    invoke-static {v14, v15, v4}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v14

    const/16 v5, 0x1e

    invoke-static {v8, v9, v5}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v18

    add-long v14, v14, v18

    add-long/2addr v14, v12

    add-long v6, v6, v16

    const/16 v12, 0x12

    .line 159
    invoke-static {v6, v7, v12}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v6

    add-long/2addr v6, v2

    add-long/2addr v8, v6

    move-wide v6, v14

    invoke-static/range {v6 .. v11}, Lcom/google/common/hash/FarmHashFingerprint64;->hashLength16(JJJ)J

    move-result-wide v8

    add-int/lit8 v13, p1, 0x10

    .line 160
    invoke-static {v0, v13}, Lcom/google/common/hash/LittleEndianByteArray;->load64([BI)J

    move-result-wide v13

    mul-long/2addr v13, v10

    add-int/lit8 v15, p1, 0x18

    .line 161
    invoke-static {v0, v15}, Lcom/google/common/hash/LittleEndianByteArray;->load64([BI)J

    move-result-wide v15

    add-int/lit8 v12, v1, -0x20

    .line 162
    invoke-static {v0, v12}, Lcom/google/common/hash/LittleEndianByteArray;->load64([BI)J

    move-result-wide v17

    add-long v6, v6, v17

    mul-long/2addr v6, v10

    add-int/lit8 v1, v1, -0x18

    .line 163
    invoke-static {v0, v1}, Lcom/google/common/hash/LittleEndianByteArray;->load64([BI)J

    move-result-wide v0

    add-long/2addr v8, v0

    mul-long/2addr v8, v10

    add-long v0, v13, v15

    .line 165
    invoke-static {v0, v1, v4}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v0

    invoke-static {v6, v7, v5}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v4

    add-long/2addr v0, v4

    add-long/2addr v0, v8

    add-long/2addr v2, v15

    const/16 v4, 0x12

    invoke-static {v2, v3, v4}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v2

    add-long/2addr v13, v2

    add-long v8, v13, v6

    move-wide v6, v0

    .line 164
    invoke-static/range {v6 .. v11}, Lcom/google/common/hash/FarmHashFingerprint64;->hashLength16(JJJ)J

    move-result-wide v0

    return-wide v0
.end method

.method private static hashLength65Plus([BII)J
    .registers 33
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "bytes",
            "offset",
            "length"
        }
    .end annotation

    move-object/from16 v0, p0

    const-wide v1, -0x6e6c7825ddf69423L    # -5.27643297140616E-224

    .line 177
    invoke-static {v1, v2}, Lcom/google/common/hash/FarmHashFingerprint64;->shiftMix(J)J

    move-result-wide v1

    const-wide v3, -0x651e95c4d06fbfb1L    # -3.35749372464804E-179

    mul-long/2addr v1, v3

    const/4 v3, 0x2

    .line 178
    new-array v6, v3, [J

    .line 179
    new-array v7, v3, [J

    const-wide v3, 0x1529cba0ca458ffL

    .line 180
    invoke-static/range {p0 .. p1}, Lcom/google/common/hash/LittleEndianByteArray;->load64([BI)J

    move-result-wide v8

    add-long/2addr v3, v8

    const/4 v8, 0x1

    add-int/lit8 v5, p2, -0x1

    .line 183
    div-int/lit8 v9, v5, 0x40

    shl-int/lit8 v9, v9, 0x6

    add-int v9, p1, v9

    and-int/lit8 v10, v5, 0x3f

    add-int v11, v9, v10

    add-int/lit8 v12, v11, -0x3f

    const-wide v13, 0x226bb95b4e64b6d4L    # 7.104748899679321E-143

    move-wide v4, v3

    move-wide v2, v1

    move/from16 v1, p1

    :goto_0
    add-long/2addr v4, v13

    const/4 v15, 0x0

    .line 186
    aget-wide v16, v6, v15

    add-long v4, v4, v16

    move/from16 v16, v8

    add-int/lit8 v8, v1, 0x8

    invoke-static {v0, v8}, Lcom/google/common/hash/LittleEndianByteArray;->load64([BI)J

    move-result-wide v17

    add-long v4, v4, v17

    const/16 v8, 0x25

    invoke-static {v4, v5, v8}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v4

    const-wide v17, -0x4b6d499041670d8dL    # -1.9079014105469082E-55

    mul-long v4, v4, v17

    .line 187
    aget-wide v19, v6, v16

    add-long v13, v13, v19

    move/from16 p1, v15

    add-int/lit8 v15, v1, 0x30

    invoke-static {v0, v15}, Lcom/google/common/hash/LittleEndianByteArray;->load64([BI)J

    move-result-wide v19

    add-long v13, v13, v19

    const/16 v15, 0x2a

    invoke-static {v13, v14, v15}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v13

    mul-long v13, v13, v17

    .line 188
    aget-wide v19, v7, v16

    xor-long v19, v4, v19

    .line 189
    aget-wide v4, v6, p1

    add-int/lit8 v15, v1, 0x28

    invoke-static {v0, v15}, Lcom/google/common/hash/LittleEndianByteArray;->load64([BI)J

    move-result-wide v21

    add-long v4, v4, v21

    add-long/2addr v13, v4

    .line 190
    aget-wide v4, v7, p1

    add-long/2addr v2, v4

    const/16 v15, 0x21

    invoke-static {v2, v3, v15}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v2

    mul-long v21, v2, v17

    .line 191
    aget-wide v2, v6, v16

    mul-long v2, v2, v17

    aget-wide v4, v7, p1

    add-long v4, v19, v4

    invoke-static/range {v0 .. v6}, Lcom/google/common/hash/FarmHashFingerprint64;->weakHashLength32WithSeeds([BIJJ[J)V

    move/from16 v24, v1

    move-object/from16 v23, v6

    add-int/lit8 v1, v24, 0x20

    .line 192
    aget-wide v2, v7, v16

    add-long v2, v21, v2

    add-int/lit8 v4, v24, 0x10

    invoke-static {v0, v4}, Lcom/google/common/hash/LittleEndianByteArray;->load64([BI)J

    move-result-wide v4

    add-long/2addr v4, v13

    move-object v6, v7

    invoke-static/range {v0 .. v6}, Lcom/google/common/hash/FarmHashFingerprint64;->weakHashLength32WithSeeds([BIJJ[J)V

    add-int/lit8 v1, v24, 0x40

    if-ne v1, v9, :cond_0

    const-wide/16 v1, 0xff

    and-long v1, v19, v1

    shl-long v1, v1, v16

    add-long v28, v1, v17

    .line 201
    aget-wide v1, v7, p1

    int-to-long v3, v10

    add-long/2addr v1, v3

    aput-wide v1, v7, p1

    .line 202
    aget-wide v3, v23, p1

    add-long/2addr v3, v1

    aput-wide v3, v23, p1

    .line 203
    aget-wide v1, v7, p1

    add-long/2addr v1, v3

    aput-wide v1, v7, p1

    add-long v21, v21, v13

    .line 204
    aget-wide v1, v23, p1

    add-long v21, v21, v1

    add-int/lit8 v1, v11, -0x37

    invoke-static {v0, v1}, Lcom/google/common/hash/LittleEndianByteArray;->load64([BI)J

    move-result-wide v1

    add-long v1, v21, v1

    invoke-static {v1, v2, v8}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v1

    mul-long v1, v1, v28

    .line 205
    aget-wide v3, v23, v16

    add-long/2addr v13, v3

    add-int/lit8 v3, v11, -0xf

    invoke-static {v0, v3}, Lcom/google/common/hash/LittleEndianByteArray;->load64([BI)J

    move-result-wide v3

    add-long/2addr v13, v3

    const/16 v3, 0x2a

    invoke-static {v13, v14, v3}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v3

    mul-long v3, v3, v28

    .line 206
    aget-wide v5, v7, v16

    const-wide/16 v8, 0x9

    mul-long/2addr v5, v8

    xor-long v13, v1, v5

    .line 207
    aget-wide v1, v23, p1

    mul-long/2addr v1, v8

    add-int/lit8 v5, v11, -0x17

    invoke-static {v0, v5}, Lcom/google/common/hash/LittleEndianByteArray;->load64([BI)J

    move-result-wide v5

    add-long/2addr v1, v5

    add-long v8, v3, v1

    .line 208
    aget-wide v1, v7, p1

    add-long v1, v19, v1

    invoke-static {v1, v2, v15}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v1

    mul-long v17, v1, v28

    .line 209
    aget-wide v1, v23, v16

    mul-long v2, v1, v28

    aget-wide v4, v7, p1

    add-long/2addr v4, v13

    move v1, v12

    move-object/from16 v6, v23

    invoke-static/range {v0 .. v6}, Lcom/google/common/hash/FarmHashFingerprint64;->weakHashLength32WithSeeds([BIJJ[J)V

    add-int/lit8 v1, v11, -0x1f

    .line 210
    aget-wide v2, v7, v16

    add-long v2, v17, v2

    add-int/lit8 v11, v11, -0x2f

    invoke-static {v0, v11}, Lcom/google/common/hash/LittleEndianByteArray;->load64([BI)J

    move-result-wide v4

    add-long/2addr v4, v8

    move-object v6, v7

    invoke-static/range {v0 .. v6}, Lcom/google/common/hash/FarmHashFingerprint64;->weakHashLength32WithSeeds([BIJJ[J)V

    .line 211
    aget-wide v24, v23, p1

    aget-wide v26, v6, p1

    .line 212
    invoke-static/range {v24 .. v29}, Lcom/google/common/hash/FarmHashFingerprint64;->hashLength16(JJJ)J

    move-result-wide v0

    invoke-static {v8, v9}, Lcom/google/common/hash/FarmHashFingerprint64;->shiftMix(J)J

    move-result-wide v2

    const-wide v4, -0x3c5a37a36834ced9L    # -7.848031385787155E17

    mul-long/2addr v2, v4

    add-long/2addr v0, v2

    add-long/2addr v0, v13

    aget-wide v24, v23, v16

    aget-wide v26, v6, v16

    .line 213
    invoke-static/range {v24 .. v29}, Lcom/google/common/hash/FarmHashFingerprint64;->hashLength16(JJJ)J

    move-result-wide v2

    add-long v26, v2, v17

    move-wide/from16 v24, v0

    .line 211
    invoke-static/range {v24 .. v29}, Lcom/google/common/hash/FarmHashFingerprint64;->hashLength16(JJJ)J

    move-result-wide v0

    return-wide v0

    :cond_0
    move-object/from16 v0, p0

    move/from16 v8, v16

    move-wide/from16 v2, v19

    move-wide/from16 v4, v21

    move-object/from16 v6, v23

    goto/16 :goto_0
.end method

.method private static shiftMix(J)J
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "val"
        }
    .end annotation

    const/16 v0, 0x2f

    ushr-long v0, p0, v0

    xor-long/2addr p0, v0

    return-wide p0
.end method

.method private static weakHashLength32WithSeeds([BIJJ[J)V
    .registers 13
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "bytes",
            "offset",
            "seedA",
            "seedB",
            "output"
        }
    .end annotation

    .line 102
    invoke-static {p0, p1}, Lcom/google/common/hash/LittleEndianByteArray;->load64([BI)J

    move-result-wide v0

    add-int/lit8 v2, p1, 0x8

    .line 103
    invoke-static {p0, v2}, Lcom/google/common/hash/LittleEndianByteArray;->load64([BI)J

    move-result-wide v2

    add-int/lit8 v4, p1, 0x10

    .line 104
    invoke-static {p0, v4}, Lcom/google/common/hash/LittleEndianByteArray;->load64([BI)J

    move-result-wide v4

    add-int/lit8 p1, p1, 0x18

    .line 105
    invoke-static {p0, p1}, Lcom/google/common/hash/LittleEndianByteArray;->load64([BI)J

    move-result-wide p0

    add-long/2addr p2, v0

    add-long/2addr p4, p2

    add-long/2addr p4, p0

    const/16 v0, 0x15

    .line 108
    invoke-static {p4, p5, v0}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide p4

    add-long/2addr v2, p2

    add-long/2addr v2, v4

    const/16 v0, 0x2c

    .line 112
    invoke-static {v2, v3, v0}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v0

    add-long/2addr p4, v0

    const/4 v0, 0x0

    add-long/2addr v2, p0

    .line 113
    aput-wide v2, p6, v0

    const/4 p0, 0x1

    add-long/2addr p4, p2

    .line 114
    aput-wide p4, p6, p0

    return-void
.end method


# virtual methods
.method public bits()I
    .registers 1

    const/16 p0, 0x40

    return p0
.end method

.method public hashBytes([BII)Lcom/google/common/hash/HashCode;
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "input",
            "off",
            "len"
        }
    .end annotation

    add-int p0, p2, p3

    .line 51
    array-length v0, p1

    invoke-static {p2, p0, v0}, Lcom/google/common/base/Preconditions;->checkPositionIndexes(III)V

    .line 52
    invoke-static {p1, p2, p3}, Lcom/google/common/hash/FarmHashFingerprint64;->fingerprint([BII)J

    move-result-wide p0

    invoke-static {p0, p1}, Lcom/google/common/hash/HashCode;->fromLong(J)Lcom/google/common/hash/HashCode;

    move-result-object p0

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .registers 1

    .line 62
    const-string p0, "Hashing.farmHashFingerprint64()"

    return-object p0
.end method
