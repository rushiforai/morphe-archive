.class final enum Lcom/google/common/hash/BloomFilterStrategies$1;
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


# virtual methods
.method public mightContain(Ljava/lang/Object;Lcom/google/common/hash/Funnel;ILcom/google/common/hash/BloomFilterStrategies$a;)Z
    .locals 5
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
    move-result-object p0

    .line 9
    invoke-interface {p0, p1, p2}, Ll/syk;->hashObject(Ljava/lang/Object;Lcom/google/common/hash/Funnel;)Lcom/google/common/hash/HashCode;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Lcom/google/common/hash/HashCode;->asLong()J

    .line 14
    .line 15
    .line 16
    move-result-wide p0

    .line 17
    long-to-int p2, p0

    .line 18
    const/16 v2, 0x20

    .line 19
    .line 20
    ushr-long/2addr p0, v2

    .line 21
    long-to-int p0, p0

    .line 22
    const/4 p1, 0x1

    .line 23
    move v2, p1

    .line 24
    :goto_0
    if-gt v2, p3, :cond_2

    .line 25
    .line 26
    mul-int v3, v2, p0

    .line 27
    .line 28
    add-int/2addr v3, p2

    .line 29
    if-gez v3, :cond_0

    .line 30
    .line 31
    not-int v3, v3

    .line 32
    :cond_0
    int-to-long v3, v3

    .line 33
    rem-long/2addr v3, v0

    .line 34
    invoke-virtual {p4, v3, v4}, Lcom/google/common/hash/BloomFilterStrategies$a;->d(J)Z

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    if-nez v3, :cond_1

    .line 39
    .line 40
    const/4 p0, 0x0

    .line 41
    return p0

    .line 42
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_2
    return p1
.end method

.method public put(Ljava/lang/Object;Lcom/google/common/hash/Funnel;ILcom/google/common/hash/BloomFilterStrategies$a;)Z
    .locals 5
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
    move-result-object p0

    .line 9
    invoke-interface {p0, p1, p2}, Ll/syk;->hashObject(Ljava/lang/Object;Lcom/google/common/hash/Funnel;)Lcom/google/common/hash/HashCode;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Lcom/google/common/hash/HashCode;->asLong()J

    .line 14
    .line 15
    .line 16
    move-result-wide p0

    .line 17
    long-to-int p2, p0

    .line 18
    const/16 v2, 0x20

    .line 19
    .line 20
    ushr-long/2addr p0, v2

    .line 21
    long-to-int p0, p0

    .line 22
    const/4 p1, 0x0

    .line 23
    const/4 v2, 0x1

    .line 24
    :goto_0
    if-gt v2, p3, :cond_1

    .line 25
    .line 26
    mul-int v3, v2, p0

    .line 27
    .line 28
    add-int/2addr v3, p2

    .line 29
    if-gez v3, :cond_0

    .line 30
    .line 31
    not-int v3, v3

    .line 32
    :cond_0
    int-to-long v3, v3

    .line 33
    rem-long/2addr v3, v0

    .line 34
    invoke-virtual {p4, v3, v4}, Lcom/google/common/hash/BloomFilterStrategies$a;->g(J)Z

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    or-int/2addr p1, v3

    .line 39
    add-int/lit8 v2, v2, 0x1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    return p1
.end method
