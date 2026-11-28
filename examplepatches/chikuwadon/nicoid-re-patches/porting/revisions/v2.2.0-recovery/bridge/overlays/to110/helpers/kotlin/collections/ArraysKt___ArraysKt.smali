.class abstract Lkotlin/collections/ArraysKt___ArraysKt;
.super Lkotlin/collections/ArraysKt___ArraysJvmKt;
.source "_Arrays.kt"


# direct methods
.method public static getOrNull([Ljava/lang/Object;I)Ljava/lang/Object;
    .registers 3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-ltz p1, :cond_0

    .line 1592
    array-length v0, p0

    if-ge p1, v0, :cond_0

    aget-object p0, p0, p1

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method
