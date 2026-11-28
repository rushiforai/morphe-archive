.class public abstract Lnicoid/network238/kotlin/internal/ProgressionUtilKt;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method private static final differenceModulo(III)I
    .registers 3

    .line 21
    invoke-static {p0, p2}, Lnicoid/network238/kotlin/internal/ProgressionUtilKt;->mod(II)I

    move-result p0

    invoke-static {p1, p2}, Lnicoid/network238/kotlin/internal/ProgressionUtilKt;->mod(II)I

    move-result p1

    sub-int/2addr p0, p1

    invoke-static {p0, p2}, Lnicoid/network238/kotlin/internal/ProgressionUtilKt;->mod(II)I

    move-result p0

    return p0
.end method

.method private static final differenceModulo(JJJ)J
    .registers 6

    .line 25
    invoke-static {p0, p1, p4, p5}, Lnicoid/network238/kotlin/internal/ProgressionUtilKt;->mod(JJ)J

    move-result-wide p0

    invoke-static {p2, p3, p4, p5}, Lnicoid/network238/kotlin/internal/ProgressionUtilKt;->mod(JJ)J

    move-result-wide p2

    sub-long/2addr p0, p2

    invoke-static {p0, p1, p4, p5}, Lnicoid/network238/kotlin/internal/ProgressionUtilKt;->mod(JJ)J

    move-result-wide p0

    return-wide p0
.end method

.method public static final getProgressionLastElement(III)I
    .registers 3

    if-lez p2, :cond_0

    if-ge p0, p1, :cond_1

    .line 46
    invoke-static {p1, p0, p2}, Lnicoid/network238/kotlin/internal/ProgressionUtilKt;->differenceModulo(III)I

    move-result p0

    sub-int/2addr p1, p0

    return p1

    :cond_0
    if-gez p2, :cond_3

    if-gt p0, p1, :cond_2

    :cond_1
    return p1

    :cond_2
    neg-int p2, p2

    .line 47
    invoke-static {p0, p1, p2}, Lnicoid/network238/kotlin/internal/ProgressionUtilKt;->differenceModulo(III)I

    move-result p0

    add-int/2addr p1, p0

    return p1

    .line 48
    :cond_3
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Step is zero."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static final getProgressionLastElement(JJJ)J
    .registers 10

    const-wide/16 v0, 0x0

    cmp-long v0, p4, v0

    if-lez v0, :cond_1

    cmp-long v0, p0, p2

    if-ltz v0, :cond_0

    move-wide p0, p2

    goto :goto_0

    .line 69
    :cond_0
    move-wide v2, p2

    move-wide p2, p0

    move-wide p0, v2

    invoke-static/range {p0 .. p5}, Lnicoid/network238/kotlin/internal/ProgressionUtilKt;->differenceModulo(JJJ)J

    move-result-wide p2

    sub-long p2, p0, p2

    return-wide p2

    :cond_1
    move-wide v2, p2

    move-wide p2, p0

    move-wide p0, v2

    if-gez v0, :cond_3

    cmp-long v0, p2, p0

    if-gtz v0, :cond_2

    :goto_0
    return-wide p0

    :cond_2
    neg-long p4, p4

    .line 70
    move-wide v2, p2

    move-wide p2, p0

    move-wide p0, v2

    invoke-static/range {p0 .. p5}, Lnicoid/network238/kotlin/internal/ProgressionUtilKt;->differenceModulo(JJJ)J

    move-result-wide p0

    add-long/2addr p2, p0

    return-wide p2

    .line 71
    :cond_3
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Step is zero."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static final mod(II)I
    .registers 2

    .line 10
    rem-int/2addr p0, p1

    if-ltz p0, :cond_0

    return p0

    :cond_0
    add-int/2addr p0, p1

    return p0
.end method

.method private static final mod(JJ)J
    .registers 6

    .line 15
    rem-long/2addr p0, p2

    const-wide/16 v0, 0x0

    cmp-long v0, p0, v0

    if-ltz v0, :cond_0

    return-wide p0

    :cond_0
    add-long/2addr p0, p2

    return-wide p0
.end method
