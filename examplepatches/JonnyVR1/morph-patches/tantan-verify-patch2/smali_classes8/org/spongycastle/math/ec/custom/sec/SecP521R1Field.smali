.class public Lorg/spongycastle/math/ec/custom/sec/SecP521R1Field;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field static final P:[I

.field private static final P16:I = 0x1ff


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0x11

    .line 2
    .line 3
    new-array v0, v0, [I

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v0, Lorg/spongycastle/math/ec/custom/sec/SecP521R1Field;->P:[I

    .line 9
    .line 10
    return-void

    .line 11
    :array_0
    .array-data 4
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        0x1ff
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
    .locals 2

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    invoke-static {v0, p0, p1, p2}, Lorg/spongycastle/math/raw/Nat;->add(I[I[I[I)I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    aget p0, p0, v0

    .line 8
    .line 9
    add-int/2addr v1, p0

    .line 10
    aget p0, p1, v0

    .line 11
    .line 12
    add-int/2addr v1, p0

    .line 13
    const/16 p0, 0x1ff

    .line 14
    .line 15
    if-gt v1, p0, :cond_0

    .line 16
    .line 17
    if-ne v1, p0, :cond_1

    .line 18
    .line 19
    sget-object p1, Lorg/spongycastle/math/ec/custom/sec/SecP521R1Field;->P:[I

    .line 20
    .line 21
    invoke-static {v0, p2, p1}, Lorg/spongycastle/math/raw/Nat;->eq(I[I[I)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    :cond_0
    invoke-static {v0, p2}, Lorg/spongycastle/math/raw/Nat;->inc(I[I)I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    add-int/2addr v1, p1

    .line 32
    and-int/2addr v1, p0

    .line 33
    :cond_1
    aput v1, p2, v0

    .line 34
    .line 35
    return-void
.end method

.method public static addOne([I[I)V
    .locals 3

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    invoke-static {v0, p0, p1}, Lorg/spongycastle/math/raw/Nat;->inc(I[I[I)I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    aget p0, p0, v0

    .line 8
    .line 9
    add-int/2addr v1, p0

    .line 10
    const/16 p0, 0x1ff

    .line 11
    .line 12
    if-gt v1, p0, :cond_0

    .line 13
    .line 14
    if-ne v1, p0, :cond_1

    .line 15
    .line 16
    sget-object v2, Lorg/spongycastle/math/ec/custom/sec/SecP521R1Field;->P:[I

    .line 17
    .line 18
    invoke-static {v0, p1, v2}, Lorg/spongycastle/math/raw/Nat;->eq(I[I[I)Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-eqz v2, :cond_1

    .line 23
    .line 24
    :cond_0
    invoke-static {v0, p1}, Lorg/spongycastle/math/raw/Nat;->inc(I[I)I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    add-int/2addr v1, v2

    .line 29
    and-int/2addr v1, p0

    .line 30
    :cond_1
    aput v1, p1, v0

    .line 31
    .line 32
    return-void
.end method

.method public static fromBigInteger(Ljava/math/BigInteger;)[I
    .locals 2

    .line 1
    const/16 v0, 0x209

    .line 2
    .line 3
    invoke-static {v0, p0}, Lorg/spongycastle/math/raw/Nat;->fromBigInteger(ILjava/math/BigInteger;)[I

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget-object v0, Lorg/spongycastle/math/ec/custom/sec/SecP521R1Field;->P:[I

    .line 8
    .line 9
    const/16 v1, 0x11

    .line 10
    .line 11
    invoke-static {v1, p0, v0}, Lorg/spongycastle/math/raw/Nat;->eq(I[I[I)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-static {v1, p0}, Lorg/spongycastle/math/raw/Nat;->zero(I[I)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-object p0
.end method

.method public static half([I[I)V
    .locals 2

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    aget v1, p0, v0

    .line 4
    .line 5
    invoke-static {v0, p0, v1, p1}, Lorg/spongycastle/math/raw/Nat;->shiftDownBit(I[II[I)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    ushr-int/lit8 v1, v1, 0x1

    .line 10
    .line 11
    ushr-int/lit8 p0, p0, 0x17

    .line 12
    .line 13
    or-int/2addr p0, v1

    .line 14
    aput p0, p1, v0

    .line 15
    .line 16
    return-void
.end method

.method public static implMultiply([I[I[I)V
    .locals 8

    .line 1
    invoke-static {p0, p1, p2}, Lorg/spongycastle/math/raw/Nat512;->mul([I[I[I)V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x10

    .line 5
    .line 6
    aget v2, p0, v0

    .line 7
    .line 8
    aget v4, p1, v0

    .line 9
    .line 10
    const/16 v1, 0x10

    .line 11
    .line 12
    const/16 v7, 0x10

    .line 13
    .line 14
    move-object v5, p0

    .line 15
    move-object v3, p1

    .line 16
    move-object v6, p2

    .line 17
    invoke-static/range {v1 .. v7}, Lorg/spongycastle/math/raw/Nat;->mul31BothAdd(II[II[I[II)I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    mul-int/2addr v2, v4

    .line 22
    add-int/2addr p0, v2

    .line 23
    const/16 p1, 0x20

    .line 24
    .line 25
    aput p0, v6, p1

    .line 26
    .line 27
    return-void
.end method

.method public static implSquare([I[I)V
    .locals 7

    .line 1
    invoke-static {p0, p1}, Lorg/spongycastle/math/raw/Nat512;->square([I[I)V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x10

    .line 5
    .line 6
    aget v0, p0, v0

    .line 7
    .line 8
    shl-int/lit8 v2, v0, 0x1

    .line 9
    .line 10
    const/4 v4, 0x0

    .line 11
    const/16 v6, 0x10

    .line 12
    .line 13
    const/16 v1, 0x10

    .line 14
    .line 15
    move-object v3, p0

    .line 16
    move-object v5, p1

    .line 17
    invoke-static/range {v1 .. v6}, Lorg/spongycastle/math/raw/Nat;->mulWordAddTo(II[II[II)I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    mul-int/2addr v0, v0

    .line 22
    add-int/2addr p0, v0

    .line 23
    const/16 p1, 0x20

    .line 24
    .line 25
    aput p0, v5, p1

    .line 26
    .line 27
    return-void
.end method

.method public static multiply([I[I[I)V
    .locals 1

    .line 1
    const/16 v0, 0x21

    .line 2
    .line 3
    invoke-static {v0}, Lorg/spongycastle/math/raw/Nat;->create(I)[I

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p0, p1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecP521R1Field;->implMultiply([I[I[I)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, p2}, Lorg/spongycastle/math/ec/custom/sec/SecP521R1Field;->reduce([I[I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static negate([I[I)V
    .locals 2

    .line 1
    const/16 v0, 0x11

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
    sget-object v1, Lorg/spongycastle/math/ec/custom/sec/SecP521R1Field;->P:[I

    .line 14
    .line 15
    invoke-static {v0, v1, p0, p1}, Lorg/spongycastle/math/raw/Nat;->sub(I[I[I[I)I

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static reduce([I[I)V
    .locals 8

    .line 1
    const/16 v0, 0x20

    .line 2
    .line 3
    aget v5, p0, v0

    .line 4
    .line 5
    const/16 v4, 0x9

    .line 6
    .line 7
    const/4 v7, 0x0

    .line 8
    const/16 v1, 0x10

    .line 9
    .line 10
    const/16 v3, 0x10

    .line 11
    .line 12
    move-object v2, p0

    .line 13
    move-object v6, p1

    .line 14
    invoke-static/range {v1 .. v7}, Lorg/spongycastle/math/raw/Nat;->shiftDownBits(I[IIII[II)I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    ushr-int/lit8 p0, p0, 0x17

    .line 19
    .line 20
    ushr-int/lit8 p1, v5, 0x9

    .line 21
    .line 22
    add-int/2addr p0, p1

    .line 23
    const/16 p1, 0x10

    .line 24
    .line 25
    invoke-static {p1, v2, v6}, Lorg/spongycastle/math/raw/Nat;->addTo(I[I[I)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    add-int/2addr p0, v0

    .line 30
    const/16 v0, 0x1ff

    .line 31
    .line 32
    if-gt p0, v0, :cond_0

    .line 33
    .line 34
    if-ne p0, v0, :cond_1

    .line 35
    .line 36
    sget-object v1, Lorg/spongycastle/math/ec/custom/sec/SecP521R1Field;->P:[I

    .line 37
    .line 38
    invoke-static {p1, v6, v1}, Lorg/spongycastle/math/raw/Nat;->eq(I[I[I)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-eqz v1, :cond_1

    .line 43
    .line 44
    :cond_0
    invoke-static {p1, v6}, Lorg/spongycastle/math/raw/Nat;->inc(I[I)I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    add-int/2addr p0, v1

    .line 49
    and-int/2addr p0, v0

    .line 50
    :cond_1
    aput p0, v6, p1

    .line 51
    .line 52
    return-void
.end method

.method public static reduce23([I)V
    .locals 4

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    aget v1, p0, v0

    .line 4
    .line 5
    ushr-int/lit8 v2, v1, 0x9

    .line 6
    .line 7
    invoke-static {v0, v2, p0}, Lorg/spongycastle/math/raw/Nat;->addWordTo(II[I)I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    const/16 v3, 0x1ff

    .line 12
    .line 13
    and-int/2addr v1, v3

    .line 14
    add-int/2addr v2, v1

    .line 15
    if-gt v2, v3, :cond_0

    .line 16
    .line 17
    if-ne v2, v3, :cond_1

    .line 18
    .line 19
    sget-object v1, Lorg/spongycastle/math/ec/custom/sec/SecP521R1Field;->P:[I

    .line 20
    .line 21
    invoke-static {v0, p0, v1}, Lorg/spongycastle/math/raw/Nat;->eq(I[I[I)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_1

    .line 26
    .line 27
    :cond_0
    invoke-static {v0, p0}, Lorg/spongycastle/math/raw/Nat;->inc(I[I)I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    add-int/2addr v2, v1

    .line 32
    and-int/2addr v2, v3

    .line 33
    :cond_1
    aput v2, p0, v0

    .line 34
    .line 35
    return-void
.end method

.method public static square([I[I)V
    .locals 1

    .line 1
    const/16 v0, 0x21

    .line 2
    .line 3
    invoke-static {v0}, Lorg/spongycastle/math/raw/Nat;->create(I)[I

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecP521R1Field;->implSquare([I[I)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, p1}, Lorg/spongycastle/math/ec/custom/sec/SecP521R1Field;->reduce([I[I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static squareN([II[I)V
    .locals 1

    .line 1
    const/16 v0, 0x21

    .line 2
    .line 3
    invoke-static {v0}, Lorg/spongycastle/math/raw/Nat;->create(I)[I

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecP521R1Field;->implSquare([I[I)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, p2}, Lorg/spongycastle/math/ec/custom/sec/SecP521R1Field;->reduce([I[I)V

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
    invoke-static {p2, v0}, Lorg/spongycastle/math/ec/custom/sec/SecP521R1Field;->implSquare([I[I)V

    .line 18
    .line 19
    .line 20
    invoke-static {v0, p2}, Lorg/spongycastle/math/ec/custom/sec/SecP521R1Field;->reduce([I[I)V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    return-void
.end method

.method public static subtract([I[I[I)V
    .locals 2

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    invoke-static {v0, p0, p1, p2}, Lorg/spongycastle/math/raw/Nat;->sub(I[I[I[I)I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    aget p0, p0, v0

    .line 8
    .line 9
    add-int/2addr v1, p0

    .line 10
    aget p0, p1, v0

    .line 11
    .line 12
    sub-int/2addr v1, p0

    .line 13
    if-gez v1, :cond_0

    .line 14
    .line 15
    invoke-static {v0, p2}, Lorg/spongycastle/math/raw/Nat;->dec(I[I)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    add-int/2addr v1, p0

    .line 20
    and-int/lit16 v1, v1, 0x1ff

    .line 21
    .line 22
    :cond_0
    aput v1, p2, v0

    .line 23
    .line 24
    return-void
.end method

.method public static twice([I[I)V
    .locals 3

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    aget v1, p0, v0

    .line 4
    .line 5
    shl-int/lit8 v2, v1, 0x17

    .line 6
    .line 7
    invoke-static {v0, p0, v2, p1}, Lorg/spongycastle/math/raw/Nat;->shiftUpBit(I[II[I)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    shl-int/lit8 v1, v1, 0x1

    .line 12
    .line 13
    or-int/2addr p0, v1

    .line 14
    and-int/lit16 p0, p0, 0x1ff

    .line 15
    .line 16
    aput p0, p1, v0

    .line 17
    .line 18
    return-void
.end method
