.class abstract Lnicoid/network238/kotlin/collections/ArraysKt___ArraysJvmKt;
.super Lnicoid/network238/kotlin/collections/ArraysKt__ArraysKt;
.source "SourceFile"


# direct methods
.method public static asList([Ljava/lang/Object;)Ljava/util/List;
    .registers 1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 133
    invoke-static {p0}, Lnicoid/network238/kotlin/collections/ArraysUtilJVM;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object p0
.end method

.method public static copyInto([B[BIII)[B
    .registers 5

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sub-int/2addr p4, p3

    .line 946
    invoke-static {p0, p3, p1, p2, p4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object p1
.end method

.method public static copyInto([Ljava/lang/Object;[Ljava/lang/Object;III)[Ljava/lang/Object;
    .registers 5

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sub-int/2addr p4, p3

    .line 923
    invoke-static {p0, p3, p1, p2, p4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object p1
.end method

.method public static synthetic copyInto$default([B[BIIIILjava/lang/Object;)[B
    .registers 8

    and-int/lit8 p6, p5, 0x2

    const/4 v0, 0x0

    if-eqz p6, :cond_0

    move p2, v0

    :cond_0
    and-int/lit8 p6, p5, 0x4

    if-eqz p6, :cond_1

    move p3, v0

    :cond_1
    and-int/lit8 p5, p5, 0x8

    if-eqz p5, :cond_2

    .line 945
    array-length p4, p0

    .line 943
    :cond_2
    invoke-static {p0, p1, p2, p3, p4}, Lnicoid/network238/kotlin/collections/ArraysKt___ArraysJvmKt;->copyInto([B[BIII)[B

    move-result-object p0

    return-object p0
.end method

.method public static synthetic copyInto$default([Ljava/lang/Object;[Ljava/lang/Object;IIIILjava/lang/Object;)[Ljava/lang/Object;
    .registers 8

    and-int/lit8 p6, p5, 0x2

    const/4 v0, 0x0

    if-eqz p6, :cond_0

    move p2, v0

    :cond_0
    and-int/lit8 p6, p5, 0x4

    if-eqz p6, :cond_1

    move p3, v0

    :cond_1
    and-int/lit8 p5, p5, 0x8

    if-eqz p5, :cond_2

    .line 922
    array-length p4, p0

    .line 920
    :cond_2
    invoke-static {p0, p1, p2, p3, p4}, Lnicoid/network238/kotlin/collections/ArraysKt___ArraysJvmKt;->copyInto([Ljava/lang/Object;[Ljava/lang/Object;III)[Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static copyOfRange([BII)[B
    .registers 4

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1474
    array-length v0, p0

    invoke-static {p2, v0}, Lnicoid/network238/kotlin/collections/ArraysKt__ArraysJVMKt;->copyOfRangeToIndexCheck(II)V

    .line 1475
    invoke-static {p0, p1, p2}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object p0
.end method

.method public static copyOfRange([Ljava/lang/Object;II)[Ljava/lang/Object;
    .registers 4

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1466
    array-length v0, p0

    invoke-static {p2, v0}, Lnicoid/network238/kotlin/collections/ArraysKt__ArraysJVMKt;->copyOfRangeToIndexCheck(II)V

    .line 1467
    invoke-static {p0, p1, p2}, Ljava/util/Arrays;->copyOfRange([Ljava/lang/Object;II)[Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object p0
.end method

.method public static fill([BBII)V
    .registers 4

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1559
    invoke-static {p0, p2, p3, p1}, Ljava/util/Arrays;->fill([BIIB)V

    return-void
.end method

.method public static final fill([IIII)V
    .registers 4

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1587
    invoke-static {p0, p2, p3, p1}, Ljava/util/Arrays;->fill([IIII)V

    return-void
.end method

.method public static fill([Ljava/lang/Object;Ljava/lang/Object;II)V
    .registers 4

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1545
    invoke-static {p0, p2, p3, p1}, Ljava/util/Arrays;->fill([Ljava/lang/Object;IILjava/lang/Object;)V

    return-void
.end method

.method public static synthetic fill$default([IIIIILjava/lang/Object;)V
    .registers 6

    and-int/lit8 p5, p4, 0x2

    if-eqz p5, :cond_0

    const/4 p2, 0x0

    :cond_0
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_1

    .line 1586
    array-length p3, p0

    .line 1585
    :cond_1
    invoke-static {p0, p1, p2, p3}, Lnicoid/network238/kotlin/collections/ArraysKt___ArraysJvmKt;->fill([IIII)V

    return-void
.end method

.method public static synthetic fill$default([Ljava/lang/Object;Ljava/lang/Object;IIILjava/lang/Object;)V
    .registers 6

    and-int/lit8 p5, p4, 0x2

    if-eqz p5, :cond_0

    const/4 p2, 0x0

    :cond_0
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_1

    .line 1544
    array-length p3, p0

    .line 1543
    :cond_1
    invoke-static {p0, p1, p2, p3}, Lnicoid/network238/kotlin/collections/ArraysKt___ArraysJvmKt;->fill([Ljava/lang/Object;Ljava/lang/Object;II)V

    return-void
.end method

.method public static plus([Ljava/lang/Object;[Ljava/lang/Object;)[Ljava/lang/Object;
    .registers 5

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1844
    array-length v0, p0

    .line 1845
    array-length v1, p1

    add-int v2, v0, v1

    .line 1846
    invoke-static {p0, v2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p0

    .line 1847
    const/4 v2, 0x0

    invoke-static {p1, v2, p0, v0, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object p0
.end method

.method public static final sortWith([Ljava/lang/Object;Ljava/util/Comparator;)V
    .registers 4

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2188
    array-length v0, p0

    const/4 v1, 0x1

    if-le v0, v1, :cond_0

    invoke-static {p0, p1}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    :cond_0
    return-void
.end method
