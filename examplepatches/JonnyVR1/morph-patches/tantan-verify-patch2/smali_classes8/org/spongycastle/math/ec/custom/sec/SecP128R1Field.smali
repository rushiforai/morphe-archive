.class public Lorg/spongycastle/math/ec/custom/sec/SecP128R1Field;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final M:J = 0xffffffffL

.field static final P:[I

.field private static final P3:I = -0x3

.field static final PExt:[I

.field private static final PExt7:I = -0x4

.field private static final PExtInv:[I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/4 v0, -0x1

    .line 2
    const/4 v1, -0x3

    .line 3
    filled-new-array {v0, v0, v0, v1}, [I

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lorg/spongycastle/math/ec/custom/sec/SecP128R1Field;->P:[I

    .line 8
    .line 9
    const/16 v0, 0x8

    .line 10
    .line 11
    new-array v1, v0, [I

    .line 12
    .line 13
    fill-array-data v1, :array_0

    .line 14
    .line 15
    .line 16
    sput-object v1, Lorg/spongycastle/math/ec/custom/sec/SecP128R1Field;->PExt:[I

    .line 17
    .line 18
    new-array v0, v0, [I

    .line 19
    .line 20
    fill-array-data v0, :array_1

    .line 21
    .line 22
    .line 23
    sput-object v0, Lorg/spongycastle/math/ec/custom/sec/SecP128R1Field;->PExtInv:[I

    .line 24
    .line 25
    return-void

    .line 26
    nop

    .line 27
    :array_0
    .array-data 4
        0x1
        0x0
        0x0
        0x4
        -0x2
        -0x1
        0x3
        -0x4
    .end array-data

    .line 28
    .line 29
    .line 30
    .line 31
    .line 32
    .line 33
    .line 34
    .line 35
    .line 36
    .line 37
    .line 38
    .line 39
    .line 40
    .line 41
    .line 42
    .line 43
    .line 44
    .line 45
    .line 46
    .line 47
    :array_1
    .array-data 4
        -0x1
        -0x1
        -0x1
        -0x5
        0x1
        0x0
        -0x4
        0x3
    .end array-data
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

.method public static add([I[I[I)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lorg/spongycastle/math/raw/Nat128;->add([I[I[I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_1

    .line 6
    .line 7
    const/4 p0, 0x3

    .line 8
    aget p0, p2, p0

    .line 9
    .line 10
    const/4 p1, -0x3

    .line 11
    if-ne p0, p1, :cond_0

    .line 12
    .line 13
    sget-object p0, Lorg/spongycastle/math/ec/custom/sec/SecP128R1Field;->P:[I

    .line 14
    .line 15
    invoke-static {p2, p0}, Lorg/spongycastle/math/raw/Nat128;->gte([I[I)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    return-void

    .line 23
    :cond_1
    :goto_0
    invoke-static {p2}, Lorg/spongycastle/math/ec/custom/sec/SecP128R1Field;->addPInvTo([I)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static addExt([I[I[I)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lorg/spongycastle/math/raw/Nat256;->add([I[I[I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_1

    .line 6
    .line 7
    const/4 p0, 0x7

    .line 8
    aget p0, p2, p0

    .line 9
    .line 10
    const/4 p1, -0x4

    .line 11
    if-ne p0, p1, :cond_0

    .line 12
    .line 13
    sget-object p0, Lorg/spongycastle/math/ec/custom/sec/SecP128R1Field;->PExt:[I

    .line 14
    .line 15
    invoke-static {p2, p0}, Lorg/spongycastle/math/raw/Nat256;->gte([I[I)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    return-void

    .line 23
    :cond_1
    :goto_0
    sget-object p0, Lorg/spongycastle/math/ec/custom/sec/SecP128R1Field;->PExtInv:[I

    .line 24
    .line 25
    array-length p1, p0

    .line 26
    invoke-static {p1, p0, p2}, Lorg/spongycastle/math/raw/Nat;->addTo(I[I[I)I

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public static addOne([I[I)V
    .locals 1

    .line 1
    const/4 v0, 0x4

    .line 2
    invoke-static {v0, p0, p1}, Lorg/spongycastle/math/raw/Nat;->inc(I[I[I)I

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    if-nez p0, :cond_1

    .line 7
    .line 8
    const/4 p0, 0x3

    .line 9
    aget p0, p1, p0

    .line 10
    .line 11
    const/4 v0, -0x3

    .line 12
    if-ne p0, v0, :cond_0

    .line 13
    .line 14
    sget-object p0, Lorg/spongycastle/math/ec/custom/sec/SecP128R1Field;->P:[I

    .line 15
    .line 16
    invoke-static {p1, p0}, Lorg/spongycastle/math/raw/Nat128;->gte([I[I)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return-void

    .line 24
    :cond_1
    :goto_0
    invoke-static {p1}, Lorg/spongycastle/math/ec/custom/sec/SecP128R1Field;->addPInvTo([I)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method private static addPInvTo([I)V
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    aget v1, p0, v0

    .line 3
    .line 4
    int-to-long v1, v1

    .line 5
    const-wide v3, 0xffffffffL

    .line 6
    .line 7
    .line 8
    .line 9
    .line 10
    and-long/2addr v1, v3

    .line 11
    const-wide/16 v5, 0x1

    .line 12
    .line 13
    add-long/2addr v1, v5

    .line 14
    long-to-int v5, v1

    .line 15
    aput v5, p0, v0

    .line 16
    .line 17
    const/16 v0, 0x20

    .line 18
    .line 19
    shr-long/2addr v1, v0

    .line 20
    const-wide/16 v5, 0x0

    .line 21
    .line 22
    cmp-long v5, v1, v5

    .line 23
    .line 24
    if-eqz v5, :cond_0

    .line 25
    .line 26
    const/4 v5, 0x1

    .line 27
    aget v6, p0, v5

    .line 28
    .line 29
    int-to-long v6, v6

    .line 30
    and-long/2addr v6, v3

    .line 31
    add-long/2addr v1, v6

    .line 32
    long-to-int v6, v1

    .line 33
    aput v6, p0, v5

    .line 34
    .line 35
    shr-long/2addr v1, v0

    .line 36
    const/4 v5, 0x2

    .line 37
    aget v6, p0, v5

    .line 38
    .line 39
    int-to-long v6, v6

    .line 40
    and-long/2addr v6, v3

    .line 41
    add-long/2addr v1, v6

    .line 42
    long-to-int v6, v1

    .line 43
    aput v6, p0, v5

    .line 44
    .line 45
    shr-long/2addr v1, v0

    .line 46
    :cond_0
    const/4 v0, 0x3

    .line 47
    aget v5, p0, v0

    .line 48
    .line 49
    int-to-long v5, v5

    .line 50
    and-long/2addr v3, v5

    .line 51
    const-wide/16 v5, 0x2

    .line 52
    .line 53
    add-long/2addr v3, v5

    .line 54
    add-long/2addr v1, v3

    .line 55
    long-to-int v1, v1

    .line 56
    aput v1, p0, v0

    .line 57
    .line 58
    return-void
.end method

.method public static fromBigInteger(Ljava/math/BigInteger;)[I
    .locals 2

    .line 1
    invoke-static {p0}, Lorg/spongycastle/math/raw/Nat128;->fromBigInteger(Ljava/math/BigInteger;)[I

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x3

    .line 6
    aget v0, p0, v0

    .line 7
    .line 8
    const/4 v1, -0x3

    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    sget-object v0, Lorg/spongycastle/math/ec/custom/sec/SecP128R1Field;->P:[I

    .line 12
    .line 13
    invoke-static {p0, v0}, Lorg/spongycastle/math/raw/Nat128;->gte([I[I)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    invoke-static {v0, p0}, Lorg/spongycastle/math/raw/Nat128;->subFrom([I[I)I

    .line 20
    .line 21
    .line 22
    :cond_0
    return-object p0
.end method

.method public static half([I[I)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    aget v1, p0, v0

    .line 3
    .line 4
    and-int/lit8 v1, v1, 0x1

    .line 5
    .line 6
    const/4 v2, 0x4

    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    invoke-static {v2, p0, v0, p1}, Lorg/spongycastle/math/raw/Nat;->shiftDownBit(I[II[I)I

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    sget-object v0, Lorg/spongycastle/math/ec/custom/sec/SecP128R1Field;->P:[I

    .line 14
    .line 15
    invoke-static {p0, v0, p1}, Lorg/spongycastle/math/raw/Nat128;->add([I[I[I)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    invoke-static {v2, p1, p0}, Lorg/spongycastle/math/raw/Nat;->shiftDownBit(I[II)I

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static multiply([I[I[I)V
    .locals 1

    .line 1
    invoke-static {}, Lorg/spongycastle/math/raw/Nat128;->createExt()[I

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p0, p1, v0}, Lorg/spongycastle/math/raw/Nat128;->mul([I[I[I)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, p2}, Lorg/spongycastle/math/ec/custom/sec/SecP128R1Field;->reduce([I[I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static multiplyAddToExt([I[I[I)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lorg/spongycastle/math/raw/Nat128;->mulAddTo([I[I[I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_1

    .line 6
    .line 7
    const/4 p0, 0x7

    .line 8
    aget p0, p2, p0

    .line 9
    .line 10
    const/4 p1, -0x4

    .line 11
    if-ne p0, p1, :cond_0

    .line 12
    .line 13
    sget-object p0, Lorg/spongycastle/math/ec/custom/sec/SecP128R1Field;->PExt:[I

    .line 14
    .line 15
    invoke-static {p2, p0}, Lorg/spongycastle/math/raw/Nat256;->gte([I[I)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    return-void

    .line 23
    :cond_1
    :goto_0
    sget-object p0, Lorg/spongycastle/math/ec/custom/sec/SecP128R1Field;->PExtInv:[I

    .line 24
    .line 25
    array-length p1, p0

    .line 26
    invoke-static {p1, p0, p2}, Lorg/spongycastle/math/raw/Nat;->addTo(I[I[I)I

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public static negate([I[I)V
    .locals 1

    .line 1
    invoke-static {p0}, Lorg/spongycastle/math/raw/Nat128;->isZero([I)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p1}, Lorg/spongycastle/math/raw/Nat128;->zero([I)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    sget-object v0, Lorg/spongycastle/math/ec/custom/sec/SecP128R1Field;->P:[I

    .line 12
    .line 13
    invoke-static {v0, p0, p1}, Lorg/spongycastle/math/raw/Nat128;->sub([I[I[I)I

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static reduce([I[I)V
    .locals 23

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aget v2, p0, v1

    .line 5
    .line 6
    int-to-long v2, v2

    .line 7
    const-wide v4, 0xffffffffL

    .line 8
    .line 9
    .line 10
    .line 11
    .line 12
    and-long/2addr v2, v4

    .line 13
    const/4 v6, 0x1

    .line 14
    aget v7, p0, v6

    .line 15
    .line 16
    int-to-long v7, v7

    .line 17
    and-long/2addr v7, v4

    .line 18
    const/4 v9, 0x2

    .line 19
    aget v10, p0, v9

    .line 20
    .line 21
    int-to-long v10, v10

    .line 22
    and-long/2addr v10, v4

    .line 23
    const/4 v12, 0x3

    .line 24
    aget v13, p0, v12

    .line 25
    .line 26
    int-to-long v13, v13

    .line 27
    and-long/2addr v13, v4

    .line 28
    const/4 v15, 0x4

    .line 29
    aget v15, p0, v15

    .line 30
    .line 31
    move/from16 v16, v1

    .line 32
    .line 33
    move-wide/from16 v17, v2

    .line 34
    .line 35
    int-to-long v1, v15

    .line 36
    and-long/2addr v1, v4

    .line 37
    const/4 v3, 0x5

    .line 38
    aget v3, p0, v3

    .line 39
    .line 40
    move-wide/from16 v19, v4

    .line 41
    .line 42
    int-to-long v4, v3

    .line 43
    and-long v3, v4, v19

    .line 44
    .line 45
    const/4 v5, 0x6

    .line 46
    aget v5, p0, v5

    .line 47
    .line 48
    move v15, v6

    .line 49
    move-wide/from16 v21, v7

    .line 50
    .line 51
    int-to-long v6, v5

    .line 52
    and-long v5, v6, v19

    .line 53
    .line 54
    const/4 v7, 0x7

    .line 55
    aget v7, p0, v7

    .line 56
    .line 57
    int-to-long v7, v7

    .line 58
    and-long v7, v7, v19

    .line 59
    .line 60
    add-long/2addr v13, v7

    .line 61
    shl-long/2addr v7, v15

    .line 62
    add-long/2addr v5, v7

    .line 63
    add-long/2addr v10, v5

    .line 64
    shl-long/2addr v5, v15

    .line 65
    add-long/2addr v3, v5

    .line 66
    add-long v7, v21, v3

    .line 67
    .line 68
    shl-long/2addr v3, v15

    .line 69
    add-long/2addr v1, v3

    .line 70
    add-long v3, v17, v1

    .line 71
    .line 72
    shl-long/2addr v1, v15

    .line 73
    add-long/2addr v13, v1

    .line 74
    long-to-int v1, v3

    .line 75
    aput v1, v0, v16

    .line 76
    .line 77
    const/16 v1, 0x20

    .line 78
    .line 79
    ushr-long v2, v3, v1

    .line 80
    .line 81
    add-long/2addr v7, v2

    .line 82
    long-to-int v2, v7

    .line 83
    aput v2, v0, v15

    .line 84
    .line 85
    ushr-long v2, v7, v1

    .line 86
    .line 87
    add-long/2addr v10, v2

    .line 88
    long-to-int v2, v10

    .line 89
    aput v2, v0, v9

    .line 90
    .line 91
    ushr-long v2, v10, v1

    .line 92
    .line 93
    add-long/2addr v13, v2

    .line 94
    long-to-int v2, v13

    .line 95
    aput v2, v0, v12

    .line 96
    .line 97
    ushr-long v1, v13, v1

    .line 98
    .line 99
    long-to-int v1, v1

    .line 100
    invoke-static {v1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecP128R1Field;->reduce32(I[I)V

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public static reduce32(I[I)V
    .locals 10

    .line 1
    :goto_0
    if-eqz p0, :cond_1

    .line 2
    .line 3
    int-to-long v0, p0

    .line 4
    const-wide v2, 0xffffffffL

    .line 5
    .line 6
    .line 7
    .line 8
    .line 9
    and-long/2addr v0, v2

    .line 10
    const/4 p0, 0x0

    .line 11
    aget v4, p1, p0

    .line 12
    .line 13
    int-to-long v4, v4

    .line 14
    and-long/2addr v4, v2

    .line 15
    add-long/2addr v4, v0

    .line 16
    long-to-int v6, v4

    .line 17
    aput v6, p1, p0

    .line 18
    .line 19
    const/16 p0, 0x20

    .line 20
    .line 21
    shr-long/2addr v4, p0

    .line 22
    const-wide/16 v6, 0x0

    .line 23
    .line 24
    cmp-long v6, v4, v6

    .line 25
    .line 26
    const/4 v7, 0x1

    .line 27
    if-eqz v6, :cond_0

    .line 28
    .line 29
    aget v6, p1, v7

    .line 30
    .line 31
    int-to-long v8, v6

    .line 32
    and-long/2addr v8, v2

    .line 33
    add-long/2addr v4, v8

    .line 34
    long-to-int v6, v4

    .line 35
    aput v6, p1, v7

    .line 36
    .line 37
    shr-long/2addr v4, p0

    .line 38
    const/4 v6, 0x2

    .line 39
    aget v8, p1, v6

    .line 40
    .line 41
    int-to-long v8, v8

    .line 42
    and-long/2addr v8, v2

    .line 43
    add-long/2addr v4, v8

    .line 44
    long-to-int v8, v4

    .line 45
    aput v8, p1, v6

    .line 46
    .line 47
    shr-long/2addr v4, p0

    .line 48
    :cond_0
    const/4 v6, 0x3

    .line 49
    aget v8, p1, v6

    .line 50
    .line 51
    int-to-long v8, v8

    .line 52
    and-long/2addr v2, v8

    .line 53
    shl-long/2addr v0, v7

    .line 54
    add-long/2addr v2, v0

    .line 55
    add-long/2addr v4, v2

    .line 56
    long-to-int v0, v4

    .line 57
    aput v0, p1, v6

    .line 58
    .line 59
    shr-long v0, v4, p0

    .line 60
    .line 61
    long-to-int p0, v0

    .line 62
    goto :goto_0

    .line 63
    :cond_1
    return-void
.end method

.method public static square([I[I)V
    .locals 1

    .line 1
    invoke-static {}, Lorg/spongycastle/math/raw/Nat128;->createExt()[I

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p0, v0}, Lorg/spongycastle/math/raw/Nat128;->square([I[I)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, p1}, Lorg/spongycastle/math/ec/custom/sec/SecP128R1Field;->reduce([I[I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static squareN([II[I)V
    .locals 1

    .line 1
    invoke-static {}, Lorg/spongycastle/math/raw/Nat128;->createExt()[I

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p0, v0}, Lorg/spongycastle/math/raw/Nat128;->square([I[I)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, p2}, Lorg/spongycastle/math/ec/custom/sec/SecP128R1Field;->reduce([I[I)V

    .line 9
    .line 10
    .line 11
    :goto_0
    add-int/lit8 p1, p1, -0x1

    .line 12
    .line 13
    if-lez p1, :cond_0

    .line 14
    .line 15
    invoke-static {p2, v0}, Lorg/spongycastle/math/raw/Nat128;->square([I[I)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, p2}, Lorg/spongycastle/math/ec/custom/sec/SecP128R1Field;->reduce([I[I)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    return-void
.end method

.method private static subPInvFrom([I)V
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    aget v1, p0, v0

    .line 3
    .line 4
    int-to-long v1, v1

    .line 5
    const-wide v3, 0xffffffffL

    .line 6
    .line 7
    .line 8
    .line 9
    .line 10
    and-long/2addr v1, v3

    .line 11
    const-wide/16 v5, 0x1

    .line 12
    .line 13
    sub-long/2addr v1, v5

    .line 14
    long-to-int v5, v1

    .line 15
    aput v5, p0, v0

    .line 16
    .line 17
    const/16 v0, 0x20

    .line 18
    .line 19
    shr-long/2addr v1, v0

    .line 20
    const-wide/16 v5, 0x0

    .line 21
    .line 22
    cmp-long v5, v1, v5

    .line 23
    .line 24
    if-eqz v5, :cond_0

    .line 25
    .line 26
    const/4 v5, 0x1

    .line 27
    aget v6, p0, v5

    .line 28
    .line 29
    int-to-long v6, v6

    .line 30
    and-long/2addr v6, v3

    .line 31
    add-long/2addr v1, v6

    .line 32
    long-to-int v6, v1

    .line 33
    aput v6, p0, v5

    .line 34
    .line 35
    shr-long/2addr v1, v0

    .line 36
    const/4 v5, 0x2

    .line 37
    aget v6, p0, v5

    .line 38
    .line 39
    int-to-long v6, v6

    .line 40
    and-long/2addr v6, v3

    .line 41
    add-long/2addr v1, v6

    .line 42
    long-to-int v6, v1

    .line 43
    aput v6, p0, v5

    .line 44
    .line 45
    shr-long/2addr v1, v0

    .line 46
    :cond_0
    const/4 v0, 0x3

    .line 47
    aget v5, p0, v0

    .line 48
    .line 49
    int-to-long v5, v5

    .line 50
    and-long/2addr v3, v5

    .line 51
    const-wide/16 v5, 0x2

    .line 52
    .line 53
    sub-long/2addr v3, v5

    .line 54
    add-long/2addr v1, v3

    .line 55
    long-to-int v1, v1

    .line 56
    aput v1, p0, v0

    .line 57
    .line 58
    return-void
.end method

.method public static subtract([I[I[I)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lorg/spongycastle/math/raw/Nat128;->sub([I[I[I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {p2}, Lorg/spongycastle/math/ec/custom/sec/SecP128R1Field;->subPInvFrom([I)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static subtractExt([I[I[I)V
    .locals 1

    .line 1
    const/16 v0, 0xa

    .line 2
    .line 3
    invoke-static {v0, p0, p1, p2}, Lorg/spongycastle/math/raw/Nat;->sub(I[I[I[I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lorg/spongycastle/math/ec/custom/sec/SecP128R1Field;->PExtInv:[I

    .line 10
    .line 11
    array-length p1, p0

    .line 12
    invoke-static {p1, p0, p2}, Lorg/spongycastle/math/raw/Nat;->subFrom(I[I[I)I

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public static twice([I[I)V
    .locals 2

    .line 1
    const/4 v0, 0x4

    .line 2
    const/4 v1, 0x0

    .line 3
    invoke-static {v0, p0, v1, p1}, Lorg/spongycastle/math/raw/Nat;->shiftUpBit(I[II[I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_1

    .line 8
    .line 9
    const/4 p0, 0x3

    .line 10
    aget p0, p1, p0

    .line 11
    .line 12
    const/4 v0, -0x3

    .line 13
    if-ne p0, v0, :cond_0

    .line 14
    .line 15
    sget-object p0, Lorg/spongycastle/math/ec/custom/sec/SecP128R1Field;->P:[I

    .line 16
    .line 17
    invoke-static {p1, p0}, Lorg/spongycastle/math/raw/Nat128;->gte([I[I)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    return-void

    .line 25
    :cond_1
    :goto_0
    invoke-static {p1}, Lorg/spongycastle/math/ec/custom/sec/SecP128R1Field;->addPInvTo([I)V

    .line 26
    .line 27
    .line 28
    return-void
.end method
