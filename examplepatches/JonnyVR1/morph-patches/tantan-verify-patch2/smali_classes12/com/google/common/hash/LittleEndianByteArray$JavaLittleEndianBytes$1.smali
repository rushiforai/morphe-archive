.class final enum Lcom/google/common/hash/LittleEndianByteArray$JavaLittleEndianBytes$1;
.super Lcom/google/common/hash/LittleEndianByteArray$JavaLittleEndianBytes;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/hash/LittleEndianByteArray$JavaLittleEndianBytes;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4011
    name = null
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;I)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lcom/google/common/hash/LittleEndianByteArray$JavaLittleEndianBytes;-><init>(Ljava/lang/String;ILl/iqr;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method


# virtual methods
.method public getLongLittleEndian([BI)J
    .locals 8

    .line 1
    add-int/lit8 p0, p2, 0x7

    .line 2
    .line 3
    aget-byte v0, p1, p0

    .line 4
    .line 5
    add-int/lit8 p0, p2, 0x6

    .line 6
    .line 7
    aget-byte v1, p1, p0

    .line 8
    .line 9
    add-int/lit8 p0, p2, 0x5

    .line 10
    .line 11
    aget-byte v2, p1, p0

    .line 12
    .line 13
    add-int/lit8 p0, p2, 0x4

    .line 14
    .line 15
    aget-byte v3, p1, p0

    .line 16
    .line 17
    add-int/lit8 p0, p2, 0x3

    .line 18
    .line 19
    aget-byte v4, p1, p0

    .line 20
    .line 21
    add-int/lit8 p0, p2, 0x2

    .line 22
    .line 23
    aget-byte v5, p1, p0

    .line 24
    .line 25
    add-int/lit8 p0, p2, 0x1

    .line 26
    .line 27
    aget-byte v6, p1, p0

    .line 28
    .line 29
    aget-byte v7, p1, p2

    .line 30
    .line 31
    invoke-static/range {v0 .. v7}, Lcom/google/common/primitives/Longs;->d(BBBBBBBB)J

    .line 32
    .line 33
    .line 34
    move-result-wide p0

    .line 35
    return-wide p0
.end method

.method public putLongLittleEndian([BIJ)V
    .locals 7

    .line 1
    const-wide/16 v0, 0xff

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    :goto_0
    const/16 v2, 0x8

    .line 5
    .line 6
    if-ge p0, v2, :cond_0

    .line 7
    .line 8
    add-int v3, p2, p0

    .line 9
    .line 10
    and-long v4, p3, v0

    .line 11
    .line 12
    mul-int/lit8 v6, p0, 0x8

    .line 13
    .line 14
    shr-long/2addr v4, v6

    .line 15
    long-to-int v4, v4

    .line 16
    int-to-byte v4, v4

    .line 17
    aput-byte v4, p1, v3

    .line 18
    .line 19
    shl-long/2addr v0, v2

    .line 20
    add-int/lit8 p0, p0, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return-void
.end method
