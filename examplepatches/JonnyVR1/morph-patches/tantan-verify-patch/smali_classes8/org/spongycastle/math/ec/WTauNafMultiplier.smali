.class public Lorg/spongycastle/math/ec/WTauNafMultiplier;
.super Lorg/spongycastle/math/ec/AbstractECMultiplier;
.source "SourceFile"


# static fields
.field static final PRECOMP_NAME:Ljava/lang/String; = "bc_wtnaf"


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

.method private static multiplyFromWTnaf(Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;[BLorg/spongycastle/math/ec/PreCompInfo;)Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;
    .locals 5

    .line 1
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/ECPoint;->getCurve()Lorg/spongycastle/math/ec/ECCurve;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lorg/spongycastle/math/ec/ECCurve$AbstractF2m;

    .line 6
    .line 7
    invoke-virtual {v0}, Lorg/spongycastle/math/ec/ECCurve;->getA()Lorg/spongycastle/math/ec/ECFieldElement;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Lorg/spongycastle/math/ec/ECFieldElement;->toBigInteger()Ljava/math/BigInteger;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Ljava/lang/Number;->byteValue()B

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz p2, :cond_1

    .line 20
    .line 21
    instance-of v2, p2, Lorg/spongycastle/math/ec/WTauNafPreCompInfo;

    .line 22
    .line 23
    if-nez v2, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    check-cast p2, Lorg/spongycastle/math/ec/WTauNafPreCompInfo;

    .line 27
    .line 28
    invoke-virtual {p2}, Lorg/spongycastle/math/ec/WTauNafPreCompInfo;->getPreComp()[Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    goto :goto_1

    .line 33
    :cond_1
    :goto_0
    invoke-static {p0, v1}, Lorg/spongycastle/math/ec/Tnaf;->getPreComp(Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;B)[Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    new-instance v1, Lorg/spongycastle/math/ec/WTauNafPreCompInfo;

    .line 38
    .line 39
    invoke-direct {v1}, Lorg/spongycastle/math/ec/WTauNafPreCompInfo;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1, p2}, Lorg/spongycastle/math/ec/WTauNafPreCompInfo;->setPreComp([Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;)V

    .line 43
    .line 44
    .line 45
    const-string v2, "bc_wtnaf"

    .line 46
    .line 47
    invoke-virtual {v0, p0, v2, v1}, Lorg/spongycastle/math/ec/ECCurve;->setPreCompInfo(Lorg/spongycastle/math/ec/ECPoint;Ljava/lang/String;Lorg/spongycastle/math/ec/PreCompInfo;)V

    .line 48
    .line 49
    .line 50
    :goto_1
    array-length v0, p2

    .line 51
    new-array v0, v0, [Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;

    .line 52
    .line 53
    const/4 v1, 0x0

    .line 54
    move v2, v1

    .line 55
    :goto_2
    array-length v3, p2

    .line 56
    if-ge v2, v3, :cond_2

    .line 57
    .line 58
    aget-object v3, p2, v2

    .line 59
    .line 60
    invoke-virtual {v3}, Lorg/spongycastle/math/ec/ECPoint;->negate()Lorg/spongycastle/math/ec/ECPoint;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    check-cast v3, Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;

    .line 65
    .line 66
    aput-object v3, v0, v2

    .line 67
    .line 68
    add-int/lit8 v2, v2, 0x1

    .line 69
    .line 70
    goto :goto_2

    .line 71
    :cond_2
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/ECPoint;->getCurve()Lorg/spongycastle/math/ec/ECCurve;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/ECCurve;->getInfinity()Lorg/spongycastle/math/ec/ECPoint;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    check-cast p0, Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;

    .line 80
    .line 81
    array-length v2, p1

    .line 82
    add-int/lit8 v2, v2, -0x1

    .line 83
    .line 84
    move v3, v1

    .line 85
    :goto_3
    if-ltz v2, :cond_5

    .line 86
    .line 87
    add-int/lit8 v3, v3, 0x1

    .line 88
    .line 89
    aget-byte v4, p1, v2

    .line 90
    .line 91
    if-eqz v4, :cond_4

    .line 92
    .line 93
    invoke-virtual {p0, v3}, Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;->tauPow(I)Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    if-lez v4, :cond_3

    .line 98
    .line 99
    ushr-int/lit8 v3, v4, 0x1

    .line 100
    .line 101
    aget-object v3, p2, v3

    .line 102
    .line 103
    goto :goto_4

    .line 104
    :cond_3
    neg-int v3, v4

    .line 105
    ushr-int/lit8 v3, v3, 0x1

    .line 106
    .line 107
    aget-object v3, v0, v3

    .line 108
    .line 109
    :goto_4
    invoke-virtual {p0, v3}, Lorg/spongycastle/math/ec/ECPoint;->add(Lorg/spongycastle/math/ec/ECPoint;)Lorg/spongycastle/math/ec/ECPoint;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    check-cast p0, Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;

    .line 114
    .line 115
    move v3, v1

    .line 116
    :cond_4
    add-int/lit8 v2, v2, -0x1

    .line 117
    .line 118
    goto :goto_3

    .line 119
    :cond_5
    if-lez v3, :cond_6

    .line 120
    .line 121
    invoke-virtual {p0, v3}, Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;->tauPow(I)Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    :cond_6
    return-object p0
.end method

.method private multiplyWTnaf(Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;Lorg/spongycastle/math/ec/ZTauElement;Lorg/spongycastle/math/ec/PreCompInfo;BB)Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;
    .locals 6

    .line 1
    if-nez p4, :cond_0

    .line 2
    .line 3
    sget-object p0, Lorg/spongycastle/math/ec/Tnaf;->alpha0:[Lorg/spongycastle/math/ec/ZTauElement;

    .line 4
    .line 5
    :goto_0
    move-object v5, p0

    .line 6
    goto :goto_1

    .line 7
    :cond_0
    sget-object p0, Lorg/spongycastle/math/ec/Tnaf;->alpha1:[Lorg/spongycastle/math/ec/ZTauElement;

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :goto_1
    const/4 p0, 0x4

    .line 11
    invoke-static {p5, p0}, Lorg/spongycastle/math/ec/Tnaf;->getTw(BI)Ljava/math/BigInteger;

    .line 12
    .line 13
    .line 14
    move-result-object v4

    .line 15
    const-wide/16 v0, 0x10

    .line 16
    .line 17
    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    const/4 v2, 0x4

    .line 22
    move-object v1, p2

    .line 23
    move v0, p5

    .line 24
    invoke-static/range {v0 .. v5}, Lorg/spongycastle/math/ec/Tnaf;->tauAdicWNaf(BLorg/spongycastle/math/ec/ZTauElement;BLjava/math/BigInteger;Ljava/math/BigInteger;[Lorg/spongycastle/math/ec/ZTauElement;)[B

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-static {p1, p0, p3}, Lorg/spongycastle/math/ec/WTauNafMultiplier;->multiplyFromWTnaf(Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;[BLorg/spongycastle/math/ec/PreCompInfo;)Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method


# virtual methods
.method public multiplyPositive(Lorg/spongycastle/math/ec/ECPoint;Ljava/math/BigInteger;)Lorg/spongycastle/math/ec/ECPoint;
    .locals 9

    .line 1
    instance-of v0, p1, Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v2, p1

    .line 6
    check-cast v2, Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;

    .line 7
    .line 8
    invoke-virtual {v2}, Lorg/spongycastle/math/ec/ECPoint;->getCurve()Lorg/spongycastle/math/ec/ECCurve;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Lorg/spongycastle/math/ec/ECCurve$AbstractF2m;

    .line 13
    .line 14
    invoke-virtual {p1}, Lorg/spongycastle/math/ec/ECCurve;->getFieldSize()I

    .line 15
    .line 16
    .line 17
    move-result v4

    .line 18
    invoke-virtual {p1}, Lorg/spongycastle/math/ec/ECCurve;->getA()Lorg/spongycastle/math/ec/ECFieldElement;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Lorg/spongycastle/math/ec/ECFieldElement;->toBigInteger()Ljava/math/BigInteger;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Ljava/lang/Number;->byteValue()B

    .line 27
    .line 28
    .line 29
    move-result v5

    .line 30
    invoke-static {v5}, Lorg/spongycastle/math/ec/Tnaf;->getMu(I)B

    .line 31
    .line 32
    .line 33
    move-result v6

    .line 34
    move v7, v6

    .line 35
    invoke-virtual {p1}, Lorg/spongycastle/math/ec/ECCurve$AbstractF2m;->getSi()[Ljava/math/BigInteger;

    .line 36
    .line 37
    .line 38
    move-result-object v6

    .line 39
    const/16 v8, 0xa

    .line 40
    .line 41
    move-object v3, p2

    .line 42
    invoke-static/range {v3 .. v8}, Lorg/spongycastle/math/ec/Tnaf;->partModReduction(Ljava/math/BigInteger;IB[Ljava/math/BigInteger;BB)Lorg/spongycastle/math/ec/ZTauElement;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    const-string p2, "bc_wtnaf"

    .line 47
    .line 48
    invoke-virtual {p1, v2, p2}, Lorg/spongycastle/math/ec/ECCurve;->getPreCompInfo(Lorg/spongycastle/math/ec/ECPoint;Ljava/lang/String;)Lorg/spongycastle/math/ec/PreCompInfo;

    .line 49
    .line 50
    .line 51
    move-result-object v4

    .line 52
    move-object v1, p0

    .line 53
    move v6, v7

    .line 54
    invoke-direct/range {v1 .. v6}, Lorg/spongycastle/math/ec/WTauNafMultiplier;->multiplyWTnaf(Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;Lorg/spongycastle/math/ec/ZTauElement;Lorg/spongycastle/math/ec/PreCompInfo;BB)Lorg/spongycastle/math/ec/ECPoint$AbstractF2m;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    return-object p0

    .line 59
    :cond_0
    const-string p0, "Only ECPoint.AbstractF2m can be used in WTauNafMultiplier"

    .line 60
    .line 61
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    const/4 p0, 0x0

    .line 65
    return-object p0
.end method
