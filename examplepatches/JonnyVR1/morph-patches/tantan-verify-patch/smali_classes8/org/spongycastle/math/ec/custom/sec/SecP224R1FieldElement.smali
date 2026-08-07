.class public Lorg/spongycastle/math/ec/custom/sec/SecP224R1FieldElement;
.super Lorg/spongycastle/math/ec/ECFieldElement;
.source "SourceFile"


# static fields
.field public static final Q:Ljava/math/BigInteger;


# instance fields
.field protected x:[I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Curve;->q:Ljava/math/BigInteger;

    .line 2
    .line 3
    sput-object v0, Lorg/spongycastle/math/ec/custom/sec/SecP224R1FieldElement;->Q:Ljava/math/BigInteger;

    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 34
    invoke-direct {p0}, Lorg/spongycastle/math/ec/ECFieldElement;-><init>()V

    .line 35
    invoke-static {}, Lorg/spongycastle/math/raw/Nat224;->create()[I

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/math/ec/custom/sec/SecP224R1FieldElement;->x:[I

    return-void
.end method

.method public constructor <init>(Ljava/math/BigInteger;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lorg/spongycastle/math/ec/ECFieldElement;-><init>()V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p1}, Ljava/math/BigInteger;->signum()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-ltz v0, :cond_0

    .line 11
    .line 12
    sget-object v0, Lorg/spongycastle/math/ec/custom/sec/SecP224R1FieldElement;->Q:Ljava/math/BigInteger;

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-gez v0, :cond_0

    .line 19
    .line 20
    invoke-static {p1}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->fromBigInteger(Ljava/math/BigInteger;)[I

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iput-object p1, p0, Lorg/spongycastle/math/ec/custom/sec/SecP224R1FieldElement;->x:[I

    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    const-string p0, "x value invalid for SecP224R1FieldElement"

    .line 28
    .line 29
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    const/4 p0, 0x0

    .line 33
    throw p0
.end method

.method public constructor <init>([I)V
    .locals 0

    .line 36
    invoke-direct {p0}, Lorg/spongycastle/math/ec/ECFieldElement;-><init>()V

    .line 37
    iput-object p1, p0, Lorg/spongycastle/math/ec/custom/sec/SecP224R1FieldElement;->x:[I

    return-void
.end method

.method private static RM([I[I[I[I[I[I[I)V
    .locals 0

    .line 1
    invoke-static {p4, p2, p6}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->multiply([I[I[I)V

    .line 2
    .line 3
    .line 4
    invoke-static {p6, p0, p6}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->multiply([I[I[I)V

    .line 5
    .line 6
    .line 7
    invoke-static {p3, p1, p5}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->multiply([I[I[I)V

    .line 8
    .line 9
    .line 10
    invoke-static {p5, p6, p5}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->add([I[I[I)V

    .line 11
    .line 12
    .line 13
    invoke-static {p3, p2, p6}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->multiply([I[I[I)V

    .line 14
    .line 15
    .line 16
    invoke-static {p5, p3}, Lorg/spongycastle/math/raw/Nat224;->copy([I[I)V

    .line 17
    .line 18
    .line 19
    invoke-static {p4, p1, p4}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->multiply([I[I[I)V

    .line 20
    .line 21
    .line 22
    invoke-static {p4, p6, p4}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->add([I[I[I)V

    .line 23
    .line 24
    .line 25
    invoke-static {p4, p5}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->square([I[I)V

    .line 26
    .line 27
    .line 28
    invoke-static {p5, p0, p5}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->multiply([I[I[I)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method private static RP([I[I[I[I[I)V
    .locals 8

    .line 1
    invoke-static {p0, p3}, Lorg/spongycastle/math/raw/Nat224;->copy([I[I)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lorg/spongycastle/math/raw/Nat224;->create()[I

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-static {}, Lorg/spongycastle/math/raw/Nat224;->create()[I

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    const/4 v0, 0x0

    .line 13
    move v7, v0

    .line 14
    :goto_0
    const/4 v0, 0x7

    .line 15
    if-ge v7, v0, :cond_1

    .line 16
    .line 17
    invoke-static {p1, v1}, Lorg/spongycastle/math/raw/Nat224;->copy([I[I)V

    .line 18
    .line 19
    .line 20
    invoke-static {p2, v2}, Lorg/spongycastle/math/raw/Nat224;->copy([I[I)V

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    shl-int/2addr v0, v7

    .line 25
    :goto_1
    add-int/lit8 v0, v0, -0x1

    .line 26
    .line 27
    if-ltz v0, :cond_0

    .line 28
    .line 29
    invoke-static {p1, p2, p3, p4}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1FieldElement;->RS([I[I[I[I)V

    .line 30
    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_0
    move-object v0, p0

    .line 34
    move-object v3, p1

    .line 35
    move-object v4, p2

    .line 36
    move-object v5, p3

    .line 37
    move-object v6, p4

    .line 38
    invoke-static/range {v0 .. v6}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1FieldElement;->RM([I[I[I[I[I[I[I)V

    .line 39
    .line 40
    .line 41
    add-int/lit8 v7, v7, 0x1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    return-void
.end method

.method private static RS([I[I[I[I)V
    .locals 0

    .line 1
    invoke-static {p1, p0, p1}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->multiply([I[I[I)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1, p1}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->twice([I[I)V

    .line 5
    .line 6
    .line 7
    invoke-static {p0, p3}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->square([I[I)V

    .line 8
    .line 9
    .line 10
    invoke-static {p2, p3, p0}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->add([I[I[I)V

    .line 11
    .line 12
    .line 13
    invoke-static {p2, p3, p2}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->multiply([I[I[I)V

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x2

    .line 17
    const/4 p1, 0x0

    .line 18
    const/4 p3, 0x7

    .line 19
    invoke-static {p3, p2, p0, p1}, Lorg/spongycastle/math/raw/Nat;->shiftUpBits(I[III)I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    invoke-static {p0, p2}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->reduce32(I[I)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method private static isSquare([I)Z
    .locals 3

    .line 1
    invoke-static {}, Lorg/spongycastle/math/raw/Nat224;->create()[I

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Lorg/spongycastle/math/raw/Nat224;->create()[I

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {p0, v0}, Lorg/spongycastle/math/raw/Nat224;->copy([I[I)V

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    :goto_0
    const/4 v2, 0x7

    .line 14
    if-ge p0, v2, :cond_0

    .line 15
    .line 16
    invoke-static {v0, v1}, Lorg/spongycastle/math/raw/Nat224;->copy([I[I)V

    .line 17
    .line 18
    .line 19
    const/4 v2, 0x1

    .line 20
    shl-int/2addr v2, p0

    .line 21
    invoke-static {v0, v2, v0}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->squareN([II[I)V

    .line 22
    .line 23
    .line 24
    invoke-static {v0, v1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->multiply([I[I[I)V

    .line 25
    .line 26
    .line 27
    add-int/lit8 p0, p0, 0x1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const/16 p0, 0x5f

    .line 31
    .line 32
    invoke-static {v0, p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->squareN([II[I)V

    .line 33
    .line 34
    .line 35
    invoke-static {v0}, Lorg/spongycastle/math/raw/Nat224;->isOne([I)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    return p0
.end method

.method private static trySqrt([I[I[I)Z
    .locals 7

    .line 1
    invoke-static {}, Lorg/spongycastle/math/raw/Nat224;->create()[I

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p1, v0}, Lorg/spongycastle/math/raw/Nat224;->copy([I[I)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lorg/spongycastle/math/raw/Nat224;->create()[I

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    const/4 v1, 0x0

    .line 13
    const/4 v2, 0x1

    .line 14
    aput v2, p1, v1

    .line 15
    .line 16
    invoke-static {}, Lorg/spongycastle/math/raw/Nat224;->create()[I

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    invoke-static {p0, v0, p1, v3, p2}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1FieldElement;->RP([I[I[I[I[I)V

    .line 21
    .line 22
    .line 23
    invoke-static {}, Lorg/spongycastle/math/raw/Nat224;->create()[I

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {}, Lorg/spongycastle/math/raw/Nat224;->create()[I

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    move v5, v2

    .line 32
    :goto_0
    const/16 v6, 0x60

    .line 33
    .line 34
    if-ge v5, v6, :cond_1

    .line 35
    .line 36
    invoke-static {v0, p0}, Lorg/spongycastle/math/raw/Nat224;->copy([I[I)V

    .line 37
    .line 38
    .line 39
    invoke-static {p1, v4}, Lorg/spongycastle/math/raw/Nat224;->copy([I[I)V

    .line 40
    .line 41
    .line 42
    invoke-static {v0, p1, v3, p2}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1FieldElement;->RS([I[I[I[I)V

    .line 43
    .line 44
    .line 45
    invoke-static {v0}, Lorg/spongycastle/math/raw/Nat224;->isZero([I)Z

    .line 46
    .line 47
    .line 48
    move-result v6

    .line 49
    if-eqz v6, :cond_0

    .line 50
    .line 51
    sget-object p1, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->P:[I

    .line 52
    .line 53
    invoke-static {p1, v4, p2}, Lorg/spongycastle/math/raw/Mod;->invert([I[I[I)V

    .line 54
    .line 55
    .line 56
    invoke-static {p2, p0, p2}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->multiply([I[I[I)V

    .line 57
    .line 58
    .line 59
    return v2

    .line 60
    :cond_0
    add-int/lit8 v5, v5, 0x1

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_1
    return v1
.end method


# virtual methods
.method public add(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;
    .locals 1

    .line 1
    invoke-static {}, Lorg/spongycastle/math/raw/Nat224;->create()[I

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Lorg/spongycastle/math/ec/custom/sec/SecP224R1FieldElement;->x:[I

    .line 6
    .line 7
    check-cast p1, Lorg/spongycastle/math/ec/custom/sec/SecP224R1FieldElement;

    .line 8
    .line 9
    iget-object p1, p1, Lorg/spongycastle/math/ec/custom/sec/SecP224R1FieldElement;->x:[I

    .line 10
    .line 11
    invoke-static {p0, p1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->add([I[I[I)V

    .line 12
    .line 13
    .line 14
    new-instance p0, Lorg/spongycastle/math/ec/custom/sec/SecP224R1FieldElement;

    .line 15
    .line 16
    invoke-direct {p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1FieldElement;-><init>([I)V

    .line 17
    .line 18
    .line 19
    return-object p0
.end method

.method public addOne()Lorg/spongycastle/math/ec/ECFieldElement;
    .locals 1

    .line 1
    invoke-static {}, Lorg/spongycastle/math/raw/Nat224;->create()[I

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Lorg/spongycastle/math/ec/custom/sec/SecP224R1FieldElement;->x:[I

    .line 6
    .line 7
    invoke-static {p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->addOne([I[I)V

    .line 8
    .line 9
    .line 10
    new-instance p0, Lorg/spongycastle/math/ec/custom/sec/SecP224R1FieldElement;

    .line 11
    .line 12
    invoke-direct {p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1FieldElement;-><init>([I)V

    .line 13
    .line 14
    .line 15
    return-object p0
.end method

.method public divide(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;
    .locals 2

    .line 1
    invoke-static {}, Lorg/spongycastle/math/raw/Nat224;->create()[I

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->P:[I

    .line 6
    .line 7
    check-cast p1, Lorg/spongycastle/math/ec/custom/sec/SecP224R1FieldElement;

    .line 8
    .line 9
    iget-object p1, p1, Lorg/spongycastle/math/ec/custom/sec/SecP224R1FieldElement;->x:[I

    .line 10
    .line 11
    invoke-static {v1, p1, v0}, Lorg/spongycastle/math/raw/Mod;->invert([I[I[I)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lorg/spongycastle/math/ec/custom/sec/SecP224R1FieldElement;->x:[I

    .line 15
    .line 16
    invoke-static {v0, p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->multiply([I[I[I)V

    .line 17
    .line 18
    .line 19
    new-instance p0, Lorg/spongycastle/math/ec/custom/sec/SecP224R1FieldElement;

    .line 20
    .line 21
    invoke-direct {p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1FieldElement;-><init>([I)V

    .line 22
    .line 23
    .line 24
    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1

    .line 1
    if-ne p1, p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    instance-of v0, p1, Lorg/spongycastle/math/ec/custom/sec/SecP224R1FieldElement;

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_1
    check-cast p1, Lorg/spongycastle/math/ec/custom/sec/SecP224R1FieldElement;

    .line 12
    .line 13
    iget-object p0, p0, Lorg/spongycastle/math/ec/custom/sec/SecP224R1FieldElement;->x:[I

    .line 14
    .line 15
    iget-object p1, p1, Lorg/spongycastle/math/ec/custom/sec/SecP224R1FieldElement;->x:[I

    .line 16
    .line 17
    invoke-static {p0, p1}, Lorg/spongycastle/math/raw/Nat224;->eq([I[I)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public getFieldName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "SecP224R1Field"

    .line 2
    .line 3
    return-object p0
.end method

.method public getFieldSize()I
    .locals 0

    .line 1
    sget-object p0, Lorg/spongycastle/math/ec/custom/sec/SecP224R1FieldElement;->Q:Ljava/math/BigInteger;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/math/BigInteger;->bitLength()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public hashCode()I
    .locals 3

    .line 1
    sget-object v0, Lorg/spongycastle/math/ec/custom/sec/SecP224R1FieldElement;->Q:Ljava/math/BigInteger;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/math/BigInteger;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object p0, p0, Lorg/spongycastle/math/ec/custom/sec/SecP224R1FieldElement;->x:[I

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    const/4 v2, 0x7

    .line 11
    invoke-static {p0, v1, v2}, Lorg/spongycastle/util/Arrays;->hashCode([III)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    xor-int/2addr p0, v0

    .line 16
    return p0
.end method

.method public invert()Lorg/spongycastle/math/ec/ECFieldElement;
    .locals 2

    .line 1
    invoke-static {}, Lorg/spongycastle/math/raw/Nat224;->create()[I

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->P:[I

    .line 6
    .line 7
    iget-object p0, p0, Lorg/spongycastle/math/ec/custom/sec/SecP224R1FieldElement;->x:[I

    .line 8
    .line 9
    invoke-static {v1, p0, v0}, Lorg/spongycastle/math/raw/Mod;->invert([I[I[I)V

    .line 10
    .line 11
    .line 12
    new-instance p0, Lorg/spongycastle/math/ec/custom/sec/SecP224R1FieldElement;

    .line 13
    .line 14
    invoke-direct {p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1FieldElement;-><init>([I)V

    .line 15
    .line 16
    .line 17
    return-object p0
.end method

.method public isOne()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/math/ec/custom/sec/SecP224R1FieldElement;->x:[I

    .line 2
    .line 3
    invoke-static {p0}, Lorg/spongycastle/math/raw/Nat224;->isOne([I)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isZero()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/math/ec/custom/sec/SecP224R1FieldElement;->x:[I

    .line 2
    .line 3
    invoke-static {p0}, Lorg/spongycastle/math/raw/Nat224;->isZero([I)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public multiply(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;
    .locals 1

    .line 1
    invoke-static {}, Lorg/spongycastle/math/raw/Nat224;->create()[I

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Lorg/spongycastle/math/ec/custom/sec/SecP224R1FieldElement;->x:[I

    .line 6
    .line 7
    check-cast p1, Lorg/spongycastle/math/ec/custom/sec/SecP224R1FieldElement;

    .line 8
    .line 9
    iget-object p1, p1, Lorg/spongycastle/math/ec/custom/sec/SecP224R1FieldElement;->x:[I

    .line 10
    .line 11
    invoke-static {p0, p1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->multiply([I[I[I)V

    .line 12
    .line 13
    .line 14
    new-instance p0, Lorg/spongycastle/math/ec/custom/sec/SecP224R1FieldElement;

    .line 15
    .line 16
    invoke-direct {p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1FieldElement;-><init>([I)V

    .line 17
    .line 18
    .line 19
    return-object p0
.end method

.method public negate()Lorg/spongycastle/math/ec/ECFieldElement;
    .locals 1

    .line 1
    invoke-static {}, Lorg/spongycastle/math/raw/Nat224;->create()[I

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Lorg/spongycastle/math/ec/custom/sec/SecP224R1FieldElement;->x:[I

    .line 6
    .line 7
    invoke-static {p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->negate([I[I)V

    .line 8
    .line 9
    .line 10
    new-instance p0, Lorg/spongycastle/math/ec/custom/sec/SecP224R1FieldElement;

    .line 11
    .line 12
    invoke-direct {p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1FieldElement;-><init>([I)V

    .line 13
    .line 14
    .line 15
    return-object p0
.end method

.method public sqrt()Lorg/spongycastle/math/ec/ECFieldElement;
    .locals 5

    .line 1
    iget-object v0, p0, Lorg/spongycastle/math/ec/custom/sec/SecP224R1FieldElement;->x:[I

    .line 2
    .line 3
    invoke-static {v0}, Lorg/spongycastle/math/raw/Nat224;->isZero([I)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-nez v1, :cond_4

    .line 8
    .line 9
    invoke-static {v0}, Lorg/spongycastle/math/raw/Nat224;->isOne([I)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    goto :goto_1

    .line 16
    :cond_0
    invoke-static {}, Lorg/spongycastle/math/raw/Nat224;->create()[I

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-static {v0, p0}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->negate([I[I)V

    .line 21
    .line 22
    .line 23
    sget-object v1, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->P:[I

    .line 24
    .line 25
    invoke-static {v1}, Lorg/spongycastle/math/raw/Mod;->random([I)[I

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-static {}, Lorg/spongycastle/math/raw/Nat224;->create()[I

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-static {v0}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1FieldElement;->isSquare([I)Z

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    const/4 v4, 0x0

    .line 38
    if-nez v3, :cond_1

    .line 39
    .line 40
    return-object v4

    .line 41
    :cond_1
    :goto_0
    invoke-static {p0, v1, v2}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1FieldElement;->trySqrt([I[I[I)Z

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    if-nez v3, :cond_2

    .line 46
    .line 47
    invoke-static {v1, v1}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->addOne([I[I)V

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_2
    invoke-static {v2, v1}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->square([I[I)V

    .line 52
    .line 53
    .line 54
    invoke-static {v0, v1}, Lorg/spongycastle/math/raw/Nat224;->eq([I[I)Z

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    if-eqz p0, :cond_3

    .line 59
    .line 60
    new-instance p0, Lorg/spongycastle/math/ec/custom/sec/SecP224R1FieldElement;

    .line 61
    .line 62
    invoke-direct {p0, v2}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1FieldElement;-><init>([I)V

    .line 63
    .line 64
    .line 65
    return-object p0

    .line 66
    :cond_3
    return-object v4

    .line 67
    :cond_4
    :goto_1
    return-object p0
.end method

.method public square()Lorg/spongycastle/math/ec/ECFieldElement;
    .locals 1

    .line 1
    invoke-static {}, Lorg/spongycastle/math/raw/Nat224;->create()[I

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Lorg/spongycastle/math/ec/custom/sec/SecP224R1FieldElement;->x:[I

    .line 6
    .line 7
    invoke-static {p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->square([I[I)V

    .line 8
    .line 9
    .line 10
    new-instance p0, Lorg/spongycastle/math/ec/custom/sec/SecP224R1FieldElement;

    .line 11
    .line 12
    invoke-direct {p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1FieldElement;-><init>([I)V

    .line 13
    .line 14
    .line 15
    return-object p0
.end method

.method public subtract(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;
    .locals 1

    .line 1
    invoke-static {}, Lorg/spongycastle/math/raw/Nat224;->create()[I

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Lorg/spongycastle/math/ec/custom/sec/SecP224R1FieldElement;->x:[I

    .line 6
    .line 7
    check-cast p1, Lorg/spongycastle/math/ec/custom/sec/SecP224R1FieldElement;

    .line 8
    .line 9
    iget-object p1, p1, Lorg/spongycastle/math/ec/custom/sec/SecP224R1FieldElement;->x:[I

    .line 10
    .line 11
    invoke-static {p0, p1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1Field;->subtract([I[I[I)V

    .line 12
    .line 13
    .line 14
    new-instance p0, Lorg/spongycastle/math/ec/custom/sec/SecP224R1FieldElement;

    .line 15
    .line 16
    invoke-direct {p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecP224R1FieldElement;-><init>([I)V

    .line 17
    .line 18
    .line 19
    return-object p0
.end method

.method public testBitZero()Z
    .locals 2

    .line 1
    iget-object p0, p0, Lorg/spongycastle/math/ec/custom/sec/SecP224R1FieldElement;->x:[I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Lorg/spongycastle/math/raw/Nat224;->getBit([II)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    const/4 v1, 0x1

    .line 9
    if-ne p0, v1, :cond_0

    .line 10
    .line 11
    return v1

    .line 12
    :cond_0
    return v0
.end method

.method public toBigInteger()Ljava/math/BigInteger;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/math/ec/custom/sec/SecP224R1FieldElement;->x:[I

    .line 2
    .line 3
    invoke-static {p0}, Lorg/spongycastle/math/raw/Nat224;->toBigInteger([I)Ljava/math/BigInteger;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
