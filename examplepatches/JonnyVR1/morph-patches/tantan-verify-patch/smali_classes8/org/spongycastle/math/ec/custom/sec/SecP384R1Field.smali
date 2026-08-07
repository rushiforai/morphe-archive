.class public Lorg/spongycastle/math/ec/custom/sec/SecP384R1Field;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final M:J = 0xffffffffL

.field static final P:[I

.field private static final P11:I = -0x1

.field static final PExt:[I

.field private static final PExt23:I = -0x1

.field private static final PExtInv:[I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0xc

    .line 2
    .line 3
    new-array v0, v0, [I

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v0, Lorg/spongycastle/math/ec/custom/sec/SecP384R1Field;->P:[I

    .line 9
    .line 10
    const/16 v0, 0x18

    .line 11
    .line 12
    new-array v0, v0, [I

    .line 13
    .line 14
    fill-array-data v0, :array_1

    .line 15
    .line 16
    .line 17
    sput-object v0, Lorg/spongycastle/math/ec/custom/sec/SecP384R1Field;->PExt:[I

    .line 18
    .line 19
    const/16 v0, 0x11

    .line 20
    .line 21
    new-array v0, v0, [I

    .line 22
    .line 23
    fill-array-data v0, :array_2

    .line 24
    .line 25
    .line 26
    sput-object v0, Lorg/spongycastle/math/ec/custom/sec/SecP384R1Field;->PExtInv:[I

    .line 27
    .line 28
    return-void

    .line 29
    :array_0
    .array-data 4
        -0x1
        0x0
        0x0
        -0x1
        -0x2
        -0x1
        -0x1
        -0x1
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
    :array_1
    .array-data 4
        0x1
        -0x2
        0x0
        0x2
        0x0
        -0x2
        0x0
        0x2
        0x1
        0x0
        0x0
        0x0
        -0x2
        0x1
        0x0
        -0x2
        -0x3
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
    .end array-data

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
        0x1
        -0x1
        -0x3
        -0x1
        0x1
        -0x1
        -0x3
        -0x2
        -0x1
        -0x1
        -0x1
        0x1
        -0x2
        -0x1
        0x1
        0x2
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
    .locals 1

    .line 1
    const/16 v0, 0xc

    .line 2
    .line 3
    invoke-static {v0, p0, p1, p2}, Lorg/spongycastle/math/raw/Nat;->add(I[I[I[I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_1

    .line 8
    .line 9
    const/16 p0, 0xb

    .line 10
    .line 11
    aget p0, p2, p0

    .line 12
    .line 13
    const/4 p1, -0x1

    .line 14
    if-ne p0, p1, :cond_0

    .line 15
    .line 16
    sget-object p0, Lorg/spongycastle/math/ec/custom/sec/SecP384R1Field;->P:[I

    .line 17
    .line 18
    invoke-static {v0, p2, p0}, Lorg/spongycastle/math/raw/Nat;->gte(I[I[I)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-void

    .line 26
    :cond_1
    :goto_0
    invoke-static {p2}, Lorg/spongycastle/math/ec/custom/sec/SecP384R1Field;->addPInvTo([I)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public static addExt([I[I[I)V
    .locals 1

    .line 1
    const/16 v0, 0x18

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
    const/16 p0, 0x17

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
    sget-object p0, Lorg/spongycastle/math/ec/custom/sec/SecP384R1Field;->PExt:[I

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
    sget-object p0, Lorg/spongycastle/math/ec/custom/sec/SecP384R1Field;->PExtInv:[I

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
    .locals 2

    .line 1
    const/16 v0, 0xc

    .line 2
    .line 3
    invoke-static {v0, p0, p1}, Lorg/spongycastle/math/raw/Nat;->inc(I[I[I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_1

    .line 8
    .line 9
    const/16 p0, 0xb

    .line 10
    .line 11
    aget p0, p1, p0

    .line 12
    .line 13
    const/4 v1, -0x1

    .line 14
    if-ne p0, v1, :cond_0

    .line 15
    .line 16
    sget-object p0, Lorg/spongycastle/math/ec/custom/sec/SecP384R1Field;->P:[I

    .line 17
    .line 18
    invoke-static {v0, p1, p0}, Lorg/spongycastle/math/raw/Nat;->gte(I[I[I)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-void

    .line 26
    :cond_1
    :goto_0
    invoke-static {p1}, Lorg/spongycastle/math/ec/custom/sec/SecP384R1Field;->addPInvTo([I)V

    .line 27
    .line 28
    .line 29
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
    const/4 v7, 0x1

    .line 21
    aget v8, p0, v7

    .line 22
    .line 23
    int-to-long v8, v8

    .line 24
    and-long/2addr v8, v3

    .line 25
    sub-long/2addr v8, v5

    .line 26
    add-long/2addr v1, v8

    .line 27
    long-to-int v8, v1

    .line 28
    aput v8, p0, v7

    .line 29
    .line 30
    shr-long/2addr v1, v0

    .line 31
    const-wide/16 v7, 0x0

    .line 32
    .line 33
    cmp-long v9, v1, v7

    .line 34
    .line 35
    if-eqz v9, :cond_0

    .line 36
    .line 37
    const/4 v9, 0x2

    .line 38
    aget v10, p0, v9

    .line 39
    .line 40
    int-to-long v10, v10

    .line 41
    and-long/2addr v10, v3

    .line 42
    add-long/2addr v1, v10

    .line 43
    long-to-int v10, v1

    .line 44
    aput v10, p0, v9

    .line 45
    .line 46
    shr-long/2addr v1, v0

    .line 47
    :cond_0
    const/4 v9, 0x3

    .line 48
    aget v10, p0, v9

    .line 49
    .line 50
    int-to-long v10, v10

    .line 51
    and-long/2addr v10, v3

    .line 52
    add-long/2addr v10, v5

    .line 53
    add-long/2addr v1, v10

    .line 54
    long-to-int v10, v1

    .line 55
    aput v10, p0, v9

    .line 56
    .line 57
    shr-long/2addr v1, v0

    .line 58
    const/4 v9, 0x4

    .line 59
    aget v10, p0, v9

    .line 60
    .line 61
    int-to-long v10, v10

    .line 62
    and-long/2addr v3, v10

    .line 63
    add-long/2addr v3, v5

    .line 64
    add-long/2addr v1, v3

    .line 65
    long-to-int v3, v1

    .line 66
    aput v3, p0, v9

    .line 67
    .line 68
    shr-long v0, v1, v0

    .line 69
    .line 70
    cmp-long v0, v0, v7

    .line 71
    .line 72
    if-eqz v0, :cond_1

    .line 73
    .line 74
    const/16 v0, 0xc

    .line 75
    .line 76
    const/4 v1, 0x5

    .line 77
    invoke-static {v0, p0, v1}, Lorg/spongycastle/math/raw/Nat;->incAt(I[II)I

    .line 78
    .line 79
    .line 80
    :cond_1
    return-void
.end method

.method public static fromBigInteger(Ljava/math/BigInteger;)[I
    .locals 3

    .line 1
    const/16 v0, 0x180

    .line 2
    .line 3
    invoke-static {v0, p0}, Lorg/spongycastle/math/raw/Nat;->fromBigInteger(ILjava/math/BigInteger;)[I

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/16 v0, 0xb

    .line 8
    .line 9
    aget v0, p0, v0

    .line 10
    .line 11
    const/4 v1, -0x1

    .line 12
    if-ne v0, v1, :cond_0

    .line 13
    .line 14
    sget-object v0, Lorg/spongycastle/math/ec/custom/sec/SecP384R1Field;->P:[I

    .line 15
    .line 16
    const/16 v1, 0xc

    .line 17
    .line 18
    invoke-static {v1, p0, v0}, Lorg/spongycastle/math/raw/Nat;->gte(I[I[I)Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-eqz v2, :cond_0

    .line 23
    .line 24
    invoke-static {v1, v0, p0}, Lorg/spongycastle/math/raw/Nat;->subFrom(I[I[I)I

    .line 25
    .line 26
    .line 27
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
    const/16 v2, 0xc

    .line 7
    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    invoke-static {v2, p0, v0, p1}, Lorg/spongycastle/math/raw/Nat;->shiftDownBit(I[II[I)I

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    sget-object v0, Lorg/spongycastle/math/ec/custom/sec/SecP384R1Field;->P:[I

    .line 15
    .line 16
    invoke-static {v2, p0, v0, p1}, Lorg/spongycastle/math/raw/Nat;->add(I[I[I[I)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    invoke-static {v2, p1, p0}, Lorg/spongycastle/math/raw/Nat;->shiftDownBit(I[II)I

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static multiply([I[I[I)V
    .locals 1

    .line 1
    const/16 v0, 0x18

    .line 2
    .line 3
    invoke-static {v0}, Lorg/spongycastle/math/raw/Nat;->create(I)[I

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p0, p1, v0}, Lorg/spongycastle/math/raw/Nat384;->mul([I[I[I)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, p2}, Lorg/spongycastle/math/ec/custom/sec/SecP384R1Field;->reduce([I[I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static negate([I[I)V
    .locals 2

    .line 1
    const/16 v0, 0xc

    .line 2
    .line 3
    invoke-static {v0, p0}, Lorg/spongycastle/math/raw/Nat;->isZero(I[I)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-static {v0, p1}, Lorg/spongycastle/math/raw/Nat;->zero(I[I)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    sget-object v1, Lorg/spongycastle/math/ec/custom/sec/SecP384R1Field;->P:[I

    .line 14
    .line 15
    invoke-static {v0, v1, p0, p1}, Lorg/spongycastle/math/raw/Nat;->sub(I[I[I[I)I

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static reduce([I[I)V
    .locals 40

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    const/16 v1, 0x10

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
    const/16 v5, 0x11

    .line 15
    .line 16
    aget v5, p0, v5

    .line 17
    .line 18
    int-to-long v5, v5

    .line 19
    and-long/2addr v5, v3

    .line 20
    const/16 v7, 0x12

    .line 21
    .line 22
    aget v7, p0, v7

    .line 23
    .line 24
    int-to-long v7, v7

    .line 25
    and-long/2addr v7, v3

    .line 26
    const/16 v9, 0x13

    .line 27
    .line 28
    aget v9, p0, v9

    .line 29
    .line 30
    int-to-long v9, v9

    .line 31
    and-long/2addr v9, v3

    .line 32
    const/16 v11, 0x14

    .line 33
    .line 34
    aget v11, p0, v11

    .line 35
    .line 36
    int-to-long v11, v11

    .line 37
    and-long/2addr v11, v3

    .line 38
    const/16 v13, 0x15

    .line 39
    .line 40
    aget v13, p0, v13

    .line 41
    .line 42
    int-to-long v13, v13

    .line 43
    and-long/2addr v13, v3

    .line 44
    const/16 v15, 0x16

    .line 45
    .line 46
    aget v15, p0, v15

    .line 47
    .line 48
    move-wide/from16 v16, v3

    .line 49
    .line 50
    int-to-long v3, v15

    .line 51
    and-long v3, v3, v16

    .line 52
    .line 53
    const/16 v15, 0x17

    .line 54
    .line 55
    aget v15, p0, v15

    .line 56
    .line 57
    move-wide/from16 v18, v1

    .line 58
    .line 59
    int-to-long v1, v15

    .line 60
    and-long v1, v1, v16

    .line 61
    .line 62
    const/16 v15, 0xc

    .line 63
    .line 64
    aget v15, p0, v15

    .line 65
    .line 66
    move-wide/from16 v20, v1

    .line 67
    .line 68
    int-to-long v1, v15

    .line 69
    and-long v1, v1, v16

    .line 70
    .line 71
    add-long/2addr v1, v11

    .line 72
    const-wide/16 v22, 0x1

    .line 73
    .line 74
    sub-long v1, v1, v22

    .line 75
    .line 76
    const/16 v15, 0xd

    .line 77
    .line 78
    aget v15, p0, v15

    .line 79
    .line 80
    move-wide/from16 v24, v1

    .line 81
    .line 82
    int-to-long v1, v15

    .line 83
    and-long v1, v1, v16

    .line 84
    .line 85
    add-long/2addr v1, v3

    .line 86
    const/16 v15, 0xe

    .line 87
    .line 88
    aget v15, p0, v15

    .line 89
    .line 90
    move-wide/from16 v26, v1

    .line 91
    .line 92
    int-to-long v1, v15

    .line 93
    and-long v1, v1, v16

    .line 94
    .line 95
    add-long/2addr v1, v3

    .line 96
    add-long v1, v1, v20

    .line 97
    .line 98
    const/16 v15, 0xf

    .line 99
    .line 100
    aget v15, p0, v15

    .line 101
    .line 102
    move-wide/from16 v28, v1

    .line 103
    .line 104
    int-to-long v1, v15

    .line 105
    and-long v1, v1, v16

    .line 106
    .line 107
    add-long v1, v1, v20

    .line 108
    .line 109
    add-long v30, v5, v13

    .line 110
    .line 111
    sub-long v32, v13, v20

    .line 112
    .line 113
    sub-long v3, v3, v20

    .line 114
    .line 115
    const/16 v34, 0x0

    .line 116
    .line 117
    aget v15, p0, v34

    .line 118
    .line 119
    move-wide/from16 v35, v1

    .line 120
    .line 121
    int-to-long v1, v15

    .line 122
    and-long v1, v1, v16

    .line 123
    .line 124
    add-long v1, v1, v24

    .line 125
    .line 126
    add-long v1, v1, v32

    .line 127
    .line 128
    long-to-int v15, v1

    .line 129
    aput v15, v0, v34

    .line 130
    .line 131
    const/16 v15, 0x20

    .line 132
    .line 133
    shr-long/2addr v1, v15

    .line 134
    const/16 v34, 0x1

    .line 135
    .line 136
    move/from16 v37, v15

    .line 137
    .line 138
    aget v15, p0, v34

    .line 139
    .line 140
    move-wide/from16 v38, v1

    .line 141
    .line 142
    int-to-long v1, v15

    .line 143
    and-long v1, v1, v16

    .line 144
    .line 145
    add-long v1, v1, v20

    .line 146
    .line 147
    sub-long v1, v1, v24

    .line 148
    .line 149
    add-long v1, v1, v26

    .line 150
    .line 151
    add-long v1, v38, v1

    .line 152
    .line 153
    long-to-int v15, v1

    .line 154
    aput v15, v0, v34

    .line 155
    .line 156
    shr-long v1, v1, v37

    .line 157
    .line 158
    const/16 v20, 0x2

    .line 159
    .line 160
    aget v15, p0, v20

    .line 161
    .line 162
    move-wide/from16 v38, v1

    .line 163
    .line 164
    int-to-long v1, v15

    .line 165
    and-long v1, v1, v16

    .line 166
    .line 167
    sub-long/2addr v1, v13

    .line 168
    sub-long v1, v1, v26

    .line 169
    .line 170
    add-long v1, v1, v28

    .line 171
    .line 172
    add-long v1, v38, v1

    .line 173
    .line 174
    long-to-int v15, v1

    .line 175
    aput v15, v0, v20

    .line 176
    .line 177
    shr-long v1, v1, v37

    .line 178
    .line 179
    const/16 v20, 0x3

    .line 180
    .line 181
    aget v15, p0, v20

    .line 182
    .line 183
    move-wide/from16 v38, v1

    .line 184
    .line 185
    int-to-long v1, v15

    .line 186
    and-long v1, v1, v16

    .line 187
    .line 188
    add-long v1, v1, v24

    .line 189
    .line 190
    sub-long v1, v1, v28

    .line 191
    .line 192
    add-long v1, v1, v35

    .line 193
    .line 194
    add-long v1, v1, v32

    .line 195
    .line 196
    add-long v1, v38, v1

    .line 197
    .line 198
    long-to-int v15, v1

    .line 199
    aput v15, v0, v20

    .line 200
    .line 201
    shr-long v1, v1, v37

    .line 202
    .line 203
    const/16 v20, 0x4

    .line 204
    .line 205
    aget v15, p0, v20

    .line 206
    .line 207
    move-wide/from16 v38, v1

    .line 208
    .line 209
    int-to-long v1, v15

    .line 210
    and-long v1, v1, v16

    .line 211
    .line 212
    add-long v1, v1, v18

    .line 213
    .line 214
    add-long/2addr v1, v13

    .line 215
    add-long v1, v1, v24

    .line 216
    .line 217
    add-long v1, v1, v26

    .line 218
    .line 219
    sub-long v1, v1, v35

    .line 220
    .line 221
    add-long v1, v1, v32

    .line 222
    .line 223
    add-long v1, v38, v1

    .line 224
    .line 225
    long-to-int v13, v1

    .line 226
    aput v13, v0, v20

    .line 227
    .line 228
    shr-long v1, v1, v37

    .line 229
    .line 230
    const/4 v13, 0x5

    .line 231
    aget v14, p0, v13

    .line 232
    .line 233
    int-to-long v14, v14

    .line 234
    and-long v14, v14, v16

    .line 235
    .line 236
    sub-long v14, v14, v18

    .line 237
    .line 238
    add-long v14, v14, v26

    .line 239
    .line 240
    add-long v14, v14, v28

    .line 241
    .line 242
    add-long v14, v14, v30

    .line 243
    .line 244
    add-long/2addr v1, v14

    .line 245
    long-to-int v14, v1

    .line 246
    aput v14, v0, v13

    .line 247
    .line 248
    shr-long v1, v1, v37

    .line 249
    .line 250
    const/4 v13, 0x6

    .line 251
    aget v14, p0, v13

    .line 252
    .line 253
    int-to-long v14, v14

    .line 254
    and-long v14, v14, v16

    .line 255
    .line 256
    add-long/2addr v14, v7

    .line 257
    sub-long/2addr v14, v5

    .line 258
    add-long v14, v14, v28

    .line 259
    .line 260
    add-long v14, v14, v35

    .line 261
    .line 262
    add-long/2addr v1, v14

    .line 263
    long-to-int v14, v1

    .line 264
    aput v14, v0, v13

    .line 265
    .line 266
    shr-long v1, v1, v37

    .line 267
    .line 268
    const/4 v13, 0x7

    .line 269
    aget v14, p0, v13

    .line 270
    .line 271
    int-to-long v14, v14

    .line 272
    and-long v14, v14, v16

    .line 273
    .line 274
    add-long v14, v14, v18

    .line 275
    .line 276
    add-long/2addr v14, v9

    .line 277
    sub-long/2addr v14, v7

    .line 278
    add-long v14, v14, v35

    .line 279
    .line 280
    add-long/2addr v1, v14

    .line 281
    long-to-int v14, v1

    .line 282
    aput v14, v0, v13

    .line 283
    .line 284
    shr-long v1, v1, v37

    .line 285
    .line 286
    const/16 v13, 0x8

    .line 287
    .line 288
    aget v14, p0, v13

    .line 289
    .line 290
    int-to-long v14, v14

    .line 291
    and-long v14, v14, v16

    .line 292
    .line 293
    add-long v14, v14, v18

    .line 294
    .line 295
    add-long/2addr v14, v5

    .line 296
    add-long/2addr v14, v11

    .line 297
    sub-long/2addr v14, v9

    .line 298
    add-long/2addr v1, v14

    .line 299
    long-to-int v5, v1

    .line 300
    aput v5, v0, v13

    .line 301
    .line 302
    shr-long v1, v1, v37

    .line 303
    .line 304
    const/16 v5, 0x9

    .line 305
    .line 306
    aget v6, p0, v5

    .line 307
    .line 308
    int-to-long v13, v6

    .line 309
    and-long v13, v13, v16

    .line 310
    .line 311
    add-long/2addr v13, v7

    .line 312
    sub-long/2addr v13, v11

    .line 313
    add-long v13, v13, v30

    .line 314
    .line 315
    add-long/2addr v1, v13

    .line 316
    long-to-int v6, v1

    .line 317
    aput v6, v0, v5

    .line 318
    .line 319
    shr-long v1, v1, v37

    .line 320
    .line 321
    const/16 v5, 0xa

    .line 322
    .line 323
    aget v6, p0, v5

    .line 324
    .line 325
    int-to-long v13, v6

    .line 326
    and-long v13, v13, v16

    .line 327
    .line 328
    add-long/2addr v13, v7

    .line 329
    add-long/2addr v13, v9

    .line 330
    sub-long v13, v13, v32

    .line 331
    .line 332
    add-long/2addr v13, v3

    .line 333
    add-long/2addr v1, v13

    .line 334
    long-to-int v6, v1

    .line 335
    aput v6, v0, v5

    .line 336
    .line 337
    shr-long v1, v1, v37

    .line 338
    .line 339
    const/16 v5, 0xb

    .line 340
    .line 341
    aget v6, p0, v5

    .line 342
    .line 343
    int-to-long v6, v6

    .line 344
    and-long v6, v6, v16

    .line 345
    .line 346
    add-long/2addr v6, v9

    .line 347
    add-long/2addr v6, v11

    .line 348
    sub-long/2addr v6, v3

    .line 349
    add-long/2addr v1, v6

    .line 350
    long-to-int v3, v1

    .line 351
    aput v3, v0, v5

    .line 352
    .line 353
    shr-long v1, v1, v37

    .line 354
    .line 355
    add-long v1, v1, v22

    .line 356
    .line 357
    long-to-int v1, v1

    .line 358
    invoke-static {v1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecP384R1Field;->reduce32(I[I)V

    .line 359
    .line 360
    .line 361
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
    add-long/2addr v6, v2

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
    const/4 v8, 0x1

    .line 25
    aget v9, p1, v8

    .line 26
    .line 27
    int-to-long v9, v9

    .line 28
    and-long/2addr v9, v4

    .line 29
    sub-long/2addr v9, v2

    .line 30
    add-long/2addr v6, v9

    .line 31
    long-to-int v9, v6

    .line 32
    aput v9, p1, v8

    .line 33
    .line 34
    shr-long/2addr v6, p0

    .line 35
    cmp-long v8, v6, v0

    .line 36
    .line 37
    if-eqz v8, :cond_0

    .line 38
    .line 39
    const/4 v8, 0x2

    .line 40
    aget v9, p1, v8

    .line 41
    .line 42
    int-to-long v9, v9

    .line 43
    and-long/2addr v9, v4

    .line 44
    add-long/2addr v6, v9

    .line 45
    long-to-int v9, v6

    .line 46
    aput v9, p1, v8

    .line 47
    .line 48
    shr-long/2addr v6, p0

    .line 49
    :cond_0
    const/4 v8, 0x3

    .line 50
    aget v9, p1, v8

    .line 51
    .line 52
    int-to-long v9, v9

    .line 53
    and-long/2addr v9, v4

    .line 54
    add-long/2addr v9, v2

    .line 55
    add-long/2addr v6, v9

    .line 56
    long-to-int v9, v6

    .line 57
    aput v9, p1, v8

    .line 58
    .line 59
    shr-long/2addr v6, p0

    .line 60
    const/4 v8, 0x4

    .line 61
    aget v9, p1, v8

    .line 62
    .line 63
    int-to-long v9, v9

    .line 64
    and-long/2addr v4, v9

    .line 65
    add-long/2addr v4, v2

    .line 66
    add-long/2addr v6, v4

    .line 67
    long-to-int v2, v6

    .line 68
    aput v2, p1, v8

    .line 69
    .line 70
    shr-long v2, v6, p0

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_1
    move-wide v2, v0

    .line 74
    :goto_0
    cmp-long p0, v2, v0

    .line 75
    .line 76
    const/16 v0, 0xc

    .line 77
    .line 78
    if-eqz p0, :cond_2

    .line 79
    .line 80
    const/4 p0, 0x5

    .line 81
    invoke-static {v0, p1, p0}, Lorg/spongycastle/math/raw/Nat;->incAt(I[II)I

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    if-nez p0, :cond_3

    .line 86
    .line 87
    :cond_2
    const/16 p0, 0xb

    .line 88
    .line 89
    aget p0, p1, p0

    .line 90
    .line 91
    const/4 v1, -0x1

    .line 92
    if-ne p0, v1, :cond_4

    .line 93
    .line 94
    sget-object p0, Lorg/spongycastle/math/ec/custom/sec/SecP384R1Field;->P:[I

    .line 95
    .line 96
    invoke-static {v0, p1, p0}, Lorg/spongycastle/math/raw/Nat;->gte(I[I[I)Z

    .line 97
    .line 98
    .line 99
    move-result p0

    .line 100
    if-eqz p0, :cond_4

    .line 101
    .line 102
    :cond_3
    invoke-static {p1}, Lorg/spongycastle/math/ec/custom/sec/SecP384R1Field;->addPInvTo([I)V

    .line 103
    .line 104
    .line 105
    :cond_4
    return-void
.end method

.method public static square([I[I)V
    .locals 1

    .line 1
    const/16 v0, 0x18

    .line 2
    .line 3
    invoke-static {v0}, Lorg/spongycastle/math/raw/Nat;->create(I)[I

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p0, v0}, Lorg/spongycastle/math/raw/Nat384;->square([I[I)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, p1}, Lorg/spongycastle/math/ec/custom/sec/SecP384R1Field;->reduce([I[I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static squareN([II[I)V
    .locals 1

    .line 1
    const/16 v0, 0x18

    .line 2
    .line 3
    invoke-static {v0}, Lorg/spongycastle/math/raw/Nat;->create(I)[I

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p0, v0}, Lorg/spongycastle/math/raw/Nat384;->square([I[I)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, p2}, Lorg/spongycastle/math/ec/custom/sec/SecP384R1Field;->reduce([I[I)V

    .line 11
    .line 12
    .line 13
    :goto_0
    add-int/lit8 p1, p1, -0x1

    .line 14
    .line 15
    if-lez p1, :cond_0

    .line 16
    .line 17
    invoke-static {p2, v0}, Lorg/spongycastle/math/raw/Nat384;->square([I[I)V

    .line 18
    .line 19
    .line 20
    invoke-static {v0, p2}, Lorg/spongycastle/math/ec/custom/sec/SecP384R1Field;->reduce([I[I)V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
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
    const/4 v7, 0x1

    .line 21
    aget v8, p0, v7

    .line 22
    .line 23
    int-to-long v8, v8

    .line 24
    and-long/2addr v8, v3

    .line 25
    add-long/2addr v8, v5

    .line 26
    add-long/2addr v1, v8

    .line 27
    long-to-int v8, v1

    .line 28
    aput v8, p0, v7

    .line 29
    .line 30
    shr-long/2addr v1, v0

    .line 31
    const-wide/16 v7, 0x0

    .line 32
    .line 33
    cmp-long v9, v1, v7

    .line 34
    .line 35
    if-eqz v9, :cond_0

    .line 36
    .line 37
    const/4 v9, 0x2

    .line 38
    aget v10, p0, v9

    .line 39
    .line 40
    int-to-long v10, v10

    .line 41
    and-long/2addr v10, v3

    .line 42
    add-long/2addr v1, v10

    .line 43
    long-to-int v10, v1

    .line 44
    aput v10, p0, v9

    .line 45
    .line 46
    shr-long/2addr v1, v0

    .line 47
    :cond_0
    const/4 v9, 0x3

    .line 48
    aget v10, p0, v9

    .line 49
    .line 50
    int-to-long v10, v10

    .line 51
    and-long/2addr v10, v3

    .line 52
    sub-long/2addr v10, v5

    .line 53
    add-long/2addr v1, v10

    .line 54
    long-to-int v10, v1

    .line 55
    aput v10, p0, v9

    .line 56
    .line 57
    shr-long/2addr v1, v0

    .line 58
    const/4 v9, 0x4

    .line 59
    aget v10, p0, v9

    .line 60
    .line 61
    int-to-long v10, v10

    .line 62
    and-long/2addr v3, v10

    .line 63
    sub-long/2addr v3, v5

    .line 64
    add-long/2addr v1, v3

    .line 65
    long-to-int v3, v1

    .line 66
    aput v3, p0, v9

    .line 67
    .line 68
    shr-long v0, v1, v0

    .line 69
    .line 70
    cmp-long v0, v0, v7

    .line 71
    .line 72
    if-eqz v0, :cond_1

    .line 73
    .line 74
    const/16 v0, 0xc

    .line 75
    .line 76
    const/4 v1, 0x5

    .line 77
    invoke-static {v0, p0, v1}, Lorg/spongycastle/math/raw/Nat;->decAt(I[II)I

    .line 78
    .line 79
    .line 80
    :cond_1
    return-void
.end method

.method public static subtract([I[I[I)V
    .locals 1

    .line 1
    const/16 v0, 0xc

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
    invoke-static {p2}, Lorg/spongycastle/math/ec/custom/sec/SecP384R1Field;->subPInvFrom([I)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public static subtractExt([I[I[I)V
    .locals 1

    .line 1
    const/16 v0, 0x18

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
    sget-object p0, Lorg/spongycastle/math/ec/custom/sec/SecP384R1Field;->PExtInv:[I

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
    const/4 v0, 0x0

    .line 2
    const/16 v1, 0xc

    .line 3
    .line 4
    invoke-static {v1, p0, v0, p1}, Lorg/spongycastle/math/raw/Nat;->shiftUpBit(I[II[I)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-nez p0, :cond_1

    .line 9
    .line 10
    const/16 p0, 0xb

    .line 11
    .line 12
    aget p0, p1, p0

    .line 13
    .line 14
    const/4 v0, -0x1

    .line 15
    if-ne p0, v0, :cond_0

    .line 16
    .line 17
    sget-object p0, Lorg/spongycastle/math/ec/custom/sec/SecP384R1Field;->P:[I

    .line 18
    .line 19
    invoke-static {v1, p1, p0}, Lorg/spongycastle/math/raw/Nat;->gte(I[I[I)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    return-void

    .line 27
    :cond_1
    :goto_0
    invoke-static {p1}, Lorg/spongycastle/math/ec/custom/sec/SecP384R1Field;->addPInvTo([I)V

    .line 28
    .line 29
    .line 30
    return-void
.end method
