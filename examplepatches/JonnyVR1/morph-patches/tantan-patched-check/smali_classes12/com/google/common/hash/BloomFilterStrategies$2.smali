.class final enum Lcom/google/common/hash/BloomFilterStrategies$2;
.super Lcom/google/common/hash/BloomFilterStrategies;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/hash/BloomFilterStrategies;
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
    invoke-direct {p0, p1, p2, v0}, Lcom/google/common/hash/BloomFilterStrategies;-><init>(Ljava/lang/String;ILcom/google/common/hash/BloomFilterStrategies$1;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private lowerEight([B)J
    .locals 8

    .line 1
    const/4 p0, 0x7

    .line 2
    aget-byte v0, p1, p0

    .line 3
    .line 4
    const/4 p0, 0x6

    .line 5
    aget-byte v1, p1, p0

    .line 6
    .line 7
    const/4 p0, 0x5

    .line 8
    aget-byte v2, p1, p0

    .line 9
    .line 10
    const/4 p0, 0x4

    .line 11
    aget-byte v3, p1, p0

    .line 12
    .line 13
    const/4 p0, 0x3

    .line 14
    aget-byte v4, p1, p0

    .line 15
    .line 16
    const/4 p0, 0x2

    .line 17
    aget-byte v5, p1, p0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    aget-byte v6, p1, p0

    .line 21
    .line 22
    const/4 p0, 0x0

    .line 23
    aget-byte v7, p1, p0

    .line 24
    .line 25
    invoke-static/range {v0 .. v7}, Lcom/google/common/primitives/Longs;->d(BBBBBBBB)J

    .line 26
    .line 27
    .line 28
    move-result-wide p0

    .line 29
    return-wide p0
.end method

.method private upperEight([B)J
    .locals 8

    .line 1
    const/16 p0, 0xf

    .line 2
    .line 3
    aget-byte v0, p1, p0

    .line 4
    .line 5
    const/16 p0, 0xe

    .line 6
    .line 7
    aget-byte v1, p1, p0

    .line 8
    .line 9
    const/16 p0, 0xd

    .line 10
    .line 11
    aget-byte v2, p1, p0

    .line 12
    .line 13
    const/16 p0, 0xc

    .line 14
    .line 15
    aget-byte v3, p1, p0

    .line 16
    .line 17
    const/16 p0, 0xb

    .line 18
    .line 19
    aget-byte v4, p1, p0

    .line 20
    .line 21
    const/16 p0, 0xa

    .line 22
    .line 23
    aget-byte v5, p1, p0

    .line 24
    .line 25
    const/16 p0, 0x9

    .line 26
    .line 27
    aget-byte v6, p1, p0

    .line 28
    .line 29
    const/16 p0, 0x8

    .line 30
    .line 31
    aget-byte v7, p1, p0

    .line 32
    .line 33
    invoke-static/range {v0 .. v7}, Lcom/google/common/primitives/Longs;->d(BBBBBBBB)J

    .line 34
    .line 35
    .line 36
    move-result-wide p0

    .line 37
    return-wide p0
.end method


# virtual methods
.method public mightContain(Ljava/lang/Object;Lcom/google/common/hash/Funnel;ILcom/google/common/hash/BloomFilterStrategies$a;)Z
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Lcom/google/common/hash/Funnel<",
            "-TT;>;I",
            "Lcom/google/common/hash/BloomFilterStrategies$a;",
            ")Z"
        }
    .end annotation

    .line 1
    invoke-virtual {p4}, Lcom/google/common/hash/BloomFilterStrategies$a;->b()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-static {}, Lcom/google/common/hash/Hashing;->a()Ll/syk;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-interface {v2, p1, p2}, Ll/syk;->hashObject(Ljava/lang/Object;Lcom/google/common/hash/Funnel;)Lcom/google/common/hash/HashCode;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1}, Lcom/google/common/hash/HashCode;->getBytesInternal()[B

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-direct {p0, p1}, Lcom/google/common/hash/BloomFilterStrategies$2;->lowerEight([B)J

    .line 18
    .line 19
    .line 20
    move-result-wide v2

    .line 21
    invoke-direct {p0, p1}, Lcom/google/common/hash/BloomFilterStrategies$2;->upperEight([B)J

    .line 22
    .line 23
    .line 24
    move-result-wide p0

    .line 25
    const/4 p2, 0x0

    .line 26
    move v4, p2

    .line 27
    :goto_0
    if-ge v4, p3, :cond_1

    .line 28
    .line 29
    const-wide v5, 0x7fffffffffffffffL

    .line 30
    .line 31
    .line 32
    .line 33
    .line 34
    and-long/2addr v5, v2

    .line 35
    rem-long/2addr v5, v0

    .line 36
    invoke-virtual {p4, v5, v6}, Lcom/google/common/hash/BloomFilterStrategies$a;->d(J)Z

    .line 37
    .line 38
    .line 39
    move-result v5

    .line 40
    if-nez v5, :cond_0

    .line 41
    .line 42
    return p2

    .line 43
    :cond_0
    add-long/2addr v2, p0

    .line 44
    add-int/lit8 v4, v4, 0x1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    const/4 p0, 0x1

    .line 48
    return p0
.end method

.method public put(Ljava/lang/Object;Lcom/google/common/hash/Funnel;ILcom/google/common/hash/BloomFilterStrategies$a;)Z
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Lcom/google/common/hash/Funnel<",
            "-TT;>;I",
            "Lcom/google/common/hash/BloomFilterStrategies$a;",
            ")Z"
        }
    .end annotation

    .line 1
    invoke-virtual {p4}, Lcom/google/common/hash/BloomFilterStrategies$a;->b()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-static {}, Lcom/google/common/hash/Hashing;->a()Ll/syk;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-interface {v2, p1, p2}, Ll/syk;->hashObject(Ljava/lang/Object;Lcom/google/common/hash/Funnel;)Lcom/google/common/hash/HashCode;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1}, Lcom/google/common/hash/HashCode;->getBytesInternal()[B

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-direct {p0, p1}, Lcom/google/common/hash/BloomFilterStrategies$2;->lowerEight([B)J

    .line 18
    .line 19
    .line 20
    move-result-wide v2

    .line 21
    invoke-direct {p0, p1}, Lcom/google/common/hash/BloomFilterStrategies$2;->upperEight([B)J

    .line 22
    .line 23
    .line 24
    move-result-wide p0

    .line 25
    const/4 p2, 0x0

    .line 26
    move-wide v3, v2

    .line 27
    move v2, p2

    .line 28
    :goto_0
    if-ge p2, p3, :cond_0

    .line 29
    .line 30
    const-wide v5, 0x7fffffffffffffffL

    .line 31
    .line 32
    .line 33
    .line 34
    .line 35
    and-long/2addr v5, v3

    .line 36
    rem-long/2addr v5, v0

    .line 37
    invoke-virtual {p4, v5, v6}, Lcom/google/common/hash/BloomFilterStrategies$a;->g(J)Z

    .line 38
    .line 39
    .line 40
    move-result v5

    .line 41
    or-int/2addr v2, v5

    .line 42
    add-long/2addr v3, p0

    .line 43
    add-int/lit8 p2, p2, 0x1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    return v2
.end method
