.class public Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;
.super Lorg/spongycastle/pqc/math/linearalgebra/Vector;
.source "SourceFile"


# instance fields
.field private v:[I


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 60
    invoke-direct {p0}, Lorg/spongycastle/pqc/math/linearalgebra/Vector;-><init>()V

    if-ltz p1, :cond_0

    .line 61
    iput p1, p0, Lorg/spongycastle/pqc/math/linearalgebra/Vector;->length:I

    add-int/lit8 p1, p1, 0x1f

    shr-int/lit8 p1, p1, 0x5

    .line 62
    new-array p1, p1, [I

    iput-object p1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;->v:[I

    return-void

    .line 63
    :cond_0
    const-string p0, "Negative length."

    invoke-static {p0}, Ll/mym;->a(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0
.end method

.method public constructor <init>(IILjava/security/SecureRandom;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Lorg/spongycastle/pqc/math/linearalgebra/Vector;-><init>()V

    .line 2
    .line 3
    .line 4
    if-gt p2, p1, :cond_2

    .line 5
    .line 6
    iput p1, p0, Lorg/spongycastle/pqc/math/linearalgebra/Vector;->length:I

    .line 7
    .line 8
    add-int/lit8 v0, p1, 0x1f

    .line 9
    .line 10
    shr-int/lit8 v0, v0, 0x5

    .line 11
    .line 12
    new-array v0, v0, [I

    .line 13
    .line 14
    iput-object v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;->v:[I

    .line 15
    .line 16
    new-array v0, p1, [I

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    move v2, v1

    .line 20
    :goto_0
    if-ge v2, p1, :cond_0

    .line 21
    .line 22
    aput v2, v0, v2

    .line 23
    .line 24
    add-int/lit8 v2, v2, 0x1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    :goto_1
    if-ge v1, p2, :cond_1

    .line 28
    .line 29
    invoke-static {p3, p1}, Lorg/spongycastle/pqc/math/linearalgebra/RandUtils;->nextInt(Ljava/security/SecureRandom;I)I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    aget v3, v0, v2

    .line 34
    .line 35
    invoke-virtual {p0, v3}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;->setBit(I)V

    .line 36
    .line 37
    .line 38
    add-int/lit8 p1, p1, -0x1

    .line 39
    .line 40
    aget v3, v0, p1

    .line 41
    .line 42
    aput v3, v0, v2

    .line 43
    .line 44
    add-int/lit8 v1, v1, 0x1

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_1
    return-void

    .line 48
    :cond_2
    const-string p0, "The hamming weight is greater than the length of vector."

    .line 49
    .line 50
    invoke-static {p0}, Ll/mym;->a(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    const/4 p0, 0x0

    .line 54
    throw p0
.end method

.method public constructor <init>(ILjava/security/SecureRandom;)V
    .locals 5

    .line 55
    invoke-direct {p0}, Lorg/spongycastle/pqc/math/linearalgebra/Vector;-><init>()V

    .line 56
    iput p1, p0, Lorg/spongycastle/pqc/math/linearalgebra/Vector;->length:I

    add-int/lit8 v0, p1, 0x1f

    shr-int/lit8 v0, v0, 0x5

    .line 57
    new-array v1, v0, [I

    iput-object v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;->v:[I

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    move v2, v0

    :goto_0
    if-ltz v2, :cond_0

    .line 58
    iget-object v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;->v:[I

    invoke-virtual {p2}, Ljava/util/Random;->nextInt()I

    move-result v4

    aput v4, v3, v2

    add-int/lit8 v2, v2, -0x1

    goto :goto_0

    :cond_0
    and-int/lit8 p1, p1, 0x1f

    if-eqz p1, :cond_1

    .line 59
    iget-object p0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;->v:[I

    aget p2, p0, v0

    shl-int p1, v1, p1

    sub-int/2addr p1, v1

    and-int/2addr p1, p2

    aput p1, p0, v0

    :cond_1
    return-void
.end method

.method public constructor <init>(I[I)V
    .locals 3

    .line 64
    invoke-direct {p0}, Lorg/spongycastle/pqc/math/linearalgebra/Vector;-><init>()V

    const/4 v0, 0x0

    if-ltz p1, :cond_2

    .line 65
    iput p1, p0, Lorg/spongycastle/pqc/math/linearalgebra/Vector;->length:I

    add-int/lit8 v1, p1, 0x1f

    shr-int/lit8 v1, v1, 0x5

    .line 66
    array-length v2, p2

    if-ne v2, v1, :cond_1

    .line 67
    invoke-static {p2}, Lorg/spongycastle/pqc/math/linearalgebra/IntUtils;->clone([I)[I

    move-result-object p2

    iput-object p2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;->v:[I

    and-int/lit8 p0, p1, 0x1f

    if-eqz p0, :cond_0

    const/4 p1, 0x1

    sub-int/2addr v1, p1

    .line 68
    aget v0, p2, v1

    shl-int p0, p1, p0

    sub-int/2addr p0, p1

    and-int/2addr p0, v0

    aput p0, p2, v1

    :cond_0
    return-void

    .line 69
    :cond_1
    const-string p0, "length mismatch"

    invoke-static {p0}, Ll/mym;->a(Ljava/lang/String;)V

    throw v0

    .line 70
    :cond_2
    const-string p0, "negative length"

    invoke-static {p0}, Ll/mym;->a(Ljava/lang/String;)V

    throw v0
.end method

.method public constructor <init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;)V
    .locals 1

    .line 71
    invoke-direct {p0}, Lorg/spongycastle/pqc/math/linearalgebra/Vector;-><init>()V

    .line 72
    iget v0, p1, Lorg/spongycastle/pqc/math/linearalgebra/Vector;->length:I

    iput v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/Vector;->length:I

    .line 73
    iget-object p1, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;->v:[I

    invoke-static {p1}, Lorg/spongycastle/pqc/math/linearalgebra/IntUtils;->clone([I)[I

    move-result-object p1

    iput-object p1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;->v:[I

    return-void
.end method

.method public constructor <init>([II)V
    .locals 0

    .line 74
    invoke-direct {p0}, Lorg/spongycastle/pqc/math/linearalgebra/Vector;-><init>()V

    .line 75
    iput-object p1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;->v:[I

    .line 76
    iput p2, p0, Lorg/spongycastle/pqc/math/linearalgebra/Vector;->length:I

    return-void
.end method

.method public static OS2VP(I[B)Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-ltz p0, :cond_1

    .line 3
    .line 4
    add-int/lit8 v1, p0, 0x7

    .line 5
    .line 6
    shr-int/lit8 v1, v1, 0x3

    .line 7
    .line 8
    array-length v2, p1

    .line 9
    if-gt v2, v1, :cond_0

    .line 10
    .line 11
    new-instance v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;

    .line 12
    .line 13
    invoke-static {p1}, Lorg/spongycastle/pqc/math/linearalgebra/LittleEndianConversions;->toIntArray([B)[I

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-direct {v0, p0, p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;-><init>(I[I)V

    .line 18
    .line 19
    .line 20
    return-object v0

    .line 21
    :cond_0
    const-string p0, "length mismatch"

    .line 22
    .line 23
    invoke-static {p0}, Ll/mym;->a(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-object v0

    .line 27
    :cond_1
    const-string p0, "negative length"

    .line 28
    .line 29
    invoke-static {p0}, Ll/mym;->a(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-object v0
.end method


# virtual methods
.method public add(Lorg/spongycastle/pqc/math/linearalgebra/Vector;)Lorg/spongycastle/pqc/math/linearalgebra/Vector;
    .locals 3

    .line 1
    instance-of v0, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_2

    .line 5
    .line 6
    check-cast p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;

    .line 7
    .line 8
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/Vector;->length:I

    .line 9
    .line 10
    iget v2, p1, Lorg/spongycastle/pqc/math/linearalgebra/Vector;->length:I

    .line 11
    .line 12
    if-ne v0, v2, :cond_1

    .line 13
    .line 14
    iget-object p1, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;->v:[I

    .line 15
    .line 16
    invoke-static {p1}, Lorg/spongycastle/pqc/math/linearalgebra/IntUtils;->clone([I)[I

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    array-length v0, p1

    .line 21
    add-int/lit8 v0, v0, -0x1

    .line 22
    .line 23
    :goto_0
    if-ltz v0, :cond_0

    .line 24
    .line 25
    aget v1, p1, v0

    .line 26
    .line 27
    iget-object v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;->v:[I

    .line 28
    .line 29
    aget v2, v2, v0

    .line 30
    .line 31
    xor-int/2addr v1, v2

    .line 32
    aput v1, p1, v0

    .line 33
    .line 34
    add-int/lit8 v0, v0, -0x1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    new-instance v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;

    .line 38
    .line 39
    iget p0, p0, Lorg/spongycastle/pqc/math/linearalgebra/Vector;->length:I

    .line 40
    .line 41
    invoke-direct {v0, p0, p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;-><init>(I[I)V

    .line 42
    .line 43
    .line 44
    return-object v0

    .line 45
    :cond_1
    const-string p0, "length mismatch"

    .line 46
    .line 47
    invoke-static {p0}, Ll/mym;->a(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    return-object v1

    .line 51
    :cond_2
    const-string p0, "vector is not defined over GF(2)"

    .line 52
    .line 53
    invoke-static {p0}, Ll/mym;->a(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    return-object v1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3

    .line 1
    instance-of v0, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    check-cast p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;

    .line 8
    .line 9
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/Vector;->length:I

    .line 10
    .line 11
    iget v2, p1, Lorg/spongycastle/pqc/math/linearalgebra/Vector;->length:I

    .line 12
    .line 13
    if-ne v0, v2, :cond_1

    .line 14
    .line 15
    iget-object p0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;->v:[I

    .line 16
    .line 17
    iget-object p1, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;->v:[I

    .line 18
    .line 19
    invoke-static {p0, p1}, Lorg/spongycastle/pqc/math/linearalgebra/IntUtils;->equals([I[I)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_1
    return v1
.end method

.method public extractLeftVector(I)Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;
    .locals 5

    .line 1
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/Vector;->length:I

    .line 2
    .line 3
    if-gt p1, v0, :cond_2

    .line 4
    .line 5
    if-ne p1, v0, :cond_0

    .line 6
    .line 7
    new-instance p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;

    .line 8
    .line 9
    invoke-direct {p1, p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;)V

    .line 10
    .line 11
    .line 12
    return-object p1

    .line 13
    :cond_0
    new-instance v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;

    .line 14
    .line 15
    invoke-direct {v0, p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;-><init>(I)V

    .line 16
    .line 17
    .line 18
    shr-int/lit8 v1, p1, 0x5

    .line 19
    .line 20
    and-int/lit8 p1, p1, 0x1f

    .line 21
    .line 22
    iget-object v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;->v:[I

    .line 23
    .line 24
    iget-object v3, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;->v:[I

    .line 25
    .line 26
    const/4 v4, 0x0

    .line 27
    invoke-static {v2, v4, v3, v4, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 28
    .line 29
    .line 30
    if-eqz p1, :cond_1

    .line 31
    .line 32
    iget-object v2, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;->v:[I

    .line 33
    .line 34
    iget-object p0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;->v:[I

    .line 35
    .line 36
    aget p0, p0, v1

    .line 37
    .line 38
    const/4 v3, 0x1

    .line 39
    shl-int p1, v3, p1

    .line 40
    .line 41
    sub-int/2addr p1, v3

    .line 42
    and-int/2addr p0, p1

    .line 43
    aput p0, v2, v1

    .line 44
    .line 45
    :cond_1
    return-object v0

    .line 46
    :cond_2
    const-string p0, "invalid length"

    .line 47
    .line 48
    invoke-static {p0}, Ll/mym;->a(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    const/4 p0, 0x0

    .line 52
    return-object p0
.end method

.method public extractRightVector(I)Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;
    .locals 8

    .line 1
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/Vector;->length:I

    .line 2
    .line 3
    if-gt p1, v0, :cond_4

    .line 4
    .line 5
    if-ne p1, v0, :cond_0

    .line 6
    .line 7
    new-instance p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;

    .line 8
    .line 9
    invoke-direct {p1, p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;)V

    .line 10
    .line 11
    .line 12
    return-object p1

    .line 13
    :cond_0
    new-instance v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;

    .line 14
    .line 15
    invoke-direct {v0, p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;-><init>(I)V

    .line 16
    .line 17
    .line 18
    iget v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/Vector;->length:I

    .line 19
    .line 20
    sub-int v2, v1, p1

    .line 21
    .line 22
    shr-int/lit8 v2, v2, 0x5

    .line 23
    .line 24
    sub-int/2addr v1, p1

    .line 25
    and-int/lit8 v1, v1, 0x1f

    .line 26
    .line 27
    add-int/lit8 p1, p1, 0x1f

    .line 28
    .line 29
    shr-int/lit8 p1, p1, 0x5

    .line 30
    .line 31
    const/4 v3, 0x0

    .line 32
    if-eqz v1, :cond_3

    .line 33
    .line 34
    :goto_0
    add-int/lit8 v4, p1, -0x1

    .line 35
    .line 36
    iget-object v5, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;->v:[I

    .line 37
    .line 38
    if-ge v3, v4, :cond_1

    .line 39
    .line 40
    iget-object v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;->v:[I

    .line 41
    .line 42
    add-int/lit8 v6, v2, 0x1

    .line 43
    .line 44
    aget v2, v4, v2

    .line 45
    .line 46
    ushr-int/2addr v2, v1

    .line 47
    aget v4, v4, v6

    .line 48
    .line 49
    rsub-int/lit8 v7, v1, 0x20

    .line 50
    .line 51
    shl-int/2addr v4, v7

    .line 52
    or-int/2addr v2, v4

    .line 53
    aput v2, v5, v3

    .line 54
    .line 55
    add-int/lit8 v3, v3, 0x1

    .line 56
    .line 57
    move v2, v6

    .line 58
    goto :goto_0

    .line 59
    :cond_1
    iget-object p0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;->v:[I

    .line 60
    .line 61
    add-int/lit8 p1, v2, 0x1

    .line 62
    .line 63
    aget v2, p0, v2

    .line 64
    .line 65
    ushr-int/2addr v2, v1

    .line 66
    aput v2, v5, v4

    .line 67
    .line 68
    array-length v3, p0

    .line 69
    if-ge p1, v3, :cond_2

    .line 70
    .line 71
    aget p0, p0, p1

    .line 72
    .line 73
    rsub-int/lit8 p1, v1, 0x20

    .line 74
    .line 75
    shl-int/2addr p0, p1

    .line 76
    or-int/2addr p0, v2

    .line 77
    aput p0, v5, v4

    .line 78
    .line 79
    :cond_2
    return-object v0

    .line 80
    :cond_3
    iget-object p0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;->v:[I

    .line 81
    .line 82
    iget-object v1, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;->v:[I

    .line 83
    .line 84
    invoke-static {p0, v2, v1, v3, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 85
    .line 86
    .line 87
    return-object v0

    .line 88
    :cond_4
    const-string p0, "invalid length"

    .line 89
    .line 90
    invoke-static {p0}, Ll/mym;->a(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    const/4 p0, 0x0

    .line 94
    return-object p0
.end method

.method public extractVector([I)Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;
    .locals 8

    .line 1
    array-length v0, p1

    .line 2
    add-int/lit8 v1, v0, -0x1

    .line 3
    .line 4
    aget v1, p1, v1

    .line 5
    .line 6
    iget v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/Vector;->length:I

    .line 7
    .line 8
    if-gt v1, v2, :cond_2

    .line 9
    .line 10
    new-instance v1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;

    .line 11
    .line 12
    invoke-direct {v1, v0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;-><init>(I)V

    .line 13
    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    :goto_0
    if-ge v2, v0, :cond_1

    .line 17
    .line 18
    iget-object v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;->v:[I

    .line 19
    .line 20
    aget v4, p1, v2

    .line 21
    .line 22
    shr-int/lit8 v5, v4, 0x5

    .line 23
    .line 24
    aget v3, v3, v5

    .line 25
    .line 26
    and-int/lit8 v4, v4, 0x1f

    .line 27
    .line 28
    const/4 v5, 0x1

    .line 29
    shl-int v4, v5, v4

    .line 30
    .line 31
    and-int/2addr v3, v4

    .line 32
    if-eqz v3, :cond_0

    .line 33
    .line 34
    iget-object v3, v1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;->v:[I

    .line 35
    .line 36
    shr-int/lit8 v4, v2, 0x5

    .line 37
    .line 38
    aget v6, v3, v4

    .line 39
    .line 40
    and-int/lit8 v7, v2, 0x1f

    .line 41
    .line 42
    shl-int/2addr v5, v7

    .line 43
    or-int/2addr v5, v6

    .line 44
    aput v5, v3, v4

    .line 45
    .line 46
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    return-object v1

    .line 50
    :cond_2
    const-string p0, "invalid index set"

    .line 51
    .line 52
    invoke-static {p0}, Ll/mym;->a(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    const/4 p0, 0x0

    .line 56
    return-object p0
.end method

.method public getBit(I)I
    .locals 1

    .line 1
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/Vector;->length:I

    .line 2
    .line 3
    if-ge p1, v0, :cond_0

    .line 4
    .line 5
    shr-int/lit8 v0, p1, 0x5

    .line 6
    .line 7
    and-int/lit8 p1, p1, 0x1f

    .line 8
    .line 9
    iget-object p0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;->v:[I

    .line 10
    .line 11
    aget p0, p0, v0

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    shl-int/2addr v0, p1

    .line 15
    and-int/2addr p0, v0

    .line 16
    ushr-int/2addr p0, p1

    .line 17
    return p0

    .line 18
    :cond_0
    invoke-static {}, Ll/onl;->a()V

    .line 19
    .line 20
    .line 21
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public getEncoded()[B
    .locals 1

    .line 1
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/Vector;->length:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x7

    .line 4
    .line 5
    shr-int/lit8 v0, v0, 0x3

    .line 6
    .line 7
    iget-object p0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;->v:[I

    .line 8
    .line 9
    invoke-static {p0, v0}, Lorg/spongycastle/pqc/math/linearalgebra/LittleEndianConversions;->toByteArray([II)[B

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public getHammingWeight()I
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    move v2, v1

    .line 4
    :goto_0
    iget-object v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;->v:[I

    .line 5
    .line 6
    array-length v4, v3

    .line 7
    if-ge v1, v4, :cond_2

    .line 8
    .line 9
    aget v3, v3, v1

    .line 10
    .line 11
    move v4, v0

    .line 12
    :goto_1
    const/16 v5, 0x20

    .line 13
    .line 14
    if-ge v4, v5, :cond_1

    .line 15
    .line 16
    and-int/lit8 v5, v3, 0x1

    .line 17
    .line 18
    if-eqz v5, :cond_0

    .line 19
    .line 20
    add-int/lit8 v2, v2, 0x1

    .line 21
    .line 22
    :cond_0
    ushr-int/lit8 v3, v3, 0x1

    .line 23
    .line 24
    add-int/lit8 v4, v4, 0x1

    .line 25
    .line 26
    goto :goto_1

    .line 27
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_2
    return v2
.end method

.method public getVecArray()[I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;->v:[I

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 1

    .line 1
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/Vector;->length:I

    .line 2
    .line 3
    mul-int/lit8 v0, v0, 0x1f

    .line 4
    .line 5
    iget-object p0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;->v:[I

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    add-int/2addr v0, p0

    .line 12
    return v0
.end method

.method public isZero()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;->v:[I

    .line 2
    .line 3
    array-length v0, v0

    .line 4
    const/4 v1, 0x1

    .line 5
    sub-int/2addr v0, v1

    .line 6
    :goto_0
    if-ltz v0, :cond_1

    .line 7
    .line 8
    iget-object v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;->v:[I

    .line 9
    .line 10
    aget v2, v2, v0

    .line 11
    .line 12
    if-eqz v2, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_0
    add-int/lit8 v0, v0, -0x1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    return v1
.end method

.method public multiply(Lorg/spongycastle/pqc/math/linearalgebra/Permutation;)Lorg/spongycastle/pqc/math/linearalgebra/Vector;
    .locals 7

    .line 1
    invoke-virtual {p1}, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;->getVector()[I

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/Vector;->length:I

    .line 6
    .line 7
    array-length v1, p1

    .line 8
    if-ne v0, v1, :cond_2

    .line 9
    .line 10
    new-instance v1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;

    .line 11
    .line 12
    invoke-direct {v1, v0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;-><init>(I)V

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    :goto_0
    array-length v2, p1

    .line 17
    if-ge v0, v2, :cond_1

    .line 18
    .line 19
    iget-object v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;->v:[I

    .line 20
    .line 21
    aget v3, p1, v0

    .line 22
    .line 23
    shr-int/lit8 v4, v3, 0x5

    .line 24
    .line 25
    aget v2, v2, v4

    .line 26
    .line 27
    and-int/lit8 v3, v3, 0x1f

    .line 28
    .line 29
    const/4 v4, 0x1

    .line 30
    shl-int v3, v4, v3

    .line 31
    .line 32
    and-int/2addr v2, v3

    .line 33
    if-eqz v2, :cond_0

    .line 34
    .line 35
    iget-object v2, v1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;->v:[I

    .line 36
    .line 37
    shr-int/lit8 v3, v0, 0x5

    .line 38
    .line 39
    aget v5, v2, v3

    .line 40
    .line 41
    and-int/lit8 v6, v0, 0x1f

    .line 42
    .line 43
    shl-int/2addr v4, v6

    .line 44
    or-int/2addr v4, v5

    .line 45
    aput v4, v2, v3

    .line 46
    .line 47
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    return-object v1

    .line 51
    :cond_2
    const-string p0, "length mismatch"

    .line 52
    .line 53
    invoke-static {p0}, Ll/mym;->a(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    const/4 p0, 0x0

    .line 57
    return-object p0
.end method

.method public setBit(I)V
    .locals 3

    .line 1
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/Vector;->length:I

    .line 2
    .line 3
    if-ge p1, v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;->v:[I

    .line 6
    .line 7
    shr-int/lit8 v0, p1, 0x5

    .line 8
    .line 9
    aget v1, p0, v0

    .line 10
    .line 11
    and-int/lit8 p1, p1, 0x1f

    .line 12
    .line 13
    const/4 v2, 0x1

    .line 14
    shl-int p1, v2, p1

    .line 15
    .line 16
    or-int/2addr p1, v1

    .line 17
    aput p1, p0, v0

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-static {}, Ll/onl;->a()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public toExtensionFieldVector(Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;)Lorg/spongycastle/pqc/math/linearalgebra/GF2mVector;
    .locals 8

    .line 1
    invoke-virtual {p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;->getDegree()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/Vector;->length:I

    .line 6
    .line 7
    rem-int v2, v1, v0

    .line 8
    .line 9
    if-nez v2, :cond_3

    .line 10
    .line 11
    div-int/2addr v1, v0

    .line 12
    new-array v0, v1, [I

    .line 13
    .line 14
    const/4 v2, 0x1

    .line 15
    sub-int/2addr v1, v2

    .line 16
    const/4 v3, 0x0

    .line 17
    :goto_0
    if-ltz v1, :cond_2

    .line 18
    .line 19
    invoke-virtual {p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;->getDegree()I

    .line 20
    .line 21
    .line 22
    move-result v4

    .line 23
    sub-int/2addr v4, v2

    .line 24
    :goto_1
    if-ltz v4, :cond_1

    .line 25
    .line 26
    ushr-int/lit8 v5, v3, 0x5

    .line 27
    .line 28
    and-int/lit8 v6, v3, 0x1f

    .line 29
    .line 30
    iget-object v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;->v:[I

    .line 31
    .line 32
    aget v5, v7, v5

    .line 33
    .line 34
    ushr-int/2addr v5, v6

    .line 35
    and-int/2addr v5, v2

    .line 36
    if-ne v5, v2, :cond_0

    .line 37
    .line 38
    aget v5, v0, v1

    .line 39
    .line 40
    shl-int v6, v2, v4

    .line 41
    .line 42
    xor-int/2addr v5, v6

    .line 43
    aput v5, v0, v1

    .line 44
    .line 45
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 46
    .line 47
    add-int/lit8 v4, v4, -0x1

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_1
    add-int/lit8 v1, v1, -0x1

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_2
    new-instance p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2mVector;

    .line 54
    .line 55
    invoke-direct {p0, p1, v0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2mVector;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2mField;[I)V

    .line 56
    .line 57
    .line 58
    return-object p0

    .line 59
    :cond_3
    const-string p0, "conversion is impossible"

    .line 60
    .line 61
    invoke-static {p0}, Ll/mym;->a(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    const/4 p0, 0x0

    .line 65
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuffer;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    :goto_0
    iget v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/Vector;->length:I

    .line 8
    .line 9
    if-ge v1, v2, :cond_2

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    and-int/lit8 v2, v1, 0x1f

    .line 14
    .line 15
    if-nez v2, :cond_0

    .line 16
    .line 17
    const/16 v2, 0x20

    .line 18
    .line 19
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 20
    .line 21
    .line 22
    :cond_0
    shr-int/lit8 v2, v1, 0x5

    .line 23
    .line 24
    and-int/lit8 v3, v1, 0x1f

    .line 25
    .line 26
    iget-object v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;->v:[I

    .line 27
    .line 28
    aget v2, v4, v2

    .line 29
    .line 30
    const/4 v4, 0x1

    .line 31
    shl-int v3, v4, v3

    .line 32
    .line 33
    and-int/2addr v2, v3

    .line 34
    if-nez v2, :cond_1

    .line 35
    .line 36
    const/16 v2, 0x30

    .line 37
    .line 38
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 39
    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_1
    const/16 v2, 0x31

    .line 43
    .line 44
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 45
    .line 46
    .line 47
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    return-object p0
.end method
