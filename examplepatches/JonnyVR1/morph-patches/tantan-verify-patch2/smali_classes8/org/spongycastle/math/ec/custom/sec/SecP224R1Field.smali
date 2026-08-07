.class public Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final M:J = 0xffffffffL

.field static final P:[I

.field private static final P6:I = -0x1

.field static final PExt:[I

.field private static final PExt13:I = -0x1

.field private static final PExtInv:[I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/4 v0, 0x7

    .line 2
    new-array v0, v0, [I

    .line 3
    .line 4
    fill-array-data v0, :array_0

    .line 5
    .line 6
    .line 7
    sput-object v0, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->P:[I

    .line 8
    .line 9
    const/16 v0, 0xe

    .line 10
    .line 11
    new-array v0, v0, [I

    .line 12
    .line 13
    fill-array-data v0, :array_1

    .line 14
    .line 15
    .line 16
    sput-object v0, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->PExt:[I

    .line 17
    .line 18
    const/16 v0, 0xb

    .line 19
    .line 20
    new-array v0, v0, [I

    .line 21
    .line 22
    fill-array-data v0, :array_2

    .line 23
    .line 24
    .line 25
    sput-object v0, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->PExtInv:[I

    .line 26
    .line 27
    return-void

    .line 28
    nop

    .line 29
    :array_0
    .array-data 4
        0x1
        0x0
        0x0
        -0x1
        -0x1
        -0x1
        -0x1
    .end array-data

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
        0x1
        0x0
        0x0
        -0x2
        -0x1
        -0x1
        0x0
        0x2
        0x0
        0x0
        -0x2
        -0x1
        -0x1
        -0x1
    .end array-data

    .line 48
    .line 49
    .line 50
    .line 51
    .line 52
    .line 53
    .line 54
    .line 55
    .line 56
    .line 57
    .line 58
    .line 59
    .line 60
    .line 61
    .line 62
    .line 63
    .line 64
    .line 65
    .line 66
    .line 67
    .line 68
    .line 69
    .line 70
    .line 71
    .line 72
    .line 73
    .line 74
    :array_2
    .array-data 4
        -0x1
        -0x1
        -0x1
        0x1
        0x0
        0x0
        -0x1
        -0x3
        -0x1
        -0x1
        0x1
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
    invoke-static {p0, p1, p2}, Lorg/spongycastle/math/raw/Nat224;->add([I[I[I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_1

    .line 6
    .line 7
    const/4 p0, 0x6

    .line 8
    aget p0, p2, p0

    .line 9
    .line 10
    const/4 p1, -0x1

    .line 11
    if-ne p0, p1, :cond_0

    .line 12
    .line 13
    sget-object p0, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->P:[I

    .line 14
    .line 15
    invoke-static {p2, p0}, Lorg/spongycastle/math/raw/Nat224;->gte([I[I)Z

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
    invoke-static {p2}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->addPInvTo([I)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static addExt([I[I[I)V
    .locals 1

    .line 1
    const/16 v0, 0xe

    .line 2
    .line 3
    invoke-static {v0, p0, p1, p2}, Lorg/spongycastle/math/raw/Nat;->add(I[I[I[I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/16 p0, 0xd

    .line 10
    .line 11
    aget p0, p2, p0

    .line 12
    .line 13
    const/4 p1, -0x1

    .line 14
    if-ne p0, p1, :cond_1

    .line 15
    .line 16
    sget-object p0, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->PExt:[I

    .line 17
    .line 18
    invoke-static {v0, p2, p0}, Lorg/spongycastle/math/raw/Nat;->gte(I[I[I)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    :cond_0
    sget-object p0, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->PExtInv:[I

    .line 25
    .line 26
    array-length p1, p0

    .line 27
    invoke-static {p1, p0, p2}, Lorg/spongycastle/math/raw/Nat;->addTo(I[I[I)I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    array-length p0, p0

    .line 34
    invoke-static {v0, p2, p0}, Lorg/spongycastle/math/raw/Nat;->incAt(I[II)I

    .line 35
    .line 36
    .line 37
    :cond_1
    return-void
.end method

.method public static addOne([I[I)V
    .locals 1

    .line 1
    const/4 v0, 0x7

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
    const/4 p0, 0x6

    .line 9
    aget p0, p1, p0

    .line 10
    .line 11
    const/4 v0, -0x1

    .line 12
    if-ne p0, v0, :cond_0

    .line 13
    .line 14
    sget-object p0, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->P:[I

    .line 15
    .line 16
    invoke-static {p1, p0}, Lorg/spongycastle/math/raw/Nat224;->gte([I[I)Z

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
    invoke-static {p1}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->addPInvTo([I)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method private static addPInvTo([I)V
    .locals 12

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
    long-to-int v7, v1

    .line 15
    aput v7, p0, v0

    .line 16
    .line 17
    const/16 v0, 0x20

    .line 18
    .line 19
    shr-long/2addr v1, v0

    .line 20
    const-wide/16 v7, 0x0

    .line 21
    .line 22
    cmp-long v9, v1, v7

    .line 23
    .line 24
    if-eqz v9, :cond_0

    .line 25
    .line 26
    const/4 v9, 0x1

    .line 27
    aget v10, p0, v9

    .line 28
    .line 29
    int-to-long v10, v10

    .line 30
    and-long/2addr v10, v3

    .line 31
    add-long/2addr v1, v10

    .line 32
    long-to-int v10, v1

    .line 33
    aput v10, p0, v9

    .line 34
    .line 35
    shr-long/2addr v1, v0

    .line 36
    const/4 v9, 0x2

    .line 37
    aget v10, p0, v9

    .line 38
    .line 39
    int-to-long v10, v10

    .line 40
    and-long/2addr v10, v3

    .line 41
    add-long/2addr v1, v10

    .line 42
    long-to-int v10, v1

    .line 43
    aput v10, p0, v9

    .line 44
    .line 45
    shr-long/2addr v1, v0

    .line 46
    :cond_0
    const/4 v9, 0x3

    .line 47
    aget v10, p0, v9

    .line 48
    .line 49
    int-to-long v10, v10

    .line 50
    and-long/2addr v3, v10

    .line 51
    add-long/2addr v3, v5

    .line 52
    add-long/2addr v1, v3

    .line 53
    long-to-int v3, v1

    .line 54
    aput v3, p0, v9

    .line 55
    .line 56
    shr-long v0, v1, v0

    .line 57
    .line 58
    cmp-long v0, v0, v7

    .line 59
    .line 60
    if-eqz v0, :cond_1

    .line 61
    .line 62
    const/4 v0, 0x7

    .line 63
    const/4 v1, 0x4

    .line 64
    invoke-static {v0, p0, v1}, Lorg/spongycastle/math/raw/Nat;->incAt(I[II)I

    .line 65
    .line 66
    .line 67
    :cond_1
    return-void
.end method

.method public static fromBigInteger(Ljava/math/BigInteger;)[I
    .locals 2

    .line 1
    invoke-static {p0}, Lorg/spongycastle/math/raw/Nat224;->fromBigInteger(Ljava/math/BigInteger;)[I

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x6

    .line 6
    aget v0, p0, v0

    .line 7
    .line 8
    const/4 v1, -0x1

    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    sget-object v0, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->P:[I

    .line 12
    .line 13
    invoke-static {p0, v0}, Lorg/spongycastle/math/raw/Nat224;->gte([I[I)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    invoke-static {v0, p0}, Lorg/spongycastle/math/raw/Nat224;->subFrom([I[I)I

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
    const/4 v2, 0x7

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
    sget-object v0, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->P:[I

    .line 14
    .line 15
    invoke-static {p0, v0, p1}, Lorg/spongycastle/math/raw/Nat224;->add([I[I[I)I

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
    invoke-static {}, Lorg/spongycastle/math/raw/Nat224;->createExt()[I

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p0, p1, v0}, Lorg/spongycastle/math/raw/Nat224;->mul([I[I[I)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, p2}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->reduce([I[I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static multiplyAddToExt([I[I[I)V
    .locals 1

    .line 1
    invoke-static {p0, p1, p2}, Lorg/spongycastle/math/raw/Nat224;->mulAddTo([I[I[I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/16 p1, 0xe

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/16 p0, 0xd

    .line 10
    .line 11
    aget p0, p2, p0

    .line 12
    .line 13
    const/4 v0, -0x1

    .line 14
    if-ne p0, v0, :cond_1

    .line 15
    .line 16
    sget-object p0, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->PExt:[I

    .line 17
    .line 18
    invoke-static {p1, p2, p0}, Lorg/spongycastle/math/raw/Nat;->gte(I[I[I)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    :cond_0
    sget-object p0, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->PExtInv:[I

    .line 25
    .line 26
    array-length v0, p0

    .line 27
    invoke-static {v0, p0, p2}, Lorg/spongycastle/math/raw/Nat;->addTo(I[I[I)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    array-length p0, p0

    .line 34
    invoke-static {p1, p2, p0}, Lorg/spongycastle/math/raw/Nat;->incAt(I[II)I

    .line 35
    .line 36
    .line 37
    :cond_1
    return-void
.end method

.method public static negate([I[I)V
    .locals 1

    .line 1
    invoke-static {p0}, Lorg/spongycastle/math/raw/Nat224;->isZero([I)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p1}, Lorg/spongycastle/math/raw/Nat224;->zero([I)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    sget-object v0, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->P:[I

    .line 12
    .line 13
    invoke-static {v0, p0, p1}, Lorg/spongycastle/math/raw/Nat224;->sub([I[I[I)I

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static reduce([I[I)V
    .locals 34

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    const/16 v1, 0xa

    .line 4
    .line 5
    aget v1, p0, v1

    .line 6
    .line 7
    int-to-long v1, v1

    .line 8
    const-wide v3, 0xffffffffL

    .line 9
    .line 10
    .line 11
    .line 12
    .line 13
    and-long/2addr v1, v3

    .line 14
    const/16 v5, 0xb

    .line 15
    .line 16
    aget v5, p0, v5

    .line 17
    .line 18
    int-to-long v5, v5

    .line 19
    and-long/2addr v5, v3

    .line 20
    const/16 v7, 0xc

    .line 21
    .line 22
    aget v7, p0, v7

    .line 23
    .line 24
    int-to-long v7, v7

    .line 25
    and-long/2addr v7, v3

    .line 26
    const/16 v9, 0xd

    .line 27
    .line 28
    aget v9, p0, v9

    .line 29
    .line 30
    int-to-long v9, v9

    .line 31
    and-long/2addr v9, v3

    .line 32
    const/4 v11, 0x7

    .line 33
    aget v12, p0, v11

    .line 34
    .line 35
    int-to-long v12, v12

    .line 36
    and-long/2addr v12, v3

    .line 37
    add-long/2addr v12, v5

    .line 38
    const-wide/16 v14, 0x1

    .line 39
    .line 40
    sub-long/2addr v12, v14

    .line 41
    const/16 v16, 0x8

    .line 42
    .line 43
    move-wide/from16 v17, v3

    .line 44
    .line 45
    aget v3, p0, v16

    .line 46
    .line 47
    int-to-long v3, v3

    .line 48
    and-long v3, v3, v17

    .line 49
    .line 50
    add-long/2addr v3, v7

    .line 51
    const/16 v16, 0x9

    .line 52
    .line 53
    move-wide/from16 v19, v14

    .line 54
    .line 55
    aget v14, p0, v16

    .line 56
    .line 57
    int-to-long v14, v14

    .line 58
    and-long v14, v14, v17

    .line 59
    .line 60
    add-long/2addr v14, v9

    .line 61
    const/16 v16, 0x0

    .line 62
    .line 63
    aget v11, p0, v16

    .line 64
    .line 65
    move-wide/from16 v21, v1

    .line 66
    .line 67
    int-to-long v1, v11

    .line 68
    and-long v1, v1, v17

    .line 69
    .line 70
    sub-long/2addr v1, v12

    .line 71
    and-long v23, v1, v17

    .line 72
    .line 73
    const/16 v11, 0x20

    .line 74
    .line 75
    shr-long/2addr v1, v11

    .line 76
    const/16 v25, 0x1

    .line 77
    .line 78
    move/from16 v26, v11

    .line 79
    .line 80
    aget v11, p0, v25

    .line 81
    .line 82
    move-wide/from16 v27, v1

    .line 83
    .line 84
    int-to-long v1, v11

    .line 85
    and-long v1, v1, v17

    .line 86
    .line 87
    sub-long/2addr v1, v3

    .line 88
    add-long v1, v27, v1

    .line 89
    .line 90
    long-to-int v11, v1

    .line 91
    aput v11, v0, v25

    .line 92
    .line 93
    shr-long v1, v1, v26

    .line 94
    .line 95
    const/16 v27, 0x2

    .line 96
    .line 97
    move-wide/from16 v28, v1

    .line 98
    .line 99
    aget v1, p0, v27

    .line 100
    .line 101
    int-to-long v1, v1

    .line 102
    and-long v1, v1, v17

    .line 103
    .line 104
    sub-long/2addr v1, v14

    .line 105
    add-long v1, v28, v1

    .line 106
    .line 107
    move-wide/from16 v28, v3

    .line 108
    .line 109
    long-to-int v3, v1

    .line 110
    aput v3, v0, v27

    .line 111
    .line 112
    shr-long v1, v1, v26

    .line 113
    .line 114
    const/16 v30, 0x3

    .line 115
    .line 116
    aget v4, p0, v30

    .line 117
    .line 118
    move-wide/from16 v31, v1

    .line 119
    .line 120
    int-to-long v1, v4

    .line 121
    and-long v1, v1, v17

    .line 122
    .line 123
    add-long/2addr v1, v12

    .line 124
    sub-long v1, v1, v21

    .line 125
    .line 126
    add-long v1, v31, v1

    .line 127
    .line 128
    and-long v12, v1, v17

    .line 129
    .line 130
    shr-long v1, v1, v26

    .line 131
    .line 132
    const/16 v31, 0x4

    .line 133
    .line 134
    aget v4, p0, v31

    .line 135
    .line 136
    move-wide/from16 v32, v1

    .line 137
    .line 138
    int-to-long v1, v4

    .line 139
    and-long v1, v1, v17

    .line 140
    .line 141
    add-long v1, v1, v28

    .line 142
    .line 143
    sub-long/2addr v1, v5

    .line 144
    add-long v1, v32, v1

    .line 145
    .line 146
    long-to-int v4, v1

    .line 147
    aput v4, v0, v31

    .line 148
    .line 149
    shr-long v1, v1, v26

    .line 150
    .line 151
    const/4 v4, 0x5

    .line 152
    aget v5, p0, v4

    .line 153
    .line 154
    int-to-long v5, v5

    .line 155
    and-long v5, v5, v17

    .line 156
    .line 157
    add-long/2addr v5, v14

    .line 158
    sub-long/2addr v5, v7

    .line 159
    add-long/2addr v1, v5

    .line 160
    long-to-int v5, v1

    .line 161
    aput v5, v0, v4

    .line 162
    .line 163
    shr-long v1, v1, v26

    .line 164
    .line 165
    const/4 v4, 0x6

    .line 166
    aget v5, p0, v4

    .line 167
    .line 168
    int-to-long v5, v5

    .line 169
    and-long v5, v5, v17

    .line 170
    .line 171
    add-long v5, v5, v21

    .line 172
    .line 173
    sub-long/2addr v5, v9

    .line 174
    add-long/2addr v1, v5

    .line 175
    long-to-int v5, v1

    .line 176
    aput v5, v0, v4

    .line 177
    .line 178
    shr-long v1, v1, v26

    .line 179
    .line 180
    add-long v1, v1, v19

    .line 181
    .line 182
    add-long/2addr v12, v1

    .line 183
    sub-long v1, v23, v1

    .line 184
    .line 185
    long-to-int v5, v1

    .line 186
    aput v5, v0, v16

    .line 187
    .line 188
    shr-long v1, v1, v26

    .line 189
    .line 190
    const-wide/16 v5, 0x0

    .line 191
    .line 192
    cmp-long v7, v1, v5

    .line 193
    .line 194
    if-eqz v7, :cond_0

    .line 195
    .line 196
    int-to-long v7, v11

    .line 197
    and-long v7, v7, v17

    .line 198
    .line 199
    add-long/2addr v1, v7

    .line 200
    long-to-int v7, v1

    .line 201
    aput v7, v0, v25

    .line 202
    .line 203
    shr-long v1, v1, v26

    .line 204
    .line 205
    int-to-long v7, v3

    .line 206
    and-long v7, v7, v17

    .line 207
    .line 208
    add-long/2addr v1, v7

    .line 209
    long-to-int v3, v1

    .line 210
    aput v3, v0, v27

    .line 211
    .line 212
    shr-long v1, v1, v26

    .line 213
    .line 214
    add-long/2addr v12, v1

    .line 215
    :cond_0
    long-to-int v1, v12

    .line 216
    aput v1, v0, v30

    .line 217
    .line 218
    shr-long v1, v12, v26

    .line 219
    .line 220
    cmp-long v1, v1, v5

    .line 221
    .line 222
    if-eqz v1, :cond_1

    .line 223
    .line 224
    move/from16 v2, v31

    .line 225
    .line 226
    const/4 v1, 0x7

    .line 227
    invoke-static {v1, v0, v2}, Lorg/spongycastle/math/raw/Nat;->incAt(I[II)I

    .line 228
    .line 229
    .line 230
    move-result v1

    .line 231
    if-nez v1, :cond_2

    .line 232
    .line 233
    :cond_1
    aget v1, v0, v4

    .line 234
    .line 235
    const/4 v2, -0x1

    .line 236
    if-ne v1, v2, :cond_3

    .line 237
    .line 238
    sget-object v1, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->P:[I

    .line 239
    .line 240
    invoke-static {v0, v1}, Lorg/spongycastle/math/raw/Nat224;->gte([I[I)Z

    .line 241
    .line 242
    .line 243
    move-result v1

    .line 244
    if-eqz v1, :cond_3

    .line 245
    .line 246
    :cond_2
    invoke-static {v0}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->addPInvTo([I)V

    .line 247
    .line 248
    .line 249
    :cond_3
    return-void
.end method

.method public static reduce32(I[I)V
    .locals 11

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    int-to-long v2, p0

    .line 6
    const-wide v4, 0xffffffffL

    .line 7
    .line 8
    .line 9
    .line 10
    .line 11
    and-long/2addr v2, v4

    .line 12
    const/4 p0, 0x0

    .line 13
    aget v6, p1, p0

    .line 14
    .line 15
    int-to-long v6, v6

    .line 16
    and-long/2addr v6, v4

    .line 17
    sub-long/2addr v6, v2

    .line 18
    long-to-int v8, v6

    .line 19
    aput v8, p1, p0

    .line 20
    .line 21
    const/16 p0, 0x20

    .line 22
    .line 23
    shr-long/2addr v6, p0

    .line 24
    cmp-long v8, v6, v0

    .line 25
    .line 26
    if-eqz v8, :cond_0

    .line 27
    .line 28
    const/4 v8, 0x1

    .line 29
    aget v9, p1, v8

    .line 30
    .line 31
    int-to-long v9, v9

    .line 32
    and-long/2addr v9, v4

    .line 33
    add-long/2addr v6, v9

    .line 34
    long-to-int v9, v6

    .line 35
    aput v9, p1, v8

    .line 36
    .line 37
    shr-long/2addr v6, p0

    .line 38
    const/4 v8, 0x2

    .line 39
    aget v9, p1, v8

    .line 40
    .line 41
    int-to-long v9, v9

    .line 42
    and-long/2addr v9, v4

    .line 43
    add-long/2addr v6, v9

    .line 44
    long-to-int v9, v6

    .line 45
    aput v9, p1, v8

    .line 46
    .line 47
    shr-long/2addr v6, p0

    .line 48
    :cond_0
    const/4 v8, 0x3

    .line 49
    aget v9, p1, v8

    .line 50
    .line 51
    int-to-long v9, v9

    .line 52
    and-long/2addr v4, v9

    .line 53
    add-long/2addr v4, v2

    .line 54
    add-long/2addr v6, v4

    .line 55
    long-to-int v2, v6

    .line 56
    aput v2, p1, v8

    .line 57
    .line 58
    shr-long v2, v6, p0

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    move-wide v2, v0

    .line 62
    :goto_0
    cmp-long p0, v2, v0

    .line 63
    .line 64
    if-eqz p0, :cond_2

    .line 65
    .line 66
    const/4 p0, 0x7

    .line 67
    const/4 v0, 0x4

    .line 68
    invoke-static {p0, p1, v0}, Lorg/spongycastle/math/raw/Nat;->incAt(I[II)I

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    if-nez p0, :cond_3

    .line 73
    .line 74
    :cond_2
    const/4 p0, 0x6

    .line 75
    aget p0, p1, p0

    .line 76
    .line 77
    const/4 v0, -0x1

    .line 78
    if-ne p0, v0, :cond_4

    .line 79
    .line 80
    sget-object p0, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->P:[I

    .line 81
    .line 82
    invoke-static {p1, p0}, Lorg/spongycastle/math/raw/Nat224;->gte([I[I)Z

    .line 83
    .line 84
    .line 85
    move-result p0

    .line 86
    if-eqz p0, :cond_4

    .line 87
    .line 88
    :cond_3
    invoke-static {p1}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->addPInvTo([I)V

    .line 89
    .line 90
    .line 91
    :cond_4
    return-void
.end method

.method public static square([I[I)V
    .locals 1

    .line 1
    invoke-static {}, Lorg/spongycastle/math/raw/Nat224;->createExt()[I

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p0, v0}, Lorg/spongycastle/math/raw/Nat224;->square([I[I)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, p1}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->reduce([I[I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static squareN([II[I)V
    .locals 1

    .line 1
    invoke-static {}, Lorg/spongycastle/math/raw/Nat224;->createExt()[I

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p0, v0}, Lorg/spongycastle/math/raw/Nat224;->square([I[I)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, p2}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->reduce([I[I)V

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
    invoke-static {p2, v0}, Lorg/spongycastle/math/raw/Nat224;->square([I[I)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, p2}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->reduce([I[I)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    return-void
.end method

.method private static subPInvFrom([I)V
    .locals 12

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
    long-to-int v7, v1

    .line 15
    aput v7, p0, v0

    .line 16
    .line 17
    const/16 v0, 0x20

    .line 18
    .line 19
    shr-long/2addr v1, v0

    .line 20
    const-wide/16 v7, 0x0

    .line 21
    .line 22
    cmp-long v9, v1, v7

    .line 23
    .line 24
    if-eqz v9, :cond_0

    .line 25
    .line 26
    const/4 v9, 0x1

    .line 27
    aget v10, p0, v9

    .line 28
    .line 29
    int-to-long v10, v10

    .line 30
    and-long/2addr v10, v3

    .line 31
    add-long/2addr v1, v10

    .line 32
    long-to-int v10, v1

    .line 33
    aput v10, p0, v9

    .line 34
    .line 35
    shr-long/2addr v1, v0

    .line 36
    const/4 v9, 0x2

    .line 37
    aget v10, p0, v9

    .line 38
    .line 39
    int-to-long v10, v10

    .line 40
    and-long/2addr v10, v3

    .line 41
    add-long/2addr v1, v10

    .line 42
    long-to-int v10, v1

    .line 43
    aput v10, p0, v9

    .line 44
    .line 45
    shr-long/2addr v1, v0

    .line 46
    :cond_0
    const/4 v9, 0x3

    .line 47
    aget v10, p0, v9

    .line 48
    .line 49
    int-to-long v10, v10

    .line 50
    and-long/2addr v3, v10

    .line 51
    sub-long/2addr v3, v5

    .line 52
    add-long/2addr v1, v3

    .line 53
    long-to-int v3, v1

    .line 54
    aput v3, p0, v9

    .line 55
    .line 56
    shr-long v0, v1, v0

    .line 57
    .line 58
    cmp-long v0, v0, v7

    .line 59
    .line 60
    if-eqz v0, :cond_1

    .line 61
    .line 62
    const/4 v0, 0x7

    .line 63
    const/4 v1, 0x4

    .line 64
    invoke-static {v0, p0, v1}, Lorg/spongycastle/math/raw/Nat;->decAt(I[II)I

    .line 65
    .line 66
    .line 67
    :cond_1
    return-void
.end method

.method public static subtract([I[I[I)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lorg/spongycastle/math/raw/Nat224;->sub([I[I[I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {p2}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->subPInvFrom([I)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static subtractExt([I[I[I)V
    .locals 1

    .line 1
    const/16 v0, 0xe

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
    sget-object p0, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->PExtInv:[I

    .line 10
    .line 11
    array-length p1, p0

    .line 12
    invoke-static {p1, p0, p2}, Lorg/spongycastle/math/raw/Nat;->subFrom(I[I[I)I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    array-length p0, p0

    .line 19
    invoke-static {v0, p2, p0}, Lorg/spongycastle/math/raw/Nat;->decAt(I[II)I

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public static twice([I[I)V
    .locals 2

    .line 1
    const/4 v0, 0x7

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
    const/4 p0, 0x6

    .line 10
    aget p0, p1, p0

    .line 11
    .line 12
    const/4 v0, -0x1

    .line 13
    if-ne p0, v0, :cond_0

    .line 14
    .line 15
    sget-object p0, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->P:[I

    .line 16
    .line 17
    invoke-static {p1, p0}, Lorg/spongycastle/math/raw/Nat224;->gte([I[I)Z

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
    invoke-static {p1}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->addPInvTo([I)V

    .line 26
    .line 27
    .line 28
    return-void
.end method
