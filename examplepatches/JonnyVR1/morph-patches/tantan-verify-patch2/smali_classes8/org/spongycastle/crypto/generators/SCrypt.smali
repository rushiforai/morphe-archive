.class public Lorg/spongycastle/crypto/generators/SCrypt;
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

.method private static BlockMix([I[I[I[II)V
    .locals 6

    .line 1
    array-length v0, p0

    .line 2
    const/16 v1, 0x10

    .line 3
    .line 4
    sub-int/2addr v0, v1

    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-static {p0, v0, p1, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 7
    .line 8
    .line 9
    array-length v0, p0

    .line 10
    ushr-int/lit8 v0, v0, 0x1

    .line 11
    .line 12
    mul-int/lit8 p4, p4, 0x2

    .line 13
    .line 14
    move v3, v2

    .line 15
    move v4, v3

    .line 16
    :goto_0
    if-lez p4, :cond_0

    .line 17
    .line 18
    invoke-static {p1, p0, v3, p2}, Lorg/spongycastle/crypto/generators/SCrypt;->Xor([I[II[I)V

    .line 19
    .line 20
    .line 21
    const/16 v5, 0x8

    .line 22
    .line 23
    invoke-static {v5, p2, p1}, Lorg/spongycastle/crypto/engines/Salsa20Engine;->salsaCore(I[I[I)V

    .line 24
    .line 25
    .line 26
    invoke-static {p1, v2, p3, v4, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 27
    .line 28
    .line 29
    add-int v5, v0, v3

    .line 30
    .line 31
    sub-int v4, v5, v4

    .line 32
    .line 33
    add-int/2addr v3, v1

    .line 34
    add-int/lit8 p4, p4, -0x1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    array-length p1, p3

    .line 38
    invoke-static {p3, v2, p0, v2, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method private static Clear([B)V
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Lorg/spongycastle/util/Arrays;->fill([BB)V

    .line 5
    .line 6
    .line 7
    :cond_0
    return-void
.end method

.method private static Clear([I)V
    .locals 1

    if-eqz p0, :cond_0

    const/4 v0, 0x0

    .line 8
    invoke-static {p0, v0}, Lorg/spongycastle/util/Arrays;->fill([II)V

    :cond_0
    return-void
.end method

.method private static ClearAll([[I)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    array-length v1, p0

    .line 3
    if-ge v0, v1, :cond_0

    .line 4
    .line 5
    aget-object v1, p0, v0

    .line 6
    .line 7
    invoke-static {v1}, Lorg/spongycastle/crypto/generators/SCrypt;->Clear([I)V

    .line 8
    .line 9
    .line 10
    add-int/lit8 v0, v0, 0x1

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    return-void
.end method

.method private static MFcrypt([B[BIIII)[B
    .locals 4

    .line 1
    mul-int/lit16 v0, p3, 0x80

    .line 2
    .line 3
    mul-int/2addr p4, v0

    .line 4
    invoke-static {p0, p1, p4}, Lorg/spongycastle/crypto/generators/SCrypt;->SingleIterationPBKDF2([B[BI)[B

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    const/4 p4, 0x0

    .line 9
    :try_start_0
    array-length v1, p1

    .line 10
    ushr-int/lit8 v1, v1, 0x2

    .line 11
    .line 12
    new-array p4, v1, [I

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    invoke-static {p1, v2, p4}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI[I)V

    .line 16
    .line 17
    .line 18
    ushr-int/lit8 v0, v0, 0x2

    .line 19
    .line 20
    move v3, v2

    .line 21
    :goto_0
    if-ge v3, v1, :cond_0

    .line 22
    .line 23
    invoke-static {p4, v3, p2, p3}, Lorg/spongycastle/crypto/generators/SCrypt;->SMix([IIII)V

    .line 24
    .line 25
    .line 26
    add-int/2addr v3, v0

    .line 27
    goto :goto_0

    .line 28
    :catchall_0
    move-exception p0

    .line 29
    goto :goto_1

    .line 30
    :cond_0
    invoke-static {p4, p1, v2}, Lorg/spongycastle/util/Pack;->intToLittleEndian([I[BI)V

    .line 31
    .line 32
    .line 33
    invoke-static {p0, p1, p5}, Lorg/spongycastle/crypto/generators/SCrypt;->SingleIterationPBKDF2([B[BI)[B

    .line 34
    .line 35
    .line 36
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 37
    invoke-static {p1}, Lorg/spongycastle/crypto/generators/SCrypt;->Clear([B)V

    .line 38
    .line 39
    .line 40
    invoke-static {p4}, Lorg/spongycastle/crypto/generators/SCrypt;->Clear([I)V

    .line 41
    .line 42
    .line 43
    return-object p0

    .line 44
    :goto_1
    invoke-static {p1}, Lorg/spongycastle/crypto/generators/SCrypt;->Clear([B)V

    .line 45
    .line 46
    .line 47
    invoke-static {p4}, Lorg/spongycastle/crypto/generators/SCrypt;->Clear([I)V

    .line 48
    .line 49
    .line 50
    throw p0
.end method

.method private static SMix([IIII)V
    .locals 10

    .line 1
    mul-int/lit8 v0, p3, 0x20

    .line 2
    .line 3
    const/16 v1, 0x10

    .line 4
    .line 5
    new-array v2, v1, [I

    .line 6
    .line 7
    new-array v1, v1, [I

    .line 8
    .line 9
    new-array v3, v0, [I

    .line 10
    .line 11
    new-array v4, v0, [I

    .line 12
    .line 13
    new-array v5, p2, [[I

    .line 14
    .line 15
    const/4 v6, 0x0

    .line 16
    :try_start_0
    invoke-static {p0, p1, v4, v6, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 17
    .line 18
    .line 19
    move v7, v6

    .line 20
    :goto_0
    if-ge v7, p2, :cond_0

    .line 21
    .line 22
    invoke-static {v4}, Lorg/spongycastle/util/Arrays;->clone([I)[I

    .line 23
    .line 24
    .line 25
    move-result-object v8

    .line 26
    aput-object v8, v5, v7

    .line 27
    .line 28
    invoke-static {v4, v2, v1, v3, p3}, Lorg/spongycastle/crypto/generators/SCrypt;->BlockMix([I[I[I[II)V

    .line 29
    .line 30
    .line 31
    add-int/lit8 v7, v7, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :catchall_0
    move-exception p0

    .line 35
    goto :goto_2

    .line 36
    :cond_0
    add-int/lit8 v7, p2, -0x1

    .line 37
    .line 38
    move v8, v6

    .line 39
    :goto_1
    if-ge v8, p2, :cond_1

    .line 40
    .line 41
    add-int/lit8 v9, v0, -0x10

    .line 42
    .line 43
    aget v9, v4, v9

    .line 44
    .line 45
    and-int/2addr v9, v7

    .line 46
    aget-object v9, v5, v9

    .line 47
    .line 48
    invoke-static {v4, v9, v6, v4}, Lorg/spongycastle/crypto/generators/SCrypt;->Xor([I[II[I)V

    .line 49
    .line 50
    .line 51
    invoke-static {v4, v2, v1, v3, p3}, Lorg/spongycastle/crypto/generators/SCrypt;->BlockMix([I[I[I[II)V

    .line 52
    .line 53
    .line 54
    add-int/lit8 v8, v8, 0x1

    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_1
    invoke-static {v4, v6, p0, p1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 58
    .line 59
    .line 60
    invoke-static {v5}, Lorg/spongycastle/crypto/generators/SCrypt;->ClearAll([[I)V

    .line 61
    .line 62
    .line 63
    filled-new-array {v4, v2, v1, v3}, [[I

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-static {p0}, Lorg/spongycastle/crypto/generators/SCrypt;->ClearAll([[I)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :goto_2
    invoke-static {v5}, Lorg/spongycastle/crypto/generators/SCrypt;->ClearAll([[I)V

    .line 72
    .line 73
    .line 74
    filled-new-array {v4, v2, v1, v3}, [[I

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-static {p1}, Lorg/spongycastle/crypto/generators/SCrypt;->ClearAll([[I)V

    .line 79
    .line 80
    .line 81
    throw p0
.end method

.method private static SingleIterationPBKDF2([B[BI)[B
    .locals 2

    .line 1
    new-instance v0, Lorg/spongycastle/crypto/generators/PKCS5S2ParametersGenerator;

    .line 2
    .line 3
    new-instance v1, Lorg/spongycastle/crypto/digests/SHA256Digest;

    .line 4
    .line 5
    invoke-direct {v1}, Lorg/spongycastle/crypto/digests/SHA256Digest;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/generators/PKCS5S2ParametersGenerator;-><init>(Lorg/spongycastle/crypto/Digest;)V

    .line 9
    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-virtual {v0, p0, p1, v1}, Lorg/spongycastle/crypto/PBEParametersGenerator;->init([B[BI)V

    .line 13
    .line 14
    .line 15
    mul-int/lit8 p2, p2, 0x8

    .line 16
    .line 17
    invoke-virtual {v0, p2}, Lorg/spongycastle/crypto/PBEParametersGenerator;->generateDerivedMacParameters(I)Lorg/spongycastle/crypto/CipherParameters;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 22
    .line 23
    invoke-virtual {p0}, Lorg/spongycastle/crypto/params/KeyParameter;->getKey()[B

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method private static Xor([I[II[I)V
    .locals 3

    .line 1
    array-length v0, p3

    .line 2
    add-int/lit8 v0, v0, -0x1

    .line 3
    .line 4
    :goto_0
    if-ltz v0, :cond_0

    .line 5
    .line 6
    aget v1, p0, v0

    .line 7
    .line 8
    add-int v2, p2, v0

    .line 9
    .line 10
    aget v2, p1, v2

    .line 11
    .line 12
    xor-int/2addr v1, v2

    .line 13
    aput v1, p3, v0

    .line 14
    .line 15
    add-int/lit8 v0, v0, -0x1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    return-void
.end method

.method public static generate([B[BIIII)[B
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_7

    .line 3
    .line 4
    if-eqz p1, :cond_6

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    if-le p2, v1, :cond_5

    .line 8
    .line 9
    if-ne p3, v1, :cond_1

    .line 10
    .line 11
    const/high16 v2, 0x10000

    .line 12
    .line 13
    if-gt p2, v2, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const-string p0, "Cost parameter N must be > 1 and < 65536."

    .line 17
    .line 18
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-object v0

    .line 22
    :cond_1
    :goto_0
    if-lt p3, v1, :cond_4

    .line 23
    .line 24
    mul-int/lit16 v2, p3, 0x400

    .line 25
    .line 26
    const v3, 0x7fffffff

    .line 27
    .line 28
    .line 29
    div-int/2addr v3, v2

    .line 30
    if-lt p4, v1, :cond_3

    .line 31
    .line 32
    if-gt p4, v3, :cond_3

    .line 33
    .line 34
    if-lt p5, v1, :cond_2

    .line 35
    .line 36
    invoke-static/range {p0 .. p5}, Lorg/spongycastle/crypto/generators/SCrypt;->MFcrypt([B[BIIII)[B

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0

    .line 41
    :cond_2
    const-string p0, "Generated key length dkLen must be >= 1."

    .line 42
    .line 43
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    return-object v0

    .line 47
    :cond_3
    const-string p0, " (based on block size r of "

    .line 48
    .line 49
    const-string p1, ")"

    .line 50
    .line 51
    const-string p2, "Parallelisation parameter p must be >= 1 and <= "

    .line 52
    .line 53
    invoke-static {p2, v3, p0, p3, p1}, Ll/vsd0;->a(Ljava/lang/String;ILjava/lang/Object;ILjava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    return-object v0

    .line 57
    :cond_4
    const-string p0, "Block size r must be >= 1."

    .line 58
    .line 59
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    return-object v0

    .line 63
    :cond_5
    const-string p0, "Cost parameter N must be > 1."

    .line 64
    .line 65
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    return-object v0

    .line 69
    :cond_6
    const-string p0, "Salt S must be provided."

    .line 70
    .line 71
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    return-object v0

    .line 75
    :cond_7
    const-string p0, "Passphrase P must be provided."

    .line 76
    .line 77
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    return-object v0
.end method
