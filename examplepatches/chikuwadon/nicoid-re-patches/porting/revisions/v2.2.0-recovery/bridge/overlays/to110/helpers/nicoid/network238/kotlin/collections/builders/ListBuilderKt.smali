.class public abstract Lnicoid/network238/kotlin/collections/builders/ListBuilderKt;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static final synthetic access$subarrayContentEquals([Ljava/lang/Object;IILjava/util/List;)Z
    .registers 4

    .line 1
    invoke-static {p0, p1, p2, p3}, Lnicoid/network238/kotlin/collections/builders/ListBuilderKt;->subarrayContentEquals([Ljava/lang/Object;IILjava/util/List;)Z

    move-result p0

    return p0
.end method

.method public static final synthetic access$subarrayContentHashCode([Ljava/lang/Object;II)I
    .registers 3

    .line 1
    invoke-static {p0, p1, p2}, Lnicoid/network238/kotlin/collections/builders/ListBuilderKt;->subarrayContentHashCode([Ljava/lang/Object;II)I

    move-result p0

    return p0
.end method

.method public static final synthetic access$subarrayContentToString([Ljava/lang/Object;IILjava/util/Collection;)Ljava/lang/String;
    .registers 4

    .line 1
    invoke-static {p0, p1, p2, p3}, Lnicoid/network238/kotlin/collections/builders/ListBuilderKt;->subarrayContentToString([Ljava/lang/Object;IILjava/util/Collection;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static final arrayOfUninitializedElements(I)[Ljava/lang/Object;
    .registers 2

    if-ltz p0, :cond_0

    .line 618
    new-array p0, p0, [Ljava/lang/Object;

    return-object p0

    .line 616
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "capacity must be non-negative."

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static final copyOfUninitializedElements([Ljava/lang/Object;I)[Ljava/lang/Object;
    .registers 2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 662
    invoke-static {p0, p1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static final resetAt([Ljava/lang/Object;I)V
    .registers 3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 667
    const/4 v0, 0x0

    aput-object v0, p0, p1

    return-void
.end method

.method public static final resetRange([Ljava/lang/Object;II)V
    .registers 3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :goto_0
    if-ge p1, p2, :cond_0

    .line 671
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/collections/builders/ListBuilderKt;->resetAt([Ljava/lang/Object;I)V

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private static final subarrayContentEquals([Ljava/lang/Object;IILjava/util/List;)Z
    .registers 8

    .line 651
    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x0

    if-ne p2, v0, :cond_0

    move v0, v1

    :goto_0
    if-ge v0, p2, :cond_2

    add-int v2, p1, v0

    .line 654
    aget-object v2, p0, v2

    invoke-interface {p3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v2, v3}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    :cond_0
    return v1

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    const/4 p0, 0x1

    return p0
.end method

.method private static final subarrayContentHashCode([Ljava/lang/Object;II)I
    .registers 7

    const/4 v0, 0x1

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, p2, :cond_1

    add-int v3, p1, v2

    .line 643
    aget-object v3, p0, v3

    mul-int/lit8 v0, v0, 0x1f

    if-eqz v3, :cond_0

    .line 644
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    goto :goto_1

    :cond_0
    move v3, v1

    :goto_1
    add-int/2addr v0, v3

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return v0
.end method

.method private static final subarrayContentToString([Ljava/lang/Object;IILjava/util/Collection;)Ljava/lang/String;
    .registers 7

    .line 622
    new-instance v0, Ljava/lang/StringBuilder;

    mul-int/lit8 v1, p2, 0x3

    add-int/lit8 v1, v1, 0x2

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 623
    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v1, 0x0

    :goto_0
    if-ge v1, p2, :cond_2

    if-lez v1, :cond_0

    .line 626
    const-string v2, ", "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    add-int v2, p1, v1

    .line 627
    aget-object v2, p0, v2

    if-ne v2, p3, :cond_1

    .line 629
    const-string v2, "(this Collection)"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 631
    :cond_1
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 635
    :cond_2
    const-string p0, "]"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 636
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
