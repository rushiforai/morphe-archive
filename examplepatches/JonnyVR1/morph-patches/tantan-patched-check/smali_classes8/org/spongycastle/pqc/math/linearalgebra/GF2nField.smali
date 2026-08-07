.class public abstract Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field protected fieldPolynomial:Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

.field protected fields:Ljava/util/Vector;

.field protected mDegree:I

.field protected matrices:Ljava/util/Vector;

.field protected final random:Ljava/security/SecureRandom;


# direct methods
.method public constructor <init>(Ljava/security/SecureRandom;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->random:Ljava/security/SecureRandom;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public abstract computeCOBMatrix(Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;)V
.end method

.method public abstract computeFieldPolynomial()V
.end method

.method public final convert(Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;)Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/RuntimeException;
        }
    .end annotation

    .line 1
    if-ne p2, p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    iget-object v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->fieldPolynomial:Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 11
    .line 12
    iget-object v1, p2, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->fieldPolynomial:Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;->clone()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    check-cast p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;

    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_1
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->mDegree:I

    .line 28
    .line 29
    iget v1, p2, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->mDegree:I

    .line 30
    .line 31
    const/4 v2, 0x0

    .line 32
    if-ne v0, v1, :cond_8

    .line 33
    .line 34
    iget-object v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->fields:Ljava/util/Vector;

    .line 35
    .line 36
    invoke-virtual {v0, p2}, Ljava/util/Vector;->indexOf(Ljava/lang/Object;)I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    const/4 v1, -0x1

    .line 41
    if-ne v0, v1, :cond_2

    .line 42
    .line 43
    invoke-virtual {p0, p2}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->computeCOBMatrix(Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->fields:Ljava/util/Vector;

    .line 47
    .line 48
    invoke-virtual {v0, p2}, Ljava/util/Vector;->indexOf(Ljava/lang/Object;)I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    :cond_2
    iget-object v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->matrices:Ljava/util/Vector;

    .line 53
    .line 54
    invoke-virtual {v1, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    check-cast v0, [Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 59
    .line 60
    invoke-virtual {p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;->clone()Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    check-cast p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;

    .line 65
    .line 66
    instance-of v1, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;

    .line 67
    .line 68
    if-eqz v1, :cond_3

    .line 69
    .line 70
    move-object v1, p1

    .line 71
    check-cast v1, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;

    .line 72
    .line 73
    invoke-virtual {v1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->reverseOrder()V

    .line 74
    .line 75
    .line 76
    :cond_3
    new-instance v1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 77
    .line 78
    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->mDegree:I

    .line 79
    .line 80
    invoke-interface {p1}, Lorg/spongycastle/pqc/math/linearalgebra/GFElement;->toFlexiBigInt()Ljava/math/BigInteger;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-direct {v1, v3, p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;-><init>(ILjava/math/BigInteger;)V

    .line 85
    .line 86
    .line 87
    iget p1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->mDegree:I

    .line 88
    .line 89
    invoke-virtual {v1, p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->expandN(I)V

    .line 90
    .line 91
    .line 92
    new-instance p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 93
    .line 94
    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->mDegree:I

    .line 95
    .line 96
    invoke-direct {p1, v3}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;-><init>(I)V

    .line 97
    .line 98
    .line 99
    const/4 v3, 0x0

    .line 100
    :goto_0
    iget v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->mDegree:I

    .line 101
    .line 102
    if-ge v3, v4, :cond_5

    .line 103
    .line 104
    aget-object v4, v0, v3

    .line 105
    .line 106
    invoke-virtual {v1, v4}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->vectorMult(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)Z

    .line 107
    .line 108
    .line 109
    move-result v4

    .line 110
    if-eqz v4, :cond_4

    .line 111
    .line 112
    iget v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->mDegree:I

    .line 113
    .line 114
    add-int/lit8 v4, v4, -0x1

    .line 115
    .line 116
    sub-int/2addr v4, v3

    .line 117
    invoke-virtual {p1, v4}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->setBit(I)V

    .line 118
    .line 119
    .line 120
    :cond_4
    add-int/lit8 v3, v3, 0x1

    .line 121
    .line 122
    goto :goto_0

    .line 123
    :cond_5
    instance-of p0, p2, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;

    .line 124
    .line 125
    if-eqz p0, :cond_6

    .line 126
    .line 127
    new-instance p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialElement;

    .line 128
    .line 129
    check-cast p2, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;

    .line 130
    .line 131
    invoke-direct {p0, p2, p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialElement;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)V

    .line 132
    .line 133
    .line 134
    return-object p0

    .line 135
    :cond_6
    instance-of p0, p2, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;

    .line 136
    .line 137
    if-eqz p0, :cond_7

    .line 138
    .line 139
    new-instance p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;

    .line 140
    .line 141
    check-cast p2, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;

    .line 142
    .line 143
    invoke-virtual {p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->toFlexiBigInt()Ljava/math/BigInteger;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    invoke-direct {p0, p2, p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;Ljava/math/BigInteger;)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->reverseOrder()V

    .line 151
    .line 152
    .line 153
    return-object p0

    .line 154
    :cond_7
    const-string p0, "GF2nField.convert: B1 must be an instance of GF2nPolynomialField or GF2nONBField!"

    .line 155
    .line 156
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 157
    .line 158
    .line 159
    return-object v2

    .line 160
    :cond_8
    const-string p0, "GF2nField.convert: B1 has a different degree and thus cannot be coverted to!"

    .line 161
    .line 162
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 163
    .line 164
    .line 165
    return-object v2
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_5

    .line 3
    .line 4
    instance-of v1, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    check-cast p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;

    .line 10
    .line 11
    iget v1, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->mDegree:I

    .line 12
    .line 13
    iget v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->mDegree:I

    .line 14
    .line 15
    if-eq v1, v2, :cond_1

    .line 16
    .line 17
    return v0

    .line 18
    :cond_1
    iget-object v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->fieldPolynomial:Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 19
    .line 20
    iget-object v2, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->fieldPolynomial:Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->equals(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-nez v1, :cond_2

    .line 27
    .line 28
    return v0

    .line 29
    :cond_2
    instance-of v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;

    .line 30
    .line 31
    if-eqz v1, :cond_3

    .line 32
    .line 33
    instance-of v1, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2nPolynomialField;

    .line 34
    .line 35
    if-nez v1, :cond_3

    .line 36
    .line 37
    return v0

    .line 38
    :cond_3
    instance-of p0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;

    .line 39
    .line 40
    if-eqz p0, :cond_4

    .line 41
    .line 42
    instance-of p0, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;

    .line 43
    .line 44
    if-nez p0, :cond_4

    .line 45
    .line 46
    return v0

    .line 47
    :cond_4
    const/4 p0, 0x1

    .line 48
    return p0

    .line 49
    :cond_5
    :goto_0
    return v0
.end method

.method public final getDegree()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->mDegree:I

    .line 2
    .line 3
    return p0
.end method

.method public final getFieldPolynomial()Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->fieldPolynomial:Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->computeFieldPolynomial()V

    .line 6
    .line 7
    .line 8
    :cond_0
    new-instance v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 9
    .line 10
    iget-object p0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->fieldPolynomial:Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)V

    .line 13
    .line 14
    .line 15
    return-object v0
.end method

.method public abstract getRandomRoot(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;
.end method

.method public hashCode()I
    .locals 1

    .line 1
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->mDegree:I

    .line 2
    .line 3
    iget-object p0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->fieldPolynomial:Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 4
    .line 5
    invoke-virtual {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->hashCode()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    add-int/2addr v0, p0

    .line 10
    return v0
.end method

.method public final invertMatrix([Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)[Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;
    .locals 6

    .line 1
    array-length v0, p1

    .line 2
    new-array v0, v0, [Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 3
    .line 4
    array-length v1, p1

    .line 5
    new-array v1, v1, [Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    move v3, v2

    .line 9
    :goto_0
    iget v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->mDegree:I

    .line 10
    .line 11
    if-ge v3, v4, :cond_0

    .line 12
    .line 13
    :try_start_0
    new-instance v4, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 14
    .line 15
    aget-object v5, p1, v3

    .line 16
    .line 17
    invoke-direct {v4, v5}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)V

    .line 18
    .line 19
    .line 20
    aput-object v4, v0, v3

    .line 21
    .line 22
    new-instance v4, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;

    .line 23
    .line 24
    iget v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->mDegree:I

    .line 25
    .line 26
    invoke-direct {v4, v5}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;-><init>(I)V

    .line 27
    .line 28
    .line 29
    aput-object v4, v1, v3

    .line 30
    .line 31
    iget v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->mDegree:I

    .line 32
    .line 33
    add-int/lit8 v5, v5, -0x1

    .line 34
    .line 35
    sub-int/2addr v5, v3

    .line 36
    invoke-virtual {v4, v5}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->setBit(I)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 37
    .line 38
    .line 39
    goto :goto_1

    .line 40
    :catch_0
    move-exception v4

    .line 41
    invoke-virtual {v4}, Ljava/lang/Throwable;->printStackTrace()V

    .line 42
    .line 43
    .line 44
    :goto_1
    add-int/lit8 v3, v3, 0x1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    :goto_2
    iget p1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->mDegree:I

    .line 48
    .line 49
    add-int/lit8 v3, p1, -0x1

    .line 50
    .line 51
    if-ge v2, v3, :cond_6

    .line 52
    .line 53
    move p1, v2

    .line 54
    :goto_3
    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->mDegree:I

    .line 55
    .line 56
    if-ge p1, v3, :cond_1

    .line 57
    .line 58
    aget-object v4, v0, p1

    .line 59
    .line 60
    add-int/lit8 v3, v3, -0x1

    .line 61
    .line 62
    sub-int/2addr v3, v2

    .line 63
    invoke-virtual {v4, v3}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->testBit(I)Z

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    if-nez v3, :cond_1

    .line 68
    .line 69
    add-int/lit8 p1, p1, 0x1

    .line 70
    .line 71
    goto :goto_3

    .line 72
    :cond_1
    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->mDegree:I

    .line 73
    .line 74
    if-ge p1, v3, :cond_5

    .line 75
    .line 76
    if-eq v2, p1, :cond_2

    .line 77
    .line 78
    aget-object v3, v0, v2

    .line 79
    .line 80
    aget-object v4, v0, p1

    .line 81
    .line 82
    aput-object v4, v0, v2

    .line 83
    .line 84
    aput-object v3, v0, p1

    .line 85
    .line 86
    aget-object v3, v1, v2

    .line 87
    .line 88
    aget-object v4, v1, p1

    .line 89
    .line 90
    aput-object v4, v1, v2

    .line 91
    .line 92
    aput-object v3, v1, p1

    .line 93
    .line 94
    :cond_2
    add-int/lit8 p1, v2, 0x1

    .line 95
    .line 96
    move v3, p1

    .line 97
    :goto_4
    iget v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->mDegree:I

    .line 98
    .line 99
    if-ge v3, v4, :cond_4

    .line 100
    .line 101
    aget-object v5, v0, v3

    .line 102
    .line 103
    add-int/lit8 v4, v4, -0x1

    .line 104
    .line 105
    sub-int/2addr v4, v2

    .line 106
    invoke-virtual {v5, v4}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->testBit(I)Z

    .line 107
    .line 108
    .line 109
    move-result v4

    .line 110
    if-eqz v4, :cond_3

    .line 111
    .line 112
    aget-object v4, v0, v3

    .line 113
    .line 114
    aget-object v5, v0, v2

    .line 115
    .line 116
    invoke-virtual {v4, v5}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->addToThis(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)V

    .line 117
    .line 118
    .line 119
    aget-object v4, v1, v3

    .line 120
    .line 121
    aget-object v5, v1, v2

    .line 122
    .line 123
    invoke-virtual {v4, v5}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->addToThis(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)V

    .line 124
    .line 125
    .line 126
    :cond_3
    add-int/lit8 v3, v3, 0x1

    .line 127
    .line 128
    goto :goto_4

    .line 129
    :cond_4
    move v2, p1

    .line 130
    goto :goto_2

    .line 131
    :cond_5
    const-string p0, "GF2nField.invertMatrix: Matrix cannot be inverted!"

    .line 132
    .line 133
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    const/4 p0, 0x0

    .line 137
    return-object p0

    .line 138
    :cond_6
    add-int/lit8 p1, p1, -0x1

    .line 139
    .line 140
    :goto_5
    if-lez p1, :cond_9

    .line 141
    .line 142
    add-int/lit8 v2, p1, -0x1

    .line 143
    .line 144
    :goto_6
    if-ltz v2, :cond_8

    .line 145
    .line 146
    aget-object v3, v0, v2

    .line 147
    .line 148
    iget v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->mDegree:I

    .line 149
    .line 150
    add-int/lit8 v4, v4, -0x1

    .line 151
    .line 152
    sub-int/2addr v4, p1

    .line 153
    invoke-virtual {v3, v4}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->testBit(I)Z

    .line 154
    .line 155
    .line 156
    move-result v3

    .line 157
    if-eqz v3, :cond_7

    .line 158
    .line 159
    aget-object v3, v0, v2

    .line 160
    .line 161
    aget-object v4, v0, p1

    .line 162
    .line 163
    invoke-virtual {v3, v4}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->addToThis(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)V

    .line 164
    .line 165
    .line 166
    aget-object v3, v1, v2

    .line 167
    .line 168
    aget-object v4, v1, p1

    .line 169
    .line 170
    invoke-virtual {v3, v4}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;->addToThis(Lorg/spongycastle/pqc/math/linearalgebra/GF2Polynomial;)V

    .line 171
    .line 172
    .line 173
    :cond_7
    add-int/lit8 v2, v2, -0x1

    .line 174
    .line 175
    goto :goto_6

    .line 176
    :cond_8
    add-int/lit8 p1, p1, -0x1

    .line 177
    .line 178
    goto :goto_5

    .line 179
    :cond_9
    return-object v1
.end method
