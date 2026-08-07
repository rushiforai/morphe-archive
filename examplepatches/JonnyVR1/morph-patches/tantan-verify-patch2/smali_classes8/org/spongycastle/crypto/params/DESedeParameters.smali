.class public Lorg/spongycastle/crypto/params/DESedeParameters;
.super Lorg/spongycastle/crypto/params/DESParameters;
.source "SourceFile"


# static fields
.field public static final DES_EDE_KEY_LENGTH:I = 0x18


# direct methods
.method public constructor <init>([B)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/params/DESParameters;-><init>([B)V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    array-length v0, p1

    .line 6
    invoke-static {p1, p0, v0}, Lorg/spongycastle/crypto/params/DESedeParameters;->isWeakKey([BII)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    if-nez p0, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    const-string p0, "attempt to create weak DESede key"

    .line 14
    .line 15
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    throw p0
.end method

.method public static isReal2Key([BI)Z
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, p1

    .line 3
    :goto_0
    add-int/lit8 v2, p1, 0x8

    .line 4
    .line 5
    if-eq v1, v2, :cond_1

    .line 6
    .line 7
    aget-byte v2, p0, v1

    .line 8
    .line 9
    add-int/lit8 v3, v1, 0x8

    .line 10
    .line 11
    aget-byte v3, p0, v3

    .line 12
    .line 13
    if-eq v2, v3, :cond_0

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    return v0
.end method

.method public static isReal3Key([BI)Z
    .locals 9

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, p1

    .line 3
    move v2, v0

    .line 4
    move v3, v2

    .line 5
    move v4, v3

    .line 6
    :goto_0
    add-int/lit8 v5, p1, 0x8

    .line 7
    .line 8
    const/4 v6, 0x1

    .line 9
    if-eq v1, v5, :cond_3

    .line 10
    .line 11
    aget-byte v5, p0, v1

    .line 12
    .line 13
    add-int/lit8 v7, v1, 0x8

    .line 14
    .line 15
    aget-byte v7, p0, v7

    .line 16
    .line 17
    if-eq v5, v7, :cond_0

    .line 18
    .line 19
    move v8, v6

    .line 20
    goto :goto_1

    .line 21
    :cond_0
    move v8, v0

    .line 22
    :goto_1
    or-int/2addr v2, v8

    .line 23
    add-int/lit8 v8, v1, 0x10

    .line 24
    .line 25
    aget-byte v8, p0, v8

    .line 26
    .line 27
    if-eq v5, v8, :cond_1

    .line 28
    .line 29
    move v5, v6

    .line 30
    goto :goto_2

    .line 31
    :cond_1
    move v5, v0

    .line 32
    :goto_2
    or-int/2addr v3, v5

    .line 33
    if-eq v7, v8, :cond_2

    .line 34
    .line 35
    goto :goto_3

    .line 36
    :cond_2
    move v6, v0

    .line 37
    :goto_3
    or-int/2addr v4, v6

    .line 38
    add-int/lit8 v1, v1, 0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_3
    if-eqz v2, :cond_4

    .line 42
    .line 43
    if-eqz v3, :cond_4

    .line 44
    .line 45
    if-eqz v4, :cond_4

    .line 46
    .line 47
    return v6

    .line 48
    :cond_4
    return v0
.end method

.method public static isRealEDEKey([BI)Z
    .locals 2

    .line 1
    array-length v0, p0

    .line 2
    const/16 v1, 0x10

    .line 3
    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    invoke-static {p0, p1}, Lorg/spongycastle/crypto/params/DESedeParameters;->isReal2Key([BI)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0

    .line 11
    :cond_0
    invoke-static {p0, p1}, Lorg/spongycastle/crypto/params/DESedeParameters;->isReal3Key([BI)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public static isWeakKey([BI)Z
    .locals 1

    .line 16
    array-length v0, p0

    sub-int/2addr v0, p1

    invoke-static {p0, p1, v0}, Lorg/spongycastle/crypto/params/DESedeParameters;->isWeakKey([BII)Z

    move-result p0

    return p0
.end method

.method public static isWeakKey([BII)Z
    .locals 1

    .line 1
    :goto_0
    if-ge p1, p2, :cond_1

    .line 2
    .line 3
    invoke-static {p0, p1}, Lorg/spongycastle/crypto/params/DESParameters;->isWeakKey([BI)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    add-int/lit8 p1, p1, 0x8

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_1
    const/4 p0, 0x0

    .line 15
    return p0
.end method
