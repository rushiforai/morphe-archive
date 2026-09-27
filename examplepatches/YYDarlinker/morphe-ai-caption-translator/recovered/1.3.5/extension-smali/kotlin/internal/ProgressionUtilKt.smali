.class public final Lkotlin/internal/ProgressionUtilKt;
.super Ljava/lang/Object;
.source "progressionUtil.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001c\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0010\t\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u001a\u001a\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00012\u0006\u0010\u0003\u001a\u00020\u0001H\u0082\u0080\u0004\u001a\u001a\u0010\u0000\u001a\u00020\u00042\u0006\u0010\u0002\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0004H\u0082\u0080\u0004\u001a\"\u0010\u0005\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00012\u0006\u0010\u0003\u001a\u00020\u00012\u0006\u0010\u0006\u001a\u00020\u0001H\u0082\u0080\u0004\u001a\"\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0002\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0006\u001a\u00020\u0004H\u0082\u0080\u0004\u001a*\u0010\u0007\u001a\u00020\u00012\u0006\u0010\u0008\u001a\u00020\u00012\u0006\u0010\t\u001a\u00020\u00012\u0006\u0010\n\u001a\u00020\u0001H\u0081\u0080\u0004b\u0002\u0008\u000bb\u0002\u0008\u000c\u001a*\u0010\u0007\u001a\u00020\u00042\u0006\u0010\u0008\u001a\u00020\u00042\u0006\u0010\t\u001a\u00020\u00042\u0006\u0010\n\u001a\u00020\u0004H\u0081\u0080\u0004b\u0002\u0008\u000bb\u0002\u0008\u000c\u00a8\u0006\r"
    }
    d2 = {
        "mod",
        "",
        "a",
        "b",
        "",
        "differenceModulo",
        "c",
        "getProgressionLastElement",
        "start",
        "end",
        "step",
        "Lkotlin/PublishedApi;",
        "Lkotlin/internal/UsedFromCompilerGeneratedCode;",
        "kotlin-stdlib"
    }
    k = 0x2
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method private static final differenceModulo(III)I
    .registers 3

    .line 21
    invoke-static {p0, p2}, Lkotlin/internal/ProgressionUtilKt;->mod(II)I

    move-result p0

    invoke-static {p1, p2}, Lkotlin/internal/ProgressionUtilKt;->mod(II)I

    move-result p1

    sub-int/2addr p0, p1

    invoke-static {p0, p2}, Lkotlin/internal/ProgressionUtilKt;->mod(II)I

    move-result p0

    return p0
.end method

.method private static final differenceModulo(JJJ)J
    .registers 6

    .line 25
    invoke-static {p0, p1, p4, p5}, Lkotlin/internal/ProgressionUtilKt;->mod(JJ)J

    move-result-wide p0

    invoke-static {p2, p3, p4, p5}, Lkotlin/internal/ProgressionUtilKt;->mod(JJ)J

    move-result-wide p2

    sub-long/2addr p0, p2

    invoke-static {p0, p1, p4, p5}, Lkotlin/internal/ProgressionUtilKt;->mod(JJ)J

    move-result-wide p0

    return-wide p0
.end method

.method public static final getProgressionLastElement(III)I
    .registers 3

    if-lez p2, :cond_b

    if-lt p0, p1, :cond_5

    goto :goto_f

    .line 47
    :cond_5
    invoke-static {p1, p0, p2}, Lkotlin/internal/ProgressionUtilKt;->differenceModulo(III)I

    move-result p0

    sub-int/2addr p1, p0

    return p1

    :cond_b
    if-gez p2, :cond_17

    if-gt p0, p1, :cond_10

    :goto_f
    return p1

    :cond_10
    neg-int p2, p2

    .line 48
    invoke-static {p0, p1, p2}, Lkotlin/internal/ProgressionUtilKt;->differenceModulo(III)I

    move-result p0

    add-int/2addr p1, p0

    return p1

    .line 49
    :cond_17
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Step is zero."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static final getProgressionLastElement(JJJ)J
    .registers 10

    const-wide/16 v0, 0x0

    cmp-long v0, p4, v0

    if-lez v0, :cond_16

    cmp-long v0, p0, p2

    if-ltz v0, :cond_c

    move-wide p0, p2

    goto :goto_1f

    :cond_c
    move-wide v2, p2

    move-wide p2, p0

    move-wide p0, v2

    .line 71
    invoke-static/range {p0 .. p5}, Lkotlin/internal/ProgressionUtilKt;->differenceModulo(JJJ)J

    move-result-wide p2

    sub-long p2, p0, p2

    return-wide p2

    :cond_16
    move-wide v2, p2

    move-wide p2, p0

    move-wide p0, v2

    if-gez v0, :cond_2a

    cmp-long v0, p2, p0

    if-gtz v0, :cond_20

    :goto_1f
    return-wide p0

    :cond_20
    neg-long p4, p4

    move-wide v2, p2

    move-wide p2, p0

    move-wide p0, v2

    .line 72
    invoke-static/range {p0 .. p5}, Lkotlin/internal/ProgressionUtilKt;->differenceModulo(JJJ)J

    move-result-wide p0

    add-long/2addr p2, p0

    return-wide p2

    .line 73
    :cond_2a
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Step is zero."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static final mod(II)I
    .registers 2

    .line 10
    rem-int/2addr p0, p1

    if-ltz p0, :cond_4

    return p0

    :cond_4
    add-int/2addr p0, p1

    return p0
.end method

.method private static final mod(JJ)J
    .registers 6

    .line 15
    rem-long/2addr p0, p2

    const-wide/16 v0, 0x0

    cmp-long v0, p0, v0

    if-ltz v0, :cond_8

    return-wide p0

    :cond_8
    add-long/2addr p0, p2

    return-wide p0
.end method
