.class abstract Lnicoid/network238/kotlin/ranges/RangesKt___RangesKt;
.super Lnicoid/network238/kotlin/ranges/RangesKt__RangesKt;
.source "SourceFile"


# direct methods
.method public static coerceAtLeast(II)I
    .registers 2

    if-ge p0, p1, :cond_0

    return p1

    :cond_0
    return p0
.end method

.method public static coerceAtLeast(Ljava/lang/Comparable;Ljava/lang/Comparable;)Ljava/lang/Comparable;
    .registers 3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1246
    invoke-interface {p0, p1}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v0

    if-gez v0, :cond_0

    return-object p1

    :cond_0
    return-object p0
.end method

.method public static coerceAtMost(II)I
    .registers 2

    if-le p0, p1, :cond_0

    return p1

    :cond_0
    return p0
.end method

.method public static coerceAtMost(JJ)J
    .registers 5

    cmp-long v0, p0, p2

    if-lez v0, :cond_0

    return-wide p2

    :cond_0
    return-wide p0
.end method

.method public static coerceIn(III)I
    .registers 5

    if-gt p1, p2, :cond_2

    if-ge p0, p1, :cond_0

    return p1

    :cond_0
    if-le p0, p2, :cond_1

    return p2

    :cond_1
    return p0

    .line 1448
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Cannot coerce value to an empty range: maximum "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, " is less than minimum "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const/16 p2, 0x2e

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static coerceIn(JJJ)J
    .registers 7

    cmp-long v0, p2, p4

    if-gtz v0, :cond_2

    cmp-long v0, p0, p2

    if-gez v0, :cond_0

    return-wide p2

    :cond_0
    cmp-long p2, p0, p4

    if-lez p2, :cond_1

    return-wide p4

    :cond_1
    return-wide p0

    .line 1462
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "Cannot coerce value to an empty range: maximum "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p4, p5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p4, " is less than minimum "

    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    const/16 p2, 0x2e

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static coerceIn(JLnicoid/network238/kotlin/ranges/ClosedRange;)J
    .registers 5

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1564
    invoke-interface {p2}, Lnicoid/network238/kotlin/ranges/ClosedRange;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    .line 1566
    invoke-interface {p2}, Lnicoid/network238/kotlin/ranges/ClosedRange;->getStart()Ljava/lang/Comparable;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    cmp-long v0, p0, v0

    if-gez v0, :cond_0

    invoke-interface {p2}, Lnicoid/network238/kotlin/ranges/ClosedRange;->getStart()Ljava/lang/Comparable;

    move-result-object p0

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->longValue()J

    move-result-wide p0

    return-wide p0

    .line 1567
    :cond_0
    invoke-interface {p2}, Lnicoid/network238/kotlin/ranges/ClosedRange;->getEndInclusive()Ljava/lang/Comparable;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    cmp-long v0, p0, v0

    if-lez v0, :cond_1

    invoke-interface {p2}, Lnicoid/network238/kotlin/ranges/ClosedRange;->getEndInclusive()Ljava/lang/Comparable;

    move-result-object p0

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->longValue()J

    move-result-wide p0

    :cond_1
    return-wide p0

    .line 1564
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "Cannot coerce value to an empty range: "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    const/16 p2, 0x2e

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static coerceIn(Ljava/lang/Comparable;Ljava/lang/Comparable;Ljava/lang/Comparable;)Ljava/lang/Comparable;
    .registers 5

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eqz p1, :cond_3

    if-eqz p2, :cond_2

    .line 1401
    invoke-interface {p1, p2}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v0

    if-gtz v0, :cond_1

    .line 1402
    invoke-interface {p0, p1}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v0

    if-gez v0, :cond_0

    goto :goto_0

    .line 1403
    :cond_0
    invoke-interface {p0, p2}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result p1

    if-lez p1, :cond_4

    goto :goto_1

    .line 1401
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Cannot coerce value to an empty range: maximum "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, " is less than minimum "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    const/16 p2, 0x2e

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 1406
    :cond_2
    invoke-interface {p0, p1}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v0

    if-gez v0, :cond_3

    :goto_0
    return-object p1

    :cond_3
    if-eqz p2, :cond_4

    .line 1407
    invoke-interface {p0, p2}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result p1

    if-lez p1, :cond_4

    :goto_1
    return-object p2

    :cond_4
    return-object p0
.end method

.method public static downTo(II)Lnicoid/network238/kotlin/ranges/IntProgression;
    .registers 4

    .line 835
    sget-object v0, Lnicoid/network238/kotlin/ranges/IntProgression;->Companion:Lnicoid/network238/kotlin/ranges/IntProgression$Companion;

    const/4 v1, -0x1

    invoke-virtual {v0, p0, p1, v1}, Lnicoid/network238/kotlin/ranges/IntProgression$Companion;->fromClosedRange(III)Lnicoid/network238/kotlin/ranges/IntProgression;

    move-result-object p0

    return-object p0
.end method

.method public static step(Lnicoid/network238/kotlin/ranges/IntProgression;I)Lnicoid/network238/kotlin/ranges/IntProgression;
    .registers 5

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-lez p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 997
    :goto_0
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/ranges/RangesKt__RangesKt;->checkStepIsPositive(ZLjava/lang/Number;)V

    .line 998
    sget-object v0, Lnicoid/network238/kotlin/ranges/IntProgression;->Companion:Lnicoid/network238/kotlin/ranges/IntProgression$Companion;

    invoke-virtual {p0}, Lnicoid/network238/kotlin/ranges/IntProgression;->getFirst()I

    move-result v1

    invoke-virtual {p0}, Lnicoid/network238/kotlin/ranges/IntProgression;->getLast()I

    move-result v2

    invoke-virtual {p0}, Lnicoid/network238/kotlin/ranges/IntProgression;->getStep()I

    move-result p0

    if-gtz p0, :cond_1

    neg-int p1, p1

    :cond_1
    invoke-virtual {v0, v1, v2, p1}, Lnicoid/network238/kotlin/ranges/IntProgression$Companion;->fromClosedRange(III)Lnicoid/network238/kotlin/ranges/IntProgression;

    move-result-object p0

    return-object p0
.end method

.method public static step(Lnicoid/network238/kotlin/ranges/LongProgression;J)Lnicoid/network238/kotlin/ranges/LongProgression;
    .registers 14

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-lez v2, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    .line 1007
    :goto_0
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-static {v2, v3}, Lnicoid/network238/kotlin/ranges/RangesKt__RangesKt;->checkStepIsPositive(ZLjava/lang/Number;)V

    .line 1008
    sget-object v4, Lnicoid/network238/kotlin/ranges/LongProgression;->Companion:Lnicoid/network238/kotlin/ranges/LongProgression$Companion;

    invoke-virtual {p0}, Lnicoid/network238/kotlin/ranges/LongProgression;->getFirst()J

    move-result-wide v5

    invoke-virtual {p0}, Lnicoid/network238/kotlin/ranges/LongProgression;->getLast()J

    move-result-wide v7

    invoke-virtual {p0}, Lnicoid/network238/kotlin/ranges/LongProgression;->getStep()J

    move-result-wide v2

    cmp-long p0, v2, v0

    if-gtz p0, :cond_1

    neg-long p1, p1

    :cond_1
    move-wide v9, p1

    invoke-virtual/range {v4 .. v10}, Lnicoid/network238/kotlin/ranges/LongProgression$Companion;->fromClosedRange(JJJ)Lnicoid/network238/kotlin/ranges/LongProgression;

    move-result-object p0

    return-object p0
.end method

.method public static until(II)Lnicoid/network238/kotlin/ranges/IntRange;
    .registers 3

    const/high16 v0, -0x80000000

    if-gt p1, v0, :cond_0

    .line 1129
    sget-object p0, Lnicoid/network238/kotlin/ranges/IntRange;->Companion:Lnicoid/network238/kotlin/ranges/IntRange$Companion;

    invoke-virtual {p0}, Lnicoid/network238/kotlin/ranges/IntRange$Companion;->getEMPTY()Lnicoid/network238/kotlin/ranges/IntRange;

    move-result-object p0

    return-object p0

    .line 1130
    :cond_0
    new-instance v0, Lnicoid/network238/kotlin/ranges/IntRange;

    add-int/lit8 p1, p1, -0x1

    invoke-direct {v0, p0, p1}, Lnicoid/network238/kotlin/ranges/IntRange;-><init>(II)V

    return-object v0
.end method

.method public static until(IJ)Lnicoid/network238/kotlin/ranges/LongRange;
    .registers 8

    const-wide/high16 v0, -0x8000000000000000L

    cmp-long v0, p1, v0

    if-gtz v0, :cond_0

    .line 1168
    sget-object p0, Lnicoid/network238/kotlin/ranges/LongRange;->Companion:Lnicoid/network238/kotlin/ranges/LongRange$Companion;

    invoke-virtual {p0}, Lnicoid/network238/kotlin/ranges/LongRange$Companion;->getEMPTY()Lnicoid/network238/kotlin/ranges/LongRange;

    move-result-object p0

    return-object p0

    .line 1169
    :cond_0
    new-instance v0, Lnicoid/network238/kotlin/ranges/LongRange;

    int-to-long v1, p0

    const-wide/16 v3, 0x1

    sub-long/2addr p1, v3

    invoke-direct {v0, v1, v2, p1, p2}, Lnicoid/network238/kotlin/ranges/LongRange;-><init>(JJ)V

    return-object v0
.end method
