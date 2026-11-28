.class final Lcom/google/common/hash/Fingerprint2011;
.super Lcom/google/common/hash/AbstractNonStreamingHashFunction;
.source "Fingerprint2011.java"


# static fields
.field static final FINGERPRINT_2011:Lcom/google/common/hash/HashFunction;

.field private static final K0:J = -0x5a47a3a1e67127b7L

.field private static final K1:J = -0x72a753d9501ed1b9L

.field private static final K2:J = -0x3b849161c568f12dL

.field private static final K3:J = -0x395b586ca42e166bL


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 34
    new-instance v0, Lcom/google/common/hash/Fingerprint2011;

    invoke-direct {v0}, Lcom/google/common/hash/Fingerprint2011;-><init>()V

    sput-object v0, Lcom/google/common/hash/Fingerprint2011;->FINGERPRINT_2011:Lcom/google/common/hash/HashFunction;

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .line 33
    invoke-direct {p0}, Lcom/google/common/hash/AbstractNonStreamingHashFunction;-><init>()V

    return-void
.end method

.method static fingerprint([BII)J
    .registers 11
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

    if-gt p2, v0, :cond_0

    const-wide v0, -0x1364611973070723L    # -1.4877559216887398E215

    .line 65
    invoke-static {p0, p1, p2, v0, v1}, Lcom/google/common/hash/Fingerprint2011;->murmurHash64WithSeed([BIIJ)J

    move-result-wide v0

    goto :goto_0

    :cond_0
    const/16 v0, 0x40

    if-gt p2, v0, :cond_1

    .line 67
    invoke-static {p0, p1, p2}, Lcom/google/common/hash/Fingerprint2011;->hashLength33To64([BII)J

    move-result-wide v0

    goto :goto_0

    .line 69
    :cond_1
    invoke-static {p0, p1, p2}, Lcom/google/common/hash/Fingerprint2011;->fullFingerprint([BII)J

    move-result-wide v0

    :goto_0
    const-wide v2, -0x5a47a3a1e67127b7L    # -5.623071142144676E-127

    const/16 v4, 0x8

    if-lt p2, v4, :cond_2

    .line 72
    invoke-static {p0, p1}, Lcom/google/common/hash/LittleEndianByteArray;->load64([BI)J

    move-result-wide v5

    goto :goto_1

    :cond_2
    move-wide v5, v2

    :goto_1
    const/16 v7, 0x9

    if-lt p2, v7, :cond_3

    add-int/2addr p1, p2

    sub-int/2addr p1, v4

    .line 73
    invoke-static {p0, p1}, Lcom/google/common/hash/LittleEndianByteArray;->load64([BI)J

    move-result-wide v2

    :cond_3
    add-long/2addr v0, v2

    .line 74
    invoke-static {v0, v1, v5, v6}, Lcom/google/common/hash/Fingerprint2011;->hash128to64(JJ)J

    move-result-wide p0

    const-wide/16 v0, 0x0

    cmp-long p2, p0, v0

    if-eqz p2, :cond_4

    const-wide/16 v0, 0x1

    cmp-long p2, p0, v0

    if-eqz p2, :cond_4

    return-wide p0

    :cond_4
    const-wide/16 v0, -0x2

    add-long/2addr p0, v0

    return-wide p0
.end method

.method private static fullFingerprint([BII)J
    .registers 25
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

    move/from16 v7, p2

    .line 120
    invoke-static/range {p0 .. p1}, Lcom/google/common/hash/LittleEndianByteArray;->load64([BI)J

    move-result-wide v8

    add-int v10, p1, v7

    add-int/lit8 v1, v10, -0x10

    .line 121
    invoke-static {v0, v1}, Lcom/google/common/hash/LittleEndianByteArray;->load64([BI)J

    move-result-wide v1

    const-wide v11, -0x72a753d9501ed1b9L

    xor-long v4, v1, v11

    add-int/lit8 v1, v10, -0x38

    .line 122
    invoke-static {v0, v1}, Lcom/google/common/hash/LittleEndianByteArray;->load64([BI)J

    move-result-wide v1

    const-wide v13, -0x5a47a3a1e67127b7L    # -5.623071142144676E-127

    xor-long/2addr v13, v1

    const/4 v1, 0x2

    .line 123
    new-array v6, v1, [J

    .line 124
    new-array v15, v1, [J

    add-int/lit8 v1, v10, -0x40

    int-to-long v2, v7

    .line 125
    invoke-static/range {v0 .. v6}, Lcom/google/common/hash/Fingerprint2011;->weakHashLength32WithSeeds([BIJJ[J)V

    move-object/from16 v16, v6

    add-int/lit8 v1, v10, -0x20

    mul-long/2addr v2, v11

    move-wide/from16 v17, v4

    const-wide v4, -0x5a47a3a1e67127b7L    # -5.623071142144676E-127

    move-wide/from16 v19, v11

    move-object v6, v15

    move-wide/from16 v11, v17

    .line 126
    invoke-static/range {v0 .. v6}, Lcom/google/common/hash/Fingerprint2011;->weakHashLength32WithSeeds([BIJJ[J)V

    move-object v10, v6

    const/4 v15, 0x1

    .line 127
    aget-wide v1, v16, v15

    invoke-static {v1, v2}, Lcom/google/common/hash/Fingerprint2011;->shiftMix(J)J

    move-result-wide v1

    mul-long v1, v1, v19

    add-long/2addr v13, v1

    add-long/2addr v8, v13

    const/16 v1, 0x27

    .line 128
    invoke-static {v8, v9, v1}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v1

    mul-long v1, v1, v19

    const/16 v8, 0x21

    .line 129
    invoke-static {v11, v12, v8}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v3

    mul-long v3, v3, v19

    add-int/lit8 v5, v7, -0x1

    and-int/lit8 v5, v5, -0x40

    move v7, v5

    move-wide v4, v3

    move-wide v2, v1

    move/from16 v1, p1

    :goto_0
    add-long/2addr v2, v4

    const/4 v9, 0x0

    .line 134
    aget-wide v11, v16, v9

    add-long/2addr v2, v11

    add-int/lit8 v6, v1, 0x10

    invoke-static {v0, v6}, Lcom/google/common/hash/LittleEndianByteArray;->load64([BI)J

    move-result-wide v11

    add-long/2addr v2, v11

    const/16 v6, 0x25

    invoke-static {v2, v3, v6}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v2

    mul-long v2, v2, v19

    .line 135
    aget-wide v11, v16, v15

    add-long/2addr v4, v11

    add-int/lit8 v6, v1, 0x30

    invoke-static {v0, v6}, Lcom/google/common/hash/LittleEndianByteArray;->load64([BI)J

    move-result-wide v11

    add-long/2addr v4, v11

    const/16 v6, 0x2a

    invoke-static {v4, v5, v6}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v4

    mul-long v4, v4, v19

    .line 136
    aget-wide v11, v10, v15

    xor-long/2addr v11, v2

    .line 137
    aget-wide v2, v16, v9

    xor-long v17, v4, v2

    .line 138
    aget-wide v2, v10, v9

    xor-long/2addr v13, v2

    invoke-static {v13, v14, v8}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v13

    .line 139
    aget-wide v2, v16, v15

    mul-long v2, v2, v19

    aget-wide v4, v10, v9

    add-long/2addr v4, v11

    move-object/from16 v6, v16

    invoke-static/range {v0 .. v6}, Lcom/google/common/hash/Fingerprint2011;->weakHashLength32WithSeeds([BIJJ[J)V

    move/from16 v21, v1

    add-int/lit8 v1, v21, 0x20

    .line 140
    aget-wide v2, v10, v15

    add-long/2addr v2, v13

    move-object/from16 v0, p0

    move-object v6, v10

    move-wide/from16 v4, v17

    invoke-static/range {v0 .. v6}, Lcom/google/common/hash/Fingerprint2011;->weakHashLength32WithSeeds([BIJJ[J)V

    add-int/lit8 v1, v21, 0x40

    add-int/lit8 v7, v7, -0x40

    if-nez v7, :cond_0

    .line 147
    aget-wide v0, v16, v9

    aget-wide v2, v6, v9

    invoke-static {v0, v1, v2, v3}, Lcom/google/common/hash/Fingerprint2011;->hash128to64(JJ)J

    move-result-wide v0

    invoke-static {v4, v5}, Lcom/google/common/hash/Fingerprint2011;->shiftMix(J)J

    move-result-wide v2

    mul-long v2, v2, v19

    add-long/2addr v0, v2

    add-long/2addr v0, v11

    aget-wide v2, v16, v15

    aget-wide v4, v6, v15

    invoke-static {v2, v3, v4, v5}, Lcom/google/common/hash/Fingerprint2011;->hash128to64(JJ)J

    move-result-wide v2

    add-long/2addr v2, v13

    invoke-static {v0, v1, v2, v3}, Lcom/google/common/hash/Fingerprint2011;->hash128to64(JJ)J

    move-result-wide v0

    return-wide v0

    :cond_0
    move-object/from16 v0, p0

    move-object v10, v6

    move-wide v2, v13

    move-wide v13, v11

    goto :goto_0
.end method

.method static hash128to64(JJ)J
    .registers 9
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "high",
            "low"
        }
    .end annotation

    xor-long/2addr p2, p0

    const-wide v0, -0x395b586ca42e166bL    # -2.0946245025644615E32

    mul-long/2addr p2, v0

    const/16 v2, 0x2f

    ushr-long v3, p2, v2

    xor-long/2addr p2, v3

    xor-long/2addr p0, p2

    mul-long/2addr p0, v0

    ushr-long p2, p0, v2

    xor-long/2addr p0, p2

    mul-long/2addr p0, v0

    return-wide p0
.end method

.method private static hashLength33To64([BII)J
    .registers 25
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

    add-int/lit8 v2, p1, 0x18

    .line 151
    invoke-static {v0, v2}, Lcom/google/common/hash/LittleEndianByteArray;->load64([BI)J

    move-result-wide v2

    .line 152
    invoke-static/range {p0 .. p1}, Lcom/google/common/hash/LittleEndianByteArray;->load64([BI)J

    move-result-wide v4

    int-to-long v6, v1

    add-int v1, p1, v1

    add-int/lit8 v8, v1, -0x10

    invoke-static {v0, v8}, Lcom/google/common/hash/LittleEndianByteArray;->load64([BI)J

    move-result-wide v9

    add-long/2addr v6, v9

    const-wide v9, -0x5a47a3a1e67127b7L    # -5.623071142144676E-127

    mul-long/2addr v6, v9

    add-long/2addr v4, v6

    add-long v6, v4, v2

    const/16 v11, 0x34

    .line 153
    invoke-static {v6, v7, v11}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v6

    const/16 v12, 0x25

    .line 154
    invoke-static {v4, v5, v12}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v13

    add-int/lit8 v15, p1, 0x8

    .line 155
    invoke-static {v0, v15}, Lcom/google/common/hash/LittleEndianByteArray;->load64([BI)J

    move-result-wide v15

    add-long/2addr v4, v15

    const/4 v15, 0x7

    .line 156
    invoke-static {v4, v5, v15}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v16

    add-long v13, v13, v16

    move-wide/from16 v16, v9

    add-int/lit8 v9, p1, 0x10

    .line 157
    invoke-static {v0, v9}, Lcom/google/common/hash/LittleEndianByteArray;->load64([BI)J

    move-result-wide v18

    add-long v4, v4, v18

    add-long/2addr v2, v4

    const/16 v10, 0x1f

    .line 159
    invoke-static {v4, v5, v10}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v4

    add-long/2addr v6, v4

    add-long/2addr v6, v13

    .line 160
    invoke-static {v0, v9}, Lcom/google/common/hash/LittleEndianByteArray;->load64([BI)J

    move-result-wide v4

    add-int/lit8 v9, v1, -0x20

    invoke-static {v0, v9}, Lcom/google/common/hash/LittleEndianByteArray;->load64([BI)J

    move-result-wide v13

    add-long/2addr v4, v13

    add-int/lit8 v9, v1, -0x8

    .line 161
    invoke-static {v0, v9}, Lcom/google/common/hash/LittleEndianByteArray;->load64([BI)J

    move-result-wide v13

    move/from16 p2, v1

    move-wide/from16 v18, v2

    add-long v1, v4, v13

    .line 162
    invoke-static {v1, v2, v11}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v1

    .line 163
    invoke-static {v4, v5, v12}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v11

    add-int/lit8 v3, p2, -0x18

    .line 164
    invoke-static {v0, v3}, Lcom/google/common/hash/LittleEndianByteArray;->load64([BI)J

    move-result-wide v20

    add-long v4, v4, v20

    .line 165
    invoke-static {v4, v5, v15}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v20

    add-long v11, v11, v20

    .line 166
    invoke-static {v0, v8}, Lcom/google/common/hash/LittleEndianByteArray;->load64([BI)J

    move-result-wide v8

    add-long/2addr v4, v8

    add-long/2addr v13, v4

    .line 168
    invoke-static {v4, v5, v10}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v3

    add-long/2addr v1, v3

    add-long/2addr v1, v11

    add-long v2, v18, v1

    const-wide v0, -0x3b849161c568f12dL    # -8.096527404817815E21

    mul-long/2addr v2, v0

    add-long/2addr v13, v6

    mul-long v13, v13, v16

    add-long/2addr v2, v13

    .line 169
    invoke-static {v2, v3}, Lcom/google/common/hash/Fingerprint2011;->shiftMix(J)J

    move-result-wide v2

    mul-long v2, v2, v16

    add-long/2addr v2, v6

    .line 170
    invoke-static {v2, v3}, Lcom/google/common/hash/Fingerprint2011;->shiftMix(J)J

    move-result-wide v2

    mul-long/2addr v2, v0

    return-wide v2
.end method

.method static murmurHash64WithSeed([BIIJ)J
    .registers 11
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "bytes",
            "offset",
            "length",
            "seed"
        }
    .end annotation

    and-int/lit8 v0, p2, -0x8

    and-int/lit8 v1, p2, 0x7

    int-to-long v2, p2

    const-wide v4, -0x395b586ca42e166bL    # -2.0946245025644615E32

    mul-long/2addr v2, v4

    xor-long/2addr p3, v2

    const/4 p2, 0x0

    :goto_0
    if-ge p2, v0, :cond_0

    add-int v2, p1, p2

    .line 183
    invoke-static {p0, v2}, Lcom/google/common/hash/LittleEndianByteArray;->load64([BI)J

    move-result-wide v2

    mul-long/2addr v2, v4

    .line 184
    invoke-static {v2, v3}, Lcom/google/common/hash/Fingerprint2011;->shiftMix(J)J

    move-result-wide v2

    mul-long/2addr v2, v4

    xor-long/2addr p3, v2

    mul-long/2addr p3, v4

    add-int/lit8 p2, p2, 0x8

    goto :goto_0

    :cond_0
    if-eqz v1, :cond_1

    add-int/2addr p1, v0

    .line 190
    invoke-static {p0, p1, v1}, Lcom/google/common/hash/LittleEndianByteArray;->load64Safely([BII)J

    move-result-wide p0

    xor-long/2addr p3, p0

    mul-long/2addr p3, v4

    .line 195
    :cond_1
    invoke-static {p3, p4}, Lcom/google/common/hash/Fingerprint2011;->shiftMix(J)J

    move-result-wide p0

    mul-long/2addr p0, v4

    .line 196
    invoke-static {p0, p1}, Lcom/google/common/hash/Fingerprint2011;->shiftMix(J)J

    move-result-wide p0

    return-wide p0
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

    .line 99
    invoke-static {p0, p1}, Lcom/google/common/hash/LittleEndianByteArray;->load64([BI)J

    move-result-wide v0

    add-int/lit8 v2, p1, 0x8

    .line 100
    invoke-static {p0, v2}, Lcom/google/common/hash/LittleEndianByteArray;->load64([BI)J

    move-result-wide v2

    add-int/lit8 v4, p1, 0x10

    .line 101
    invoke-static {p0, v4}, Lcom/google/common/hash/LittleEndianByteArray;->load64([BI)J

    move-result-wide v4

    add-int/lit8 p1, p1, 0x18

    .line 102
    invoke-static {p0, p1}, Lcom/google/common/hash/LittleEndianByteArray;->load64([BI)J

    move-result-wide p0

    add-long/2addr p2, v0

    add-long/2addr p4, p2

    add-long/2addr p4, p0

    const/16 v0, 0x33

    .line 105
    invoke-static {p4, p5, v0}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide p4

    add-long/2addr v2, p2

    add-long/2addr v2, v4

    const/16 v0, 0x17

    .line 109
    invoke-static {v2, v3, v0}, Ljava/lang/Long;->rotateRight(JI)J

    move-result-wide v0

    add-long/2addr p4, v0

    const/4 v0, 0x0

    add-long/2addr v2, p0

    .line 110
    aput-wide v2, p6, v0

    const/4 p0, 0x1

    add-long/2addr p4, p2

    .line 111
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

    .line 44
    array-length v0, p1

    invoke-static {p2, p0, v0}, Lcom/google/common/base/Preconditions;->checkPositionIndexes(III)V

    .line 45
    invoke-static {p1, p2, p3}, Lcom/google/common/hash/Fingerprint2011;->fingerprint([BII)J

    move-result-wide p0

    invoke-static {p0, p1}, Lcom/google/common/hash/HashCode;->fromLong(J)Lcom/google/common/hash/HashCode;

    move-result-object p0

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .registers 1

    .line 55
    const-string p0, "Hashing.fingerprint2011()"

    return-object p0
.end method
