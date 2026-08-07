.class public abstract Lorg/spongycastle/math/raw/Nat;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final M:J = 0xffffffffL


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

.method public static add(I[I[I[I)I
    .locals 9

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    const/4 v2, 0x0

    .line 4
    :goto_0
    if-ge v2, p0, :cond_0

    .line 5
    .line 6
    aget v3, p1, v2

    .line 7
    .line 8
    int-to-long v3, v3

    .line 9
    const-wide v5, 0xffffffffL

    .line 10
    .line 11
    .line 12
    .line 13
    .line 14
    and-long/2addr v3, v5

    .line 15
    aget v7, p2, v2

    .line 16
    .line 17
    int-to-long v7, v7

    .line 18
    and-long/2addr v5, v7

    .line 19
    add-long/2addr v3, v5

    .line 20
    add-long/2addr v0, v3

    .line 21
    long-to-int v3, v0

    .line 22
    aput v3, p3, v2

    .line 23
    .line 24
    const/16 v3, 0x20

    .line 25
    .line 26
    ushr-long/2addr v0, v3

    .line 27
    add-int/lit8 v2, v2, 0x1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    long-to-int p0, v0

    .line 31
    return p0
.end method

.method public static add33At(II[II)I
    .locals 7

    .line 51
    aget v0, p2, p3

    int-to-long v0, v0

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    int-to-long v4, p1

    and-long/2addr v4, v2

    add-long/2addr v0, v4

    long-to-int p1, v0

    .line 52
    aput p1, p2, p3

    const/16 p1, 0x20

    ushr-long/2addr v0, p1

    add-int/lit8 v4, p3, 0x1

    .line 53
    aget v5, p2, v4

    int-to-long v5, v5

    and-long/2addr v2, v5

    const-wide/16 v5, 0x1

    add-long/2addr v2, v5

    add-long/2addr v0, v2

    long-to-int v2, v0

    .line 54
    aput v2, p2, v4

    ushr-long/2addr v0, p1

    const-wide/16 v2, 0x0

    cmp-long p1, v0, v2

    if-nez p1, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    add-int/lit8 p3, p3, 0x2

    .line 55
    invoke-static {p0, p2, p3}, Lorg/spongycastle/math/raw/Nat;->incAt(I[II)I

    move-result p0

    return p0
.end method

.method public static add33At(II[III)I
    .locals 7

    .line 1
    add-int v0, p3, p4

    .line 2
    .line 3
    aget v1, p2, v0

    .line 4
    .line 5
    int-to-long v1, v1

    .line 6
    const-wide v3, 0xffffffffL

    .line 7
    .line 8
    .line 9
    .line 10
    .line 11
    and-long/2addr v1, v3

    .line 12
    int-to-long v5, p1

    .line 13
    and-long/2addr v5, v3

    .line 14
    add-long/2addr v1, v5

    .line 15
    long-to-int p1, v1

    .line 16
    aput p1, p2, v0

    .line 17
    .line 18
    const/16 p1, 0x20

    .line 19
    .line 20
    ushr-long/2addr v1, p1

    .line 21
    add-int/lit8 v0, v0, 0x1

    .line 22
    .line 23
    aget v5, p2, v0

    .line 24
    .line 25
    int-to-long v5, v5

    .line 26
    and-long/2addr v3, v5

    .line 27
    const-wide/16 v5, 0x1

    .line 28
    .line 29
    add-long/2addr v3, v5

    .line 30
    add-long/2addr v1, v3

    .line 31
    long-to-int v3, v1

    .line 32
    aput v3, p2, v0

    .line 33
    .line 34
    ushr-long v0, v1, p1

    .line 35
    .line 36
    const-wide/16 v2, 0x0

    .line 37
    .line 38
    cmp-long p1, v0, v2

    .line 39
    .line 40
    if-nez p1, :cond_0

    .line 41
    .line 42
    const/4 p0, 0x0

    .line 43
    return p0

    .line 44
    :cond_0
    add-int/lit8 p4, p4, 0x2

    .line 45
    .line 46
    invoke-static {p0, p2, p3, p4}, Lorg/spongycastle/math/raw/Nat;->incAt(I[III)I

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    return p0
.end method

.method public static add33To(II[I)I
    .locals 8

    const/4 v0, 0x0

    .line 47
    aget v1, p2, v0

    int-to-long v1, v1

    const-wide v3, 0xffffffffL

    and-long/2addr v1, v3

    int-to-long v5, p1

    and-long/2addr v5, v3

    add-long/2addr v1, v5

    long-to-int p1, v1

    .line 48
    aput p1, p2, v0

    const/16 p1, 0x20

    ushr-long/2addr v1, p1

    const/4 v5, 0x1

    .line 49
    aget v6, p2, v5

    int-to-long v6, v6

    and-long/2addr v3, v6

    const-wide/16 v6, 0x1

    add-long/2addr v3, v6

    add-long/2addr v1, v3

    long-to-int v3, v1

    .line 50
    aput v3, p2, v5

    ushr-long/2addr v1, p1

    const-wide/16 v3, 0x0

    cmp-long p1, v1, v3

    if-nez p1, :cond_0

    return v0

    :cond_0
    const/4 p1, 0x2

    .line 51
    invoke-static {p0, p2, p1}, Lorg/spongycastle/math/raw/Nat;->incAt(I[II)I

    move-result p0

    return p0
.end method

.method public static add33To(II[II)I
    .locals 7

    .line 1
    aget v0, p2, p3

    .line 2
    .line 3
    int-to-long v0, v0

    .line 4
    const-wide v2, 0xffffffffL

    .line 5
    .line 6
    .line 7
    .line 8
    .line 9
    and-long/2addr v0, v2

    .line 10
    int-to-long v4, p1

    .line 11
    and-long/2addr v4, v2

    .line 12
    add-long/2addr v0, v4

    .line 13
    long-to-int p1, v0

    .line 14
    aput p1, p2, p3

    .line 15
    .line 16
    const/16 p1, 0x20

    .line 17
    .line 18
    ushr-long/2addr v0, p1

    .line 19
    add-int/lit8 v4, p3, 0x1

    .line 20
    .line 21
    aget v5, p2, v4

    .line 22
    .line 23
    int-to-long v5, v5

    .line 24
    and-long/2addr v2, v5

    .line 25
    const-wide/16 v5, 0x1

    .line 26
    .line 27
    add-long/2addr v2, v5

    .line 28
    add-long/2addr v0, v2

    .line 29
    long-to-int v2, v0

    .line 30
    aput v2, p2, v4

    .line 31
    .line 32
    ushr-long/2addr v0, p1

    .line 33
    const-wide/16 v2, 0x0

    .line 34
    .line 35
    cmp-long p1, v0, v2

    .line 36
    .line 37
    if-nez p1, :cond_0

    .line 38
    .line 39
    const/4 p0, 0x0

    .line 40
    return p0

    .line 41
    :cond_0
    const/4 p1, 0x2

    .line 42
    invoke-static {p0, p2, p3, p1}, Lorg/spongycastle/math/raw/Nat;->incAt(I[III)I

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    return p0
.end method

.method public static addBothTo(I[II[II[II)I
    .locals 10

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    const/4 v2, 0x0

    .line 4
    :goto_0
    if-ge v2, p0, :cond_0

    .line 5
    .line 6
    add-int v3, p2, v2

    .line 7
    .line 8
    aget v3, p1, v3

    .line 9
    .line 10
    int-to-long v3, v3

    .line 11
    const-wide v5, 0xffffffffL

    .line 12
    .line 13
    .line 14
    .line 15
    .line 16
    and-long/2addr v3, v5

    .line 17
    add-int v7, p4, v2

    .line 18
    .line 19
    aget v7, p3, v7

    .line 20
    .line 21
    int-to-long v7, v7

    .line 22
    and-long/2addr v7, v5

    .line 23
    add-long/2addr v3, v7

    .line 24
    add-int v7, p6, v2

    .line 25
    .line 26
    aget v8, p5, v7

    .line 27
    .line 28
    int-to-long v8, v8

    .line 29
    and-long/2addr v5, v8

    .line 30
    add-long/2addr v3, v5

    .line 31
    add-long/2addr v0, v3

    .line 32
    long-to-int v3, v0

    .line 33
    aput v3, p5, v7

    .line 34
    .line 35
    const/16 v3, 0x20

    .line 36
    .line 37
    ushr-long/2addr v0, v3

    .line 38
    add-int/lit8 v2, v2, 0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    long-to-int p0, v0

    .line 42
    return p0
.end method

.method public static addBothTo(I[I[I[I)I
    .locals 9

    const-wide/16 v0, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, p0, :cond_0

    .line 43
    aget v3, p1, v2

    int-to-long v3, v3

    const-wide v5, 0xffffffffL

    and-long/2addr v3, v5

    aget v7, p2, v2

    int-to-long v7, v7

    and-long/2addr v7, v5

    add-long/2addr v3, v7

    aget v7, p3, v2

    int-to-long v7, v7

    and-long/2addr v5, v7

    add-long/2addr v3, v5

    add-long/2addr v0, v3

    long-to-int v3, v0

    .line 44
    aput v3, p3, v2

    const/16 v3, 0x20

    ushr-long/2addr v0, v3

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    long-to-int p0, v0

    return p0
.end method

.method public static addDWordAt(IJ[II)I
    .locals 8

    .line 50
    aget v0, p3, p4

    int-to-long v0, v0

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    and-long v4, p1, v2

    add-long/2addr v0, v4

    long-to-int v4, v0

    .line 51
    aput v4, p3, p4

    const/16 v4, 0x20

    ushr-long/2addr v0, v4

    add-int/lit8 v5, p4, 0x1

    .line 52
    aget v6, p3, v5

    int-to-long v6, v6

    and-long/2addr v2, v6

    ushr-long/2addr p1, v4

    add-long/2addr v2, p1

    add-long/2addr v0, v2

    long-to-int p1, v0

    .line 53
    aput p1, p3, v5

    ushr-long p1, v0, v4

    const-wide/16 v0, 0x0

    cmp-long p1, p1, v0

    if-nez p1, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    add-int/lit8 p4, p4, 0x2

    .line 54
    invoke-static {p0, p3, p4}, Lorg/spongycastle/math/raw/Nat;->incAt(I[II)I

    move-result p0

    return p0
.end method

.method public static addDWordAt(IJ[III)I
    .locals 8

    .line 1
    add-int v0, p4, p5

    .line 2
    .line 3
    aget v1, p3, v0

    .line 4
    .line 5
    int-to-long v1, v1

    .line 6
    const-wide v3, 0xffffffffL

    .line 7
    .line 8
    .line 9
    .line 10
    .line 11
    and-long/2addr v1, v3

    .line 12
    and-long v5, p1, v3

    .line 13
    .line 14
    add-long/2addr v1, v5

    .line 15
    long-to-int v5, v1

    .line 16
    aput v5, p3, v0

    .line 17
    .line 18
    const/16 v5, 0x20

    .line 19
    .line 20
    ushr-long/2addr v1, v5

    .line 21
    add-int/lit8 v0, v0, 0x1

    .line 22
    .line 23
    aget v6, p3, v0

    .line 24
    .line 25
    int-to-long v6, v6

    .line 26
    and-long/2addr v3, v6

    .line 27
    ushr-long/2addr p1, v5

    .line 28
    add-long/2addr v3, p1

    .line 29
    add-long/2addr v1, v3

    .line 30
    long-to-int p1, v1

    .line 31
    aput p1, p3, v0

    .line 32
    .line 33
    ushr-long p1, v1, v5

    .line 34
    .line 35
    const-wide/16 v0, 0x0

    .line 36
    .line 37
    cmp-long p1, p1, v0

    .line 38
    .line 39
    if-nez p1, :cond_0

    .line 40
    .line 41
    const/4 p0, 0x0

    .line 42
    return p0

    .line 43
    :cond_0
    add-int/lit8 p5, p5, 0x2

    .line 44
    .line 45
    invoke-static {p0, p3, p4, p5}, Lorg/spongycastle/math/raw/Nat;->incAt(I[III)I

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    return p0
.end method

.method public static addDWordTo(IJ[I)I
    .locals 9

    const/4 v0, 0x0

    .line 47
    aget v1, p3, v0

    int-to-long v1, v1

    const-wide v3, 0xffffffffL

    and-long/2addr v1, v3

    and-long v5, p1, v3

    add-long/2addr v1, v5

    long-to-int v5, v1

    .line 48
    aput v5, p3, v0

    const/16 v5, 0x20

    ushr-long/2addr v1, v5

    const/4 v6, 0x1

    .line 49
    aget v7, p3, v6

    int-to-long v7, v7

    and-long/2addr v3, v7

    ushr-long/2addr p1, v5

    add-long/2addr v3, p1

    add-long/2addr v1, v3

    long-to-int p1, v1

    .line 50
    aput p1, p3, v6

    ushr-long p1, v1, v5

    const-wide/16 v1, 0x0

    cmp-long p1, p1, v1

    if-nez p1, :cond_0

    return v0

    :cond_0
    const/4 p1, 0x2

    .line 51
    invoke-static {p0, p3, p1}, Lorg/spongycastle/math/raw/Nat;->incAt(I[II)I

    move-result p0

    return p0
.end method

.method public static addDWordTo(IJ[II)I
    .locals 8

    .line 1
    aget v0, p3, p4

    .line 2
    .line 3
    int-to-long v0, v0

    .line 4
    const-wide v2, 0xffffffffL

    .line 5
    .line 6
    .line 7
    .line 8
    .line 9
    and-long/2addr v0, v2

    .line 10
    and-long v4, p1, v2

    .line 11
    .line 12
    add-long/2addr v0, v4

    .line 13
    long-to-int v4, v0

    .line 14
    aput v4, p3, p4

    .line 15
    .line 16
    const/16 v4, 0x20

    .line 17
    .line 18
    ushr-long/2addr v0, v4

    .line 19
    add-int/lit8 v5, p4, 0x1

    .line 20
    .line 21
    aget v6, p3, v5

    .line 22
    .line 23
    int-to-long v6, v6

    .line 24
    and-long/2addr v2, v6

    .line 25
    ushr-long/2addr p1, v4

    .line 26
    add-long/2addr v2, p1

    .line 27
    add-long/2addr v0, v2

    .line 28
    long-to-int p1, v0

    .line 29
    aput p1, p3, v5

    .line 30
    .line 31
    ushr-long p1, v0, v4

    .line 32
    .line 33
    const-wide/16 v0, 0x0

    .line 34
    .line 35
    cmp-long p1, p1, v0

    .line 36
    .line 37
    if-nez p1, :cond_0

    .line 38
    .line 39
    const/4 p0, 0x0

    .line 40
    return p0

    .line 41
    :cond_0
    const/4 p1, 0x2

    .line 42
    invoke-static {p0, p3, p4, p1}, Lorg/spongycastle/math/raw/Nat;->incAt(I[III)I

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    return p0
.end method

.method public static addTo(I[II[II)I
    .locals 10

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    const/4 v2, 0x0

    .line 4
    :goto_0
    if-ge v2, p0, :cond_0

    .line 5
    .line 6
    add-int v3, p2, v2

    .line 7
    .line 8
    aget v3, p1, v3

    .line 9
    .line 10
    int-to-long v3, v3

    .line 11
    const-wide v5, 0xffffffffL

    .line 12
    .line 13
    .line 14
    .line 15
    .line 16
    and-long/2addr v3, v5

    .line 17
    add-int v7, p4, v2

    .line 18
    .line 19
    aget v8, p3, v7

    .line 20
    .line 21
    int-to-long v8, v8

    .line 22
    and-long/2addr v5, v8

    .line 23
    add-long/2addr v3, v5

    .line 24
    add-long/2addr v0, v3

    .line 25
    long-to-int v3, v0

    .line 26
    aput v3, p3, v7

    .line 27
    .line 28
    const/16 v3, 0x20

    .line 29
    .line 30
    ushr-long/2addr v0, v3

    .line 31
    add-int/lit8 v2, v2, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    long-to-int p0, v0

    .line 35
    return p0
.end method

.method public static addTo(I[I[I)I
    .locals 9

    const-wide/16 v0, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, p0, :cond_0

    .line 36
    aget v3, p1, v2

    int-to-long v3, v3

    const-wide v5, 0xffffffffL

    and-long/2addr v3, v5

    aget v7, p2, v2

    int-to-long v7, v7

    and-long/2addr v5, v7

    add-long/2addr v3, v5

    add-long/2addr v0, v3

    long-to-int v3, v0

    .line 37
    aput v3, p2, v2

    const/16 v3, 0x20

    ushr-long/2addr v0, v3

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    long-to-int p0, v0

    return p0
.end method

.method public static addWordAt(II[II)I
    .locals 6

    int-to-long v0, p1

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    .line 36
    aget p1, p2, p3

    int-to-long v4, p1

    and-long/2addr v2, v4

    add-long/2addr v0, v2

    long-to-int p1, v0

    .line 37
    aput p1, p2, p3

    const/16 p1, 0x20

    ushr-long/2addr v0, p1

    const-wide/16 v2, 0x0

    cmp-long p1, v0, v2

    if-nez p1, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    add-int/lit8 p3, p3, 0x1

    .line 38
    invoke-static {p0, p2, p3}, Lorg/spongycastle/math/raw/Nat;->incAt(I[II)I

    move-result p0

    return p0
.end method

.method public static addWordAt(II[III)I
    .locals 6

    .line 1
    int-to-long v0, p1

    .line 2
    const-wide v2, 0xffffffffL

    .line 3
    .line 4
    .line 5
    .line 6
    .line 7
    and-long/2addr v0, v2

    .line 8
    add-int p1, p3, p4

    .line 9
    .line 10
    aget v4, p2, p1

    .line 11
    .line 12
    int-to-long v4, v4

    .line 13
    and-long/2addr v2, v4

    .line 14
    add-long/2addr v0, v2

    .line 15
    long-to-int v2, v0

    .line 16
    aput v2, p2, p1

    .line 17
    .line 18
    const/16 p1, 0x20

    .line 19
    .line 20
    ushr-long/2addr v0, p1

    .line 21
    const-wide/16 v2, 0x0

    .line 22
    .line 23
    cmp-long p1, v0, v2

    .line 24
    .line 25
    if-nez p1, :cond_0

    .line 26
    .line 27
    const/4 p0, 0x0

    .line 28
    return p0

    .line 29
    :cond_0
    add-int/lit8 p4, p4, 0x1

    .line 30
    .line 31
    invoke-static {p0, p2, p3, p4}, Lorg/spongycastle/math/raw/Nat;->incAt(I[III)I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    return p0
.end method

.method public static addWordTo(II[I)I
    .locals 6

    .line 1
    int-to-long v0, p1

    .line 2
    const-wide v2, 0xffffffffL

    .line 3
    .line 4
    .line 5
    .line 6
    .line 7
    and-long/2addr v0, v2

    .line 8
    const/4 p1, 0x0

    .line 9
    aget v4, p2, p1

    .line 10
    .line 11
    int-to-long v4, v4

    .line 12
    and-long/2addr v2, v4

    .line 13
    add-long/2addr v0, v2

    .line 14
    long-to-int v2, v0

    .line 15
    aput v2, p2, p1

    .line 16
    .line 17
    const/16 v2, 0x20

    .line 18
    .line 19
    ushr-long/2addr v0, v2

    .line 20
    const-wide/16 v2, 0x0

    .line 21
    .line 22
    cmp-long v0, v0, v2

    .line 23
    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    return p1

    .line 27
    :cond_0
    const/4 p1, 0x1

    .line 28
    invoke-static {p0, p2, p1}, Lorg/spongycastle/math/raw/Nat;->incAt(I[II)I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    return p0
.end method

.method public static addWordTo(II[II)I
    .locals 6

    int-to-long v0, p1

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    .line 33
    aget p1, p2, p3

    int-to-long v4, p1

    and-long/2addr v2, v4

    add-long/2addr v0, v2

    long-to-int p1, v0

    .line 34
    aput p1, p2, p3

    const/16 p1, 0x20

    ushr-long/2addr v0, p1

    const-wide/16 v2, 0x0

    cmp-long p1, v0, v2

    if-nez p1, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    const/4 p1, 0x1

    .line 35
    invoke-static {p0, p2, p3, p1}, Lorg/spongycastle/math/raw/Nat;->incAt(I[III)I

    move-result p0

    return p0
.end method

.method public static copy(I[I[I)V
    .locals 1

    const/4 v0, 0x0

    .line 8
    invoke-static {p1, v0, p2, v0, p0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-void
.end method

.method public static copy(I[I)[I
    .locals 2

    .line 1
    new-array v0, p0, [I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {p1, v1, v0, v1, p0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public static create(I)[I
    .locals 0

    .line 1
    new-array p0, p0, [I

    .line 2
    .line 3
    return-object p0
.end method

.method public static create64(I)[J
    .locals 0

    .line 1
    new-array p0, p0, [J

    .line 2
    .line 3
    return-object p0
.end method

.method public static dec(I[I)I
    .locals 4

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    const/4 v2, -0x1

    if-ge v1, p0, :cond_1

    .line 27
    aget v3, p1, v1

    add-int/lit8 v3, v3, -0x1

    aput v3, p1, v1

    if-eq v3, v2, :cond_0

    return v0

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return v2
.end method

.method public static dec(I[I[I)I
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :cond_0
    const/4 v2, -0x1

    .line 4
    if-ge v1, p0, :cond_2

    .line 5
    .line 6
    aget v3, p1, v1

    .line 7
    .line 8
    add-int/lit8 v3, v3, -0x1

    .line 9
    .line 10
    aput v3, p2, v1

    .line 11
    .line 12
    add-int/lit8 v1, v1, 0x1

    .line 13
    .line 14
    if-eq v3, v2, :cond_0

    .line 15
    .line 16
    :goto_0
    if-ge v1, p0, :cond_1

    .line 17
    .line 18
    aget v2, p1, v1

    .line 19
    .line 20
    aput v2, p2, v1

    .line 21
    .line 22
    add-int/lit8 v1, v1, 0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    return v0

    .line 26
    :cond_2
    return v2
.end method

.method public static decAt(I[II)I
    .locals 2

    :goto_0
    const/4 v0, -0x1

    if-ge p2, p0, :cond_1

    .line 20
    aget v1, p1, p2

    add-int/lit8 v1, v1, -0x1

    aput v1, p1, p2

    if-eq v1, v0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_1
    return v0
.end method

.method public static decAt(I[III)I
    .locals 3

    .line 1
    :goto_0
    const/4 v0, -0x1

    .line 2
    if-ge p3, p0, :cond_1

    .line 3
    .line 4
    add-int v1, p2, p3

    .line 5
    .line 6
    aget v2, p1, v1

    .line 7
    .line 8
    add-int/lit8 v2, v2, -0x1

    .line 9
    .line 10
    aput v2, p1, v1

    .line 11
    .line 12
    if-eq v2, v0, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_0
    add-int/lit8 p3, p3, 0x1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    return v0
.end method

.method public static eq(I[I[I)Z
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    sub-int/2addr p0, v0

    .line 3
    :goto_0
    if-ltz p0, :cond_1

    .line 4
    .line 5
    aget v1, p1, p0

    .line 6
    .line 7
    aget v2, p2, p0

    .line 8
    .line 9
    if-eq v1, v2, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return p0

    .line 13
    :cond_0
    add-int/lit8 p0, p0, -0x1

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_1
    return v0
.end method

.method public static fromBigInteger(ILjava/math/BigInteger;)[I
    .locals 3

    .line 1
    invoke-virtual {p1}, Ljava/math/BigInteger;->signum()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-ltz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/math/BigInteger;->bitLength()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-gt v0, p0, :cond_1

    .line 12
    .line 13
    add-int/lit8 p0, p0, 0x1f

    .line 14
    .line 15
    shr-int/lit8 p0, p0, 0x5

    .line 16
    .line 17
    invoke-static {p0}, Lorg/spongycastle/math/raw/Nat;->create(I)[I

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const/4 v0, 0x0

    .line 22
    :goto_0
    invoke-virtual {p1}, Ljava/math/BigInteger;->signum()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    add-int/lit8 v1, v0, 0x1

    .line 29
    .line 30
    invoke-virtual {p1}, Ljava/math/BigInteger;->intValue()I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    aput v2, p0, v0

    .line 35
    .line 36
    const/16 v0, 0x20

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Ljava/math/BigInteger;->shiftRight(I)Ljava/math/BigInteger;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    move v0, v1

    .line 43
    goto :goto_0

    .line 44
    :cond_0
    return-object p0

    .line 45
    :cond_1
    invoke-static {}, Ll/fig0;->a()V

    .line 46
    .line 47
    .line 48
    const/4 p0, 0x0

    .line 49
    return-object p0
.end method

.method public static getBit([II)I
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    aget p0, p0, v0

    .line 5
    .line 6
    :goto_0
    and-int/lit8 p0, p0, 0x1

    .line 7
    .line 8
    return p0

    .line 9
    :cond_0
    shr-int/lit8 v1, p1, 0x5

    .line 10
    .line 11
    if-ltz v1, :cond_2

    .line 12
    .line 13
    array-length v2, p0

    .line 14
    if-lt v1, v2, :cond_1

    .line 15
    .line 16
    goto :goto_1

    .line 17
    :cond_1
    and-int/lit8 p1, p1, 0x1f

    .line 18
    .line 19
    aget p0, p0, v1

    .line 20
    .line 21
    ushr-int/2addr p0, p1

    .line 22
    goto :goto_0

    .line 23
    :cond_2
    :goto_1
    return v0
.end method

.method public static gte(I[I[I)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    sub-int/2addr p0, v0

    .line 3
    :goto_0
    if-ltz p0, :cond_2

    .line 4
    .line 5
    aget v1, p1, p0

    .line 6
    .line 7
    const/high16 v2, -0x80000000

    .line 8
    .line 9
    xor-int/2addr v1, v2

    .line 10
    aget v3, p2, p0

    .line 11
    .line 12
    xor-int/2addr v2, v3

    .line 13
    if-ge v1, v2, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    return p0

    .line 17
    :cond_0
    if-le v1, v2, :cond_1

    .line 18
    .line 19
    return v0

    .line 20
    :cond_1
    add-int/lit8 p0, p0, -0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_2
    return v0
.end method

.method public static inc(I[I)I
    .locals 4

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    const/4 v2, 0x1

    if-ge v1, p0, :cond_1

    .line 26
    aget v3, p1, v1

    add-int/2addr v3, v2

    aput v3, p1, v1

    if-eqz v3, :cond_0

    return v0

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return v2
.end method

.method public static inc(I[I[I)I
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :cond_0
    const/4 v2, 0x1

    .line 4
    if-ge v1, p0, :cond_2

    .line 5
    .line 6
    aget v3, p1, v1

    .line 7
    .line 8
    add-int/2addr v3, v2

    .line 9
    aput v3, p2, v1

    .line 10
    .line 11
    add-int/lit8 v1, v1, 0x1

    .line 12
    .line 13
    if-eqz v3, :cond_0

    .line 14
    .line 15
    :goto_0
    if-ge v1, p0, :cond_1

    .line 16
    .line 17
    aget v2, p1, v1

    .line 18
    .line 19
    aput v2, p2, v1

    .line 20
    .line 21
    add-int/lit8 v1, v1, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    return v0

    .line 25
    :cond_2
    return v2
.end method

.method public static incAt(I[II)I
    .locals 2

    :goto_0
    const/4 v0, 0x1

    if-ge p2, p0, :cond_1

    .line 19
    aget v1, p1, p2

    add-int/2addr v1, v0

    aput v1, p1, p2

    if-eqz v1, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_1
    return v0
.end method

.method public static incAt(I[III)I
    .locals 3

    .line 1
    :goto_0
    const/4 v0, 0x1

    .line 2
    if-ge p3, p0, :cond_1

    .line 3
    .line 4
    add-int v1, p2, p3

    .line 5
    .line 6
    aget v2, p1, v1

    .line 7
    .line 8
    add-int/2addr v2, v0

    .line 9
    aput v2, p1, v1

    .line 10
    .line 11
    if-eqz v2, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return p0

    .line 15
    :cond_0
    add-int/lit8 p3, p3, 0x1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_1
    return v0
.end method

.method public static isOne(I[I)Z
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    aget v1, p1, v0

    .line 3
    .line 4
    const/4 v2, 0x1

    .line 5
    if-eq v1, v2, :cond_0

    .line 6
    .line 7
    return v0

    .line 8
    :cond_0
    move v1, v2

    .line 9
    :goto_0
    if-ge v1, p0, :cond_2

    .line 10
    .line 11
    aget v3, p1, v1

    .line 12
    .line 13
    if-eqz v3, :cond_1

    .line 14
    .line 15
    return v0

    .line 16
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_2
    return v2
.end method

.method public static isZero(I[I)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    if-ge v1, p0, :cond_1

    .line 4
    .line 5
    aget v2, p1, v1

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    return v0

    .line 10
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_1
    const/4 p0, 0x1

    .line 14
    return p0
.end method

.method public static mul(I[II[II[II)V
    .locals 7

    .line 1
    add-int v0, p6, p0

    .line 2
    .line 3
    aget v2, p1, p2

    .line 4
    .line 5
    move v1, p0

    .line 6
    move-object v3, p3

    .line 7
    move v4, p4

    .line 8
    move-object v5, p5

    .line 9
    move v6, p6

    .line 10
    invoke-static/range {v1 .. v6}, Lorg/spongycastle/math/raw/Nat;->mulWord(II[II[II)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    move p3, v6

    .line 15
    aput p0, v5, v0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    :goto_0
    if-ge p0, v1, :cond_0

    .line 19
    .line 20
    add-int v6, p3, p0

    .line 21
    .line 22
    add-int p4, v6, v1

    .line 23
    .line 24
    add-int p5, p2, p0

    .line 25
    .line 26
    aget v2, p1, p5

    .line 27
    .line 28
    invoke-static/range {v1 .. v6}, Lorg/spongycastle/math/raw/Nat;->mulWordAddTo(II[II[II)I

    .line 29
    .line 30
    .line 31
    move-result p5

    .line 32
    aput p5, v5, p4

    .line 33
    .line 34
    add-int/lit8 p0, p0, 0x1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    return-void
.end method

.method public static mul(I[I[I[I)V
    .locals 7

    const/4 v0, 0x0

    .line 38
    aget v0, p1, v0

    invoke-static {p0, v0, p2, p3}, Lorg/spongycastle/math/raw/Nat;->mulWord(II[I[I)I

    move-result v0

    aput v0, p3, p0

    const/4 v0, 0x1

    move v6, v0

    :goto_0
    if-ge v6, p0, :cond_0

    add-int v0, v6, p0

    .line 39
    aget v2, p1, v6

    const/4 v4, 0x0

    move v1, p0

    move-object v3, p2

    move-object v5, p3

    invoke-static/range {v1 .. v6}, Lorg/spongycastle/math/raw/Nat;->mulWordAddTo(II[II[II)I

    move-result p0

    aput p0, v5, v0

    add-int/lit8 v6, v6, 0x1

    move p0, v1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public static mul31BothAdd(II[II[I[II)I
    .locals 13

    .line 1
    int-to-long v0, p1

    .line 2
    const-wide v2, 0xffffffffL

    .line 3
    .line 4
    .line 5
    .line 6
    .line 7
    and-long/2addr v0, v2

    .line 8
    move/from16 p1, p3

    .line 9
    .line 10
    int-to-long v4, p1

    .line 11
    and-long/2addr v4, v2

    .line 12
    const-wide/16 v6, 0x0

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    :cond_0
    aget v8, p2, p1

    .line 16
    .line 17
    int-to-long v8, v8

    .line 18
    and-long/2addr v8, v2

    .line 19
    mul-long/2addr v8, v0

    .line 20
    aget v10, p4, p1

    .line 21
    .line 22
    int-to-long v10, v10

    .line 23
    and-long/2addr v10, v2

    .line 24
    mul-long/2addr v10, v4

    .line 25
    add-long/2addr v8, v10

    .line 26
    add-int v10, p6, p1

    .line 27
    .line 28
    aget v11, p5, v10

    .line 29
    .line 30
    int-to-long v11, v11

    .line 31
    and-long/2addr v11, v2

    .line 32
    add-long/2addr v8, v11

    .line 33
    add-long/2addr v6, v8

    .line 34
    long-to-int v8, v6

    .line 35
    aput v8, p5, v10

    .line 36
    .line 37
    const/16 v8, 0x20

    .line 38
    .line 39
    ushr-long/2addr v6, v8

    .line 40
    add-int/lit8 p1, p1, 0x1

    .line 41
    .line 42
    if-lt p1, p0, :cond_0

    .line 43
    .line 44
    long-to-int p0, v6

    .line 45
    return p0
.end method

.method public static mulAddTo(I[II[II[II)I
    .locals 11

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    const/4 v2, 0x0

    .line 4
    move/from16 v8, p6

    .line 5
    .line 6
    :goto_0
    if-ge v2, p0, :cond_0

    .line 7
    .line 8
    add-int v3, p2, v2

    .line 9
    .line 10
    aget v4, p1, v3

    .line 11
    .line 12
    move v3, p0

    .line 13
    move-object v5, p3

    .line 14
    move v6, p4

    .line 15
    move-object/from16 v7, p5

    .line 16
    .line 17
    invoke-static/range {v3 .. v8}, Lorg/spongycastle/math/raw/Nat;->mulWordAddTo(II[II[II)I

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    int-to-long v3, v4

    .line 22
    const-wide v5, 0xffffffffL

    .line 23
    .line 24
    .line 25
    .line 26
    .line 27
    and-long/2addr v3, v5

    .line 28
    add-int v7, v8, p0

    .line 29
    .line 30
    aget v9, p5, v7

    .line 31
    .line 32
    int-to-long v9, v9

    .line 33
    and-long/2addr v5, v9

    .line 34
    add-long/2addr v0, v5

    .line 35
    add-long/2addr v3, v0

    .line 36
    long-to-int v0, v3

    .line 37
    aput v0, p5, v7

    .line 38
    .line 39
    const/16 v0, 0x20

    .line 40
    .line 41
    ushr-long v0, v3, v0

    .line 42
    .line 43
    add-int/lit8 v8, v8, 0x1

    .line 44
    .line 45
    add-int/lit8 v2, v2, 0x1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    long-to-int p0, v0

    .line 49
    return p0
.end method

.method public static mulAddTo(I[I[I[I)I
    .locals 12

    const-wide/16 v0, 0x0

    const/4 v2, 0x0

    move v7, v2

    :goto_0
    if-ge v7, p0, :cond_0

    .line 50
    aget v3, p1, v7

    const/4 v5, 0x0

    move v2, p0

    move-object v4, p2

    move-object v6, p3

    invoke-static/range {v2 .. v7}, Lorg/spongycastle/math/raw/Nat;->mulWordAddTo(II[II[II)I

    move-result p0

    int-to-long p2, p0

    const-wide v8, 0xffffffffL

    and-long/2addr p2, v8

    add-int p0, v7, v2

    .line 51
    aget v3, v6, p0

    int-to-long v10, v3

    and-long/2addr v8, v10

    add-long/2addr v0, v8

    add-long/2addr p2, v0

    long-to-int v0, p2

    .line 52
    aput v0, v6, p0

    const/16 p0, 0x20

    ushr-long v0, p2, p0

    add-int/lit8 v7, v7, 0x1

    move p0, v2

    move-object p2, v4

    move-object p3, v6

    goto :goto_0

    :cond_0
    long-to-int p0, v0

    return p0
.end method

.method public static mulWord(II[II[II)I
    .locals 8

    .line 1
    int-to-long v0, p1

    .line 2
    const-wide v2, 0xffffffffL

    .line 3
    .line 4
    .line 5
    .line 6
    .line 7
    and-long/2addr v0, v2

    .line 8
    const-wide/16 v4, 0x0

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    :cond_0
    add-int v6, p3, p1

    .line 12
    .line 13
    aget v6, p2, v6

    .line 14
    .line 15
    int-to-long v6, v6

    .line 16
    and-long/2addr v6, v2

    .line 17
    mul-long/2addr v6, v0

    .line 18
    add-long/2addr v4, v6

    .line 19
    add-int v6, p5, p1

    .line 20
    .line 21
    long-to-int v7, v4

    .line 22
    aput v7, p4, v6

    .line 23
    .line 24
    const/16 v6, 0x20

    .line 25
    .line 26
    ushr-long/2addr v4, v6

    .line 27
    add-int/lit8 p1, p1, 0x1

    .line 28
    .line 29
    if-lt p1, p0, :cond_0

    .line 30
    .line 31
    long-to-int p0, v4

    .line 32
    return p0
.end method

.method public static mulWord(II[I[I)I
    .locals 8

    int-to-long v0, p1

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    const-wide/16 v4, 0x0

    const/4 p1, 0x0

    .line 33
    :cond_0
    aget v6, p2, p1

    int-to-long v6, v6

    and-long/2addr v6, v2

    mul-long/2addr v6, v0

    add-long/2addr v4, v6

    long-to-int v6, v4

    .line 34
    aput v6, p3, p1

    const/16 v6, 0x20

    ushr-long/2addr v4, v6

    add-int/lit8 p1, p1, 0x1

    if-lt p1, p0, :cond_0

    long-to-int p0, v4

    return p0
.end method

.method public static mulWordAddTo(II[II[II)I
    .locals 11

    .line 1
    int-to-long v0, p1

    .line 2
    const-wide v2, 0xffffffffL

    .line 3
    .line 4
    .line 5
    .line 6
    .line 7
    and-long/2addr v0, v2

    .line 8
    const-wide/16 v4, 0x0

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    :cond_0
    add-int v6, p3, p1

    .line 12
    .line 13
    aget v6, p2, v6

    .line 14
    .line 15
    int-to-long v6, v6

    .line 16
    and-long/2addr v6, v2

    .line 17
    mul-long/2addr v6, v0

    .line 18
    add-int v8, p5, p1

    .line 19
    .line 20
    aget v9, p4, v8

    .line 21
    .line 22
    int-to-long v9, v9

    .line 23
    and-long/2addr v9, v2

    .line 24
    add-long/2addr v6, v9

    .line 25
    add-long/2addr v4, v6

    .line 26
    long-to-int v6, v4

    .line 27
    aput v6, p4, v8

    .line 28
    .line 29
    const/16 v6, 0x20

    .line 30
    .line 31
    ushr-long/2addr v4, v6

    .line 32
    add-int/lit8 p1, p1, 0x1

    .line 33
    .line 34
    if-lt p1, p0, :cond_0

    .line 35
    .line 36
    long-to-int p0, v4

    .line 37
    return p0
.end method

.method public static mulWordDwordAddAt(IIJ[II)I
    .locals 8

    .line 1
    int-to-long v0, p1

    .line 2
    const-wide v2, 0xffffffffL

    .line 3
    .line 4
    .line 5
    .line 6
    .line 7
    and-long/2addr v0, v2

    .line 8
    and-long v4, p2, v2

    .line 9
    .line 10
    mul-long/2addr v4, v0

    .line 11
    aget p1, p4, p5

    .line 12
    .line 13
    int-to-long v6, p1

    .line 14
    and-long/2addr v6, v2

    .line 15
    add-long/2addr v4, v6

    .line 16
    long-to-int p1, v4

    .line 17
    aput p1, p4, p5

    .line 18
    .line 19
    const/16 p1, 0x20

    .line 20
    .line 21
    ushr-long/2addr v4, p1

    .line 22
    ushr-long/2addr p2, p1

    .line 23
    mul-long/2addr v0, p2

    .line 24
    add-int/lit8 p2, p5, 0x1

    .line 25
    .line 26
    aget p3, p4, p2

    .line 27
    .line 28
    int-to-long v6, p3

    .line 29
    and-long/2addr v6, v2

    .line 30
    add-long/2addr v0, v6

    .line 31
    add-long/2addr v4, v0

    .line 32
    long-to-int p3, v4

    .line 33
    aput p3, p4, p2

    .line 34
    .line 35
    ushr-long p2, v4, p1

    .line 36
    .line 37
    add-int/lit8 v0, p5, 0x2

    .line 38
    .line 39
    aget v1, p4, v0

    .line 40
    .line 41
    int-to-long v4, v1

    .line 42
    and-long v1, v4, v2

    .line 43
    .line 44
    add-long/2addr p2, v1

    .line 45
    long-to-int v1, p2

    .line 46
    aput v1, p4, v0

    .line 47
    .line 48
    ushr-long p1, p2, p1

    .line 49
    .line 50
    const-wide/16 v0, 0x0

    .line 51
    .line 52
    cmp-long p1, p1, v0

    .line 53
    .line 54
    if-nez p1, :cond_0

    .line 55
    .line 56
    const/4 p0, 0x0

    .line 57
    return p0

    .line 58
    :cond_0
    add-int/lit8 p5, p5, 0x3

    .line 59
    .line 60
    invoke-static {p0, p4, p5}, Lorg/spongycastle/math/raw/Nat;->incAt(I[II)I

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    return p0
.end method

.method public static shiftDownBit(I[II)I
    .locals 2

    :goto_0
    add-int/lit8 p0, p0, -0x1

    if-ltz p0, :cond_0

    .line 27
    aget v0, p1, p0

    ushr-int/lit8 v1, v0, 0x1

    shl-int/lit8 p2, p2, 0x1f

    or-int/2addr p2, v1

    .line 28
    aput p2, p1, p0

    move p2, v0

    goto :goto_0

    :cond_0
    shl-int/lit8 p0, p2, 0x1f

    return p0
.end method

.method public static shiftDownBit(I[III)I
    .locals 3

    :goto_0
    add-int/lit8 p0, p0, -0x1

    if-ltz p0, :cond_0

    add-int v0, p2, p0

    .line 23
    aget v1, p1, v0

    ushr-int/lit8 v2, v1, 0x1

    shl-int/lit8 p3, p3, 0x1f

    or-int/2addr p3, v2

    .line 24
    aput p3, p1, v0

    move p3, v1

    goto :goto_0

    :cond_0
    shl-int/lit8 p0, p3, 0x1f

    return p0
.end method

.method public static shiftDownBit(I[III[II)I
    .locals 3

    .line 1
    :goto_0
    add-int/lit8 p0, p0, -0x1

    .line 2
    .line 3
    if-ltz p0, :cond_0

    .line 4
    .line 5
    add-int v0, p2, p0

    .line 6
    .line 7
    aget v0, p1, v0

    .line 8
    .line 9
    add-int v1, p5, p0

    .line 10
    .line 11
    ushr-int/lit8 v2, v0, 0x1

    .line 12
    .line 13
    shl-int/lit8 p3, p3, 0x1f

    .line 14
    .line 15
    or-int/2addr p3, v2

    .line 16
    aput p3, p4, v1

    .line 17
    .line 18
    move p3, v0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    shl-int/lit8 p0, p3, 0x1f

    .line 21
    .line 22
    return p0
.end method

.method public static shiftDownBit(I[II[I)I
    .locals 2

    :goto_0
    add-int/lit8 p0, p0, -0x1

    if-ltz p0, :cond_0

    .line 25
    aget v0, p1, p0

    ushr-int/lit8 v1, v0, 0x1

    shl-int/lit8 p2, p2, 0x1f

    or-int/2addr p2, v1

    .line 26
    aput p2, p3, p0

    move p2, v0

    goto :goto_0

    :cond_0
    shl-int/lit8 p0, p2, 0x1f

    return p0
.end method

.method public static shiftDownBits(I[III)I
    .locals 3

    :goto_0
    add-int/lit8 p0, p0, -0x1

    if-ltz p0, :cond_0

    .line 28
    aget v0, p1, p0

    ushr-int v1, v0, p2

    neg-int v2, p2

    shl-int/2addr p3, v2

    or-int/2addr p3, v1

    .line 29
    aput p3, p1, p0

    move p3, v0

    goto :goto_0

    :cond_0
    neg-int p0, p2

    shl-int p0, p3, p0

    return p0
.end method

.method public static shiftDownBits(I[IIII)I
    .locals 4

    :goto_0
    add-int/lit8 p0, p0, -0x1

    if-ltz p0, :cond_0

    add-int v0, p2, p0

    .line 24
    aget v1, p1, v0

    ushr-int v2, v1, p3

    neg-int v3, p3

    shl-int/2addr p4, v3

    or-int/2addr p4, v2

    .line 25
    aput p4, p1, v0

    move p4, v1

    goto :goto_0

    :cond_0
    neg-int p0, p3

    shl-int p0, p4, p0

    return p0
.end method

.method public static shiftDownBits(I[IIII[II)I
    .locals 4

    .line 1
    :goto_0
    add-int/lit8 p0, p0, -0x1

    .line 2
    .line 3
    if-ltz p0, :cond_0

    .line 4
    .line 5
    add-int v0, p2, p0

    .line 6
    .line 7
    aget v0, p1, v0

    .line 8
    .line 9
    add-int v1, p6, p0

    .line 10
    .line 11
    ushr-int v2, v0, p3

    .line 12
    .line 13
    neg-int v3, p3

    .line 14
    shl-int/2addr p4, v3

    .line 15
    or-int/2addr p4, v2

    .line 16
    aput p4, p5, v1

    .line 17
    .line 18
    move p4, v0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    neg-int p0, p3

    .line 21
    shl-int p0, p4, p0

    .line 22
    .line 23
    return p0
.end method

.method public static shiftDownBits(I[III[I)I
    .locals 3

    :goto_0
    add-int/lit8 p0, p0, -0x1

    if-ltz p0, :cond_0

    .line 26
    aget v0, p1, p0

    ushr-int v1, v0, p2

    neg-int v2, p2

    shl-int/2addr p3, v2

    or-int/2addr p3, v1

    .line 27
    aput p3, p4, p0

    move p3, v0

    goto :goto_0

    :cond_0
    neg-int p0, p2

    shl-int p0, p3, p0

    return p0
.end method

.method public static shiftDownWord(I[II)I
    .locals 1

    .line 1
    :goto_0
    add-int/lit8 p0, p0, -0x1

    .line 2
    .line 3
    if-ltz p0, :cond_0

    .line 4
    .line 5
    aget v0, p1, p0

    .line 6
    .line 7
    aput p2, p1, p0

    .line 8
    .line 9
    move p2, v0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    return p2
.end method

.method public static shiftUpBit(I[II)I
    .locals 3

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p0, :cond_0

    .line 28
    aget v1, p1, v0

    shl-int/lit8 v2, v1, 0x1

    ushr-int/lit8 p2, p2, 0x1f

    or-int/2addr p2, v2

    .line 29
    aput p2, p1, v0

    add-int/lit8 v0, v0, 0x1

    move p2, v1

    goto :goto_0

    :cond_0
    ushr-int/lit8 p0, p2, 0x1f

    return p0
.end method

.method public static shiftUpBit(I[III)I
    .locals 4

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p0, :cond_0

    add-int v1, p2, v0

    .line 24
    aget v2, p1, v1

    shl-int/lit8 v3, v2, 0x1

    ushr-int/lit8 p3, p3, 0x1f

    or-int/2addr p3, v3

    .line 25
    aput p3, p1, v1

    add-int/lit8 v0, v0, 0x1

    move p3, v2

    goto :goto_0

    :cond_0
    ushr-int/lit8 p0, p3, 0x1f

    return p0
.end method

.method public static shiftUpBit(I[III[II)I
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    if-ge v0, p0, :cond_0

    .line 3
    .line 4
    add-int v1, p2, v0

    .line 5
    .line 6
    aget v1, p1, v1

    .line 7
    .line 8
    add-int v2, p5, v0

    .line 9
    .line 10
    shl-int/lit8 v3, v1, 0x1

    .line 11
    .line 12
    ushr-int/lit8 p3, p3, 0x1f

    .line 13
    .line 14
    or-int/2addr p3, v3

    .line 15
    aput p3, p4, v2

    .line 16
    .line 17
    add-int/lit8 v0, v0, 0x1

    .line 18
    .line 19
    move p3, v1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    ushr-int/lit8 p0, p3, 0x1f

    .line 22
    .line 23
    return p0
.end method

.method public static shiftUpBit(I[II[I)I
    .locals 3

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p0, :cond_0

    .line 26
    aget v1, p1, v0

    shl-int/lit8 v2, v1, 0x1

    ushr-int/lit8 p2, p2, 0x1f

    or-int/2addr p2, v2

    .line 27
    aput p2, p3, v0

    add-int/lit8 v0, v0, 0x1

    move p2, v1

    goto :goto_0

    :cond_0
    ushr-int/lit8 p0, p2, 0x1f

    return p0
.end method

.method public static shiftUpBit64(I[JIJ[JI)J
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    const/16 v1, 0x3f

    .line 3
    .line 4
    if-ge v0, p0, :cond_0

    .line 5
    .line 6
    add-int v2, p2, v0

    .line 7
    .line 8
    aget-wide v2, p1, v2

    .line 9
    .line 10
    add-int v4, p6, v0

    .line 11
    .line 12
    const/4 v5, 0x1

    .line 13
    shl-long v5, v2, v5

    .line 14
    .line 15
    ushr-long/2addr p3, v1

    .line 16
    or-long/2addr p3, v5

    .line 17
    aput-wide p3, p5, v4

    .line 18
    .line 19
    add-int/lit8 v0, v0, 0x1

    .line 20
    .line 21
    move-wide p3, v2

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    ushr-long p0, p3, v1

    .line 24
    .line 25
    return-wide p0
.end method

.method public static shiftUpBits(I[III)I
    .locals 4

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p0, :cond_0

    .line 29
    aget v1, p1, v0

    shl-int v2, v1, p2

    neg-int v3, p2

    ushr-int/2addr p3, v3

    or-int/2addr p3, v2

    .line 30
    aput p3, p1, v0

    add-int/lit8 v0, v0, 0x1

    move p3, v1

    goto :goto_0

    :cond_0
    neg-int p0, p2

    ushr-int p0, p3, p0

    return p0
.end method

.method public static shiftUpBits(I[IIII)I
    .locals 5

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p0, :cond_0

    add-int v1, p2, v0

    .line 25
    aget v2, p1, v1

    shl-int v3, v2, p3

    neg-int v4, p3

    ushr-int/2addr p4, v4

    or-int/2addr p4, v3

    .line 26
    aput p4, p1, v1

    add-int/lit8 v0, v0, 0x1

    move p4, v2

    goto :goto_0

    :cond_0
    neg-int p0, p3

    ushr-int p0, p4, p0

    return p0
.end method

.method public static shiftUpBits(I[IIII[II)I
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    if-ge v0, p0, :cond_0

    .line 3
    .line 4
    add-int v1, p2, v0

    .line 5
    .line 6
    aget v1, p1, v1

    .line 7
    .line 8
    add-int v2, p6, v0

    .line 9
    .line 10
    shl-int v3, v1, p3

    .line 11
    .line 12
    neg-int v4, p3

    .line 13
    ushr-int/2addr p4, v4

    .line 14
    or-int/2addr p4, v3

    .line 15
    aput p4, p5, v2

    .line 16
    .line 17
    add-int/lit8 v0, v0, 0x1

    .line 18
    .line 19
    move p4, v1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    neg-int p0, p3

    .line 22
    ushr-int p0, p4, p0

    .line 23
    .line 24
    return p0
.end method

.method public static shiftUpBits(I[III[I)I
    .locals 4

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p0, :cond_0

    .line 27
    aget v1, p1, v0

    shl-int v2, v1, p2

    neg-int v3, p2

    ushr-int/2addr p3, v3

    or-int/2addr p3, v2

    .line 28
    aput p3, p4, v0

    add-int/lit8 v0, v0, 0x1

    move p3, v1

    goto :goto_0

    :cond_0
    neg-int p0, p2

    ushr-int p0, p3, p0

    return p0
.end method

.method public static shiftUpBits64(I[JIIJ)J
    .locals 7

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p0, :cond_0

    add-int v1, p2, v0

    .line 25
    aget-wide v2, p1, v1

    shl-long v4, v2, p3

    neg-int v6, p3

    ushr-long/2addr p4, v6

    or-long/2addr p4, v4

    .line 26
    aput-wide p4, p1, v1

    add-int/lit8 v0, v0, 0x1

    move-wide p4, v2

    goto :goto_0

    :cond_0
    neg-int p0, p3

    ushr-long p0, p4, p0

    return-wide p0
.end method

.method public static shiftUpBits64(I[JIIJ[JI)J
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    if-ge v0, p0, :cond_0

    .line 3
    .line 4
    add-int v1, p2, v0

    .line 5
    .line 6
    aget-wide v1, p1, v1

    .line 7
    .line 8
    add-int v3, p7, v0

    .line 9
    .line 10
    shl-long v4, v1, p3

    .line 11
    .line 12
    neg-int v6, p3

    .line 13
    ushr-long/2addr p4, v6

    .line 14
    or-long/2addr p4, v4

    .line 15
    aput-wide p4, p6, v3

    .line 16
    .line 17
    add-int/lit8 v0, v0, 0x1

    .line 18
    .line 19
    move-wide p4, v1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    neg-int p0, p3

    .line 22
    ushr-long p0, p4, p0

    .line 23
    .line 24
    return-wide p0
.end method

.method public static square(I[II[II)V
    .locals 9

    .line 1
    shl-int/lit8 v0, p0, 0x1

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    move v2, p0

    .line 5
    move v3, v0

    .line 6
    :cond_0
    add-int/lit8 v2, v2, -0x1

    .line 7
    .line 8
    add-int v4, p2, v2

    .line 9
    .line 10
    aget v4, p1, v4

    .line 11
    .line 12
    int-to-long v4, v4

    .line 13
    const-wide v6, 0xffffffffL

    .line 14
    .line 15
    .line 16
    .line 17
    .line 18
    and-long/2addr v4, v6

    .line 19
    mul-long/2addr v4, v4

    .line 20
    add-int/lit8 v6, v3, -0x1

    .line 21
    .line 22
    add-int/2addr v6, p4

    .line 23
    shl-int/lit8 v1, v1, 0x1f

    .line 24
    .line 25
    const/16 v7, 0x21

    .line 26
    .line 27
    ushr-long v7, v4, v7

    .line 28
    .line 29
    long-to-int v7, v7

    .line 30
    or-int/2addr v1, v7

    .line 31
    aput v1, p3, v6

    .line 32
    .line 33
    add-int/lit8 v3, v3, -0x2

    .line 34
    .line 35
    add-int v1, p4, v3

    .line 36
    .line 37
    const/4 v6, 0x1

    .line 38
    ushr-long v7, v4, v6

    .line 39
    .line 40
    long-to-int v7, v7

    .line 41
    aput v7, p3, v1

    .line 42
    .line 43
    long-to-int v1, v4

    .line 44
    if-gtz v2, :cond_0

    .line 45
    .line 46
    :goto_0
    if-ge v6, p0, :cond_1

    .line 47
    .line 48
    invoke-static {p1, p2, v6, p3, p4}, Lorg/spongycastle/math/raw/Nat;->squareWordAdd([III[II)I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    shl-int/lit8 v2, v6, 0x1

    .line 53
    .line 54
    invoke-static {v0, v1, p3, p4, v2}, Lorg/spongycastle/math/raw/Nat;->addWordAt(II[III)I

    .line 55
    .line 56
    .line 57
    add-int/lit8 v6, v6, 0x1

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_1
    aget p0, p1, p2

    .line 61
    .line 62
    shl-int/lit8 p0, p0, 0x1f

    .line 63
    .line 64
    invoke-static {v0, p3, p4, p0}, Lorg/spongycastle/math/raw/Nat;->shiftUpBit(I[III)I

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public static square(I[I[I)V
    .locals 10

    shl-int/lit8 v0, p0, 0x1

    const/4 v1, 0x0

    move v2, p0

    move v3, v0

    move v4, v1

    :goto_0
    add-int/lit8 v2, v2, -0x1

    .line 68
    aget v5, p1, v2

    int-to-long v5, v5

    const-wide v7, 0xffffffffL

    and-long/2addr v5, v7

    mul-long/2addr v5, v5

    add-int/lit8 v7, v3, -0x1

    shl-int/lit8 v4, v4, 0x1f

    const/16 v8, 0x21

    ushr-long v8, v5, v8

    long-to-int v8, v8

    or-int/2addr v4, v8

    .line 69
    aput v4, p2, v7

    add-int/lit8 v3, v3, -0x2

    const/4 v4, 0x1

    ushr-long v7, v5, v4

    long-to-int v7, v7

    .line 70
    aput v7, p2, v3

    long-to-int v5, v5

    if-gtz v2, :cond_1

    :goto_1
    if-ge v4, p0, :cond_0

    .line 71
    invoke-static {p1, v4, p2}, Lorg/spongycastle/math/raw/Nat;->squareWordAdd([II[I)I

    move-result v2

    shl-int/lit8 v3, v4, 0x1

    .line 72
    invoke-static {v0, v2, p2, v3}, Lorg/spongycastle/math/raw/Nat;->addWordAt(II[II)I

    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 73
    :cond_0
    aget p0, p1, v1

    shl-int/lit8 p0, p0, 0x1f

    invoke-static {v0, p2, p0}, Lorg/spongycastle/math/raw/Nat;->shiftUpBit(I[II)I

    return-void

    :cond_1
    move v4, v5

    goto :goto_0
.end method

.method public static squareWordAdd([III[II)I
    .locals 14

    .line 1
    move/from16 v0, p2

    .line 2
    .line 3
    add-int v1, p1, v0

    .line 4
    .line 5
    aget v1, p0, v1

    .line 6
    .line 7
    int-to-long v1, v1

    .line 8
    const-wide v3, 0xffffffffL

    .line 9
    .line 10
    .line 11
    .line 12
    .line 13
    and-long/2addr v1, v3

    .line 14
    const-wide/16 v5, 0x0

    .line 15
    .line 16
    const/4 v7, 0x0

    .line 17
    move v8, v7

    .line 18
    move-wide v6, v5

    .line 19
    move/from16 v5, p4

    .line 20
    .line 21
    :cond_0
    add-int v9, p1, v8

    .line 22
    .line 23
    aget v9, p0, v9

    .line 24
    .line 25
    int-to-long v9, v9

    .line 26
    and-long/2addr v9, v3

    .line 27
    mul-long/2addr v9, v1

    .line 28
    add-int v11, v0, v5

    .line 29
    .line 30
    aget v12, p3, v11

    .line 31
    .line 32
    int-to-long v12, v12

    .line 33
    and-long/2addr v12, v3

    .line 34
    add-long/2addr v9, v12

    .line 35
    add-long/2addr v6, v9

    .line 36
    long-to-int v9, v6

    .line 37
    aput v9, p3, v11

    .line 38
    .line 39
    const/16 v9, 0x20

    .line 40
    .line 41
    ushr-long/2addr v6, v9

    .line 42
    add-int/lit8 v5, v5, 0x1

    .line 43
    .line 44
    add-int/lit8 v8, v8, 0x1

    .line 45
    .line 46
    if-lt v8, v0, :cond_0

    .line 47
    .line 48
    long-to-int p0, v6

    .line 49
    return p0
.end method

.method public static squareWordAdd([II[I)I
    .locals 12

    .line 50
    aget v0, p0, p1

    int-to-long v0, v0

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    const-wide/16 v4, 0x0

    const/4 v6, 0x0

    .line 51
    :cond_0
    aget v7, p0, v6

    int-to-long v7, v7

    and-long/2addr v7, v2

    mul-long/2addr v7, v0

    add-int v9, p1, v6

    aget v10, p2, v9

    int-to-long v10, v10

    and-long/2addr v10, v2

    add-long/2addr v7, v10

    add-long/2addr v4, v7

    long-to-int v7, v4

    .line 52
    aput v7, p2, v9

    const/16 v7, 0x20

    ushr-long/2addr v4, v7

    add-int/lit8 v6, v6, 0x1

    if-lt v6, p1, :cond_0

    long-to-int p0, v4

    return p0
.end method

.method public static sub(I[II[II[II)I
    .locals 9

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    const/4 v2, 0x0

    .line 4
    :goto_0
    if-ge v2, p0, :cond_0

    .line 5
    .line 6
    add-int v3, p2, v2

    .line 7
    .line 8
    aget v3, p1, v3

    .line 9
    .line 10
    int-to-long v3, v3

    .line 11
    const-wide v5, 0xffffffffL

    .line 12
    .line 13
    .line 14
    .line 15
    .line 16
    and-long/2addr v3, v5

    .line 17
    add-int v7, p4, v2

    .line 18
    .line 19
    aget v7, p3, v7

    .line 20
    .line 21
    int-to-long v7, v7

    .line 22
    and-long/2addr v5, v7

    .line 23
    sub-long/2addr v3, v5

    .line 24
    add-long/2addr v0, v3

    .line 25
    add-int v3, p6, v2

    .line 26
    .line 27
    long-to-int v4, v0

    .line 28
    aput v4, p5, v3

    .line 29
    .line 30
    const/16 v3, 0x20

    .line 31
    .line 32
    shr-long/2addr v0, v3

    .line 33
    add-int/lit8 v2, v2, 0x1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    long-to-int p0, v0

    .line 37
    return p0
.end method

.method public static sub(I[I[I[I)I
    .locals 9

    const-wide/16 v0, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, p0, :cond_0

    .line 38
    aget v3, p1, v2

    int-to-long v3, v3

    const-wide v5, 0xffffffffL

    and-long/2addr v3, v5

    aget v7, p2, v2

    int-to-long v7, v7

    and-long/2addr v5, v7

    sub-long/2addr v3, v5

    add-long/2addr v0, v3

    long-to-int v3, v0

    .line 39
    aput v3, p3, v2

    const/16 v3, 0x20

    shr-long/2addr v0, v3

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    long-to-int p0, v0

    return p0
.end method

.method public static sub33At(II[II)I
    .locals 7

    .line 51
    aget v0, p2, p3

    int-to-long v0, v0

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    int-to-long v4, p1

    and-long/2addr v4, v2

    sub-long/2addr v0, v4

    long-to-int p1, v0

    .line 52
    aput p1, p2, p3

    const/16 p1, 0x20

    shr-long/2addr v0, p1

    add-int/lit8 v4, p3, 0x1

    .line 53
    aget v5, p2, v4

    int-to-long v5, v5

    and-long/2addr v2, v5

    const-wide/16 v5, 0x1

    sub-long/2addr v2, v5

    add-long/2addr v0, v2

    long-to-int v2, v0

    .line 54
    aput v2, p2, v4

    shr-long/2addr v0, p1

    const-wide/16 v2, 0x0

    cmp-long p1, v0, v2

    if-nez p1, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    add-int/lit8 p3, p3, 0x2

    .line 55
    invoke-static {p0, p2, p3}, Lorg/spongycastle/math/raw/Nat;->decAt(I[II)I

    move-result p0

    return p0
.end method

.method public static sub33At(II[III)I
    .locals 7

    .line 1
    add-int v0, p3, p4

    .line 2
    .line 3
    aget v1, p2, v0

    .line 4
    .line 5
    int-to-long v1, v1

    .line 6
    const-wide v3, 0xffffffffL

    .line 7
    .line 8
    .line 9
    .line 10
    .line 11
    and-long/2addr v1, v3

    .line 12
    int-to-long v5, p1

    .line 13
    and-long/2addr v5, v3

    .line 14
    sub-long/2addr v1, v5

    .line 15
    long-to-int p1, v1

    .line 16
    aput p1, p2, v0

    .line 17
    .line 18
    const/16 p1, 0x20

    .line 19
    .line 20
    shr-long/2addr v1, p1

    .line 21
    add-int/lit8 v0, v0, 0x1

    .line 22
    .line 23
    aget v5, p2, v0

    .line 24
    .line 25
    int-to-long v5, v5

    .line 26
    and-long/2addr v3, v5

    .line 27
    const-wide/16 v5, 0x1

    .line 28
    .line 29
    sub-long/2addr v3, v5

    .line 30
    add-long/2addr v1, v3

    .line 31
    long-to-int v3, v1

    .line 32
    aput v3, p2, v0

    .line 33
    .line 34
    shr-long v0, v1, p1

    .line 35
    .line 36
    const-wide/16 v2, 0x0

    .line 37
    .line 38
    cmp-long p1, v0, v2

    .line 39
    .line 40
    if-nez p1, :cond_0

    .line 41
    .line 42
    const/4 p0, 0x0

    .line 43
    return p0

    .line 44
    :cond_0
    add-int/lit8 p4, p4, 0x2

    .line 45
    .line 46
    invoke-static {p0, p2, p3, p4}, Lorg/spongycastle/math/raw/Nat;->decAt(I[III)I

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    return p0
.end method

.method public static sub33From(II[I)I
    .locals 8

    const/4 v0, 0x0

    .line 47
    aget v1, p2, v0

    int-to-long v1, v1

    const-wide v3, 0xffffffffL

    and-long/2addr v1, v3

    int-to-long v5, p1

    and-long/2addr v5, v3

    sub-long/2addr v1, v5

    long-to-int p1, v1

    .line 48
    aput p1, p2, v0

    const/16 p1, 0x20

    shr-long/2addr v1, p1

    const/4 v5, 0x1

    .line 49
    aget v6, p2, v5

    int-to-long v6, v6

    and-long/2addr v3, v6

    const-wide/16 v6, 0x1

    sub-long/2addr v3, v6

    add-long/2addr v1, v3

    long-to-int v3, v1

    .line 50
    aput v3, p2, v5

    shr-long/2addr v1, p1

    const-wide/16 v3, 0x0

    cmp-long p1, v1, v3

    if-nez p1, :cond_0

    return v0

    :cond_0
    const/4 p1, 0x2

    .line 51
    invoke-static {p0, p2, p1}, Lorg/spongycastle/math/raw/Nat;->decAt(I[II)I

    move-result p0

    return p0
.end method

.method public static sub33From(II[II)I
    .locals 7

    .line 1
    aget v0, p2, p3

    .line 2
    .line 3
    int-to-long v0, v0

    .line 4
    const-wide v2, 0xffffffffL

    .line 5
    .line 6
    .line 7
    .line 8
    .line 9
    and-long/2addr v0, v2

    .line 10
    int-to-long v4, p1

    .line 11
    and-long/2addr v4, v2

    .line 12
    sub-long/2addr v0, v4

    .line 13
    long-to-int p1, v0

    .line 14
    aput p1, p2, p3

    .line 15
    .line 16
    const/16 p1, 0x20

    .line 17
    .line 18
    shr-long/2addr v0, p1

    .line 19
    add-int/lit8 v4, p3, 0x1

    .line 20
    .line 21
    aget v5, p2, v4

    .line 22
    .line 23
    int-to-long v5, v5

    .line 24
    and-long/2addr v2, v5

    .line 25
    const-wide/16 v5, 0x1

    .line 26
    .line 27
    sub-long/2addr v2, v5

    .line 28
    add-long/2addr v0, v2

    .line 29
    long-to-int v2, v0

    .line 30
    aput v2, p2, v4

    .line 31
    .line 32
    shr-long/2addr v0, p1

    .line 33
    const-wide/16 v2, 0x0

    .line 34
    .line 35
    cmp-long p1, v0, v2

    .line 36
    .line 37
    if-nez p1, :cond_0

    .line 38
    .line 39
    const/4 p0, 0x0

    .line 40
    return p0

    .line 41
    :cond_0
    const/4 p1, 0x2

    .line 42
    invoke-static {p0, p2, p3, p1}, Lorg/spongycastle/math/raw/Nat;->decAt(I[III)I

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    return p0
.end method

.method public static subBothFrom(I[II[II[II)I
    .locals 10

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    const/4 v2, 0x0

    .line 4
    :goto_0
    if-ge v2, p0, :cond_0

    .line 5
    .line 6
    add-int v3, p6, v2

    .line 7
    .line 8
    aget v4, p5, v3

    .line 9
    .line 10
    int-to-long v4, v4

    .line 11
    const-wide v6, 0xffffffffL

    .line 12
    .line 13
    .line 14
    .line 15
    .line 16
    and-long/2addr v4, v6

    .line 17
    add-int v8, p2, v2

    .line 18
    .line 19
    aget v8, p1, v8

    .line 20
    .line 21
    int-to-long v8, v8

    .line 22
    and-long/2addr v8, v6

    .line 23
    sub-long/2addr v4, v8

    .line 24
    add-int v8, p4, v2

    .line 25
    .line 26
    aget v8, p3, v8

    .line 27
    .line 28
    int-to-long v8, v8

    .line 29
    and-long/2addr v6, v8

    .line 30
    sub-long/2addr v4, v6

    .line 31
    add-long/2addr v0, v4

    .line 32
    long-to-int v4, v0

    .line 33
    aput v4, p5, v3

    .line 34
    .line 35
    const/16 v3, 0x20

    .line 36
    .line 37
    shr-long/2addr v0, v3

    .line 38
    add-int/lit8 v2, v2, 0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    long-to-int p0, v0

    .line 42
    return p0
.end method

.method public static subBothFrom(I[I[I[I)I
    .locals 9

    const-wide/16 v0, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, p0, :cond_0

    .line 43
    aget v3, p3, v2

    int-to-long v3, v3

    const-wide v5, 0xffffffffL

    and-long/2addr v3, v5

    aget v7, p1, v2

    int-to-long v7, v7

    and-long/2addr v7, v5

    sub-long/2addr v3, v7

    aget v7, p2, v2

    int-to-long v7, v7

    and-long/2addr v5, v7

    sub-long/2addr v3, v5

    add-long/2addr v0, v3

    long-to-int v3, v0

    .line 44
    aput v3, p3, v2

    const/16 v3, 0x20

    shr-long/2addr v0, v3

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    long-to-int p0, v0

    return p0
.end method

.method public static subDWordAt(IJ[II)I
    .locals 8

    .line 50
    aget v0, p3, p4

    int-to-long v0, v0

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    and-long v4, p1, v2

    sub-long/2addr v0, v4

    long-to-int v4, v0

    .line 51
    aput v4, p3, p4

    const/16 v4, 0x20

    shr-long/2addr v0, v4

    add-int/lit8 v5, p4, 0x1

    .line 52
    aget v6, p3, v5

    int-to-long v6, v6

    and-long/2addr v2, v6

    ushr-long/2addr p1, v4

    sub-long/2addr v2, p1

    add-long/2addr v0, v2

    long-to-int p1, v0

    .line 53
    aput p1, p3, v5

    shr-long p1, v0, v4

    const-wide/16 v0, 0x0

    cmp-long p1, p1, v0

    if-nez p1, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    add-int/lit8 p4, p4, 0x2

    .line 54
    invoke-static {p0, p3, p4}, Lorg/spongycastle/math/raw/Nat;->decAt(I[II)I

    move-result p0

    return p0
.end method

.method public static subDWordAt(IJ[III)I
    .locals 8

    .line 1
    add-int v0, p4, p5

    .line 2
    .line 3
    aget v1, p3, v0

    .line 4
    .line 5
    int-to-long v1, v1

    .line 6
    const-wide v3, 0xffffffffL

    .line 7
    .line 8
    .line 9
    .line 10
    .line 11
    and-long/2addr v1, v3

    .line 12
    and-long v5, p1, v3

    .line 13
    .line 14
    sub-long/2addr v1, v5

    .line 15
    long-to-int v5, v1

    .line 16
    aput v5, p3, v0

    .line 17
    .line 18
    const/16 v5, 0x20

    .line 19
    .line 20
    shr-long/2addr v1, v5

    .line 21
    add-int/lit8 v0, v0, 0x1

    .line 22
    .line 23
    aget v6, p3, v0

    .line 24
    .line 25
    int-to-long v6, v6

    .line 26
    and-long/2addr v3, v6

    .line 27
    ushr-long/2addr p1, v5

    .line 28
    sub-long/2addr v3, p1

    .line 29
    add-long/2addr v1, v3

    .line 30
    long-to-int p1, v1

    .line 31
    aput p1, p3, v0

    .line 32
    .line 33
    shr-long p1, v1, v5

    .line 34
    .line 35
    const-wide/16 v0, 0x0

    .line 36
    .line 37
    cmp-long p1, p1, v0

    .line 38
    .line 39
    if-nez p1, :cond_0

    .line 40
    .line 41
    const/4 p0, 0x0

    .line 42
    return p0

    .line 43
    :cond_0
    add-int/lit8 p5, p5, 0x2

    .line 44
    .line 45
    invoke-static {p0, p3, p4, p5}, Lorg/spongycastle/math/raw/Nat;->decAt(I[III)I

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    return p0
.end method

.method public static subDWordFrom(IJ[I)I
    .locals 9

    const/4 v0, 0x0

    .line 47
    aget v1, p3, v0

    int-to-long v1, v1

    const-wide v3, 0xffffffffL

    and-long/2addr v1, v3

    and-long v5, p1, v3

    sub-long/2addr v1, v5

    long-to-int v5, v1

    .line 48
    aput v5, p3, v0

    const/16 v5, 0x20

    shr-long/2addr v1, v5

    const/4 v6, 0x1

    .line 49
    aget v7, p3, v6

    int-to-long v7, v7

    and-long/2addr v3, v7

    ushr-long/2addr p1, v5

    sub-long/2addr v3, p1

    add-long/2addr v1, v3

    long-to-int p1, v1

    .line 50
    aput p1, p3, v6

    shr-long p1, v1, v5

    const-wide/16 v1, 0x0

    cmp-long p1, p1, v1

    if-nez p1, :cond_0

    return v0

    :cond_0
    const/4 p1, 0x2

    .line 51
    invoke-static {p0, p3, p1}, Lorg/spongycastle/math/raw/Nat;->decAt(I[II)I

    move-result p0

    return p0
.end method

.method public static subDWordFrom(IJ[II)I
    .locals 8

    .line 1
    aget v0, p3, p4

    .line 2
    .line 3
    int-to-long v0, v0

    .line 4
    const-wide v2, 0xffffffffL

    .line 5
    .line 6
    .line 7
    .line 8
    .line 9
    and-long/2addr v0, v2

    .line 10
    and-long v4, p1, v2

    .line 11
    .line 12
    sub-long/2addr v0, v4

    .line 13
    long-to-int v4, v0

    .line 14
    aput v4, p3, p4

    .line 15
    .line 16
    const/16 v4, 0x20

    .line 17
    .line 18
    shr-long/2addr v0, v4

    .line 19
    add-int/lit8 v5, p4, 0x1

    .line 20
    .line 21
    aget v6, p3, v5

    .line 22
    .line 23
    int-to-long v6, v6

    .line 24
    and-long/2addr v2, v6

    .line 25
    ushr-long/2addr p1, v4

    .line 26
    sub-long/2addr v2, p1

    .line 27
    add-long/2addr v0, v2

    .line 28
    long-to-int p1, v0

    .line 29
    aput p1, p3, v5

    .line 30
    .line 31
    shr-long p1, v0, v4

    .line 32
    .line 33
    const-wide/16 v0, 0x0

    .line 34
    .line 35
    cmp-long p1, p1, v0

    .line 36
    .line 37
    if-nez p1, :cond_0

    .line 38
    .line 39
    const/4 p0, 0x0

    .line 40
    return p0

    .line 41
    :cond_0
    const/4 p1, 0x2

    .line 42
    invoke-static {p0, p3, p4, p1}, Lorg/spongycastle/math/raw/Nat;->decAt(I[III)I

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    return p0
.end method

.method public static subFrom(I[II[II)I
    .locals 10

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    const/4 v2, 0x0

    .line 4
    :goto_0
    if-ge v2, p0, :cond_0

    .line 5
    .line 6
    add-int v3, p4, v2

    .line 7
    .line 8
    aget v4, p3, v3

    .line 9
    .line 10
    int-to-long v4, v4

    .line 11
    const-wide v6, 0xffffffffL

    .line 12
    .line 13
    .line 14
    .line 15
    .line 16
    and-long/2addr v4, v6

    .line 17
    add-int v8, p2, v2

    .line 18
    .line 19
    aget v8, p1, v8

    .line 20
    .line 21
    int-to-long v8, v8

    .line 22
    and-long/2addr v6, v8

    .line 23
    sub-long/2addr v4, v6

    .line 24
    add-long/2addr v0, v4

    .line 25
    long-to-int v4, v0

    .line 26
    aput v4, p3, v3

    .line 27
    .line 28
    const/16 v3, 0x20

    .line 29
    .line 30
    shr-long/2addr v0, v3

    .line 31
    add-int/lit8 v2, v2, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    long-to-int p0, v0

    .line 35
    return p0
.end method

.method public static subFrom(I[I[I)I
    .locals 9

    const-wide/16 v0, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, p0, :cond_0

    .line 36
    aget v3, p2, v2

    int-to-long v3, v3

    const-wide v5, 0xffffffffL

    and-long/2addr v3, v5

    aget v7, p1, v2

    int-to-long v7, v7

    and-long/2addr v5, v7

    sub-long/2addr v3, v5

    add-long/2addr v0, v3

    long-to-int v3, v0

    .line 37
    aput v3, p2, v2

    const/16 v3, 0x20

    shr-long/2addr v0, v3

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    long-to-int p0, v0

    return p0
.end method

.method public static subWordAt(II[II)I
    .locals 6

    .line 37
    aget v0, p2, p3

    int-to-long v0, v0

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    int-to-long v4, p1

    and-long/2addr v2, v4

    sub-long/2addr v0, v2

    long-to-int p1, v0

    .line 38
    aput p1, p2, p3

    const/16 p1, 0x20

    shr-long/2addr v0, p1

    const-wide/16 v2, 0x0

    cmp-long p1, v0, v2

    if-nez p1, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    add-int/lit8 p3, p3, 0x1

    .line 39
    invoke-static {p0, p2, p3}, Lorg/spongycastle/math/raw/Nat;->decAt(I[II)I

    move-result p0

    return p0
.end method

.method public static subWordAt(II[III)I
    .locals 7

    .line 1
    add-int v0, p3, p4

    .line 2
    .line 3
    aget v1, p2, v0

    .line 4
    .line 5
    int-to-long v1, v1

    .line 6
    const-wide v3, 0xffffffffL

    .line 7
    .line 8
    .line 9
    .line 10
    .line 11
    and-long/2addr v1, v3

    .line 12
    int-to-long v5, p1

    .line 13
    and-long/2addr v3, v5

    .line 14
    sub-long/2addr v1, v3

    .line 15
    long-to-int p1, v1

    .line 16
    aput p1, p2, v0

    .line 17
    .line 18
    const/16 p1, 0x20

    .line 19
    .line 20
    shr-long v0, v1, p1

    .line 21
    .line 22
    const-wide/16 v2, 0x0

    .line 23
    .line 24
    cmp-long p1, v0, v2

    .line 25
    .line 26
    if-nez p1, :cond_0

    .line 27
    .line 28
    const/4 p0, 0x0

    .line 29
    return p0

    .line 30
    :cond_0
    add-int/lit8 p4, p4, 0x1

    .line 31
    .line 32
    invoke-static {p0, p2, p3, p4}, Lorg/spongycastle/math/raw/Nat;->decAt(I[III)I

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    return p0
.end method

.method public static subWordFrom(II[I)I
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    aget v1, p2, v0

    .line 3
    .line 4
    int-to-long v1, v1

    .line 5
    const-wide v3, 0xffffffffL

    .line 6
    .line 7
    .line 8
    .line 9
    .line 10
    and-long/2addr v1, v3

    .line 11
    int-to-long v5, p1

    .line 12
    and-long/2addr v3, v5

    .line 13
    sub-long/2addr v1, v3

    .line 14
    long-to-int p1, v1

    .line 15
    aput p1, p2, v0

    .line 16
    .line 17
    const/16 p1, 0x20

    .line 18
    .line 19
    shr-long/2addr v1, p1

    .line 20
    const-wide/16 v3, 0x0

    .line 21
    .line 22
    cmp-long p1, v1, v3

    .line 23
    .line 24
    if-nez p1, :cond_0

    .line 25
    .line 26
    return v0

    .line 27
    :cond_0
    const/4 p1, 0x1

    .line 28
    invoke-static {p0, p2, p1}, Lorg/spongycastle/math/raw/Nat;->decAt(I[II)I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    return p0
.end method

.method public static subWordFrom(II[II)I
    .locals 6

    .line 33
    aget v0, p2, p3

    int-to-long v0, v0

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    int-to-long v4, p1

    and-long/2addr v2, v4

    sub-long/2addr v0, v2

    long-to-int p1, v0

    .line 34
    aput p1, p2, p3

    const/16 p1, 0x20

    shr-long/2addr v0, p1

    const-wide/16 v2, 0x0

    cmp-long p1, v0, v2

    if-nez p1, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    const/4 p1, 0x1

    .line 35
    invoke-static {p0, p2, p3, p1}, Lorg/spongycastle/math/raw/Nat;->decAt(I[III)I

    move-result p0

    return p0
.end method

.method public static toBigInteger(I[I)Ljava/math/BigInteger;
    .locals 4

    .line 1
    shl-int/lit8 v0, p0, 0x2

    .line 2
    .line 3
    new-array v0, v0, [B

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    :goto_0
    if-ge v1, p0, :cond_1

    .line 7
    .line 8
    aget v2, p1, v1

    .line 9
    .line 10
    if-eqz v2, :cond_0

    .line 11
    .line 12
    add-int/lit8 v3, p0, -0x1

    .line 13
    .line 14
    sub-int/2addr v3, v1

    .line 15
    shl-int/lit8 v3, v3, 0x2

    .line 16
    .line 17
    invoke-static {v2, v0, v3}, Lorg/spongycastle/util/Pack;->intToBigEndian(I[BI)V

    .line 18
    .line 19
    .line 20
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    new-instance p0, Ljava/math/BigInteger;

    .line 24
    .line 25
    const/4 p1, 0x1

    .line 26
    invoke-direct {p0, p1, v0}, Ljava/math/BigInteger;-><init>(I[B)V

    .line 27
    .line 28
    .line 29
    return-object p0
.end method

.method public static zero(I[I)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    if-ge v1, p0, :cond_0

    .line 4
    .line 5
    aput v0, p1, v1

    .line 6
    .line 7
    add-int/lit8 v1, v1, 0x1

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    return-void
.end method
