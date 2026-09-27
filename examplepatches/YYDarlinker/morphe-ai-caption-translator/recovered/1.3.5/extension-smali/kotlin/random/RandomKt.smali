.class public final Lkotlin/random/RandomKt;
.super Ljava/lang/Object;
.source "Random.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nRandom.kt\nKotlin\n*S Kotlin\n*F\n+ 1 Random.kt\nkotlin/random/RandomKt\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,392:1\n1#2:393\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000B\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\t\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0006\n\u0000\n\u0002\u0010\u000e\n\u0002\u0010\u0000\n\u0000\u001a \u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u0003H\u0087\u0080\u0004b\u000c\u0008\u0004\u0012\u0008\u0008\u0005\u0012\u0004\u0008\u0008(\u0006\u001a \u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u0007H\u0087\u0080\u0004b\u000c\u0008\u0004\u0012\u0008\u0008\u0005\u0012\u0004\u0008\u0008(\u0006\u001a$\u0010\u0008\u001a\u00020\u0003*\u00020\u00012\u0006\u0010\t\u001a\u00020\nH\u0087\u0080\u0004b\u000c\u0008\u0004\u0012\u0008\u0008\u0005\u0012\u0004\u0008\u0008(\u0006\u001a$\u0010\u000b\u001a\u00020\u0007*\u00020\u00012\u0006\u0010\t\u001a\u00020\u000cH\u0087\u0080\u0004b\u000c\u0008\u0004\u0012\u0008\u0008\u0005\u0012\u0004\u0008\u0008(\u0006\u001a\u0012\u0010\r\u001a\u00020\u00032\u0006\u0010\u000e\u001a\u00020\u0003H\u0080\u0080\u0004\u001a\u0016\u0010\u000f\u001a\u00020\u0003*\u00020\u00032\u0006\u0010\u0010\u001a\u00020\u0003H\u0080\u0080\u0004\u001a\u001a\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u00032\u0006\u0010\u0014\u001a\u00020\u0003H\u0080\u0080\u0004\u001a\u001a\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u00072\u0006\u0010\u0014\u001a\u00020\u0007H\u0080\u0080\u0004\u001a\u001a\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u00152\u0006\u0010\u0014\u001a\u00020\u0015H\u0080\u0080\u0004\u001a\u001a\u0010\u0016\u001a\u00020\u00172\u0006\u0010\u0013\u001a\u00020\u00182\u0006\u0010\u0014\u001a\u00020\u0018H\u0080\u0080\u0004\u00a8\u0006\u0019"
    }
    d2 = {
        "Random",
        "Lkotlin/random/Random;",
        "seed",
        "",
        "Lkotlin/SinceKotlin;",
        "version",
        "1.3",
        "",
        "nextInt",
        "range",
        "Lkotlin/ranges/IntRange;",
        "nextLong",
        "Lkotlin/ranges/LongRange;",
        "fastLog2",
        "value",
        "takeUpperBits",
        "bitCount",
        "checkRangeBounds",
        "",
        "from",
        "until",
        "",
        "boundsErrorMessage",
        "",
        "",
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
.method public static final Random(I)Lkotlin/random/Random;
    .registers 3

    .line 327
    new-instance v0, Lkotlin/random/XorWowRandom;

    shr-int/lit8 v1, p0, 0x1f

    invoke-direct {v0, p0, v1}, Lkotlin/random/XorWowRandom;-><init>(II)V

    check-cast v0, Lkotlin/random/Random;

    return-object v0
.end method

.method public static final Random(J)Lkotlin/random/Random;
    .registers 5

    .line 342
    new-instance v0, Lkotlin/random/XorWowRandom;

    long-to-int v1, p0

    const/16 v2, 0x20

    shr-long/2addr p0, v2

    long-to-int p0, p0

    invoke-direct {v0, v1, p0}, Lkotlin/random/XorWowRandom;-><init>(II)V

    check-cast v0, Lkotlin/random/Random;

    return-object v0
.end method

.method public static final boundsErrorMessage(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;
    .registers 4

    const-string v0, "from"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "until"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 391
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Random range is empty: ["

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, ", "

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, ")."

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static final checkRangeBounds(DD)V
    .registers 5

    cmpl-double v0, p2, p0

    if-lez v0, :cond_5

    return-void

    .line 389
    :cond_5
    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/random/RandomKt;->boundsErrorMessage(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static final checkRangeBounds(II)V
    .registers 2

    if-le p1, p0, :cond_3

    return-void

    .line 387
    :cond_3
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/random/RandomKt;->boundsErrorMessage(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static final checkRangeBounds(JJ)V
    .registers 5

    cmp-long v0, p2, p0

    if-lez v0, :cond_5

    return-void

    .line 388
    :cond_5
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/random/RandomKt;->boundsErrorMessage(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static final fastLog2(I)I
    .registers 1

    .line 381
    invoke-static {p0}, Ljava/lang/Integer;->numberOfLeadingZeros(I)I

    move-result p0

    rsub-int/lit8 p0, p0, 0x1f

    return p0
.end method

.method public static final nextInt(Lkotlin/random/Random;Lkotlin/ranges/IntRange;)I
    .registers 4

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "range"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 355
    invoke-virtual {p1}, Lkotlin/ranges/IntRange;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_46

    .line 356
    invoke-virtual {p1}, Lkotlin/ranges/IntRange;->getLast()I

    move-result v0

    const v1, 0x7fffffff

    if-ge v0, v1, :cond_28

    invoke-virtual {p1}, Lkotlin/ranges/IntRange;->getFirst()I

    move-result v0

    invoke-virtual {p1}, Lkotlin/ranges/IntRange;->getLast()I

    move-result p1

    add-int/lit8 p1, p1, 0x1

    invoke-virtual {p0, v0, p1}, Lkotlin/random/Random;->nextInt(II)I

    move-result p0

    return p0

    .line 357
    :cond_28
    invoke-virtual {p1}, Lkotlin/ranges/IntRange;->getFirst()I

    move-result v0

    const/high16 v1, -0x80000000

    if-le v0, v1, :cond_41

    invoke-virtual {p1}, Lkotlin/ranges/IntRange;->getFirst()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p1}, Lkotlin/ranges/IntRange;->getLast()I

    move-result p1

    invoke-virtual {p0, v0, p1}, Lkotlin/random/Random;->nextInt(II)I

    move-result p0

    add-int/lit8 p0, p0, 0x1

    return p0

    .line 358
    :cond_41
    invoke-virtual {p0}, Lkotlin/random/Random;->nextInt()I

    move-result p0

    return p0

    .line 355
    :cond_46
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Cannot get random in empty range: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static final nextLong(Lkotlin/random/Random;Lkotlin/ranges/LongRange;)J
    .registers 9

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "range"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 371
    invoke-virtual {p1}, Lkotlin/ranges/LongRange;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_4b

    .line 372
    invoke-virtual {p1}, Lkotlin/ranges/LongRange;->getLast()J

    move-result-wide v0

    const-wide v2, 0x7fffffffffffffffL

    cmp-long v0, v0, v2

    const-wide/16 v1, 0x1

    if-gez v0, :cond_2d

    invoke-virtual {p1}, Lkotlin/ranges/LongRange;->getFirst()J

    move-result-wide v3

    invoke-virtual {p1}, Lkotlin/ranges/LongRange;->getLast()J

    move-result-wide v5

    add-long/2addr v5, v1

    invoke-virtual {p0, v3, v4, v5, v6}, Lkotlin/random/Random;->nextLong(JJ)J

    move-result-wide p0

    return-wide p0

    .line 373
    :cond_2d
    invoke-virtual {p1}, Lkotlin/ranges/LongRange;->getFirst()J

    move-result-wide v3

    const-wide/high16 v5, -0x8000000000000000L

    cmp-long v0, v3, v5

    if-lez v0, :cond_46

    invoke-virtual {p1}, Lkotlin/ranges/LongRange;->getFirst()J

    move-result-wide v3

    sub-long/2addr v3, v1

    invoke-virtual {p1}, Lkotlin/ranges/LongRange;->getLast()J

    move-result-wide v5

    invoke-virtual {p0, v3, v4, v5, v6}, Lkotlin/random/Random;->nextLong(JJ)J

    move-result-wide p0

    add-long/2addr p0, v1

    return-wide p0

    .line 374
    :cond_46
    invoke-virtual {p0}, Lkotlin/random/Random;->nextLong()J

    move-result-wide p0

    return-wide p0

    .line 371
    :cond_4b
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Cannot get random in empty range: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static final takeUpperBits(II)I
    .registers 3

    rsub-int/lit8 v0, p1, 0x20

    ushr-int/2addr p0, v0

    neg-int p1, p1

    shr-int/lit8 p1, p1, 0x1f

    and-int/2addr p0, p1

    return p0
.end method
