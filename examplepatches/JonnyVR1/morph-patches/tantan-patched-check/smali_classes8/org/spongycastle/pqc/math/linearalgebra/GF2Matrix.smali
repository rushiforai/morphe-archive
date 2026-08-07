.class public Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;
.super Lorg/spongycastle/pqc/math/linearalgebra/Matrix;
.source "SourceFile"


# instance fields
.field private length:I

.field private matrix:[[I


# direct methods
.method public constructor <init>(IC)V
    .locals 1

    .line 138
    new-instance v0, Ljava/security/SecureRandom;

    invoke-direct {v0}, Ljava/security/SecureRandom;-><init>()V

    invoke-direct {p0, p1, p2, v0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;-><init>(ICLjava/security/SecureRandom;)V

    return-void
.end method

.method public constructor <init>(ICLjava/security/SecureRandom;)V
    .locals 1

    .line 139
    invoke-direct {p0}, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;-><init>()V

    if-lez p1, :cond_5

    const/16 v0, 0x49

    if-eq p2, v0, :cond_4

    const/16 v0, 0x4c

    if-eq p2, v0, :cond_3

    const/16 v0, 0x52

    if-eq p2, v0, :cond_2

    const/16 v0, 0x55

    if-eq p2, v0, :cond_1

    const/16 p3, 0x5a

    if-ne p2, p3, :cond_0

    .line 140
    invoke-direct {p0, p1, p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->assignZeroMatrix(II)V

    return-void

    .line 141
    :cond_0
    const-string p0, "Unknown matrix type."

    invoke-static {p0}, Ll/mym;->a(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0

    .line 142
    :cond_1
    invoke-direct {p0, p1, p3}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->assignRandomUpperTriangularMatrix(ILjava/security/SecureRandom;)V

    return-void

    .line 143
    :cond_2
    invoke-direct {p0, p1, p3}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->assignRandomRegularMatrix(ILjava/security/SecureRandom;)V

    return-void

    .line 144
    :cond_3
    invoke-direct {p0, p1, p3}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->assignRandomLowerTriangularMatrix(ILjava/security/SecureRandom;)V

    return-void

    .line 145
    :cond_4
    invoke-direct {p0, p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->assignUnitMatrix(I)V

    return-void

    .line 146
    :cond_5
    const-string p0, "Size of matrix is non-positive."

    invoke-static {p0}, Ll/mym;->a(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0
.end method

.method private constructor <init>(II)V
    .locals 0

    .line 154
    invoke-direct {p0}, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;-><init>()V

    if-lez p2, :cond_0

    if-lez p1, :cond_0

    .line 155
    invoke-direct {p0, p1, p2}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->assignZeroMatrix(II)V

    return-void

    .line 156
    :cond_0
    const-string p0, "size of matrix is non-positive"

    invoke-static {p0}, Ll/mym;->a(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0
.end method

.method public constructor <init>(I[[I)V
    .locals 5

    .line 129
    invoke-direct {p0}, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;-><init>()V

    const/4 v0, 0x0

    .line 130
    aget-object v1, p2, v0

    array-length v2, v1

    add-int/lit8 v3, p1, 0x1f

    shr-int/lit8 v3, v3, 0x5

    if-ne v2, v3, :cond_2

    .line 131
    iput p1, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numColumns:I

    .line 132
    array-length v2, p2

    iput v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    .line 133
    array-length v1, v1

    iput v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    and-int/lit8 p1, p1, 0x1f

    const/4 v1, 0x1

    if-nez p1, :cond_0

    const/4 p1, -0x1

    goto :goto_0

    :cond_0
    shl-int p1, v1, p1

    sub-int/2addr p1, v1

    .line 134
    :goto_0
    iget v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    if-ge v0, v2, :cond_1

    .line 135
    aget-object v2, p2, v0

    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    sub-int/2addr v3, v1

    aget v4, v2, v3

    and-int/2addr v4, p1

    aput v4, v2, v3

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 136
    :cond_1
    iput-object p2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    return-void

    .line 137
    :cond_2
    const-string p0, "Int array does not match given number of columns."

    invoke-static {p0}, Ll/mym;->a(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0
.end method

.method public constructor <init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;)V
    .locals 3

    .line 147
    invoke-direct {p0}, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;-><init>()V

    .line 148
    invoke-virtual {p1}, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->getNumColumns()I

    move-result v0

    iput v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numColumns:I

    .line 149
    invoke-virtual {p1}, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->getNumRows()I

    move-result v0

    iput v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    .line 150
    iget v0, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    iput v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    .line 151
    iget-object v0, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    array-length v0, v0

    new-array v0, v0, [[I

    iput-object v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    const/4 v0, 0x0

    .line 152
    :goto_0
    iget-object v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    array-length v2, v1

    if-ge v0, v2, :cond_0

    .line 153
    iget-object v2, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v2, v2, v0

    invoke-static {v2}, Lorg/spongycastle/pqc/math/linearalgebra/IntUtils;->clone([I)[I

    move-result-object v2

    aput-object v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public constructor <init>([B)V
    .locals 9

    .line 1
    invoke-direct {p0}, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;-><init>()V

    .line 2
    .line 3
    .line 4
    array-length v0, p1

    .line 5
    const/16 v1, 0x9

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    const-string v3, "given array is not an encoded matrix over GF(2)"

    .line 9
    .line 10
    if-lt v0, v1, :cond_4

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-static {p1, v0}, Lorg/spongycastle/pqc/math/linearalgebra/LittleEndianConversions;->OS2IP([BI)I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    iput v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    .line 18
    .line 19
    const/4 v1, 0x4

    .line 20
    invoke-static {p1, v1}, Lorg/spongycastle/pqc/math/linearalgebra/LittleEndianConversions;->OS2IP([BI)I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    iput v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numColumns:I

    .line 25
    .line 26
    add-int/lit8 v4, v1, 0x7

    .line 27
    .line 28
    ushr-int/lit8 v4, v4, 0x3

    .line 29
    .line 30
    iget v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    .line 31
    .line 32
    mul-int/2addr v4, v5

    .line 33
    if-lez v5, :cond_3

    .line 34
    .line 35
    array-length v6, p1

    .line 36
    const/16 v7, 0x8

    .line 37
    .line 38
    sub-int/2addr v6, v7

    .line 39
    if-ne v4, v6, :cond_3

    .line 40
    .line 41
    add-int/lit8 v1, v1, 0x1f

    .line 42
    .line 43
    ushr-int/lit8 v1, v1, 0x5

    .line 44
    .line 45
    iput v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    .line 46
    .line 47
    const/4 v2, 0x2

    .line 48
    new-array v2, v2, [I

    .line 49
    .line 50
    const/4 v3, 0x1

    .line 51
    aput v1, v2, v3

    .line 52
    .line 53
    aput v5, v2, v0

    .line 54
    .line 55
    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 56
    .line 57
    invoke-static {v1, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    check-cast v1, [[I

    .line 62
    .line 63
    iput-object v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 64
    .line 65
    iget v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numColumns:I

    .line 66
    .line 67
    shr-int/lit8 v2, v1, 0x5

    .line 68
    .line 69
    and-int/lit8 v1, v1, 0x1f

    .line 70
    .line 71
    move v3, v0

    .line 72
    :goto_0
    iget v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    .line 73
    .line 74
    if-ge v3, v4, :cond_2

    .line 75
    .line 76
    move v4, v0

    .line 77
    :goto_1
    if-ge v4, v2, :cond_0

    .line 78
    .line 79
    iget-object v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 80
    .line 81
    aget-object v5, v5, v3

    .line 82
    .line 83
    invoke-static {p1, v7}, Lorg/spongycastle/pqc/math/linearalgebra/LittleEndianConversions;->OS2IP([BI)I

    .line 84
    .line 85
    .line 86
    move-result v6

    .line 87
    aput v6, v5, v4

    .line 88
    .line 89
    add-int/lit8 v4, v4, 0x1

    .line 90
    .line 91
    add-int/lit8 v7, v7, 0x4

    .line 92
    .line 93
    goto :goto_1

    .line 94
    :cond_0
    move v4, v0

    .line 95
    :goto_2
    if-ge v4, v1, :cond_1

    .line 96
    .line 97
    iget-object v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 98
    .line 99
    aget-object v5, v5, v3

    .line 100
    .line 101
    aget v6, v5, v2

    .line 102
    .line 103
    add-int/lit8 v8, v7, 0x1

    .line 104
    .line 105
    aget-byte v7, p1, v7

    .line 106
    .line 107
    and-int/lit16 v7, v7, 0xff

    .line 108
    .line 109
    shl-int/2addr v7, v4

    .line 110
    xor-int/2addr v6, v7

    .line 111
    aput v6, v5, v2

    .line 112
    .line 113
    add-int/lit8 v4, v4, 0x8

    .line 114
    .line 115
    move v7, v8

    .line 116
    goto :goto_2

    .line 117
    :cond_1
    add-int/lit8 v3, v3, 0x1

    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_2
    return-void

    .line 121
    :cond_3
    invoke-static {v3}, Ll/mym;->a(Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    throw v2

    .line 125
    :cond_4
    invoke-static {v3}, Ll/mym;->a(Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    throw v2
.end method

.method private static addToRow([I[II)V
    .locals 3

    .line 1
    array-length v0, p1

    .line 2
    add-int/lit8 v0, v0, -0x1

    .line 3
    .line 4
    :goto_0
    if-lt v0, p2, :cond_0

    .line 5
    .line 6
    aget v1, p0, v0

    .line 7
    .line 8
    aget v2, p1, v0

    .line 9
    .line 10
    xor-int/2addr v1, v2

    .line 11
    aput v1, p1, v0

    .line 12
    .line 13
    add-int/lit8 v0, v0, -0x1

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    return-void
.end method

.method private assignRandomLowerTriangularMatrix(ILjava/security/SecureRandom;)V
    .locals 8

    .line 1
    iput p1, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    .line 2
    .line 3
    iput p1, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numColumns:I

    .line 4
    .line 5
    add-int/lit8 v0, p1, 0x1f

    .line 6
    .line 7
    ushr-int/lit8 v0, v0, 0x5

    .line 8
    .line 9
    iput v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    .line 10
    .line 11
    const/4 v1, 0x2

    .line 12
    new-array v1, v1, [I

    .line 13
    .line 14
    const/4 v2, 0x1

    .line 15
    aput v0, v1, v2

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    aput p1, v1, v0

    .line 19
    .line 20
    sget-object p1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 21
    .line 22
    invoke-static {p1, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, [[I

    .line 27
    .line 28
    iput-object p1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 29
    .line 30
    move p1, v0

    .line 31
    :goto_0
    iget v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    .line 32
    .line 33
    if-ge p1, v1, :cond_2

    .line 34
    .line 35
    ushr-int/lit8 v1, p1, 0x5

    .line 36
    .line 37
    and-int/lit8 v3, p1, 0x1f

    .line 38
    .line 39
    rsub-int/lit8 v4, v3, 0x1f

    .line 40
    .line 41
    shl-int v3, v2, v3

    .line 42
    .line 43
    move v5, v0

    .line 44
    :goto_1
    iget-object v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 45
    .line 46
    if-ge v5, v1, :cond_0

    .line 47
    .line 48
    aget-object v6, v6, p1

    .line 49
    .line 50
    invoke-virtual {p2}, Ljava/util/Random;->nextInt()I

    .line 51
    .line 52
    .line 53
    move-result v7

    .line 54
    aput v7, v6, v5

    .line 55
    .line 56
    add-int/lit8 v5, v5, 0x1

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_0
    aget-object v5, v6, p1

    .line 60
    .line 61
    invoke-virtual {p2}, Ljava/util/Random;->nextInt()I

    .line 62
    .line 63
    .line 64
    move-result v6

    .line 65
    ushr-int v4, v6, v4

    .line 66
    .line 67
    or-int/2addr v3, v4

    .line 68
    aput v3, v5, v1

    .line 69
    .line 70
    :goto_2
    add-int/lit8 v1, v1, 0x1

    .line 71
    .line 72
    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    .line 73
    .line 74
    if-ge v1, v3, :cond_1

    .line 75
    .line 76
    iget-object v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 77
    .line 78
    aget-object v3, v3, p1

    .line 79
    .line 80
    aput v0, v3, v1

    .line 81
    .line 82
    goto :goto_2

    .line 83
    :cond_1
    add-int/lit8 p1, p1, 0x1

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_2
    return-void
.end method

.method private assignRandomRegularMatrix(ILjava/security/SecureRandom;)V
    .locals 6

    .line 1
    iput p1, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    .line 2
    .line 3
    iput p1, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numColumns:I

    .line 4
    .line 5
    add-int/lit8 v0, p1, 0x1f

    .line 6
    .line 7
    ushr-int/lit8 v0, v0, 0x5

    .line 8
    .line 9
    iput v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    .line 10
    .line 11
    const/4 v1, 0x2

    .line 12
    new-array v1, v1, [I

    .line 13
    .line 14
    const/4 v2, 0x1

    .line 15
    aput v0, v1, v2

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    aput p1, v1, v0

    .line 19
    .line 20
    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 21
    .line 22
    invoke-static {v2, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, [[I

    .line 27
    .line 28
    iput-object v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 29
    .line 30
    new-instance v1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    .line 31
    .line 32
    const/16 v2, 0x4c

    .line 33
    .line 34
    invoke-direct {v1, p1, v2, p2}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;-><init>(ICLjava/security/SecureRandom;)V

    .line 35
    .line 36
    .line 37
    new-instance v2, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    .line 38
    .line 39
    const/16 v3, 0x55

    .line 40
    .line 41
    invoke-direct {v2, p1, v3, p2}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;-><init>(ICLjava/security/SecureRandom;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v1, v2}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->rightMultiply(Lorg/spongycastle/pqc/math/linearalgebra/Matrix;)Lorg/spongycastle/pqc/math/linearalgebra/Matrix;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    check-cast v1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    .line 49
    .line 50
    new-instance v2, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;

    .line 51
    .line 52
    invoke-direct {v2, p1, p2}, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;-><init>(ILjava/security/SecureRandom;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v2}, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;->getVector()[I

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    move v2, v0

    .line 60
    :goto_0
    if-ge v2, p1, :cond_0

    .line 61
    .line 62
    iget-object v3, v1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 63
    .line 64
    aget-object v3, v3, v2

    .line 65
    .line 66
    iget-object v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 67
    .line 68
    aget v5, p2, v2

    .line 69
    .line 70
    aget-object v4, v4, v5

    .line 71
    .line 72
    iget v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    .line 73
    .line 74
    invoke-static {v3, v0, v4, v0, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 75
    .line 76
    .line 77
    add-int/lit8 v2, v2, 0x1

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_0
    return-void
.end method

.method private assignRandomUpperTriangularMatrix(ILjava/security/SecureRandom;)V
    .locals 7

    .line 1
    iput p1, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    .line 2
    .line 3
    iput p1, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numColumns:I

    .line 4
    .line 5
    add-int/lit8 v0, p1, 0x1f

    .line 6
    .line 7
    ushr-int/lit8 v0, v0, 0x5

    .line 8
    .line 9
    iput v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    .line 10
    .line 11
    const/4 v1, 0x2

    .line 12
    new-array v1, v1, [I

    .line 13
    .line 14
    const/4 v2, 0x1

    .line 15
    aput v0, v1, v2

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    aput p1, v1, v0

    .line 19
    .line 20
    sget-object v3, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 21
    .line 22
    invoke-static {v3, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, [[I

    .line 27
    .line 28
    iput-object v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 29
    .line 30
    and-int/lit8 p1, p1, 0x1f

    .line 31
    .line 32
    if-nez p1, :cond_0

    .line 33
    .line 34
    const/4 p1, -0x1

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    shl-int p1, v2, p1

    .line 37
    .line 38
    sub-int/2addr p1, v2

    .line 39
    :goto_0
    move v1, v0

    .line 40
    :goto_1
    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    .line 41
    .line 42
    if-ge v1, v3, :cond_3

    .line 43
    .line 44
    ushr-int/lit8 v3, v1, 0x5

    .line 45
    .line 46
    and-int/lit8 v4, v1, 0x1f

    .line 47
    .line 48
    move v5, v0

    .line 49
    :goto_2
    iget-object v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 50
    .line 51
    if-ge v5, v3, :cond_1

    .line 52
    .line 53
    aget-object v6, v6, v1

    .line 54
    .line 55
    aput v0, v6, v5

    .line 56
    .line 57
    add-int/lit8 v5, v5, 0x1

    .line 58
    .line 59
    goto :goto_2

    .line 60
    :cond_1
    aget-object v5, v6, v1

    .line 61
    .line 62
    invoke-virtual {p2}, Ljava/util/Random;->nextInt()I

    .line 63
    .line 64
    .line 65
    move-result v6

    .line 66
    or-int/2addr v6, v2

    .line 67
    shl-int v4, v6, v4

    .line 68
    .line 69
    aput v4, v5, v3

    .line 70
    .line 71
    :goto_3
    add-int/lit8 v3, v3, 0x1

    .line 72
    .line 73
    iget v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    .line 74
    .line 75
    iget-object v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 76
    .line 77
    if-ge v3, v4, :cond_2

    .line 78
    .line 79
    aget-object v4, v5, v1

    .line 80
    .line 81
    invoke-virtual {p2}, Ljava/util/Random;->nextInt()I

    .line 82
    .line 83
    .line 84
    move-result v5

    .line 85
    aput v5, v4, v3

    .line 86
    .line 87
    goto :goto_3

    .line 88
    :cond_2
    aget-object v3, v5, v1

    .line 89
    .line 90
    add-int/lit8 v4, v4, -0x1

    .line 91
    .line 92
    aget v5, v3, v4

    .line 93
    .line 94
    and-int/2addr v5, p1

    .line 95
    aput v5, v3, v4

    .line 96
    .line 97
    add-int/lit8 v1, v1, 0x1

    .line 98
    .line 99
    goto :goto_1

    .line 100
    :cond_3
    return-void
.end method

.method private assignUnitMatrix(I)V
    .locals 4

    .line 1
    iput p1, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    .line 2
    .line 3
    iput p1, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numColumns:I

    .line 4
    .line 5
    add-int/lit8 v0, p1, 0x1f

    .line 6
    .line 7
    ushr-int/lit8 v0, v0, 0x5

    .line 8
    .line 9
    iput v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    .line 10
    .line 11
    const/4 v1, 0x2

    .line 12
    new-array v1, v1, [I

    .line 13
    .line 14
    const/4 v2, 0x1

    .line 15
    aput v0, v1, v2

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    aput p1, v1, v0

    .line 19
    .line 20
    sget-object p1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 21
    .line 22
    invoke-static {p1, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, [[I

    .line 27
    .line 28
    iput-object p1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 29
    .line 30
    move p1, v0

    .line 31
    :goto_0
    iget v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    .line 32
    .line 33
    if-ge p1, v1, :cond_1

    .line 34
    .line 35
    move v1, v0

    .line 36
    :goto_1
    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    .line 37
    .line 38
    if-ge v1, v3, :cond_0

    .line 39
    .line 40
    iget-object v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 41
    .line 42
    aget-object v3, v3, p1

    .line 43
    .line 44
    aput v0, v3, v1

    .line 45
    .line 46
    add-int/lit8 v1, v1, 0x1

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_0
    add-int/lit8 p1, p1, 0x1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    :goto_2
    iget p1, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    .line 53
    .line 54
    if-ge v0, p1, :cond_2

    .line 55
    .line 56
    and-int/lit8 p1, v0, 0x1f

    .line 57
    .line 58
    iget-object v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 59
    .line 60
    aget-object v1, v1, v0

    .line 61
    .line 62
    ushr-int/lit8 v3, v0, 0x5

    .line 63
    .line 64
    shl-int p1, v2, p1

    .line 65
    .line 66
    aput p1, v1, v3

    .line 67
    .line 68
    add-int/lit8 v0, v0, 0x1

    .line 69
    .line 70
    goto :goto_2

    .line 71
    :cond_2
    return-void
.end method

.method private assignZeroMatrix(II)V
    .locals 2

    .line 1
    iput p1, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    .line 2
    .line 3
    iput p2, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numColumns:I

    .line 4
    .line 5
    add-int/lit8 p2, p2, 0x1f

    .line 6
    .line 7
    ushr-int/lit8 p2, p2, 0x5

    .line 8
    .line 9
    iput p2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    .line 10
    .line 11
    const/4 v0, 0x2

    .line 12
    new-array v0, v0, [I

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    aput p2, v0, v1

    .line 16
    .line 17
    const/4 p2, 0x0

    .line 18
    aput p1, v0, p2

    .line 19
    .line 20
    sget-object p1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 21
    .line 22
    invoke-static {p1, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, [[I

    .line 27
    .line 28
    iput-object p1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 29
    .line 30
    move p1, p2

    .line 31
    :goto_0
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    .line 32
    .line 33
    if-ge p1, v0, :cond_1

    .line 34
    .line 35
    move v0, p2

    .line 36
    :goto_1
    iget v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    .line 37
    .line 38
    if-ge v0, v1, :cond_0

    .line 39
    .line 40
    iget-object v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 41
    .line 42
    aget-object v1, v1, p1

    .line 43
    .line 44
    aput p2, v1, v0

    .line 45
    .line 46
    add-int/lit8 v0, v0, 0x1

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_0
    add-int/lit8 p1, p1, 0x1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    return-void
.end method

.method public static createRandomRegularMatrixAndItsInverse(ILjava/security/SecureRandom;)[Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;
    .locals 18

    .line 1
    move/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    add-int/lit8 v2, v0, 0x1f

    .line 6
    .line 7
    shr-int/lit8 v2, v2, 0x5

    .line 8
    .line 9
    new-instance v3, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    .line 10
    .line 11
    const/16 v4, 0x4c

    .line 12
    .line 13
    invoke-direct {v3, v0, v4, v1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;-><init>(ICLjava/security/SecureRandom;)V

    .line 14
    .line 15
    .line 16
    new-instance v4, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    .line 17
    .line 18
    const/16 v5, 0x55

    .line 19
    .line 20
    invoke-direct {v4, v0, v5, v1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;-><init>(ICLjava/security/SecureRandom;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v3, v4}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->rightMultiply(Lorg/spongycastle/pqc/math/linearalgebra/Matrix;)Lorg/spongycastle/pqc/math/linearalgebra/Matrix;

    .line 24
    .line 25
    .line 26
    move-result-object v5

    .line 27
    check-cast v5, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    .line 28
    .line 29
    new-instance v6, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;

    .line 30
    .line 31
    invoke-direct {v6, v0, v1}, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;-><init>(ILjava/security/SecureRandom;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v6}, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;->getVector()[I

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    const/4 v7, 0x2

    .line 39
    new-array v7, v7, [I

    .line 40
    .line 41
    const/4 v8, 0x1

    .line 42
    aput v2, v7, v8

    .line 43
    .line 44
    const/4 v9, 0x0

    .line 45
    aput v0, v7, v9

    .line 46
    .line 47
    sget-object v10, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 48
    .line 49
    invoke-static {v10, v7}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v7

    .line 53
    check-cast v7, [[I

    .line 54
    .line 55
    move v10, v9

    .line 56
    :goto_0
    if-ge v10, v0, :cond_0

    .line 57
    .line 58
    iget-object v11, v5, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 59
    .line 60
    aget v12, v1, v10

    .line 61
    .line 62
    aget-object v11, v11, v12

    .line 63
    .line 64
    aget-object v12, v7, v10

    .line 65
    .line 66
    invoke-static {v11, v9, v12, v9, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 67
    .line 68
    .line 69
    add-int/lit8 v10, v10, 0x1

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_0
    new-instance v1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    .line 73
    .line 74
    invoke-direct {v1, v0, v7}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;-><init>(I[[I)V

    .line 75
    .line 76
    .line 77
    new-instance v5, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    .line 78
    .line 79
    const/16 v7, 0x49

    .line 80
    .line 81
    invoke-direct {v5, v0, v7}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;-><init>(IC)V

    .line 82
    .line 83
    .line 84
    move v10, v9

    .line 85
    :goto_1
    if-ge v10, v0, :cond_3

    .line 86
    .line 87
    and-int/lit8 v11, v10, 0x1f

    .line 88
    .line 89
    ushr-int/lit8 v12, v10, 0x5

    .line 90
    .line 91
    shl-int v11, v8, v11

    .line 92
    .line 93
    add-int/lit8 v13, v10, 0x1

    .line 94
    .line 95
    move v14, v13

    .line 96
    :goto_2
    if-ge v14, v0, :cond_2

    .line 97
    .line 98
    iget-object v15, v3, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 99
    .line 100
    aget-object v15, v15, v14

    .line 101
    .line 102
    aget v15, v15, v12

    .line 103
    .line 104
    and-int/2addr v15, v11

    .line 105
    if-eqz v15, :cond_1

    .line 106
    .line 107
    move v15, v9

    .line 108
    :goto_3
    if-gt v15, v12, :cond_1

    .line 109
    .line 110
    move/from16 p1, v8

    .line 111
    .line 112
    iget-object v8, v5, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 113
    .line 114
    aget-object v16, v8, v14

    .line 115
    .line 116
    aget v17, v16, v15

    .line 117
    .line 118
    aget-object v8, v8, v10

    .line 119
    .line 120
    aget v8, v8, v15

    .line 121
    .line 122
    xor-int v8, v17, v8

    .line 123
    .line 124
    aput v8, v16, v15

    .line 125
    .line 126
    add-int/lit8 v15, v15, 0x1

    .line 127
    .line 128
    move/from16 v8, p1

    .line 129
    .line 130
    goto :goto_3

    .line 131
    :cond_1
    move/from16 p1, v8

    .line 132
    .line 133
    add-int/lit8 v14, v14, 0x1

    .line 134
    .line 135
    move/from16 v8, p1

    .line 136
    .line 137
    goto :goto_2

    .line 138
    :cond_2
    move v10, v13

    .line 139
    goto :goto_1

    .line 140
    :cond_3
    move/from16 p1, v8

    .line 141
    .line 142
    new-instance v3, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    .line 143
    .line 144
    invoke-direct {v3, v0, v7}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;-><init>(IC)V

    .line 145
    .line 146
    .line 147
    add-int/lit8 v0, v0, -0x1

    .line 148
    .line 149
    :goto_4
    if-ltz v0, :cond_6

    .line 150
    .line 151
    and-int/lit8 v7, v0, 0x1f

    .line 152
    .line 153
    ushr-int/lit8 v8, v0, 0x5

    .line 154
    .line 155
    shl-int v7, p1, v7

    .line 156
    .line 157
    add-int/lit8 v9, v0, -0x1

    .line 158
    .line 159
    :goto_5
    if-ltz v9, :cond_5

    .line 160
    .line 161
    iget-object v10, v4, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 162
    .line 163
    aget-object v10, v10, v9

    .line 164
    .line 165
    aget v10, v10, v8

    .line 166
    .line 167
    and-int/2addr v10, v7

    .line 168
    if-eqz v10, :cond_4

    .line 169
    .line 170
    move v10, v8

    .line 171
    :goto_6
    if-ge v10, v2, :cond_4

    .line 172
    .line 173
    iget-object v11, v3, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 174
    .line 175
    aget-object v12, v11, v9

    .line 176
    .line 177
    aget v13, v12, v10

    .line 178
    .line 179
    aget-object v11, v11, v0

    .line 180
    .line 181
    aget v11, v11, v10

    .line 182
    .line 183
    xor-int/2addr v11, v13

    .line 184
    aput v11, v12, v10

    .line 185
    .line 186
    add-int/lit8 v10, v10, 0x1

    .line 187
    .line 188
    goto :goto_6

    .line 189
    :cond_4
    add-int/lit8 v9, v9, -0x1

    .line 190
    .line 191
    goto :goto_5

    .line 192
    :cond_5
    add-int/lit8 v0, v0, -0x1

    .line 193
    .line 194
    goto :goto_4

    .line 195
    :cond_6
    invoke-virtual {v5, v6}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->rightMultiply(Lorg/spongycastle/pqc/math/linearalgebra/Permutation;)Lorg/spongycastle/pqc/math/linearalgebra/Matrix;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    invoke-virtual {v3, v0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->rightMultiply(Lorg/spongycastle/pqc/math/linearalgebra/Matrix;)Lorg/spongycastle/pqc/math/linearalgebra/Matrix;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    check-cast v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    .line 204
    .line 205
    filled-new-array {v1, v0}, [Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    .line 206
    .line 207
    .line 208
    move-result-object v0

    .line 209
    return-object v0
.end method

.method private static swapRows([[III)V
    .locals 2

    .line 1
    aget-object v0, p0, p1

    .line 2
    .line 3
    aget-object v1, p0, p2

    .line 4
    .line 5
    aput-object v1, p0, p1

    .line 6
    .line 7
    aput-object v0, p0, p2

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public computeInverse()Lorg/spongycastle/pqc/math/linearalgebra/Matrix;
    .locals 12

    .line 1
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    .line 2
    .line 3
    iget v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numColumns:I

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const-string v3, "Matrix is not invertible."

    .line 7
    .line 8
    if-ne v0, v1, :cond_9

    .line 9
    .line 10
    iget v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    .line 11
    .line 12
    const/4 v4, 0x2

    .line 13
    new-array v5, v4, [I

    .line 14
    .line 15
    const/4 v6, 0x1

    .line 16
    aput v1, v5, v6

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    aput v0, v5, v1

    .line 20
    .line 21
    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 22
    .line 23
    invoke-static {v0, v5}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v5

    .line 27
    check-cast v5, [[I

    .line 28
    .line 29
    iget v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    .line 30
    .line 31
    sub-int/2addr v7, v6

    .line 32
    :goto_0
    if-ltz v7, :cond_0

    .line 33
    .line 34
    iget-object v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 35
    .line 36
    aget-object v8, v8, v7

    .line 37
    .line 38
    invoke-static {v8}, Lorg/spongycastle/pqc/math/linearalgebra/IntUtils;->clone([I)[I

    .line 39
    .line 40
    .line 41
    move-result-object v8

    .line 42
    aput-object v8, v5, v7

    .line 43
    .line 44
    add-int/lit8 v7, v7, -0x1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    iget v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    .line 48
    .line 49
    iget v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    .line 50
    .line 51
    new-array v4, v4, [I

    .line 52
    .line 53
    aput v8, v4, v6

    .line 54
    .line 55
    aput v7, v4, v1

    .line 56
    .line 57
    invoke-static {v0, v4}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    check-cast v0, [[I

    .line 62
    .line 63
    iget v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    .line 64
    .line 65
    sub-int/2addr v4, v6

    .line 66
    :goto_1
    if-ltz v4, :cond_1

    .line 67
    .line 68
    shr-int/lit8 v7, v4, 0x5

    .line 69
    .line 70
    and-int/lit8 v8, v4, 0x1f

    .line 71
    .line 72
    aget-object v9, v0, v4

    .line 73
    .line 74
    shl-int v8, v6, v8

    .line 75
    .line 76
    aput v8, v9, v7

    .line 77
    .line 78
    add-int/lit8 v4, v4, -0x1

    .line 79
    .line 80
    goto :goto_1

    .line 81
    :cond_1
    move v4, v1

    .line 82
    :goto_2
    iget v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    .line 83
    .line 84
    if-ge v4, v7, :cond_8

    .line 85
    .line 86
    shr-int/lit8 v7, v4, 0x5

    .line 87
    .line 88
    and-int/lit8 v8, v4, 0x1f

    .line 89
    .line 90
    shl-int v8, v6, v8

    .line 91
    .line 92
    aget-object v9, v5, v4

    .line 93
    .line 94
    aget v9, v9, v7

    .line 95
    .line 96
    and-int/2addr v9, v8

    .line 97
    if-nez v9, :cond_5

    .line 98
    .line 99
    add-int/lit8 v9, v4, 0x1

    .line 100
    .line 101
    move v10, v1

    .line 102
    :goto_3
    iget v11, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    .line 103
    .line 104
    if-ge v9, v11, :cond_3

    .line 105
    .line 106
    aget-object v11, v5, v9

    .line 107
    .line 108
    aget v11, v11, v7

    .line 109
    .line 110
    and-int/2addr v11, v8

    .line 111
    if-eqz v11, :cond_2

    .line 112
    .line 113
    invoke-static {v5, v4, v9}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->swapRows([[III)V

    .line 114
    .line 115
    .line 116
    invoke-static {v0, v4, v9}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->swapRows([[III)V

    .line 117
    .line 118
    .line 119
    iget v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    .line 120
    .line 121
    move v10, v6

    .line 122
    :cond_2
    add-int/2addr v9, v6

    .line 123
    goto :goto_3

    .line 124
    :cond_3
    if-eqz v10, :cond_4

    .line 125
    .line 126
    goto :goto_4

    .line 127
    :cond_4
    invoke-static {v3}, Ll/mym;->a(Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    return-object v2

    .line 131
    :cond_5
    :goto_4
    iget v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    .line 132
    .line 133
    sub-int/2addr v9, v6

    .line 134
    :goto_5
    if-ltz v9, :cond_7

    .line 135
    .line 136
    if-eq v9, v4, :cond_6

    .line 137
    .line 138
    aget-object v10, v5, v9

    .line 139
    .line 140
    aget v11, v10, v7

    .line 141
    .line 142
    and-int/2addr v11, v8

    .line 143
    if-eqz v11, :cond_6

    .line 144
    .line 145
    aget-object v11, v5, v4

    .line 146
    .line 147
    invoke-static {v11, v10, v7}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->addToRow([I[II)V

    .line 148
    .line 149
    .line 150
    aget-object v10, v0, v4

    .line 151
    .line 152
    aget-object v11, v0, v9

    .line 153
    .line 154
    invoke-static {v10, v11, v1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->addToRow([I[II)V

    .line 155
    .line 156
    .line 157
    :cond_6
    add-int/lit8 v9, v9, -0x1

    .line 158
    .line 159
    goto :goto_5

    .line 160
    :cond_7
    add-int/lit8 v4, v4, 0x1

    .line 161
    .line 162
    goto :goto_2

    .line 163
    :cond_8
    new-instance v1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    .line 164
    .line 165
    iget p0, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numColumns:I

    .line 166
    .line 167
    invoke-direct {v1, p0, v0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;-><init>(I[[I)V

    .line 168
    .line 169
    .line 170
    return-object v1

    .line 171
    :cond_9
    invoke-static {v3}, Ll/mym;->a(Ljava/lang/String;)V

    .line 172
    .line 173
    .line 174
    return-object v2
.end method

.method public computeTranspose()Lorg/spongycastle/pqc/math/linearalgebra/Matrix;
    .locals 9

    .line 1
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numColumns:I

    .line 2
    .line 3
    iget v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    .line 4
    .line 5
    add-int/lit8 v1, v1, 0x1f

    .line 6
    .line 7
    ushr-int/lit8 v1, v1, 0x5

    .line 8
    .line 9
    const/4 v2, 0x2

    .line 10
    new-array v2, v2, [I

    .line 11
    .line 12
    const/4 v3, 0x1

    .line 13
    aput v1, v2, v3

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    aput v0, v2, v1

    .line 17
    .line 18
    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 19
    .line 20
    invoke-static {v0, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, [[I

    .line 25
    .line 26
    move v2, v1

    .line 27
    :goto_0
    iget v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    .line 28
    .line 29
    if-ge v2, v4, :cond_2

    .line 30
    .line 31
    move v4, v1

    .line 32
    :goto_1
    iget v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numColumns:I

    .line 33
    .line 34
    if-ge v4, v5, :cond_1

    .line 35
    .line 36
    ushr-int/lit8 v5, v4, 0x5

    .line 37
    .line 38
    and-int/lit8 v6, v4, 0x1f

    .line 39
    .line 40
    iget-object v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 41
    .line 42
    aget-object v7, v7, v2

    .line 43
    .line 44
    aget v5, v7, v5

    .line 45
    .line 46
    ushr-int/2addr v5, v6

    .line 47
    and-int/2addr v5, v3

    .line 48
    ushr-int/lit8 v6, v2, 0x5

    .line 49
    .line 50
    and-int/lit8 v7, v2, 0x1f

    .line 51
    .line 52
    if-ne v5, v3, :cond_0

    .line 53
    .line 54
    aget-object v5, v0, v4

    .line 55
    .line 56
    aget v8, v5, v6

    .line 57
    .line 58
    shl-int v7, v3, v7

    .line 59
    .line 60
    or-int/2addr v7, v8

    .line 61
    aput v7, v5, v6

    .line 62
    .line 63
    :cond_0
    add-int/lit8 v4, v4, 0x1

    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_2
    new-instance p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    .line 70
    .line 71
    invoke-direct {p0, v4, v0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;-><init>(I[[I)V

    .line 72
    .line 73
    .line 74
    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    instance-of v0, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

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
    check-cast p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    .line 8
    .line 9
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    .line 10
    .line 11
    iget v2, p1, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    .line 12
    .line 13
    if-ne v0, v2, :cond_4

    .line 14
    .line 15
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numColumns:I

    .line 16
    .line 17
    iget v2, p1, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numColumns:I

    .line 18
    .line 19
    if-ne v0, v2, :cond_4

    .line 20
    .line 21
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    .line 22
    .line 23
    iget v2, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    .line 24
    .line 25
    if-eq v0, v2, :cond_1

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_1
    move v0, v1

    .line 29
    :goto_0
    iget v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    .line 30
    .line 31
    if-ge v0, v2, :cond_3

    .line 32
    .line 33
    iget-object v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 34
    .line 35
    aget-object v2, v2, v0

    .line 36
    .line 37
    iget-object v3, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 38
    .line 39
    aget-object v3, v3, v0

    .line 40
    .line 41
    invoke-static {v2, v3}, Lorg/spongycastle/pqc/math/linearalgebra/IntUtils;->equals([I[I)Z

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    if-nez v2, :cond_2

    .line 46
    .line 47
    return v1

    .line 48
    :cond_2
    add-int/lit8 v0, v0, 0x1

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_3
    const/4 p0, 0x1

    .line 52
    return p0

    .line 53
    :cond_4
    :goto_1
    return v1
.end method

.method public extendLeftCompactForm()Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;
    .locals 8

    .line 1
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numColumns:I

    .line 2
    .line 3
    iget v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    .line 4
    .line 5
    add-int/2addr v0, v1

    .line 6
    new-instance v2, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    .line 7
    .line 8
    invoke-direct {v2, v1, v0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;-><init>(II)V

    .line 9
    .line 10
    .line 11
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    .line 12
    .line 13
    add-int/lit8 v1, v0, -0x1

    .line 14
    .line 15
    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numColumns:I

    .line 16
    .line 17
    add-int/2addr v1, v3

    .line 18
    const/4 v3, 0x1

    .line 19
    sub-int/2addr v0, v3

    .line 20
    :goto_0
    if-ltz v0, :cond_0

    .line 21
    .line 22
    iget-object v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 23
    .line 24
    aget-object v4, v4, v0

    .line 25
    .line 26
    iget-object v5, v2, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 27
    .line 28
    aget-object v5, v5, v0

    .line 29
    .line 30
    iget v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    .line 31
    .line 32
    const/4 v7, 0x0

    .line 33
    invoke-static {v4, v7, v5, v7, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 34
    .line 35
    .line 36
    iget-object v4, v2, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 37
    .line 38
    aget-object v4, v4, v0

    .line 39
    .line 40
    shr-int/lit8 v5, v1, 0x5

    .line 41
    .line 42
    aget v6, v4, v5

    .line 43
    .line 44
    and-int/lit8 v7, v1, 0x1f

    .line 45
    .line 46
    shl-int v7, v3, v7

    .line 47
    .line 48
    or-int/2addr v6, v7

    .line 49
    aput v6, v4, v5

    .line 50
    .line 51
    add-int/lit8 v0, v0, -0x1

    .line 52
    .line 53
    add-int/lit8 v1, v1, -0x1

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_0
    return-object v2
.end method

.method public extendRightCompactForm()Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;
    .locals 12

    .line 1
    new-instance v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    .line 2
    .line 3
    iget v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    .line 4
    .line 5
    iget v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numColumns:I

    .line 6
    .line 7
    add-int/2addr v2, v1

    .line 8
    invoke-direct {v0, v1, v2}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;-><init>(II)V

    .line 9
    .line 10
    .line 11
    iget v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    .line 12
    .line 13
    shr-int/lit8 v2, v1, 0x5

    .line 14
    .line 15
    and-int/lit8 v3, v1, 0x1f

    .line 16
    .line 17
    const/4 v4, 0x1

    .line 18
    sub-int/2addr v1, v4

    .line 19
    :goto_0
    if-ltz v1, :cond_3

    .line 20
    .line 21
    iget-object v5, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 22
    .line 23
    aget-object v5, v5, v1

    .line 24
    .line 25
    shr-int/lit8 v6, v1, 0x5

    .line 26
    .line 27
    aget v7, v5, v6

    .line 28
    .line 29
    and-int/lit8 v8, v1, 0x1f

    .line 30
    .line 31
    shl-int v8, v4, v8

    .line 32
    .line 33
    or-int/2addr v7, v8

    .line 34
    aput v7, v5, v6

    .line 35
    .line 36
    const/4 v6, 0x0

    .line 37
    if-eqz v3, :cond_1

    .line 38
    .line 39
    move v5, v2

    .line 40
    :goto_1
    iget v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    .line 41
    .line 42
    add-int/lit8 v8, v7, -0x1

    .line 43
    .line 44
    iget-object v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 45
    .line 46
    if-ge v6, v8, :cond_0

    .line 47
    .line 48
    aget-object v7, v9, v1

    .line 49
    .line 50
    aget v7, v7, v6

    .line 51
    .line 52
    iget-object v8, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 53
    .line 54
    aget-object v8, v8, v1

    .line 55
    .line 56
    add-int/lit8 v9, v5, 0x1

    .line 57
    .line 58
    aget v10, v8, v5

    .line 59
    .line 60
    shl-int v11, v7, v3

    .line 61
    .line 62
    or-int/2addr v10, v11

    .line 63
    aput v10, v8, v5

    .line 64
    .line 65
    aget v5, v8, v9

    .line 66
    .line 67
    rsub-int/lit8 v10, v3, 0x20

    .line 68
    .line 69
    ushr-int/2addr v7, v10

    .line 70
    or-int/2addr v5, v7

    .line 71
    aput v5, v8, v9

    .line 72
    .line 73
    add-int/lit8 v6, v6, 0x1

    .line 74
    .line 75
    move v5, v9

    .line 76
    goto :goto_1

    .line 77
    :cond_0
    aget-object v6, v9, v1

    .line 78
    .line 79
    add-int/lit8 v7, v7, -0x1

    .line 80
    .line 81
    aget v6, v6, v7

    .line 82
    .line 83
    iget-object v7, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 84
    .line 85
    aget-object v7, v7, v1

    .line 86
    .line 87
    add-int/lit8 v8, v5, 0x1

    .line 88
    .line 89
    aget v9, v7, v5

    .line 90
    .line 91
    shl-int v10, v6, v3

    .line 92
    .line 93
    or-int/2addr v9, v10

    .line 94
    aput v9, v7, v5

    .line 95
    .line 96
    iget v5, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    .line 97
    .line 98
    if-ge v8, v5, :cond_2

    .line 99
    .line 100
    aget v5, v7, v8

    .line 101
    .line 102
    rsub-int/lit8 v9, v3, 0x20

    .line 103
    .line 104
    ushr-int/2addr v6, v9

    .line 105
    or-int/2addr v5, v6

    .line 106
    aput v5, v7, v8

    .line 107
    .line 108
    goto :goto_2

    .line 109
    :cond_1
    iget-object v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 110
    .line 111
    aget-object v7, v7, v1

    .line 112
    .line 113
    iget v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    .line 114
    .line 115
    invoke-static {v7, v6, v5, v2, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 116
    .line 117
    .line 118
    :cond_2
    :goto_2
    add-int/lit8 v1, v1, -0x1

    .line 119
    .line 120
    goto :goto_0

    .line 121
    :cond_3
    return-object v0
.end method

.method public getEncoded()[B
    .locals 9

    .line 1
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numColumns:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x7

    .line 4
    .line 5
    ushr-int/lit8 v0, v0, 0x3

    .line 6
    .line 7
    iget v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    .line 8
    .line 9
    mul-int/2addr v0, v1

    .line 10
    const/16 v2, 0x8

    .line 11
    .line 12
    add-int/2addr v0, v2

    .line 13
    new-array v0, v0, [B

    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    invoke-static {v1, v0, v3}, Lorg/spongycastle/pqc/math/linearalgebra/LittleEndianConversions;->I2OSP(I[BI)V

    .line 17
    .line 18
    .line 19
    iget v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numColumns:I

    .line 20
    .line 21
    const/4 v4, 0x4

    .line 22
    invoke-static {v1, v0, v4}, Lorg/spongycastle/pqc/math/linearalgebra/LittleEndianConversions;->I2OSP(I[BI)V

    .line 23
    .line 24
    .line 25
    iget v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numColumns:I

    .line 26
    .line 27
    ushr-int/lit8 v4, v1, 0x5

    .line 28
    .line 29
    and-int/lit8 v1, v1, 0x1f

    .line 30
    .line 31
    move v5, v3

    .line 32
    :goto_0
    iget v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    .line 33
    .line 34
    if-ge v5, v6, :cond_2

    .line 35
    .line 36
    move v6, v3

    .line 37
    :goto_1
    if-ge v6, v4, :cond_0

    .line 38
    .line 39
    iget-object v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 40
    .line 41
    aget-object v7, v7, v5

    .line 42
    .line 43
    aget v7, v7, v6

    .line 44
    .line 45
    invoke-static {v7, v0, v2}, Lorg/spongycastle/pqc/math/linearalgebra/LittleEndianConversions;->I2OSP(I[BI)V

    .line 46
    .line 47
    .line 48
    add-int/lit8 v6, v6, 0x1

    .line 49
    .line 50
    add-int/lit8 v2, v2, 0x4

    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_0
    move v6, v3

    .line 54
    :goto_2
    if-ge v6, v1, :cond_1

    .line 55
    .line 56
    add-int/lit8 v7, v2, 0x1

    .line 57
    .line 58
    iget-object v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 59
    .line 60
    aget-object v8, v8, v5

    .line 61
    .line 62
    aget v8, v8, v4

    .line 63
    .line 64
    ushr-int/2addr v8, v6

    .line 65
    and-int/lit16 v8, v8, 0xff

    .line 66
    .line 67
    int-to-byte v8, v8

    .line 68
    aput-byte v8, v0, v2

    .line 69
    .line 70
    add-int/lit8 v6, v6, 0x8

    .line 71
    .line 72
    move v2, v7

    .line 73
    goto :goto_2

    .line 74
    :cond_1
    add-int/lit8 v5, v5, 0x1

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_2
    return-object v0
.end method

.method public getHammingWeight()D
    .locals 15

    .line 1
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numColumns:I

    .line 2
    .line 3
    and-int/lit8 v0, v0, 0x1f

    .line 4
    .line 5
    iget v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    add-int/lit8 v1, v1, -0x1

    .line 11
    .line 12
    :goto_0
    const/4 v2, 0x0

    .line 13
    const-wide/16 v3, 0x0

    .line 14
    .line 15
    move v7, v2

    .line 16
    move-wide v5, v3

    .line 17
    :goto_1
    iget v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    .line 18
    .line 19
    if-ge v7, v8, :cond_4

    .line 20
    .line 21
    move v8, v2

    .line 22
    :goto_2
    iget-object v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 23
    .line 24
    const-wide/high16 v10, 0x3ff0000000000000L    # 1.0

    .line 25
    .line 26
    if-ge v8, v1, :cond_2

    .line 27
    .line 28
    aget-object v9, v9, v7

    .line 29
    .line 30
    aget v9, v9, v8

    .line 31
    .line 32
    move v12, v2

    .line 33
    :goto_3
    const/16 v13, 0x20

    .line 34
    .line 35
    if-ge v12, v13, :cond_1

    .line 36
    .line 37
    ushr-int v13, v9, v12

    .line 38
    .line 39
    and-int/lit8 v13, v13, 0x1

    .line 40
    .line 41
    int-to-double v13, v13

    .line 42
    add-double/2addr v3, v13

    .line 43
    add-double/2addr v5, v10

    .line 44
    add-int/lit8 v12, v12, 0x1

    .line 45
    .line 46
    goto :goto_3

    .line 47
    :cond_1
    add-int/lit8 v8, v8, 0x1

    .line 48
    .line 49
    goto :goto_2

    .line 50
    :cond_2
    aget-object v8, v9, v7

    .line 51
    .line 52
    iget v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    .line 53
    .line 54
    add-int/lit8 v9, v9, -0x1

    .line 55
    .line 56
    aget v8, v8, v9

    .line 57
    .line 58
    move v9, v2

    .line 59
    :goto_4
    if-ge v9, v0, :cond_3

    .line 60
    .line 61
    ushr-int v12, v8, v9

    .line 62
    .line 63
    and-int/lit8 v12, v12, 0x1

    .line 64
    .line 65
    int-to-double v12, v12

    .line 66
    add-double/2addr v3, v12

    .line 67
    add-double/2addr v5, v10

    .line 68
    add-int/lit8 v9, v9, 0x1

    .line 69
    .line 70
    goto :goto_4

    .line 71
    :cond_3
    add-int/lit8 v7, v7, 0x1

    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_4
    div-double/2addr v3, v5

    .line 75
    return-wide v3
.end method

.method public getIntArray()[[I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 2
    .line 3
    return-object p0
.end method

.method public getLeftSubMatrix()Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;
    .locals 9

    .line 1
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numColumns:I

    .line 2
    .line 3
    iget v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    .line 4
    .line 5
    if-le v0, v1, :cond_2

    .line 6
    .line 7
    add-int/lit8 v0, v1, 0x1f

    .line 8
    .line 9
    shr-int/lit8 v0, v0, 0x5

    .line 10
    .line 11
    const/4 v2, 0x2

    .line 12
    new-array v2, v2, [I

    .line 13
    .line 14
    const/4 v3, 0x1

    .line 15
    aput v0, v2, v3

    .line 16
    .line 17
    const/4 v4, 0x0

    .line 18
    aput v1, v2, v4

    .line 19
    .line 20
    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 21
    .line 22
    invoke-static {v1, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, [[I

    .line 27
    .line 28
    iget v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    .line 29
    .line 30
    and-int/lit8 v5, v2, 0x1f

    .line 31
    .line 32
    shl-int v5, v3, v5

    .line 33
    .line 34
    sub-int/2addr v5, v3

    .line 35
    if-nez v5, :cond_0

    .line 36
    .line 37
    const/4 v5, -0x1

    .line 38
    :cond_0
    sub-int/2addr v2, v3

    .line 39
    :goto_0
    if-ltz v2, :cond_1

    .line 40
    .line 41
    iget-object v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 42
    .line 43
    aget-object v6, v6, v2

    .line 44
    .line 45
    aget-object v7, v1, v2

    .line 46
    .line 47
    invoke-static {v6, v4, v7, v4, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 48
    .line 49
    .line 50
    aget-object v6, v1, v2

    .line 51
    .line 52
    add-int/lit8 v7, v0, -0x1

    .line 53
    .line 54
    aget v8, v6, v7

    .line 55
    .line 56
    and-int/2addr v8, v5

    .line 57
    aput v8, v6, v7

    .line 58
    .line 59
    add-int/lit8 v2, v2, -0x1

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_1
    new-instance v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    .line 63
    .line 64
    iget p0, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    .line 65
    .line 66
    invoke-direct {v0, p0, v1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;-><init>(I[[I)V

    .line 67
    .line 68
    .line 69
    return-object v0

    .line 70
    :cond_2
    const-string p0, "empty submatrix"

    .line 71
    .line 72
    invoke-static {p0}, Ll/mym;->a(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    const/4 p0, 0x0

    .line 76
    return-object p0
.end method

.method public getLength()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    .line 2
    .line 3
    return p0
.end method

.method public getRightSubMatrix()Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;
    .locals 10

    .line 1
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numColumns:I

    .line 2
    .line 3
    iget v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    .line 4
    .line 5
    if-le v0, v1, :cond_4

    .line 6
    .line 7
    shr-int/lit8 v2, v1, 0x5

    .line 8
    .line 9
    and-int/lit8 v3, v1, 0x1f

    .line 10
    .line 11
    new-instance v4, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    .line 12
    .line 13
    sub-int/2addr v0, v1

    .line 14
    invoke-direct {v4, v1, v0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;-><init>(II)V

    .line 15
    .line 16
    .line 17
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    .line 18
    .line 19
    add-int/lit8 v0, v0, -0x1

    .line 20
    .line 21
    :goto_0
    if-ltz v0, :cond_3

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    if-eqz v3, :cond_1

    .line 25
    .line 26
    move v5, v2

    .line 27
    :goto_1
    iget v6, v4, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    .line 28
    .line 29
    add-int/lit8 v7, v6, -0x1

    .line 30
    .line 31
    iget-object v8, v4, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 32
    .line 33
    if-ge v1, v7, :cond_0

    .line 34
    .line 35
    aget-object v6, v8, v0

    .line 36
    .line 37
    iget-object v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 38
    .line 39
    aget-object v7, v7, v0

    .line 40
    .line 41
    add-int/lit8 v8, v5, 0x1

    .line 42
    .line 43
    aget v5, v7, v5

    .line 44
    .line 45
    ushr-int/2addr v5, v3

    .line 46
    aget v7, v7, v8

    .line 47
    .line 48
    rsub-int/lit8 v9, v3, 0x20

    .line 49
    .line 50
    shl-int/2addr v7, v9

    .line 51
    or-int/2addr v5, v7

    .line 52
    aput v5, v6, v1

    .line 53
    .line 54
    add-int/lit8 v1, v1, 0x1

    .line 55
    .line 56
    move v5, v8

    .line 57
    goto :goto_1

    .line 58
    :cond_0
    aget-object v1, v8, v0

    .line 59
    .line 60
    add-int/lit8 v7, v6, -0x1

    .line 61
    .line 62
    iget-object v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 63
    .line 64
    aget-object v8, v8, v0

    .line 65
    .line 66
    add-int/lit8 v9, v5, 0x1

    .line 67
    .line 68
    aget v5, v8, v5

    .line 69
    .line 70
    ushr-int/2addr v5, v3

    .line 71
    aput v5, v1, v7

    .line 72
    .line 73
    iget v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    .line 74
    .line 75
    if-ge v9, v5, :cond_2

    .line 76
    .line 77
    add-int/lit8 v6, v6, -0x1

    .line 78
    .line 79
    aget v5, v1, v6

    .line 80
    .line 81
    aget v7, v8, v9

    .line 82
    .line 83
    rsub-int/lit8 v8, v3, 0x20

    .line 84
    .line 85
    shl-int/2addr v7, v8

    .line 86
    or-int/2addr v5, v7

    .line 87
    aput v5, v1, v6

    .line 88
    .line 89
    goto :goto_2

    .line 90
    :cond_1
    iget-object v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 91
    .line 92
    aget-object v5, v5, v0

    .line 93
    .line 94
    iget-object v6, v4, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 95
    .line 96
    aget-object v6, v6, v0

    .line 97
    .line 98
    iget v7, v4, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    .line 99
    .line 100
    invoke-static {v5, v2, v6, v1, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 101
    .line 102
    .line 103
    :cond_2
    :goto_2
    add-int/lit8 v0, v0, -0x1

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_3
    return-object v4

    .line 107
    :cond_4
    const-string p0, "empty submatrix"

    .line 108
    .line 109
    invoke-static {p0}, Ll/mym;->a(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    const/4 p0, 0x0

    .line 113
    return-object p0
.end method

.method public getRow(I)[I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 2
    .line 3
    aget-object p0, p0, p1

    .line 4
    .line 5
    return-object p0
.end method

.method public hashCode()I
    .locals 3

    .line 1
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    .line 2
    .line 3
    mul-int/lit8 v0, v0, 0x1f

    .line 4
    .line 5
    iget v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numColumns:I

    .line 6
    .line 7
    add-int/2addr v0, v1

    .line 8
    mul-int/lit8 v0, v0, 0x1f

    .line 9
    .line 10
    iget v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    .line 11
    .line 12
    add-int/2addr v0, v1

    .line 13
    const/4 v1, 0x0

    .line 14
    :goto_0
    iget v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    .line 15
    .line 16
    if-ge v1, v2, :cond_0

    .line 17
    .line 18
    mul-int/lit8 v0, v0, 0x1f

    .line 19
    .line 20
    iget-object v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 21
    .line 22
    aget-object v2, v2, v1

    .line 23
    .line 24
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    add-int/2addr v0, v2

    .line 29
    add-int/lit8 v1, v1, 0x1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    return v0
.end method

.method public isZero()Z
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    .line 4
    .line 5
    if-ge v1, v2, :cond_2

    .line 6
    .line 7
    move v2, v0

    .line 8
    :goto_1
    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    .line 9
    .line 10
    if-ge v2, v3, :cond_1

    .line 11
    .line 12
    iget-object v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 13
    .line 14
    aget-object v3, v3, v1

    .line 15
    .line 16
    aget v3, v3, v2

    .line 17
    .line 18
    if-eqz v3, :cond_0

    .line 19
    .line 20
    return v0

    .line 21
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_2
    const/4 p0, 0x1

    .line 28
    return p0
.end method

.method public leftMultiply(Lorg/spongycastle/pqc/math/linearalgebra/Permutation;)Lorg/spongycastle/pqc/math/linearalgebra/Matrix;
    .locals 4

    .line 121
    invoke-virtual {p1}, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;->getVector()[I

    move-result-object p1

    .line 122
    array-length v0, p1

    iget v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    if-ne v0, v1, :cond_1

    .line 123
    new-array v0, v1, [[I

    add-int/lit8 v1, v1, -0x1

    :goto_0
    if-ltz v1, :cond_0

    .line 124
    iget-object v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget v3, p1, v1

    aget-object v2, v2, v3

    invoke-static {v2}, Lorg/spongycastle/pqc/math/linearalgebra/IntUtils;->clone([I)[I

    move-result-object v2

    aput-object v2, v0, v1

    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 125
    :cond_0
    new-instance p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    iget p0, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    invoke-direct {p1, p0, v0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;-><init>(I[[I)V

    return-object p1

    .line 126
    :cond_1
    const-string p0, "length mismatch"

    invoke-static {p0}, Ll/mym;->a(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public leftMultiply(Lorg/spongycastle/pqc/math/linearalgebra/Vector;)Lorg/spongycastle/pqc/math/linearalgebra/Vector;
    .locals 11

    .line 1
    instance-of v0, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_6

    .line 5
    .line 6
    iget v0, p1, Lorg/spongycastle/pqc/math/linearalgebra/Vector;->length:I

    .line 7
    .line 8
    iget v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    .line 9
    .line 10
    if-ne v0, v2, :cond_5

    .line 11
    .line 12
    check-cast p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;

    .line 13
    .line 14
    invoke-virtual {p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;->getVecArray()[I

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    .line 19
    .line 20
    new-array v0, v0, [I

    .line 21
    .line 22
    iget v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    .line 23
    .line 24
    shr-int/lit8 v2, v1, 0x5

    .line 25
    .line 26
    and-int/lit8 v1, v1, 0x1f

    .line 27
    .line 28
    const/4 v3, 0x1

    .line 29
    shl-int v1, v3, v1

    .line 30
    .line 31
    const/4 v4, 0x0

    .line 32
    move v5, v4

    .line 33
    move v6, v5

    .line 34
    :goto_0
    if-ge v5, v2, :cond_2

    .line 35
    .line 36
    move v7, v3

    .line 37
    :cond_0
    aget v8, p1, v5

    .line 38
    .line 39
    and-int/2addr v8, v7

    .line 40
    if-eqz v8, :cond_1

    .line 41
    .line 42
    move v8, v4

    .line 43
    :goto_1
    iget v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    .line 44
    .line 45
    if-ge v8, v9, :cond_1

    .line 46
    .line 47
    aget v9, v0, v8

    .line 48
    .line 49
    iget-object v10, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 50
    .line 51
    aget-object v10, v10, v6

    .line 52
    .line 53
    aget v10, v10, v8

    .line 54
    .line 55
    xor-int/2addr v9, v10

    .line 56
    aput v9, v0, v8

    .line 57
    .line 58
    add-int/lit8 v8, v8, 0x1

    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_1
    add-int/lit8 v6, v6, 0x1

    .line 62
    .line 63
    shl-int/lit8 v7, v7, 0x1

    .line 64
    .line 65
    if-nez v7, :cond_0

    .line 66
    .line 67
    add-int/lit8 v5, v5, 0x1

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_2
    :goto_2
    if-eq v3, v1, :cond_4

    .line 71
    .line 72
    aget v5, p1, v2

    .line 73
    .line 74
    and-int/2addr v5, v3

    .line 75
    if-eqz v5, :cond_3

    .line 76
    .line 77
    move v5, v4

    .line 78
    :goto_3
    iget v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    .line 79
    .line 80
    if-ge v5, v7, :cond_3

    .line 81
    .line 82
    aget v7, v0, v5

    .line 83
    .line 84
    iget-object v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 85
    .line 86
    aget-object v8, v8, v6

    .line 87
    .line 88
    aget v8, v8, v5

    .line 89
    .line 90
    xor-int/2addr v7, v8

    .line 91
    aput v7, v0, v5

    .line 92
    .line 93
    add-int/lit8 v5, v5, 0x1

    .line 94
    .line 95
    goto :goto_3

    .line 96
    :cond_3
    add-int/lit8 v6, v6, 0x1

    .line 97
    .line 98
    shl-int/lit8 v3, v3, 0x1

    .line 99
    .line 100
    goto :goto_2

    .line 101
    :cond_4
    new-instance p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;

    .line 102
    .line 103
    iget p0, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numColumns:I

    .line 104
    .line 105
    invoke-direct {p1, v0, p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;-><init>([II)V

    .line 106
    .line 107
    .line 108
    return-object p1

    .line 109
    :cond_5
    const-string p0, "length mismatch"

    .line 110
    .line 111
    invoke-static {p0}, Ll/mym;->a(Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    return-object v1

    .line 115
    :cond_6
    const-string p0, "vector is not defined over GF(2)"

    .line 116
    .line 117
    invoke-static {p0}, Ll/mym;->a(Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    return-object v1
.end method

.method public leftMultiplyLeftCompactForm(Lorg/spongycastle/pqc/math/linearalgebra/Vector;)Lorg/spongycastle/pqc/math/linearalgebra/Vector;
    .locals 10

    .line 1
    instance-of v0, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_8

    .line 5
    .line 6
    iget v0, p1, Lorg/spongycastle/pqc/math/linearalgebra/Vector;->length:I

    .line 7
    .line 8
    iget v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    .line 9
    .line 10
    if-ne v0, v2, :cond_7

    .line 11
    .line 12
    check-cast p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;

    .line 13
    .line 14
    invoke-virtual {p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;->getVecArray()[I

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    .line 19
    .line 20
    iget v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numColumns:I

    .line 21
    .line 22
    add-int/2addr v1, v0

    .line 23
    add-int/lit8 v1, v1, 0x1f

    .line 24
    .line 25
    ushr-int/lit8 v1, v1, 0x5

    .line 26
    .line 27
    new-array v1, v1, [I

    .line 28
    .line 29
    ushr-int/lit8 v0, v0, 0x5

    .line 30
    .line 31
    const/4 v2, 0x0

    .line 32
    move v3, v2

    .line 33
    move v4, v3

    .line 34
    :goto_0
    const/4 v5, 0x1

    .line 35
    if-ge v3, v0, :cond_3

    .line 36
    .line 37
    move v6, v5

    .line 38
    :cond_0
    aget v7, p1, v3

    .line 39
    .line 40
    and-int/2addr v7, v6

    .line 41
    if-eqz v7, :cond_2

    .line 42
    .line 43
    move v7, v2

    .line 44
    :goto_1
    iget v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    .line 45
    .line 46
    if-ge v7, v8, :cond_1

    .line 47
    .line 48
    aget v8, v1, v7

    .line 49
    .line 50
    iget-object v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 51
    .line 52
    aget-object v9, v9, v4

    .line 53
    .line 54
    aget v9, v9, v7

    .line 55
    .line 56
    xor-int/2addr v8, v9

    .line 57
    aput v8, v1, v7

    .line 58
    .line 59
    add-int/lit8 v7, v7, 0x1

    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_1
    iget v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numColumns:I

    .line 63
    .line 64
    add-int v8, v7, v4

    .line 65
    .line 66
    ushr-int/lit8 v8, v8, 0x5

    .line 67
    .line 68
    add-int/2addr v7, v4

    .line 69
    and-int/lit8 v7, v7, 0x1f

    .line 70
    .line 71
    aget v9, v1, v8

    .line 72
    .line 73
    shl-int v7, v5, v7

    .line 74
    .line 75
    or-int/2addr v7, v9

    .line 76
    aput v7, v1, v8

    .line 77
    .line 78
    :cond_2
    add-int/lit8 v4, v4, 0x1

    .line 79
    .line 80
    shl-int/lit8 v6, v6, 0x1

    .line 81
    .line 82
    if-nez v6, :cond_0

    .line 83
    .line 84
    add-int/lit8 v3, v3, 0x1

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_3
    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    .line 88
    .line 89
    and-int/lit8 v3, v3, 0x1f

    .line 90
    .line 91
    shl-int v3, v5, v3

    .line 92
    .line 93
    move v6, v5

    .line 94
    :goto_2
    if-eq v6, v3, :cond_6

    .line 95
    .line 96
    aget v7, p1, v0

    .line 97
    .line 98
    and-int/2addr v7, v6

    .line 99
    if-eqz v7, :cond_5

    .line 100
    .line 101
    move v7, v2

    .line 102
    :goto_3
    iget v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    .line 103
    .line 104
    if-ge v7, v8, :cond_4

    .line 105
    .line 106
    aget v8, v1, v7

    .line 107
    .line 108
    iget-object v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 109
    .line 110
    aget-object v9, v9, v4

    .line 111
    .line 112
    aget v9, v9, v7

    .line 113
    .line 114
    xor-int/2addr v8, v9

    .line 115
    aput v8, v1, v7

    .line 116
    .line 117
    add-int/lit8 v7, v7, 0x1

    .line 118
    .line 119
    goto :goto_3

    .line 120
    :cond_4
    iget v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numColumns:I

    .line 121
    .line 122
    add-int v8, v7, v4

    .line 123
    .line 124
    ushr-int/lit8 v8, v8, 0x5

    .line 125
    .line 126
    add-int/2addr v7, v4

    .line 127
    and-int/lit8 v7, v7, 0x1f

    .line 128
    .line 129
    aget v9, v1, v8

    .line 130
    .line 131
    shl-int v7, v5, v7

    .line 132
    .line 133
    or-int/2addr v7, v9

    .line 134
    aput v7, v1, v8

    .line 135
    .line 136
    :cond_5
    add-int/lit8 v4, v4, 0x1

    .line 137
    .line 138
    shl-int/lit8 v6, v6, 0x1

    .line 139
    .line 140
    goto :goto_2

    .line 141
    :cond_6
    new-instance p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;

    .line 142
    .line 143
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    .line 144
    .line 145
    iget p0, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numColumns:I

    .line 146
    .line 147
    add-int/2addr v0, p0

    .line 148
    invoke-direct {p1, v1, v0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;-><init>([II)V

    .line 149
    .line 150
    .line 151
    return-object p1

    .line 152
    :cond_7
    const-string p0, "length mismatch"

    .line 153
    .line 154
    invoke-static {p0}, Ll/mym;->a(Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    return-object v1

    .line 158
    :cond_8
    const-string p0, "vector is not defined over GF(2)"

    .line 159
    .line 160
    invoke-static {p0}, Ll/mym;->a(Ljava/lang/String;)V

    .line 161
    .line 162
    .line 163
    return-object v1
.end method

.method public rightMultiply(Lorg/spongycastle/pqc/math/linearalgebra/Matrix;)Lorg/spongycastle/pqc/math/linearalgebra/Matrix;
    .locals 14

    .line 1
    instance-of v0, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_8

    .line 5
    .line 6
    iget v0, p1, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    .line 7
    .line 8
    iget v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numColumns:I

    .line 9
    .line 10
    if-ne v0, v2, :cond_7

    .line 11
    .line 12
    move-object v0, p1

    .line 13
    check-cast v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    .line 14
    .line 15
    new-instance v1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    .line 16
    .line 17
    iget v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    .line 18
    .line 19
    iget p1, p1, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numColumns:I

    .line 20
    .line 21
    invoke-direct {v1, v2, p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;-><init>(II)V

    .line 22
    .line 23
    .line 24
    iget p1, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numColumns:I

    .line 25
    .line 26
    and-int/lit8 p1, p1, 0x1f

    .line 27
    .line 28
    iget v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    .line 29
    .line 30
    if-nez p1, :cond_0

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    add-int/lit8 v2, v2, -0x1

    .line 34
    .line 35
    :goto_0
    const/4 v3, 0x0

    .line 36
    move v4, v3

    .line 37
    :goto_1
    iget v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    .line 38
    .line 39
    if-ge v4, v5, :cond_6

    .line 40
    .line 41
    move v5, v3

    .line 42
    move v6, v5

    .line 43
    :goto_2
    iget-object v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 44
    .line 45
    const/4 v8, 0x1

    .line 46
    if-ge v5, v2, :cond_3

    .line 47
    .line 48
    aget-object v7, v7, v4

    .line 49
    .line 50
    aget v7, v7, v5

    .line 51
    .line 52
    move v9, v3

    .line 53
    :goto_3
    const/16 v10, 0x20

    .line 54
    .line 55
    if-ge v9, v10, :cond_2

    .line 56
    .line 57
    shl-int v10, v8, v9

    .line 58
    .line 59
    and-int/2addr v10, v7

    .line 60
    if-eqz v10, :cond_1

    .line 61
    .line 62
    move v10, v3

    .line 63
    :goto_4
    iget v11, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    .line 64
    .line 65
    if-ge v10, v11, :cond_1

    .line 66
    .line 67
    iget-object v11, v1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 68
    .line 69
    aget-object v11, v11, v4

    .line 70
    .line 71
    aget v12, v11, v10

    .line 72
    .line 73
    iget-object v13, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 74
    .line 75
    aget-object v13, v13, v6

    .line 76
    .line 77
    aget v13, v13, v10

    .line 78
    .line 79
    xor-int/2addr v12, v13

    .line 80
    aput v12, v11, v10

    .line 81
    .line 82
    add-int/lit8 v10, v10, 0x1

    .line 83
    .line 84
    goto :goto_4

    .line 85
    :cond_1
    add-int/lit8 v6, v6, 0x1

    .line 86
    .line 87
    add-int/lit8 v9, v9, 0x1

    .line 88
    .line 89
    goto :goto_3

    .line 90
    :cond_2
    add-int/lit8 v5, v5, 0x1

    .line 91
    .line 92
    goto :goto_2

    .line 93
    :cond_3
    aget-object v5, v7, v4

    .line 94
    .line 95
    iget v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    .line 96
    .line 97
    sub-int/2addr v7, v8

    .line 98
    aget v5, v5, v7

    .line 99
    .line 100
    move v7, v3

    .line 101
    :goto_5
    if-ge v7, p1, :cond_5

    .line 102
    .line 103
    shl-int v9, v8, v7

    .line 104
    .line 105
    and-int/2addr v9, v5

    .line 106
    if-eqz v9, :cond_4

    .line 107
    .line 108
    move v9, v3

    .line 109
    :goto_6
    iget v10, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    .line 110
    .line 111
    if-ge v9, v10, :cond_4

    .line 112
    .line 113
    iget-object v10, v1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 114
    .line 115
    aget-object v10, v10, v4

    .line 116
    .line 117
    aget v11, v10, v9

    .line 118
    .line 119
    iget-object v12, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 120
    .line 121
    aget-object v12, v12, v6

    .line 122
    .line 123
    aget v12, v12, v9

    .line 124
    .line 125
    xor-int/2addr v11, v12

    .line 126
    aput v11, v10, v9

    .line 127
    .line 128
    add-int/lit8 v9, v9, 0x1

    .line 129
    .line 130
    goto :goto_6

    .line 131
    :cond_4
    add-int/lit8 v6, v6, 0x1

    .line 132
    .line 133
    add-int/lit8 v7, v7, 0x1

    .line 134
    .line 135
    goto :goto_5

    .line 136
    :cond_5
    add-int/lit8 v4, v4, 0x1

    .line 137
    .line 138
    goto :goto_1

    .line 139
    :cond_6
    return-object v1

    .line 140
    :cond_7
    const-string p0, "length mismatch"

    .line 141
    .line 142
    invoke-static {p0}, Ll/mym;->a(Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    return-object v1

    .line 146
    :cond_8
    const-string p0, "matrix is not defined over GF(2)"

    .line 147
    .line 148
    invoke-static {p0}, Ll/mym;->a(Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    return-object v1
.end method

.method public rightMultiply(Lorg/spongycastle/pqc/math/linearalgebra/Permutation;)Lorg/spongycastle/pqc/math/linearalgebra/Matrix;
    .locals 10

    .line 152
    invoke-virtual {p1}, Lorg/spongycastle/pqc/math/linearalgebra/Permutation;->getVector()[I

    move-result-object p1

    .line 153
    array-length v0, p1

    iget v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numColumns:I

    if-ne v0, v1, :cond_2

    .line 154
    new-instance v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;

    iget v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    invoke-direct {v0, v2, v1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;-><init>(II)V

    .line 155
    iget v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numColumns:I

    add-int/lit8 v1, v1, -0x1

    :goto_0
    if-ltz v1, :cond_1

    ushr-int/lit8 v2, v1, 0x5

    and-int/lit8 v3, v1, 0x1f

    .line 156
    aget v4, p1, v1

    ushr-int/lit8 v5, v4, 0x5

    and-int/lit8 v4, v4, 0x1f

    .line 157
    iget v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    add-int/lit8 v6, v6, -0x1

    :goto_1
    if-ltz v6, :cond_0

    .line 158
    iget-object v7, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v7, v7, v6

    aget v8, v7, v2

    iget-object v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v9, v9, v6

    aget v9, v9, v5

    ushr-int/2addr v9, v4

    and-int/lit8 v9, v9, 0x1

    shl-int/2addr v9, v3

    or-int/2addr v8, v9

    aput v8, v7, v2

    add-int/lit8 v6, v6, -0x1

    goto :goto_1

    :cond_0
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    :cond_1
    return-object v0

    .line 159
    :cond_2
    const-string p0, "length mismatch"

    invoke-static {p0}, Ll/mym;->a(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public rightMultiply(Lorg/spongycastle/pqc/math/linearalgebra/Vector;)Lorg/spongycastle/pqc/math/linearalgebra/Vector;
    .locals 8

    .line 160
    instance-of v0, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;

    const/4 v1, 0x0

    if-eqz v0, :cond_5

    .line 161
    iget v0, p1, Lorg/spongycastle/pqc/math/linearalgebra/Vector;->length:I

    iget v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numColumns:I

    if-ne v0, v2, :cond_4

    .line 162
    check-cast p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;

    invoke-virtual {p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;->getVecArray()[I

    move-result-object p1

    .line 163
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    add-int/lit8 v0, v0, 0x1f

    ushr-int/lit8 v0, v0, 0x5

    new-array v0, v0, [I

    const/4 v1, 0x0

    move v2, v1

    .line 164
    :goto_0
    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    if-ge v2, v3, :cond_3

    move v3, v1

    move v4, v3

    .line 165
    :goto_1
    iget v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    if-ge v3, v5, :cond_0

    .line 166
    iget-object v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    aget-object v5, v5, v2

    aget v5, v5, v3

    aget v6, p1, v3

    and-int/2addr v5, v6

    xor-int/2addr v4, v5

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_0
    move v3, v1

    move v5, v3

    :goto_2
    const/16 v6, 0x20

    const/4 v7, 0x1

    if-ge v3, v6, :cond_1

    ushr-int v6, v4, v3

    and-int/2addr v6, v7

    xor-int/2addr v5, v6

    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    :cond_1
    if-ne v5, v7, :cond_2

    ushr-int/lit8 v3, v2, 0x5

    .line 167
    aget v4, v0, v3

    and-int/lit8 v5, v2, 0x1f

    shl-int v5, v7, v5

    or-int/2addr v4, v5

    aput v4, v0, v3

    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 168
    :cond_3
    new-instance p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;

    invoke-direct {p0, v0, v3}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;-><init>([II)V

    return-object p0

    .line 169
    :cond_4
    const-string p0, "length mismatch"

    invoke-static {p0}, Ll/mym;->a(Ljava/lang/String;)V

    return-object v1

    .line 170
    :cond_5
    const-string p0, "vector is not defined over GF(2)"

    invoke-static {p0}, Ll/mym;->a(Ljava/lang/String;)V

    return-object v1
.end method

.method public rightMultiplyRightCompactForm(Lorg/spongycastle/pqc/math/linearalgebra/Vector;)Lorg/spongycastle/pqc/math/linearalgebra/Vector;
    .locals 14

    .line 1
    instance-of v0, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_8

    .line 5
    .line 6
    iget v0, p1, Lorg/spongycastle/pqc/math/linearalgebra/Vector;->length:I

    .line 7
    .line 8
    iget v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numColumns:I

    .line 9
    .line 10
    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    .line 11
    .line 12
    add-int/2addr v2, v3

    .line 13
    if-ne v0, v2, :cond_7

    .line 14
    .line 15
    check-cast p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;

    .line 16
    .line 17
    invoke-virtual {p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;->getVecArray()[I

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    .line 22
    .line 23
    add-int/lit8 v1, v0, 0x1f

    .line 24
    .line 25
    ushr-int/lit8 v1, v1, 0x5

    .line 26
    .line 27
    new-array v1, v1, [I

    .line 28
    .line 29
    shr-int/lit8 v2, v0, 0x5

    .line 30
    .line 31
    and-int/lit8 v0, v0, 0x1f

    .line 32
    .line 33
    const/4 v3, 0x0

    .line 34
    move v4, v3

    .line 35
    :goto_0
    iget v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    .line 36
    .line 37
    if-ge v4, v5, :cond_6

    .line 38
    .line 39
    shr-int/lit8 v5, v4, 0x5

    .line 40
    .line 41
    aget v6, p1, v5

    .line 42
    .line 43
    and-int/lit8 v7, v4, 0x1f

    .line 44
    .line 45
    ushr-int/2addr v6, v7

    .line 46
    const/4 v8, 0x1

    .line 47
    and-int/2addr v6, v8

    .line 48
    if-eqz v0, :cond_2

    .line 49
    .line 50
    move v10, v2

    .line 51
    move v9, v3

    .line 52
    :goto_1
    iget v11, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    .line 53
    .line 54
    add-int/lit8 v12, v11, -0x1

    .line 55
    .line 56
    if-ge v9, v12, :cond_0

    .line 57
    .line 58
    add-int/lit8 v11, v10, 0x1

    .line 59
    .line 60
    aget v10, p1, v10

    .line 61
    .line 62
    ushr-int/2addr v10, v0

    .line 63
    aget v12, p1, v11

    .line 64
    .line 65
    rsub-int/lit8 v13, v0, 0x20

    .line 66
    .line 67
    shl-int/2addr v12, v13

    .line 68
    or-int/2addr v10, v12

    .line 69
    iget-object v12, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 70
    .line 71
    aget-object v12, v12, v4

    .line 72
    .line 73
    aget v12, v12, v9

    .line 74
    .line 75
    and-int/2addr v10, v12

    .line 76
    xor-int/2addr v6, v10

    .line 77
    add-int/lit8 v9, v9, 0x1

    .line 78
    .line 79
    move v10, v11

    .line 80
    goto :goto_1

    .line 81
    :cond_0
    add-int/lit8 v9, v10, 0x1

    .line 82
    .line 83
    aget v10, p1, v10

    .line 84
    .line 85
    ushr-int/2addr v10, v0

    .line 86
    array-length v12, p1

    .line 87
    if-ge v9, v12, :cond_1

    .line 88
    .line 89
    aget v9, p1, v9

    .line 90
    .line 91
    rsub-int/lit8 v12, v0, 0x20

    .line 92
    .line 93
    shl-int/2addr v9, v12

    .line 94
    or-int/2addr v10, v9

    .line 95
    :cond_1
    iget-object v9, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 96
    .line 97
    aget-object v9, v9, v4

    .line 98
    .line 99
    add-int/lit8 v11, v11, -0x1

    .line 100
    .line 101
    aget v9, v9, v11

    .line 102
    .line 103
    and-int/2addr v9, v10

    .line 104
    xor-int/2addr v6, v9

    .line 105
    goto :goto_3

    .line 106
    :cond_2
    move v10, v2

    .line 107
    move v9, v3

    .line 108
    :goto_2
    iget v11, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    .line 109
    .line 110
    if-ge v9, v11, :cond_3

    .line 111
    .line 112
    iget-object v11, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 113
    .line 114
    aget-object v11, v11, v4

    .line 115
    .line 116
    aget v11, v11, v9

    .line 117
    .line 118
    add-int/lit8 v12, v10, 0x1

    .line 119
    .line 120
    aget v10, p1, v10

    .line 121
    .line 122
    and-int/2addr v10, v11

    .line 123
    xor-int/2addr v6, v10

    .line 124
    add-int/lit8 v9, v9, 0x1

    .line 125
    .line 126
    move v10, v12

    .line 127
    goto :goto_2

    .line 128
    :cond_3
    :goto_3
    move v9, v3

    .line 129
    move v10, v9

    .line 130
    :goto_4
    const/16 v11, 0x20

    .line 131
    .line 132
    if-ge v9, v11, :cond_4

    .line 133
    .line 134
    and-int/lit8 v11, v6, 0x1

    .line 135
    .line 136
    xor-int/2addr v10, v11

    .line 137
    ushr-int/2addr v6, v8

    .line 138
    add-int/lit8 v9, v9, 0x1

    .line 139
    .line 140
    goto :goto_4

    .line 141
    :cond_4
    if-ne v10, v8, :cond_5

    .line 142
    .line 143
    aget v6, v1, v5

    .line 144
    .line 145
    shl-int v7, v8, v7

    .line 146
    .line 147
    or-int/2addr v6, v7

    .line 148
    aput v6, v1, v5

    .line 149
    .line 150
    :cond_5
    add-int/lit8 v4, v4, 0x1

    .line 151
    .line 152
    goto :goto_0

    .line 153
    :cond_6
    new-instance p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;

    .line 154
    .line 155
    invoke-direct {p0, v1, v5}, Lorg/spongycastle/pqc/math/linearalgebra/GF2Vector;-><init>([II)V

    .line 156
    .line 157
    .line 158
    return-object p0

    .line 159
    :cond_7
    const-string p0, "length mismatch"

    .line 160
    .line 161
    invoke-static {p0}, Ll/mym;->a(Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    return-object v1

    .line 165
    :cond_8
    const-string p0, "vector is not defined over GF(2)"

    .line 166
    .line 167
    invoke-static {p0}, Ll/mym;->a(Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    return-object v1
.end method

.method public toString()Ljava/lang/String;
    .locals 11

    .line 1
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numColumns:I

    .line 2
    .line 3
    and-int/lit8 v0, v0, 0x1f

    .line 4
    .line 5
    iget v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    add-int/lit8 v1, v1, -0x1

    .line 11
    .line 12
    :goto_0
    new-instance v2, Ljava/lang/StringBuffer;

    .line 13
    .line 14
    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 15
    .line 16
    .line 17
    const/4 v3, 0x0

    .line 18
    move v4, v3

    .line 19
    :goto_1
    iget v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/Matrix;->numRows:I

    .line 20
    .line 21
    if-ge v4, v5, :cond_6

    .line 22
    .line 23
    new-instance v5, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v6, ": "

    .line 32
    .line 33
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v5

    .line 40
    invoke-virtual {v2, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 41
    .line 42
    .line 43
    move v5, v3

    .line 44
    :goto_2
    iget-object v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->matrix:[[I

    .line 45
    .line 46
    const/16 v7, 0x31

    .line 47
    .line 48
    const/16 v8, 0x30

    .line 49
    .line 50
    if-ge v5, v1, :cond_3

    .line 51
    .line 52
    aget-object v6, v6, v4

    .line 53
    .line 54
    aget v6, v6, v5

    .line 55
    .line 56
    move v9, v3

    .line 57
    :goto_3
    const/16 v10, 0x20

    .line 58
    .line 59
    if-ge v9, v10, :cond_2

    .line 60
    .line 61
    ushr-int v10, v6, v9

    .line 62
    .line 63
    and-int/lit8 v10, v10, 0x1

    .line 64
    .line 65
    if-nez v10, :cond_1

    .line 66
    .line 67
    invoke-virtual {v2, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 68
    .line 69
    .line 70
    goto :goto_4

    .line 71
    :cond_1
    invoke-virtual {v2, v7}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 72
    .line 73
    .line 74
    :goto_4
    add-int/lit8 v9, v9, 0x1

    .line 75
    .line 76
    goto :goto_3

    .line 77
    :cond_2
    invoke-virtual {v2, v10}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 78
    .line 79
    .line 80
    add-int/lit8 v5, v5, 0x1

    .line 81
    .line 82
    goto :goto_2

    .line 83
    :cond_3
    aget-object v5, v6, v4

    .line 84
    .line 85
    iget v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2Matrix;->length:I

    .line 86
    .line 87
    add-int/lit8 v6, v6, -0x1

    .line 88
    .line 89
    aget v5, v5, v6

    .line 90
    .line 91
    move v6, v3

    .line 92
    :goto_5
    if-ge v6, v0, :cond_5

    .line 93
    .line 94
    ushr-int v9, v5, v6

    .line 95
    .line 96
    and-int/lit8 v9, v9, 0x1

    .line 97
    .line 98
    if-nez v9, :cond_4

    .line 99
    .line 100
    invoke-virtual {v2, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 101
    .line 102
    .line 103
    goto :goto_6

    .line 104
    :cond_4
    invoke-virtual {v2, v7}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 105
    .line 106
    .line 107
    :goto_6
    add-int/lit8 v6, v6, 0x1

    .line 108
    .line 109
    goto :goto_5

    .line 110
    :cond_5
    const/16 v5, 0xa

    .line 111
    .line 112
    invoke-virtual {v2, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 113
    .line 114
    .line 115
    add-int/lit8 v4, v4, 0x1

    .line 116
    .line 117
    goto :goto_1

    .line 118
    :cond_6
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    return-object p0
.end method
