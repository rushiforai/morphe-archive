.class public Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final bitMask:[I

.field private static final parity:[Z

.field private static rand:Ljava/util/Random;

.field private static final reverseRightMask:[I

.field private static final squaringTable:[S


# instance fields
.field private blocks:I

.field private len:I

.field private value:[I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/Random;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->rand:Ljava/util/Random;

    .line 7
    .line 8
    const/16 v0, 0x100

    .line 9
    .line 10
    new-array v1, v0, [Z

    .line 11
    .line 12
    fill-array-data v1, :array_0

    .line 13
    .line 14
    .line 15
    sput-object v1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->parity:[Z

    .line 16
    .line 17
    new-array v0, v0, [S

    .line 18
    .line 19
    fill-array-data v0, :array_1

    .line 20
    .line 21
    .line 22
    sput-object v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->squaringTable:[S

    .line 23
    .line 24
    const/16 v0, 0x21

    .line 25
    .line 26
    new-array v1, v0, [I

    .line 27
    .line 28
    fill-array-data v1, :array_2

    .line 29
    .line 30
    .line 31
    sput-object v1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->bitMask:[I

    .line 32
    .line 33
    new-array v0, v0, [I

    .line 34
    .line 35
    fill-array-data v0, :array_3

    .line 36
    .line 37
    .line 38
    sput-object v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->reverseRightMask:[I

    .line 39
    .line 40
    return-void

    .line 41
    :array_0
    .array-data 1
        0x0t
        0x1t
        0x1t
        0x0t
        0x1t
        0x0t
        0x0t
        0x1t
        0x1t
        0x0t
        0x0t
        0x1t
        0x0t
        0x1t
        0x1t
        0x0t
        0x1t
        0x0t
        0x0t
        0x1t
        0x0t
        0x1t
        0x1t
        0x0t
        0x0t
        0x1t
        0x1t
        0x0t
        0x1t
        0x0t
        0x0t
        0x1t
        0x1t
        0x0t
        0x0t
        0x1t
        0x0t
        0x1t
        0x1t
        0x0t
        0x0t
        0x1t
        0x1t
        0x0t
        0x1t
        0x0t
        0x0t
        0x1t
        0x0t
        0x1t
        0x1t
        0x0t
        0x1t
        0x0t
        0x0t
        0x1t
        0x1t
        0x0t
        0x0t
        0x1t
        0x0t
        0x1t
        0x1t
        0x0t
        0x1t
        0x0t
        0x0t
        0x1t
        0x0t
        0x1t
        0x1t
        0x0t
        0x0t
        0x1t
        0x1t
        0x0t
        0x1t
        0x0t
        0x0t
        0x1t
        0x0t
        0x1t
        0x1t
        0x0t
        0x1t
        0x0t
        0x0t
        0x1t
        0x1t
        0x0t
        0x0t
        0x1t
        0x0t
        0x1t
        0x1t
        0x0t
        0x0t
        0x1t
        0x1t
        0x0t
        0x1t
        0x0t
        0x0t
        0x1t
        0x1t
        0x0t
        0x0t
        0x1t
        0x0t
        0x1t
        0x1t
        0x0t
        0x1t
        0x0t
        0x0t
        0x1t
        0x0t
        0x1t
        0x1t
        0x0t
        0x0t
        0x1t
        0x1t
        0x0t
        0x1t
        0x0t
        0x0t
        0x1t
        0x1t
        0x0t
        0x0t
        0x1t
        0x0t
        0x1t
        0x1t
        0x0t
        0x0t
        0x1t
        0x1t
        0x0t
        0x1t
        0x0t
        0x0t
        0x1t
        0x0t
        0x1t
        0x1t
        0x0t
        0x1t
        0x0t
        0x0t
        0x1t
        0x1t
        0x0t
        0x0t
        0x1t
        0x0t
        0x1t
        0x1t
        0x0t
        0x0t
        0x1t
        0x1t
        0x0t
        0x1t
        0x0t
        0x0t
        0x1t
        0x1t
        0x0t
        0x0t
        0x1t
        0x0t
        0x1t
        0x1t
        0x0t
        0x1t
        0x0t
        0x0t
        0x1t
        0x0t
        0x1t
        0x1t
        0x0t
        0x0t
        0x1t
        0x1t
        0x0t
        0x1t
        0x0t
        0x0t
        0x1t
        0x0t
        0x1t
        0x1t
        0x0t
        0x1t
        0x0t
        0x0t
        0x1t
        0x1t
        0x0t
        0x0t
        0x1t
        0x0t
        0x1t
        0x1t
        0x0t
        0x1t
        0x0t
        0x0t
        0x1t
        0x0t
        0x1t
        0x1t
        0x0t
        0x0t
        0x1t
        0x1t
        0x0t
        0x1t
        0x0t
        0x0t
        0x1t
        0x1t
        0x0t
        0x0t
        0x1t
        0x0t
        0x1t
        0x1t
        0x0t
        0x0t
        0x1t
        0x1t
        0x0t
        0x1t
        0x0t
        0x0t
        0x1t
        0x0t
        0x1t
        0x1t
        0x0t
        0x1t
        0x0t
        0x0t
        0x1t
        0x1t
        0x0t
        0x0t
        0x1t
        0x0t
        0x1t
        0x1t
        0x0t
    .end array-data

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
    :array_1
    .array-data 2
        0x0s
        0x1s
        0x4s
        0x5s
        0x10s
        0x11s
        0x14s
        0x15s
        0x40s
        0x41s
        0x44s
        0x45s
        0x50s
        0x51s
        0x54s
        0x55s
        0x100s
        0x101s
        0x104s
        0x105s
        0x110s
        0x111s
        0x114s
        0x115s
        0x140s
        0x141s
        0x144s
        0x145s
        0x150s
        0x151s
        0x154s
        0x155s
        0x400s
        0x401s
        0x404s
        0x405s
        0x410s
        0x411s
        0x414s
        0x415s
        0x440s
        0x441s
        0x444s
        0x445s
        0x450s
        0x451s
        0x454s
        0x455s
        0x500s
        0x501s
        0x504s
        0x505s
        0x510s
        0x511s
        0x514s
        0x515s
        0x540s
        0x541s
        0x544s
        0x545s
        0x550s
        0x551s
        0x554s
        0x555s
        0x1000s
        0x1001s
        0x1004s
        0x1005s
        0x1010s
        0x1011s
        0x1014s
        0x1015s
        0x1040s
        0x1041s
        0x1044s
        0x1045s
        0x1050s
        0x1051s
        0x1054s
        0x1055s
        0x1100s
        0x1101s
        0x1104s
        0x1105s
        0x1110s
        0x1111s
        0x1114s
        0x1115s
        0x1140s
        0x1141s
        0x1144s
        0x1145s
        0x1150s
        0x1151s
        0x1154s
        0x1155s
        0x1400s
        0x1401s
        0x1404s
        0x1405s
        0x1410s
        0x1411s
        0x1414s
        0x1415s
        0x1440s
        0x1441s
        0x1444s
        0x1445s
        0x1450s
        0x1451s
        0x1454s
        0x1455s
        0x1500s
        0x1501s
        0x1504s
        0x1505s
        0x1510s
        0x1511s
        0x1514s
        0x1515s
        0x1540s
        0x1541s
        0x1544s
        0x1545s
        0x1550s
        0x1551s
        0x1554s
        0x1555s
        0x4000s
        0x4001s
        0x4004s
        0x4005s
        0x4010s
        0x4011s
        0x4014s
        0x4015s
        0x4040s
        0x4041s
        0x4044s
        0x4045s
        0x4050s
        0x4051s
        0x4054s
        0x4055s
        0x4100s
        0x4101s
        0x4104s
        0x4105s
        0x4110s
        0x4111s
        0x4114s
        0x4115s
        0x4140s
        0x4141s
        0x4144s
        0x4145s
        0x4150s
        0x4151s
        0x4154s
        0x4155s
        0x4400s
        0x4401s
        0x4404s
        0x4405s
        0x4410s
        0x4411s
        0x4414s
        0x4415s
        0x4440s
        0x4441s
        0x4444s
        0x4445s
        0x4450s
        0x4451s
        0x4454s
        0x4455s
        0x4500s
        0x4501s
        0x4504s
        0x4505s
        0x4510s
        0x4511s
        0x4514s
        0x4515s
        0x4540s
        0x4541s
        0x4544s
        0x4545s
        0x4550s
        0x4551s
        0x4554s
        0x4555s
        0x5000s
        0x5001s
        0x5004s
        0x5005s
        0x5010s
        0x5011s
        0x5014s
        0x5015s
        0x5040s
        0x5041s
        0x5044s
        0x5045s
        0x5050s
        0x5051s
        0x5054s
        0x5055s
        0x5100s
        0x5101s
        0x5104s
        0x5105s
        0x5110s
        0x5111s
        0x5114s
        0x5115s
        0x5140s
        0x5141s
        0x5144s
        0x5145s
        0x5150s
        0x5151s
        0x5154s
        0x5155s
        0x5400s
        0x5401s
        0x5404s
        0x5405s
        0x5410s
        0x5411s
        0x5414s
        0x5415s
        0x5440s
        0x5441s
        0x5444s
        0x5445s
        0x5450s
        0x5451s
        0x5454s
        0x5455s
        0x5500s
        0x5501s
        0x5504s
        0x5505s
        0x5510s
        0x5511s
        0x5514s
        0x5515s
        0x5540s
        0x5541s
        0x5544s
        0x5545s
        0x5550s
        0x5551s
        0x5554s
        0x5555s
    .end array-data

    :array_2
    .array-data 4
        0x1
        0x2
        0x4
        0x8
        0x10
        0x20
        0x40
        0x80
        0x100
        0x200
        0x400
        0x800
        0x1000
        0x2000
        0x4000
        0x8000
        0x10000
        0x20000
        0x40000
        0x80000
        0x100000
        0x200000
        0x400000
        0x800000
        0x1000000
        0x2000000
        0x4000000
        0x8000000
        0x10000000
        0x20000000
        0x40000000    # 2.0f
        -0x80000000
        0x0
    .end array-data

    :array_3
    .array-data 4
        0x0
        0x1
        0x3
        0x7
        0xf
        0x1f
        0x3f
        0x7f
        0xff
        0x1ff
        0x3ff
        0x7ff
        0xfff
        0x1fff
        0x3fff
        0x7fff
        0xffff
        0x1ffff
        0x3ffff
        0x7ffff
        0xfffff
        0x1fffff
        0x3fffff
        0x7fffff
        0xffffff
        0x1ffffff
        0x3ffffff
        0x7ffffff
        0xfffffff
        0x1fffffff
        0x3fffffff    # 1.9999999f
        0x7fffffff
        -0x1
    .end array-data
.end method

.method public constructor <init>(I)V
    .locals 2

    .line 199
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    if-ge p1, v0, :cond_0

    move p1, v0

    :cond_0
    add-int/lit8 v1, p1, -0x1

    shr-int/lit8 v1, v1, 0x5

    add-int/2addr v1, v0

    .line 200
    iput v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    .line 201
    new-array v0, v1, [I

    iput-object v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 202
    iput p1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;)V
    .locals 2

    .line 159
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    if-ge p1, v0, :cond_0

    move p1, v0

    :cond_0
    add-int/lit8 v1, p1, -0x1

    shr-int/lit8 v1, v1, 0x5

    add-int/2addr v1, v0

    .line 160
    iput v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    .line 161
    new-array v0, v1, [I

    iput-object v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 162
    iput p1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 163
    const-string p1, "ZERO"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 164
    invoke-virtual {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->assignZero()V

    return-void

    .line 165
    :cond_1
    const-string p1, "ONE"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 166
    invoke-virtual {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->assignOne()V

    return-void

    .line 167
    :cond_2
    const-string p1, "RANDOM"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 168
    invoke-virtual {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->randomize()V

    return-void

    .line 169
    :cond_3
    const-string p1, "X"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_4

    .line 170
    invoke-virtual {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->assignX()V

    return-void

    .line 171
    :cond_4
    const-string p1, "ALL"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_5

    .line 172
    invoke-virtual {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->assignAll()V

    return-void

    .line 173
    :cond_5
    const-string p0, "Error: GF2Polynomial was called using "

    const-string p1, " as value!"

    invoke-static {p0, p2, p1}, Ll/v1d0;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    const/4 p0, 0x0

    throw p0
.end method

.method public constructor <init>(ILjava/math/BigInteger;)V
    .locals 8

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    if-ge p1, v0, :cond_0

    .line 6
    .line 7
    move p1, v0

    .line 8
    :cond_0
    add-int/lit8 v1, p1, -0x1

    .line 9
    .line 10
    shr-int/lit8 v1, v1, 0x5

    .line 11
    .line 12
    add-int/2addr v1, v0

    .line 13
    iput v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    .line 14
    .line 15
    new-array v1, v1, [I

    .line 16
    .line 17
    iput-object v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 18
    .line 19
    iput p1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 20
    .line 21
    invoke-virtual {p2}, Ljava/math/BigInteger;->toByteArray()[B

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    const/4 p2, 0x0

    .line 26
    aget-byte v1, p1, p2

    .line 27
    .line 28
    if-nez v1, :cond_1

    .line 29
    .line 30
    array-length v1, p1

    .line 31
    sub-int/2addr v1, v0

    .line 32
    new-array v2, v1, [B

    .line 33
    .line 34
    invoke-static {p1, v0, v2, p2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 35
    .line 36
    .line 37
    move-object p1, v2

    .line 38
    :cond_1
    array-length v1, p1

    .line 39
    and-int/lit8 v1, v1, 0x3

    .line 40
    .line 41
    array-length v2, p1

    .line 42
    sub-int/2addr v2, v0

    .line 43
    shr-int/lit8 v2, v2, 0x2

    .line 44
    .line 45
    move v3, p2

    .line 46
    :goto_0
    if-ge v3, v1, :cond_2

    .line 47
    .line 48
    iget-object v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 49
    .line 50
    aget v5, v4, v2

    .line 51
    .line 52
    aget-byte v6, p1, v3

    .line 53
    .line 54
    and-int/lit16 v6, v6, 0xff

    .line 55
    .line 56
    add-int/lit8 v7, v1, -0x1

    .line 57
    .line 58
    sub-int/2addr v7, v3

    .line 59
    shl-int/lit8 v7, v7, 0x3

    .line 60
    .line 61
    shl-int/2addr v6, v7

    .line 62
    or-int/2addr v5, v6

    .line 63
    aput v5, v4, v2

    .line 64
    .line 65
    add-int/lit8 v3, v3, 0x1

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_2
    :goto_1
    array-length v1, p1

    .line 69
    add-int/lit8 v1, v1, -0x4

    .line 70
    .line 71
    shr-int/lit8 v1, v1, 0x2

    .line 72
    .line 73
    if-gt p2, v1, :cond_3

    .line 74
    .line 75
    array-length v1, p1

    .line 76
    sub-int/2addr v1, v0

    .line 77
    shl-int/lit8 v2, p2, 0x2

    .line 78
    .line 79
    sub-int/2addr v1, v2

    .line 80
    iget-object v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 81
    .line 82
    aget-byte v3, p1, v1

    .line 83
    .line 84
    and-int/lit16 v3, v3, 0xff

    .line 85
    .line 86
    aput v3, v2, p2

    .line 87
    .line 88
    add-int/lit8 v4, v1, -0x1

    .line 89
    .line 90
    aget-byte v4, p1, v4

    .line 91
    .line 92
    shl-int/lit8 v4, v4, 0x8

    .line 93
    .line 94
    const v5, 0xff00

    .line 95
    .line 96
    .line 97
    and-int/2addr v4, v5

    .line 98
    or-int/2addr v3, v4

    .line 99
    aput v3, v2, p2

    .line 100
    .line 101
    add-int/lit8 v4, v1, -0x2

    .line 102
    .line 103
    aget-byte v4, p1, v4

    .line 104
    .line 105
    shl-int/lit8 v4, v4, 0x10

    .line 106
    .line 107
    const/high16 v5, 0xff0000

    .line 108
    .line 109
    and-int/2addr v4, v5

    .line 110
    or-int/2addr v3, v4

    .line 111
    aput v3, v2, p2

    .line 112
    .line 113
    add-int/lit8 v1, v1, -0x3

    .line 114
    .line 115
    aget-byte v1, p1, v1

    .line 116
    .line 117
    shl-int/lit8 v1, v1, 0x18

    .line 118
    .line 119
    const/high16 v4, -0x1000000

    .line 120
    .line 121
    and-int/2addr v1, v4

    .line 122
    or-int/2addr v1, v3

    .line 123
    aput v1, v2, p2

    .line 124
    .line 125
    add-int/lit8 p2, p2, 0x1

    .line 126
    .line 127
    goto :goto_1

    .line 128
    :cond_3
    iget p1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 129
    .line 130
    and-int/lit8 p2, p1, 0x1f

    .line 131
    .line 132
    if-eqz p2, :cond_4

    .line 133
    .line 134
    iget-object p2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 135
    .line 136
    iget v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    .line 137
    .line 138
    sub-int/2addr v1, v0

    .line 139
    aget v0, p2, v1

    .line 140
    .line 141
    sget-object v2, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->reverseRightMask:[I

    .line 142
    .line 143
    and-int/lit8 p1, p1, 0x1f

    .line 144
    .line 145
    aget p1, v2, p1

    .line 146
    .line 147
    and-int/2addr p1, v0

    .line 148
    aput p1, p2, v1

    .line 149
    .line 150
    :cond_4
    invoke-virtual {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->reduceN()V

    .line 151
    .line 152
    .line 153
    return-void
.end method

.method public constructor <init>(ILjava/util/Random;)V
    .locals 2

    .line 154
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    if-ge p1, v0, :cond_0

    move p1, v0

    :cond_0
    add-int/lit8 v1, p1, -0x1

    shr-int/lit8 v1, v1, 0x5

    add-int/2addr v1, v0

    .line 155
    iput v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    .line 156
    new-array v0, v1, [I

    iput-object v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 157
    iput p1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 158
    invoke-virtual {p0, p2}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->randomize(Ljava/util/Random;)V

    return-void
.end method

.method public constructor <init>(I[B)V
    .locals 10

    .line 181
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    if-ge p1, v0, :cond_0

    move p1, v0

    :cond_0
    add-int/lit8 v1, p1, -0x1

    shr-int/lit8 v1, v1, 0x5

    add-int/2addr v1, v0

    .line 182
    iput v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    .line 183
    new-array v2, v1, [I

    iput-object v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 184
    iput p1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 185
    array-length p1, p2

    sub-int/2addr p1, v0

    const/4 v2, 0x2

    shr-int/2addr p1, v2

    add-int/2addr p1, v0

    invoke-static {p1, v1}, Ljava/lang/Math;->min(II)I

    move-result p1

    const/4 v1, 0x0

    :goto_0
    add-int/lit8 v3, p1, -0x1

    .line 186
    iget-object v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    const/high16 v5, -0x1000000

    const/high16 v6, 0xff0000

    const v7, 0xff00

    if-ge v1, v3, :cond_1

    .line 187
    array-length v3, p2

    shl-int/lit8 v8, v1, 0x2

    sub-int/2addr v3, v8

    add-int/lit8 v8, v3, -0x1

    .line 188
    aget-byte v8, p2, v8

    and-int/lit16 v8, v8, 0xff

    aput v8, v4, v1

    add-int/lit8 v9, v3, -0x2

    .line 189
    aget-byte v9, p2, v9

    shl-int/lit8 v9, v9, 0x8

    and-int/2addr v7, v9

    or-int/2addr v7, v8

    aput v7, v4, v1

    add-int/lit8 v8, v3, -0x3

    .line 190
    aget-byte v8, p2, v8

    shl-int/lit8 v8, v8, 0x10

    and-int/2addr v6, v8

    or-int/2addr v6, v7

    aput v6, v4, v1

    add-int/lit8 v3, v3, -0x4

    .line 191
    aget-byte v3, p2, v3

    shl-int/lit8 v3, v3, 0x18

    and-int/2addr v3, v5

    or-int/2addr v3, v6

    aput v3, v4, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 192
    :cond_1
    array-length p1, p2

    shl-int/lit8 v1, v3, 0x2

    sub-int/2addr p1, v1

    add-int/lit8 v1, p1, -0x1

    .line 193
    aget-byte v8, p2, v1

    and-int/lit16 v8, v8, 0xff

    aput v8, v4, v3

    if-lez v1, :cond_2

    add-int/lit8 v9, p1, -0x2

    .line 194
    aget-byte v9, p2, v9

    shl-int/lit8 v9, v9, 0x8

    and-int/2addr v7, v9

    or-int/2addr v7, v8

    aput v7, v4, v3

    :cond_2
    if-le v1, v0, :cond_3

    .line 195
    aget v0, v4, v3

    add-int/lit8 v7, p1, -0x3

    aget-byte v7, p2, v7

    shl-int/lit8 v7, v7, 0x10

    and-int/2addr v6, v7

    or-int/2addr v0, v6

    aput v0, v4, v3

    :cond_3
    if-le v1, v2, :cond_4

    .line 196
    aget v0, v4, v3

    add-int/lit8 p1, p1, -0x4

    aget-byte p1, p2, p1

    shl-int/lit8 p1, p1, 0x18

    and-int/2addr p1, v5

    or-int/2addr p1, v0

    aput p1, v4, v3

    .line 197
    :cond_4
    invoke-direct {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->zeroUnusedBits()V

    .line 198
    invoke-virtual {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->reduceN()V

    return-void
.end method

.method public constructor <init>(I[I)V
    .locals 2

    .line 174
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    if-ge p1, v0, :cond_0

    move p1, v0

    :cond_0
    add-int/lit8 v1, p1, -0x1

    shr-int/lit8 v1, v1, 0x5

    add-int/2addr v1, v0

    .line 175
    iput v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    .line 176
    new-array v0, v1, [I

    iput-object v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 177
    iput p1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 178
    array-length p1, p2

    invoke-static {v1, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    .line 179
    iget-object v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    const/4 v1, 0x0

    invoke-static {p2, v1, v0, v1, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 180
    invoke-direct {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->zeroUnusedBits()V

    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)V
    .locals 1

    .line 203
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 204
    iget v0, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    iput v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 205
    iget v0, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    iput v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    .line 206
    iget-object p1, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    invoke-static {p1}, Lorg/spongycastle/pqc/math/linearalgebra/IntUtils;->clone([I)[I

    move-result-object p1

    iput-object p1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    return-void
.end method

.method private doShiftBlocksLeft(I)V
    .locals 4

    .line 1
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    .line 2
    .line 3
    iget-object v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 4
    .line 5
    array-length v2, v1

    .line 6
    const/4 v3, 0x0

    .line 7
    if-gt v0, v2, :cond_2

    .line 8
    .line 9
    add-int/lit8 v0, v0, -0x1

    .line 10
    .line 11
    :goto_0
    if-lt v0, p1, :cond_0

    .line 12
    .line 13
    iget-object v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 14
    .line 15
    sub-int v2, v0, p1

    .line 16
    .line 17
    aget v2, v1, v2

    .line 18
    .line 19
    aput v2, v1, v0

    .line 20
    .line 21
    add-int/lit8 v0, v0, -0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    move v0, v3

    .line 25
    :goto_1
    if-ge v0, p1, :cond_1

    .line 26
    .line 27
    iget-object v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 28
    .line 29
    aput v3, v1, v0

    .line 30
    .line 31
    add-int/lit8 v0, v0, 0x1

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_1
    return-void

    .line 35
    :cond_2
    new-array v2, v0, [I

    .line 36
    .line 37
    sub-int/2addr v0, p1

    .line 38
    invoke-static {v1, v3, v2, p1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 39
    .line 40
    .line 41
    iput-object v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 42
    .line 43
    return-void
.end method

.method private karaMult(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;
    .locals 6

    .line 1
    new-instance v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 2
    .line 3
    iget v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 4
    .line 5
    shl-int/lit8 v1, v1, 0x1

    .line 6
    .line 7
    invoke-direct {v0, v1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;-><init>(I)V

    .line 8
    .line 9
    .line 10
    iget v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 11
    .line 12
    const/16 v2, 0x20

    .line 13
    .line 14
    if-gt v1, v2, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    aget p0, p0, v1

    .line 20
    .line 21
    iget-object p1, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 22
    .line 23
    aget p1, p1, v1

    .line 24
    .line 25
    invoke-static {p0, p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->mult32(II)[I

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    iput-object p0, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 30
    .line 31
    return-object v0

    .line 32
    :cond_0
    const/16 v2, 0x40

    .line 33
    .line 34
    if-gt v1, v2, :cond_1

    .line 35
    .line 36
    iget-object p0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 37
    .line 38
    iget-object p1, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 39
    .line 40
    invoke-static {p0, p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->mult64([I[I)[I

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    iput-object p0, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 45
    .line 46
    return-object v0

    .line 47
    :cond_1
    const/16 v2, 0x80

    .line 48
    .line 49
    if-gt v1, v2, :cond_2

    .line 50
    .line 51
    iget-object p0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 52
    .line 53
    iget-object p1, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 54
    .line 55
    invoke-static {p0, p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->mult128([I[I)[I

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    iput-object p0, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 60
    .line 61
    return-object v0

    .line 62
    :cond_2
    const/16 v2, 0x100

    .line 63
    .line 64
    if-gt v1, v2, :cond_3

    .line 65
    .line 66
    iget-object p0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 67
    .line 68
    iget-object p1, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 69
    .line 70
    invoke-static {p0, p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->mult256([I[I)[I

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    iput-object p0, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 75
    .line 76
    return-object v0

    .line 77
    :cond_3
    const/16 v2, 0x200

    .line 78
    .line 79
    if-gt v1, v2, :cond_4

    .line 80
    .line 81
    iget-object p0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 82
    .line 83
    iget-object p1, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 84
    .line 85
    invoke-static {p0, p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->mult512([I[I)[I

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    iput-object p0, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 90
    .line 91
    return-object v0

    .line 92
    :cond_4
    add-int/lit8 v1, v1, -0x1

    .line 93
    .line 94
    invoke-static {v1}, Lorg/spongycastle/pqc/math/linearalgebra/IntegerFunctions;->floorLog(I)I

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    sget-object v2, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->bitMask:[I

    .line 99
    .line 100
    aget v1, v2, v1

    .line 101
    .line 102
    add-int/lit8 v2, v1, -0x1

    .line 103
    .line 104
    shr-int/lit8 v2, v2, 0x5

    .line 105
    .line 106
    add-int/lit8 v2, v2, 0x1

    .line 107
    .line 108
    invoke-direct {p0, v2}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->lower(I)Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 109
    .line 110
    .line 111
    move-result-object v3

    .line 112
    invoke-direct {p0, v2}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->upper(I)Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    invoke-direct {p1, v2}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->lower(I)Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 117
    .line 118
    .line 119
    move-result-object v4

    .line 120
    invoke-direct {p1, v2}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->upper(I)Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    invoke-direct {p0, p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->karaMult(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    invoke-direct {v3, v4}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->karaMult(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 129
    .line 130
    .line 131
    move-result-object v5

    .line 132
    invoke-virtual {v3, p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->addToThis(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v4, p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->addToThis(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)V

    .line 136
    .line 137
    .line 138
    invoke-direct {v3, v4}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->karaMult(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    shl-int/lit8 p1, v1, 0x1

    .line 143
    .line 144
    invoke-virtual {v0, v2, p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->shiftLeftAddThis(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;I)V

    .line 145
    .line 146
    .line 147
    invoke-virtual {v0, v2, v1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->shiftLeftAddThis(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;I)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {v0, p0, v1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->shiftLeftAddThis(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;I)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {v0, v5, v1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->shiftLeftAddThis(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;I)V

    .line 154
    .line 155
    .line 156
    invoke-virtual {v0, v5}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->addToThis(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)V

    .line 157
    .line 158
    .line 159
    return-object v0
.end method

.method private lower(I)Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;
    .locals 3

    .line 1
    new-instance v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 2
    .line 3
    shl-int/lit8 v1, p1, 0x5

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;-><init>(I)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 9
    .line 10
    iget-object v2, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 11
    .line 12
    iget p0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    .line 13
    .line 14
    invoke-static {p1, p0}, Ljava/lang/Math;->min(II)I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    const/4 p1, 0x0

    .line 19
    invoke-static {v1, p1, v2, p1, p0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 20
    .line 21
    .line 22
    return-object v0
.end method

.method private static mult128([I[I)[I
    .locals 14

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    new-array v0, v0, [I

    .line 4
    .line 5
    const/4 v1, 0x2

    .line 6
    new-array v2, v1, [I

    .line 7
    .line 8
    array-length v3, p0

    .line 9
    invoke-static {v1, v3}, Ljava/lang/Math;->min(II)I

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    const/4 v4, 0x0

    .line 14
    invoke-static {p0, v4, v2, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 15
    .line 16
    .line 17
    new-array v3, v1, [I

    .line 18
    .line 19
    array-length v5, p0

    .line 20
    if-le v5, v1, :cond_0

    .line 21
    .line 22
    array-length v5, p0

    .line 23
    sub-int/2addr v5, v1

    .line 24
    invoke-static {v1, v5}, Ljava/lang/Math;->min(II)I

    .line 25
    .line 26
    .line 27
    move-result v5

    .line 28
    invoke-static {p0, v1, v3, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 29
    .line 30
    .line 31
    :cond_0
    new-array p0, v1, [I

    .line 32
    .line 33
    array-length v5, p1

    .line 34
    invoke-static {v1, v5}, Ljava/lang/Math;->min(II)I

    .line 35
    .line 36
    .line 37
    move-result v5

    .line 38
    invoke-static {p1, v4, p0, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 39
    .line 40
    .line 41
    new-array v5, v1, [I

    .line 42
    .line 43
    array-length v6, p1

    .line 44
    if-le v6, v1, :cond_1

    .line 45
    .line 46
    array-length v6, p1

    .line 47
    sub-int/2addr v6, v1

    .line 48
    invoke-static {v1, v6}, Ljava/lang/Math;->min(II)I

    .line 49
    .line 50
    .line 51
    move-result v6

    .line 52
    invoke-static {p1, v1, v5, v4, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 53
    .line 54
    .line 55
    :cond_1
    const/4 p1, 0x1

    .line 56
    aget v6, v3, p1

    .line 57
    .line 58
    const/4 v7, 0x4

    .line 59
    const/4 v8, 0x5

    .line 60
    const/4 v9, 0x3

    .line 61
    if-nez v6, :cond_3

    .line 62
    .line 63
    aget v6, v5, p1

    .line 64
    .line 65
    if-nez v6, :cond_3

    .line 66
    .line 67
    aget v6, v3, v4

    .line 68
    .line 69
    if-nez v6, :cond_2

    .line 70
    .line 71
    aget v10, v5, v4

    .line 72
    .line 73
    if-eqz v10, :cond_4

    .line 74
    .line 75
    :cond_2
    aget v10, v5, v4

    .line 76
    .line 77
    invoke-static {v6, v10}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->mult32(II)[I

    .line 78
    .line 79
    .line 80
    move-result-object v6

    .line 81
    aget v10, v0, v8

    .line 82
    .line 83
    aget v11, v6, p1

    .line 84
    .line 85
    xor-int/2addr v10, v11

    .line 86
    aput v10, v0, v8

    .line 87
    .line 88
    aget v10, v0, v7

    .line 89
    .line 90
    aget v6, v6, v4

    .line 91
    .line 92
    xor-int/2addr v10, v6

    .line 93
    aput v10, v0, v7

    .line 94
    .line 95
    aget v10, v0, v9

    .line 96
    .line 97
    xor-int/2addr v10, v11

    .line 98
    aput v10, v0, v9

    .line 99
    .line 100
    aget v10, v0, v1

    .line 101
    .line 102
    xor-int/2addr v6, v10

    .line 103
    aput v6, v0, v1

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_3
    invoke-static {v3, v5}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->mult64([I[I)[I

    .line 107
    .line 108
    .line 109
    move-result-object v6

    .line 110
    const/4 v10, 0x7

    .line 111
    aget v11, v0, v10

    .line 112
    .line 113
    aget v12, v6, v9

    .line 114
    .line 115
    xor-int/2addr v11, v12

    .line 116
    aput v11, v0, v10

    .line 117
    .line 118
    const/4 v10, 0x6

    .line 119
    aget v11, v0, v10

    .line 120
    .line 121
    aget v13, v6, v1

    .line 122
    .line 123
    xor-int/2addr v11, v13

    .line 124
    aput v11, v0, v10

    .line 125
    .line 126
    aget v10, v0, v8

    .line 127
    .line 128
    aget v11, v6, p1

    .line 129
    .line 130
    xor-int/2addr v12, v11

    .line 131
    xor-int/2addr v10, v12

    .line 132
    aput v10, v0, v8

    .line 133
    .line 134
    aget v10, v0, v7

    .line 135
    .line 136
    aget v6, v6, v4

    .line 137
    .line 138
    xor-int v12, v6, v13

    .line 139
    .line 140
    xor-int/2addr v10, v12

    .line 141
    aput v10, v0, v7

    .line 142
    .line 143
    aget v10, v0, v9

    .line 144
    .line 145
    xor-int/2addr v10, v11

    .line 146
    aput v10, v0, v9

    .line 147
    .line 148
    aget v10, v0, v1

    .line 149
    .line 150
    xor-int/2addr v6, v10

    .line 151
    aput v6, v0, v1

    .line 152
    .line 153
    :cond_4
    :goto_0
    aget v6, v3, v4

    .line 154
    .line 155
    aget v10, v2, v4

    .line 156
    .line 157
    xor-int/2addr v6, v10

    .line 158
    aput v6, v3, v4

    .line 159
    .line 160
    aget v6, v3, p1

    .line 161
    .line 162
    aget v10, v2, p1

    .line 163
    .line 164
    xor-int/2addr v6, v10

    .line 165
    aput v6, v3, p1

    .line 166
    .line 167
    aget v6, v5, v4

    .line 168
    .line 169
    aget v10, p0, v4

    .line 170
    .line 171
    xor-int/2addr v6, v10

    .line 172
    aput v6, v5, v4

    .line 173
    .line 174
    aget v10, v5, p1

    .line 175
    .line 176
    aget v11, p0, p1

    .line 177
    .line 178
    xor-int/2addr v10, v11

    .line 179
    aput v10, v5, p1

    .line 180
    .line 181
    aget v11, v3, p1

    .line 182
    .line 183
    if-nez v11, :cond_5

    .line 184
    .line 185
    if-nez v10, :cond_5

    .line 186
    .line 187
    aget v3, v3, v4

    .line 188
    .line 189
    invoke-static {v3, v6}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->mult32(II)[I

    .line 190
    .line 191
    .line 192
    move-result-object v3

    .line 193
    aget v5, v0, v9

    .line 194
    .line 195
    aget v6, v3, p1

    .line 196
    .line 197
    xor-int/2addr v5, v6

    .line 198
    aput v5, v0, v9

    .line 199
    .line 200
    aget v5, v0, v1

    .line 201
    .line 202
    aget v3, v3, v4

    .line 203
    .line 204
    xor-int/2addr v3, v5

    .line 205
    aput v3, v0, v1

    .line 206
    .line 207
    goto :goto_1

    .line 208
    :cond_5
    invoke-static {v3, v5}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->mult64([I[I)[I

    .line 209
    .line 210
    .line 211
    move-result-object v3

    .line 212
    aget v5, v0, v8

    .line 213
    .line 214
    aget v6, v3, v9

    .line 215
    .line 216
    xor-int/2addr v5, v6

    .line 217
    aput v5, v0, v8

    .line 218
    .line 219
    aget v5, v0, v7

    .line 220
    .line 221
    aget v6, v3, v1

    .line 222
    .line 223
    xor-int/2addr v5, v6

    .line 224
    aput v5, v0, v7

    .line 225
    .line 226
    aget v5, v0, v9

    .line 227
    .line 228
    aget v6, v3, p1

    .line 229
    .line 230
    xor-int/2addr v5, v6

    .line 231
    aput v5, v0, v9

    .line 232
    .line 233
    aget v5, v0, v1

    .line 234
    .line 235
    aget v3, v3, v4

    .line 236
    .line 237
    xor-int/2addr v3, v5

    .line 238
    aput v3, v0, v1

    .line 239
    .line 240
    :goto_1
    aget v3, v2, p1

    .line 241
    .line 242
    if-nez v3, :cond_6

    .line 243
    .line 244
    aget v3, p0, p1

    .line 245
    .line 246
    if-nez v3, :cond_6

    .line 247
    .line 248
    aget v2, v2, v4

    .line 249
    .line 250
    aget p0, p0, v4

    .line 251
    .line 252
    invoke-static {v2, p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->mult32(II)[I

    .line 253
    .line 254
    .line 255
    move-result-object p0

    .line 256
    aget v2, v0, v9

    .line 257
    .line 258
    aget v3, p0, p1

    .line 259
    .line 260
    xor-int/2addr v2, v3

    .line 261
    aput v2, v0, v9

    .line 262
    .line 263
    aget v2, v0, v1

    .line 264
    .line 265
    aget p0, p0, v4

    .line 266
    .line 267
    xor-int/2addr v2, p0

    .line 268
    aput v2, v0, v1

    .line 269
    .line 270
    aget v1, v0, p1

    .line 271
    .line 272
    xor-int/2addr v1, v3

    .line 273
    aput v1, v0, p1

    .line 274
    .line 275
    aget p1, v0, v4

    .line 276
    .line 277
    xor-int/2addr p0, p1

    .line 278
    aput p0, v0, v4

    .line 279
    .line 280
    return-object v0

    .line 281
    :cond_6
    invoke-static {v2, p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->mult64([I[I)[I

    .line 282
    .line 283
    .line 284
    move-result-object p0

    .line 285
    aget v2, v0, v8

    .line 286
    .line 287
    aget v3, p0, v9

    .line 288
    .line 289
    xor-int/2addr v2, v3

    .line 290
    aput v2, v0, v8

    .line 291
    .line 292
    aget v2, v0, v7

    .line 293
    .line 294
    aget v5, p0, v1

    .line 295
    .line 296
    xor-int/2addr v2, v5

    .line 297
    aput v2, v0, v7

    .line 298
    .line 299
    aget v2, v0, v9

    .line 300
    .line 301
    aget v6, p0, p1

    .line 302
    .line 303
    xor-int/2addr v3, v6

    .line 304
    xor-int/2addr v2, v3

    .line 305
    aput v2, v0, v9

    .line 306
    .line 307
    aget v2, v0, v1

    .line 308
    .line 309
    aget p0, p0, v4

    .line 310
    .line 311
    xor-int v3, p0, v5

    .line 312
    .line 313
    xor-int/2addr v2, v3

    .line 314
    aput v2, v0, v1

    .line 315
    .line 316
    aget v1, v0, p1

    .line 317
    .line 318
    xor-int/2addr v1, v6

    .line 319
    aput v1, v0, p1

    .line 320
    .line 321
    aget p1, v0, v4

    .line 322
    .line 323
    xor-int/2addr p0, p1

    .line 324
    aput p0, v0, v4

    .line 325
    .line 326
    return-object v0
.end method

.method private static mult256([I[I)[I
    .locals 23

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    const/16 v2, 0x10

    .line 6
    .line 7
    new-array v2, v2, [I

    .line 8
    .line 9
    const/4 v3, 0x4

    .line 10
    new-array v4, v3, [I

    .line 11
    .line 12
    array-length v5, v0

    .line 13
    invoke-static {v3, v5}, Ljava/lang/Math;->min(II)I

    .line 14
    .line 15
    .line 16
    move-result v5

    .line 17
    const/4 v6, 0x0

    .line 18
    invoke-static {v0, v6, v4, v6, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 19
    .line 20
    .line 21
    new-array v5, v3, [I

    .line 22
    .line 23
    array-length v7, v0

    .line 24
    if-le v7, v3, :cond_0

    .line 25
    .line 26
    array-length v7, v0

    .line 27
    sub-int/2addr v7, v3

    .line 28
    invoke-static {v3, v7}, Ljava/lang/Math;->min(II)I

    .line 29
    .line 30
    .line 31
    move-result v7

    .line 32
    invoke-static {v0, v3, v5, v6, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 33
    .line 34
    .line 35
    :cond_0
    new-array v0, v3, [I

    .line 36
    .line 37
    array-length v7, v1

    .line 38
    invoke-static {v3, v7}, Ljava/lang/Math;->min(II)I

    .line 39
    .line 40
    .line 41
    move-result v7

    .line 42
    invoke-static {v1, v6, v0, v6, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 43
    .line 44
    .line 45
    new-array v7, v3, [I

    .line 46
    .line 47
    array-length v8, v1

    .line 48
    if-le v8, v3, :cond_1

    .line 49
    .line 50
    array-length v8, v1

    .line 51
    sub-int/2addr v8, v3

    .line 52
    invoke-static {v3, v8}, Ljava/lang/Math;->min(II)I

    .line 53
    .line 54
    .line 55
    move-result v8

    .line 56
    invoke-static {v1, v3, v7, v6, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 57
    .line 58
    .line 59
    :cond_1
    const/4 v1, 0x3

    .line 60
    aget v8, v5, v1

    .line 61
    .line 62
    const/16 v9, 0xa

    .line 63
    .line 64
    const/16 v10, 0xb

    .line 65
    .line 66
    const/16 v11, 0x8

    .line 67
    .line 68
    const/16 v12, 0x9

    .line 69
    .line 70
    const/4 v13, 0x6

    .line 71
    const/4 v14, 0x7

    .line 72
    const/4 v15, 0x5

    .line 73
    const/16 v16, 0x2

    .line 74
    .line 75
    const/16 v17, 0x1

    .line 76
    .line 77
    if-nez v8, :cond_5

    .line 78
    .line 79
    aget v8, v5, v16

    .line 80
    .line 81
    if-nez v8, :cond_5

    .line 82
    .line 83
    aget v8, v7, v1

    .line 84
    .line 85
    if-nez v8, :cond_5

    .line 86
    .line 87
    aget v8, v7, v16

    .line 88
    .line 89
    if-nez v8, :cond_5

    .line 90
    .line 91
    aget v8, v5, v17

    .line 92
    .line 93
    if-nez v8, :cond_4

    .line 94
    .line 95
    aget v8, v7, v17

    .line 96
    .line 97
    if-nez v8, :cond_4

    .line 98
    .line 99
    aget v8, v5, v6

    .line 100
    .line 101
    if-nez v8, :cond_2

    .line 102
    .line 103
    aget v18, v7, v6

    .line 104
    .line 105
    if-eqz v18, :cond_3

    .line 106
    .line 107
    :cond_2
    move/from16 p0, v1

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_3
    move/from16 p0, v1

    .line 111
    .line 112
    goto/16 :goto_1

    .line 113
    .line 114
    :goto_0
    aget v1, v7, v6

    .line 115
    .line 116
    invoke-static {v8, v1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->mult32(II)[I

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    aget v8, v2, v12

    .line 121
    .line 122
    aget v18, v1, v17

    .line 123
    .line 124
    xor-int v8, v8, v18

    .line 125
    .line 126
    aput v8, v2, v12

    .line 127
    .line 128
    aget v8, v2, v11

    .line 129
    .line 130
    aget v1, v1, v6

    .line 131
    .line 132
    xor-int/2addr v8, v1

    .line 133
    aput v8, v2, v11

    .line 134
    .line 135
    aget v8, v2, v15

    .line 136
    .line 137
    xor-int v8, v8, v18

    .line 138
    .line 139
    aput v8, v2, v15

    .line 140
    .line 141
    aget v8, v2, v3

    .line 142
    .line 143
    xor-int/2addr v1, v8

    .line 144
    aput v1, v2, v3

    .line 145
    .line 146
    goto/16 :goto_1

    .line 147
    .line 148
    :cond_4
    move/from16 p0, v1

    .line 149
    .line 150
    invoke-static {v5, v7}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->mult64([I[I)[I

    .line 151
    .line 152
    .line 153
    move-result-object v1

    .line 154
    aget v8, v2, v10

    .line 155
    .line 156
    aget v18, v1, p0

    .line 157
    .line 158
    xor-int v8, v8, v18

    .line 159
    .line 160
    aput v8, v2, v10

    .line 161
    .line 162
    aget v8, v2, v9

    .line 163
    .line 164
    aget v19, v1, v16

    .line 165
    .line 166
    xor-int v8, v8, v19

    .line 167
    .line 168
    aput v8, v2, v9

    .line 169
    .line 170
    aget v8, v2, v12

    .line 171
    .line 172
    aget v20, v1, v17

    .line 173
    .line 174
    xor-int v8, v8, v20

    .line 175
    .line 176
    aput v8, v2, v12

    .line 177
    .line 178
    aget v8, v2, v11

    .line 179
    .line 180
    aget v1, v1, v6

    .line 181
    .line 182
    xor-int/2addr v8, v1

    .line 183
    aput v8, v2, v11

    .line 184
    .line 185
    aget v8, v2, v14

    .line 186
    .line 187
    xor-int v8, v8, v18

    .line 188
    .line 189
    aput v8, v2, v14

    .line 190
    .line 191
    aget v8, v2, v13

    .line 192
    .line 193
    xor-int v8, v8, v19

    .line 194
    .line 195
    aput v8, v2, v13

    .line 196
    .line 197
    aget v8, v2, v15

    .line 198
    .line 199
    xor-int v8, v8, v20

    .line 200
    .line 201
    aput v8, v2, v15

    .line 202
    .line 203
    aget v8, v2, v3

    .line 204
    .line 205
    xor-int/2addr v1, v8

    .line 206
    aput v1, v2, v3

    .line 207
    .line 208
    goto :goto_1

    .line 209
    :cond_5
    move/from16 p0, v1

    .line 210
    .line 211
    invoke-static {v5, v7}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->mult128([I[I)[I

    .line 212
    .line 213
    .line 214
    move-result-object v1

    .line 215
    const/16 v8, 0xf

    .line 216
    .line 217
    aget v18, v2, v8

    .line 218
    .line 219
    aget v19, v1, v14

    .line 220
    .line 221
    xor-int v18, v18, v19

    .line 222
    .line 223
    aput v18, v2, v8

    .line 224
    .line 225
    const/16 v8, 0xe

    .line 226
    .line 227
    aget v18, v2, v8

    .line 228
    .line 229
    aget v20, v1, v13

    .line 230
    .line 231
    xor-int v18, v18, v20

    .line 232
    .line 233
    aput v18, v2, v8

    .line 234
    .line 235
    const/16 v8, 0xd

    .line 236
    .line 237
    aget v18, v2, v8

    .line 238
    .line 239
    aget v21, v1, v15

    .line 240
    .line 241
    xor-int v18, v18, v21

    .line 242
    .line 243
    aput v18, v2, v8

    .line 244
    .line 245
    const/16 v8, 0xc

    .line 246
    .line 247
    aget v18, v2, v8

    .line 248
    .line 249
    aget v22, v1, v3

    .line 250
    .line 251
    xor-int v18, v18, v22

    .line 252
    .line 253
    aput v18, v2, v8

    .line 254
    .line 255
    aget v8, v2, v10

    .line 256
    .line 257
    aget v18, v1, p0

    .line 258
    .line 259
    xor-int v19, v18, v19

    .line 260
    .line 261
    xor-int v8, v8, v19

    .line 262
    .line 263
    aput v8, v2, v10

    .line 264
    .line 265
    aget v8, v2, v9

    .line 266
    .line 267
    aget v19, v1, v16

    .line 268
    .line 269
    xor-int v20, v19, v20

    .line 270
    .line 271
    xor-int v8, v8, v20

    .line 272
    .line 273
    aput v8, v2, v9

    .line 274
    .line 275
    aget v8, v2, v12

    .line 276
    .line 277
    aget v20, v1, v17

    .line 278
    .line 279
    xor-int v21, v20, v21

    .line 280
    .line 281
    xor-int v8, v8, v21

    .line 282
    .line 283
    aput v8, v2, v12

    .line 284
    .line 285
    aget v8, v2, v11

    .line 286
    .line 287
    aget v1, v1, v6

    .line 288
    .line 289
    xor-int v21, v1, v22

    .line 290
    .line 291
    xor-int v8, v8, v21

    .line 292
    .line 293
    aput v8, v2, v11

    .line 294
    .line 295
    aget v8, v2, v14

    .line 296
    .line 297
    xor-int v8, v8, v18

    .line 298
    .line 299
    aput v8, v2, v14

    .line 300
    .line 301
    aget v8, v2, v13

    .line 302
    .line 303
    xor-int v8, v8, v19

    .line 304
    .line 305
    aput v8, v2, v13

    .line 306
    .line 307
    aget v8, v2, v15

    .line 308
    .line 309
    xor-int v8, v8, v20

    .line 310
    .line 311
    aput v8, v2, v15

    .line 312
    .line 313
    aget v8, v2, v3

    .line 314
    .line 315
    xor-int/2addr v1, v8

    .line 316
    aput v1, v2, v3

    .line 317
    .line 318
    :goto_1
    aget v1, v5, v6

    .line 319
    .line 320
    aget v8, v4, v6

    .line 321
    .line 322
    xor-int/2addr v1, v8

    .line 323
    aput v1, v5, v6

    .line 324
    .line 325
    aget v1, v5, v17

    .line 326
    .line 327
    aget v8, v4, v17

    .line 328
    .line 329
    xor-int/2addr v1, v8

    .line 330
    aput v1, v5, v17

    .line 331
    .line 332
    aget v1, v5, v16

    .line 333
    .line 334
    aget v8, v4, v16

    .line 335
    .line 336
    xor-int/2addr v1, v8

    .line 337
    aput v1, v5, v16

    .line 338
    .line 339
    aget v1, v5, p0

    .line 340
    .line 341
    aget v8, v4, p0

    .line 342
    .line 343
    xor-int/2addr v1, v8

    .line 344
    aput v1, v5, p0

    .line 345
    .line 346
    aget v1, v7, v6

    .line 347
    .line 348
    aget v8, v0, v6

    .line 349
    .line 350
    xor-int/2addr v1, v8

    .line 351
    aput v1, v7, v6

    .line 352
    .line 353
    aget v1, v7, v17

    .line 354
    .line 355
    aget v8, v0, v17

    .line 356
    .line 357
    xor-int/2addr v1, v8

    .line 358
    aput v1, v7, v17

    .line 359
    .line 360
    aget v1, v7, v16

    .line 361
    .line 362
    aget v8, v0, v16

    .line 363
    .line 364
    xor-int/2addr v1, v8

    .line 365
    aput v1, v7, v16

    .line 366
    .line 367
    aget v1, v7, p0

    .line 368
    .line 369
    aget v8, v0, p0

    .line 370
    .line 371
    xor-int/2addr v1, v8

    .line 372
    aput v1, v7, p0

    .line 373
    .line 374
    invoke-static {v5, v7}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->mult128([I[I)[I

    .line 375
    .line 376
    .line 377
    move-result-object v1

    .line 378
    aget v5, v2, v10

    .line 379
    .line 380
    aget v7, v1, v14

    .line 381
    .line 382
    xor-int/2addr v5, v7

    .line 383
    aput v5, v2, v10

    .line 384
    .line 385
    aget v5, v2, v9

    .line 386
    .line 387
    aget v7, v1, v13

    .line 388
    .line 389
    xor-int/2addr v5, v7

    .line 390
    aput v5, v2, v9

    .line 391
    .line 392
    aget v5, v2, v12

    .line 393
    .line 394
    aget v7, v1, v15

    .line 395
    .line 396
    xor-int/2addr v5, v7

    .line 397
    aput v5, v2, v12

    .line 398
    .line 399
    aget v5, v2, v11

    .line 400
    .line 401
    aget v7, v1, v3

    .line 402
    .line 403
    xor-int/2addr v5, v7

    .line 404
    aput v5, v2, v11

    .line 405
    .line 406
    aget v5, v2, v14

    .line 407
    .line 408
    aget v7, v1, p0

    .line 409
    .line 410
    xor-int/2addr v5, v7

    .line 411
    aput v5, v2, v14

    .line 412
    .line 413
    aget v5, v2, v13

    .line 414
    .line 415
    aget v7, v1, v16

    .line 416
    .line 417
    xor-int/2addr v5, v7

    .line 418
    aput v5, v2, v13

    .line 419
    .line 420
    aget v5, v2, v15

    .line 421
    .line 422
    aget v7, v1, v17

    .line 423
    .line 424
    xor-int/2addr v5, v7

    .line 425
    aput v5, v2, v15

    .line 426
    .line 427
    aget v5, v2, v3

    .line 428
    .line 429
    aget v1, v1, v6

    .line 430
    .line 431
    xor-int/2addr v1, v5

    .line 432
    aput v1, v2, v3

    .line 433
    .line 434
    invoke-static {v4, v0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->mult128([I[I)[I

    .line 435
    .line 436
    .line 437
    move-result-object v0

    .line 438
    aget v1, v2, v10

    .line 439
    .line 440
    aget v4, v0, v14

    .line 441
    .line 442
    xor-int/2addr v1, v4

    .line 443
    aput v1, v2, v10

    .line 444
    .line 445
    aget v1, v2, v9

    .line 446
    .line 447
    aget v5, v0, v13

    .line 448
    .line 449
    xor-int/2addr v1, v5

    .line 450
    aput v1, v2, v9

    .line 451
    .line 452
    aget v1, v2, v12

    .line 453
    .line 454
    aget v7, v0, v15

    .line 455
    .line 456
    xor-int/2addr v1, v7

    .line 457
    aput v1, v2, v12

    .line 458
    .line 459
    aget v1, v2, v11

    .line 460
    .line 461
    aget v8, v0, v3

    .line 462
    .line 463
    xor-int/2addr v1, v8

    .line 464
    aput v1, v2, v11

    .line 465
    .line 466
    aget v1, v2, v14

    .line 467
    .line 468
    aget v9, v0, p0

    .line 469
    .line 470
    xor-int/2addr v4, v9

    .line 471
    xor-int/2addr v1, v4

    .line 472
    aput v1, v2, v14

    .line 473
    .line 474
    aget v1, v2, v13

    .line 475
    .line 476
    aget v4, v0, v16

    .line 477
    .line 478
    xor-int/2addr v5, v4

    .line 479
    xor-int/2addr v1, v5

    .line 480
    aput v1, v2, v13

    .line 481
    .line 482
    aget v1, v2, v15

    .line 483
    .line 484
    aget v5, v0, v17

    .line 485
    .line 486
    xor-int/2addr v7, v5

    .line 487
    xor-int/2addr v1, v7

    .line 488
    aput v1, v2, v15

    .line 489
    .line 490
    aget v1, v2, v3

    .line 491
    .line 492
    aget v0, v0, v6

    .line 493
    .line 494
    xor-int v7, v0, v8

    .line 495
    .line 496
    xor-int/2addr v1, v7

    .line 497
    aput v1, v2, v3

    .line 498
    .line 499
    aget v1, v2, p0

    .line 500
    .line 501
    xor-int/2addr v1, v9

    .line 502
    aput v1, v2, p0

    .line 503
    .line 504
    aget v1, v2, v16

    .line 505
    .line 506
    xor-int/2addr v1, v4

    .line 507
    aput v1, v2, v16

    .line 508
    .line 509
    aget v1, v2, v17

    .line 510
    .line 511
    xor-int/2addr v1, v5

    .line 512
    aput v1, v2, v17

    .line 513
    .line 514
    aget v1, v2, v6

    .line 515
    .line 516
    xor-int/2addr v0, v1

    .line 517
    aput v0, v2, v6

    .line 518
    .line 519
    return-object v2
.end method

.method private static mult32(II)[I
    .locals 10

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [I

    .line 3
    .line 4
    if-eqz p0, :cond_3

    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    goto :goto_1

    .line 9
    :cond_0
    int-to-long v1, p1

    .line 10
    const-wide v3, 0xffffffffL

    .line 11
    .line 12
    .line 13
    .line 14
    .line 15
    and-long/2addr v1, v3

    .line 16
    const/4 p1, 0x1

    .line 17
    const-wide/16 v5, 0x0

    .line 18
    .line 19
    move v7, p1

    .line 20
    :goto_0
    const/16 v8, 0x20

    .line 21
    .line 22
    if-gt v7, v8, :cond_2

    .line 23
    .line 24
    sget-object v8, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->bitMask:[I

    .line 25
    .line 26
    add-int/lit8 v9, v7, -0x1

    .line 27
    .line 28
    aget v8, v8, v9

    .line 29
    .line 30
    and-int/2addr v8, p0

    .line 31
    if-eqz v8, :cond_1

    .line 32
    .line 33
    xor-long/2addr v5, v1

    .line 34
    :cond_1
    shl-long/2addr v1, p1

    .line 35
    add-int/lit8 v7, v7, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_2
    ushr-long v1, v5, v8

    .line 39
    .line 40
    long-to-int p0, v1

    .line 41
    aput p0, v0, p1

    .line 42
    .line 43
    and-long p0, v5, v3

    .line 44
    .line 45
    long-to-int p0, p0

    .line 46
    const/4 p1, 0x0

    .line 47
    aput p0, v0, p1

    .line 48
    .line 49
    :cond_3
    :goto_1
    return-object v0
.end method

.method private static mult512([I[I)[I
    .locals 39

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    const/16 v2, 0x20

    .line 6
    .line 7
    new-array v2, v2, [I

    .line 8
    .line 9
    const/16 v3, 0x8

    .line 10
    .line 11
    new-array v4, v3, [I

    .line 12
    .line 13
    array-length v5, v0

    .line 14
    invoke-static {v3, v5}, Ljava/lang/Math;->min(II)I

    .line 15
    .line 16
    .line 17
    move-result v5

    .line 18
    const/4 v6, 0x0

    .line 19
    invoke-static {v0, v6, v4, v6, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 20
    .line 21
    .line 22
    new-array v5, v3, [I

    .line 23
    .line 24
    array-length v7, v0

    .line 25
    if-le v7, v3, :cond_0

    .line 26
    .line 27
    array-length v7, v0

    .line 28
    sub-int/2addr v7, v3

    .line 29
    invoke-static {v3, v7}, Ljava/lang/Math;->min(II)I

    .line 30
    .line 31
    .line 32
    move-result v7

    .line 33
    invoke-static {v0, v3, v5, v6, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 34
    .line 35
    .line 36
    :cond_0
    new-array v0, v3, [I

    .line 37
    .line 38
    array-length v7, v1

    .line 39
    invoke-static {v3, v7}, Ljava/lang/Math;->min(II)I

    .line 40
    .line 41
    .line 42
    move-result v7

    .line 43
    invoke-static {v1, v6, v0, v6, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 44
    .line 45
    .line 46
    new-array v7, v3, [I

    .line 47
    .line 48
    array-length v8, v1

    .line 49
    if-le v8, v3, :cond_1

    .line 50
    .line 51
    array-length v8, v1

    .line 52
    sub-int/2addr v8, v3

    .line 53
    invoke-static {v3, v8}, Ljava/lang/Math;->min(II)I

    .line 54
    .line 55
    .line 56
    move-result v8

    .line 57
    invoke-static {v1, v3, v7, v6, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 58
    .line 59
    .line 60
    :cond_1
    invoke-static {v5, v7}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->mult256([I[I)[I

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    const/16 v8, 0x1f

    .line 65
    .line 66
    aget v9, v2, v8

    .line 67
    .line 68
    const/16 v10, 0xf

    .line 69
    .line 70
    aget v11, v1, v10

    .line 71
    .line 72
    xor-int/2addr v9, v11

    .line 73
    aput v9, v2, v8

    .line 74
    .line 75
    const/16 v8, 0x1e

    .line 76
    .line 77
    aget v9, v2, v8

    .line 78
    .line 79
    const/16 v12, 0xe

    .line 80
    .line 81
    aget v13, v1, v12

    .line 82
    .line 83
    xor-int/2addr v9, v13

    .line 84
    aput v9, v2, v8

    .line 85
    .line 86
    const/16 v8, 0x1d

    .line 87
    .line 88
    aget v9, v2, v8

    .line 89
    .line 90
    const/16 v14, 0xd

    .line 91
    .line 92
    aget v15, v1, v14

    .line 93
    .line 94
    xor-int/2addr v9, v15

    .line 95
    aput v9, v2, v8

    .line 96
    .line 97
    const/16 v8, 0x1c

    .line 98
    .line 99
    aget v9, v2, v8

    .line 100
    .line 101
    const/16 v16, 0xc

    .line 102
    .line 103
    aget v17, v1, v16

    .line 104
    .line 105
    xor-int v9, v9, v17

    .line 106
    .line 107
    aput v9, v2, v8

    .line 108
    .line 109
    const/16 v8, 0x1b

    .line 110
    .line 111
    aget v9, v2, v8

    .line 112
    .line 113
    const/16 v18, 0xb

    .line 114
    .line 115
    aget v19, v1, v18

    .line 116
    .line 117
    xor-int v9, v9, v19

    .line 118
    .line 119
    aput v9, v2, v8

    .line 120
    .line 121
    const/16 v8, 0x1a

    .line 122
    .line 123
    aget v9, v2, v8

    .line 124
    .line 125
    const/16 v20, 0xa

    .line 126
    .line 127
    aget v21, v1, v20

    .line 128
    .line 129
    xor-int v9, v9, v21

    .line 130
    .line 131
    aput v9, v2, v8

    .line 132
    .line 133
    const/16 v8, 0x19

    .line 134
    .line 135
    aget v9, v2, v8

    .line 136
    .line 137
    const/16 v22, 0x9

    .line 138
    .line 139
    aget v23, v1, v22

    .line 140
    .line 141
    xor-int v9, v9, v23

    .line 142
    .line 143
    aput v9, v2, v8

    .line 144
    .line 145
    const/16 v8, 0x18

    .line 146
    .line 147
    aget v9, v2, v8

    .line 148
    .line 149
    aget v24, v1, v3

    .line 150
    .line 151
    xor-int v9, v9, v24

    .line 152
    .line 153
    aput v9, v2, v8

    .line 154
    .line 155
    const/16 v8, 0x17

    .line 156
    .line 157
    aget v9, v2, v8

    .line 158
    .line 159
    const/16 v25, 0x7

    .line 160
    .line 161
    aget v26, v1, v25

    .line 162
    .line 163
    xor-int v11, v26, v11

    .line 164
    .line 165
    xor-int/2addr v9, v11

    .line 166
    aput v9, v2, v8

    .line 167
    .line 168
    const/16 v9, 0x16

    .line 169
    .line 170
    aget v11, v2, v9

    .line 171
    .line 172
    const/16 v27, 0x6

    .line 173
    .line 174
    aget v28, v1, v27

    .line 175
    .line 176
    xor-int v13, v28, v13

    .line 177
    .line 178
    xor-int/2addr v11, v13

    .line 179
    aput v11, v2, v9

    .line 180
    .line 181
    const/16 v11, 0x15

    .line 182
    .line 183
    aget v13, v2, v11

    .line 184
    .line 185
    const/16 v29, 0x5

    .line 186
    .line 187
    aget v30, v1, v29

    .line 188
    .line 189
    xor-int v15, v30, v15

    .line 190
    .line 191
    xor-int/2addr v13, v15

    .line 192
    aput v13, v2, v11

    .line 193
    .line 194
    const/16 v13, 0x14

    .line 195
    .line 196
    aget v15, v2, v13

    .line 197
    .line 198
    const/16 v31, 0x4

    .line 199
    .line 200
    aget v32, v1, v31

    .line 201
    .line 202
    xor-int v17, v32, v17

    .line 203
    .line 204
    xor-int v15, v15, v17

    .line 205
    .line 206
    aput v15, v2, v13

    .line 207
    .line 208
    const/16 v15, 0x13

    .line 209
    .line 210
    aget v17, v2, v15

    .line 211
    .line 212
    const/16 v33, 0x3

    .line 213
    .line 214
    aget v34, v1, v33

    .line 215
    .line 216
    xor-int v19, v34, v19

    .line 217
    .line 218
    xor-int v17, v17, v19

    .line 219
    .line 220
    aput v17, v2, v15

    .line 221
    .line 222
    const/16 v17, 0x12

    .line 223
    .line 224
    aget v19, v2, v17

    .line 225
    .line 226
    const/16 v35, 0x2

    .line 227
    .line 228
    aget v36, v1, v35

    .line 229
    .line 230
    xor-int v21, v36, v21

    .line 231
    .line 232
    xor-int v19, v19, v21

    .line 233
    .line 234
    aput v19, v2, v17

    .line 235
    .line 236
    const/16 v19, 0x11

    .line 237
    .line 238
    aget v21, v2, v19

    .line 239
    .line 240
    const/16 v37, 0x1

    .line 241
    .line 242
    aget v38, v1, v37

    .line 243
    .line 244
    xor-int v23, v38, v23

    .line 245
    .line 246
    xor-int v21, v21, v23

    .line 247
    .line 248
    aput v21, v2, v19

    .line 249
    .line 250
    const/16 v21, 0x10

    .line 251
    .line 252
    aget v23, v2, v21

    .line 253
    .line 254
    aget v1, v1, v6

    .line 255
    .line 256
    xor-int v24, v1, v24

    .line 257
    .line 258
    xor-int v23, v23, v24

    .line 259
    .line 260
    aput v23, v2, v21

    .line 261
    .line 262
    aget v23, v2, v10

    .line 263
    .line 264
    xor-int v23, v23, v26

    .line 265
    .line 266
    aput v23, v2, v10

    .line 267
    .line 268
    aget v23, v2, v12

    .line 269
    .line 270
    xor-int v23, v23, v28

    .line 271
    .line 272
    aput v23, v2, v12

    .line 273
    .line 274
    aget v23, v2, v14

    .line 275
    .line 276
    xor-int v23, v23, v30

    .line 277
    .line 278
    aput v23, v2, v14

    .line 279
    .line 280
    aget v23, v2, v16

    .line 281
    .line 282
    xor-int v23, v23, v32

    .line 283
    .line 284
    aput v23, v2, v16

    .line 285
    .line 286
    aget v23, v2, v18

    .line 287
    .line 288
    xor-int v23, v23, v34

    .line 289
    .line 290
    aput v23, v2, v18

    .line 291
    .line 292
    aget v23, v2, v20

    .line 293
    .line 294
    xor-int v23, v23, v36

    .line 295
    .line 296
    aput v23, v2, v20

    .line 297
    .line 298
    aget v23, v2, v22

    .line 299
    .line 300
    xor-int v23, v23, v38

    .line 301
    .line 302
    aput v23, v2, v22

    .line 303
    .line 304
    aget v23, v2, v3

    .line 305
    .line 306
    xor-int v1, v23, v1

    .line 307
    .line 308
    aput v1, v2, v3

    .line 309
    .line 310
    aget v1, v5, v6

    .line 311
    .line 312
    aget v23, v4, v6

    .line 313
    .line 314
    xor-int v1, v1, v23

    .line 315
    .line 316
    aput v1, v5, v6

    .line 317
    .line 318
    aget v1, v5, v37

    .line 319
    .line 320
    aget v23, v4, v37

    .line 321
    .line 322
    xor-int v1, v1, v23

    .line 323
    .line 324
    aput v1, v5, v37

    .line 325
    .line 326
    aget v1, v5, v35

    .line 327
    .line 328
    aget v23, v4, v35

    .line 329
    .line 330
    xor-int v1, v1, v23

    .line 331
    .line 332
    aput v1, v5, v35

    .line 333
    .line 334
    aget v1, v5, v33

    .line 335
    .line 336
    aget v23, v4, v33

    .line 337
    .line 338
    xor-int v1, v1, v23

    .line 339
    .line 340
    aput v1, v5, v33

    .line 341
    .line 342
    aget v1, v5, v31

    .line 343
    .line 344
    aget v23, v4, v31

    .line 345
    .line 346
    xor-int v1, v1, v23

    .line 347
    .line 348
    aput v1, v5, v31

    .line 349
    .line 350
    aget v1, v5, v29

    .line 351
    .line 352
    aget v23, v4, v29

    .line 353
    .line 354
    xor-int v1, v1, v23

    .line 355
    .line 356
    aput v1, v5, v29

    .line 357
    .line 358
    aget v1, v5, v27

    .line 359
    .line 360
    aget v23, v4, v27

    .line 361
    .line 362
    xor-int v1, v1, v23

    .line 363
    .line 364
    aput v1, v5, v27

    .line 365
    .line 366
    aget v1, v5, v25

    .line 367
    .line 368
    aget v23, v4, v25

    .line 369
    .line 370
    xor-int v1, v1, v23

    .line 371
    .line 372
    aput v1, v5, v25

    .line 373
    .line 374
    aget v1, v7, v6

    .line 375
    .line 376
    aget v23, v0, v6

    .line 377
    .line 378
    xor-int v1, v1, v23

    .line 379
    .line 380
    aput v1, v7, v6

    .line 381
    .line 382
    aget v1, v7, v37

    .line 383
    .line 384
    aget v23, v0, v37

    .line 385
    .line 386
    xor-int v1, v1, v23

    .line 387
    .line 388
    aput v1, v7, v37

    .line 389
    .line 390
    aget v1, v7, v35

    .line 391
    .line 392
    aget v23, v0, v35

    .line 393
    .line 394
    xor-int v1, v1, v23

    .line 395
    .line 396
    aput v1, v7, v35

    .line 397
    .line 398
    aget v1, v7, v33

    .line 399
    .line 400
    aget v23, v0, v33

    .line 401
    .line 402
    xor-int v1, v1, v23

    .line 403
    .line 404
    aput v1, v7, v33

    .line 405
    .line 406
    aget v1, v7, v31

    .line 407
    .line 408
    aget v23, v0, v31

    .line 409
    .line 410
    xor-int v1, v1, v23

    .line 411
    .line 412
    aput v1, v7, v31

    .line 413
    .line 414
    aget v1, v7, v29

    .line 415
    .line 416
    aget v23, v0, v29

    .line 417
    .line 418
    xor-int v1, v1, v23

    .line 419
    .line 420
    aput v1, v7, v29

    .line 421
    .line 422
    aget v1, v7, v27

    .line 423
    .line 424
    aget v23, v0, v27

    .line 425
    .line 426
    xor-int v1, v1, v23

    .line 427
    .line 428
    aput v1, v7, v27

    .line 429
    .line 430
    aget v1, v7, v25

    .line 431
    .line 432
    aget v23, v0, v25

    .line 433
    .line 434
    xor-int v1, v1, v23

    .line 435
    .line 436
    aput v1, v7, v25

    .line 437
    .line 438
    invoke-static {v5, v7}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->mult256([I[I)[I

    .line 439
    .line 440
    .line 441
    move-result-object v1

    .line 442
    aget v5, v2, v8

    .line 443
    .line 444
    aget v7, v1, v10

    .line 445
    .line 446
    xor-int/2addr v5, v7

    .line 447
    aput v5, v2, v8

    .line 448
    .line 449
    aget v5, v2, v9

    .line 450
    .line 451
    aget v7, v1, v12

    .line 452
    .line 453
    xor-int/2addr v5, v7

    .line 454
    aput v5, v2, v9

    .line 455
    .line 456
    aget v5, v2, v11

    .line 457
    .line 458
    aget v7, v1, v14

    .line 459
    .line 460
    xor-int/2addr v5, v7

    .line 461
    aput v5, v2, v11

    .line 462
    .line 463
    aget v5, v2, v13

    .line 464
    .line 465
    aget v7, v1, v16

    .line 466
    .line 467
    xor-int/2addr v5, v7

    .line 468
    aput v5, v2, v13

    .line 469
    .line 470
    aget v5, v2, v15

    .line 471
    .line 472
    aget v7, v1, v18

    .line 473
    .line 474
    xor-int/2addr v5, v7

    .line 475
    aput v5, v2, v15

    .line 476
    .line 477
    aget v5, v2, v17

    .line 478
    .line 479
    aget v7, v1, v20

    .line 480
    .line 481
    xor-int/2addr v5, v7

    .line 482
    aput v5, v2, v17

    .line 483
    .line 484
    aget v5, v2, v19

    .line 485
    .line 486
    aget v7, v1, v22

    .line 487
    .line 488
    xor-int/2addr v5, v7

    .line 489
    aput v5, v2, v19

    .line 490
    .line 491
    aget v5, v2, v21

    .line 492
    .line 493
    aget v7, v1, v3

    .line 494
    .line 495
    xor-int/2addr v5, v7

    .line 496
    aput v5, v2, v21

    .line 497
    .line 498
    aget v5, v2, v10

    .line 499
    .line 500
    aget v7, v1, v25

    .line 501
    .line 502
    xor-int/2addr v5, v7

    .line 503
    aput v5, v2, v10

    .line 504
    .line 505
    aget v5, v2, v12

    .line 506
    .line 507
    aget v7, v1, v27

    .line 508
    .line 509
    xor-int/2addr v5, v7

    .line 510
    aput v5, v2, v12

    .line 511
    .line 512
    aget v5, v2, v14

    .line 513
    .line 514
    aget v7, v1, v29

    .line 515
    .line 516
    xor-int/2addr v5, v7

    .line 517
    aput v5, v2, v14

    .line 518
    .line 519
    aget v5, v2, v16

    .line 520
    .line 521
    aget v7, v1, v31

    .line 522
    .line 523
    xor-int/2addr v5, v7

    .line 524
    aput v5, v2, v16

    .line 525
    .line 526
    aget v5, v2, v18

    .line 527
    .line 528
    aget v7, v1, v33

    .line 529
    .line 530
    xor-int/2addr v5, v7

    .line 531
    aput v5, v2, v18

    .line 532
    .line 533
    aget v5, v2, v20

    .line 534
    .line 535
    aget v7, v1, v35

    .line 536
    .line 537
    xor-int/2addr v5, v7

    .line 538
    aput v5, v2, v20

    .line 539
    .line 540
    aget v5, v2, v22

    .line 541
    .line 542
    aget v7, v1, v37

    .line 543
    .line 544
    xor-int/2addr v5, v7

    .line 545
    aput v5, v2, v22

    .line 546
    .line 547
    aget v5, v2, v3

    .line 548
    .line 549
    aget v1, v1, v6

    .line 550
    .line 551
    xor-int/2addr v1, v5

    .line 552
    aput v1, v2, v3

    .line 553
    .line 554
    invoke-static {v4, v0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->mult256([I[I)[I

    .line 555
    .line 556
    .line 557
    move-result-object v0

    .line 558
    aget v1, v2, v8

    .line 559
    .line 560
    aget v4, v0, v10

    .line 561
    .line 562
    xor-int/2addr v1, v4

    .line 563
    aput v1, v2, v8

    .line 564
    .line 565
    aget v1, v2, v9

    .line 566
    .line 567
    aget v5, v0, v12

    .line 568
    .line 569
    xor-int/2addr v1, v5

    .line 570
    aput v1, v2, v9

    .line 571
    .line 572
    aget v1, v2, v11

    .line 573
    .line 574
    aget v7, v0, v14

    .line 575
    .line 576
    xor-int/2addr v1, v7

    .line 577
    aput v1, v2, v11

    .line 578
    .line 579
    aget v1, v2, v13

    .line 580
    .line 581
    aget v8, v0, v16

    .line 582
    .line 583
    xor-int/2addr v1, v8

    .line 584
    aput v1, v2, v13

    .line 585
    .line 586
    aget v1, v2, v15

    .line 587
    .line 588
    aget v9, v0, v18

    .line 589
    .line 590
    xor-int/2addr v1, v9

    .line 591
    aput v1, v2, v15

    .line 592
    .line 593
    aget v1, v2, v17

    .line 594
    .line 595
    aget v11, v0, v20

    .line 596
    .line 597
    xor-int/2addr v1, v11

    .line 598
    aput v1, v2, v17

    .line 599
    .line 600
    aget v1, v2, v19

    .line 601
    .line 602
    aget v13, v0, v22

    .line 603
    .line 604
    xor-int/2addr v1, v13

    .line 605
    aput v1, v2, v19

    .line 606
    .line 607
    aget v1, v2, v21

    .line 608
    .line 609
    aget v15, v0, v3

    .line 610
    .line 611
    xor-int/2addr v1, v15

    .line 612
    aput v1, v2, v21

    .line 613
    .line 614
    aget v1, v2, v10

    .line 615
    .line 616
    aget v17, v0, v25

    .line 617
    .line 618
    xor-int v4, v17, v4

    .line 619
    .line 620
    xor-int/2addr v1, v4

    .line 621
    aput v1, v2, v10

    .line 622
    .line 623
    aget v1, v2, v12

    .line 624
    .line 625
    aget v4, v0, v27

    .line 626
    .line 627
    xor-int/2addr v5, v4

    .line 628
    xor-int/2addr v1, v5

    .line 629
    aput v1, v2, v12

    .line 630
    .line 631
    aget v1, v2, v14

    .line 632
    .line 633
    aget v5, v0, v29

    .line 634
    .line 635
    xor-int/2addr v7, v5

    .line 636
    xor-int/2addr v1, v7

    .line 637
    aput v1, v2, v14

    .line 638
    .line 639
    aget v1, v2, v16

    .line 640
    .line 641
    aget v7, v0, v31

    .line 642
    .line 643
    xor-int/2addr v8, v7

    .line 644
    xor-int/2addr v1, v8

    .line 645
    aput v1, v2, v16

    .line 646
    .line 647
    aget v1, v2, v18

    .line 648
    .line 649
    aget v8, v0, v33

    .line 650
    .line 651
    xor-int/2addr v9, v8

    .line 652
    xor-int/2addr v1, v9

    .line 653
    aput v1, v2, v18

    .line 654
    .line 655
    aget v1, v2, v20

    .line 656
    .line 657
    aget v9, v0, v35

    .line 658
    .line 659
    xor-int v10, v9, v11

    .line 660
    .line 661
    xor-int/2addr v1, v10

    .line 662
    aput v1, v2, v20

    .line 663
    .line 664
    aget v1, v2, v22

    .line 665
    .line 666
    aget v10, v0, v37

    .line 667
    .line 668
    xor-int v11, v10, v13

    .line 669
    .line 670
    xor-int/2addr v1, v11

    .line 671
    aput v1, v2, v22

    .line 672
    .line 673
    aget v1, v2, v3

    .line 674
    .line 675
    aget v0, v0, v6

    .line 676
    .line 677
    xor-int v11, v0, v15

    .line 678
    .line 679
    xor-int/2addr v1, v11

    .line 680
    aput v1, v2, v3

    .line 681
    .line 682
    aget v1, v2, v25

    .line 683
    .line 684
    xor-int v1, v1, v17

    .line 685
    .line 686
    aput v1, v2, v25

    .line 687
    .line 688
    aget v1, v2, v27

    .line 689
    .line 690
    xor-int/2addr v1, v4

    .line 691
    aput v1, v2, v27

    .line 692
    .line 693
    aget v1, v2, v29

    .line 694
    .line 695
    xor-int/2addr v1, v5

    .line 696
    aput v1, v2, v29

    .line 697
    .line 698
    aget v1, v2, v31

    .line 699
    .line 700
    xor-int/2addr v1, v7

    .line 701
    aput v1, v2, v31

    .line 702
    .line 703
    aget v1, v2, v33

    .line 704
    .line 705
    xor-int/2addr v1, v8

    .line 706
    aput v1, v2, v33

    .line 707
    .line 708
    aget v1, v2, v35

    .line 709
    .line 710
    xor-int/2addr v1, v9

    .line 711
    aput v1, v2, v35

    .line 712
    .line 713
    aget v1, v2, v37

    .line 714
    .line 715
    xor-int/2addr v1, v10

    .line 716
    aput v1, v2, v37

    .line 717
    .line 718
    aget v1, v2, v6

    .line 719
    .line 720
    xor-int/2addr v0, v1

    .line 721
    aput v0, v2, v6

    .line 722
    .line 723
    return-object v2
.end method

.method private static mult64([I[I)[I
    .locals 10

    .line 1
    const/4 v0, 0x4

    .line 2
    new-array v0, v0, [I

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    aget v2, p0, v1

    .line 6
    .line 7
    array-length v3, p0

    .line 8
    const/4 v4, 0x1

    .line 9
    if-le v3, v4, :cond_0

    .line 10
    .line 11
    aget p0, p0, v4

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    move p0, v1

    .line 15
    :goto_0
    aget v3, p1, v1

    .line 16
    .line 17
    array-length v5, p1

    .line 18
    if-le v5, v4, :cond_1

    .line 19
    .line 20
    aget p1, p1, v4

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_1
    move p1, v1

    .line 24
    :goto_1
    const/4 v5, 0x2

    .line 25
    if-nez p0, :cond_2

    .line 26
    .line 27
    if-eqz p1, :cond_3

    .line 28
    .line 29
    :cond_2
    invoke-static {p0, p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->mult32(II)[I

    .line 30
    .line 31
    .line 32
    move-result-object v6

    .line 33
    const/4 v7, 0x3

    .line 34
    aget v8, v0, v7

    .line 35
    .line 36
    aget v9, v6, v4

    .line 37
    .line 38
    xor-int/2addr v8, v9

    .line 39
    aput v8, v0, v7

    .line 40
    .line 41
    aget v7, v0, v5

    .line 42
    .line 43
    aget v6, v6, v1

    .line 44
    .line 45
    xor-int v8, v6, v9

    .line 46
    .line 47
    xor-int/2addr v7, v8

    .line 48
    aput v7, v0, v5

    .line 49
    .line 50
    aget v7, v0, v4

    .line 51
    .line 52
    xor-int/2addr v6, v7

    .line 53
    aput v6, v0, v4

    .line 54
    .line 55
    :cond_3
    xor-int/2addr p0, v2

    .line 56
    xor-int/2addr p1, v3

    .line 57
    invoke-static {p0, p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->mult32(II)[I

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    aget p1, v0, v5

    .line 62
    .line 63
    aget v6, p0, v4

    .line 64
    .line 65
    xor-int/2addr p1, v6

    .line 66
    aput p1, v0, v5

    .line 67
    .line 68
    aget p1, v0, v4

    .line 69
    .line 70
    aget p0, p0, v1

    .line 71
    .line 72
    xor-int/2addr p0, p1

    .line 73
    aput p0, v0, v4

    .line 74
    .line 75
    invoke-static {v2, v3}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->mult32(II)[I

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    aget p1, v0, v5

    .line 80
    .line 81
    aget v2, p0, v4

    .line 82
    .line 83
    xor-int/2addr p1, v2

    .line 84
    aput p1, v0, v5

    .line 85
    .line 86
    aget p1, v0, v4

    .line 87
    .line 88
    aget p0, p0, v1

    .line 89
    .line 90
    xor-int/2addr v2, p0

    .line 91
    xor-int/2addr p1, v2

    .line 92
    aput p1, v0, v4

    .line 93
    .line 94
    aget p1, v0, v1

    .line 95
    .line 96
    xor-int/2addr p0, p1

    .line 97
    aput p0, v0, v1

    .line 98
    .line 99
    return-object v0
.end method

.method private upper(I)Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;
    .locals 4

    .line 1
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    .line 2
    .line 3
    sub-int/2addr v0, p1

    .line 4
    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    new-instance v1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 9
    .line 10
    shl-int/lit8 v2, v0, 0x5

    .line 11
    .line 12
    invoke-direct {v1, v2}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;-><init>(I)V

    .line 13
    .line 14
    .line 15
    iget v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    .line 16
    .line 17
    if-lt v2, p1, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 20
    .line 21
    iget-object v2, v1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 22
    .line 23
    const/4 v3, 0x0

    .line 24
    invoke-static {p0, p1, v2, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-object v1
.end method

.method private zeroUnusedBits()V
    .locals 4

    .line 1
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 2
    .line 3
    and-int/lit8 v1, v0, 0x1f

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    iget-object v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 8
    .line 9
    iget p0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    .line 10
    .line 11
    add-int/lit8 p0, p0, -0x1

    .line 12
    .line 13
    aget v2, v1, p0

    .line 14
    .line 15
    sget-object v3, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->reverseRightMask:[I

    .line 16
    .line 17
    and-int/lit8 v0, v0, 0x1f

    .line 18
    .line 19
    aget v0, v3, v0

    .line 20
    .line 21
    and-int/2addr v0, v2

    .line 22
    aput v0, v1, p0

    .line 23
    .line 24
    :cond_0
    return-void
.end method


# virtual methods
.method public add(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->xor(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public addToThis(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)V
    .locals 1

    .line 1
    iget v0, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->expandN(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->xorThisBy(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public assignAll()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    .line 3
    .line 4
    if-ge v0, v1, :cond_0

    .line 5
    .line 6
    iget-object v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 7
    .line 8
    const/4 v2, -0x1

    .line 9
    aput v2, v1, v0

    .line 10
    .line 11
    add-int/lit8 v0, v0, 0x1

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-direct {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->zeroUnusedBits()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public assignOne()V
    .locals 5

    .line 1
    const/4 v0, 0x1

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    .line 4
    .line 5
    iget-object v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 6
    .line 7
    const/4 v4, 0x0

    .line 8
    if-ge v1, v2, :cond_0

    .line 9
    .line 10
    aput v4, v3, v1

    .line 11
    .line 12
    add-int/lit8 v1, v1, 0x1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    aput v0, v3, v4

    .line 16
    .line 17
    return-void
.end method

.method public assignX()V
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    :goto_0
    iget v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    .line 3
    .line 4
    iget-object v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 5
    .line 6
    const/4 v3, 0x0

    .line 7
    if-ge v0, v1, :cond_0

    .line 8
    .line 9
    aput v3, v2, v0

    .line 10
    .line 11
    add-int/lit8 v0, v0, 0x1

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x2

    .line 15
    aput p0, v2, v3

    .line 16
    .line 17
    return-void
.end method

.method public assignZero()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    .line 4
    .line 5
    if-ge v1, v2, :cond_0

    .line 6
    .line 7
    iget-object v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 8
    .line 9
    aput v0, v2, v1

    .line 10
    .line 11
    add-int/lit8 v1, v1, 0x1

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    return-void
.end method

.method public clone()Ljava/lang/Object;
    .locals 1

    .line 1
    new-instance v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public divide(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)[Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/RuntimeException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 3
    .line 4
    new-instance v1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 5
    .line 6
    iget v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 7
    .line 8
    invoke-direct {v1, v2}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;-><init>(I)V

    .line 9
    .line 10
    .line 11
    new-instance v2, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 12
    .line 13
    invoke-direct {v2, p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)V

    .line 14
    .line 15
    .line 16
    new-instance p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 17
    .line 18
    invoke-direct {p0, p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->isZero()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-nez p1, :cond_2

    .line 26
    .line 27
    invoke-virtual {v2}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->reduceN()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->reduceN()V

    .line 31
    .line 32
    .line 33
    iget p1, v2, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 34
    .line 35
    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 36
    .line 37
    const/4 v4, 0x1

    .line 38
    const/4 v5, 0x0

    .line 39
    if-ge p1, v3, :cond_0

    .line 40
    .line 41
    new-instance p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 42
    .line 43
    invoke-direct {p0, v5}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;-><init>(I)V

    .line 44
    .line 45
    .line 46
    aput-object p0, v0, v5

    .line 47
    .line 48
    aput-object v2, v0, v4

    .line 49
    .line 50
    return-object v0

    .line 51
    :cond_0
    sub-int/2addr p1, v3

    .line 52
    add-int/lit8 v3, p1, 0x1

    .line 53
    .line 54
    invoke-virtual {v1, v3}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->expandN(I)V

    .line 55
    .line 56
    .line 57
    :goto_0
    if-ltz p1, :cond_1

    .line 58
    .line 59
    invoke-virtual {p0, p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->shiftLeft(I)Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    invoke-virtual {v2, v3}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->subtractFromThis(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v2}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->reduceN()V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v1, p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->xorBit(I)V

    .line 70
    .line 71
    .line 72
    iget p1, v2, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 73
    .line 74
    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 75
    .line 76
    sub-int/2addr p1, v3

    .line 77
    goto :goto_0

    .line 78
    :cond_1
    aput-object v1, v0, v5

    .line 79
    .line 80
    aput-object v2, v0, v4

    .line 81
    .line 82
    return-object v0

    .line 83
    :cond_2
    invoke-static {}, Ll/olk0;->a()V

    .line 84
    .line 85
    .line 86
    const/4 p0, 0x0

    .line 87
    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_4

    .line 3
    .line 4
    instance-of v1, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    goto :goto_1

    .line 9
    :cond_0
    check-cast p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 10
    .line 11
    iget v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 12
    .line 13
    iget v2, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 14
    .line 15
    if-eq v1, v2, :cond_1

    .line 16
    .line 17
    return v0

    .line 18
    :cond_1
    move v1, v0

    .line 19
    :goto_0
    iget v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    .line 20
    .line 21
    if-ge v1, v2, :cond_3

    .line 22
    .line 23
    iget-object v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 24
    .line 25
    aget v2, v2, v1

    .line 26
    .line 27
    iget-object v3, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 28
    .line 29
    aget v3, v3, v1

    .line 30
    .line 31
    if-eq v2, v3, :cond_2

    .line 32
    .line 33
    return v0

    .line 34
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_3
    const/4 p0, 0x1

    .line 38
    return p0

    .line 39
    :cond_4
    :goto_1
    return v0
.end method

.method public expandN(I)V
    .locals 4

    .line 1
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 2
    .line 3
    if-lt v0, p1, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iput p1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 7
    .line 8
    add-int/lit8 p1, p1, -0x1

    .line 9
    .line 10
    ushr-int/lit8 p1, p1, 0x5

    .line 11
    .line 12
    add-int/lit8 p1, p1, 0x1

    .line 13
    .line 14
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    .line 15
    .line 16
    if-lt v0, p1, :cond_1

    .line 17
    .line 18
    :goto_0
    return-void

    .line 19
    :cond_1
    iget-object v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 20
    .line 21
    array-length v2, v1

    .line 22
    const/4 v3, 0x0

    .line 23
    if-lt v2, p1, :cond_3

    .line 24
    .line 25
    :goto_1
    if-ge v0, p1, :cond_2

    .line 26
    .line 27
    iget-object v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 28
    .line 29
    aput v3, v1, v0

    .line 30
    .line 31
    add-int/lit8 v0, v0, 0x1

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_2
    iput p1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    .line 35
    .line 36
    return-void

    .line 37
    :cond_3
    new-array v2, p1, [I

    .line 38
    .line 39
    invoke-static {v1, v3, v2, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 40
    .line 41
    .line 42
    iput p1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    .line 43
    .line 44
    iput-object v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 45
    .line 46
    return-void
.end method

.method public gcd(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/RuntimeException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->isZero()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->isZero()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const-string p0, "Both operands of gcd equal zero."

    .line 15
    .line 16
    invoke-static {p0}, Ll/mym;->a(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    return-object p0

    .line 21
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->isZero()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    new-instance p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 28
    .line 29
    invoke-direct {p0, p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)V

    .line 30
    .line 31
    .line 32
    return-object p0

    .line 33
    :cond_2
    invoke-virtual {p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->isZero()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_3

    .line 38
    .line 39
    new-instance p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 40
    .line 41
    invoke-direct {p1, p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)V

    .line 42
    .line 43
    .line 44
    return-object p1

    .line 45
    :cond_3
    new-instance v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 46
    .line 47
    invoke-direct {v0, p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)V

    .line 48
    .line 49
    .line 50
    new-instance p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 51
    .line 52
    invoke-direct {p0, p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)V

    .line 53
    .line 54
    .line 55
    :goto_1
    move-object v1, v0

    .line 56
    move-object v0, p0

    .line 57
    move-object p0, v1

    .line 58
    invoke-virtual {v0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->isZero()Z

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    if-nez p1, :cond_4

    .line 63
    .line 64
    invoke-virtual {p0, v0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->remainder(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    goto :goto_1

    .line 69
    :cond_4
    return-object p0
.end method

.method public getBit(I)I
    .locals 3

    .line 1
    if-ltz p1, :cond_2

    .line 2
    .line 3
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    sub-int/2addr v0, v1

    .line 7
    const/4 v2, 0x0

    .line 8
    if-le p1, v0, :cond_0

    .line 9
    .line 10
    return v2

    .line 11
    :cond_0
    iget-object p0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 12
    .line 13
    ushr-int/lit8 v0, p1, 0x5

    .line 14
    .line 15
    aget p0, p0, v0

    .line 16
    .line 17
    sget-object v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->bitMask:[I

    .line 18
    .line 19
    and-int/lit8 p1, p1, 0x1f

    .line 20
    .line 21
    aget p1, v0, p1

    .line 22
    .line 23
    and-int/2addr p0, p1

    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    return v1

    .line 27
    :cond_1
    return v2

    .line 28
    :cond_2
    invoke-static {}, Ll/olk0;->a()V

    .line 29
    .line 30
    .line 31
    const/4 p0, 0x0

    .line 32
    return p0
.end method

.method public getLength()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 2
    .line 3
    return p0
.end method

.method public hashCode()I
    .locals 1

    .line 1
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 2
    .line 3
    iget-object p0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    add-int/2addr v0, p0

    .line 10
    return v0
.end method

.method public increase()Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;
    .locals 1

    .line 1
    new-instance v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->increaseThis()V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method

.method public increaseThis()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->xorBit(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public isIrreducible()Z
    .locals 8

    .line 1
    invoke-virtual {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->isZero()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    new-instance v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->reduceN()V

    .line 15
    .line 16
    .line 17
    iget p0, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 18
    .line 19
    add-int/lit8 v2, p0, -0x1

    .line 20
    .line 21
    new-instance v3, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 22
    .line 23
    const-string v4, "X"

    .line 24
    .line 25
    invoke-direct {v3, p0, v4}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;-><init>(ILjava/lang/String;)V

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x1

    .line 29
    move v5, p0

    .line 30
    :goto_0
    shr-int/lit8 v6, v2, 0x1

    .line 31
    .line 32
    if-gt v5, v6, :cond_3

    .line 33
    .line 34
    invoke-virtual {v3}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->squareThisPreCalc()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v3, v0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->remainder(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    new-instance v6, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 42
    .line 43
    const/16 v7, 0x20

    .line 44
    .line 45
    invoke-direct {v6, v7, v4}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;-><init>(ILjava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v3, v6}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->add(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 49
    .line 50
    .line 51
    move-result-object v6

    .line 52
    invoke-virtual {v6}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->isZero()Z

    .line 53
    .line 54
    .line 55
    move-result v7

    .line 56
    if-nez v7, :cond_2

    .line 57
    .line 58
    invoke-virtual {v0, v6}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->gcd(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 59
    .line 60
    .line 61
    move-result-object v6

    .line 62
    invoke-virtual {v6}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->isOne()Z

    .line 63
    .line 64
    .line 65
    move-result v6

    .line 66
    if-nez v6, :cond_1

    .line 67
    .line 68
    return v1

    .line 69
    :cond_1
    add-int/lit8 v5, v5, 0x1

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_2
    return v1

    .line 73
    :cond_3
    return p0
.end method

.method public isOne()Z
    .locals 5

    .line 1
    const/4 v0, 0x1

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    .line 4
    .line 5
    iget-object v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 6
    .line 7
    const/4 v4, 0x0

    .line 8
    if-ge v1, v2, :cond_1

    .line 9
    .line 10
    aget v2, v3, v1

    .line 11
    .line 12
    if-eqz v2, :cond_0

    .line 13
    .line 14
    return v4

    .line 15
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_1
    aget p0, v3, v4

    .line 19
    .line 20
    if-eq p0, v0, :cond_2

    .line 21
    .line 22
    return v4

    .line 23
    :cond_2
    return v0
.end method

.method public isZero()Z
    .locals 4

    .line 1
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    const/4 v0, 0x0

    .line 8
    move v2, v0

    .line 9
    :goto_0
    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    .line 10
    .line 11
    if-ge v2, v3, :cond_2

    .line 12
    .line 13
    iget-object v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 14
    .line 15
    aget v3, v3, v2

    .line 16
    .line 17
    if-eqz v3, :cond_1

    .line 18
    .line 19
    return v0

    .line 20
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_2
    return v1
.end method

.method public multiply(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;
    .locals 2

    .line 1
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 2
    .line 3
    iget v1, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 4
    .line 5
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p0, v0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->expandN(I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1, v0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->expandN(I)V

    .line 13
    .line 14
    .line 15
    invoke-direct {p0, p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->karaMult(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public multiplyClassic(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;
    .locals 7

    .line 1
    new-instance v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 2
    .line 3
    iget v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 4
    .line 5
    iget v2, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 6
    .line 7
    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const/4 v2, 0x1

    .line 12
    shl-int/2addr v1, v2

    .line 13
    invoke-direct {v0, v1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;-><init>(I)V

    .line 14
    .line 15
    .line 16
    const/16 v1, 0x20

    .line 17
    .line 18
    new-array v1, v1, [Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 19
    .line 20
    new-instance v3, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 21
    .line 22
    invoke-direct {v3, p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)V

    .line 23
    .line 24
    .line 25
    const/4 p0, 0x0

    .line 26
    aput-object v3, v1, p0

    .line 27
    .line 28
    :goto_0
    const/16 v3, 0x1f

    .line 29
    .line 30
    if-gt v2, v3, :cond_0

    .line 31
    .line 32
    add-int/lit8 v3, v2, -0x1

    .line 33
    .line 34
    aget-object v3, v1, v3

    .line 35
    .line 36
    invoke-virtual {v3}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->shiftLeft()Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    aput-object v3, v1, v2

    .line 41
    .line 42
    add-int/lit8 v2, v2, 0x1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    move v2, p0

    .line 46
    :goto_1
    iget v4, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    .line 47
    .line 48
    if-ge v2, v4, :cond_4

    .line 49
    .line 50
    move v4, p0

    .line 51
    :goto_2
    if-gt v4, v3, :cond_2

    .line 52
    .line 53
    iget-object v5, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 54
    .line 55
    aget v5, v5, v2

    .line 56
    .line 57
    sget-object v6, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->bitMask:[I

    .line 58
    .line 59
    aget v6, v6, v4

    .line 60
    .line 61
    and-int/2addr v5, v6

    .line 62
    if-eqz v5, :cond_1

    .line 63
    .line 64
    aget-object v5, v1, v4

    .line 65
    .line 66
    invoke-virtual {v0, v5}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->xorThisBy(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)V

    .line 67
    .line 68
    .line 69
    :cond_1
    add-int/lit8 v4, v4, 0x1

    .line 70
    .line 71
    goto :goto_2

    .line 72
    :cond_2
    move v4, p0

    .line 73
    :goto_3
    if-gt v4, v3, :cond_3

    .line 74
    .line 75
    aget-object v5, v1, v4

    .line 76
    .line 77
    invoke-virtual {v5}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->shiftBlocksLeft()V

    .line 78
    .line 79
    .line 80
    add-int/lit8 v4, v4, 0x1

    .line 81
    .line 82
    goto :goto_3

    .line 83
    :cond_3
    add-int/lit8 v2, v2, 0x1

    .line 84
    .line 85
    goto :goto_1

    .line 86
    :cond_4
    return-object v0
.end method

.method public quotient(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/RuntimeException;
        }
    .end annotation

    .line 1
    new-instance v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 2
    .line 3
    iget v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;-><init>(I)V

    .line 6
    .line 7
    .line 8
    new-instance v1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)V

    .line 11
    .line 12
    .line 13
    new-instance p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 14
    .line 15
    invoke-direct {p0, p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->isZero()Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-nez p1, :cond_2

    .line 23
    .line 24
    invoke-virtual {v1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->reduceN()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->reduceN()V

    .line 28
    .line 29
    .line 30
    iget p1, v1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 31
    .line 32
    iget v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 33
    .line 34
    if-ge p1, v2, :cond_0

    .line 35
    .line 36
    new-instance p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 37
    .line 38
    const/4 p1, 0x0

    .line 39
    invoke-direct {p0, p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;-><init>(I)V

    .line 40
    .line 41
    .line 42
    return-object p0

    .line 43
    :cond_0
    sub-int/2addr p1, v2

    .line 44
    add-int/lit8 v2, p1, 0x1

    .line 45
    .line 46
    invoke-virtual {v0, v2}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->expandN(I)V

    .line 47
    .line 48
    .line 49
    :goto_0
    if-ltz p1, :cond_1

    .line 50
    .line 51
    invoke-virtual {p0, p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->shiftLeft(I)Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-virtual {v1, v2}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->subtractFromThis(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->reduceN()V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->xorBit(I)V

    .line 62
    .line 63
    .line 64
    iget p1, v1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 65
    .line 66
    iget v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 67
    .line 68
    sub-int/2addr p1, v2

    .line 69
    goto :goto_0

    .line 70
    :cond_1
    return-object v0

    .line 71
    :cond_2
    invoke-static {}, Ll/olk0;->a()V

    .line 72
    .line 73
    .line 74
    const/4 p0, 0x0

    .line 75
    return-object p0
.end method

.method public randomize()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    .line 3
    .line 4
    if-ge v0, v1, :cond_0

    .line 5
    .line 6
    iget-object v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 7
    .line 8
    sget-object v2, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->rand:Ljava/util/Random;

    .line 9
    .line 10
    invoke-virtual {v2}, Ljava/util/Random;->nextInt()I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    aput v2, v1, v0

    .line 15
    .line 16
    add-int/lit8 v0, v0, 0x1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    invoke-direct {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->zeroUnusedBits()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public randomize(Ljava/util/Random;)V
    .locals 3

    const/4 v0, 0x0

    .line 23
    :goto_0
    iget v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    if-ge v0, v1, :cond_0

    .line 24
    iget-object v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    invoke-virtual {p1}, Ljava/util/Random;->nextInt()I

    move-result v2

    aput v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 25
    :cond_0
    invoke-direct {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->zeroUnusedBits()V

    return-void
.end method

.method public reduceN()V
    .locals 3

    .line 1
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, -0x1

    .line 4
    .line 5
    :goto_0
    iget-object v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 6
    .line 7
    aget v1, v1, v0

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    if-lez v0, :cond_0

    .line 12
    .line 13
    add-int/lit8 v0, v0, -0x1

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v2, 0x0

    .line 17
    :goto_1
    if-eqz v1, :cond_1

    .line 18
    .line 19
    ushr-int/lit8 v1, v1, 0x1

    .line 20
    .line 21
    add-int/lit8 v2, v2, 0x1

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_1
    shl-int/lit8 v1, v0, 0x5

    .line 25
    .line 26
    add-int/2addr v1, v2

    .line 27
    iput v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 28
    .line 29
    add-int/lit8 v0, v0, 0x1

    .line 30
    .line 31
    iput v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    .line 32
    .line 33
    return-void
.end method

.method public reducePentanomial(I[I)V
    .locals 22

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p1

    .line 4
    .line 5
    ushr-int/lit8 v2, v1, 0x5

    .line 6
    .line 7
    and-int/lit8 v3, v1, 0x1f

    .line 8
    .line 9
    rsub-int/lit8 v4, v3, 0x20

    .line 10
    .line 11
    const/4 v5, 0x0

    .line 12
    aget v6, p2, v5

    .line 13
    .line 14
    sub-int v7, v1, v6

    .line 15
    .line 16
    ushr-int/lit8 v7, v7, 0x5

    .line 17
    .line 18
    sub-int v6, v1, v6

    .line 19
    .line 20
    and-int/lit8 v6, v6, 0x1f

    .line 21
    .line 22
    rsub-int/lit8 v6, v6, 0x20

    .line 23
    .line 24
    const/4 v8, 0x1

    .line 25
    aget v9, p2, v8

    .line 26
    .line 27
    sub-int v10, v1, v9

    .line 28
    .line 29
    ushr-int/lit8 v10, v10, 0x5

    .line 30
    .line 31
    sub-int v9, v1, v9

    .line 32
    .line 33
    and-int/lit8 v9, v9, 0x1f

    .line 34
    .line 35
    rsub-int/lit8 v9, v9, 0x20

    .line 36
    .line 37
    const/4 v11, 0x2

    .line 38
    aget v12, p2, v11

    .line 39
    .line 40
    sub-int v13, v1, v12

    .line 41
    .line 42
    ushr-int/lit8 v13, v13, 0x5

    .line 43
    .line 44
    sub-int v12, v1, v12

    .line 45
    .line 46
    and-int/lit8 v12, v12, 0x1f

    .line 47
    .line 48
    rsub-int/lit8 v12, v12, 0x20

    .line 49
    .line 50
    shl-int/lit8 v14, v1, 0x1

    .line 51
    .line 52
    sub-int/2addr v14, v11

    .line 53
    ushr-int/lit8 v11, v14, 0x5

    .line 54
    .line 55
    :goto_0
    iget-object v14, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 56
    .line 57
    const-wide v15, 0xffffffffL

    .line 58
    .line 59
    .line 60
    .line 61
    .line 62
    if-le v11, v2, :cond_0

    .line 63
    .line 64
    move/from16 v17, v5

    .line 65
    .line 66
    aget v5, v14, v11

    .line 67
    .line 68
    move/from16 v18, v8

    .line 69
    .line 70
    move/from16 v19, v9

    .line 71
    .line 72
    int-to-long v8, v5

    .line 73
    and-long/2addr v8, v15

    .line 74
    sub-int v5, v11, v2

    .line 75
    .line 76
    add-int/lit8 v15, v5, -0x1

    .line 77
    .line 78
    aget v16, v14, v15

    .line 79
    .line 80
    move/from16 v20, v2

    .line 81
    .line 82
    move/from16 v21, v3

    .line 83
    .line 84
    shl-long v2, v8, v4

    .line 85
    .line 86
    long-to-int v2, v2

    .line 87
    xor-int v2, v16, v2

    .line 88
    .line 89
    aput v2, v14, v15

    .line 90
    .line 91
    aget v2, v14, v5

    .line 92
    .line 93
    int-to-long v2, v2

    .line 94
    rsub-int/lit8 v15, v4, 0x20

    .line 95
    .line 96
    ushr-long v15, v8, v15

    .line 97
    .line 98
    xor-long/2addr v2, v15

    .line 99
    long-to-int v2, v2

    .line 100
    aput v2, v14, v5

    .line 101
    .line 102
    sub-int v2, v11, v7

    .line 103
    .line 104
    add-int/lit8 v3, v2, -0x1

    .line 105
    .line 106
    aget v5, v14, v3

    .line 107
    .line 108
    move/from16 p2, v2

    .line 109
    .line 110
    move v15, v3

    .line 111
    shl-long v2, v8, v6

    .line 112
    .line 113
    long-to-int v2, v2

    .line 114
    xor-int/2addr v2, v5

    .line 115
    aput v2, v14, v15

    .line 116
    .line 117
    aget v2, v14, p2

    .line 118
    .line 119
    int-to-long v2, v2

    .line 120
    rsub-int/lit8 v5, v6, 0x20

    .line 121
    .line 122
    ushr-long v15, v8, v5

    .line 123
    .line 124
    xor-long/2addr v2, v15

    .line 125
    long-to-int v2, v2

    .line 126
    aput v2, v14, p2

    .line 127
    .line 128
    sub-int v2, v11, v10

    .line 129
    .line 130
    add-int/lit8 v3, v2, -0x1

    .line 131
    .line 132
    aget v5, v14, v3

    .line 133
    .line 134
    move/from16 p2, v2

    .line 135
    .line 136
    move v15, v3

    .line 137
    shl-long v2, v8, v19

    .line 138
    .line 139
    long-to-int v2, v2

    .line 140
    xor-int/2addr v2, v5

    .line 141
    aput v2, v14, v15

    .line 142
    .line 143
    aget v2, v14, p2

    .line 144
    .line 145
    int-to-long v2, v2

    .line 146
    rsub-int/lit8 v5, v19, 0x20

    .line 147
    .line 148
    ushr-long v15, v8, v5

    .line 149
    .line 150
    xor-long/2addr v2, v15

    .line 151
    long-to-int v2, v2

    .line 152
    aput v2, v14, p2

    .line 153
    .line 154
    sub-int v2, v11, v13

    .line 155
    .line 156
    add-int/lit8 v3, v2, -0x1

    .line 157
    .line 158
    aget v5, v14, v3

    .line 159
    .line 160
    move/from16 p2, v2

    .line 161
    .line 162
    move v15, v3

    .line 163
    shl-long v2, v8, v12

    .line 164
    .line 165
    long-to-int v2, v2

    .line 166
    xor-int/2addr v2, v5

    .line 167
    aput v2, v14, v15

    .line 168
    .line 169
    aget v2, v14, p2

    .line 170
    .line 171
    int-to-long v2, v2

    .line 172
    rsub-int/lit8 v5, v12, 0x20

    .line 173
    .line 174
    ushr-long/2addr v8, v5

    .line 175
    xor-long/2addr v2, v8

    .line 176
    long-to-int v2, v2

    .line 177
    aput v2, v14, p2

    .line 178
    .line 179
    aput v17, v14, v11

    .line 180
    .line 181
    add-int/lit8 v11, v11, -0x1

    .line 182
    .line 183
    move/from16 v5, v17

    .line 184
    .line 185
    move/from16 v8, v18

    .line 186
    .line 187
    move/from16 v9, v19

    .line 188
    .line 189
    move/from16 v2, v20

    .line 190
    .line 191
    move/from16 v3, v21

    .line 192
    .line 193
    goto/16 :goto_0

    .line 194
    .line 195
    :cond_0
    move/from16 v20, v2

    .line 196
    .line 197
    move/from16 v21, v3

    .line 198
    .line 199
    move/from16 v17, v5

    .line 200
    .line 201
    move/from16 v18, v8

    .line 202
    .line 203
    move/from16 v19, v9

    .line 204
    .line 205
    aget v2, v14, v20

    .line 206
    .line 207
    int-to-long v2, v2

    .line 208
    and-long/2addr v2, v15

    .line 209
    shl-long v8, v15, v21

    .line 210
    .line 211
    and-long/2addr v2, v8

    .line 212
    aget v5, v14, v17

    .line 213
    .line 214
    int-to-long v8, v5

    .line 215
    rsub-int/lit8 v4, v4, 0x20

    .line 216
    .line 217
    ushr-long v4, v2, v4

    .line 218
    .line 219
    xor-long/2addr v4, v8

    .line 220
    long-to-int v4, v4

    .line 221
    aput v4, v14, v17

    .line 222
    .line 223
    sub-int v4, v20, v7

    .line 224
    .line 225
    add-int/lit8 v5, v4, -0x1

    .line 226
    .line 227
    if-ltz v5, :cond_1

    .line 228
    .line 229
    aget v7, v14, v5

    .line 230
    .line 231
    shl-long v8, v2, v6

    .line 232
    .line 233
    long-to-int v8, v8

    .line 234
    xor-int/2addr v7, v8

    .line 235
    aput v7, v14, v5

    .line 236
    .line 237
    :cond_1
    aget v5, v14, v4

    .line 238
    .line 239
    int-to-long v7, v5

    .line 240
    rsub-int/lit8 v5, v6, 0x20

    .line 241
    .line 242
    ushr-long v5, v2, v5

    .line 243
    .line 244
    xor-long/2addr v5, v7

    .line 245
    long-to-int v5, v5

    .line 246
    aput v5, v14, v4

    .line 247
    .line 248
    sub-int v4, v20, v10

    .line 249
    .line 250
    add-int/lit8 v5, v4, -0x1

    .line 251
    .line 252
    if-ltz v5, :cond_2

    .line 253
    .line 254
    aget v6, v14, v5

    .line 255
    .line 256
    shl-long v7, v2, v19

    .line 257
    .line 258
    long-to-int v7, v7

    .line 259
    xor-int/2addr v6, v7

    .line 260
    aput v6, v14, v5

    .line 261
    .line 262
    :cond_2
    aget v5, v14, v4

    .line 263
    .line 264
    int-to-long v5, v5

    .line 265
    rsub-int/lit8 v7, v19, 0x20

    .line 266
    .line 267
    ushr-long v7, v2, v7

    .line 268
    .line 269
    xor-long/2addr v5, v7

    .line 270
    long-to-int v5, v5

    .line 271
    aput v5, v14, v4

    .line 272
    .line 273
    sub-int v4, v20, v13

    .line 274
    .line 275
    add-int/lit8 v5, v4, -0x1

    .line 276
    .line 277
    if-ltz v5, :cond_3

    .line 278
    .line 279
    aget v6, v14, v5

    .line 280
    .line 281
    shl-long v7, v2, v12

    .line 282
    .line 283
    long-to-int v7, v7

    .line 284
    xor-int/2addr v6, v7

    .line 285
    aput v6, v14, v5

    .line 286
    .line 287
    :cond_3
    aget v5, v14, v4

    .line 288
    .line 289
    int-to-long v5, v5

    .line 290
    rsub-int/lit8 v7, v12, 0x20

    .line 291
    .line 292
    ushr-long/2addr v2, v7

    .line 293
    xor-long/2addr v2, v5

    .line 294
    long-to-int v2, v2

    .line 295
    aput v2, v14, v4

    .line 296
    .line 297
    aget v2, v14, v20

    .line 298
    .line 299
    sget-object v3, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->reverseRightMask:[I

    .line 300
    .line 301
    aget v3, v3, v21

    .line 302
    .line 303
    and-int/2addr v2, v3

    .line 304
    aput v2, v14, v20

    .line 305
    .line 306
    add-int/lit8 v2, v1, -0x1

    .line 307
    .line 308
    ushr-int/lit8 v2, v2, 0x5

    .line 309
    .line 310
    add-int/lit8 v2, v2, 0x1

    .line 311
    .line 312
    iput v2, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    .line 313
    .line 314
    iput v1, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 315
    .line 316
    return-void
.end method

.method public reduceTrinomial(II)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p1

    .line 4
    .line 5
    ushr-int/lit8 v2, v1, 0x5

    .line 6
    .line 7
    and-int/lit8 v3, v1, 0x1f

    .line 8
    .line 9
    rsub-int/lit8 v4, v3, 0x20

    .line 10
    .line 11
    sub-int v5, v1, p2

    .line 12
    .line 13
    ushr-int/lit8 v6, v5, 0x5

    .line 14
    .line 15
    and-int/lit8 v5, v5, 0x1f

    .line 16
    .line 17
    rsub-int/lit8 v5, v5, 0x20

    .line 18
    .line 19
    shl-int/lit8 v7, v1, 0x1

    .line 20
    .line 21
    add-int/lit8 v7, v7, -0x2

    .line 22
    .line 23
    ushr-int/lit8 v7, v7, 0x5

    .line 24
    .line 25
    :goto_0
    iget-object v8, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 26
    .line 27
    const-wide v10, 0xffffffffL

    .line 28
    .line 29
    .line 30
    .line 31
    .line 32
    if-le v7, v2, :cond_0

    .line 33
    .line 34
    aget v12, v8, v7

    .line 35
    .line 36
    int-to-long v12, v12

    .line 37
    and-long/2addr v10, v12

    .line 38
    sub-int v12, v7, v2

    .line 39
    .line 40
    add-int/lit8 v13, v12, -0x1

    .line 41
    .line 42
    aget v14, v8, v13

    .line 43
    .line 44
    move-wide v15, v10

    .line 45
    const/16 p2, 0x0

    .line 46
    .line 47
    shl-long v9, v15, v4

    .line 48
    .line 49
    long-to-int v9, v9

    .line 50
    xor-int/2addr v9, v14

    .line 51
    aput v9, v8, v13

    .line 52
    .line 53
    aget v9, v8, v12

    .line 54
    .line 55
    int-to-long v9, v9

    .line 56
    rsub-int/lit8 v11, v4, 0x20

    .line 57
    .line 58
    ushr-long v13, v15, v11

    .line 59
    .line 60
    xor-long/2addr v9, v13

    .line 61
    long-to-int v9, v9

    .line 62
    aput v9, v8, v12

    .line 63
    .line 64
    sub-int v9, v7, v6

    .line 65
    .line 66
    add-int/lit8 v10, v9, -0x1

    .line 67
    .line 68
    aget v11, v8, v10

    .line 69
    .line 70
    shl-long v12, v15, v5

    .line 71
    .line 72
    long-to-int v12, v12

    .line 73
    xor-int/2addr v11, v12

    .line 74
    aput v11, v8, v10

    .line 75
    .line 76
    aget v10, v8, v9

    .line 77
    .line 78
    int-to-long v10, v10

    .line 79
    rsub-int/lit8 v12, v5, 0x20

    .line 80
    .line 81
    ushr-long v12, v15, v12

    .line 82
    .line 83
    xor-long/2addr v10, v12

    .line 84
    long-to-int v10, v10

    .line 85
    aput v10, v8, v9

    .line 86
    .line 87
    aput p2, v8, v7

    .line 88
    .line 89
    add-int/lit8 v7, v7, -0x1

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_0
    const/16 p2, 0x0

    .line 93
    .line 94
    aget v7, v8, v2

    .line 95
    .line 96
    int-to-long v12, v7

    .line 97
    and-long/2addr v12, v10

    .line 98
    shl-long v9, v10, v3

    .line 99
    .line 100
    and-long/2addr v9, v12

    .line 101
    aget v7, v8, p2

    .line 102
    .line 103
    int-to-long v11, v7

    .line 104
    rsub-int/lit8 v4, v4, 0x20

    .line 105
    .line 106
    ushr-long v13, v9, v4

    .line 107
    .line 108
    xor-long/2addr v11, v13

    .line 109
    long-to-int v4, v11

    .line 110
    aput v4, v8, p2

    .line 111
    .line 112
    sub-int v4, v2, v6

    .line 113
    .line 114
    add-int/lit8 v6, v4, -0x1

    .line 115
    .line 116
    if-ltz v6, :cond_1

    .line 117
    .line 118
    aget v7, v8, v6

    .line 119
    .line 120
    shl-long v11, v9, v5

    .line 121
    .line 122
    long-to-int v11, v11

    .line 123
    xor-int/2addr v7, v11

    .line 124
    aput v7, v8, v6

    .line 125
    .line 126
    :cond_1
    aget v6, v8, v4

    .line 127
    .line 128
    int-to-long v6, v6

    .line 129
    rsub-int/lit8 v5, v5, 0x20

    .line 130
    .line 131
    ushr-long/2addr v9, v5

    .line 132
    xor-long v5, v6, v9

    .line 133
    .line 134
    long-to-int v5, v5

    .line 135
    aput v5, v8, v4

    .line 136
    .line 137
    aget v4, v8, v2

    .line 138
    .line 139
    sget-object v5, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->reverseRightMask:[I

    .line 140
    .line 141
    aget v3, v5, v3

    .line 142
    .line 143
    and-int/2addr v3, v4

    .line 144
    aput v3, v8, v2

    .line 145
    .line 146
    add-int/lit8 v2, v1, -0x1

    .line 147
    .line 148
    ushr-int/lit8 v2, v2, 0x5

    .line 149
    .line 150
    add-int/lit8 v2, v2, 0x1

    .line 151
    .line 152
    iput v2, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    .line 153
    .line 154
    iput v1, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 155
    .line 156
    return-void
.end method

.method public remainder(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/RuntimeException;
        }
    .end annotation

    .line 1
    new-instance v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)V

    .line 4
    .line 5
    .line 6
    new-instance p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 7
    .line 8
    invoke-direct {p0, p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->isZero()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-nez p1, :cond_2

    .line 16
    .line 17
    invoke-virtual {v0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->reduceN()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->reduceN()V

    .line 21
    .line 22
    .line 23
    iget p1, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 24
    .line 25
    iget v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 26
    .line 27
    if-ge p1, v1, :cond_0

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_0
    :goto_0
    sub-int/2addr p1, v1

    .line 31
    if-ltz p1, :cond_1

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->shiftLeft(I)Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {v0, p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->subtractFromThis(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->reduceN()V

    .line 41
    .line 42
    .line 43
    iget p1, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 44
    .line 45
    iget v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    :goto_1
    return-object v0

    .line 49
    :cond_2
    invoke-static {}, Ll/olk0;->a()V

    .line 50
    .line 51
    .line 52
    const/4 p0, 0x0

    .line 53
    return-object p0
.end method

.method public resetBit(I)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/RuntimeException;
        }
    .end annotation

    .line 1
    if-ltz p1, :cond_1

    .line 2
    .line 3
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 4
    .line 5
    add-int/lit8 v0, v0, -0x1

    .line 6
    .line 7
    if-le p1, v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object p0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 11
    .line 12
    ushr-int/lit8 v0, p1, 0x5

    .line 13
    .line 14
    aget v1, p0, v0

    .line 15
    .line 16
    sget-object v2, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->bitMask:[I

    .line 17
    .line 18
    and-int/lit8 p1, p1, 0x1f

    .line 19
    .line 20
    aget p1, v2, p1

    .line 21
    .line 22
    not-int p1, p1

    .line 23
    and-int/2addr p1, v1

    .line 24
    aput p1, p0, v0

    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    invoke-static {}, Ll/olk0;->a()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public setBit(I)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/RuntimeException;
        }
    .end annotation

    .line 1
    if-ltz p1, :cond_0

    .line 2
    .line 3
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 4
    .line 5
    add-int/lit8 v0, v0, -0x1

    .line 6
    .line 7
    if-gt p1, v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 10
    .line 11
    ushr-int/lit8 v0, p1, 0x5

    .line 12
    .line 13
    aget v1, p0, v0

    .line 14
    .line 15
    sget-object v2, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->bitMask:[I

    .line 16
    .line 17
    and-int/lit8 p1, p1, 0x1f

    .line 18
    .line 19
    aget p1, v2, p1

    .line 20
    .line 21
    or-int/2addr p1, v1

    .line 22
    aput p1, p0, v0

    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-static {}, Ll/olk0;->a()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public shiftBlocksLeft()V
    .locals 6

    .line 1
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    .line 2
    .line 3
    add-int/lit8 v1, v0, 0x1

    .line 4
    .line 5
    iput v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    .line 6
    .line 7
    iget v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 8
    .line 9
    add-int/lit8 v2, v2, 0x20

    .line 10
    .line 11
    iput v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 12
    .line 13
    iget-object v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 14
    .line 15
    array-length v3, v2

    .line 16
    const/4 v4, 0x0

    .line 17
    const/4 v5, 0x1

    .line 18
    if-gt v1, v3, :cond_1

    .line 19
    .line 20
    :goto_0
    iget-object v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 21
    .line 22
    if-lt v0, v5, :cond_0

    .line 23
    .line 24
    add-int/lit8 v2, v0, -0x1

    .line 25
    .line 26
    aget v2, v1, v2

    .line 27
    .line 28
    aput v2, v1, v0

    .line 29
    .line 30
    add-int/lit8 v0, v0, -0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    aput v4, v1, v4

    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    new-array v1, v1, [I

    .line 37
    .line 38
    invoke-static {v2, v4, v1, v5, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 39
    .line 40
    .line 41
    iput-object v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 42
    .line 43
    return-void
.end method

.method public shiftLeft()Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;
    .locals 5

    .line 58
    new-instance v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    iget v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    const/4 v2, 0x1

    add-int/2addr v1, v2

    iget-object p0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    invoke-direct {v0, v1, p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;-><init>(I[I)V

    .line 59
    iget p0, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    sub-int/2addr p0, v2

    .line 60
    :goto_0
    iget-object v1, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    if-lt p0, v2, :cond_0

    .line 61
    aget v3, v1, p0

    shl-int/2addr v3, v2

    aput v3, v1, p0

    add-int/lit8 v4, p0, -0x1

    .line 62
    aget v4, v1, v4

    ushr-int/lit8 v4, v4, 0x1f

    or-int/2addr v3, v4

    aput v3, v1, p0

    add-int/lit8 p0, p0, -0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    .line 63
    aget v3, v1, p0

    shl-int/lit8 v2, v3, 0x1

    aput v2, v1, p0

    return-object v0
.end method

.method public shiftLeft(I)Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;
    .locals 6

    .line 1
    new-instance v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 2
    .line 3
    iget v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 4
    .line 5
    add-int/2addr v1, p1

    .line 6
    iget-object p0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 7
    .line 8
    invoke-direct {v0, v1, p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;-><init>(I[I)V

    .line 9
    .line 10
    .line 11
    const/16 p0, 0x20

    .line 12
    .line 13
    if-lt p1, p0, :cond_0

    .line 14
    .line 15
    ushr-int/lit8 p0, p1, 0x5

    .line 16
    .line 17
    invoke-direct {v0, p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->doShiftBlocksLeft(I)V

    .line 18
    .line 19
    .line 20
    :cond_0
    and-int/lit8 p0, p1, 0x1f

    .line 21
    .line 22
    if-eqz p0, :cond_2

    .line 23
    .line 24
    iget p1, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    .line 25
    .line 26
    const/4 v1, 0x1

    .line 27
    sub-int/2addr p1, v1

    .line 28
    :goto_0
    iget-object v2, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 29
    .line 30
    if-lt p1, v1, :cond_1

    .line 31
    .line 32
    aget v3, v2, p1

    .line 33
    .line 34
    shl-int/2addr v3, p0

    .line 35
    aput v3, v2, p1

    .line 36
    .line 37
    add-int/lit8 v4, p1, -0x1

    .line 38
    .line 39
    aget v4, v2, v4

    .line 40
    .line 41
    rsub-int/lit8 v5, p0, 0x20

    .line 42
    .line 43
    ushr-int/2addr v4, v5

    .line 44
    or-int/2addr v3, v4

    .line 45
    aput v3, v2, p1

    .line 46
    .line 47
    add-int/lit8 p1, p1, -0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    const/4 p1, 0x0

    .line 51
    aget v1, v2, p1

    .line 52
    .line 53
    shl-int p0, v1, p0

    .line 54
    .line 55
    aput p0, v2, p1

    .line 56
    .line 57
    :cond_2
    return-object v0
.end method

.method public shiftLeftAddThis(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;I)V
    .locals 8

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->addToThis(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)V

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    iget v0, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 8
    .line 9
    add-int/2addr v0, p2

    .line 10
    invoke-virtual {p0, v0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->expandN(I)V

    .line 11
    .line 12
    .line 13
    ushr-int/lit8 v0, p2, 0x5

    .line 14
    .line 15
    iget v1, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    .line 16
    .line 17
    add-int/lit8 v1, v1, -0x1

    .line 18
    .line 19
    :goto_0
    if-ltz v1, :cond_2

    .line 20
    .line 21
    add-int v2, v1, v0

    .line 22
    .line 23
    add-int/lit8 v3, v2, 0x1

    .line 24
    .line 25
    iget v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    .line 26
    .line 27
    if-ge v3, v4, :cond_1

    .line 28
    .line 29
    and-int/lit8 v4, p2, 0x1f

    .line 30
    .line 31
    if-eqz v4, :cond_1

    .line 32
    .line 33
    iget-object v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 34
    .line 35
    aget v6, v5, v3

    .line 36
    .line 37
    iget-object v7, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 38
    .line 39
    aget v7, v7, v1

    .line 40
    .line 41
    rsub-int/lit8 v4, v4, 0x20

    .line 42
    .line 43
    ushr-int v4, v7, v4

    .line 44
    .line 45
    xor-int/2addr v4, v6

    .line 46
    aput v4, v5, v3

    .line 47
    .line 48
    :cond_1
    iget-object v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 49
    .line 50
    aget v4, v3, v2

    .line 51
    .line 52
    iget-object v5, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 53
    .line 54
    aget v5, v5, v1

    .line 55
    .line 56
    and-int/lit8 v6, p2, 0x1f

    .line 57
    .line 58
    shl-int/2addr v5, v6

    .line 59
    xor-int/2addr v4, v5

    .line 60
    aput v4, v3, v2

    .line 61
    .line 62
    add-int/lit8 v1, v1, -0x1

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_2
    return-void
.end method

.method public shiftLeftThis()V
    .locals 6

    .line 1
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 2
    .line 3
    and-int/lit8 v1, v0, 0x1f

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    if-nez v1, :cond_2

    .line 8
    .line 9
    add-int/2addr v0, v3

    .line 10
    iput v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 11
    .line 12
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    .line 13
    .line 14
    add-int/2addr v0, v3

    .line 15
    iput v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    .line 16
    .line 17
    iget-object v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 18
    .line 19
    array-length v4, v1

    .line 20
    if-le v0, v4, :cond_0

    .line 21
    .line 22
    new-array v0, v0, [I

    .line 23
    .line 24
    array-length v4, v1

    .line 25
    invoke-static {v1, v2, v0, v2, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 29
    .line 30
    :cond_0
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    .line 31
    .line 32
    sub-int/2addr v0, v3

    .line 33
    :goto_0
    if-lt v0, v3, :cond_1

    .line 34
    .line 35
    iget-object v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 36
    .line 37
    aget v2, v1, v0

    .line 38
    .line 39
    add-int/lit8 v4, v0, -0x1

    .line 40
    .line 41
    aget v5, v1, v4

    .line 42
    .line 43
    ushr-int/lit8 v5, v5, 0x1f

    .line 44
    .line 45
    or-int/2addr v2, v5

    .line 46
    aput v2, v1, v0

    .line 47
    .line 48
    aget v2, v1, v4

    .line 49
    .line 50
    shl-int/2addr v2, v3

    .line 51
    aput v2, v1, v4

    .line 52
    .line 53
    add-int/lit8 v0, v0, -0x1

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    return-void

    .line 57
    :cond_2
    add-int/2addr v0, v3

    .line 58
    iput v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 59
    .line 60
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    .line 61
    .line 62
    sub-int/2addr v0, v3

    .line 63
    :goto_1
    iget-object v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 64
    .line 65
    if-lt v0, v3, :cond_3

    .line 66
    .line 67
    aget v4, v1, v0

    .line 68
    .line 69
    shl-int/2addr v4, v3

    .line 70
    aput v4, v1, v0

    .line 71
    .line 72
    add-int/lit8 v5, v0, -0x1

    .line 73
    .line 74
    aget v5, v1, v5

    .line 75
    .line 76
    ushr-int/lit8 v5, v5, 0x1f

    .line 77
    .line 78
    or-int/2addr v4, v5

    .line 79
    aput v4, v1, v0

    .line 80
    .line 81
    add-int/lit8 v0, v0, -0x1

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_3
    aget p0, v1, v2

    .line 85
    .line 86
    shl-int/2addr p0, v3

    .line 87
    aput p0, v1, v2

    .line 88
    .line 89
    return-void
.end method

.method public shiftRight()Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;
    .locals 6

    .line 1
    new-instance v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 2
    .line 3
    iget v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 4
    .line 5
    add-int/lit8 v1, v1, -0x1

    .line 6
    .line 7
    invoke-direct {v0, v1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;-><init>(I)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 11
    .line 12
    iget-object v2, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 13
    .line 14
    iget v3, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    .line 15
    .line 16
    const/4 v4, 0x0

    .line 17
    invoke-static {v1, v4, v2, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 18
    .line 19
    .line 20
    :goto_0
    iget v1, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    .line 21
    .line 22
    add-int/lit8 v2, v1, -0x2

    .line 23
    .line 24
    iget-object v3, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 25
    .line 26
    if-gt v4, v2, :cond_0

    .line 27
    .line 28
    aget v1, v3, v4

    .line 29
    .line 30
    ushr-int/lit8 v1, v1, 0x1

    .line 31
    .line 32
    aput v1, v3, v4

    .line 33
    .line 34
    add-int/lit8 v2, v4, 0x1

    .line 35
    .line 36
    aget v5, v3, v2

    .line 37
    .line 38
    shl-int/lit8 v5, v5, 0x1f

    .line 39
    .line 40
    or-int/2addr v1, v5

    .line 41
    aput v1, v3, v4

    .line 42
    .line 43
    move v4, v2

    .line 44
    goto :goto_0

    .line 45
    :cond_0
    add-int/lit8 v2, v1, -0x1

    .line 46
    .line 47
    aget v4, v3, v2

    .line 48
    .line 49
    ushr-int/lit8 v4, v4, 0x1

    .line 50
    .line 51
    aput v4, v3, v2

    .line 52
    .line 53
    iget v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    .line 54
    .line 55
    if-ge v1, v2, :cond_1

    .line 56
    .line 57
    add-int/lit8 v2, v1, -0x1

    .line 58
    .line 59
    aget v4, v3, v2

    .line 60
    .line 61
    iget-object p0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 62
    .line 63
    aget p0, p0, v1

    .line 64
    .line 65
    shl-int/lit8 p0, p0, 0x1f

    .line 66
    .line 67
    or-int/2addr p0, v4

    .line 68
    aput p0, v3, v2

    .line 69
    .line 70
    :cond_1
    return-object v0
.end method

.method public shiftRightThis()V
    .locals 5

    .line 1
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 2
    .line 3
    add-int/lit8 v1, v0, -0x1

    .line 4
    .line 5
    iput v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 6
    .line 7
    add-int/lit8 v0, v0, -0x2

    .line 8
    .line 9
    ushr-int/lit8 v0, v0, 0x5

    .line 10
    .line 11
    add-int/lit8 v0, v0, 0x1

    .line 12
    .line 13
    iput v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    :goto_0
    iget v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    .line 17
    .line 18
    add-int/lit8 v2, v1, -0x2

    .line 19
    .line 20
    iget-object v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 21
    .line 22
    if-gt v0, v2, :cond_0

    .line 23
    .line 24
    aget v1, v3, v0

    .line 25
    .line 26
    ushr-int/lit8 v1, v1, 0x1

    .line 27
    .line 28
    aput v1, v3, v0

    .line 29
    .line 30
    add-int/lit8 v2, v0, 0x1

    .line 31
    .line 32
    aget v4, v3, v2

    .line 33
    .line 34
    shl-int/lit8 v4, v4, 0x1f

    .line 35
    .line 36
    or-int/2addr v1, v4

    .line 37
    aput v1, v3, v0

    .line 38
    .line 39
    move v0, v2

    .line 40
    goto :goto_0

    .line 41
    :cond_0
    add-int/lit8 v0, v1, -0x1

    .line 42
    .line 43
    aget v2, v3, v0

    .line 44
    .line 45
    ushr-int/lit8 v2, v2, 0x1

    .line 46
    .line 47
    aput v2, v3, v0

    .line 48
    .line 49
    iget p0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 50
    .line 51
    and-int/lit8 p0, p0, 0x1f

    .line 52
    .line 53
    if-nez p0, :cond_1

    .line 54
    .line 55
    add-int/lit8 p0, v1, -0x1

    .line 56
    .line 57
    aget v0, v3, p0

    .line 58
    .line 59
    aget v1, v3, v1

    .line 60
    .line 61
    shl-int/lit8 v1, v1, 0x1f

    .line 62
    .line 63
    or-int/2addr v0, v1

    .line 64
    aput v0, v3, p0

    .line 65
    .line 66
    :cond_1
    return-void
.end method

.method public squareThisBitwise()V
    .locals 9

    .line 1
    invoke-virtual {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->isZero()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    .line 9
    .line 10
    shl-int/lit8 v1, v0, 0x1

    .line 11
    .line 12
    new-array v2, v1, [I

    .line 13
    .line 14
    const/4 v3, 0x1

    .line 15
    sub-int/2addr v0, v3

    .line 16
    :goto_0
    if-ltz v0, :cond_4

    .line 17
    .line 18
    iget-object v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 19
    .line 20
    aget v4, v4, v0

    .line 21
    .line 22
    const/4 v5, 0x0

    .line 23
    move v6, v3

    .line 24
    :goto_1
    const/16 v7, 0x10

    .line 25
    .line 26
    if-ge v5, v7, :cond_3

    .line 27
    .line 28
    and-int/lit8 v7, v4, 0x1

    .line 29
    .line 30
    if-eqz v7, :cond_1

    .line 31
    .line 32
    shl-int/lit8 v7, v0, 0x1

    .line 33
    .line 34
    aget v8, v2, v7

    .line 35
    .line 36
    or-int/2addr v8, v6

    .line 37
    aput v8, v2, v7

    .line 38
    .line 39
    :cond_1
    const/high16 v7, 0x10000

    .line 40
    .line 41
    and-int/2addr v7, v4

    .line 42
    if-eqz v7, :cond_2

    .line 43
    .line 44
    shl-int/lit8 v7, v0, 0x1

    .line 45
    .line 46
    add-int/2addr v7, v3

    .line 47
    aget v8, v2, v7

    .line 48
    .line 49
    or-int/2addr v8, v6

    .line 50
    aput v8, v2, v7

    .line 51
    .line 52
    :cond_2
    shl-int/lit8 v6, v6, 0x2

    .line 53
    .line 54
    ushr-int/lit8 v4, v4, 0x1

    .line 55
    .line 56
    add-int/lit8 v5, v5, 0x1

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_3
    add-int/lit8 v0, v0, -0x1

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_4
    iput-object v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 63
    .line 64
    iput v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    .line 65
    .line 66
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 67
    .line 68
    shl-int/2addr v0, v3

    .line 69
    sub-int/2addr v0, v3

    .line 70
    iput v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 71
    .line 72
    return-void
.end method

.method public squareThisPreCalc()V
    .locals 10

    .line 1
    invoke-virtual {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->isZero()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 9
    .line 10
    array-length v0, v0

    .line 11
    iget v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    .line 12
    .line 13
    shl-int/lit8 v2, v1, 0x1

    .line 14
    .line 15
    const v3, 0xff00

    .line 16
    .line 17
    .line 18
    const/high16 v4, -0x1000000

    .line 19
    .line 20
    const/high16 v5, 0xff0000

    .line 21
    .line 22
    if-lt v0, v2, :cond_2

    .line 23
    .line 24
    add-int/lit8 v1, v1, -0x1

    .line 25
    .line 26
    :goto_0
    if-ltz v1, :cond_1

    .line 27
    .line 28
    iget-object v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 29
    .line 30
    shl-int/lit8 v2, v1, 0x1

    .line 31
    .line 32
    add-int/lit8 v6, v2, 0x1

    .line 33
    .line 34
    sget-object v7, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->squaringTable:[S

    .line 35
    .line 36
    aget v8, v0, v1

    .line 37
    .line 38
    and-int v9, v8, v5

    .line 39
    .line 40
    ushr-int/lit8 v9, v9, 0x10

    .line 41
    .line 42
    aget-short v9, v7, v9

    .line 43
    .line 44
    and-int/2addr v8, v4

    .line 45
    ushr-int/lit8 v8, v8, 0x18

    .line 46
    .line 47
    aget-short v8, v7, v8

    .line 48
    .line 49
    shl-int/lit8 v8, v8, 0x10

    .line 50
    .line 51
    or-int/2addr v8, v9

    .line 52
    aput v8, v0, v6

    .line 53
    .line 54
    aget v6, v0, v1

    .line 55
    .line 56
    and-int/lit16 v8, v6, 0xff

    .line 57
    .line 58
    aget-short v8, v7, v8

    .line 59
    .line 60
    and-int/2addr v6, v3

    .line 61
    ushr-int/lit8 v6, v6, 0x8

    .line 62
    .line 63
    aget-short v6, v7, v6

    .line 64
    .line 65
    shl-int/lit8 v6, v6, 0x10

    .line 66
    .line 67
    or-int/2addr v6, v8

    .line 68
    aput v6, v0, v2

    .line 69
    .line 70
    add-int/lit8 v1, v1, -0x1

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_1
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    .line 74
    .line 75
    shl-int/lit8 v0, v0, 0x1

    .line 76
    .line 77
    iput v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    .line 78
    .line 79
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 80
    .line 81
    shl-int/lit8 v0, v0, 0x1

    .line 82
    .line 83
    add-int/lit8 v0, v0, -0x1

    .line 84
    .line 85
    iput v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 86
    .line 87
    return-void

    .line 88
    :cond_2
    shl-int/lit8 v0, v1, 0x1

    .line 89
    .line 90
    new-array v0, v0, [I

    .line 91
    .line 92
    const/4 v1, 0x0

    .line 93
    :goto_1
    iget v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    .line 94
    .line 95
    if-ge v1, v2, :cond_3

    .line 96
    .line 97
    shl-int/lit8 v2, v1, 0x1

    .line 98
    .line 99
    sget-object v6, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->squaringTable:[S

    .line 100
    .line 101
    iget-object v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 102
    .line 103
    aget v8, v7, v1

    .line 104
    .line 105
    and-int/lit16 v9, v8, 0xff

    .line 106
    .line 107
    aget-short v9, v6, v9

    .line 108
    .line 109
    and-int/2addr v8, v3

    .line 110
    ushr-int/lit8 v8, v8, 0x8

    .line 111
    .line 112
    aget-short v8, v6, v8

    .line 113
    .line 114
    shl-int/lit8 v8, v8, 0x10

    .line 115
    .line 116
    or-int/2addr v8, v9

    .line 117
    aput v8, v0, v2

    .line 118
    .line 119
    add-int/lit8 v2, v2, 0x1

    .line 120
    .line 121
    aget v7, v7, v1

    .line 122
    .line 123
    and-int v8, v7, v5

    .line 124
    .line 125
    ushr-int/lit8 v8, v8, 0x10

    .line 126
    .line 127
    aget-short v8, v6, v8

    .line 128
    .line 129
    and-int/2addr v7, v4

    .line 130
    ushr-int/lit8 v7, v7, 0x18

    .line 131
    .line 132
    aget-short v6, v6, v7

    .line 133
    .line 134
    shl-int/lit8 v6, v6, 0x10

    .line 135
    .line 136
    or-int/2addr v6, v8

    .line 137
    aput v6, v0, v2

    .line 138
    .line 139
    add-int/lit8 v1, v1, 0x1

    .line 140
    .line 141
    goto :goto_1

    .line 142
    :cond_3
    iput-object v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 143
    .line 144
    shl-int/lit8 v0, v2, 0x1

    .line 145
    .line 146
    iput v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    .line 147
    .line 148
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 149
    .line 150
    shl-int/lit8 v0, v0, 0x1

    .line 151
    .line 152
    add-int/lit8 v0, v0, -0x1

    .line 153
    .line 154
    iput v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 155
    .line 156
    return-void
.end method

.method public subtract(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->xor(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public subtractFromThis(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)V
    .locals 1

    .line 1
    iget v0, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->expandN(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->xorThisBy(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public testBit(I)Z
    .locals 3

    .line 1
    if-ltz p1, :cond_2

    .line 2
    .line 3
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    sub-int/2addr v0, v1

    .line 7
    const/4 v2, 0x0

    .line 8
    if-le p1, v0, :cond_0

    .line 9
    .line 10
    return v2

    .line 11
    :cond_0
    iget-object p0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 12
    .line 13
    ushr-int/lit8 v0, p1, 0x5

    .line 14
    .line 15
    aget p0, p0, v0

    .line 16
    .line 17
    sget-object v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->bitMask:[I

    .line 18
    .line 19
    and-int/lit8 p1, p1, 0x1f

    .line 20
    .line 21
    aget p1, v0, p1

    .line 22
    .line 23
    and-int/2addr p0, p1

    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    return v1

    .line 27
    :cond_1
    return v2

    .line 28
    :cond_2
    invoke-static {}, Ll/olk0;->a()V

    .line 29
    .line 30
    .line 31
    const/4 p0, 0x0

    .line 32
    return p0
.end method

.method public toByteArray()[B
    .locals 9

    .line 1
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, -0x1

    .line 4
    .line 5
    shr-int/lit8 v0, v0, 0x3

    .line 6
    .line 7
    add-int/lit8 v0, v0, 0x1

    .line 8
    .line 9
    and-int/lit8 v1, v0, 0x3

    .line 10
    .line 11
    new-array v2, v0, [B

    .line 12
    .line 13
    const/4 v3, 0x0

    .line 14
    move v4, v3

    .line 15
    :goto_0
    shr-int/lit8 v5, v0, 0x2

    .line 16
    .line 17
    if-ge v4, v5, :cond_0

    .line 18
    .line 19
    shl-int/lit8 v5, v4, 0x2

    .line 20
    .line 21
    sub-int v5, v0, v5

    .line 22
    .line 23
    add-int/lit8 v6, v5, -0x1

    .line 24
    .line 25
    iget-object v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 26
    .line 27
    aget v7, v7, v4

    .line 28
    .line 29
    and-int/lit16 v8, v7, 0xff

    .line 30
    .line 31
    int-to-byte v8, v8

    .line 32
    aput-byte v8, v2, v6

    .line 33
    .line 34
    add-int/lit8 v6, v5, -0x2

    .line 35
    .line 36
    const v8, 0xff00

    .line 37
    .line 38
    .line 39
    and-int/2addr v8, v7

    .line 40
    ushr-int/lit8 v8, v8, 0x8

    .line 41
    .line 42
    int-to-byte v8, v8

    .line 43
    aput-byte v8, v2, v6

    .line 44
    .line 45
    add-int/lit8 v6, v5, -0x3

    .line 46
    .line 47
    const/high16 v8, 0xff0000

    .line 48
    .line 49
    and-int/2addr v8, v7

    .line 50
    ushr-int/lit8 v8, v8, 0x10

    .line 51
    .line 52
    int-to-byte v8, v8

    .line 53
    aput-byte v8, v2, v6

    .line 54
    .line 55
    add-int/lit8 v5, v5, -0x4

    .line 56
    .line 57
    const/high16 v6, -0x1000000

    .line 58
    .line 59
    and-int/2addr v6, v7

    .line 60
    ushr-int/lit8 v6, v6, 0x18

    .line 61
    .line 62
    int-to-byte v6, v6

    .line 63
    aput-byte v6, v2, v5

    .line 64
    .line 65
    add-int/lit8 v4, v4, 0x1

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_0
    :goto_1
    if-ge v3, v1, :cond_1

    .line 69
    .line 70
    sub-int v0, v1, v3

    .line 71
    .line 72
    add-int/lit8 v0, v0, -0x1

    .line 73
    .line 74
    shl-int/lit8 v0, v0, 0x3

    .line 75
    .line 76
    iget-object v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 77
    .line 78
    iget v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    .line 79
    .line 80
    add-int/lit8 v5, v5, -0x1

    .line 81
    .line 82
    aget v4, v4, v5

    .line 83
    .line 84
    const/16 v5, 0xff

    .line 85
    .line 86
    shl-int/2addr v5, v0

    .line 87
    and-int/2addr v4, v5

    .line 88
    ushr-int v0, v4, v0

    .line 89
    .line 90
    int-to-byte v0, v0

    .line 91
    aput-byte v0, v2, v3

    .line 92
    .line 93
    add-int/lit8 v3, v3, 0x1

    .line 94
    .line 95
    goto :goto_1

    .line 96
    :cond_1
    return-object v2
.end method

.method public toFlexiBigInt()Ljava/math/BigInteger;
    .locals 2

    .line 1
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->isZero()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    new-instance v0, Ljava/math/BigInteger;

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    invoke-virtual {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->toByteArray()[B

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-direct {v0, v1, p0}, Ljava/math/BigInteger;-><init>(I[B)V

    .line 20
    .line 21
    .line 22
    return-object v0

    .line 23
    :cond_1
    :goto_0
    new-instance p0, Ljava/math/BigInteger;

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    new-array v1, v0, [B

    .line 27
    .line 28
    invoke-direct {p0, v0, v1}, Ljava/math/BigInteger;-><init>(I[B)V

    .line 29
    .line 30
    .line 31
    return-object p0
.end method

.method public toIntegerArray()[I
    .locals 3

    .line 1
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    .line 2
    .line 3
    new-array v1, v0, [I

    .line 4
    .line 5
    iget-object p0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-static {p0, v2, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 9
    .line 10
    .line 11
    return-object v1
.end method

.method public toString(I)Ljava/lang/String;
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/16 v1, 0x10

    .line 4
    .line 5
    new-array v2, v1, [C

    .line 6
    .line 7
    fill-array-data v2, :array_0

    .line 8
    .line 9
    .line 10
    const-string v17, "1110"

    .line 11
    .line 12
    const-string v18, "1111"

    .line 13
    .line 14
    const-string v3, "0000"

    .line 15
    .line 16
    const-string v4, "0001"

    .line 17
    .line 18
    const-string v5, "0010"

    .line 19
    .line 20
    const-string v6, "0011"

    .line 21
    .line 22
    const-string v7, "0100"

    .line 23
    .line 24
    const-string v8, "0101"

    .line 25
    .line 26
    const-string v9, "0110"

    .line 27
    .line 28
    const-string v10, "0111"

    .line 29
    .line 30
    const-string v11, "1000"

    .line 31
    .line 32
    const-string v12, "1001"

    .line 33
    .line 34
    const-string v13, "1010"

    .line 35
    .line 36
    const-string v14, "1011"

    .line 37
    .line 38
    const-string v15, "1100"

    .line 39
    .line 40
    const-string v16, "1101"

    .line 41
    .line 42
    filled-new-array/range {v3 .. v18}, [Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    new-instance v4, Ljava/lang/String;

    .line 47
    .line 48
    invoke-direct {v4}, Ljava/lang/String;-><init>()V

    .line 49
    .line 50
    .line 51
    iget v5, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    .line 52
    .line 53
    const-string v6, " "

    .line 54
    .line 55
    move/from16 v7, p1

    .line 56
    .line 57
    if-ne v7, v1, :cond_1

    .line 58
    .line 59
    add-int/lit8 v5, v5, -0x1

    .line 60
    .line 61
    :goto_0
    if-ltz v5, :cond_0

    .line 62
    .line 63
    new-instance v3, Ljava/lang/StringBuilder;

    .line 64
    .line 65
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    iget-object v4, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 72
    .line 73
    aget v4, v4, v5

    .line 74
    .line 75
    ushr-int/lit8 v4, v4, 0x1c

    .line 76
    .line 77
    and-int/lit8 v4, v4, 0xf

    .line 78
    .line 79
    aget-char v4, v2, v4

    .line 80
    .line 81
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    new-instance v4, Ljava/lang/StringBuilder;

    .line 89
    .line 90
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    iget-object v3, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 97
    .line 98
    aget v3, v3, v5

    .line 99
    .line 100
    ushr-int/lit8 v3, v3, 0x18

    .line 101
    .line 102
    and-int/lit8 v3, v3, 0xf

    .line 103
    .line 104
    aget-char v3, v2, v3

    .line 105
    .line 106
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v3

    .line 113
    new-instance v4, Ljava/lang/StringBuilder;

    .line 114
    .line 115
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 116
    .line 117
    .line 118
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    iget-object v3, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 122
    .line 123
    aget v3, v3, v5

    .line 124
    .line 125
    ushr-int/lit8 v3, v3, 0x14

    .line 126
    .line 127
    and-int/lit8 v3, v3, 0xf

    .line 128
    .line 129
    aget-char v3, v2, v3

    .line 130
    .line 131
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v3

    .line 138
    new-instance v4, Ljava/lang/StringBuilder;

    .line 139
    .line 140
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 141
    .line 142
    .line 143
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    iget-object v3, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 147
    .line 148
    aget v3, v3, v5

    .line 149
    .line 150
    ushr-int/2addr v3, v1

    .line 151
    and-int/lit8 v3, v3, 0xf

    .line 152
    .line 153
    aget-char v3, v2, v3

    .line 154
    .line 155
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object v3

    .line 162
    new-instance v4, Ljava/lang/StringBuilder;

    .line 163
    .line 164
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 165
    .line 166
    .line 167
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    iget-object v3, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 171
    .line 172
    aget v3, v3, v5

    .line 173
    .line 174
    ushr-int/lit8 v3, v3, 0xc

    .line 175
    .line 176
    and-int/lit8 v3, v3, 0xf

    .line 177
    .line 178
    aget-char v3, v2, v3

    .line 179
    .line 180
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object v3

    .line 187
    new-instance v4, Ljava/lang/StringBuilder;

    .line 188
    .line 189
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 190
    .line 191
    .line 192
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 193
    .line 194
    .line 195
    iget-object v3, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 196
    .line 197
    aget v3, v3, v5

    .line 198
    .line 199
    ushr-int/lit8 v3, v3, 0x8

    .line 200
    .line 201
    and-int/lit8 v3, v3, 0xf

    .line 202
    .line 203
    aget-char v3, v2, v3

    .line 204
    .line 205
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v3

    .line 212
    new-instance v4, Ljava/lang/StringBuilder;

    .line 213
    .line 214
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 215
    .line 216
    .line 217
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 218
    .line 219
    .line 220
    iget-object v3, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 221
    .line 222
    aget v3, v3, v5

    .line 223
    .line 224
    ushr-int/lit8 v3, v3, 0x4

    .line 225
    .line 226
    and-int/lit8 v3, v3, 0xf

    .line 227
    .line 228
    aget-char v3, v2, v3

    .line 229
    .line 230
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 231
    .line 232
    .line 233
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 234
    .line 235
    .line 236
    move-result-object v3

    .line 237
    new-instance v4, Ljava/lang/StringBuilder;

    .line 238
    .line 239
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 240
    .line 241
    .line 242
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 243
    .line 244
    .line 245
    iget-object v3, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 246
    .line 247
    aget v3, v3, v5

    .line 248
    .line 249
    and-int/lit8 v3, v3, 0xf

    .line 250
    .line 251
    aget-char v3, v2, v3

    .line 252
    .line 253
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 254
    .line 255
    .line 256
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 257
    .line 258
    .line 259
    move-result-object v3

    .line 260
    invoke-virtual {v3, v6}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 261
    .line 262
    .line 263
    move-result-object v4

    .line 264
    add-int/lit8 v5, v5, -0x1

    .line 265
    .line 266
    goto/16 :goto_0

    .line 267
    .line 268
    :cond_0
    return-object v4

    .line 269
    :cond_1
    add-int/lit8 v5, v5, -0x1

    .line 270
    .line 271
    :goto_1
    if-ltz v5, :cond_2

    .line 272
    .line 273
    new-instance v2, Ljava/lang/StringBuilder;

    .line 274
    .line 275
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 276
    .line 277
    .line 278
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 279
    .line 280
    .line 281
    iget-object v4, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 282
    .line 283
    aget v4, v4, v5

    .line 284
    .line 285
    ushr-int/lit8 v4, v4, 0x1c

    .line 286
    .line 287
    and-int/lit8 v4, v4, 0xf

    .line 288
    .line 289
    aget-object v4, v3, v4

    .line 290
    .line 291
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 292
    .line 293
    .line 294
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 295
    .line 296
    .line 297
    move-result-object v2

    .line 298
    new-instance v4, Ljava/lang/StringBuilder;

    .line 299
    .line 300
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 301
    .line 302
    .line 303
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 304
    .line 305
    .line 306
    iget-object v2, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 307
    .line 308
    aget v2, v2, v5

    .line 309
    .line 310
    ushr-int/lit8 v2, v2, 0x18

    .line 311
    .line 312
    and-int/lit8 v2, v2, 0xf

    .line 313
    .line 314
    aget-object v2, v3, v2

    .line 315
    .line 316
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 317
    .line 318
    .line 319
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 320
    .line 321
    .line 322
    move-result-object v2

    .line 323
    new-instance v4, Ljava/lang/StringBuilder;

    .line 324
    .line 325
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 326
    .line 327
    .line 328
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 329
    .line 330
    .line 331
    iget-object v2, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 332
    .line 333
    aget v2, v2, v5

    .line 334
    .line 335
    ushr-int/lit8 v2, v2, 0x14

    .line 336
    .line 337
    and-int/lit8 v2, v2, 0xf

    .line 338
    .line 339
    aget-object v2, v3, v2

    .line 340
    .line 341
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 342
    .line 343
    .line 344
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 345
    .line 346
    .line 347
    move-result-object v2

    .line 348
    new-instance v4, Ljava/lang/StringBuilder;

    .line 349
    .line 350
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 351
    .line 352
    .line 353
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 354
    .line 355
    .line 356
    iget-object v2, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 357
    .line 358
    aget v2, v2, v5

    .line 359
    .line 360
    ushr-int/2addr v2, v1

    .line 361
    and-int/lit8 v2, v2, 0xf

    .line 362
    .line 363
    aget-object v2, v3, v2

    .line 364
    .line 365
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 366
    .line 367
    .line 368
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 369
    .line 370
    .line 371
    move-result-object v2

    .line 372
    new-instance v4, Ljava/lang/StringBuilder;

    .line 373
    .line 374
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 375
    .line 376
    .line 377
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 378
    .line 379
    .line 380
    iget-object v2, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 381
    .line 382
    aget v2, v2, v5

    .line 383
    .line 384
    ushr-int/lit8 v2, v2, 0xc

    .line 385
    .line 386
    and-int/lit8 v2, v2, 0xf

    .line 387
    .line 388
    aget-object v2, v3, v2

    .line 389
    .line 390
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 391
    .line 392
    .line 393
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 394
    .line 395
    .line 396
    move-result-object v2

    .line 397
    new-instance v4, Ljava/lang/StringBuilder;

    .line 398
    .line 399
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 400
    .line 401
    .line 402
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 403
    .line 404
    .line 405
    iget-object v2, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 406
    .line 407
    aget v2, v2, v5

    .line 408
    .line 409
    ushr-int/lit8 v2, v2, 0x8

    .line 410
    .line 411
    and-int/lit8 v2, v2, 0xf

    .line 412
    .line 413
    aget-object v2, v3, v2

    .line 414
    .line 415
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 416
    .line 417
    .line 418
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 419
    .line 420
    .line 421
    move-result-object v2

    .line 422
    new-instance v4, Ljava/lang/StringBuilder;

    .line 423
    .line 424
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 425
    .line 426
    .line 427
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 428
    .line 429
    .line 430
    iget-object v2, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 431
    .line 432
    aget v2, v2, v5

    .line 433
    .line 434
    ushr-int/lit8 v2, v2, 0x4

    .line 435
    .line 436
    and-int/lit8 v2, v2, 0xf

    .line 437
    .line 438
    aget-object v2, v3, v2

    .line 439
    .line 440
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 441
    .line 442
    .line 443
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 444
    .line 445
    .line 446
    move-result-object v2

    .line 447
    new-instance v4, Ljava/lang/StringBuilder;

    .line 448
    .line 449
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 450
    .line 451
    .line 452
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 453
    .line 454
    .line 455
    iget-object v2, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 456
    .line 457
    aget v2, v2, v5

    .line 458
    .line 459
    and-int/lit8 v2, v2, 0xf

    .line 460
    .line 461
    aget-object v2, v3, v2

    .line 462
    .line 463
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 464
    .line 465
    .line 466
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 467
    .line 468
    .line 469
    move-result-object v2

    .line 470
    invoke-virtual {v2, v6}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 471
    .line 472
    .line 473
    move-result-object v4

    .line 474
    add-int/lit8 v5, v5, -0x1

    .line 475
    .line 476
    goto/16 :goto_1

    .line 477
    .line 478
    :cond_2
    return-object v4

    .line 479
    :array_0
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x61s
        0x62s
        0x63s
        0x64s
        0x65s
        0x66s
    .end array-data
.end method

.method public vectorMult(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/RuntimeException;
        }
    .end annotation

    .line 1
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 2
    .line 3
    iget v1, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-ne v0, v1, :cond_1

    .line 7
    .line 8
    move v0, v2

    .line 9
    :goto_0
    iget v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    .line 10
    .line 11
    if-ge v2, v1, :cond_0

    .line 12
    .line 13
    iget-object v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 14
    .line 15
    aget v1, v1, v2

    .line 16
    .line 17
    iget-object v3, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 18
    .line 19
    aget v3, v3, v2

    .line 20
    .line 21
    and-int/2addr v1, v3

    .line 22
    sget-object v3, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->parity:[Z

    .line 23
    .line 24
    and-int/lit16 v4, v1, 0xff

    .line 25
    .line 26
    aget-boolean v4, v3, v4

    .line 27
    .line 28
    xor-int/2addr v0, v4

    .line 29
    ushr-int/lit8 v4, v1, 0x8

    .line 30
    .line 31
    and-int/lit16 v4, v4, 0xff

    .line 32
    .line 33
    aget-boolean v4, v3, v4

    .line 34
    .line 35
    xor-int/2addr v0, v4

    .line 36
    ushr-int/lit8 v4, v1, 0x10

    .line 37
    .line 38
    and-int/lit16 v4, v4, 0xff

    .line 39
    .line 40
    aget-boolean v4, v3, v4

    .line 41
    .line 42
    xor-int/2addr v0, v4

    .line 43
    ushr-int/lit8 v1, v1, 0x18

    .line 44
    .line 45
    and-int/lit16 v1, v1, 0xff

    .line 46
    .line 47
    aget-boolean v1, v3, v1

    .line 48
    .line 49
    xor-int/2addr v0, v1

    .line 50
    add-int/lit8 v2, v2, 0x1

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    return v0

    .line 54
    :cond_1
    invoke-static {}, Ll/olk0;->a()V

    .line 55
    .line 56
    .line 57
    return v2
.end method

.method public xor(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;
    .locals 5

    .line 1
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    .line 2
    .line 3
    iget v1, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    .line 4
    .line 5
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 10
    .line 11
    iget v2, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 12
    .line 13
    const/4 v3, 0x0

    .line 14
    if-lt v1, v2, :cond_0

    .line 15
    .line 16
    new-instance v1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)V

    .line 19
    .line 20
    .line 21
    :goto_0
    if-ge v3, v0, :cond_1

    .line 22
    .line 23
    iget-object p0, v1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 24
    .line 25
    aget v2, p0, v3

    .line 26
    .line 27
    iget-object v4, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 28
    .line 29
    aget v4, v4, v3

    .line 30
    .line 31
    xor-int/2addr v2, v4

    .line 32
    aput v2, p0, v3

    .line 33
    .line 34
    add-int/lit8 v3, v3, 0x1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    new-instance v1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 38
    .line 39
    invoke-direct {v1, p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)V

    .line 40
    .line 41
    .line 42
    :goto_1
    if-ge v3, v0, :cond_1

    .line 43
    .line 44
    iget-object p1, v1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 45
    .line 46
    aget v2, p1, v3

    .line 47
    .line 48
    iget-object v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 49
    .line 50
    aget v4, v4, v3

    .line 51
    .line 52
    xor-int/2addr v2, v4

    .line 53
    aput v2, p1, v3

    .line 54
    .line 55
    add-int/lit8 v3, v3, 0x1

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_1
    invoke-direct {v1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->zeroUnusedBits()V

    .line 59
    .line 60
    .line 61
    return-object v1
.end method

.method public xorBit(I)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/RuntimeException;
        }
    .end annotation

    .line 1
    if-ltz p1, :cond_0

    .line 2
    .line 3
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->len:I

    .line 4
    .line 5
    add-int/lit8 v0, v0, -0x1

    .line 6
    .line 7
    if-gt p1, v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 10
    .line 11
    ushr-int/lit8 v0, p1, 0x5

    .line 12
    .line 13
    aget v1, p0, v0

    .line 14
    .line 15
    sget-object v2, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->bitMask:[I

    .line 16
    .line 17
    and-int/lit8 p1, p1, 0x1f

    .line 18
    .line 19
    aget p1, v2, p1

    .line 20
    .line 21
    xor-int/2addr p1, v1

    .line 22
    aput p1, p0, v0

    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-static {}, Ll/olk0;->a()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public xorThisBy(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    .line 3
    .line 4
    iget v2, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->blocks:I

    .line 5
    .line 6
    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-ge v0, v1, :cond_0

    .line 11
    .line 12
    iget-object v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 13
    .line 14
    aget v2, v1, v0

    .line 15
    .line 16
    iget-object v3, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->value:[I

    .line 17
    .line 18
    aget v3, v3, v0

    .line 19
    .line 20
    xor-int/2addr v2, v3

    .line 21
    aput v2, v1, v0

    .line 22
    .line 23
    add-int/lit8 v0, v0, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    invoke-direct {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->zeroUnusedBits()V

    .line 27
    .line 28
    .line 29
    return-void
.end method
