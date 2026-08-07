.class public Ltech/sud/base/utils/CrcChecker;
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

.method public static calcCrc32([B)J
    .locals 2

    .line 1
    new-instance v0, Ljava/util/zip/CRC32;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/zip/CRC32;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Ljava/util/zip/CRC32;->update([B)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/util/zip/CRC32;->getValue()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    return-wide v0
.end method

.method public static check([B)Z
    .locals 10

    .line 57
    array-length v0, p0

    const/4 v1, 0x0

    const/4 v2, 0x4

    if-ge v0, v2, :cond_0

    return v1

    .line 58
    :cond_0
    aget-byte v0, p0, v1

    int-to-long v3, v0

    const-wide/16 v5, 0xff

    and-long/2addr v3, v5

    const/16 v0, 0x18

    shl-long/2addr v3, v0

    const/4 v0, 0x1

    aget-byte v7, p0, v0

    int-to-long v7, v7

    and-long/2addr v7, v5

    const/16 v9, 0x10

    shl-long/2addr v7, v9

    or-long/2addr v3, v7

    const/4 v7, 0x2

    aget-byte v7, p0, v7

    int-to-long v7, v7

    and-long/2addr v7, v5

    const/16 v9, 0x8

    shl-long/2addr v7, v9

    or-long/2addr v3, v7

    const/4 v7, 0x3

    aget-byte v7, p0, v7

    int-to-long v7, v7

    and-long/2addr v5, v7

    or-long/2addr v3, v5

    .line 59
    array-length v5, p0

    sub-int/2addr v5, v2

    new-array v6, v5, [B

    .line 60
    invoke-static {p0, v2, v6, v1, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 61
    invoke-static {v6}, Ltech/sud/base/utils/CrcChecker;->calcCrc32([B)J

    move-result-wide v5

    cmp-long p0, v3, v5

    if-nez p0, :cond_1

    return v0

    :cond_1
    return v1
.end method

.method public static check([B[B)Z
    .locals 9

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_1

    .line 3
    .line 4
    array-length v1, p0

    .line 5
    const/4 v2, 0x4

    .line 6
    if-lt v1, v2, :cond_1

    .line 7
    .line 8
    if-eqz p1, :cond_1

    .line 9
    .line 10
    array-length v1, p1

    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    aget-byte v1, p0, v0

    .line 15
    .line 16
    int-to-long v1, v1

    .line 17
    const-wide/16 v3, 0xff

    .line 18
    .line 19
    and-long/2addr v1, v3

    .line 20
    const/16 v5, 0x18

    .line 21
    .line 22
    shl-long/2addr v1, v5

    .line 23
    const/4 v5, 0x1

    .line 24
    aget-byte v6, p0, v5

    .line 25
    .line 26
    int-to-long v6, v6

    .line 27
    and-long/2addr v6, v3

    .line 28
    const/16 v8, 0x10

    .line 29
    .line 30
    shl-long/2addr v6, v8

    .line 31
    or-long/2addr v1, v6

    .line 32
    const/4 v6, 0x2

    .line 33
    aget-byte v6, p0, v6

    .line 34
    .line 35
    int-to-long v6, v6

    .line 36
    and-long/2addr v6, v3

    .line 37
    const/16 v8, 0x8

    .line 38
    .line 39
    shl-long/2addr v6, v8

    .line 40
    or-long/2addr v1, v6

    .line 41
    const/4 v6, 0x3

    .line 42
    aget-byte p0, p0, v6

    .line 43
    .line 44
    int-to-long v6, p0

    .line 45
    and-long/2addr v3, v6

    .line 46
    or-long/2addr v1, v3

    .line 47
    invoke-static {p1}, Ltech/sud/base/utils/CrcChecker;->calcCrc32([B)J

    .line 48
    .line 49
    .line 50
    move-result-wide p0

    .line 51
    cmp-long p0, v1, p0

    .line 52
    .line 53
    if-nez p0, :cond_1

    .line 54
    .line 55
    return v5

    .line 56
    :cond_1
    :goto_0
    return v0
.end method
