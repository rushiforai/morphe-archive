.class public abstract Lorg/spongycastle/math/raw/Mod;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static add([I[I[I[I)V
    .locals 1

    .line 1
    array-length v0, p0

    .line 2
    invoke-static {v0, p1, p2, p3}, Lorg/spongycastle/math/raw/Nat;->add(I[I[I[I)I

    .line 3
    .line 4
    .line 5
    move-result p1

    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    invoke-static {v0, p0, p3}, Lorg/spongycastle/math/raw/Nat;->subFrom(I[I[I)I

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method private static getTrailingZeroes(I)I
    .locals 2

    const/4 v0, 0x0

    :goto_0
    and-int/lit8 v1, p0, 0x1

    if-nez v1, :cond_0

    ushr-int/lit8 p0, p0, 0x1

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return v0
.end method

.method public static inverse32(I)I
    .locals 2

    mul-int v0, p0, p0

    rsub-int/lit8 v0, v0, 0x2

    mul-int/2addr v0, p0

    mul-int v1, p0, v0

    rsub-int/lit8 v1, v1, 0x2

    mul-int/2addr v0, v1

    mul-int v1, p0, v0

    rsub-int/lit8 v1, v1, 0x2

    mul-int/2addr v0, v1

    mul-int/2addr p0, v0

    rsub-int/lit8 p0, p0, 0x2

    mul-int/2addr v0, p0

    return v0
.end method

.method private static inversionResult([II[I[I)V
    .locals 0

    .line 1
    if-gez p1, :cond_0

    .line 2
    .line 3
    array-length p1, p0

    .line 4
    invoke-static {p1, p2, p0, p3}, Lorg/spongycastle/math/raw/Nat;->add(I[I[I[I)I

    .line 5
    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    array-length p0, p0

    .line 9
    const/4 p1, 0x0

    .line 10
    invoke-static {p2, p1, p3, p1, p0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private static inversionStep([I[II[II)I
    .locals 4

    .line 1
    array-length v0, p0

    .line 2
    const/4 v1, 0x0

    .line 3
    move v2, v1

    .line 4
    :goto_0
    aget v3, p1, v1

    .line 5
    .line 6
    if-nez v3, :cond_0

    .line 7
    .line 8
    invoke-static {p2, p1, v1}, Lorg/spongycastle/math/raw/Nat;->shiftDownWord(I[II)I

    .line 9
    .line 10
    .line 11
    add-int/lit8 v2, v2, 0x20

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-static {v3}, Lorg/spongycastle/math/raw/Mod;->getTrailingZeroes(I)I

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    if-lez v3, :cond_1

    .line 19
    .line 20
    invoke-static {p2, p1, v3, v1}, Lorg/spongycastle/math/raw/Nat;->shiftDownBits(I[III)I

    .line 21
    .line 22
    .line 23
    add-int/2addr v2, v3

    .line 24
    :cond_1
    move p1, v1

    .line 25
    :goto_1
    if-ge p1, v2, :cond_4

    .line 26
    .line 27
    aget p2, p3, v1

    .line 28
    .line 29
    and-int/lit8 p2, p2, 0x1

    .line 30
    .line 31
    if-eqz p2, :cond_3

    .line 32
    .line 33
    if-gez p4, :cond_2

    .line 34
    .line 35
    invoke-static {v0, p0, p3}, Lorg/spongycastle/math/raw/Nat;->addTo(I[I[I)I

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    :goto_2
    add-int/2addr p4, p2

    .line 40
    goto :goto_3

    .line 41
    :cond_2
    invoke-static {v0, p0, p3}, Lorg/spongycastle/math/raw/Nat;->subFrom(I[I[I)I

    .line 42
    .line 43
    .line 44
    move-result p2

    .line 45
    goto :goto_2

    .line 46
    :cond_3
    :goto_3
    invoke-static {v0, p3, p4}, Lorg/spongycastle/math/raw/Nat;->shiftDownBit(I[II)I

    .line 47
    .line 48
    .line 49
    add-int/lit8 p1, p1, 0x1

    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_4
    return p4
.end method

.method public static invert([I[I[I)V
    .locals 9

    .line 1
    array-length v0, p0

    .line 2
    invoke-static {v0, p1}, Lorg/spongycastle/math/raw/Nat;->isZero(I[I)Z

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    if-nez v1, :cond_6

    .line 7
    .line 8
    invoke-static {v0, p1}, Lorg/spongycastle/math/raw/Nat;->isOne(I[I)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    const/4 v2, 0x0

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-static {p1, v2, p2, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-static {v0, p1}, Lorg/spongycastle/math/raw/Nat;->copy(I[I)[I

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-static {v0}, Lorg/spongycastle/math/raw/Nat;->create(I)[I

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const/4 v3, 0x1

    .line 28
    aput v3, v1, v2

    .line 29
    .line 30
    aget v4, p1, v2

    .line 31
    .line 32
    and-int/2addr v3, v4

    .line 33
    if-nez v3, :cond_1

    .line 34
    .line 35
    invoke-static {p0, p1, v0, v1, v2}, Lorg/spongycastle/math/raw/Mod;->inversionStep([I[II[II)I

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    goto :goto_0

    .line 40
    :cond_1
    move v3, v2

    .line 41
    :goto_0
    invoke-static {v0, p1}, Lorg/spongycastle/math/raw/Nat;->isOne(I[I)Z

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    if-eqz v4, :cond_2

    .line 46
    .line 47
    invoke-static {p0, v3, v1, p2}, Lorg/spongycastle/math/raw/Mod;->inversionResult([II[I[I)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_2
    invoke-static {v0, p0}, Lorg/spongycastle/math/raw/Nat;->copy(I[I)[I

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    invoke-static {v0}, Lorg/spongycastle/math/raw/Nat;->create(I)[I

    .line 56
    .line 57
    .line 58
    move-result-object v5

    .line 59
    move v6, v0

    .line 60
    :cond_3
    :goto_1
    add-int/lit8 v7, v6, -0x1

    .line 61
    .line 62
    aget v8, p1, v7

    .line 63
    .line 64
    if-nez v8, :cond_4

    .line 65
    .line 66
    aget v7, v4, v7

    .line 67
    .line 68
    if-nez v7, :cond_4

    .line 69
    .line 70
    add-int/lit8 v6, v6, -0x1

    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_4
    invoke-static {v6, p1, v4}, Lorg/spongycastle/math/raw/Nat;->gte(I[I[I)Z

    .line 74
    .line 75
    .line 76
    move-result v7

    .line 77
    if-eqz v7, :cond_5

    .line 78
    .line 79
    invoke-static {v6, v4, p1}, Lorg/spongycastle/math/raw/Nat;->subFrom(I[I[I)I

    .line 80
    .line 81
    .line 82
    invoke-static {v0, v5, v1}, Lorg/spongycastle/math/raw/Nat;->subFrom(I[I[I)I

    .line 83
    .line 84
    .line 85
    move-result v7

    .line 86
    sub-int/2addr v7, v2

    .line 87
    add-int/2addr v3, v7

    .line 88
    invoke-static {p0, p1, v6, v1, v3}, Lorg/spongycastle/math/raw/Mod;->inversionStep([I[II[II)I

    .line 89
    .line 90
    .line 91
    move-result v3

    .line 92
    invoke-static {v6, p1}, Lorg/spongycastle/math/raw/Nat;->isOne(I[I)Z

    .line 93
    .line 94
    .line 95
    move-result v7

    .line 96
    if-eqz v7, :cond_3

    .line 97
    .line 98
    invoke-static {p0, v3, v1, p2}, Lorg/spongycastle/math/raw/Mod;->inversionResult([II[I[I)V

    .line 99
    .line 100
    .line 101
    return-void

    .line 102
    :cond_5
    invoke-static {v6, p1, v4}, Lorg/spongycastle/math/raw/Nat;->subFrom(I[I[I)I

    .line 103
    .line 104
    .line 105
    invoke-static {v0, v1, v5}, Lorg/spongycastle/math/raw/Nat;->subFrom(I[I[I)I

    .line 106
    .line 107
    .line 108
    move-result v7

    .line 109
    sub-int/2addr v7, v3

    .line 110
    add-int/2addr v2, v7

    .line 111
    invoke-static {p0, v4, v6, v5, v2}, Lorg/spongycastle/math/raw/Mod;->inversionStep([I[II[II)I

    .line 112
    .line 113
    .line 114
    move-result v2

    .line 115
    invoke-static {v6, v4}, Lorg/spongycastle/math/raw/Nat;->isOne(I[I)Z

    .line 116
    .line 117
    .line 118
    move-result v7

    .line 119
    if-eqz v7, :cond_3

    .line 120
    .line 121
    invoke-static {p0, v2, v5, p2}, Lorg/spongycastle/math/raw/Mod;->inversionResult([II[I[I)V

    .line 122
    .line 123
    .line 124
    return-void

    .line 125
    :cond_6
    const-string p0, "\'x\' cannot be 0"

    .line 126
    .line 127
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    return-void
.end method

.method public static random([I)[I
    .locals 7

    .line 1
    array-length v0, p0

    .line 2
    new-instance v1, Ljava/util/Random;

    .line 3
    .line 4
    invoke-direct {v1}, Ljava/util/Random;-><init>()V

    .line 5
    .line 6
    .line 7
    invoke-static {v0}, Lorg/spongycastle/math/raw/Nat;->create(I)[I

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    add-int/lit8 v3, v0, -0x1

    .line 12
    .line 13
    aget v4, p0, v3

    .line 14
    .line 15
    ushr-int/lit8 v5, v4, 0x1

    .line 16
    .line 17
    or-int/2addr v4, v5

    .line 18
    ushr-int/lit8 v5, v4, 0x2

    .line 19
    .line 20
    or-int/2addr v4, v5

    .line 21
    ushr-int/lit8 v5, v4, 0x4

    .line 22
    .line 23
    or-int/2addr v4, v5

    .line 24
    ushr-int/lit8 v5, v4, 0x8

    .line 25
    .line 26
    or-int/2addr v4, v5

    .line 27
    ushr-int/lit8 v5, v4, 0x10

    .line 28
    .line 29
    or-int/2addr v4, v5

    .line 30
    :cond_0
    const/4 v5, 0x0

    .line 31
    :goto_0
    if-eq v5, v0, :cond_1

    .line 32
    .line 33
    invoke-virtual {v1}, Ljava/util/Random;->nextInt()I

    .line 34
    .line 35
    .line 36
    move-result v6

    .line 37
    aput v6, v2, v5

    .line 38
    .line 39
    add-int/lit8 v5, v5, 0x1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    aget v5, v2, v3

    .line 43
    .line 44
    and-int/2addr v5, v4

    .line 45
    aput v5, v2, v3

    .line 46
    .line 47
    invoke-static {v0, v2, p0}, Lorg/spongycastle/math/raw/Nat;->gte(I[I[I)Z

    .line 48
    .line 49
    .line 50
    move-result v5

    .line 51
    if-nez v5, :cond_0

    .line 52
    .line 53
    return-object v2
.end method

.method public static subtract([I[I[I[I)V
    .locals 1

    .line 1
    array-length v0, p0

    .line 2
    invoke-static {v0, p1, p2, p3}, Lorg/spongycastle/math/raw/Nat;->sub(I[I[I[I)I

    .line 3
    .line 4
    .line 5
    move-result p1

    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    invoke-static {v0, p0, p3}, Lorg/spongycastle/math/raw/Nat;->addTo(I[I[I)I

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method
