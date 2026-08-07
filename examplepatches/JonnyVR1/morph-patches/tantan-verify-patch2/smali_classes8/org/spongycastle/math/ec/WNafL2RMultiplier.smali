.class public Lorg/spongycastle/math/ec/WNafL2RMultiplier;
.super Lorg/spongycastle/math/ec/AbstractECMultiplier;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lorg/spongycastle/math/ec/AbstractECMultiplier;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getWindowSize(I)I
    .locals 0

    .line 1
    invoke-static {p1}, Lorg/spongycastle/math/ec/WNafUtil;->getWindowSize(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public multiplyPositive(Lorg/spongycastle/math/ec/ECPoint;Ljava/math/BigInteger;)Lorg/spongycastle/math/ec/ECPoint;
    .locals 9

    .line 1
    invoke-virtual {p2}, Ljava/math/BigInteger;->bitLength()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, v0}, Lorg/spongycastle/math/ec/WNafL2RMultiplier;->getWindowSize(I)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const/16 v0, 0x10

    .line 10
    .line 11
    invoke-static {v0, p0}, Ljava/lang/Math;->min(II)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    const/4 v0, 0x2

    .line 16
    invoke-static {v0, p0}, Ljava/lang/Math;->max(II)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    const/4 v0, 0x1

    .line 21
    invoke-static {p1, p0, v0}, Lorg/spongycastle/math/ec/WNafUtil;->precompute(Lorg/spongycastle/math/ec/ECPoint;IZ)Lorg/spongycastle/math/ec/WNafPreCompInfo;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v1}, Lorg/spongycastle/math/ec/WNafPreCompInfo;->getPreComp()[Lorg/spongycastle/math/ec/ECPoint;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v1}, Lorg/spongycastle/math/ec/WNafPreCompInfo;->getPreCompNeg()[Lorg/spongycastle/math/ec/ECPoint;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-static {p0, p2}, Lorg/spongycastle/math/ec/WNafUtil;->generateCompactWindowNaf(ILjava/math/BigInteger;)[I

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    invoke-virtual {p1}, Lorg/spongycastle/math/ec/ECPoint;->getCurve()Lorg/spongycastle/math/ec/ECCurve;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p1}, Lorg/spongycastle/math/ec/ECCurve;->getInfinity()Lorg/spongycastle/math/ec/ECPoint;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    array-length v3, p2

    .line 46
    const v4, 0xffff

    .line 47
    .line 48
    .line 49
    if-le v3, v0, :cond_2

    .line 50
    .line 51
    add-int/lit8 v3, v3, -0x1

    .line 52
    .line 53
    aget p1, p2, v3

    .line 54
    .line 55
    shr-int/lit8 v5, p1, 0x10

    .line 56
    .line 57
    and-int/2addr p1, v4

    .line 58
    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    .line 59
    .line 60
    .line 61
    move-result v6

    .line 62
    if-gez v5, :cond_0

    .line 63
    .line 64
    move-object v5, v1

    .line 65
    goto :goto_0

    .line 66
    :cond_0
    move-object v5, v2

    .line 67
    :goto_0
    shl-int/lit8 v7, v6, 0x2

    .line 68
    .line 69
    shl-int v8, v0, p0

    .line 70
    .line 71
    if-ge v7, v8, :cond_1

    .line 72
    .line 73
    sget-object v7, Lorg/spongycastle/math/ec/LongArray;->bitLengths:[B

    .line 74
    .line 75
    aget-byte v7, v7, v6

    .line 76
    .line 77
    sub-int v8, p0, v7

    .line 78
    .line 79
    sub-int/2addr v7, v0

    .line 80
    shl-int v7, v0, v7

    .line 81
    .line 82
    xor-int/2addr v6, v7

    .line 83
    sub-int/2addr p0, v0

    .line 84
    shl-int p0, v0, p0

    .line 85
    .line 86
    sub-int/2addr p0, v0

    .line 87
    shl-int/2addr v6, v8

    .line 88
    add-int/2addr v6, v0

    .line 89
    ushr-int/2addr p0, v0

    .line 90
    aget-object p0, v5, p0

    .line 91
    .line 92
    ushr-int/2addr v6, v0

    .line 93
    aget-object v5, v5, v6

    .line 94
    .line 95
    invoke-virtual {p0, v5}, Lorg/spongycastle/math/ec/ECPoint;->add(Lorg/spongycastle/math/ec/ECPoint;)Lorg/spongycastle/math/ec/ECPoint;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    sub-int/2addr p1, v8

    .line 100
    goto :goto_1

    .line 101
    :cond_1
    ushr-int/lit8 p0, v6, 0x1

    .line 102
    .line 103
    aget-object p0, v5, p0

    .line 104
    .line 105
    :goto_1
    invoke-virtual {p0, p1}, Lorg/spongycastle/math/ec/ECPoint;->timesPow2(I)Lorg/spongycastle/math/ec/ECPoint;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    :cond_2
    :goto_2
    if-lez v3, :cond_4

    .line 110
    .line 111
    add-int/lit8 v3, v3, -0x1

    .line 112
    .line 113
    aget p0, p2, v3

    .line 114
    .line 115
    shr-int/lit8 v5, p0, 0x10

    .line 116
    .line 117
    and-int/2addr p0, v4

    .line 118
    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    .line 119
    .line 120
    .line 121
    move-result v6

    .line 122
    if-gez v5, :cond_3

    .line 123
    .line 124
    move-object v5, v1

    .line 125
    goto :goto_3

    .line 126
    :cond_3
    move-object v5, v2

    .line 127
    :goto_3
    ushr-int/2addr v6, v0

    .line 128
    aget-object v5, v5, v6

    .line 129
    .line 130
    invoke-virtual {p1, v5}, Lorg/spongycastle/math/ec/ECPoint;->twicePlus(Lorg/spongycastle/math/ec/ECPoint;)Lorg/spongycastle/math/ec/ECPoint;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    invoke-virtual {p1, p0}, Lorg/spongycastle/math/ec/ECPoint;->timesPow2(I)Lorg/spongycastle/math/ec/ECPoint;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    goto :goto_2

    .line 139
    :cond_4
    return-object p1
.end method
